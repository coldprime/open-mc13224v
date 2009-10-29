
Weather Station Controller.out:     file format elf32-littlearm


Disassembly of section P1:

00400000 <_start_vector_>:
  400000:	ea000c82 	b	403210 <__start_>
  400004:	ea000ca3 	b	403298 <__UndefInstructionHndlr_>
  400008:	ea000caa 	b	4032b8 <__SupervisorHndlr_>
  40000c:	ea000cb1 	b	4032d8 <__PrefetchAbtHndlr_>
  400010:	ea000cb8 	b	4032f8 <__DataAbtHndlr_>
  400014:	ea000c9e 	b	403294 <__reserved_>
  400018:	eaf041fc 	b	10810 <IrqHandler>
  40001c:	eaf041ff 	b	10820 <FiqHandler>

Disassembly of section P4:

00400020 <RP_Vector_Thumb_0>:
  400020:	4770      	bx	lr

Disassembly of section P5:

00400060 <RP_Vector_Thumb_1>:
  400060:	2f79      	cmp	r7, #121
  400062:	d000      	beq.n	400066 <RP_Vector_Thumb_1+0x6>
  400064:	4770      	bx	lr
  400066:	4f01      	ldr	r7, [pc, #4]	(40006c <RP_Vector_Thumb_1+0xc>)
  400068:	4738      	bx	r7
  40006a:	0000      	lsls	r0, r0, #0
  40006c:	004039d5 	ldrdeq	r3, [r0], #-149

Disassembly of section P6:

004000a0 <RP_Vector_Thumb_2>:
  4000a0:	4770      	bx	lr

Disassembly of section P7:

004000e0 <RP_Vector_Thumb_3>:
  4000e0:	4770      	bx	lr

Disassembly of section P2:

00400900 <?Veneer (3) for __aeabi_idiv>:
  400900:	b408      	push	{r3}
  400902:	4b02      	ldr	r3, [pc, #8]	(40090c <?Veneer (3) for __aeabi_idiv+0xc>)
  400904:	469c      	mov	ip, r3
  400906:	bc08      	pop	{r3}
  400908:	4760      	bx	ip
  40090a:	46c0      	nop			(mov r8, r8)
  40090c:	0000fae8 	.word	0x0000fae8

00400910 <?Veneer (3) for IntRestoreIRQ>:
  400910:	b408      	push	{r3}
  400912:	4b02      	ldr	r3, [pc, #8]	(40091c <?Veneer (3) for IntRestoreIRQ+0xc>)
  400914:	469c      	mov	ip, r3
  400916:	bc08      	pop	{r3}
  400918:	4760      	bx	ip
  40091a:	46c0      	nop			(mov r8, r8)
  40091c:	00010798 	.word	0x00010798

00400920 <?Veneer (3) for IntDisableIRQ>:
  400920:	b408      	push	{r3}
  400922:	4b02      	ldr	r3, [pc, #8]	(40092c <?Veneer (3) for IntDisableIRQ+0xc>)
  400924:	469c      	mov	ip, r3
  400926:	bc08      	pop	{r3}
  400928:	4760      	bx	ip
  40092a:	46c0      	nop			(mov r8, r8)
  40092c:	000107c8 	.word	0x000107c8

00400930 <?Veneer (3) for IntDisableFIQ>:
  400930:	b408      	push	{r3}
  400932:	4b02      	ldr	r3, [pc, #8]	(40093c <?Veneer (3) for IntDisableFIQ+0xc>)
  400934:	469c      	mov	ip, r3
  400936:	bc08      	pop	{r3}
  400938:	4760      	bx	ip
  40093a:	46c0      	nop			(mov r8, r8)
  40093c:	000107e0 	.word	0x000107e0

00400940 <?Veneer (3) for IntRestoreFIQ>:
  400940:	b408      	push	{r3}
  400942:	4b02      	ldr	r3, [pc, #8]	(40094c <?Veneer (3) for IntRestoreFIQ+0xc>)
  400944:	469c      	mov	ip, r3
  400946:	bc08      	pop	{r3}
  400948:	4760      	bx	ip
  40094a:	46c0      	nop			(mov r8, r8)
  40094c:	00010780 	.word	0x00010780

00400950 <?Veneer (3) for __aeabi_uidiv>:
  400950:	b408      	push	{r3}
  400952:	4b02      	ldr	r3, [pc, #8]	(40095c <?Veneer (3) for __aeabi_uidiv+0xc>)
  400954:	469c      	mov	ip, r3
  400956:	bc08      	pop	{r3}
  400958:	4760      	bx	ip
  40095a:	46c0      	nop			(mov r8, r8)
  40095c:	0000faf8 	.word	0x0000faf8

00400960 <Main>:
  400960:	b500      	push	{lr}
  400962:	b099      	sub	sp, #100
  400964:	48c8      	ldr	r0, [pc, #800]	(400c88 <??DataTable6>)
  400966:	a913      	add	r1, sp, #76
  400968:	6141      	str	r1, [r0, #20]
  40096a:	2100      	movs	r1, #0
  40096c:	61c1      	str	r1, [r0, #28]
  40096e:	aa02      	add	r2, sp, #8
  400970:	6042      	str	r2, [r0, #4]
  400972:	4a05      	ldr	r2, [pc, #20]	(400988 <??Main_0>)
  400974:	60c2      	str	r2, [r0, #12]
  400976:	48c3      	ldr	r0, [pc, #780]	(400c84 <??DataTable3>)
  400978:	466a      	mov	r2, sp
  40097a:	6042      	str	r2, [r0, #4]
  40097c:	60c1      	str	r1, [r0, #12]
  40097e:	f000 f805 	bl	40098c <weather_station_app_init>

00400982 <??Main_1>:
  400982:	f000 f8a7 	bl	400ad4 <weather_controller_process>
  400986:	e7fc      	b.n	400982 <??Main_1>

00400988 <??Main_0>:
  400988:	0aad 0040                                   ..@.

0040098c <weather_station_app_init>:
  40098c:	b510      	push	{r4, lr}
  40098e:	2000      	movs	r0, #0
  400990:	4cbc      	ldr	r4, [pc, #752]	(400c84 <??DataTable3>)
  400992:	7460      	strb	r0, [r4, #17]
  400994:	8260      	strh	r0, [r4, #18]
  400996:	2107      	movs	r1, #7
  400998:	7521      	strb	r1, [r4, #20]
  40099a:	7560      	strb	r0, [r4, #21]
  40099c:	2101      	movs	r1, #1
  40099e:	75a1      	strb	r1, [r4, #22]
  4009a0:	7660      	strb	r0, [r4, #25]
  4009a2:	200f      	movs	r0, #15
  4009a4:	76a0      	strb	r0, [r4, #26]
  4009a6:	f40f fa79 	bl	fe9c <ITC_Init>
  4009aa:	4939      	ldr	r1, [pc, #228]	(400a90 <??weather_station_app_init_0>)
  4009ac:	2007      	movs	r0, #7
  4009ae:	f40f fab9 	bl	ff24 <IntAssignHandler>
  4009b2:	2100      	movs	r1, #0
  4009b4:	2007      	movs	r0, #7
  4009b6:	f40f fa97 	bl	fee8 <ITC_SetPriority>
  4009ba:	2007      	movs	r0, #7
  4009bc:	f40f fb02 	bl	ffc4 <ITC_EnableInterrupt>
  4009c0:	4934      	ldr	r1, [pc, #208]	(400a94 <??weather_station_app_init_0+0x4>)
  4009c2:	2003      	movs	r0, #3
  4009c4:	f40f faae 	bl	ff24 <IntAssignHandler>
  4009c8:	2100      	movs	r1, #0
  4009ca:	2003      	movs	r0, #3
  4009cc:	f40f fa8c 	bl	fee8 <ITC_SetPriority>
  4009d0:	2003      	movs	r0, #3
  4009d2:	f40f faf7 	bl	ffc4 <ITC_EnableInterrupt>
  4009d6:	4930      	ldr	r1, [pc, #192]	(400a98 <??weather_station_app_init_0+0x8>)
  4009d8:	2005      	movs	r0, #5
  4009da:	f40f faa3 	bl	ff24 <IntAssignHandler>
  4009de:	2100      	movs	r1, #0
  4009e0:	2005      	movs	r0, #5
  4009e2:	f40f fa81 	bl	fee8 <ITC_SetPriority>
  4009e6:	2005      	movs	r0, #5
  4009e8:	f40f faec 	bl	ffc4 <ITC_EnableInterrupt>
  4009ec:	492b      	ldr	r1, [pc, #172]	(400a9c <??weather_station_app_init_0+0xc>)
  4009ee:	2002      	movs	r0, #2
  4009f0:	f403 fa6a 	bl	3ec8 <CRM_RegisterISR>
  4009f4:	492a      	ldr	r1, [pc, #168]	(400aa0 <??weather_station_app_init_0+0x10>)
  4009f6:	2003      	movs	r0, #3
  4009f8:	f403 fa66 	bl	3ec8 <CRM_RegisterISR>
  4009fc:	4929      	ldr	r1, [pc, #164]	(400aa4 <??weather_station_app_init_0+0x14>)
  4009fe:	2004      	movs	r0, #4
  400a00:	f403 fa62 	bl	3ec8 <CRM_RegisterISR>
  400a04:	4928      	ldr	r1, [pc, #160]	(400aa8 <??weather_station_app_init_0+0x18>)
  400a06:	2005      	movs	r0, #5
  400a08:	f403 fa5e 	bl	3ec8 <CRM_RegisterISR>
  400a0c:	f7ff ff88 	bl	400920 <?Veneer (3) for IntDisableIRQ>
  400a10:	f7ff ff8e 	bl	400930 <?Veneer (3) for IntDisableFIQ>
  400a14:	f003 f940 	bl	403c98 <ResetMaca>
  400a18:	f002 fb8c 	bl	403134 <MLMERadioInit>
  400a1c:	f003 f8ac 	bl	403b78 <PlatformPortInit>
  400a20:	2000      	movs	r0, #0
  400a22:	f7ff ff75 	bl	400910 <?Veneer (3) for IntRestoreIRQ>
  400a26:	2000      	movs	r0, #0
  400a28:	f7ff ff8a 	bl	400940 <?Veneer (3) for IntRestoreFIQ>
  400a2c:	f002 fcfc 	bl	403428 <LED_Init>
  400a30:	f003 f87e 	bl	403b30 <KbGpioInit>
  400a34:	0020      	lsls	r0, r4, #0
  400a36:	3030      	adds	r0, #48
  400a38:	f002 fe10 	bl	40365c <Uart_Init>
  400a3c:	f000 fe00 	bl	401640 <NVMSetup>
  400a40:	f000 fec8 	bl	4017d4 <LCD_Init>
  400a44:	220f      	movs	r2, #15
  400a46:	2100      	movs	r1, #0
  400a48:	20f0      	movs	r0, #240
  400a4a:	f002 ff3b 	bl	4038c4 <MLMESetWakeupSource>
  400a4e:	7ea0      	ldrb	r0, [r4, #26]
  400a50:	f002 ff23 	bl	40389a <MLMEPAOutputAdjust>
  400a54:	7d60      	ldrb	r0, [r4, #21]
  400a56:	f002 feed 	bl	403834 <MLMESetChannelRequest>
  400a5a:	f000 fe27 	bl	4016ac <ReadCurrentMeasurementSystem>
  400a5e:	7da0      	ldrb	r0, [r4, #22]
  400a60:	f001 fa4e 	bl	401f00 <LCD_SetBacklight>
  400a64:	f000 ffad 	bl	4019c2 <LCD_ClearDisplay>
  400a68:	2110      	movs	r1, #16
  400a6a:	2015      	movs	r0, #21
  400a6c:	f000 fa48 	bl	400f00 <DisplayFreescaleLogo>
  400a70:	20fa      	movs	r0, #250
  400a72:	0080      	lsls	r0, r0, #2
  400a74:	f003 f8a2 	bl	403bbc <DelayMs>
  400a78:	2110      	movs	r1, #16
  400a7a:	2015      	movs	r0, #21
  400a7c:	f000 fb34 	bl	4010e8 <ClearFreescaleLogo>
  400a80:	f000 ff9f 	bl	4019c2 <LCD_ClearDisplay>
  400a84:	7d20      	ldrb	r0, [r4, #20]
  400a86:	f000 fc05 	bl	401294 <DisplaySensorValue>
  400a8a:	bc10      	pop	{r4}
  400a8c:	bc08      	pop	{r3}
  400a8e:	4718      	bx	r3

00400a90 <??weather_station_app_init_0>:
  400a90:	2a4d 0040 3f35 0000 ab41 0000 0c8d 0040     M*@.5?..A.....@.
  400aa0:	0ca9 0040 0ce1 0040 0cc5 0040               ..@...@...@.

00400aac <weather_station_rx_cb>:
  400aac:	4807      	ldr	r0, [pc, #28]	(400acc <??weather_station_rx_cb_0>)
  400aae:	6801      	ldr	r1, [r0, #0]
  400ab0:	2210      	movs	r2, #16
  400ab2:	400a      	ands	r2, r1
  400ab4:	0911      	lsrs	r1, r2, #4
  400ab6:	2901      	cmp	r1, #1
  400ab8:	d106      	bne.n	400ac8 <??weather_station_rx_cb_1>
  400aba:	6801      	ldr	r1, [r0, #0]
  400abc:	2210      	movs	r2, #16
  400abe:	4391      	bics	r1, r2
  400ac0:	6001      	str	r1, [r0, #0]
  400ac2:	4803      	ldr	r0, [pc, #12]	(400ad0 <??weather_station_rx_cb_0+0x4>)
  400ac4:	2101      	movs	r1, #1
  400ac6:	7001      	strb	r1, [r0, #0]

00400ac8 <??weather_station_rx_cb_1>:
  400ac8:	4770      	bx	lr
  400aca:	46c0      	nop			(mov r8, r8)

00400acc <??weather_station_rx_cb_0>:
  400acc:	525c 0040 5060 0040                         \R@.`P@.

00400ad4 <weather_controller_process>:
  400ad4:	b570      	push	{r4, r5, r6, lr}
  400ad6:	b084      	sub	sp, #16
  400ad8:	f001 fbca 	bl	402270 <process_radio_msg>
  400adc:	4c69      	ldr	r4, [pc, #420]	(400c84 <??DataTable3>)
  400ade:	7c20      	ldrb	r0, [r4, #16]
  400ae0:	2801      	cmp	r0, #1
  400ae2:	d103      	bne.n	400aec <??weather_controller_process_0>
  400ae4:	2000      	movs	r0, #0
  400ae6:	7420      	strb	r0, [r4, #16]
  400ae8:	f000 f9b2 	bl	400e50 <process_incoming_msg>

00400aec <??weather_controller_process_0>:
  400aec:	4863      	ldr	r0, [pc, #396]	(400c7c <??weather_controller_process_1>)
  400aee:	7800      	ldrb	r0, [r0, #0]
  400af0:	2800      	cmp	r0, #0
  400af2:	d110      	bne.n	400b16 <??weather_controller_process_2>
  400af4:	4862      	ldr	r0, [pc, #392]	(400c80 <??weather_controller_process_1+0x4>)
  400af6:	8801      	ldrh	r1, [r0, #0]
  400af8:	2900      	cmp	r1, #0
  400afa:	d00c      	beq.n	400b16 <??weather_controller_process_2>
  400afc:	2100      	movs	r1, #0
  400afe:	8001      	strh	r1, [r0, #0]
  400b00:	4668      	mov	r0, sp
  400b02:	f000 fe53 	bl	4017ac <cpy_uart_to_data_buff>
  400b06:	4668      	mov	r0, sp
  400b08:	7801      	ldrb	r1, [r0, #0]
  400b0a:	29fd      	cmp	r1, #253
  400b0c:	d103      	bne.n	400b16 <??weather_controller_process_2>
  400b0e:	7881      	ldrb	r1, [r0, #2]
  400b10:	7840      	ldrb	r0, [r0, #1]
  400b12:	f000 fddb 	bl	4016cc <execute_uart_command>

00400b16 <??weather_controller_process_2>:
  400b16:	2502      	movs	r5, #2
  400b18:	7c60      	ldrb	r0, [r4, #17]
  400b1a:	4228      	tst	r0, r5
  400b1c:	d00e      	beq.n	400b3c <??weather_controller_process_3>
  400b1e:	21fd      	movs	r1, #253
  400b20:	4001      	ands	r1, r0
  400b22:	7461      	strb	r1, [r4, #17]
  400b24:	7ce1      	ldrb	r1, [r4, #19]
  400b26:	1e48      	subs	r0, r1, #1
  400b28:	4180      	sbcs	r0, r0
  400b2a:	0fc0      	lsrs	r0, r0, #31
  400b2c:	74e0      	strb	r0, [r4, #19]
  400b2e:	f000 fd9d 	bl	40166c <LoadCurrentMeasurementSystem>
  400b32:	f000 ff46 	bl	4019c2 <LCD_ClearDisplay>
  400b36:	7d20      	ldrb	r0, [r4, #20]
  400b38:	f000 fbac 	bl	401294 <DisplaySensorValue>

00400b3c <??weather_controller_process_3>:
  400b3c:	7c60      	ldrb	r0, [r4, #17]
  400b3e:	07c0      	lsls	r0, r0, #31
  400b40:	d51a      	bpl.n	400b78 <??weather_controller_process_4>
  400b42:	7c60      	ldrb	r0, [r4, #17]
  400b44:	21fe      	movs	r1, #254
  400b46:	4001      	ands	r1, r0
  400b48:	7461      	strb	r1, [r4, #17]
  400b4a:	26ff      	movs	r6, #255

00400b4c <??weather_controller_process_5>:
  400b4c:	7d60      	ldrb	r0, [r4, #21]
  400b4e:	280f      	cmp	r0, #15
  400b50:	d101      	bne.n	400b56 <??weather_controller_process_6>
  400b52:	2000      	movs	r0, #0
  400b54:	e000      	b.n	400b58 <??weather_controller_process_7>

00400b56 <??weather_controller_process_6>:
  400b56:	1c40      	adds	r0, r0, #1

00400b58 <??weather_controller_process_7>:
  400b58:	7560      	strb	r0, [r4, #21]
  400b5a:	1c76      	adds	r6, r6, #1
  400b5c:	0636      	lsls	r6, r6, #24
  400b5e:	0e36      	lsrs	r6, r6, #24
  400b60:	7d60      	ldrb	r0, [r4, #21]
  400b62:	f002 fe67 	bl	403834 <MLMESetChannelRequest>
  400b66:	2800      	cmp	r0, #0
  400b68:	d001      	beq.n	400b6e <??weather_controller_process_8>
  400b6a:	2e02      	cmp	r6, #2
  400b6c:	dbee      	blt.n	400b4c <??weather_controller_process_5>

00400b6e <??weather_controller_process_8>:
  400b6e:	f000 ff28 	bl	4019c2 <LCD_ClearDisplay>
  400b72:	7d20      	ldrb	r0, [r4, #20]
  400b74:	f000 fb8e 	bl	401294 <DisplaySensorValue>

00400b78 <??weather_controller_process_4>:
  400b78:	2604      	movs	r6, #4
  400b7a:	7c60      	ldrb	r0, [r4, #17]
  400b7c:	4230      	tst	r0, r6
  400b7e:	d00e      	beq.n	400b9e <??weather_controller_process_9>
  400b80:	21fb      	movs	r1, #251
  400b82:	4001      	ands	r1, r0
  400b84:	7461      	strb	r1, [r4, #17]
  400b86:	7d20      	ldrb	r0, [r4, #20]
  400b88:	280d      	cmp	r0, #13
  400b8a:	d101      	bne.n	400b90 <??weather_controller_process_10>
  400b8c:	2005      	movs	r0, #5
  400b8e:	e000      	b.n	400b92 <??weather_controller_process_11>

00400b90 <??weather_controller_process_10>:
  400b90:	1c80      	adds	r0, r0, #2

00400b92 <??weather_controller_process_11>:
  400b92:	7520      	strb	r0, [r4, #20]
  400b94:	f000 ff15 	bl	4019c2 <LCD_ClearDisplay>
  400b98:	7d20      	ldrb	r0, [r4, #20]
  400b9a:	f000 fb7b 	bl	401294 <DisplaySensorValue>

00400b9e <??weather_controller_process_9>:
  400b9e:	7c60      	ldrb	r0, [r4, #17]
  400ba0:	0700      	lsls	r0, r0, #28
  400ba2:	d50d      	bpl.n	400bc0 <??weather_controller_process_12>
  400ba4:	7c60      	ldrb	r0, [r4, #17]
  400ba6:	21f7      	movs	r1, #247
  400ba8:	4001      	ands	r1, r0
  400baa:	7461      	strb	r1, [r4, #17]
  400bac:	7da0      	ldrb	r0, [r4, #22]
  400bae:	2801      	cmp	r0, #1
  400bb0:	d101      	bne.n	400bb6 <??weather_controller_process_13>
  400bb2:	2000      	movs	r0, #0
  400bb4:	e000      	b.n	400bb8 <??weather_controller_process_14>

00400bb6 <??weather_controller_process_13>:
  400bb6:	2001      	movs	r0, #1

00400bb8 <??weather_controller_process_14>:
  400bb8:	75a0      	strb	r0, [r4, #22]
  400bba:	7da0      	ldrb	r0, [r4, #22]
  400bbc:	f001 f9a0 	bl	401f00 <LCD_SetBacklight>

00400bc0 <??weather_controller_process_12>:
  400bc0:	7ee0      	ldrb	r0, [r4, #27]
  400bc2:	2800      	cmp	r0, #0
  400bc4:	d006      	beq.n	400bd4 <??weather_controller_process_15>
  400bc6:	2802      	cmp	r0, #2
  400bc8:	d030      	beq.n	400c2c <??weather_controller_process_16>
  400bca:	d306      	bcc.n	400bda <??weather_controller_process_17>
  400bcc:	2804      	cmp	r0, #4
  400bce:	d041      	beq.n	400c54 <??weather_controller_process_18>
  400bd0:	d31a      	bcc.n	400c08 <??weather_controller_process_19>
  400bd2:	e04f      	b.n	400c74 <??weather_controller_process_20>

00400bd4 <??weather_controller_process_15>:
  400bd4:	2001      	movs	r0, #1

00400bd6 <??weather_controller_process_21>:
  400bd6:	76e0      	strb	r0, [r4, #27]
  400bd8:	e04c      	b.n	400c74 <??weather_controller_process_20>

00400bda <??weather_controller_process_17>:
  400bda:	482b      	ldr	r0, [pc, #172]	(400c88 <??DataTable6>)
  400bdc:	2107      	movs	r1, #7
  400bde:	7802      	ldrb	r2, [r0, #0]
  400be0:	400a      	ands	r2, r1
  400be2:	2328      	movs	r3, #40
  400be4:	4313      	orrs	r3, r2
  400be6:	7003      	strb	r3, [r0, #0]
  400be8:	7820      	ldrb	r0, [r4, #0]
  400bea:	4001      	ands	r1, r0
  400bec:	2020      	movs	r0, #32
  400bee:	4308      	orrs	r0, r1
  400bf0:	7020      	strb	r0, [r4, #0]
  400bf2:	6860      	ldr	r0, [r4, #4]
  400bf4:	2141      	movs	r1, #65
  400bf6:	7081      	strb	r1, [r0, #2]
  400bf8:	6860      	ldr	r0, [r4, #4]
  400bfa:	2143      	movs	r1, #67
  400bfc:	70c1      	strb	r1, [r0, #3]
  400bfe:	6860      	ldr	r0, [r4, #4]
  400c00:	214b      	movs	r1, #75
  400c02:	7101      	strb	r1, [r0, #4]
  400c04:	2003      	movs	r0, #3
  400c06:	e7e6      	b.n	400bd6 <??weather_controller_process_21>

00400c08 <??weather_controller_process_19>:
  400c08:	481f      	ldr	r0, [pc, #124]	(400c88 <??DataTable6>)
  400c0a:	7801      	ldrb	r1, [r0, #0]
  400c0c:	08c9      	lsrs	r1, r1, #3
  400c0e:	2905      	cmp	r1, #5
  400c10:	d005      	beq.n	400c1e <??weather_controller_process_22>
  400c12:	2906      	cmp	r1, #6
  400c14:	d003      	beq.n	400c1e <??weather_controller_process_22>
  400c16:	2908      	cmp	r1, #8
  400c18:	d001      	beq.n	400c1e <??weather_controller_process_22>
  400c1a:	2904      	cmp	r1, #4
  400c1c:	d12a      	bne.n	400c74 <??weather_controller_process_20>

00400c1e <??weather_controller_process_22>:
  400c1e:	2143      	movs	r1, #67
  400c20:	7201      	strb	r1, [r0, #8]
  400c22:	21f0      	movs	r1, #240
  400c24:	0209      	lsls	r1, r1, #8
  400c26:	f002 fe1b 	bl	403860 <MLMERXEnableRequest>
  400c2a:	e022      	b.n	400c72 <??weather_controller_process_23>

00400c2c <??weather_controller_process_16>:
  400c2c:	4816      	ldr	r0, [pc, #88]	(400c88 <??DataTable6>)
  400c2e:	7801      	ldrb	r1, [r0, #0]
  400c30:	08c9      	lsrs	r1, r1, #3
  400c32:	2905      	cmp	r1, #5
  400c34:	d005      	beq.n	400c42 <??weather_controller_process_24>
  400c36:	2906      	cmp	r1, #6
  400c38:	d003      	beq.n	400c42 <??weather_controller_process_24>
  400c3a:	2908      	cmp	r1, #8
  400c3c:	d001      	beq.n	400c42 <??weather_controller_process_24>
  400c3e:	2904      	cmp	r1, #4
  400c40:	d101      	bne.n	400c46 <??weather_controller_process_25>

00400c42 <??weather_controller_process_24>:
  400c42:	2003      	movs	r0, #3
  400c44:	76e0      	strb	r0, [r4, #27]

00400c46 <??weather_controller_process_25>:
  400c46:	7ca0      	ldrb	r0, [r4, #18]
  400c48:	2801      	cmp	r0, #1
  400c4a:	d113      	bne.n	400c74 <??weather_controller_process_20>
  400c4c:	2000      	movs	r0, #0
  400c4e:	74a0      	strb	r0, [r4, #18]
  400c50:	76e6      	strb	r6, [r4, #27]
  400c52:	e00f      	b.n	400c74 <??weather_controller_process_20>

00400c54 <??weather_controller_process_18>:
  400c54:	7820      	ldrb	r0, [r4, #0]
  400c56:	08c0      	lsrs	r0, r0, #3
  400c58:	2804      	cmp	r0, #4
  400c5a:	d005      	beq.n	400c68 <??weather_controller_process_26>
  400c5c:	2805      	cmp	r0, #5
  400c5e:	d003      	beq.n	400c68 <??weather_controller_process_26>
  400c60:	2807      	cmp	r0, #7
  400c62:	d001      	beq.n	400c68 <??weather_controller_process_26>
  400c64:	2803      	cmp	r0, #3
  400c66:	d104      	bne.n	400c72 <??weather_controller_process_23>

00400c68 <??weather_controller_process_26>:
  400c68:	2005      	movs	r0, #5
  400c6a:	7220      	strb	r0, [r4, #8]
  400c6c:	0020      	lsls	r0, r4, #0
  400c6e:	f002 fdd3 	bl	403818 <MCPSDataRequest>

00400c72 <??weather_controller_process_23>:
  400c72:	76e5      	strb	r5, [r4, #27]

00400c74 <??weather_controller_process_20>:
  400c74:	b004      	add	sp, #16
  400c76:	bc70      	pop	{r4, r5, r6}
  400c78:	bc08      	pop	{r3}
  400c7a:	4718      	bx	r3

00400c7c <??weather_controller_process_1>:
  400c7c:	50b0 0040 50b2 0040                         .P@..P@.

00400c84 <??DataTable3>:
  400c84:	5050 0040                                   PP@.

00400c88 <??DataTable6>:
  400c88:	508c 0040                                   .P@.

00400c8c <change_measurement_system_isr>:
  400c8c:	b580      	push	{r7, lr}
  400c8e:	2064      	movs	r0, #100
  400c90:	f002 ff94 	bl	403bbc <DelayMs>
  400c94:	4803      	ldr	r0, [pc, #12]	(400ca4 <??change_measurement_system_isr_0>)
  400c96:	7c41      	ldrb	r1, [r0, #17]
  400c98:	2202      	movs	r2, #2
  400c9a:	430a      	orrs	r2, r1
  400c9c:	7442      	strb	r2, [r0, #17]
  400c9e:	bc09      	pop	{r0, r3}
  400ca0:	4718      	bx	r3
  400ca2:	46c0      	nop			(mov r8, r8)

00400ca4 <??change_measurement_system_isr_0>:
  400ca4:	5050 0040                                   PP@.

00400ca8 <change_display_isr>:
  400ca8:	b580      	push	{r7, lr}
  400caa:	2064      	movs	r0, #100
  400cac:	f002 ff86 	bl	403bbc <DelayMs>
  400cb0:	4803      	ldr	r0, [pc, #12]	(400cc0 <??change_display_isr_0>)
  400cb2:	7c41      	ldrb	r1, [r0, #17]
  400cb4:	2204      	movs	r2, #4
  400cb6:	430a      	orrs	r2, r1
  400cb8:	7442      	strb	r2, [r0, #17]
  400cba:	bc09      	pop	{r0, r3}
  400cbc:	4718      	bx	r3
  400cbe:	46c0      	nop			(mov r8, r8)

00400cc0 <??change_display_isr_0>:
  400cc0:	5050 0040                                   PP@.

00400cc4 <change_channel_isr>:
  400cc4:	b580      	push	{r7, lr}
  400cc6:	2064      	movs	r0, #100
  400cc8:	f002 ff78 	bl	403bbc <DelayMs>
  400ccc:	4803      	ldr	r0, [pc, #12]	(400cdc <??change_channel_isr_0>)
  400cce:	7c41      	ldrb	r1, [r0, #17]
  400cd0:	2201      	movs	r2, #1
  400cd2:	430a      	orrs	r2, r1
  400cd4:	7442      	strb	r2, [r0, #17]
  400cd6:	bc09      	pop	{r0, r3}
  400cd8:	4718      	bx	r3
  400cda:	46c0      	nop			(mov r8, r8)

00400cdc <??change_channel_isr_0>:
  400cdc:	5050 0040                                   PP@.

00400ce0 <change_back_light_isr>:
  400ce0:	b580      	push	{r7, lr}
  400ce2:	2064      	movs	r0, #100
  400ce4:	f002 ff6a 	bl	403bbc <DelayMs>
  400ce8:	4803      	ldr	r0, [pc, #12]	(400cf8 <??change_back_light_isr_0>)
  400cea:	7c41      	ldrb	r1, [r0, #17]
  400cec:	2208      	movs	r2, #8
  400cee:	430a      	orrs	r2, r1
  400cf0:	7442      	strb	r2, [r0, #17]
  400cf2:	bc09      	pop	{r0, r3}
  400cf4:	4718      	bx	r3
  400cf6:	46c0      	nop			(mov r8, r8)

00400cf8 <??change_back_light_isr_0>:
  400cf8:	5050 0040                                   PP@.

00400cfc <adjust_sensor_to_current_measure_system>:
  400cfc:	b5d8      	push	{r3, r4, r6, r7, lr}
  400cfe:	1f49      	subs	r1, r1, #5
  400d00:	d009      	beq.n	400d16 <??adjust_sensor_to_current_measure_system_0>
  400d02:	1e89      	subs	r1, r1, #2
  400d04:	d00e      	beq.n	400d24 <??adjust_sensor_to_current_measure_system_1>
  400d06:	1e89      	subs	r1, r1, #2
  400d08:	d02f      	beq.n	400d6a <??adjust_sensor_to_current_measure_system_2>
  400d0a:	1e89      	subs	r1, r1, #2
  400d0c:	d04e      	beq.n	400dac <??adjust_sensor_to_current_measure_system_3>
  400d0e:	1e89      	subs	r1, r1, #2
  400d10:	d100      	bne.n	400d14 <adjust_sensor_to_current_measure_system+0x18>
  400d12:	e080      	b.n	400e16 <??adjust_sensor_to_current_measure_system_4>
  400d14:	e08c      	b.n	400e30 <??adjust_sensor_to_current_measure_system_5>

00400d16 <??adjust_sensor_to_current_measure_system_0>:
  400d16:	21b4      	movs	r1, #180
  400d18:	0049      	lsls	r1, r1, #1
  400d1a:	1a09      	subs	r1, r1, r0
  400d1c:	4a47      	ldr	r2, [pc, #284]	(400e3c <??adjust_sensor_to_current_measure_system_6>)
  400d1e:	8011      	strh	r1, [r2, #0]
  400d20:	0002      	lsls	r2, r0, #0
  400d22:	e085      	b.n	400e30 <??adjust_sensor_to_current_measure_system_5>

00400d24 <??adjust_sensor_to_current_measure_system_1>:
  400d24:	0007      	lsls	r7, r0, #0
  400d26:	2164      	movs	r1, #100
  400d28:	f7ff fdea 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400d2c:	0204      	lsls	r4, r0, #8
  400d2e:	0038      	lsls	r0, r7, #0
  400d30:	2164      	movs	r1, #100
  400d32:	f7ff fde5 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400d36:	4321      	orrs	r1, r4
  400d38:	000e      	lsls	r6, r1, #0
  400d3a:	4c41      	ldr	r4, [pc, #260]	(400e40 <??adjust_sensor_to_current_measure_system_6+0x4>)
  400d3c:	8466      	strh	r6, [r4, #34]
  400d3e:	4841      	ldr	r0, [pc, #260]	(400e44 <??adjust_sensor_to_current_measure_system_6+0x8>)
  400d40:	4347      	muls	r7, r0
  400d42:	0038      	lsls	r0, r7, #0
  400d44:	21fa      	movs	r1, #250
  400d46:	0089      	lsls	r1, r1, #2
  400d48:	f7ff fdda 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400d4c:	0007      	lsls	r7, r0, #0
  400d4e:	2164      	movs	r1, #100
  400d50:	f7ff fdfe 	bl	400950 <?Veneer (3) for __aeabi_uidiv>
  400d54:	0200      	lsls	r0, r0, #8
  400d56:	9000      	str	r0, [sp, #0]
  400d58:	0038      	lsls	r0, r7, #0
  400d5a:	2164      	movs	r1, #100
  400d5c:	f7ff fdf8 	bl	400950 <?Veneer (3) for __aeabi_uidiv>
  400d60:	9800      	ldr	r0, [sp, #0]
  400d62:	4301      	orrs	r1, r0
  400d64:	8521      	strh	r1, [r4, #40]

00400d66 <??adjust_sensor_to_current_measure_system_7>:
  400d66:	0032      	lsls	r2, r6, #0
  400d68:	e062      	b.n	400e30 <??adjust_sensor_to_current_measure_system_5>

00400d6a <??adjust_sensor_to_current_measure_system_2>:
  400d6a:	0007      	lsls	r7, r0, #0
  400d6c:	2164      	movs	r1, #100
  400d6e:	f7ff fdc7 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400d72:	0204      	lsls	r4, r0, #8
  400d74:	0038      	lsls	r0, r7, #0
  400d76:	2164      	movs	r1, #100
  400d78:	f7ff fdc2 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400d7c:	4321      	orrs	r1, r4
  400d7e:	000e      	lsls	r6, r1, #0
  400d80:	4c2f      	ldr	r4, [pc, #188]	(400e40 <??adjust_sensor_to_current_measure_system_6+0x4>)
  400d82:	8426      	strh	r6, [r4, #32]
  400d84:	2091      	movs	r0, #145
  400d86:	4347      	muls	r7, r0
  400d88:	0038      	lsls	r0, r7, #0
  400d8a:	492f      	ldr	r1, [pc, #188]	(400e48 <??adjust_sensor_to_current_measure_system_6+0xc>)
  400d8c:	f7ff fdb8 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400d90:	0007      	lsls	r7, r0, #0
  400d92:	2164      	movs	r1, #100
  400d94:	f7ff fddc 	bl	400950 <?Veneer (3) for __aeabi_uidiv>
  400d98:	0200      	lsls	r0, r0, #8
  400d9a:	9000      	str	r0, [sp, #0]
  400d9c:	0038      	lsls	r0, r7, #0
  400d9e:	2164      	movs	r1, #100
  400da0:	f7ff fdd6 	bl	400950 <?Veneer (3) for __aeabi_uidiv>
  400da4:	9800      	ldr	r0, [sp, #0]
  400da6:	4301      	orrs	r1, r0
  400da8:	84e1      	strh	r1, [r4, #38]
  400daa:	e7dc      	b.n	400d66 <??adjust_sensor_to_current_measure_system_7>

00400dac <??adjust_sensor_to_current_measure_system_3>:
  400dac:	4927      	ldr	r1, [pc, #156]	(400e4c <??adjust_sensor_to_current_measure_system_6+0x10>)
  400dae:	4288      	cmp	r0, r1
  400db0:	d303      	bcc.n	400dba <??adjust_sensor_to_current_measure_system_8>
  400db2:	0401      	lsls	r1, r0, #16
  400db4:	1a08      	subs	r0, r1, r0
  400db6:	2101      	movs	r1, #1
  400db8:	e000      	b.n	400dbc <??adjust_sensor_to_current_measure_system_9>

00400dba <??adjust_sensor_to_current_measure_system_8>:
  400dba:	2100      	movs	r1, #0

00400dbc <??adjust_sensor_to_current_measure_system_9>:
  400dbc:	4c20      	ldr	r4, [pc, #128]	(400e40 <??adjust_sensor_to_current_measure_system_6+0x4>)
  400dbe:	75e1      	strb	r1, [r4, #23]
  400dc0:	0400      	lsls	r0, r0, #16
  400dc2:	0c00      	lsrs	r0, r0, #16
  400dc4:	0007      	lsls	r7, r0, #0
  400dc6:	2164      	movs	r1, #100
  400dc8:	f7ff fd9a 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400dcc:	0206      	lsls	r6, r0, #8
  400dce:	0038      	lsls	r0, r7, #0
  400dd0:	2164      	movs	r1, #100
  400dd2:	f7ff fd95 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400dd6:	4331      	orrs	r1, r6
  400dd8:	000e      	lsls	r6, r1, #0
  400dda:	83e6      	strh	r6, [r4, #30]
  400ddc:	00f8      	lsls	r0, r7, #3
  400dde:	19c0      	adds	r0, r0, r7
  400de0:	0040      	lsls	r0, r0, #1
  400de2:	210a      	movs	r1, #10
  400de4:	f7ff fd8c 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400de8:	21c8      	movs	r1, #200
  400dea:	0109      	lsls	r1, r1, #4
  400dec:	1847      	adds	r7, r0, r1
  400dee:	0038      	lsls	r0, r7, #0
  400df0:	2164      	movs	r1, #100
  400df2:	f7ff fdad 	bl	400950 <?Veneer (3) for __aeabi_uidiv>
  400df6:	0200      	lsls	r0, r0, #8
  400df8:	9000      	str	r0, [sp, #0]
  400dfa:	0038      	lsls	r0, r7, #0
  400dfc:	2164      	movs	r1, #100
  400dfe:	f7ff fda7 	bl	400950 <?Veneer (3) for __aeabi_uidiv>
  400e02:	9800      	ldr	r0, [sp, #0]
  400e04:	4301      	orrs	r1, r0
  400e06:	84a1      	strh	r1, [r4, #36]
  400e08:	7de0      	ldrb	r0, [r4, #23]
  400e0a:	2800      	cmp	r0, #0
  400e0c:	d0ab      	beq.n	400d66 <??adjust_sensor_to_current_measure_system_7>
  400e0e:	2280      	movs	r2, #128
  400e10:	0212      	lsls	r2, r2, #8
  400e12:	4332      	orrs	r2, r6
  400e14:	e00c      	b.n	400e30 <??adjust_sensor_to_current_measure_system_5>

00400e16 <??adjust_sensor_to_current_measure_system_4>:
  400e16:	0007      	lsls	r7, r0, #0
  400e18:	2164      	movs	r1, #100
  400e1a:	f7ff fd71 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400e1e:	0204      	lsls	r4, r0, #8
  400e20:	0038      	lsls	r0, r7, #0
  400e22:	2164      	movs	r1, #100
  400e24:	f7ff fd6c 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  400e28:	4321      	orrs	r1, r4
  400e2a:	4c05      	ldr	r4, [pc, #20]	(400e40 <??adjust_sensor_to_current_measure_system_6+0x4>)
  400e2c:	8561      	strh	r1, [r4, #42]
  400e2e:	000a      	lsls	r2, r1, #0

00400e30 <??adjust_sensor_to_current_measure_system_5>:
  400e30:	0410      	lsls	r0, r2, #16
  400e32:	0c00      	lsrs	r0, r0, #16
  400e34:	bcd2      	pop	{r1, r4, r6, r7}
  400e36:	bc08      	pop	{r3}
  400e38:	4718      	bx	r3
  400e3a:	46c0      	nop			(mov r8, r8)

00400e3c <??adjust_sensor_to_current_measure_system_6>:
  400e3c:	507c 0040 5050 0040 026d 0000 2710 0000     |P@.PP@.m....'..
  400e4c:	3909 0000                                   .9..

00400e50 <process_incoming_msg>:
  400e50:	b5f0      	push	{r4, r5, r6, r7, lr}
  400e52:	b085      	sub	sp, #20
  400e54:	4f24      	ldr	r7, [pc, #144]	(400ee8 <??process_incoming_msg_0>)
  400e56:	6878      	ldr	r0, [r7, #4]
  400e58:	78c0      	ldrb	r0, [r0, #3]
  400e5a:	2801      	cmp	r0, #1
  400e5c:	d140      	bne.n	400ee0 <??process_incoming_msg_1>
  400e5e:	4923      	ldr	r1, [pc, #140]	(400eec <??process_incoming_msg_0+0x4>)
  400e60:	7008      	strb	r0, [r1, #0]
  400e62:	6879      	ldr	r1, [r7, #4]
  400e64:	7909      	ldrb	r1, [r1, #4]
  400e66:	4a22      	ldr	r2, [pc, #136]	(400ef0 <??process_incoming_msg_0+0x8>)
  400e68:	6812      	ldr	r2, [r2, #0]
  400e6a:	7151      	strb	r1, [r2, #5]
  400e6c:	466e      	mov	r6, sp
  400e6e:	21fe      	movs	r1, #254
  400e70:	7031      	strb	r1, [r6, #0]
  400e72:	7070      	strb	r0, [r6, #1]
  400e74:	6878      	ldr	r0, [r7, #4]
  400e76:	7900      	ldrb	r0, [r0, #4]
  400e78:	70b0      	strb	r0, [r6, #2]
  400e7a:	6878      	ldr	r0, [r7, #4]
  400e7c:	7940      	ldrb	r0, [r0, #5]
  400e7e:	70f0      	strb	r0, [r6, #3]
  400e80:	6878      	ldr	r0, [r7, #4]
  400e82:	7980      	ldrb	r0, [r0, #6]
  400e84:	7130      	strb	r0, [r6, #4]
  400e86:	2405      	movs	r4, #5
  400e88:	466d      	mov	r5, sp
  400e8a:	1d6d      	adds	r5, r5, #5

00400e8c <??process_incoming_msg_2>:
  400e8c:	6878      	ldr	r0, [r7, #4]
  400e8e:	1900      	adds	r0, r0, r4
  400e90:	0621      	lsls	r1, r4, #24
  400e92:	0e09      	lsrs	r1, r1, #24
  400e94:	7882      	ldrb	r2, [r0, #2]
  400e96:	0212      	lsls	r2, r2, #8
  400e98:	78c0      	ldrb	r0, [r0, #3]
  400e9a:	4310      	orrs	r0, r2
  400e9c:	f7ff ff2e 	bl	400cfc <adjust_sensor_to_current_measure_system>
  400ea0:	1201      	asrs	r1, r0, #8
  400ea2:	7029      	strb	r1, [r5, #0]
  400ea4:	7068      	strb	r0, [r5, #1]
  400ea6:	1ca4      	adds	r4, r4, #2
  400ea8:	1cad      	adds	r5, r5, #2
  400eaa:	2c0e      	cmp	r4, #14
  400eac:	dbee      	blt.n	400e8c <??process_incoming_msg_2>
  400eae:	6878      	ldr	r0, [r7, #4]
  400eb0:	7c40      	ldrb	r0, [r0, #17]
  400eb2:	73f0      	strb	r0, [r6, #15]
  400eb4:	20ff      	movs	r0, #255
  400eb6:	7430      	strb	r0, [r6, #16]
  400eb8:	480e      	ldr	r0, [pc, #56]	(400ef4 <??process_incoming_msg_0+0xc>)
  400eba:	7800      	ldrb	r0, [r0, #0]
  400ebc:	2801      	cmp	r0, #1
  400ebe:	d10b      	bne.n	400ed8 <??process_incoming_msg_3>
  400ec0:	78f0      	ldrb	r0, [r6, #3]
  400ec2:	490d      	ldr	r1, [pc, #52]	(400ef8 <??process_incoming_msg_0+0x10>)
  400ec4:	7809      	ldrb	r1, [r1, #0]
  400ec6:	4281      	cmp	r1, r0
  400ec8:	d006      	beq.n	400ed8 <??process_incoming_msg_3>
  400eca:	490b      	ldr	r1, [pc, #44]	(400ef8 <??process_incoming_msg_0+0x10>)
  400ecc:	7008      	strb	r0, [r1, #0]
  400ece:	2211      	movs	r2, #17
  400ed0:	4669      	mov	r1, sp
  400ed2:	2000      	movs	r0, #0
  400ed4:	f402 f8d0 	bl	3078 <UartWriteData>

00400ed8 <??process_incoming_msg_3>:
  400ed8:	4808      	ldr	r0, [pc, #32]	(400efc <??process_incoming_msg_0+0x14>)
  400eda:	7800      	ldrb	r0, [r0, #0]
  400edc:	f000 f9da 	bl	401294 <DisplaySensorValue>

00400ee0 <??process_incoming_msg_1>:
  400ee0:	b005      	add	sp, #20
  400ee2:	bcf0      	pop	{r4, r5, r6, r7}
  400ee4:	bc08      	pop	{r3}
  400ee6:	4718      	bx	r3

00400ee8 <??process_incoming_msg_0>:
  400ee8:	508c 0040 5062 0040 5054 0040 5069 0040     .P@.bP@.TP@.iP@.
  400ef8:	506c 0040 5064 0040                         lP@.dP@.

00400f00 <DisplayFreescaleLogo>:
  400f00:	b5f0      	push	{r4, r5, r6, r7, lr}
  400f02:	b083      	sub	sp, #12
  400f04:	0005      	lsls	r5, r0, #0
  400f06:	000c      	lsls	r4, r1, #0
  400f08:	4668      	mov	r0, sp
  400f0a:	4976      	ldr	r1, [pc, #472]	(4010e4 <??DisplayFreescaleLogo_0>)
  400f0c:	c94c      	ldmia	r1!, {r2, r3, r6}
  400f0e:	c04c      	stmia	r0!, {r2, r3, r6}
  400f10:	2600      	movs	r6, #0

00400f12 <??DisplayFreescaleLogo_1>:
  400f12:	2201      	movs	r2, #1
  400f14:	0621      	lsls	r1, r4, #24
  400f16:	0e09      	lsrs	r1, r1, #24
  400f18:	0628      	lsls	r0, r5, #24
  400f1a:	0e00      	lsrs	r0, r0, #24
  400f1c:	f000 fffa 	bl	401f14 <LCD_WritePixel>
  400f20:	1c67      	adds	r7, r4, #1
  400f22:	2201      	movs	r2, #1
  400f24:	0639      	lsls	r1, r7, #24
  400f26:	0e09      	lsrs	r1, r1, #24
  400f28:	0628      	lsls	r0, r5, #24
  400f2a:	0e00      	lsrs	r0, r0, #24
  400f2c:	f000 fff2 	bl	401f14 <LCD_WritePixel>
  400f30:	2201      	movs	r2, #1
  400f32:	0639      	lsls	r1, r7, #24
  400f34:	0e09      	lsrs	r1, r1, #24
  400f36:	1c68      	adds	r0, r5, #1
  400f38:	0600      	lsls	r0, r0, #24
  400f3a:	0e00      	lsrs	r0, r0, #24
  400f3c:	f000 ffea 	bl	401f14 <LCD_WritePixel>
  400f40:	2201      	movs	r2, #1
  400f42:	0639      	lsls	r1, r7, #24
  400f44:	0e09      	lsrs	r1, r1, #24
  400f46:	1e68      	subs	r0, r5, #1
  400f48:	0600      	lsls	r0, r0, #24
  400f4a:	0e00      	lsrs	r0, r0, #24
  400f4c:	f000 ffe2 	bl	401f14 <LCD_WritePixel>
  400f50:	1ca7      	adds	r7, r4, #2
  400f52:	2201      	movs	r2, #1
  400f54:	0639      	lsls	r1, r7, #24
  400f56:	0e09      	lsrs	r1, r1, #24
  400f58:	1ea8      	subs	r0, r5, #2
  400f5a:	0600      	lsls	r0, r0, #24
  400f5c:	0e00      	lsrs	r0, r0, #24
  400f5e:	f000 ffd9 	bl	401f14 <LCD_WritePixel>
  400f62:	2201      	movs	r2, #1
  400f64:	0639      	lsls	r1, r7, #24
  400f66:	0e09      	lsrs	r1, r1, #24
  400f68:	1e68      	subs	r0, r5, #1
  400f6a:	0600      	lsls	r0, r0, #24
  400f6c:	0e00      	lsrs	r0, r0, #24
  400f6e:	f000 ffd1 	bl	401f14 <LCD_WritePixel>
  400f72:	2201      	movs	r2, #1
  400f74:	0639      	lsls	r1, r7, #24
  400f76:	0e09      	lsrs	r1, r1, #24
  400f78:	0628      	lsls	r0, r5, #24
  400f7a:	0e00      	lsrs	r0, r0, #24
  400f7c:	f000 ffca 	bl	401f14 <LCD_WritePixel>
  400f80:	2201      	movs	r2, #1
  400f82:	0639      	lsls	r1, r7, #24
  400f84:	0e09      	lsrs	r1, r1, #24
  400f86:	1c68      	adds	r0, r5, #1
  400f88:	0600      	lsls	r0, r0, #24
  400f8a:	0e00      	lsrs	r0, r0, #24
  400f8c:	f000 ffc2 	bl	401f14 <LCD_WritePixel>
  400f90:	2201      	movs	r2, #1
  400f92:	0639      	lsls	r1, r7, #24
  400f94:	0e09      	lsrs	r1, r1, #24
  400f96:	1ca8      	adds	r0, r5, #2
  400f98:	0600      	lsls	r0, r0, #24
  400f9a:	0e00      	lsrs	r0, r0, #24
  400f9c:	f000 ffba 	bl	401f14 <LCD_WritePixel>
  400fa0:	2201      	movs	r2, #1
  400fa2:	1ce1      	adds	r1, r4, #3
  400fa4:	0609      	lsls	r1, r1, #24
  400fa6:	0e09      	lsrs	r1, r1, #24
  400fa8:	1ee8      	subs	r0, r5, #3
  400faa:	0600      	lsls	r0, r0, #24
  400fac:	0e00      	lsrs	r0, r0, #24
  400fae:	f000 ffb1 	bl	401f14 <LCD_WritePixel>
  400fb2:	2201      	movs	r2, #1
  400fb4:	1ce1      	adds	r1, r4, #3
  400fb6:	0609      	lsls	r1, r1, #24
  400fb8:	0e09      	lsrs	r1, r1, #24
  400fba:	1ea8      	subs	r0, r5, #2
  400fbc:	0600      	lsls	r0, r0, #24
  400fbe:	0e00      	lsrs	r0, r0, #24
  400fc0:	f000 ffa8 	bl	401f14 <LCD_WritePixel>
  400fc4:	2201      	movs	r2, #1
  400fc6:	1ce1      	adds	r1, r4, #3
  400fc8:	0609      	lsls	r1, r1, #24
  400fca:	0e09      	lsrs	r1, r1, #24
  400fcc:	1e68      	subs	r0, r5, #1
  400fce:	0600      	lsls	r0, r0, #24
  400fd0:	0e00      	lsrs	r0, r0, #24
  400fd2:	f000 ff9f 	bl	401f14 <LCD_WritePixel>
  400fd6:	2201      	movs	r2, #1
  400fd8:	1ce1      	adds	r1, r4, #3
  400fda:	0609      	lsls	r1, r1, #24
  400fdc:	0e09      	lsrs	r1, r1, #24
  400fde:	0628      	lsls	r0, r5, #24
  400fe0:	0e00      	lsrs	r0, r0, #24
  400fe2:	f000 ff97 	bl	401f14 <LCD_WritePixel>
  400fe6:	2201      	movs	r2, #1
  400fe8:	1ce1      	adds	r1, r4, #3
  400fea:	0609      	lsls	r1, r1, #24
  400fec:	0e09      	lsrs	r1, r1, #24
  400fee:	1c68      	adds	r0, r5, #1
  400ff0:	0600      	lsls	r0, r0, #24
  400ff2:	0e00      	lsrs	r0, r0, #24
  400ff4:	f000 ff8e 	bl	401f14 <LCD_WritePixel>
  400ff8:	1d27      	adds	r7, r4, #4
  400ffa:	2201      	movs	r2, #1
  400ffc:	0639      	lsls	r1, r7, #24
  400ffe:	0e09      	lsrs	r1, r1, #24
  401000:	1f28      	subs	r0, r5, #4
  401002:	0600      	lsls	r0, r0, #24
  401004:	0e00      	lsrs	r0, r0, #24
  401006:	f000 ff85 	bl	401f14 <LCD_WritePixel>
  40100a:	2201      	movs	r2, #1
  40100c:	0639      	lsls	r1, r7, #24
  40100e:	0e09      	lsrs	r1, r1, #24
  401010:	1ee8      	subs	r0, r5, #3
  401012:	0600      	lsls	r0, r0, #24
  401014:	0e00      	lsrs	r0, r0, #24
  401016:	f000 ff7d 	bl	401f14 <LCD_WritePixel>
  40101a:	2201      	movs	r2, #1
  40101c:	0639      	lsls	r1, r7, #24
  40101e:	0e09      	lsrs	r1, r1, #24
  401020:	1ea8      	subs	r0, r5, #2
  401022:	0600      	lsls	r0, r0, #24
  401024:	0e00      	lsrs	r0, r0, #24
  401026:	f000 ff75 	bl	401f14 <LCD_WritePixel>
  40102a:	2201      	movs	r2, #1
  40102c:	0639      	lsls	r1, r7, #24
  40102e:	0e09      	lsrs	r1, r1, #24
  401030:	1e68      	subs	r0, r5, #1
  401032:	0600      	lsls	r0, r0, #24
  401034:	0e00      	lsrs	r0, r0, #24
  401036:	f000 ff6d 	bl	401f14 <LCD_WritePixel>
  40103a:	2201      	movs	r2, #1
  40103c:	0639      	lsls	r1, r7, #24
  40103e:	0e09      	lsrs	r1, r1, #24
  401040:	0628      	lsls	r0, r5, #24
  401042:	0e00      	lsrs	r0, r0, #24
  401044:	f000 ff66 	bl	401f14 <LCD_WritePixel>
  401048:	1d67      	adds	r7, r4, #5
  40104a:	2201      	movs	r2, #1
  40104c:	0639      	lsls	r1, r7, #24
  40104e:	0e09      	lsrs	r1, r1, #24
  401050:	1ee8      	subs	r0, r5, #3
  401052:	0600      	lsls	r0, r0, #24
  401054:	0e00      	lsrs	r0, r0, #24
  401056:	f000 ff5d 	bl	401f14 <LCD_WritePixel>
  40105a:	2201      	movs	r2, #1
  40105c:	0639      	lsls	r1, r7, #24
  40105e:	0e09      	lsrs	r1, r1, #24
  401060:	1ea8      	subs	r0, r5, #2
  401062:	0600      	lsls	r0, r0, #24
  401064:	0e00      	lsrs	r0, r0, #24
  401066:	f000 ff55 	bl	401f14 <LCD_WritePixel>
  40106a:	2201      	movs	r2, #1
  40106c:	0639      	lsls	r1, r7, #24
  40106e:	0e09      	lsrs	r1, r1, #24
  401070:	1e68      	subs	r0, r5, #1
  401072:	0600      	lsls	r0, r0, #24
  401074:	0e00      	lsrs	r0, r0, #24
  401076:	f000 ff4d 	bl	401f14 <LCD_WritePixel>
  40107a:	1da7      	adds	r7, r4, #6
  40107c:	2201      	movs	r2, #1
  40107e:	0639      	lsls	r1, r7, #24
  401080:	0e09      	lsrs	r1, r1, #24
  401082:	1ea8      	subs	r0, r5, #2
  401084:	0600      	lsls	r0, r0, #24
  401086:	0e00      	lsrs	r0, r0, #24
  401088:	f000 ff44 	bl	401f14 <LCD_WritePixel>
  40108c:	2e02      	cmp	r6, #2
  40108e:	d003      	beq.n	401098 <??DisplayFreescaleLogo_2>
  401090:	2e04      	cmp	r6, #4
  401092:	d004      	beq.n	40109e <??DisplayFreescaleLogo_3>
  401094:	2e06      	cmp	r6, #6
  401096:	d105      	bne.n	4010a4 <??DisplayFreescaleLogo_4>

00401098 <??DisplayFreescaleLogo_2>:
  401098:	003c      	lsls	r4, r7, #0
  40109a:	1fad      	subs	r5, r5, #6
  40109c:	e004      	b.n	4010a8 <??DisplayFreescaleLogo_5>

0040109e <??DisplayFreescaleLogo_3>:
  40109e:	1ce4      	adds	r4, r4, #3
  4010a0:	3d09      	subs	r5, #9
  4010a2:	e001      	b.n	4010a8 <??DisplayFreescaleLogo_5>

004010a4 <??DisplayFreescaleLogo_4>:
  4010a4:	1ce4      	adds	r4, r4, #3
  4010a6:	1d2d      	adds	r5, r5, #4

004010a8 <??DisplayFreescaleLogo_5>:
  4010a8:	1c76      	adds	r6, r6, #1
  4010aa:	2e08      	cmp	r6, #8
  4010ac:	da00      	bge.n	4010b0 <??DisplayFreescaleLogo_5+0x8>
  4010ae:	e730      	b.n	400f12 <??DisplayFreescaleLogo_1>
  4010b0:	2001      	movs	r0, #1
  4010b2:	f000 ff15 	bl	401ee0 <LCD_SetFont>
  4010b6:	3c14      	subs	r4, #20
  4010b8:	0027      	lsls	r7, r4, #0
  4010ba:	350f      	adds	r5, #15
  4010bc:	466e      	mov	r6, sp
  4010be:	2409      	movs	r4, #9

004010c0 <??DisplayFreescaleLogo_6>:
  4010c0:	063a      	lsls	r2, r7, #24
  4010c2:	0e12      	lsrs	r2, r2, #24
  4010c4:	0629      	lsls	r1, r5, #24
  4010c6:	0e09      	lsrs	r1, r1, #24
  4010c8:	7830      	ldrb	r0, [r6, #0]
  4010ca:	f000 ffb7 	bl	40203c <LCD_WriteCharacter>
  4010ce:	1dad      	adds	r5, r5, #6
  4010d0:	1c76      	adds	r6, r6, #1
  4010d2:	1e64      	subs	r4, r4, #1
  4010d4:	d1f4      	bne.n	4010c0 <??DisplayFreescaleLogo_6>
  4010d6:	2000      	movs	r0, #0
  4010d8:	f000 ff02 	bl	401ee0 <LCD_SetFont>
  4010dc:	b003      	add	sp, #12
  4010de:	bcf0      	pop	{r4, r5, r6, r7}
  4010e0:	bc08      	pop	{r3}
  4010e2:	4718      	bx	r3

004010e4 <??DisplayFreescaleLogo_0>:
  4010e4:	3d28 0040                                   (=@.

004010e8 <ClearFreescaleLogo>:
  4010e8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  4010ea:	0005      	lsls	r5, r0, #0
  4010ec:	000c      	lsls	r4, r1, #0
  4010ee:	2600      	movs	r6, #0

004010f0 <??ClearFreescaleLogo_0>:
  4010f0:	2200      	movs	r2, #0
  4010f2:	0621      	lsls	r1, r4, #24
  4010f4:	0e09      	lsrs	r1, r1, #24
  4010f6:	0628      	lsls	r0, r5, #24
  4010f8:	0e00      	lsrs	r0, r0, #24
  4010fa:	f000 ff0b 	bl	401f14 <LCD_WritePixel>
  4010fe:	1c67      	adds	r7, r4, #1
  401100:	2200      	movs	r2, #0
  401102:	0639      	lsls	r1, r7, #24
  401104:	0e09      	lsrs	r1, r1, #24
  401106:	0628      	lsls	r0, r5, #24
  401108:	0e00      	lsrs	r0, r0, #24
  40110a:	f000 ff03 	bl	401f14 <LCD_WritePixel>
  40110e:	2200      	movs	r2, #0
  401110:	0639      	lsls	r1, r7, #24
  401112:	0e09      	lsrs	r1, r1, #24
  401114:	1c68      	adds	r0, r5, #1
  401116:	0600      	lsls	r0, r0, #24
  401118:	0e00      	lsrs	r0, r0, #24
  40111a:	f000 fefb 	bl	401f14 <LCD_WritePixel>
  40111e:	2200      	movs	r2, #0
  401120:	0639      	lsls	r1, r7, #24
  401122:	0e09      	lsrs	r1, r1, #24
  401124:	1e68      	subs	r0, r5, #1
  401126:	0600      	lsls	r0, r0, #24
  401128:	0e00      	lsrs	r0, r0, #24
  40112a:	f000 fef3 	bl	401f14 <LCD_WritePixel>
  40112e:	1ca7      	adds	r7, r4, #2
  401130:	2200      	movs	r2, #0
  401132:	0639      	lsls	r1, r7, #24
  401134:	0e09      	lsrs	r1, r1, #24
  401136:	1ea8      	subs	r0, r5, #2
  401138:	0600      	lsls	r0, r0, #24
  40113a:	0e00      	lsrs	r0, r0, #24
  40113c:	f000 feea 	bl	401f14 <LCD_WritePixel>
  401140:	2200      	movs	r2, #0
  401142:	0639      	lsls	r1, r7, #24
  401144:	0e09      	lsrs	r1, r1, #24
  401146:	1e68      	subs	r0, r5, #1
  401148:	0600      	lsls	r0, r0, #24
  40114a:	0e00      	lsrs	r0, r0, #24
  40114c:	f000 fee2 	bl	401f14 <LCD_WritePixel>
  401150:	2200      	movs	r2, #0
  401152:	0639      	lsls	r1, r7, #24
  401154:	0e09      	lsrs	r1, r1, #24
  401156:	0628      	lsls	r0, r5, #24
  401158:	0e00      	lsrs	r0, r0, #24
  40115a:	f000 fedb 	bl	401f14 <LCD_WritePixel>
  40115e:	2200      	movs	r2, #0
  401160:	0639      	lsls	r1, r7, #24
  401162:	0e09      	lsrs	r1, r1, #24
  401164:	1c68      	adds	r0, r5, #1
  401166:	0600      	lsls	r0, r0, #24
  401168:	0e00      	lsrs	r0, r0, #24
  40116a:	f000 fed3 	bl	401f14 <LCD_WritePixel>
  40116e:	2200      	movs	r2, #0
  401170:	0639      	lsls	r1, r7, #24
  401172:	0e09      	lsrs	r1, r1, #24
  401174:	1ca8      	adds	r0, r5, #2
  401176:	0600      	lsls	r0, r0, #24
  401178:	0e00      	lsrs	r0, r0, #24
  40117a:	f000 fecb 	bl	401f14 <LCD_WritePixel>
  40117e:	2200      	movs	r2, #0
  401180:	1ce1      	adds	r1, r4, #3
  401182:	0609      	lsls	r1, r1, #24
  401184:	0e09      	lsrs	r1, r1, #24
  401186:	1ee8      	subs	r0, r5, #3
  401188:	0600      	lsls	r0, r0, #24
  40118a:	0e00      	lsrs	r0, r0, #24
  40118c:	f000 fec2 	bl	401f14 <LCD_WritePixel>
  401190:	2200      	movs	r2, #0
  401192:	1ce1      	adds	r1, r4, #3
  401194:	0609      	lsls	r1, r1, #24
  401196:	0e09      	lsrs	r1, r1, #24
  401198:	1ea8      	subs	r0, r5, #2
  40119a:	0600      	lsls	r0, r0, #24
  40119c:	0e00      	lsrs	r0, r0, #24
  40119e:	f000 feb9 	bl	401f14 <LCD_WritePixel>
  4011a2:	2200      	movs	r2, #0
  4011a4:	1ce1      	adds	r1, r4, #3
  4011a6:	0609      	lsls	r1, r1, #24
  4011a8:	0e09      	lsrs	r1, r1, #24
  4011aa:	1e68      	subs	r0, r5, #1
  4011ac:	0600      	lsls	r0, r0, #24
  4011ae:	0e00      	lsrs	r0, r0, #24
  4011b0:	f000 feb0 	bl	401f14 <LCD_WritePixel>
  4011b4:	2200      	movs	r2, #0
  4011b6:	1ce1      	adds	r1, r4, #3
  4011b8:	0609      	lsls	r1, r1, #24
  4011ba:	0e09      	lsrs	r1, r1, #24
  4011bc:	0628      	lsls	r0, r5, #24
  4011be:	0e00      	lsrs	r0, r0, #24
  4011c0:	f000 fea8 	bl	401f14 <LCD_WritePixel>
  4011c4:	2200      	movs	r2, #0
  4011c6:	1ce1      	adds	r1, r4, #3
  4011c8:	0609      	lsls	r1, r1, #24
  4011ca:	0e09      	lsrs	r1, r1, #24
  4011cc:	1c68      	adds	r0, r5, #1
  4011ce:	0600      	lsls	r0, r0, #24
  4011d0:	0e00      	lsrs	r0, r0, #24
  4011d2:	f000 fe9f 	bl	401f14 <LCD_WritePixel>
  4011d6:	1d27      	adds	r7, r4, #4
  4011d8:	2200      	movs	r2, #0
  4011da:	0639      	lsls	r1, r7, #24
  4011dc:	0e09      	lsrs	r1, r1, #24
  4011de:	1f28      	subs	r0, r5, #4
  4011e0:	0600      	lsls	r0, r0, #24
  4011e2:	0e00      	lsrs	r0, r0, #24
  4011e4:	f000 fe96 	bl	401f14 <LCD_WritePixel>
  4011e8:	2200      	movs	r2, #0
  4011ea:	0639      	lsls	r1, r7, #24
  4011ec:	0e09      	lsrs	r1, r1, #24
  4011ee:	1ee8      	subs	r0, r5, #3
  4011f0:	0600      	lsls	r0, r0, #24
  4011f2:	0e00      	lsrs	r0, r0, #24
  4011f4:	f000 fe8e 	bl	401f14 <LCD_WritePixel>
  4011f8:	2200      	movs	r2, #0
  4011fa:	0639      	lsls	r1, r7, #24
  4011fc:	0e09      	lsrs	r1, r1, #24
  4011fe:	1ea8      	subs	r0, r5, #2
  401200:	0600      	lsls	r0, r0, #24
  401202:	0e00      	lsrs	r0, r0, #24
  401204:	f000 fe86 	bl	401f14 <LCD_WritePixel>
  401208:	2200      	movs	r2, #0
  40120a:	0639      	lsls	r1, r7, #24
  40120c:	0e09      	lsrs	r1, r1, #24
  40120e:	1e68      	subs	r0, r5, #1
  401210:	0600      	lsls	r0, r0, #24
  401212:	0e00      	lsrs	r0, r0, #24
  401214:	f000 fe7e 	bl	401f14 <LCD_WritePixel>
  401218:	2200      	movs	r2, #0
  40121a:	0639      	lsls	r1, r7, #24
  40121c:	0e09      	lsrs	r1, r1, #24
  40121e:	0628      	lsls	r0, r5, #24
  401220:	0e00      	lsrs	r0, r0, #24
  401222:	f000 fe77 	bl	401f14 <LCD_WritePixel>
  401226:	1d67      	adds	r7, r4, #5
  401228:	2200      	movs	r2, #0
  40122a:	0639      	lsls	r1, r7, #24
  40122c:	0e09      	lsrs	r1, r1, #24
  40122e:	1ee8      	subs	r0, r5, #3
  401230:	0600      	lsls	r0, r0, #24
  401232:	0e00      	lsrs	r0, r0, #24
  401234:	f000 fe6e 	bl	401f14 <LCD_WritePixel>
  401238:	2200      	movs	r2, #0
  40123a:	0639      	lsls	r1, r7, #24
  40123c:	0e09      	lsrs	r1, r1, #24
  40123e:	1ea8      	subs	r0, r5, #2
  401240:	0600      	lsls	r0, r0, #24
  401242:	0e00      	lsrs	r0, r0, #24
  401244:	f000 fe66 	bl	401f14 <LCD_WritePixel>
  401248:	2200      	movs	r2, #0
  40124a:	0639      	lsls	r1, r7, #24
  40124c:	0e09      	lsrs	r1, r1, #24
  40124e:	1e68      	subs	r0, r5, #1
  401250:	0600      	lsls	r0, r0, #24
  401252:	0e00      	lsrs	r0, r0, #24
  401254:	f000 fe5e 	bl	401f14 <LCD_WritePixel>
  401258:	1da7      	adds	r7, r4, #6
  40125a:	2200      	movs	r2, #0
  40125c:	0639      	lsls	r1, r7, #24
  40125e:	0e09      	lsrs	r1, r1, #24
  401260:	1ea8      	subs	r0, r5, #2
  401262:	0600      	lsls	r0, r0, #24
  401264:	0e00      	lsrs	r0, r0, #24
  401266:	f000 fe55 	bl	401f14 <LCD_WritePixel>
  40126a:	2e02      	cmp	r6, #2
  40126c:	d003      	beq.n	401276 <??ClearFreescaleLogo_1>
  40126e:	2e04      	cmp	r6, #4
  401270:	d004      	beq.n	40127c <??ClearFreescaleLogo_2>
  401272:	2e06      	cmp	r6, #6
  401274:	d105      	bne.n	401282 <??ClearFreescaleLogo_3>

00401276 <??ClearFreescaleLogo_1>:
  401276:	003c      	lsls	r4, r7, #0
  401278:	1fad      	subs	r5, r5, #6
  40127a:	e004      	b.n	401286 <??ClearFreescaleLogo_4>

0040127c <??ClearFreescaleLogo_2>:
  40127c:	1ce4      	adds	r4, r4, #3
  40127e:	3d09      	subs	r5, #9
  401280:	e001      	b.n	401286 <??ClearFreescaleLogo_4>

00401282 <??ClearFreescaleLogo_3>:
  401282:	1ce4      	adds	r4, r4, #3
  401284:	1d2d      	adds	r5, r5, #4

00401286 <??ClearFreescaleLogo_4>:
  401286:	1c76      	adds	r6, r6, #1
  401288:	2e08      	cmp	r6, #8
  40128a:	da00      	bge.n	40128e <??ClearFreescaleLogo_4+0x8>
  40128c:	e730      	b.n	4010f0 <??ClearFreescaleLogo_0>
  40128e:	bcf1      	pop	{r0, r4, r5, r6, r7}
  401290:	bc08      	pop	{r3}
  401292:	4718      	bx	r3

00401294 <DisplaySensorValue>:
  401294:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  401296:	0007      	lsls	r7, r0, #0
  401298:	4d96      	ldr	r5, [pc, #600]	(4014f4 <??DisplaySensorValue_0>)
  40129a:	0029      	lsls	r1, r5, #0
  40129c:	2000      	movs	r0, #0
  40129e:	f000 fbbb 	bl	401a18 <LCD_WriteString_NormalFont>
  4012a2:	2400      	movs	r4, #0

004012a4 <??DisplaySensorValue_1>:
  4012a4:	2201      	movs	r2, #1
  4012a6:	210a      	movs	r1, #10
  4012a8:	0620      	lsls	r0, r4, #24
  4012aa:	0e00      	lsrs	r0, r0, #24
  4012ac:	f000 fe32 	bl	401f14 <LCD_WritePixel>
  4012b0:	2201      	movs	r2, #1
  4012b2:	210b      	movs	r1, #11
  4012b4:	0620      	lsls	r0, r4, #24
  4012b6:	0e00      	lsrs	r0, r0, #24
  4012b8:	f000 fe2c 	bl	401f14 <LCD_WritePixel>
  4012bc:	1c64      	adds	r4, r4, #1
  4012be:	2c64      	cmp	r4, #100
  4012c0:	dbf0      	blt.n	4012a4 <??DisplaySensorValue_1>
  4012c2:	4e8d      	ldr	r6, [pc, #564]	(4014f8 <??DisplaySensorValue_0+0x4>)
  4012c4:	2301      	movs	r3, #1
  4012c6:	2207      	movs	r2, #7
  4012c8:	7d71      	ldrb	r1, [r6, #21]
  4012ca:	310b      	adds	r1, #11
  4012cc:	0409      	lsls	r1, r1, #16
  4012ce:	0c09      	lsrs	r1, r1, #16
  4012d0:	a08a      	add	r0, pc, #552	(adr r0, 4014fc <??DisplaySensorValue_0+0x8>)
  4012d2:	f000 fbd9 	bl	401a88 <LCD_WriteStringValue>
  4012d6:	1f7f      	subs	r7, r7, #5
  4012d8:	d00a      	beq.n	4012f0 <??DisplaySensorValue_2>
  4012da:	1ebf      	subs	r7, r7, #2
  4012dc:	d011      	beq.n	401302 <??DisplaySensorValue_3>
  4012de:	1ebf      	subs	r7, r7, #2
  4012e0:	d05b      	beq.n	40139a <??DisplaySensorValue_4>
  4012e2:	1ebf      	subs	r7, r7, #2
  4012e4:	d100      	bne.n	4012e8 <??DisplaySensorValue_1+0x44>
  4012e6:	e09f      	b.n	401428 <??DisplaySensorValue_5>
  4012e8:	1ebf      	subs	r7, r7, #2
  4012ea:	d100      	bne.n	4012ee <??DisplaySensorValue_1+0x4a>
  4012ec:	e0ed      	b.n	4014ca <??DisplaySensorValue_6>
  4012ee:	e0fd      	b.n	4014ec <??DisplaySensorValue_7>

004012f0 <??DisplaySensorValue_2>:
  4012f0:	3514      	adds	r5, #20
  4012f2:	0029      	lsls	r1, r5, #0
  4012f4:	2002      	movs	r0, #2
  4012f6:	f000 fb8f 	bl	401a18 <LCD_WriteString_NormalFont>
  4012fa:	2004      	movs	r0, #4
  4012fc:	f000 f902 	bl	401504 <DisplayWindDir>
  401300:	e0f4      	b.n	4014ec <??DisplaySensorValue_7>

00401302 <??DisplaySensorValue_3>:
  401302:	0029      	lsls	r1, r5, #0
  401304:	3128      	adds	r1, #40
  401306:	2002      	movs	r0, #2
  401308:	f000 fb86 	bl	401a18 <LCD_WriteString_NormalFont>
  40130c:	7cf0      	ldrb	r0, [r6, #19]
  40130e:	2801      	cmp	r0, #1
  401310:	d10c      	bne.n	40132c <??DisplaySensorValue_8>
  401312:	8d31      	ldrh	r1, [r6, #40]
  401314:	0a08      	lsrs	r0, r1, #8
  401316:	2864      	cmp	r0, #100
  401318:	d204      	bcs.n	401324 <??DisplaySensorValue_9>
  40131a:	2301      	movs	r3, #1
  40131c:	2204      	movs	r2, #4
  40131e:	353c      	adds	r5, #60
  401320:	0028      	lsls	r0, r5, #0
  401322:	e00f      	b.n	401344 <??DisplaySensorValue_10>

00401324 <??DisplaySensorValue_9>:
  401324:	2301      	movs	r3, #1
  401326:	2204      	movs	r2, #4
  401328:	a075      	add	r0, pc, #468	(adr r0, 401500 <??DisplaySensorValue_0+0xc>)
  40132a:	e00b      	b.n	401344 <??DisplaySensorValue_10>

0040132c <??DisplaySensorValue_8>:
  40132c:	8c71      	ldrh	r1, [r6, #34]
  40132e:	0a08      	lsrs	r0, r1, #8
  401330:	2864      	cmp	r0, #100
  401332:	d204      	bcs.n	40133e <??DisplaySensorValue_11>
  401334:	2301      	movs	r3, #1
  401336:	2204      	movs	r2, #4
  401338:	353c      	adds	r5, #60
  40133a:	0028      	lsls	r0, r5, #0
  40133c:	e002      	b.n	401344 <??DisplaySensorValue_10>

0040133e <??DisplaySensorValue_11>:
  40133e:	2301      	movs	r3, #1
  401340:	2204      	movs	r2, #4
  401342:	a06f      	add	r0, pc, #444	(adr r0, 401500 <??DisplaySensorValue_0+0xc>)

00401344 <??DisplaySensorValue_10>:
  401344:	f000 fc74 	bl	401c30 <LCD_WriteStringDecValue>
  401348:	7cf0      	ldrb	r0, [r6, #19]
  40134a:	2801      	cmp	r0, #1
  40134c:	d112      	bne.n	401374 <??DisplaySensorValue_12>
  40134e:	2220      	movs	r2, #32
  401350:	2139      	movs	r1, #57
  401352:	204d      	movs	r0, #77
  401354:	f000 fe72 	bl	40203c <LCD_WriteCharacter>
  401358:	2220      	movs	r2, #32
  40135a:	213f      	movs	r1, #63
  40135c:	202f      	movs	r0, #47
  40135e:	f000 fe6d 	bl	40203c <LCD_WriteCharacter>
  401362:	2220      	movs	r2, #32
  401364:	2145      	movs	r1, #69
  401366:	2068      	movs	r0, #104
  401368:	f000 fe68 	bl	40203c <LCD_WriteCharacter>
  40136c:	2220      	movs	r2, #32
  40136e:	214b      	movs	r1, #75
  401370:	2020      	movs	r0, #32
  401372:	e0b9      	b.n	4014e8 <??DisplaySensorValue_13>

00401374 <??DisplaySensorValue_12>:
  401374:	2220      	movs	r2, #32
  401376:	2139      	movs	r1, #57
  401378:	204b      	movs	r0, #75
  40137a:	f000 fe5f 	bl	40203c <LCD_WriteCharacter>
  40137e:	2220      	movs	r2, #32
  401380:	213f      	movs	r1, #63
  401382:	206d      	movs	r0, #109
  401384:	f000 fe5a 	bl	40203c <LCD_WriteCharacter>
  401388:	2220      	movs	r2, #32
  40138a:	2145      	movs	r1, #69
  40138c:	202f      	movs	r0, #47
  40138e:	f000 fe55 	bl	40203c <LCD_WriteCharacter>
  401392:	2220      	movs	r2, #32
  401394:	214b      	movs	r1, #75
  401396:	2068      	movs	r0, #104
  401398:	e0a6      	b.n	4014e8 <??DisplaySensorValue_13>

0040139a <??DisplaySensorValue_4>:
  40139a:	0029      	lsls	r1, r5, #0
  40139c:	3144      	adds	r1, #68
  40139e:	2002      	movs	r0, #2
  4013a0:	f000 fb3a 	bl	401a18 <LCD_WriteString_NormalFont>
  4013a4:	7cf0      	ldrb	r0, [r6, #19]
  4013a6:	2801      	cmp	r0, #1
  4013a8:	d10c      	bne.n	4013c4 <??DisplaySensorValue_14>
  4013aa:	8cf1      	ldrh	r1, [r6, #38]
  4013ac:	0a08      	lsrs	r0, r1, #8
  4013ae:	2864      	cmp	r0, #100
  4013b0:	d204      	bcs.n	4013bc <??DisplaySensorValue_15>
  4013b2:	2301      	movs	r3, #1
  4013b4:	2204      	movs	r2, #4
  4013b6:	353c      	adds	r5, #60
  4013b8:	0028      	lsls	r0, r5, #0
  4013ba:	e00f      	b.n	4013dc <??DisplaySensorValue_16>

004013bc <??DisplaySensorValue_15>:
  4013bc:	2301      	movs	r3, #1
  4013be:	2204      	movs	r2, #4
  4013c0:	a04f      	add	r0, pc, #316	(adr r0, 401500 <??DisplaySensorValue_0+0xc>)
  4013c2:	e00b      	b.n	4013dc <??DisplaySensorValue_16>

004013c4 <??DisplaySensorValue_14>:
  4013c4:	8c31      	ldrh	r1, [r6, #32]
  4013c6:	0a08      	lsrs	r0, r1, #8
  4013c8:	2864      	cmp	r0, #100
  4013ca:	d204      	bcs.n	4013d6 <??DisplaySensorValue_17>
  4013cc:	2301      	movs	r3, #1
  4013ce:	2204      	movs	r2, #4
  4013d0:	353c      	adds	r5, #60
  4013d2:	0028      	lsls	r0, r5, #0
  4013d4:	e002      	b.n	4013dc <??DisplaySensorValue_16>

004013d6 <??DisplaySensorValue_17>:
  4013d6:	2301      	movs	r3, #1
  4013d8:	2204      	movs	r2, #4
  4013da:	a049      	add	r0, pc, #292	(adr r0, 401500 <??DisplaySensorValue_0+0xc>)

004013dc <??DisplaySensorValue_16>:
  4013dc:	f000 fc28 	bl	401c30 <LCD_WriteStringDecValue>
  4013e0:	7cf0      	ldrb	r0, [r6, #19]
  4013e2:	2801      	cmp	r0, #1
  4013e4:	d10d      	bne.n	401402 <??DisplaySensorValue_18>
  4013e6:	2220      	movs	r2, #32
  4013e8:	2138      	movs	r1, #56
  4013ea:	2050      	movs	r0, #80
  4013ec:	f000 fe26 	bl	40203c <LCD_WriteCharacter>
  4013f0:	2220      	movs	r2, #32
  4013f2:	213e      	movs	r1, #62
  4013f4:	2053      	movs	r0, #83
  4013f6:	f000 fe21 	bl	40203c <LCD_WriteCharacter>
  4013fa:	2220      	movs	r2, #32
  4013fc:	2144      	movs	r1, #68
  4013fe:	2049      	movs	r0, #73
  401400:	e072      	b.n	4014e8 <??DisplaySensorValue_13>

00401402 <??DisplaySensorValue_18>:
  401402:	2220      	movs	r2, #32
  401404:	2138      	movs	r1, #56
  401406:	206d      	movs	r0, #109
  401408:	f000 fe18 	bl	40203c <LCD_WriteCharacter>
  40140c:	2220      	movs	r2, #32
  40140e:	213e      	movs	r1, #62
  401410:	2062      	movs	r0, #98
  401412:	f000 fe13 	bl	40203c <LCD_WriteCharacter>
  401416:	2220      	movs	r2, #32
  401418:	2144      	movs	r1, #68
  40141a:	2061      	movs	r0, #97
  40141c:	f000 fe0e 	bl	40203c <LCD_WriteCharacter>
  401420:	2220      	movs	r2, #32
  401422:	214a      	movs	r1, #74
  401424:	2072      	movs	r0, #114
  401426:	e05f      	b.n	4014e8 <??DisplaySensorValue_13>

00401428 <??DisplaySensorValue_5>:
  401428:	0029      	lsls	r1, r5, #0
  40142a:	3154      	adds	r1, #84
  40142c:	2002      	movs	r0, #2
  40142e:	f000 faf3 	bl	401a18 <LCD_WriteString_NormalFont>
  401432:	7cf0      	ldrb	r0, [r6, #19]
  401434:	2801      	cmp	r0, #1
  401436:	d10c      	bne.n	401452 <??DisplaySensorValue_19>
  401438:	8cb1      	ldrh	r1, [r6, #36]
  40143a:	0a08      	lsrs	r0, r1, #8
  40143c:	2864      	cmp	r0, #100
  40143e:	d204      	bcs.n	40144a <??DisplaySensorValue_20>
  401440:	2301      	movs	r3, #1
  401442:	2204      	movs	r2, #4
  401444:	353c      	adds	r5, #60
  401446:	0028      	lsls	r0, r5, #0
  401448:	e00f      	b.n	40146a <??DisplaySensorValue_21>

0040144a <??DisplaySensorValue_20>:
  40144a:	2301      	movs	r3, #1
  40144c:	2204      	movs	r2, #4
  40144e:	a02c      	add	r0, pc, #176	(adr r0, 401500 <??DisplaySensorValue_0+0xc>)
  401450:	e00b      	b.n	40146a <??DisplaySensorValue_21>

00401452 <??DisplaySensorValue_19>:
  401452:	8bf1      	ldrh	r1, [r6, #30]
  401454:	0a08      	lsrs	r0, r1, #8
  401456:	2864      	cmp	r0, #100
  401458:	d204      	bcs.n	401464 <??DisplaySensorValue_22>
  40145a:	2301      	movs	r3, #1
  40145c:	2204      	movs	r2, #4
  40145e:	353c      	adds	r5, #60
  401460:	0028      	lsls	r0, r5, #0
  401462:	e002      	b.n	40146a <??DisplaySensorValue_21>

00401464 <??DisplaySensorValue_22>:
  401464:	2301      	movs	r3, #1
  401466:	2204      	movs	r2, #4
  401468:	a025      	add	r0, pc, #148	(adr r0, 401500 <??DisplaySensorValue_0+0xc>)

0040146a <??DisplaySensorValue_21>:
  40146a:	f000 fbe1 	bl	401c30 <LCD_WriteStringDecValue>
  40146e:	7df0      	ldrb	r0, [r6, #23]
  401470:	2800      	cmp	r0, #0
  401472:	d004      	beq.n	40147e <??DisplaySensorValue_23>
  401474:	2220      	movs	r2, #32
  401476:	210f      	movs	r1, #15
  401478:	202d      	movs	r0, #45
  40147a:	f000 fddf 	bl	40203c <LCD_WriteCharacter>

0040147e <??DisplaySensorValue_23>:
  40147e:	2420      	movs	r4, #32

00401480 <??DisplaySensorValue_24>:
  401480:	2201      	movs	r2, #1
  401482:	0621      	lsls	r1, r4, #24
  401484:	0e09      	lsrs	r1, r1, #24
  401486:	203a      	movs	r0, #58
  401488:	f000 fd44 	bl	401f14 <LCD_WritePixel>
  40148c:	2c21      	cmp	r4, #33
  40148e:	d102      	bne.n	401496 <??DisplaySensorValue_25>
  401490:	2200      	movs	r2, #0
  401492:	2121      	movs	r1, #33
  401494:	e002      	b.n	40149c <??DisplaySensorValue_26>

00401496 <??DisplaySensorValue_25>:
  401496:	2201      	movs	r2, #1
  401498:	0621      	lsls	r1, r4, #24
  40149a:	0e09      	lsrs	r1, r1, #24

0040149c <??DisplaySensorValue_26>:
  40149c:	203b      	movs	r0, #59
  40149e:	f000 fd39 	bl	401f14 <LCD_WritePixel>
  4014a2:	2201      	movs	r2, #1
  4014a4:	0621      	lsls	r1, r4, #24
  4014a6:	0e09      	lsrs	r1, r1, #24
  4014a8:	203c      	movs	r0, #60
  4014aa:	f000 fd33 	bl	401f14 <LCD_WritePixel>
  4014ae:	1c64      	adds	r4, r4, #1
  4014b0:	2c23      	cmp	r4, #35
  4014b2:	dbe5      	blt.n	401480 <??DisplaySensorValue_24>
  4014b4:	7cf0      	ldrb	r0, [r6, #19]
  4014b6:	2801      	cmp	r0, #1
  4014b8:	d103      	bne.n	4014c2 <??DisplaySensorValue_27>
  4014ba:	2220      	movs	r2, #32
  4014bc:	2140      	movs	r1, #64
  4014be:	2046      	movs	r0, #70
  4014c0:	e012      	b.n	4014e8 <??DisplaySensorValue_13>

004014c2 <??DisplaySensorValue_27>:
  4014c2:	2220      	movs	r2, #32
  4014c4:	2140      	movs	r1, #64
  4014c6:	2043      	movs	r0, #67
  4014c8:	e00e      	b.n	4014e8 <??DisplaySensorValue_13>

004014ca <??DisplaySensorValue_6>:
  4014ca:	0029      	lsls	r1, r5, #0
  4014cc:	3168      	adds	r1, #104
  4014ce:	2002      	movs	r0, #2
  4014d0:	f000 faa2 	bl	401a18 <LCD_WriteString_NormalFont>
  4014d4:	2301      	movs	r3, #1
  4014d6:	2204      	movs	r2, #4
  4014d8:	8d71      	ldrh	r1, [r6, #42]
  4014da:	357c      	adds	r5, #124
  4014dc:	0028      	lsls	r0, r5, #0
  4014de:	f000 fba7 	bl	401c30 <LCD_WriteStringDecValue>
  4014e2:	2220      	movs	r2, #32
  4014e4:	213f      	movs	r1, #63
  4014e6:	2056      	movs	r0, #86

004014e8 <??DisplaySensorValue_13>:
  4014e8:	f000 fda8 	bl	40203c <LCD_WriteCharacter>

004014ec <??DisplaySensorValue_7>:
  4014ec:	bcf1      	pop	{r0, r4, r5, r6, r7}
  4014ee:	bc08      	pop	{r3}
  4014f0:	4718      	bx	r3
  4014f2:	46c0      	nop			(mov r8, r8)

004014f4 <??DisplaySensorValue_0>:
  4014f4:	3950 0040 5050 0040 4843 003a 2020 0020     P9@.PP@.CH:.   .

00401504 <DisplayWindDir>:
  401504:	b570      	push	{r4, r5, r6, lr}
  401506:	0004      	lsls	r4, r0, #0
  401508:	f000 fe2e 	bl	402168 <LCD_ClearLine>
  40150c:	4d44      	ldr	r5, [pc, #272]	(401620 <??DisplayWindDir_0>)
  40150e:	8da9      	ldrh	r1, [r5, #44]
  401510:	2917      	cmp	r1, #23
  401512:	d303      	bcc.n	40151c <??DisplayWindDir_1>
  401514:	20a9      	movs	r0, #169
  401516:	0040      	lsls	r0, r0, #1
  401518:	4281      	cmp	r1, r0
  40151a:	d30a      	bcc.n	401532 <??DisplayWindDir_2>

0040151c <??DisplayWindDir_1>:
  40151c:	4841      	ldr	r0, [pc, #260]	(401624 <??DisplayWindDir_0+0x4>)
  40151e:	2964      	cmp	r1, #100
  401520:	d302      	bcc.n	401528 <??DisplayWindDir_3>
  401522:	2301      	movs	r3, #1
  401524:	0022      	lsls	r2, r4, #0
  401526:	e002      	b.n	40152e <??DisplayWindDir_4>

00401528 <??DisplayWindDir_3>:
  401528:	2301      	movs	r3, #1
  40152a:	0022      	lsls	r2, r4, #0
  40152c:	3008      	adds	r0, #8

0040152e <??DisplayWindDir_4>:
  40152e:	f000 faab 	bl	401a88 <LCD_WriteStringValue>

00401532 <??DisplayWindDir_2>:
  401532:	8da9      	ldrh	r1, [r5, #44]
  401534:	2944      	cmp	r1, #68
  401536:	d206      	bcs.n	401546 <??DisplayWindDir_5>
  401538:	2917      	cmp	r1, #23
  40153a:	d34b      	bcc.n	4015d4 <??DisplayWindDir_6>
  40153c:	2301      	movs	r3, #1
  40153e:	0022      	lsls	r2, r4, #0
  401540:	4839      	ldr	r0, [pc, #228]	(401628 <??DisplayWindDir_0+0x8>)
  401542:	f000 faa1 	bl	401a88 <LCD_WriteStringValue>

00401546 <??DisplayWindDir_5>:
  401546:	8da9      	ldrh	r1, [r5, #44]
  401548:	2971      	cmp	r1, #113
  40154a:	d20d      	bcs.n	401568 <??DisplayWindDir_7>
  40154c:	2944      	cmp	r1, #68
  40154e:	d341      	bcc.n	4015d4 <??DisplayWindDir_6>
  401550:	4834      	ldr	r0, [pc, #208]	(401624 <??DisplayWindDir_0+0x4>)
  401552:	2964      	cmp	r1, #100
  401554:	d303      	bcc.n	40155e <??DisplayWindDir_8>
  401556:	2301      	movs	r3, #1
  401558:	0022      	lsls	r2, r4, #0
  40155a:	3020      	adds	r0, #32
  40155c:	e002      	b.n	401564 <??DisplayWindDir_9>

0040155e <??DisplayWindDir_8>:
  40155e:	2301      	movs	r3, #1
  401560:	0022      	lsls	r2, r4, #0
  401562:	3028      	adds	r0, #40

00401564 <??DisplayWindDir_9>:
  401564:	f000 fa90 	bl	401a88 <LCD_WriteStringValue>

00401568 <??DisplayWindDir_7>:
  401568:	8da9      	ldrh	r1, [r5, #44]
  40156a:	299e      	cmp	r1, #158
  40156c:	d206      	bcs.n	40157c <??DisplayWindDir_10>
  40156e:	2971      	cmp	r1, #113
  401570:	d330      	bcc.n	4015d4 <??DisplayWindDir_6>
  401572:	2301      	movs	r3, #1
  401574:	0022      	lsls	r2, r4, #0
  401576:	482d      	ldr	r0, [pc, #180]	(40162c <??DisplayWindDir_0+0xc>)
  401578:	f000 fa86 	bl	401a88 <LCD_WriteStringValue>

0040157c <??DisplayWindDir_10>:
  40157c:	8da9      	ldrh	r1, [r5, #44]
  40157e:	29cb      	cmp	r1, #203
  401580:	d206      	bcs.n	401590 <??DisplayWindDir_11>
  401582:	299e      	cmp	r1, #158
  401584:	d326      	bcc.n	4015d4 <??DisplayWindDir_6>
  401586:	2301      	movs	r3, #1
  401588:	0022      	lsls	r2, r4, #0
  40158a:	4829      	ldr	r0, [pc, #164]	(401630 <??DisplayWindDir_0+0x10>)
  40158c:	f000 fa7c 	bl	401a88 <LCD_WriteStringValue>

00401590 <??DisplayWindDir_11>:
  401590:	8da9      	ldrh	r1, [r5, #44]
  401592:	29f8      	cmp	r1, #248
  401594:	d206      	bcs.n	4015a4 <??DisplayWindDir_12>
  401596:	29cb      	cmp	r1, #203
  401598:	d31c      	bcc.n	4015d4 <??DisplayWindDir_6>
  40159a:	2301      	movs	r3, #1
  40159c:	0022      	lsls	r2, r4, #0
  40159e:	4825      	ldr	r0, [pc, #148]	(401634 <??DisplayWindDir_0+0x14>)
  4015a0:	f000 fa72 	bl	401a88 <LCD_WriteStringValue>

004015a4 <??DisplayWindDir_12>:
  4015a4:	8da9      	ldrh	r1, [r5, #44]
  4015a6:	26ff      	movs	r6, #255
  4015a8:	3626      	adds	r6, #38
  4015aa:	42b1      	cmp	r1, r6
  4015ac:	d206      	bcs.n	4015bc <??DisplayWindDir_13>
  4015ae:	29f8      	cmp	r1, #248
  4015b0:	d310      	bcc.n	4015d4 <??DisplayWindDir_6>
  4015b2:	2301      	movs	r3, #1
  4015b4:	0022      	lsls	r2, r4, #0
  4015b6:	4820      	ldr	r0, [pc, #128]	(401638 <??DisplayWindDir_0+0x18>)
  4015b8:	f000 fa66 	bl	401a88 <LCD_WriteStringValue>

004015bc <??DisplayWindDir_13>:
  4015bc:	8da9      	ldrh	r1, [r5, #44]
  4015be:	20a9      	movs	r0, #169
  4015c0:	0040      	lsls	r0, r0, #1
  4015c2:	4281      	cmp	r1, r0
  4015c4:	d206      	bcs.n	4015d4 <??DisplayWindDir_6>
  4015c6:	42b1      	cmp	r1, r6
  4015c8:	d304      	bcc.n	4015d4 <??DisplayWindDir_6>
  4015ca:	2301      	movs	r3, #1
  4015cc:	0022      	lsls	r2, r4, #0
  4015ce:	481b      	ldr	r0, [pc, #108]	(40163c <??DisplayWindDir_0+0x1c>)
  4015d0:	f000 fa5a 	bl	401a88 <LCD_WriteStringValue>

004015d4 <??DisplayWindDir_6>:
  4015d4:	00e6      	lsls	r6, r4, #3
  4015d6:	0636      	lsls	r6, r6, #24
  4015d8:	0e36      	lsrs	r6, r6, #24
  4015da:	0034      	lsls	r4, r6, #0
  4015dc:	1cf5      	adds	r5, r6, #3
  4015de:	42ae      	cmp	r6, r5
  4015e0:	da1a      	bge.n	401618 <??DisplayWindDir_14>
  4015e2:	1c76      	adds	r6, r6, #1
  4015e4:	42ac      	cmp	r4, r5
  4015e6:	da17      	bge.n	401618 <??DisplayWindDir_14>

004015e8 <??DisplayWindDir_15>:
  4015e8:	2201      	movs	r2, #1
  4015ea:	0021      	lsls	r1, r4, #0
  4015ec:	203d      	movs	r0, #61
  4015ee:	f000 fc91 	bl	401f14 <LCD_WritePixel>
  4015f2:	42b4      	cmp	r4, r6
  4015f4:	d101      	bne.n	4015fa <??DisplayWindDir_16>
  4015f6:	2200      	movs	r2, #0
  4015f8:	e000      	b.n	4015fc <??DisplayWindDir_17>

004015fa <??DisplayWindDir_16>:
  4015fa:	2201      	movs	r2, #1

004015fc <??DisplayWindDir_17>:
  4015fc:	0021      	lsls	r1, r4, #0
  4015fe:	203e      	movs	r0, #62
  401600:	f000 fc88 	bl	401f14 <LCD_WritePixel>
  401604:	2201      	movs	r2, #1
  401606:	0021      	lsls	r1, r4, #0
  401608:	203f      	movs	r0, #63
  40160a:	f000 fc83 	bl	401f14 <LCD_WritePixel>
  40160e:	1c64      	adds	r4, r4, #1
  401610:	0624      	lsls	r4, r4, #24
  401612:	0e24      	lsrs	r4, r4, #24
  401614:	42ac      	cmp	r4, r5
  401616:	dbe7      	blt.n	4015e8 <??DisplayWindDir_15>

00401618 <??DisplayWindDir_14>:
  401618:	bc70      	pop	{r4, r5, r6}
  40161a:	bc08      	pop	{r3}
  40161c:	4718      	bx	r3
  40161e:	46c0      	nop			(mov r8, r8)

00401620 <??DisplayWindDir_0>:
  401620:	5050 0040 3a3c 0040 3a50 0040 3a70 0040     PP@.<:@.P:@.p:@.
  401630:	3a78 0040 3a80 0040 3a88 0040 3a90 0040     x:@..:@..:@..:@.

00401640 <NVMSetup>:
  401640:	b500      	push	{lr}
  401642:	b083      	sub	sp, #12
  401644:	4668      	mov	r0, sp
  401646:	2102      	movs	r1, #2
  401648:	7001      	strb	r1, [r0, #0]
  40164a:	2101      	movs	r1, #1
  40164c:	7101      	strb	r1, [r0, #4]
  40164e:	f402 fad1 	bl	3bf4 <CRM_VRegCntl>
  401652:	200a      	movs	r0, #10
  401654:	f002 fab2 	bl	403bbc <DelayMs>
  401658:	4903      	ldr	r1, [pc, #12]	(401668 <??NVMSetup_0>)
  40165a:	2000      	movs	r0, #0
  40165c:	f405 fb2c 	bl	6cb8 <NVM_Detect>
  401660:	b003      	add	sp, #12
  401662:	bc08      	pop	{r3}
  401664:	4718      	bx	r3
  401666:	46c0      	nop			(mov r8, r8)

00401668 <??NVMSetup_0>:
  401668:	5068 0040                                   hP@.

0040166c <LoadCurrentMeasurementSystem>:
  40166c:	b538      	push	{r3, r4, r5, lr}
  40166e:	4d0e      	ldr	r5, [pc, #56]	(4016a8 <??LoadCurrentMeasurementSystem_0>)
  401670:	2480      	movs	r4, #128
  401672:	0264      	lsls	r4, r4, #9
  401674:	0022      	lsls	r2, r4, #0
  401676:	7e29      	ldrb	r1, [r5, #24]
  401678:	2000      	movs	r0, #0
  40167a:	f405 fbc3 	bl	6e04 <NVM_Erase>
  40167e:	2301      	movs	r3, #1
  401680:	0022      	lsls	r2, r4, #0
  401682:	7e29      	ldrb	r1, [r5, #24]
  401684:	2000      	movs	r0, #0
  401686:	f405 fcc9 	bl	701c <NVM_BlankCheck>
  40168a:	2800      	cmp	r0, #0
  40168c:	d108      	bne.n	4016a0 <??LoadCurrentMeasurementSystem_1>
  40168e:	2001      	movs	r0, #1
  401690:	9000      	str	r0, [sp, #0]
  401692:	0023      	lsls	r3, r4, #0
  401694:	002a      	lsls	r2, r5, #0
  401696:	3213      	adds	r2, #19
  401698:	7e29      	ldrb	r1, [r5, #24]
  40169a:	2000      	movs	r0, #0
  40169c:	f405 fc12 	bl	6ec4 <NVM_Write>

004016a0 <??LoadCurrentMeasurementSystem_1>:
  4016a0:	bc31      	pop	{r0, r4, r5}
  4016a2:	bc08      	pop	{r3}
  4016a4:	4718      	bx	r3
  4016a6:	46c0      	nop			(mov r8, r8)

004016a8 <??LoadCurrentMeasurementSystem_0>:
  4016a8:	5050 0040                                   PP@.

004016ac <ReadCurrentMeasurementSystem>:
  4016ac:	b580      	push	{r7, lr}
  4016ae:	4806      	ldr	r0, [pc, #24]	(4016c8 <??ReadCurrentMeasurementSystem_0>)
  4016b0:	2101      	movs	r1, #1
  4016b2:	9100      	str	r1, [sp, #0]
  4016b4:	040b      	lsls	r3, r1, #16
  4016b6:	0002      	lsls	r2, r0, #0
  4016b8:	3213      	adds	r2, #19
  4016ba:	7e01      	ldrb	r1, [r0, #24]
  4016bc:	2000      	movs	r0, #0
  4016be:	f405 fb53 	bl	6d68 <NVM_Read>
  4016c2:	bc09      	pop	{r0, r3}
  4016c4:	4718      	bx	r3
  4016c6:	46c0      	nop			(mov r8, r8)

004016c8 <??ReadCurrentMeasurementSystem_0>:
  4016c8:	5050 0040                                   PP@.

004016cc <execute_uart_command>:
  4016cc:	b538      	push	{r3, r4, r5, lr}
  4016ce:	2801      	cmp	r0, #1
  4016d0:	d10e      	bne.n	4016f0 <??execute_uart_command_0>
  4016d2:	466c      	mov	r4, sp
  4016d4:	20fd      	movs	r0, #253
  4016d6:	7020      	strb	r0, [r4, #0]
  4016d8:	2001      	movs	r0, #1
  4016da:	7060      	strb	r0, [r4, #1]
  4016dc:	2059      	movs	r0, #89
  4016de:	70a0      	strb	r0, [r4, #2]
  4016e0:	20ff      	movs	r0, #255
  4016e2:	70e0      	strb	r0, [r4, #3]

004016e4 <??execute_uart_command_1>:
  4016e4:	2204      	movs	r2, #4
  4016e6:	4669      	mov	r1, sp
  4016e8:	2000      	movs	r0, #0
  4016ea:	f401 fcc5 	bl	3078 <UartWriteData>
  4016ee:	e052      	b.n	401796 <??execute_uart_command_2>

004016f0 <??execute_uart_command_0>:
  4016f0:	2802      	cmp	r0, #2
  4016f2:	d118      	bne.n	401726 <??execute_uart_command_3>
  4016f4:	466c      	mov	r4, sp
  4016f6:	20fd      	movs	r0, #253
  4016f8:	7020      	strb	r0, [r4, #0]
  4016fa:	2002      	movs	r0, #2
  4016fc:	7060      	strb	r0, [r4, #1]
  4016fe:	20ff      	movs	r0, #255
  401700:	70e0      	strb	r0, [r4, #3]
  401702:	4d26      	ldr	r5, [pc, #152]	(40179c <??execute_uart_command_4>)
  401704:	7569      	strb	r1, [r5, #21]
  401706:	0008      	lsls	r0, r1, #0
  401708:	f002 f894 	bl	403834 <MLMESetChannelRequest>
  40170c:	2800      	cmp	r0, #0
  40170e:	d107      	bne.n	401720 <??execute_uart_command_5>
  401710:	2059      	movs	r0, #89
  401712:	70a0      	strb	r0, [r4, #2]
  401714:	f000 f955 	bl	4019c2 <LCD_ClearDisplay>
  401718:	7d28      	ldrb	r0, [r5, #20]
  40171a:	f7ff fdbb 	bl	401294 <DisplaySensorValue>
  40171e:	e7e1      	b.n	4016e4 <??execute_uart_command_1>

00401720 <??execute_uart_command_5>:
  401720:	204e      	movs	r0, #78

00401722 <??execute_uart_command_6>:
  401722:	70a0      	strb	r0, [r4, #2]

00401724 <??execute_uart_command_7>:
  401724:	e7de      	b.n	4016e4 <??execute_uart_command_1>

00401726 <??execute_uart_command_3>:
  401726:	2803      	cmp	r0, #3
  401728:	d111      	bne.n	40174e <??execute_uart_command_8>
  40172a:	466c      	mov	r4, sp
  40172c:	20fd      	movs	r0, #253
  40172e:	7020      	strb	r0, [r4, #0]
  401730:	2003      	movs	r0, #3
  401732:	7060      	strb	r0, [r4, #1]
  401734:	20ff      	movs	r0, #255
  401736:	70e0      	strb	r0, [r4, #3]
  401738:	4d18      	ldr	r5, [pc, #96]	(40179c <??execute_uart_command_4>)
  40173a:	76a9      	strb	r1, [r5, #26]
  40173c:	0008      	lsls	r0, r1, #0
  40173e:	f002 f8ac 	bl	40389a <MLMEPAOutputAdjust>
  401742:	2800      	cmp	r0, #0
  401744:	d101      	bne.n	40174a <??execute_uart_command_9>
  401746:	2059      	movs	r0, #89
  401748:	e7eb      	b.n	401722 <??execute_uart_command_6>

0040174a <??execute_uart_command_9>:
  40174a:	204e      	movs	r0, #78
  40174c:	e7e9      	b.n	401722 <??execute_uart_command_6>

0040174e <??execute_uart_command_8>:
  40174e:	2804      	cmp	r0, #4
  401750:	d10f      	bne.n	401772 <??execute_uart_command_10>
  401752:	466c      	mov	r4, sp
  401754:	20fd      	movs	r0, #253
  401756:	7020      	strb	r0, [r4, #0]
  401758:	2004      	movs	r0, #4
  40175a:	7060      	strb	r0, [r4, #1]
  40175c:	4810      	ldr	r0, [pc, #64]	(4017a0 <??execute_uart_command_4+0x4>)
  40175e:	7800      	ldrb	r0, [r0, #0]
  401760:	70a0      	strb	r0, [r4, #2]
  401762:	20ff      	movs	r0, #255
  401764:	70e0      	strb	r0, [r4, #3]
  401766:	2204      	movs	r2, #4
  401768:	4669      	mov	r1, sp
  40176a:	2000      	movs	r0, #0
  40176c:	f401 fc84 	bl	3078 <UartWriteData>
  401770:	e011      	b.n	401796 <??execute_uart_command_2>

00401772 <??execute_uart_command_10>:
  401772:	2805      	cmp	r0, #5
  401774:	d10a      	bne.n	40178c <??execute_uart_command_11>
  401776:	466c      	mov	r4, sp
  401778:	20fd      	movs	r0, #253
  40177a:	7020      	strb	r0, [r4, #0]
  40177c:	2005      	movs	r0, #5
  40177e:	7060      	strb	r0, [r4, #1]
  401780:	4808      	ldr	r0, [pc, #32]	(4017a4 <??execute_uart_command_4+0x8>)
  401782:	7800      	ldrb	r0, [r0, #0]
  401784:	70a0      	strb	r0, [r4, #2]
  401786:	20ff      	movs	r0, #255
  401788:	70e0      	strb	r0, [r4, #3]
  40178a:	e7ab      	b.n	4016e4 <??execute_uart_command_1>

0040178c <??execute_uart_command_11>:
  40178c:	2807      	cmp	r0, #7
  40178e:	d102      	bne.n	401796 <??execute_uart_command_2>
  401790:	4805      	ldr	r0, [pc, #20]	(4017a8 <??execute_uart_command_4+0xc>)
  401792:	2101      	movs	r1, #1
  401794:	7001      	strb	r1, [r0, #0]

00401796 <??execute_uart_command_2>:
  401796:	bc31      	pop	{r0, r4, r5}
  401798:	bc08      	pop	{r3}
  40179a:	4718      	bx	r3

0040179c <??execute_uart_command_4>:
  40179c:	5050 0040 5065 0040 506a 0040 5069 0040     PP@.eP@.jP@.iP@.

004017ac <cpy_uart_to_data_buff>:
  4017ac:	b538      	push	{r3, r4, r5, lr}
  4017ae:	0004      	lsls	r4, r0, #0
  4017b0:	2500      	movs	r5, #0
  4017b2:	e003      	b.n	4017bc <??cpy_uart_to_data_buff_0>

004017b4 <??cpy_uart_to_data_buff_1>:
  4017b4:	1c6d      	adds	r5, r5, #1
  4017b6:	062d      	lsls	r5, r5, #24
  4017b8:	0e2d      	lsrs	r5, r5, #24
  4017ba:	1c64      	adds	r4, r4, #1

004017bc <??cpy_uart_to_data_buff_0>:
  4017bc:	0021      	lsls	r1, r4, #0
  4017be:	2000      	movs	r0, #0
  4017c0:	f401 fd9c 	bl	32fc <UartGetByteFromRxBuffer>
  4017c4:	2800      	cmp	r0, #0
  4017c6:	d001      	beq.n	4017cc <??cpy_uart_to_data_buff_2>
  4017c8:	2d0d      	cmp	r5, #13
  4017ca:	dbf3      	blt.n	4017b4 <??cpy_uart_to_data_buff_1>

004017cc <??cpy_uart_to_data_buff_2>:
  4017cc:	0028      	lsls	r0, r5, #0
  4017ce:	bc32      	pop	{r1, r4, r5}
  4017d0:	bc08      	pop	{r3}
  4017d2:	4718      	bx	r3

004017d4 <LCD_Init>:
  4017d4:	b538      	push	{r3, r4, r5, lr}
  4017d6:	2100      	movs	r1, #0
  4017d8:	2009      	movs	r0, #9
  4017da:	f406 ffc7 	bl	876c <Gpio_SetPinFunction>
  4017de:	2100      	movs	r1, #0
  4017e0:	2014      	movs	r0, #20
  4017e2:	f406 ffc3 	bl	876c <Gpio_SetPinFunction>
  4017e6:	2100      	movs	r1, #0
  4017e8:	2008      	movs	r0, #8
  4017ea:	f406 ffbf 	bl	876c <Gpio_SetPinFunction>
  4017ee:	2100      	movs	r1, #0
  4017f0:	2015      	movs	r0, #21
  4017f2:	f406 ffbb 	bl	876c <Gpio_SetPinFunction>
  4017f6:	2100      	movs	r1, #0
  4017f8:	202d      	movs	r0, #45
  4017fa:	f406 ffb7 	bl	876c <Gpio_SetPinFunction>
  4017fe:	2100      	movs	r1, #0
  401800:	2013      	movs	r0, #19
  401802:	f406 ffb3 	bl	876c <Gpio_SetPinFunction>
  401806:	2100      	movs	r1, #0
  401808:	2009      	movs	r0, #9
  40180a:	f406 fe39 	bl	8480 <Gpio_SetPinData>
  40180e:	2100      	movs	r1, #0
  401810:	2014      	movs	r0, #20
  401812:	f406 fe35 	bl	8480 <Gpio_SetPinData>
  401816:	2100      	movs	r1, #0
  401818:	2008      	movs	r0, #8
  40181a:	f406 fe31 	bl	8480 <Gpio_SetPinData>
  40181e:	2101      	movs	r1, #1
  401820:	2015      	movs	r0, #21
  401822:	f406 fe2d 	bl	8480 <Gpio_SetPinData>
  401826:	2101      	movs	r1, #1
  401828:	202d      	movs	r0, #45
  40182a:	f406 fe29 	bl	8480 <Gpio_SetPinData>
  40182e:	2101      	movs	r1, #1
  401830:	2013      	movs	r0, #19
  401832:	f406 fe25 	bl	8480 <Gpio_SetPinData>
  401836:	2101      	movs	r1, #1
  401838:	2014      	movs	r0, #20
  40183a:	f406 fe9b 	bl	8574 <Gpio_SetPinReadSource>
  40183e:	2101      	movs	r1, #1
  401840:	2015      	movs	r0, #21
  401842:	f406 fe97 	bl	8574 <Gpio_SetPinReadSource>
  401846:	2101      	movs	r1, #1
  401848:	2008      	movs	r0, #8
  40184a:	f406 fe93 	bl	8574 <Gpio_SetPinReadSource>
  40184e:	2101      	movs	r1, #1
  401850:	2009      	movs	r0, #9
  401852:	f406 fe8f 	bl	8574 <Gpio_SetPinReadSource>
  401856:	2101      	movs	r1, #1
  401858:	200a      	movs	r0, #10
  40185a:	f406 fe8b 	bl	8574 <Gpio_SetPinReadSource>
  40185e:	2101      	movs	r1, #1
  401860:	202d      	movs	r0, #45
  401862:	f406 fe87 	bl	8574 <Gpio_SetPinReadSource>
  401866:	2101      	movs	r1, #1
  401868:	2013      	movs	r0, #19
  40186a:	f406 fe83 	bl	8574 <Gpio_SetPinReadSource>
  40186e:	2101      	movs	r1, #1
  401870:	2014      	movs	r0, #20
  401872:	f406 fd99 	bl	83a8 <Gpio_SetPinDir>
  401876:	2101      	movs	r1, #1
  401878:	2015      	movs	r0, #21
  40187a:	f406 fd95 	bl	83a8 <Gpio_SetPinDir>
  40187e:	2101      	movs	r1, #1
  401880:	2008      	movs	r0, #8
  401882:	f406 fd91 	bl	83a8 <Gpio_SetPinDir>
  401886:	2101      	movs	r1, #1
  401888:	2009      	movs	r0, #9
  40188a:	f406 fd8d 	bl	83a8 <Gpio_SetPinDir>
  40188e:	2101      	movs	r1, #1
  401890:	200a      	movs	r0, #10
  401892:	f406 fd89 	bl	83a8 <Gpio_SetPinDir>
  401896:	2101      	movs	r1, #1
  401898:	202d      	movs	r0, #45
  40189a:	f406 fd85 	bl	83a8 <Gpio_SetPinDir>
  40189e:	2101      	movs	r1, #1
  4018a0:	2013      	movs	r0, #19
  4018a2:	f406 fd81 	bl	83a8 <Gpio_SetPinDir>
  4018a6:	22f0      	movs	r2, #240
  4018a8:	2100      	movs	r1, #0
  4018aa:	2000      	movs	r0, #0
  4018ac:	f406 ff1a 	bl	86e4 <Gpio_SetPortFunction>
  4018b0:	220f      	movs	r2, #15
  4018b2:	2100      	movs	r1, #0
  4018b4:	2001      	movs	r0, #1
  4018b6:	f406 ff15 	bl	86e4 <Gpio_SetPortFunction>
  4018ba:	23f0      	movs	r3, #240
  4018bc:	22f0      	movs	r2, #240
  4018be:	2103      	movs	r1, #3
  4018c0:	2000      	movs	r0, #0
  4018c2:	f406 fd09 	bl	82d8 <Gpio_WrPortSetting>
  4018c6:	230f      	movs	r3, #15
  4018c8:	220f      	movs	r2, #15
  4018ca:	2103      	movs	r1, #3
  4018cc:	2001      	movs	r0, #1
  4018ce:	f406 fd03 	bl	82d8 <Gpio_WrPortSetting>
  4018d2:	23f0      	movs	r3, #240
  4018d4:	22f0      	movs	r2, #240
  4018d6:	2104      	movs	r1, #4
  4018d8:	2000      	movs	r0, #0
  4018da:	f406 fcfd 	bl	82d8 <Gpio_WrPortSetting>
  4018de:	230f      	movs	r3, #15
  4018e0:	220f      	movs	r2, #15
  4018e2:	2104      	movs	r1, #4
  4018e4:	2001      	movs	r0, #1
  4018e6:	f406 fcf7 	bl	82d8 <Gpio_WrPortSetting>
  4018ea:	23f0      	movs	r3, #240
  4018ec:	22f0      	movs	r2, #240
  4018ee:	2106      	movs	r1, #6
  4018f0:	2000      	movs	r0, #0
  4018f2:	f406 fcf1 	bl	82d8 <Gpio_WrPortSetting>
  4018f6:	230f      	movs	r3, #15
  4018f8:	220f      	movs	r2, #15
  4018fa:	2106      	movs	r1, #6
  4018fc:	2001      	movs	r0, #1
  4018fe:	f406 fceb 	bl	82d8 <Gpio_WrPortSetting>
  401902:	25f0      	movs	r5, #240
  401904:	43ed      	mvns	r5, r5
  401906:	23f0      	movs	r3, #240
  401908:	002a      	lsls	r2, r5, #0
  40190a:	2102      	movs	r1, #2
  40190c:	2000      	movs	r0, #0
  40190e:	f406 fce3 	bl	82d8 <Gpio_WrPortSetting>
  401912:	240f      	movs	r4, #15
  401914:	43e4      	mvns	r4, r4
  401916:	230f      	movs	r3, #15
  401918:	0022      	lsls	r2, r4, #0
  40191a:	2102      	movs	r1, #2
  40191c:	2001      	movs	r0, #1
  40191e:	f406 fcdb 	bl	82d8 <Gpio_WrPortSetting>
  401922:	22f0      	movs	r2, #240
  401924:	0029      	lsls	r1, r5, #0
  401926:	2000      	movs	r0, #0
  401928:	f406 fd28 	bl	837c <Gpio_SetPortDir>
  40192c:	220f      	movs	r2, #15
  40192e:	0021      	lsls	r1, r4, #0
  401930:	2001      	movs	r0, #1
  401932:	f406 fd23 	bl	837c <Gpio_SetPortDir>
  401936:	2100      	movs	r1, #0
  401938:	202d      	movs	r0, #45
  40193a:	f406 fda1 	bl	8480 <Gpio_SetPinData>
  40193e:	2100      	movs	r1, #0
  401940:	2013      	movs	r0, #19
  401942:	f406 fd9d 	bl	8480 <Gpio_SetPinData>
  401946:	200a      	movs	r0, #10
  401948:	f002 f94a 	bl	403be0 <DelayUs>
  40194c:	2101      	movs	r1, #1
  40194e:	202d      	movs	r0, #45
  401950:	f406 fd96 	bl	8480 <Gpio_SetPinData>
  401954:	2101      	movs	r1, #1
  401956:	2013      	movs	r0, #19
  401958:	f406 fd92 	bl	8480 <Gpio_SetPinData>
  40195c:	2001      	movs	r0, #1
  40195e:	f002 f92d 	bl	403bbc <DelayMs>
  401962:	20e2      	movs	r0, #226
  401964:	f000 fa50 	bl	401e08 <LCD_WriteCommand>
  401968:	200a      	movs	r0, #10
  40196a:	f002 f939 	bl	403be0 <DelayUs>
  40196e:	20a2      	movs	r0, #162
  401970:	f000 fa4a 	bl	401e08 <LCD_WriteCommand>
  401974:	20a1      	movs	r0, #161
  401976:	f000 fa47 	bl	401e08 <LCD_WriteCommand>
  40197a:	20c0      	movs	r0, #192
  40197c:	f000 fa44 	bl	401e08 <LCD_WriteCommand>
  401980:	2024      	movs	r0, #36
  401982:	f000 fa41 	bl	401e08 <LCD_WriteCommand>
  401986:	2081      	movs	r0, #129
  401988:	f000 fa3e 	bl	401e08 <LCD_WriteCommand>
  40198c:	2030      	movs	r0, #48
  40198e:	f000 fa3b 	bl	401e08 <LCD_WriteCommand>
  401992:	202f      	movs	r0, #47
  401994:	f000 fa38 	bl	401e08 <LCD_WriteCommand>
  401998:	200a      	movs	r0, #10
  40199a:	f002 f921 	bl	403be0 <DelayUs>
  40199e:	20af      	movs	r0, #175
  4019a0:	f000 fa32 	bl	401e08 <LCD_WriteCommand>
  4019a4:	200a      	movs	r0, #10
  4019a6:	f002 f91b 	bl	403be0 <DelayUs>
  4019aa:	200f      	movs	r0, #15
  4019ac:	f000 faa8 	bl	401f00 <LCD_SetBacklight>
  4019b0:	2000      	movs	r0, #0
  4019b2:	f000 fa95 	bl	401ee0 <LCD_SetFont>
  4019b6:	4817      	ldr	r0, [pc, #92]	(401a14 <??DataTable1>)
  4019b8:	2100      	movs	r1, #0
  4019ba:	7001      	strb	r1, [r0, #0]
  4019bc:	bc31      	pop	{r0, r4, r5}
  4019be:	bc08      	pop	{r3}
  4019c0:	4718      	bx	r3

004019c2 <LCD_ClearDisplay>:
  4019c2:	b570      	push	{r4, r5, r6, lr}
  4019c4:	2600      	movs	r6, #0
  4019c6:	4c13      	ldr	r4, [pc, #76]	(401a14 <??DataTable1>)
  4019c8:	7066      	strb	r6, [r4, #1]
  4019ca:	4d2e      	ldr	r5, [pc, #184]	(401a84 <??DataTable4>)
  4019cc:	78e8      	ldrb	r0, [r5, #3]
  4019ce:	7821      	ldrb	r1, [r4, #0]
  4019d0:	2901      	cmp	r1, #1
  4019d2:	d103      	bne.n	4019dc <??LCD_ClearDisplay_0>
  4019d4:	7929      	ldrb	r1, [r5, #4]
  4019d6:	4001      	ands	r1, r0
  4019d8:	d000      	beq.n	4019dc <??LCD_ClearDisplay_0>
  4019da:	4388      	bics	r0, r1

004019dc <??LCD_ClearDisplay_0>:
  4019dc:	70a0      	strb	r0, [r4, #2]
  4019de:	e000      	b.n	4019e2 <??LCD_ClearDisplay_1>

004019e0 <??LCD_ClearDisplay_2>:
  4019e0:	1c76      	adds	r6, r6, #1

004019e2 <??LCD_ClearDisplay_1>:
  4019e2:	78a0      	ldrb	r0, [r4, #2]
  4019e4:	4130      	asrs	r0, r6
  4019e6:	07c0      	lsls	r0, r0, #31
  4019e8:	d401      	bmi.n	4019ee <??LCD_ClearDisplay_3>
  4019ea:	2e08      	cmp	r6, #8
  4019ec:	dbf8      	blt.n	4019e0 <??LCD_ClearDisplay_2>

004019ee <??LCD_ClearDisplay_3>:
  4019ee:	2e08      	cmp	r6, #8
  4019f0:	d00d      	beq.n	401a0e <??LCD_ClearDisplay_4>
  4019f2:	0030      	lsls	r0, r6, #0
  4019f4:	f000 fbb8 	bl	402168 <LCD_ClearLine>
  4019f8:	2801      	cmp	r0, #1
  4019fa:	d1f2      	bne.n	4019e2 <??LCD_ClearDisplay_1>
  4019fc:	2101      	movs	r1, #1
  4019fe:	40b1      	lsls	r1, r6
  401a00:	43c8      	mvns	r0, r1
  401a02:	78e9      	ldrb	r1, [r5, #3]
  401a04:	4001      	ands	r1, r0
  401a06:	70e9      	strb	r1, [r5, #3]
  401a08:	78a1      	ldrb	r1, [r4, #2]
  401a0a:	4008      	ands	r0, r1
  401a0c:	e7e6      	b.n	4019dc <??LCD_ClearDisplay_0>

00401a0e <??LCD_ClearDisplay_4>:
  401a0e:	bc70      	pop	{r4, r5, r6}
  401a10:	bc08      	pop	{r3}
  401a12:	4718      	bx	r3

00401a14 <??DataTable1>:
  401a14:	50b4 0040                                   .P@.

00401a18 <LCD_WriteString_NormalFont>:
  401a18:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  401a1a:	000d      	lsls	r5, r1, #0
  401a1c:	0041      	lsls	r1, r0, #1
  401a1e:	1808      	adds	r0, r1, r0
  401a20:	4917      	ldr	r1, [pc, #92]	(401a80 <??DataTable3>)
  401a22:	1808      	adds	r0, r1, r0
  401a24:	4e17      	ldr	r6, [pc, #92]	(401a84 <??DataTable4>)
  401a26:	7901      	ldrb	r1, [r0, #4]
  401a28:	7031      	strb	r1, [r6, #0]
  401a2a:	7940      	ldrb	r0, [r0, #5]
  401a2c:	7070      	strb	r0, [r6, #1]
  401a2e:	0028      	lsls	r0, r5, #0
  401a30:	2400      	movs	r4, #0
  401a32:	2100      	movs	r1, #0
  401a34:	2700      	movs	r7, #0
  401a36:	e006      	b.n	401a46 <??LCD_WriteString_NormalFont_0>

00401a38 <??LCD_WriteString_NormalFont_1>:
  401a38:	1c49      	adds	r1, r1, #1
  401a3a:	0609      	lsls	r1, r1, #24
  401a3c:	1609      	asrs	r1, r1, #24
  401a3e:	1c7f      	adds	r7, r7, #1
  401a40:	063f      	lsls	r7, r7, #24
  401a42:	163f      	asrs	r7, r7, #24
  401a44:	1c40      	adds	r0, r0, #1

00401a46 <??LCD_WriteString_NormalFont_0>:
  401a46:	7802      	ldrb	r2, [r0, #0]
  401a48:	2a00      	cmp	r2, #0
  401a4a:	d001      	beq.n	401a50 <??LCD_WriteString_NormalFont_2>
  401a4c:	2915      	cmp	r1, #21
  401a4e:	dbf3      	blt.n	401a38 <??LCD_WriteString_NormalFont_1>

00401a50 <??LCD_WriteString_NormalFont_2>:
  401a50:	2f16      	cmp	r7, #22
  401a52:	db00      	blt.n	401a56 <??LCD_WriteString_NormalFont_3>
  401a54:	2715      	movs	r7, #21

00401a56 <??LCD_WriteString_NormalFont_3>:
  401a56:	063f      	lsls	r7, r7, #24
  401a58:	0e3f      	lsrs	r7, r7, #24
  401a5a:	e009      	b.n	401a70 <??LCD_WriteString_NormalFont_4>

00401a5c <??LCD_WriteString_NormalFont_5>:
  401a5c:	7872      	ldrb	r2, [r6, #1]
  401a5e:	7831      	ldrb	r1, [r6, #0]
  401a60:	7828      	ldrb	r0, [r5, #0]
  401a62:	f000 faeb 	bl	40203c <LCD_WriteCharacter>
  401a66:	7830      	ldrb	r0, [r6, #0]
  401a68:	1d80      	adds	r0, r0, #6
  401a6a:	7030      	strb	r0, [r6, #0]
  401a6c:	1c6d      	adds	r5, r5, #1
  401a6e:	1c64      	adds	r4, r4, #1

00401a70 <??LCD_WriteString_NormalFont_4>:
  401a70:	42bc      	cmp	r4, r7
  401a72:	da01      	bge.n	401a78 <??LCD_WriteString_NormalFont_6>
  401a74:	2c15      	cmp	r4, #21
  401a76:	dbf1      	blt.n	401a5c <??LCD_WriteString_NormalFont_5>

00401a78 <??LCD_WriteString_NormalFont_6>:
  401a78:	bcf1      	pop	{r0, r4, r5, r6, r7}
  401a7a:	bc08      	pop	{r3}
  401a7c:	4718      	bx	r3
	...

00401a80 <??DataTable3>:
  401a80:	5294 0040                                   .R@.

00401a84 <??DataTable4>:
  401a84:	50c0 0040                                   .P@.

00401a88 <LCD_WriteStringValue>:
  401a88:	b5fd      	push	{r0, r2, r3, r4, r5, r6, r7, lr}
  401a8a:	b08e      	sub	sp, #56
  401a8c:	000f      	lsls	r7, r1, #0
  401a8e:	4e65      	ldr	r6, [pc, #404]	(401c24 <??LCD_WriteStringValue_0>)
  401a90:	4668      	mov	r0, sp
  401a92:	2105      	movs	r1, #5
  401a94:	7001      	strb	r1, [r0, #0]
  401a96:	2400      	movs	r4, #0
  401a98:	2500      	movs	r5, #0
  401a9a:	4863      	ldr	r0, [pc, #396]	(401c28 <??LCD_WriteStringValue_0+0x4>)
  401a9c:	7004      	strb	r4, [r0, #0]
  401a9e:	a810      	add	r0, sp, #64
  401aa0:	7800      	ldrb	r0, [r0, #0]
  401aa2:	2801      	cmp	r0, #1
  401aa4:	d16c      	bne.n	401b80 <??LCD_WriteStringValue_1>
  401aa6:	2f64      	cmp	r7, #100
  401aa8:	d204      	bcs.n	401ab4 <??LCD_WriteStringValue_2>
  401aaa:	4668      	mov	r0, sp
  401aac:	2102      	movs	r1, #2
  401aae:	7001      	strb	r1, [r0, #0]
  401ab0:	260a      	movs	r6, #10
  401ab2:	e00f      	b.n	401ad4 <??LCD_WriteStringValue_3>

00401ab4 <??LCD_WriteStringValue_2>:
  401ab4:	20fa      	movs	r0, #250
  401ab6:	0080      	lsls	r0, r0, #2
  401ab8:	4287      	cmp	r7, r0
  401aba:	d204      	bcs.n	401ac6 <??LCD_WriteStringValue_4>
  401abc:	4668      	mov	r0, sp
  401abe:	2103      	movs	r1, #3
  401ac0:	7001      	strb	r1, [r0, #0]
  401ac2:	2664      	movs	r6, #100
  401ac4:	e006      	b.n	401ad4 <??LCD_WriteStringValue_3>

00401ac6 <??LCD_WriteStringValue_4>:
  401ac6:	1e71      	subs	r1, r6, #1
  401ac8:	428f      	cmp	r7, r1
  401aca:	d203      	bcs.n	401ad4 <??LCD_WriteStringValue_3>
  401acc:	4669      	mov	r1, sp
  401ace:	2204      	movs	r2, #4
  401ad0:	700a      	strb	r2, [r1, #0]
  401ad2:	0006      	lsls	r6, r0, #0

00401ad4 <??LCD_WriteStringValue_3>:
  401ad4:	4668      	mov	r0, sp
  401ad6:	7800      	ldrb	r0, [r0, #0]
  401ad8:	2801      	cmp	r0, #1
  401ada:	db27      	blt.n	401b2c <??LCD_WriteStringValue_5>

00401adc <??LCD_WriteStringValue_6>:
  401adc:	1c68      	adds	r0, r5, #1
  401ade:	0600      	lsls	r0, r0, #24
  401ae0:	0e00      	lsrs	r0, r0, #24
  401ae2:	9001      	str	r0, [sp, #4]
  401ae4:	043f      	lsls	r7, r7, #16
  401ae6:	0c3f      	lsrs	r7, r7, #16
  401ae8:	0038      	lsls	r0, r7, #0
  401aea:	0436      	lsls	r6, r6, #16
  401aec:	1436      	asrs	r6, r6, #16
  401aee:	0031      	lsls	r1, r6, #0
  401af0:	f7fe ff06 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  401af4:	2800      	cmp	r0, #0
  401af6:	d009      	beq.n	401b0c <??LCD_WriteStringValue_7>
  401af8:	a902      	add	r1, sp, #8
  401afa:	3030      	adds	r0, #48
  401afc:	5548      	strb	r0, [r1, r5]
  401afe:	9d01      	ldr	r5, [sp, #4]
  401b00:	0038      	lsls	r0, r7, #0
  401b02:	0031      	lsls	r1, r6, #0
  401b04:	f7fe fefc 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  401b08:	000f      	lsls	r7, r1, #0
  401b0a:	e003      	b.n	401b14 <??LCD_WriteStringValue_8>

00401b0c <??LCD_WriteStringValue_7>:
  401b0c:	a802      	add	r0, sp, #8
  401b0e:	2130      	movs	r1, #48
  401b10:	5541      	strb	r1, [r0, r5]
  401b12:	9d01      	ldr	r5, [sp, #4]

00401b14 <??LCD_WriteStringValue_8>:
  401b14:	0030      	lsls	r0, r6, #0
  401b16:	210a      	movs	r1, #10
  401b18:	f7fe fef2 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  401b1c:	0006      	lsls	r6, r0, #0
  401b1e:	1c64      	adds	r4, r4, #1
  401b20:	0624      	lsls	r4, r4, #24
  401b22:	0e24      	lsrs	r4, r4, #24
  401b24:	4668      	mov	r0, sp
  401b26:	7800      	ldrb	r0, [r0, #0]
  401b28:	4284      	cmp	r4, r0
  401b2a:	dbd7      	blt.n	401adc <??LCD_WriteStringValue_6>

00401b2c <??LCD_WriteStringValue_5>:
  401b2c:	a802      	add	r0, sp, #8
  401b2e:	2100      	movs	r1, #0
  401b30:	5541      	strb	r1, [r0, r5]
  401b32:	2500      	movs	r5, #0
  401b34:	a806      	add	r0, sp, #24
  401b36:	e007      	b.n	401b48 <??LCD_WriteStringValue_9>

00401b38 <??LCD_WriteStringValue_10>:
  401b38:	7001      	strb	r1, [r0, #0]
  401b3a:	1c6d      	adds	r5, r5, #1
  401b3c:	062d      	lsls	r5, r5, #24
  401b3e:	0e2d      	lsrs	r5, r5, #24
  401b40:	990e      	ldr	r1, [sp, #56]
  401b42:	1c49      	adds	r1, r1, #1
  401b44:	910e      	str	r1, [sp, #56]
  401b46:	1c40      	adds	r0, r0, #1

00401b48 <??LCD_WriteStringValue_9>:
  401b48:	990e      	ldr	r1, [sp, #56]
  401b4a:	7809      	ldrb	r1, [r1, #0]
  401b4c:	2900      	cmp	r1, #0
  401b4e:	d001      	beq.n	401b54 <??LCD_WriteStringValue_11>
  401b50:	2d15      	cmp	r5, #21
  401b52:	dbf1      	blt.n	401b38 <??LCD_WriteStringValue_10>

00401b54 <??LCD_WriteStringValue_11>:
  401b54:	a902      	add	r1, sp, #8
  401b56:	e005      	b.n	401b64 <??LCD_WriteStringValue_12>

00401b58 <??LCD_WriteStringValue_13>:
  401b58:	7002      	strb	r2, [r0, #0]
  401b5a:	1c6d      	adds	r5, r5, #1
  401b5c:	062d      	lsls	r5, r5, #24
  401b5e:	0e2d      	lsrs	r5, r5, #24
  401b60:	1c40      	adds	r0, r0, #1
  401b62:	1c49      	adds	r1, r1, #1

00401b64 <??LCD_WriteStringValue_12>:
  401b64:	780a      	ldrb	r2, [r1, #0]
  401b66:	2a00      	cmp	r2, #0
  401b68:	d001      	beq.n	401b6e <??LCD_WriteStringValue_14>
  401b6a:	2d15      	cmp	r5, #21
  401b6c:	dbf4      	blt.n	401b58 <??LCD_WriteStringValue_13>

00401b6e <??LCD_WriteStringValue_14>:
  401b6e:	a806      	add	r0, sp, #24
  401b70:	2100      	movs	r1, #0
  401b72:	5541      	strb	r1, [r0, r5]
  401b74:	a906      	add	r1, sp, #24
  401b76:	a80f      	add	r0, sp, #60
  401b78:	7800      	ldrb	r0, [r0, #0]
  401b7a:	f7ff ff4d 	bl	401a18 <LCD_WriteString_NormalFont>
  401b7e:	e04d      	b.n	401c1c <??LCD_WriteStringValue_15>

00401b80 <??LCD_WriteStringValue_1>:
  401b80:	492a      	ldr	r1, [pc, #168]	(401c2c <??DataTable5>)
  401b82:	a810      	add	r0, sp, #64
  401b84:	7800      	ldrb	r0, [r0, #0]
  401b86:	2800      	cmp	r0, #0
  401b88:	a80b      	add	r0, sp, #44
  401b8a:	d142      	bne.n	401c12 <??LCD_WriteStringValue_16>

00401b8c <??LCD_WriteStringValue_17>:
  401b8c:	073a      	lsls	r2, r7, #28
  401b8e:	0f12      	lsrs	r2, r2, #28
  401b90:	188a      	adds	r2, r1, r2
  401b92:	7d12      	ldrb	r2, [r2, #20]
  401b94:	5502      	strb	r2, [r0, r4]
  401b96:	033f      	lsls	r7, r7, #12
  401b98:	1c64      	adds	r4, r4, #1
  401b9a:	0624      	lsls	r4, r4, #24
  401b9c:	0e24      	lsrs	r4, r4, #24
  401b9e:	0c3f      	lsrs	r7, r7, #16
  401ba0:	2f10      	cmp	r7, #16
  401ba2:	d2f3      	bcs.n	401b8c <??LCD_WriteStringValue_17>
  401ba4:	19c9      	adds	r1, r1, r7
  401ba6:	7d09      	ldrb	r1, [r1, #20]
  401ba8:	5501      	strb	r1, [r0, r4]
  401baa:	2c01      	cmp	r4, #1
  401bac:	db0b      	blt.n	401bc6 <??LCD_WriteStringValue_18>
  401bae:	a904      	add	r1, sp, #16

00401bb0 <??LCD_WriteStringValue_19>:
  401bb0:	5d02      	ldrb	r2, [r0, r4]
  401bb2:	700a      	strb	r2, [r1, #0]
  401bb4:	1e64      	subs	r4, r4, #1
  401bb6:	0624      	lsls	r4, r4, #24
  401bb8:	0e24      	lsrs	r4, r4, #24
  401bba:	1c6d      	adds	r5, r5, #1
  401bbc:	062d      	lsls	r5, r5, #24
  401bbe:	0e2d      	lsrs	r5, r5, #24
  401bc0:	1c49      	adds	r1, r1, #1
  401bc2:	2c01      	cmp	r4, #1
  401bc4:	daf4      	bge.n	401bb0 <??LCD_WriteStringValue_19>

00401bc6 <??LCD_WriteStringValue_18>:
  401bc6:	a904      	add	r1, sp, #16
  401bc8:	7800      	ldrb	r0, [r0, #0]
  401bca:	5548      	strb	r0, [r1, r5]
  401bcc:	1c6d      	adds	r5, r5, #1
  401bce:	062d      	lsls	r5, r5, #24
  401bd0:	0e2d      	lsrs	r5, r5, #24
  401bd2:	2000      	movs	r0, #0
  401bd4:	5548      	strb	r0, [r1, r5]
  401bd6:	2500      	movs	r5, #0
  401bd8:	a806      	add	r0, sp, #24
  401bda:	e007      	b.n	401bec <??LCD_WriteStringValue_20>

00401bdc <??LCD_WriteStringValue_21>:
  401bdc:	7001      	strb	r1, [r0, #0]
  401bde:	1c6d      	adds	r5, r5, #1
  401be0:	062d      	lsls	r5, r5, #24
  401be2:	0e2d      	lsrs	r5, r5, #24
  401be4:	990e      	ldr	r1, [sp, #56]
  401be6:	1c49      	adds	r1, r1, #1
  401be8:	910e      	str	r1, [sp, #56]
  401bea:	1c40      	adds	r0, r0, #1

00401bec <??LCD_WriteStringValue_20>:
  401bec:	990e      	ldr	r1, [sp, #56]
  401bee:	7809      	ldrb	r1, [r1, #0]
  401bf0:	2900      	cmp	r1, #0
  401bf2:	d001      	beq.n	401bf8 <??LCD_WriteStringValue_22>
  401bf4:	2d15      	cmp	r5, #21
  401bf6:	dbf1      	blt.n	401bdc <??LCD_WriteStringValue_21>

00401bf8 <??LCD_WriteStringValue_22>:
  401bf8:	a904      	add	r1, sp, #16

00401bfa <??LCD_WriteStringValue_23>:
  401bfa:	780a      	ldrb	r2, [r1, #0]
  401bfc:	2a00      	cmp	r2, #0
  401bfe:	d0b6      	beq.n	401b6e <??LCD_WriteStringValue_14>
  401c00:	2d15      	cmp	r5, #21
  401c02:	dab4      	bge.n	401b6e <??LCD_WriteStringValue_14>
  401c04:	7002      	strb	r2, [r0, #0]
  401c06:	1c6d      	adds	r5, r5, #1
  401c08:	062d      	lsls	r5, r5, #24
  401c0a:	0e2d      	lsrs	r5, r5, #24
  401c0c:	1c40      	adds	r0, r0, #1
  401c0e:	1c49      	adds	r1, r1, #1
  401c10:	e7f3      	b.n	401bfa <??LCD_WriteStringValue_23>

00401c12 <??LCD_WriteStringValue_16>:
  401c12:	3128      	adds	r1, #40
  401c14:	a80f      	add	r0, sp, #60
  401c16:	7800      	ldrb	r0, [r0, #0]
  401c18:	f7ff fefe 	bl	401a18 <LCD_WriteString_NormalFont>

00401c1c <??LCD_WriteStringValue_15>:
  401c1c:	b011      	add	sp, #68
  401c1e:	bcf0      	pop	{r4, r5, r6, r7}
  401c20:	bc08      	pop	{r3}
  401c22:	4718      	bx	r3

00401c24 <??LCD_WriteStringValue_0>:
  401c24:	2710 0000 50b5 0040                         .'...P@.

00401c2c <??DataTable5>:
  401c2c:	3c00 0040                                   .<@.

00401c30 <LCD_WriteStringDecValue>:
  401c30:	b5ff      	push	{r0, r1, r2, r3, r4, r5, r6, r7, lr}
  401c32:	b08f      	sub	sp, #60
  401c34:	4c70      	ldr	r4, [pc, #448]	(401df8 <??LCD_WriteStringDecValue_0>)
  401c36:	4668      	mov	r0, sp
  401c38:	2105      	movs	r1, #5
  401c3a:	7201      	strb	r1, [r0, #8]
  401c3c:	2600      	movs	r6, #0
  401c3e:	2500      	movs	r5, #0
  401c40:	a807      	add	r0, sp, #28
  401c42:	2114      	movs	r1, #20
  401c44:	f002 f87c 	bl	403d40 <?Veneer (4) for __aeabi_memclr4>
  401c48:	486c      	ldr	r0, [pc, #432]	(401dfc <??LCD_WriteStringDecValue_0+0x4>)
  401c4a:	7005      	strb	r5, [r0, #0]
  401c4c:	a812      	add	r0, sp, #72
  401c4e:	7800      	ldrb	r0, [r0, #0]
  401c50:	2801      	cmp	r0, #1
  401c52:	d173      	bne.n	401d3c <??LCD_WriteStringDecValue_1>
  401c54:	a810      	add	r0, sp, #64
  401c56:	8800      	ldrh	r0, [r0, #0]
  401c58:	0a00      	lsrs	r0, r0, #8
  401c5a:	9000      	str	r0, [sp, #0]
  401c5c:	9501      	str	r5, [sp, #4]

00401c5e <??LCD_WriteStringDecValue_2>:
  401c5e:	9800      	ldr	r0, [sp, #0]
  401c60:	2864      	cmp	r0, #100
  401c62:	da04      	bge.n	401c6e <??LCD_WriteStringDecValue_3>
  401c64:	4668      	mov	r0, sp
  401c66:	2102      	movs	r1, #2
  401c68:	7201      	strb	r1, [r0, #8]
  401c6a:	240a      	movs	r4, #10
  401c6c:	e009      	b.n	401c82 <??LCD_WriteStringDecValue_4>

00401c6e <??LCD_WriteStringDecValue_3>:
  401c6e:	28ff      	cmp	r0, #255
  401c70:	4668      	mov	r0, sp
  401c72:	da03      	bge.n	401c7c <??LCD_WriteStringDecValue_5>
  401c74:	2103      	movs	r1, #3
  401c76:	7201      	strb	r1, [r0, #8]
  401c78:	2464      	movs	r4, #100
  401c7a:	e002      	b.n	401c82 <??LCD_WriteStringDecValue_4>

00401c7c <??LCD_WriteStringDecValue_5>:
  401c7c:	7a00      	ldrb	r0, [r0, #8]
  401c7e:	2800      	cmp	r0, #0
  401c80:	d022      	beq.n	401cc8 <??LCD_WriteStringDecValue_6>

00401c82 <??LCD_WriteStringDecValue_4>:
  401c82:	4668      	mov	r0, sp
  401c84:	7a06      	ldrb	r6, [r0, #8]

00401c86 <??LCD_WriteStringDecValue_7>:
  401c86:	1c6f      	adds	r7, r5, #1
  401c88:	063f      	lsls	r7, r7, #24
  401c8a:	0e3f      	lsrs	r7, r7, #24
  401c8c:	9800      	ldr	r0, [sp, #0]
  401c8e:	0021      	lsls	r1, r4, #0
  401c90:	f7fe fe36 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  401c94:	2800      	cmp	r0, #0
  401c96:	d00b      	beq.n	401cb0 <??LCD_WriteStringDecValue_8>
  401c98:	a903      	add	r1, sp, #12
  401c9a:	3030      	adds	r0, #48
  401c9c:	5548      	strb	r0, [r1, r5]
  401c9e:	003d      	lsls	r5, r7, #0
  401ca0:	9800      	ldr	r0, [sp, #0]
  401ca2:	0021      	lsls	r1, r4, #0
  401ca4:	f7fe fe2c 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  401ca8:	0609      	lsls	r1, r1, #24
  401caa:	0e09      	lsrs	r1, r1, #24
  401cac:	9100      	str	r1, [sp, #0]
  401cae:	e003      	b.n	401cb8 <??LCD_WriteStringDecValue_9>

00401cb0 <??LCD_WriteStringDecValue_8>:
  401cb0:	a803      	add	r0, sp, #12
  401cb2:	2130      	movs	r1, #48
  401cb4:	5541      	strb	r1, [r0, r5]
  401cb6:	003d      	lsls	r5, r7, #0

00401cb8 <??LCD_WriteStringDecValue_9>:
  401cb8:	0020      	lsls	r0, r4, #0
  401cba:	210a      	movs	r1, #10
  401cbc:	f7fe fe20 	bl	400900 <?Veneer (3) for __aeabi_idiv>
  401cc0:	0404      	lsls	r4, r0, #16
  401cc2:	1424      	asrs	r4, r4, #16
  401cc4:	1e76      	subs	r6, r6, #1
  401cc6:	d1de      	bne.n	401c86 <??LCD_WriteStringDecValue_7>

00401cc8 <??LCD_WriteStringDecValue_6>:
  401cc8:	9801      	ldr	r0, [sp, #4]
  401cca:	2801      	cmp	r0, #1
  401ccc:	da05      	bge.n	401cda <??LCD_WriteStringDecValue_10>
  401cce:	a803      	add	r0, sp, #12
  401cd0:	212e      	movs	r1, #46
  401cd2:	5541      	strb	r1, [r0, r5]
  401cd4:	1c6d      	adds	r5, r5, #1
  401cd6:	062d      	lsls	r5, r5, #24
  401cd8:	0e2d      	lsrs	r5, r5, #24

00401cda <??LCD_WriteStringDecValue_10>:
  401cda:	a810      	add	r0, sp, #64
  401cdc:	8800      	ldrh	r0, [r0, #0]
  401cde:	0600      	lsls	r0, r0, #24
  401ce0:	0e00      	lsrs	r0, r0, #24
  401ce2:	9000      	str	r0, [sp, #0]
  401ce4:	9801      	ldr	r0, [sp, #4]
  401ce6:	1c40      	adds	r0, r0, #1
  401ce8:	9001      	str	r0, [sp, #4]
  401cea:	2802      	cmp	r0, #2
  401cec:	dbb7      	blt.n	401c5e <??LCD_WriteStringDecValue_2>
  401cee:	a803      	add	r0, sp, #12
  401cf0:	2100      	movs	r1, #0
  401cf2:	5541      	strb	r1, [r0, r5]
  401cf4:	2500      	movs	r5, #0
  401cf6:	a807      	add	r0, sp, #28
  401cf8:	e007      	b.n	401d0a <??LCD_WriteStringDecValue_11>

00401cfa <??LCD_WriteStringDecValue_12>:
  401cfa:	7001      	strb	r1, [r0, #0]
  401cfc:	1c6d      	adds	r5, r5, #1
  401cfe:	062d      	lsls	r5, r5, #24
  401d00:	0e2d      	lsrs	r5, r5, #24
  401d02:	990f      	ldr	r1, [sp, #60]
  401d04:	1c49      	adds	r1, r1, #1
  401d06:	910f      	str	r1, [sp, #60]
  401d08:	1c40      	adds	r0, r0, #1

00401d0a <??LCD_WriteStringDecValue_11>:
  401d0a:	990f      	ldr	r1, [sp, #60]
  401d0c:	7809      	ldrb	r1, [r1, #0]
  401d0e:	2900      	cmp	r1, #0
  401d10:	d001      	beq.n	401d16 <??LCD_WriteStringDecValue_13>
  401d12:	2d15      	cmp	r5, #21
  401d14:	dbf1      	blt.n	401cfa <??LCD_WriteStringDecValue_12>

00401d16 <??LCD_WriteStringDecValue_13>:
  401d16:	a903      	add	r1, sp, #12
  401d18:	e005      	b.n	401d26 <??LCD_WriteStringDecValue_14>

00401d1a <??LCD_WriteStringDecValue_15>:
  401d1a:	7002      	strb	r2, [r0, #0]
  401d1c:	1c6d      	adds	r5, r5, #1
  401d1e:	062d      	lsls	r5, r5, #24
  401d20:	0e2d      	lsrs	r5, r5, #24
  401d22:	1c40      	adds	r0, r0, #1
  401d24:	1c49      	adds	r1, r1, #1

00401d26 <??LCD_WriteStringDecValue_14>:
  401d26:	780a      	ldrb	r2, [r1, #0]
  401d28:	2a00      	cmp	r2, #0
  401d2a:	d001      	beq.n	401d30 <??LCD_WriteStringDecValue_16>
  401d2c:	2d15      	cmp	r5, #21
  401d2e:	dbf4      	blt.n	401d1a <??LCD_WriteStringDecValue_15>

00401d30 <??LCD_WriteStringDecValue_16>:
  401d30:	a907      	add	r1, sp, #28
  401d32:	a811      	add	r0, sp, #68
  401d34:	7800      	ldrb	r0, [r0, #0]
  401d36:	f7ff fe6f 	bl	401a18 <LCD_WriteString_NormalFont>
  401d3a:	e058      	b.n	401dee <??LCD_WriteStringDecValue_17>

00401d3c <??LCD_WriteStringDecValue_1>:
  401d3c:	a812      	add	r0, sp, #72
  401d3e:	7800      	ldrb	r0, [r0, #0]
  401d40:	2800      	cmp	r0, #0
  401d42:	a80c      	add	r0, sp, #48
  401d44:	d14e      	bne.n	401de4 <??LCD_WriteStringDecValue_18>

00401d46 <??LCD_WriteStringDecValue_19>:
  401d46:	a910      	add	r1, sp, #64
  401d48:	8809      	ldrh	r1, [r1, #0]
  401d4a:	0709      	lsls	r1, r1, #28
  401d4c:	0f09      	lsrs	r1, r1, #28
  401d4e:	4a2c      	ldr	r2, [pc, #176]	(401e00 <??LCD_WriteStringDecValue_0+0x8>)
  401d50:	1851      	adds	r1, r2, r1
  401d52:	7d09      	ldrb	r1, [r1, #20]
  401d54:	5581      	strb	r1, [r0, r6]
  401d56:	a910      	add	r1, sp, #64
  401d58:	aa10      	add	r2, sp, #64
  401d5a:	8812      	ldrh	r2, [r2, #0]
  401d5c:	0912      	lsrs	r2, r2, #4
  401d5e:	800a      	strh	r2, [r1, #0]
  401d60:	1c76      	adds	r6, r6, #1
  401d62:	0636      	lsls	r6, r6, #24
  401d64:	0e36      	lsrs	r6, r6, #24
  401d66:	2a10      	cmp	r2, #16
  401d68:	d2ed      	bcs.n	401d46 <??LCD_WriteStringDecValue_19>
  401d6a:	0011      	lsls	r1, r2, #0
  401d6c:	4a24      	ldr	r2, [pc, #144]	(401e00 <??LCD_WriteStringDecValue_0+0x8>)
  401d6e:	1851      	adds	r1, r2, r1
  401d70:	7d09      	ldrb	r1, [r1, #20]
  401d72:	5581      	strb	r1, [r0, r6]
  401d74:	2e01      	cmp	r6, #1
  401d76:	db0b      	blt.n	401d90 <??LCD_WriteStringDecValue_20>
  401d78:	a905      	add	r1, sp, #20

00401d7a <??LCD_WriteStringDecValue_21>:
  401d7a:	5d82      	ldrb	r2, [r0, r6]
  401d7c:	700a      	strb	r2, [r1, #0]
  401d7e:	1e76      	subs	r6, r6, #1
  401d80:	0636      	lsls	r6, r6, #24
  401d82:	0e36      	lsrs	r6, r6, #24
  401d84:	1c6d      	adds	r5, r5, #1
  401d86:	062d      	lsls	r5, r5, #24
  401d88:	0e2d      	lsrs	r5, r5, #24
  401d8a:	1c49      	adds	r1, r1, #1
  401d8c:	2e01      	cmp	r6, #1
  401d8e:	daf4      	bge.n	401d7a <??LCD_WriteStringDecValue_21>

00401d90 <??LCD_WriteStringDecValue_20>:
  401d90:	a905      	add	r1, sp, #20
  401d92:	7800      	ldrb	r0, [r0, #0]
  401d94:	5548      	strb	r0, [r1, r5]
  401d96:	1c6d      	adds	r5, r5, #1
  401d98:	062d      	lsls	r5, r5, #24
  401d9a:	0e2d      	lsrs	r5, r5, #24
  401d9c:	2000      	movs	r0, #0
  401d9e:	5548      	strb	r0, [r1, r5]
  401da0:	2500      	movs	r5, #0
  401da2:	a807      	add	r0, sp, #28
  401da4:	e007      	b.n	401db6 <??LCD_WriteStringDecValue_22>

00401da6 <??LCD_WriteStringDecValue_23>:
  401da6:	7001      	strb	r1, [r0, #0]
  401da8:	1c6d      	adds	r5, r5, #1
  401daa:	062d      	lsls	r5, r5, #24
  401dac:	0e2d      	lsrs	r5, r5, #24
  401dae:	990f      	ldr	r1, [sp, #60]
  401db0:	1c49      	adds	r1, r1, #1
  401db2:	910f      	str	r1, [sp, #60]
  401db4:	1c40      	adds	r0, r0, #1

00401db6 <??LCD_WriteStringDecValue_22>:
  401db6:	990f      	ldr	r1, [sp, #60]
  401db8:	7809      	ldrb	r1, [r1, #0]
  401dba:	2900      	cmp	r1, #0
  401dbc:	d001      	beq.n	401dc2 <??LCD_WriteStringDecValue_24>
  401dbe:	2d15      	cmp	r5, #21
  401dc0:	dbf1      	blt.n	401da6 <??LCD_WriteStringDecValue_23>

00401dc2 <??LCD_WriteStringDecValue_24>:
  401dc2:	a905      	add	r1, sp, #20
  401dc4:	e005      	b.n	401dd2 <??LCD_WriteStringDecValue_25>

00401dc6 <??LCD_WriteStringDecValue_26>:
  401dc6:	7002      	strb	r2, [r0, #0]
  401dc8:	1c6d      	adds	r5, r5, #1
  401dca:	062d      	lsls	r5, r5, #24
  401dcc:	0e2d      	lsrs	r5, r5, #24
  401dce:	1c40      	adds	r0, r0, #1
  401dd0:	1c49      	adds	r1, r1, #1

00401dd2 <??LCD_WriteStringDecValue_25>:
  401dd2:	780a      	ldrb	r2, [r1, #0]
  401dd4:	2a00      	cmp	r2, #0
  401dd6:	d001      	beq.n	401ddc <??LCD_WriteStringDecValue_27>
  401dd8:	2d15      	cmp	r5, #21
  401dda:	dbf4      	blt.n	401dc6 <??LCD_WriteStringDecValue_26>

00401ddc <??LCD_WriteStringDecValue_27>:
  401ddc:	a807      	add	r0, sp, #28
  401dde:	2100      	movs	r1, #0
  401de0:	5541      	strb	r1, [r0, r5]
  401de2:	e7a5      	b.n	401d30 <??LCD_WriteStringDecValue_16>

00401de4 <??LCD_WriteStringDecValue_18>:
  401de4:	4907      	ldr	r1, [pc, #28]	(401e04 <??LCD_WriteStringDecValue_0+0xc>)
  401de6:	a811      	add	r0, sp, #68
  401de8:	7800      	ldrb	r0, [r0, #0]
  401dea:	f7ff fe15 	bl	401a18 <LCD_WriteString_NormalFont>

00401dee <??LCD_WriteStringDecValue_17>:
  401dee:	b013      	add	sp, #76
  401df0:	bcf0      	pop	{r4, r5, r6, r7}
  401df2:	bc08      	pop	{r3}
  401df4:	4718      	bx	r3
  401df6:	46c0      	nop			(mov r8, r8)

00401df8 <??LCD_WriteStringDecValue_0>:
  401df8:	2710 0000 50b5 0040 3c00 0040 3c28 0040     .'...P@..<@.(<@.

00401e08 <LCD_WriteCommand>:
  401e08:	b510      	push	{r4, lr}
  401e0a:	0004      	lsls	r4, r0, #0
  401e0c:	4811      	ldr	r0, [pc, #68]	(401e54 <??LCD_WriteCommand_0>)
  401e0e:	2100      	movs	r1, #0
  401e10:	7001      	strb	r1, [r0, #0]
  401e12:	2101      	movs	r1, #1
  401e14:	2015      	movs	r0, #21
  401e16:	f406 fb33 	bl	8480 <Gpio_SetPinData>
  401e1a:	22f0      	movs	r2, #240
  401e1c:	21f0      	movs	r1, #240
  401e1e:	2000      	movs	r0, #0
  401e20:	f406 faac 	bl	837c <Gpio_SetPortDir>
  401e24:	220f      	movs	r2, #15
  401e26:	210f      	movs	r1, #15
  401e28:	2001      	movs	r0, #1
  401e2a:	f406 faa7 	bl	837c <Gpio_SetPortDir>
  401e2e:	2101      	movs	r1, #1
  401e30:	2014      	movs	r0, #20
  401e32:	f406 fb25 	bl	8480 <Gpio_SetPinData>
  401e36:	2101      	movs	r1, #1
  401e38:	2009      	movs	r0, #9
  401e3a:	f406 fb21 	bl	8480 <Gpio_SetPinData>
  401e3e:	22f0      	movs	r2, #240
  401e40:	0121      	lsls	r1, r4, #4
  401e42:	2000      	movs	r0, #0
  401e44:	f406 faf6 	bl	8434 <Gpio_SetPortData>
  401e48:	220f      	movs	r2, #15
  401e4a:	0921      	lsrs	r1, r4, #4
  401e4c:	2001      	movs	r0, #1
  401e4e:	f406 faf1 	bl	8434 <Gpio_SetPortData>
  401e52:	e025      	b.n	401ea0 <?Subroutine0>

00401e54 <??LCD_WriteCommand_0>:
  401e54:	50b5 0040                                   .P@.

00401e58 <LCD_WriteData>:
  401e58:	b510      	push	{r4, lr}
  401e5a:	0004      	lsls	r4, r0, #0
  401e5c:	481f      	ldr	r0, [pc, #124]	(401edc <??DataTable6>)
  401e5e:	2100      	movs	r1, #0
  401e60:	7001      	strb	r1, [r0, #0]
  401e62:	2015      	movs	r0, #21
  401e64:	f406 fb0c 	bl	8480 <Gpio_SetPinData>
  401e68:	2101      	movs	r1, #1
  401e6a:	2014      	movs	r0, #20
  401e6c:	f406 fb08 	bl	8480 <Gpio_SetPinData>
  401e70:	22f0      	movs	r2, #240
  401e72:	21f0      	movs	r1, #240
  401e74:	2000      	movs	r0, #0
  401e76:	f406 fa81 	bl	837c <Gpio_SetPortDir>
  401e7a:	220f      	movs	r2, #15
  401e7c:	210f      	movs	r1, #15
  401e7e:	2001      	movs	r0, #1
  401e80:	f406 fa7c 	bl	837c <Gpio_SetPortDir>
  401e84:	22f0      	movs	r2, #240
  401e86:	0121      	lsls	r1, r4, #4
  401e88:	2000      	movs	r0, #0
  401e8a:	f406 fad3 	bl	8434 <Gpio_SetPortData>
  401e8e:	220f      	movs	r2, #15
  401e90:	0921      	lsrs	r1, r4, #4
  401e92:	2001      	movs	r0, #1
  401e94:	f406 face 	bl	8434 <Gpio_SetPortData>
  401e98:	2101      	movs	r1, #1
  401e9a:	2009      	movs	r0, #9
  401e9c:	f406 faf0 	bl	8480 <Gpio_SetPinData>

00401ea0 <?Subroutine0>:
  401ea0:	2001      	movs	r0, #1
  401ea2:	f001 fe9d 	bl	403be0 <DelayUs>
  401ea6:	2100      	movs	r1, #0
  401ea8:	2009      	movs	r0, #9
  401eaa:	f406 fae9 	bl	8480 <Gpio_SetPinData>
  401eae:	2100      	movs	r1, #0
  401eb0:	2014      	movs	r0, #20
  401eb2:	f406 fae5 	bl	8480 <Gpio_SetPinData>
  401eb6:	22f0      	movs	r2, #240
  401eb8:	21f0      	movs	r1, #240
  401eba:	43c9      	mvns	r1, r1
  401ebc:	2000      	movs	r0, #0
  401ebe:	f406 fa5d 	bl	837c <Gpio_SetPortDir>
  401ec2:	220f      	movs	r2, #15
  401ec4:	210f      	movs	r1, #15
  401ec6:	43c9      	mvns	r1, r1
  401ec8:	2001      	movs	r0, #1
  401eca:	f406 fa57 	bl	837c <Gpio_SetPortDir>
  401ece:	2001      	movs	r0, #1
  401ed0:	f001 fe86 	bl	403be0 <DelayUs>

00401ed4 <??Subroutine1_0>:
  401ed4:	bc10      	pop	{r4}
  401ed6:	bc08      	pop	{r3}
  401ed8:	4718      	bx	r3
	...

00401edc <??DataTable6>:
  401edc:	50b5 0040                                   .P@.

00401ee0 <LCD_SetFont>:
  401ee0:	4905      	ldr	r1, [pc, #20]	(401ef8 <??LCD_SetFont_0>)
  401ee2:	2200      	movs	r2, #0
  401ee4:	700a      	strb	r2, [r1, #0]
  401ee6:	2802      	cmp	r0, #2
  401ee8:	d203      	bcs.n	401ef2 <??LCD_SetFont_1>
  401eea:	4904      	ldr	r1, [pc, #16]	(401efc <??LCD_SetFont_0+0x4>)
  401eec:	7008      	strb	r0, [r1, #0]
  401eee:	2001      	movs	r0, #1
  401ef0:	4770      	bx	lr

00401ef2 <??LCD_SetFont_1>:
  401ef2:	2000      	movs	r0, #0

00401ef4 <??LCD_SetFont_2>:
  401ef4:	4770      	bx	lr
  401ef6:	46c0      	nop			(mov r8, r8)

00401ef8 <??LCD_SetFont_0>:
  401ef8:	50b5 0040 50cd 0040                         .P@..P@.

00401f00 <LCD_SetBacklight>:
  401f00:	b580      	push	{r7, lr}
  401f02:	1e41      	subs	r1, r0, #1
  401f04:	4189      	sbcs	r1, r1
  401f06:	43c9      	mvns	r1, r1
  401f08:	0fc9      	lsrs	r1, r1, #31
  401f0a:	200a      	movs	r0, #10
  401f0c:	f406 fab8 	bl	8480 <Gpio_SetPinData>
  401f10:	bc09      	pop	{r0, r3}
  401f12:	4718      	bx	r3

00401f14 <LCD_WritePixel>:
  401f14:	b5f0      	push	{r4, r5, r6, r7, lr}
  401f16:	b083      	sub	sp, #12
  401f18:	0005      	lsls	r5, r0, #0
  401f1a:	0017      	lsls	r7, r2, #0
  401f1c:	2d80      	cmp	r5, #128
  401f1e:	d300      	bcc.n	401f22 <LCD_WritePixel+0xe>
  401f20:	e088      	b.n	402034 <??LCD_WritePixel_0>
  401f22:	2940      	cmp	r1, #64
  401f24:	d300      	bcc.n	401f28 <LCD_WritePixel+0x14>
  401f26:	e085      	b.n	402034 <??LCD_WritePixel_0>
  401f28:	08ce      	lsrs	r6, r1, #3
  401f2a:	074c      	lsls	r4, r1, #29
  401f2c:	0f64      	lsrs	r4, r4, #29
  401f2e:	2040      	movs	r0, #64
  401f30:	f7ff ff6a 	bl	401e08 <LCD_WriteCommand>
  401f34:	4668      	mov	r0, sp
  401f36:	3e50      	subs	r6, #80
  401f38:	7046      	strb	r6, [r0, #1]
  401f3a:	7840      	ldrb	r0, [r0, #1]
  401f3c:	f7ff ff64 	bl	401e08 <LCD_WriteCommand>
  401f40:	4668      	mov	r0, sp
  401f42:	0929      	lsrs	r1, r5, #4
  401f44:	2210      	movs	r2, #16
  401f46:	430a      	orrs	r2, r1
  401f48:	7002      	strb	r2, [r0, #0]
  401f4a:	0010      	lsls	r0, r2, #0
  401f4c:	f7ff ff5c 	bl	401e08 <LCD_WriteCommand>
  401f50:	072e      	lsls	r6, r5, #28
  401f52:	0f36      	lsrs	r6, r6, #28
  401f54:	0030      	lsls	r0, r6, #0
  401f56:	f7ff ff57 	bl	401e08 <LCD_WriteCommand>
  401f5a:	2100      	movs	r1, #0
  401f5c:	2015      	movs	r0, #21
  401f5e:	f406 fa8f 	bl	8480 <Gpio_SetPinData>
  401f62:	2101      	movs	r1, #1
  401f64:	2014      	movs	r0, #20
  401f66:	f406 fa8b 	bl	8480 <Gpio_SetPinData>
  401f6a:	2001      	movs	r0, #1
  401f6c:	f001 fe38 	bl	403be0 <DelayUs>
  401f70:	2101      	movs	r1, #1
  401f72:	2008      	movs	r0, #8
  401f74:	f406 fa84 	bl	8480 <Gpio_SetPinData>
  401f78:	2001      	movs	r0, #1
  401f7a:	f001 fe31 	bl	403be0 <DelayUs>
  401f7e:	a902      	add	r1, sp, #8
  401f80:	2000      	movs	r0, #0
  401f82:	f406 fa6d 	bl	8460 <Gpio_GetPortData>
  401f86:	a902      	add	r1, sp, #8
  401f88:	2001      	movs	r0, #1
  401f8a:	f406 fa69 	bl	8460 <Gpio_GetPortData>
  401f8e:	2100      	movs	r1, #0
  401f90:	2008      	movs	r0, #8
  401f92:	f406 fa75 	bl	8480 <Gpio_SetPinData>
  401f96:	2100      	movs	r1, #0
  401f98:	2014      	movs	r0, #20
  401f9a:	f406 fa71 	bl	8480 <Gpio_SetPinData>
  401f9e:	2001      	movs	r0, #1
  401fa0:	f001 fe1e 	bl	403be0 <DelayUs>
  401fa4:	2100      	movs	r1, #0
  401fa6:	2015      	movs	r0, #21
  401fa8:	f406 fa6a 	bl	8480 <Gpio_SetPinData>
  401fac:	2101      	movs	r1, #1
  401fae:	2014      	movs	r0, #20
  401fb0:	f406 fa66 	bl	8480 <Gpio_SetPinData>
  401fb4:	2001      	movs	r0, #1
  401fb6:	f001 fe13 	bl	403be0 <DelayUs>
  401fba:	2101      	movs	r1, #1
  401fbc:	2008      	movs	r0, #8
  401fbe:	f406 fa5f 	bl	8480 <Gpio_SetPinData>
  401fc2:	2001      	movs	r0, #1
  401fc4:	f001 fe0c 	bl	403be0 <DelayUs>
  401fc8:	a901      	add	r1, sp, #4
  401fca:	2000      	movs	r0, #0
  401fcc:	f406 fa48 	bl	8460 <Gpio_GetPortData>
  401fd0:	9801      	ldr	r0, [sp, #4]
  401fd2:	21f0      	movs	r1, #240
  401fd4:	4001      	ands	r1, r0
  401fd6:	090d      	lsrs	r5, r1, #4
  401fd8:	a901      	add	r1, sp, #4
  401fda:	2001      	movs	r0, #1
  401fdc:	f406 fa40 	bl	8460 <Gpio_GetPortData>
  401fe0:	2100      	movs	r1, #0
  401fe2:	2008      	movs	r0, #8
  401fe4:	f406 fa4c 	bl	8480 <Gpio_SetPinData>
  401fe8:	2100      	movs	r1, #0
  401fea:	2014      	movs	r0, #20
  401fec:	f406 fa48 	bl	8480 <Gpio_SetPinData>
  401ff0:	2001      	movs	r0, #1
  401ff2:	f001 fdf5 	bl	403be0 <DelayUs>
  401ff6:	9801      	ldr	r0, [sp, #4]
  401ff8:	0100      	lsls	r0, r0, #4
  401ffa:	4328      	orrs	r0, r5
  401ffc:	0605      	lsls	r5, r0, #24
  401ffe:	0e2d      	lsrs	r5, r5, #24
  402000:	2040      	movs	r0, #64
  402002:	f7ff ff01 	bl	401e08 <LCD_WriteCommand>
  402006:	4668      	mov	r0, sp
  402008:	7840      	ldrb	r0, [r0, #1]
  40200a:	f7ff fefd 	bl	401e08 <LCD_WriteCommand>
  40200e:	4668      	mov	r0, sp
  402010:	7800      	ldrb	r0, [r0, #0]
  402012:	f7ff fef9 	bl	401e08 <LCD_WriteCommand>
  402016:	0030      	lsls	r0, r6, #0
  402018:	f7ff fef6 	bl	401e08 <LCD_WriteCommand>
  40201c:	2001      	movs	r0, #1
  40201e:	40a0      	lsls	r0, r4
  402020:	2f01      	cmp	r7, #1
  402022:	d103      	bne.n	40202c <??LCD_WritePixel_1>
  402024:	4328      	orrs	r0, r5
  402026:	0600      	lsls	r0, r0, #24
  402028:	0e00      	lsrs	r0, r0, #24
  40202a:	e001      	b.n	402030 <??LCD_WritePixel_2>

0040202c <??LCD_WritePixel_1>:
  40202c:	4385      	bics	r5, r0
  40202e:	0028      	lsls	r0, r5, #0

00402030 <??LCD_WritePixel_2>:
  402030:	f7ff ff12 	bl	401e58 <LCD_WriteData>

00402034 <??LCD_WritePixel_0>:
  402034:	b003      	add	sp, #12
  402036:	bcf0      	pop	{r4, r5, r6, r7}
  402038:	bc08      	pop	{r3}
  40203a:	4718      	bx	r3

0040203c <LCD_WriteCharacter>:
  40203c:	b5f2      	push	{r1, r4, r5, r6, r7, lr}
  40203e:	b082      	sub	sp, #8
  402040:	0014      	lsls	r4, r2, #0
  402042:	4669      	mov	r1, sp
  402044:	7a09      	ldrb	r1, [r1, #8]
  402046:	2980      	cmp	r1, #128
  402048:	d301      	bcc.n	40204e <??LCD_WriteCharacter_0>
  40204a:	2c40      	cmp	r4, #64
  40204c:	d25e      	bcs.n	40210c <??LCD_WriteCharacter_1>

0040204e <??LCD_WriteCharacter_0>:
  40204e:	3820      	subs	r0, #32
  402050:	0400      	lsls	r0, r0, #16
  402052:	4930      	ldr	r1, [pc, #192]	(402114 <??LCD_WriteCharacter_2>)
  402054:	7809      	ldrb	r1, [r1, #0]
  402056:	004a      	lsls	r2, r1, #1
  402058:	1851      	adds	r1, r2, r1
  40205a:	0089      	lsls	r1, r1, #2
  40205c:	4a2e      	ldr	r2, [pc, #184]	(402118 <??LCD_WriteCharacter_2+0x4>)
  40205e:	1851      	adds	r1, r2, r1
  402060:	7a0d      	ldrb	r5, [r1, #8]
  402062:	2d00      	cmp	r5, #0
  402064:	d052      	beq.n	40210c <??LCD_WriteCharacter_1>
  402066:	0bc7      	lsrs	r7, r0, #15
  402068:	4668      	mov	r0, sp
  40206a:	7a00      	ldrb	r0, [r0, #8]
  40206c:	0900      	lsrs	r0, r0, #4
  40206e:	2110      	movs	r1, #16
  402070:	4301      	orrs	r1, r0
  402072:	4668      	mov	r0, sp
  402074:	7001      	strb	r1, [r0, #0]
  402076:	2d01      	cmp	r5, #1
  402078:	db48      	blt.n	40210c <??LCD_WriteCharacter_1>

0040207a <??LCD_WriteCharacter_3>:
  40207a:	1e6d      	subs	r5, r5, #1
  40207c:	062d      	lsls	r5, r5, #24
  40207e:	0e2d      	lsrs	r5, r5, #24
  402080:	2040      	movs	r0, #64
  402082:	f7ff fec1 	bl	401e08 <LCD_WriteCommand>
  402086:	0626      	lsls	r6, r4, #24
  402088:	0ef6      	lsrs	r6, r6, #27
  40208a:	0030      	lsls	r0, r6, #0
  40208c:	3850      	subs	r0, #80
  40208e:	0600      	lsls	r0, r0, #24
  402090:	0e00      	lsrs	r0, r0, #24
  402092:	f7ff feb9 	bl	401e08 <LCD_WriteCommand>
  402096:	4668      	mov	r0, sp
  402098:	7800      	ldrb	r0, [r0, #0]
  40209a:	f7ff feb5 	bl	401e08 <LCD_WriteCommand>
  40209e:	4668      	mov	r0, sp
  4020a0:	7a00      	ldrb	r0, [r0, #8]
  4020a2:	0700      	lsls	r0, r0, #28
  4020a4:	0f00      	lsrs	r0, r0, #28
  4020a6:	f7ff feaf 	bl	401e08 <LCD_WriteCommand>
  4020aa:	481c      	ldr	r0, [pc, #112]	(40211c <??LCD_WriteCharacter_2+0x8>)
  4020ac:	7800      	ldrb	r0, [r0, #0]
  4020ae:	2101      	movs	r1, #1
  4020b0:	40b1      	lsls	r1, r6
  4020b2:	4301      	orrs	r1, r0
  4020b4:	4819      	ldr	r0, [pc, #100]	(40211c <??LCD_WriteCharacter_2+0x8>)
  4020b6:	7001      	strb	r1, [r0, #0]
  4020b8:	2600      	movs	r6, #0
  4020ba:	e014      	b.n	4020e6 <??LCD_WriteCharacter_4>

004020bc <??LCD_WriteCharacter_5>:
  4020bc:	19a9      	adds	r1, r5, r6
  4020be:	6802      	ldr	r2, [r0, #0]
  4020c0:	5bd2      	ldrh	r2, [r2, r7]
  4020c2:	7a03      	ldrb	r3, [r0, #8]
  4020c4:	435a      	muls	r2, r3
  4020c6:	1889      	adds	r1, r1, r2
  4020c8:	6840      	ldr	r0, [r0, #4]
  4020ca:	5c40      	ldrb	r0, [r0, r1]
  4020cc:	f7ff fec4 	bl	401e58 <LCD_WriteData>
  4020d0:	4810      	ldr	r0, [pc, #64]	(402114 <??LCD_WriteCharacter_2>)
  4020d2:	7800      	ldrb	r0, [r0, #0]
  4020d4:	0041      	lsls	r1, r0, #1
  4020d6:	1808      	adds	r0, r1, r0
  4020d8:	0080      	lsls	r0, r0, #2
  4020da:	490f      	ldr	r1, [pc, #60]	(402118 <??LCD_WriteCharacter_2+0x4>)
  4020dc:	1808      	adds	r0, r1, r0
  4020de:	7a00      	ldrb	r0, [r0, #8]
  4020e0:	1836      	adds	r6, r6, r0
  4020e2:	0636      	lsls	r6, r6, #24
  4020e4:	0e36      	lsrs	r6, r6, #24

004020e6 <??LCD_WriteCharacter_4>:
  4020e6:	480b      	ldr	r0, [pc, #44]	(402114 <??LCD_WriteCharacter_2>)
  4020e8:	7800      	ldrb	r0, [r0, #0]
  4020ea:	0041      	lsls	r1, r0, #1
  4020ec:	1808      	adds	r0, r1, r0
  4020ee:	0080      	lsls	r0, r0, #2
  4020f0:	4909      	ldr	r1, [pc, #36]	(402118 <??LCD_WriteCharacter_2+0x4>)
  4020f2:	1808      	adds	r0, r1, r0
  4020f4:	6801      	ldr	r1, [r0, #0]
  4020f6:	19c9      	adds	r1, r1, r7
  4020f8:	884a      	ldrh	r2, [r1, #2]
  4020fa:	8809      	ldrh	r1, [r1, #0]
  4020fc:	1a51      	subs	r1, r2, r1
  4020fe:	7a02      	ldrb	r2, [r0, #8]
  402100:	4351      	muls	r1, r2
  402102:	428e      	cmp	r6, r1
  402104:	dbda      	blt.n	4020bc <??LCD_WriteCharacter_5>
  402106:	3408      	adds	r4, #8
  402108:	2d01      	cmp	r5, #1
  40210a:	dab6      	bge.n	40207a <??LCD_WriteCharacter_3>

0040210c <??LCD_WriteCharacter_1>:
  40210c:	b003      	add	sp, #12
  40210e:	bcf0      	pop	{r4, r5, r6, r7}
  402110:	bc08      	pop	{r3}
  402112:	4718      	bx	r3

00402114 <??LCD_WriteCharacter_2>:
  402114:	50cd 0040 3ce8 0040 50c3 0040               .P@..<@..P@.

00402120 <LCD_ClearPage>:
  402120:	b570      	push	{r4, r5, r6, lr}
  402122:	0004      	lsls	r4, r0, #0
  402124:	000d      	lsls	r5, r1, #0
  402126:	0016      	lsls	r6, r2, #0
  402128:	2040      	movs	r0, #64
  40212a:	f7ff fe6d 	bl	401e08 <LCD_WriteCommand>
  40212e:	08f0      	lsrs	r0, r6, #3
  402130:	3850      	subs	r0, #80
  402132:	0600      	lsls	r0, r0, #24
  402134:	0e00      	lsrs	r0, r0, #24
  402136:	f7ff fe67 	bl	401e08 <LCD_WriteCommand>
  40213a:	0921      	lsrs	r1, r4, #4
  40213c:	2010      	movs	r0, #16
  40213e:	4308      	orrs	r0, r1
  402140:	f7ff fe62 	bl	401e08 <LCD_WriteCommand>
  402144:	0720      	lsls	r0, r4, #28
  402146:	0f00      	lsrs	r0, r0, #28
  402148:	f7ff fe5e 	bl	401e08 <LCD_WriteCommand>
  40214c:	42ac      	cmp	r4, r5
  40214e:	d208      	bcs.n	402162 <??LCD_ClearPage_0>
  402150:	da07      	bge.n	402162 <??LCD_ClearPage_0>

00402152 <??LCD_ClearPage_1>:
  402152:	2000      	movs	r0, #0
  402154:	f7ff fe80 	bl	401e58 <LCD_WriteData>
  402158:	1c64      	adds	r4, r4, #1
  40215a:	0624      	lsls	r4, r4, #24
  40215c:	0e24      	lsrs	r4, r4, #24
  40215e:	42ac      	cmp	r4, r5
  402160:	dbf7      	blt.n	402152 <??LCD_ClearPage_1>

00402162 <??LCD_ClearPage_0>:
  402162:	bc70      	pop	{r4, r5, r6}
  402164:	bc08      	pop	{r3}
  402166:	4718      	bx	r3

00402168 <LCD_ClearLine>:
  402168:	b510      	push	{r4, lr}
  40216a:	2808      	cmp	r0, #8
  40216c:	d225      	bcs.n	4021ba <??LCD_ClearLine_0>
  40216e:	4c14      	ldr	r4, [pc, #80]	(4021c0 <??LCD_ClearLine_1>)
  402170:	7f21      	ldrb	r1, [r4, #28]
  402172:	2900      	cmp	r1, #0
  402174:	d009      	beq.n	40218a <??LCD_ClearLine_2>
  402176:	0041      	lsls	r1, r0, #1
  402178:	1809      	adds	r1, r1, r0
  40217a:	1861      	adds	r1, r4, r1
  40217c:	790a      	ldrb	r2, [r1, #4]
  40217e:	7022      	strb	r2, [r4, #0]
  402180:	2280      	movs	r2, #128
  402182:	7062      	strb	r2, [r4, #1]
  402184:	7949      	ldrb	r1, [r1, #5]
  402186:	70a1      	strb	r1, [r4, #2]
  402188:	70e0      	strb	r0, [r4, #3]

0040218a <??LCD_ClearLine_2>:
  40218a:	78a2      	ldrb	r2, [r4, #2]
  40218c:	7861      	ldrb	r1, [r4, #1]
  40218e:	7820      	ldrb	r0, [r4, #0]
  402190:	1a0b      	subs	r3, r1, r0
  402192:	2b20      	cmp	r3, #32
  402194:	db0c      	blt.n	4021b0 <??LCD_ClearLine_3>
  402196:	2100      	movs	r1, #0
  402198:	7721      	strb	r1, [r4, #28]
  40219a:	0001      	lsls	r1, r0, #0
  40219c:	3120      	adds	r1, #32
  40219e:	0609      	lsls	r1, r1, #24
  4021a0:	0e09      	lsrs	r1, r1, #24
  4021a2:	f7ff ffbd 	bl	402120 <LCD_ClearPage>
  4021a6:	7820      	ldrb	r0, [r4, #0]
  4021a8:	3020      	adds	r0, #32
  4021aa:	7020      	strb	r0, [r4, #0]
  4021ac:	2000      	movs	r0, #0
  4021ae:	e005      	b.n	4021bc <??LCD_ClearLine_4>

004021b0 <??LCD_ClearLine_3>:
  4021b0:	f7ff ffb6 	bl	402120 <LCD_ClearPage>
  4021b4:	2001      	movs	r0, #1
  4021b6:	7720      	strb	r0, [r4, #28]
  4021b8:	e000      	b.n	4021bc <??LCD_ClearLine_4>

004021ba <??LCD_ClearLine_0>:
  4021ba:	20ff      	movs	r0, #255

004021bc <??LCD_ClearLine_4>:
  4021bc:	e68a      	b.n	401ed4 <??Subroutine1_0>
  4021be:	46c0      	nop			(mov r8, r8)

004021c0 <??LCD_ClearLine_1>:
  4021c0:	5294 0040                                   .R@.

004021c4 <execute_current_message_callback>:
  4021c4:	b580      	push	{r7, lr}
  4021c6:	488c      	ldr	r0, [pc, #560]	(4023f8 <??DataTable9>)
  4021c8:	7841      	ldrb	r1, [r0, #1]
  4021ca:	0089      	lsls	r1, r1, #2
  4021cc:	1840      	adds	r0, r0, r1
  4021ce:	6ac0      	ldr	r0, [r0, #44]
  4021d0:	2800      	cmp	r0, #0
  4021d2:	d005      	beq.n	4021e0 <??execute_current_message_callback_0>
  4021d4:	68c1      	ldr	r1, [r0, #12]
  4021d6:	2900      	cmp	r1, #0
  4021d8:	d002      	beq.n	4021e0 <??execute_current_message_callback_0>
  4021da:	0008      	lsls	r0, r1, #0
  4021dc:	f001 fdb6 	bl	403d4c <__iar_via_R0>

004021e0 <??execute_current_message_callback_0>:
  4021e0:	bc09      	pop	{r0, r3}
  4021e2:	4718      	bx	r3

004021e4 <handle_new_message>:
  4021e4:	b430      	push	{r4, r5}
  4021e6:	4a84      	ldr	r2, [pc, #528]	(4023f8 <??DataTable9>)
  4021e8:	7893      	ldrb	r3, [r2, #2]
  4021ea:	009c      	lsls	r4, r3, #2
  4021ec:	1914      	adds	r4, r2, r4
  4021ee:	6ae5      	ldr	r5, [r4, #44]
  4021f0:	2d00      	cmp	r5, #0
  4021f2:	d001      	beq.n	4021f8 <??handle_new_message_0>
  4021f4:	2002      	movs	r0, #2
  4021f6:	e00c      	b.n	402212 <??handle_new_message_1>

004021f8 <??handle_new_message_0>:
  4021f8:	7805      	ldrb	r5, [r0, #0]
  4021fa:	076d      	lsls	r5, r5, #29
  4021fc:	0f6d      	lsrs	r5, r5, #29
  4021fe:	7005      	strb	r5, [r0, #0]
  402200:	62e0      	str	r0, [r4, #44]
  402202:	63e1      	str	r1, [r4, #60]
  402204:	2b03      	cmp	r3, #3
  402206:	d101      	bne.n	40220c <??handle_new_message_2>
  402208:	2300      	movs	r3, #0
  40220a:	e000      	b.n	40220e <??handle_new_message_3>

0040220c <??handle_new_message_2>:
  40220c:	1c5b      	adds	r3, r3, #1

0040220e <??handle_new_message_3>:
  40220e:	7093      	strb	r3, [r2, #2]
  402210:	2000      	movs	r0, #0

00402212 <??handle_new_message_1>:
  402212:	bc30      	pop	{r4, r5}
  402214:	4770      	bx	lr

00402216 <release_current_message>:
  402216:	4878      	ldr	r0, [pc, #480]	(4023f8 <??DataTable9>)
  402218:	7841      	ldrb	r1, [r0, #1]
  40221a:	008a      	lsls	r2, r1, #2
  40221c:	1882      	adds	r2, r0, r2
  40221e:	6ad3      	ldr	r3, [r2, #44]
  402220:	2b00      	cmp	r3, #0
  402222:	d008      	beq.n	402236 <??release_current_message_0>
  402224:	2300      	movs	r3, #0
  402226:	62d3      	str	r3, [r2, #44]
  402228:	63d3      	str	r3, [r2, #60]
  40222a:	2903      	cmp	r1, #3
  40222c:	d101      	bne.n	402232 <??release_current_message_1>
  40222e:	2100      	movs	r1, #0
  402230:	e000      	b.n	402234 <??release_current_message_2>

00402232 <??release_current_message_1>:
  402232:	1c49      	adds	r1, r1, #1

00402234 <??release_current_message_2>:
  402234:	7041      	strb	r1, [r0, #1]

00402236 <??release_current_message_0>:
  402236:	2000      	movs	r0, #0
  402238:	4770      	bx	lr
	...

0040223c <radio_manager_init>:
  40223c:	2000      	movs	r0, #0
  40223e:	496e      	ldr	r1, [pc, #440]	(4023f8 <??DataTable9>)
  402240:	62c8      	str	r0, [r1, #44]
  402242:	63c8      	str	r0, [r1, #60]
  402244:	6308      	str	r0, [r1, #48]
  402246:	6408      	str	r0, [r1, #64]
  402248:	6348      	str	r0, [r1, #52]
  40224a:	6448      	str	r0, [r1, #68]
  40224c:	6388      	str	r0, [r1, #56]
  40224e:	6488      	str	r0, [r1, #72]
  402250:	7048      	strb	r0, [r1, #1]
  402252:	7088      	strb	r0, [r1, #2]
  402254:	6508      	str	r0, [r1, #80]
  402256:	70c8      	strb	r0, [r1, #3]
  402258:	000a      	lsls	r2, r1, #0
  40225a:	325c      	adds	r2, #92
  40225c:	60ca      	str	r2, [r1, #12]
  40225e:	6148      	str	r0, [r1, #20]
  402260:	201a      	movs	r0, #26
  402262:	7208      	strb	r0, [r1, #8]
  402264:	4801      	ldr	r0, [pc, #4]	(40226c <??radio_manager_init_0>)
  402266:	8508      	strh	r0, [r1, #40]
  402268:	2000      	movs	r0, #0
  40226a:	4770      	bx	lr

0040226c <??radio_manager_init_0>:
  40226c:	ffff 0000                                   ....

00402270 <process_radio_msg>:
  402270:	b510      	push	{r4, lr}
  402272:	4c61      	ldr	r4, [pc, #388]	(4023f8 <??DataTable9>)
  402274:	7860      	ldrb	r0, [r4, #1]
  402276:	0080      	lsls	r0, r0, #2
  402278:	1820      	adds	r0, r4, r0
  40227a:	6ac0      	ldr	r0, [r0, #44]
  40227c:	2800      	cmp	r0, #0
  40227e:	d00b      	beq.n	402298 <??process_radio_msg_0>
  402280:	2107      	movs	r1, #7
  402282:	7802      	ldrb	r2, [r0, #0]
  402284:	400a      	ands	r2, r1
  402286:	2a04      	cmp	r2, #4
  402288:	d206      	bcs.n	402298 <??process_radio_msg_0>
  40228a:	7800      	ldrb	r0, [r0, #0]
  40228c:	4001      	ands	r1, r0
  40228e:	0088      	lsls	r0, r1, #2
  402290:	4906      	ldr	r1, [pc, #24]	(4022ac <??process_radio_msg_1>)
  402292:	5808      	ldr	r0, [r1, r0]
  402294:	f001 fd5a 	bl	403d4c <__iar_via_R0>

00402298 <??process_radio_msg_0>:
  402298:	78e0      	ldrb	r0, [r4, #3]
  40229a:	2801      	cmp	r0, #1
  40229c:	d101      	bne.n	4022a2 <??process_radio_msg_2>
  40229e:	f000 fb35 	bl	40290c <process_scan_req>

004022a2 <??process_radio_msg_2>:
  4022a2:	2000      	movs	r0, #0
  4022a4:	bc10      	pop	{r4}
  4022a6:	bc08      	pop	{r3}
  4022a8:	4718      	bx	r3
  4022aa:	46c0      	nop			(mov r8, r8)

004022ac <??process_radio_msg_1>:
  4022ac:	3d18 0040                                   .=@.

004022b0 <process_tx_msg>:
  4022b0:	b538      	push	{r3, r4, r5, lr}
  4022b2:	4c51      	ldr	r4, [pc, #324]	(4023f8 <??DataTable9>)
  4022b4:	7860      	ldrb	r0, [r4, #1]
  4022b6:	0080      	lsls	r0, r0, #2
  4022b8:	1820      	adds	r0, r4, r0
  4022ba:	6ac0      	ldr	r0, [r0, #44]
  4022bc:	7801      	ldrb	r1, [r0, #0]
  4022be:	08c9      	lsrs	r1, r1, #3
  4022c0:	d006      	beq.n	4022d0 <??process_tx_msg_0>
  4022c2:	1e49      	subs	r1, r1, #1
  4022c4:	d01a      	beq.n	4022fc <??process_tx_msg_1>
  4022c6:	1e49      	subs	r1, r1, #1
  4022c8:	d029      	beq.n	40231e <??process_tx_msg_2>
  4022ca:	1f09      	subs	r1, r1, #4
  4022cc:	d05e      	beq.n	40238c <??process_tx_msg_3>
  4022ce:	e063      	b.n	402398 <??process_tx_msg_4>

004022d0 <??process_tx_msg_0>:
  4022d0:	2100      	movs	r1, #0
  4022d2:	6521      	str	r1, [r4, #80]
  4022d4:	7021      	strb	r1, [r4, #0]
  4022d6:	7a01      	ldrb	r1, [r0, #8]
  4022d8:	1d09      	adds	r1, r1, #4
  4022da:	4a48      	ldr	r2, [pc, #288]	(4023fc <??DataTable12>)
  4022dc:	6011      	str	r1, [r2, #0]
  4022de:	4948      	ldr	r1, [pc, #288]	(402400 <??DataTable13>)
  4022e0:	6842      	ldr	r2, [r0, #4]
  4022e2:	678a      	str	r2, [r1, #120]
  4022e4:	0022      	lsls	r2, r4, #0
  4022e6:	3260      	adds	r2, #96
  4022e8:	674a      	str	r2, [r1, #116]
  4022ea:	4a42      	ldr	r2, [pc, #264]	(4023f4 <??process_tx_msg_5>)
  4022ec:	600a      	str	r2, [r1, #0]
  4022ee:	7801      	ldrb	r1, [r0, #0]
  4022f0:	0749      	lsls	r1, r1, #29
  4022f2:	0f49      	lsrs	r1, r1, #29
  4022f4:	2208      	movs	r2, #8

004022f6 <??process_tx_msg_6>:
  4022f6:	430a      	orrs	r2, r1
  4022f8:	7002      	strb	r2, [r0, #0]
  4022fa:	e04f      	b.n	40239c <??process_tx_msg_7>

004022fc <??process_tx_msg_1>:
  4022fc:	6d21      	ldr	r1, [r4, #80]
  4022fe:	07ca      	lsls	r2, r1, #31
  402300:	d404      	bmi.n	40230c <??process_tx_msg_8>
  402302:	2220      	movs	r2, #32
  402304:	400a      	ands	r2, r1
  402306:	0951      	lsrs	r1, r2, #5
  402308:	2901      	cmp	r1, #1
  40230a:	d147      	bne.n	40239c <??process_tx_msg_7>

0040230c <??process_tx_msg_8>:
  40230c:	6d21      	ldr	r1, [r4, #80]
  40230e:	2201      	movs	r2, #1
  402310:	4391      	bics	r1, r2
  402312:	6521      	str	r1, [r4, #80]
  402314:	7801      	ldrb	r1, [r0, #0]
  402316:	0749      	lsls	r1, r1, #29
  402318:	0f49      	lsrs	r1, r1, #29
  40231a:	2210      	movs	r2, #16
  40231c:	e7eb      	b.n	4022f6 <??process_tx_msg_6>

0040231e <??process_tx_msg_2>:
  40231e:	2120      	movs	r1, #32
  402320:	6d22      	ldr	r2, [r4, #80]
  402322:	400a      	ands	r2, r1
  402324:	0952      	lsrs	r2, r2, #5
  402326:	2a01      	cmp	r2, #1
  402328:	d138      	bne.n	40239c <??process_tx_msg_7>
  40232a:	6d23      	ldr	r3, [r4, #80]
  40232c:	438b      	bics	r3, r1
  40232e:	6523      	str	r3, [r4, #80]
  402330:	2207      	movs	r2, #7
  402332:	2540      	movs	r5, #64
  402334:	401d      	ands	r5, r3
  402336:	09ab      	lsrs	r3, r5, #6
  402338:	2b01      	cmp	r3, #1
  40233a:	d108      	bne.n	40234e <??process_tx_msg_9>
  40233c:	6d23      	ldr	r3, [r4, #80]
  40233e:	2540      	movs	r5, #64
  402340:	43ab      	bics	r3, r5
  402342:	6523      	str	r3, [r4, #80]
  402344:	7803      	ldrb	r3, [r0, #0]
  402346:	401a      	ands	r2, r3
  402348:	4311      	orrs	r1, r2
  40234a:	7001      	strb	r1, [r0, #0]
  40234c:	e024      	b.n	402398 <??process_tx_msg_4>

0040234e <??process_tx_msg_9>:
  40234e:	7821      	ldrb	r1, [r4, #0]
  402350:	2900      	cmp	r1, #0
  402352:	d015      	beq.n	402380 <??process_tx_msg_10>
  402354:	1e49      	subs	r1, r1, #1
  402356:	7021      	strb	r1, [r4, #0]
  402358:	2100      	movs	r1, #0
  40235a:	6521      	str	r1, [r4, #80]
  40235c:	7a01      	ldrb	r1, [r0, #8]
  40235e:	1d09      	adds	r1, r1, #4
  402360:	4b26      	ldr	r3, [pc, #152]	(4023fc <??DataTable12>)
  402362:	6019      	str	r1, [r3, #0]
  402364:	4926      	ldr	r1, [pc, #152]	(402400 <??DataTable13>)
  402366:	6843      	ldr	r3, [r0, #4]
  402368:	678b      	str	r3, [r1, #120]
  40236a:	0023      	lsls	r3, r4, #0
  40236c:	3360      	adds	r3, #96
  40236e:	674b      	str	r3, [r1, #116]
  402370:	4b20      	ldr	r3, [pc, #128]	(4023f4 <??process_tx_msg_5>)
  402372:	600b      	str	r3, [r1, #0]
  402374:	7801      	ldrb	r1, [r0, #0]
  402376:	400a      	ands	r2, r1
  402378:	2108      	movs	r1, #8
  40237a:	4311      	orrs	r1, r2
  40237c:	7001      	strb	r1, [r0, #0]
  40237e:	e00d      	b.n	40239c <??process_tx_msg_7>

00402380 <??process_tx_msg_10>:
  402380:	7801      	ldrb	r1, [r0, #0]
  402382:	400a      	ands	r2, r1
  402384:	2128      	movs	r1, #40
  402386:	4311      	orrs	r1, r2
  402388:	7001      	strb	r1, [r0, #0]
  40238a:	e005      	b.n	402398 <??process_tx_msg_4>

0040238c <??process_tx_msg_3>:
  40238c:	7801      	ldrb	r1, [r0, #0]
  40238e:	0749      	lsls	r1, r1, #29
  402390:	0f49      	lsrs	r1, r1, #29
  402392:	2238      	movs	r2, #56
  402394:	430a      	orrs	r2, r1
  402396:	7002      	strb	r2, [r0, #0]

00402398 <??process_tx_msg_4>:
  402398:	f7ff ff3d 	bl	402216 <release_current_message>

0040239c <??process_tx_msg_7>:
  40239c:	6d20      	ldr	r0, [r4, #80]
  40239e:	2180      	movs	r1, #128
  4023a0:	0089      	lsls	r1, r1, #2
  4023a2:	4001      	ands	r1, r0
  4023a4:	0a49      	lsrs	r1, r1, #9
  4023a6:	2901      	cmp	r1, #1
  4023a8:	d010      	beq.n	4023cc <??process_tx_msg_11>
  4023aa:	2180      	movs	r1, #128
  4023ac:	02c9      	lsls	r1, r1, #11
  4023ae:	4001      	ands	r1, r0
  4023b0:	0c89      	lsrs	r1, r1, #18
  4023b2:	2901      	cmp	r1, #1
  4023b4:	d00a      	beq.n	4023cc <??process_tx_msg_11>
  4023b6:	2108      	movs	r1, #8
  4023b8:	4001      	ands	r1, r0
  4023ba:	08c9      	lsrs	r1, r1, #3
  4023bc:	2901      	cmp	r1, #1
  4023be:	d005      	beq.n	4023cc <??process_tx_msg_11>
  4023c0:	2180      	movs	r1, #128
  4023c2:	0349      	lsls	r1, r1, #13
  4023c4:	4001      	ands	r1, r0
  4023c6:	0d08      	lsrs	r0, r1, #20
  4023c8:	2801      	cmp	r0, #1
  4023ca:	d10f      	bne.n	4023ec <??process_tx_msg_12>

004023cc <??process_tx_msg_11>:
  4023cc:	6d20      	ldr	r0, [r4, #80]
  4023ce:	490d      	ldr	r1, [pc, #52]	(402404 <??DataTable14>)
  4023d0:	4001      	ands	r1, r0
  4023d2:	6521      	str	r1, [r4, #80]
  4023d4:	7860      	ldrb	r0, [r4, #1]
  4023d6:	0080      	lsls	r0, r0, #2
  4023d8:	1820      	adds	r0, r4, r0
  4023da:	6ac0      	ldr	r0, [r0, #44]
  4023dc:	7801      	ldrb	r1, [r0, #0]
  4023de:	0749      	lsls	r1, r1, #29
  4023e0:	0f49      	lsrs	r1, r1, #29
  4023e2:	2228      	movs	r2, #40
  4023e4:	430a      	orrs	r2, r1
  4023e6:	7002      	strb	r2, [r0, #0]
  4023e8:	f7ff ff15 	bl	402216 <release_current_message>

004023ec <??process_tx_msg_12>:
  4023ec:	2000      	movs	r0, #0
  4023ee:	bc32      	pop	{r1, r4, r5}
  4023f0:	bc08      	pop	{r3}
  4023f2:	4718      	bx	r3

004023f4 <??process_tx_msg_5>:
  4023f4:	0a03 0000                                   ....

004023f8 <??DataTable9>:
  4023f8:	520c 0040                                   .R@.

004023fc <??DataTable12>:
  4023fc:	408c 8000                                   .@..

00402400 <??DataTable13>:
  402400:	400c 8000                                   .@..

00402404 <??DataTable14>:
  402404:	fdf7 ffeb                                   ....

00402408 <process_rx_msg>:
  402408:	b570      	push	{r4, r5, r6, lr}
  40240a:	4c74      	ldr	r4, [pc, #464]	(4025dc <??process_rx_msg_1>)
  40240c:	7860      	ldrb	r0, [r4, #1]
  40240e:	0080      	lsls	r0, r0, #2
  402410:	1821      	adds	r1, r4, r0
  402412:	6ac8      	ldr	r0, [r1, #44]
  402414:	7802      	ldrb	r2, [r0, #0]
  402416:	08d2      	lsrs	r2, r2, #3
  402418:	2a07      	cmp	r2, #7
  40241a:	d900      	bls.n	40241e <process_rx_msg+0x16>
  40241c:	e0af      	b.n	40257e <??process_rx_msg_2>
  40241e:	a302      	add	r3, pc, #8	(adr r3, 402428 <??process_rx_msg_0>)
  402420:	5c9b      	ldrb	r3, [r3, r2]
  402422:	005b      	lsls	r3, r3, #1
  402424:	449f      	add	pc, r3
  402426:	46c0      	nop			(mov r8, r8)

00402428 <??process_rx_msg_0>:
  402428:	2a04 ad3b abab a5ab                         .*;.....

00402430 <??process_rx_msg_3>:
  402430:	2200      	movs	r2, #0
  402432:	6522      	str	r2, [r4, #80]
  402434:	7022      	strb	r2, [r4, #0]
  402436:	6bc9      	ldr	r1, [r1, #60]
  402438:	64e1      	str	r1, [r4, #76]
  40243a:	7a03      	ldrb	r3, [r0, #8]
  40243c:	041b      	lsls	r3, r3, #16
  40243e:	4d68      	ldr	r5, [pc, #416]	(4025e0 <??process_rx_msg_1+0x4>)
  402440:	602b      	str	r3, [r5, #0]
  402442:	4b68      	ldr	r3, [pc, #416]	(4025e4 <??process_rx_msg_1+0x8>)
  402444:	0025      	lsls	r5, r4, #0
  402446:	3560      	adds	r5, #96
  402448:	679d      	str	r5, [r3, #120]
  40244a:	6845      	ldr	r5, [r0, #4]
  40244c:	675d      	str	r5, [r3, #116]
  40244e:	2900      	cmp	r1, #0
  402450:	d00a      	beq.n	402468 <??process_rx_msg_4>
  402452:	6bda      	ldr	r2, [r3, #60]
  402454:	1851      	adds	r1, r2, r1
  402456:	6459      	str	r1, [r3, #68]
  402458:	6bd9      	ldr	r1, [r3, #60]
  40245a:	22ff      	movs	r2, #255
  40245c:	0052      	lsls	r2, r2, #1
  40245e:	1889      	adds	r1, r1, r2
  402460:	6499      	str	r1, [r3, #72]
  402462:	2106      	movs	r1, #6
  402464:	6359      	str	r1, [r3, #52]
  402466:	e000      	b.n	40246a <??process_rx_msg_5>

00402468 <??process_rx_msg_4>:
  402468:	635a      	str	r2, [r3, #52]

0040246a <??process_rx_msg_5>:
  40246a:	495f      	ldr	r1, [pc, #380]	(4025e8 <??process_rx_msg_1+0xc>)
  40246c:	6019      	str	r1, [r3, #0]
  40246e:	7801      	ldrb	r1, [r0, #0]
  402470:	0749      	lsls	r1, r1, #29
  402472:	0f49      	lsrs	r1, r1, #29
  402474:	2208      	movs	r2, #8

00402476 <??process_rx_msg_6>:
  402476:	430a      	orrs	r2, r1
  402478:	7002      	strb	r2, [r0, #0]
  40247a:	e082      	b.n	402582 <??process_rx_msg_7>

0040247c <??process_rx_msg_8>:
  40247c:	6d21      	ldr	r1, [r4, #80]
  40247e:	07ca      	lsls	r2, r1, #31
  402480:	d404      	bmi.n	40248c <??process_rx_msg_9>
  402482:	2220      	movs	r2, #32
  402484:	400a      	ands	r2, r1
  402486:	0951      	lsrs	r1, r2, #5
  402488:	2901      	cmp	r1, #1
  40248a:	d17a      	bne.n	402582 <??process_rx_msg_7>

0040248c <??process_rx_msg_9>:
  40248c:	6d21      	ldr	r1, [r4, #80]
  40248e:	2201      	movs	r2, #1
  402490:	4391      	bics	r1, r2
  402492:	6521      	str	r1, [r4, #80]
  402494:	7801      	ldrb	r1, [r0, #0]
  402496:	0749      	lsls	r1, r1, #29
  402498:	0f49      	lsrs	r1, r1, #29
  40249a:	2210      	movs	r2, #16
  40249c:	e7eb      	b.n	402476 <??process_rx_msg_6>

0040249e <??process_rx_msg_10>:
  40249e:	2220      	movs	r2, #32
  4024a0:	6d23      	ldr	r3, [r4, #80]
  4024a2:	4013      	ands	r3, r2
  4024a4:	095b      	lsrs	r3, r3, #5
  4024a6:	2b01      	cmp	r3, #1
  4024a8:	d16b      	bne.n	402582 <??process_rx_msg_7>
  4024aa:	6d23      	ldr	r3, [r4, #80]
  4024ac:	4393      	bics	r3, r2
  4024ae:	6523      	str	r3, [r4, #80]
  4024b0:	2540      	movs	r5, #64
  4024b2:	401d      	ands	r5, r3
  4024b4:	09ad      	lsrs	r5, r5, #6
  4024b6:	2d01      	cmp	r5, #1
  4024b8:	d10f      	bne.n	4024da <??process_rx_msg_11>
  4024ba:	001a      	lsls	r2, r3, #0
  4024bc:	2340      	movs	r3, #64
  4024be:	439a      	bics	r2, r3
  4024c0:	6522      	str	r2, [r4, #80]
  4024c2:	6842      	ldr	r2, [r0, #4]
  4024c4:	7812      	ldrb	r2, [r2, #0]
  4024c6:	1f12      	subs	r2, r2, #4
  4024c8:	7202      	strb	r2, [r0, #8]
  4024ca:	6ac8      	ldr	r0, [r1, #44]
  4024cc:	7801      	ldrb	r1, [r0, #0]
  4024ce:	0749      	lsls	r1, r1, #29
  4024d0:	0f49      	lsrs	r1, r1, #29
  4024d2:	2228      	movs	r2, #40
  4024d4:	430a      	orrs	r2, r1
  4024d6:	7002      	strb	r2, [r0, #0]
  4024d8:	e051      	b.n	40257e <??process_rx_msg_2>

004024da <??process_rx_msg_11>:
  4024da:	2504      	movs	r5, #4
  4024dc:	401d      	ands	r5, r3
  4024de:	08ad      	lsrs	r5, r5, #2
  4024e0:	2d01      	cmp	r5, #1
  4024e2:	d029      	beq.n	402538 <??process_rx_msg_12>
  4024e4:	0255      	lsls	r5, r2, #9
  4024e6:	401d      	ands	r5, r3
  4024e8:	0bad      	lsrs	r5, r5, #14
  4024ea:	2d01      	cmp	r5, #1
  4024ec:	d024      	beq.n	402538 <??process_rx_msg_12>
  4024ee:	0295      	lsls	r5, r2, #10
  4024f0:	401d      	ands	r5, r3
  4024f2:	0beb      	lsrs	r3, r5, #15
  4024f4:	2b01      	cmp	r3, #1
  4024f6:	d01f      	beq.n	402538 <??process_rx_msg_12>
  4024f8:	7822      	ldrb	r2, [r4, #0]
  4024fa:	2a00      	cmp	r2, #0
  4024fc:	d031      	beq.n	402562 <??process_rx_msg_13>
  4024fe:	1e55      	subs	r5, r2, #1
  402500:	7025      	strb	r5, [r4, #0]
  402502:	2200      	movs	r2, #0
  402504:	6522      	str	r2, [r4, #80]
  402506:	7202      	strb	r2, [r0, #8]
  402508:	6ac8      	ldr	r0, [r1, #44]
  40250a:	7a03      	ldrb	r3, [r0, #8]
  40250c:	041b      	lsls	r3, r3, #16
  40250e:	4e34      	ldr	r6, [pc, #208]	(4025e0 <??process_rx_msg_1+0x4>)
  402510:	6033      	str	r3, [r6, #0]
  402512:	4b34      	ldr	r3, [pc, #208]	(4025e4 <??process_rx_msg_1+0x8>)
  402514:	0026      	lsls	r6, r4, #0
  402516:	3660      	adds	r6, #96
  402518:	679e      	str	r6, [r3, #120]
  40251a:	6846      	ldr	r6, [r0, #4]
  40251c:	675e      	str	r6, [r3, #116]
  40251e:	6ce6      	ldr	r6, [r4, #76]
  402520:	2e00      	cmp	r6, #0
  402522:	d013      	beq.n	40254c <??process_rx_msg_14>
  402524:	6bda      	ldr	r2, [r3, #60]
  402526:	1992      	adds	r2, r2, r6
  402528:	645a      	str	r2, [r3, #68]
  40252a:	6bda      	ldr	r2, [r3, #60]
  40252c:	26ff      	movs	r6, #255
  40252e:	0076      	lsls	r6, r6, #1
  402530:	1992      	adds	r2, r2, r6
  402532:	649a      	str	r2, [r3, #72]
  402534:	2206      	movs	r2, #6
  402536:	e009      	b.n	40254c <??process_rx_msg_14>

00402538 <??process_rx_msg_12>:
  402538:	6d21      	ldr	r1, [r4, #80]
  40253a:	4b2c      	ldr	r3, [pc, #176]	(4025ec <??process_rx_msg_1+0x10>)
  40253c:	400b      	ands	r3, r1
  40253e:	6523      	str	r3, [r4, #80]
  402540:	7801      	ldrb	r1, [r0, #0]
  402542:	0749      	lsls	r1, r1, #29
  402544:	0f49      	lsrs	r1, r1, #29
  402546:	430a      	orrs	r2, r1
  402548:	7002      	strb	r2, [r0, #0]
  40254a:	e018      	b.n	40257e <??process_rx_msg_2>

0040254c <??process_rx_msg_14>:
  40254c:	635a      	str	r2, [r3, #52]
  40254e:	4a26      	ldr	r2, [pc, #152]	(4025e8 <??process_rx_msg_1+0xc>)
  402550:	601a      	str	r2, [r3, #0]
  402552:	7802      	ldrb	r2, [r0, #0]
  402554:	0752      	lsls	r2, r2, #29
  402556:	0f52      	lsrs	r2, r2, #29
  402558:	2308      	movs	r3, #8
  40255a:	4313      	orrs	r3, r2
  40255c:	7003      	strb	r3, [r0, #0]
  40255e:	062d      	lsls	r5, r5, #24
  402560:	d10f      	bne.n	402582 <??process_rx_msg_7>

00402562 <??process_rx_msg_13>:
  402562:	6ac8      	ldr	r0, [r1, #44]
  402564:	7801      	ldrb	r1, [r0, #0]
  402566:	0749      	lsls	r1, r1, #29
  402568:	0f49      	lsrs	r1, r1, #29
  40256a:	2230      	movs	r2, #48
  40256c:	430a      	orrs	r2, r1
  40256e:	7002      	strb	r2, [r0, #0]
  402570:	e005      	b.n	40257e <??process_rx_msg_2>

00402572 <??process_rx_msg_15>:
  402572:	7801      	ldrb	r1, [r0, #0]
  402574:	0749      	lsls	r1, r1, #29
  402576:	0f49      	lsrs	r1, r1, #29
  402578:	2240      	movs	r2, #64
  40257a:	430a      	orrs	r2, r1
  40257c:	7002      	strb	r2, [r0, #0]

0040257e <??process_rx_msg_2>:
  40257e:	f7ff fe4a 	bl	402216 <release_current_message>

00402582 <??process_rx_msg_7>:
  402582:	6d20      	ldr	r0, [r4, #80]
  402584:	2180      	movs	r1, #128
  402586:	0089      	lsls	r1, r1, #2
  402588:	4001      	ands	r1, r0
  40258a:	0a49      	lsrs	r1, r1, #9
  40258c:	2901      	cmp	r1, #1
  40258e:	d010      	beq.n	4025b2 <??process_rx_msg_16>
  402590:	2180      	movs	r1, #128
  402592:	02c9      	lsls	r1, r1, #11
  402594:	4001      	ands	r1, r0
  402596:	0c89      	lsrs	r1, r1, #18
  402598:	2901      	cmp	r1, #1
  40259a:	d00a      	beq.n	4025b2 <??process_rx_msg_16>
  40259c:	2108      	movs	r1, #8
  40259e:	4001      	ands	r1, r0
  4025a0:	08c9      	lsrs	r1, r1, #3
  4025a2:	2901      	cmp	r1, #1
  4025a4:	d005      	beq.n	4025b2 <??process_rx_msg_16>
  4025a6:	2180      	movs	r1, #128
  4025a8:	0349      	lsls	r1, r1, #13
  4025aa:	4001      	ands	r1, r0
  4025ac:	0d08      	lsrs	r0, r1, #20
  4025ae:	2801      	cmp	r0, #1
  4025b0:	d10f      	bne.n	4025d2 <??process_rx_msg_17>

004025b2 <??process_rx_msg_16>:
  4025b2:	6d20      	ldr	r0, [r4, #80]
  4025b4:	490e      	ldr	r1, [pc, #56]	(4025f0 <??process_rx_msg_1+0x14>)
  4025b6:	4001      	ands	r1, r0
  4025b8:	6521      	str	r1, [r4, #80]
  4025ba:	7860      	ldrb	r0, [r4, #1]
  4025bc:	0080      	lsls	r0, r0, #2
  4025be:	1820      	adds	r0, r4, r0
  4025c0:	6ac0      	ldr	r0, [r0, #44]
  4025c2:	7801      	ldrb	r1, [r0, #0]
  4025c4:	0749      	lsls	r1, r1, #29
  4025c6:	0f49      	lsrs	r1, r1, #29
  4025c8:	2230      	movs	r2, #48
  4025ca:	430a      	orrs	r2, r1
  4025cc:	7002      	strb	r2, [r0, #0]
  4025ce:	f7ff fe22 	bl	402216 <release_current_message>

004025d2 <??process_rx_msg_17>:
  4025d2:	2000      	movs	r0, #0
  4025d4:	bc70      	pop	{r4, r5, r6}
  4025d6:	bc08      	pop	{r3}
  4025d8:	4718      	bx	r3
  4025da:	46c0      	nop			(mov r8, r8)

004025dc <??process_rx_msg_1>:
  4025dc:	520c 0040 408c 8000 400c 8000 0a04 0000     .R@..@...@......
  4025ec:	3ffb ffff fdf7 ffeb                         .?......

004025f4 <process_ed_msg>:
  4025f4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  4025f6:	4c67      	ldr	r4, [pc, #412]	(402794 <??process_ed_msg_0>)
  4025f8:	7860      	ldrb	r0, [r4, #1]
  4025fa:	0080      	lsls	r0, r0, #2
  4025fc:	1821      	adds	r1, r4, r0
  4025fe:	6ac8      	ldr	r0, [r1, #44]
  402600:	7802      	ldrb	r2, [r0, #0]
  402602:	08d2      	lsrs	r2, r2, #3
  402604:	d005      	beq.n	402612 <??process_ed_msg_1>
  402606:	1e52      	subs	r2, r2, #1
  402608:	d032      	beq.n	402670 <??process_ed_msg_2>
  40260a:	1ed2      	subs	r2, r2, #3
  40260c:	d100      	bne.n	402610 <process_ed_msg+0x1c>
  40260e:	e08c      	b.n	40272a <??process_ed_msg_3>
  402610:	e091      	b.n	402736 <??process_ed_msg_4>

00402612 <??process_ed_msg_1>:
  402612:	2100      	movs	r1, #0
  402614:	6521      	str	r1, [r4, #80]
  402616:	7021      	strb	r1, [r4, #0]
  402618:	2607      	movs	r6, #7
  40261a:	7a01      	ldrb	r1, [r0, #8]
  40261c:	2910      	cmp	r1, #16
  40261e:	d221      	bcs.n	402664 <??process_ed_msg_5>
  402620:	4669      	mov	r1, sp
  402622:	7a00      	ldrb	r0, [r0, #8]
  402624:	7008      	strb	r0, [r1, #0]
  402626:	4d5c      	ldr	r5, [pc, #368]	(402798 <??process_ed_msg_0+0x4>)
  402628:	0029      	lsls	r1, r5, #0
  40262a:	3110      	adds	r1, #16
  40262c:	0028      	lsls	r0, r5, #0
  40262e:	f000 fb65 	bl	402cfc <GetCurrentChannel>
  402632:	0007      	lsls	r7, r0, #0
  402634:	4668      	mov	r0, sp
  402636:	7800      	ldrb	r0, [r0, #0]
  402638:	0081      	lsls	r1, r0, #2
  40263a:	1869      	adds	r1, r5, r1
  40263c:	690a      	ldr	r2, [r1, #16]
  40263e:	5c29      	ldrb	r1, [r5, r0]
  402640:	4668      	mov	r0, sp
  402642:	7800      	ldrb	r0, [r0, #0]
  402644:	f000 fb24 	bl	402c90 <SetChannel>
  402648:	4854      	ldr	r0, [pc, #336]	(40279c <??process_ed_msg_0+0x8>)
  40264a:	4955      	ldr	r1, [pc, #340]	(4027a0 <??process_ed_msg_0+0xc>)
  40264c:	6001      	str	r1, [r0, #0]
  40264e:	65a7      	str	r7, [r4, #88]
  402650:	7860      	ldrb	r0, [r4, #1]
  402652:	0080      	lsls	r0, r0, #2
  402654:	1820      	adds	r0, r4, r0
  402656:	6ac0      	ldr	r0, [r0, #44]
  402658:	7801      	ldrb	r1, [r0, #0]
  40265a:	400e      	ands	r6, r1
  40265c:	2108      	movs	r1, #8
  40265e:	4331      	orrs	r1, r6
  402660:	7001      	strb	r1, [r0, #0]
  402662:	e06a      	b.n	40273a <??process_ed_msg_6>

00402664 <??process_ed_msg_5>:
  402664:	7801      	ldrb	r1, [r0, #0]
  402666:	400e      	ands	r6, r1
  402668:	2118      	movs	r1, #24
  40266a:	4331      	orrs	r1, r6
  40266c:	7001      	strb	r1, [r0, #0]
  40266e:	e062      	b.n	402736 <??process_ed_msg_4>

00402670 <??process_ed_msg_2>:
  402670:	6d22      	ldr	r2, [r4, #80]
  402672:	2320      	movs	r3, #32
  402674:	4013      	ands	r3, r2
  402676:	095a      	lsrs	r2, r3, #5
  402678:	2a01      	cmp	r2, #1
  40267a:	d15e      	bne.n	40273a <??process_ed_msg_6>
  40267c:	6d22      	ldr	r2, [r4, #80]
  40267e:	2320      	movs	r3, #32
  402680:	439a      	bics	r2, r3
  402682:	6522      	str	r2, [r4, #80]
  402684:	2340      	movs	r3, #64
  402686:	4013      	ands	r3, r2
  402688:	099a      	lsrs	r2, r3, #6
  40268a:	2a01      	cmp	r2, #1
  40268c:	d124      	bne.n	4026d8 <??process_ed_msg_7>
  40268e:	6d22      	ldr	r2, [r4, #80]
  402690:	2340      	movs	r3, #64
  402692:	439a      	bics	r2, r3
  402694:	6522      	str	r2, [r4, #80]
  402696:	7802      	ldrb	r2, [r0, #0]
  402698:	0752      	lsls	r2, r2, #29
  40269a:	0f52      	lsrs	r2, r2, #29
  40269c:	2310      	movs	r3, #16
  40269e:	4313      	orrs	r3, r2
  4026a0:	7003      	strb	r3, [r0, #0]
  4026a2:	4840      	ldr	r0, [pc, #256]	(4027a4 <??process_ed_msg_0+0x10>)
  4026a4:	6800      	ldr	r0, [r0, #0]
  4026a6:	22ff      	movs	r2, #255
  4026a8:	4010      	ands	r0, r2
  4026aa:	280f      	cmp	r0, #15
  4026ac:	d201      	bcs.n	4026b2 <??process_ed_msg_8>
  4026ae:	2200      	movs	r2, #0
  4026b0:	e004      	b.n	4026bc <??process_ed_msg_9>

004026b2 <??process_ed_msg_8>:
  4026b2:	2865      	cmp	r0, #101
  4026b4:	d202      	bcs.n	4026bc <??process_ed_msg_9>
  4026b6:	0042      	lsls	r2, r0, #1
  4026b8:	1812      	adds	r2, r2, r0
  4026ba:	3a2d      	subs	r2, #45

004026bc <??process_ed_msg_9>:
  4026bc:	6ac8      	ldr	r0, [r1, #44]
  4026be:	6840      	ldr	r0, [r0, #4]
  4026c0:	7082      	strb	r2, [r0, #2]
  4026c2:	6da0      	ldr	r0, [r4, #88]
  4026c4:	4d34      	ldr	r5, [pc, #208]	(402798 <??process_ed_msg_0+0x4>)
  4026c6:	0081      	lsls	r1, r0, #2
  4026c8:	1869      	adds	r1, r5, r1
  4026ca:	690a      	ldr	r2, [r1, #16]
  4026cc:	5c29      	ldrb	r1, [r5, r0]
  4026ce:	0600      	lsls	r0, r0, #24
  4026d0:	0e00      	lsrs	r0, r0, #24
  4026d2:	f000 fadd 	bl	402c90 <SetChannel>
  4026d6:	e02e      	b.n	402736 <??process_ed_msg_4>

004026d8 <??process_ed_msg_7>:
  4026d8:	7821      	ldrb	r1, [r4, #0]
  4026da:	4d2f      	ldr	r5, [pc, #188]	(402798 <??process_ed_msg_0+0x4>)
  4026dc:	2900      	cmp	r1, #0
  4026de:	d014      	beq.n	40270a <??process_ed_msg_10>
  4026e0:	1e49      	subs	r1, r1, #1
  4026e2:	7021      	strb	r1, [r4, #0]
  4026e4:	2100      	movs	r1, #0
  4026e6:	6521      	str	r1, [r4, #80]
  4026e8:	7a06      	ldrb	r6, [r0, #8]
  4026ea:	0029      	lsls	r1, r5, #0
  4026ec:	3110      	adds	r1, #16
  4026ee:	0028      	lsls	r0, r5, #0
  4026f0:	f000 fb04 	bl	402cfc <GetCurrentChannel>
  4026f4:	00b0      	lsls	r0, r6, #2
  4026f6:	1828      	adds	r0, r5, r0
  4026f8:	6902      	ldr	r2, [r0, #16]
  4026fa:	5da9      	ldrb	r1, [r5, r6]
  4026fc:	0030      	lsls	r0, r6, #0
  4026fe:	f000 fac7 	bl	402c90 <SetChannel>
  402702:	4826      	ldr	r0, [pc, #152]	(40279c <??process_ed_msg_0+0x8>)
  402704:	4926      	ldr	r1, [pc, #152]	(4027a0 <??process_ed_msg_0+0xc>)
  402706:	6001      	str	r1, [r0, #0]
  402708:	e017      	b.n	40273a <??process_ed_msg_6>

0040270a <??process_ed_msg_10>:
  40270a:	7801      	ldrb	r1, [r0, #0]
  40270c:	0749      	lsls	r1, r1, #29
  40270e:	0f49      	lsrs	r1, r1, #29
  402710:	2218      	movs	r2, #24
  402712:	430a      	orrs	r2, r1
  402714:	7002      	strb	r2, [r0, #0]
  402716:	6da0      	ldr	r0, [r4, #88]
  402718:	0081      	lsls	r1, r0, #2
  40271a:	1869      	adds	r1, r5, r1
  40271c:	690a      	ldr	r2, [r1, #16]
  40271e:	5c29      	ldrb	r1, [r5, r0]
  402720:	0600      	lsls	r0, r0, #24
  402722:	0e00      	lsrs	r0, r0, #24
  402724:	f000 fab4 	bl	402c90 <SetChannel>
  402728:	e005      	b.n	402736 <??process_ed_msg_4>

0040272a <??process_ed_msg_3>:
  40272a:	7801      	ldrb	r1, [r0, #0]
  40272c:	0749      	lsls	r1, r1, #29
  40272e:	0f49      	lsrs	r1, r1, #29
  402730:	2228      	movs	r2, #40
  402732:	430a      	orrs	r2, r1
  402734:	7002      	strb	r2, [r0, #0]

00402736 <??process_ed_msg_4>:
  402736:	f7ff fd6e 	bl	402216 <release_current_message>

0040273a <??process_ed_msg_6>:
  40273a:	6d20      	ldr	r0, [r4, #80]
  40273c:	2180      	movs	r1, #128
  40273e:	0089      	lsls	r1, r1, #2
  402740:	4001      	ands	r1, r0
  402742:	0a49      	lsrs	r1, r1, #9
  402744:	2901      	cmp	r1, #1
  402746:	d010      	beq.n	40276a <??process_ed_msg_11>
  402748:	2180      	movs	r1, #128
  40274a:	02c9      	lsls	r1, r1, #11
  40274c:	4001      	ands	r1, r0
  40274e:	0c89      	lsrs	r1, r1, #18
  402750:	2901      	cmp	r1, #1
  402752:	d00a      	beq.n	40276a <??process_ed_msg_11>
  402754:	2108      	movs	r1, #8
  402756:	4001      	ands	r1, r0
  402758:	08c9      	lsrs	r1, r1, #3
  40275a:	2901      	cmp	r1, #1
  40275c:	d005      	beq.n	40276a <??process_ed_msg_11>
  40275e:	2180      	movs	r1, #128
  402760:	0349      	lsls	r1, r1, #13
  402762:	4001      	ands	r1, r0
  402764:	0d08      	lsrs	r0, r1, #20
  402766:	2801      	cmp	r0, #1
  402768:	d10f      	bne.n	40278a <??process_ed_msg_12>

0040276a <??process_ed_msg_11>:
  40276a:	6d20      	ldr	r0, [r4, #80]
  40276c:	490e      	ldr	r1, [pc, #56]	(4027a8 <??process_ed_msg_0+0x14>)
  40276e:	4001      	ands	r1, r0
  402770:	6521      	str	r1, [r4, #80]
  402772:	7860      	ldrb	r0, [r4, #1]
  402774:	0080      	lsls	r0, r0, #2
  402776:	1820      	adds	r0, r4, r0
  402778:	6ac0      	ldr	r0, [r0, #44]
  40277a:	7801      	ldrb	r1, [r0, #0]
  40277c:	0749      	lsls	r1, r1, #29
  40277e:	0f49      	lsrs	r1, r1, #29
  402780:	2218      	movs	r2, #24
  402782:	430a      	orrs	r2, r1
  402784:	7002      	strb	r2, [r0, #0]
  402786:	f7ff fd46 	bl	402216 <release_current_message>

0040278a <??process_ed_msg_12>:
  40278a:	2000      	movs	r0, #0
  40278c:	bcf2      	pop	{r1, r4, r5, r6, r7}
  40278e:	bc08      	pop	{r3}
  402790:	4718      	bx	r3
  402792:	46c0      	nop			(mov r8, r8)

00402794 <??process_ed_msg_0>:
  402794:	520c 0040 3a98 0040 400c 8000 0a07 0000     .R@..:@..@......
  4027a4:	9488 8000 fdf7 ffeb                         ........

004027ac <process_to_msg>:
  4027ac:	b510      	push	{r4, lr}
  4027ae:	4c52      	ldr	r4, [pc, #328]	(4028f8 <??process_to_msg_0>)
  4027b0:	7860      	ldrb	r0, [r4, #1]
  4027b2:	0080      	lsls	r0, r0, #2
  4027b4:	1820      	adds	r0, r4, r0
  4027b6:	6ac0      	ldr	r0, [r0, #44]
  4027b8:	7801      	ldrb	r1, [r0, #0]
  4027ba:	08c9      	lsrs	r1, r1, #3
  4027bc:	d004      	beq.n	4027c8 <??process_to_msg_1>
  4027be:	1e49      	subs	r1, r1, #1
  4027c0:	d019      	beq.n	4027f6 <??process_to_msg_2>
  4027c2:	1ec9      	subs	r1, r1, #3
  4027c4:	d063      	beq.n	40288e <??process_to_msg_3>
  4027c6:	e068      	b.n	40289a <??process_to_msg_4>

004027c8 <??process_to_msg_1>:
  4027c8:	2100      	movs	r1, #0
  4027ca:	6521      	str	r1, [r4, #80]
  4027cc:	7021      	strb	r1, [r4, #0]
  4027ce:	494b      	ldr	r1, [pc, #300]	(4028fc <??process_to_msg_0+0x4>)
  4027d0:	6bca      	ldr	r2, [r1, #60]
  4027d2:	6843      	ldr	r3, [r0, #4]
  4027d4:	789b      	ldrb	r3, [r3, #2]
  4027d6:	18d2      	adds	r2, r2, r3
  4027d8:	644a      	str	r2, [r1, #68]
  4027da:	6bca      	ldr	r2, [r1, #60]
  4027dc:	6843      	ldr	r3, [r0, #4]
  4027de:	789b      	ldrb	r3, [r3, #2]
  4027e0:	18d2      	adds	r2, r2, r3
  4027e2:	648a      	str	r2, [r1, #72]
  4027e4:	4a46      	ldr	r2, [pc, #280]	(402900 <??process_to_msg_0+0x8>)
  4027e6:	600a      	str	r2, [r1, #0]
  4027e8:	7801      	ldrb	r1, [r0, #0]
  4027ea:	0749      	lsls	r1, r1, #29
  4027ec:	0f49      	lsrs	r1, r1, #29
  4027ee:	2208      	movs	r2, #8
  4027f0:	430a      	orrs	r2, r1
  4027f2:	7002      	strb	r2, [r0, #0]
  4027f4:	e053      	b.n	40289e <??process_to_msg_5>

004027f6 <??process_to_msg_2>:
  4027f6:	6d21      	ldr	r1, [r4, #80]
  4027f8:	2220      	movs	r2, #32
  4027fa:	400a      	ands	r2, r1
  4027fc:	0951      	lsrs	r1, r2, #5
  4027fe:	2901      	cmp	r1, #1
  402800:	d14d      	bne.n	40289e <??process_to_msg_5>
  402802:	6d21      	ldr	r1, [r4, #80]
  402804:	2220      	movs	r2, #32
  402806:	4391      	bics	r1, r2
  402808:	6521      	str	r1, [r4, #80]
  40280a:	2240      	movs	r2, #64
  40280c:	400a      	ands	r2, r1
  40280e:	0992      	lsrs	r2, r2, #6
  402810:	2a01      	cmp	r2, #1
  402812:	d01f      	beq.n	402854 <??process_to_msg_6>
  402814:	2280      	movs	r2, #128
  402816:	400a      	ands	r2, r1
  402818:	09d2      	lsrs	r2, r2, #7
  40281a:	2a01      	cmp	r2, #1
  40281c:	d01a      	beq.n	402854 <??process_to_msg_6>
  40281e:	2204      	movs	r2, #4
  402820:	400a      	ands	r2, r1
  402822:	0892      	lsrs	r2, r2, #2
  402824:	2a01      	cmp	r2, #1
  402826:	d015      	beq.n	402854 <??process_to_msg_6>
  402828:	2280      	movs	r2, #128
  40282a:	01d2      	lsls	r2, r2, #7
  40282c:	400a      	ands	r2, r1
  40282e:	0b92      	lsrs	r2, r2, #14
  402830:	2a01      	cmp	r2, #1
  402832:	d00f      	beq.n	402854 <??process_to_msg_6>
  402834:	2280      	movs	r2, #128
  402836:	0212      	lsls	r2, r2, #8
  402838:	400a      	ands	r2, r1
  40283a:	0bd1      	lsrs	r1, r2, #15
  40283c:	2901      	cmp	r1, #1
  40283e:	d009      	beq.n	402854 <??process_to_msg_6>
  402840:	7821      	ldrb	r1, [r4, #0]
  402842:	2900      	cmp	r1, #0
  402844:	d111      	bne.n	40286a <??process_to_msg_7>
  402846:	7801      	ldrb	r1, [r0, #0]
  402848:	0749      	lsls	r1, r1, #29
  40284a:	0f49      	lsrs	r1, r1, #29
  40284c:	2218      	movs	r2, #24
  40284e:	430a      	orrs	r2, r1
  402850:	7002      	strb	r2, [r0, #0]
  402852:	e022      	b.n	40289a <??process_to_msg_4>

00402854 <??process_to_msg_6>:
  402854:	6d21      	ldr	r1, [r4, #80]
  402856:	4a2b      	ldr	r2, [pc, #172]	(402904 <??process_to_msg_0+0xc>)
  402858:	400a      	ands	r2, r1
  40285a:	6522      	str	r2, [r4, #80]
  40285c:	7801      	ldrb	r1, [r0, #0]
  40285e:	0749      	lsls	r1, r1, #29
  402860:	0f49      	lsrs	r1, r1, #29
  402862:	2210      	movs	r2, #16
  402864:	430a      	orrs	r2, r1
  402866:	7002      	strb	r2, [r0, #0]
  402868:	e017      	b.n	40289a <??process_to_msg_4>

0040286a <??process_to_msg_7>:
  40286a:	1e49      	subs	r1, r1, #1
  40286c:	7021      	strb	r1, [r4, #0]
  40286e:	2100      	movs	r1, #0
  402870:	6521      	str	r1, [r4, #80]
  402872:	4922      	ldr	r1, [pc, #136]	(4028fc <??process_to_msg_0+0x4>)
  402874:	6bca      	ldr	r2, [r1, #60]
  402876:	6843      	ldr	r3, [r0, #4]
  402878:	789b      	ldrb	r3, [r3, #2]
  40287a:	18d2      	adds	r2, r2, r3
  40287c:	644a      	str	r2, [r1, #68]
  40287e:	6bca      	ldr	r2, [r1, #60]
  402880:	6840      	ldr	r0, [r0, #4]
  402882:	7880      	ldrb	r0, [r0, #2]
  402884:	1810      	adds	r0, r2, r0
  402886:	6488      	str	r0, [r1, #72]
  402888:	481d      	ldr	r0, [pc, #116]	(402900 <??process_to_msg_0+0x8>)
  40288a:	6008      	str	r0, [r1, #0]
  40288c:	e007      	b.n	40289e <??process_to_msg_5>

0040288e <??process_to_msg_3>:
  40288e:	7801      	ldrb	r1, [r0, #0]
  402890:	0749      	lsls	r1, r1, #29
  402892:	0f49      	lsrs	r1, r1, #29
  402894:	2228      	movs	r2, #40
  402896:	430a      	orrs	r2, r1
  402898:	7002      	strb	r2, [r0, #0]

0040289a <??process_to_msg_4>:
  40289a:	f7ff fcbc 	bl	402216 <release_current_message>

0040289e <??process_to_msg_5>:
  40289e:	6d20      	ldr	r0, [r4, #80]
  4028a0:	2180      	movs	r1, #128
  4028a2:	0089      	lsls	r1, r1, #2
  4028a4:	4001      	ands	r1, r0
  4028a6:	0a49      	lsrs	r1, r1, #9
  4028a8:	2901      	cmp	r1, #1
  4028aa:	d010      	beq.n	4028ce <??process_to_msg_8>
  4028ac:	2180      	movs	r1, #128
  4028ae:	02c9      	lsls	r1, r1, #11
  4028b0:	4001      	ands	r1, r0
  4028b2:	0c89      	lsrs	r1, r1, #18
  4028b4:	2901      	cmp	r1, #1
  4028b6:	d00a      	beq.n	4028ce <??process_to_msg_8>
  4028b8:	2108      	movs	r1, #8
  4028ba:	4001      	ands	r1, r0
  4028bc:	08c9      	lsrs	r1, r1, #3
  4028be:	2901      	cmp	r1, #1
  4028c0:	d005      	beq.n	4028ce <??process_to_msg_8>
  4028c2:	2180      	movs	r1, #128
  4028c4:	0349      	lsls	r1, r1, #13
  4028c6:	4001      	ands	r1, r0
  4028c8:	0d08      	lsrs	r0, r1, #20
  4028ca:	2801      	cmp	r0, #1
  4028cc:	d10f      	bne.n	4028ee <??process_to_msg_9>

004028ce <??process_to_msg_8>:
  4028ce:	6d20      	ldr	r0, [r4, #80]
  4028d0:	490d      	ldr	r1, [pc, #52]	(402908 <??process_to_msg_0+0x10>)
  4028d2:	4001      	ands	r1, r0
  4028d4:	6521      	str	r1, [r4, #80]
  4028d6:	7860      	ldrb	r0, [r4, #1]
  4028d8:	0080      	lsls	r0, r0, #2
  4028da:	1820      	adds	r0, r4, r0
  4028dc:	6ac0      	ldr	r0, [r0, #44]
  4028de:	7801      	ldrb	r1, [r0, #0]
  4028e0:	0749      	lsls	r1, r1, #29
  4028e2:	0f49      	lsrs	r1, r1, #29
  4028e4:	2218      	movs	r2, #24
  4028e6:	430a      	orrs	r2, r1
  4028e8:	7002      	strb	r2, [r0, #0]
  4028ea:	f7ff fc94 	bl	402216 <release_current_message>

004028ee <??process_to_msg_9>:
  4028ee:	2000      	movs	r0, #0
  4028f0:	bc10      	pop	{r4}
  4028f2:	bc08      	pop	{r3}
  4028f4:	4718      	bx	r3
  4028f6:	46c0      	nop			(mov r8, r8)

004028f8 <??process_to_msg_0>:
  4028f8:	520c 0040 400c 8000 0a02 0000 3f3b ffff     .R@..@......;?..
  402908:	fdf7 ffeb                                   ....

0040290c <process_scan_req>:
  40290c:	b570      	push	{r4, r5, r6, lr}
  40290e:	4c20      	ldr	r4, [pc, #128]	(402990 <??process_scan_req_0>)
  402910:	7a20      	ldrb	r0, [r4, #8]
  402912:	08c0      	lsrs	r0, r0, #3
  402914:	2802      	cmp	r0, #2
  402916:	d12e      	bne.n	402976 <??process_scan_req_1>
  402918:	68e0      	ldr	r0, [r4, #12]
  40291a:	7880      	ldrb	r0, [r0, #2]
  40291c:	79a5      	ldrb	r5, [r4, #6]
  40291e:	1961      	adds	r1, r4, r5
  402920:	7608      	strb	r0, [r1, #24]
  402922:	7921      	ldrb	r1, [r4, #4]
  402924:	4281      	cmp	r1, r0
  402926:	d201      	bcs.n	40292c <??process_scan_req_2>
  402928:	7120      	strb	r0, [r4, #4]
  40292a:	7165      	strb	r5, [r4, #5]

0040292c <??process_scan_req_2>:
  40292c:	2800      	cmp	r0, #0
  40292e:	d102      	bne.n	402936 <??process_scan_req_3>
  402930:	79e0      	ldrb	r0, [r4, #7]
  402932:	2801      	cmp	r0, #1
  402934:	d110      	bne.n	402958 <??process_scan_req_4>

00402936 <??process_scan_req_3>:
  402936:	0028      	lsls	r0, r5, #0
  402938:	f000 f82c 	bl	402994 <get_next_chann_to_scan>
  40293c:	71a0      	strb	r0, [r4, #6]
  40293e:	2600      	movs	r6, #0
  402940:	71e6      	strb	r6, [r4, #7]
  402942:	42a8      	cmp	r0, r5
  402944:	da0a      	bge.n	40295c <??process_scan_req_5>
  402946:	70e6      	strb	r6, [r4, #3]
  402948:	7960      	ldrb	r0, [r4, #5]
  40294a:	6d61      	ldr	r1, [r4, #84]
  40294c:	f001 f9ff 	bl	403d4e <__iar_via_R1>
  402950:	7126      	strb	r6, [r4, #4]
  402952:	200f      	movs	r0, #15
  402954:	7160      	strb	r0, [r4, #5]
  402956:	e001      	b.n	40295c <??process_scan_req_5>

00402958 <??process_scan_req_4>:
  402958:	2001      	movs	r0, #1
  40295a:	71e0      	strb	r0, [r4, #7]

0040295c <??process_scan_req_5>:
  40295c:	2000      	movs	r0, #0
  40295e:	0021      	lsls	r1, r4, #0
  402960:	312c      	adds	r1, #44

00402962 <??process_scan_req_6>:
  402962:	680a      	ldr	r2, [r1, #0]
  402964:	0023      	lsls	r3, r4, #0
  402966:	3308      	adds	r3, #8
  402968:	429a      	cmp	r2, r3
  40296a:	d00d      	beq.n	402988 <??process_scan_req_7>
  40296c:	1c40      	adds	r0, r0, #1
  40296e:	1d09      	adds	r1, r1, #4
  402970:	2804      	cmp	r0, #4
  402972:	dbf6      	blt.n	402962 <??process_scan_req_6>
  402974:	e003      	b.n	40297e <??process_scan_req_8>

00402976 <??process_scan_req_1>:
  402976:	2805      	cmp	r0, #5
  402978:	d001      	beq.n	40297e <??process_scan_req_8>
  40297a:	2803      	cmp	r0, #3
  40297c:	d104      	bne.n	402988 <??process_scan_req_7>

0040297e <??process_scan_req_8>:
  40297e:	79a1      	ldrb	r1, [r4, #6]
  402980:	3408      	adds	r4, #8
  402982:	0020      	lsls	r0, r4, #0
  402984:	f000 ff77 	bl	403876 <MLMEEnergyDetect>

00402988 <??process_scan_req_7>:
  402988:	bc70      	pop	{r4, r5, r6}
  40298a:	bc08      	pop	{r3}
  40298c:	4718      	bx	r3
  40298e:	46c0      	nop			(mov r8, r8)

00402990 <??process_scan_req_0>:
  402990:	520c 0040                                   .R@.

00402994 <get_next_chann_to_scan>:
  402994:	b430      	push	{r4, r5}
  402996:	2200      	movs	r2, #0
  402998:	4c08      	ldr	r4, [pc, #32]	(4029bc <??get_next_chann_to_scan_0>)
  40299a:	8824      	ldrh	r4, [r4, #0]

0040299c <??get_next_chann_to_scan_1>:
  40299c:	280f      	cmp	r0, #15
  40299e:	da03      	bge.n	4029a8 <??get_next_chann_to_scan_2>
  4029a0:	1c40      	adds	r0, r0, #1
  4029a2:	0600      	lsls	r0, r0, #24
  4029a4:	0e00      	lsrs	r0, r0, #24
  4029a6:	e000      	b.n	4029aa <??get_next_chann_to_scan_3>

004029a8 <??get_next_chann_to_scan_2>:
  4029a8:	2000      	movs	r0, #0

004029aa <??get_next_chann_to_scan_3>:
  4029aa:	2501      	movs	r5, #1
  4029ac:	4085      	lsls	r5, r0
  4029ae:	422c      	tst	r4, r5
  4029b0:	d102      	bne.n	4029b8 <??get_next_chann_to_scan_4>
  4029b2:	1c52      	adds	r2, r2, #1
  4029b4:	2a10      	cmp	r2, #16
  4029b6:	dbf1      	blt.n	40299c <??get_next_chann_to_scan_1>

004029b8 <??get_next_chann_to_scan_4>:
  4029b8:	bc30      	pop	{r4, r5}
  4029ba:	4770      	bx	lr

004029bc <??get_next_chann_to_scan_0>:
  4029bc:	5234 0040                                   4R@.

004029c0 <ResumeMACASync>:
  4029c0:	b570      	push	{r4, r5, r6, lr}
  4029c2:	b082      	sub	sp, #8
  4029c4:	2007      	movs	r0, #7
  4029c6:	f40d fb0b 	bl	ffe0 <ITC_DisableInterrupt>
  4029ca:	481c      	ldr	r0, [pc, #112]	(402a3c <??ResumeMACASync_0>)
  4029cc:	6802      	ldr	r2, [r0, #0]
  4029ce:	06d0      	lsls	r0, r2, #27
  4029d0:	0e40      	lsrs	r0, r0, #25
  4029d2:	4b1b      	ldr	r3, [pc, #108]	(402a40 <??ResumeMACASync_0+0x4>)
  4029d4:	18c0      	adds	r0, r0, r3
  4029d6:	6801      	ldr	r1, [r0, #0]
  4029d8:	24f8      	movs	r4, #248
  4029da:	0164      	lsls	r4, r4, #5
  4029dc:	4014      	ands	r4, r2
  4029de:	0a22      	lsrs	r2, r4, #8
  4029e0:	0092      	lsls	r2, r2, #2
  4029e2:	58d2      	ldr	r2, [r2, r3]
  4029e4:	6002      	str	r2, [r0, #0]
  4029e6:	4a79      	ldr	r2, [pc, #484]	(402bcc <??DataTable2>)
  4029e8:	2301      	movs	r3, #1
  4029ea:	6013      	str	r3, [r2, #0]
  4029ec:	6bd4      	ldr	r4, [r2, #60]
  4029ee:	2300      	movs	r3, #0
  4029f0:	9300      	str	r3, [sp, #0]
  4029f2:	2596      	movs	r5, #150
  4029f4:	006d      	lsls	r5, r5, #1
  4029f6:	e002      	b.n	4029fe <??ResumeMACASync_1>

004029f8 <??ResumeMACASync_2>:
  4029f8:	9e00      	ldr	r6, [sp, #0]
  4029fa:	1c76      	adds	r6, r6, #1
  4029fc:	9600      	str	r6, [sp, #0]

004029fe <??ResumeMACASync_1>:
  4029fe:	6bd6      	ldr	r6, [r2, #60]
  402a00:	1b36      	subs	r6, r6, r4
  402a02:	2e03      	cmp	r6, #3
  402a04:	d202      	bcs.n	402a0c <??ResumeMACASync_3>
  402a06:	9e00      	ldr	r6, [sp, #0]
  402a08:	42ae      	cmp	r6, r5
  402a0a:	d3f5      	bcc.n	4029f8 <??ResumeMACASync_2>

00402a0c <??ResumeMACASync_3>:
  402a0c:	6013      	str	r3, [r2, #0]
  402a0e:	6bd4      	ldr	r4, [r2, #60]
  402a10:	e001      	b.n	402a16 <??ResumeMACASync_4>

00402a12 <??ResumeMACASync_5>:
  402a12:	9b00      	ldr	r3, [sp, #0]
  402a14:	1c5b      	adds	r3, r3, #1

00402a16 <??ResumeMACASync_4>:
  402a16:	9300      	str	r3, [sp, #0]
  402a18:	6bd3      	ldr	r3, [r2, #60]
  402a1a:	1b1b      	subs	r3, r3, r4
  402a1c:	2b03      	cmp	r3, #3
  402a1e:	d202      	bcs.n	402a26 <??ResumeMACASync_6>
  402a20:	9b00      	ldr	r3, [sp, #0]
  402a22:	42ab      	cmp	r3, r5
  402a24:	d3f5      	bcc.n	402a12 <??ResumeMACASync_5>

00402a26 <??ResumeMACASync_6>:
  402a26:	6001      	str	r1, [r0, #0]
  402a28:	4806      	ldr	r0, [pc, #24]	(402a44 <??ResumeMACASync_0+0x8>)
  402a2a:	4907      	ldr	r1, [pc, #28]	(402a48 <??ResumeMACASync_0+0xc>)
  402a2c:	6001      	str	r1, [r0, #0]
  402a2e:	2007      	movs	r0, #7
  402a30:	f40d fac8 	bl	ffc4 <ITC_EnableInterrupt>
  402a34:	bc73      	pop	{r0, r1, r4, r5, r6}
  402a36:	bc08      	pop	{r3}
  402a38:	4718      	bx	r3
  402a3a:	46c0      	nop			(mov r8, r8)

00402a3c <??ResumeMACASync_0>:
  402a3c:	9204 8000 9300 8000 40c4 8000 ffff 0000     .........@......

00402a4c <MACA_Interrupt>:
  402a4c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  402a4e:	485a      	ldr	r0, [pc, #360]	(402bb8 <??MACA_Interrupt_1>)
  402a50:	6804      	ldr	r4, [r0, #0]
  402a52:	6044      	str	r4, [r0, #4]
  402a54:	4f59      	ldr	r7, [pc, #356]	(402bbc <??MACA_Interrupt_1+0x4>)
  402a56:	7838      	ldrb	r0, [r7, #0]
  402a58:	1c40      	adds	r0, r0, #1
  402a5a:	7038      	strb	r0, [r7, #0]
  402a5c:	2580      	movs	r5, #128
  402a5e:	022d      	lsls	r5, r5, #8
  402a60:	422c      	tst	r4, r5
  402a62:	d004      	beq.n	402a6e <??MACA_Interrupt_2>
  402a64:	4e56      	ldr	r6, [pc, #344]	(402bc0 <??MACA_Interrupt_1+0x8>)
  402a66:	6830      	ldr	r0, [r6, #0]
  402a68:	2101      	movs	r1, #1
  402a6a:	4301      	orrs	r1, r0
  402a6c:	6031      	str	r1, [r6, #0]

00402a6e <??MACA_Interrupt_2>:
  402a6e:	07e0      	lsls	r0, r4, #31
  402a70:	d555      	bpl.n	402b1e <??MACA_Interrupt_3>
  402a72:	4e53      	ldr	r6, [pc, #332]	(402bc0 <??MACA_Interrupt_1+0x8>)
  402a74:	6830      	ldr	r0, [r6, #0]
  402a76:	2120      	movs	r1, #32
  402a78:	4301      	orrs	r1, r0
  402a7a:	6031      	str	r1, [r6, #0]
  402a7c:	f7ff fba2 	bl	4021c4 <execute_current_message_callback>
  402a80:	4852      	ldr	r0, [pc, #328]	(402bcc <??DataTable2>)
  402a82:	6840      	ldr	r0, [r0, #4]
  402a84:	0700      	lsls	r0, r0, #28
  402a86:	0f00      	lsrs	r0, r0, #28
  402a88:	280f      	cmp	r0, #15
  402a8a:	d900      	bls.n	402a8e <??MACA_Interrupt_2+0x20>
  402a8c:	e08d      	b.n	402baa <??MACA_Interrupt_4>
  402a8e:	a102      	add	r1, pc, #8	(adr r1, 402a98 <??MACA_Interrupt_0>)
  402a90:	5c09      	ldrb	r1, [r1, r0]
  402a92:	0049      	lsls	r1, r1, #1
  402a94:	448f      	add	pc, r1
  402a96:	46c0      	nop			(mov r8, r8)

00402a98 <??MACA_Interrupt_0>:
  402a98:	0f08 1916 871e 8989 2823 8989 3889 403b     ........#(...8;@

00402aa8 <??MACA_Interrupt_5>:
  402aa8:	6830      	ldr	r0, [r6, #0]
  402aaa:	2140      	movs	r1, #64
  402aac:	4301      	orrs	r1, r0
  402aae:	6031      	str	r1, [r6, #0]
  402ab0:	2001      	movs	r0, #1
  402ab2:	7078      	strb	r0, [r7, #1]
  402ab4:	e079      	b.n	402baa <??MACA_Interrupt_4>

00402ab6 <??MACA_Interrupt_6>:
  402ab6:	f7ff ff83 	bl	4029c0 <ResumeMACASync>
  402aba:	6830      	ldr	r0, [r6, #0]
  402abc:	2180      	movs	r1, #128

00402abe <??MACA_Interrupt_7>:
  402abe:	4301      	orrs	r1, r0
  402ac0:	6031      	str	r1, [r6, #0]
  402ac2:	e072      	b.n	402baa <??MACA_Interrupt_4>

00402ac4 <??MACA_Interrupt_8>:
  402ac4:	6830      	ldr	r0, [r6, #0]
  402ac6:	09e9      	lsrs	r1, r5, #7
  402ac8:	e7f9      	b.n	402abe <??MACA_Interrupt_7>

00402aca <??MACA_Interrupt_9>:
  402aca:	6830      	ldr	r0, [r6, #0]
  402acc:	09a9      	lsrs	r1, r5, #6

00402ace <??MACA_Interrupt_10>:
  402ace:	4301      	orrs	r1, r0
  402ad0:	6031      	str	r1, [r6, #0]
  402ad2:	e06a      	b.n	402baa <??MACA_Interrupt_4>

00402ad4 <??MACA_Interrupt_11>:
  402ad4:	6830      	ldr	r0, [r6, #0]
  402ad6:	0969      	lsrs	r1, r5, #5
  402ad8:	4301      	orrs	r1, r0
  402ada:	6031      	str	r1, [r6, #0]
  402adc:	e063      	b.n	402ba6 <??MACA_Interrupt_12>

00402ade <??MACA_Interrupt_13>:
  402ade:	f7ff ff6f 	bl	4029c0 <ResumeMACASync>
  402ae2:	6830      	ldr	r0, [r6, #0]
  402ae4:	0869      	lsrs	r1, r5, #1
  402ae6:	e7ea      	b.n	402abe <??MACA_Interrupt_7>

00402ae8 <??MACA_Interrupt_14>:
  402ae8:	f7ff ff6a 	bl	4029c0 <ResumeMACASync>
  402aec:	20c0      	movs	r0, #192
  402aee:	0140      	lsls	r0, r0, #5
  402af0:	4204      	tst	r4, r0
  402af2:	d005      	beq.n	402b00 <??MACA_Interrupt_15>
  402af4:	f7ff ff64 	bl	4029c0 <ResumeMACASync>
  402af8:	6830      	ldr	r0, [r6, #0]
  402afa:	2180      	movs	r1, #128
  402afc:	4301      	orrs	r1, r0
  402afe:	6031      	str	r1, [r6, #0]

00402b00 <??MACA_Interrupt_15>:
  402b00:	6830      	ldr	r0, [r6, #0]
  402b02:	4305      	orrs	r5, r0
  402b04:	6035      	str	r5, [r6, #0]
  402b06:	e050      	b.n	402baa <??MACA_Interrupt_4>

00402b08 <??MACA_Interrupt_16>:
  402b08:	6830      	ldr	r0, [r6, #0]
  402b0a:	00a9      	lsls	r1, r5, #2
  402b0c:	e7d7      	b.n	402abe <??MACA_Interrupt_7>

00402b0e <??MACA_Interrupt_17>:
  402b0e:	f7ff ff57 	bl	4029c0 <ResumeMACASync>
  402b12:	6830      	ldr	r0, [r6, #0]
  402b14:	00e9      	lsls	r1, r5, #3
  402b16:	e7da      	b.n	402ace <??MACA_Interrupt_10>

00402b18 <??MACA_Interrupt_18>:
  402b18:	6830      	ldr	r0, [r6, #0]
  402b1a:	0129      	lsls	r1, r5, #4
  402b1c:	e7cf      	b.n	402abe <??MACA_Interrupt_7>

00402b1e <??MACA_Interrupt_3>:
  402b1e:	4829      	ldr	r0, [pc, #164]	(402bc4 <??MACA_Interrupt_1+0xc>)
  402b20:	4020      	ands	r0, r4
  402b22:	08e9      	lsrs	r1, r5, #3
  402b24:	4288      	cmp	r0, r1
  402b26:	d105      	bne.n	402b34 <??MACA_Interrupt_19>
  402b28:	4e25      	ldr	r6, [pc, #148]	(402bc0 <??MACA_Interrupt_1+0x8>)
  402b2a:	6830      	ldr	r0, [r6, #0]
  402b2c:	2108      	movs	r1, #8
  402b2e:	4301      	orrs	r1, r0
  402b30:	6031      	str	r1, [r6, #0]
  402b32:	e038      	b.n	402ba6 <??MACA_Interrupt_12>

00402b34 <??MACA_Interrupt_19>:
  402b34:	2004      	movs	r0, #4
  402b36:	4204      	tst	r4, r0
  402b38:	d01a      	beq.n	402b70 <??MACA_Interrupt_20>
  402b3a:	4c24      	ldr	r4, [pc, #144]	(402bcc <??DataTable2>)
  402b3c:	4822      	ldr	r0, [pc, #136]	(402bc8 <??MACA_Interrupt_1+0x10>)
  402b3e:	6020      	str	r0, [r4, #0]
  402b40:	f000 faf4 	bl	40312c <MLMEGetPromiscuousMode>
  402b44:	2800      	cmp	r0, #0
  402b46:	d107      	bne.n	402b58 <??MACA_Interrupt_21>
  402b48:	6f60      	ldr	r0, [r4, #116]
  402b4a:	7840      	ldrb	r0, [r0, #1]
  402b4c:	287e      	cmp	r0, #126
  402b4e:	d10b      	bne.n	402b68 <??MACA_Interrupt_22>
  402b50:	6f60      	ldr	r0, [r4, #116]
  402b52:	7880      	ldrb	r0, [r0, #2]
  402b54:	28ff      	cmp	r0, #255
  402b56:	d107      	bne.n	402b68 <??MACA_Interrupt_22>

00402b58 <??MACA_Interrupt_21>:
  402b58:	4e19      	ldr	r6, [pc, #100]	(402bc0 <??MACA_Interrupt_1+0x8>)
  402b5a:	6830      	ldr	r0, [r6, #0]
  402b5c:	2170      	movs	r1, #112
  402b5e:	4301      	orrs	r1, r0
  402b60:	6031      	str	r1, [r6, #0]
  402b62:	f7ff fb2f 	bl	4021c4 <execute_current_message_callback>
  402b66:	e020      	b.n	402baa <??MACA_Interrupt_4>

00402b68 <??MACA_Interrupt_22>:
  402b68:	4e15      	ldr	r6, [pc, #84]	(402bc0 <??MACA_Interrupt_1+0x8>)
  402b6a:	6830      	ldr	r0, [r6, #0]
  402b6c:	00e9      	lsls	r1, r5, #3
  402b6e:	e7a6      	b.n	402abe <??MACA_Interrupt_7>

00402b70 <??MACA_Interrupt_20>:
  402b70:	0521      	lsls	r1, r4, #20
  402b72:	d505      	bpl.n	402b80 <??MACA_Interrupt_23>
  402b74:	f7ff ff24 	bl	4029c0 <ResumeMACASync>
  402b78:	4e11      	ldr	r6, [pc, #68]	(402bc0 <??MACA_Interrupt_1+0x8>)
  402b7a:	6830      	ldr	r0, [r6, #0]
  402b7c:	0169      	lsls	r1, r5, #5
  402b7e:	e7a6      	b.n	402ace <??MACA_Interrupt_10>

00402b80 <??MACA_Interrupt_23>:
  402b80:	0301      	lsls	r1, r0, #12
  402b82:	420c      	tst	r4, r1
  402b84:	d003      	beq.n	402b8e <??MACA_Interrupt_24>
  402b86:	4e0e      	ldr	r6, [pc, #56]	(402bc0 <??MACA_Interrupt_1+0x8>)
  402b88:	6830      	ldr	r0, [r6, #0]
  402b8a:	2102      	movs	r1, #2
  402b8c:	e797      	b.n	402abe <??MACA_Interrupt_7>

00402b8e <??MACA_Interrupt_24>:
  402b8e:	2190      	movs	r1, #144
  402b90:	0189      	lsls	r1, r1, #6
  402b92:	420c      	tst	r4, r1
  402b94:	d004      	beq.n	402ba0 <??MACA_Interrupt_25>
  402b96:	4e0a      	ldr	r6, [pc, #40]	(402bc0 <??MACA_Interrupt_1+0x8>)
  402b98:	6831      	ldr	r1, [r6, #0]
  402b9a:	4308      	orrs	r0, r1
  402b9c:	6030      	str	r0, [r6, #0]
  402b9e:	e004      	b.n	402baa <??MACA_Interrupt_4>

00402ba0 <??MACA_Interrupt_25>:
  402ba0:	01c0      	lsls	r0, r0, #7
  402ba2:	4204      	tst	r4, r0
  402ba4:	d001      	beq.n	402baa <??MACA_Interrupt_4>

00402ba6 <??MACA_Interrupt_12>:
  402ba6:	f7ff ff0b 	bl	4029c0 <ResumeMACASync>

00402baa <??MACA_Interrupt_4>:
  402baa:	7838      	ldrb	r0, [r7, #0]
  402bac:	1e40      	subs	r0, r0, #1
  402bae:	7038      	strb	r0, [r7, #0]
  402bb0:	bcf1      	pop	{r0, r4, r5, r6, r7}
  402bb2:	bc08      	pop	{r3}
  402bb4:	4718      	bx	r3
  402bb6:	46c0      	nop			(mov r8, r8)

00402bb8 <??MACA_Interrupt_1>:
  402bb8:	40c0 8000 50ba 0040 525c 0040 1001 0000     .@...P@.\R@.....
  402bc8:	0201 0000                                   ....

00402bcc <??DataTable2>:
  402bcc:	400c 8000                                   .@..

00402bd0 <RadioInit>:
  402bd0:	b5f2      	push	{r1, r4, r5, r6, r7, lr}
  402bd2:	0005      	lsls	r5, r0, #0
  402bd4:	0016      	lsls	r6, r2, #0
  402bd6:	4c65      	ldr	r4, [pc, #404]	(402d6c <fill_ram_struct+0x18>)
  402bd8:	21fa      	movs	r1, #250
  402bda:	0089      	lsls	r1, r1, #2
  402bdc:	f7fd feb8 	bl	400950 <?Veneer (3) for __aeabi_uidiv>
  402be0:	66a0      	str	r0, [r4, #104]
  402be2:	4f28      	ldr	r7, [pc, #160]	(402c84 <RadioInit+0xb4>)
  402be4:	42bd      	cmp	r5, r7
  402be6:	d003      	beq.n	402bf0 <RadioInit+0x20>
  402be8:	4668      	mov	r0, sp
  402bea:	7800      	ldrb	r0, [r0, #0]
  402bec:	62e0      	str	r0, [r4, #44]
  402bee:	6366      	str	r6, [r4, #52]
  402bf0:	2128      	movs	r1, #40
  402bf2:	0020      	lsls	r0, r4, #0
  402bf4:	306c      	adds	r0, #108
  402bf6:	f40c ff55 	bl	faa4 <InitFromMemory>
  402bfa:	4e23      	ldr	r6, [pc, #140]	(402c88 <RadioInit+0xb8>)
  402bfc:	42bd      	cmp	r5, r7
  402bfe:	d102      	bne.n	402c06 <RadioInit+0x36>
  402c00:	2108      	movs	r1, #8
  402c02:	0030      	lsls	r0, r6, #0
  402c04:	e002      	b.n	402c0c <RadioInit+0x3c>
  402c06:	2130      	movs	r1, #48
  402c08:	0020      	lsls	r0, r4, #0
  402c0a:	3018      	adds	r0, #24
  402c0c:	f40c ff4a 	bl	faa4 <InitFromMemory>
  402c10:	2158      	movs	r1, #88
  402c12:	0030      	lsls	r0, r6, #0
  402c14:	3008      	adds	r0, #8
  402c16:	f40c ff45 	bl	faa4 <InitFromMemory>
  402c1a:	42bd      	cmp	r5, r7
  402c1c:	d004      	beq.n	402c28 <RadioInit+0x58>
  402c1e:	2108      	movs	r1, #8
  402c20:	0030      	lsls	r0, r6, #0
  402c22:	3060      	adds	r0, #96
  402c24:	f40c ff3e 	bl	faa4 <InitFromMemory>
  402c28:	2120      	movs	r1, #32
  402c2a:	0020      	lsls	r0, r4, #0
  402c2c:	3048      	adds	r0, #72
  402c2e:	f40c ff39 	bl	faa4 <InitFromMemory>
  402c32:	21ac      	movs	r1, #172
  402c34:	0049      	lsls	r1, r1, #1
  402c36:	3668      	adds	r6, #104
  402c38:	0030      	lsls	r0, r6, #0
  402c3a:	f40c ff33 	bl	faa4 <InitFromMemory>
  402c3e:	20f8      	movs	r0, #248
  402c40:	0240      	lsls	r0, r0, #9
  402c42:	f000 f9d9 	bl	402ff8 <SMAC_InitFromFlash>
  402c46:	f000 f899 	bl	402d7c <SMAC_InitFlybackSettings>
  402c4a:	4810      	ldr	r0, [pc, #64]	(402c8c <RadioInit+0xbc>)
  402c4c:	f000 f882 	bl	402d54 <fill_ram_struct>
  402c50:	2600      	movs	r6, #0
  402c52:	2500      	movs	r5, #0
  402c54:	78e1      	ldrb	r1, [r4, #3]
  402c56:	0628      	lsls	r0, r5, #24
  402c58:	0e00      	lsrs	r0, r0, #24
  402c5a:	f000 f89f 	bl	402d9c <get_ctov>
  402c5e:	1961      	adds	r1, r4, r5
  402c60:	7208      	strb	r0, [r1, #8]
  402c62:	1c6d      	adds	r5, r5, #1
  402c64:	0628      	lsls	r0, r5, #24
  402c66:	0e00      	lsrs	r0, r0, #24
  402c68:	2810      	cmp	r0, #16
  402c6a:	d3f3      	bcc.n	402c54 <RadioInit+0x84>
  402c6c:	f000 fdca 	bl	403804 <InitRifModuleVars>
  402c70:	7126      	strb	r6, [r4, #4]
  402c72:	200c      	movs	r0, #12
  402c74:	f000 fd64 	bl	403740 <SetPower>
  402c78:	b001      	add	sp, #4
  402c7a:	9804      	ldr	r0, [sp, #16]
  402c7c:	bcf0      	pop	{r4, r5, r6, r7}
  402c7e:	b001      	add	sp, #4
  402c80:	4700      	bx	r0
  402c82:	46c0      	nop			(mov r8, r8)
  402c84:	016e3600 	.word	0x016e3600
  402c88:	00402db8 	.word	0x00402db8
  402c8c:	004050ac 	.word	0x004050ac

00402c90 <SetChannel>:
  402c90:	b570      	push	{r4, r5, r6, lr}
  402c92:	0004      	lsls	r4, r0, #0
  402c94:	000d      	lsls	r5, r1, #0
  402c96:	0016      	lsls	r6, r2, #0
  402c98:	2c10      	cmp	r4, #16
  402c9a:	d301      	bcc.n	402ca0 <SetChannel+0x10>
  402c9c:	20ff      	movs	r0, #255
  402c9e:	e026      	b.n	402cee <SetChannel+0x5e>
  402ca0:	f000 fda8 	bl	4037f4 <bGetEnableLock>
  402ca4:	2801      	cmp	r0, #1
  402ca6:	d101      	bne.n	402cac <SetChannel+0x1c>
  402ca8:	2c0f      	cmp	r4, #15
  402caa:	d0f7      	beq.n	402c9c <SetChannel+0xc>
  402cac:	4822      	ldr	r0, [pc, #136]	(402d38 <GetCurrentChannel+0x3c>)
  402cae:	6801      	ldr	r1, [r0, #0]
  402cb0:	4a20      	ldr	r2, [pc, #128]	(402d34 <GetCurrentChannel+0x38>)
  402cb2:	400a      	ands	r2, r1
  402cb4:	6002      	str	r2, [r0, #0]
  402cb6:	60c5      	str	r5, [r0, #12]
  402cb8:	6106      	str	r6, [r0, #16]
  402cba:	6b00      	ldr	r0, [r0, #48]
  402cbc:	2102      	movs	r1, #2
  402cbe:	4301      	orrs	r1, r0
  402cc0:	481d      	ldr	r0, [pc, #116]	(402d38 <GetCurrentChannel+0x3c>)
  402cc2:	6301      	str	r1, [r0, #48]
  402cc4:	6b00      	ldr	r0, [r0, #48]
  402cc6:	2104      	movs	r1, #4
  402cc8:	4301      	orrs	r1, r0
  402cca:	481b      	ldr	r0, [pc, #108]	(402d38 <GetCurrentChannel+0x3c>)
  402ccc:	6301      	str	r1, [r0, #48]
  402cce:	4827      	ldr	r0, [pc, #156]	(402d6c <fill_ram_struct+0x18>)
  402cd0:	4919      	ldr	r1, [pc, #100]	(402d38 <GetCurrentChannel+0x3c>)
  402cd2:	6b09      	ldr	r1, [r1, #48]
  402cd4:	4a08      	ldr	r2, [pc, #32]	(402cf8 <SetChannel+0x68>)
  402cd6:	400a      	ands	r2, r1
  402cd8:	1901      	adds	r1, r0, r4
  402cda:	7a09      	ldrb	r1, [r1, #8]
  402cdc:	0209      	lsls	r1, r1, #8
  402cde:	23f8      	movs	r3, #248
  402ce0:	015b      	lsls	r3, r3, #5
  402ce2:	400b      	ands	r3, r1
  402ce4:	4313      	orrs	r3, r2
  402ce6:	4914      	ldr	r1, [pc, #80]	(402d38 <GetCurrentChannel+0x3c>)
  402ce8:	630b      	str	r3, [r1, #48]
  402cea:	7104      	strb	r4, [r0, #4]
  402cec:	2000      	movs	r0, #0
  402cee:	9903      	ldr	r1, [sp, #12]
  402cf0:	bc70      	pop	{r4, r5, r6}
  402cf2:	b001      	add	sp, #4
  402cf4:	4708      	bx	r1
  402cf6:	46c0      	nop			(mov r8, r8)
  402cf8:	ffffe0ff 	.word	0xffffe0ff

00402cfc <GetCurrentChannel>:
  402cfc:	b430      	push	{r4, r5}
  402cfe:	0002      	lsls	r2, r0, #0
  402d00:	20ff      	movs	r0, #255
  402d02:	2300      	movs	r3, #0
  402d04:	5cd4      	ldrb	r4, [r2, r3]
  402d06:	4d0a      	ldr	r5, [pc, #40]	(402d30 <GetCurrentChannel+0x34>)
  402d08:	682d      	ldr	r5, [r5, #0]
  402d0a:	42ac      	cmp	r4, r5
  402d0c:	d107      	bne.n	402d1e <GetCurrentChannel+0x22>
  402d0e:	009c      	lsls	r4, r3, #2
  402d10:	590c      	ldr	r4, [r1, r4]
  402d12:	4d07      	ldr	r5, [pc, #28]	(402d30 <GetCurrentChannel+0x34>)
  402d14:	686d      	ldr	r5, [r5, #4]
  402d16:	42ac      	cmp	r4, r5
  402d18:	d101      	bne.n	402d1e <GetCurrentChannel+0x22>
  402d1a:	0018      	lsls	r0, r3, #0
  402d1c:	e004      	b.n	402d28 <GetCurrentChannel+0x2c>
  402d1e:	1c5b      	adds	r3, r3, #1
  402d20:	061c      	lsls	r4, r3, #24
  402d22:	0e24      	lsrs	r4, r4, #24
  402d24:	2c10      	cmp	r4, #16
  402d26:	d3ed      	bcc.n	402d04 <GetCurrentChannel+0x8>
  402d28:	0600      	lsls	r0, r0, #24
  402d2a:	0e00      	lsrs	r0, r0, #24
  402d2c:	bc30      	pop	{r4, r5}
  402d2e:	4770      	bx	lr
  402d30:	8000980c 	.word	0x8000980c
  402d34:	bfffffff 	.word	0xbfffffff
  402d38:	80009800 	.word	0x80009800

00402d3c <SetEdCcaThreshold>:
  402d3c:	4903      	ldr	r1, [pc, #12]	(402d4c <SetEdCcaThreshold+0x10>)
  402d3e:	680a      	ldr	r2, [r1, #0]
  402d40:	4b03      	ldr	r3, [pc, #12]	(402d50 <SetEdCcaThreshold+0x14>)
  402d42:	4013      	ands	r3, r2
  402d44:	0400      	lsls	r0, r0, #16
  402d46:	4318      	orrs	r0, r3
  402d48:	6008      	str	r0, [r1, #0]
  402d4a:	4770      	bx	lr
  402d4c:	80009460 	.word	0x80009460
  402d50:	ff00ffff 	.word	0xff00ffff

00402d54 <fill_ram_struct>:
  402d54:	4905      	ldr	r1, [pc, #20]	(402d6c <fill_ram_struct+0x18>)
  402d56:	7802      	ldrb	r2, [r0, #0]
  402d58:	700a      	strb	r2, [r1, #0]
  402d5a:	7842      	ldrb	r2, [r0, #1]
  402d5c:	704a      	strb	r2, [r1, #1]
  402d5e:	7882      	ldrb	r2, [r0, #2]
  402d60:	708a      	strb	r2, [r1, #2]
  402d62:	1cc0      	adds	r0, r0, #3
  402d64:	7800      	ldrb	r0, [r0, #0]
  402d66:	70c8      	strb	r0, [r1, #3]
  402d68:	4770      	bx	lr
  402d6a:	0000      	lsls	r0, r0, #0
  402d6c:	00405178 	.word	0x00405178

00402d70 <GetCurrentChann>:
  402d70:	4801      	ldr	r0, [pc, #4]	(402d78 <GetCurrentChann+0x8>)
  402d72:	7800      	ldrb	r0, [r0, #0]
  402d74:	4770      	bx	lr
  402d76:	46c0      	nop			(mov r8, r8)
  402d78:	0040517c 	.word	0x0040517c

00402d7c <SMAC_InitFlybackSettings>:
  402d7c:	4804      	ldr	r0, [pc, #16]	(402d90 <SMAC_InitFlybackSettings+0x14>)
  402d7e:	6802      	ldr	r2, [r0, #0]
  402d80:	4904      	ldr	r1, [pc, #16]	(402d94 <SMAC_InitFlybackSettings+0x18>)
  402d82:	4311      	orrs	r1, r2
  402d84:	6001      	str	r1, [r0, #0]
  402d86:	4904      	ldr	r1, [pc, #16]	(402d98 <SMAC_InitFlybackSettings+0x1c>)
  402d88:	6041      	str	r1, [r0, #4]
  402d8a:	0b09      	lsrs	r1, r1, #12
  402d8c:	6081      	str	r1, [r0, #8]
  402d8e:	4770      	bx	lr
  402d90:	80009a08 	.word	0x80009a08
  402d94:	0000f7df 	.word	0x0000f7df
  402d98:	00ffffff 	.word	0x00ffffff

00402d9c <get_ctov>:
  402d9c:	4a04      	ldr	r2, [pc, #16]	(402db0 <get_ctov+0x14>)
  402d9e:	4350      	muls	r0, r2
  402da0:	0589      	lsls	r1, r1, #22
  402da2:	1840      	adds	r0, r0, r1
  402da4:	4903      	ldr	r1, [pc, #12]	(402db4 <get_ctov+0x18>)
  402da6:	1840      	adds	r0, r0, r1
  402da8:	1640      	asrs	r0, r0, #25
  402daa:	0600      	lsls	r0, r0, #24
  402dac:	0e00      	lsrs	r0, r0, #24
  402dae:	4770      	bx	lr
  402db0:	00dfbe77 	.word	0x00dfbe77
  402db4:	023126e9 	.word	0x023126e9

00402db8 <gRadioTOCCal2_24MHz_c>:
  402db8:	80009000 80050100                       ........

00402dc0 <gRadioTOCCal3_c>:
  402dc0:	80009400 00020017 80009a04 8185a0a4     ................
  402dd0:	80009a00 8c900025 00000000 000010e0     ....%...........
  402de0:	80009a00 8c900021 80009a00 8c900027     ....!.......'...
  402df0:	00000000 000010e0 80009a00 8c90002b     ............+...
  402e00:	80009a00 8c90002f 00000000 000010e0     ..../...........
  402e10:	80009a00 8c900000                       ........

00402e18 <gRadioTOCCal4_None24MHz_c>:
  402e18:	80009000 80050300                       ........

00402e20 <gRadioInit_RegReplacement_c>:
  402e20:	80004118 00180012 80009204 00000605     .A..............
  402e30:	80009208 00000504 8000920c 00001111     ................
  402e40:	80009210 0fc40000 80009300 20046000     .............`. 
  402e50:	80009304 4005580c 80009308 40075801     .....X.@.....X.@
  402e60:	8000930c 4005d801 80009310 5a45d800     .......@......EZ
  402e70:	80009314 4a45d800 80009318 40044000     ......EJ.....@.@
  402e80:	80009380 00106000 80009384 00083806     .....`.......8..
  402e90:	80009388 00093807 8000938c 0009b804     .....8..........
  402ea0:	80009390 000db800 80009394 00093802     .............8..
  402eb0:	8000a008 00000015 8000a018 00000002     ................
  402ec0:	8000a01c 0000000f 80009424 0000aaa0     ........$.......
  402ed0:	80009434 01002020 80009438 016800fe     4...  ..8.....h.
  402ee0:	8000943c 8e578248 80009440 000000dd     <...H.W.@.......
  402ef0:	80009444 00000946 80009448 0000035a     D...F...H...Z...
  402f00:	8000944c 00100010 80009450 00000515     L.......P.......
  402f10:	80009460 00397feb 80009464 00180358     `.....9.d...X...
  402f20:	8000947c 00000455 800094e0 00000001     |...U...........
  402f30:	800094e4 00020003 800094e8 00040014     ................
  402f40:	800094ec 00240034 800094f0 00440144     ....4.$.....D.D.
  402f50:	800094f4 02440344 800094f8 04440544     ....D.D.....D.D.
  402f60:	80009470 0ee7fc00 8000981c 00000082     p...............
  402f70:	80009828 0000002a                       (...*...

00402f78 <SMAC_InitExecuteEntry>:
  402f78:	b418      	push	{r3, r4}
  402f7a:	6802      	ldr	r2, [r0, #0]
  402f7c:	1d00      	adds	r0, r0, #4
  402f7e:	6803      	ldr	r3, [r0, #0]
  402f80:	4c18      	ldr	r4, [pc, #96]	(402fe4 <SMAC_InitExecuteEntry+0x6c>)
  402f82:	42a2      	cmp	r2, r4
  402f84:	d307      	bcc.n	402f96 <SMAC_InitExecuteEntry+0x1e>
  402f86:	2901      	cmp	r1, #1
  402f88:	d102      	bne.n	402f90 <SMAC_InitExecuteEntry+0x18>
  402f8a:	4817      	ldr	r0, [pc, #92]	(402fe8 <SMAC_InitExecuteEntry+0x70>)
  402f8c:	4282      	cmp	r2, r0
  402f8e:	d000      	beq.n	402f92 <SMAC_InitExecuteEntry+0x1a>
  402f90:	6013      	str	r3, [r2, #0]
  402f92:	2002      	movs	r0, #2
  402f94:	e023      	b.n	402fde <SMAC_InitExecuteEntry+0x66>
  402f96:	2a10      	cmp	r2, #16
  402f98:	d213      	bcs.n	402fc2 <SMAC_InitExecuteEntry+0x4a>
  402f9a:	2a00      	cmp	r2, #0
  402f9c:	d105      	bne.n	402faa <SMAC_InitExecuteEntry+0x32>
  402f9e:	0898      	lsrs	r0, r3, #2
  402fa0:	0001      	lsls	r1, r0, #0
  402fa2:	1e48      	subs	r0, r1, #1
  402fa4:	2900      	cmp	r1, #0
  402fa6:	d1fb      	bne.n	402fa0 <SMAC_InitExecuteEntry+0x28>
  402fa8:	e7f3      	b.n	402f92 <SMAC_InitExecuteEntry+0x1a>
  402faa:	2a01      	cmp	r2, #1
  402fac:	d116      	bne.n	402fdc <SMAC_InitExecuteEntry+0x64>
  402fae:	6842      	ldr	r2, [r0, #4]
  402fb0:	3008      	adds	r0, #8
  402fb2:	6811      	ldr	r1, [r2, #0]
  402fb4:	4399      	bics	r1, r3
  402fb6:	6800      	ldr	r0, [r0, #0]
  402fb8:	4003      	ands	r3, r0
  402fba:	430b      	orrs	r3, r1
  402fbc:	6013      	str	r3, [r2, #0]
  402fbe:	2004      	movs	r0, #4
  402fc0:	e00d      	b.n	402fde <SMAC_InitExecuteEntry+0x66>
  402fc2:	480a      	ldr	r0, [pc, #40]	(402fec <SMAC_InitExecuteEntry+0x74>)
  402fc4:	4282      	cmp	r2, r0
  402fc6:	d209      	bcs.n	402fdc <SMAC_InitExecuteEntry+0x64>
  402fc8:	4809      	ldr	r0, [pc, #36]	(402ff0 <SMAC_InitExecuteEntry+0x78>)
  402fca:	4282      	cmp	r2, r0
  402fcc:	d006      	beq.n	402fdc <SMAC_InitExecuteEntry+0x64>
  402fce:	0910      	lsrs	r0, r2, #4
  402fd0:	1e40      	subs	r0, r0, #1
  402fd2:	0600      	lsls	r0, r0, #24
  402fd4:	0e00      	lsrs	r0, r0, #24
  402fd6:	4907      	ldr	r1, [pc, #28]	(402ff4 <SMAC_InitExecuteEntry+0x7c>)
  402fd8:	540b      	strb	r3, [r1, r0]
  402fda:	e7da      	b.n	402f92 <SMAC_InitExecuteEntry+0x1a>
  402fdc:	2000      	movs	r0, #0
  402fde:	bc12      	pop	{r1, r4}
  402fe0:	4770      	bx	lr
  402fe2:	46c0      	nop			(mov r8, r8)
  402fe4:	00140001 	.word	0x00140001
  402fe8:	80003048 	.word	0x80003048
  402fec:	0000fff1 	.word	0x0000fff1
  402ff0:	00000e0f 	.word	0x00000e0f
  402ff4:	004050ac 	.word	0x004050ac

00402ff8 <SMAC_InitFromFlash>:
  402ff8:	b570      	push	{r4, r5, r6, lr}
  402ffa:	b08a      	sub	sp, #40
  402ffc:	0006      	lsls	r6, r0, #0
  402ffe:	a804      	add	r0, sp, #16
  403000:	2102      	movs	r1, #2
  403002:	7001      	strb	r1, [r0, #0]
  403004:	2101      	movs	r1, #1
  403006:	7101      	strb	r1, [r0, #4]
  403008:	f400 fdf4 	bl	3bf4 <CRM_VRegCntl>
  40300c:	482b      	ldr	r0, [pc, #172]	(4030bc <SMAC_InitFromFlash+0xc4>)
  40300e:	6800      	ldr	r0, [r0, #0]
  403010:	2107      	movs	r1, #7
  403012:	f7fd fc9d 	bl	400950 <?Veneer (3) for __aeabi_uidiv>
  403016:	9001      	str	r0, [sp, #4]
  403018:	9801      	ldr	r0, [sp, #4]
  40301a:	1e41      	subs	r1, r0, #1
  40301c:	9101      	str	r1, [sp, #4]
  40301e:	2800      	cmp	r0, #0
  403020:	d1fa      	bne.n	403018 <SMAC_InitFromFlash+0x20>
  403022:	4669      	mov	r1, sp
  403024:	f403 fe48 	bl	6cb8 <NVM_Detect>
  403028:	2800      	cmp	r0, #0
  40302a:	d103      	bne.n	403034 <SMAC_InitFromFlash+0x3c>
  40302c:	4668      	mov	r0, sp
  40302e:	7800      	ldrb	r0, [r0, #0]
  403030:	2800      	cmp	r0, #0
  403032:	d101      	bne.n	403038 <SMAC_InitFromFlash+0x40>
  403034:	2000      	movs	r0, #0
  403036:	e03f      	b.n	4030b8 <SMAC_InitFromFlash+0xc0>
  403038:	2000      	movs	r0, #0
  40303a:	f404 f823 	bl	7084 <NVM_SetSVar>
  40303e:	2008      	movs	r0, #8
  403040:	b501      	push	{r0, lr}
  403042:	0033      	lsls	r3, r6, #0
  403044:	aa04      	add	r2, sp, #16
  403046:	a802      	add	r0, sp, #8
  403048:	7801      	ldrb	r1, [r0, #0]
  40304a:	2000      	movs	r0, #0
  40304c:	f403 fe8c 	bl	6d68 <NVM_Read>
  403050:	b002      	add	sp, #8
  403052:	2800      	cmp	r0, #0
  403054:	d109      	bne.n	40306a <SMAC_InitFromFlash+0x72>
  403056:	9802      	ldr	r0, [sp, #8]
  403058:	4919      	ldr	r1, [pc, #100]	(4030c0 <SMAC_InitFromFlash+0xc8>)
  40305a:	4288      	cmp	r0, r1
  40305c:	d105      	bne.n	40306a <SMAC_InitFromFlash+0x72>
  40305e:	a802      	add	r0, sp, #8
  403060:	88c1      	ldrh	r1, [r0, #6]
  403062:	22ff      	movs	r2, #255
  403064:	1c92      	adds	r2, r2, #2
  403066:	4291      	cmp	r1, r2
  403068:	d303      	bcc.n	403072 <SMAC_InitFromFlash+0x7a>
  40306a:	2001      	movs	r0, #1
  40306c:	f404 f80a 	bl	7084 <NVM_SetSVar>
  403070:	e7e0      	b.n	403034 <SMAC_InitFromFlash+0x3c>
  403072:	2408      	movs	r4, #8
  403074:	8885      	ldrh	r5, [r0, #4]
  403076:	1f2d      	subs	r5, r5, #4
  403078:	e007      	b.n	40308a <SMAC_InitFromFlash+0x92>
  40307a:	2101      	movs	r1, #1
  40307c:	a806      	add	r0, sp, #24
  40307e:	f7ff ff7b 	bl	402f78 <SMAC_InitExecuteEntry>
  403082:	2800      	cmp	r0, #0
  403084:	d00f      	beq.n	4030a6 <SMAC_InitFromFlash+0xae>
  403086:	0080      	lsls	r0, r0, #2
  403088:	1824      	adds	r4, r4, r0
  40308a:	42ac      	cmp	r4, r5
  40308c:	d210      	bcs.n	4030b0 <SMAC_InitFromFlash+0xb8>
  40308e:	2010      	movs	r0, #16
  403090:	b501      	push	{r0, lr}
  403092:	1933      	adds	r3, r6, r4
  403094:	aa08      	add	r2, sp, #32
  403096:	a802      	add	r0, sp, #8
  403098:	7801      	ldrb	r1, [r0, #0]
  40309a:	2000      	movs	r0, #0
  40309c:	f403 fe64 	bl	6d68 <NVM_Read>
  4030a0:	b002      	add	sp, #8
  4030a2:	2800      	cmp	r0, #0
  4030a4:	d0e9      	beq.n	40307a <SMAC_InitFromFlash+0x82>
  4030a6:	2001      	movs	r0, #1
  4030a8:	f403 ffec 	bl	7084 <NVM_SetSVar>
  4030ac:	0020      	lsls	r0, r4, #0
  4030ae:	e003      	b.n	4030b8 <SMAC_InitFromFlash+0xc0>
  4030b0:	2001      	movs	r0, #1
  4030b2:	f403 ffe7 	bl	7084 <NVM_SetSVar>
  4030b6:	1d20      	adds	r0, r4, #4
  4030b8:	b00a      	add	sp, #40
  4030ba:	e003      	b.n	4030c4 <SMAC_InitFromFlash+0xcc>
  4030bc:	004051e0 	.word	0x004051e0
  4030c0:	00000abc 	.word	0x00000abc
  4030c4:	9903      	ldr	r1, [sp, #12]
  4030c6:	bc70      	pop	{r4, r5, r6}
  4030c8:	b001      	add	sp, #4
  4030ca:	4708      	bx	r1

004030cc <MLMEPHYXtalAdjust>:
  4030cc:	b410      	push	{r4}
  4030ce:	2820      	cmp	r0, #32
  4030d0:	d201      	bcs.n	4030d6 <??MLMEPHYXtalAdjust_0>
  4030d2:	2920      	cmp	r1, #32
  4030d4:	d301      	bcc.n	4030da <??MLMEPHYXtalAdjust_1>

004030d6 <??MLMEPHYXtalAdjust_0>:
  4030d6:	2001      	movs	r0, #1
  4030d8:	e01d      	b.n	403116 <??MLMEPHYXtalAdjust_2>

004030da <??MLMEPHYXtalAdjust_1>:
  4030da:	4a10      	ldr	r2, [pc, #64]	(40311c <??MLMEPHYXtalAdjust_3>)
  4030dc:	06c3      	lsls	r3, r0, #27
  4030de:	6813      	ldr	r3, [r2, #0]
  4030e0:	d503      	bpl.n	4030ea <??MLMEPHYXtalAdjust_4>
  4030e2:	2480      	movs	r4, #128
  4030e4:	04a4      	lsls	r4, r4, #18
  4030e6:	431c      	orrs	r4, r3
  4030e8:	e001      	b.n	4030ee <??MLMEPHYXtalAdjust_5>

004030ea <??MLMEPHYXtalAdjust_4>:
  4030ea:	4c0d      	ldr	r4, [pc, #52]	(403120 <??MLMEPHYXtalAdjust_3+0x4>)
  4030ec:	401c      	ands	r4, r3

004030ee <??MLMEPHYXtalAdjust_5>:
  4030ee:	6014      	str	r4, [r2, #0]
  4030f0:	6813      	ldr	r3, [r2, #0]
  4030f2:	4c0c      	ldr	r4, [pc, #48]	(403124 <??MLMEPHYXtalAdjust_3+0x8>)
  4030f4:	401c      	ands	r4, r3
  4030f6:	0540      	lsls	r0, r0, #21
  4030f8:	23f0      	movs	r3, #240
  4030fa:	045b      	lsls	r3, r3, #17
  4030fc:	4003      	ands	r3, r0
  4030fe:	4323      	orrs	r3, r4
  403100:	6013      	str	r3, [r2, #0]
  403102:	6810      	ldr	r0, [r2, #0]
  403104:	4b08      	ldr	r3, [pc, #32]	(403128 <??MLMEPHYXtalAdjust_3+0xc>)
  403106:	4003      	ands	r3, r0
  403108:	0408      	lsls	r0, r1, #16
  40310a:	21f8      	movs	r1, #248
  40310c:	0349      	lsls	r1, r1, #13
  40310e:	4001      	ands	r1, r0
  403110:	4319      	orrs	r1, r3
  403112:	6011      	str	r1, [r2, #0]
  403114:	2000      	movs	r0, #0

00403116 <??MLMEPHYXtalAdjust_2>:
  403116:	bc10      	pop	{r4}
  403118:	4770      	bx	lr
  40311a:	46c0      	nop			(mov r8, r8)

0040311c <??MLMEPHYXtalAdjust_3>:
  40311c:	3040 8000 ffff fdff ffff fe1f ffff ffe0     @0..............

0040312c <MLMEGetPromiscuousMode>:
  40312c:	4830      	ldr	r0, [pc, #192]	(4031f0 <??DataTable2>)
  40312e:	7800      	ldrb	r0, [r0, #0]
  403130:	4770      	bx	lr
	...

00403134 <MLMERadioInit>:
  403134:	b570      	push	{r4, r5, r6, lr}
  403136:	b082      	sub	sp, #8
  403138:	2500      	movs	r5, #0
  40313a:	2601      	movs	r6, #1
  40313c:	4c2c      	ldr	r4, [pc, #176]	(4031f0 <??DataTable2>)
  40313e:	7860      	ldrb	r0, [r4, #1]
  403140:	2800      	cmp	r0, #0
  403142:	d10d      	bne.n	403160 <??MLMERadioInit_0>
  403144:	7066      	strb	r6, [r4, #1]
  403146:	22a8      	movs	r2, #168
  403148:	0592      	lsls	r2, r2, #22
  40314a:	2118      	movs	r1, #24
  40314c:	4820      	ldr	r0, [pc, #128]	(4031d0 <??MLMERadioInit_1>)
  40314e:	f7ff fd3f 	bl	402bd0 <RadioInit>
  403152:	210f      	movs	r1, #15
  403154:	2008      	movs	r0, #8
  403156:	f7ff ffb9 	bl	4030cc <MLMEPHYXtalAdjust>
  40315a:	7025      	strb	r5, [r4, #0]
  40315c:	f7ff f86e 	bl	40223c <radio_manager_init>

00403160 <??MLMERadioInit_0>:
  403160:	481c      	ldr	r0, [pc, #112]	(4031d4 <??MLMERadioInit_1+0x4>)
  403162:	6006      	str	r6, [r0, #0]
  403164:	4669      	mov	r1, sp
  403166:	700d      	strb	r5, [r1, #0]
  403168:	466a      	mov	r2, sp
  40316a:	e003      	b.n	403174 <??MLMERadioInit_2>

0040316c <??MLMERadioInit_3>:
  40316c:	4669      	mov	r1, sp
  40316e:	7809      	ldrb	r1, [r1, #0]
  403170:	1c49      	adds	r1, r1, #1
  403172:	7011      	strb	r1, [r2, #0]

00403174 <??MLMERadioInit_2>:
  403174:	4669      	mov	r1, sp
  403176:	7809      	ldrb	r1, [r1, #0]
  403178:	2964      	cmp	r1, #100
  40317a:	d3f7      	bcc.n	40316c <??MLMERadioInit_3>
  40317c:	2102      	movs	r1, #2
  40317e:	6001      	str	r1, [r0, #0]
  403180:	6085      	str	r5, [r0, #8]
  403182:	2103      	movs	r1, #3
  403184:	63c1      	str	r1, [r0, #60]
  403186:	4914      	ldr	r1, [pc, #80]	(4031d8 <??MLMERadioInit_1+0x8>)
  403188:	225f      	movs	r2, #95
  40318a:	648a      	str	r2, [r1, #72]
  40318c:	4a13      	ldr	r2, [pc, #76]	(4031dc <??MLMERadioInit_1+0xc>)
  40318e:	64ca      	str	r2, [r1, #76]
  403190:	2204      	movs	r2, #4
  403192:	67ca      	str	r2, [r1, #124]
  403194:	4a12      	ldr	r2, [pc, #72]	(4031e0 <??MLMERadioInit_1+0x10>)
  403196:	4b13      	ldr	r3, [pc, #76]	(4031e4 <??MLMERadioInit_1+0x14>)
  403198:	6013      	str	r3, [r2, #0]
  40319a:	2325      	movs	r3, #37
  40319c:	6093      	str	r3, [r2, #8]
  40319e:	22a7      	movs	r2, #167
  4031a0:	658a      	str	r2, [r1, #88]
  4031a2:	2208      	movs	r2, #8
  4031a4:	6442      	str	r2, [r0, #68]
  4031a6:	4a10      	ldr	r2, [pc, #64]	(4031e8 <??MLMERadioInit_1+0x18>)
  4031a8:	600a      	str	r2, [r1, #0]
  4031aa:	21d4      	movs	r1, #212
  4031ac:	0389      	lsls	r1, r1, #14
  4031ae:	6601      	str	r1, [r0, #96]
  4031b0:	2000      	movs	r0, #0
  4031b2:	f000 faf7 	bl	4037a4 <SetComplementaryPAState>
  4031b6:	2000      	movs	r0, #0
  4031b8:	f000 fb00 	bl	4037bc <SetPowerLevelLockMode>
  4031bc:	2039      	movs	r0, #57
  4031be:	f7ff fdbd 	bl	402d3c <SetEdCcaThreshold>
  4031c2:	480a      	ldr	r0, [pc, #40]	(4031ec <??MLMERadioInit_1+0x1c>)
  4031c4:	490b      	ldr	r1, [pc, #44]	(4031f4 <??DataTable4>)
  4031c6:	6001      	str	r1, [r0, #0]
  4031c8:	2000      	movs	r0, #0
  4031ca:	bc76      	pop	{r1, r2, r4, r5, r6}
  4031cc:	bc08      	pop	{r3}
  4031ce:	4718      	bx	r3

004031d0 <??MLMERadioInit_1>:
  4031d0:	3600 016e 4004 8000 40cc 8000 0012 0018     .6n..@...@......
  4031e0:	414c 8000 0022 001a 3815 0000 3048 8000     LA.."....8..H0..

004031f0 <??DataTable2>:
  4031f0:	50bc 0040                                   .P@.

004031f4 <??DataTable4>:
  4031f4:	0f78 0000                                   x...

004031f8 <?Veneer (0) for RP_Vector_Init>:
  4031f8:	e59fc000 	ldr	ip, [pc, #0]	; 403200 <?Veneer (0) for RP_Vector_Init+0x8>
  4031fc:	e12fff1c 	bx	ip
  403200:	00403d01 	.word	0x00403d01

00403204 <?Veneer (0) for Main>:
  403204:	e59fc000 	ldr	ip, [pc, #0]	; 40320c <?Veneer (0) for Main+0x8>
  403208:	e12fff1c 	bx	ip
  40320c:	00400961 	.word	0x00400961

00403210 <__start_>:
  403210:	e59f1100 	ldr	r1, [pc, #256]	; 403318 <_?0>
  403214:	e3a000d3 	mov	r0, #211	; 0xd3
  403218:	e121f000 	msr	CPSR_c, r0
  40321c:	e2811f40 	add	r1, r1, #256	; 0x100
  403220:	e1a0d001 	mov	sp, r1
  403224:	e3a000d2 	mov	r0, #210	; 0xd2
  403228:	e121f000 	msr	CPSR_c, r0
  40322c:	e2811e40 	add	r1, r1, #1024	; 0x400
  403230:	e1a0d001 	mov	sp, r1
  403234:	e3a000d1 	mov	r0, #209	; 0xd1
  403238:	e121f000 	msr	CPSR_c, r0
  40323c:	e2811e40 	add	r1, r1, #1024	; 0x400
  403240:	e1a0d001 	mov	sp, r1
  403244:	e3a000db 	mov	r0, #219	; 0xdb
  403248:	e121f000 	msr	CPSR_c, r0
  40324c:	e2811f40 	add	r1, r1, #256	; 0x100
  403250:	e1a0d001 	mov	sp, r1
  403254:	e3a000d7 	mov	r0, #215	; 0xd7
  403258:	e121f000 	msr	CPSR_c, r0
  40325c:	e2811f40 	add	r1, r1, #256	; 0x100
  403260:	e1a0d001 	mov	sp, r1
  403264:	e3a000df 	mov	r0, #223	; 0xdf
  403268:	e121f000 	msr	CPSR_c, r0
  40326c:	e2811e80 	add	r1, r1, #2048	; 0x800
  403270:	e1a0d001 	mov	sp, r1
  403274:	eb00026f 	bl	403c38 <__iar_data_init2>
  403278:	e59f009c 	ldr	r0, [pc, #156]	; 40331c <_?1>
  40327c:	e59f309c 	ldr	r3, [pc, #156]	; 403320 <_?2>
  403280:	e1500003 	cmp	r0, r3
  403284:	0a000000 	beq	40328c <__call_main>
  403288:	ebf03590 	bl	108d0 <__rom_data_init>

0040328c <__call_main>:
  40328c:	ebffffd9 	bl	4031f8 <?Veneer (0) for RP_Vector_Init>
  403290:	eaffffdb 	b	403204 <?Veneer (0) for Main>

00403294 <__reserved_>:
  403294:	e1b0f00e 	movs	pc, lr

00403298 <__UndefInstructionHndlr_>:
  403298:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
  40329c:	e59f0080 	ldr	r0, [pc, #128]	; 403324 <_?3>
  4032a0:	e5900000 	ldr	r0, [r0]
  4032a4:	e3500000 	cmp	r0, #0	; 0x0
  4032a8:	11a0e00f 	movne	lr, pc
  4032ac:	112fff10 	bxne	r0
  4032b0:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
  4032b4:	e1b0f00e 	movs	pc, lr

004032b8 <__SupervisorHndlr_>:
  4032b8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
  4032bc:	e59f0064 	ldr	r0, [pc, #100]	; 403328 <_?4>
  4032c0:	e5900000 	ldr	r0, [r0]
  4032c4:	e3500000 	cmp	r0, #0	; 0x0
  4032c8:	11a0e00f 	movne	lr, pc
  4032cc:	112fff10 	bxne	r0
  4032d0:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
  4032d4:	e1b0f00e 	movs	pc, lr

004032d8 <__PrefetchAbtHndlr_>:
  4032d8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
  4032dc:	e59f0048 	ldr	r0, [pc, #72]	; 40332c <_?5>
  4032e0:	e5900000 	ldr	r0, [r0]
  4032e4:	e3500000 	cmp	r0, #0	; 0x0
  4032e8:	11a0e00f 	movne	lr, pc
  4032ec:	112fff10 	bxne	r0
  4032f0:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
  4032f4:	e25ef004 	subs	pc, lr, #4	; 0x4

004032f8 <__DataAbtHndlr_>:
  4032f8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
  4032fc:	e59f002c 	ldr	r0, [pc, #44]	; 403330 <_?6>
  403300:	e5900000 	ldr	r0, [r0]
  403304:	e3500000 	cmp	r0, #0	; 0x0
  403308:	11a0e00f 	movne	lr, pc
  40330c:	112fff10 	bxne	r0
  403310:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
  403314:	e25ef004 	subs	pc, lr, #4	; 0x4

00403318 <_?0>:
  403318:	00403d50                                P=@.

0040331c <_?1>:
  40331c:	00011788                                ....

00403320 <_?2>:
  403320:	000117a8                                ....

00403324 <_?3>:
  403324:	0040014c                                L.@.

00403328 <_?4>:
  403328:	00400150                                P.@.

0040332c <_?5>:
  40332c:	00400154                                T.@.

00403330 <_?6>:
  403330:	00400158                                X.@.

00403334 <__iar_packbits_init2>:
  403334:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
  403338:	e5902000 	ldr	r2, [r0]
  40333c:	e2801008 	add	r1, r0, #8	; 0x8
  403340:	e5900004 	ldr	r0, [r0, #4]
  403344:	e0812182 	add	r2, r1, r2, lsl #3
  403348:	e0820180 	add	r0, r2, r0, lsl #3
  40334c:	e3a06000 	mov	r6, #0	; 0x0
  403350:	e3a07000 	mov	r7, #0	; 0x0
  403354:	e3a04000 	mov	r4, #0	; 0x0
  403358:	e3a05001 	mov	r5, #1	; 0x1
  40335c:	ea00000a 	b	40338c <__iar_packbits_init2+0x58>
  403360:	e4d68001 	ldrb	r8, [r6], #1
  403364:	e15e0009 	cmp	lr, r9
  403368:	0a000005 	beq	403384 <__iar_packbits_init2+0x50>
  40336c:	e2844001 	add	r4, r4, #1	; 0x1
  403370:	e1a04804 	lsl	r4, r4, #16
  403374:	e4ce8001 	strb	r8, [lr], #1
  403378:	e1b04844 	asrs	r4, r4, #16
  40337c:	4afffff8 	bmi	403364 <__iar_packbits_init2+0x30>
  403380:	e3a05001 	mov	r5, #1	; 0x1
  403384:	e15e0009 	cmp	lr, r9
  403388:	1a000007 	bne	4033ac <__iar_packbits_init2+0x78>
  40338c:	e1520000 	cmp	r2, r0
  403390:	1a000001 	bne	40339c <__iar_packbits_init2+0x68>
  403394:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
  403398:	e12fff1e 	bx	lr
  40339c:	e492e004 	ldr	lr, [r2], #4
  4033a0:	e4928004 	ldr	r8, [r2], #4
  4033a4:	e088900e 	add	r9, r8, lr
  4033a8:	eafffff5 	b	403384 <__iar_packbits_init2+0x50>
  4033ac:	e1560007 	cmp	r6, r7
  4033b0:	1a000004 	bne	4033c8 <__iar_packbits_init2+0x94>
  4033b4:	e4916004 	ldr	r6, [r1], #4
  4033b8:	e4917004 	ldr	r7, [r1], #4
  4033bc:	e0877006 	add	r7, r7, r6
  4033c0:	e1560007 	cmp	r6, r7
  4033c4:	0afffffa 	beq	4033b4 <__iar_packbits_init2+0x80>
  4033c8:	e3550000 	cmp	r5, #0	; 0x0
  4033cc:	0a000008 	beq	4033f4 <__iar_packbits_init2+0xc0>
  4033d0:	e0d640d1 	ldrsb	r4, [r6], #1
  4033d4:	e3a05000 	mov	r5, #0	; 0x0
  4033d8:	e1560007 	cmp	r6, r7
  4033dc:	1a000004 	bne	4033f4 <__iar_packbits_init2+0xc0>
  4033e0:	e4916004 	ldr	r6, [r1], #4
  4033e4:	e4917004 	ldr	r7, [r1], #4
  4033e8:	e0877006 	add	r7, r7, r6
  4033ec:	e1560007 	cmp	r6, r7
  4033f0:	0afffffa 	beq	4033e0 <__iar_packbits_init2+0xac>
  4033f4:	e3540000 	cmp	r4, #0	; 0x0
  4033f8:	4affffd8 	bmi	403360 <__iar_packbits_init2+0x2c>
  4033fc:	e3540000 	cmp	r4, #0	; 0x0
  403400:	4affffde 	bmi	403380 <__iar_packbits_init2+0x4c>
  403404:	e15e0009 	cmp	lr, r9
  403408:	11560007 	cmpne	r6, r7
  40340c:	0affffdc 	beq	403384 <__iar_packbits_init2+0x50>
  403410:	e4d68001 	ldrb	r8, [r6], #1
  403414:	e2444001 	sub	r4, r4, #1	; 0x1
  403418:	e1a04804 	lsl	r4, r4, #16
  40341c:	e4ce8001 	strb	r8, [lr], #1
  403420:	e1a04844 	asr	r4, r4, #16
  403424:	eafffff4 	b	4033fc <__iar_packbits_init2+0xc8>

00403428 <LED_Init>:
  403428:	b580      	push	{r7, lr}
  40342a:	200f      	movs	r0, #15
  40342c:	f000 f809 	bl	403442 <Set_Pins>
  403430:	200f      	movs	r0, #15
  403432:	f000 f853 	bl	4034dc <LED_TurnOffLed>
  403436:	2100      	movs	r1, #0
  403438:	2019      	movs	r0, #25
  40343a:	f405 f821 	bl	8480 <Gpio_SetPinData>
  40343e:	bc09      	pop	{r0, r3}
  403440:	4718      	bx	r3

00403442 <Set_Pins>:
  403442:	b510      	push	{r4, lr}
  403444:	0004      	lsls	r4, r0, #0
  403446:	07e0      	lsls	r0, r4, #31
  403448:	d50f      	bpl.n	40346a <??Set_Pins_0>
  40344a:	2100      	movs	r1, #0
  40344c:	2017      	movs	r0, #23
  40344e:	f405 f98d 	bl	876c <Gpio_SetPinFunction>
  403452:	2101      	movs	r1, #1
  403454:	2017      	movs	r0, #23
  403456:	f405 f88d 	bl	8574 <Gpio_SetPinReadSource>
  40345a:	2101      	movs	r1, #1
  40345c:	2017      	movs	r0, #23
  40345e:	f404 ffa3 	bl	83a8 <Gpio_SetPinDir>
  403462:	2101      	movs	r1, #1
  403464:	2017      	movs	r0, #23
  403466:	f405 f80b 	bl	8480 <Gpio_SetPinData>

0040346a <??Set_Pins_0>:
  40346a:	07a0      	lsls	r0, r4, #30
  40346c:	d50f      	bpl.n	40348e <??Set_Pins_1>
  40346e:	2100      	movs	r1, #0
  403470:	2018      	movs	r0, #24
  403472:	f405 f97b 	bl	876c <Gpio_SetPinFunction>
  403476:	2101      	movs	r1, #1
  403478:	2018      	movs	r0, #24
  40347a:	f405 f87b 	bl	8574 <Gpio_SetPinReadSource>
  40347e:	2101      	movs	r1, #1
  403480:	2018      	movs	r0, #24
  403482:	f404 ff91 	bl	83a8 <Gpio_SetPinDir>
  403486:	2101      	movs	r1, #1
  403488:	2018      	movs	r0, #24
  40348a:	f404 fff9 	bl	8480 <Gpio_SetPinData>

0040348e <??Set_Pins_1>:
  40348e:	0760      	lsls	r0, r4, #29
  403490:	d50f      	bpl.n	4034b2 <??Set_Pins_2>
  403492:	2100      	movs	r1, #0
  403494:	2019      	movs	r0, #25
  403496:	f405 f969 	bl	876c <Gpio_SetPinFunction>
  40349a:	2101      	movs	r1, #1
  40349c:	2019      	movs	r0, #25
  40349e:	f405 f869 	bl	8574 <Gpio_SetPinReadSource>
  4034a2:	2101      	movs	r1, #1
  4034a4:	2019      	movs	r0, #25
  4034a6:	f404 ff7f 	bl	83a8 <Gpio_SetPinDir>
  4034aa:	2101      	movs	r1, #1
  4034ac:	2019      	movs	r0, #25
  4034ae:	f404 ffe7 	bl	8480 <Gpio_SetPinData>

004034b2 <??Set_Pins_2>:
  4034b2:	0720      	lsls	r0, r4, #28
  4034b4:	d50f      	bpl.n	4034d6 <??Set_Pins_3>
  4034b6:	2100      	movs	r1, #0
  4034b8:	202c      	movs	r0, #44
  4034ba:	f405 f957 	bl	876c <Gpio_SetPinFunction>
  4034be:	2101      	movs	r1, #1
  4034c0:	202c      	movs	r0, #44
  4034c2:	f405 f857 	bl	8574 <Gpio_SetPinReadSource>
  4034c6:	2101      	movs	r1, #1
  4034c8:	202c      	movs	r0, #44
  4034ca:	f404 ff6d 	bl	83a8 <Gpio_SetPinDir>
  4034ce:	2101      	movs	r1, #1
  4034d0:	202c      	movs	r0, #44
  4034d2:	f404 ffd5 	bl	8480 <Gpio_SetPinData>

004034d6 <??Set_Pins_3>:
  4034d6:	bc10      	pop	{r4}
  4034d8:	bc08      	pop	{r3}
  4034da:	4718      	bx	r3

004034dc <LED_TurnOffLed>:
  4034dc:	b510      	push	{r4, lr}
  4034de:	0004      	lsls	r4, r0, #0
  4034e0:	07e0      	lsls	r0, r4, #31
  4034e2:	d503      	bpl.n	4034ec <??LED_TurnOffLed_0>
  4034e4:	2100      	movs	r1, #0
  4034e6:	2017      	movs	r0, #23
  4034e8:	f404 ffca 	bl	8480 <Gpio_SetPinData>

004034ec <??LED_TurnOffLed_0>:
  4034ec:	07a0      	lsls	r0, r4, #30
  4034ee:	d503      	bpl.n	4034f8 <??LED_TurnOffLed_1>
  4034f0:	2100      	movs	r1, #0
  4034f2:	2018      	movs	r0, #24
  4034f4:	f404 ffc4 	bl	8480 <Gpio_SetPinData>

004034f8 <??LED_TurnOffLed_1>:
  4034f8:	0760      	lsls	r0, r4, #29
  4034fa:	d503      	bpl.n	403504 <??LED_TurnOffLed_2>
  4034fc:	2100      	movs	r1, #0
  4034fe:	2019      	movs	r0, #25
  403500:	f404 ffbe 	bl	8480 <Gpio_SetPinData>

00403504 <??LED_TurnOffLed_2>:
  403504:	0720      	lsls	r0, r4, #28
  403506:	d503      	bpl.n	403510 <??LED_TurnOffLed_3>
  403508:	2100      	movs	r1, #0
  40350a:	202c      	movs	r0, #44
  40350c:	f404 ffb8 	bl	8480 <Gpio_SetPinData>

00403510 <??LED_TurnOffLed_3>:
  403510:	bc10      	pop	{r4}
  403512:	bc08      	pop	{r3}
  403514:	4718      	bx	r3
	...

00403518 <gPSMVAL_c>:
  403518:	080f 0000 080f 0000 080f 0000 080f 0000     ................
  403528:	081f 0000 081f 0000 081f 0000 080f 0000     ................
  403538:	080f 0000 080f 0000 001f 0000 000f 0000     ................
  403548:	081b 0000 0816 0000 001b 0000 000b 0000     ................
  403558:	0802 0000 0817 0000 0003 0000               ............

00403564 <gPAVAL_c>:
  403564:	22c0 0000 22c0 0000 22c0 0000 2280 0000     ."..."..."..."..
  403574:	2303 0000 23c0 0000 2880 0000 29f0 0000     .#...#...(...)..
  403584:	29f0 0000 29f0 0000 29c0 0000 2bf0 0000     .)...)...)...+..
  403594:	2880 0000 28a0 0000 2800 0000 2ac0 0000     .(...(...(...*..
  4035a4:	2880 0000 2a00 0000 2b00 0000               .(...*...+..

004035b0 <gAIMVAL_c>:
  4035b0:	23a0 0001 63a0 0001 a3a0 0001 e3a0 0001     .#...c..........
  4035c0:	23a0 0002 63a0 0002 a3a0 0002 e3a0 0002     .#...c..........
  4035d0:	23a0 0003 63a0 0003 a3a0 0003 a3a0 0003     .#...c..........
  4035e0:	a3a0 0004 23a0 0004 23a0 0005 23a0 0004     .....#...#...#..
  4035f0:	e3a0 0004 e3a0 0004 e3a0 0004               ............

004035fc <?Veneer (3) for UartOpen>:
  4035fc:	b408      	push	{r3}
  4035fe:	4b02      	ldr	r3, [pc, #8]	(403608 <?Veneer (3) for UartOpen+0xc>)
  403600:	469c      	mov	ip, r3
  403602:	bc08      	pop	{r3}
  403604:	4760      	bx	ip
  403606:	46c0      	nop			(mov r8, r8)
  403608:	00002c4d 	.word	0x00002c4d

0040360c <?Veneer (3) for UartSetConfig>:
  40360c:	b408      	push	{r3}
  40360e:	4b02      	ldr	r3, [pc, #8]	(403618 <?Veneer (3) for UartSetConfig+0xc>)
  403610:	469c      	mov	ip, r3
  403612:	bc08      	pop	{r3}
  403614:	4760      	bx	ip
  403616:	46c0      	nop			(mov r8, r8)
  403618:	00002ccd 	.word	0x00002ccd

0040361c <?Veneer (3) for UartSetTransmitterThreshold>:
  40361c:	b408      	push	{r3}
  40361e:	4b02      	ldr	r3, [pc, #8]	(403628 <?Veneer (3) for UartSetTransmitterThreshold+0xc>)
  403620:	469c      	mov	ip, r3
  403622:	bc08      	pop	{r3}
  403624:	4760      	bx	ip
  403626:	46c0      	nop			(mov r8, r8)
  403628:	00002f21 	.word	0x00002f21

0040362c <?Veneer (3) for UartSetReceiverThreshold>:
  40362c:	b408      	push	{r3}
  40362e:	4b02      	ldr	r3, [pc, #8]	(403638 <?Veneer (3) for UartSetReceiverThreshold+0xc>)
  403630:	469c      	mov	ip, r3
  403632:	bc08      	pop	{r3}
  403634:	4760      	bx	ip
  403636:	46c0      	nop			(mov r8, r8)
  403638:	00002e59 	.word	0x00002e59

0040363c <?Veneer (3) for UartSetCallbackFunctions>:
  40363c:	b408      	push	{r3}
  40363e:	4b02      	ldr	r3, [pc, #8]	(403648 <?Veneer (3) for UartSetCallbackFunctions+0xc>)
  403640:	469c      	mov	ip, r3
  403642:	bc08      	pop	{r3}
  403644:	4760      	bx	ip
  403646:	46c0      	nop			(mov r8, r8)
  403648:	00002f71 	.word	0x00002f71

0040364c <?Veneer (3) for UartReadData>:
  40364c:	b408      	push	{r3}
  40364e:	4b02      	ldr	r3, [pc, #8]	(403658 <?Veneer (3) for UartReadData+0xc>)
  403650:	469c      	mov	ip, r3
  403652:	bc08      	pop	{r3}
  403654:	4760      	bx	ip
  403656:	46c0      	nop			(mov r8, r8)
  403658:	00002fb9 	.word	0x00002fb9

0040365c <Uart_Init>:
  40365c:	b510      	push	{r4, lr}
  40365e:	b084      	sub	sp, #16
  403660:	0004      	lsls	r4, r0, #0
  403662:	f000 f83f 	bl	4036e4 <GpioUart1Init>
  403666:	2000      	movs	r0, #0
  403668:	a902      	add	r1, sp, #8
  40366a:	8088      	strh	r0, [r1, #4]
  40366c:	2296      	movs	r2, #150
  40366e:	0212      	lsls	r2, r2, #8
  403670:	9202      	str	r2, [sp, #8]
  403672:	80c8      	strh	r0, [r1, #6]
  403674:	4917      	ldr	r1, [pc, #92]	(4036d4 <??Uart_Init_0>)
  403676:	2001      	movs	r0, #1
  403678:	f40c fc54 	bl	ff24 <IntAssignHandler>
  40367c:	2100      	movs	r1, #0
  40367e:	2001      	movs	r0, #1
  403680:	f40c fc32 	bl	fee8 <ITC_SetPriority>
  403684:	2001      	movs	r0, #1
  403686:	f40c fc9d 	bl	ffc4 <ITC_EnableInterrupt>
  40368a:	4913      	ldr	r1, [pc, #76]	(4036d8 <??Uart_Init_0+0x4>)
  40368c:	2000      	movs	r0, #0
  40368e:	f7ff ffb5 	bl	4035fc <?Veneer (3) for UartOpen>
  403692:	a902      	add	r1, sp, #8
  403694:	2000      	movs	r0, #0
  403696:	f7ff ffb9 	bl	40360c <?Veneer (3) for UartSetConfig>
  40369a:	2105      	movs	r1, #5
  40369c:	2000      	movs	r0, #0
  40369e:	f7ff ffbd 	bl	40361c <?Veneer (3) for UartSetTransmitterThreshold>
  4036a2:	2105      	movs	r1, #5
  4036a4:	2000      	movs	r0, #0
  4036a6:	f7ff ffc1 	bl	40362c <?Veneer (3) for UartSetReceiverThreshold>
  4036aa:	480c      	ldr	r0, [pc, #48]	(4036dc <??Uart_Init_0+0x8>)
  4036ac:	9001      	str	r0, [sp, #4]
  4036ae:	480c      	ldr	r0, [pc, #48]	(4036e0 <??Uart_Init_0+0xc>)
  4036b0:	9000      	str	r0, [sp, #0]
  4036b2:	4669      	mov	r1, sp
  4036b4:	2000      	movs	r0, #0
  4036b6:	f7ff ffc1 	bl	40363c <?Veneer (3) for UartSetCallbackFunctions>
  4036ba:	2000      	movs	r0, #0
  4036bc:	f7fd f928 	bl	400910 <?Veneer (3) for IntRestoreIRQ>
  4036c0:	2301      	movs	r3, #1
  4036c2:	2204      	movs	r2, #4
  4036c4:	0021      	lsls	r1, r4, #0
  4036c6:	2000      	movs	r0, #0
  4036c8:	f7ff ffc0 	bl	40364c <?Veneer (3) for UartReadData>
  4036cc:	b004      	add	sp, #16
  4036ce:	bc10      	pop	{r4}
  4036d0:	bc08      	pop	{r3}
  4036d2:	4718      	bx	r3

004036d4 <??Uart_Init_0>:
  4036d4:	3275 0000 5dc0 0000 372b 0040 3729 0040     u2...]..+7@.)7@.

004036e4 <GpioUart1Init>:
  4036e4:	480f      	ldr	r0, [pc, #60]	(403724 <??DataTable1>)
  4036e6:	21a0      	movs	r1, #160
  4036e8:	0289      	lsls	r1, r1, #10
  4036ea:	6a02      	ldr	r2, [r0, #32]
  4036ec:	430a      	orrs	r2, r1
  4036ee:	6202      	str	r2, [r0, #32]
  4036f0:	6802      	ldr	r2, [r0, #0]
  4036f2:	430a      	orrs	r2, r1
  4036f4:	6002      	str	r2, [r0, #0]
  4036f6:	6982      	ldr	r2, [r0, #24]
  4036f8:	4b09      	ldr	r3, [pc, #36]	(403720 <??GpioUart1Init_0>)
  4036fa:	4013      	ands	r3, r2
  4036fc:	6183      	str	r3, [r0, #24]
  4036fe:	6501      	str	r1, [r0, #80]
  403700:	0849      	lsrs	r1, r1, #1
  403702:	6481      	str	r1, [r0, #72]
  403704:	6881      	ldr	r1, [r0, #8]
  403706:	0109      	lsls	r1, r1, #4
  403708:	0909      	lsrs	r1, r1, #4
  40370a:	22a0      	movs	r2, #160
  40370c:	05d2      	lsls	r2, r2, #23
  40370e:	430a      	orrs	r2, r1
  403710:	6082      	str	r2, [r0, #8]
  403712:	68c1      	ldr	r1, [r0, #12]
  403714:	220f      	movs	r2, #15
  403716:	4391      	bics	r1, r2
  403718:	2205      	movs	r2, #5
  40371a:	430a      	orrs	r2, r1
  40371c:	60c2      	str	r2, [r0, #12]
  40371e:	4770      	bx	lr

00403720 <??GpioUart1Init_0>:
  403720:	7fff fffd                                   ....

00403724 <??DataTable1>:
  403724:	0010 8000                                   ....

00403728 <UartEventRead1>:
  403728:	e000      	b.n	40372c <UartEventRead2>

0040372a <UartEventWrite1>:
  40372a:	4770      	bx	lr

0040372c <UartEventRead2>:
  40372c:	4903      	ldr	r1, [pc, #12]	(40373c <??DataTable4>)
  40372e:	2201      	movs	r2, #1
  403730:	704a      	strb	r2, [r1, #1]
  403732:	8842      	ldrh	r2, [r0, #2]
  403734:	804a      	strh	r2, [r1, #2]
  403736:	7800      	ldrb	r0, [r0, #0]
  403738:	7008      	strb	r0, [r1, #0]
  40373a:	4770      	bx	lr

0040373c <??DataTable4>:
  40373c:	50b0 0040                                   .P@.

00403740 <SetPower>:
  403740:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  403742:	0004      	lsls	r4, r0, #0
  403744:	4d33      	ldr	r5, [pc, #204]	(403814 <InitRifModuleVars+0x10>)
  403746:	78a8      	ldrb	r0, [r5, #2]
  403748:	2801      	cmp	r0, #1
  40374a:	d109      	bne.n	403760 <SetPower+0x20>
  40374c:	40a0      	lsls	r0, r4
  40374e:	492c      	ldr	r1, [pc, #176]	(403800 <bGetEnableLock+0xc>)
  403750:	4208      	tst	r0, r1
  403752:	d101      	bne.n	403758 <SetPower+0x18>
  403754:	20ff      	movs	r0, #255
  403756:	e019      	b.n	40378c <SetPower+0x4c>
  403758:	f7ff fb0a 	bl	402d70 <GetCurrentChann>
  40375c:	280f      	cmp	r0, #15
  40375e:	d2f9      	bcs.n	403754 <SetPower+0x14>
  403760:	00a0      	lsls	r0, r4, #2
  403762:	490d      	ldr	r1, [pc, #52]	(403798 <SetPower+0x58>)
  403764:	180a      	adds	r2, r1, r0
  403766:	324c      	adds	r2, #76
  403768:	6813      	ldr	r3, [r2, #0]
  40376a:	786e      	ldrb	r6, [r5, #1]
  40376c:	2e01      	cmp	r6, #1
  40376e:	d103      	bne.n	403778 <SetPower+0x38>
  403770:	4e0a      	ldr	r6, [pc, #40]	(40379c <SetPower+0x5c>)
  403772:	4f0b      	ldr	r7, [pc, #44]	(4037a0 <SetPower+0x60>)
  403774:	401f      	ands	r7, r3
  403776:	e002      	b.n	40377e <SetPower+0x3e>
  403778:	4e08      	ldr	r6, [pc, #32]	(40379c <SetPower+0x5c>)
  40377a:	0cb7      	lsrs	r7, r6, #18
  40377c:	431f      	orrs	r7, r3
  40377e:	60f7      	str	r7, [r6, #12]
  403780:	5808      	ldr	r0, [r1, r0]
  403782:	6030      	str	r0, [r6, #0]
  403784:	6cd1      	ldr	r1, [r2, #76]
  403786:	6431      	str	r1, [r6, #64]
  403788:	702c      	strb	r4, [r5, #0]
  40378a:	2000      	movs	r0, #0
  40378c:	b001      	add	sp, #4
  40378e:	9904      	ldr	r1, [sp, #16]
  403790:	bcf0      	pop	{r4, r5, r6, r7}
  403792:	b001      	add	sp, #4
  403794:	4708      	bx	r1
  403796:	46c0      	nop			(mov r8, r8)
  403798:	00403518 	.word	0x00403518
  40379c:	8000a014 	.word	0x8000a014
  4037a0:	ffffdfff 	.word	0xffffdfff

004037a4 <SetComplementaryPAState>:
  4037a4:	b580      	push	{r7, lr}
  4037a6:	491b      	ldr	r1, [pc, #108]	(403814 <InitRifModuleVars+0x10>)
  4037a8:	784a      	ldrb	r2, [r1, #1]
  4037aa:	4282      	cmp	r2, r0
  4037ac:	d003      	beq.n	4037b6 <SetComplementaryPAState+0x12>
  4037ae:	7048      	strb	r0, [r1, #1]
  4037b0:	7808      	ldrb	r0, [r1, #0]
  4037b2:	f7ff ffc5 	bl	403740 <SetPower>
  4037b6:	9801      	ldr	r0, [sp, #4]
  4037b8:	b002      	add	sp, #8
  4037ba:	4700      	bx	r0

004037bc <SetPowerLevelLockMode>:
  4037bc:	b538      	push	{r3, r4, r5, lr}
  4037be:	0004      	lsls	r4, r0, #0
  4037c0:	4d14      	ldr	r5, [pc, #80]	(403814 <InitRifModuleVars+0x10>)
  4037c2:	78a8      	ldrb	r0, [r5, #2]
  4037c4:	42a0      	cmp	r0, r4
  4037c6:	d00e      	beq.n	4037e6 <SetPowerLevelLockMode+0x2a>
  4037c8:	2c01      	cmp	r4, #1
  4037ca:	d10b      	bne.n	4037e4 <SetPowerLevelLockMode+0x28>
  4037cc:	2001      	movs	r0, #1
  4037ce:	7829      	ldrb	r1, [r5, #0]
  4037d0:	4088      	lsls	r0, r1
  4037d2:	490b      	ldr	r1, [pc, #44]	(403800 <bGetEnableLock+0xc>)
  4037d4:	4208      	tst	r0, r1
  4037d6:	d101      	bne.n	4037dc <SetPowerLevelLockMode+0x20>
  4037d8:	20ff      	movs	r0, #255
  4037da:	e005      	b.n	4037e8 <SetPowerLevelLockMode+0x2c>
  4037dc:	f7ff fac8 	bl	402d70 <GetCurrentChann>
  4037e0:	280f      	cmp	r0, #15
  4037e2:	d2f9      	bcs.n	4037d8 <SetPowerLevelLockMode+0x1c>
  4037e4:	70ac      	strb	r4, [r5, #2]
  4037e6:	2000      	movs	r0, #0
  4037e8:	b001      	add	sp, #4
  4037ea:	9902      	ldr	r1, [sp, #8]
  4037ec:	bc30      	pop	{r4, r5}
  4037ee:	b001      	add	sp, #4
  4037f0:	4708      	bx	r1
	...

004037f4 <bGetEnableLock>:
  4037f4:	4801      	ldr	r0, [pc, #4]	(4037fc <bGetEnableLock+0x8>)
  4037f6:	7800      	ldrb	r0, [r0, #0]
  4037f8:	4770      	bx	lr
  4037fa:	46c0      	nop			(mov r8, r8)
  4037fc:	004050b9 	.word	0x004050b9
  403800:	000010ff 	.word	0x000010ff

00403804 <InitRifModuleVars>:
  403804:	4803      	ldr	r0, [pc, #12]	(403814 <InitRifModuleVars+0x10>)
  403806:	2100      	movs	r1, #0
  403808:	7041      	strb	r1, [r0, #1]
  40380a:	7081      	strb	r1, [r0, #2]
  40380c:	210c      	movs	r1, #12
  40380e:	7001      	strb	r1, [r0, #0]
  403810:	4770      	bx	lr
  403812:	0000      	lsls	r0, r0, #0
  403814:	004050b7 	.word	0x004050b7

00403818 <MCPSDataRequest>:
  403818:	b580      	push	{r7, lr}
  40381a:	2100      	movs	r1, #0
  40381c:	7001      	strb	r1, [r0, #0]
  40381e:	6841      	ldr	r1, [r0, #4]
  403820:	227e      	movs	r2, #126
  403822:	700a      	strb	r2, [r1, #0]
  403824:	6841      	ldr	r1, [r0, #4]
  403826:	22ff      	movs	r2, #255
  403828:	704a      	strb	r2, [r1, #1]
  40382a:	2100      	movs	r1, #0
  40382c:	f7fe fcda 	bl	4021e4 <handle_new_message>
  403830:	bc0a      	pop	{r1, r3}
  403832:	4718      	bx	r3

00403834 <MLMESetChannelRequest>:
  403834:	b580      	push	{r7, lr}
  403836:	2810      	cmp	r0, #16
  403838:	d301      	bcc.n	40383e <??MLMESetChannelRequest_0>
  40383a:	2001      	movs	r0, #1
  40383c:	e009      	b.n	403852 <??MLMESetChannelRequest_1>

0040383e <??MLMESetChannelRequest_0>:
  40383e:	0081      	lsls	r1, r0, #2
  403840:	4a05      	ldr	r2, [pc, #20]	(403858 <??DataTable2>)
  403842:	5852      	ldr	r2, [r2, r1]
  403844:	4905      	ldr	r1, [pc, #20]	(40385c <??DataTable3>)
  403846:	5c09      	ldrb	r1, [r1, r0]
  403848:	f7ff fa22 	bl	402c90 <SetChannel>
  40384c:	2800      	cmp	r0, #0
  40384e:	d000      	beq.n	403852 <??MLMESetChannelRequest_1>
  403850:	2003      	movs	r0, #3

00403852 <??MLMESetChannelRequest_1>:
  403852:	bc0a      	pop	{r1, r3}
  403854:	4718      	bx	r3
	...

00403858 <??DataTable2>:
  403858:	3aa8 0040                                   .:@.

0040385c <??DataTable3>:
  40385c:	3a98 0040                                   .:@.

00403860 <MLMERXEnableRequest>:
  403860:	b580      	push	{r7, lr}
  403862:	7802      	ldrb	r2, [r0, #0]
  403864:	23f8      	movs	r3, #248
  403866:	4013      	ands	r3, r2
  403868:	2201      	movs	r2, #1
  40386a:	431a      	orrs	r2, r3
  40386c:	7002      	strb	r2, [r0, #0]
  40386e:	f7fe fcb9 	bl	4021e4 <handle_new_message>
  403872:	bc0a      	pop	{r1, r3}
  403874:	4718      	bx	r3

00403876 <MLMEEnergyDetect>:
  403876:	b580      	push	{r7, lr}
  403878:	6842      	ldr	r2, [r0, #4]
  40387a:	2a00      	cmp	r2, #0
  40387c:	d101      	bne.n	403882 <??MLMEEnergyDetect_0>
  40387e:	2001      	movs	r0, #1
  403880:	e009      	b.n	403896 <??MLMEEnergyDetect_1>

00403882 <??MLMEEnergyDetect_0>:
  403882:	7802      	ldrb	r2, [r0, #0]
  403884:	23f8      	movs	r3, #248
  403886:	4013      	ands	r3, r2
  403888:	2202      	movs	r2, #2
  40388a:	431a      	orrs	r2, r3
  40388c:	7002      	strb	r2, [r0, #0]
  40388e:	7201      	strb	r1, [r0, #8]
  403890:	2100      	movs	r1, #0
  403892:	f7fe fca7 	bl	4021e4 <handle_new_message>

00403896 <??MLMEEnergyDetect_1>:
  403896:	bc0a      	pop	{r1, r3}
  403898:	4718      	bx	r3

0040389a <MLMEPAOutputAdjust>:
  40389a:	b580      	push	{r7, lr}
  40389c:	2813      	cmp	r0, #19
  40389e:	d301      	bcc.n	4038a4 <??MLMEPAOutputAdjust_0>
  4038a0:	2001      	movs	r0, #1
  4038a2:	e004      	b.n	4038ae <??MLMEPAOutputAdjust_1>

004038a4 <??MLMEPAOutputAdjust_0>:
  4038a4:	f7ff ff4c 	bl	403740 <SetPower>
  4038a8:	2800      	cmp	r0, #0
  4038aa:	d000      	beq.n	4038ae <??MLMEPAOutputAdjust_1>
  4038ac:	2003      	movs	r0, #3

004038ae <??MLMEPAOutputAdjust_1>:
  4038ae:	bc0a      	pop	{r1, r3}
  4038b0:	4718      	bx	r3
	...

004038b4 <?Veneer (3) for CRM_WuCntl>:
  4038b4:	b408      	push	{r3}
  4038b6:	4b02      	ldr	r3, [pc, #8]	(4038c0 <?Veneer (3) for CRM_WuCntl+0xc>)
  4038b8:	469c      	mov	ip, r3
  4038ba:	bc08      	pop	{r3}
  4038bc:	4760      	bx	ip
  4038be:	46c0      	nop			(mov r8, r8)
  4038c0:	000036d9 	.word	0x000036d9

004038c4 <MLMESetWakeupSource>:
  4038c4:	b5f0      	push	{r4, r5, r6, r7, lr}
  4038c6:	b083      	sub	sp, #12
  4038c8:	000f      	lsls	r7, r1, #0
  4038ca:	0014      	lsls	r4, r2, #0
  4038cc:	25f3      	movs	r5, #243
  4038ce:	4005      	ands	r5, r0
  4038d0:	2603      	movs	r6, #3
  4038d2:	2003      	movs	r0, #3
  4038d4:	07e9      	lsls	r1, r5, #31
  4038d6:	d509      	bpl.n	4038ec <??MLMESetWakeupSource_0>
  4038d8:	4668      	mov	r0, sp
  4038da:	2101      	movs	r1, #1
  4038dc:	7001      	strb	r1, [r0, #0]
  4038de:	9801      	ldr	r0, [sp, #4]
  4038e0:	4330      	orrs	r0, r6
  4038e2:	9001      	str	r0, [sp, #4]
  4038e4:	4668      	mov	r0, sp
  4038e6:	f7ff ffe5 	bl	4038b4 <?Veneer (3) for CRM_WuCntl>
  4038ea:	2000      	movs	r0, #0

004038ec <??MLMESetWakeupSource_0>:
  4038ec:	2102      	movs	r1, #2
  4038ee:	420d      	tst	r5, r1
  4038f0:	d008      	beq.n	403904 <??MLMESetWakeupSource_1>
  4038f2:	4668      	mov	r0, sp
  4038f4:	7001      	strb	r1, [r0, #0]
  4038f6:	9801      	ldr	r0, [sp, #4]
  4038f8:	4306      	orrs	r6, r0
  4038fa:	9601      	str	r6, [sp, #4]
  4038fc:	4668      	mov	r0, sp
  4038fe:	f7ff ffd9 	bl	4038b4 <?Veneer (3) for CRM_WuCntl>
  403902:	2000      	movs	r0, #0

00403904 <??MLMESetWakeupSource_1>:
  403904:	21f0      	movs	r1, #240
  403906:	22f0      	movs	r2, #240
  403908:	402a      	ands	r2, r5
  40390a:	d019      	beq.n	403940 <??MLMESetWakeupSource_2>
  40390c:	2600      	movs	r6, #0
  40390e:	4668      	mov	r0, sp
  403910:	7006      	strb	r6, [r0, #0]
  403912:	0910      	lsrs	r0, r2, #4
  403914:	9a01      	ldr	r2, [sp, #4]
  403916:	230f      	movs	r3, #15
  403918:	439a      	bics	r2, r3
  40391a:	4302      	orrs	r2, r0
  40391c:	4b0a      	ldr	r3, [pc, #40]	(403948 <??MLMESetWakeupSource_3>)
  40391e:	4013      	ands	r3, r2
  403920:	0300      	lsls	r0, r0, #12
  403922:	4318      	orrs	r0, r3
  403924:	4a09      	ldr	r2, [pc, #36]	(40394c <??MLMESetWakeupSource_3+0x4>)
  403926:	4002      	ands	r2, r0
  403928:	0238      	lsls	r0, r7, #8
  40392a:	010b      	lsls	r3, r1, #4
  40392c:	4003      	ands	r3, r0
  40392e:	4313      	orrs	r3, r2
  403930:	0120      	lsls	r0, r4, #4
  403932:	4001      	ands	r1, r0
  403934:	4319      	orrs	r1, r3
  403936:	9101      	str	r1, [sp, #4]
  403938:	4668      	mov	r0, sp
  40393a:	f7ff ffbb 	bl	4038b4 <?Veneer (3) for CRM_WuCntl>
  40393e:	2000      	movs	r0, #0

00403940 <??MLMESetWakeupSource_2>:
  403940:	b003      	add	sp, #12
  403942:	bcf0      	pop	{r4, r5, r6, r7}
  403944:	bc08      	pop	{r3}
  403946:	4718      	bx	r3

00403948 <??MLMESetWakeupSource_3>:
  403948:	0fff ffff f00f ffff                         ........

00403950 <?<Constant " WEATHER STATION">>:
  403950:	5720 4145 4854 5245 5320 4154 4954 4e4f      WEATHER STATION
  403960:	0000 0000                                   ....

00403964 <?<Constant " Wind Direction ">>:
  403964:	5720 6e69 2064 6944 6572 7463 6f69 206e      Wind Direction 
  403974:	0000 0000                                   ....

00403978 <?<Constant "    Wind Speed    ">>:
  403978:	2020 2020 6957 646e 5320 6570 6465 2020         Wind Speed  
  403988:	2020 0000                                     ..

0040398c <?<Constant "    ">>:
  40398c:	2020 2020 0000 0000                             ....

00403994 <?<Constant "    Pressure   ">>:
  403994:	2020 2020 7250 7365 7573 6572 2020 0020         Pressure   .

004039a4 <?<Constant "   Temperature    ">>:
  4039a4:	2020 5420 6d65 6570 6172 7574 6572 2020        Temperature  
  4039b4:	2020 0000                                     ..

004039b8 <?<Constant " Battery Voltage">>:
  4039b8:	4220 7461 6574 7972 5620 6c6f 6174 6567      Battery Voltage
  4039c8:	0000 0000                                   ....

004039cc <?<Constant "     ">>:
  4039cc:	2020 2020 0020 0000                              ...

004039d4 <InitExecuteEntry>:
  4039d4:	b510      	push	{r4, lr}
  4039d6:	2400      	movs	r4, #0
  4039d8:	6801      	ldr	r1, [r0, #0]
  4039da:	1d00      	adds	r0, r0, #4
  4039dc:	4a14      	ldr	r2, [pc, #80]	(403a30 <InitExecuteEntry+0x5c>)
  4039de:	4291      	cmp	r1, r2
  4039e0:	d30a      	bcc.n	4039f8 <InitExecuteEntry+0x24>
  4039e2:	4a14      	ldr	r2, [pc, #80]	(403a34 <InitExecuteEntry+0x60>)
  4039e4:	7812      	ldrb	r2, [r2, #0]
  4039e6:	2a00      	cmp	r2, #0
  4039e8:	d002      	beq.n	4039f0 <InitExecuteEntry+0x1c>
  4039ea:	4a13      	ldr	r2, [pc, #76]	(403a38 <InitExecuteEntry+0x64>)
  4039ec:	4291      	cmp	r1, r2
  4039ee:	d001      	beq.n	4039f4 <InitExecuteEntry+0x20>
  4039f0:	6800      	ldr	r0, [r0, #0]
  4039f2:	6008      	str	r0, [r1, #0]
  4039f4:	2402      	movs	r4, #2
  4039f6:	e014      	b.n	403a22 <InitExecuteEntry+0x4e>
  4039f8:	2910      	cmp	r1, #16
  4039fa:	d212      	bcs.n	403a22 <InitExecuteEntry+0x4e>
  4039fc:	2900      	cmp	r1, #0
  4039fe:	d104      	bne.n	403a0a <InitExecuteEntry+0x36>
  403a00:	6800      	ldr	r0, [r0, #0]
  403a02:	0880      	lsrs	r0, r0, #2
  403a04:	f000 f996 	bl	403d34 <Init_Delay>
  403a08:	e7f4      	b.n	4039f4 <InitExecuteEntry+0x20>
  403a0a:	2901      	cmp	r1, #1
  403a0c:	d109      	bne.n	403a22 <InitExecuteEntry+0x4e>
  403a0e:	6802      	ldr	r2, [r0, #0]
  403a10:	6841      	ldr	r1, [r0, #4]
  403a12:	3008      	adds	r0, #8
  403a14:	680b      	ldr	r3, [r1, #0]
  403a16:	4393      	bics	r3, r2
  403a18:	6800      	ldr	r0, [r0, #0]
  403a1a:	4002      	ands	r2, r0
  403a1c:	431a      	orrs	r2, r3
  403a1e:	600a      	str	r2, [r1, #0]
  403a20:	2404      	movs	r4, #4
  403a22:	0020      	lsls	r0, r4, #0
  403a24:	f000 f96e 	bl	403d04 <PATCH_Ret_InitExecuteEntry>
  403a28:	0020      	lsls	r0, r4, #0
  403a2a:	bc10      	pop	{r4}
  403a2c:	bc02      	pop	{r1}
  403a2e:	4708      	bx	r1
  403a30:	00140001 	.word	0x00140001
  403a34:	004050be 	.word	0x004050be
  403a38:	80003048 	.word	0x80003048

00403a3c <?<Constant "     N ">>:
  403a3c:	20202020 00204e20                            N .

00403a44 <?<Constant "     N  ">>:
  403a44:	20202020 20204e20 00000000                   N  ....

00403a50 <?<Constant "    NE  ">>:
  403a50:	20202020 2020454e 00000000                  NE  ....

00403a5c <?<Constant "     E ">>:
  403a5c:	20202020 00204520                            E .

00403a64 <?<Constant "     E  ">>:
  403a64:	20202020 20204520 00000000                   E  ....

00403a70 <?<Constant "    SE ">>:
  403a70:	20202020 00204553                           SE .

00403a78 <?<Constant "     S ">>:
  403a78:	20202020 00205320                            S .

00403a80 <?<Constant "    SW ">>:
  403a80:	20202020 00205753                           SW .

00403a88 <?<Constant "     W ">>:
  403a88:	20202020 00205720                            W .

00403a90 <?<Constant "    NW ">>:
  403a90:	20202020 0020574e                           NW .

00403a98 <gaRFSynVCODivI_c>:
  403a98:	2f2f2f2f 2f2f2f2f 3030302f 30303030     /////////0000000

00403aa8 <gaRFSynVCODivF_c>:
  403aa8:	00355555 006aaaaa 00a00000 00d55555     UU5...j.....UU..
  403ab8:	010aaaaa 01400000 01755555 01aaaaaa     ......@.UUu.....
  403ac8:	01e00000 00155555 004aaaaa 00800000     ....UU....J.....
  403ad8:	00b55555 00eaaaaa 01200000 01555555     UU........ .UUU.

00403ae8 <__aeabi_memset4>:
  403ae8:	e1b02c02 	lsls	r2, r2, #24
  403aec:	e1822422 	orr	r2, r2, r2, lsr #8
  403af0:	e1822822 	orr	r2, r2, r2, lsr #16

00403af4 <__iar_Memset4_word>:
  403af4:	e92d4004 	push	{r2, lr}
  403af8:	e1a03002 	mov	r3, r2
  403afc:	e1a0e002 	mov	lr, r2
  403b00:	e1a0c002 	mov	ip, r2
  403b04:	e2511010 	subs	r1, r1, #16	; 0x10
  403b08:	28a0500c 	stmiacs	r0!, {r2, r3, ip, lr}
  403b0c:	8afffffc 	bhi	403b04 <__iar_Memset4_word+0x10>
  403b10:	e1b0ce81 	lsls	ip, r1, #29
  403b14:	28a0000c 	stmiacs	r0!, {r2, r3}
  403b18:	44802004 	strmi	r2, [r0], #4
  403b1c:	e1b01f81 	lsls	r1, r1, #31
  403b20:	20c020b2 	strhcs	r2, [r0], #2
  403b24:	44c02001 	strbmi	r2, [r0], #1
  403b28:	e8bd4004 	pop	{r2, lr}
  403b2c:	e12fff1e 	bx	lr

00403b30 <KbGpioInit>:
  403b30:	b538      	push	{r3, r4, r5, lr}
  403b32:	24f1      	movs	r4, #241
  403b34:	05a4      	lsls	r4, r4, #22
  403b36:	0022      	lsls	r2, r4, #0
  403b38:	2100      	movs	r1, #0
  403b3a:	2000      	movs	r0, #0
  403b3c:	f404 fc1e 	bl	837c <Gpio_SetPortDir>
  403b40:	2500      	movs	r5, #0
  403b42:	43ed      	mvns	r5, r5
  403b44:	0023      	lsls	r3, r4, #0
  403b46:	002a      	lsls	r2, r5, #0
  403b48:	2103      	movs	r1, #3
  403b4a:	2000      	movs	r0, #0
  403b4c:	f404 fbc4 	bl	82d8 <Gpio_WrPortSetting>
  403b50:	0023      	lsls	r3, r4, #0
  403b52:	002a      	lsls	r2, r5, #0
  403b54:	2104      	movs	r1, #4
  403b56:	2000      	movs	r0, #0
  403b58:	f404 fbbe 	bl	82d8 <Gpio_WrPortSetting>
  403b5c:	0023      	lsls	r3, r4, #0
  403b5e:	2200      	movs	r2, #0
  403b60:	2102      	movs	r1, #2
  403b62:	2000      	movs	r0, #0
  403b64:	f404 fbb8 	bl	82d8 <Gpio_WrPortSetting>
  403b68:	0022      	lsls	r2, r4, #0
  403b6a:	2100      	movs	r1, #0
  403b6c:	2000      	movs	r0, #0
  403b6e:	f404 fdb9 	bl	86e4 <Gpio_SetPortFunction>
  403b72:	bc31      	pop	{r0, r4, r5}
  403b74:	bc08      	pop	{r3}
  403b76:	4718      	bx	r3

00403b78 <PlatformPortInit>:
  403b78:	2080      	movs	r0, #128
  403b7a:	0600      	lsls	r0, r0, #24
  403b7c:	21f0      	movs	r1, #240
  403b7e:	0489      	lsls	r1, r1, #18
  403b80:	6081      	str	r1, [r0, #8]
  403b82:	2200      	movs	r2, #0
  403b84:	60c2      	str	r2, [r0, #12]
  403b86:	6001      	str	r1, [r0, #0]
  403b88:	6042      	str	r2, [r0, #4]
  403b8a:	2100      	movs	r1, #0
  403b8c:	43c9      	mvns	r1, r1
  403b8e:	6101      	str	r1, [r0, #16]
  403b90:	6141      	str	r1, [r0, #20]
  403b92:	6182      	str	r2, [r0, #24]
  403b94:	61c2      	str	r2, [r0, #28]
  403b96:	6202      	str	r2, [r0, #32]
  403b98:	6242      	str	r2, [r0, #36]
  403b9a:	6282      	str	r2, [r0, #40]
  403b9c:	62c2      	str	r2, [r0, #44]
  403b9e:	21c0      	movs	r1, #192
  403ba0:	0189      	lsls	r1, r1, #6
  403ba2:	6301      	str	r1, [r0, #48]
  403ba4:	4904      	ldr	r1, [pc, #16]	(403bb8 <??PlatformPortInit_0>)
  403ba6:	6341      	str	r1, [r0, #52]
  403ba8:	6382      	str	r2, [r0, #56]
  403baa:	63c2      	str	r2, [r0, #60]
  403bac:	21c0      	movs	r1, #192
  403bae:	0609      	lsls	r1, r1, #24
  403bb0:	6401      	str	r1, [r0, #64]
  403bb2:	21df      	movs	r1, #223
  403bb4:	6441      	str	r1, [r0, #68]
  403bb6:	4770      	bx	lr

00403bb8 <??PlatformPortInit_0>:
  403bb8:	c000 8001                                   ....

00403bbc <DelayMs>:
  403bbc:	b081      	sub	sp, #4
  403bbe:	2800      	cmp	r0, #0
  403bc0:	d009      	beq.n	403bd6 <??DelayMs_0>
  403bc2:	4906      	ldr	r1, [pc, #24]	(403bdc <??DelayMs_1>)

00403bc4 <??DelayMs_2>:
  403bc4:	1e40      	subs	r0, r0, #1
  403bc6:	9100      	str	r1, [sp, #0]

00403bc8 <??DelayMs_3>:
  403bc8:	9a00      	ldr	r2, [sp, #0]
  403bca:	1e53      	subs	r3, r2, #1
  403bcc:	9300      	str	r3, [sp, #0]
  403bce:	2a00      	cmp	r2, #0
  403bd0:	d1fa      	bne.n	403bc8 <??DelayMs_3>
  403bd2:	2800      	cmp	r0, #0
  403bd4:	d1f6      	bne.n	403bc4 <??DelayMs_2>

00403bd6 <??DelayMs_0>:
  403bd6:	b001      	add	sp, #4
  403bd8:	4770      	bx	lr
  403bda:	46c0      	nop			(mov r8, r8)

00403bdc <??DelayMs_1>:
  403bdc:	0d64 0000                                   d...

00403be0 <DelayUs>:
  403be0:	b081      	sub	sp, #4
  403be2:	2800      	cmp	r0, #0
  403be4:	d009      	beq.n	403bfa <??DelayUs_0>
  403be6:	2103      	movs	r1, #3

00403be8 <??DelayUs_1>:
  403be8:	1e40      	subs	r0, r0, #1
  403bea:	9100      	str	r1, [sp, #0]

00403bec <??DelayUs_2>:
  403bec:	9a00      	ldr	r2, [sp, #0]
  403bee:	1e53      	subs	r3, r2, #1
  403bf0:	9300      	str	r3, [sp, #0]
  403bf2:	2a00      	cmp	r2, #0
  403bf4:	d1fa      	bne.n	403bec <??DelayUs_2>
  403bf6:	2800      	cmp	r0, #0
  403bf8:	d1f6      	bne.n	403be8 <??DelayUs_1>

00403bfa <??DelayUs_0>:
  403bfa:	b001      	add	sp, #4
  403bfc:	4770      	bx	lr
	...

00403c00 <?<Constant {0}>>:
	...

00403c14 <gaHexValue>:
  403c14:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF
  403c24:	0000 0000                                   ....

00403c28 <?<Constant "Format unknow">>:
  403c28:	6f46 6d72 7461 7520 6b6e 6f6e 0077 0000     Format unknow...

00403c38 <__iar_data_init2>:
  403c38:	e59f0028 	ldr	r0, [pc, #40]	; 403c68 <__iar_data_init2+0x30>
  403c3c:	e92d4010 	push	{r4, lr}
  403c40:	e59f4024 	ldr	r4, [pc, #36]	; 403c6c <__iar_data_init2+0x34>
  403c44:	e1500004 	cmp	r0, r4
  403c48:	0a000004 	beq	403c60 <__iar_data_init2+0x28>
  403c4c:	e4901004 	ldr	r1, [r0], #4
  403c50:	e1a0e00f 	mov	lr, pc
  403c54:	e12fff11 	bx	r1
  403c58:	e1500004 	cmp	r0, r4
  403c5c:	1afffffa 	bne	403c4c <__iar_data_init2+0x14>
  403c60:	e8bd4010 	pop	{r4, lr}
  403c64:	e12fff1e 	bx	lr
  403c68:	00403cbc 	.word	0x00403cbc
  403c6c:	00403ce8 	.word	0x00403ce8

00403c70 <__iar_zero_init2>:
  403c70:	e3a01000 	mov	r1, #0	; 0x0
  403c74:	ea000003 	b	403c88 <__iar_zero_init2+0x18>
  403c78:	e4902004 	ldr	r2, [r0], #4
  403c7c:	e2533004 	subs	r3, r3, #4	; 0x4
  403c80:	e4821004 	str	r1, [r2], #4
  403c84:	1afffffc 	bne	403c7c <__iar_zero_init2+0xc>
  403c88:	e4903004 	ldr	r3, [r0], #4
  403c8c:	e3530000 	cmp	r3, #0	; 0x0
  403c90:	1afffff8 	bne	403c78 <__iar_zero_init2+0x8>
  403c94:	e12fff1e 	bx	lr

00403c98 <ResetMaca>:
  403c98:	4805      	ldr	r0, [pc, #20]	(403cb0 <??ResetMaca_0>)
  403c9a:	2100      	movs	r1, #0
  403c9c:	6001      	str	r1, [r0, #0]
  403c9e:	210f      	movs	r1, #15

00403ca0 <??ResetMaca_1>:
  403ca0:	6842      	ldr	r2, [r0, #4]
  403ca2:	400a      	ands	r2, r1
  403ca4:	2a0e      	cmp	r2, #14
  403ca6:	d0fb      	beq.n	403ca0 <??ResetMaca_1>
  403ca8:	4802      	ldr	r0, [pc, #8]	(403cb4 <??ResetMaca_0+0x4>)
  403caa:	4903      	ldr	r1, [pc, #12]	(403cb8 <??ResetMaca_0+0x8>)
  403cac:	6001      	str	r1, [r0, #0]
  403cae:	4770      	bx	lr

00403cb0 <??ResetMaca_0>:
  403cb0:	400c 8000 40c4 8000 ffff 0000               .@...@......

00403cbc <Region$$Table$$Base>:
  403cbc:	00403c70 	.word	0x00403c70
  403cc0:	00000070 	.word	0x00000070
  403cc4:	00405050 	.word	0x00405050
  403cc8:	00000000 	.word	0x00000000
  403ccc:	00403334 	.word	0x00403334
  403cd0:	00000001 	.word	0x00000001
  403cd4:	00000001 	.word	0x00000001
  403cd8:	004052b1 	.word	0x004052b1
  403cdc:	00000097 	.word	0x00000097
  403ce0:	004050c0 	.word	0x004050c0
  403ce4:	000001f1 	.word	0x000001f1

00403ce8 <Region$$Table$$Limit>:
  403ce8:	000113ac 	.word	0x000113ac
  403cec:	00011028 	.word	0x00011028
  403cf0:	00000001 	.word	0x00000001
  403cf4:	0001146c 	.word	0x0001146c
  403cf8:	00010b74 	.word	0x00010b74
  403cfc:	00000002 	.word	0x00000002

00403d00 <RP_Vector_Init>:
  403d00:	4770      	bx	lr
	...

00403d04 <PATCH_Ret_InitExecuteEntry>:
  403d04:	9901      	ldr	r1, [sp, #4]
  403d06:	0289      	lsls	r1, r1, #10
  403d08:	d204      	bcs.n	403d14 <PATCH_Ret_InitExecuteEntry+0x10>
  403d0a:	b002      	add	sp, #8
  403d0c:	bc80      	pop	{r7}
  403d0e:	bc10      	pop	{r4}
  403d10:	bc02      	pop	{r1}
  403d12:	4708      	bx	r1
  403d14:	4770      	bx	lr
	...

00403d18 <cbProcessMsg_c>:
  403d18:	22b1 0040 2409 0040 25f5 0040 27ad 0040     ."@..$@..%@..'@.

00403d28 <?<Constant {102, 114, 101, 101, 115, 99, 97, 1>:
  403d28:	7266 6565 6373 6c61 0065 0000               freescale...

00403d34 <Init_Delay>:
  403d34:	2800      	cmp	r0, #0
  403d36:	d001      	beq.n	403d3c <Init_Delay+0x8>
  403d38:	1e40      	subs	r0, r0, #1
  403d3a:	d1fd      	bne.n	403d38 <Init_Delay+0x4>
  403d3c:	4770      	bx	lr
	...

00403d40 <?Veneer (4) for __aeabi_memclr4>:
  403d40:	4778      	bx	pc
  403d42:	46c0      	nop			(mov r8, r8)

00403d44 <__aeabi_memclr4>:
  403d44:	e3b02000 	movs	r2, #0	; 0x0
  403d48:	eaffff69 	b	403af4 <__iar_Memset4_word>

00403d4c <__iar_via_R0>:
  403d4c:	4700      	bx	r0

00403d4e <__iar_via_R1>:
  403d4e:	4708      	bx	r1

Disassembly of section P2 b0:

004052b1 <P2 b0>:
  4052b1:	fd          	.byte	0xfd
  4052b2:	0000      	.short	0x0000
  4052b4:	b20081ff 	.word	0xb20081ff
  4052b8:	00901200 	.word	0x00901200
  4052bc:	05030080 	.word	0x05030080
  4052c0:	00900480 	.word	0x00900480
  4052c4:	00010180 	.word	0x00010180
  4052c8:	00900800 	.word	0x00900800
  4052cc:	0300fc80 	.word	0x0300fc80
  4052d0:	8000900c 	.word	0x8000900c
  4052d4:	200400fc 	.word	0x200400fc
  4052d8:	0c800090 	.word	0x0c800090
  4052dc:	900b00fc 	.word	0x900b00fc
  4052e0:	03008000 	.word	0x03008000
  4052e4:	9400c005 	.word	0x9400c005
  4052e8:	fd178000 	.word	0xfd178000
  4052ec:	a0500300 	.word	0xa0500300
  4052f0:	00fc8000 	.word	0x00fc8000
  4052f4:	00a05403 	.word	0x00a05403
  4052f8:	0500fc80 	.word	0x0500fc80
  4052fc:	80003048 	.word	0x80003048
  405300:	00fa0f04 	.word	0x00fa0f04
  405304:	0030480e 	.word	0x0030480e
  405308:	000f7c80 	.word	0x000f7c80
  40530c:	00304c00 	.word	0x00304c00
  405310:	60770780 	.word	0x60770780
  405314:	c01000fb 	.word	0xc01000fb
  405318:	5000005d 	.word	0x5000005d
  40531c:	7b8000a0 	.word	0x7b8000a0
  405320:	54000004 	.word	0x54000004
  405324:	7b8000a0 	.word	0x7b8000a0
  405328:	0f0000f8 	.word	0x0f0000f8
  40532c:	1e0000b9 	.word	0x1e0000b9
  405330:	081400be 	.word	0x081400be
  405334:	02100001 	.word	0x02100001
  405338:	00031800 	.word	0x00031800
  40533c:	28000420 	.word	0x28000420
  405340:	06300005 	.word	0x06300005
  405344:	01073800 	.word	0x01073800
