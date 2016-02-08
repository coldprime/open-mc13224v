
```
nvmErr_t NVM_GetBaseAddr(nvmInterface_t nvmInterface, uint32_t *pBaseAddr)
{
0x000070c4:      31 b5  push    {r0, r4, r5, lr}
0x000070c6:      04 00  lsls    r4, r0, #0
0x000070c8:      0d 00  lsls    r5, r1, #0
    // call the ROM patch function
    RP_Vector0(0x24);    
0x000070ca:      80 b4  push    {r7}
0x000070cc:      18 27  movs    r7, #24
0x000070ce:      f8 f3 a7 ff    bl      0x400020 <__iar_section$$root>
0x000070d2:      80 bc  pop     {r7}
    if (nvmInterface == 0)
    {
0x000070d4:      00 2c  cmp     r4, #0
0x000070d6:      05 d1  bne.n   0x70e4
        *pBaseAddr = 0x8000c000;
        return 0;
0x000070d8:      05 48  ldr     r0, [pc, #20]   ; (0x70f0)
0x000070da:      28 60  str     r0, [r5, #0]
0x000070dc:      00 20  movs    r0, #0
0x000070de:      38 bc  pop     {r3, r4, r5}
0x000070e0:      02 bc  pop     {r1}
0x000070e2:      08 47  bx      r1
    } 
    else if (nvmInterface == 1)
    {
0x000070e4:      01 2c  cmp     r4, #1
0x000070e6:      01 d1  bne.n   0x70ec
        *pBaseAddr = 0x80002000;
        return 0;
    }
0x000070e8:      02 48  ldr     r0, [pc, #8]    ; (0x70f4)
0x000070ea:      f6 e7  b.n     0x70da
    }
    else
    {
        return 1;
0x000070ec:      01 20  movs    r0, #1
0x000070ee:      f6 e7  b.n     0x70de
    }
0x000070f0:      00 c0  stmia   r0!, {}
0x000070f2:      00 80  strh    r0, [r0, #0]
0x000070f4:      00 20  movs    r0, #0
0x000070f6:      00 80  strh    r0, [r0, #0]

```