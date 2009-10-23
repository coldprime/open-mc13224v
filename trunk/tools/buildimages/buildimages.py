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
    buildimages.py [-v|--verbose] [-h|--help] [-o radix] elffile

       -h
       --help: self explanatory
       -v
       --verbose: self explanatory
       -o radix: radix of the output images name, defaults to 'image',
                 generating image_ram.bin and image_flash.bin
                 if radix is foo -> generate foo_ram.bin and foo_flash.bin
       elffile : ELF object file containing the loadable to generate images for
"""

def usage():
    print usage_doc

def main():
    # default verbose mode
    verbose = False
    # default radix
    radix = "image"

    # parse the command line
    try:
        opts, args = getopt.getopt(sys.argv[1:], "vho:", ["help", "verbose"])
    except getopt.GetoptError:
        print("Unsupported option")
        # print help information and exit:
        usage()
        sys.exit(-1)

    for o, a in opts:
        if o == "--help" or o == "-h":
            usage()
            sys.exit(-1)
        if o == "-o":
            radix = a
        if o == "-v" or o == "--verbose":
            verbose = True

    # sanity check
    if len(args) != 1:
        print("ELF object file not provided (%s)"%(args,))
        sys.exit(-1)

    # get the elf file name
    elffile = args[0]
    
    try:
        # read the content of the entire elf file
        fid = open(elffile, 'rb')
        content = fid.read()
        fid.close()
    except:
        print("Can't read ELF object file (%s)"%(elffile,))
        sys.exit(-1)

    if verbose:
        print("ELF File header:\n"+common.bytes.dump(content[0:64]))
    
    # check that the first bytes are the elf magic number
    assert(content[0:4] == "\x7FELF")
    # check that it is an ELF32 format
    assert(content[4] == "\x01")
    # check that it is an executable image
    assert(struct.unpack("H", content[16:18])[0] == 2)
    
    # retrieve the program entry
    entry = struct.unpack("L", content[24:28])[0]
    
    if verbose:
        # print the program entry
        print("ELF File defined entry = 0x%08X"%(entry, ))
    
    # get the program header related variables
    phoff = struct.unpack("L", content[28:32])[0]
    phentsize = struct.unpack("H", content[42:44])[0]
    phnum = struct.unpack("H", content[44:46])[0]
    if verbose:
        print("Program Header list description:\n    First header offset=%d, Header size=%d, Headers number=%d"%(phoff, phentsize, phnum))
        
    if phnum == 0:
        print("ELF object file does not contain any program header")
        sys.exit(-1)
    
    # initialize the current segment address
    curraddr = 0x400000
    code = ""
    
    # loop on all the program headers
    for i in range(phnum):
        # extract the program header
        ph = content[phoff+(i*phentsize):phoff+((i+1)*phentsize)]
        if verbose:
            print("\n\nProgram header %d:\n"%(i, )+common.bytes.dump(ph))
            
        # unpack header
        (type, offset, vaddr, paddr, filesz, memsz) = struct.unpack("LLLLLL", ph[:24])
        # check if this is a loadable segment
        if type == 1:
            if verbose:
                print("    -> Last segment end=0x%08X, Segment: Start=0x%08X, File Size=0x%X, MemSize=0x%X)"
                      %(curraddr, vaddr, filesz, memsz))
            # sanity check
            assert(vaddr >= curraddr)
            assert(memsz >= filesz)
            
            # generate the binary code from the segment:
            #    + pad with 0's until segment start
            code += "\0"*(vaddr-curraddr)
            #    + extract the binary from the ELF file content
            code += content[offset:offset+filesz]
            #    + pad with 0's after the binary
            code += "\0"*(memsz-filesz)
            # update last segment end
            curraddr = vaddr + memsz
        else:
            if verbose:
                print("  -> not loadable program")

    
    # generate the flash file
    fid = open(radix+"_flash.bin", 'wb')
    fid.write("OKOK"+struct.pack("L", len(code))+code)
    fid.close()
    print("... generated '%s': %d bytes"%(fid.name, len(code)))

    # generate the RAM file
    fid = open(radix+"_ram.bin", 'wb')
    fid.write(code)
    fid.close()
    print("... generated '%s': %d bytes"%(fid.name, len(code)))

# main execution
if __name__ == '__main__':
    main()
