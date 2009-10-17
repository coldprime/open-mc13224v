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
usage: loaduart.py [-h|--help] [-v] [-c numport] [-b baudrate] file1 file2 ...
       -h --help: print this help
       -v: verbose option
       -c numport: com port number (default is COM1)
       -b baudrate: baudrate (default is 115200)
       file1 file2 ... : list of files to load (first is expected to be from BOOTLOADER flow)
    """

def main():
    # parse the command line
    try:
        opts, args = getopt.getopt(sys.argv[1:], "hvc:b:", ["help", ])
    except getopt.GetoptError:
        # print help information and exit:
        usage()
        sys.exit(2)

    # by default verbose mode is off
    verbose = False
    comport = 0
    baudrate = 115200
    for o, a in opts:
        if o in ["--help", "-h"]:
            usage()
            exit(0)
        if o == "-v":
            verbose = True
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
            
    if len(args) == 0:
        usage()
        raise common.legalexception.LegalException("No file to load", 0)

        
    try:
        # create a serial port instance:
        #   -> COM, N, 8, 1, XX BPS, 1 second timeout, disable RTS/CTS
        ser = serial.Serial(comport-1, baudrate, timeout=1, rtscts=0)
    except:
        raise common.legalexception.LegalException("Failed to open COM"+str(comport), 0)
    

    # force the RTS line to detect the UART boot type in the ROM flow
    ser.setRTS(True)
    print("Please reset the board to detect COM port RTS line...")

    try:
        connected = False
        while (not connected):
            # send the zero byte for autoconfiguration
            ser.write("\x00")
            # wait for a response
            response = ser.read(7)
            print(str(len(response)) + response)
            if response == "CONNECT":
                connected = True

        # by default, load the next file without acknowledge
        indication = "x"
        # loop on all the files
        for f in args:
            # open and read the image file file
            fid = open(f, "rb")
            data = fid.read()
            fid.close()
            print("Processing file: %s(%d)"%(f, len(data)))
    
            # write the entire content of the file to the UART
            ser.write(struct.pack("<L", len(data)))
            
            # if this is the first file, load quickly otherwise wait for confirmation
            if indication == "x":
                ser.write(data)
            else:
                for c in data:
                    # write chars one by one
                    ser.write(c)
                    # wait for the acknowledgment
                    ack = ser.read(1)
                    if c!= ack:
                        print("ERROR: Character sent and acknowledged differ")

            # loop as long as the user wants
            indication = "x"
            while (indication != "n"):
                # read the maximum amount of characters
                response = ser.read(10000)
                # check if there was a timeout
                if response == "":
                    print("Timeout")
                else:
                    print(response)

                # wait for an indication from user
                indication = raw_input("press 'n' for next download -->")

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