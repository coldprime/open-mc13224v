/*
 * Flasher application: receive a binary through the UART and save it into the NVM.
 *
 *    Copyright (C) 2009 Louis Caron
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "Flash.h"
#include "Uart1.h"
#include "NVM.h"

#include "reg_gpio.h"
#include "reg_crm.h"

/**
 * Set the basic configuration for the whole platform.  This cand depend on the
 * application.
 */
static void
InitPlatform(void)
{
    // set:
    //   - the clock frequency for the whole platform to 24MHz (divider = 0)
    //   - JTAG security enforced off
    //   - SPIF uses 1.8
    //   - power source is VBATT
    crm_sys_cntl_pack(0, 0, 1, 1, 0, 0);

    // GPIOS
    // configure the GPIOs 25-23 as output (KBI3-KBI1), connect to LED control
    gpio_pad_dir0_set(7 << 23);

    // configure the GPIO15-14 to UART1 (UART1 TX and RX)
    gpio_func_sel0_set((0x01 << (14*2)) | (0x01 << (15*2)));

    // clear the LEDs
    gpio_data0_set(0);
}

void Main(void)
{
    nvmType_t type=0;
    nvmErr_t err;
    uint32_t len, addr;
    char c;

    // initialize the whole platform
    InitPlatform();

    // initialize the UART1
    Uart1Init();

    // start the NVM regulators
    FlashStartReg();

    // detect the NVM type
    err = NVM_Detect(gNvmInternalInterface_c, &type);
    Uart1PutS("NVM detect returned: 0x");
    Uart1PutU8(err);
    Uart1PutS(", type: 0x");
    Uart1PutU8(type);
    Uart1PutS("\n");

    // erase the flash portion that is not reserved
    err = NVM_Erase(gNvmInternalInterface_c, type, 0x7FFFFFFF);
    Uart1PutS("NVM erase returned: 0x");
    Uart1PutU8(err);
    Uart1PutS("\n");

    // flush the reception queue
    Uart1FlushRx();

    // send ready command
    Uart1PutS("ready...\n");

    // wait for the reception of the size of the package to copy into flash
    len = Uart1GetC();
    len += Uart1GetC() << 8;
    len += Uart1GetC() << 16;
    len += Uart1GetC() << 24;

    // receive all the chars from the UART
    addr = 0;
    while (addr < len)
    {
        // receive a char from the UART
        c = Uart1GetC();
        // write the char to the FLASH
        err = NVM_Write(gNvmInternalInterface_c, type, &c, addr, 1);
        if (err)
        {
            break;
        }
        // send back the written char for acknowledgment
        Uart1PutC(c);
        // increment the address of the next char
        addr++;
    }

    Uart1PutS("Programming done, len = 0x");
    Uart1PutU32(len);

    // wait forever
    while (1);
}
