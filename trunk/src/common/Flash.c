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

void
FlashStartReg(void)
{
  volatile unsigned long counter;

//  VregCntl &= (~BUCK_EN);
//  VregCntl |= BUCK_BYPASS_EN;

  counter = 18200;
  while(counter--);

//  VregCntl |= VREG_1P8V_EN;
  counter = 5200;
  while(counter--);
}


