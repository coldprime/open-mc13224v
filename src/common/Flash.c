/*
 * Flash.c
 *
 *  Created on: Oct 15, 2009
 *      Author: lcaron
 */
#include "Flash.h"

#include <stdint.h>

#include "Crm.h"


void
FlashStartReg(void)
{
  volatile uint32_t counter;

  VregCntl &= (~BUCK_EN);
  VregCntl |= BUCK_BYPASS_EN;

  counter = 18200;
  while(counter--);

  VregCntl |= VREG_1P8V_EN;
  counter = 5200;
  while(counter--);
}

