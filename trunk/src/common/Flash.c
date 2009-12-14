/*
 * Internal Flash related API
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

#include "reg_crm.h"

void
FlashStartReg(void)
{
    // turn NVM regulator OFF
    crm_vreg_1p8v_en_setf(0);

    // clear the BUCK_EN and enable the BUCK bypass
    crm_buck_en_setf(0);
    crm_buck_bypass_en_setf(1);

    // turn NVM regulator ON
    crm_vreg_1p8v_en_setf(1);

    // wait until 1.8V is ready
    while (crm_vreg_1p8v_rdy_getf() == 0) ;
}


void
FlashStopReg(void)
{
    // turn NVM regulator OFF
    crm_vreg_1p8v_en_setf(0);
}
