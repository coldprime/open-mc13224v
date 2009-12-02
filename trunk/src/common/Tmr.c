/*
 * Single timer API
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

// minimum include
#include "Tmr.h"

// defines for the timer block
#define REG_TMR_BASE_ADDR (0x80007000)

#define TMR0_COMP1_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x00))
#define TMR1_COMP1_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x20))
#define TMR2_COMP1_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x40))
#define TMR3_COMP1_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x60))
#define TMR0_COMP2_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x02))
#define TMR1_COMP2_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x22))
#define TMR2_COMP2_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x42))
#define TMR3_COMP2_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x62))
#define TMR0_CAPT_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x04))
#define TMR1_CAPT_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x24))
#define TMR2_CAPT_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x44))
#define TMR3_CAPT_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x64))
#define TMR0_LOAD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x06))
#define TMR1_LOAD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x26))
#define TMR2_LOAD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x46))
#define TMR3_LOAD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x66))
#define TMR0_HOLD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x08))
#define TMR1_HOLD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x28))
#define TMR2_HOLD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x48))
#define TMR3_HOLD_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x68))
#define TMR0_CNTR_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x0A))
#define TMR1_CNTR_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x2A))
#define TMR2_CNTR_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x4A))
#define TMR3_CNTR_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x6A))
#define TMR0_CTRL_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x0C))
#define TMR1_CTRL_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x2C))
#define TMR2_CTRL_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x4C))
#define TMR3_CTRL_REG    (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x6C))
#define TMR0_SCTRL_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x0E))
#define TMR1_SCTRL_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x2E))
#define TMR2_SCTRL_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x4E))
#define TMR3_SCTRL_REG   (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x6E))
#define TMR0_CMPLD1_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x10))
#define TMR1_CMPLD1_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x30))
#define TMR2_CMPLD1_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x50))
#define TMR3_CMPLD1_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x70))
#define TMR0_CMPLD2_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x12))
#define TMR1_CMPLD2_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x32))
#define TMR2_CMPLD2_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x52))
#define TMR3_CMPLD2_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x72))
#define TMR0_CSCTRL_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x14))
#define TMR1_CSCTRL_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x34))
#define TMR2_CSCTRL_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x54))
#define TMR3_CSCTRL_REG  (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x74))

#define TMR_ENBL_REG     (*(volatile uint16_t *)(REG_TMR_BASE_ADDR + 0x1E))

void
TmrInit(void)
{
    // disable timers 0 and 1
//    TMR_ENBL_REG &= 0xC;

    // configure timer 0:
    //    - do not start
    //    - primary source = counter1 output
    //    - count only once and stop
    //    - count up
    //    - no co_init and no OFLAG
    TMR0_CTRL_REG = (0<<13)|(0xC<<9)|(1<<6)|(1<<5)|(0<<4)|(0<<3)|(0);
    //    - enable interrupt upon successful compare
    TMR0_SCTRL_REG = (1 << 14);
    TMR0_COMP1_REG = 0x1000;
    TMR0_CNTR_REG = 0;

    // start the timer
    TMR0_CTRL_REG |= (1 << 13);
}

void
TmrFiq(void)
{
    Uart1PutS("TMR FIQ: SCTRL = 0x");
    Uart1PutU16(TMR0_SCTRL_REG);
    Uart1PutS(", CSCTRL = 0x");
    Uart1PutU16(TMR0_CSCTRL_REG);
    Uart1PutS("\n");
    TMR0_SCTRL_REG &= ~(1 << 15);
}
