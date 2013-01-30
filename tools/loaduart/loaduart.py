# Tool to load a file through the UART on the MC13224V
#
#    Copyright (C) 2009 Louis Caron
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

import sys
import getopt
import serial
import struct

import common.legalexception

def usage():
    print """
usage: loaduart.py [-h|--help] [-v] [-c numport] [-b baudrate] [-n] file1 file2 ...
       -h --help: print this help
       -v: verbose option
       -c numport: com port number (default is COM1)
       -b baudrate: baudrate (default is 115200)
       -n: do not wait for the CONNECT keyword
       file1 file2 ... : list of files to load (first is expected to be from BOOTLOADER flow)
    """

def main():
    # parse the command line
    try:
        opts, args = getopt.getopt(sys.argv[1:], "hvnpc:b:", ["help", ])
    except getopt.GetoptError:
        # print help information and exit:
        usage()
        sys.exit(2)

    # by default verbose mode is off
    verbose = False
    comport = 0
    baudrate = 115200
    connected = False
    for o, a in opts:
        if o in ["--help", "-h"]:
            usage()
            exit(0)
        if o == "-v":
            verbose = True
        if o == "-n":
            connected = True
        if o == "-c":
            try:
                comport = int(a, 0)
            except:
                raise common.legalexception.LegalException("Impossible to parse COM port number", 0)
            if comport == 0:
                raise common.legalexception.LegalException("Unsupported COM"+str(comport), 0)
        if o == "-b":
            try:
                baudrate = int(a, 0)
            except:
                raise common.legalexception.LegalException("Impossible to parse baudrate", 0)

    try:
        # create a serial port instance:
        #   -> COM, N, 8, 1, XX BPS, 1 second timeout, disable RTS/CTS
        ser = serial.Serial(comport-1, baudrate, timeout=0.05, rtscts=0)
    except:
        raise common.legalexception.LegalException("Failed to open COM"+str(comport), 0)


    if not connected:
        # force the RTS line to detect the UART boot type in the ROM flow
        ser.setRTS(True)
        print("Please reset the board to detect COM port RTS line...")

    try:
        while (not connected):
            # send the zero byte for autoconfiguration
            ser.write("\x00")
            # wait for a response
            response = ser.read(7)
            print(str(len(response)) + response)
            if response == "CONNECT":
                connected = True

        # by default, load the next file without acknowledgment
        indication = "x"
        # loop on all the files
        for f in args:
            # open and read the image file file
            fid = open(f, "rb")
            data = fid.read()
            fid.close()
            print("Processing file: %s(%d)"%(f, len(data)))

            # write the length of the file to the UART
            ser.write(struct.pack("<L", len(data)))

            # if this is the first file, load quickly otherwise wait for confirmation
            if indication == "x":
                ser.write(data)
            else:
                counter = 0
                while data != "":
                    if len(data) > 32:
                        sent = data[0:32]
                        data = data[32:]
                    else:
                        sent = data
                        data = ""
                    # send a bunch of chars
                    ser.write(sent)
                    # wait for the acknowledgment
                    ack = ser.read(len(sent))
                    if sent != ack:
                        print("ERROR: Character sent and acknowledged differ")
                        sys.exit(-1)
                    # increment the number of chars sent
                    counter+=len(sent)
                    sys.stdout.write(". "*((counter+len(sent))/100 - (counter/100)))

            # if this is the last file of the list, just leave 
            if f == args[-1]:
                break
            indication = "x"
            while (indication != "n"):
                # read the maximum amount of characters
                response = ser.read(400)
                sys.stdout.write(response)

                # wait for an indication from user
                indication = raw_input("press 'n' for next download -->")

        while (True):
            # read the maximum amount of characters
            response = ser.read(10000)
            sys.stdout.write(response)

    except KeyboardInterrupt:
        ser.close()
        raise common.legalexception.LegalException("Pressed CTRL-C", 0)

if __name__ == '__main__':
    try:
        main()
    except common.legalexception.LegalException, e:
        print str(e)
    except SystemExit:
        pass