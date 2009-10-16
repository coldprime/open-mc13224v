/*
 * Flash.c
 *
 *  Created on: Oct 15, 2009
 *      Author: lcaron
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


