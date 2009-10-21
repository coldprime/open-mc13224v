/*
 * Dump Flash application: dump the NVM content
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
 * Set the basic configuration for the whole platform.  This can vary with the
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
    uint32_t addr, data;

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

    // magical function call
//    NVM_SetSVar(0);

    // print the flash content
    for (addr = 0x0000; addr < 0x400; addr+=4)
    {
        NVM_Read(gNvmInternalInterface_c, type, &data, addr, 4);
        Uart1PutU32(data);
        Uart1PutS("\n");
    }

    while (1) ;
}
