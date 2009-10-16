########################################################################################
# Build a flash
# 
# Copyright (C) Wipro-Newlogic 2002-2009
#
########################################################################################

import sys
import getopt
import struct
import common.bytes

usage_doc ="""
Synopsis:
    buildimages.py [--help] [-o radix] elffile

       --help: self explanatory
       -o radix: radix of the output images name, defaults to _ram.bin and _flash.bin
          if radix = foo -> foo_ram.bin and foo_flash.bin
       elffile : ELF object file containing the loadable to generate images for
"""

def usage():
    print usage_doc

def main():

    # radix not specified
    radix = ""

    # parse the command line
    try:
        opts, args = getopt.getopt(sys.argv[1:], "o:", ["help", ])
    except getopt.GetoptError:
        # print help information and exit:
        usage()
        sys.exit(-1)

    for o, a in opts:
        if o == "--help":
            usage()
            sys.exit(-1)
        if o == "-o":
            radix = a

    # sanity check
    if len(args) != 1:
        print("Number of parameters not supported (%s)"%(args,))
        sys.exit(-1)

    # get the elf file name
    elffile = args[0]
    
    # read the content of the entire elf file
    fid = open(elffile, 'rb')
    content = fid.read()
    fid.close()

    # print the file content
    print("elf header:\n"+common.bytes.dump(content[0:64]))
    
    # check that the first bytes are the elf magic number
    assert(content[0:4] == "\x7FELF")
    # check that it is an ELF32 format
    assert(content[4] == "\x01")
    # check that it is an executable image
    assert(struct.unpack("H", content[16:18])[0] == 2)
    
    # retrieve the program entry
    entry = struct.unpack("L", content[24:28])[0]
    
    # print the program entry
    print("entry = 0x%08X"%(entry, ))
    
    # get the program header related variables
    phoff = struct.unpack("L", content[28:32])[0]
    phentsize = struct.unpack("H", content[42:44])[0]
    phnum = struct.unpack("H", content[44:46])[0]
    print("PH(%d, %d, %d)"%(phoff, phentsize, phnum))
    assert(phnum != 0)
    
    # initialize the current segment address
    curraddr = 0x400000
    code = ""
    
    # loop on all the program headers
    for i in range(phnum):
        # extract the program header
        ph = content[phoff+(i*phentsize):phoff+((i+1)*phentsize)]
        print("program header:\n"+common.bytes.dump(ph))
        (type, offset, vaddr, paddr, filesz, memsz) = struct.unpack("LLLLLL", ph[:24])
        # check if this is a loadable segment
        if type == 1:
            print("  -> current = 0x%08X, code = (0x%08X, 0x%X, 0x%X)"%(curraddr, vaddr, filesz, memsz))
            assert(vaddr >= curraddr)
            assert(memsz >= filesz)
            code += "\0"*(vaddr-curraddr)
            code += content[offset:offset+filesz]
            code += "\0"*(memsz-filesz)
            curraddr += memsz

    # generate the flash file
    fid = open(radix+"_flash.bin", 'wb')
    fid.write("OKOK"+struct.pack("L", len(code))+code)
    fid.close()

    # generate the RAM file
    fid = open(radix+"_ram.bin", 'wb')
    fid.write(code)
    fid.close()

# main execution
if __name__ == '__main__':
    main()
