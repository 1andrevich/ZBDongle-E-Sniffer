
Output/Sniffer_802.15.4_SMLIGHT_SLZB_07/Sniffer_802.15.4_SMLIGHT_SLZB_07.elf:     file format elf32-littlearm


Disassembly of section .text:

00004000 <__Vectors>:
    4000:	00 00 01 20 f1 65 00 00 ed 65 00 00 ed 65 00 00     ... .e...e...e..
    4010:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4020:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4030:	ed 65 00 00 50 be 00 00 ed 65 00 00 ed 65 00 00     .e..P....e...e..
    4040:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4050:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4060:	ed 65 00 00 ed 65 00 00 ed 65 00 00 19 6a 00 00     .e...e...e...j..
    4070:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4080:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4090:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    40a0:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    40b0:	ed 65 00 00 ed 65 00 00 ed 65 00 00 61 b5 00 00     .e...e...e..a...
    40c0:	05 b5 00 00 01 b5 00 00 b9 ad 00 00 5d b5 00 00     ............]...
    40d0:	09 b5 00 00 21 b5 00 00 0d b5 00 00 99 9d 00 00     ....!...........
    40e0:	a1 b5 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .....e...e...e..
    40f0:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4100:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4110:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4120:	ed 65 00 00 ed 65 00 00 ed 65 00 00 ed 65 00 00     .e...e...e...e..
    4130:	ed 65 00 00                                         .e..

00004134 <main>:
    4134:	b508      	push	{r3, lr}
    4136:	f002 fc87 	bl	6a48 <BSP_Init>
    413a:	f001 fb09 	bl	5750 <crcInit>
    413e:	f002 fb5b 	bl	67f8 <HAL_Radio_InitPromiscuousMode>
    4142:	f000 f808 	bl	4156 <PHY_Task>
    4146:	f000 fd61 	bl	4c0c <Console_Process_Rx>
    414a:	e7fa      	b.n	4142 <main+0xe>

0000414c <Mac_RxMsgCallbackPreprocessPhyRx>:
    414c:	b508      	push	{r3, lr}
    414e:	f000 fd7b 	bl	4c48 <Console_PhyToJSONV2>
    4152:	2001      	movs	r0, #1
    4154:	bd08      	pop	{r3, pc}

00004156 <PHY_Task>:
    4156:	b500      	push	{lr}
    4158:	b0a3      	sub	sp, #140	; 0x8c
    415a:	a801      	add	r0, sp, #4
    415c:	f002 fb8e 	bl	687c <HAL_Radio_GetRxPacket>
    4160:	b110      	cbz	r0, 4168 <PHY_Task+0x12>
    4162:	b023      	add	sp, #140	; 0x8c
    4164:	f85d fb04 	ldr.w	pc, [sp], #4
    4168:	a801      	add	r0, sp, #4
    416a:	f000 f805 	bl	4178 <MAC_ProcessPhyRx>
    416e:	e7f8      	b.n	4162 <PHY_Task+0xc>

00004170 <Mac_RxMsgCallbackPreprocessMacUnpacked>:
    4170:	2000      	movs	r0, #0
    4172:	4770      	bx	lr

00004174 <Mac_RxMsgCallbackPostprocessMacUnpacked>:
    4174:	2000      	movs	r0, #0
    4176:	4770      	bx	lr

00004178 <MAC_ProcessPhyRx>:
    4178:	b318      	cbz	r0, 41c2 <MAC_ProcessPhyRx+0x4a>
    417a:	b510      	push	{r4, lr}
    417c:	b0ce      	sub	sp, #312	; 0x138
    417e:	4604      	mov	r4, r0
    4180:	f7ff ffe4 	bl	414c <Mac_RxMsgCallbackPreprocessPhyRx>
    4184:	b980      	cbnz	r0, 41a8 <MAC_ProcessPhyRx+0x30>
    4186:	4621      	mov	r1, r4
    4188:	f811 2b01 	ldrb.w	r2, [r1], #1
    418c:	f88d 20b4 	strb.w	r2, [sp, #180]	; 0xb4
    4190:	f012 0f80 	tst.w	r2, #128	; 0x80
    4194:	d10a      	bne.n	41ac <MAC_ProcessPhyRx+0x34>
    4196:	f10d 00b5 	add.w	r0, sp, #181	; 0xb5
    419a:	f007 fcbf 	bl	bb1c <memcpy>
    419e:	4669      	mov	r1, sp
    41a0:	a82d      	add	r0, sp, #180	; 0xb4
    41a2:	f000 f80f 	bl	41c4 <MAC_Unpack>
    41a6:	b118      	cbz	r0, 41b0 <MAC_ProcessPhyRx+0x38>
    41a8:	b04e      	add	sp, #312	; 0x138
    41aa:	bd10      	pop	{r4, pc}
    41ac:	2280      	movs	r2, #128	; 0x80
    41ae:	e7f2      	b.n	4196 <MAC_ProcessPhyRx+0x1e>
    41b0:	4668      	mov	r0, sp
    41b2:	f7ff ffdd 	bl	4170 <Mac_RxMsgCallbackPreprocessMacUnpacked>
    41b6:	2800      	cmp	r0, #0
    41b8:	d1f6      	bne.n	41a8 <MAC_ProcessPhyRx+0x30>
    41ba:	4668      	mov	r0, sp
    41bc:	f7ff ffda 	bl	4174 <Mac_RxMsgCallbackPostprocessMacUnpacked>
    41c0:	e7f2      	b.n	41a8 <MAC_ProcessPhyRx+0x30>
    41c2:	4770      	bx	lr

000041c4 <MAC_Unpack>:
    41c4:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    41c8:	2800      	cmp	r0, #0
    41ca:	f000 8167 	beq.w	449c <MAC_Unpack+0x2d8>
    41ce:	460c      	mov	r4, r1
    41d0:	4605      	mov	r5, r0
    41d2:	2900      	cmp	r1, #0
    41d4:	f000 8164 	beq.w	44a0 <MAC_Unpack+0x2dc>
    41d8:	7803      	ldrb	r3, [r0, #0]
    41da:	2b01      	cmp	r3, #1
    41dc:	f240 8162 	bls.w	44a4 <MAC_Unpack+0x2e0>
    41e0:	22b0      	movs	r2, #176	; 0xb0
    41e2:	2100      	movs	r1, #0
    41e4:	4620      	mov	r0, r4
    41e6:	f007 fca6 	bl	bb36 <memset>
    41ea:	786a      	ldrb	r2, [r5, #1]
    41ec:	78ab      	ldrb	r3, [r5, #2]
    41ee:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
    41f2:	4613      	mov	r3, r2
    41f4:	f002 0207 	and.w	r2, r2, #7
    41f8:	7022      	strb	r2, [r4, #0]
    41fa:	f3c3 07c0 	ubfx	r7, r3, #3, #1
    41fe:	7067      	strb	r7, [r4, #1]
    4200:	f3c3 1100 	ubfx	r1, r3, #4, #1
    4204:	70a1      	strb	r1, [r4, #2]
    4206:	f3c3 1140 	ubfx	r1, r3, #5, #1
    420a:	70e1      	strb	r1, [r4, #3]
    420c:	f3c3 1c80 	ubfx	ip, r3, #6, #1
    4210:	f884 c004 	strb.w	ip, [r4, #4]
    4214:	f3c3 2e00 	ubfx	lr, r3, #8, #1
    4218:	f884 e005 	strb.w	lr, [r4, #5]
    421c:	f3c3 2640 	ubfx	r6, r3, #9, #1
    4220:	71a6      	strb	r6, [r4, #6]
    4222:	f3c3 2181 	ubfx	r1, r3, #10, #2
    4226:	71e1      	strb	r1, [r4, #7]
    4228:	0b98      	lsrs	r0, r3, #14
    422a:	7260      	strb	r0, [r4, #9]
    422c:	f3c3 3301 	ubfx	r3, r3, #12, #2
    4230:	7223      	strb	r3, [r4, #8]
    4232:	2b03      	cmp	r3, #3
    4234:	f000 813a 	beq.w	44ac <MAC_Unpack+0x2e8>
    4238:	3a04      	subs	r2, #4
    423a:	2a03      	cmp	r2, #3
    423c:	f240 8138 	bls.w	44b0 <MAC_Unpack+0x2ec>
    4240:	2901      	cmp	r1, #1
    4242:	f000 8137 	beq.w	44b4 <MAC_Unpack+0x2f0>
    4246:	2801      	cmp	r0, #1
    4248:	f000 8136 	beq.w	44b8 <MAC_Unpack+0x2f4>
    424c:	2f00      	cmp	r7, #0
    424e:	f040 8135 	bne.w	44bc <MAC_Unpack+0x2f8>
    4252:	2e00      	cmp	r6, #0
    4254:	f040 8134 	bne.w	44c0 <MAC_Unpack+0x2fc>
    4258:	f1be 0f00 	cmp.w	lr, #0
    425c:	d107      	bne.n	426e <MAC_Unpack+0xaa>
    425e:	782a      	ldrb	r2, [r5, #0]
    4260:	2a02      	cmp	r2, #2
    4262:	f240 812f 	bls.w	44c4 <MAC_Unpack+0x300>
    4266:	78ea      	ldrb	r2, [r5, #3]
    4268:	72a2      	strb	r2, [r4, #10]
    426a:	2703      	movs	r7, #3
    426c:	e000      	b.n	4270 <MAC_Unpack+0xac>
    426e:	2702      	movs	r7, #2
    4270:	2b01      	cmp	r3, #1
    4272:	d967      	bls.n	4344 <MAC_Unpack+0x180>
    4274:	f04f 0800 	mov.w	r8, #0
    4278:	46c6      	mov	lr, r8
    427a:	2b02      	cmp	r3, #2
    427c:	f000 80ab 	beq.w	43d6 <MAC_Unpack+0x212>
    4280:	f1be 0f00 	cmp.w	lr, #0
    4284:	d00f      	beq.n	42a6 <MAC_Unpack+0xe2>
    4286:	1c7b      	adds	r3, r7, #1
    4288:	782a      	ldrb	r2, [r5, #0]
    428a:	4293      	cmp	r3, r2
    428c:	f280 811c 	bge.w	44c8 <MAC_Unpack+0x304>
    4290:	19ea      	adds	r2, r5, r7
    4292:	7852      	ldrb	r2, [r2, #1]
    4294:	81a2      	strh	r2, [r4, #12]
    4296:	3702      	adds	r7, #2
    4298:	b2ff      	uxtb	r7, r7
    429a:	fa55 f383 	uxtab	r3, r5, r3
    429e:	785b      	ldrb	r3, [r3, #1]
    42a0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
    42a4:	81a2      	strh	r2, [r4, #12]
    42a6:	2902      	cmp	r1, #2
    42a8:	f000 8097 	beq.w	43da <MAC_Unpack+0x216>
    42ac:	2903      	cmp	r1, #3
    42ae:	f000 80a4 	beq.w	43fa <MAC_Unpack+0x236>
    42b2:	f1b8 0f00 	cmp.w	r8, #0
    42b6:	d00f      	beq.n	42d8 <MAC_Unpack+0x114>
    42b8:	1c7b      	adds	r3, r7, #1
    42ba:	782a      	ldrb	r2, [r5, #0]
    42bc:	4293      	cmp	r3, r2
    42be:	f280 8109 	bge.w	44d4 <MAC_Unpack+0x310>
    42c2:	19ea      	adds	r2, r5, r7
    42c4:	7852      	ldrb	r2, [r2, #1]
    42c6:	8322      	strh	r2, [r4, #24]
    42c8:	3702      	adds	r7, #2
    42ca:	b2ff      	uxtb	r7, r7
    42cc:	fa55 f383 	uxtab	r3, r5, r3
    42d0:	785b      	ldrb	r3, [r3, #1]
    42d2:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
    42d6:	8322      	strh	r2, [r4, #24]
    42d8:	7a63      	ldrb	r3, [r4, #9]
    42da:	2b02      	cmp	r3, #2
    42dc:	f000 809b 	beq.w	4416 <MAC_Unpack+0x252>
    42e0:	2b03      	cmp	r3, #3
    42e2:	f000 80a8 	beq.w	4436 <MAC_Unpack+0x272>
    42e6:	7a23      	ldrb	r3, [r4, #8]
    42e8:	2b01      	cmp	r3, #1
    42ea:	f240 80b2 	bls.w	4452 <MAC_Unpack+0x28e>
    42ee:	782b      	ldrb	r3, [r5, #0]
    42f0:	4639      	mov	r1, r7
    42f2:	1cba      	adds	r2, r7, #2
    42f4:	4293      	cmp	r3, r2
    42f6:	dd11      	ble.n	431c <MAC_Unpack+0x158>
    42f8:	1bda      	subs	r2, r3, r7
    42fa:	3a02      	subs	r2, #2
    42fc:	b2d2      	uxtb	r2, r2
    42fe:	f884 20a8 	strb.w	r2, [r4, #168]	; 0xa8
    4302:	2a80      	cmp	r2, #128	; 0x80
    4304:	f200 80f0 	bhi.w	44e8 <MAC_Unpack+0x324>
    4308:	4429      	add	r1, r5
    430a:	3101      	adds	r1, #1
    430c:	f104 0028 	add.w	r0, r4, #40	; 0x28
    4310:	f007 fc04 	bl	bb1c <memcpy>
    4314:	f894 30a8 	ldrb.w	r3, [r4, #168]	; 0xa8
    4318:	441f      	add	r7, r3
    431a:	b2ff      	uxtb	r7, r7
    431c:	4628      	mov	r0, r5
    431e:	f810 1b01 	ldrb.w	r1, [r0], #1
    4322:	3902      	subs	r1, #2
    4324:	f001 fa32 	bl	578c <crcFast>
    4328:	1c7a      	adds	r2, r7, #1
    432a:	442f      	add	r7, r5
    432c:	787b      	ldrb	r3, [r7, #1]
    432e:	fa55 f582 	uxtab	r5, r5, r2
    4332:	786a      	ldrb	r2, [r5, #1]
    4334:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
    4338:	4298      	cmp	r0, r3
    433a:	f040 80d7 	bne.w	44ec <MAC_Unpack+0x328>
    433e:	f8a4 30ac 	strh.w	r3, [r4, #172]	; 0xac
    4342:	e0b0      	b.n	44a6 <MAC_Unpack+0x2e2>
    4344:	1e8a      	subs	r2, r1, #2
    4346:	b2d2      	uxtb	r2, r2
    4348:	2a01      	cmp	r2, #1
    434a:	d913      	bls.n	4374 <MAC_Unpack+0x1b0>
    434c:	f04f 0e00 	mov.w	lr, #0
    4350:	1e82      	subs	r2, r0, #2
    4352:	b2d2      	uxtb	r2, r2
    4354:	2a01      	cmp	r2, #1
    4356:	d910      	bls.n	437a <MAC_Unpack+0x1b6>
    4358:	f04f 0800 	mov.w	r8, #0
    435c:	f1be 0f00 	cmp.w	lr, #0
    4360:	d08b      	beq.n	427a <MAC_Unpack+0xb6>
    4362:	f1b8 0f00 	cmp.w	r8, #0
    4366:	d088      	beq.n	427a <MAC_Unpack+0xb6>
    4368:	f1bc 0f00 	cmp.w	ip, #0
    436c:	d085      	beq.n	427a <MAC_Unpack+0xb6>
    436e:	f04f 0800 	mov.w	r8, #0
    4372:	e782      	b.n	427a <MAC_Unpack+0xb6>
    4374:	f04f 0e01 	mov.w	lr, #1
    4378:	e7ea      	b.n	4350 <MAC_Unpack+0x18c>
    437a:	f04f 0801 	mov.w	r8, #1
    437e:	e7ed      	b.n	435c <MAC_Unpack+0x198>
    4380:	3301      	adds	r3, #1
    4382:	b2db      	uxtb	r3, r3
    4384:	2b11      	cmp	r3, #17
    4386:	f63f af7b 	bhi.w	4280 <MAC_Unpack+0xbc>
    438a:	eb03 0283 	add.w	r2, r3, r3, lsl #2
    438e:	f8df a160 	ldr.w	sl, [pc, #352]	; 44f0 <MAC_Unpack+0x32c>
    4392:	f81a 2002 	ldrb.w	r2, [sl, r2]
    4396:	4291      	cmp	r1, r2
    4398:	d1f2      	bne.n	4380 <MAC_Unpack+0x1bc>
    439a:	eb03 0a83 	add.w	sl, r3, r3, lsl #2
    439e:	4a54      	ldr	r2, [pc, #336]	; (44f0 <MAC_Unpack+0x32c>)
    43a0:	4452      	add	r2, sl
    43a2:	7852      	ldrb	r2, [r2, #1]
    43a4:	4290      	cmp	r0, r2
    43a6:	d1eb      	bne.n	4380 <MAC_Unpack+0x1bc>
    43a8:	4a51      	ldr	r2, [pc, #324]	; (44f0 <MAC_Unpack+0x32c>)
    43aa:	4452      	add	r2, sl
    43ac:	7912      	ldrb	r2, [r2, #4]
    43ae:	4594      	cmp	ip, r2
    43b0:	d1e6      	bne.n	4380 <MAC_Unpack+0x1bc>
    43b2:	46d1      	mov	r9, sl
    43b4:	4a4e      	ldr	r2, [pc, #312]	; (44f0 <MAC_Unpack+0x32c>)
    43b6:	4491      	add	r9, r2
    43b8:	f899 e002 	ldrb.w	lr, [r9, #2]
    43bc:	f1be 0e00 	subs.w	lr, lr, #0
    43c0:	bf18      	it	ne
    43c2:	f04f 0e01 	movne.w	lr, #1
    43c6:	f899 8003 	ldrb.w	r8, [r9, #3]
    43ca:	f1b8 0800 	subs.w	r8, r8, #0
    43ce:	bf18      	it	ne
    43d0:	f04f 0801 	movne.w	r8, #1
    43d4:	e7d4      	b.n	4380 <MAC_Unpack+0x1bc>
    43d6:	4633      	mov	r3, r6
    43d8:	e7d4      	b.n	4384 <MAC_Unpack+0x1c0>
    43da:	1c7b      	adds	r3, r7, #1
    43dc:	782a      	ldrb	r2, [r5, #0]
    43de:	4293      	cmp	r3, r2
    43e0:	da74      	bge.n	44cc <MAC_Unpack+0x308>
    43e2:	19ea      	adds	r2, r5, r7
    43e4:	7852      	ldrb	r2, [r2, #1]
    43e6:	8222      	strh	r2, [r4, #16]
    43e8:	3702      	adds	r7, #2
    43ea:	b2ff      	uxtb	r7, r7
    43ec:	fa55 f383 	uxtab	r3, r5, r3
    43f0:	785b      	ldrb	r3, [r3, #1]
    43f2:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
    43f6:	8222      	strh	r2, [r4, #16]
    43f8:	e758      	b.n	42ac <MAC_Unpack+0xe8>
    43fa:	1dfb      	adds	r3, r7, #7
    43fc:	782a      	ldrb	r2, [r5, #0]
    43fe:	4293      	cmp	r3, r2
    4400:	da66      	bge.n	44d0 <MAC_Unpack+0x30c>
    4402:	19e9      	adds	r1, r5, r7
    4404:	2208      	movs	r2, #8
    4406:	3101      	adds	r1, #1
    4408:	f104 0010 	add.w	r0, r4, #16
    440c:	f007 fb86 	bl	bb1c <memcpy>
    4410:	3708      	adds	r7, #8
    4412:	b2ff      	uxtb	r7, r7
    4414:	e74d      	b.n	42b2 <MAC_Unpack+0xee>
    4416:	1c7a      	adds	r2, r7, #1
    4418:	7829      	ldrb	r1, [r5, #0]
    441a:	428a      	cmp	r2, r1
    441c:	da5c      	bge.n	44d8 <MAC_Unpack+0x314>
    441e:	19e9      	adds	r1, r5, r7
    4420:	7849      	ldrb	r1, [r1, #1]
    4422:	8421      	strh	r1, [r4, #32]
    4424:	3702      	adds	r7, #2
    4426:	b2ff      	uxtb	r7, r7
    4428:	fa55 f282 	uxtab	r2, r5, r2
    442c:	7852      	ldrb	r2, [r2, #1]
    442e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
    4432:	8421      	strh	r1, [r4, #32]
    4434:	e754      	b.n	42e0 <MAC_Unpack+0x11c>
    4436:	1dfb      	adds	r3, r7, #7
    4438:	782a      	ldrb	r2, [r5, #0]
    443a:	4293      	cmp	r3, r2
    443c:	da4e      	bge.n	44dc <MAC_Unpack+0x318>
    443e:	19e9      	adds	r1, r5, r7
    4440:	2208      	movs	r2, #8
    4442:	3101      	adds	r1, #1
    4444:	f104 0020 	add.w	r0, r4, #32
    4448:	f007 fb68 	bl	bb1c <memcpy>
    444c:	3708      	adds	r7, #8
    444e:	b2ff      	uxtb	r7, r7
    4450:	e749      	b.n	42e6 <MAC_Unpack+0x122>
    4452:	79e3      	ldrb	r3, [r4, #7]
    4454:	b923      	cbnz	r3, 4460 <MAC_Unpack+0x29c>
    4456:	7823      	ldrb	r3, [r4, #0]
    4458:	2b01      	cmp	r3, #1
    445a:	d015      	beq.n	4488 <MAC_Unpack+0x2c4>
    445c:	2b03      	cmp	r3, #3
    445e:	d013      	beq.n	4488 <MAC_Unpack+0x2c4>
    4460:	7a63      	ldrb	r3, [r4, #9]
    4462:	2b00      	cmp	r3, #0
    4464:	f47f af43 	bne.w	42ee <MAC_Unpack+0x12a>
    4468:	7823      	ldrb	r3, [r4, #0]
    446a:	2b01      	cmp	r3, #1
    446c:	d002      	beq.n	4474 <MAC_Unpack+0x2b0>
    446e:	2b03      	cmp	r3, #3
    4470:	f47f af3d 	bne.w	42ee <MAC_Unpack+0x12a>
    4474:	79e3      	ldrb	r3, [r4, #7]
    4476:	b3ab      	cbz	r3, 44e4 <MAC_Unpack+0x320>
    4478:	2202      	movs	r2, #2
    447a:	f104 010c 	add.w	r1, r4, #12
    447e:	f104 0018 	add.w	r0, r4, #24
    4482:	f007 fb4b 	bl	bb1c <memcpy>
    4486:	e732      	b.n	42ee <MAC_Unpack+0x12a>
    4488:	7a63      	ldrb	r3, [r4, #9]
    448a:	b34b      	cbz	r3, 44e0 <MAC_Unpack+0x31c>
    448c:	2202      	movs	r2, #2
    448e:	f104 0118 	add.w	r1, r4, #24
    4492:	f104 000c 	add.w	r0, r4, #12
    4496:	f007 fb41 	bl	bb1c <memcpy>
    449a:	e7e1      	b.n	4460 <MAC_Unpack+0x29c>
    449c:	2601      	movs	r6, #1
    449e:	e002      	b.n	44a6 <MAC_Unpack+0x2e2>
    44a0:	2601      	movs	r6, #1
    44a2:	e000      	b.n	44a6 <MAC_Unpack+0x2e2>
    44a4:	2602      	movs	r6, #2
    44a6:	4630      	mov	r0, r6
    44a8:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    44ac:	2605      	movs	r6, #5
    44ae:	e7fa      	b.n	44a6 <MAC_Unpack+0x2e2>
    44b0:	2606      	movs	r6, #6
    44b2:	e7f8      	b.n	44a6 <MAC_Unpack+0x2e2>
    44b4:	2604      	movs	r6, #4
    44b6:	e7f6      	b.n	44a6 <MAC_Unpack+0x2e2>
    44b8:	2604      	movs	r6, #4
    44ba:	e7f4      	b.n	44a6 <MAC_Unpack+0x2e2>
    44bc:	2603      	movs	r6, #3
    44be:	e7f2      	b.n	44a6 <MAC_Unpack+0x2e2>
    44c0:	2603      	movs	r6, #3
    44c2:	e7f0      	b.n	44a6 <MAC_Unpack+0x2e2>
    44c4:	2602      	movs	r6, #2
    44c6:	e7ee      	b.n	44a6 <MAC_Unpack+0x2e2>
    44c8:	2602      	movs	r6, #2
    44ca:	e7ec      	b.n	44a6 <MAC_Unpack+0x2e2>
    44cc:	460e      	mov	r6, r1
    44ce:	e7ea      	b.n	44a6 <MAC_Unpack+0x2e2>
    44d0:	2602      	movs	r6, #2
    44d2:	e7e8      	b.n	44a6 <MAC_Unpack+0x2e2>
    44d4:	2602      	movs	r6, #2
    44d6:	e7e6      	b.n	44a6 <MAC_Unpack+0x2e2>
    44d8:	461e      	mov	r6, r3
    44da:	e7e4      	b.n	44a6 <MAC_Unpack+0x2e2>
    44dc:	2602      	movs	r6, #2
    44de:	e7e2      	b.n	44a6 <MAC_Unpack+0x2e2>
    44e0:	2604      	movs	r6, #4
    44e2:	e7e0      	b.n	44a6 <MAC_Unpack+0x2e2>
    44e4:	2604      	movs	r6, #4
    44e6:	e7de      	b.n	44a6 <MAC_Unpack+0x2e2>
    44e8:	2602      	movs	r6, #2
    44ea:	e7dc      	b.n	44a6 <MAC_Unpack+0x2e2>
    44ec:	2607      	movs	r6, #7
    44ee:	e7da      	b.n	44a6 <MAC_Unpack+0x2e2>
    44f0:	0000bc6c 	.word	0x0000bc6c

000044f4 <jsmn_alloc_token>:
    44f4:	6843      	ldr	r3, [r0, #4]
    44f6:	4293      	cmp	r3, r2
    44f8:	d20a      	bcs.n	4510 <jsmn_alloc_token+0x1c>
    44fa:	1c5a      	adds	r2, r3, #1
    44fc:	6042      	str	r2, [r0, #4]
    44fe:	eb01 1003 	add.w	r0, r1, r3, lsl #4
    4502:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    4506:	6083      	str	r3, [r0, #8]
    4508:	6043      	str	r3, [r0, #4]
    450a:	2300      	movs	r3, #0
    450c:	60c3      	str	r3, [r0, #12]
    450e:	4770      	bx	lr
    4510:	2000      	movs	r0, #0
    4512:	4770      	bx	lr

00004514 <jsmn_fill_token>:
    4514:	7001      	strb	r1, [r0, #0]
    4516:	6042      	str	r2, [r0, #4]
    4518:	6083      	str	r3, [r0, #8]
    451a:	2300      	movs	r3, #0
    451c:	60c3      	str	r3, [r0, #12]
    451e:	4770      	bx	lr

00004520 <jsmn_parse_primitive>:
    4520:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4522:	4606      	mov	r6, r0
    4524:	4608      	mov	r0, r1
    4526:	4619      	mov	r1, r3
    4528:	6837      	ldr	r7, [r6, #0]
    452a:	e00b      	b.n	4544 <jsmn_parse_primitive+0x24>
    452c:	2c5d      	cmp	r4, #93	; 0x5d
    452e:	d067      	beq.n	4600 <jsmn_parse_primitive+0xe0>
    4530:	2c7d      	cmp	r4, #125	; 0x7d
    4532:	d065      	beq.n	4600 <jsmn_parse_primitive+0xe0>
    4534:	2c3a      	cmp	r4, #58	; 0x3a
    4536:	d063      	beq.n	4600 <jsmn_parse_primitive+0xe0>
    4538:	3c20      	subs	r4, #32
    453a:	b2e4      	uxtb	r4, r4
    453c:	2c5e      	cmp	r4, #94	; 0x5e
    453e:	d85b      	bhi.n	45f8 <jsmn_parse_primitive+0xd8>
    4540:	3501      	adds	r5, #1
    4542:	6035      	str	r5, [r6, #0]
    4544:	6835      	ldr	r5, [r6, #0]
    4546:	4295      	cmp	r5, r2
    4548:	d25a      	bcs.n	4600 <jsmn_parse_primitive+0xe0>
    454a:	5d44      	ldrb	r4, [r0, r5]
    454c:	2c00      	cmp	r4, #0
    454e:	d057      	beq.n	4600 <jsmn_parse_primitive+0xe0>
    4550:	2c2c      	cmp	r4, #44	; 0x2c
    4552:	d8eb      	bhi.n	452c <jsmn_parse_primitive+0xc>
    4554:	2c09      	cmp	r4, #9
    4556:	d3ef      	bcc.n	4538 <jsmn_parse_primitive+0x18>
    4558:	f1a4 0c09 	sub.w	ip, r4, #9
    455c:	f1bc 0f23 	cmp.w	ip, #35	; 0x23
    4560:	d8ea      	bhi.n	4538 <jsmn_parse_primitive+0x18>
    4562:	a301      	add	r3, pc, #4	; (adr r3, 4568 <jsmn_parse_primitive+0x48>)
    4564:	f853 f02c 	ldr.w	pc, [r3, ip, lsl #2]
    4568:	00004601 	.word	0x00004601
    456c:	00004601 	.word	0x00004601
    4570:	00004539 	.word	0x00004539
    4574:	00004539 	.word	0x00004539
    4578:	00004601 	.word	0x00004601
    457c:	00004539 	.word	0x00004539
    4580:	00004539 	.word	0x00004539
    4584:	00004539 	.word	0x00004539
    4588:	00004539 	.word	0x00004539
    458c:	00004539 	.word	0x00004539
    4590:	00004539 	.word	0x00004539
    4594:	00004539 	.word	0x00004539
    4598:	00004539 	.word	0x00004539
    459c:	00004539 	.word	0x00004539
    45a0:	00004539 	.word	0x00004539
    45a4:	00004539 	.word	0x00004539
    45a8:	00004539 	.word	0x00004539
    45ac:	00004539 	.word	0x00004539
    45b0:	00004539 	.word	0x00004539
    45b4:	00004539 	.word	0x00004539
    45b8:	00004539 	.word	0x00004539
    45bc:	00004539 	.word	0x00004539
    45c0:	00004539 	.word	0x00004539
    45c4:	00004601 	.word	0x00004601
    45c8:	00004539 	.word	0x00004539
    45cc:	00004539 	.word	0x00004539
    45d0:	00004539 	.word	0x00004539
    45d4:	00004539 	.word	0x00004539
    45d8:	00004539 	.word	0x00004539
    45dc:	00004539 	.word	0x00004539
    45e0:	00004539 	.word	0x00004539
    45e4:	00004539 	.word	0x00004539
    45e8:	00004539 	.word	0x00004539
    45ec:	00004539 	.word	0x00004539
    45f0:	00004539 	.word	0x00004539
    45f4:	00004601 	.word	0x00004601
    45f8:	6037      	str	r7, [r6, #0]
    45fa:	f06f 0001 	mvn.w	r0, #1
    45fe:	e00e      	b.n	461e <jsmn_parse_primitive+0xfe>
    4600:	b171      	cbz	r1, 4620 <jsmn_parse_primitive+0x100>
    4602:	9a06      	ldr	r2, [sp, #24]
    4604:	4630      	mov	r0, r6
    4606:	f7ff ff75 	bl	44f4 <jsmn_alloc_token>
    460a:	b168      	cbz	r0, 4628 <jsmn_parse_primitive+0x108>
    460c:	6833      	ldr	r3, [r6, #0]
    460e:	463a      	mov	r2, r7
    4610:	2104      	movs	r1, #4
    4612:	f7ff ff7f 	bl	4514 <jsmn_fill_token>
    4616:	6833      	ldr	r3, [r6, #0]
    4618:	3b01      	subs	r3, #1
    461a:	6033      	str	r3, [r6, #0]
    461c:	2000      	movs	r0, #0
    461e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    4620:	3d01      	subs	r5, #1
    4622:	6035      	str	r5, [r6, #0]
    4624:	2000      	movs	r0, #0
    4626:	e7fa      	b.n	461e <jsmn_parse_primitive+0xfe>
    4628:	6037      	str	r7, [r6, #0]
    462a:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    462e:	e7f6      	b.n	461e <jsmn_parse_primitive+0xfe>

00004630 <jsmn_parse_string>:
    4630:	b570      	push	{r4, r5, r6, lr}
    4632:	4605      	mov	r5, r0
    4634:	6806      	ldr	r6, [r0, #0]
    4636:	1c70      	adds	r0, r6, #1
    4638:	6028      	str	r0, [r5, #0]
    463a:	e048      	b.n	46ce <jsmn_parse_string+0x9e>
    463c:	2b00      	cmp	r3, #0
    463e:	f000 8099 	beq.w	4774 <jsmn_parse_string+0x144>
    4642:	9a04      	ldr	r2, [sp, #16]
    4644:	4619      	mov	r1, r3
    4646:	4628      	mov	r0, r5
    4648:	f7ff ff54 	bl	44f4 <jsmn_alloc_token>
    464c:	b130      	cbz	r0, 465c <jsmn_parse_string+0x2c>
    464e:	682b      	ldr	r3, [r5, #0]
    4650:	1c72      	adds	r2, r6, #1
    4652:	2103      	movs	r1, #3
    4654:	f7ff ff5e 	bl	4514 <jsmn_fill_token>
    4658:	2000      	movs	r0, #0
    465a:	e00a      	b.n	4672 <jsmn_parse_string+0x42>
    465c:	602e      	str	r6, [r5, #0]
    465e:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    4662:	e006      	b.n	4672 <jsmn_parse_string+0x42>
    4664:	2822      	cmp	r0, #34	; 0x22
    4666:	d02f      	beq.n	46c8 <jsmn_parse_string+0x98>
    4668:	282f      	cmp	r0, #47	; 0x2f
    466a:	d02d      	beq.n	46c8 <jsmn_parse_string+0x98>
    466c:	602e      	str	r6, [r5, #0]
    466e:	f06f 0001 	mvn.w	r0, #1
    4672:	bd70      	pop	{r4, r5, r6, pc}
    4674:	3401      	adds	r4, #1
    4676:	602c      	str	r4, [r5, #0]
    4678:	f04f 0e00 	mov.w	lr, #0
    467c:	e003      	b.n	4686 <jsmn_parse_string+0x56>
    467e:	3001      	adds	r0, #1
    4680:	6028      	str	r0, [r5, #0]
    4682:	f10e 0e01 	add.w	lr, lr, #1
    4686:	f1be 0f03 	cmp.w	lr, #3
    468a:	dc1a      	bgt.n	46c2 <jsmn_parse_string+0x92>
    468c:	6828      	ldr	r0, [r5, #0]
    468e:	4290      	cmp	r0, r2
    4690:	d217      	bcs.n	46c2 <jsmn_parse_string+0x92>
    4692:	5c0c      	ldrb	r4, [r1, r0]
    4694:	b1ac      	cbz	r4, 46c2 <jsmn_parse_string+0x92>
    4696:	f1a4 0c30 	sub.w	ip, r4, #48	; 0x30
    469a:	fa5f fc8c 	uxtb.w	ip, ip
    469e:	f1bc 0f09 	cmp.w	ip, #9
    46a2:	d9ec      	bls.n	467e <jsmn_parse_string+0x4e>
    46a4:	f1a4 0c41 	sub.w	ip, r4, #65	; 0x41
    46a8:	fa5f fc8c 	uxtb.w	ip, ip
    46ac:	f1bc 0f05 	cmp.w	ip, #5
    46b0:	d9e5      	bls.n	467e <jsmn_parse_string+0x4e>
    46b2:	3c61      	subs	r4, #97	; 0x61
    46b4:	b2e4      	uxtb	r4, r4
    46b6:	2c05      	cmp	r4, #5
    46b8:	d9e1      	bls.n	467e <jsmn_parse_string+0x4e>
    46ba:	602e      	str	r6, [r5, #0]
    46bc:	f06f 0001 	mvn.w	r0, #1
    46c0:	e7d7      	b.n	4672 <jsmn_parse_string+0x42>
    46c2:	6828      	ldr	r0, [r5, #0]
    46c4:	3801      	subs	r0, #1
    46c6:	6028      	str	r0, [r5, #0]
    46c8:	6828      	ldr	r0, [r5, #0]
    46ca:	3001      	adds	r0, #1
    46cc:	6028      	str	r0, [r5, #0]
    46ce:	682c      	ldr	r4, [r5, #0]
    46d0:	4294      	cmp	r4, r2
    46d2:	d24b      	bcs.n	476c <jsmn_parse_string+0x13c>
    46d4:	5d08      	ldrb	r0, [r1, r4]
    46d6:	2800      	cmp	r0, #0
    46d8:	d048      	beq.n	476c <jsmn_parse_string+0x13c>
    46da:	2822      	cmp	r0, #34	; 0x22
    46dc:	d0ae      	beq.n	463c <jsmn_parse_string+0xc>
    46de:	285c      	cmp	r0, #92	; 0x5c
    46e0:	d1f2      	bne.n	46c8 <jsmn_parse_string+0x98>
    46e2:	3401      	adds	r4, #1
    46e4:	4294      	cmp	r4, r2
    46e6:	d2ef      	bcs.n	46c8 <jsmn_parse_string+0x98>
    46e8:	602c      	str	r4, [r5, #0]
    46ea:	5d08      	ldrb	r0, [r1, r4]
    46ec:	2875      	cmp	r0, #117	; 0x75
    46ee:	d8bd      	bhi.n	466c <jsmn_parse_string+0x3c>
    46f0:	285c      	cmp	r0, #92	; 0x5c
    46f2:	d3b7      	bcc.n	4664 <jsmn_parse_string+0x34>
    46f4:	385c      	subs	r0, #92	; 0x5c
    46f6:	2819      	cmp	r0, #25
    46f8:	d8b8      	bhi.n	466c <jsmn_parse_string+0x3c>
    46fa:	f20f 0c08 	addw	ip, pc, #8
    46fe:	f85c f020 	ldr.w	pc, [ip, r0, lsl #2]
    4702:	bf00      	nop
    4704:	000046c9 	.word	0x000046c9
    4708:	0000466d 	.word	0x0000466d
    470c:	0000466d 	.word	0x0000466d
    4710:	0000466d 	.word	0x0000466d
    4714:	0000466d 	.word	0x0000466d
    4718:	0000466d 	.word	0x0000466d
    471c:	000046c9 	.word	0x000046c9
    4720:	0000466d 	.word	0x0000466d
    4724:	0000466d 	.word	0x0000466d
    4728:	0000466d 	.word	0x0000466d
    472c:	000046c9 	.word	0x000046c9
    4730:	0000466d 	.word	0x0000466d
    4734:	0000466d 	.word	0x0000466d
    4738:	0000466d 	.word	0x0000466d
    473c:	0000466d 	.word	0x0000466d
    4740:	0000466d 	.word	0x0000466d
    4744:	0000466d 	.word	0x0000466d
    4748:	0000466d 	.word	0x0000466d
    474c:	000046c9 	.word	0x000046c9
    4750:	0000466d 	.word	0x0000466d
    4754:	0000466d 	.word	0x0000466d
    4758:	0000466d 	.word	0x0000466d
    475c:	000046c9 	.word	0x000046c9
    4760:	0000466d 	.word	0x0000466d
    4764:	000046c9 	.word	0x000046c9
    4768:	00004675 	.word	0x00004675
    476c:	602e      	str	r6, [r5, #0]
    476e:	f06f 0002 	mvn.w	r0, #2
    4772:	e77e      	b.n	4672 <jsmn_parse_string+0x42>
    4774:	2000      	movs	r0, #0
    4776:	e77c      	b.n	4672 <jsmn_parse_string+0x42>

00004778 <write_json_parameter>:
    4778:	b570      	push	{r4, r5, r6, lr}
    477a:	4605      	mov	r5, r0
    477c:	460c      	mov	r4, r1
    477e:	f89d 6018 	ldrb.w	r6, [sp, #24]
    4782:	8808      	ldrh	r0, [r1, #0]
    4784:	1c41      	adds	r1, r0, #1
    4786:	8021      	strh	r1, [r4, #0]
    4788:	2122      	movs	r1, #34	; 0x22
    478a:	5429      	strb	r1, [r5, r0]
    478c:	8820      	ldrh	r0, [r4, #0]
    478e:	f100 0c01 	add.w	ip, r0, #1
    4792:	f8a4 c000 	strh.w	ip, [r4]
    4796:	542a      	strb	r2, [r5, r0]
    4798:	8822      	ldrh	r2, [r4, #0]
    479a:	1c50      	adds	r0, r2, #1
    479c:	8020      	strh	r0, [r4, #0]
    479e:	54a9      	strb	r1, [r5, r2]
    47a0:	8822      	ldrh	r2, [r4, #0]
    47a2:	1c51      	adds	r1, r2, #1
    47a4:	8021      	strh	r1, [r4, #0]
    47a6:	213a      	movs	r1, #58	; 0x3a
    47a8:	54a9      	strb	r1, [r5, r2]
    47aa:	b926      	cbnz	r6, 47b6 <write_json_parameter+0x3e>
    47ac:	8822      	ldrh	r2, [r4, #0]
    47ae:	1c51      	adds	r1, r2, #1
    47b0:	8021      	strh	r1, [r4, #0]
    47b2:	2122      	movs	r1, #34	; 0x22
    47b4:	54a9      	strb	r1, [r5, r2]
    47b6:	8820      	ldrh	r0, [r4, #0]
    47b8:	9a05      	ldr	r2, [sp, #20]
    47ba:	f89d 1010 	ldrb.w	r1, [sp, #16]
    47be:	4428      	add	r0, r5
    47c0:	f000 ff8e 	bl	56e0 <snprintf_>
    47c4:	8823      	ldrh	r3, [r4, #0]
    47c6:	4418      	add	r0, r3
    47c8:	b280      	uxth	r0, r0
    47ca:	8020      	strh	r0, [r4, #0]
    47cc:	b91e      	cbnz	r6, 47d6 <write_json_parameter+0x5e>
    47ce:	1c43      	adds	r3, r0, #1
    47d0:	8023      	strh	r3, [r4, #0]
    47d2:	2322      	movs	r3, #34	; 0x22
    47d4:	542b      	strb	r3, [r5, r0]
    47d6:	8823      	ldrh	r3, [r4, #0]
    47d8:	1c5a      	adds	r2, r3, #1
    47da:	8022      	strh	r2, [r4, #0]
    47dc:	222c      	movs	r2, #44	; 0x2c
    47de:	54ea      	strb	r2, [r5, r3]
    47e0:	bd70      	pop	{r4, r5, r6, pc}
	...

000047e4 <jsmn_parse>:
    47e4:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    47e8:	b082      	sub	sp, #8
    47ea:	4605      	mov	r5, r0
    47ec:	4688      	mov	r8, r1
    47ee:	4617      	mov	r7, r2
    47f0:	461e      	mov	r6, r3
    47f2:	f8dd a028 	ldr.w	sl, [sp, #40]	; 0x28
    47f6:	f8d0 9004 	ldr.w	r9, [r0, #4]
    47fa:	e096      	b.n	492a <jsmn_parse+0x146>
    47fc:	2c7b      	cmp	r4, #123	; 0x7b
    47fe:	d027      	beq.n	4850 <jsmn_parse+0x6c>
    4800:	d91a      	bls.n	4838 <jsmn_parse+0x54>
    4802:	2c7d      	cmp	r4, #125	; 0x7d
    4804:	d01c      	beq.n	4840 <jsmn_parse+0x5c>
    4806:	f8cd a000 	str.w	sl, [sp]
    480a:	4633      	mov	r3, r6
    480c:	463a      	mov	r2, r7
    480e:	4641      	mov	r1, r8
    4810:	4628      	mov	r0, r5
    4812:	f7ff fe85 	bl	4520 <jsmn_parse_primitive>
    4816:	2800      	cmp	r0, #0
    4818:	f2c0 814a 	blt.w	4ab0 <jsmn_parse+0x2cc>
    481c:	f109 0901 	add.w	r9, r9, #1
    4820:	68ab      	ldr	r3, [r5, #8]
    4822:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    4826:	d07d      	beq.n	4924 <jsmn_parse+0x140>
    4828:	2e00      	cmp	r6, #0
    482a:	d07b      	beq.n	4924 <jsmn_parse+0x140>
    482c:	eb06 1303 	add.w	r3, r6, r3, lsl #4
    4830:	68da      	ldr	r2, [r3, #12]
    4832:	3201      	adds	r2, #1
    4834:	60da      	str	r2, [r3, #12]
    4836:	e075      	b.n	4924 <jsmn_parse+0x140>
    4838:	2c5b      	cmp	r4, #91	; 0x5b
    483a:	d009      	beq.n	4850 <jsmn_parse+0x6c>
    483c:	2c5d      	cmp	r4, #93	; 0x5d
    483e:	d1e2      	bne.n	4806 <jsmn_parse+0x22>
    4840:	2e00      	cmp	r6, #0
    4842:	d06f      	beq.n	4924 <jsmn_parse+0x140>
    4844:	2c7d      	cmp	r4, #125	; 0x7d
    4846:	d025      	beq.n	4894 <jsmn_parse+0xb0>
    4848:	2002      	movs	r0, #2
    484a:	686c      	ldr	r4, [r5, #4]
    484c:	3c01      	subs	r4, #1
    484e:	e024      	b.n	489a <jsmn_parse+0xb6>
    4850:	f109 0901 	add.w	r9, r9, #1
    4854:	2e00      	cmp	r6, #0
    4856:	d065      	beq.n	4924 <jsmn_parse+0x140>
    4858:	4652      	mov	r2, sl
    485a:	4631      	mov	r1, r6
    485c:	4628      	mov	r0, r5
    485e:	f7ff fe49 	bl	44f4 <jsmn_alloc_token>
    4862:	4602      	mov	r2, r0
    4864:	2800      	cmp	r0, #0
    4866:	f000 811b 	beq.w	4aa0 <jsmn_parse+0x2bc>
    486a:	68ab      	ldr	r3, [r5, #8]
    486c:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    4870:	d004      	beq.n	487c <jsmn_parse+0x98>
    4872:	eb06 1303 	add.w	r3, r6, r3, lsl #4
    4876:	68d9      	ldr	r1, [r3, #12]
    4878:	3101      	adds	r1, #1
    487a:	60d9      	str	r1, [r3, #12]
    487c:	2c7b      	cmp	r4, #123	; 0x7b
    487e:	d007      	beq.n	4890 <jsmn_parse+0xac>
    4880:	2302      	movs	r3, #2
    4882:	7013      	strb	r3, [r2, #0]
    4884:	682b      	ldr	r3, [r5, #0]
    4886:	6053      	str	r3, [r2, #4]
    4888:	686b      	ldr	r3, [r5, #4]
    488a:	3b01      	subs	r3, #1
    488c:	60ab      	str	r3, [r5, #8]
    488e:	e049      	b.n	4924 <jsmn_parse+0x140>
    4890:	2301      	movs	r3, #1
    4892:	e7f6      	b.n	4882 <jsmn_parse+0x9e>
    4894:	2001      	movs	r0, #1
    4896:	e7d8      	b.n	484a <jsmn_parse+0x66>
    4898:	3c01      	subs	r4, #1
    489a:	2c00      	cmp	r4, #0
    489c:	db12      	blt.n	48c4 <jsmn_parse+0xe0>
    489e:	eb06 1204 	add.w	r2, r6, r4, lsl #4
    48a2:	6851      	ldr	r1, [r2, #4]
    48a4:	f1b1 3fff 	cmp.w	r1, #4294967295	; 0xffffffff
    48a8:	d0f6      	beq.n	4898 <jsmn_parse+0xb4>
    48aa:	6891      	ldr	r1, [r2, #8]
    48ac:	f1b1 3fff 	cmp.w	r1, #4294967295	; 0xffffffff
    48b0:	d1f2      	bne.n	4898 <jsmn_parse+0xb4>
    48b2:	7811      	ldrb	r1, [r2, #0]
    48b4:	4281      	cmp	r1, r0
    48b6:	f040 80f6 	bne.w	4aa6 <jsmn_parse+0x2c2>
    48ba:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    48be:	60a9      	str	r1, [r5, #8]
    48c0:	3301      	adds	r3, #1
    48c2:	6093      	str	r3, [r2, #8]
    48c4:	f1b4 3fff 	cmp.w	r4, #4294967295	; 0xffffffff
    48c8:	d103      	bne.n	48d2 <jsmn_parse+0xee>
    48ca:	f06f 0901 	mvn.w	r9, #1
    48ce:	e0e3      	b.n	4a98 <jsmn_parse+0x2b4>
    48d0:	3c01      	subs	r4, #1
    48d2:	2c00      	cmp	r4, #0
    48d4:	db26      	blt.n	4924 <jsmn_parse+0x140>
    48d6:	eb06 1304 	add.w	r3, r6, r4, lsl #4
    48da:	685a      	ldr	r2, [r3, #4]
    48dc:	f1b2 3fff 	cmp.w	r2, #4294967295	; 0xffffffff
    48e0:	d0f6      	beq.n	48d0 <jsmn_parse+0xec>
    48e2:	689b      	ldr	r3, [r3, #8]
    48e4:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    48e8:	d1f2      	bne.n	48d0 <jsmn_parse+0xec>
    48ea:	60ac      	str	r4, [r5, #8]
    48ec:	e01a      	b.n	4924 <jsmn_parse+0x140>
    48ee:	f8cd a000 	str.w	sl, [sp]
    48f2:	4633      	mov	r3, r6
    48f4:	463a      	mov	r2, r7
    48f6:	4641      	mov	r1, r8
    48f8:	4628      	mov	r0, r5
    48fa:	f7ff fe99 	bl	4630 <jsmn_parse_string>
    48fe:	2800      	cmp	r0, #0
    4900:	f2c0 80d4 	blt.w	4aac <jsmn_parse+0x2c8>
    4904:	f109 0901 	add.w	r9, r9, #1
    4908:	68ab      	ldr	r3, [r5, #8]
    490a:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    490e:	d009      	beq.n	4924 <jsmn_parse+0x140>
    4910:	b146      	cbz	r6, 4924 <jsmn_parse+0x140>
    4912:	eb06 1303 	add.w	r3, r6, r3, lsl #4
    4916:	68da      	ldr	r2, [r3, #12]
    4918:	3201      	adds	r2, #1
    491a:	60da      	str	r2, [r3, #12]
    491c:	e002      	b.n	4924 <jsmn_parse+0x140>
    491e:	686b      	ldr	r3, [r5, #4]
    4920:	3b01      	subs	r3, #1
    4922:	60ab      	str	r3, [r5, #8]
    4924:	682b      	ldr	r3, [r5, #0]
    4926:	3301      	adds	r3, #1
    4928:	602b      	str	r3, [r5, #0]
    492a:	682b      	ldr	r3, [r5, #0]
    492c:	42bb      	cmp	r3, r7
    492e:	f080 80a0 	bcs.w	4a72 <jsmn_parse+0x28e>
    4932:	f818 4003 	ldrb.w	r4, [r8, r3]
    4936:	2c00      	cmp	r4, #0
    4938:	f000 809b 	beq.w	4a72 <jsmn_parse+0x28e>
    493c:	2c3a      	cmp	r4, #58	; 0x3a
    493e:	f63f af5d 	bhi.w	47fc <jsmn_parse+0x18>
    4942:	2c09      	cmp	r4, #9
    4944:	f4ff af5f 	bcc.w	4806 <jsmn_parse+0x22>
    4948:	3c09      	subs	r4, #9
    494a:	2c31      	cmp	r4, #49	; 0x31
    494c:	f63f af5b 	bhi.w	4806 <jsmn_parse+0x22>
    4950:	a301      	add	r3, pc, #4	; (adr r3, 4958 <jsmn_parse+0x174>)
    4952:	f853 f024 	ldr.w	pc, [r3, r4, lsl #2]
    4956:	bf00      	nop
    4958:	00004925 	.word	0x00004925
    495c:	00004925 	.word	0x00004925
    4960:	00004807 	.word	0x00004807
    4964:	00004807 	.word	0x00004807
    4968:	00004925 	.word	0x00004925
    496c:	00004807 	.word	0x00004807
    4970:	00004807 	.word	0x00004807
    4974:	00004807 	.word	0x00004807
    4978:	00004807 	.word	0x00004807
    497c:	00004807 	.word	0x00004807
    4980:	00004807 	.word	0x00004807
    4984:	00004807 	.word	0x00004807
    4988:	00004807 	.word	0x00004807
    498c:	00004807 	.word	0x00004807
    4990:	00004807 	.word	0x00004807
    4994:	00004807 	.word	0x00004807
    4998:	00004807 	.word	0x00004807
    499c:	00004807 	.word	0x00004807
    49a0:	00004807 	.word	0x00004807
    49a4:	00004807 	.word	0x00004807
    49a8:	00004807 	.word	0x00004807
    49ac:	00004807 	.word	0x00004807
    49b0:	00004807 	.word	0x00004807
    49b4:	00004925 	.word	0x00004925
    49b8:	00004807 	.word	0x00004807
    49bc:	000048ef 	.word	0x000048ef
    49c0:	00004807 	.word	0x00004807
    49c4:	00004807 	.word	0x00004807
    49c8:	00004807 	.word	0x00004807
    49cc:	00004807 	.word	0x00004807
    49d0:	00004807 	.word	0x00004807
    49d4:	00004807 	.word	0x00004807
    49d8:	00004807 	.word	0x00004807
    49dc:	00004807 	.word	0x00004807
    49e0:	00004807 	.word	0x00004807
    49e4:	00004a21 	.word	0x00004a21
    49e8:	00004807 	.word	0x00004807
    49ec:	00004807 	.word	0x00004807
    49f0:	00004807 	.word	0x00004807
    49f4:	00004807 	.word	0x00004807
    49f8:	00004807 	.word	0x00004807
    49fc:	00004807 	.word	0x00004807
    4a00:	00004807 	.word	0x00004807
    4a04:	00004807 	.word	0x00004807
    4a08:	00004807 	.word	0x00004807
    4a0c:	00004807 	.word	0x00004807
    4a10:	00004807 	.word	0x00004807
    4a14:	00004807 	.word	0x00004807
    4a18:	00004807 	.word	0x00004807
    4a1c:	0000491f 	.word	0x0000491f
    4a20:	2e00      	cmp	r6, #0
    4a22:	f43f af7f 	beq.w	4924 <jsmn_parse+0x140>
    4a26:	68ab      	ldr	r3, [r5, #8]
    4a28:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    4a2c:	f43f af7a 	beq.w	4924 <jsmn_parse+0x140>
    4a30:	011b      	lsls	r3, r3, #4
    4a32:	5cf3      	ldrb	r3, [r6, r3]
    4a34:	2b02      	cmp	r3, #2
    4a36:	f43f af75 	beq.w	4924 <jsmn_parse+0x140>
    4a3a:	2b01      	cmp	r3, #1
    4a3c:	f43f af72 	beq.w	4924 <jsmn_parse+0x140>
    4a40:	686a      	ldr	r2, [r5, #4]
    4a42:	3a01      	subs	r2, #1
    4a44:	e000      	b.n	4a48 <jsmn_parse+0x264>
    4a46:	3a01      	subs	r2, #1
    4a48:	2a00      	cmp	r2, #0
    4a4a:	f6ff af6b 	blt.w	4924 <jsmn_parse+0x140>
    4a4e:	0113      	lsls	r3, r2, #4
    4a50:	eb06 1102 	add.w	r1, r6, r2, lsl #4
    4a54:	5cf3      	ldrb	r3, [r6, r3]
    4a56:	3b01      	subs	r3, #1
    4a58:	b2db      	uxtb	r3, r3
    4a5a:	2b01      	cmp	r3, #1
    4a5c:	d8f3      	bhi.n	4a46 <jsmn_parse+0x262>
    4a5e:	684b      	ldr	r3, [r1, #4]
    4a60:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    4a64:	d0ef      	beq.n	4a46 <jsmn_parse+0x262>
    4a66:	688b      	ldr	r3, [r1, #8]
    4a68:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    4a6c:	d1eb      	bne.n	4a46 <jsmn_parse+0x262>
    4a6e:	60aa      	str	r2, [r5, #8]
    4a70:	e758      	b.n	4924 <jsmn_parse+0x140>
    4a72:	b18e      	cbz	r6, 4a98 <jsmn_parse+0x2b4>
    4a74:	686b      	ldr	r3, [r5, #4]
    4a76:	3b01      	subs	r3, #1
    4a78:	e000      	b.n	4a7c <jsmn_parse+0x298>
    4a7a:	3b01      	subs	r3, #1
    4a7c:	2b00      	cmp	r3, #0
    4a7e:	db0b      	blt.n	4a98 <jsmn_parse+0x2b4>
    4a80:	eb06 1203 	add.w	r2, r6, r3, lsl #4
    4a84:	6851      	ldr	r1, [r2, #4]
    4a86:	f1b1 3fff 	cmp.w	r1, #4294967295	; 0xffffffff
    4a8a:	d0f6      	beq.n	4a7a <jsmn_parse+0x296>
    4a8c:	6892      	ldr	r2, [r2, #8]
    4a8e:	f1b2 3fff 	cmp.w	r2, #4294967295	; 0xffffffff
    4a92:	d1f2      	bne.n	4a7a <jsmn_parse+0x296>
    4a94:	f06f 0902 	mvn.w	r9, #2
    4a98:	4648      	mov	r0, r9
    4a9a:	b002      	add	sp, #8
    4a9c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    4aa0:	f04f 39ff 	mov.w	r9, #4294967295	; 0xffffffff
    4aa4:	e7f8      	b.n	4a98 <jsmn_parse+0x2b4>
    4aa6:	f06f 0901 	mvn.w	r9, #1
    4aaa:	e7f5      	b.n	4a98 <jsmn_parse+0x2b4>
    4aac:	4681      	mov	r9, r0
    4aae:	e7f3      	b.n	4a98 <jsmn_parse+0x2b4>
    4ab0:	4681      	mov	r9, r0
    4ab2:	e7f1      	b.n	4a98 <jsmn_parse+0x2b4>

00004ab4 <jsmn_init>:
    4ab4:	2300      	movs	r3, #0
    4ab6:	6003      	str	r3, [r0, #0]
    4ab8:	6043      	str	r3, [r0, #4]
    4aba:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    4abe:	6083      	str	r3, [r0, #8]
    4ac0:	4770      	bx	lr

00004ac2 <console_process_rx_json>:
    4ac2:	b570      	push	{r4, r5, r6, lr}
    4ac4:	b0a6      	sub	sp, #152	; 0x98
    4ac6:	4605      	mov	r5, r0
    4ac8:	460e      	mov	r6, r1
    4aca:	2400      	movs	r4, #0
    4acc:	9423      	str	r4, [sp, #140]	; 0x8c
    4ace:	9424      	str	r4, [sp, #144]	; 0x90
    4ad0:	9425      	str	r4, [sp, #148]	; 0x94
    4ad2:	2280      	movs	r2, #128	; 0x80
    4ad4:	4621      	mov	r1, r4
    4ad6:	a803      	add	r0, sp, #12
    4ad8:	f007 f82d 	bl	bb36 <memset>
    4adc:	a823      	add	r0, sp, #140	; 0x8c
    4ade:	f7ff ffe9 	bl	4ab4 <jsmn_init>
    4ae2:	2308      	movs	r3, #8
    4ae4:	9300      	str	r3, [sp, #0]
    4ae6:	ab03      	add	r3, sp, #12
    4ae8:	4632      	mov	r2, r6
    4aea:	4629      	mov	r1, r5
    4aec:	a823      	add	r0, sp, #140	; 0x8c
    4aee:	f7ff fe79 	bl	47e4 <jsmn_parse>
    4af2:	e001      	b.n	4af8 <console_process_rx_json+0x36>
    4af4:	3401      	adds	r4, #1
    4af6:	b2e4      	uxtb	r4, r4
    4af8:	4622      	mov	r2, r4
    4afa:	ab26      	add	r3, sp, #152	; 0x98
    4afc:	eb03 1304 	add.w	r3, r3, r4, lsl #4
    4b00:	f813 3c8c 	ldrb.w	r3, [r3, #-140]
    4b04:	b363      	cbz	r3, 4b60 <console_process_rx_json+0x9e>
    4b06:	2c07      	cmp	r4, #7
    4b08:	d82a      	bhi.n	4b60 <console_process_rx_json+0x9e>
    4b0a:	2b01      	cmp	r3, #1
    4b0c:	d0f2      	beq.n	4af4 <console_process_rx_json+0x32>
    4b0e:	2b03      	cmp	r3, #3
    4b10:	d002      	beq.n	4b18 <console_process_rx_json+0x56>
    4b12:	3401      	adds	r4, #1
    4b14:	b2e4      	uxtb	r4, r4
    4b16:	e7ef      	b.n	4af8 <console_process_rx_json+0x36>
    4b18:	ab26      	add	r3, sp, #152	; 0x98
    4b1a:	eb03 1202 	add.w	r2, r3, r2, lsl #4
    4b1e:	f852 3c88 	ldr.w	r3, [r2, #-136]
    4b22:	5ceb      	ldrb	r3, [r5, r3]
    4b24:	2b42      	cmp	r3, #66	; 0x42
    4b26:	d016      	beq.n	4b56 <console_process_rx_json+0x94>
    4b28:	2b43      	cmp	r3, #67	; 0x43
    4b2a:	d116      	bne.n	4b5a <console_process_rx_json+0x98>
    4b2c:	3401      	adds	r4, #1
    4b2e:	b2e4      	uxtb	r4, r4
    4b30:	ab26      	add	r3, sp, #152	; 0x98
    4b32:	eb03 1304 	add.w	r3, r3, r4, lsl #4
    4b36:	f853 0c88 	ldr.w	r0, [r3, #-136]
    4b3a:	220a      	movs	r2, #10
    4b3c:	2100      	movs	r1, #0
    4b3e:	4428      	add	r0, r5
    4b40:	f007 f884 	bl	bc4c <strtol>
    4b44:	b2c0      	uxtb	r0, r0
    4b46:	f1a0 030b 	sub.w	r3, r0, #11
    4b4a:	b2db      	uxtb	r3, r3
    4b4c:	2b0f      	cmp	r3, #15
    4b4e:	d804      	bhi.n	4b5a <console_process_rx_json+0x98>
    4b50:	f001 fee6 	bl	6920 <HAL_SetRadioChannel>
    4b54:	e001      	b.n	4b5a <console_process_rx_json+0x98>
    4b56:	f001 ffcb 	bl	6af0 <BSP_RebootInBootloader>
    4b5a:	3401      	adds	r4, #1
    4b5c:	b2e4      	uxtb	r4, r4
    4b5e:	e7cb      	b.n	4af8 <console_process_rx_json+0x36>
    4b60:	b026      	add	sp, #152	; 0x98
    4b62:	bd70      	pop	{r4, r5, r6, pc}

00004b64 <console_serialize_json>:
    4b64:	b508      	push	{r3, lr}
    4b66:	4b16      	ldr	r3, [pc, #88]	; (4bc0 <console_serialize_json+0x5c>)
    4b68:	781b      	ldrb	r3, [r3, #0]
    4b6a:	b113      	cbz	r3, 4b72 <console_serialize_json+0xe>
    4b6c:	2b01      	cmp	r3, #1
    4b6e:	d00c      	beq.n	4b8a <console_serialize_json+0x26>
    4b70:	bd08      	pop	{r3, pc}
    4b72:	287b      	cmp	r0, #123	; 0x7b
    4b74:	d1fc      	bne.n	4b70 <console_serialize_json+0xc>
    4b76:	4a13      	ldr	r2, [pc, #76]	; (4bc4 <console_serialize_json+0x60>)
    4b78:	2300      	movs	r3, #0
    4b7a:	7013      	strb	r3, [r2, #0]
    4b7c:	2301      	movs	r3, #1
    4b7e:	7013      	strb	r3, [r2, #0]
    4b80:	4a11      	ldr	r2, [pc, #68]	; (4bc8 <console_serialize_json+0x64>)
    4b82:	7010      	strb	r0, [r2, #0]
    4b84:	4a0e      	ldr	r2, [pc, #56]	; (4bc0 <console_serialize_json+0x5c>)
    4b86:	7013      	strb	r3, [r2, #0]
    4b88:	e7f2      	b.n	4b70 <console_serialize_json+0xc>
    4b8a:	4a0e      	ldr	r2, [pc, #56]	; (4bc4 <console_serialize_json+0x60>)
    4b8c:	7813      	ldrb	r3, [r2, #0]
    4b8e:	1c59      	adds	r1, r3, #1
    4b90:	b2c9      	uxtb	r1, r1
    4b92:	7011      	strb	r1, [r2, #0]
    4b94:	4a0c      	ldr	r2, [pc, #48]	; (4bc8 <console_serialize_json+0x64>)
    4b96:	54d0      	strb	r0, [r2, r3]
    4b98:	280d      	cmp	r0, #13
    4b9a:	d007      	beq.n	4bac <console_serialize_json+0x48>
    4b9c:	290f      	cmp	r1, #15
    4b9e:	d9e7      	bls.n	4b70 <console_serialize_json+0xc>
    4ba0:	2300      	movs	r3, #0
    4ba2:	4a08      	ldr	r2, [pc, #32]	; (4bc4 <console_serialize_json+0x60>)
    4ba4:	7013      	strb	r3, [r2, #0]
    4ba6:	4a06      	ldr	r2, [pc, #24]	; (4bc0 <console_serialize_json+0x5c>)
    4ba8:	7013      	strb	r3, [r2, #0]
    4baa:	e7e1      	b.n	4b70 <console_serialize_json+0xc>
    4bac:	4610      	mov	r0, r2
    4bae:	f7ff ff88 	bl	4ac2 <console_process_rx_json>
    4bb2:	2300      	movs	r3, #0
    4bb4:	4a03      	ldr	r2, [pc, #12]	; (4bc4 <console_serialize_json+0x60>)
    4bb6:	7013      	strb	r3, [r2, #0]
    4bb8:	4a01      	ldr	r2, [pc, #4]	; (4bc0 <console_serialize_json+0x5c>)
    4bba:	7013      	strb	r3, [r2, #0]
    4bbc:	e7d8      	b.n	4b70 <console_serialize_json+0xc>
    4bbe:	bf00      	nop
    4bc0:	20000289 	.word	0x20000289
    4bc4:	20000288 	.word	0x20000288
    4bc8:	20000278 	.word	0x20000278

00004bcc <Console_Write>:
    4bcc:	b538      	push	{r3, r4, r5, lr}
    4bce:	4604      	mov	r4, r0
    4bd0:	460d      	mov	r5, r1
    4bd2:	e005      	b.n	4be0 <Console_Write+0x14>
    4bd4:	f814 0b01 	ldrb.w	r0, [r4], #1
    4bd8:	f001 ff14 	bl	6a04 <HAL_Console_Tx_Byte>
    4bdc:	3d01      	subs	r5, #1
    4bde:	b2ad      	uxth	r5, r5
    4be0:	2d00      	cmp	r5, #0
    4be2:	d1f7      	bne.n	4bd4 <Console_Write+0x8>
    4be4:	bd38      	pop	{r3, r4, r5, pc}
	...

00004be8 <Console_RxByte>:
    4be8:	4a06      	ldr	r2, [pc, #24]	; (4c04 <Console_RxByte+0x1c>)
    4bea:	7813      	ldrb	r3, [r2, #0]
    4bec:	4906      	ldr	r1, [pc, #24]	; (4c08 <Console_RxByte+0x20>)
    4bee:	54c8      	strb	r0, [r1, r3]
    4bf0:	3301      	adds	r3, #1
    4bf2:	b2db      	uxtb	r3, r3
    4bf4:	7013      	strb	r3, [r2, #0]
    4bf6:	2b0f      	cmp	r3, #15
    4bf8:	d902      	bls.n	4c00 <Console_RxByte+0x18>
    4bfa:	4613      	mov	r3, r2
    4bfc:	2200      	movs	r2, #0
    4bfe:	701a      	strb	r2, [r3, #0]
    4c00:	4770      	bx	lr
    4c02:	bf00      	nop
    4c04:	2000049c 	.word	0x2000049c
    4c08:	2000048c 	.word	0x2000048c

00004c0c <Console_Process_Rx>:
    4c0c:	b508      	push	{r3, lr}
    4c0e:	4b0b      	ldr	r3, [pc, #44]	; (4c3c <Console_Process_Rx+0x30>)
    4c10:	781a      	ldrb	r2, [r3, #0]
    4c12:	4b0b      	ldr	r3, [pc, #44]	; (4c40 <Console_Process_Rx+0x34>)
    4c14:	781b      	ldrb	r3, [r3, #0]
    4c16:	429a      	cmp	r2, r3
    4c18:	d00e      	beq.n	4c38 <Console_Process_Rx+0x2c>
    4c1a:	4a0a      	ldr	r2, [pc, #40]	; (4c44 <Console_Process_Rx+0x38>)
    4c1c:	5cd0      	ldrb	r0, [r2, r3]
    4c1e:	f7ff ffa1 	bl	4b64 <console_serialize_json>
    4c22:	4a07      	ldr	r2, [pc, #28]	; (4c40 <Console_Process_Rx+0x34>)
    4c24:	7813      	ldrb	r3, [r2, #0]
    4c26:	3301      	adds	r3, #1
    4c28:	b2db      	uxtb	r3, r3
    4c2a:	7013      	strb	r3, [r2, #0]
    4c2c:	2b0f      	cmp	r3, #15
    4c2e:	d9ee      	bls.n	4c0e <Console_Process_Rx+0x2>
    4c30:	4613      	mov	r3, r2
    4c32:	2200      	movs	r2, #0
    4c34:	701a      	strb	r2, [r3, #0]
    4c36:	e7ea      	b.n	4c0e <Console_Process_Rx+0x2>
    4c38:	bd08      	pop	{r3, pc}
    4c3a:	bf00      	nop
    4c3c:	2000049c 	.word	0x2000049c
    4c40:	2000049d 	.word	0x2000049d
    4c44:	2000048c 	.word	0x2000048c

00004c48 <Console_PhyToJSONV2>:
    4c48:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    4c4c:	b087      	sub	sp, #28
    4c4e:	4605      	mov	r5, r0
    4c50:	2600      	movs	r6, #0
    4c52:	f8ad 6016 	strh.w	r6, [sp, #22]
    4c56:	4c55      	ldr	r4, [pc, #340]	; (4dac <Console_PhyToJSONV2+0x164>)
    4c58:	f44f 7200 	mov.w	r2, #512	; 0x200
    4c5c:	4631      	mov	r1, r6
    4c5e:	4620      	mov	r0, r4
    4c60:	f006 ff69 	bl	bb36 <memset>
    4c64:	f8bd 3016 	ldrh.w	r3, [sp, #22]
    4c68:	1c5a      	adds	r2, r3, #1
    4c6a:	f8ad 2016 	strh.w	r2, [sp, #22]
    4c6e:	227b      	movs	r2, #123	; 0x7b
    4c70:	54e2      	strb	r2, [r4, r3]
    4c72:	f04f 0901 	mov.w	r9, #1
    4c76:	f8cd 9008 	str.w	r9, [sp, #8]
    4c7a:	f8df 8138 	ldr.w	r8, [pc, #312]	; 4db4 <Console_PhyToJSONV2+0x16c>
    4c7e:	f8cd 8004 	str.w	r8, [sp, #4]
    4c82:	2704      	movs	r7, #4
    4c84:	9700      	str	r7, [sp, #0]
    4c86:	782b      	ldrb	r3, [r5, #0]
    4c88:	224c      	movs	r2, #76	; 0x4c
    4c8a:	f10d 0116 	add.w	r1, sp, #22
    4c8e:	4620      	mov	r0, r4
    4c90:	f7ff fd72 	bl	4778 <write_json_parameter>
    4c94:	f8cd 9008 	str.w	r9, [sp, #8]
    4c98:	f8cd 8004 	str.w	r8, [sp, #4]
    4c9c:	9700      	str	r7, [sp, #0]
    4c9e:	f895 3081 	ldrb.w	r3, [r5, #129]	; 0x81
    4ca2:	2251      	movs	r2, #81	; 0x51
    4ca4:	f10d 0116 	add.w	r1, sp, #22
    4ca8:	4620      	mov	r0, r4
    4caa:	f7ff fd65 	bl	4778 <write_json_parameter>
    4cae:	f8cd 9008 	str.w	r9, [sp, #8]
    4cb2:	f8cd 8004 	str.w	r8, [sp, #4]
    4cb6:	9700      	str	r7, [sp, #0]
    4cb8:	f995 3082 	ldrsb.w	r3, [r5, #130]	; 0x82
    4cbc:	2252      	movs	r2, #82	; 0x52
    4cbe:	f10d 0116 	add.w	r1, sp, #22
    4cc2:	4620      	mov	r0, r4
    4cc4:	f7ff fd58 	bl	4778 <write_json_parameter>
    4cc8:	f8cd 9008 	str.w	r9, [sp, #8]
    4ccc:	f8cd 8004 	str.w	r8, [sp, #4]
    4cd0:	9700      	str	r7, [sp, #0]
    4cd2:	f895 3083 	ldrb.w	r3, [r5, #131]	; 0x83
    4cd6:	2243      	movs	r2, #67	; 0x43
    4cd8:	f10d 0116 	add.w	r1, sp, #22
    4cdc:	4620      	mov	r0, r4
    4cde:	f7ff fd4b 	bl	4778 <write_json_parameter>
    4ce2:	f8bd 3016 	ldrh.w	r3, [sp, #22]
    4ce6:	eb03 0209 	add.w	r2, r3, r9
    4cea:	b292      	uxth	r2, r2
    4cec:	f8ad 2016 	strh.w	r2, [sp, #22]
    4cf0:	2122      	movs	r1, #34	; 0x22
    4cf2:	54e1      	strb	r1, [r4, r3]
    4cf4:	eb02 0309 	add.w	r3, r2, r9
    4cf8:	b29b      	uxth	r3, r3
    4cfa:	f8ad 3016 	strh.w	r3, [sp, #22]
    4cfe:	2053      	movs	r0, #83	; 0x53
    4d00:	54a0      	strb	r0, [r4, r2]
    4d02:	eb03 0209 	add.w	r2, r3, r9
    4d06:	b292      	uxth	r2, r2
    4d08:	f8ad 2016 	strh.w	r2, [sp, #22]
    4d0c:	54e1      	strb	r1, [r4, r3]
    4d0e:	eb02 0309 	add.w	r3, r2, r9
    4d12:	b29b      	uxth	r3, r3
    4d14:	f8ad 3016 	strh.w	r3, [sp, #22]
    4d18:	203a      	movs	r0, #58	; 0x3a
    4d1a:	54a0      	strb	r0, [r4, r2]
    4d1c:	eb03 0209 	add.w	r2, r3, r9
    4d20:	f8ad 2016 	strh.w	r2, [sp, #22]
    4d24:	54e1      	strb	r1, [r4, r3]
    4d26:	4631      	mov	r1, r6
    4d28:	e017      	b.n	4d5a <Console_PhyToJSONV2+0x112>
    4d2a:	186b      	adds	r3, r5, r1
    4d2c:	785a      	ldrb	r2, [r3, #1]
    4d2e:	0914      	lsrs	r4, r2, #4
    4d30:	f10c 0301 	add.w	r3, ip, #1
    4d34:	b29b      	uxth	r3, r3
    4d36:	f8ad 3016 	strh.w	r3, [sp, #22]
    4d3a:	481d      	ldr	r0, [pc, #116]	; (4db0 <Console_PhyToJSONV2+0x168>)
    4d3c:	f810 e004 	ldrb.w	lr, [r0, r4]
    4d40:	4c1a      	ldr	r4, [pc, #104]	; (4dac <Console_PhyToJSONV2+0x164>)
    4d42:	f804 e00c 	strb.w	lr, [r4, ip]
    4d46:	f002 020f 	and.w	r2, r2, #15
    4d4a:	f103 0c01 	add.w	ip, r3, #1
    4d4e:	f8ad c016 	strh.w	ip, [sp, #22]
    4d52:	5c82      	ldrb	r2, [r0, r2]
    4d54:	54e2      	strb	r2, [r4, r3]
    4d56:	3101      	adds	r1, #1
    4d58:	b2c9      	uxtb	r1, r1
    4d5a:	782b      	ldrb	r3, [r5, #0]
    4d5c:	428b      	cmp	r3, r1
    4d5e:	d904      	bls.n	4d6a <Console_PhyToJSONV2+0x122>
    4d60:	f8bd c016 	ldrh.w	ip, [sp, #22]
    4d64:	f5bc 7ffb 	cmp.w	ip, #502	; 0x1f6
    4d68:	d9df      	bls.n	4d2a <Console_PhyToJSONV2+0xe2>
    4d6a:	f8bd 2016 	ldrh.w	r2, [sp, #22]
    4d6e:	1c53      	adds	r3, r2, #1
    4d70:	b29b      	uxth	r3, r3
    4d72:	f8ad 3016 	strh.w	r3, [sp, #22]
    4d76:	480d      	ldr	r0, [pc, #52]	; (4dac <Console_PhyToJSONV2+0x164>)
    4d78:	2122      	movs	r1, #34	; 0x22
    4d7a:	5481      	strb	r1, [r0, r2]
    4d7c:	1c5a      	adds	r2, r3, #1
    4d7e:	b292      	uxth	r2, r2
    4d80:	f8ad 2016 	strh.w	r2, [sp, #22]
    4d84:	217d      	movs	r1, #125	; 0x7d
    4d86:	54c1      	strb	r1, [r0, r3]
    4d88:	1c53      	adds	r3, r2, #1
    4d8a:	b29b      	uxth	r3, r3
    4d8c:	f8ad 3016 	strh.w	r3, [sp, #22]
    4d90:	210a      	movs	r1, #10
    4d92:	5481      	strb	r1, [r0, r2]
    4d94:	1c59      	adds	r1, r3, #1
    4d96:	b289      	uxth	r1, r1
    4d98:	f8ad 1016 	strh.w	r1, [sp, #22]
    4d9c:	220d      	movs	r2, #13
    4d9e:	54c2      	strb	r2, [r0, r3]
    4da0:	f7ff ff14 	bl	4bcc <Console_Write>
    4da4:	b007      	add	sp, #28
    4da6:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    4daa:	bf00      	nop
    4dac:	2000028c 	.word	0x2000028c
    4db0:	0000bccc 	.word	0x0000bccc
    4db4:	0000bcc8 	.word	0x0000bcc8

00004db8 <_out_buffer>:
    4db8:	429a      	cmp	r2, r3
    4dba:	d200      	bcs.n	4dbe <_out_buffer+0x6>
    4dbc:	5488      	strb	r0, [r1, r2]
    4dbe:	4770      	bx	lr

00004dc0 <_out_null>:
    4dc0:	4770      	bx	lr

00004dc2 <_atoi>:
    4dc2:	4601      	mov	r1, r0
    4dc4:	2000      	movs	r0, #0
    4dc6:	e007      	b.n	4dd8 <_atoi+0x16>
    4dc8:	eb00 0080 	add.w	r0, r0, r0, lsl #2
    4dcc:	1c53      	adds	r3, r2, #1
    4dce:	600b      	str	r3, [r1, #0]
    4dd0:	7813      	ldrb	r3, [r2, #0]
    4dd2:	eb03 0040 	add.w	r0, r3, r0, lsl #1
    4dd6:	3830      	subs	r0, #48	; 0x30
    4dd8:	680a      	ldr	r2, [r1, #0]
    4dda:	7813      	ldrb	r3, [r2, #0]
    4ddc:	3b30      	subs	r3, #48	; 0x30
    4dde:	b2db      	uxtb	r3, r3
    4de0:	2b09      	cmp	r3, #9
    4de2:	d9f1      	bls.n	4dc8 <_atoi+0x6>
    4de4:	4770      	bx	lr

00004de6 <_out_rev>:
    4de6:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    4dea:	b083      	sub	sp, #12
    4dec:	4605      	mov	r5, r0
    4dee:	460e      	mov	r6, r1
    4df0:	4693      	mov	fp, r2
    4df2:	461f      	mov	r7, r3
    4df4:	f8dd a030 	ldr.w	sl, [sp, #48]	; 0x30
    4df8:	9c0d      	ldr	r4, [sp, #52]	; 0x34
    4dfa:	f8dd 9038 	ldr.w	r9, [sp, #56]	; 0x38
    4dfe:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
    4e00:	f013 0f03 	tst.w	r3, #3
    4e04:	d119      	bne.n	4e3a <_out_rev+0x54>
    4e06:	46a0      	mov	r8, r4
    4e08:	9201      	str	r2, [sp, #4]
    4e0a:	45c8      	cmp	r8, r9
    4e0c:	d209      	bcs.n	4e22 <_out_rev+0x3c>
    4e0e:	f102 0b01 	add.w	fp, r2, #1
    4e12:	463b      	mov	r3, r7
    4e14:	4631      	mov	r1, r6
    4e16:	2020      	movs	r0, #32
    4e18:	47a8      	blx	r5
    4e1a:	f108 0801 	add.w	r8, r8, #1
    4e1e:	465a      	mov	r2, fp
    4e20:	e7f3      	b.n	4e0a <_out_rev+0x24>
    4e22:	f8dd b004 	ldr.w	fp, [sp, #4]
    4e26:	e008      	b.n	4e3a <_out_rev+0x54>
    4e28:	3c01      	subs	r4, #1
    4e2a:	f102 0801 	add.w	r8, r2, #1
    4e2e:	463b      	mov	r3, r7
    4e30:	4631      	mov	r1, r6
    4e32:	f81a 0004 	ldrb.w	r0, [sl, r4]
    4e36:	47a8      	blx	r5
    4e38:	4642      	mov	r2, r8
    4e3a:	2c00      	cmp	r4, #0
    4e3c:	d1f4      	bne.n	4e28 <_out_rev+0x42>
    4e3e:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
    4e40:	f013 0f02 	tst.w	r3, #2
    4e44:	d103      	bne.n	4e4e <_out_rev+0x68>
    4e46:	4610      	mov	r0, r2
    4e48:	b003      	add	sp, #12
    4e4a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4e4e:	eba2 030b 	sub.w	r3, r2, fp
    4e52:	454b      	cmp	r3, r9
    4e54:	d2f7      	bcs.n	4e46 <_out_rev+0x60>
    4e56:	1c54      	adds	r4, r2, #1
    4e58:	463b      	mov	r3, r7
    4e5a:	4631      	mov	r1, r6
    4e5c:	2020      	movs	r0, #32
    4e5e:	47a8      	blx	r5
    4e60:	4622      	mov	r2, r4
    4e62:	e7f4      	b.n	4e4e <_out_rev+0x68>

00004e64 <_ntoa_format>:
    4e64:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    4e68:	b085      	sub	sp, #20
    4e6a:	9d0c      	ldr	r5, [sp, #48]	; 0x30
    4e6c:	9c0d      	ldr	r4, [sp, #52]	; 0x34
    4e6e:	f89d 9038 	ldrb.w	r9, [sp, #56]	; 0x38
    4e72:	f8dd 803c 	ldr.w	r8, [sp, #60]	; 0x3c
    4e76:	f8dd e040 	ldr.w	lr, [sp, #64]	; 0x40
    4e7a:	9f11      	ldr	r7, [sp, #68]	; 0x44
    4e7c:	9e12      	ldr	r6, [sp, #72]	; 0x48
    4e7e:	f016 0f02 	tst.w	r6, #2
    4e82:	d121      	bne.n	4ec8 <_ntoa_format+0x64>
    4e84:	b17f      	cbz	r7, 4ea6 <_ntoa_format+0x42>
    4e86:	f016 0f01 	tst.w	r6, #1
    4e8a:	d00c      	beq.n	4ea6 <_ntoa_format+0x42>
    4e8c:	f1b9 0f00 	cmp.w	r9, #0
    4e90:	d102      	bne.n	4e98 <_ntoa_format+0x34>
    4e92:	f016 0f0c 	tst.w	r6, #12
    4e96:	d006      	beq.n	4ea6 <_ntoa_format+0x42>
    4e98:	3f01      	subs	r7, #1
    4e9a:	e004      	b.n	4ea6 <_ntoa_format+0x42>
    4e9c:	f04f 0c30 	mov.w	ip, #48	; 0x30
    4ea0:	f805 c004 	strb.w	ip, [r5, r4]
    4ea4:	3401      	adds	r4, #1
    4ea6:	4574      	cmp	r4, lr
    4ea8:	d201      	bcs.n	4eae <_ntoa_format+0x4a>
    4eaa:	2c1f      	cmp	r4, #31
    4eac:	d9f6      	bls.n	4e9c <_ntoa_format+0x38>
    4eae:	f016 0f01 	tst.w	r6, #1
    4eb2:	d009      	beq.n	4ec8 <_ntoa_format+0x64>
    4eb4:	42bc      	cmp	r4, r7
    4eb6:	d207      	bcs.n	4ec8 <_ntoa_format+0x64>
    4eb8:	2c1f      	cmp	r4, #31
    4eba:	d805      	bhi.n	4ec8 <_ntoa_format+0x64>
    4ebc:	f04f 0c30 	mov.w	ip, #48	; 0x30
    4ec0:	f805 c004 	strb.w	ip, [r5, r4]
    4ec4:	3401      	adds	r4, #1
    4ec6:	e7f2      	b.n	4eae <_ntoa_format+0x4a>
    4ec8:	f016 0f10 	tst.w	r6, #16
    4ecc:	d017      	beq.n	4efe <_ntoa_format+0x9a>
    4ece:	f416 6f80 	tst.w	r6, #1024	; 0x400
    4ed2:	d104      	bne.n	4ede <_ntoa_format+0x7a>
    4ed4:	b11c      	cbz	r4, 4ede <_ntoa_format+0x7a>
    4ed6:	4574      	cmp	r4, lr
    4ed8:	d024      	beq.n	4f24 <_ntoa_format+0xc0>
    4eda:	42bc      	cmp	r4, r7
    4edc:	d022      	beq.n	4f24 <_ntoa_format+0xc0>
    4ede:	f1b8 0f10 	cmp.w	r8, #16
    4ee2:	d02b      	beq.n	4f3c <_ntoa_format+0xd8>
    4ee4:	f1b8 0f10 	cmp.w	r8, #16
    4ee8:	d033      	beq.n	4f52 <_ntoa_format+0xee>
    4eea:	f1b8 0f02 	cmp.w	r8, #2
    4eee:	d03b      	beq.n	4f68 <_ntoa_format+0x104>
    4ef0:	2c1f      	cmp	r4, #31
    4ef2:	d804      	bhi.n	4efe <_ntoa_format+0x9a>
    4ef4:	f04f 0c30 	mov.w	ip, #48	; 0x30
    4ef8:	f805 c004 	strb.w	ip, [r5, r4]
    4efc:	3401      	adds	r4, #1
    4efe:	2c1f      	cmp	r4, #31
    4f00:	d807      	bhi.n	4f12 <_ntoa_format+0xae>
    4f02:	f1b9 0f00 	cmp.w	r9, #0
    4f06:	d037      	beq.n	4f78 <_ntoa_format+0x114>
    4f08:	f04f 0c2d 	mov.w	ip, #45	; 0x2d
    4f0c:	f805 c004 	strb.w	ip, [r5, r4]
    4f10:	3401      	adds	r4, #1
    4f12:	9603      	str	r6, [sp, #12]
    4f14:	9702      	str	r7, [sp, #8]
    4f16:	9401      	str	r4, [sp, #4]
    4f18:	9500      	str	r5, [sp, #0]
    4f1a:	f7ff ff64 	bl	4de6 <_out_rev>
    4f1e:	b005      	add	sp, #20
    4f20:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    4f24:	f1b4 0c01 	subs.w	ip, r4, #1
    4f28:	d006      	beq.n	4f38 <_ntoa_format+0xd4>
    4f2a:	f1b8 0f10 	cmp.w	r8, #16
    4f2e:	d001      	beq.n	4f34 <_ntoa_format+0xd0>
    4f30:	4664      	mov	r4, ip
    4f32:	e7d4      	b.n	4ede <_ntoa_format+0x7a>
    4f34:	3c02      	subs	r4, #2
    4f36:	e7d2      	b.n	4ede <_ntoa_format+0x7a>
    4f38:	4664      	mov	r4, ip
    4f3a:	e7d0      	b.n	4ede <_ntoa_format+0x7a>
    4f3c:	f016 0f20 	tst.w	r6, #32
    4f40:	d1d0      	bne.n	4ee4 <_ntoa_format+0x80>
    4f42:	2c1f      	cmp	r4, #31
    4f44:	d8ce      	bhi.n	4ee4 <_ntoa_format+0x80>
    4f46:	f04f 0c78 	mov.w	ip, #120	; 0x78
    4f4a:	f805 c004 	strb.w	ip, [r5, r4]
    4f4e:	3401      	adds	r4, #1
    4f50:	e7ce      	b.n	4ef0 <_ntoa_format+0x8c>
    4f52:	f016 0f20 	tst.w	r6, #32
    4f56:	d0c8      	beq.n	4eea <_ntoa_format+0x86>
    4f58:	2c1f      	cmp	r4, #31
    4f5a:	d8c6      	bhi.n	4eea <_ntoa_format+0x86>
    4f5c:	f04f 0c58 	mov.w	ip, #88	; 0x58
    4f60:	f805 c004 	strb.w	ip, [r5, r4]
    4f64:	3401      	adds	r4, #1
    4f66:	e7c3      	b.n	4ef0 <_ntoa_format+0x8c>
    4f68:	2c1f      	cmp	r4, #31
    4f6a:	d8c1      	bhi.n	4ef0 <_ntoa_format+0x8c>
    4f6c:	f04f 0c62 	mov.w	ip, #98	; 0x62
    4f70:	f805 c004 	strb.w	ip, [r5, r4]
    4f74:	3401      	adds	r4, #1
    4f76:	e7bb      	b.n	4ef0 <_ntoa_format+0x8c>
    4f78:	f016 0f04 	tst.w	r6, #4
    4f7c:	d005      	beq.n	4f8a <_ntoa_format+0x126>
    4f7e:	f04f 0c2b 	mov.w	ip, #43	; 0x2b
    4f82:	f805 c004 	strb.w	ip, [r5, r4]
    4f86:	3401      	adds	r4, #1
    4f88:	e7c3      	b.n	4f12 <_ntoa_format+0xae>
    4f8a:	f016 0f08 	tst.w	r6, #8
    4f8e:	d0c0      	beq.n	4f12 <_ntoa_format+0xae>
    4f90:	f04f 0c20 	mov.w	ip, #32
    4f94:	f805 c004 	strb.w	ip, [r5, r4]
    4f98:	3401      	adds	r4, #1
    4f9a:	e7ba      	b.n	4f12 <_ntoa_format+0xae>

00004f9c <_ntoa_long>:
    4f9c:	b5f0      	push	{r4, r5, r6, r7, lr}
    4f9e:	b091      	sub	sp, #68	; 0x44
    4fa0:	9c16      	ldr	r4, [sp, #88]	; 0x58
    4fa2:	9d18      	ldr	r5, [sp, #96]	; 0x60
    4fa4:	9e1b      	ldr	r6, [sp, #108]	; 0x6c
    4fa6:	b90c      	cbnz	r4, 4fac <_ntoa_long+0x10>
    4fa8:	f026 0610 	bic.w	r6, r6, #16
    4fac:	f416 6e80 	ands.w	lr, r6, #1024	; 0x400
    4fb0:	d016      	beq.n	4fe0 <_ntoa_long+0x44>
    4fb2:	b364      	cbz	r4, 500e <_ntoa_long+0x72>
    4fb4:	f04f 0e00 	mov.w	lr, #0
    4fb8:	e012      	b.n	4fe0 <_ntoa_long+0x44>
    4fba:	f10c 0c30 	add.w	ip, ip, #48	; 0x30
    4fbe:	fa5f fc8c 	uxtb.w	ip, ip
    4fc2:	f10e 0701 	add.w	r7, lr, #1
    4fc6:	f10e 0e40 	add.w	lr, lr, #64	; 0x40
    4fca:	44ee      	add	lr, sp
    4fcc:	f80e cc20 	strb.w	ip, [lr, #-32]
    4fd0:	fbb4 fcf5 	udiv	ip, r4, r5
    4fd4:	42ac      	cmp	r4, r5
    4fd6:	d31b      	bcc.n	5010 <_ntoa_long+0x74>
    4fd8:	2f1f      	cmp	r7, #31
    4fda:	d819      	bhi.n	5010 <_ntoa_long+0x74>
    4fdc:	46be      	mov	lr, r7
    4fde:	4664      	mov	r4, ip
    4fe0:	fbb4 fcf5 	udiv	ip, r4, r5
    4fe4:	fb05 4c1c 	mls	ip, r5, ip, r4
    4fe8:	fa5f fc8c 	uxtb.w	ip, ip
    4fec:	f1bc 0f09 	cmp.w	ip, #9
    4ff0:	d9e3      	bls.n	4fba <_ntoa_long+0x1e>
    4ff2:	f016 0f20 	tst.w	r6, #32
    4ff6:	d008      	beq.n	500a <_ntoa_long+0x6e>
    4ff8:	2741      	movs	r7, #65	; 0x41
    4ffa:	44bc      	add	ip, r7
    4ffc:	fa5f fc8c 	uxtb.w	ip, ip
    5000:	f1ac 0c0a 	sub.w	ip, ip, #10
    5004:	fa5f fc8c 	uxtb.w	ip, ip
    5008:	e7db      	b.n	4fc2 <_ntoa_long+0x26>
    500a:	2761      	movs	r7, #97	; 0x61
    500c:	e7f5      	b.n	4ffa <_ntoa_long+0x5e>
    500e:	4627      	mov	r7, r4
    5010:	9606      	str	r6, [sp, #24]
    5012:	9c1a      	ldr	r4, [sp, #104]	; 0x68
    5014:	9405      	str	r4, [sp, #20]
    5016:	9c19      	ldr	r4, [sp, #100]	; 0x64
    5018:	9404      	str	r4, [sp, #16]
    501a:	9503      	str	r5, [sp, #12]
    501c:	f89d 405c 	ldrb.w	r4, [sp, #92]	; 0x5c
    5020:	9402      	str	r4, [sp, #8]
    5022:	9701      	str	r7, [sp, #4]
    5024:	ac08      	add	r4, sp, #32
    5026:	9400      	str	r4, [sp, #0]
    5028:	f7ff ff1c 	bl	4e64 <_ntoa_format>
    502c:	b011      	add	sp, #68	; 0x44
    502e:	bdf0      	pop	{r4, r5, r6, r7, pc}

00005030 <_ntoa_long_long>:
    5030:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    5034:	b095      	sub	sp, #84	; 0x54
    5036:	9009      	str	r0, [sp, #36]	; 0x24
    5038:	910a      	str	r1, [sp, #40]	; 0x28
    503a:	920b      	str	r2, [sp, #44]	; 0x2c
    503c:	469b      	mov	fp, r3
    503e:	9d1e      	ldr	r5, [sp, #120]	; 0x78
    5040:	9e1f      	ldr	r6, [sp, #124]	; 0x7c
    5042:	9f22      	ldr	r7, [sp, #136]	; 0x88
    5044:	f8dd 808c 	ldr.w	r8, [sp, #140]	; 0x8c
    5048:	f8dd a098 	ldr.w	sl, [sp, #152]	; 0x98
    504c:	ea55 0306 	orrs.w	r3, r5, r6
    5050:	d101      	bne.n	5056 <_ntoa_long_long+0x26>
    5052:	f02a 0a10 	bic.w	sl, sl, #16
    5056:	f41a 6480 	ands.w	r4, sl, #1024	; 0x400
    505a:	d01f      	beq.n	509c <_ntoa_long_long+0x6c>
    505c:	ea55 0306 	orrs.w	r3, r5, r6
    5060:	d030      	beq.n	50c4 <_ntoa_long_long+0x94>
    5062:	2400      	movs	r4, #0
    5064:	e01a      	b.n	509c <_ntoa_long_long+0x6c>
    5066:	f103 0230 	add.w	r2, r3, #48	; 0x30
    506a:	b2d2      	uxtb	r2, r2
    506c:	f104 0901 	add.w	r9, r4, #1
    5070:	f104 0350 	add.w	r3, r4, #80	; 0x50
    5074:	eb0d 0403 	add.w	r4, sp, r3
    5078:	f804 2c20 	strb.w	r2, [r4, #-32]
    507c:	463a      	mov	r2, r7
    507e:	4643      	mov	r3, r8
    5080:	4628      	mov	r0, r5
    5082:	4631      	mov	r1, r6
    5084:	f006 fbba 	bl	b7fc <__aeabi_uldivmod>
    5088:	42bd      	cmp	r5, r7
    508a:	eb76 0308 	sbcs.w	r3, r6, r8
    508e:	d31b      	bcc.n	50c8 <_ntoa_long_long+0x98>
    5090:	f1b9 0f1f 	cmp.w	r9, #31
    5094:	d818      	bhi.n	50c8 <_ntoa_long_long+0x98>
    5096:	464c      	mov	r4, r9
    5098:	4605      	mov	r5, r0
    509a:	460e      	mov	r6, r1
    509c:	463a      	mov	r2, r7
    509e:	4643      	mov	r3, r8
    50a0:	4628      	mov	r0, r5
    50a2:	4631      	mov	r1, r6
    50a4:	f006 fbaa 	bl	b7fc <__aeabi_uldivmod>
    50a8:	b2d3      	uxtb	r3, r2
    50aa:	2b09      	cmp	r3, #9
    50ac:	d9db      	bls.n	5066 <_ntoa_long_long+0x36>
    50ae:	f01a 0f20 	tst.w	sl, #32
    50b2:	d005      	beq.n	50c0 <_ntoa_long_long+0x90>
    50b4:	2241      	movs	r2, #65	; 0x41
    50b6:	441a      	add	r2, r3
    50b8:	b2d2      	uxtb	r2, r2
    50ba:	3a0a      	subs	r2, #10
    50bc:	b2d2      	uxtb	r2, r2
    50be:	e7d5      	b.n	506c <_ntoa_long_long+0x3c>
    50c0:	2261      	movs	r2, #97	; 0x61
    50c2:	e7f8      	b.n	50b6 <_ntoa_long_long+0x86>
    50c4:	f04f 0900 	mov.w	r9, #0
    50c8:	f8cd a018 	str.w	sl, [sp, #24]
    50cc:	9b25      	ldr	r3, [sp, #148]	; 0x94
    50ce:	9305      	str	r3, [sp, #20]
    50d0:	9b24      	ldr	r3, [sp, #144]	; 0x90
    50d2:	9304      	str	r3, [sp, #16]
    50d4:	9703      	str	r7, [sp, #12]
    50d6:	f89d 3080 	ldrb.w	r3, [sp, #128]	; 0x80
    50da:	9302      	str	r3, [sp, #8]
    50dc:	f8cd 9004 	str.w	r9, [sp, #4]
    50e0:	ab0c      	add	r3, sp, #48	; 0x30
    50e2:	9300      	str	r3, [sp, #0]
    50e4:	465b      	mov	r3, fp
    50e6:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
    50e8:	990a      	ldr	r1, [sp, #40]	; 0x28
    50ea:	9809      	ldr	r0, [sp, #36]	; 0x24
    50ec:	f7ff feba 	bl	4e64 <_ntoa_format>
    50f0:	b015      	add	sp, #84	; 0x54
    50f2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	...

000050f8 <_vsnprintf>:
    50f8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    50fc:	b08f      	sub	sp, #60	; 0x3c
    50fe:	4607      	mov	r7, r0
    5100:	4616      	mov	r6, r2
    5102:	930d      	str	r3, [sp, #52]	; 0x34
    5104:	468b      	mov	fp, r1
    5106:	2900      	cmp	r1, #0
    5108:	f000 82d8 	beq.w	56bc <_vsnprintf+0x5c4>
    510c:	2400      	movs	r4, #0
    510e:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    5110:	7818      	ldrb	r0, [r3, #0]
    5112:	2800      	cmp	r0, #0
    5114:	f000 82d4 	beq.w	56c0 <_vsnprintf+0x5c8>
    5118:	2825      	cmp	r0, #37	; 0x25
    511a:	d009      	beq.n	5130 <_vsnprintf+0x38>
    511c:	1c65      	adds	r5, r4, #1
    511e:	4633      	mov	r3, r6
    5120:	4622      	mov	r2, r4
    5122:	4659      	mov	r1, fp
    5124:	47b8      	blx	r7
    5126:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    5128:	3301      	adds	r3, #1
    512a:	930d      	str	r3, [sp, #52]	; 0x34
    512c:	462c      	mov	r4, r5
    512e:	e7ee      	b.n	510e <_vsnprintf+0x16>
    5130:	3301      	adds	r3, #1
    5132:	930d      	str	r3, [sp, #52]	; 0x34
    5134:	2500      	movs	r5, #0
    5136:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    5138:	7819      	ldrb	r1, [r3, #0]
    513a:	f1a1 0220 	sub.w	r2, r1, #32
    513e:	2a10      	cmp	r2, #16
    5140:	d80a      	bhi.n	5158 <_vsnprintf+0x60>
    5142:	e8df f002 	tbb	[pc, r2]
    5146:	0938      	.short	0x0938
    5148:	09093d09 	.word	0x09093d09
    514c:	09090909 	.word	0x09090909
    5150:	2e093309 	.word	0x2e093309
    5154:	0909      	.short	0x0909
    5156:	29          	.byte	0x29
    5157:	00          	.byte	0x00
    5158:	f1a1 0330 	sub.w	r3, r1, #48	; 0x30
    515c:	b2db      	uxtb	r3, r3
    515e:	2b09      	cmp	r3, #9
    5160:	d933      	bls.n	51ca <_vsnprintf+0xd2>
    5162:	292a      	cmp	r1, #42	; 0x2a
    5164:	d036      	beq.n	51d4 <_vsnprintf+0xdc>
    5166:	2300      	movs	r3, #0
    5168:	930a      	str	r3, [sp, #40]	; 0x28
    516a:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    516c:	781a      	ldrb	r2, [r3, #0]
    516e:	2a2e      	cmp	r2, #46	; 0x2e
    5170:	d040      	beq.n	51f4 <_vsnprintf+0xfc>
    5172:	f04f 0a00 	mov.w	sl, #0
    5176:	9a0d      	ldr	r2, [sp, #52]	; 0x34
    5178:	7813      	ldrb	r3, [r2, #0]
    517a:	3b68      	subs	r3, #104	; 0x68
    517c:	2b12      	cmp	r3, #18
    517e:	d877      	bhi.n	5270 <_vsnprintf+0x178>
    5180:	e8df f003 	tbb	[pc, r3]
    5184:	76727664 	.word	0x76727664
    5188:	76767656 	.word	0x76767656
    518c:	76767676 	.word	0x76767676
    5190:	76767676 	.word	0x76767676
    5194:	7676      	.short	0x7676
    5196:	d3          	.byte	0xd3
    5197:	00          	.byte	0x00
    5198:	f045 0501 	orr.w	r5, r5, #1
    519c:	3301      	adds	r3, #1
    519e:	930d      	str	r3, [sp, #52]	; 0x34
    51a0:	e7c9      	b.n	5136 <_vsnprintf+0x3e>
    51a2:	f045 0502 	orr.w	r5, r5, #2
    51a6:	3301      	adds	r3, #1
    51a8:	930d      	str	r3, [sp, #52]	; 0x34
    51aa:	e7c4      	b.n	5136 <_vsnprintf+0x3e>
    51ac:	f045 0504 	orr.w	r5, r5, #4
    51b0:	3301      	adds	r3, #1
    51b2:	930d      	str	r3, [sp, #52]	; 0x34
    51b4:	e7bf      	b.n	5136 <_vsnprintf+0x3e>
    51b6:	f045 0508 	orr.w	r5, r5, #8
    51ba:	3301      	adds	r3, #1
    51bc:	930d      	str	r3, [sp, #52]	; 0x34
    51be:	e7ba      	b.n	5136 <_vsnprintf+0x3e>
    51c0:	f045 0510 	orr.w	r5, r5, #16
    51c4:	3301      	adds	r3, #1
    51c6:	930d      	str	r3, [sp, #52]	; 0x34
    51c8:	e7b5      	b.n	5136 <_vsnprintf+0x3e>
    51ca:	a80d      	add	r0, sp, #52	; 0x34
    51cc:	f7ff fdf9 	bl	4dc2 <_atoi>
    51d0:	900a      	str	r0, [sp, #40]	; 0x28
    51d2:	e7ca      	b.n	516a <_vsnprintf+0x72>
    51d4:	9b18      	ldr	r3, [sp, #96]	; 0x60
    51d6:	1d1a      	adds	r2, r3, #4
    51d8:	9218      	str	r2, [sp, #96]	; 0x60
    51da:	6818      	ldr	r0, [r3, #0]
    51dc:	2800      	cmp	r0, #0
    51de:	db04      	blt.n	51ea <_vsnprintf+0xf2>
    51e0:	900a      	str	r0, [sp, #40]	; 0x28
    51e2:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    51e4:	3301      	adds	r3, #1
    51e6:	930d      	str	r3, [sp, #52]	; 0x34
    51e8:	e7bf      	b.n	516a <_vsnprintf+0x72>
    51ea:	f045 0502 	orr.w	r5, r5, #2
    51ee:	4243      	negs	r3, r0
    51f0:	930a      	str	r3, [sp, #40]	; 0x28
    51f2:	e7f6      	b.n	51e2 <_vsnprintf+0xea>
    51f4:	f445 6580 	orr.w	r5, r5, #1024	; 0x400
    51f8:	1c5a      	adds	r2, r3, #1
    51fa:	920d      	str	r2, [sp, #52]	; 0x34
    51fc:	785a      	ldrb	r2, [r3, #1]
    51fe:	f1a2 0330 	sub.w	r3, r2, #48	; 0x30
    5202:	b2db      	uxtb	r3, r3
    5204:	2b09      	cmp	r3, #9
    5206:	d904      	bls.n	5212 <_vsnprintf+0x11a>
    5208:	2a2a      	cmp	r2, #42	; 0x2a
    520a:	d007      	beq.n	521c <_vsnprintf+0x124>
    520c:	f04f 0a00 	mov.w	sl, #0
    5210:	e7b1      	b.n	5176 <_vsnprintf+0x7e>
    5212:	a80d      	add	r0, sp, #52	; 0x34
    5214:	f7ff fdd5 	bl	4dc2 <_atoi>
    5218:	4682      	mov	sl, r0
    521a:	e7ac      	b.n	5176 <_vsnprintf+0x7e>
    521c:	9b18      	ldr	r3, [sp, #96]	; 0x60
    521e:	1d1a      	adds	r2, r3, #4
    5220:	9218      	str	r2, [sp, #96]	; 0x60
    5222:	681b      	ldr	r3, [r3, #0]
    5224:	ea23 7ae3 	bic.w	sl, r3, r3, asr #31
    5228:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    522a:	3301      	adds	r3, #1
    522c:	930d      	str	r3, [sp, #52]	; 0x34
    522e:	e7a2      	b.n	5176 <_vsnprintf+0x7e>
    5230:	f445 7180 	orr.w	r1, r5, #256	; 0x100
    5234:	1c53      	adds	r3, r2, #1
    5236:	930d      	str	r3, [sp, #52]	; 0x34
    5238:	7852      	ldrb	r2, [r2, #1]
    523a:	2a6c      	cmp	r2, #108	; 0x6c
    523c:	d001      	beq.n	5242 <_vsnprintf+0x14a>
    523e:	460d      	mov	r5, r1
    5240:	e016      	b.n	5270 <_vsnprintf+0x178>
    5242:	f445 7540 	orr.w	r5, r5, #768	; 0x300
    5246:	3301      	adds	r3, #1
    5248:	930d      	str	r3, [sp, #52]	; 0x34
    524a:	e011      	b.n	5270 <_vsnprintf+0x178>
    524c:	f045 0180 	orr.w	r1, r5, #128	; 0x80
    5250:	1c53      	adds	r3, r2, #1
    5252:	930d      	str	r3, [sp, #52]	; 0x34
    5254:	7852      	ldrb	r2, [r2, #1]
    5256:	2a68      	cmp	r2, #104	; 0x68
    5258:	d001      	beq.n	525e <_vsnprintf+0x166>
    525a:	460d      	mov	r5, r1
    525c:	e008      	b.n	5270 <_vsnprintf+0x178>
    525e:	f045 05c0 	orr.w	r5, r5, #192	; 0xc0
    5262:	3301      	adds	r3, #1
    5264:	930d      	str	r3, [sp, #52]	; 0x34
    5266:	e003      	b.n	5270 <_vsnprintf+0x178>
    5268:	f445 7500 	orr.w	r5, r5, #512	; 0x200
    526c:	3201      	adds	r2, #1
    526e:	920d      	str	r2, [sp, #52]	; 0x34
    5270:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    5272:	7818      	ldrb	r0, [r3, #0]
    5274:	f1a0 0325 	sub.w	r3, r0, #37	; 0x25
    5278:	2b53      	cmp	r3, #83	; 0x53
    527a:	f200 8215 	bhi.w	56a8 <_vsnprintf+0x5b0>
    527e:	e8df f013 	tbh	[pc, r3, lsl #1]
    5282:	0208      	.short	0x0208
    5284:	02130213 	.word	0x02130213
    5288:	02130213 	.word	0x02130213
    528c:	02130213 	.word	0x02130213
    5290:	02130213 	.word	0x02130213
    5294:	02130213 	.word	0x02130213
    5298:	02130213 	.word	0x02130213
    529c:	02130213 	.word	0x02130213
    52a0:	02130213 	.word	0x02130213
    52a4:	02130213 	.word	0x02130213
    52a8:	02130213 	.word	0x02130213
    52ac:	02130213 	.word	0x02130213
    52b0:	02130213 	.word	0x02130213
    52b4:	02130213 	.word	0x02130213
    52b8:	02130213 	.word	0x02130213
    52bc:	02130213 	.word	0x02130213
    52c0:	02130213 	.word	0x02130213
    52c4:	02130213 	.word	0x02130213
    52c8:	02130213 	.word	0x02130213
    52cc:	02130213 	.word	0x02130213
    52d0:	02130213 	.word	0x02130213
    52d4:	02130213 	.word	0x02130213
    52d8:	02130213 	.word	0x02130213
    52dc:	02130213 	.word	0x02130213
    52e0:	02130213 	.word	0x02130213
    52e4:	02130213 	.word	0x02130213
    52e8:	02130059 	.word	0x02130059
    52ec:	02130213 	.word	0x02130213
    52f0:	02130213 	.word	0x02130213
    52f4:	02130213 	.word	0x02130213
    52f8:	02130213 	.word	0x02130213
    52fc:	014f0059 	.word	0x014f0059
    5300:	02130059 	.word	0x02130059
    5304:	02130213 	.word	0x02130213
    5308:	00590213 	.word	0x00590213
    530c:	02130213 	.word	0x02130213
    5310:	02130213 	.word	0x02130213
    5314:	00590213 	.word	0x00590213
    5318:	021301ed 	.word	0x021301ed
    531c:	01880213 	.word	0x01880213
    5320:	00590213 	.word	0x00590213
    5324:	02130213 	.word	0x02130213
    5328:	0059      	.short	0x0059
    532a:	f445 7580 	orr.w	r5, r5, #256	; 0x100
    532e:	3201      	adds	r2, #1
    5330:	920d      	str	r2, [sp, #52]	; 0x34
    5332:	e79d      	b.n	5270 <_vsnprintf+0x178>
    5334:	2878      	cmp	r0, #120	; 0x78
    5336:	d009      	beq.n	534c <_vsnprintf+0x254>
    5338:	2858      	cmp	r0, #88	; 0x58
    533a:	d03a      	beq.n	53b2 <_vsnprintf+0x2ba>
    533c:	286f      	cmp	r0, #111	; 0x6f
    533e:	d03a      	beq.n	53b6 <_vsnprintf+0x2be>
    5340:	2862      	cmp	r0, #98	; 0x62
    5342:	d03a      	beq.n	53ba <_vsnprintf+0x2c2>
    5344:	f025 0510 	bic.w	r5, r5, #16
    5348:	230a      	movs	r3, #10
    534a:	e000      	b.n	534e <_vsnprintf+0x256>
    534c:	2310      	movs	r3, #16
    534e:	2858      	cmp	r0, #88	; 0x58
    5350:	d035      	beq.n	53be <_vsnprintf+0x2c6>
    5352:	2869      	cmp	r0, #105	; 0x69
    5354:	d003      	beq.n	535e <_vsnprintf+0x266>
    5356:	2864      	cmp	r0, #100	; 0x64
    5358:	d001      	beq.n	535e <_vsnprintf+0x266>
    535a:	f025 050c 	bic.w	r5, r5, #12
    535e:	f415 6f80 	tst.w	r5, #1024	; 0x400
    5362:	d001      	beq.n	5368 <_vsnprintf+0x270>
    5364:	f025 0501 	bic.w	r5, r5, #1
    5368:	2869      	cmp	r0, #105	; 0x69
    536a:	d02b      	beq.n	53c4 <_vsnprintf+0x2cc>
    536c:	2864      	cmp	r0, #100	; 0x64
    536e:	d029      	beq.n	53c4 <_vsnprintf+0x2cc>
    5370:	f415 7f00 	tst.w	r5, #512	; 0x200
    5374:	f040 8096 	bne.w	54a4 <_vsnprintf+0x3ac>
    5378:	f415 7f80 	tst.w	r5, #256	; 0x100
    537c:	f040 80ae 	bne.w	54dc <_vsnprintf+0x3e4>
    5380:	f015 0f40 	tst.w	r5, #64	; 0x40
    5384:	f000 80bf 	beq.w	5506 <_vsnprintf+0x40e>
    5388:	9a18      	ldr	r2, [sp, #96]	; 0x60
    538a:	1d11      	adds	r1, r2, #4
    538c:	9118      	str	r1, [sp, #96]	; 0x60
    538e:	7812      	ldrb	r2, [r2, #0]
    5390:	9505      	str	r5, [sp, #20]
    5392:	990a      	ldr	r1, [sp, #40]	; 0x28
    5394:	9104      	str	r1, [sp, #16]
    5396:	f8cd a00c 	str.w	sl, [sp, #12]
    539a:	9302      	str	r3, [sp, #8]
    539c:	2300      	movs	r3, #0
    539e:	9301      	str	r3, [sp, #4]
    53a0:	9200      	str	r2, [sp, #0]
    53a2:	4633      	mov	r3, r6
    53a4:	4622      	mov	r2, r4
    53a6:	4659      	mov	r1, fp
    53a8:	4638      	mov	r0, r7
    53aa:	f7ff fdf7 	bl	4f9c <_ntoa_long>
    53ae:	4604      	mov	r4, r0
    53b0:	e029      	b.n	5406 <_vsnprintf+0x30e>
    53b2:	2310      	movs	r3, #16
    53b4:	e7cb      	b.n	534e <_vsnprintf+0x256>
    53b6:	2308      	movs	r3, #8
    53b8:	e7c9      	b.n	534e <_vsnprintf+0x256>
    53ba:	2302      	movs	r3, #2
    53bc:	e7c7      	b.n	534e <_vsnprintf+0x256>
    53be:	f045 0520 	orr.w	r5, r5, #32
    53c2:	e7c6      	b.n	5352 <_vsnprintf+0x25a>
    53c4:	f415 7f00 	tst.w	r5, #512	; 0x200
    53c8:	d121      	bne.n	540e <_vsnprintf+0x316>
    53ca:	f415 7f80 	tst.w	r5, #256	; 0x100
    53ce:	d142      	bne.n	5456 <_vsnprintf+0x35e>
    53d0:	f015 0f40 	tst.w	r5, #64	; 0x40
    53d4:	d058      	beq.n	5488 <_vsnprintf+0x390>
    53d6:	9a18      	ldr	r2, [sp, #96]	; 0x60
    53d8:	1d11      	adds	r1, r2, #4
    53da:	9118      	str	r1, [sp, #96]	; 0x60
    53dc:	7812      	ldrb	r2, [r2, #0]
    53de:	ea82 71e2 	eor.w	r1, r2, r2, asr #31
    53e2:	eba1 71e2 	sub.w	r1, r1, r2, asr #31
    53e6:	9505      	str	r5, [sp, #20]
    53e8:	980a      	ldr	r0, [sp, #40]	; 0x28
    53ea:	9004      	str	r0, [sp, #16]
    53ec:	f8cd a00c 	str.w	sl, [sp, #12]
    53f0:	9302      	str	r3, [sp, #8]
    53f2:	0fd2      	lsrs	r2, r2, #31
    53f4:	9201      	str	r2, [sp, #4]
    53f6:	9100      	str	r1, [sp, #0]
    53f8:	4633      	mov	r3, r6
    53fa:	4622      	mov	r2, r4
    53fc:	4659      	mov	r1, fp
    53fe:	4638      	mov	r0, r7
    5400:	f7ff fdcc 	bl	4f9c <_ntoa_long>
    5404:	4604      	mov	r4, r0
    5406:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    5408:	3301      	adds	r3, #1
    540a:	930d      	str	r3, [sp, #52]	; 0x34
    540c:	e67f      	b.n	510e <_vsnprintf+0x16>
    540e:	9a18      	ldr	r2, [sp, #96]	; 0x60
    5410:	3207      	adds	r2, #7
    5412:	f022 0207 	bic.w	r2, r2, #7
    5416:	f102 0108 	add.w	r1, r2, #8
    541a:	9118      	str	r1, [sp, #96]	; 0x60
    541c:	6851      	ldr	r1, [r2, #4]
    541e:	6812      	ldr	r2, [r2, #0]
    5420:	4608      	mov	r0, r1
    5422:	2900      	cmp	r1, #0
    5424:	db13      	blt.n	544e <_vsnprintf+0x356>
    5426:	9508      	str	r5, [sp, #32]
    5428:	9d0a      	ldr	r5, [sp, #40]	; 0x28
    542a:	9507      	str	r5, [sp, #28]
    542c:	f8cd a018 	str.w	sl, [sp, #24]
    5430:	9304      	str	r3, [sp, #16]
    5432:	2300      	movs	r3, #0
    5434:	9305      	str	r3, [sp, #20]
    5436:	0fc9      	lsrs	r1, r1, #31
    5438:	9102      	str	r1, [sp, #8]
    543a:	9200      	str	r2, [sp, #0]
    543c:	9001      	str	r0, [sp, #4]
    543e:	4633      	mov	r3, r6
    5440:	4622      	mov	r2, r4
    5442:	4659      	mov	r1, fp
    5444:	4638      	mov	r0, r7
    5446:	f7ff fdf3 	bl	5030 <_ntoa_long_long>
    544a:	4604      	mov	r4, r0
    544c:	e7db      	b.n	5406 <_vsnprintf+0x30e>
    544e:	4252      	negs	r2, r2
    5450:	eb61 0041 	sbc.w	r0, r1, r1, lsl #1
    5454:	e7e7      	b.n	5426 <_vsnprintf+0x32e>
    5456:	9a18      	ldr	r2, [sp, #96]	; 0x60
    5458:	1d11      	adds	r1, r2, #4
    545a:	9118      	str	r1, [sp, #96]	; 0x60
    545c:	6812      	ldr	r2, [r2, #0]
    545e:	ea82 71e2 	eor.w	r1, r2, r2, asr #31
    5462:	eba1 71e2 	sub.w	r1, r1, r2, asr #31
    5466:	9505      	str	r5, [sp, #20]
    5468:	980a      	ldr	r0, [sp, #40]	; 0x28
    546a:	9004      	str	r0, [sp, #16]
    546c:	f8cd a00c 	str.w	sl, [sp, #12]
    5470:	9302      	str	r3, [sp, #8]
    5472:	0fd2      	lsrs	r2, r2, #31
    5474:	9201      	str	r2, [sp, #4]
    5476:	9100      	str	r1, [sp, #0]
    5478:	4633      	mov	r3, r6
    547a:	4622      	mov	r2, r4
    547c:	4659      	mov	r1, fp
    547e:	4638      	mov	r0, r7
    5480:	f7ff fd8c 	bl	4f9c <_ntoa_long>
    5484:	4604      	mov	r4, r0
    5486:	e7be      	b.n	5406 <_vsnprintf+0x30e>
    5488:	f015 0f80 	tst.w	r5, #128	; 0x80
    548c:	d005      	beq.n	549a <_vsnprintf+0x3a2>
    548e:	9a18      	ldr	r2, [sp, #96]	; 0x60
    5490:	1d11      	adds	r1, r2, #4
    5492:	9118      	str	r1, [sp, #96]	; 0x60
    5494:	f9b2 2000 	ldrsh.w	r2, [r2]
    5498:	e7a1      	b.n	53de <_vsnprintf+0x2e6>
    549a:	9a18      	ldr	r2, [sp, #96]	; 0x60
    549c:	1d11      	adds	r1, r2, #4
    549e:	9118      	str	r1, [sp, #96]	; 0x60
    54a0:	6812      	ldr	r2, [r2, #0]
    54a2:	e79c      	b.n	53de <_vsnprintf+0x2e6>
    54a4:	9a18      	ldr	r2, [sp, #96]	; 0x60
    54a6:	3207      	adds	r2, #7
    54a8:	f022 0207 	bic.w	r2, r2, #7
    54ac:	f102 0108 	add.w	r1, r2, #8
    54b0:	9118      	str	r1, [sp, #96]	; 0x60
    54b2:	9508      	str	r5, [sp, #32]
    54b4:	990a      	ldr	r1, [sp, #40]	; 0x28
    54b6:	9107      	str	r1, [sp, #28]
    54b8:	f8cd a018 	str.w	sl, [sp, #24]
    54bc:	2100      	movs	r1, #0
    54be:	9304      	str	r3, [sp, #16]
    54c0:	9105      	str	r1, [sp, #20]
    54c2:	9102      	str	r1, [sp, #8]
    54c4:	e9d2 2300 	ldrd	r2, r3, [r2]
    54c8:	e9cd 2300 	strd	r2, r3, [sp]
    54cc:	4633      	mov	r3, r6
    54ce:	4622      	mov	r2, r4
    54d0:	4659      	mov	r1, fp
    54d2:	4638      	mov	r0, r7
    54d4:	f7ff fdac 	bl	5030 <_ntoa_long_long>
    54d8:	4604      	mov	r4, r0
    54da:	e794      	b.n	5406 <_vsnprintf+0x30e>
    54dc:	9a18      	ldr	r2, [sp, #96]	; 0x60
    54de:	1d11      	adds	r1, r2, #4
    54e0:	9118      	str	r1, [sp, #96]	; 0x60
    54e2:	9505      	str	r5, [sp, #20]
    54e4:	990a      	ldr	r1, [sp, #40]	; 0x28
    54e6:	9104      	str	r1, [sp, #16]
    54e8:	f8cd a00c 	str.w	sl, [sp, #12]
    54ec:	9302      	str	r3, [sp, #8]
    54ee:	2300      	movs	r3, #0
    54f0:	9301      	str	r3, [sp, #4]
    54f2:	6813      	ldr	r3, [r2, #0]
    54f4:	9300      	str	r3, [sp, #0]
    54f6:	4633      	mov	r3, r6
    54f8:	4622      	mov	r2, r4
    54fa:	4659      	mov	r1, fp
    54fc:	4638      	mov	r0, r7
    54fe:	f7ff fd4d 	bl	4f9c <_ntoa_long>
    5502:	4604      	mov	r4, r0
    5504:	e77f      	b.n	5406 <_vsnprintf+0x30e>
    5506:	f015 0f80 	tst.w	r5, #128	; 0x80
    550a:	d004      	beq.n	5516 <_vsnprintf+0x41e>
    550c:	9a18      	ldr	r2, [sp, #96]	; 0x60
    550e:	1d11      	adds	r1, r2, #4
    5510:	9118      	str	r1, [sp, #96]	; 0x60
    5512:	8812      	ldrh	r2, [r2, #0]
    5514:	e73c      	b.n	5390 <_vsnprintf+0x298>
    5516:	9a18      	ldr	r2, [sp, #96]	; 0x60
    5518:	1d11      	adds	r1, r2, #4
    551a:	9118      	str	r1, [sp, #96]	; 0x60
    551c:	6812      	ldr	r2, [r2, #0]
    551e:	e737      	b.n	5390 <_vsnprintf+0x298>
    5520:	f015 0502 	ands.w	r5, r5, #2
    5524:	d01f      	beq.n	5566 <_vsnprintf+0x46e>
    5526:	f04f 0801 	mov.w	r8, #1
    552a:	9818      	ldr	r0, [sp, #96]	; 0x60
    552c:	1d03      	adds	r3, r0, #4
    552e:	9318      	str	r3, [sp, #96]	; 0x60
    5530:	f104 0901 	add.w	r9, r4, #1
    5534:	4633      	mov	r3, r6
    5536:	4622      	mov	r2, r4
    5538:	4659      	mov	r1, fp
    553a:	7800      	ldrb	r0, [r0, #0]
    553c:	47b8      	blx	r7
    553e:	b9bd      	cbnz	r5, 5570 <_vsnprintf+0x478>
    5540:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    5542:	3301      	adds	r3, #1
    5544:	930d      	str	r3, [sp, #52]	; 0x34
    5546:	464c      	mov	r4, r9
    5548:	e5e1      	b.n	510e <_vsnprintf+0x16>
    554a:	f102 0901 	add.w	r9, r2, #1
    554e:	4633      	mov	r3, r6
    5550:	4659      	mov	r1, fp
    5552:	2020      	movs	r0, #32
    5554:	47b8      	blx	r7
    5556:	4643      	mov	r3, r8
    5558:	464a      	mov	r2, r9
    555a:	f103 0801 	add.w	r8, r3, #1
    555e:	459a      	cmp	sl, r3
    5560:	d8f3      	bhi.n	554a <_vsnprintf+0x452>
    5562:	4614      	mov	r4, r2
    5564:	e7e1      	b.n	552a <_vsnprintf+0x432>
    5566:	2301      	movs	r3, #1
    5568:	f8dd a028 	ldr.w	sl, [sp, #40]	; 0x28
    556c:	4622      	mov	r2, r4
    556e:	e7f4      	b.n	555a <_vsnprintf+0x462>
    5570:	464a      	mov	r2, r9
    5572:	f8dd 9028 	ldr.w	r9, [sp, #40]	; 0x28
    5576:	e006      	b.n	5586 <_vsnprintf+0x48e>
    5578:	1c55      	adds	r5, r2, #1
    557a:	4633      	mov	r3, r6
    557c:	4659      	mov	r1, fp
    557e:	2020      	movs	r0, #32
    5580:	47b8      	blx	r7
    5582:	46a0      	mov	r8, r4
    5584:	462a      	mov	r2, r5
    5586:	f108 0401 	add.w	r4, r8, #1
    558a:	45c1      	cmp	r9, r8
    558c:	d8f4      	bhi.n	5578 <_vsnprintf+0x480>
    558e:	4691      	mov	r9, r2
    5590:	e7d6      	b.n	5540 <_vsnprintf+0x448>
    5592:	9b18      	ldr	r3, [sp, #96]	; 0x60
    5594:	1d1a      	adds	r2, r3, #4
    5596:	9218      	str	r2, [sp, #96]	; 0x60
    5598:	f8d3 9000 	ldr.w	r9, [r3]
    559c:	f1ba 0f00 	cmp.w	sl, #0
    55a0:	d11e      	bne.n	55e0 <_vsnprintf+0x4e8>
    55a2:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    55a6:	46c8      	mov	r8, r9
    55a8:	e002      	b.n	55b0 <_vsnprintf+0x4b8>
    55aa:	f108 0801 	add.w	r8, r8, #1
    55ae:	4613      	mov	r3, r2
    55b0:	f898 2000 	ldrb.w	r2, [r8]
    55b4:	b112      	cbz	r2, 55bc <_vsnprintf+0x4c4>
    55b6:	1e5a      	subs	r2, r3, #1
    55b8:	2b00      	cmp	r3, #0
    55ba:	d1f6      	bne.n	55aa <_vsnprintf+0x4b2>
    55bc:	eba8 0809 	sub.w	r8, r8, r9
    55c0:	f415 6380 	ands.w	r3, r5, #1024	; 0x400
    55c4:	930b      	str	r3, [sp, #44]	; 0x2c
    55c6:	d002      	beq.n	55ce <_vsnprintf+0x4d6>
    55c8:	45d0      	cmp	r8, sl
    55ca:	bf28      	it	cs
    55cc:	46d0      	movcs	r8, sl
    55ce:	f015 0302 	ands.w	r3, r5, #2
    55d2:	930c      	str	r3, [sp, #48]	; 0x30
    55d4:	d006      	beq.n	55e4 <_vsnprintf+0x4ec>
    55d6:	4622      	mov	r2, r4
    55d8:	4654      	mov	r4, sl
    55da:	46b2      	mov	sl, r6
    55dc:	9e0b      	ldr	r6, [sp, #44]	; 0x2c
    55de:	e01d      	b.n	561c <_vsnprintf+0x524>
    55e0:	4653      	mov	r3, sl
    55e2:	e7e0      	b.n	55a6 <_vsnprintf+0x4ae>
    55e4:	4622      	mov	r2, r4
    55e6:	9c0a      	ldr	r4, [sp, #40]	; 0x28
    55e8:	4643      	mov	r3, r8
    55ea:	e007      	b.n	55fc <_vsnprintf+0x504>
    55ec:	f102 0801 	add.w	r8, r2, #1
    55f0:	4633      	mov	r3, r6
    55f2:	4659      	mov	r1, fp
    55f4:	2020      	movs	r0, #32
    55f6:	47b8      	blx	r7
    55f8:	462b      	mov	r3, r5
    55fa:	4642      	mov	r2, r8
    55fc:	1c5d      	adds	r5, r3, #1
    55fe:	429c      	cmp	r4, r3
    5600:	d8f4      	bhi.n	55ec <_vsnprintf+0x4f4>
    5602:	46a8      	mov	r8, r5
    5604:	4654      	mov	r4, sl
    5606:	46b2      	mov	sl, r6
    5608:	9e0b      	ldr	r6, [sp, #44]	; 0x2c
    560a:	e007      	b.n	561c <_vsnprintf+0x524>
    560c:	461c      	mov	r4, r3
    560e:	f109 0901 	add.w	r9, r9, #1
    5612:	1c55      	adds	r5, r2, #1
    5614:	4653      	mov	r3, sl
    5616:	4659      	mov	r1, fp
    5618:	47b8      	blx	r7
    561a:	462a      	mov	r2, r5
    561c:	f899 0000 	ldrb.w	r0, [r9]
    5620:	b120      	cbz	r0, 562c <_vsnprintf+0x534>
    5622:	2e00      	cmp	r6, #0
    5624:	d0f3      	beq.n	560e <_vsnprintf+0x516>
    5626:	1e63      	subs	r3, r4, #1
    5628:	2c00      	cmp	r4, #0
    562a:	d1ef      	bne.n	560c <_vsnprintf+0x514>
    562c:	4614      	mov	r4, r2
    562e:	4656      	mov	r6, sl
    5630:	9b0c      	ldr	r3, [sp, #48]	; 0x30
    5632:	b91b      	cbnz	r3, 563c <_vsnprintf+0x544>
    5634:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    5636:	3301      	adds	r3, #1
    5638:	930d      	str	r3, [sp, #52]	; 0x34
    563a:	e568      	b.n	510e <_vsnprintf+0x16>
    563c:	f8dd 9028 	ldr.w	r9, [sp, #40]	; 0x28
    5640:	e006      	b.n	5650 <_vsnprintf+0x558>
    5642:	1c55      	adds	r5, r2, #1
    5644:	4633      	mov	r3, r6
    5646:	4659      	mov	r1, fp
    5648:	2020      	movs	r0, #32
    564a:	47b8      	blx	r7
    564c:	46a0      	mov	r8, r4
    564e:	462a      	mov	r2, r5
    5650:	f108 0401 	add.w	r4, r8, #1
    5654:	45c1      	cmp	r9, r8
    5656:	d8f4      	bhi.n	5642 <_vsnprintf+0x54a>
    5658:	4614      	mov	r4, r2
    565a:	e7eb      	b.n	5634 <_vsnprintf+0x53c>
    565c:	f045 0521 	orr.w	r5, r5, #33	; 0x21
    5660:	9b18      	ldr	r3, [sp, #96]	; 0x60
    5662:	1d1a      	adds	r2, r3, #4
    5664:	9218      	str	r2, [sp, #96]	; 0x60
    5666:	681b      	ldr	r3, [r3, #0]
    5668:	9505      	str	r5, [sp, #20]
    566a:	2208      	movs	r2, #8
    566c:	9204      	str	r2, [sp, #16]
    566e:	f8cd a00c 	str.w	sl, [sp, #12]
    5672:	2210      	movs	r2, #16
    5674:	9202      	str	r2, [sp, #8]
    5676:	2200      	movs	r2, #0
    5678:	9201      	str	r2, [sp, #4]
    567a:	9300      	str	r3, [sp, #0]
    567c:	4633      	mov	r3, r6
    567e:	4622      	mov	r2, r4
    5680:	4659      	mov	r1, fp
    5682:	4638      	mov	r0, r7
    5684:	f7ff fc8a 	bl	4f9c <_ntoa_long>
    5688:	4604      	mov	r4, r0
    568a:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    568c:	3301      	adds	r3, #1
    568e:	930d      	str	r3, [sp, #52]	; 0x34
    5690:	e53d      	b.n	510e <_vsnprintf+0x16>
    5692:	1c65      	adds	r5, r4, #1
    5694:	4633      	mov	r3, r6
    5696:	4622      	mov	r2, r4
    5698:	4659      	mov	r1, fp
    569a:	2025      	movs	r0, #37	; 0x25
    569c:	47b8      	blx	r7
    569e:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    56a0:	3301      	adds	r3, #1
    56a2:	930d      	str	r3, [sp, #52]	; 0x34
    56a4:	462c      	mov	r4, r5
    56a6:	e532      	b.n	510e <_vsnprintf+0x16>
    56a8:	1c65      	adds	r5, r4, #1
    56aa:	4633      	mov	r3, r6
    56ac:	4622      	mov	r2, r4
    56ae:	4659      	mov	r1, fp
    56b0:	47b8      	blx	r7
    56b2:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    56b4:	3301      	adds	r3, #1
    56b6:	930d      	str	r3, [sp, #52]	; 0x34
    56b8:	462c      	mov	r4, r5
    56ba:	e528      	b.n	510e <_vsnprintf+0x16>
    56bc:	4f07      	ldr	r7, [pc, #28]	; (56dc <_vsnprintf+0x5e4>)
    56be:	e525      	b.n	510c <_vsnprintf+0x14>
    56c0:	42b4      	cmp	r4, r6
    56c2:	d308      	bcc.n	56d6 <_vsnprintf+0x5de>
    56c4:	1e72      	subs	r2, r6, #1
    56c6:	4633      	mov	r3, r6
    56c8:	4659      	mov	r1, fp
    56ca:	2000      	movs	r0, #0
    56cc:	47b8      	blx	r7
    56ce:	4620      	mov	r0, r4
    56d0:	b00f      	add	sp, #60	; 0x3c
    56d2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    56d6:	4622      	mov	r2, r4
    56d8:	e7f5      	b.n	56c6 <_vsnprintf+0x5ce>
    56da:	bf00      	nop
    56dc:	00004dc1 	.word	0x00004dc1

000056e0 <snprintf_>:
    56e0:	b40c      	push	{r2, r3}
    56e2:	b510      	push	{r4, lr}
    56e4:	b084      	sub	sp, #16
    56e6:	460a      	mov	r2, r1
    56e8:	ac06      	add	r4, sp, #24
    56ea:	f854 3b04 	ldr.w	r3, [r4], #4
    56ee:	9403      	str	r4, [sp, #12]
    56f0:	9400      	str	r4, [sp, #0]
    56f2:	4601      	mov	r1, r0
    56f4:	4803      	ldr	r0, [pc, #12]	; (5704 <snprintf_+0x24>)
    56f6:	f7ff fcff 	bl	50f8 <_vsnprintf>
    56fa:	b004      	add	sp, #16
    56fc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    5700:	b002      	add	sp, #8
    5702:	4770      	bx	lr
    5704:	00004db9 	.word	0x00004db9

00005708 <reflect>:
    5708:	4602      	mov	r2, r0
    570a:	2300      	movs	r3, #0
    570c:	4618      	mov	r0, r3
    570e:	e004      	b.n	571a <reflect+0x12>
    5710:	f85d fb04 	ldr.w	pc, [sp], #4
    5714:	0852      	lsrs	r2, r2, #1
    5716:	3301      	adds	r3, #1
    5718:	b2db      	uxtb	r3, r3
    571a:	428b      	cmp	r3, r1
    571c:	d216      	bcs.n	574c <reflect+0x44>
    571e:	f012 0f01 	tst.w	r2, #1
    5722:	d0f7      	beq.n	5714 <reflect+0xc>
    5724:	b500      	push	{lr}
    5726:	f101 3cff 	add.w	ip, r1, #4294967295	; 0xffffffff
    572a:	ebac 0e03 	sub.w	lr, ip, r3
    572e:	f04f 0c01 	mov.w	ip, #1
    5732:	fa0c fc0e 	lsl.w	ip, ip, lr
    5736:	ea40 000c 	orr.w	r0, r0, ip
    573a:	0852      	lsrs	r2, r2, #1
    573c:	3301      	adds	r3, #1
    573e:	b2db      	uxtb	r3, r3
    5740:	428b      	cmp	r3, r1
    5742:	d2e5      	bcs.n	5710 <reflect+0x8>
    5744:	f012 0f01 	tst.w	r2, #1
    5748:	d0f7      	beq.n	573a <reflect+0x32>
    574a:	e7ec      	b.n	5726 <reflect+0x1e>
    574c:	4770      	bx	lr
	...

00005750 <crcInit>:
    5750:	2000      	movs	r0, #0
    5752:	e011      	b.n	5778 <crcInit+0x28>
    5754:	005b      	lsls	r3, r3, #1
    5756:	b29b      	uxth	r3, r3
    5758:	3a01      	subs	r2, #1
    575a:	b2d2      	uxtb	r2, r2
    575c:	b142      	cbz	r2, 5770 <crcInit+0x20>
    575e:	f413 4f00 	tst.w	r3, #32768	; 0x8000
    5762:	d0f7      	beq.n	5754 <crcInit+0x4>
    5764:	f241 0121 	movw	r1, #4129	; 0x1021
    5768:	ea81 0343 	eor.w	r3, r1, r3, lsl #1
    576c:	b29b      	uxth	r3, r3
    576e:	e7f3      	b.n	5758 <crcInit+0x8>
    5770:	4a05      	ldr	r2, [pc, #20]	; (5788 <crcInit+0x38>)
    5772:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
    5776:	3001      	adds	r0, #1
    5778:	28ff      	cmp	r0, #255	; 0xff
    577a:	dc04      	bgt.n	5786 <crcInit+0x36>
    577c:	b283      	uxth	r3, r0
    577e:	021b      	lsls	r3, r3, #8
    5780:	b29b      	uxth	r3, r3
    5782:	2208      	movs	r2, #8
    5784:	e7ea      	b.n	575c <crcInit+0xc>
    5786:	4770      	bx	lr
    5788:	200004a0 	.word	0x200004a0

0000578c <crcFast>:
    578c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    578e:	4606      	mov	r6, r0
    5790:	460d      	mov	r5, r1
    5792:	2400      	movs	r4, #0
    5794:	4627      	mov	r7, r4
    5796:	e00d      	b.n	57b4 <crcFast+0x28>
    5798:	2108      	movs	r1, #8
    579a:	5d30      	ldrb	r0, [r6, r4]
    579c:	f7ff ffb4 	bl	5708 <reflect>
    57a0:	b2c3      	uxtb	r3, r0
    57a2:	ea83 2317 	eor.w	r3, r3, r7, lsr #8
    57a6:	4a07      	ldr	r2, [pc, #28]	; (57c4 <crcFast+0x38>)
    57a8:	f932 3013 	ldrsh.w	r3, [r2, r3, lsl #1]
    57ac:	ea83 2307 	eor.w	r3, r3, r7, lsl #8
    57b0:	b29f      	uxth	r7, r3
    57b2:	3401      	adds	r4, #1
    57b4:	42ac      	cmp	r4, r5
    57b6:	dbef      	blt.n	5798 <crcFast+0xc>
    57b8:	2110      	movs	r1, #16
    57ba:	4638      	mov	r0, r7
    57bc:	f7ff ffa4 	bl	5708 <reflect>
    57c0:	b280      	uxth	r0, r0
    57c2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    57c4:	200004a0 	.word	0x200004a0

000057c8 <bootloader_rebootAndInstall>:
    57c8:	b508      	push	{r3, lr}
    57ca:	f000 fc86 	bl	60da <CORE_AtomicDisableIrq>
    57ce:	f04f 5300 	mov.w	r3, #536870912	; 0x20000000
    57d2:	f240 2202 	movw	r2, #514	; 0x202
    57d6:	801a      	strh	r2, [r3, #0]
    57d8:	f24f 020f 	movw	r2, #61455	; 0xf00f
    57dc:	805a      	strh	r2, [r3, #2]
    57de:	f3bf 8f4f 	dsb	sy
    57e2:	4905      	ldr	r1, [pc, #20]	; (57f8 <bootloader_rebootAndInstall+0x30>)
    57e4:	68ca      	ldr	r2, [r1, #12]
    57e6:	f402 62e0 	and.w	r2, r2, #1792	; 0x700
    57ea:	4b04      	ldr	r3, [pc, #16]	; (57fc <bootloader_rebootAndInstall+0x34>)
    57ec:	4313      	orrs	r3, r2
    57ee:	60cb      	str	r3, [r1, #12]
    57f0:	f3bf 8f4f 	dsb	sy
    57f4:	bf00      	nop
    57f6:	e7fd      	b.n	57f4 <bootloader_rebootAndInstall+0x2c>
    57f8:	e000ed00 	.word	0xe000ed00
    57fc:	05fa0004 	.word	0x05fa0004

00005800 <assertEFM>:
    5800:	e7fe      	b.n	5800 <assertEFM>
	...

00005804 <flashWaitStateControl>:
    5804:	4b11      	ldr	r3, [pc, #68]	; (584c <flashWaitStateControl+0x48>)
    5806:	69da      	ldr	r2, [r3, #28]
    5808:	f402 3280 	and.w	r2, r2, #65536	; 0x10000
    580c:	f641 3171 	movw	r1, #7025	; 0x1b71
    5810:	63d9      	str	r1, [r3, #60]	; 0x3c
    5812:	689b      	ldr	r3, [r3, #8]
    5814:	f423 1340 	bic.w	r3, r3, #3145728	; 0x300000
    5818:	490d      	ldr	r1, [pc, #52]	; (5850 <flashWaitStateControl+0x4c>)
    581a:	4288      	cmp	r0, r1
    581c:	d901      	bls.n	5822 <flashWaitStateControl+0x1e>
    581e:	f443 1380 	orr.w	r3, r3, #1048576	; 0x100000
    5822:	490a      	ldr	r1, [pc, #40]	; (584c <flashWaitStateControl+0x48>)
    5824:	608b      	str	r3, [r1, #8]
    5826:	4b0b      	ldr	r3, [pc, #44]	; (5854 <flashWaitStateControl+0x50>)
    5828:	f8d3 3218 	ldr.w	r3, [r3, #536]	; 0x218
    582c:	f023 0302 	bic.w	r3, r3, #2
    5830:	4909      	ldr	r1, [pc, #36]	; (5858 <flashWaitStateControl+0x54>)
    5832:	4288      	cmp	r0, r1
    5834:	d901      	bls.n	583a <flashWaitStateControl+0x36>
    5836:	f043 0302 	orr.w	r3, r3, #2
    583a:	4906      	ldr	r1, [pc, #24]	; (5854 <flashWaitStateControl+0x50>)
    583c:	f8c1 3218 	str.w	r3, [r1, #536]	; 0x218
    5840:	b112      	cbz	r2, 5848 <flashWaitStateControl+0x44>
    5842:	4b02      	ldr	r3, [pc, #8]	; (584c <flashWaitStateControl+0x48>)
    5844:	2200      	movs	r2, #0
    5846:	63da      	str	r2, [r3, #60]	; 0x3c
    5848:	4770      	bx	lr
    584a:	bf00      	nop
    584c:	40030000 	.word	0x40030000
    5850:	025317c0 	.word	0x025317c0
    5854:	4007c000 	.word	0x4007c000
    5858:	02faf080 	.word	0x02faf080

0000585c <HFRCODPLLDevinfoGet>:
    585c:	b508      	push	{r3, lr}
    585e:	4b34      	ldr	r3, [pc, #208]	; (5930 <HFRCODPLLDevinfoGet+0xd4>)
    5860:	4298      	cmp	r0, r3
    5862:	d04d      	beq.n	5900 <HFRCODPLLDevinfoGet+0xa4>
    5864:	d910      	bls.n	5888 <HFRCODPLLDevinfoGet+0x2c>
    5866:	4b33      	ldr	r3, [pc, #204]	; (5934 <HFRCODPLLDevinfoGet+0xd8>)
    5868:	4298      	cmp	r0, r3
    586a:	d051      	beq.n	5910 <HFRCODPLLDevinfoGet+0xb4>
    586c:	d931      	bls.n	58d2 <HFRCODPLLDevinfoGet+0x76>
    586e:	4b32      	ldr	r3, [pc, #200]	; (5938 <HFRCODPLLDevinfoGet+0xdc>)
    5870:	4298      	cmp	r0, r3
    5872:	d051      	beq.n	5918 <HFRCODPLLDevinfoGet+0xbc>
    5874:	f503 0374 	add.w	r3, r3, #15990784	; 0xf40000
    5878:	f503 5310 	add.w	r3, r3, #9216	; 0x2400
    587c:	4298      	cmp	r0, r3
    587e:	d14f      	bne.n	5920 <HFRCODPLLDevinfoGet+0xc4>
    5880:	4b2e      	ldr	r3, [pc, #184]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    5882:	f8d3 0098 	ldr.w	r0, [r3, #152]	; 0x98
    5886:	e01d      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    5888:	4b2d      	ldr	r3, [pc, #180]	; (5940 <HFRCODPLLDevinfoGet+0xe4>)
    588a:	4298      	cmp	r0, r3
    588c:	d032      	beq.n	58f4 <HFRCODPLLDevinfoGet+0x98>
    588e:	d90b      	bls.n	58a8 <HFRCODPLLDevinfoGet+0x4c>
    5890:	4b2c      	ldr	r3, [pc, #176]	; (5944 <HFRCODPLLDevinfoGet+0xe8>)
    5892:	4298      	cmp	r0, r3
    5894:	d031      	beq.n	58fa <HFRCODPLLDevinfoGet+0x9e>
    5896:	f503 1337 	add.w	r3, r3, #2998272	; 0x2dc000
    589a:	f503 63d8 	add.w	r3, r3, #1728	; 0x6c0
    589e:	4298      	cmp	r0, r3
    58a0:	d13e      	bne.n	5920 <HFRCODPLLDevinfoGet+0xc4>
    58a2:	4b26      	ldr	r3, [pc, #152]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    58a4:	6f98      	ldr	r0, [r3, #120]	; 0x78
    58a6:	e00d      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    58a8:	4b27      	ldr	r3, [pc, #156]	; (5948 <HFRCODPLLDevinfoGet+0xec>)
    58aa:	4298      	cmp	r0, r3
    58ac:	d00e      	beq.n	58cc <HFRCODPLLDevinfoGet+0x70>
    58ae:	d908      	bls.n	58c2 <HFRCODPLLDevinfoGet+0x66>
    58b0:	4b26      	ldr	r3, [pc, #152]	; (594c <HFRCODPLLDevinfoGet+0xf0>)
    58b2:	4298      	cmp	r0, r3
    58b4:	d00a      	beq.n	58cc <HFRCODPLLDevinfoGet+0x70>
    58b6:	4b26      	ldr	r3, [pc, #152]	; (5950 <HFRCODPLLDevinfoGet+0xf4>)
    58b8:	4298      	cmp	r0, r3
    58ba:	d131      	bne.n	5920 <HFRCODPLLDevinfoGet+0xc4>
    58bc:	4b1f      	ldr	r3, [pc, #124]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    58be:	6e58      	ldr	r0, [r3, #100]	; 0x64
    58c0:	e000      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    58c2:	b900      	cbnz	r0, 58c6 <HFRCODPLLDevinfoGet+0x6a>
    58c4:	bd08      	pop	{r3, pc}
    58c6:	4b23      	ldr	r3, [pc, #140]	; (5954 <HFRCODPLLDevinfoGet+0xf8>)
    58c8:	4298      	cmp	r0, r3
    58ca:	d129      	bne.n	5920 <HFRCODPLLDevinfoGet+0xc4>
    58cc:	4b1b      	ldr	r3, [pc, #108]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    58ce:	6d98      	ldr	r0, [r3, #88]	; 0x58
    58d0:	e7f8      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    58d2:	4b21      	ldr	r3, [pc, #132]	; (5958 <HFRCODPLLDevinfoGet+0xfc>)
    58d4:	4298      	cmp	r0, r3
    58d6:	d017      	beq.n	5908 <HFRCODPLLDevinfoGet+0xac>
    58d8:	4b20      	ldr	r3, [pc, #128]	; (595c <HFRCODPLLDevinfoGet+0x100>)
    58da:	4298      	cmp	r0, r3
    58dc:	d103      	bne.n	58e6 <HFRCODPLLDevinfoGet+0x8a>
    58de:	4b17      	ldr	r3, [pc, #92]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    58e0:	f8d3 008c 	ldr.w	r0, [r3, #140]	; 0x8c
    58e4:	e7ee      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    58e6:	4b1e      	ldr	r3, [pc, #120]	; (5960 <HFRCODPLLDevinfoGet+0x104>)
    58e8:	4298      	cmp	r0, r3
    58ea:	d119      	bne.n	5920 <HFRCODPLLDevinfoGet+0xc4>
    58ec:	4b13      	ldr	r3, [pc, #76]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    58ee:	f8d3 0084 	ldr.w	r0, [r3, #132]	; 0x84
    58f2:	e7e7      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    58f4:	4b11      	ldr	r3, [pc, #68]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    58f6:	6f18      	ldr	r0, [r3, #112]	; 0x70
    58f8:	e7e4      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    58fa:	4b10      	ldr	r3, [pc, #64]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    58fc:	6f58      	ldr	r0, [r3, #116]	; 0x74
    58fe:	e7e1      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    5900:	4b0e      	ldr	r3, [pc, #56]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    5902:	f8d3 0080 	ldr.w	r0, [r3, #128]	; 0x80
    5906:	e7dd      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    5908:	4b0c      	ldr	r3, [pc, #48]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    590a:	f8d3 0088 	ldr.w	r0, [r3, #136]	; 0x88
    590e:	e7d9      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    5910:	4b0a      	ldr	r3, [pc, #40]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    5912:	f8d3 0090 	ldr.w	r0, [r3, #144]	; 0x90
    5916:	e7d5      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    5918:	4b08      	ldr	r3, [pc, #32]	; (593c <HFRCODPLLDevinfoGet+0xe0>)
    591a:	f8d3 0094 	ldr.w	r0, [r3, #148]	; 0x94
    591e:	e7d1      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    5920:	f640 611a 	movw	r1, #3610	; 0xe1a
    5924:	480f      	ldr	r0, [pc, #60]	; (5964 <HFRCODPLLDevinfoGet+0x108>)
    5926:	f7ff ff6b 	bl	5800 <assertEFM>
    592a:	2000      	movs	r0, #0
    592c:	e7ca      	b.n	58c4 <HFRCODPLLDevinfoGet+0x68>
    592e:	bf00      	nop
    5930:	018cba80 	.word	0x018cba80
    5934:	03567e00 	.word	0x03567e00
    5938:	03d09000 	.word	0x03d09000
    593c:	0fe08000 	.word	0x0fe08000
    5940:	00c65d40 	.word	0x00c65d40
    5944:	00f42400 	.word	0x00f42400
    5948:	001e8480 	.word	0x001e8480
    594c:	003d0900 	.word	0x003d0900
    5950:	006acfc0 	.word	0x006acfc0
    5954:	000f4240 	.word	0x000f4240
    5958:	0243d580 	.word	0x0243d580
    595c:	02dc6c00 	.word	0x02dc6c00
    5960:	01e84800 	.word	0x01e84800
    5964:	0000bcdc 	.word	0x0000bcdc

00005968 <traceClkGet>:
    5968:	b538      	push	{r3, r4, r5, lr}
    596a:	4605      	mov	r5, r0
    596c:	460c      	mov	r4, r1
    596e:	4b0e      	ldr	r3, [pc, #56]	; (59a8 <traceClkGet+0x40>)
    5970:	f8d3 3080 	ldr.w	r3, [r3, #128]	; 0x80
    5974:	f003 0303 	and.w	r3, r3, #3
    5978:	2b02      	cmp	r3, #2
    597a:	d009      	beq.n	5990 <traceClkGet+0x28>
    597c:	2b03      	cmp	r3, #3
    597e:	d00f      	beq.n	59a0 <traceClkGet+0x38>
    5980:	f240 4142 	movw	r1, #1090	; 0x442
    5984:	4809      	ldr	r0, [pc, #36]	; (59ac <traceClkGet+0x44>)
    5986:	f7ff ff3b 	bl	5800 <assertEFM>
    598a:	2300      	movs	r3, #0
    598c:	4618      	mov	r0, r3
    598e:	e002      	b.n	5996 <traceClkGet+0x2e>
    5990:	f000 fe84 	bl	669c <SystemHCLKGet>
    5994:	230b      	movs	r3, #11
    5996:	b105      	cbz	r5, 599a <traceClkGet+0x32>
    5998:	6028      	str	r0, [r5, #0]
    599a:	b104      	cbz	r4, 599e <traceClkGet+0x36>
    599c:	7023      	strb	r3, [r4, #0]
    599e:	bd38      	pop	{r3, r4, r5, pc}
    59a0:	f000 fe9e 	bl	66e0 <SystemHFRCOEM23ClockGet>
    59a4:	2305      	movs	r3, #5
    59a6:	e7f6      	b.n	5996 <traceClkGet+0x2e>
    59a8:	40008000 	.word	0x40008000
    59ac:	0000bcdc 	.word	0x0000bcdc

000059b0 <em01GrpaClkGet>:
    59b0:	b538      	push	{r3, r4, r5, lr}
    59b2:	4605      	mov	r5, r0
    59b4:	460c      	mov	r4, r1
    59b6:	4b14      	ldr	r3, [pc, #80]	; (5a08 <em01GrpaClkGet+0x58>)
    59b8:	f8d3 3120 	ldr.w	r3, [r3, #288]	; 0x120
    59bc:	f003 0307 	and.w	r3, r3, #7
    59c0:	3b01      	subs	r3, #1
    59c2:	2b03      	cmp	r3, #3
    59c4:	d817      	bhi.n	59f6 <em01GrpaClkGet+0x46>
    59c6:	e8df f003 	tbb	[pc, r3]
    59ca:	0a02      	.short	0x0a02
    59cc:	120e      	.short	0x120e
    59ce:	f000 fe3f 	bl	6650 <SystemHFRCODPLLClockGet>
    59d2:	2304      	movs	r3, #4
    59d4:	b105      	cbz	r5, 59d8 <em01GrpaClkGet+0x28>
    59d6:	6028      	str	r0, [r5, #0]
    59d8:	b104      	cbz	r4, 59dc <em01GrpaClkGet+0x2c>
    59da:	7023      	strb	r3, [r4, #0]
    59dc:	bd38      	pop	{r3, r4, r5, pc}
    59de:	f000 fe73 	bl	66c8 <SystemHFXOClockGet>
    59e2:	2303      	movs	r3, #3
    59e4:	e7f6      	b.n	59d4 <em01GrpaClkGet+0x24>
    59e6:	f000 fe7b 	bl	66e0 <SystemHFRCOEM23ClockGet>
    59ea:	2305      	movs	r3, #5
    59ec:	e7f2      	b.n	59d4 <em01GrpaClkGet+0x24>
    59ee:	f000 fe73 	bl	66d8 <SystemFSRCOClockGet>
    59f2:	2302      	movs	r3, #2
    59f4:	e7ee      	b.n	59d4 <em01GrpaClkGet+0x24>
    59f6:	f640 5128 	movw	r1, #3368	; 0xd28
    59fa:	4804      	ldr	r0, [pc, #16]	; (5a0c <em01GrpaClkGet+0x5c>)
    59fc:	f7ff ff00 	bl	5800 <assertEFM>
    5a00:	2300      	movs	r3, #0
    5a02:	4618      	mov	r0, r3
    5a04:	e7e6      	b.n	59d4 <em01GrpaClkGet+0x24>
    5a06:	bf00      	nop
    5a08:	40008000 	.word	0x40008000
    5a0c:	0000bcdc 	.word	0x0000bcdc

00005a10 <iadcClkGet>:
    5a10:	b530      	push	{r4, r5, lr}
    5a12:	b083      	sub	sp, #12
    5a14:	4605      	mov	r5, r0
    5a16:	460c      	mov	r4, r1
    5a18:	2300      	movs	r3, #0
    5a1a:	9301      	str	r3, [sp, #4]
    5a1c:	4b13      	ldr	r3, [pc, #76]	; (5a6c <iadcClkGet+0x5c>)
    5a1e:	f8d3 3180 	ldr.w	r3, [r3, #384]	; 0x180
    5a22:	f003 0303 	and.w	r3, r3, #3
    5a26:	2b02      	cmp	r3, #2
    5a28:	d016      	beq.n	5a58 <iadcClkGet+0x48>
    5a2a:	2b03      	cmp	r3, #3
    5a2c:	d019      	beq.n	5a62 <iadcClkGet+0x52>
    5a2e:	2b01      	cmp	r3, #1
    5a30:	d006      	beq.n	5a40 <iadcClkGet+0x30>
    5a32:	f640 6144 	movw	r1, #3652	; 0xe44
    5a36:	480e      	ldr	r0, [pc, #56]	; (5a70 <iadcClkGet+0x60>)
    5a38:	f7ff fee2 	bl	5800 <assertEFM>
    5a3c:	2300      	movs	r3, #0
    5a3e:	e004      	b.n	5a4a <iadcClkGet+0x3a>
    5a40:	2100      	movs	r1, #0
    5a42:	a801      	add	r0, sp, #4
    5a44:	f7ff ffb4 	bl	59b0 <em01GrpaClkGet>
    5a48:	230d      	movs	r3, #13
    5a4a:	b10d      	cbz	r5, 5a50 <iadcClkGet+0x40>
    5a4c:	9a01      	ldr	r2, [sp, #4]
    5a4e:	602a      	str	r2, [r5, #0]
    5a50:	b104      	cbz	r4, 5a54 <iadcClkGet+0x44>
    5a52:	7023      	strb	r3, [r4, #0]
    5a54:	b003      	add	sp, #12
    5a56:	bd30      	pop	{r4, r5, pc}
    5a58:	f000 fe42 	bl	66e0 <SystemHFRCOEM23ClockGet>
    5a5c:	9001      	str	r0, [sp, #4]
    5a5e:	2305      	movs	r3, #5
    5a60:	e7f3      	b.n	5a4a <iadcClkGet+0x3a>
    5a62:	f000 fe39 	bl	66d8 <SystemFSRCOClockGet>
    5a66:	9001      	str	r0, [sp, #4]
    5a68:	2302      	movs	r3, #2
    5a6a:	e7ee      	b.n	5a4a <iadcClkGet+0x3a>
    5a6c:	40008000 	.word	0x40008000
    5a70:	0000bcdc 	.word	0x0000bcdc

00005a74 <em23GrpaClkGet>:
    5a74:	b538      	push	{r3, r4, r5, lr}
    5a76:	4605      	mov	r5, r0
    5a78:	460c      	mov	r4, r1
    5a7a:	4b11      	ldr	r3, [pc, #68]	; (5ac0 <em23GrpaClkGet+0x4c>)
    5a7c:	f8d3 3140 	ldr.w	r3, [r3, #320]	; 0x140
    5a80:	f003 0303 	and.w	r3, r3, #3
    5a84:	2b02      	cmp	r3, #2
    5a86:	d013      	beq.n	5ab0 <em23GrpaClkGet+0x3c>
    5a88:	2b03      	cmp	r3, #3
    5a8a:	d015      	beq.n	5ab8 <em23GrpaClkGet+0x44>
    5a8c:	2b01      	cmp	r3, #1
    5a8e:	d007      	beq.n	5aa0 <em23GrpaClkGet+0x2c>
    5a90:	f640 5156 	movw	r1, #3414	; 0xd56
    5a94:	480b      	ldr	r0, [pc, #44]	; (5ac4 <em23GrpaClkGet+0x50>)
    5a96:	f7ff feb3 	bl	5800 <assertEFM>
    5a9a:	2300      	movs	r3, #0
    5a9c:	4618      	mov	r0, r3
    5a9e:	e002      	b.n	5aa6 <em23GrpaClkGet+0x32>
    5aa0:	f000 fe62 	bl	6768 <SystemLFRCOClockGet>
    5aa4:	2308      	movs	r3, #8
    5aa6:	b105      	cbz	r5, 5aaa <em23GrpaClkGet+0x36>
    5aa8:	6028      	str	r0, [r5, #0]
    5aaa:	b104      	cbz	r4, 5aae <em23GrpaClkGet+0x3a>
    5aac:	7023      	strb	r3, [r4, #0]
    5aae:	bd38      	pop	{r3, r4, r5, pc}
    5ab0:	f000 fe60 	bl	6774 <SystemLFXOClockGet>
    5ab4:	2307      	movs	r3, #7
    5ab6:	e7f6      	b.n	5aa6 <em23GrpaClkGet+0x32>
    5ab8:	f000 fe59 	bl	676e <SystemULFRCOClockGet>
    5abc:	2309      	movs	r3, #9
    5abe:	e7f2      	b.n	5aa6 <em23GrpaClkGet+0x32>
    5ac0:	40008000 	.word	0x40008000
    5ac4:	0000bcdc 	.word	0x0000bcdc

00005ac8 <em4GrpaClkGet>:
    5ac8:	b538      	push	{r3, r4, r5, lr}
    5aca:	4605      	mov	r5, r0
    5acc:	460c      	mov	r4, r1
    5ace:	4b11      	ldr	r3, [pc, #68]	; (5b14 <em4GrpaClkGet+0x4c>)
    5ad0:	f8d3 3160 	ldr.w	r3, [r3, #352]	; 0x160
    5ad4:	f003 0303 	and.w	r3, r3, #3
    5ad8:	2b02      	cmp	r3, #2
    5ada:	d013      	beq.n	5b04 <em4GrpaClkGet+0x3c>
    5adc:	2b03      	cmp	r3, #3
    5ade:	d015      	beq.n	5b0c <em4GrpaClkGet+0x44>
    5ae0:	2b01      	cmp	r3, #1
    5ae2:	d007      	beq.n	5af4 <em4GrpaClkGet+0x2c>
    5ae4:	f640 5184 	movw	r1, #3460	; 0xd84
    5ae8:	480b      	ldr	r0, [pc, #44]	; (5b18 <em4GrpaClkGet+0x50>)
    5aea:	f7ff fe89 	bl	5800 <assertEFM>
    5aee:	2300      	movs	r3, #0
    5af0:	4618      	mov	r0, r3
    5af2:	e002      	b.n	5afa <em4GrpaClkGet+0x32>
    5af4:	f000 fe38 	bl	6768 <SystemLFRCOClockGet>
    5af8:	2308      	movs	r3, #8
    5afa:	b105      	cbz	r5, 5afe <em4GrpaClkGet+0x36>
    5afc:	6028      	str	r0, [r5, #0]
    5afe:	b104      	cbz	r4, 5b02 <em4GrpaClkGet+0x3a>
    5b00:	7023      	strb	r3, [r4, #0]
    5b02:	bd38      	pop	{r3, r4, r5, pc}
    5b04:	f000 fe36 	bl	6774 <SystemLFXOClockGet>
    5b08:	2307      	movs	r3, #7
    5b0a:	e7f6      	b.n	5afa <em4GrpaClkGet+0x32>
    5b0c:	f000 fe2f 	bl	676e <SystemULFRCOClockGet>
    5b10:	2309      	movs	r3, #9
    5b12:	e7f2      	b.n	5afa <em4GrpaClkGet+0x32>
    5b14:	40008000 	.word	0x40008000
    5b18:	0000bcdc 	.word	0x0000bcdc

00005b1c <wdog0ClkGet>:
    5b1c:	b538      	push	{r3, r4, r5, lr}
    5b1e:	4605      	mov	r5, r0
    5b20:	460c      	mov	r4, r1
    5b22:	4b14      	ldr	r3, [pc, #80]	; (5b74 <wdog0ClkGet+0x58>)
    5b24:	f8d3 3200 	ldr.w	r3, [r3, #512]	; 0x200
    5b28:	f003 0307 	and.w	r3, r3, #7
    5b2c:	3b01      	subs	r3, #1
    5b2e:	2b03      	cmp	r3, #3
    5b30:	d818      	bhi.n	5b64 <wdog0ClkGet+0x48>
    5b32:	e8df f003 	tbb	[pc, r3]
    5b36:	0a02      	.short	0x0a02
    5b38:	120e      	.short	0x120e
    5b3a:	f000 fe15 	bl	6768 <SystemLFRCOClockGet>
    5b3e:	2308      	movs	r3, #8
    5b40:	b105      	cbz	r5, 5b44 <wdog0ClkGet+0x28>
    5b42:	6028      	str	r0, [r5, #0]
    5b44:	b104      	cbz	r4, 5b48 <wdog0ClkGet+0x2c>
    5b46:	7023      	strb	r3, [r4, #0]
    5b48:	bd38      	pop	{r3, r4, r5, pc}
    5b4a:	f000 fe13 	bl	6774 <SystemLFXOClockGet>
    5b4e:	2307      	movs	r3, #7
    5b50:	e7f6      	b.n	5b40 <wdog0ClkGet+0x24>
    5b52:	f000 fe0c 	bl	676e <SystemULFRCOClockGet>
    5b56:	2309      	movs	r3, #9
    5b58:	e7f2      	b.n	5b40 <wdog0ClkGet+0x24>
    5b5a:	f000 fd9f 	bl	669c <SystemHCLKGet>
    5b5e:	0a80      	lsrs	r0, r0, #10
    5b60:	230c      	movs	r3, #12
    5b62:	e7ed      	b.n	5b40 <wdog0ClkGet+0x24>
    5b64:	f640 61f7 	movw	r1, #3831	; 0xef7
    5b68:	4803      	ldr	r0, [pc, #12]	; (5b78 <wdog0ClkGet+0x5c>)
    5b6a:	f7ff fe49 	bl	5800 <assertEFM>
    5b6e:	2300      	movs	r3, #0
    5b70:	4618      	mov	r0, r3
    5b72:	e7e5      	b.n	5b40 <wdog0ClkGet+0x24>
    5b74:	40008000 	.word	0x40008000
    5b78:	0000bcdc 	.word	0x0000bcdc

00005b7c <wdog1ClkGet>:
    5b7c:	b538      	push	{r3, r4, r5, lr}
    5b7e:	4605      	mov	r5, r0
    5b80:	460c      	mov	r4, r1
    5b82:	4b14      	ldr	r3, [pc, #80]	; (5bd4 <wdog1ClkGet+0x58>)
    5b84:	f8d3 3208 	ldr.w	r3, [r3, #520]	; 0x208
    5b88:	f003 0307 	and.w	r3, r3, #7
    5b8c:	3b01      	subs	r3, #1
    5b8e:	2b03      	cmp	r3, #3
    5b90:	d818      	bhi.n	5bc4 <wdog1ClkGet+0x48>
    5b92:	e8df f003 	tbb	[pc, r3]
    5b96:	0a02      	.short	0x0a02
    5b98:	120e      	.short	0x120e
    5b9a:	f000 fde5 	bl	6768 <SystemLFRCOClockGet>
    5b9e:	2308      	movs	r3, #8
    5ba0:	b105      	cbz	r5, 5ba4 <wdog1ClkGet+0x28>
    5ba2:	6028      	str	r0, [r5, #0]
    5ba4:	b104      	cbz	r4, 5ba8 <wdog1ClkGet+0x2c>
    5ba6:	7023      	strb	r3, [r4, #0]
    5ba8:	bd38      	pop	{r3, r4, r5, pc}
    5baa:	f000 fde3 	bl	6774 <SystemLFXOClockGet>
    5bae:	2307      	movs	r3, #7
    5bb0:	e7f6      	b.n	5ba0 <wdog1ClkGet+0x24>
    5bb2:	f000 fddc 	bl	676e <SystemULFRCOClockGet>
    5bb6:	2309      	movs	r3, #9
    5bb8:	e7f2      	b.n	5ba0 <wdog1ClkGet+0x24>
    5bba:	f000 fd6f 	bl	669c <SystemHCLKGet>
    5bbe:	0a80      	lsrs	r0, r0, #10
    5bc0:	230c      	movs	r3, #12
    5bc2:	e7ed      	b.n	5ba0 <wdog1ClkGet+0x24>
    5bc4:	f240 4177 	movw	r1, #1143	; 0x477
    5bc8:	4803      	ldr	r0, [pc, #12]	; (5bd8 <wdog1ClkGet+0x5c>)
    5bca:	f7ff fe19 	bl	5800 <assertEFM>
    5bce:	2300      	movs	r3, #0
    5bd0:	4618      	mov	r0, r3
    5bd2:	e7e5      	b.n	5ba0 <wdog1ClkGet+0x24>
    5bd4:	40008000 	.word	0x40008000
    5bd8:	0000bcdc 	.word	0x0000bcdc

00005bdc <rtccClkGet>:
    5bdc:	b538      	push	{r3, r4, r5, lr}
    5bde:	4605      	mov	r5, r0
    5be0:	460c      	mov	r4, r1
    5be2:	4b11      	ldr	r3, [pc, #68]	; (5c28 <rtccClkGet+0x4c>)
    5be4:	f8d3 3240 	ldr.w	r3, [r3, #576]	; 0x240
    5be8:	f003 0303 	and.w	r3, r3, #3
    5bec:	2b02      	cmp	r3, #2
    5bee:	d013      	beq.n	5c18 <rtccClkGet+0x3c>
    5bf0:	2b03      	cmp	r3, #3
    5bf2:	d015      	beq.n	5c20 <rtccClkGet+0x44>
    5bf4:	2b01      	cmp	r3, #1
    5bf6:	d007      	beq.n	5c08 <rtccClkGet+0x2c>
    5bf8:	f640 618b 	movw	r1, #3723	; 0xe8b
    5bfc:	480b      	ldr	r0, [pc, #44]	; (5c2c <rtccClkGet+0x50>)
    5bfe:	f7ff fdff 	bl	5800 <assertEFM>
    5c02:	2300      	movs	r3, #0
    5c04:	4618      	mov	r0, r3
    5c06:	e002      	b.n	5c0e <rtccClkGet+0x32>
    5c08:	f000 fdae 	bl	6768 <SystemLFRCOClockGet>
    5c0c:	2308      	movs	r3, #8
    5c0e:	b105      	cbz	r5, 5c12 <rtccClkGet+0x36>
    5c10:	6028      	str	r0, [r5, #0]
    5c12:	b104      	cbz	r4, 5c16 <rtccClkGet+0x3a>
    5c14:	7023      	strb	r3, [r4, #0]
    5c16:	bd38      	pop	{r3, r4, r5, pc}
    5c18:	f000 fdac 	bl	6774 <SystemLFXOClockGet>
    5c1c:	2307      	movs	r3, #7
    5c1e:	e7f6      	b.n	5c0e <rtccClkGet+0x32>
    5c20:	f000 fda5 	bl	676e <SystemULFRCOClockGet>
    5c24:	2309      	movs	r3, #9
    5c26:	e7f2      	b.n	5c0e <rtccClkGet+0x32>
    5c28:	40008000 	.word	0x40008000
    5c2c:	0000bcdc 	.word	0x0000bcdc

00005c30 <dpllRefClkGet>:
    5c30:	b538      	push	{r3, r4, r5, lr}
    5c32:	4605      	mov	r5, r0
    5c34:	460c      	mov	r4, r1
    5c36:	4b12      	ldr	r3, [pc, #72]	; (5c80 <dpllRefClkGet+0x50>)
    5c38:	f8d3 0100 	ldr.w	r0, [r3, #256]	; 0x100
    5c3c:	f000 0003 	and.w	r0, r0, #3
    5c40:	2803      	cmp	r0, #3
    5c42:	d80f      	bhi.n	5c64 <dpllRefClkGet+0x34>
    5c44:	e8df f000 	tbb	[pc, r0]
    5c48:	0a060216 	.word	0x0a060216
    5c4c:	f000 fd3c 	bl	66c8 <SystemHFXOClockGet>
    5c50:	2303      	movs	r3, #3
    5c52:	e010      	b.n	5c76 <dpllRefClkGet+0x46>
    5c54:	f000 fd8e 	bl	6774 <SystemLFXOClockGet>
    5c58:	2307      	movs	r3, #7
    5c5a:	e00c      	b.n	5c76 <dpllRefClkGet+0x46>
    5c5c:	f000 fd3a 	bl	66d4 <SystemCLKIN0Get>
    5c60:	2306      	movs	r3, #6
    5c62:	e008      	b.n	5c76 <dpllRefClkGet+0x46>
    5c64:	f640 41e5 	movw	r1, #3301	; 0xce5
    5c68:	4806      	ldr	r0, [pc, #24]	; (5c84 <dpllRefClkGet+0x54>)
    5c6a:	f7ff fdc9 	bl	5800 <assertEFM>
    5c6e:	2300      	movs	r3, #0
    5c70:	4618      	mov	r0, r3
    5c72:	e000      	b.n	5c76 <dpllRefClkGet+0x46>
    5c74:	2301      	movs	r3, #1
    5c76:	b105      	cbz	r5, 5c7a <dpllRefClkGet+0x4a>
    5c78:	6028      	str	r0, [r5, #0]
    5c7a:	b104      	cbz	r4, 5c7e <dpllRefClkGet+0x4e>
    5c7c:	7023      	strb	r3, [r4, #0]
    5c7e:	bd38      	pop	{r3, r4, r5, pc}
    5c80:	40008000 	.word	0x40008000
    5c84:	0000bcdc 	.word	0x0000bcdc

00005c88 <waitStateMax>:
    5c88:	b508      	push	{r3, lr}
    5c8a:	f000 fd19 	bl	66c0 <SystemMaxCoreClockGet>
    5c8e:	2100      	movs	r1, #0
    5c90:	f7ff fdb8 	bl	5804 <flashWaitStateControl>
    5c94:	bd08      	pop	{r3, pc}
	...

00005c98 <CMU_ClockDivGet>:
    5c98:	b510      	push	{r4, lr}
    5c9a:	3801      	subs	r0, #1
    5c9c:	280e      	cmp	r0, #14
    5c9e:	d820      	bhi.n	5ce2 <CMU_ClockDivGet+0x4a>
    5ca0:	e8df f000 	tbb	[pc, r0]
    5ca4:	1f1a1408 	.word	0x1f1a1408
    5ca8:	1f1f1f1f 	.word	0x1f1f1f1f
    5cac:	1f1f1f1f 	.word	0x1f1f1f1f
    5cb0:	1f1f      	.short	0x1f1f
    5cb2:	08          	.byte	0x08
    5cb3:	00          	.byte	0x00
    5cb4:	4b0c      	ldr	r3, [pc, #48]	; (5ce8 <CMU_ClockDivGet+0x50>)
    5cb6:	6f1c      	ldr	r4, [r3, #112]	; 0x70
    5cb8:	f3c4 3401 	ubfx	r4, r4, #12, #2
    5cbc:	2c02      	cmp	r4, #2
    5cbe:	d111      	bne.n	5ce4 <CMU_ClockDivGet+0x4c>
    5cc0:	f240 51d9 	movw	r1, #1497	; 0x5d9
    5cc4:	4809      	ldr	r0, [pc, #36]	; (5cec <CMU_ClockDivGet+0x54>)
    5cc6:	f7ff fd9b 	bl	5800 <assertEFM>
    5cca:	e00b      	b.n	5ce4 <CMU_ClockDivGet+0x4c>
    5ccc:	4b06      	ldr	r3, [pc, #24]	; (5ce8 <CMU_ClockDivGet+0x50>)
    5cce:	f8d3 4090 	ldr.w	r4, [r3, #144]	; 0x90
    5cd2:	f3c4 6404 	ubfx	r4, r4, #24, #5
    5cd6:	e005      	b.n	5ce4 <CMU_ClockDivGet+0x4c>
    5cd8:	4b03      	ldr	r3, [pc, #12]	; (5ce8 <CMU_ClockDivGet+0x50>)
    5cda:	6f1c      	ldr	r4, [r3, #112]	; 0x70
    5cdc:	f3c4 2480 	ubfx	r4, r4, #10, #1
    5ce0:	e000      	b.n	5ce4 <CMU_ClockDivGet+0x4c>
    5ce2:	2400      	movs	r4, #0
    5ce4:	1c60      	adds	r0, r4, #1
    5ce6:	bd10      	pop	{r4, pc}
    5ce8:	40008000 	.word	0x40008000
    5cec:	0000bcdc 	.word	0x0000bcdc

00005cf0 <CMU_ClockFreqGet>:
    5cf0:	b510      	push	{r4, lr}
    5cf2:	b082      	sub	sp, #8
    5cf4:	2300      	movs	r3, #0
    5cf6:	9301      	str	r3, [sp, #4]
    5cf8:	2825      	cmp	r0, #37	; 0x25
    5cfa:	d86a      	bhi.n	5dd2 <CMU_ClockFreqGet+0xe2>
    5cfc:	e8df f000 	tbb	[pc, r0]
    5d00:	271d1913 	.word	0x271d1913
    5d04:	46413c31 	.word	0x46413c31
    5d08:	5a55504b 	.word	0x5a55504b
    5d0c:	1969645f 	.word	0x1969645f
    5d10:	4b696946 	.word	0x4b696946
    5d14:	27312719 	.word	0x27312719
    5d18:	2746193c 	.word	0x2746193c
    5d1c:	41414164 	.word	0x41414164
    5d20:	27272741 	.word	0x27272741
    5d24:	5550      	.short	0x5550
    5d26:	f000 fc9f 	bl	6668 <SystemSYSCLKGet>
    5d2a:	9001      	str	r0, [sp, #4]
    5d2c:	9801      	ldr	r0, [sp, #4]
    5d2e:	b002      	add	sp, #8
    5d30:	bd10      	pop	{r4, pc}
    5d32:	f000 fcb3 	bl	669c <SystemHCLKGet>
    5d36:	9001      	str	r0, [sp, #4]
    5d38:	e7f8      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5d3a:	f000 fc95 	bl	6668 <SystemSYSCLKGet>
    5d3e:	4604      	mov	r4, r0
    5d40:	2002      	movs	r0, #2
    5d42:	f7ff ffa9 	bl	5c98 <CMU_ClockDivGet>
    5d46:	fbb4 f4f0 	udiv	r4, r4, r0
    5d4a:	9401      	str	r4, [sp, #4]
    5d4c:	e7ee      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5d4e:	f000 fca5 	bl	669c <SystemHCLKGet>
    5d52:	4604      	mov	r4, r0
    5d54:	2003      	movs	r0, #3
    5d56:	f7ff ff9f 	bl	5c98 <CMU_ClockDivGet>
    5d5a:	fbb4 f4f0 	udiv	r4, r4, r0
    5d5e:	9401      	str	r4, [sp, #4]
    5d60:	e7e4      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5d62:	f000 fc9b 	bl	669c <SystemHCLKGet>
    5d66:	4604      	mov	r4, r0
    5d68:	2003      	movs	r0, #3
    5d6a:	f7ff ff95 	bl	5c98 <CMU_ClockDivGet>
    5d6e:	fbb4 f4f0 	udiv	r4, r4, r0
    5d72:	0864      	lsrs	r4, r4, #1
    5d74:	9401      	str	r4, [sp, #4]
    5d76:	e7d9      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5d78:	2100      	movs	r1, #0
    5d7a:	a801      	add	r0, sp, #4
    5d7c:	f7ff fe48 	bl	5a10 <iadcClkGet>
    5d80:	e7d4      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5d82:	2100      	movs	r1, #0
    5d84:	a801      	add	r0, sp, #4
    5d86:	f7ff fe13 	bl	59b0 <em01GrpaClkGet>
    5d8a:	e7cf      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5d8c:	2100      	movs	r1, #0
    5d8e:	a801      	add	r0, sp, #4
    5d90:	f7ff fe70 	bl	5a74 <em23GrpaClkGet>
    5d94:	e7ca      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5d96:	2100      	movs	r1, #0
    5d98:	a801      	add	r0, sp, #4
    5d9a:	f7ff fe95 	bl	5ac8 <em4GrpaClkGet>
    5d9e:	e7c5      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5da0:	2100      	movs	r1, #0
    5da2:	a801      	add	r0, sp, #4
    5da4:	f7ff feba 	bl	5b1c <wdog0ClkGet>
    5da8:	e7c0      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5daa:	2100      	movs	r1, #0
    5dac:	a801      	add	r0, sp, #4
    5dae:	f7ff fee5 	bl	5b7c <wdog1ClkGet>
    5db2:	e7bb      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5db4:	2100      	movs	r1, #0
    5db6:	a801      	add	r0, sp, #4
    5db8:	f7ff ff3a 	bl	5c30 <dpllRefClkGet>
    5dbc:	e7b6      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5dbe:	2100      	movs	r1, #0
    5dc0:	a801      	add	r0, sp, #4
    5dc2:	f7ff fdd1 	bl	5968 <traceClkGet>
    5dc6:	e7b1      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5dc8:	2100      	movs	r1, #0
    5dca:	a801      	add	r0, sp, #4
    5dcc:	f7ff ff06 	bl	5bdc <rtccClkGet>
    5dd0:	e7ac      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5dd2:	f240 31ad 	movw	r1, #941	; 0x3ad
    5dd6:	4802      	ldr	r0, [pc, #8]	; (5de0 <CMU_ClockFreqGet+0xf0>)
    5dd8:	f7ff fd12 	bl	5800 <assertEFM>
    5ddc:	e7a6      	b.n	5d2c <CMU_ClockFreqGet+0x3c>
    5dde:	bf00      	nop
    5de0:	0000bcdc 	.word	0x0000bcdc

00005de4 <CMU_ClockSelectGet>:
    5de4:	b500      	push	{lr}
    5de6:	b083      	sub	sp, #12
    5de8:	2300      	movs	r3, #0
    5dea:	f88d 3007 	strb.w	r3, [sp, #7]
    5dee:	2825      	cmp	r0, #37	; 0x25
    5df0:	d86f      	bhi.n	5ed2 <CMU_ClockSelectGet+0xee>
    5df2:	e8df f000 	tbb	[pc, r0]
    5df6:	6e13      	.short	0x6e13
    5df8:	346e6e6e 	.word	0x346e6e6e
    5dfc:	504a443e 	.word	0x504a443e
    5e00:	68625c56 	.word	0x68625c56
    5e04:	6e446e6e 	.word	0x6e446e6e
    5e08:	6e6e4a6e 	.word	0x6e6e4a6e
    5e0c:	6e346e6e 	.word	0x6e346e6e
    5e10:	3e686e44 	.word	0x3e686e44
    5e14:	6e3e3e3e 	.word	0x6e3e3e3e
    5e18:	56506e6e 	.word	0x56506e6e
    5e1c:	4b30      	ldr	r3, [pc, #192]	; (5ee0 <CMU_ClockSelectGet+0xfc>)
    5e1e:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    5e20:	f003 0307 	and.w	r3, r3, #7
    5e24:	3b01      	subs	r3, #1
    5e26:	2b03      	cmp	r3, #3
    5e28:	d813      	bhi.n	5e52 <CMU_ClockSelectGet+0x6e>
    5e2a:	e8df f003 	tbb	[pc, r3]
    5e2e:	020e      	.short	0x020e
    5e30:	0a06      	.short	0x0a06
    5e32:	2304      	movs	r3, #4
    5e34:	f88d 3007 	strb.w	r3, [sp, #7]
    5e38:	e016      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5e3a:	2303      	movs	r3, #3
    5e3c:	f88d 3007 	strb.w	r3, [sp, #7]
    5e40:	e012      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5e42:	2306      	movs	r3, #6
    5e44:	f88d 3007 	strb.w	r3, [sp, #7]
    5e48:	e00e      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5e4a:	2302      	movs	r3, #2
    5e4c:	f88d 3007 	strb.w	r3, [sp, #7]
    5e50:	e00a      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5e52:	f240 6172 	movw	r1, #1650	; 0x672
    5e56:	4823      	ldr	r0, [pc, #140]	; (5ee4 <CMU_ClockSelectGet+0x100>)
    5e58:	f7ff fcd2 	bl	5800 <assertEFM>
    5e5c:	e004      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5e5e:	f10d 0107 	add.w	r1, sp, #7
    5e62:	2000      	movs	r0, #0
    5e64:	f7ff fdd4 	bl	5a10 <iadcClkGet>
    5e68:	f89d 0007 	ldrb.w	r0, [sp, #7]
    5e6c:	b003      	add	sp, #12
    5e6e:	f85d fb04 	ldr.w	pc, [sp], #4
    5e72:	f10d 0107 	add.w	r1, sp, #7
    5e76:	2000      	movs	r0, #0
    5e78:	f7ff fd9a 	bl	59b0 <em01GrpaClkGet>
    5e7c:	e7f4      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5e7e:	f10d 0107 	add.w	r1, sp, #7
    5e82:	2000      	movs	r0, #0
    5e84:	f7ff fdf6 	bl	5a74 <em23GrpaClkGet>
    5e88:	e7ee      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5e8a:	f10d 0107 	add.w	r1, sp, #7
    5e8e:	2000      	movs	r0, #0
    5e90:	f7ff fe1a 	bl	5ac8 <em4GrpaClkGet>
    5e94:	e7e8      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5e96:	f10d 0107 	add.w	r1, sp, #7
    5e9a:	2000      	movs	r0, #0
    5e9c:	f7ff fe3e 	bl	5b1c <wdog0ClkGet>
    5ea0:	e7e2      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5ea2:	f10d 0107 	add.w	r1, sp, #7
    5ea6:	2000      	movs	r0, #0
    5ea8:	f7ff fe68 	bl	5b7c <wdog1ClkGet>
    5eac:	e7dc      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5eae:	f10d 0107 	add.w	r1, sp, #7
    5eb2:	2000      	movs	r0, #0
    5eb4:	f7ff febc 	bl	5c30 <dpllRefClkGet>
    5eb8:	e7d6      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5eba:	f10d 0107 	add.w	r1, sp, #7
    5ebe:	2000      	movs	r0, #0
    5ec0:	f7ff fd52 	bl	5968 <traceClkGet>
    5ec4:	e7d0      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5ec6:	f10d 0107 	add.w	r1, sp, #7
    5eca:	2000      	movs	r0, #0
    5ecc:	f7ff fe86 	bl	5bdc <rtccClkGet>
    5ed0:	e7ca      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5ed2:	f240 7101 	movw	r1, #1793	; 0x701
    5ed6:	4803      	ldr	r0, [pc, #12]	; (5ee4 <CMU_ClockSelectGet+0x100>)
    5ed8:	f7ff fc92 	bl	5800 <assertEFM>
    5edc:	e7c4      	b.n	5e68 <CMU_ClockSelectGet+0x84>
    5ede:	bf00      	nop
    5ee0:	40008000 	.word	0x40008000
    5ee4:	0000bcdc 	.word	0x0000bcdc

00005ee8 <CMU_UpdateWaitStates>:
    5ee8:	b508      	push	{r3, lr}
    5eea:	2900      	cmp	r1, #0
    5eec:	dd03      	ble.n	5ef6 <CMU_UpdateWaitStates+0xe>
    5eee:	2101      	movs	r1, #1
    5ef0:	f7ff fc88 	bl	5804 <flashWaitStateControl>
    5ef4:	bd08      	pop	{r3, pc}
    5ef6:	2100      	movs	r1, #0
    5ef8:	f7ff fc84 	bl	5804 <flashWaitStateControl>
    5efc:	e7fa      	b.n	5ef4 <CMU_UpdateWaitStates+0xc>
	...

00005f00 <CMU_ClockDivSet>:
    5f00:	b510      	push	{r4, lr}
    5f02:	3801      	subs	r0, #1
    5f04:	280e      	cmp	r0, #14
    5f06:	d84b      	bhi.n	5fa0 <CMU_ClockDivSet+0xa0>
    5f08:	e8df f000 	tbb	[pc, r0]
    5f0c:	4a392608 	.word	0x4a392608
    5f10:	4a4a4a4a 	.word	0x4a4a4a4a
    5f14:	4a4a4a4a 	.word	0x4a4a4a4a
    5f18:	4a4a      	.short	0x4a4a
    5f1a:	08          	.byte	0x08
    5f1b:	00          	.byte	0x00
    5f1c:	1e4c      	subs	r4, r1, #1
    5f1e:	2c01      	cmp	r4, #1
    5f20:	d901      	bls.n	5f26 <CMU_ClockDivSet+0x26>
    5f22:	2904      	cmp	r1, #4
    5f24:	d112      	bne.n	5f4c <CMU_ClockDivSet+0x4c>
    5f26:	f7ff feaf 	bl	5c88 <waitStateMax>
    5f2a:	f000 f843 	bl	5fb4 <pclkDivMax>
    5f2e:	4a1f      	ldr	r2, [pc, #124]	; (5fac <CMU_ClockDivSet+0xac>)
    5f30:	6f13      	ldr	r3, [r2, #112]	; 0x70
    5f32:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
    5f36:	ea43 3304 	orr.w	r3, r3, r4, lsl #12
    5f3a:	6713      	str	r3, [r2, #112]	; 0x70
    5f3c:	f000 fbae 	bl	669c <SystemHCLKGet>
    5f40:	2100      	movs	r1, #0
    5f42:	f7ff ffd1 	bl	5ee8 <CMU_UpdateWaitStates>
    5f46:	f000 f83b 	bl	5fc0 <pclkDivOptimize>
    5f4a:	bd10      	pop	{r4, pc}
    5f4c:	f240 6116 	movw	r1, #1558	; 0x616
    5f50:	4817      	ldr	r0, [pc, #92]	; (5fb0 <CMU_ClockDivSet+0xb0>)
    5f52:	f7ff fc55 	bl	5800 <assertEFM>
    5f56:	e7e6      	b.n	5f26 <CMU_ClockDivSet+0x26>
    5f58:	1e4c      	subs	r4, r1, #1
    5f5a:	2c1f      	cmp	r4, #31
    5f5c:	d809      	bhi.n	5f72 <CMU_ClockDivSet+0x72>
    5f5e:	4b13      	ldr	r3, [pc, #76]	; (5fac <CMU_ClockDivSet+0xac>)
    5f60:	f8d3 1090 	ldr.w	r1, [r3, #144]	; 0x90
    5f64:	f021 51f8 	bic.w	r1, r1, #520093696	; 0x1f000000
    5f68:	ea41 6104 	orr.w	r1, r1, r4, lsl #24
    5f6c:	f8c3 1090 	str.w	r1, [r3, #144]	; 0x90
    5f70:	e7eb      	b.n	5f4a <CMU_ClockDivSet+0x4a>
    5f72:	f240 613c 	movw	r1, #1596	; 0x63c
    5f76:	480e      	ldr	r0, [pc, #56]	; (5fb0 <CMU_ClockDivSet+0xb0>)
    5f78:	f7ff fc42 	bl	5800 <assertEFM>
    5f7c:	e7ef      	b.n	5f5e <CMU_ClockDivSet+0x5e>
    5f7e:	1e4c      	subs	r4, r1, #1
    5f80:	2c01      	cmp	r4, #1
    5f82:	d807      	bhi.n	5f94 <CMU_ClockDivSet+0x94>
    5f84:	4b09      	ldr	r3, [pc, #36]	; (5fac <CMU_ClockDivSet+0xac>)
    5f86:	6f19      	ldr	r1, [r3, #112]	; 0x70
    5f88:	f421 6180 	bic.w	r1, r1, #1024	; 0x400
    5f8c:	ea41 2184 	orr.w	r1, r1, r4, lsl #10
    5f90:	6719      	str	r1, [r3, #112]	; 0x70
    5f92:	e7da      	b.n	5f4a <CMU_ClockDivSet+0x4a>
    5f94:	f240 6142 	movw	r1, #1602	; 0x642
    5f98:	4805      	ldr	r0, [pc, #20]	; (5fb0 <CMU_ClockDivSet+0xb0>)
    5f9a:	f7ff fc31 	bl	5800 <assertEFM>
    5f9e:	e7f1      	b.n	5f84 <CMU_ClockDivSet+0x84>
    5fa0:	f44f 61c9 	mov.w	r1, #1608	; 0x648
    5fa4:	4802      	ldr	r0, [pc, #8]	; (5fb0 <CMU_ClockDivSet+0xb0>)
    5fa6:	f7ff fc2b 	bl	5800 <assertEFM>
    5faa:	e7ce      	b.n	5f4a <CMU_ClockDivSet+0x4a>
    5fac:	40008000 	.word	0x40008000
    5fb0:	0000bcdc 	.word	0x0000bcdc

00005fb4 <pclkDivMax>:
    5fb4:	b508      	push	{r3, lr}
    5fb6:	2102      	movs	r1, #2
    5fb8:	2003      	movs	r0, #3
    5fba:	f7ff ffa1 	bl	5f00 <CMU_ClockDivSet>
    5fbe:	bd08      	pop	{r3, pc}

00005fc0 <pclkDivOptimize>:
    5fc0:	b508      	push	{r3, lr}
    5fc2:	2001      	movs	r0, #1
    5fc4:	f7ff fe94 	bl	5cf0 <CMU_ClockFreqGet>
    5fc8:	4b04      	ldr	r3, [pc, #16]	; (5fdc <pclkDivOptimize+0x1c>)
    5fca:	4298      	cmp	r0, r3
    5fcc:	d904      	bls.n	5fd8 <pclkDivOptimize+0x18>
    5fce:	2102      	movs	r1, #2
    5fd0:	2003      	movs	r0, #3
    5fd2:	f7ff ff95 	bl	5f00 <CMU_ClockDivSet>
    5fd6:	bd08      	pop	{r3, pc}
    5fd8:	2101      	movs	r1, #1
    5fda:	e7f9      	b.n	5fd0 <pclkDivOptimize+0x10>
    5fdc:	02faf080 	.word	0x02faf080

00005fe0 <CMU_HFRCODPLLBandSet>:
    5fe0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    5fe2:	4605      	mov	r5, r0
    5fe4:	f7ff fc3a 	bl	585c <HFRCODPLLDevinfoGet>
    5fe8:	4604      	mov	r4, r0
    5fea:	1e43      	subs	r3, r0, #1
    5fec:	f113 0f03 	cmn.w	r3, #3
    5ff0:	d829      	bhi.n	6046 <CMU_HFRCODPLLBandSet+0x66>
    5ff2:	4b30      	ldr	r3, [pc, #192]	; (60b4 <CMU_HFRCODPLLBandSet+0xd4>)
    5ff4:	685b      	ldr	r3, [r3, #4]
    5ff6:	2b01      	cmp	r3, #1
    5ff8:	d02b      	beq.n	6052 <CMU_HFRCODPLLBandSet+0x72>
    5ffa:	2000      	movs	r0, #0
    5ffc:	f7ff fef2 	bl	5de4 <CMU_ClockSelectGet>
    6000:	2804      	cmp	r0, #4
    6002:	d02f      	beq.n	6064 <CMU_HFRCODPLLBandSet+0x84>
    6004:	f024 7440 	bic.w	r4, r4, #50331648	; 0x3000000
    6008:	4b2b      	ldr	r3, [pc, #172]	; (60b8 <CMU_HFRCODPLLBandSet+0xd8>)
    600a:	429d      	cmp	r5, r3
    600c:	d02f      	beq.n	606e <CMU_HFRCODPLLBandSet+0x8e>
    600e:	4b2b      	ldr	r3, [pc, #172]	; (60bc <CMU_HFRCODPLLBandSet+0xdc>)
    6010:	429d      	cmp	r5, r3
    6012:	d02f      	beq.n	6074 <CMU_HFRCODPLLBandSet+0x94>
    6014:	4b2a      	ldr	r3, [pc, #168]	; (60c0 <CMU_HFRCODPLLBandSet+0xe0>)
    6016:	68db      	ldr	r3, [r3, #12]
    6018:	f013 0f06 	tst.w	r3, #6
    601c:	d1fa      	bne.n	6014 <CMU_HFRCODPLLBandSet+0x34>
    601e:	4b28      	ldr	r3, [pc, #160]	; (60c0 <CMU_HFRCODPLLBandSet+0xe0>)
    6020:	689f      	ldr	r7, [r3, #8]
    6022:	609c      	str	r4, [r3, #8]
    6024:	f404 14f8 	and.w	r4, r4, #2031616	; 0x1f0000
    6028:	689e      	ldr	r6, [r3, #8]
    602a:	f406 16f8 	and.w	r6, r6, #2031616	; 0x1f0000
    602e:	42b4      	cmp	r4, r6
    6030:	d123      	bne.n	607a <CMU_HFRCODPLLBandSet+0x9a>
    6032:	42b4      	cmp	r4, r6
    6034:	d027      	beq.n	6086 <CMU_HFRCODPLLBandSet+0xa6>
    6036:	4b22      	ldr	r3, [pc, #136]	; (60c0 <CMU_HFRCODPLLBandSet+0xe0>)
    6038:	609f      	str	r7, [r3, #8]
    603a:	2000      	movs	r0, #0
    603c:	f7ff fed2 	bl	5de4 <CMU_ClockSelectGet>
    6040:	2804      	cmp	r0, #4
    6042:	d024      	beq.n	608e <CMU_HFRCODPLLBandSet+0xae>
    6044:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    6046:	f640 2171 	movw	r1, #2673	; 0xa71
    604a:	481e      	ldr	r0, [pc, #120]	; (60c4 <CMU_HFRCODPLLBandSet+0xe4>)
    604c:	f7ff fbd8 	bl	5800 <assertEFM>
    6050:	e7cf      	b.n	5ff2 <CMU_HFRCODPLLBandSet+0x12>
    6052:	4b1d      	ldr	r3, [pc, #116]	; (60c8 <CMU_HFRCODPLLBandSet+0xe8>)
    6054:	2201      	movs	r2, #1
    6056:	605a      	str	r2, [r3, #4]
    6058:	4b16      	ldr	r3, [pc, #88]	; (60b4 <CMU_HFRCODPLLBandSet+0xd4>)
    605a:	699b      	ldr	r3, [r3, #24]
    605c:	f013 0f03 	tst.w	r3, #3
    6060:	d1fa      	bne.n	6058 <CMU_HFRCODPLLBandSet+0x78>
    6062:	e7ca      	b.n	5ffa <CMU_HFRCODPLLBandSet+0x1a>
    6064:	f7ff fe10 	bl	5c88 <waitStateMax>
    6068:	f7ff ffa4 	bl	5fb4 <pclkDivMax>
    606c:	e7ca      	b.n	6004 <CMU_HFRCODPLLBandSet+0x24>
    606e:	f044 7400 	orr.w	r4, r4, #33554432	; 0x2000000
    6072:	e7cf      	b.n	6014 <CMU_HFRCODPLLBandSet+0x34>
    6074:	f044 7480 	orr.w	r4, r4, #16777216	; 0x1000000
    6078:	e7cc      	b.n	6014 <CMU_HFRCODPLLBandSet+0x34>
    607a:	f640 21b8 	movw	r1, #2744	; 0xab8
    607e:	4811      	ldr	r0, [pc, #68]	; (60c4 <CMU_HFRCODPLLBandSet+0xe4>)
    6080:	f7ff fbbe 	bl	5800 <assertEFM>
    6084:	e7d5      	b.n	6032 <CMU_HFRCODPLLBandSet+0x52>
    6086:	4628      	mov	r0, r5
    6088:	f000 fae8 	bl	665c <SystemHFRCODPLLClockSet>
    608c:	e7d5      	b.n	603a <CMU_HFRCODPLLBandSet+0x5a>
    608e:	f000 fb05 	bl	669c <SystemHCLKGet>
    6092:	4604      	mov	r4, r0
    6094:	4285      	cmp	r5, r0
    6096:	d306      	bcc.n	60a6 <CMU_HFRCODPLLBandSet+0xc6>
    6098:	2100      	movs	r1, #0
    609a:	4620      	mov	r0, r4
    609c:	f7ff ff24 	bl	5ee8 <CMU_UpdateWaitStates>
    60a0:	f7ff ff8e 	bl	5fc0 <pclkDivOptimize>
    60a4:	e7ce      	b.n	6044 <CMU_HFRCODPLLBandSet+0x64>
    60a6:	f640 21c9 	movw	r1, #2761	; 0xac9
    60aa:	4806      	ldr	r0, [pc, #24]	; (60c4 <CMU_HFRCODPLLBandSet+0xe4>)
    60ac:	f7ff fba8 	bl	5800 <assertEFM>
    60b0:	e7f2      	b.n	6098 <CMU_HFRCODPLLBandSet+0xb8>
    60b2:	bf00      	nop
    60b4:	4001c000 	.word	0x4001c000
    60b8:	000f4240 	.word	0x000f4240
    60bc:	001e8480 	.word	0x001e8480
    60c0:	40010000 	.word	0x40010000
    60c4:	0000bcdc 	.word	0x0000bcdc
    60c8:	4001e000 	.word	0x4001e000

000060cc <CORE_EnterCritical>:
    60cc:	f3ef 8010 	mrs	r0, PRIMASK
    60d0:	b672      	cpsid	i
    60d2:	4770      	bx	lr

000060d4 <CORE_ExitCritical>:
    60d4:	b900      	cbnz	r0, 60d8 <CORE_ExitCritical+0x4>
    60d6:	b662      	cpsie	i
    60d8:	4770      	bx	lr

000060da <CORE_AtomicDisableIrq>:
    60da:	b672      	cpsid	i
    60dc:	4770      	bx	lr

000060de <CORE_EnterAtomic>:
    60de:	f3ef 8010 	mrs	r0, PRIMASK
    60e2:	b672      	cpsid	i
    60e4:	4770      	bx	lr

000060e6 <CORE_ExitAtomic>:
    60e6:	b900      	cbnz	r0, 60ea <CORE_ExitAtomic+0x4>
    60e8:	b662      	cpsie	i
    60ea:	4770      	bx	lr

000060ec <GPIO_PinModeSet>:
    60ec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    60ee:	460d      	mov	r5, r1
    60f0:	4616      	mov	r6, r2
    60f2:	461f      	mov	r7, r3
    60f4:	4604      	mov	r4, r0
    60f6:	b148      	cbz	r0, 610c <GPIO_PinModeSet+0x20>
    60f8:	2801      	cmp	r0, #1
    60fa:	d018      	beq.n	612e <GPIO_PinModeSet+0x42>
    60fc:	2802      	cmp	r0, #2
    60fe:	d018      	beq.n	6132 <GPIO_PinModeSet+0x46>
    6100:	2803      	cmp	r0, #3
    6102:	d001      	beq.n	6108 <GPIO_PinModeSet+0x1c>
    6104:	2300      	movs	r3, #0
    6106:	e002      	b.n	610e <GPIO_PinModeSet+0x22>
    6108:	231f      	movs	r3, #31
    610a:	e000      	b.n	610e <GPIO_PinModeSet+0x22>
    610c:	237f      	movs	r3, #127	; 0x7f
    610e:	40eb      	lsrs	r3, r5
    6110:	f013 0f01 	tst.w	r3, #1
    6114:	d00f      	beq.n	6136 <GPIO_PinModeSet+0x4a>
    6116:	b33e      	cbz	r6, 6168 <GPIO_PinModeSet+0x7c>
    6118:	2f00      	cmp	r7, #0
    611a:	d052      	beq.n	61c2 <GPIO_PinModeSet+0xd6>
    611c:	b19c      	cbz	r4, 6146 <GPIO_PinModeSet+0x5a>
    611e:	2c01      	cmp	r4, #1
    6120:	d045      	beq.n	61ae <GPIO_PinModeSet+0xc2>
    6122:	2c02      	cmp	r4, #2
    6124:	d045      	beq.n	61b2 <GPIO_PinModeSet+0xc6>
    6126:	2c03      	cmp	r4, #3
    6128:	d00b      	beq.n	6142 <GPIO_PinModeSet+0x56>
    612a:	2300      	movs	r3, #0
    612c:	e00c      	b.n	6148 <GPIO_PinModeSet+0x5c>
    612e:	2303      	movs	r3, #3
    6130:	e7ed      	b.n	610e <GPIO_PinModeSet+0x22>
    6132:	233f      	movs	r3, #63	; 0x3f
    6134:	e7eb      	b.n	610e <GPIO_PinModeSet+0x22>
    6136:	f240 111d 	movw	r1, #285	; 0x11d
    613a:	4863      	ldr	r0, [pc, #396]	; (62c8 <GPIO_PinModeSet+0x1dc>)
    613c:	f7ff fb60 	bl	5800 <assertEFM>
    6140:	e7e9      	b.n	6116 <GPIO_PinModeSet+0x2a>
    6142:	231f      	movs	r3, #31
    6144:	e000      	b.n	6148 <GPIO_PinModeSet+0x5c>
    6146:	237f      	movs	r3, #127	; 0x7f
    6148:	40eb      	lsrs	r3, r5
    614a:	f013 0f01 	tst.w	r3, #1
    614e:	d032      	beq.n	61b6 <GPIO_PinModeSet+0xca>
    6150:	2201      	movs	r2, #1
    6152:	40aa      	lsls	r2, r5
    6154:	eb04 0344 	add.w	r3, r4, r4, lsl #1
    6158:	011b      	lsls	r3, r3, #4
    615a:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    615e:	f503 3370 	add.w	r3, r3, #245760	; 0x3c000
    6162:	f241 0110 	movw	r1, #4112	; 0x1010
    6166:	505a      	str	r2, [r3, r1]
    6168:	2d07      	cmp	r5, #7
    616a:	d851      	bhi.n	6210 <GPIO_PinModeSet+0x124>
    616c:	4a57      	ldr	r2, [pc, #348]	; (62cc <GPIO_PinModeSet+0x1e0>)
    616e:	eb04 0344 	add.w	r3, r4, r4, lsl #1
    6172:	eb02 1303 	add.w	r3, r2, r3, lsl #4
    6176:	685b      	ldr	r3, [r3, #4]
    6178:	00a9      	lsls	r1, r5, #2
    617a:	200f      	movs	r0, #15
    617c:	4088      	lsls	r0, r1
    617e:	ea23 0300 	bic.w	r3, r3, r0
    6182:	fa06 f101 	lsl.w	r1, r6, r1
    6186:	430b      	orrs	r3, r1
    6188:	eb04 0144 	add.w	r1, r4, r4, lsl #1
    618c:	eb02 1201 	add.w	r2, r2, r1, lsl #4
    6190:	6053      	str	r3, [r2, #4]
    6192:	2e00      	cmp	r6, #0
    6194:	d166      	bne.n	6264 <GPIO_PinModeSet+0x178>
    6196:	2f00      	cmp	r7, #0
    6198:	d06f      	beq.n	627a <GPIO_PinModeSet+0x18e>
    619a:	2c00      	cmp	r4, #0
    619c:	d050      	beq.n	6240 <GPIO_PinModeSet+0x154>
    619e:	2c01      	cmp	r4, #1
    61a0:	d061      	beq.n	6266 <GPIO_PinModeSet+0x17a>
    61a2:	2c02      	cmp	r4, #2
    61a4:	d061      	beq.n	626a <GPIO_PinModeSet+0x17e>
    61a6:	2c03      	cmp	r4, #3
    61a8:	d048      	beq.n	623c <GPIO_PinModeSet+0x150>
    61aa:	2300      	movs	r3, #0
    61ac:	e049      	b.n	6242 <GPIO_PinModeSet+0x156>
    61ae:	2303      	movs	r3, #3
    61b0:	e7ca      	b.n	6148 <GPIO_PinModeSet+0x5c>
    61b2:	233f      	movs	r3, #63	; 0x3f
    61b4:	e7c8      	b.n	6148 <GPIO_PinModeSet+0x5c>
    61b6:	f44f 6182 	mov.w	r1, #1040	; 0x410
    61ba:	4845      	ldr	r0, [pc, #276]	; (62d0 <GPIO_PinModeSet+0x1e4>)
    61bc:	f7ff fb20 	bl	5800 <assertEFM>
    61c0:	e7c6      	b.n	6150 <GPIO_PinModeSet+0x64>
    61c2:	b14c      	cbz	r4, 61d8 <GPIO_PinModeSet+0xec>
    61c4:	2c01      	cmp	r4, #1
    61c6:	d019      	beq.n	61fc <GPIO_PinModeSet+0x110>
    61c8:	2c02      	cmp	r4, #2
    61ca:	d019      	beq.n	6200 <GPIO_PinModeSet+0x114>
    61cc:	2c03      	cmp	r4, #3
    61ce:	d001      	beq.n	61d4 <GPIO_PinModeSet+0xe8>
    61d0:	463b      	mov	r3, r7
    61d2:	e002      	b.n	61da <GPIO_PinModeSet+0xee>
    61d4:	231f      	movs	r3, #31
    61d6:	e000      	b.n	61da <GPIO_PinModeSet+0xee>
    61d8:	237f      	movs	r3, #127	; 0x7f
    61da:	40eb      	lsrs	r3, r5
    61dc:	f013 0f01 	tst.w	r3, #1
    61e0:	d010      	beq.n	6204 <GPIO_PinModeSet+0x118>
    61e2:	2201      	movs	r2, #1
    61e4:	40aa      	lsls	r2, r5
    61e6:	eb04 0344 	add.w	r3, r4, r4, lsl #1
    61ea:	011b      	lsls	r3, r3, #4
    61ec:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    61f0:	f503 3370 	add.w	r3, r3, #245760	; 0x3c000
    61f4:	f242 0110 	movw	r1, #8208	; 0x2010
    61f8:	505a      	str	r2, [r3, r1]
    61fa:	e7b5      	b.n	6168 <GPIO_PinModeSet+0x7c>
    61fc:	2303      	movs	r3, #3
    61fe:	e7ec      	b.n	61da <GPIO_PinModeSet+0xee>
    6200:	233f      	movs	r3, #63	; 0x3f
    6202:	e7ea      	b.n	61da <GPIO_PinModeSet+0xee>
    6204:	f240 31e1 	movw	r1, #993	; 0x3e1
    6208:	4831      	ldr	r0, [pc, #196]	; (62d0 <GPIO_PinModeSet+0x1e4>)
    620a:	f7ff faf9 	bl	5800 <assertEFM>
    620e:	e7e8      	b.n	61e2 <GPIO_PinModeSet+0xf6>
    6210:	492e      	ldr	r1, [pc, #184]	; (62cc <GPIO_PinModeSet+0x1e0>)
    6212:	eb04 0344 	add.w	r3, r4, r4, lsl #1
    6216:	eb01 1303 	add.w	r3, r1, r3, lsl #4
    621a:	68da      	ldr	r2, [r3, #12]
    621c:	f1a5 0308 	sub.w	r3, r5, #8
    6220:	009b      	lsls	r3, r3, #2
    6222:	200f      	movs	r0, #15
    6224:	4098      	lsls	r0, r3
    6226:	ea22 0200 	bic.w	r2, r2, r0
    622a:	fa06 f303 	lsl.w	r3, r6, r3
    622e:	4313      	orrs	r3, r2
    6230:	eb04 0244 	add.w	r2, r4, r4, lsl #1
    6234:	eb01 1102 	add.w	r1, r1, r2, lsl #4
    6238:	60cb      	str	r3, [r1, #12]
    623a:	e7aa      	b.n	6192 <GPIO_PinModeSet+0xa6>
    623c:	231f      	movs	r3, #31
    623e:	e000      	b.n	6242 <GPIO_PinModeSet+0x156>
    6240:	237f      	movs	r3, #127	; 0x7f
    6242:	40eb      	lsrs	r3, r5
    6244:	f013 0f01 	tst.w	r3, #1
    6248:	d011      	beq.n	626e <GPIO_PinModeSet+0x182>
    624a:	2101      	movs	r1, #1
    624c:	fa01 f505 	lsl.w	r5, r1, r5
    6250:	eb04 0444 	add.w	r4, r4, r4, lsl #1
    6254:	0124      	lsls	r4, r4, #4
    6256:	f104 4480 	add.w	r4, r4, #1073741824	; 0x40000000
    625a:	f504 3470 	add.w	r4, r4, #245760	; 0x3c000
    625e:	f241 0310 	movw	r3, #4112	; 0x1010
    6262:	50e5      	str	r5, [r4, r3]
    6264:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    6266:	2303      	movs	r3, #3
    6268:	e7eb      	b.n	6242 <GPIO_PinModeSet+0x156>
    626a:	233f      	movs	r3, #63	; 0x3f
    626c:	e7e9      	b.n	6242 <GPIO_PinModeSet+0x156>
    626e:	f44f 6182 	mov.w	r1, #1040	; 0x410
    6272:	4817      	ldr	r0, [pc, #92]	; (62d0 <GPIO_PinModeSet+0x1e4>)
    6274:	f7ff fac4 	bl	5800 <assertEFM>
    6278:	e7e7      	b.n	624a <GPIO_PinModeSet+0x15e>
    627a:	b13c      	cbz	r4, 628c <GPIO_PinModeSet+0x1a0>
    627c:	2c01      	cmp	r4, #1
    627e:	d018      	beq.n	62b2 <GPIO_PinModeSet+0x1c6>
    6280:	2c02      	cmp	r4, #2
    6282:	d018      	beq.n	62b6 <GPIO_PinModeSet+0x1ca>
    6284:	2c03      	cmp	r4, #3
    6286:	d102      	bne.n	628e <GPIO_PinModeSet+0x1a2>
    6288:	271f      	movs	r7, #31
    628a:	e000      	b.n	628e <GPIO_PinModeSet+0x1a2>
    628c:	277f      	movs	r7, #127	; 0x7f
    628e:	40ef      	lsrs	r7, r5
    6290:	f017 0f01 	tst.w	r7, #1
    6294:	d011      	beq.n	62ba <GPIO_PinModeSet+0x1ce>
    6296:	2101      	movs	r1, #1
    6298:	fa01 f505 	lsl.w	r5, r1, r5
    629c:	eb04 0444 	add.w	r4, r4, r4, lsl #1
    62a0:	0124      	lsls	r4, r4, #4
    62a2:	f104 4480 	add.w	r4, r4, #1073741824	; 0x40000000
    62a6:	f504 3470 	add.w	r4, r4, #245760	; 0x3c000
    62aa:	f242 0310 	movw	r3, #8208	; 0x2010
    62ae:	50e5      	str	r5, [r4, r3]
    62b0:	e7d8      	b.n	6264 <GPIO_PinModeSet+0x178>
    62b2:	2703      	movs	r7, #3
    62b4:	e7eb      	b.n	628e <GPIO_PinModeSet+0x1a2>
    62b6:	273f      	movs	r7, #63	; 0x3f
    62b8:	e7e9      	b.n	628e <GPIO_PinModeSet+0x1a2>
    62ba:	f240 31e1 	movw	r1, #993	; 0x3e1
    62be:	4804      	ldr	r0, [pc, #16]	; (62d0 <GPIO_PinModeSet+0x1e4>)
    62c0:	f7ff fa9e 	bl	5800 <assertEFM>
    62c4:	e7e7      	b.n	6296 <GPIO_PinModeSet+0x1aa>
    62c6:	bf00      	nop
    62c8:	0000bd24 	.word	0x0000bd24
    62cc:	4003c000 	.word	0x4003c000
    62d0:	0000bd70 	.word	0x0000bd70

000062d4 <SYSTEM_ChipRevisionGet>:
    62d4:	4b05      	ldr	r3, [pc, #20]	; (62ec <SYSTEM_ChipRevisionGet+0x18>)
    62d6:	695b      	ldr	r3, [r3, #20]
    62d8:	f3c3 1285 	ubfx	r2, r3, #6, #6
    62dc:	7082      	strb	r2, [r0, #2]
    62de:	f003 023f 	and.w	r2, r3, #63	; 0x3f
    62e2:	7042      	strb	r2, [r0, #1]
    62e4:	0b1b      	lsrs	r3, r3, #12
    62e6:	7003      	strb	r3, [r0, #0]
    62e8:	4770      	bx	lr
    62ea:	bf00      	nop
    62ec:	4007c000 	.word	0x4007c000

000062f0 <prsRxInput>:
    62f0:	4b0e      	ldr	r3, [pc, #56]	; (632c <prsRxInput+0x3c>)
    62f2:	4298      	cmp	r0, r3
    62f4:	d00a      	beq.n	630c <prsRxInput+0x1c>
    62f6:	4b0e      	ldr	r3, [pc, #56]	; (6330 <prsRxInput+0x40>)
    62f8:	4298      	cmp	r0, r3
    62fa:	d00c      	beq.n	6316 <prsRxInput+0x26>
    62fc:	4b0d      	ldr	r3, [pc, #52]	; (6334 <prsRxInput+0x44>)
    62fe:	4298      	cmp	r0, r3
    6300:	d00e      	beq.n	6320 <prsRxInput+0x30>
    6302:	6dc3      	ldr	r3, [r0, #92]	; 0x5c
    6304:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    6308:	65c3      	str	r3, [r0, #92]	; 0x5c
    630a:	4770      	bx	lr
    630c:	f5a3 3300 	sub.w	r3, r3, #131072	; 0x20000
    6310:	f8c3 1184 	str.w	r1, [r3, #388]	; 0x184
    6314:	e7f5      	b.n	6302 <prsRxInput+0x12>
    6316:	f5a3 3310 	sub.w	r3, r3, #147456	; 0x24000
    631a:	f8c3 1194 	str.w	r1, [r3, #404]	; 0x194
    631e:	e7f0      	b.n	6302 <prsRxInput+0x12>
    6320:	f5a3 3320 	sub.w	r3, r3, #163840	; 0x28000
    6324:	f8c3 11a4 	str.w	r1, [r3, #420]	; 0x1a4
    6328:	e7eb      	b.n	6302 <prsRxInput+0x12>
    632a:	bf00      	nop
    632c:	40058000 	.word	0x40058000
    6330:	4005c000 	.word	0x4005c000
    6334:	40060000 	.word	0x40060000

00006338 <USART_BaudrateAsyncSet>:
    6338:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    633a:	4605      	mov	r5, r0
    633c:	460e      	mov	r6, r1
    633e:	461c      	mov	r4, r3
    6340:	4617      	mov	r7, r2
    6342:	b15a      	cbz	r2, 635c <USART_BaudrateAsyncSet+0x24>
    6344:	b186      	cbz	r6, 6368 <USART_BaudrateAsyncSet+0x30>
    6346:	2c40      	cmp	r4, #64	; 0x40
    6348:	d044      	beq.n	63d4 <USART_BaudrateAsyncSet+0x9c>
    634a:	d812      	bhi.n	6372 <USART_BaudrateAsyncSet+0x3a>
    634c:	b1c4      	cbz	r4, 6380 <USART_BaudrateAsyncSet+0x48>
    634e:	2c20      	cmp	r4, #32
    6350:	d156      	bne.n	6400 <USART_BaudrateAsyncSet+0xc8>
    6352:	ebb7 0fd6 	cmp.w	r7, r6, lsr #3
    6356:	d836      	bhi.n	63c6 <USART_BaudrateAsyncSet+0x8e>
    6358:	2308      	movs	r3, #8
    635a:	e015      	b.n	6388 <USART_BaudrateAsyncSet+0x50>
    635c:	f44f 71a1 	mov.w	r1, #322	; 0x142
    6360:	482d      	ldr	r0, [pc, #180]	; (6418 <USART_BaudrateAsyncSet+0xe0>)
    6362:	f7ff fa4d 	bl	5800 <assertEFM>
    6366:	e7ed      	b.n	6344 <USART_BaudrateAsyncSet+0xc>
    6368:	2003      	movs	r0, #3
    636a:	f7ff fcc1 	bl	5cf0 <CMU_ClockFreqGet>
    636e:	4606      	mov	r6, r0
    6370:	e7e9      	b.n	6346 <USART_BaudrateAsyncSet+0xe>
    6372:	2c60      	cmp	r4, #96	; 0x60
    6374:	d144      	bne.n	6400 <USART_BaudrateAsyncSet+0xc8>
    6376:	ebb7 0f96 	cmp.w	r7, r6, lsr #2
    637a:	d83a      	bhi.n	63f2 <USART_BaudrateAsyncSet+0xba>
    637c:	2304      	movs	r3, #4
    637e:	e003      	b.n	6388 <USART_BaudrateAsyncSet+0x50>
    6380:	ebb7 1f16 	cmp.w	r7, r6, lsr #4
    6384:	d818      	bhi.n	63b8 <USART_BaudrateAsyncSet+0x80>
    6386:	2310      	movs	r3, #16
    6388:	fb07 f103 	mul.w	r1, r7, r3
    638c:	084b      	lsrs	r3, r1, #1
    638e:	eb03 1346 	add.w	r3, r3, r6, lsl #5
    6392:	fbb3 f3f1 	udiv	r3, r3, r1
    6396:	3b20      	subs	r3, #32
    6398:	00de      	lsls	r6, r3, #3
    639a:	4a20      	ldr	r2, [pc, #128]	; (641c <USART_BaudrateAsyncSet+0xe4>)
    639c:	ebb2 0fc3 	cmp.w	r2, r3, lsl #3
    63a0:	d334      	bcc.n	640c <USART_BaudrateAsyncSet+0xd4>
    63a2:	4a1e      	ldr	r2, [pc, #120]	; (641c <USART_BaudrateAsyncSet+0xe4>)
    63a4:	4032      	ands	r2, r6
    63a6:	68ab      	ldr	r3, [r5, #8]
    63a8:	f023 0360 	bic.w	r3, r3, #96	; 0x60
    63ac:	60ab      	str	r3, [r5, #8]
    63ae:	68ab      	ldr	r3, [r5, #8]
    63b0:	431c      	orrs	r4, r3
    63b2:	60ac      	str	r4, [r5, #8]
    63b4:	61ea      	str	r2, [r5, #28]
    63b6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    63b8:	f44f 71ba 	mov.w	r1, #372	; 0x174
    63bc:	4816      	ldr	r0, [pc, #88]	; (6418 <USART_BaudrateAsyncSet+0xe0>)
    63be:	f7ff fa1f 	bl	5800 <assertEFM>
    63c2:	2310      	movs	r3, #16
    63c4:	e7e0      	b.n	6388 <USART_BaudrateAsyncSet+0x50>
    63c6:	f240 1179 	movw	r1, #377	; 0x179
    63ca:	4813      	ldr	r0, [pc, #76]	; (6418 <USART_BaudrateAsyncSet+0xe0>)
    63cc:	f7ff fa18 	bl	5800 <assertEFM>
    63d0:	2308      	movs	r3, #8
    63d2:	e7d9      	b.n	6388 <USART_BaudrateAsyncSet+0x50>
    63d4:	4b12      	ldr	r3, [pc, #72]	; (6420 <USART_BaudrateAsyncSet+0xe8>)
    63d6:	fba3 2306 	umull	r2, r3, r3, r6
    63da:	ebb7 0f93 	cmp.w	r7, r3, lsr #2
    63de:	d801      	bhi.n	63e4 <USART_BaudrateAsyncSet+0xac>
    63e0:	2306      	movs	r3, #6
    63e2:	e7d1      	b.n	6388 <USART_BaudrateAsyncSet+0x50>
    63e4:	f44f 71bf 	mov.w	r1, #382	; 0x17e
    63e8:	480b      	ldr	r0, [pc, #44]	; (6418 <USART_BaudrateAsyncSet+0xe0>)
    63ea:	f7ff fa09 	bl	5800 <assertEFM>
    63ee:	2306      	movs	r3, #6
    63f0:	e7ca      	b.n	6388 <USART_BaudrateAsyncSet+0x50>
    63f2:	f240 1183 	movw	r1, #387	; 0x183
    63f6:	4808      	ldr	r0, [pc, #32]	; (6418 <USART_BaudrateAsyncSet+0xe0>)
    63f8:	f7ff fa02 	bl	5800 <assertEFM>
    63fc:	2304      	movs	r3, #4
    63fe:	e7c3      	b.n	6388 <USART_BaudrateAsyncSet+0x50>
    6400:	f240 1189 	movw	r1, #393	; 0x189
    6404:	4804      	ldr	r0, [pc, #16]	; (6418 <USART_BaudrateAsyncSet+0xe0>)
    6406:	f7ff f9fb 	bl	5800 <assertEFM>
    640a:	e7d4      	b.n	63b6 <USART_BaudrateAsyncSet+0x7e>
    640c:	f240 119f 	movw	r1, #415	; 0x19f
    6410:	4801      	ldr	r0, [pc, #4]	; (6418 <USART_BaudrateAsyncSet+0xe0>)
    6412:	f7ff f9f5 	bl	5800 <assertEFM>
    6416:	e7c4      	b.n	63a2 <USART_BaudrateAsyncSet+0x6a>
    6418:	0000bdbc 	.word	0x0000bdbc
    641c:	007ffff8 	.word	0x007ffff8
    6420:	aaaaaaab 	.word	0xaaaaaaab

00006424 <USART_Reset>:
    6424:	b510      	push	{r4, lr}
    6426:	4604      	mov	r4, r0
    6428:	4b21      	ldr	r3, [pc, #132]	; (64b0 <USART_Reset+0x8c>)
    642a:	4298      	cmp	r0, r3
    642c:	d00c      	beq.n	6448 <USART_Reset+0x24>
    642e:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    6432:	4298      	cmp	r0, r3
    6434:	d008      	beq.n	6448 <USART_Reset+0x24>
    6436:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    643a:	4298      	cmp	r0, r3
    643c:	d004      	beq.n	6448 <USART_Reset+0x24>
    643e:	f240 4129 	movw	r1, #1065	; 0x429
    6442:	481c      	ldr	r0, [pc, #112]	; (64b4 <USART_Reset+0x90>)
    6444:	f7ff f9dc 	bl	5800 <assertEFM>
    6448:	f504 5380 	add.w	r3, r4, #4096	; 0x1000
    644c:	2201      	movs	r2, #1
    644e:	605a      	str	r2, [r3, #4]
    6450:	f640 63aa 	movw	r3, #3754	; 0xeaa
    6454:	6163      	str	r3, [r4, #20]
    6456:	2300      	movs	r3, #0
    6458:	60a3      	str	r3, [r4, #8]
    645a:	65e3      	str	r3, [r4, #92]	; 0x5c
    645c:	f241 0205 	movw	r2, #4101	; 0x1005
    6460:	60e2      	str	r2, [r4, #12]
    6462:	6123      	str	r3, [r4, #16]
    6464:	61e3      	str	r3, [r4, #28]
    6466:	64e3      	str	r3, [r4, #76]	; 0x4c
    6468:	f504 5200 	add.w	r2, r4, #8192	; 0x2000
    646c:	4912      	ldr	r1, [pc, #72]	; (64b8 <USART_Reset+0x94>)
    646e:	6491      	str	r1, [r2, #72]	; 0x48
    6470:	65a3      	str	r3, [r4, #88]	; 0x58
    6472:	4b0f      	ldr	r3, [pc, #60]	; (64b0 <USART_Reset+0x8c>)
    6474:	429c      	cmp	r4, r3
    6476:	d007      	beq.n	6488 <USART_Reset+0x64>
    6478:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    647c:	429c      	cmp	r4, r3
    647e:	d003      	beq.n	6488 <USART_Reset+0x64>
    6480:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    6484:	429c      	cmp	r4, r3
    6486:	d101      	bne.n	648c <USART_Reset+0x68>
    6488:	2300      	movs	r3, #0
    648a:	6523      	str	r3, [r4, #80]	; 0x50
    648c:	4b08      	ldr	r3, [pc, #32]	; (64b0 <USART_Reset+0x8c>)
    648e:	429c      	cmp	r4, r3
    6490:	d007      	beq.n	64a2 <USART_Reset+0x7e>
    6492:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    6496:	429c      	cmp	r4, r3
    6498:	d003      	beq.n	64a2 <USART_Reset+0x7e>
    649a:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    649e:	429c      	cmp	r4, r3
    64a0:	d101      	bne.n	64a6 <USART_Reset+0x82>
    64a2:	2300      	movs	r3, #0
    64a4:	6563      	str	r3, [r4, #84]	; 0x54
    64a6:	f504 5400 	add.w	r4, r4, #8192	; 0x2000
    64aa:	2301      	movs	r3, #1
    64ac:	6063      	str	r3, [r4, #4]
    64ae:	bd10      	pop	{r4, pc}
    64b0:	40058000 	.word	0x40058000
    64b4:	0000bdbc 	.word	0x0000bdbc
    64b8:	0001ffff 	.word	0x0001ffff

000064bc <USART_InitAsync>:
    64bc:	b538      	push	{r3, r4, r5, lr}
    64be:	4605      	mov	r5, r0
    64c0:	460c      	mov	r4, r1
    64c2:	4b48      	ldr	r3, [pc, #288]	; (65e4 <USART_InitAsync+0x128>)
    64c4:	4298      	cmp	r0, r3
    64c6:	d00c      	beq.n	64e2 <USART_InitAsync+0x26>
    64c8:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    64cc:	4298      	cmp	r0, r3
    64ce:	d008      	beq.n	64e2 <USART_InitAsync+0x26>
    64d0:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    64d4:	4298      	cmp	r0, r3
    64d6:	d004      	beq.n	64e2 <USART_InitAsync+0x26>
    64d8:	f240 21ed 	movw	r1, #749	; 0x2ed
    64dc:	4842      	ldr	r0, [pc, #264]	; (65e8 <USART_InitAsync+0x12c>)
    64de:	f7ff f98f 	bl	5800 <assertEFM>
    64e2:	4628      	mov	r0, r5
    64e4:	f7ff ff9e 	bl	6424 <USART_Reset>
    64e8:	f505 5380 	add.w	r3, r5, #4096	; 0x1000
    64ec:	2201      	movs	r2, #1
    64ee:	605a      	str	r2, [r3, #4]
    64f0:	7ca3      	ldrb	r3, [r4, #18]
    64f2:	b11b      	cbz	r3, 64fc <USART_InitAsync+0x40>
    64f4:	68ab      	ldr	r3, [r5, #8]
    64f6:	f043 4380 	orr.w	r3, r3, #1073741824	; 0x40000000
    64fa:	60ab      	str	r3, [r5, #8]
    64fc:	7ce3      	ldrb	r3, [r4, #19]
    64fe:	2b00      	cmp	r3, #0
    6500:	d140      	bne.n	6584 <USART_InitAsync+0xc8>
    6502:	7b63      	ldrb	r3, [r4, #13]
    6504:	8a22      	ldrh	r2, [r4, #16]
    6506:	4313      	orrs	r3, r2
    6508:	89e2      	ldrh	r2, [r4, #14]
    650a:	4313      	orrs	r3, r2
    650c:	60eb      	str	r3, [r5, #12]
    650e:	7b23      	ldrb	r3, [r4, #12]
    6510:	68a2      	ldr	r2, [r4, #8]
    6512:	6861      	ldr	r1, [r4, #4]
    6514:	4628      	mov	r0, r5
    6516:	f7ff ff0f 	bl	6338 <USART_BaudrateAsyncSet>
    651a:	7d63      	ldrb	r3, [r4, #21]
    651c:	b11b      	cbz	r3, 6526 <USART_InitAsync+0x6a>
    651e:	68ab      	ldr	r3, [r5, #8]
    6520:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    6524:	60ab      	str	r3, [r5, #8]
    6526:	7da3      	ldrb	r3, [r4, #22]
    6528:	071b      	lsls	r3, r3, #28
    652a:	f003 43e0 	and.w	r3, r3, #1879048192	; 0x70000000
    652e:	7de2      	ldrb	r2, [r4, #23]
    6530:	0512      	lsls	r2, r2, #20
    6532:	f402 02e0 	and.w	r2, r2, #7340032	; 0x700000
    6536:	4313      	orrs	r3, r2
    6538:	65ab      	str	r3, [r5, #88]	; 0x58
    653a:	7e23      	ldrb	r3, [r4, #24]
    653c:	3b02      	subs	r3, #2
    653e:	b2db      	uxtb	r3, r3
    6540:	2b01      	cmp	r3, #1
    6542:	d924      	bls.n	658e <USART_InitAsync+0xd2>
    6544:	4b27      	ldr	r3, [pc, #156]	; (65e4 <USART_InitAsync+0x128>)
    6546:	429d      	cmp	r5, r3
    6548:	d040      	beq.n	65cc <USART_InitAsync+0x110>
    654a:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    654e:	429d      	cmp	r5, r3
    6550:	d03e      	beq.n	65d0 <USART_InitAsync+0x114>
    6552:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    6556:	429d      	cmp	r5, r3
    6558:	d036      	beq.n	65c8 <USART_InitAsync+0x10c>
    655a:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    655e:	015b      	lsls	r3, r3, #5
    6560:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    6564:	f503 3370 	add.w	r3, r3, #245760	; 0x3c000
    6568:	f242 52ac 	movw	r2, #9644	; 0x25ac
    656c:	2102      	movs	r1, #2
    656e:	5099      	str	r1, [r3, r2]
    6570:	7e23      	ldrb	r3, [r4, #24]
    6572:	2b01      	cmp	r3, #1
    6574:	d02e      	beq.n	65d4 <USART_InitAsync+0x118>
    6576:	2b03      	cmp	r3, #3
    6578:	d02c      	beq.n	65d4 <USART_InitAsync+0x118>
    657a:	f505 5300 	add.w	r3, r5, #8192	; 0x2000
    657e:	2204      	movs	r2, #4
    6580:	65da      	str	r2, [r3, #92]	; 0x5c
    6582:	e02b      	b.n	65dc <USART_InitAsync+0x120>
    6584:	7d21      	ldrb	r1, [r4, #20]
    6586:	4628      	mov	r0, r5
    6588:	f7ff feb2 	bl	62f0 <prsRxInput>
    658c:	e7b9      	b.n	6502 <USART_InitAsync+0x46>
    658e:	4b15      	ldr	r3, [pc, #84]	; (65e4 <USART_InitAsync+0x128>)
    6590:	429d      	cmp	r5, r3
    6592:	d015      	beq.n	65c0 <USART_InitAsync+0x104>
    6594:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    6598:	429d      	cmp	r5, r3
    659a:	d013      	beq.n	65c4 <USART_InitAsync+0x108>
    659c:	f503 4380 	add.w	r3, r3, #16384	; 0x4000
    65a0:	429d      	cmp	r5, r3
    65a2:	d00b      	beq.n	65bc <USART_InitAsync+0x100>
    65a4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    65a8:	015b      	lsls	r3, r3, #5
    65aa:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    65ae:	f503 3370 	add.w	r3, r3, #245760	; 0x3c000
    65b2:	f241 52ac 	movw	r2, #5548	; 0x15ac
    65b6:	2102      	movs	r1, #2
    65b8:	5099      	str	r1, [r3, r2]
    65ba:	e7d9      	b.n	6570 <USART_InitAsync+0xb4>
    65bc:	2302      	movs	r3, #2
    65be:	e7f3      	b.n	65a8 <USART_InitAsync+0xec>
    65c0:	2300      	movs	r3, #0
    65c2:	e7f1      	b.n	65a8 <USART_InitAsync+0xec>
    65c4:	2301      	movs	r3, #1
    65c6:	e7ef      	b.n	65a8 <USART_InitAsync+0xec>
    65c8:	2302      	movs	r3, #2
    65ca:	e7c8      	b.n	655e <USART_InitAsync+0xa2>
    65cc:	2300      	movs	r3, #0
    65ce:	e7c6      	b.n	655e <USART_InitAsync+0xa2>
    65d0:	2301      	movs	r3, #1
    65d2:	e7c4      	b.n	655e <USART_InitAsync+0xa2>
    65d4:	f505 5380 	add.w	r3, r5, #4096	; 0x1000
    65d8:	2204      	movs	r2, #4
    65da:	65da      	str	r2, [r3, #92]	; 0x5c
    65dc:	7823      	ldrb	r3, [r4, #0]
    65de:	616b      	str	r3, [r5, #20]
    65e0:	bd38      	pop	{r3, r4, r5, pc}
    65e2:	bf00      	nop
    65e4:	40058000 	.word	0x40058000
    65e8:	0000bdbc 	.word	0x0000bdbc

000065ec <Default_Handler>:
    65ec:	e7fe      	b.n	65ec <Default_Handler>
	...

000065f0 <Reset_Handler>:
    65f0:	b508      	push	{r3, lr}
    65f2:	f000 f81f 	bl	6634 <SystemInit>
    65f6:	4b0a      	ldr	r3, [pc, #40]	; (6620 <Reset_Handler+0x30>)
    65f8:	4a0a      	ldr	r2, [pc, #40]	; (6624 <Reset_Handler+0x34>)
    65fa:	e003      	b.n	6604 <Reset_Handler+0x14>
    65fc:	f852 1b04 	ldr.w	r1, [r2], #4
    6600:	f843 1b04 	str.w	r1, [r3], #4
    6604:	4908      	ldr	r1, [pc, #32]	; (6628 <Reset_Handler+0x38>)
    6606:	428b      	cmp	r3, r1
    6608:	d3f8      	bcc.n	65fc <Reset_Handler+0xc>
    660a:	4b08      	ldr	r3, [pc, #32]	; (662c <Reset_Handler+0x3c>)
    660c:	e002      	b.n	6614 <Reset_Handler+0x24>
    660e:	2200      	movs	r2, #0
    6610:	f843 2b04 	str.w	r2, [r3], #4
    6614:	4a06      	ldr	r2, [pc, #24]	; (6630 <Reset_Handler+0x40>)
    6616:	4293      	cmp	r3, r2
    6618:	d3f9      	bcc.n	660e <Reset_Handler+0x1e>
    661a:	f7fd fd8b 	bl	4134 <main>
    661e:	bf00      	nop
    6620:	20000000 	.word	0x20000000
    6624:	0000ddbc 	.word	0x0000ddbc
    6628:	20000274 	.word	0x20000274
    662c:	20000278 	.word	0x20000278
    6630:	20000e5c 	.word	0x20000e5c

00006634 <SystemInit>:
    6634:	4b04      	ldr	r3, [pc, #16]	; (6648 <SystemInit+0x14>)
    6636:	4a05      	ldr	r2, [pc, #20]	; (664c <SystemInit+0x18>)
    6638:	609a      	str	r2, [r3, #8]
    663a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
    663e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
    6642:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
    6646:	4770      	bx	lr
    6648:	e000ed00 	.word	0xe000ed00
    664c:	00004000 	.word	0x00004000

00006650 <SystemHFRCODPLLClockGet>:
    6650:	4b01      	ldr	r3, [pc, #4]	; (6658 <SystemHFRCODPLLClockGet+0x8>)
    6652:	6818      	ldr	r0, [r3, #0]
    6654:	4770      	bx	lr
    6656:	bf00      	nop
    6658:	20000004 	.word	0x20000004

0000665c <SystemHFRCODPLLClockSet>:
    665c:	4b01      	ldr	r3, [pc, #4]	; (6664 <SystemHFRCODPLLClockSet+0x8>)
    665e:	6018      	str	r0, [r3, #0]
    6660:	4770      	bx	lr
    6662:	bf00      	nop
    6664:	20000004 	.word	0x20000004

00006668 <SystemSYSCLKGet>:
    6668:	b508      	push	{r3, lr}
    666a:	4b09      	ldr	r3, [pc, #36]	; (6690 <SystemSYSCLKGet+0x28>)
    666c:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    666e:	f003 0307 	and.w	r3, r3, #7
    6672:	2b02      	cmp	r3, #2
    6674:	d004      	beq.n	6680 <SystemSYSCLKGet+0x18>
    6676:	2b03      	cmp	r3, #3
    6678:	d005      	beq.n	6686 <SystemSYSCLKGet+0x1e>
    667a:	2b01      	cmp	r3, #1
    667c:	d006      	beq.n	668c <SystemSYSCLKGet+0x24>
    667e:	e7fe      	b.n	667e <SystemSYSCLKGet+0x16>
    6680:	f7ff ffe6 	bl	6650 <SystemHFRCODPLLClockGet>
    6684:	e003      	b.n	668e <SystemSYSCLKGet+0x26>
    6686:	4b03      	ldr	r3, [pc, #12]	; (6694 <SystemSYSCLKGet+0x2c>)
    6688:	6818      	ldr	r0, [r3, #0]
    668a:	e000      	b.n	668e <SystemSYSCLKGet+0x26>
    668c:	4802      	ldr	r0, [pc, #8]	; (6698 <SystemSYSCLKGet+0x30>)
    668e:	bd08      	pop	{r3, pc}
    6690:	40008000 	.word	0x40008000
    6694:	20000008 	.word	0x20000008
    6698:	01312d00 	.word	0x01312d00

0000669c <SystemHCLKGet>:
    669c:	b508      	push	{r3, lr}
    669e:	f7ff ffe3 	bl	6668 <SystemSYSCLKGet>
    66a2:	4b05      	ldr	r3, [pc, #20]	; (66b8 <SystemHCLKGet+0x1c>)
    66a4:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    66a6:	f3c3 3301 	ubfx	r3, r3, #12, #2
    66aa:	3301      	adds	r3, #1
    66ac:	fbb0 f0f3 	udiv	r0, r0, r3
    66b0:	4b02      	ldr	r3, [pc, #8]	; (66bc <SystemHCLKGet+0x20>)
    66b2:	6018      	str	r0, [r3, #0]
    66b4:	bd08      	pop	{r3, pc}
    66b6:	bf00      	nop
    66b8:	40008000 	.word	0x40008000
    66bc:	20000000 	.word	0x20000000

000066c0 <SystemMaxCoreClockGet>:
    66c0:	4800      	ldr	r0, [pc, #0]	; (66c4 <SystemMaxCoreClockGet+0x4>)
    66c2:	4770      	bx	lr
    66c4:	04c4b400 	.word	0x04c4b400

000066c8 <SystemHFXOClockGet>:
    66c8:	4b01      	ldr	r3, [pc, #4]	; (66d0 <SystemHFXOClockGet+0x8>)
    66ca:	6818      	ldr	r0, [r3, #0]
    66cc:	4770      	bx	lr
    66ce:	bf00      	nop
    66d0:	20000008 	.word	0x20000008

000066d4 <SystemCLKIN0Get>:
    66d4:	2000      	movs	r0, #0
    66d6:	4770      	bx	lr

000066d8 <SystemFSRCOClockGet>:
    66d8:	4800      	ldr	r0, [pc, #0]	; (66dc <SystemFSRCOClockGet+0x4>)
    66da:	4770      	bx	lr
    66dc:	01312d00 	.word	0x01312d00

000066e0 <SystemHFRCOEM23ClockGet>:
    66e0:	4b17      	ldr	r3, [pc, #92]	; (6740 <SystemHFRCOEM23ClockGet+0x60>)
    66e2:	6898      	ldr	r0, [r3, #8]
    66e4:	f3c0 4004 	ubfx	r0, r0, #16, #5
    66e8:	280c      	cmp	r0, #12
    66ea:	d808      	bhi.n	66fe <SystemHFRCOEM23ClockGet+0x1e>
    66ec:	e8df f000 	tbb	[pc, r0]
    66f0:	07070709 	.word	0x07070709
    66f4:	17210707 	.word	0x17210707
    66f8:	1d1b0719 	.word	0x1d1b0719
    66fc:	1f          	.byte	0x1f
    66fd:	00          	.byte	0x00
    66fe:	2000      	movs	r0, #0
    6700:	4770      	bx	lr
    6702:	4b0f      	ldr	r3, [pc, #60]	; (6740 <SystemHFRCOEM23ClockGet+0x60>)
    6704:	689b      	ldr	r3, [r3, #8]
    6706:	f003 7340 	and.w	r3, r3, #50331648	; 0x3000000
    670a:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
    670e:	d012      	beq.n	6736 <SystemHFRCOEM23ClockGet+0x56>
    6710:	f1b3 7f00 	cmp.w	r3, #33554432	; 0x2000000
    6714:	d011      	beq.n	673a <SystemHFRCOEM23ClockGet+0x5a>
    6716:	b103      	cbz	r3, 671a <SystemHFRCOEM23ClockGet+0x3a>
    6718:	4770      	bx	lr
    671a:	480a      	ldr	r0, [pc, #40]	; (6744 <SystemHFRCOEM23ClockGet+0x64>)
    671c:	4770      	bx	lr
    671e:	480a      	ldr	r0, [pc, #40]	; (6748 <SystemHFRCOEM23ClockGet+0x68>)
    6720:	4770      	bx	lr
    6722:	480a      	ldr	r0, [pc, #40]	; (674c <SystemHFRCOEM23ClockGet+0x6c>)
    6724:	4770      	bx	lr
    6726:	480a      	ldr	r0, [pc, #40]	; (6750 <SystemHFRCOEM23ClockGet+0x70>)
    6728:	4770      	bx	lr
    672a:	480a      	ldr	r0, [pc, #40]	; (6754 <SystemHFRCOEM23ClockGet+0x74>)
    672c:	4770      	bx	lr
    672e:	480a      	ldr	r0, [pc, #40]	; (6758 <SystemHFRCOEM23ClockGet+0x78>)
    6730:	4770      	bx	lr
    6732:	480a      	ldr	r0, [pc, #40]	; (675c <SystemHFRCOEM23ClockGet+0x7c>)
    6734:	4770      	bx	lr
    6736:	480a      	ldr	r0, [pc, #40]	; (6760 <SystemHFRCOEM23ClockGet+0x80>)
    6738:	4770      	bx	lr
    673a:	480a      	ldr	r0, [pc, #40]	; (6764 <SystemHFRCOEM23ClockGet+0x84>)
    673c:	e7ec      	b.n	6718 <SystemHFRCOEM23ClockGet+0x38>
    673e:	bf00      	nop
    6740:	4a014000 	.word	0x4a014000
    6744:	003d0900 	.word	0x003d0900
    6748:	00f42400 	.word	0x00f42400
    674c:	0121eac0 	.word	0x0121eac0
    6750:	018cba80 	.word	0x018cba80
    6754:	01e84800 	.word	0x01e84800
    6758:	02625a00 	.word	0x02625a00
    675c:	00c65d40 	.word	0x00c65d40
    6760:	001e8480 	.word	0x001e8480
    6764:	000f4240 	.word	0x000f4240

00006768 <SystemLFRCOClockGet>:
    6768:	f44f 4000 	mov.w	r0, #32768	; 0x8000
    676c:	4770      	bx	lr

0000676e <SystemULFRCOClockGet>:
    676e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
    6772:	4770      	bx	lr

00006774 <SystemLFXOClockGet>:
    6774:	4b01      	ldr	r3, [pc, #4]	; (677c <SystemLFXOClockGet+0x8>)
    6776:	6818      	ldr	r0, [r3, #0]
    6778:	4770      	bx	lr
    677a:	bf00      	nop
    677c:	2000000c 	.word	0x2000000c

00006780 <HAL_Clocks_Init>:
    6780:	b508      	push	{r3, lr}
    6782:	4802      	ldr	r0, [pc, #8]	; (678c <HAL_Clocks_Init+0xc>)
    6784:	f7ff fc2c 	bl	5fe0 <CMU_HFRCODPLLBandSet>
    6788:	bd08      	pop	{r3, pc}
    678a:	bf00      	nop
    678c:	04c4b400 	.word	0x04c4b400

00006790 <radioEventHandler>:
    6790:	b510      	push	{r4, lr}
    6792:	4614      	mov	r4, r2
    6794:	f012 0f08 	tst.w	r2, #8
    6798:	d106      	bne.n	67a8 <radioEventHandler+0x18>
    679a:	f014 0fc0 	tst.w	r4, #192	; 0xc0
    679e:	d10c      	bne.n	67ba <radioEventHandler+0x2a>
    67a0:	4b09      	ldr	r3, [pc, #36]	; (67c8 <radioEventHandler+0x38>)
    67a2:	421c      	tst	r4, r3
    67a4:	d10c      	bne.n	67c0 <radioEventHandler+0x30>
    67a6:	bd10      	pop	{r4, pc}
    67a8:	f000 fcb0 	bl	710c <RAIL_HoldRxPacket>
    67ac:	4b07      	ldr	r3, [pc, #28]	; (67cc <radioEventHandler+0x3c>)
    67ae:	681b      	ldr	r3, [r3, #0]
    67b0:	2b00      	cmp	r3, #0
    67b2:	d1f2      	bne.n	679a <radioEventHandler+0xa>
    67b4:	4b05      	ldr	r3, [pc, #20]	; (67cc <radioEventHandler+0x3c>)
    67b6:	6018      	str	r0, [r3, #0]
    67b8:	e7ef      	b.n	679a <radioEventHandler+0xa>
    67ba:	f000 f98d 	bl	6ad8 <BSP_SetLed>
    67be:	e7ef      	b.n	67a0 <radioEventHandler+0x10>
    67c0:	f000 f990 	bl	6ae4 <BSP_ClrLed>
    67c4:	e7ef      	b.n	67a6 <radioEventHandler+0x16>
    67c6:	bf00      	nop
    67c8:	00018d08 	.word	0x00018d08
    67cc:	20000aa4 	.word	0x20000aa4

000067d0 <HAL_Radio_Init>:
    67d0:	b510      	push	{r4, lr}
    67d2:	2100      	movs	r1, #0
    67d4:	4805      	ldr	r0, [pc, #20]	; (67ec <HAL_Radio_Init+0x1c>)
    67d6:	f000 f98f 	bl	6af8 <RAIL_Init>
    67da:	4c05      	ldr	r4, [pc, #20]	; (67f0 <HAL_Radio_Init+0x20>)
    67dc:	6020      	str	r0, [r4, #0]
    67de:	f000 fd3d 	bl	725c <RAIL_IEEE802154_Config2p4GHzRadio>
    67e2:	4904      	ldr	r1, [pc, #16]	; (67f4 <HAL_Radio_Init+0x24>)
    67e4:	6820      	ldr	r0, [r4, #0]
    67e6:	f000 fcfb 	bl	71e0 <RAIL_IEEE802154_Init>
    67ea:	bd10      	pop	{r4, pc}
    67ec:	20000014 	.word	0x20000014
    67f0:	20000aa0 	.word	0x20000aa0
    67f4:	0000be08 	.word	0x0000be08

000067f8 <HAL_Radio_InitPromiscuousMode>:
    67f8:	b530      	push	{r4, r5, lr}
    67fa:	b085      	sub	sp, #20
    67fc:	4c1c      	ldr	r4, [pc, #112]	; (6870 <HAL_Radio_InitPromiscuousMode+0x78>)
    67fe:	2201      	movs	r2, #1
    6800:	4611      	mov	r1, r2
    6802:	6820      	ldr	r0, [r4, #0]
    6804:	f000 fc31 	bl	706a <RAIL_ConfigRxOptions>
    6808:	2101      	movs	r1, #1
    680a:	6820      	ldr	r0, [r4, #0]
    680c:	f000 fd2c 	bl	7268 <RAIL_IEEE802154_SetPromiscuousMode>
    6810:	210f      	movs	r1, #15
    6812:	6820      	ldr	r0, [r4, #0]
    6814:	f000 fd3b 	bl	728e <RAIL_IEEE802154_AcceptFrames>
    6818:	a313      	add	r3, pc, #76	; (adr r3, 6868 <HAL_Radio_InitPromiscuousMode+0x70>)
    681a:	e9d3 2300 	ldrd	r2, r3, [r3]
    681e:	e9cd 2300 	strd	r2, r3, [sp]
    6822:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    6826:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    682a:	6820      	ldr	r0, [r4, #0]
    682c:	f000 fc10 	bl	7050 <RAIL_ConfigEvents>
    6830:	2500      	movs	r5, #0
    6832:	9502      	str	r5, [sp, #8]
    6834:	9503      	str	r5, [sp, #12]
    6836:	2301      	movs	r3, #1
    6838:	f88d 300a 	strb.w	r3, [sp, #10]
    683c:	f88d 3009 	strb.w	r3, [sp, #9]
    6840:	a902      	add	r1, sp, #8
    6842:	6820      	ldr	r0, [r4, #0]
    6844:	f000 fc0e 	bl	7064 <RAIL_ConfigAntenna>
    6848:	f44f 6380 	mov.w	r3, #1024	; 0x400
    684c:	462a      	mov	r2, r5
    684e:	4909      	ldr	r1, [pc, #36]	; (6874 <HAL_Radio_InitPromiscuousMode+0x7c>)
    6850:	6820      	ldr	r0, [r4, #0]
    6852:	f000 fc30 	bl	70b6 <RAIL_SetTxFifo>
    6856:	462a      	mov	r2, r5
    6858:	4b07      	ldr	r3, [pc, #28]	; (6878 <HAL_Radio_InitPromiscuousMode+0x80>)
    685a:	7819      	ldrb	r1, [r3, #0]
    685c:	6820      	ldr	r0, [r4, #0]
    685e:	f000 f969 	bl	6b34 <RAIL_StartRx>
    6862:	b005      	add	sp, #20
    6864:	bd30      	pop	{r4, r5, pc}
    6866:	bf00      	nop
    6868:	01018dc8 	.word	0x01018dc8
    686c:	00000000 	.word	0x00000000
    6870:	20000aa0 	.word	0x20000aa0
    6874:	200006a0 	.word	0x200006a0
    6878:	20000010 	.word	0x20000010

0000687c <HAL_Radio_GetRxPacket>:
    687c:	2800      	cmp	r0, #0
    687e:	d045      	beq.n	690c <HAL_Radio_GetRxPacket+0x90>
    6880:	b570      	push	{r4, r5, r6, lr}
    6882:	b08c      	sub	sp, #48	; 0x30
    6884:	4604      	mov	r4, r0
    6886:	2300      	movs	r3, #0
    6888:	7003      	strb	r3, [r0, #0]
    688a:	4b22      	ldr	r3, [pc, #136]	; (6914 <HAL_Radio_GetRxPacket+0x98>)
    688c:	6819      	ldr	r1, [r3, #0]
    688e:	b1f1      	cbz	r1, 68ce <HAL_Radio_GetRxPacket+0x52>
    6890:	4d21      	ldr	r5, [pc, #132]	; (6918 <HAL_Radio_GetRxPacket+0x9c>)
    6892:	aa07      	add	r2, sp, #28
    6894:	6828      	ldr	r0, [r5, #0]
    6896:	f000 fc31 	bl	70fc <RAIL_GetRxPacketInfo>
    689a:	aa03      	add	r2, sp, #12
    689c:	4b1d      	ldr	r3, [pc, #116]	; (6914 <HAL_Radio_GetRxPacket+0x98>)
    689e:	6819      	ldr	r1, [r3, #0]
    68a0:	6828      	ldr	r0, [r5, #0]
    68a2:	f000 fc2f 	bl	7104 <RAIL_GetRxPacketDetails>
    68a6:	f8bd 201e 	ldrh.w	r2, [sp, #30]
    68aa:	1e53      	subs	r3, r2, #1
    68ac:	b29b      	uxth	r3, r3
    68ae:	2b7f      	cmp	r3, #127	; 0x7f
    68b0:	d910      	bls.n	68d4 <HAL_Radio_GetRxPacket+0x58>
    68b2:	2600      	movs	r6, #0
    68b4:	4c17      	ldr	r4, [pc, #92]	; (6914 <HAL_Radio_GetRxPacket+0x98>)
    68b6:	4d18      	ldr	r5, [pc, #96]	; (6918 <HAL_Radio_GetRxPacket+0x9c>)
    68b8:	6821      	ldr	r1, [r4, #0]
    68ba:	6828      	ldr	r0, [r5, #0]
    68bc:	f000 fc28 	bl	7110 <RAIL_ReleaseRxPacket>
    68c0:	aa07      	add	r2, sp, #28
    68c2:	2102      	movs	r1, #2
    68c4:	6828      	ldr	r0, [r5, #0]
    68c6:	f000 fc19 	bl	70fc <RAIL_GetRxPacketInfo>
    68ca:	6020      	str	r0, [r4, #0]
    68cc:	bb06      	cbnz	r6, 6910 <HAL_Radio_GetRxPacket+0x94>
    68ce:	2001      	movs	r0, #1
    68d0:	b00c      	add	sp, #48	; 0x30
    68d2:	bd70      	pop	{r4, r5, r6, pc}
    68d4:	1e53      	subs	r3, r2, #1
    68d6:	4622      	mov	r2, r4
    68d8:	f802 3b01 	strb.w	r3, [r2], #1
    68dc:	f8bd 301e 	ldrh.w	r3, [sp, #30]
    68e0:	3b01      	subs	r3, #1
    68e2:	2601      	movs	r6, #1
    68e4:	9600      	str	r6, [sp, #0]
    68e6:	b29b      	uxth	r3, r3
    68e8:	490a      	ldr	r1, [pc, #40]	; (6914 <HAL_Radio_GetRxPacket+0x98>)
    68ea:	6809      	ldr	r1, [r1, #0]
    68ec:	6828      	ldr	r0, [r5, #0]
    68ee:	f000 fc12 	bl	7116 <RAIL_PeekRxPacket>
    68f2:	f99d 3016 	ldrsb.w	r3, [sp, #22]
    68f6:	f884 3082 	strb.w	r3, [r4, #130]	; 0x82
    68fa:	f89d 3017 	ldrb.w	r3, [sp, #23]
    68fe:	f884 3081 	strb.w	r3, [r4, #129]	; 0x81
    6902:	4b06      	ldr	r3, [pc, #24]	; (691c <HAL_Radio_GetRxPacket+0xa0>)
    6904:	781b      	ldrb	r3, [r3, #0]
    6906:	f884 3083 	strb.w	r3, [r4, #131]	; 0x83
    690a:	e7d3      	b.n	68b4 <HAL_Radio_GetRxPacket+0x38>
    690c:	2002      	movs	r0, #2
    690e:	4770      	bx	lr
    6910:	2000      	movs	r0, #0
    6912:	e7dd      	b.n	68d0 <HAL_Radio_GetRxPacket+0x54>
    6914:	20000aa4 	.word	0x20000aa4
    6918:	20000aa0 	.word	0x20000aa0
    691c:	20000010 	.word	0x20000010

00006920 <HAL_SetRadioChannel>:
    6920:	b510      	push	{r4, lr}
    6922:	4604      	mov	r4, r0
    6924:	2200      	movs	r2, #0
    6926:	4601      	mov	r1, r0
    6928:	4b03      	ldr	r3, [pc, #12]	; (6938 <HAL_SetRadioChannel+0x18>)
    692a:	6818      	ldr	r0, [r3, #0]
    692c:	f000 f902 	bl	6b34 <RAIL_StartRx>
    6930:	b908      	cbnz	r0, 6936 <HAL_SetRadioChannel+0x16>
    6932:	4b02      	ldr	r3, [pc, #8]	; (693c <HAL_SetRadioChannel+0x1c>)
    6934:	701c      	strb	r4, [r3, #0]
    6936:	bd10      	pop	{r4, pc}
    6938:	20000aa0 	.word	0x20000aa0
    693c:	20000010 	.word	0x20000010

00006940 <HAL_Console_Init>:
    6940:	b510      	push	{r4, lr}
    6942:	b088      	sub	sp, #32
    6944:	f10d 0c04 	add.w	ip, sp, #4
    6948:	4c2a      	ldr	r4, [pc, #168]	; (69f4 <HAL_Console_Init+0xb4>)
    694a:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
    694c:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
    6950:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
    6954:	e88c 0007 	stmia.w	ip, {r0, r1, r2}
    6958:	4c27      	ldr	r4, [pc, #156]	; (69f8 <HAL_Console_Init+0xb8>)
    695a:	a901      	add	r1, sp, #4
    695c:	4620      	mov	r0, r4
    695e:	f7ff fdad 	bl	64bc <USART_InitAsync>
    6962:	2301      	movs	r3, #1
    6964:	2204      	movs	r2, #4
    6966:	2106      	movs	r1, #6
    6968:	2000      	movs	r0, #0
    696a:	f7ff fbbf 	bl	60ec <GPIO_PinModeSet>
    696e:	2301      	movs	r3, #1
    6970:	2202      	movs	r2, #2
    6972:	2105      	movs	r1, #5
    6974:	2000      	movs	r0, #0
    6976:	f7ff fbb9 	bl	60ec <GPIO_PinModeSet>
    697a:	2301      	movs	r3, #1
    697c:	6163      	str	r3, [r4, #20]
    697e:	4b1e      	ldr	r3, [pc, #120]	; (69f8 <HAL_Console_Init+0xb8>)
    6980:	699b      	ldr	r3, [r3, #24]
    6982:	f013 0f01 	tst.w	r3, #1
    6986:	d0fa      	beq.n	697e <HAL_Console_Init+0x3e>
    6988:	4b1c      	ldr	r3, [pc, #112]	; (69fc <HAL_Console_Init+0xbc>)
    698a:	f44f 22a0 	mov.w	r2, #327680	; 0x50000
    698e:	f8c3 25bc 	str.w	r2, [r3, #1468]	; 0x5bc
    6992:	f503 5380 	add.w	r3, r3, #4096	; 0x1000
    6996:	2204      	movs	r2, #4
    6998:	f8c3 25ac 	str.w	r2, [r3, #1452]	; 0x5ac
    699c:	f503 33d8 	add.w	r3, r3, #110592	; 0x1b000
    69a0:	615a      	str	r2, [r3, #20]
    69a2:	4b15      	ldr	r3, [pc, #84]	; (69f8 <HAL_Console_Init+0xb8>)
    69a4:	699b      	ldr	r3, [r3, #24]
    69a6:	f013 0f02 	tst.w	r3, #2
    69aa:	d0fa      	beq.n	69a2 <HAL_Console_Init+0x62>
    69ac:	4b13      	ldr	r3, [pc, #76]	; (69fc <HAL_Console_Init+0xbc>)
    69ae:	f44f 22c0 	mov.w	r2, #393216	; 0x60000
    69b2:	f8c3 25c4 	str.w	r2, [r3, #1476]	; 0x5c4
    69b6:	f503 5380 	add.w	r3, r3, #4096	; 0x1000
    69ba:	2210      	movs	r2, #16
    69bc:	f8c3 25ac 	str.w	r2, [r3, #1452]	; 0x5ac
    69c0:	4b0f      	ldr	r3, [pc, #60]	; (6a00 <HAL_Console_Init+0xc0>)
    69c2:	f44f 6200 	mov.w	r2, #2048	; 0x800
    69c6:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    69ca:	f3bf 8f4f 	dsb	sy
    69ce:	f3bf 8f6f 	isb	sy
    69d2:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
    69d6:	2180      	movs	r1, #128	; 0x80
    69d8:	f883 130b 	strb.w	r1, [r3, #779]	; 0x30b
    69dc:	601a      	str	r2, [r3, #0]
    69de:	4b06      	ldr	r3, [pc, #24]	; (69f8 <HAL_Console_Init+0xb8>)
    69e0:	f503 5100 	add.w	r1, r3, #8192	; 0x2000
    69e4:	2204      	movs	r2, #4
    69e6:	648a      	str	r2, [r1, #72]	; 0x48
    69e8:	f503 5380 	add.w	r3, r3, #4096	; 0x1000
    69ec:	64da      	str	r2, [r3, #76]	; 0x4c
    69ee:	b008      	add	sp, #32
    69f0:	bd10      	pop	{r4, pc}
    69f2:	bf00      	nop
    69f4:	0000be34 	.word	0x0000be34
    69f8:	40058000 	.word	0x40058000
    69fc:	4003c000 	.word	0x4003c000
    6a00:	e000e100 	.word	0xe000e100

00006a04 <HAL_Console_Tx_Byte>:
    6a04:	4b03      	ldr	r3, [pc, #12]	; (6a14 <HAL_Console_Tx_Byte+0x10>)
    6a06:	699b      	ldr	r3, [r3, #24]
    6a08:	f013 0f40 	tst.w	r3, #64	; 0x40
    6a0c:	d0fa      	beq.n	6a04 <HAL_Console_Tx_Byte>
    6a0e:	4b01      	ldr	r3, [pc, #4]	; (6a14 <HAL_Console_Tx_Byte+0x10>)
    6a10:	63d8      	str	r0, [r3, #60]	; 0x3c
    6a12:	4770      	bx	lr
    6a14:	40058000 	.word	0x40058000

00006a18 <USART0_RX_IRQHandler>:
    6a18:	b508      	push	{r3, lr}
    6a1a:	4b03      	ldr	r3, [pc, #12]	; (6a28 <USART0_RX_IRQHandler+0x10>)
    6a1c:	6a58      	ldr	r0, [r3, #36]	; 0x24
    6a1e:	b2c0      	uxtb	r0, r0
    6a20:	f7fe f8e2 	bl	4be8 <Console_RxByte>
    6a24:	bd08      	pop	{r3, pc}
    6a26:	bf00      	nop
    6a28:	40058000 	.word	0x40058000

00006a2c <BSP_InitLed>:
    6a2c:	b508      	push	{r3, lr}
    6a2e:	2300      	movs	r3, #0
    6a30:	2204      	movs	r2, #4
    6a32:	4619      	mov	r1, r3
    6a34:	2002      	movs	r0, #2
    6a36:	f7ff fb59 	bl	60ec <GPIO_PinModeSet>
    6a3a:	2301      	movs	r3, #1
    6a3c:	2204      	movs	r2, #4
    6a3e:	4619      	mov	r1, r3
    6a40:	2002      	movs	r0, #2
    6a42:	f7ff fb53 	bl	60ec <GPIO_PinModeSet>
    6a46:	bd08      	pop	{r3, pc}

00006a48 <BSP_Init>:
    6a48:	b500      	push	{lr}
    6a4a:	b083      	sub	sp, #12
    6a4c:	a801      	add	r0, sp, #4
    6a4e:	f7ff fc41 	bl	62d4 <SYSTEM_ChipRevisionGet>
    6a52:	4b1f      	ldr	r3, [pc, #124]	; (6ad0 <BSP_Init+0x88>)
    6a54:	6d9b      	ldr	r3, [r3, #88]	; 0x58
    6a56:	f413 3f80 	tst.w	r3, #65536	; 0x10000
    6a5a:	d114      	bne.n	6a86 <BSP_Init+0x3e>
    6a5c:	4a1c      	ldr	r2, [pc, #112]	; (6ad0 <BSP_Init+0x88>)
    6a5e:	6b53      	ldr	r3, [r2, #52]	; 0x34
    6a60:	f423 03ff 	bic.w	r3, r3, #8355840	; 0x7f8000
    6a64:	f423 43fe 	bic.w	r3, r3, #32512	; 0x7f00
    6a68:	f443 13bc 	orr.w	r3, r3, #1540096	; 0x178000
    6a6c:	f443 63a0 	orr.w	r3, r3, #1280	; 0x500
    6a70:	6353      	str	r3, [r2, #52]	; 0x34
    6a72:	6b13      	ldr	r3, [r2, #48]	; 0x30
    6a74:	f423 4370 	bic.w	r3, r3, #61440	; 0xf000
    6a78:	f443 4340 	orr.w	r3, r3, #49152	; 0xc000
    6a7c:	6313      	str	r3, [r2, #48]	; 0x30
    6a7e:	6b13      	ldr	r3, [r2, #48]	; 0x30
    6a80:	f443 63e0 	orr.w	r3, r3, #1792	; 0x700
    6a84:	6313      	str	r3, [r2, #48]	; 0x30
    6a86:	f89d 3005 	ldrb.w	r3, [sp, #5]
    6a8a:	2b01      	cmp	r3, #1
    6a8c:	d011      	beq.n	6ab2 <BSP_Init+0x6a>
    6a8e:	4a11      	ldr	r2, [pc, #68]	; (6ad4 <BSP_Init+0x8c>)
    6a90:	f8d2 3080 	ldr.w	r3, [r2, #128]	; 0x80
    6a94:	f043 0303 	orr.w	r3, r3, #3
    6a98:	f8c2 3080 	str.w	r3, [r2, #128]	; 0x80
    6a9c:	f7ff fe70 	bl	6780 <HAL_Clocks_Init>
    6aa0:	f7ff ff4e 	bl	6940 <HAL_Console_Init>
    6aa4:	f7ff fe94 	bl	67d0 <HAL_Radio_Init>
    6aa8:	f7ff ffc0 	bl	6a2c <BSP_InitLed>
    6aac:	b003      	add	sp, #12
    6aae:	f85d fb04 	ldr.w	pc, [sp], #4
    6ab2:	f89d 3004 	ldrb.w	r3, [sp, #4]
    6ab6:	2b00      	cmp	r3, #0
    6ab8:	d1e9      	bne.n	6a8e <BSP_Init+0x46>
    6aba:	2300      	movs	r3, #0
    6abc:	f04f 5200 	mov.w	r2, #536870912	; 0x20000000
    6ac0:	e003      	b.n	6aca <BSP_Init+0x82>
    6ac2:	6811      	ldr	r1, [r2, #0]
    6ac4:	f502 4280 	add.w	r2, r2, #16384	; 0x4000
    6ac8:	3301      	adds	r3, #1
    6aca:	2b05      	cmp	r3, #5
    6acc:	d9f9      	bls.n	6ac2 <BSP_Init+0x7a>
    6ace:	e7de      	b.n	6a8e <BSP_Init+0x46>
    6ad0:	4000c000 	.word	0x4000c000
    6ad4:	40008000 	.word	0x40008000

00006ad8 <BSP_SetLed>:
    6ad8:	4b01      	ldr	r3, [pc, #4]	; (6ae0 <BSP_SetLed+0x8>)
    6ada:	2201      	movs	r2, #1
    6adc:	671a      	str	r2, [r3, #112]	; 0x70
    6ade:	4770      	bx	lr
    6ae0:	4003d000 	.word	0x4003d000

00006ae4 <BSP_ClrLed>:
    6ae4:	4b01      	ldr	r3, [pc, #4]	; (6aec <BSP_ClrLed+0x8>)
    6ae6:	2201      	movs	r2, #1
    6ae8:	671a      	str	r2, [r3, #112]	; 0x70
    6aea:	4770      	bx	lr
    6aec:	4003e000 	.word	0x4003e000

00006af0 <BSP_RebootInBootloader>:
    6af0:	b508      	push	{r3, lr}
    6af2:	f7fe fe69 	bl	57c8 <bootloader_rebootAndInstall>
    6af6:	bd08      	pop	{r3, pc}

00006af8 <RAIL_Init>:
    6af8:	b537      	push	{r0, r1, r2, r4, r5, lr}
    6afa:	4604      	mov	r4, r0
    6afc:	9101      	str	r1, [sp, #4]
    6afe:	b178      	cbz	r0, 6b20 <RAIL_Init+0x28>
    6b00:	4d0a      	ldr	r5, [pc, #40]	; (6b2c <RAIL_Init+0x34>)
    6b02:	782b      	ldrb	r3, [r5, #0]
    6b04:	b97b      	cbnz	r3, 6b26 <RAIL_Init+0x2e>
    6b06:	4b0a      	ldr	r3, [pc, #40]	; (6b30 <RAIL_Init+0x38>)
    6b08:	6018      	str	r0, [r3, #0]
    6b0a:	f000 f84b 	bl	6ba4 <RAILINT_c64aa2902ddc8ebf4f72e7399c171680>
    6b0e:	4620      	mov	r0, r4
    6b10:	9901      	ldr	r1, [sp, #4]
    6b12:	f000 f838 	bl	6b86 <RAILINT_7e61d0565567ab0020244c3cf3f002a7>
    6b16:	1e03      	subs	r3, r0, #0
    6b18:	bf18      	it	ne
    6b1a:	2301      	movne	r3, #1
    6b1c:	4604      	mov	r4, r0
    6b1e:	702b      	strb	r3, [r5, #0]
    6b20:	4620      	mov	r0, r4
    6b22:	b003      	add	sp, #12
    6b24:	bd30      	pop	{r4, r5, pc}
    6b26:	2400      	movs	r4, #0
    6b28:	e7fa      	b.n	6b20 <RAIL_Init+0x28>
    6b2a:	bf00      	nop
    6b2c:	20000aac 	.word	0x20000aac
    6b30:	20000aa8 	.word	0x20000aa8

00006b34 <RAIL_StartRx>:
    6b34:	b510      	push	{r4, lr}
    6b36:	b100      	cbz	r0, 6b3a <RAIL_StartRx+0x6>
    6b38:	300c      	adds	r0, #12
    6b3a:	f000 fa9a 	bl	7072 <RAILINT_7a1b83c18f57d5dc8774009ae81ab08e>
    6b3e:	4604      	mov	r4, r0
    6b40:	b920      	cbnz	r0, 6b4c <RAIL_StartRx+0x18>
    6b42:	2101      	movs	r1, #1
    6b44:	4b02      	ldr	r3, [pc, #8]	; (6b50 <RAIL_StartRx+0x1c>)
    6b46:	4608      	mov	r0, r1
    6b48:	685b      	ldr	r3, [r3, #4]
    6b4a:	4798      	blx	r3
    6b4c:	4620      	mov	r0, r4
    6b4e:	bd10      	pop	{r4, pc}
    6b50:	200001d0 	.word	0x200001d0

00006b54 <RAILINT_db926409e556c7e73d15fec818f5b1d6>:
    6b54:	4770      	bx	lr
	...

00006b58 <RAILINT_ba62dd308ed15b1ffe7bd5b874af6d40>:
    6b58:	1e43      	subs	r3, r0, #1
    6b5a:	3303      	adds	r3, #3
    6b5c:	d806      	bhi.n	6b6c <RAILINT_ba62dd308ed15b1ffe7bd5b874af6d40+0x14>
    6b5e:	4b04      	ldr	r3, [pc, #16]	; (6b70 <RAILINT_ba62dd308ed15b1ffe7bd5b874af6d40+0x18>)
    6b60:	4298      	cmp	r0, r3
    6b62:	bf28      	it	cs
    6b64:	4618      	movcs	r0, r3
    6b66:	2864      	cmp	r0, #100	; 0x64
    6b68:	bf38      	it	cc
    6b6a:	2064      	movcc	r0, #100	; 0x64
    6b6c:	4770      	bx	lr
    6b6e:	bf00      	nop
    6b70:	000f4240 	.word	0x000f4240

00006b74 <RAILINT_a690160bdcee277d32012935fb6dead8>:
    6b74:	1e43      	subs	r3, r0, #1
    6b76:	2b01      	cmp	r3, #1
    6b78:	d903      	bls.n	6b82 <RAILINT_a690160bdcee277d32012935fb6dead8+0xe>
    6b7a:	1f03      	subs	r3, r0, #4
    6b7c:	4258      	negs	r0, r3
    6b7e:	4158      	adcs	r0, r3
    6b80:	4770      	bx	lr
    6b82:	2001      	movs	r0, #1
    6b84:	4770      	bx	lr

00006b86 <RAILINT_7e61d0565567ab0020244c3cf3f002a7>:
    6b86:	b538      	push	{r3, r4, r5, lr}
    6b88:	4604      	mov	r4, r0
    6b8a:	460d      	mov	r5, r1
    6b8c:	2100      	movs	r1, #0
    6b8e:	f000 fa7d 	bl	708c <RAILCb_ConfigFrameTypeLength>
    6b92:	4629      	mov	r1, r5
    6b94:	4620      	mov	r0, r4
    6b96:	f001 fb73 	bl	8280 <RAILINT_f70cad743ef3526a2ef7ac090e6c385a>
    6b9a:	2800      	cmp	r0, #0
    6b9c:	bf0c      	ite	eq
    6b9e:	4620      	moveq	r0, r4
    6ba0:	2000      	movne	r0, #0
    6ba2:	bd38      	pop	{r3, r4, r5, pc}

00006ba4 <RAILINT_c64aa2902ddc8ebf4f72e7399c171680>:
    6ba4:	b510      	push	{r4, lr}
    6ba6:	4604      	mov	r4, r0
    6ba8:	f000 fdc6 	bl	7738 <RAILINT_ee8e30d6c3ef95b8e8dca03da7401c07>
    6bac:	b144      	cbz	r4, 6bc0 <RAILINT_c64aa2902ddc8ebf4f72e7399c171680+0x1c>
    6bae:	4a05      	ldr	r2, [pc, #20]	; (6bc4 <RAILINT_c64aa2902ddc8ebf4f72e7399c171680+0x20>)
    6bb0:	f8d4 3088 	ldr.w	r3, [r4, #136]	; 0x88
    6bb4:	2b00      	cmp	r3, #0
    6bb6:	bf08      	it	eq
    6bb8:	4613      	moveq	r3, r2
    6bba:	4a03      	ldr	r2, [pc, #12]	; (6bc8 <RAILINT_c64aa2902ddc8ebf4f72e7399c171680+0x24>)
    6bbc:	6013      	str	r3, [r2, #0]
    6bbe:	bd10      	pop	{r4, pc}
    6bc0:	6fe3      	ldr	r3, [r4, #124]	; 0x7c
    6bc2:	deff      	udf	#255	; 0xff
    6bc4:	00006b55 	.word	0x00006b55
    6bc8:	200001c8 	.word	0x200001c8

00006bcc <RAILINT_499a6fa84e713dbcc15223a1179c1579>:
    6bcc:	b510      	push	{r4, lr}
    6bce:	460c      	mov	r4, r1
    6bd0:	f000 fe1e 	bl	7810 <RAILINT_99f0e717b1ae5f07aeace88464176fa9>
    6bd4:	b11c      	cbz	r4, 6bde <RAILINT_499a6fa84e713dbcc15223a1179c1579+0x12>
    6bd6:	f000 fe71 	bl	78bc <RAILINT_a4b57b9485a34098ab089f4c182a3c25>
    6bda:	2801      	cmp	r0, #1
    6bdc:	d1fb      	bne.n	6bd6 <RAILINT_499a6fa84e713dbcc15223a1179c1579+0xa>
    6bde:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    6be2:	4b02      	ldr	r3, [pc, #8]	; (6bec <RAILINT_499a6fa84e713dbcc15223a1179c1579+0x20>)
    6be4:	2100      	movs	r1, #0
    6be6:	2003      	movs	r0, #3
    6be8:	685b      	ldr	r3, [r3, #4]
    6bea:	4718      	bx	r3
    6bec:	200001d0 	.word	0x200001d0

00006bf0 <RAILCb_CalcSymbolRate>:
    6bf0:	b100      	cbz	r0, 6bf4 <RAILCb_CalcSymbolRate+0x4>
    6bf2:	300c      	adds	r0, #12
    6bf4:	f000 bf1c 	b.w	7a30 <RAILINT_7513d8eab2e711e2387c527c09895f59>

00006bf8 <RAILCb_CalcBitRate>:
    6bf8:	b100      	cbz	r0, 6bfc <RAILCb_CalcBitRate+0x4>
    6bfa:	300c      	adds	r0, #12
    6bfc:	f000 bf2e 	b.w	7a5c <RAILINT_fd62944279593a99af34baf33f1f64a3>

00006c00 <RAIL_SetStateTiming>:
    6c00:	b508      	push	{r3, lr}
    6c02:	4602      	mov	r2, r0
    6c04:	6808      	ldr	r0, [r1, #0]
    6c06:	f7ff ffa7 	bl	6b58 <RAILINT_ba62dd308ed15b1ffe7bd5b874af6d40>
    6c0a:	6008      	str	r0, [r1, #0]
    6c0c:	6848      	ldr	r0, [r1, #4]
    6c0e:	f7ff ffa3 	bl	6b58 <RAILINT_ba62dd308ed15b1ffe7bd5b874af6d40>
    6c12:	6048      	str	r0, [r1, #4]
    6c14:	6888      	ldr	r0, [r1, #8]
    6c16:	f7ff ff9f 	bl	6b58 <RAILINT_ba62dd308ed15b1ffe7bd5b874af6d40>
    6c1a:	6088      	str	r0, [r1, #8]
    6c1c:	68c8      	ldr	r0, [r1, #12]
    6c1e:	f7ff ff9b 	bl	6b58 <RAILINT_ba62dd308ed15b1ffe7bd5b874af6d40>
    6c22:	690b      	ldr	r3, [r1, #16]
    6c24:	60c8      	str	r0, [r1, #12]
    6c26:	1c58      	adds	r0, r3, #1
    6c28:	d003      	beq.n	6c32 <RAIL_SetStateTiming+0x32>
    6c2a:	480c      	ldr	r0, [pc, #48]	; (6c5c <RAIL_SetStateTiming+0x5c>)
    6c2c:	4283      	cmp	r3, r0
    6c2e:	bf28      	it	cs
    6c30:	4603      	movcs	r3, r0
    6c32:	610b      	str	r3, [r1, #16]
    6c34:	694b      	ldr	r3, [r1, #20]
    6c36:	1c58      	adds	r0, r3, #1
    6c38:	d003      	beq.n	6c42 <RAIL_SetStateTiming+0x42>
    6c3a:	4808      	ldr	r0, [pc, #32]	; (6c5c <RAIL_SetStateTiming+0x5c>)
    6c3c:	4283      	cmp	r3, r0
    6c3e:	bf28      	it	cs
    6c40:	4603      	movcs	r3, r0
    6c42:	6988      	ldr	r0, [r1, #24]
    6c44:	614b      	str	r3, [r1, #20]
    6c46:	f7ff ff87 	bl	6b58 <RAILINT_ba62dd308ed15b1ffe7bd5b874af6d40>
    6c4a:	6188      	str	r0, [r1, #24]
    6c4c:	b102      	cbz	r2, 6c50 <RAIL_SetStateTiming+0x50>
    6c4e:	320c      	adds	r2, #12
    6c50:	4610      	mov	r0, r2
    6c52:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    6c56:	f001 bbaf 	b.w	83b8 <RAILINT_232a85da35fb8aa0cd28c39542df9730>
    6c5a:	bf00      	nop
    6c5c:	000f4240 	.word	0x000f4240

00006c60 <RAILINT_a414401b72e85e008bc59287e035ef41>:
    6c60:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    6c64:	6f43      	ldr	r3, [r0, #116]	; 0x74
    6c66:	4680      	mov	r8, r0
    6c68:	460d      	mov	r5, r1
    6c6a:	b083      	sub	sp, #12
    6c6c:	b113      	cbz	r3, 6c74 <RAILINT_a414401b72e85e008bc59287e035ef41+0x14>
    6c6e:	8903      	ldrh	r3, [r0, #8]
    6c70:	428b      	cmp	r3, r1
    6c72:	d076      	beq.n	6d62 <RAILINT_a414401b72e85e008bc59287e035ef41+0x102>
    6c74:	f8d8 7070 	ldr.w	r7, [r8, #112]	; 0x70
    6c78:	2f00      	cmp	r7, #0
    6c7a:	d044      	beq.n	6d06 <RAILINT_a414401b72e85e008bc59287e035ef41+0xa6>
    6c7c:	68bb      	ldr	r3, [r7, #8]
    6c7e:	2b00      	cmp	r3, #0
    6c80:	d041      	beq.n	6d06 <RAILINT_a414401b72e85e008bc59287e035ef41+0xa6>
    6c82:	68f9      	ldr	r1, [r7, #12]
    6c84:	2900      	cmp	r1, #0
    6c86:	d03e      	beq.n	6d06 <RAILINT_a414401b72e85e008bc59287e035ef41+0xa6>
    6c88:	f8d8 2084 	ldr.w	r2, [r8, #132]	; 0x84
    6c8c:	9201      	str	r2, [sp, #4]
    6c8e:	2a00      	cmp	r2, #0
    6c90:	d03d      	beq.n	6d0e <RAILINT_a414401b72e85e008bc59287e035ef41+0xae>
    6c92:	f04f 0900 	mov.w	r9, #0
    6c96:	f1a8 0b0c 	sub.w	fp, r8, #12
    6c9a:	464c      	mov	r4, r9
    6c9c:	464e      	mov	r6, r9
    6c9e:	e000      	b.n	6ca2 <RAILINT_a414401b72e85e008bc59287e035ef41+0x42>
    6ca0:	68bb      	ldr	r3, [r7, #8]
    6ca2:	ebc4 02c4 	rsb	r2, r4, r4, lsl #3
    6ca6:	eb03 0a82 	add.w	sl, r3, r2, lsl #2
    6caa:	f8ba 200e 	ldrh.w	r2, [sl, #14]
    6cae:	3401      	adds	r4, #1
    6cb0:	42aa      	cmp	r2, r5
    6cb2:	d815      	bhi.n	6ce0 <RAILINT_a414401b72e85e008bc59287e035ef41+0x80>
    6cb4:	f8ba 2010 	ldrh.w	r2, [sl, #16]
    6cb8:	42aa      	cmp	r2, r5
    6cba:	d311      	bcc.n	6ce0 <RAILINT_a414401b72e85e008bc59287e035ef41+0x80>
    6cbc:	f9ba 2012 	ldrsh.w	r2, [sl, #18]
    6cc0:	f9b8 1132 	ldrsh.w	r1, [r8, #306]	; 0x132
    6cc4:	4291      	cmp	r1, r2
    6cc6:	dd54      	ble.n	6d72 <RAILINT_a414401b72e85e008bc59287e035ef41+0x112>
    6cc8:	4658      	mov	r0, fp
    6cca:	f898 10c0 	ldrb.w	r1, [r8, #192]	; 0xc0
    6cce:	f004 fce5 	bl	b69c <RAIL_ConvertDbmToRaw>
    6cd2:	f898 2005 	ldrb.w	r2, [r8, #5]
    6cd6:	4681      	mov	r9, r0
    6cd8:	4282      	cmp	r2, r0
    6cda:	4656      	mov	r6, sl
    6cdc:	d903      	bls.n	6ce6 <RAILINT_a414401b72e85e008bc59287e035ef41+0x86>
    6cde:	68f9      	ldr	r1, [r7, #12]
    6ce0:	428c      	cmp	r4, r1
    6ce2:	d3dd      	bcc.n	6ca0 <RAILINT_a414401b72e85e008bc59287e035ef41+0x40>
    6ce4:	b356      	cbz	r6, 6d3c <RAILINT_a414401b72e85e008bc59287e035ef41+0xdc>
    6ce6:	2300      	movs	r3, #0
    6ce8:	4632      	mov	r2, r6
    6cea:	4640      	mov	r0, r8
    6cec:	4619      	mov	r1, r3
    6cee:	9c01      	ldr	r4, [sp, #4]
    6cf0:	47a0      	blx	r4
    6cf2:	2000      	movs	r0, #0
    6cf4:	f8a8 5008 	strh.w	r5, [r8, #8]
    6cf8:	f8c8 6074 	str.w	r6, [r8, #116]	; 0x74
    6cfc:	f888 90c9 	strb.w	r9, [r8, #201]	; 0xc9
    6d00:	b003      	add	sp, #12
    6d02:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6d06:	2003      	movs	r0, #3
    6d08:	b003      	add	sp, #12
    6d0a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6d0e:	4691      	mov	r9, r2
    6d10:	f647 7aff 	movw	sl, #32767	; 0x7fff
    6d14:	4614      	mov	r4, r2
    6d16:	f1a8 0b0c 	sub.w	fp, r8, #12
    6d1a:	ebc4 06c4 	rsb	r6, r4, r4, lsl #3
    6d1e:	eb03 0686 	add.w	r6, r3, r6, lsl #2
    6d22:	89f3      	ldrh	r3, [r6, #14]
    6d24:	42ab      	cmp	r3, r5
    6d26:	d817      	bhi.n	6d58 <RAILINT_a414401b72e85e008bc59287e035ef41+0xf8>
    6d28:	8a33      	ldrh	r3, [r6, #16]
    6d2a:	42ab      	cmp	r3, r5
    6d2c:	d314      	bcc.n	6d58 <RAILINT_a414401b72e85e008bc59287e035ef41+0xf8>
    6d2e:	f9b6 2012 	ldrsh.w	r2, [r6, #18]
    6d32:	4552      	cmp	r2, sl
    6d34:	d104      	bne.n	6d40 <RAILINT_a414401b72e85e008bc59287e035ef41+0xe0>
    6d36:	f04f 09ff 	mov.w	r9, #255	; 0xff
    6d3a:	e7da      	b.n	6cf2 <RAILINT_a414401b72e85e008bc59287e035ef41+0x92>
    6d3c:	2001      	movs	r0, #1
    6d3e:	e7df      	b.n	6d00 <RAILINT_a414401b72e85e008bc59287e035ef41+0xa0>
    6d40:	4658      	mov	r0, fp
    6d42:	f898 10c0 	ldrb.w	r1, [r8, #192]	; 0xc0
    6d46:	f004 fca9 	bl	b69c <RAIL_ConvertDbmToRaw>
    6d4a:	f898 3005 	ldrb.w	r3, [r8, #5]
    6d4e:	4681      	mov	r9, r0
    6d50:	4283      	cmp	r3, r0
    6d52:	d9ce      	bls.n	6cf2 <RAILINT_a414401b72e85e008bc59287e035ef41+0x92>
    6d54:	4632      	mov	r2, r6
    6d56:	68f9      	ldr	r1, [r7, #12]
    6d58:	3401      	adds	r4, #1
    6d5a:	42a1      	cmp	r1, r4
    6d5c:	d905      	bls.n	6d6a <RAILINT_a414401b72e85e008bc59287e035ef41+0x10a>
    6d5e:	68bb      	ldr	r3, [r7, #8]
    6d60:	e7db      	b.n	6d1a <RAILINT_a414401b72e85e008bc59287e035ef41+0xba>
    6d62:	2000      	movs	r0, #0
    6d64:	b003      	add	sp, #12
    6d66:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6d6a:	2a00      	cmp	r2, #0
    6d6c:	d0e6      	beq.n	6d3c <RAILINT_a414401b72e85e008bc59287e035ef41+0xdc>
    6d6e:	4616      	mov	r6, r2
    6d70:	e7bf      	b.n	6cf2 <RAILINT_a414401b72e85e008bc59287e035ef41+0x92>
    6d72:	4656      	mov	r6, sl
    6d74:	e7b7      	b.n	6ce6 <RAILINT_a414401b72e85e008bc59287e035ef41+0x86>
    6d76:	bf00      	nop

00006d78 <RAILINT_eff06dff73e0f32be1552c4011c2dec9>:
    6d78:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    6d7c:	f8df b1b0 	ldr.w	fp, [pc, #432]	; 6f30 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x1b8>
    6d80:	b085      	sub	sp, #20
    6d82:	4604      	mov	r4, r0
    6d84:	4616      	mov	r6, r2
    6d86:	461f      	mov	r7, r3
    6d88:	9100      	str	r1, [sp, #0]
    6d8a:	f001 fb8d 	bl	84a8 <RAILINT_3e587e95c937431090ed1e304e004f0f>
    6d8e:	f8bb 5000 	ldrh.w	r5, [fp]
    6d92:	f001 fba7 	bl	84e4 <RAILINT_2224e76641c2cf7155997d9bff12d8b8>
    6d96:	2800      	cmp	r0, #0
    6d98:	d17c      	bne.n	6e94 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x11c>
    6d9a:	f8df 8198 	ldr.w	r8, [pc, #408]	; 6f34 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x1bc>
    6d9e:	6f63      	ldr	r3, [r4, #116]	; 0x74
    6da0:	f8d8 2000 	ldr.w	r2, [r8]
    6da4:	4293      	cmp	r3, r2
    6da6:	d06a      	beq.n	6e7e <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x106>
    6da8:	f000 fd88 	bl	78bc <RAILINT_a4b57b9485a34098ab089f4c182a3c25>
    6dac:	2801      	cmp	r0, #1
    6dae:	d14f      	bne.n	6e50 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0xd8>
    6db0:	f8df a184 	ldr.w	sl, [pc, #388]	; 6f38 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x1c0>
    6db4:	f8da 3000 	ldr.w	r3, [sl]
    6db8:	2b00      	cmp	r3, #0
    6dba:	d05b      	beq.n	6e74 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0xfc>
    6dbc:	6f22      	ldr	r2, [r4, #112]	; 0x70
    6dbe:	4293      	cmp	r3, r2
    6dc0:	d070      	beq.n	6ea4 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x12c>
    6dc2:	f8d4 c074 	ldr.w	ip, [r4, #116]	; 0x74
    6dc6:	6818      	ldr	r0, [r3, #0]
    6dc8:	6811      	ldr	r1, [r2, #0]
    6dca:	b110      	cbz	r0, 6dd2 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x5a>
    6dcc:	4288      	cmp	r0, r1
    6dce:	f000 8083 	beq.w	6ed8 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x160>
    6dd2:	f8dc 2000 	ldr.w	r2, [ip]
    6dd6:	4620      	mov	r0, r4
    6dd8:	f001 f9cd 	bl	8176 <RAILINT_ed7cbf63d67a6dc102f980914a3e8a21>
    6ddc:	2300      	movs	r3, #0
    6dde:	2601      	movs	r6, #1
    6de0:	4605      	mov	r5, r0
    6de2:	9301      	str	r3, [sp, #4]
    6de4:	f8d4 9084 	ldr.w	r9, [r4, #132]	; 0x84
    6de8:	f88d 700f 	strb.w	r7, [sp, #15]
    6dec:	f1b9 0f00 	cmp.w	r9, #0
    6df0:	d067      	beq.n	6ec2 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x14a>
    6df2:	2200      	movs	r2, #0
    6df4:	4620      	mov	r0, r4
    6df6:	4611      	mov	r1, r2
    6df8:	f10d 030f 	add.w	r3, sp, #15
    6dfc:	47c8      	blx	r9
    6dfe:	b985      	cbnz	r5, 6e22 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0xaa>
    6e00:	6f23      	ldr	r3, [r4, #112]	; 0x70
    6e02:	f8ca 3000 	str.w	r3, [sl]
    6e06:	6f63      	ldr	r3, [r4, #116]	; 0x74
    6e08:	f8c8 3000 	str.w	r3, [r8]
    6e0c:	9b01      	ldr	r3, [sp, #4]
    6e0e:	b90b      	cbnz	r3, 6e14 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x9c>
    6e10:	2e00      	cmp	r6, #0
    6e12:	d03a      	beq.n	6e8a <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x112>
    6e14:	9b00      	ldr	r3, [sp, #0]
    6e16:	4620      	mov	r0, r4
    6e18:	f8cb 3000 	str.w	r3, [fp]
    6e1c:	f000 fef8 	bl	7c10 <RAILINT_b693f7d424389daf06cac15e5c7b8047>
    6e20:	4605      	mov	r5, r0
    6e22:	b18e      	cbz	r6, 6e48 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0xd0>
    6e24:	fab5 f085 	clz	r0, r5
    6e28:	f240 22a3 	movw	r2, #675	; 0x2a3
    6e2c:	2133      	movs	r1, #51	; 0x33
    6e2e:	0940      	lsrs	r0, r0, #5
    6e30:	f000 f982 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    6e34:	4639      	mov	r1, r7
    6e36:	4620      	mov	r0, r4
    6e38:	f001 f9aa 	bl	8190 <RAILINT_44f844fe44efb07ef80df95a956dc879>
    6e3c:	4b3a      	ldr	r3, [pc, #232]	; (6f28 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x1b0>)
    6e3e:	6f61      	ldr	r1, [r4, #116]	; 0x74
    6e40:	681b      	ldr	r3, [r3, #0]
    6e42:	f1a4 000c 	sub.w	r0, r4, #12
    6e46:	4798      	blx	r3
    6e48:	4628      	mov	r0, r5
    6e4a:	b005      	add	sp, #20
    6e4c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6e50:	2001      	movs	r0, #1
    6e52:	f000 fcdd 	bl	7810 <RAILINT_99f0e717b1ae5f07aeace88464176fa9>
    6e56:	f000 fd31 	bl	78bc <RAILINT_a4b57b9485a34098ab089f4c182a3c25>
    6e5a:	2801      	cmp	r0, #1
    6e5c:	d1fb      	bne.n	6e56 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0xde>
    6e5e:	4b33      	ldr	r3, [pc, #204]	; (6f2c <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x1b4>)
    6e60:	f8df a0d4 	ldr.w	sl, [pc, #212]	; 6f38 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x1c0>
    6e64:	685b      	ldr	r3, [r3, #4]
    6e66:	2100      	movs	r1, #0
    6e68:	2003      	movs	r0, #3
    6e6a:	4798      	blx	r3
    6e6c:	f8da 3000 	ldr.w	r3, [sl]
    6e70:	2b00      	cmp	r3, #0
    6e72:	d1a3      	bne.n	6dbc <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x44>
    6e74:	6f23      	ldr	r3, [r4, #112]	; 0x70
    6e76:	f8d4 c074 	ldr.w	ip, [r4, #116]	; 0x74
    6e7a:	6819      	ldr	r1, [r3, #0]
    6e7c:	e7a9      	b.n	6dd2 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x5a>
    6e7e:	2b00      	cmp	r3, #0
    6e80:	d092      	beq.n	6da8 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x30>
    6e82:	9b00      	ldr	r3, [sp, #0]
    6e84:	429d      	cmp	r5, r3
    6e86:	d18f      	bne.n	6da8 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x30>
    6e88:	bb87      	cbnz	r7, 6eec <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x174>
    6e8a:	2500      	movs	r5, #0
    6e8c:	4628      	mov	r0, r5
    6e8e:	b005      	add	sp, #20
    6e90:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6e94:	2300      	movs	r3, #0
    6e96:	f8df 809c 	ldr.w	r8, [pc, #156]	; 6f34 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x1bc>
    6e9a:	f8c8 3000 	str.w	r3, [r8]
    6e9e:	f001 fb19 	bl	84d4 <RAILINT_67b648a3a6e52348d55fcd9139d9f7aa>
    6ea2:	e77c      	b.n	6d9e <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x26>
    6ea4:	f8d8 1000 	ldr.w	r1, [r8]
    6ea8:	f8d4 c074 	ldr.w	ip, [r4, #116]	; 0x74
    6eac:	2900      	cmp	r1, #0
    6eae:	d08a      	beq.n	6dc6 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x4e>
    6eb0:	4561      	cmp	r1, ip
    6eb2:	d188      	bne.n	6dc6 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x4e>
    6eb4:	9b00      	ldr	r3, [sp, #0]
    6eb6:	1aeb      	subs	r3, r5, r3
    6eb8:	bf18      	it	ne
    6eba:	2301      	movne	r3, #1
    6ebc:	2500      	movs	r5, #0
    6ebe:	9301      	str	r3, [sp, #4]
    6ec0:	e790      	b.n	6de4 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x6c>
    6ec2:	7961      	ldrb	r1, [r4, #5]
    6ec4:	f894 30c9 	ldrb.w	r3, [r4, #201]	; 0xc9
    6ec8:	463a      	mov	r2, r7
    6eca:	4299      	cmp	r1, r3
    6ecc:	bf28      	it	cs
    6ece:	4619      	movcs	r1, r3
    6ed0:	4620      	mov	r0, r4
    6ed2:	f000 fe77 	bl	7bc4 <RAILINT_cd62b828417e3475c6b58e9a311685cc>
    6ed6:	e792      	b.n	6dfe <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x86>
    6ed8:	f8d8 1000 	ldr.w	r1, [r8]
    6edc:	f8dc 2000 	ldr.w	r2, [ip]
    6ee0:	b111      	cbz	r1, 6ee8 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x170>
    6ee2:	6809      	ldr	r1, [r1, #0]
    6ee4:	4291      	cmp	r1, r2
    6ee6:	d010      	beq.n	6f0a <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x192>
    6ee8:	6859      	ldr	r1, [r3, #4]
    6eea:	e774      	b.n	6dd6 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x5e>
    6eec:	2e00      	cmp	r6, #0
    6eee:	d0cc      	beq.n	6e8a <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x112>
    6ef0:	2201      	movs	r2, #1
    6ef2:	f8d4 5084 	ldr.w	r5, [r4, #132]	; 0x84
    6ef6:	f88d 200f 	strb.w	r2, [sp, #15]
    6efa:	b15d      	cbz	r5, 6f14 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x19c>
    6efc:	2200      	movs	r2, #0
    6efe:	4620      	mov	r0, r4
    6f00:	4611      	mov	r1, r2
    6f02:	f10d 030f 	add.w	r3, sp, #15
    6f06:	47a8      	blx	r5
    6f08:	e7bf      	b.n	6e8a <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x112>
    6f0a:	2300      	movs	r3, #0
    6f0c:	2601      	movs	r6, #1
    6f0e:	461d      	mov	r5, r3
    6f10:	9301      	str	r3, [sp, #4]
    6f12:	e767      	b.n	6de4 <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x6c>
    6f14:	7961      	ldrb	r1, [r4, #5]
    6f16:	f894 30c9 	ldrb.w	r3, [r4, #201]	; 0xc9
    6f1a:	4620      	mov	r0, r4
    6f1c:	4299      	cmp	r1, r3
    6f1e:	bf28      	it	cs
    6f20:	4619      	movcs	r1, r3
    6f22:	f000 fe4f 	bl	7bc4 <RAILINT_cd62b828417e3475c6b58e9a311685cc>
    6f26:	e7b0      	b.n	6e8a <RAILINT_eff06dff73e0f32be1552c4011c2dec9+0x112>
    6f28:	200001c8 	.word	0x200001c8
    6f2c:	200001d0 	.word	0x200001d0
    6f30:	20000ab0 	.word	0x20000ab0
    6f34:	20000ab8 	.word	0x20000ab8
    6f38:	20000ab4 	.word	0x20000ab4

00006f3c <RAILINT_f6dbb0a8d6338735e61b94958eb4964b>:
    6f3c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    6f3e:	460e      	mov	r6, r1
    6f40:	4605      	mov	r5, r0
    6f42:	f7ff f8c3 	bl	60cc <CORE_EnterCritical>
    6f46:	4631      	mov	r1, r6
    6f48:	4607      	mov	r7, r0
    6f4a:	4628      	mov	r0, r5
    6f4c:	f7ff fe88 	bl	6c60 <RAILINT_a414401b72e85e008bc59287e035ef41>
    6f50:	4604      	mov	r4, r0
    6f52:	b120      	cbz	r0, 6f5e <RAILINT_f6dbb0a8d6338735e61b94958eb4964b+0x22>
    6f54:	4638      	mov	r0, r7
    6f56:	f7ff f8bd 	bl	60d4 <CORE_ExitCritical>
    6f5a:	4620      	mov	r0, r4
    6f5c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    6f5e:	4603      	mov	r3, r0
    6f60:	4602      	mov	r2, r0
    6f62:	4631      	mov	r1, r6
    6f64:	4628      	mov	r0, r5
    6f66:	f7ff ff07 	bl	6d78 <RAILINT_eff06dff73e0f32be1552c4011c2dec9>
    6f6a:	4604      	mov	r4, r0
    6f6c:	4638      	mov	r0, r7
    6f6e:	f7ff f8b1 	bl	60d4 <CORE_ExitCritical>
    6f72:	4620      	mov	r0, r4
    6f74:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    6f76:	bf00      	nop

00006f78 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69>:
    6f78:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    6f7a:	4606      	mov	r6, r0
    6f7c:	460c      	mov	r4, r1
    6f7e:	b359      	cbz	r1, 6fd8 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x60>
    6f80:	680b      	ldr	r3, [r1, #0]
    6f82:	b143      	cbz	r3, 6f96 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x1e>
    6f84:	681b      	ldr	r3, [r3, #0]
    6f86:	3301      	adds	r3, #1
    6f88:	d026      	beq.n	6fd8 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x60>
    6f8a:	68cb      	ldr	r3, [r1, #12]
    6f8c:	b11b      	cbz	r3, 6f96 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x1e>
    6f8e:	688b      	ldr	r3, [r1, #8]
    6f90:	3b00      	subs	r3, #0
    6f92:	bf18      	it	ne
    6f94:	2301      	movne	r3, #1
    6f96:	4618      	mov	r0, r3
    6f98:	2261      	movs	r2, #97	; 0x61
    6f9a:	2141      	movs	r1, #65	; 0x41
    6f9c:	f000 f8cc 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    6fa0:	4620      	mov	r0, r4
    6fa2:	f001 ff7d 	bl	8ea0 <RAILINT_37dcaf6b67da0fa3f13a9cf3e2b6a0ca>
    6fa6:	2300      	movs	r3, #0
    6fa8:	f64f 72ff 	movw	r2, #65535	; 0xffff
    6fac:	f04f 0c1c 	mov.w	ip, #28
    6fb0:	f886 30cc 	strb.w	r3, [r6, #204]	; 0xcc
    6fb4:	e9c6 431c 	strd	r4, r3, [r6, #112]	; 0x70
    6fb8:	68e7      	ldr	r7, [r4, #12]
    6fba:	b2d8      	uxtb	r0, r3
    6fbc:	4287      	cmp	r7, r0
    6fbe:	d80d      	bhi.n	6fdc <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x64>
    6fc0:	4615      	mov	r5, r2
    6fc2:	2300      	movs	r3, #0
    6fc4:	4a0b      	ldr	r2, [pc, #44]	; (6ff4 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x7c>)
    6fc6:	4629      	mov	r1, r5
    6fc8:	6013      	str	r3, [r2, #0]
    6fca:	4a0b      	ldr	r2, [pc, #44]	; (6ff8 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x80>)
    6fcc:	4630      	mov	r0, r6
    6fce:	6013      	str	r3, [r2, #0]
    6fd0:	f7ff ffb4 	bl	6f3c <RAILINT_f6dbb0a8d6338735e61b94958eb4964b>
    6fd4:	4628      	mov	r0, r5
    6fd6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    6fd8:	2300      	movs	r3, #0
    6fda:	e7dc      	b.n	6f96 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x1e>
    6fdc:	68a1      	ldr	r1, [r4, #8]
    6fde:	fb0c 1100 	mla	r1, ip, r0, r1
    6fe2:	89cd      	ldrh	r5, [r1, #14]
    6fe4:	4295      	cmp	r5, r2
    6fe6:	d202      	bcs.n	6fee <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x76>
    6fe8:	2d00      	cmp	r5, #0
    6fea:	d0ea      	beq.n	6fc2 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x4a>
    6fec:	462a      	mov	r2, r5
    6fee:	3301      	adds	r3, #1
    6ff0:	e7e3      	b.n	6fba <RAILINT_f0f851116f368bc625e2a9fc0cccaa69+0x42>
    6ff2:	bf00      	nop
    6ff4:	20000ab4 	.word	0x20000ab4
    6ff8:	20000ab8 	.word	0x20000ab8

00006ffc <RAILINT_992a3700fea39ab020ab6087e28c16df>:
    6ffc:	780a      	ldrb	r2, [r1, #0]
    6ffe:	b538      	push	{r3, r4, r5, lr}
    7000:	4605      	mov	r5, r0
    7002:	4610      	mov	r0, r2
    7004:	f7ff fdb6 	bl	6b74 <RAILINT_a690160bdcee277d32012935fb6dead8>
    7008:	b160      	cbz	r0, 7024 <RAILINT_992a3700fea39ab020ab6087e28c16df+0x28>
    700a:	784c      	ldrb	r4, [r1, #1]
    700c:	4620      	mov	r0, r4
    700e:	f7ff fdb1 	bl	6b74 <RAILINT_a690160bdcee277d32012935fb6dead8>
    7012:	b138      	cbz	r0, 7024 <RAILINT_992a3700fea39ab020ab6087e28c16df+0x28>
    7014:	4322      	orrs	r2, r4
    7016:	0753      	lsls	r3, r2, #29
    7018:	d404      	bmi.n	7024 <RAILINT_992a3700fea39ab020ab6087e28c16df+0x28>
    701a:	4628      	mov	r0, r5
    701c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    7020:	f000 bd52 	b.w	7ac8 <RAILINT_c232eb9695d8ec51969199511f1ffdbc>
    7024:	2001      	movs	r0, #1
    7026:	bd38      	pop	{r3, r4, r5, pc}

00007028 <RAILINT_9dae83c5a5b496ad1ace0cccba141a93>:
    7028:	b510      	push	{r4, lr}
    702a:	4604      	mov	r4, r0
    702c:	7808      	ldrb	r0, [r1, #0]
    702e:	f7ff fda1 	bl	6b74 <RAILINT_a690160bdcee277d32012935fb6dead8>
    7032:	b158      	cbz	r0, 704c <RAILINT_9dae83c5a5b496ad1ace0cccba141a93+0x24>
    7034:	784a      	ldrb	r2, [r1, #1]
    7036:	4610      	mov	r0, r2
    7038:	f7ff fd9c 	bl	6b74 <RAILINT_a690160bdcee277d32012935fb6dead8>
    703c:	b130      	cbz	r0, 704c <RAILINT_9dae83c5a5b496ad1ace0cccba141a93+0x24>
    703e:	2a04      	cmp	r2, #4
    7040:	d004      	beq.n	704c <RAILINT_9dae83c5a5b496ad1ace0cccba141a93+0x24>
    7042:	4620      	mov	r0, r4
    7044:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    7048:	f000 bd74 	b.w	7b34 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215>
    704c:	2001      	movs	r0, #1
    704e:	bd10      	pop	{r4, pc}

00007050 <RAIL_ConfigEvents>:
    7050:	b430      	push	{r4, r5}
    7052:	e9dd 4502 	ldrd	r4, r5, [sp, #8]
    7056:	b100      	cbz	r0, 705a <RAIL_ConfigEvents+0xa>
    7058:	300c      	adds	r0, #12
    705a:	e9cd 4502 	strd	r4, r5, [sp, #8]
    705e:	bc30      	pop	{r4, r5}
    7060:	f000 bb28 	b.w	76b4 <RAILINT_2a4da4d01b26a7f90998f094ef0d126c>

00007064 <RAIL_ConfigAntenna>:
    7064:	4608      	mov	r0, r1
    7066:	f001 bb8d 	b.w	8784 <RAILINT_d035493dc985426c706a16725f81a4c1>

0000706a <RAIL_ConfigRxOptions>:
    706a:	b100      	cbz	r0, 706e <RAIL_ConfigRxOptions+0x4>
    706c:	300c      	adds	r0, #12
    706e:	f000 bcd5 	b.w	7a1c <RAILINT_c1ee6010aaf86bbd071153c63f21d1bb>

00007072 <RAILINT_7a1b83c18f57d5dc8774009ae81ab08e>:
    7072:	b538      	push	{r3, r4, r5, lr}
    7074:	4604      	mov	r4, r0
    7076:	460d      	mov	r5, r1
    7078:	f7ff ff60 	bl	6f3c <RAILINT_f6dbb0a8d6338735e61b94958eb4964b>
    707c:	b928      	cbnz	r0, 708a <RAILINT_7a1b83c18f57d5dc8774009ae81ab08e+0x18>
    707e:	4629      	mov	r1, r5
    7080:	4620      	mov	r0, r4
    7082:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    7086:	f000 bc2f 	b.w	78e8 <RAILINT_dadf1c52f26190429dcacf7151424c68>
    708a:	bd38      	pop	{r3, r4, r5, pc}

0000708c <RAILCb_ConfigFrameTypeLength>:
    708c:	f001 ba32 	b.w	84f4 <RAILINT_3bff6dfc0590d5c54bb0576abaeb38dd>

00007090 <RAILINT_45e98292b11a528e9c15f82e1aa2d629>:
    7090:	b538      	push	{r3, r4, r5, lr}
    7092:	4605      	mov	r5, r0
    7094:	460c      	mov	r4, r1
    7096:	f7ff f819 	bl	60cc <CORE_EnterCritical>
    709a:	69a9      	ldr	r1, [r5, #24]
    709c:	696b      	ldr	r3, [r5, #20]
    709e:	400c      	ands	r4, r1
    70a0:	4323      	orrs	r3, r4
    70a2:	616b      	str	r3, [r5, #20]
    70a4:	f7ff f816 	bl	60d4 <CORE_ExitCritical>
    70a8:	2000      	movs	r0, #0
    70aa:	b90c      	cbnz	r4, 70b0 <RAILINT_45e98292b11a528e9c15f82e1aa2d629+0x20>
    70ac:	2100      	movs	r1, #0
    70ae:	bd38      	pop	{r3, r4, r5, pc}
    70b0:	f44f 7100 	mov.w	r1, #512	; 0x200
    70b4:	e7fb      	b.n	70ae <RAILINT_45e98292b11a528e9c15f82e1aa2d629+0x1e>

000070b6 <RAIL_SetTxFifo>:
    70b6:	b100      	cbz	r0, 70ba <RAIL_SetTxFifo+0x4>
    70b8:	300c      	adds	r0, #12
    70ba:	f001 b823 	b.w	8104 <RAILINT_bfd5d2eb09d8a4a7871a5c604290c6e9>

000070be <RAIL_SetRxFifo>:
    70be:	b100      	cbz	r0, 70c2 <RAIL_SetRxFifo+0x4>
    70c0:	300c      	adds	r0, #12
    70c2:	f001 b83b 	b.w	813c <RAILINT_705827075d9b54aaab0fdf12a337d2ed>
	...

000070c8 <RAILCb_SetupRxFifo>:
    70c8:	f44f 7300 	mov.w	r3, #512	; 0x200
    70cc:	b507      	push	{r0, r1, r2, lr}
    70ce:	490a      	ldr	r1, [pc, #40]	; (70f8 <RAILCb_SetupRxFifo+0x30>)
    70d0:	f10d 0206 	add.w	r2, sp, #6
    70d4:	f8ad 3006 	strh.w	r3, [sp, #6]
    70d8:	f7ff fff1 	bl	70be <RAIL_SetRxFifo>
    70dc:	f8bd 3006 	ldrh.w	r3, [sp, #6]
    70e0:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    70e4:	d105      	bne.n	70f2 <RAILCb_SetupRxFifo+0x2a>
    70e6:	2802      	cmp	r0, #2
    70e8:	bf08      	it	eq
    70ea:	2000      	moveq	r0, #0
    70ec:	b003      	add	sp, #12
    70ee:	f85d fb04 	ldr.w	pc, [sp], #4
    70f2:	2001      	movs	r0, #1
    70f4:	e7fa      	b.n	70ec <RAILCb_SetupRxFifo+0x24>
    70f6:	bf00      	nop
    70f8:	20000abc 	.word	0x20000abc

000070fc <RAIL_GetRxPacketInfo>:
    70fc:	4608      	mov	r0, r1
    70fe:	4611      	mov	r1, r2
    7100:	f000 bf0e 	b.w	7f20 <RAILINT_052f8b2565813079f19c931bac48db51>

00007104 <RAIL_GetRxPacketDetails>:
    7104:	b100      	cbz	r0, 7108 <RAIL_GetRxPacketDetails+0x4>
    7106:	300c      	adds	r0, #12
    7108:	f000 bfda 	b.w	80c0 <RAILINT_310967c2629da02413ba4e8adfa3e137>

0000710c <RAIL_HoldRxPacket>:
    710c:	f000 bfec 	b.w	80e8 <RAILINT_d9e915d6d22bf4edc2f73d7c60daed1e>

00007110 <RAIL_ReleaseRxPacket>:
    7110:	4608      	mov	r0, r1
    7112:	f000 bfeb 	b.w	80ec <RAILINT_f921a6fdde390c986016ab0c8bf49fae>

00007116 <RAIL_PeekRxPacket>:
    7116:	4608      	mov	r0, r1
    7118:	4611      	mov	r1, r2
    711a:	461a      	mov	r2, r3
    711c:	f8bd 3000 	ldrh.w	r3, [sp]
    7120:	f000 bb16 	b.w	7750 <RAILINT_3131b2227caece62bdb8e184ed31ce2e>

00007124 <RAILCb_AssertFailed>:
    7124:	4b02      	ldr	r3, [pc, #8]	; (7130 <RAILCb_AssertFailed+0xc>)
    7126:	6019      	str	r1, [r3, #0]
    7128:	4b02      	ldr	r3, [pc, #8]	; (7134 <RAILCb_AssertFailed+0x10>)
    712a:	6018      	str	r0, [r3, #0]
    712c:	e7fe      	b.n	712c <RAILCb_AssertFailed+0x8>
    712e:	bf00      	nop
    7130:	200001cc 	.word	0x200001cc
    7134:	20000cc0 	.word	0x20000cc0

00007138 <RAILINT_205167ae842e22724c3f35c6430eeddb>:
    7138:	b508      	push	{r3, lr}
    713a:	b950      	cbnz	r0, 7152 <RAILINT_205167ae842e22724c3f35c6430eeddb+0x1a>
    713c:	4805      	ldr	r0, [pc, #20]	; (7154 <RAILINT_205167ae842e22724c3f35c6430eeddb+0x1c>)
    713e:	4b06      	ldr	r3, [pc, #24]	; (7158 <RAILINT_205167ae842e22724c3f35c6430eeddb+0x20>)
    7140:	6001      	str	r1, [r0, #0]
    7142:	601a      	str	r2, [r3, #0]
    7144:	4b05      	ldr	r3, [pc, #20]	; (715c <RAILINT_205167ae842e22724c3f35c6430eeddb+0x24>)
    7146:	681a      	ldr	r2, [r3, #0]
    7148:	4b05      	ldr	r3, [pc, #20]	; (7160 <RAILINT_205167ae842e22724c3f35c6430eeddb+0x28>)
    714a:	601a      	str	r2, [r3, #0]
    714c:	6818      	ldr	r0, [r3, #0]
    714e:	f7ff ffe9 	bl	7124 <RAILCb_AssertFailed>
    7152:	bd08      	pop	{r3, pc}
    7154:	200001cc 	.word	0x200001cc
    7158:	20000cbc 	.word	0x20000cbc
    715c:	20000aa8 	.word	0x20000aa8
    7160:	20000cc0 	.word	0x20000cc0

00007164 <RAILINT_32889d97e4b61459c43022425a5ba12c>:
    7164:	b100      	cbz	r0, 7168 <RAILINT_32889d97e4b61459c43022425a5ba12c+0x4>
    7166:	300c      	adds	r0, #12
    7168:	4708      	bx	r1
	...

0000716c <RAILINT_7ccc3c14971040883cbefc15a5cc66b4>:
    716c:	b5f0      	push	{r4, r5, r6, r7, lr}
    716e:	b08d      	sub	sp, #52	; 0x34
    7170:	ac03      	add	r4, sp, #12
    7172:	4605      	mov	r5, r0
    7174:	460b      	mov	r3, r1
    7176:	4627      	mov	r7, r4
    7178:	4a18      	ldr	r2, [pc, #96]	; (71dc <RAILINT_7ccc3c14971040883cbefc15a5cc66b4+0x70>)
    717a:	f102 0c20 	add.w	ip, r2, #32
    717e:	4626      	mov	r6, r4
    7180:	6810      	ldr	r0, [r2, #0]
    7182:	6851      	ldr	r1, [r2, #4]
    7184:	3208      	adds	r2, #8
    7186:	c603      	stmia	r6!, {r0, r1}
    7188:	4562      	cmp	r2, ip
    718a:	4634      	mov	r4, r6
    718c:	d1f7      	bne.n	717e <RAILINT_7ccc3c14971040883cbefc15a5cc66b4+0x12>
    718e:	2b00      	cmp	r3, #0
    7190:	bf08      	it	eq
    7192:	463b      	moveq	r3, r7
    7194:	2700      	movs	r7, #0
    7196:	6810      	ldr	r0, [r2, #0]
    7198:	461c      	mov	r4, r3
    719a:	6030      	str	r0, [r6, #0]
    719c:	4638      	mov	r0, r7
    719e:	f103 060c 	add.w	r6, r3, #12
    71a2:	b2fa      	uxtb	r2, r7
    71a4:	b980      	cbnz	r0, 71c8 <RAILINT_7ccc3c14971040883cbefc15a5cc66b4+0x5c>
    71a6:	4628      	mov	r0, r5
    71a8:	8821      	ldrh	r1, [r4, #0]
    71aa:	9201      	str	r2, [sp, #4]
    71ac:	f001 f9c6 	bl	853c <RAILINT_7f52347882ddbba7a077ea8579225490>
    71b0:	b950      	cbnz	r0, 71c8 <RAILINT_7ccc3c14971040883cbefc15a5cc66b4+0x5c>
    71b2:	4628      	mov	r0, r5
    71b4:	9a01      	ldr	r2, [sp, #4]
    71b6:	88e1      	ldrh	r1, [r4, #6]
    71b8:	f001 f9d4 	bl	8564 <RAILINT_0bdeace83920f49d6521258171637f3c>
    71bc:	b920      	cbnz	r0, 71c8 <RAILINT_7ccc3c14971040883cbefc15a5cc66b4+0x5c>
    71be:	4631      	mov	r1, r6
    71c0:	4628      	mov	r0, r5
    71c2:	9a01      	ldr	r2, [sp, #4]
    71c4:	f001 f9e3 	bl	858e <RAILINT_3ec854c4301ae6ed04c0338b9dec6a8d>
    71c8:	3701      	adds	r7, #1
    71ca:	2f03      	cmp	r7, #3
    71cc:	f106 0608 	add.w	r6, r6, #8
    71d0:	f104 0402 	add.w	r4, r4, #2
    71d4:	d1e5      	bne.n	71a2 <RAILINT_7ccc3c14971040883cbefc15a5cc66b4+0x36>
    71d6:	b00d      	add	sp, #52	; 0x34
    71d8:	bdf0      	pop	{r4, r5, r6, r7, pc}
    71da:	bf00      	nop
    71dc:	0000be90 	.word	0x0000be90

000071e0 <RAIL_IEEE802154_Init>:
    71e0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    71e4:	460d      	mov	r5, r1
    71e6:	4680      	mov	r8, r0
    71e8:	b08a      	sub	sp, #40	; 0x28
    71ea:	b390      	cbz	r0, 7252 <RAIL_IEEE802154_Init+0x72>
    71ec:	f100 070c 	add.w	r7, r0, #12
    71f0:	f895 3028 	ldrb.w	r3, [r5, #40]	; 0x28
    71f4:	f895 2029 	ldrb.w	r2, [r5, #41]	; 0x29
    71f8:	f895 102a 	ldrb.w	r1, [r5, #42]	; 0x2a
    71fc:	9300      	str	r3, [sp, #0]
    71fe:	4638      	mov	r0, r7
    7200:	f895 302b 	ldrb.w	r3, [r5, #43]	; 0x2b
    7204:	ac03      	add	r4, sp, #12
    7206:	f105 060c 	add.w	r6, r5, #12
    720a:	f001 fa01 	bl	8610 <RAILINT_98bbf79a9d5372aef3bfc63b8029e5b5>
    720e:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
    7210:	c40f      	stmia	r4!, {r0, r1, r2, r3}
    7212:	e896 0007 	ldmia.w	r6, {r0, r1, r2}
    7216:	e884 0007 	stmia.w	r4, {r0, r1, r2}
    721a:	a903      	add	r1, sp, #12
    721c:	4640      	mov	r0, r8
    721e:	f7ff fcef 	bl	6c00 <RAIL_SetStateTiming>
    7222:	4638      	mov	r0, r7
    7224:	1d29      	adds	r1, r5, #4
    7226:	f004 faa3 	bl	b770 <RAILINT_78eaa84173e85419c123802d17d70cee>
    722a:	4604      	mov	r4, r0
    722c:	b948      	cbnz	r0, 7242 <RAIL_IEEE802154_Init+0x62>
    722e:	4638      	mov	r0, r7
    7230:	4909      	ldr	r1, [pc, #36]	; (7258 <RAIL_IEEE802154_Init+0x78>)
    7232:	f001 f87f 	bl	8334 <RAILINT_c141602218ed06e17bb09de10ef4b9a3>
    7236:	4604      	mov	r4, r0
    7238:	b918      	cbnz	r0, 7242 <RAIL_IEEE802154_Init+0x62>
    723a:	4638      	mov	r0, r7
    723c:	f001 f9b6 	bl	85ac <RAILINT_bd523e50f8dd0476bd448bb4ab0a0bba>
    7240:	4604      	mov	r4, r0
    7242:	4638      	mov	r0, r7
    7244:	6829      	ldr	r1, [r5, #0]
    7246:	f7ff ff91 	bl	716c <RAILINT_7ccc3c14971040883cbefc15a5cc66b4>
    724a:	4620      	mov	r0, r4
    724c:	b00a      	add	sp, #40	; 0x28
    724e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    7252:	4607      	mov	r7, r0
    7254:	e7cc      	b.n	71f0 <RAIL_IEEE802154_Init+0x10>
    7256:	bf00      	nop
    7258:	0000beb4 	.word	0x0000beb4

0000725c <RAIL_IEEE802154_Config2p4GHzRadio>:
    725c:	4901      	ldr	r1, [pc, #4]	; (7264 <RAIL_IEEE802154_Config2p4GHzRadio+0x8>)
    725e:	f7ff bf81 	b.w	7164 <RAILINT_32889d97e4b61459c43022425a5ba12c>
    7262:	bf00      	nop
    7264:	00008531 	.word	0x00008531

00007268 <RAIL_IEEE802154_SetPromiscuousMode>:
    7268:	b513      	push	{r0, r1, r4, lr}
    726a:	4604      	mov	r4, r0
    726c:	b100      	cbz	r0, 7270 <RAIL_IEEE802154_SetPromiscuousMode+0x8>
    726e:	340c      	adds	r4, #12
    7270:	4620      	mov	r0, r4
    7272:	9101      	str	r1, [sp, #4]
    7274:	f001 f958 	bl	8528 <RAILINT_5cc919fc20dd52f2d4dcd0fd622a0329>
    7278:	b130      	cbz	r0, 7288 <RAIL_IEEE802154_SetPromiscuousMode+0x20>
    727a:	4620      	mov	r0, r4
    727c:	9901      	ldr	r1, [sp, #4]
    727e:	b002      	add	sp, #8
    7280:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    7284:	f001 b9ac 	b.w	85e0 <RAILINT_c37fe6dda1b65bd8e07f247eebfb0d24>
    7288:	2002      	movs	r0, #2
    728a:	b002      	add	sp, #8
    728c:	bd10      	pop	{r4, pc}

0000728e <RAIL_IEEE802154_AcceptFrames>:
    728e:	b513      	push	{r0, r1, r4, lr}
    7290:	4604      	mov	r4, r0
    7292:	b100      	cbz	r0, 7296 <RAIL_IEEE802154_AcceptFrames+0x8>
    7294:	340c      	adds	r4, #12
    7296:	4620      	mov	r0, r4
    7298:	9101      	str	r1, [sp, #4]
    729a:	f001 f945 	bl	8528 <RAILINT_5cc919fc20dd52f2d4dcd0fd622a0329>
    729e:	b130      	cbz	r0, 72ae <RAIL_IEEE802154_AcceptFrames+0x20>
    72a0:	4620      	mov	r0, r4
    72a2:	9901      	ldr	r1, [sp, #4]
    72a4:	b002      	add	sp, #8
    72a6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    72aa:	f001 b9a1 	b.w	85f0 <RAILINT_05746359872f2c5331853a4d5044e337>
    72ae:	2002      	movs	r0, #2
    72b0:	b002      	add	sp, #8
    72b2:	bd10      	pop	{r4, pc}

000072b4 <RAILINT_a8ad4c6e1a6fd4bd419176ffe7e198ac>:
    72b4:	2000      	movs	r0, #0
    72b6:	4770      	bx	lr

000072b8 <RAILINT_4520652711d56d79a92b925080040a23>:
    72b8:	2000      	movs	r0, #0
    72ba:	4770      	bx	lr

000072bc <RAILINT_07411be539f067663dfa5aa99baea238>:
    72bc:	4b02      	ldr	r3, [pc, #8]	; (72c8 <RAILINT_07411be539f067663dfa5aa99baea238+0xc>)
    72be:	68d8      	ldr	r0, [r3, #12]
    72c0:	f3c0 6003 	ubfx	r0, r0, #24, #4
    72c4:	4770      	bx	lr
    72c6:	bf00      	nop
    72c8:	a8020000 	.word	0xa8020000

000072cc <RAILINT_f0f279c05d6284199cc63667a48546c8>:
    72cc:	4770      	bx	lr
	...

000072d0 <RAILINT_57fa2c163b50cc6661e10e0e7662afb8>:
    72d0:	1c43      	adds	r3, r0, #1
    72d2:	d007      	beq.n	72e4 <RAILINT_57fa2c163b50cc6661e10e0e7662afb8+0x14>
    72d4:	f06f 02ff 	mvn.w	r2, #255	; 0xff
    72d8:	4b03      	ldr	r3, [pc, #12]	; (72e8 <RAILINT_57fa2c163b50cc6661e10e0e7662afb8+0x18>)
    72da:	4010      	ands	r0, r2
    72dc:	621a      	str	r2, [r3, #32]
    72de:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
    72e2:	6218      	str	r0, [r3, #32]
    72e4:	4770      	bx	lr
    72e6:	bf00      	nop
    72e8:	a800e000 	.word	0xa800e000

000072ec <RAILINT_3c9710db34f633d3b8fb008ca62c25bd>:
    72ec:	69c2      	ldr	r2, [r0, #28]
    72ee:	4b0e      	ldr	r3, [pc, #56]	; (7328 <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x3c>)
    72f0:	f002 0260 	and.w	r2, r2, #96	; 0x60
    72f4:	2a40      	cmp	r2, #64	; 0x40
    72f6:	d011      	beq.n	731c <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x30>
    72f8:	2a60      	cmp	r2, #96	; 0x60
    72fa:	d003      	beq.n	7304 <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x18>
    72fc:	2a20      	cmp	r2, #32
    72fe:	d110      	bne.n	7322 <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x36>
    7300:	2201      	movs	r2, #1
    7302:	e006      	b.n	7312 <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x26>
    7304:	b169      	cbz	r1, 7322 <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x36>
    7306:	680a      	ldr	r2, [r1, #0]
    7308:	2a01      	cmp	r2, #1
    730a:	d90a      	bls.n	7322 <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x36>
    730c:	694a      	ldr	r2, [r1, #20]
    730e:	f042 0201 	orr.w	r2, r2, #1
    7312:	63da      	str	r2, [r3, #60]	; 0x3c
    7314:	2280      	movs	r2, #128	; 0x80
    7316:	4b05      	ldr	r3, [pc, #20]	; (732c <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x40>)
    7318:	611a      	str	r2, [r3, #16]
    731a:	4770      	bx	lr
    731c:	f240 1201 	movw	r2, #257	; 0x101
    7320:	e7f7      	b.n	7312 <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x26>
    7322:	2200      	movs	r2, #0
    7324:	e7f5      	b.n	7312 <RAILINT_3c9710db34f633d3b8fb008ca62c25bd+0x26>
    7326:	bf00      	nop
    7328:	b0001f00 	.word	0xb0001f00
    732c:	a8020000 	.word	0xa8020000

00007330 <RAILINT_d3f1a953c5ad458b47a16e4df761d2c8>:
    7330:	b508      	push	{r3, lr}
    7332:	4a09      	ldr	r2, [pc, #36]	; (7358 <RAILINT_d3f1a953c5ad458b47a16e4df761d2c8+0x28>)
    7334:	f7ff ffc2 	bl	72bc <RAILINT_07411be539f067663dfa5aa99baea238>
    7338:	280b      	cmp	r0, #11
    733a:	d006      	beq.n	734a <RAILINT_d3f1a953c5ad458b47a16e4df761d2c8+0x1a>
    733c:	280c      	cmp	r0, #12
    733e:	d009      	beq.n	7354 <RAILINT_d3f1a953c5ad458b47a16e4df761d2c8+0x24>
    7340:	2809      	cmp	r0, #9
    7342:	bf14      	ite	ne
    7344:	2000      	movne	r0, #0
    7346:	2002      	moveq	r0, #2
    7348:	bd08      	pop	{r3, pc}
    734a:	6f10      	ldr	r0, [r2, #112]	; 0x70
    734c:	f410 3080 	ands.w	r0, r0, #65536	; 0x10000
    7350:	d1f0      	bne.n	7334 <RAILINT_d3f1a953c5ad458b47a16e4df761d2c8+0x4>
    7352:	e7f9      	b.n	7348 <RAILINT_d3f1a953c5ad458b47a16e4df761d2c8+0x18>
    7354:	2002      	movs	r0, #2
    7356:	e7f7      	b.n	7348 <RAILINT_d3f1a953c5ad458b47a16e4df761d2c8+0x18>
    7358:	a8020000 	.word	0xa8020000

0000735c <RAILINT_cd2294a9b77625e0ea5276bdf2a90514>:
    735c:	2101      	movs	r1, #1
    735e:	4b09      	ldr	r3, [pc, #36]	; (7384 <RAILINT_cd2294a9b77625e0ea5276bdf2a90514+0x28>)
    7360:	f8d3 20ec 	ldr.w	r2, [r3, #236]	; 0xec
    7364:	6319      	str	r1, [r3, #48]	; 0x30
    7366:	0752      	lsls	r2, r2, #29
    7368:	f44f 5100 	mov.w	r1, #8192	; 0x2000
    736c:	bf48      	it	mi
    736e:	2204      	movmi	r2, #4
    7370:	f503 5300 	add.w	r3, r3, #8192	; 0x2000
    7374:	62d9      	str	r1, [r3, #44]	; 0x2c
    7376:	bf44      	itt	mi
    7378:	f5a3 5380 	submi.w	r3, r3, #4096	; 0x1000
    737c:	f8c3 20ec 	strmi.w	r2, [r3, #236]	; 0xec
    7380:	4770      	bx	lr
    7382:	bf00      	nop
    7384:	44004000 	.word	0x44004000

00007388 <RAILINT_a06f36e75bf41143ad151f38401105ae>:
    7388:	b510      	push	{r4, lr}
    738a:	4604      	mov	r4, r0
    738c:	f8d0 20b4 	ldr.w	r2, [r0, #180]	; 0xb4
    7390:	4b0a      	ldr	r3, [pc, #40]	; (73bc <RAILINT_a06f36e75bf41143ad151f38401105ae+0x34>)
    7392:	f44f 6100 	mov.w	r1, #2048	; 0x800
    7396:	f8c3 20a0 	str.w	r2, [r3, #160]	; 0xa0
    739a:	7802      	ldrb	r2, [r0, #0]
    739c:	0212      	lsls	r2, r2, #8
    739e:	f402 6200 	and.w	r2, r2, #2048	; 0x800
    73a2:	f004 f909 	bl	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>
    73a6:	7823      	ldrb	r3, [r4, #0]
    73a8:	f013 0f08 	tst.w	r3, #8
    73ac:	f44f 7300 	mov.w	r3, #512	; 0x200
    73b0:	bf14      	ite	ne
    73b2:	4a03      	ldrne	r2, [pc, #12]	; (73c0 <RAILINT_a06f36e75bf41143ad151f38401105ae+0x38>)
    73b4:	4a03      	ldreq	r2, [pc, #12]	; (73c4 <RAILINT_a06f36e75bf41143ad151f38401105ae+0x3c>)
    73b6:	6713      	str	r3, [r2, #112]	; 0x70
    73b8:	bd10      	pop	{r4, pc}
    73ba:	bf00      	nop
    73bc:	b0001e00 	.word	0xb0001e00
    73c0:	a8021000 	.word	0xa8021000
    73c4:	a8022000 	.word	0xa8022000

000073c8 <RAILINT_14d09babf27325aeb090aac0c6f24436>:
    73c8:	b537      	push	{r0, r1, r2, r4, r5, lr}
    73ca:	460c      	mov	r4, r1
    73cc:	4d17      	ldr	r5, [pc, #92]	; (742c <RAILINT_14d09babf27325aeb090aac0c6f24436+0x64>)
    73ce:	b941      	cbnz	r1, 73e2 <RAILINT_14d09babf27325aeb090aac0c6f24436+0x1a>
    73d0:	460a      	mov	r2, r1
    73d2:	2107      	movs	r1, #7
    73d4:	f004 f8f0 	bl	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>
    73d8:	4b15      	ldr	r3, [pc, #84]	; (7430 <RAILINT_14d09babf27325aeb090aac0c6f24436+0x68>)
    73da:	61ac      	str	r4, [r5, #24]
    73dc:	605c      	str	r4, [r3, #4]
    73de:	b003      	add	sp, #12
    73e0:	bd30      	pop	{r4, r5, pc}
    73e2:	2207      	movs	r2, #7
    73e4:	4611      	mov	r1, r2
    73e6:	f004 f8e7 	bl	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>
    73ea:	2207      	movs	r2, #7
    73ec:	4b11      	ldr	r3, [pc, #68]	; (7434 <RAILINT_14d09babf27325aeb090aac0c6f24436+0x6c>)
    73ee:	2101      	movs	r1, #1
    73f0:	60da      	str	r2, [r3, #12]
    73f2:	7923      	ldrb	r3, [r4, #4]
    73f4:	a801      	add	r0, sp, #4
    73f6:	762b      	strb	r3, [r5, #24]
    73f8:	7963      	ldrb	r3, [r4, #5]
    73fa:	9301      	str	r3, [sp, #4]
    73fc:	f004 f93b 	bl	b676 <RAILINT_b04ac2e87c7e86c14dc53c58ce128069>
    7400:	9b01      	ldr	r3, [sp, #4]
    7402:	b2c2      	uxtb	r2, r0
    7404:	40d3      	lsrs	r3, r2
    7406:	f000 000f 	and.w	r0, r0, #15
    740a:	ea40 1003 	orr.w	r0, r0, r3, lsl #4
    740e:	7668      	strb	r0, [r5, #25]
    7410:	79a3      	ldrb	r3, [r4, #6]
    7412:	4a09      	ldr	r2, [pc, #36]	; (7438 <RAILINT_14d09babf27325aeb090aac0c6f24436+0x70>)
    7414:	76ab      	strb	r3, [r5, #26]
    7416:	79e3      	ldrb	r3, [r4, #7]
    7418:	76eb      	strb	r3, [r5, #27]
    741a:	6823      	ldr	r3, [r4, #0]
    741c:	61eb      	str	r3, [r5, #28]
    741e:	7923      	ldrb	r3, [r4, #4]
    7420:	3301      	adds	r3, #1
    7422:	6213      	str	r3, [r2, #32]
    7424:	f004 f926 	bl	b674 <RAILINT_dc675e4729ddc8fc4759ebbb1d4c3bce>
    7428:	e7d9      	b.n	73de <RAILINT_14d09babf27325aeb090aac0c6f24436+0x16>
    742a:	bf00      	nop
    742c:	b0001f00 	.word	0xb0001f00
    7430:	b0001f18 	.word	0xb0001f18
    7434:	a8006000 	.word	0xa8006000
    7438:	a8004000 	.word	0xa8004000

0000743c <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a>:
    743c:	b510      	push	{r4, lr}
    743e:	784b      	ldrb	r3, [r1, #1]
    7440:	460c      	mov	r4, r1
    7442:	2b00      	cmp	r3, #0
    7444:	d13c      	bne.n	74c0 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x84>
    7446:	4a39      	ldr	r2, [pc, #228]	; (752c <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xf0>)
    7448:	f8c2 308c 	str.w	r3, [r2, #140]	; 0x8c
    744c:	f04f 5260 	mov.w	r2, #939524096	; 0x38000000
    7450:	4b37      	ldr	r3, [pc, #220]	; (7530 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xf4>)
    7452:	621a      	str	r2, [r3, #32]
    7454:	4b37      	ldr	r3, [pc, #220]	; (7534 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xf8>)
    7456:	781b      	ldrb	r3, [r3, #0]
    7458:	b113      	cbz	r3, 7460 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x24>
    745a:	2206      	movs	r2, #6
    745c:	4b36      	ldr	r3, [pc, #216]	; (7538 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xfc>)
    745e:	679a      	str	r2, [r3, #120]	; 0x78
    7460:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
    7464:	4b35      	ldr	r3, [pc, #212]	; (753c <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x100>)
    7466:	67da      	str	r2, [r3, #124]	; 0x7c
    7468:	f5a3 5300 	sub.w	r3, r3, #8192	; 0x2000
    746c:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    746e:	025b      	lsls	r3, r3, #9
    7470:	d408      	bmi.n	7484 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x48>
    7472:	69c3      	ldr	r3, [r0, #28]
    7474:	f013 0f80 	tst.w	r3, #128	; 0x80
    7478:	f44f 1300 	mov.w	r3, #2097152	; 0x200000
    747c:	bf14      	ite	ne
    747e:	4a30      	ldrne	r2, [pc, #192]	; (7540 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x104>)
    7480:	4a2b      	ldreq	r2, [pc, #172]	; (7530 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xf4>)
    7482:	6213      	str	r3, [r2, #32]
    7484:	f44f 7280 	mov.w	r2, #256	; 0x100
    7488:	4b2e      	ldr	r3, [pc, #184]	; (7544 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x108>)
    748a:	f8c3 20ec 	str.w	r2, [r3, #236]	; 0xec
    748e:	f8c3 20e0 	str.w	r2, [r3, #224]	; 0xe0
    7492:	78a3      	ldrb	r3, [r4, #2]
    7494:	2b00      	cmp	r3, #0
    7496:	d140      	bne.n	751a <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xde>
    7498:	f640 72ff 	movw	r2, #4095	; 0xfff
    749c:	4b2a      	ldr	r3, [pc, #168]	; (7548 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x10c>)
    749e:	62da      	str	r2, [r3, #44]	; 0x2c
    74a0:	78e3      	ldrb	r3, [r4, #3]
    74a2:	2b00      	cmp	r3, #0
    74a4:	d13c      	bne.n	7520 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xe4>
    74a6:	f640 72ff 	movw	r2, #4095	; 0xfff
    74aa:	4b27      	ldr	r3, [pc, #156]	; (7548 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x10c>)
    74ac:	65da      	str	r2, [r3, #92]	; 0x5c
    74ae:	2260      	movs	r2, #96	; 0x60
    74b0:	4b26      	ldr	r3, [pc, #152]	; (754c <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x110>)
    74b2:	64da      	str	r2, [r3, #76]	; 0x4c
    74b4:	f503 33e8 	add.w	r3, r3, #118784	; 0x1d000
    74b8:	2240      	movs	r2, #64	; 0x40
    74ba:	2000      	movs	r0, #0
    74bc:	671a      	str	r2, [r3, #112]	; 0x70
    74be:	bd10      	pop	{r4, pc}
    74c0:	3b01      	subs	r3, #1
    74c2:	b2db      	uxtb	r3, r3
    74c4:	2b03      	cmp	r3, #3
    74c6:	d8e4      	bhi.n	7492 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x56>
    74c8:	f04f 5160 	mov.w	r1, #939524096	; 0x38000000
    74cc:	4a20      	ldr	r2, [pc, #128]	; (7550 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x114>)
    74ce:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
    74d2:	4a17      	ldr	r2, [pc, #92]	; (7530 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xf4>)
    74d4:	f443 1300 	orr.w	r3, r3, #2097152	; 0x200000
    74d8:	6211      	str	r1, [r2, #32]
    74da:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
    74de:	6213      	str	r3, [r2, #32]
    74e0:	2304      	movs	r3, #4
    74e2:	f5a2 3288 	sub.w	r2, r2, #69632	; 0x11000
    74e6:	f8c2 308c 	str.w	r3, [r2, #140]	; 0x8c
    74ea:	6f93      	ldr	r3, [r2, #120]	; 0x78
    74ec:	f023 0306 	bic.w	r3, r3, #6
    74f0:	f043 0304 	orr.w	r3, r3, #4
    74f4:	6793      	str	r3, [r2, #120]	; 0x78
    74f6:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
    74fa:	4b16      	ldr	r3, [pc, #88]	; (7554 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x118>)
    74fc:	67da      	str	r2, [r3, #124]	; 0x7c
    74fe:	f003 facf 	bl	aaa0 <RAILINT_5d6f9e1abd47331b2e5065ec63f9f308>
    7502:	2800      	cmp	r0, #0
    7504:	d0c5      	beq.n	7492 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x56>
    7506:	f44f 7380 	mov.w	r3, #256	; 0x100
    750a:	4a0e      	ldr	r2, [pc, #56]	; (7544 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x108>)
    750c:	f8c2 30e0 	str.w	r3, [r2, #224]	; 0xe0
    7510:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
    7514:	f8c2 30ec 	str.w	r3, [r2, #236]	; 0xec
    7518:	e7bb      	b.n	7492 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x56>
    751a:	f7ff ff1f 	bl	735c <RAILINT_cd2294a9b77625e0ea5276bdf2a90514>
    751e:	e7bf      	b.n	74a0 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x64>
    7520:	2260      	movs	r2, #96	; 0x60
    7522:	4b05      	ldr	r3, [pc, #20]	; (7538 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0xfc>)
    7524:	64da      	str	r2, [r3, #76]	; 0x4c
    7526:	f503 33d8 	add.w	r3, r3, #110592	; 0x1b000
    752a:	e7c5      	b.n	74b8 <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a+0x7c>
    752c:	a8004000 	.word	0xa8004000
    7530:	a8016000 	.word	0xa8016000
    7534:	20000cc8 	.word	0x20000cc8
    7538:	a8006000 	.word	0xa8006000
    753c:	a8022000 	.word	0xa8022000
    7540:	a8015000 	.word	0xa8015000
    7544:	44006000 	.word	0x44006000
    7548:	44004000 	.word	0x44004000
    754c:	a8005000 	.word	0xa8005000
    7550:	0000bebc 	.word	0x0000bebc
    7554:	a8021000 	.word	0xa8021000

00007558 <RAILINT_9a12d5b6e36b120af4f5fbee5b057a33>:
    7558:	4a04      	ldr	r2, [pc, #16]	; (756c <RAILINT_9a12d5b6e36b120af4f5fbee5b057a33+0x14>)
    755a:	02c0      	lsls	r0, r0, #11
    755c:	69d3      	ldr	r3, [r2, #28]
    755e:	f400 20ff 	and.w	r0, r0, #522240	; 0x7f800
    7562:	f423 23ff 	bic.w	r3, r3, #522240	; 0x7f800
    7566:	4318      	orrs	r0, r3
    7568:	61d0      	str	r0, [r2, #28]
    756a:	4770      	bx	lr
    756c:	a800c000 	.word	0xa800c000

00007570 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73>:
    7570:	4b43      	ldr	r3, [pc, #268]	; (7680 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x110>)
    7572:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
    7576:	681e      	ldr	r6, [r3, #0]
    7578:	4605      	mov	r5, r0
    757a:	460c      	mov	r4, r1
    757c:	4617      	mov	r7, r2
    757e:	b106      	cbz	r6, 7582 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x12>
    7580:	360c      	adds	r6, #12
    7582:	f240 2302 	movw	r3, #514	; 0x202
    7586:	f005 0201 	and.w	r2, r5, #1
    758a:	4023      	ands	r3, r4
    758c:	4313      	orrs	r3, r2
    758e:	d044      	beq.n	761a <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0xaa>
    7590:	07a3      	lsls	r3, r4, #30
    7592:	d509      	bpl.n	75a8 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x38>
    7594:	4b3b      	ldr	r3, [pc, #236]	; (7684 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x114>)
    7596:	f8d3 3ecc 	ldr.w	r3, [r3, #3788]	; 0xecc
    759a:	f003 03c0 	and.w	r3, r3, #192	; 0xc0
    759e:	2b40      	cmp	r3, #64	; 0x40
    75a0:	bf02      	ittt	eq
    75a2:	2102      	moveq	r1, #2
    75a4:	4b38      	ldreq	r3, [pc, #224]	; (7688 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x118>)
    75a6:	6099      	streq	r1, [r3, #8]
    75a8:	f04f 0800 	mov.w	r8, #0
    75ac:	b35a      	cbz	r2, 7606 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x96>
    75ae:	2300      	movs	r3, #0
    75b0:	2200      	movs	r2, #0
    75b2:	2100      	movs	r1, #0
    75b4:	2001      	movs	r0, #1
    75b6:	e9cd 8800 	strd	r8, r8, [sp]
    75ba:	f003 f88f 	bl	a6dc <RAILINT_e56520736dccfc6b4febe00b533ea27a>
    75be:	2004      	movs	r0, #4
    75c0:	f002 f830 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    75c4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    75c8:	f002 fb5e 	bl	9c88 <RAILINT_0f8f345c59ce02114959a6bf3fac0981>
    75cc:	4641      	mov	r1, r8
    75ce:	8170      	strh	r0, [r6, #10]
    75d0:	2001      	movs	r0, #1
    75d2:	f7ff fafb 	bl	6bcc <RAILINT_499a6fa84e713dbcc15223a1179c1579>
    75d6:	4b2d      	ldr	r3, [pc, #180]	; (768c <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x11c>)
    75d8:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    75da:	0258      	lsls	r0, r3, #9
    75dc:	d408      	bmi.n	75f0 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x80>
    75de:	69f3      	ldr	r3, [r6, #28]
    75e0:	f013 0f80 	tst.w	r3, #128	; 0x80
    75e4:	f44f 1300 	mov.w	r3, #2097152	; 0x200000
    75e8:	bf14      	ite	ne
    75ea:	4a29      	ldrne	r2, [pc, #164]	; (7690 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x120>)
    75ec:	4a29      	ldreq	r2, [pc, #164]	; (7694 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x124>)
    75ee:	6213      	str	r3, [r2, #32]
    75f0:	4929      	ldr	r1, [pc, #164]	; (7698 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x128>)
    75f2:	6808      	ldr	r0, [r1, #0]
    75f4:	f7ff fe6c 	bl	72d0 <RAILINT_57fa2c163b50cc6661e10e0e7662afb8>
    75f8:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    75fc:	600b      	str	r3, [r1, #0]
    75fe:	7833      	ldrb	r3, [r6, #0]
    7600:	f043 0304 	orr.w	r3, r3, #4
    7604:	7033      	strb	r3, [r6, #0]
    7606:	05a1      	lsls	r1, r4, #22
    7608:	d507      	bpl.n	761a <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0xaa>
    760a:	2101      	movs	r1, #1
    760c:	4630      	mov	r0, r6
    760e:	f7ff fd3f 	bl	7090 <RAILINT_45e98292b11a528e9c15f82e1aa2d629>
    7612:	f424 7400 	bic.w	r4, r4, #512	; 0x200
    7616:	4305      	orrs	r5, r0
    7618:	430c      	orrs	r4, r1
    761a:	e9d6 233a 	ldrd	r2, r3, [r6, #232]	; 0xe8
    761e:	4015      	ands	r5, r2
    7620:	4023      	ands	r3, r4
    7622:	ea55 0203 	orrs.w	r2, r5, r3
    7626:	d00a      	beq.n	763e <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0xce>
    7628:	4a1c      	ldr	r2, [pc, #112]	; (769c <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x12c>)
    762a:	f1a6 000c 	sub.w	r0, r6, #12
    762e:	6811      	ldr	r1, [r2, #0]
    7630:	462a      	mov	r2, r5
    7632:	4788      	blx	r1
    7634:	072a      	lsls	r2, r5, #28
    7636:	bf42      	ittt	mi
    7638:	2200      	movmi	r2, #0
    763a:	4b19      	ldrmi	r3, [pc, #100]	; (76a0 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x130>)
    763c:	601a      	strmi	r2, [r3, #0]
    763e:	07fb      	lsls	r3, r7, #31
    7640:	d50f      	bpl.n	7662 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0xf2>
    7642:	4918      	ldr	r1, [pc, #96]	; (76a4 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x134>)
    7644:	4a18      	ldr	r2, [pc, #96]	; (76a8 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x138>)
    7646:	6808      	ldr	r0, [r1, #0]
    7648:	2100      	movs	r1, #0
    764a:	6813      	ldr	r3, [r2, #0]
    764c:	6011      	str	r1, [r2, #0]
    764e:	2101      	movs	r1, #1
    7650:	4a16      	ldr	r2, [pc, #88]	; (76ac <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x13c>)
    7652:	7011      	strb	r1, [r2, #0]
    7654:	b103      	cbz	r3, 7658 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0xe8>
    7656:	4798      	blx	r3
    7658:	4b15      	ldr	r3, [pc, #84]	; (76b0 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x140>)
    765a:	2100      	movs	r1, #0
    765c:	2002      	movs	r0, #2
    765e:	685b      	ldr	r3, [r3, #4]
    7660:	4798      	blx	r3
    7662:	f017 0f0e 	tst.w	r7, #14
    7666:	d008      	beq.n	767a <RAILINT_2c0c7ba0065447faa0ab7205349f5d73+0x10a>
    7668:	f44f 72b0 	mov.w	r2, #352	; 0x160
    766c:	213b      	movs	r1, #59	; 0x3b
    766e:	2000      	movs	r0, #0
    7670:	b002      	add	sp, #8
    7672:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    7676:	f7ff bd5f 	b.w	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    767a:	b002      	add	sp, #8
    767c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    7680:	20000aa8 	.word	0x20000aa8
    7684:	b0001000 	.word	0xb0001000
    7688:	a8021000 	.word	0xa8021000
    768c:	a8020000 	.word	0xa8020000
    7690:	a8015000 	.word	0xa8015000
    7694:	a8016000 	.word	0xa8016000
    7698:	200001dc 	.word	0x200001dc
    769c:	200001d8 	.word	0x200001d8
    76a0:	20000ccc 	.word	0x20000ccc
    76a4:	20000ce4 	.word	0x20000ce4
    76a8:	20000ce0 	.word	0x20000ce0
    76ac:	20000cdc 	.word	0x20000cdc
    76b0:	200001d0 	.word	0x200001d0

000076b4 <RAILINT_2a4da4d01b26a7f90998f094ef0d126c>:
    76b4:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    76b6:	e9d0 c73a 	ldrd	ip, r7, [r0, #232]	; 0xe8
    76ba:	4619      	mov	r1, r3
    76bc:	e9dd 6308 	ldrd	r6, r3, [sp, #32]
    76c0:	4604      	mov	r4, r0
    76c2:	ea8c 0506 	eor.w	r5, ip, r6
    76c6:	ea87 0003 	eor.w	r0, r7, r3
    76ca:	4015      	ands	r5, r2
    76cc:	4008      	ands	r0, r1
    76ce:	ea85 050c 	eor.w	r5, r5, ip
    76d2:	4078      	eors	r0, r7
    76d4:	e9c4 503a 	strd	r5, r0, [r4, #232]	; 0xe8
    76d8:	2500      	movs	r5, #0
    76da:	400b      	ands	r3, r1
    76dc:	f022 0001 	bic.w	r0, r2, #1
    76e0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    76e4:	ea06 0200 	and.w	r2, r6, r0
    76e8:	f043 0302 	orr.w	r3, r3, #2
    76ec:	e9cd 5500 	strd	r5, r5, [sp]
    76f0:	f002 fff4 	bl	a6dc <RAILINT_e56520736dccfc6b4febe00b533ea27a>
    76f4:	7823      	ldrb	r3, [r4, #0]
    76f6:	07da      	lsls	r2, r3, #31
    76f8:	d518      	bpl.n	772c <RAILINT_2a4da4d01b26a7f90998f094ef0d126c+0x78>
    76fa:	f8d4 30ec 	ldr.w	r3, [r4, #236]	; 0xec
    76fe:	059b      	lsls	r3, r3, #22
    7700:	d514      	bpl.n	772c <RAILINT_2a4da4d01b26a7f90998f094ef0d126c+0x78>
    7702:	f44f 3180 	mov.w	r1, #65536	; 0x10000
    7706:	4620      	mov	r0, r4
    7708:	f7ff fcc2 	bl	7090 <RAILINT_45e98292b11a528e9c15f82e1aa2d629>
    770c:	7823      	ldrb	r3, [r4, #0]
    770e:	f365 0300 	bfi	r3, r5, #0, #1
    7712:	7023      	strb	r3, [r4, #0]
    7714:	e9d4 233a 	ldrd	r2, r3, [r4, #232]	; 0xe8
    7718:	4002      	ands	r2, r0
    771a:	400b      	ands	r3, r1
    771c:	ea52 0103 	orrs.w	r1, r2, r3
    7720:	d004      	beq.n	772c <RAILINT_2a4da4d01b26a7f90998f094ef0d126c+0x78>
    7722:	4904      	ldr	r1, [pc, #16]	; (7734 <RAILINT_2a4da4d01b26a7f90998f094ef0d126c+0x80>)
    7724:	f1a4 000c 	sub.w	r0, r4, #12
    7728:	6809      	ldr	r1, [r1, #0]
    772a:	4788      	blx	r1
    772c:	2000      	movs	r0, #0
    772e:	b003      	add	sp, #12
    7730:	bdf0      	pop	{r4, r5, r6, r7, pc}
    7732:	bf00      	nop
    7734:	200001d8 	.word	0x200001d8

00007738 <RAILINT_ee8e30d6c3ef95b8e8dca03da7401c07>:
    7738:	4a03      	ldr	r2, [pc, #12]	; (7748 <RAILINT_ee8e30d6c3ef95b8e8dca03da7401c07+0x10>)
    773a:	6803      	ldr	r3, [r0, #0]
    773c:	2b00      	cmp	r3, #0
    773e:	bf08      	it	eq
    7740:	4613      	moveq	r3, r2
    7742:	4a02      	ldr	r2, [pc, #8]	; (774c <RAILINT_ee8e30d6c3ef95b8e8dca03da7401c07+0x14>)
    7744:	6013      	str	r3, [r2, #0]
    7746:	4770      	bx	lr
    7748:	000072cd 	.word	0x000072cd
    774c:	200001d8 	.word	0x200001d8

00007750 <RAILINT_3131b2227caece62bdb8e184ed31ce2e>:
    7750:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    7754:	4606      	mov	r6, r0
    7756:	4614      	mov	r4, r2
    7758:	461d      	mov	r5, r3
    775a:	460f      	mov	r7, r1
    775c:	b086      	sub	sp, #24
    775e:	2900      	cmp	r1, #0
    7760:	d046      	beq.n	77f0 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0xa0>
    7762:	b1fa      	cbz	r2, 77a4 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0x54>
    7764:	b360      	cbz	r0, 77c0 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0x70>
    7766:	f8df 8098 	ldr.w	r8, [pc, #152]	; 7800 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0xb0>
    776a:	f7fe fcaf 	bl	60cc <CORE_EnterCritical>
    776e:	f8d8 3000 	ldr.w	r3, [r8]
    7772:	42b3      	cmp	r3, r6
    7774:	d11a      	bne.n	77ac <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0x5c>
    7776:	4b1f      	ldr	r3, [pc, #124]	; (77f4 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0xa4>)
    7778:	881b      	ldrh	r3, [r3, #0]
    777a:	f8ad 3002 	strh.w	r3, [sp, #2]
    777e:	4b1e      	ldr	r3, [pc, #120]	; (77f8 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0xa8>)
    7780:	881e      	ldrh	r6, [r3, #0]
    7782:	f7fe fca7 	bl	60d4 <CORE_ExitCritical>
    7786:	192b      	adds	r3, r5, r4
    7788:	42b3      	cmp	r3, r6
    778a:	f8bd 3002 	ldrh.w	r3, [sp, #2]
    778e:	bfc4      	itt	gt
    7790:	1b74      	subgt	r4, r6, r5
    7792:	b2a4      	uxthgt	r4, r4
    7794:	442b      	add	r3, r5
    7796:	4622      	mov	r2, r4
    7798:	4639      	mov	r1, r7
    779a:	4818      	ldr	r0, [pc, #96]	; (77fc <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0xac>)
    779c:	b29b      	uxth	r3, r3
    779e:	f001 f919 	bl	89d4 <RAILINT_cf127192a488f2899b98e74293e0d50f>
    77a2:	4604      	mov	r4, r0
    77a4:	4620      	mov	r0, r4
    77a6:	b006      	add	sp, #24
    77a8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    77ac:	f7fe fc92 	bl	60d4 <CORE_ExitCritical>
    77b0:	4630      	mov	r0, r6
    77b2:	f10d 0202 	add.w	r2, sp, #2
    77b6:	a901      	add	r1, sp, #4
    77b8:	f001 faae 	bl	8d18 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30>
    77bc:	4606      	mov	r6, r0
    77be:	b908      	cbnz	r0, 77c4 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0x74>
    77c0:	4634      	mov	r4, r6
    77c2:	e7ef      	b.n	77a4 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0x54>
    77c4:	f89d 3004 	ldrb.w	r3, [sp, #4]
    77c8:	f013 0ff7 	tst.w	r3, #247	; 0xf7
    77cc:	d00d      	beq.n	77ea <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0x9a>
    77ce:	f7fe fc7d 	bl	60cc <CORE_EnterCritical>
    77d2:	4b08      	ldr	r3, [pc, #32]	; (77f4 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0xa4>)
    77d4:	f8bd 2002 	ldrh.w	r2, [sp, #2]
    77d8:	f8c8 6000 	str.w	r6, [r8]
    77dc:	801a      	strh	r2, [r3, #0]
    77de:	4b06      	ldr	r3, [pc, #24]	; (77f8 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0xa8>)
    77e0:	f8bd 2006 	ldrh.w	r2, [sp, #6]
    77e4:	801a      	strh	r2, [r3, #0]
    77e6:	f7fe fc75 	bl	60d4 <CORE_ExitCritical>
    77ea:	f8bd 6006 	ldrh.w	r6, [sp, #6]
    77ee:	e7ca      	b.n	7786 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0x36>
    77f0:	460c      	mov	r4, r1
    77f2:	e7d7      	b.n	77a4 <RAILINT_3131b2227caece62bdb8e184ed31ce2e+0x54>
    77f4:	20000cd0 	.word	0x20000cd0
    77f8:	20000cca 	.word	0x20000cca
    77fc:	44004038 	.word	0x44004038
    7800:	20000ccc 	.word	0x20000ccc

00007804 <RAILINT_afeea334a0413e3fba4d9024b9c8696e>:
    7804:	4b01      	ldr	r3, [pc, #4]	; (780c <RAILINT_afeea334a0413e3fba4d9024b9c8696e+0x8>)
    7806:	2000      	movs	r0, #0
    7808:	6319      	str	r1, [r3, #48]	; 0x30
    780a:	4770      	bx	lr
    780c:	b0001f00 	.word	0xb0001f00

00007810 <RAILINT_99f0e717b1ae5f07aeace88464176fa9>:
    7810:	2803      	cmp	r0, #3
    7812:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
    7816:	d83e      	bhi.n	7896 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x86>
    7818:	4b20      	ldr	r3, [pc, #128]	; (789c <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x8c>)
    781a:	5c1e      	ldrb	r6, [r3, r0]
    781c:	4b20      	ldr	r3, [pc, #128]	; (78a0 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x90>)
    781e:	5c1f      	ldrb	r7, [r3, r0]
    7820:	4b20      	ldr	r3, [pc, #128]	; (78a4 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x94>)
    7822:	f813 8000 	ldrb.w	r8, [r3, r0]
    7826:	f7fe fc51 	bl	60cc <CORE_EnterCritical>
    782a:	4605      	mov	r5, r0
    782c:	f003 f930 	bl	aa90 <RAILINT_0e4fab607515a0ae94861cde84b8a317>
    7830:	4604      	mov	r4, r0
    7832:	b140      	cbz	r0, 7846 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x36>
    7834:	2300      	movs	r3, #0
    7836:	2200      	movs	r2, #0
    7838:	e9cd 3300 	strd	r3, r3, [sp]
    783c:	2001      	movs	r0, #1
    783e:	2300      	movs	r3, #0
    7840:	2100      	movs	r1, #0
    7842:	f002 ff4b 	bl	a6dc <RAILINT_e56520736dccfc6b4febe00b533ea27a>
    7846:	4639      	mov	r1, r7
    7848:	4630      	mov	r0, r6
    784a:	f003 f9b3 	bl	abb4 <RAILINT_cf4e885725a47449d7a6caf77bda2061>
    784e:	4642      	mov	r2, r8
    7850:	4639      	mov	r1, r7
    7852:	4630      	mov	r0, r6
    7854:	f003 fa04 	bl	ac60 <RAILINT_415699d4fedc812ab5645a39d53b6366>
    7858:	b1bc      	cbz	r4, 788a <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x7a>
    785a:	4b13      	ldr	r3, [pc, #76]	; (78a8 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x98>)
    785c:	681b      	ldr	r3, [r3, #0]
    785e:	b103      	cbz	r3, 7862 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x52>
    7860:	330c      	adds	r3, #12
    7862:	4a12      	ldr	r2, [pc, #72]	; (78ac <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x9c>)
    7864:	6f12      	ldr	r2, [r2, #112]	; 0x70
    7866:	0252      	lsls	r2, r2, #9
    7868:	d408      	bmi.n	787c <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0x6c>
    786a:	69db      	ldr	r3, [r3, #28]
    786c:	f013 0f80 	tst.w	r3, #128	; 0x80
    7870:	f44f 1300 	mov.w	r3, #2097152	; 0x200000
    7874:	bf14      	ite	ne
    7876:	4a0e      	ldrne	r2, [pc, #56]	; (78b0 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0xa0>)
    7878:	4a0e      	ldreq	r2, [pc, #56]	; (78b4 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0xa4>)
    787a:	6213      	str	r3, [r2, #32]
    787c:	490e      	ldr	r1, [pc, #56]	; (78b8 <RAILINT_99f0e717b1ae5f07aeace88464176fa9+0xa8>)
    787e:	6808      	ldr	r0, [r1, #0]
    7880:	f7ff fd26 	bl	72d0 <RAILINT_57fa2c163b50cc6661e10e0e7662afb8>
    7884:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    7888:	600b      	str	r3, [r1, #0]
    788a:	4628      	mov	r0, r5
    788c:	b002      	add	sp, #8
    788e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    7892:	f7fe bc1f 	b.w	60d4 <CORE_ExitCritical>
    7896:	b002      	add	sp, #8
    7898:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    789c:	0000becc 	.word	0x0000becc
    78a0:	0000bed0 	.word	0x0000bed0
    78a4:	0000bed4 	.word	0x0000bed4
    78a8:	20000aa8 	.word	0x20000aa8
    78ac:	a8020000 	.word	0xa8020000
    78b0:	a8015000 	.word	0xa8015000
    78b4:	a8016000 	.word	0xa8016000
    78b8:	200001dc 	.word	0x200001dc

000078bc <RAILINT_a4b57b9485a34098ab089f4c182a3c25>:
    78bc:	b508      	push	{r3, lr}
    78be:	f7ff fcfd 	bl	72bc <RAILINT_07411be539f067663dfa5aa99baea238>
    78c2:	3801      	subs	r0, #1
    78c4:	b2c0      	uxtb	r0, r0
    78c6:	280b      	cmp	r0, #11
    78c8:	d802      	bhi.n	78d0 <RAILINT_a4b57b9485a34098ab089f4c182a3c25+0x14>
    78ca:	4b05      	ldr	r3, [pc, #20]	; (78e0 <RAILINT_a4b57b9485a34098ab089f4c182a3c25+0x24>)
    78cc:	5c18      	ldrb	r0, [r3, r0]
    78ce:	bd08      	pop	{r3, pc}
    78d0:	4b04      	ldr	r3, [pc, #16]	; (78e4 <RAILINT_a4b57b9485a34098ab089f4c182a3c25+0x28>)
    78d2:	695b      	ldr	r3, [r3, #20]
    78d4:	f013 0f06 	tst.w	r3, #6
    78d8:	bf0c      	ite	eq
    78da:	2001      	moveq	r0, #1
    78dc:	2004      	movne	r0, #4
    78de:	e7f6      	b.n	78ce <RAILINT_a4b57b9485a34098ab089f4c182a3c25+0x12>
    78e0:	0000bed8 	.word	0x0000bed8
    78e4:	a801c000 	.word	0xa801c000

000078e8 <RAILINT_dadf1c52f26190429dcacf7151424c68>:
    78e8:	b508      	push	{r3, lr}
    78ea:	f7ff fd4d 	bl	7388 <RAILINT_a06f36e75bf41143ad151f38401105ae>
    78ee:	f7fe fbed 	bl	60cc <CORE_EnterCritical>
    78f2:	4a07      	ldr	r2, [pc, #28]	; (7910 <RAILINT_dadf1c52f26190429dcacf7151424c68+0x28>)
    78f4:	f8d2 3e9c 	ldr.w	r3, [r2, #3740]	; 0xe9c
    78f8:	f023 0320 	bic.w	r3, r3, #32
    78fc:	f8c2 3e9c 	str.w	r3, [r2, #3740]	; 0xe9c
    7900:	f7fe fbe8 	bl	60d4 <CORE_ExitCritical>
    7904:	2202      	movs	r2, #2
    7906:	4b03      	ldr	r3, [pc, #12]	; (7914 <RAILINT_dadf1c52f26190429dcacf7151424c68+0x2c>)
    7908:	2000      	movs	r0, #0
    790a:	609a      	str	r2, [r3, #8]
    790c:	bd08      	pop	{r3, pc}
    790e:	bf00      	nop
    7910:	b0001000 	.word	0xb0001000
    7914:	a8021000 	.word	0xa8021000

00007918 <RAILINT_3339c86656af5bd3809fcaff6decfb50>:
    7918:	4b09      	ldr	r3, [pc, #36]	; (7940 <RAILINT_3339c86656af5bd3809fcaff6decfb50+0x28>)
    791a:	4608      	mov	r0, r1
    791c:	6a5a      	ldr	r2, [r3, #36]	; 0x24
    791e:	0291      	lsls	r1, r2, #10
    7920:	d40b      	bmi.n	793a <RAILINT_3339c86656af5bd3809fcaff6decfb50+0x22>
    7922:	f8d3 2100 	ldr.w	r2, [r3, #256]	; 0x100
    7926:	07d2      	lsls	r2, r2, #31
    7928:	d408      	bmi.n	793c <RAILINT_3339c86656af5bd3809fcaff6decfb50+0x24>
    792a:	f8d3 3080 	ldr.w	r3, [r3, #128]	; 0x80
    792e:	f413 6f70 	tst.w	r3, #3840	; 0xf00
    7932:	bf14      	ite	ne
    7934:	2001      	movne	r0, #1
    7936:	2000      	moveq	r0, #0
    7938:	4770      	bx	lr
    793a:	2001      	movs	r0, #1
    793c:	4770      	bx	lr
    793e:	bf00      	nop
    7940:	a8014000 	.word	0xa8014000

00007944 <RAILINT_bc72022350c558af8f7add9f354aa336>:
    7944:	b570      	push	{r4, r5, r6, lr}
    7946:	4615      	mov	r5, r2
    7948:	460c      	mov	r4, r1
    794a:	f001 030b 	and.w	r3, r1, #11
    794e:	ea23 0102 	bic.w	r1, r3, r2
    7952:	4a2c      	ldr	r2, [pc, #176]	; (7a04 <RAILINT_bc72022350c558af8f7add9f354aa336+0xc0>)
    7954:	402b      	ands	r3, r5
    7956:	64d1      	str	r1, [r2, #76]	; 0x4c
    7958:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
    795c:	64d3      	str	r3, [r2, #76]	; 0x4c
    795e:	0763      	lsls	r3, r4, #29
    7960:	4606      	mov	r6, r0
    7962:	d510      	bpl.n	7986 <RAILINT_bc72022350c558af8f7add9f354aa336+0x42>
    7964:	2101      	movs	r1, #1
    7966:	f7ff ffd7 	bl	7918 <RAILINT_3339c86656af5bd3809fcaff6decfb50>
    796a:	b160      	cbz	r0, 7986 <RAILINT_bc72022350c558af8f7add9f354aa336+0x42>
    796c:	f003 f90a 	bl	ab84 <RAILINT_b4349430825f42395f1799b2ff8bb1b4>
    7970:	f44f 7300 	mov.w	r3, #512	; 0x200
    7974:	f015 0f04 	tst.w	r5, #4
    7978:	bf14      	ite	ne
    797a:	4a23      	ldrne	r2, [pc, #140]	; (7a08 <RAILINT_bc72022350c558af8f7add9f354aa336+0xc4>)
    797c:	4a23      	ldreq	r2, [pc, #140]	; (7a0c <RAILINT_bc72022350c558af8f7add9f354aa336+0xc8>)
    797e:	6253      	str	r3, [r2, #36]	; 0x24
    7980:	2204      	movs	r2, #4
    7982:	4b23      	ldr	r3, [pc, #140]	; (7a10 <RAILINT_bc72022350c558af8f7add9f354aa336+0xcc>)
    7984:	671a      	str	r2, [r3, #112]	; 0x70
    7986:	06e0      	lsls	r0, r4, #27
    7988:	d506      	bpl.n	7998 <RAILINT_bc72022350c558af8f7add9f354aa336+0x54>
    798a:	f015 0f10 	tst.w	r5, #16
    798e:	bf14      	ite	ne
    7990:	2200      	movne	r2, #0
    7992:	221b      	moveq	r2, #27
    7994:	4b1f      	ldr	r3, [pc, #124]	; (7a14 <RAILINT_bc72022350c558af8f7add9f354aa336+0xd0>)
    7996:	655a      	str	r2, [r3, #84]	; 0x54
    7998:	0621      	lsls	r1, r4, #24
    799a:	d518      	bpl.n	79ce <RAILINT_bc72022350c558af8f7add9f354aa336+0x8a>
    799c:	062a      	lsls	r2, r5, #24
    799e:	d51f      	bpl.n	79e0 <RAILINT_bc72022350c558af8f7add9f354aa336+0x9c>
    79a0:	f44f 1200 	mov.w	r2, #2097152	; 0x200000
    79a4:	4b18      	ldr	r3, [pc, #96]	; (7a08 <RAILINT_bc72022350c558af8f7add9f354aa336+0xc4>)
    79a6:	621a      	str	r2, [r3, #32]
    79a8:	2201      	movs	r2, #1
    79aa:	f503 5380 	add.w	r3, r3, #4096	; 0x1000
    79ae:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
    79b2:	f7fe fb8b 	bl	60cc <CORE_EnterCritical>
    79b6:	210e      	movs	r1, #14
    79b8:	4605      	mov	r5, r0
    79ba:	2003      	movs	r0, #3
    79bc:	f002 f904 	bl	9bc8 <RAILINT_98702195dd5df205b66d73f7f1b701b5>
    79c0:	f240 2201 	movw	r2, #513	; 0x201
    79c4:	4b13      	ldr	r3, [pc, #76]	; (7a14 <RAILINT_bc72022350c558af8f7add9f354aa336+0xd0>)
    79c6:	4628      	mov	r0, r5
    79c8:	62da      	str	r2, [r3, #44]	; 0x2c
    79ca:	f7fe fb83 	bl	60d4 <CORE_ExitCritical>
    79ce:	f014 0f60 	tst.w	r4, #96	; 0x60
    79d2:	d003      	beq.n	79dc <RAILINT_bc72022350c558af8f7add9f354aa336+0x98>
    79d4:	4630      	mov	r0, r6
    79d6:	6fb1      	ldr	r1, [r6, #120]	; 0x78
    79d8:	f7ff fc88 	bl	72ec <RAILINT_3c9710db34f633d3b8fb008ca62c25bd>
    79dc:	2000      	movs	r0, #0
    79de:	bd70      	pop	{r4, r5, r6, pc}
    79e0:	4b0d      	ldr	r3, [pc, #52]	; (7a18 <RAILINT_bc72022350c558af8f7add9f354aa336+0xd4>)
    79e2:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    79e4:	025b      	lsls	r3, r3, #9
    79e6:	d4f2      	bmi.n	79ce <RAILINT_bc72022350c558af8f7add9f354aa336+0x8a>
    79e8:	f44f 1100 	mov.w	r1, #2097152	; 0x200000
    79ec:	f896 30b2 	ldrb.w	r3, [r6, #178]	; 0xb2
    79f0:	4a06      	ldr	r2, [pc, #24]	; (7a0c <RAILINT_bc72022350c558af8f7add9f354aa336+0xc8>)
    79f2:	6211      	str	r1, [r2, #32]
    79f4:	2b00      	cmp	r3, #0
    79f6:	d0ea      	beq.n	79ce <RAILINT_bc72022350c558af8f7add9f354aa336+0x8a>
    79f8:	2201      	movs	r2, #1
    79fa:	4b03      	ldr	r3, [pc, #12]	; (7a08 <RAILINT_bc72022350c558af8f7add9f354aa336+0xc4>)
    79fc:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
    7a00:	e7e5      	b.n	79ce <RAILINT_bc72022350c558af8f7add9f354aa336+0x8a>
    7a02:	bf00      	nop
    7a04:	a8006000 	.word	0xa8006000
    7a08:	a8015000 	.word	0xa8015000
    7a0c:	a8016000 	.word	0xa8016000
    7a10:	a8022000 	.word	0xa8022000
    7a14:	a8004000 	.word	0xa8004000
    7a18:	a8020000 	.word	0xa8020000

00007a1c <RAILINT_c1ee6010aaf86bbd071153c63f21d1bb>:
    7a1c:	b430      	push	{r4, r5}
    7a1e:	69c5      	ldr	r5, [r0, #28]
    7a20:	ea85 0302 	eor.w	r3, r5, r2
    7a24:	400b      	ands	r3, r1
    7a26:	406b      	eors	r3, r5
    7a28:	61c3      	str	r3, [r0, #28]
    7a2a:	bc30      	pop	{r4, r5}
    7a2c:	f7ff bf8a 	b.w	7944 <RAILINT_bc72022350c558af8f7add9f354aa336>

00007a30 <RAILINT_7513d8eab2e711e2387c527c09895f59>:
    7a30:	4b01      	ldr	r3, [pc, #4]	; (7a38 <RAILINT_7513d8eab2e711e2387c527c09895f59+0x8>)
    7a32:	6a18      	ldr	r0, [r3, #32]
    7a34:	f002 b8da 	b.w	9bec <RAILINT_1bc89bb9191442fba8e0eefadd7115db>
    7a38:	a8014000 	.word	0xa8014000

00007a3c <RAILINT_abc7196ead04976a18289a1791500047>:
    7a3c:	6f83      	ldr	r3, [r0, #120]	; 0x78
    7a3e:	b14b      	cbz	r3, 7a54 <RAILINT_abc7196ead04976a18289a1791500047+0x18>
    7a40:	681a      	ldr	r2, [r3, #0]
    7a42:	2a02      	cmp	r2, #2
    7a44:	d906      	bls.n	7a54 <RAILINT_abc7196ead04976a18289a1791500047+0x18>
    7a46:	f893 0025 	ldrb.w	r0, [r3, #37]	; 0x25
    7a4a:	b130      	cbz	r0, 7a5a <RAILINT_abc7196ead04976a18289a1791500047+0x1e>
    7a4c:	6a1b      	ldr	r3, [r3, #32]
    7a4e:	fbb3 f0f0 	udiv	r0, r3, r0
    7a52:	4770      	bx	lr
    7a54:	380c      	subs	r0, #12
    7a56:	f7ff b8cb 	b.w	6bf0 <RAILCb_CalcSymbolRate>
    7a5a:	4770      	bx	lr

00007a5c <RAILINT_fd62944279593a99af34baf33f1f64a3>:
    7a5c:	4b01      	ldr	r3, [pc, #4]	; (7a64 <RAILINT_fd62944279593a99af34baf33f1f64a3+0x8>)
    7a5e:	6a18      	ldr	r0, [r3, #32]
    7a60:	f002 b8ec 	b.w	9c3c <RAILINT_3d99cbb66750f16ad038aa09d2dbf23c>
    7a64:	a8014000 	.word	0xa8014000

00007a68 <RAILINT_32fca4e0317a75a73f64b707fd6986c3>:
    7a68:	6f82      	ldr	r2, [r0, #120]	; 0x78
    7a6a:	b172      	cbz	r2, 7a8a <RAILINT_32fca4e0317a75a73f64b707fd6986c3+0x22>
    7a6c:	6813      	ldr	r3, [r2, #0]
    7a6e:	2b02      	cmp	r3, #2
    7a70:	d90b      	bls.n	7a8a <RAILINT_32fca4e0317a75a73f64b707fd6986c3+0x22>
    7a72:	6a53      	ldr	r3, [r2, #36]	; 0x24
    7a74:	f413 4f7f 	tst.w	r3, #65280	; 0xff00
    7a78:	f3c3 2007 	ubfx	r0, r3, #8, #8
    7a7c:	d008      	beq.n	7a90 <RAILINT_32fca4e0317a75a73f64b707fd6986c3+0x28>
    7a7e:	6a12      	ldr	r2, [r2, #32]
    7a80:	b2db      	uxtb	r3, r3
    7a82:	4353      	muls	r3, r2
    7a84:	fbb3 f0f0 	udiv	r0, r3, r0
    7a88:	4770      	bx	lr
    7a8a:	380c      	subs	r0, #12
    7a8c:	f7ff b8b4 	b.w	6bf8 <RAILCb_CalcBitRate>
    7a90:	4770      	bx	lr
	...

00007a94 <RAILINT_83a3874c81bc5511d0e4d7f8af307385>:
    7a94:	7843      	ldrb	r3, [r0, #1]
    7a96:	1f5a      	subs	r2, r3, #5
    7a98:	2a01      	cmp	r2, #1
    7a9a:	d901      	bls.n	7aa0 <RAILINT_83a3874c81bc5511d0e4d7f8af307385+0xc>
    7a9c:	2b08      	cmp	r3, #8
    7a9e:	d105      	bne.n	7aac <RAILINT_83a3874c81bc5511d0e4d7f8af307385+0x18>
    7aa0:	7b4b      	ldrb	r3, [r1, #13]
    7aa2:	b12b      	cbz	r3, 7ab0 <RAILINT_83a3874c81bc5511d0e4d7f8af307385+0x1c>
    7aa4:	2b01      	cmp	r3, #1
    7aa6:	d005      	beq.n	7ab4 <RAILINT_83a3874c81bc5511d0e4d7f8af307385+0x20>
    7aa8:	2b02      	cmp	r3, #2
    7aaa:	d005      	beq.n	7ab8 <RAILINT_83a3874c81bc5511d0e4d7f8af307385+0x24>
    7aac:	f7ff bfdc 	b.w	7a68 <RAILINT_32fca4e0317a75a73f64b707fd6986c3>
    7ab0:	4802      	ldr	r0, [pc, #8]	; (7abc <RAILINT_83a3874c81bc5511d0e4d7f8af307385+0x28>)
    7ab2:	4770      	bx	lr
    7ab4:	4802      	ldr	r0, [pc, #8]	; (7ac0 <RAILINT_83a3874c81bc5511d0e4d7f8af307385+0x2c>)
    7ab6:	4770      	bx	lr
    7ab8:	4802      	ldr	r0, [pc, #8]	; (7ac4 <RAILINT_83a3874c81bc5511d0e4d7f8af307385+0x30>)
    7aba:	4770      	bx	lr
    7abc:	0007a120 	.word	0x0007a120
    7ac0:	0001e848 	.word	0x0001e848
    7ac4:	000f4240 	.word	0x000f4240

00007ac8 <RAILINT_c232eb9695d8ec51969199511f1ffdbc>:
    7ac8:	b570      	push	{r4, r5, r6, lr}
    7aca:	460e      	mov	r6, r1
    7acc:	f7fe fafe 	bl	60cc <CORE_EnterCritical>
    7ad0:	4605      	mov	r5, r0
    7ad2:	f7ff fc2d 	bl	7330 <RAILINT_d3f1a953c5ad458b47a16e4df761d2c8>
    7ad6:	4604      	mov	r4, r0
    7ad8:	b120      	cbz	r0, 7ae4 <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x1c>
    7ada:	4628      	mov	r0, r5
    7adc:	f7fe fafa 	bl	60d4 <CORE_ExitCritical>
    7ae0:	4620      	mov	r0, r4
    7ae2:	bd70      	pop	{r4, r5, r6, pc}
    7ae4:	f003 f84e 	bl	ab84 <RAILINT_b4349430825f42395f1799b2ff8bb1b4>
    7ae8:	4b10      	ldr	r3, [pc, #64]	; (7b2c <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x64>)
    7aea:	7832      	ldrb	r2, [r6, #0]
    7aec:	f8d3 3ecc 	ldr.w	r3, [r3, #3788]	; 0xecc
    7af0:	2a02      	cmp	r2, #2
    7af2:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    7af6:	d015      	beq.n	7b24 <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x5c>
    7af8:	2a04      	cmp	r2, #4
    7afa:	bf0c      	ite	eq
    7afc:	2202      	moveq	r2, #2
    7afe:	2200      	movne	r2, #0
    7b00:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
    7b04:	7872      	ldrb	r2, [r6, #1]
    7b06:	2a02      	cmp	r2, #2
    7b08:	d00e      	beq.n	7b28 <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x60>
    7b0a:	2a04      	cmp	r2, #4
    7b0c:	bf0c      	ite	eq
    7b0e:	2202      	moveq	r2, #2
    7b10:	2200      	movne	r2, #0
    7b12:	ea43 1382 	orr.w	r3, r3, r2, lsl #6
    7b16:	4a05      	ldr	r2, [pc, #20]	; (7b2c <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x64>)
    7b18:	f8c2 3ecc 	str.w	r3, [r2, #3788]	; 0xecc
    7b1c:	2204      	movs	r2, #4
    7b1e:	4b04      	ldr	r3, [pc, #16]	; (7b30 <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x68>)
    7b20:	671a      	str	r2, [r3, #112]	; 0x70
    7b22:	e7da      	b.n	7ada <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x12>
    7b24:	2201      	movs	r2, #1
    7b26:	e7eb      	b.n	7b00 <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x38>
    7b28:	2201      	movs	r2, #1
    7b2a:	e7f2      	b.n	7b12 <RAILINT_c232eb9695d8ec51969199511f1ffdbc+0x4a>
    7b2c:	b0001000 	.word	0xb0001000
    7b30:	a8022000 	.word	0xa8022000

00007b34 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215>:
    7b34:	b538      	push	{r3, r4, r5, lr}
    7b36:	460d      	mov	r5, r1
    7b38:	f7fe fac8 	bl	60cc <CORE_EnterCritical>
    7b3c:	4604      	mov	r4, r0
    7b3e:	4a1e      	ldr	r2, [pc, #120]	; (7bb8 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x84>)
    7b40:	f7ff fbbc 	bl	72bc <RAILINT_07411be539f067663dfa5aa99baea238>
    7b44:	2806      	cmp	r0, #6
    7b46:	d826      	bhi.n	7b96 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x62>
    7b48:	2804      	cmp	r0, #4
    7b4a:	d82b      	bhi.n	7ba4 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x70>
    7b4c:	2803      	cmp	r0, #3
    7b4e:	d029      	beq.n	7ba4 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x70>
    7b50:	f003 f818 	bl	ab84 <RAILINT_b4349430825f42395f1799b2ff8bb1b4>
    7b54:	4b19      	ldr	r3, [pc, #100]	; (7bbc <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x88>)
    7b56:	782a      	ldrb	r2, [r5, #0]
    7b58:	f8d3 3ecc 	ldr.w	r3, [r3, #3788]	; 0xecc
    7b5c:	2a02      	cmp	r2, #2
    7b5e:	f023 030f 	bic.w	r3, r3, #15
    7b62:	d024      	beq.n	7bae <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x7a>
    7b64:	2a04      	cmp	r2, #4
    7b66:	bf0c      	ite	eq
    7b68:	2202      	moveq	r2, #2
    7b6a:	2200      	movne	r2, #0
    7b6c:	4313      	orrs	r3, r2
    7b6e:	786a      	ldrb	r2, [r5, #1]
    7b70:	2a02      	cmp	r2, #2
    7b72:	d01e      	beq.n	7bb2 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x7e>
    7b74:	2a04      	cmp	r2, #4
    7b76:	bf0c      	ite	eq
    7b78:	2202      	moveq	r2, #2
    7b7a:	2200      	movne	r2, #0
    7b7c:	ea43 0382 	orr.w	r3, r3, r2, lsl #2
    7b80:	4a0e      	ldr	r2, [pc, #56]	; (7bbc <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x88>)
    7b82:	4620      	mov	r0, r4
    7b84:	f8c2 3ecc 	str.w	r3, [r2, #3788]	; 0xecc
    7b88:	2204      	movs	r2, #4
    7b8a:	4b0d      	ldr	r3, [pc, #52]	; (7bc0 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x8c>)
    7b8c:	671a      	str	r2, [r3, #112]	; 0x70
    7b8e:	f7fe faa1 	bl	60d4 <CORE_ExitCritical>
    7b92:	2000      	movs	r0, #0
    7b94:	e00a      	b.n	7bac <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x78>
    7b96:	2807      	cmp	r0, #7
    7b98:	d1da      	bne.n	7b50 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x1c>
    7b9a:	f8d2 3130 	ldr.w	r3, [r2, #304]	; 0x130
    7b9e:	2b00      	cmp	r3, #0
    7ba0:	d1ce      	bne.n	7b40 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0xc>
    7ba2:	e7d5      	b.n	7b50 <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x1c>
    7ba4:	4620      	mov	r0, r4
    7ba6:	f7fe fa95 	bl	60d4 <CORE_ExitCritical>
    7baa:	2002      	movs	r0, #2
    7bac:	bd38      	pop	{r3, r4, r5, pc}
    7bae:	2201      	movs	r2, #1
    7bb0:	e7dc      	b.n	7b6c <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x38>
    7bb2:	2201      	movs	r2, #1
    7bb4:	e7e2      	b.n	7b7c <RAILINT_7bc23e10f52e56d9fc3392da3f1c2215+0x48>
    7bb6:	bf00      	nop
    7bb8:	a8020000 	.word	0xa8020000
    7bbc:	b0001000 	.word	0xb0001000
    7bc0:	a8022000 	.word	0xa8022000

00007bc4 <RAILINT_cd62b828417e3475c6b58e9a311685cc>:
    7bc4:	b570      	push	{r4, r5, r6, lr}
    7bc6:	4605      	mov	r5, r0
    7bc8:	f890 00c0 	ldrb.w	r0, [r0, #192]	; 0xc0
    7bcc:	460c      	mov	r4, r1
    7bce:	2804      	cmp	r0, #4
    7bd0:	4616      	mov	r6, r2
    7bd2:	d018      	beq.n	7c06 <RAILINT_cd62b828417e3475c6b58e9a311685cc+0x42>
    7bd4:	29ff      	cmp	r1, #255	; 0xff
    7bd6:	d018      	beq.n	7c0a <RAILINT_cd62b828417e3475c6b58e9a311685cc+0x46>
    7bd8:	f001 f9d2 	bl	8f80 <RAILINT_1040bf941e847cb582a86b6ad519d354>
    7bdc:	42a0      	cmp	r0, r4
    7bde:	d804      	bhi.n	7bea <RAILINT_cd62b828417e3475c6b58e9a311685cc+0x26>
    7be0:	f895 00c0 	ldrb.w	r0, [r5, #192]	; 0xc0
    7be4:	f001 f9cc 	bl	8f80 <RAILINT_1040bf941e847cb582a86b6ad519d354>
    7be8:	4604      	mov	r4, r0
    7bea:	4620      	mov	r0, r4
    7bec:	71ac      	strb	r4, [r5, #6]
    7bee:	f001 fa6f 	bl	90d0 <RAILINT_08c8419aa71adfff4194c3a91186dc0b>
    7bf2:	f1a0 03ff 	sub.w	r3, r0, #255	; 0xff
    7bf6:	425c      	negs	r4, r3
    7bf8:	415c      	adcs	r4, r3
    7bfa:	b916      	cbnz	r6, 7c02 <RAILINT_cd62b828417e3475c6b58e9a311685cc+0x3e>
    7bfc:	4628      	mov	r0, r5
    7bfe:	f001 f9d3 	bl	8fa8 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5>
    7c02:	4620      	mov	r0, r4
    7c04:	bd70      	pop	{r4, r5, r6, pc}
    7c06:	2402      	movs	r4, #2
    7c08:	e7fb      	b.n	7c02 <RAILINT_cd62b828417e3475c6b58e9a311685cc+0x3e>
    7c0a:	2401      	movs	r4, #1
    7c0c:	e7f9      	b.n	7c02 <RAILINT_cd62b828417e3475c6b58e9a311685cc+0x3e>
	...

00007c10 <RAILINT_b693f7d424389daf06cac15e5c7b8047>:
    7c10:	b570      	push	{r4, r5, r6, lr}
    7c12:	6a43      	ldr	r3, [r0, #36]	; 0x24
    7c14:	b08a      	sub	sp, #40	; 0x28
    7c16:	2b01      	cmp	r3, #1
    7c18:	d103      	bne.n	7c22 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x12>
    7c1a:	2500      	movs	r5, #0
    7c1c:	4628      	mov	r0, r5
    7c1e:	b00a      	add	sp, #40	; 0x28
    7c20:	bd70      	pop	{r4, r5, r6, pc}
    7c22:	4604      	mov	r4, r0
    7c24:	4978      	ldr	r1, [pc, #480]	; (7e08 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1f8>)
    7c26:	f001 fddb 	bl	97e0 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee>
    7c2a:	6f66      	ldr	r6, [r4, #116]	; 0x74
    7c2c:	8925      	ldrh	r5, [r4, #8]
    7c2e:	67a0      	str	r0, [r4, #120]	; 0x78
    7c30:	b12e      	cbz	r6, 7c3e <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x2e>
    7c32:	6833      	ldr	r3, [r6, #0]
    7c34:	b11b      	cbz	r3, 7c3e <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x2e>
    7c36:	685b      	ldr	r3, [r3, #4]
    7c38:	2b00      	cmp	r3, #0
    7c3a:	f040 8097 	bne.w	7d6c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x15c>
    7c3e:	f7fe fa45 	bl	60cc <CORE_EnterCritical>
    7c42:	f7fe fa47 	bl	60d4 <CORE_ExitCritical>
    7c46:	2301      	movs	r3, #1
    7c48:	6fa0      	ldr	r0, [r4, #120]	; 0x78
    7c4a:	f88d 300a 	strb.w	r3, [sp, #10]
    7c4e:	89b3      	ldrh	r3, [r6, #12]
    7c50:	e9d6 2101 	ldrd	r2, r1, [r6, #4]
    7c54:	1aeb      	subs	r3, r5, r3
    7c56:	b29b      	uxth	r3, r3
    7c58:	fb01 2203 	mla	r2, r1, r3, r2
    7c5c:	496b      	ldr	r1, [pc, #428]	; (7e0c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1fc>)
    7c5e:	f8ad 3008 	strh.w	r3, [sp, #8]
    7c62:	680b      	ldr	r3, [r1, #0]
    7c64:	9201      	str	r2, [sp, #4]
    7c66:	4283      	cmp	r3, r0
    7c68:	d016      	beq.n	7c98 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x88>
    7c6a:	b148      	cbz	r0, 7c80 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x70>
    7c6c:	6803      	ldr	r3, [r0, #0]
    7c6e:	b13b      	cbz	r3, 7c80 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x70>
    7c70:	6903      	ldr	r3, [r0, #16]
    7c72:	b12b      	cbz	r3, 7c80 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x70>
    7c74:	e9d3 1200 	ldrd	r1, r2, [r3]
    7c78:	689b      	ldr	r3, [r3, #8]
    7c7a:	e9c4 1222 	strd	r1, r2, [r4, #136]	; 0x88
    7c7e:	e004      	b.n	7c8a <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x7a>
    7c80:	ed9f 7b5f 	vldr	d7, [pc, #380]	; 7e00 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1f0>
    7c84:	2300      	movs	r3, #0
    7c86:	ed84 7b22 	vstr	d7, [r4, #136]	; 0x88
    7c8a:	4601      	mov	r1, r0
    7c8c:	f8c4 3090 	str.w	r3, [r4, #144]	; 0x90
    7c90:	4620      	mov	r0, r4
    7c92:	f7ff fb2b 	bl	72ec <RAILINT_3c9710db34f633d3b8fb008ca62c25bd>
    7c96:	6fa0      	ldr	r0, [r4, #120]	; 0x78
    7c98:	2800      	cmp	r0, #0
    7c9a:	d042      	beq.n	7d22 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x112>
    7c9c:	6803      	ldr	r3, [r0, #0]
    7c9e:	2b03      	cmp	r3, #3
    7ca0:	d93f      	bls.n	7d22 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x112>
    7ca2:	4620      	mov	r0, r4
    7ca4:	f89d 200a 	ldrb.w	r2, [sp, #10]
    7ca8:	9901      	ldr	r1, [sp, #4]
    7caa:	ab05      	add	r3, sp, #20
    7cac:	f002 f884 	bl	9db8 <RAILINT_f26e766b4223f258d2a3acd050099dec>
    7cb0:	2800      	cmp	r0, #0
    7cb2:	d157      	bne.n	7d64 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x154>
    7cb4:	4a56      	ldr	r2, [pc, #344]	; (7e10 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x200>)
    7cb6:	4957      	ldr	r1, [pc, #348]	; (7e14 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x204>)
    7cb8:	f7ff fb00 	bl	72bc <RAILINT_07411be539f067663dfa5aa99baea238>
    7cbc:	1e43      	subs	r3, r0, #1
    7cbe:	b2db      	uxtb	r3, r3
    7cc0:	2b0b      	cmp	r3, #11
    7cc2:	d844      	bhi.n	7d4e <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x13e>
    7cc4:	5cd3      	ldrb	r3, [r2, r3]
    7cc6:	2b01      	cmp	r3, #1
    7cc8:	d1f6      	bne.n	7cb8 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xa8>
    7cca:	a905      	add	r1, sp, #20
    7ccc:	a801      	add	r0, sp, #4
    7cce:	f002 f9e5 	bl	a09c <RAILINT_40f50b01b0acf65296da94a1cd4ce85b>
    7cd2:	4605      	mov	r5, r0
    7cd4:	2800      	cmp	r0, #0
    7cd6:	d145      	bne.n	7d64 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x154>
    7cd8:	7823      	ldrb	r3, [r4, #0]
    7cda:	f360 0300 	bfi	r3, r0, #0, #1
    7cde:	7023      	strb	r3, [r4, #0]
    7ce0:	f000 fd8e 	bl	8800 <RAILINT_42ba343910883753b346a02b0f77ef3e>
    7ce4:	6f63      	ldr	r3, [r4, #116]	; 0x74
    7ce6:	695a      	ldr	r2, [r3, #20]
    7ce8:	1e43      	subs	r3, r0, #1
    7cea:	6816      	ldr	r6, [r2, #0]
    7cec:	b2db      	uxtb	r3, r3
    7cee:	2bfd      	cmp	r3, #253	; 0xfd
    7cf0:	9603      	str	r6, [sp, #12]
    7cf2:	d842      	bhi.n	7d7a <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x16a>
    7cf4:	6853      	ldr	r3, [r2, #4]
    7cf6:	2801      	cmp	r0, #1
    7cf8:	9304      	str	r3, [sp, #16]
    7cfa:	d161      	bne.n	7dc0 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1b0>
    7cfc:	4606      	mov	r6, r0
    7cfe:	1cd9      	adds	r1, r3, #3
    7d00:	d849      	bhi.n	7d96 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x186>
    7d02:	4602      	mov	r2, r0
    7d04:	a903      	add	r1, sp, #12
    7d06:	4620      	mov	r0, r4
    7d08:	f000 fcde 	bl	86c8 <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945>
    7d0c:	2e00      	cmp	r6, #0
    7d0e:	d185      	bne.n	7c1c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xc>
    7d10:	f8d4 30ec 	ldr.w	r3, [r4, #236]	; 0xec
    7d14:	059b      	lsls	r3, r3, #22
    7d16:	d459      	bmi.n	7dcc <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1bc>
    7d18:	7823      	ldrb	r3, [r4, #0]
    7d1a:	f043 0301 	orr.w	r3, r3, #1
    7d1e:	7023      	strb	r3, [r4, #0]
    7d20:	e77c      	b.n	7c1c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xc>
    7d22:	4a3b      	ldr	r2, [pc, #236]	; (7e10 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x200>)
    7d24:	493b      	ldr	r1, [pc, #236]	; (7e14 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x204>)
    7d26:	f7ff fac9 	bl	72bc <RAILINT_07411be539f067663dfa5aa99baea238>
    7d2a:	1e43      	subs	r3, r0, #1
    7d2c:	b2db      	uxtb	r3, r3
    7d2e:	2b0b      	cmp	r3, #11
    7d30:	d808      	bhi.n	7d44 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x134>
    7d32:	5cd3      	ldrb	r3, [r2, r3]
    7d34:	2b01      	cmp	r3, #1
    7d36:	d0b4      	beq.n	7ca2 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x92>
    7d38:	f7ff fac0 	bl	72bc <RAILINT_07411be539f067663dfa5aa99baea238>
    7d3c:	1e43      	subs	r3, r0, #1
    7d3e:	b2db      	uxtb	r3, r3
    7d40:	2b0b      	cmp	r3, #11
    7d42:	d9f6      	bls.n	7d32 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x122>
    7d44:	694b      	ldr	r3, [r1, #20]
    7d46:	f013 0f06 	tst.w	r3, #6
    7d4a:	d0aa      	beq.n	7ca2 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x92>
    7d4c:	e7eb      	b.n	7d26 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x116>
    7d4e:	694b      	ldr	r3, [r1, #20]
    7d50:	f013 0f06 	tst.w	r3, #6
    7d54:	d1b0      	bne.n	7cb8 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xa8>
    7d56:	a905      	add	r1, sp, #20
    7d58:	a801      	add	r0, sp, #4
    7d5a:	f002 f99f 	bl	a09c <RAILINT_40f50b01b0acf65296da94a1cd4ce85b>
    7d5e:	4605      	mov	r5, r0
    7d60:	2800      	cmp	r0, #0
    7d62:	d0b9      	beq.n	7cd8 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xc8>
    7d64:	2502      	movs	r5, #2
    7d66:	4628      	mov	r0, r5
    7d68:	b00a      	add	sp, #40	; 0x28
    7d6a:	bd70      	pop	{r4, r5, r6, pc}
    7d6c:	681a      	ldr	r2, [r3, #0]
    7d6e:	2a03      	cmp	r2, #3
    7d70:	f67f af65 	bls.w	7c3e <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x2e>
    7d74:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    7d76:	0e5b      	lsrs	r3, r3, #25
    7d78:	e767      	b.n	7c4a <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x3a>
    7d7a:	1cf3      	adds	r3, r6, #3
    7d7c:	d914      	bls.n	7da8 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x198>
    7d7e:	4b26      	ldr	r3, [pc, #152]	; (7e18 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x208>)
    7d80:	3601      	adds	r6, #1
    7d82:	681b      	ldr	r3, [r3, #0]
    7d84:	bf18      	it	ne
    7d86:	2601      	movne	r6, #1
    7d88:	1cd9      	adds	r1, r3, #3
    7d8a:	d917      	bls.n	7dbc <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1ac>
    7d8c:	28ff      	cmp	r0, #255	; 0xff
    7d8e:	6853      	ldr	r3, [r2, #4]
    7d90:	d031      	beq.n	7df6 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1e6>
    7d92:	9304      	str	r3, [sp, #16]
    7d94:	e7ba      	b.n	7d0c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xfc>
    7d96:	3301      	adds	r3, #1
    7d98:	4b1f      	ldr	r3, [pc, #124]	; (7e18 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x208>)
    7d9a:	bf08      	it	eq
    7d9c:	2600      	moveq	r6, #0
    7d9e:	685b      	ldr	r3, [r3, #4]
    7da0:	1cda      	adds	r2, r3, #3
    7da2:	d808      	bhi.n	7db6 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1a6>
    7da4:	9304      	str	r3, [sp, #16]
    7da6:	e7ac      	b.n	7d02 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xf2>
    7da8:	2601      	movs	r6, #1
    7daa:	6853      	ldr	r3, [r2, #4]
    7dac:	28ff      	cmp	r0, #255	; 0xff
    7dae:	9304      	str	r3, [sp, #16]
    7db0:	d0a5      	beq.n	7cfe <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xee>
    7db2:	2000      	movs	r0, #0
    7db4:	e7a5      	b.n	7d02 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xf2>
    7db6:	28ff      	cmp	r0, #255	; 0xff
    7db8:	d1a8      	bne.n	7d0c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xfc>
    7dba:	e7fa      	b.n	7db2 <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x1a2>
    7dbc:	9303      	str	r3, [sp, #12]
    7dbe:	e7f4      	b.n	7daa <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x19a>
    7dc0:	4602      	mov	r2, r0
    7dc2:	a903      	add	r1, sp, #12
    7dc4:	4620      	mov	r0, r4
    7dc6:	f000 fc7f 	bl	86c8 <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945>
    7dca:	e727      	b.n	7c1c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xc>
    7dcc:	f44f 3180 	mov.w	r1, #65536	; 0x10000
    7dd0:	4620      	mov	r0, r4
    7dd2:	f7ff f95d 	bl	7090 <RAILINT_45e98292b11a528e9c15f82e1aa2d629>
    7dd6:	f8d4 20e8 	ldr.w	r2, [r4, #232]	; 0xe8
    7dda:	f8d4 30ec 	ldr.w	r3, [r4, #236]	; 0xec
    7dde:	4002      	ands	r2, r0
    7de0:	400b      	ands	r3, r1
    7de2:	ea52 0103 	orrs.w	r1, r2, r3
    7de6:	f43f af19 	beq.w	7c1c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xc>
    7dea:	490c      	ldr	r1, [pc, #48]	; (7e1c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0x20c>)
    7dec:	f1a4 000c 	sub.w	r0, r4, #12
    7df0:	6809      	ldr	r1, [r1, #0]
    7df2:	4788      	blx	r1
    7df4:	e712      	b.n	7c1c <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xc>
    7df6:	2001      	movs	r0, #1
    7df8:	9304      	str	r3, [sp, #16]
    7dfa:	e780      	b.n	7cfe <RAILINT_b693f7d424389daf06cac15e5c7b8047+0xee>
    7dfc:	f3af 8000 	nop.w
	...
    7e08:	b0001ffc 	.word	0xb0001ffc
    7e0c:	20000cd4 	.word	0x20000cd4
    7e10:	0000bed8 	.word	0x0000bed8
    7e14:	a801c000 	.word	0xa801c000
    7e18:	20000200 	.word	0x20000200
    7e1c:	200001d8 	.word	0x200001d8

00007e20 <RAILINT_cb27dba168c71b340f37df80e4ee5b60>:
    7e20:	b510      	push	{r4, lr}
    7e22:	4604      	mov	r4, r0
    7e24:	b151      	cbz	r1, 7e3c <RAILINT_cb27dba168c71b340f37df80e4ee5b60+0x1c>
    7e26:	f44f 6100 	mov.w	r1, #2048	; 0x800
    7e2a:	f003 fbd9 	bl	b5e0 <RAILINT_10ac1cf98a783c6bdb18657a1d32c8ed>
    7e2e:	b110      	cbz	r0, 7e36 <RAILINT_cb27dba168c71b340f37df80e4ee5b60+0x16>
    7e30:	f894 30ba 	ldrb.w	r3, [r4, #186]	; 0xba
    7e34:	b963      	cbnz	r3, 7e50 <RAILINT_cb27dba168c71b340f37df80e4ee5b60+0x30>
    7e36:	f44f 7280 	mov.w	r2, #256	; 0x100
    7e3a:	e000      	b.n	7e3e <RAILINT_cb27dba168c71b340f37df80e4ee5b60+0x1e>
    7e3c:	460a      	mov	r2, r1
    7e3e:	f44f 7180 	mov.w	r1, #256	; 0x100
    7e42:	4620      	mov	r0, r4
    7e44:	f003 fbb8 	bl	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>
    7e48:	3800      	subs	r0, #0
    7e4a:	bf18      	it	ne
    7e4c:	2001      	movne	r0, #1
    7e4e:	bd10      	pop	{r4, pc}
    7e50:	2000      	movs	r0, #0
    7e52:	e7fc      	b.n	7e4e <RAILINT_cb27dba168c71b340f37df80e4ee5b60+0x2e>

00007e54 <RAILINT_f70b804705a044eb7f74093268741788>:
    7e54:	b510      	push	{r4, lr}
    7e56:	460c      	mov	r4, r1
    7e58:	b119      	cbz	r1, 7e62 <RAILINT_f70b804705a044eb7f74093268741788+0xe>
    7e5a:	f000 fb65 	bl	8528 <RAILINT_5cc919fc20dd52f2d4dcd0fd622a0329>
    7e5e:	b100      	cbz	r0, 7e62 <RAILINT_f70b804705a044eb7f74093268741788+0xe>
    7e60:	340b      	adds	r4, #11
    7e62:	4620      	mov	r0, r4
    7e64:	f001 fc50 	bl	9708 <RAILINT_91df45e96a2874f76867d6f26ae534a0>
    7e68:	4b02      	ldr	r3, [pc, #8]	; (7e74 <RAILINT_f70b804705a044eb7f74093268741788+0x20>)
    7e6a:	4240      	negs	r0, r0
    7e6c:	f8c3 0ebc 	str.w	r0, [r3, #3772]	; 0xebc
    7e70:	2000      	movs	r0, #0
    7e72:	bd10      	pop	{r4, pc}
    7e74:	b0001000 	.word	0xb0001000

00007e78 <RAILINT_2fd87bc1616c65bab5aaf8241d078d01>:
    7e78:	b537      	push	{r0, r1, r2, r4, r5, lr}
    7e7a:	460c      	mov	r4, r1
    7e7c:	9201      	str	r2, [sp, #4]
    7e7e:	f7fe f925 	bl	60cc <CORE_EnterCritical>
    7e82:	4605      	mov	r5, r0
    7e84:	f7ff fa1a 	bl	72bc <RAILINT_07411be539f067663dfa5aa99baea238>
    7e88:	1fc2      	subs	r2, r0, #7
    7e8a:	b2d2      	uxtb	r2, r2
    7e8c:	2a02      	cmp	r2, #2
    7e8e:	9901      	ldr	r1, [sp, #4]
    7e90:	d901      	bls.n	7e96 <RAILINT_2fd87bc1616c65bab5aaf8241d078d01+0x1e>
    7e92:	280c      	cmp	r0, #12
    7e94:	d103      	bne.n	7e9e <RAILINT_2fd87bc1616c65bab5aaf8241d078d01+0x26>
    7e96:	4b08      	ldr	r3, [pc, #32]	; (7eb8 <RAILINT_2fd87bc1616c65bab5aaf8241d078d01+0x40>)
    7e98:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    7e9a:	039b      	lsls	r3, r3, #14
    7e9c:	d40a      	bmi.n	7eb4 <RAILINT_2fd87bc1616c65bab5aaf8241d078d01+0x3c>
    7e9e:	4620      	mov	r0, r4
    7ea0:	2201      	movs	r2, #1
    7ea2:	f000 fda1 	bl	89e8 <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080>
    7ea6:	4604      	mov	r4, r0
    7ea8:	4628      	mov	r0, r5
    7eaa:	f7fe f913 	bl	60d4 <CORE_ExitCritical>
    7eae:	4620      	mov	r0, r4
    7eb0:	b003      	add	sp, #12
    7eb2:	bd30      	pop	{r4, r5, pc}
    7eb4:	2403      	movs	r4, #3
    7eb6:	e7f7      	b.n	7ea8 <RAILINT_2fd87bc1616c65bab5aaf8241d078d01+0x30>
    7eb8:	a8020000 	.word	0xa8020000

00007ebc <RAILINT_5cc15e08889684ec1ad3d74b53d1f5dc>:
    7ebc:	2900      	cmp	r1, #0
    7ebe:	bf14      	ite	ne
    7ec0:	f44f 7200 	movne.w	r2, #512	; 0x200
    7ec4:	2200      	moveq	r2, #0
    7ec6:	f44f 7100 	mov.w	r1, #512	; 0x200
    7eca:	f003 bb75 	b.w	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>

00007ece <RAILINT_bf9c5ad5b66e6c5ba2ba7ecd77ccb2e2>:
    7ece:	2900      	cmp	r1, #0
    7ed0:	bf14      	ite	ne
    7ed2:	f44f 6280 	movne.w	r2, #1024	; 0x400
    7ed6:	2200      	moveq	r2, #0
    7ed8:	f44f 6180 	mov.w	r1, #1024	; 0x400
    7edc:	f003 bb6c 	b.w	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>

00007ee0 <RAILINT_304d05fa5f7ea83bae289f8245ef896e>:
    7ee0:	788a      	ldrb	r2, [r1, #2]
    7ee2:	4603      	mov	r3, r0
    7ee4:	2a01      	cmp	r2, #1
    7ee6:	b410      	push	{r4}
    7ee8:	d815      	bhi.n	7f16 <RAILINT_304d05fa5f7ea83bae289f8245ef896e+0x36>
    7eea:	78c8      	ldrb	r0, [r1, #3]
    7eec:	2801      	cmp	r0, #1
    7eee:	d812      	bhi.n	7f16 <RAILINT_304d05fa5f7ea83bae289f8245ef896e+0x36>
    7ef0:	780a      	ldrb	r2, [r1, #0]
    7ef2:	2a01      	cmp	r2, #1
    7ef4:	d80f      	bhi.n	7f16 <RAILINT_304d05fa5f7ea83bae289f8245ef896e+0x36>
    7ef6:	784c      	ldrb	r4, [r1, #1]
    7ef8:	2c04      	cmp	r4, #4
    7efa:	d80c      	bhi.n	7f16 <RAILINT_304d05fa5f7ea83bae289f8245ef896e+0x36>
    7efc:	b10c      	cbz	r4, 7f02 <RAILINT_304d05fa5f7ea83bae289f8245ef896e+0x22>
    7efe:	2801      	cmp	r0, #1
    7f00:	d109      	bne.n	7f16 <RAILINT_304d05fa5f7ea83bae289f8245ef896e+0x36>
    7f02:	2a01      	cmp	r2, #1
    7f04:	d007      	beq.n	7f16 <RAILINT_304d05fa5f7ea83bae289f8245ef896e+0x36>
    7f06:	6808      	ldr	r0, [r1, #0]
    7f08:	f85d 4b04 	ldr.w	r4, [sp], #4
    7f0c:	f8c3 00d8 	str.w	r0, [r3, #216]	; 0xd8
    7f10:	4618      	mov	r0, r3
    7f12:	f7ff ba93 	b.w	743c <RAILINT_ff4a165288c69b8c0d7a13c9d06da43a>
    7f16:	2001      	movs	r0, #1
    7f18:	f85d 4b04 	ldr.w	r4, [sp], #4
    7f1c:	4770      	bx	lr
	...

00007f20 <RAILINT_052f8b2565813079f19c931bac48db51>:
    7f20:	b537      	push	{r0, r1, r2, r4, r5, lr}
    7f22:	f10d 0206 	add.w	r2, sp, #6
    7f26:	460d      	mov	r5, r1
    7f28:	f000 fef6 	bl	8d18 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30>
    7f2c:	4604      	mov	r4, r0
    7f2e:	b188      	cbz	r0, 7f54 <RAILINT_052f8b2565813079f19c931bac48db51+0x34>
    7f30:	b185      	cbz	r5, 7f54 <RAILINT_052f8b2565813079f19c931bac48db51+0x34>
    7f32:	782b      	ldrb	r3, [r5, #0]
    7f34:	f013 0ff7 	tst.w	r3, #247	; 0xf7
    7f38:	d00c      	beq.n	7f54 <RAILINT_052f8b2565813079f19c931bac48db51+0x34>
    7f3a:	f7fe f8c7 	bl	60cc <CORE_EnterCritical>
    7f3e:	4b07      	ldr	r3, [pc, #28]	; (7f5c <RAILINT_052f8b2565813079f19c931bac48db51+0x3c>)
    7f40:	f8bd 2006 	ldrh.w	r2, [sp, #6]
    7f44:	601c      	str	r4, [r3, #0]
    7f46:	4b06      	ldr	r3, [pc, #24]	; (7f60 <RAILINT_052f8b2565813079f19c931bac48db51+0x40>)
    7f48:	801a      	strh	r2, [r3, #0]
    7f4a:	886a      	ldrh	r2, [r5, #2]
    7f4c:	4b05      	ldr	r3, [pc, #20]	; (7f64 <RAILINT_052f8b2565813079f19c931bac48db51+0x44>)
    7f4e:	801a      	strh	r2, [r3, #0]
    7f50:	f7fe f8c0 	bl	60d4 <CORE_ExitCritical>
    7f54:	4620      	mov	r0, r4
    7f56:	b003      	add	sp, #12
    7f58:	bd30      	pop	{r4, r5, pc}
    7f5a:	bf00      	nop
    7f5c:	20000ccc 	.word	0x20000ccc
    7f60:	20000cd0 	.word	0x20000cd0
    7f64:	20000cca 	.word	0x20000cca

00007f68 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5>:
    7f68:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
    7f6c:	4606      	mov	r6, r0
    7f6e:	4615      	mov	r5, r2
    7f70:	4608      	mov	r0, r1
    7f72:	b919      	cbnz	r1, 7f7c <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x14>
    7f74:	2001      	movs	r0, #1
    7f76:	b003      	add	sp, #12
    7f78:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    7f7c:	2a00      	cmp	r2, #0
    7f7e:	d0f9      	beq.n	7f74 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xc>
    7f80:	2903      	cmp	r1, #3
    7f82:	d805      	bhi.n	7f90 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x28>
    7f84:	2200      	movs	r2, #0
    7f86:	4611      	mov	r1, r2
    7f88:	f000 fec6 	bl	8d18 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30>
    7f8c:	2800      	cmp	r0, #0
    7f8e:	d0f1      	beq.n	7f74 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xc>
    7f90:	7881      	ldrb	r1, [r0, #2]
    7f92:	8803      	ldrh	r3, [r0, #0]
    7f94:	7902      	ldrb	r2, [r0, #4]
    7f96:	f890 8005 	ldrb.w	r8, [r0, #5]
    7f9a:	88c4      	ldrh	r4, [r0, #6]
    7f9c:	f9b0 0000 	ldrsh.w	r0, [r0]
    7fa0:	f001 0707 	and.w	r7, r1, #7
    7fa4:	2800      	cmp	r0, #0
    7fa6:	f2c0 8085 	blt.w	80b4 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x14c>
    7faa:	f1a7 0c07 	sub.w	ip, r7, #7
    7fae:	f1dc 0000 	rsbs	r0, ip, #0
    7fb2:	eb40 000c 	adc.w	r0, r0, ip
    7fb6:	2f05      	cmp	r7, #5
    7fb8:	7228      	strb	r0, [r5, #8]
    7fba:	bf94      	ite	ls
    7fbc:	2000      	movls	r0, #0
    7fbe:	f3c1 1000 	ubfxhi	r0, r1, #4, #1
    7fc2:	7268      	strb	r0, [r5, #9]
    7fc4:	f3c1 1080 	ubfx	r0, r1, #6, #1
    7fc8:	7328      	strb	r0, [r5, #12]
    7fca:	f001 0088 	and.w	r0, r1, #136	; 0x88
    7fce:	2880      	cmp	r0, #128	; 0x80
    7fd0:	d03a      	beq.n	8048 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xe0>
    7fd2:	2888      	cmp	r0, #136	; 0x88
    7fd4:	d03a      	beq.n	804c <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xe4>
    7fd6:	2808      	cmp	r0, #8
    7fd8:	d13a      	bne.n	8050 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xe8>
    7fda:	2001      	movs	r0, #1
    7fdc:	f3c1 1140 	ubfx	r1, r1, #5, #1
    7fe0:	7368      	strb	r0, [r5, #13]
    7fe2:	73a9      	strb	r1, [r5, #14]
    7fe4:	b90a      	cbnz	r2, 7fea <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x82>
    7fe6:	f896 20ba 	ldrb.w	r2, [r6, #186]	; 0xba
    7fea:	3a01      	subs	r2, #1
    7fec:	b2d2      	uxtb	r2, r2
    7fee:	73ea      	strb	r2, [r5, #15]
    7ff0:	69f2      	ldr	r2, [r6, #28]
    7ff2:	06d2      	lsls	r2, r2, #27
    7ff4:	d458      	bmi.n	80a8 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x140>
    7ff6:	3f06      	subs	r7, #6
    7ff8:	2f01      	cmp	r7, #1
    7ffa:	d855      	bhi.n	80a8 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x140>
    7ffc:	4a2e      	ldr	r2, [pc, #184]	; (80b8 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x150>)
    7ffe:	3b06      	subs	r3, #6
    8000:	6d52      	ldr	r2, [r2, #84]	; 0x54
    8002:	b29b      	uxth	r3, r3
    8004:	2206      	movs	r2, #6
    8006:	4669      	mov	r1, sp
    8008:	482c      	ldr	r0, [pc, #176]	; (80bc <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x154>)
    800a:	f000 fce3 	bl	89d4 <RAILINT_cf127192a488f2899b98e74293e0d50f>
    800e:	f89d 7000 	ldrb.w	r7, [sp]
    8012:	04e3      	lsls	r3, r4, #19
    8014:	f1a7 0732 	sub.w	r7, r7, #50	; 0x32
    8018:	b27f      	sxtb	r7, r7
    801a:	d41b      	bmi.n	8054 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xec>
    801c:	f89d 0001 	ldrb.w	r0, [sp, #1]
    8020:	0044      	lsls	r4, r0, #1
    8022:	b2e0      	uxtb	r0, r4
    8024:	f8d6 3080 	ldr.w	r3, [r6, #128]	; 0x80
    8028:	b10b      	cbz	r3, 802e <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xc6>
    802a:	4639      	mov	r1, r7
    802c:	4798      	blx	r3
    802e:	72e8      	strb	r0, [r5, #11]
    8030:	7b6a      	ldrb	r2, [r5, #13]
    8032:	4630      	mov	r0, r6
    8034:	f8dd 1002 	ldr.w	r1, [sp, #2]
    8038:	72af      	strb	r7, [r5, #10]
    803a:	f002 fa29 	bl	a490 <RAILINT_80090d97c419b275ef1f41db6daa21d4>
    803e:	2306      	movs	r3, #6
    8040:	6028      	str	r0, [r5, #0]
    8042:	71ab      	strb	r3, [r5, #6]
    8044:	2000      	movs	r0, #0
    8046:	e796      	b.n	7f76 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xe>
    8048:	2002      	movs	r0, #2
    804a:	e7c7      	b.n	7fdc <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x74>
    804c:	2003      	movs	r0, #3
    804e:	e7c5      	b.n	7fdc <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x74>
    8050:	2000      	movs	r0, #0
    8052:	e7c3      	b.n	7fdc <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x74>
    8054:	6fb3      	ldr	r3, [r6, #120]	; 0x78
    8056:	f3c4 040b 	ubfx	r4, r4, #0, #12
    805a:	00e4      	lsls	r4, r4, #3
    805c:	b18b      	cbz	r3, 8082 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x11a>
    805e:	681a      	ldr	r2, [r3, #0]
    8060:	2a02      	cmp	r2, #2
    8062:	d90e      	bls.n	8082 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x11a>
    8064:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
    8068:	b10b      	cbz	r3, 806e <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x106>
    806a:	fbb4 f4f3 	udiv	r4, r4, r3
    806e:	45a0      	cmp	r8, r4
    8070:	d816      	bhi.n	80a0 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x138>
    8072:	b1bc      	cbz	r4, 80a4 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x13c>
    8074:	ebc8 2008 	rsb	r0, r8, r8, lsl #8
    8078:	fbb0 f0f4 	udiv	r0, r0, r4
    807c:	43c0      	mvns	r0, r0
    807e:	b2c0      	uxtb	r0, r0
    8080:	e7d0      	b.n	8024 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xbc>
    8082:	4630      	mov	r0, r6
    8084:	f7ff fcda 	bl	7a3c <RAILINT_abc7196ead04976a18289a1791500047>
    8088:	4629      	mov	r1, r5
    808a:	4681      	mov	r9, r0
    808c:	4630      	mov	r0, r6
    808e:	f7ff fd01 	bl	7a94 <RAILINT_83a3874c81bc5511d0e4d7f8af307385>
    8092:	2800      	cmp	r0, #0
    8094:	d0eb      	beq.n	806e <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x106>
    8096:	fb09 f404 	mul.w	r4, r9, r4
    809a:	fbb4 f4f0 	udiv	r4, r4, r0
    809e:	e7e6      	b.n	806e <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0x106>
    80a0:	2000      	movs	r0, #0
    80a2:	e7bf      	b.n	8024 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xbc>
    80a4:	4620      	mov	r0, r4
    80a6:	e7bd      	b.n	8024 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xbc>
    80a8:	2000      	movs	r0, #0
    80aa:	2380      	movs	r3, #128	; 0x80
    80ac:	6028      	str	r0, [r5, #0]
    80ae:	816b      	strh	r3, [r5, #10]
    80b0:	71a8      	strb	r0, [r5, #6]
    80b2:	e760      	b.n	7f76 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xe>
    80b4:	2002      	movs	r0, #2
    80b6:	e75e      	b.n	7f76 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5+0xe>
    80b8:	a8004000 	.word	0xa8004000
    80bc:	44004038 	.word	0x44004038

000080c0 <RAILINT_310967c2629da02413ba4e8adfa3e137>:
    80c0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    80c2:	4606      	mov	r6, r0
    80c4:	4614      	mov	r4, r2
    80c6:	7997      	ldrb	r7, [r2, #6]
    80c8:	f7ff ff4e 	bl	7f68 <RAILINT_e331ba91c2ae1705d8ddbb0caff1d0a5>
    80cc:	4605      	mov	r5, r0
    80ce:	b948      	cbnz	r0, 80e4 <RAILINT_310967c2629da02413ba4e8adfa3e137+0x24>
    80d0:	79a3      	ldrb	r3, [r4, #6]
    80d2:	b13b      	cbz	r3, 80e4 <RAILINT_310967c2629da02413ba4e8adfa3e137+0x24>
    80d4:	4621      	mov	r1, r4
    80d6:	4630      	mov	r0, r6
    80d8:	71a7      	strb	r7, [r4, #6]
    80da:	f7ff fcdb 	bl	7a94 <RAILINT_83a3874c81bc5511d0e4d7f8af307385>
    80de:	4621      	mov	r1, r4
    80e0:	f002 f9a4 	bl	a42c <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5>
    80e4:	4628      	mov	r0, r5
    80e6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

000080e8 <RAILINT_d9e915d6d22bf4edc2f73d7c60daed1e>:
    80e8:	f000 bd10 	b.w	8b0c <RAILINT_af1bec131c155099f8156b6fce969aff>

000080ec <RAILINT_f921a6fdde390c986016ab0c8bf49fae>:
    80ec:	4b04      	ldr	r3, [pc, #16]	; (8100 <RAILINT_f921a6fdde390c986016ab0c8bf49fae+0x14>)
    80ee:	681a      	ldr	r2, [r3, #0]
    80f0:	4282      	cmp	r2, r0
    80f2:	d001      	beq.n	80f8 <RAILINT_f921a6fdde390c986016ab0c8bf49fae+0xc>
    80f4:	2803      	cmp	r0, #3
    80f6:	d801      	bhi.n	80fc <RAILINT_f921a6fdde390c986016ab0c8bf49fae+0x10>
    80f8:	2200      	movs	r2, #0
    80fa:	601a      	str	r2, [r3, #0]
    80fc:	f002 bd8a 	b.w	ac14 <RAILINT_519bf7b367869678ccdc4f803cd8123f>
    8100:	20000ccc 	.word	0x20000ccc

00008104 <RAILINT_bfd5d2eb09d8a4a7871a5c604290c6e9>:
    8104:	fab3 f383 	clz	r3, r3
    8108:	2b19      	cmp	r3, #25
    810a:	4608      	mov	r0, r1
    810c:	b510      	push	{r4, lr}
    810e:	4611      	mov	r1, r2
    8110:	d012      	beq.n	8138 <RAILINT_bfd5d2eb09d8a4a7871a5c604290c6e9+0x34>
    8112:	f1c3 0319 	rsb	r3, r3, #25
    8116:	b2db      	uxtb	r3, r3
    8118:	2b06      	cmp	r3, #6
    811a:	bf28      	it	cs
    811c:	2306      	movcs	r3, #6
    811e:	461a      	mov	r2, r3
    8120:	1d94      	adds	r4, r2, #6
    8122:	b2e3      	uxtb	r3, r4
    8124:	2401      	movs	r4, #1
    8126:	409c      	lsls	r4, r3
    8128:	b2a4      	uxth	r4, r4
    812a:	42a1      	cmp	r1, r4
    812c:	bf28      	it	cs
    812e:	4621      	movcs	r1, r4
    8130:	f000 fbce 	bl	88d0 <RAILINT_86983bfebc3fcf81f3ab3444e4625a88>
    8134:	4620      	mov	r0, r4
    8136:	bd10      	pop	{r4, pc}
    8138:	2200      	movs	r2, #0
    813a:	e7f1      	b.n	8120 <RAILINT_bfd5d2eb09d8a4a7871a5c604290c6e9+0x1c>

0000813c <RAILINT_705827075d9b54aaab0fdf12a337d2ed>:
    813c:	8813      	ldrh	r3, [r2, #0]
    813e:	4608      	mov	r0, r1
    8140:	2b3f      	cmp	r3, #63	; 0x3f
    8142:	b510      	push	{r4, lr}
    8144:	d915      	bls.n	8172 <RAILINT_705827075d9b54aaab0fdf12a337d2ed+0x36>
    8146:	fab3 f383 	clz	r3, r3
    814a:	2b19      	cmp	r3, #25
    814c:	d00f      	beq.n	816e <RAILINT_705827075d9b54aaab0fdf12a337d2ed+0x32>
    814e:	f1c3 0319 	rsb	r3, r3, #25
    8152:	b2db      	uxtb	r3, r3
    8154:	2b06      	cmp	r3, #6
    8156:	bf28      	it	cs
    8158:	2306      	movcs	r3, #6
    815a:	4619      	mov	r1, r3
    815c:	1d8b      	adds	r3, r1, #6
    815e:	b2dc      	uxtb	r4, r3
    8160:	2301      	movs	r3, #1
    8162:	40a3      	lsls	r3, r4
    8164:	8013      	strh	r3, [r2, #0]
    8166:	f000 fbd1 	bl	890c <RAILINT_cdbd2ef4368f95ff8e91482f629bd134>
    816a:	2000      	movs	r0, #0
    816c:	bd10      	pop	{r4, pc}
    816e:	2100      	movs	r1, #0
    8170:	e7f4      	b.n	815c <RAILINT_705827075d9b54aaab0fdf12a337d2ed+0x20>
    8172:	2001      	movs	r0, #1
    8174:	e7fa      	b.n	816c <RAILINT_705827075d9b54aaab0fdf12a337d2ed+0x30>

00008176 <RAILINT_ed7cbf63d67a6dc102f980914a3e8a21>:
    8176:	b510      	push	{r4, lr}
    8178:	4614      	mov	r4, r2
    817a:	4608      	mov	r0, r1
    817c:	2101      	movs	r1, #1
    817e:	f001 fca7 	bl	9ad0 <RAILINT_cd65c06e3b1af867d6257be45870f13b>
    8182:	4620      	mov	r0, r4
    8184:	2101      	movs	r1, #1
    8186:	f001 fca3 	bl	9ad0 <RAILINT_cd65c06e3b1af867d6257be45870f13b>
    818a:	2000      	movs	r0, #0
    818c:	bd10      	pop	{r4, pc}
	...

00008190 <RAILINT_44f844fe44efb07ef80df95a956dc879>:
    8190:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8192:	4604      	mov	r4, r0
    8194:	460d      	mov	r5, r1
    8196:	b911      	cbnz	r1, 819e <RAILINT_44f844fe44efb07ef80df95a956dc879+0xe>
    8198:	7803      	ldrb	r3, [r0, #0]
    819a:	065a      	lsls	r2, r3, #25
    819c:	d43a      	bmi.n	8214 <RAILINT_44f844fe44efb07ef80df95a956dc879+0x84>
    819e:	f64f 73ff 	movw	r3, #65535	; 0xffff
    81a2:	89a1      	ldrh	r1, [r4, #12]
    81a4:	6fa6      	ldr	r6, [r4, #120]	; 0x78
    81a6:	4299      	cmp	r1, r3
    81a8:	d004      	beq.n	81b4 <RAILINT_44f844fe44efb07ef80df95a956dc879+0x24>
    81aa:	4b2a      	ldr	r3, [pc, #168]	; (8254 <RAILINT_44f844fe44efb07ef80df95a956dc879+0xc4>)
    81ac:	681b      	ldr	r3, [r3, #0]
    81ae:	b10b      	cbz	r3, 81b4 <RAILINT_44f844fe44efb07ef80df95a956dc879+0x24>
    81b0:	4620      	mov	r0, r4
    81b2:	4798      	blx	r3
    81b4:	4f28      	ldr	r7, [pc, #160]	; (8258 <RAILINT_44f844fe44efb07ef80df95a956dc879+0xc8>)
    81b6:	683b      	ldr	r3, [r7, #0]
    81b8:	42b3      	cmp	r3, r6
    81ba:	d044      	beq.n	8246 <RAILINT_44f844fe44efb07ef80df95a956dc879+0xb6>
    81bc:	4b27      	ldr	r3, [pc, #156]	; (825c <RAILINT_44f844fe44efb07ef80df95a956dc879+0xcc>)
    81be:	681b      	ldr	r3, [r3, #0]
    81c0:	b13b      	cbz	r3, 81d2 <RAILINT_44f844fe44efb07ef80df95a956dc879+0x42>
    81c2:	b11e      	cbz	r6, 81cc <RAILINT_44f844fe44efb07ef80df95a956dc879+0x3c>
    81c4:	6832      	ldr	r2, [r6, #0]
    81c6:	2a00      	cmp	r2, #0
    81c8:	d03f      	beq.n	824a <RAILINT_44f844fe44efb07ef80df95a956dc879+0xba>
    81ca:	68b6      	ldr	r6, [r6, #8]
    81cc:	4631      	mov	r1, r6
    81ce:	4620      	mov	r0, r4
    81d0:	4798      	blx	r3
    81d2:	6fa3      	ldr	r3, [r4, #120]	; 0x78
    81d4:	b393      	cbz	r3, 823c <RAILINT_44f844fe44efb07ef80df95a956dc879+0xac>
    81d6:	681a      	ldr	r2, [r3, #0]
    81d8:	2a02      	cmp	r2, #2
    81da:	d92f      	bls.n	823c <RAILINT_44f844fe44efb07ef80df95a956dc879+0xac>
    81dc:	6a5a      	ldr	r2, [r3, #36]	; 0x24
    81de:	f412 4f7f 	tst.w	r2, #65280	; 0xff00
    81e2:	f3c2 2007 	ubfx	r0, r2, #8, #8
    81e6:	d005      	beq.n	81f4 <RAILINT_44f844fe44efb07ef80df95a956dc879+0x64>
    81e8:	6a1b      	ldr	r3, [r3, #32]
    81ea:	b2d2      	uxtb	r2, r2
    81ec:	fb03 f202 	mul.w	r2, r3, r2
    81f0:	fbb2 f0f0 	udiv	r0, r2, r0
    81f4:	f001 ffb4 	bl	a160 <RAILINT_d0ad23c1600b008713957f4fe5ac160e>
    81f8:	2607      	movs	r6, #7
    81fa:	4620      	mov	r0, r4
    81fc:	f000 ffc4 	bl	9188 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134>
    8200:	b1b5      	cbz	r5, 8230 <RAILINT_44f844fe44efb07ef80df95a956dc879+0xa0>
    8202:	2006      	movs	r0, #6
    8204:	2201      	movs	r2, #1
    8206:	6fa3      	ldr	r3, [r4, #120]	; 0x78
    8208:	4915      	ldr	r1, [pc, #84]	; (8260 <RAILINT_44f844fe44efb07ef80df95a956dc879+0xd0>)
    820a:	603b      	str	r3, [r7, #0]
    820c:	4b15      	ldr	r3, [pc, #84]	; (8264 <RAILINT_44f844fe44efb07ef80df95a956dc879+0xd4>)
    820e:	6788      	str	r0, [r1, #120]	; 0x78
    8210:	701a      	strb	r2, [r3, #0]
    8212:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    8214:	f64f 71ff 	movw	r1, #65535	; 0xffff
    8218:	4f0f      	ldr	r7, [pc, #60]	; (8258 <RAILINT_44f844fe44efb07ef80df95a956dc879+0xc8>)
    821a:	6f86      	ldr	r6, [r0, #120]	; 0x78
    821c:	683a      	ldr	r2, [r7, #0]
    821e:	f365 1386 	bfi	r3, r5, #6, #1
    8222:	42b2      	cmp	r2, r6
    8224:	8181      	strh	r1, [r0, #12]
    8226:	7003      	strb	r3, [r0, #0]
    8228:	d1c8      	bne.n	81bc <RAILINT_44f844fe44efb07ef80df95a956dc879+0x2c>
    822a:	f000 ffad 	bl	9188 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134>
    822e:	2601      	movs	r6, #1
    8230:	4631      	mov	r1, r6
    8232:	f104 0088 	add.w	r0, r4, #136	; 0x88
    8236:	f002 f823 	bl	a280 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d>
    823a:	e7e2      	b.n	8202 <RAILINT_44f844fe44efb07ef80df95a956dc879+0x72>
    823c:	f1a4 000c 	sub.w	r0, r4, #12
    8240:	f7fe fcda 	bl	6bf8 <RAILCb_CalcBitRate>
    8244:	e7d6      	b.n	81f4 <RAILINT_44f844fe44efb07ef80df95a956dc879+0x64>
    8246:	2601      	movs	r6, #1
    8248:	e7d7      	b.n	81fa <RAILINT_44f844fe44efb07ef80df95a956dc879+0x6a>
    824a:	4616      	mov	r6, r2
    824c:	4620      	mov	r0, r4
    824e:	4631      	mov	r1, r6
    8250:	4798      	blx	r3
    8252:	e7be      	b.n	81d2 <RAILINT_44f844fe44efb07ef80df95a956dc879+0x42>
    8254:	20000cd8 	.word	0x20000cd8
    8258:	20000cd4 	.word	0x20000cd4
    825c:	20000cc4 	.word	0x20000cc4
    8260:	a8006000 	.word	0xa8006000
    8264:	20000cc8 	.word	0x20000cc8

00008268 <RAILINT_c95e9d4ad5fb39bdcaabe1c820867429>:
    8268:	b508      	push	{r3, lr}
    826a:	2248      	movs	r2, #72	; 0x48
    826c:	2100      	movs	r1, #0
    826e:	4803      	ldr	r0, [pc, #12]	; (827c <RAILINT_c95e9d4ad5fb39bdcaabe1c820867429+0x14>)
    8270:	f003 fc61 	bl	bb36 <memset>
    8274:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    8278:	f003 b9fc 	b.w	b674 <RAILINT_dc675e4729ddc8fc4759ebbb1d4c3bce>
    827c:	b0001ed0 	.word	0xb0001ed0

00008280 <RAILINT_f70cad743ef3526a2ef7ac090e6c385a>:
    8280:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
    8284:	460f      	mov	r7, r1
    8286:	4604      	mov	r4, r0
    8288:	2800      	cmp	r0, #0
    828a:	d04b      	beq.n	8324 <RAILINT_f70cad743ef3526a2ef7ac090e6c385a+0xa4>
    828c:	2304      	movs	r3, #4
    828e:	f880 30cc 	strb.w	r3, [r0, #204]	; 0xcc
    8292:	4b26      	ldr	r3, [pc, #152]	; (832c <RAILINT_f70cad743ef3526a2ef7ac090e6c385a+0xac>)
    8294:	f04f 38ff 	mov.w	r8, #4294967295	; 0xffffffff
    8298:	781b      	ldrb	r3, [r3, #0]
    829a:	f100 060c 	add.w	r6, r0, #12
    829e:	7383      	strb	r3, [r0, #14]
    82a0:	2364      	movs	r3, #100	; 0x64
    82a2:	f8c0 8150 	str.w	r8, [r0, #336]	; 0x150
    82a6:	e9c0 332b 	strd	r3, r3, [r0, #172]	; 0xac
    82aa:	e9c0 332d 	strd	r3, r3, [r0, #180]	; 0xb4
    82ae:	f8c0 30a8 	str.w	r3, [r0, #168]	; 0xa8
    82b2:	f8a0 30bc 	strh.w	r3, [r0, #188]	; 0xbc
    82b6:	f880 8011 	strb.w	r8, [r0, #17]
    82ba:	f8a0 8012 	strh.w	r8, [r0, #18]
    82be:	f8c0 8018 	str.w	r8, [r0, #24]
    82c2:	4630      	mov	r0, r6
    82c4:	f002 fbf6 	bl	aab4 <RAILINT_0390333908b9b36d5ab834e553f87374>
    82c8:	4630      	mov	r0, r6
    82ca:	f7ff ffcd 	bl	8268 <RAILINT_c95e9d4ad5fb39bdcaabe1c820867429>
    82ce:	f994 000e 	ldrsb.w	r0, [r4, #14]
    82d2:	f7ff f941 	bl	7558 <RAILINT_9a12d5b6e36b120af4f5fbee5b057a33>
    82d6:	2260      	movs	r2, #96	; 0x60
    82d8:	4b15      	ldr	r3, [pc, #84]	; (8330 <RAILINT_f70cad743ef3526a2ef7ac090e6c385a+0xb0>)
    82da:	f104 01e4 	add.w	r1, r4, #228	; 0xe4
    82de:	64da      	str	r2, [r3, #76]	; 0x4c
    82e0:	4630      	mov	r0, r6
    82e2:	f7ff fdfd 	bl	7ee0 <RAILINT_304d05fa5f7ea83bae289f8245ef896e>
    82e6:	4641      	mov	r1, r8
    82e8:	4605      	mov	r5, r0
    82ea:	6aa2      	ldr	r2, [r4, #40]	; 0x28
    82ec:	4630      	mov	r0, r6
    82ee:	f7ff fb95 	bl	7a1c <RAILINT_c1ee6010aaf86bbd071153c63f21d1bb>
    82f2:	230e      	movs	r3, #14
    82f4:	2200      	movs	r2, #0
    82f6:	e9cd 3300 	strd	r3, r3, [sp]
    82fa:	f240 2302 	movw	r3, #514	; 0x202
    82fe:	4610      	mov	r0, r2
    8300:	4619      	mov	r1, r3
    8302:	f002 f9eb 	bl	a6dc <RAILINT_e56520736dccfc6b4febe00b533ea27a>
    8306:	f000 fe07 	bl	8f18 <RAILINT_538e671f17d827f5e8fbb6213721d612>
    830a:	b93d      	cbnz	r5, 831c <RAILINT_f70cad743ef3526a2ef7ac090e6c385a+0x9c>
    830c:	4620      	mov	r0, r4
    830e:	f7fe fedb 	bl	70c8 <RAILCb_SetupRxFifo>
    8312:	4605      	mov	r5, r0
    8314:	b117      	cbz	r7, 831c <RAILINT_f70cad743ef3526a2ef7ac090e6c385a+0x9c>
    8316:	b908      	cbnz	r0, 831c <RAILINT_f70cad743ef3526a2ef7ac090e6c385a+0x9c>
    8318:	4620      	mov	r0, r4
    831a:	47b8      	blx	r7
    831c:	4628      	mov	r0, r5
    831e:	b002      	add	sp, #8
    8320:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    8324:	f880 00c0 	strb.w	r0, [r0, #192]	; 0xc0
    8328:	deff      	udf	#255	; 0xff
    832a:	bf00      	nop
    832c:	200001e2 	.word	0x200001e2
    8330:	a8004000 	.word	0xa8004000

00008334 <RAILINT_c141602218ed06e17bb09de10ef4b9a3>:
    8334:	b510      	push	{r4, lr}
    8336:	460c      	mov	r4, r1
    8338:	f7ff ff96 	bl	8268 <RAILINT_c95e9d4ad5fb39bdcaabe1c820867429>
    833c:	b1cc      	cbz	r4, 8372 <RAILINT_c141602218ed06e17bb09de10ef4b9a3+0x3e>
    833e:	78a3      	ldrb	r3, [r4, #2]
    8340:	2b08      	cmp	r3, #8
    8342:	d818      	bhi.n	8376 <RAILINT_c141602218ed06e17bb09de10ef4b9a3+0x42>
    8344:	78e2      	ldrb	r2, [r4, #3]
    8346:	2a08      	cmp	r2, #8
    8348:	d815      	bhi.n	8376 <RAILINT_c141602218ed06e17bb09de10ef4b9a3+0x42>
    834a:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
    834e:	f013 03ff 	ands.w	r3, r3, #255	; 0xff
    8352:	bf0c      	ite	eq
    8354:	4619      	moveq	r1, r3
    8356:	6861      	ldrne	r1, [r4, #4]
    8358:	4a08      	ldr	r2, [pc, #32]	; (837c <RAILINT_c141602218ed06e17bb09de10ef4b9a3+0x48>)
    835a:	f8c2 10d0 	str.w	r1, [r2, #208]	; 0xd0
    835e:	7821      	ldrb	r1, [r4, #0]
    8360:	f882 1114 	strb.w	r1, [r2, #276]	; 0x114
    8364:	7861      	ldrb	r1, [r4, #1]
    8366:	f882 3117 	strb.w	r3, [r2, #279]	; 0x117
    836a:	f882 1115 	strb.w	r1, [r2, #277]	; 0x115
    836e:	f003 f981 	bl	b674 <RAILINT_dc675e4729ddc8fc4759ebbb1d4c3bce>
    8372:	2000      	movs	r0, #0
    8374:	bd10      	pop	{r4, pc}
    8376:	2001      	movs	r0, #1
    8378:	e7fc      	b.n	8374 <RAILINT_c141602218ed06e17bb09de10ef4b9a3+0x40>
    837a:	bf00      	nop
    837c:	b0001e00 	.word	0xb0001e00

00008380 <RAILINT_e02d00033aeee031972ce3294c5c5c74>:
    8380:	2a01      	cmp	r2, #1
    8382:	b510      	push	{r4, lr}
    8384:	d813      	bhi.n	83ae <RAILINT_e02d00033aeee031972ce3294c5c5c74+0x2e>
    8386:	2b03      	cmp	r3, #3
    8388:	d811      	bhi.n	83ae <RAILINT_e02d00033aeee031972ce3294c5c5c74+0x2e>
    838a:	eb03 0382 	add.w	r3, r3, r2, lsl #2
    838e:	2201      	movs	r2, #1
    8390:	4c08      	ldr	r4, [pc, #32]	; (83b4 <RAILINT_e02d00033aeee031972ce3294c5c5c74+0x34>)
    8392:	fa02 f303 	lsl.w	r3, r2, r3
    8396:	f894 0116 	ldrb.w	r0, [r4, #278]	; 0x116
    839a:	b2db      	uxtb	r3, r3
    839c:	b121      	cbz	r1, 83a8 <RAILINT_e02d00033aeee031972ce3294c5c5c74+0x28>
    839e:	4303      	orrs	r3, r0
    83a0:	2000      	movs	r0, #0
    83a2:	f884 3116 	strb.w	r3, [r4, #278]	; 0x116
    83a6:	bd10      	pop	{r4, pc}
    83a8:	ea20 0303 	bic.w	r3, r0, r3
    83ac:	e7f8      	b.n	83a0 <RAILINT_e02d00033aeee031972ce3294c5c5c74+0x20>
    83ae:	2001      	movs	r0, #1
    83b0:	e7f9      	b.n	83a6 <RAILINT_e02d00033aeee031972ce3294c5c5c74+0x26>
    83b2:	bf00      	nop
    83b4:	b0001e00 	.word	0xb0001e00

000083b8 <RAILINT_232a85da35fb8aa0cd28c39542df9730>:
    83b8:	4603      	mov	r3, r0
    83ba:	b570      	push	{r4, r5, r6, lr}
    83bc:	680c      	ldr	r4, [r1, #0]
    83be:	f8b0 20c4 	ldrh.w	r2, [r0, #196]	; 0xc4
    83c2:	3401      	adds	r4, #1
    83c4:	bf08      	it	eq
    83c6:	f8d3 409c 	ldreq.w	r4, [r3, #156]	; 0x9c
    83ca:	688d      	ldr	r5, [r1, #8]
    83cc:	bf08      	it	eq
    83ce:	600c      	streq	r4, [r1, #0]
    83d0:	684c      	ldr	r4, [r1, #4]
    83d2:	325a      	adds	r2, #90	; 0x5a
    83d4:	3401      	adds	r4, #1
    83d6:	bf08      	it	eq
    83d8:	f8d3 40a8 	ldreq.w	r4, [r3, #168]	; 0xa8
    83dc:	b292      	uxth	r2, r2
    83de:	bf08      	it	eq
    83e0:	604c      	streq	r4, [r1, #4]
    83e2:	1c6c      	adds	r4, r5, #1
    83e4:	f100 0088 	add.w	r0, r0, #136	; 0x88
    83e8:	d133      	bne.n	8452 <RAILINT_232a85da35fb8aa0cd28c39542df9730+0x9a>
    83ea:	f8d3 50a4 	ldr.w	r5, [r3, #164]	; 0xa4
    83ee:	68cc      	ldr	r4, [r1, #12]
    83f0:	608d      	str	r5, [r1, #8]
    83f2:	1c66      	adds	r6, r4, #1
    83f4:	d131      	bne.n	845a <RAILINT_232a85da35fb8aa0cd28c39542df9730+0xa2>
    83f6:	f8d3 40a0 	ldr.w	r4, [r3, #160]	; 0xa0
    83fa:	690e      	ldr	r6, [r1, #16]
    83fc:	60cc      	str	r4, [r1, #12]
    83fe:	3601      	adds	r6, #1
    8400:	bf04      	itt	eq
    8402:	f8d3 6094 	ldreq.w	r6, [r3, #148]	; 0x94
    8406:	610e      	streq	r6, [r1, #16]
    8408:	694e      	ldr	r6, [r1, #20]
    840a:	3601      	adds	r6, #1
    840c:	bf04      	itt	eq
    840e:	f8d3 6098 	ldreq.w	r6, [r3, #152]	; 0x98
    8412:	614e      	streq	r6, [r1, #20]
    8414:	698e      	ldr	r6, [r1, #24]
    8416:	3601      	adds	r6, #1
    8418:	bf04      	itt	eq
    841a:	f8d3 60ac 	ldreq.w	r6, [r3, #172]	; 0xac
    841e:	618e      	streq	r6, [r1, #24]
    8420:	698e      	ldr	r6, [r1, #24]
    8422:	b1f6      	cbz	r6, 8462 <RAILINT_232a85da35fb8aa0cd28c39542df9730+0xaa>
    8424:	42b2      	cmp	r2, r6
    8426:	bf38      	it	cc
    8428:	4632      	movcc	r2, r6
    842a:	680e      	ldr	r6, [r1, #0]
    842c:	618a      	str	r2, [r1, #24]
    842e:	e9c3 6427 	strd	r6, r4, [r3, #156]	; 0x9c
    8432:	684c      	ldr	r4, [r1, #4]
    8434:	f8c3 50a4 	str.w	r5, [r3, #164]	; 0xa4
    8438:	e9c3 422a 	strd	r4, r2, [r3, #168]	; 0xa8
    843c:	690a      	ldr	r2, [r1, #16]
    843e:	f8c3 2094 	str.w	r2, [r3, #148]	; 0x94
    8442:	694a      	ldr	r2, [r1, #20]
    8444:	2107      	movs	r1, #7
    8446:	f8c3 2098 	str.w	r2, [r3, #152]	; 0x98
    844a:	f001 ff19 	bl	a280 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d>
    844e:	2000      	movs	r0, #0
    8450:	bd70      	pop	{r4, r5, r6, pc}
    8452:	4295      	cmp	r5, r2
    8454:	bf38      	it	cc
    8456:	4615      	movcc	r5, r2
    8458:	e7c9      	b.n	83ee <RAILINT_232a85da35fb8aa0cd28c39542df9730+0x36>
    845a:	4294      	cmp	r4, r2
    845c:	bf38      	it	cc
    845e:	4614      	movcc	r4, r2
    8460:	e7cb      	b.n	83fa <RAILINT_232a85da35fb8aa0cd28c39542df9730+0x42>
    8462:	2264      	movs	r2, #100	; 0x64
    8464:	e7e1      	b.n	842a <RAILINT_232a85da35fb8aa0cd28c39542df9730+0x72>
	...

00008468 <RAILINT_3209015e469febd3aebf12c10b838c78>:
    8468:	b538      	push	{r3, r4, r5, lr}
    846a:	f7fd fe2f 	bl	60cc <CORE_EnterCritical>
    846e:	f64f 71ff 	movw	r1, #65535	; 0xffff
    8472:	4a0a      	ldr	r2, [pc, #40]	; (849c <RAILINT_3209015e469febd3aebf12c10b838c78+0x34>)
    8474:	8813      	ldrh	r3, [r2, #0]
    8476:	428b      	cmp	r3, r1
    8478:	d103      	bne.n	8482 <RAILINT_3209015e469febd3aebf12c10b838c78+0x1a>
    847a:	f7fd fe2b 	bl	60d4 <CORE_ExitCritical>
    847e:	2003      	movs	r0, #3
    8480:	bd38      	pop	{r3, r4, r5, pc}
    8482:	4c07      	ldr	r4, [pc, #28]	; (84a0 <RAILINT_3209015e469febd3aebf12c10b838c78+0x38>)
    8484:	4d07      	ldr	r5, [pc, #28]	; (84a4 <RAILINT_3209015e469febd3aebf12c10b838c78+0x3c>)
    8486:	041b      	lsls	r3, r3, #16
    8488:	6665      	str	r5, [r4, #100]	; 0x64
    848a:	f5a4 5480 	sub.w	r4, r4, #4096	; 0x1000
    848e:	6663      	str	r3, [r4, #100]	; 0x64
    8490:	8011      	strh	r1, [r2, #0]
    8492:	f7fd fe1f 	bl	60d4 <CORE_ExitCritical>
    8496:	2000      	movs	r0, #0
    8498:	e7f2      	b.n	8480 <RAILINT_3209015e469febd3aebf12c10b838c78+0x18>
    849a:	bf00      	nop
    849c:	200001e0 	.word	0x200001e0
    84a0:	a8016000 	.word	0xa8016000
    84a4:	ffff0000 	.word	0xffff0000

000084a8 <RAILINT_3e587e95c937431090ed1e304e004f0f>:
    84a8:	b508      	push	{r3, lr}
    84aa:	4b08      	ldr	r3, [pc, #32]	; (84cc <RAILINT_3e587e95c937431090ed1e304e004f0f+0x24>)
    84ac:	f8d3 314c 	ldr.w	r3, [r3, #332]	; 0x14c
    84b0:	1c5a      	adds	r2, r3, #1
    84b2:	d00a      	beq.n	84ca <RAILINT_3e587e95c937431090ed1e304e004f0f+0x22>
    84b4:	005b      	lsls	r3, r3, #1
    84b6:	d408      	bmi.n	84ca <RAILINT_3e587e95c937431090ed1e304e004f0f+0x22>
    84b8:	2003      	movs	r0, #3
    84ba:	f7ff f9a9 	bl	7810 <RAILINT_99f0e717b1ae5f07aeace88464176fa9>
    84be:	f04f 6280 	mov.w	r2, #67108864	; 0x4000000
    84c2:	4b03      	ldr	r3, [pc, #12]	; (84d0 <RAILINT_3e587e95c937431090ed1e304e004f0f+0x28>)
    84c4:	67da      	str	r2, [r3, #124]	; 0x7c
    84c6:	2201      	movs	r2, #1
    84c8:	615a      	str	r2, [r3, #20]
    84ca:	bd08      	pop	{r3, pc}
    84cc:	0fe08000 	.word	0x0fe08000
    84d0:	a8021000 	.word	0xa8021000

000084d4 <RAILINT_67b648a3a6e52348d55fcd9139d9f7aa>:
    84d4:	f44f 2200 	mov.w	r2, #524288	; 0x80000
    84d8:	4b01      	ldr	r3, [pc, #4]	; (84e0 <RAILINT_67b648a3a6e52348d55fcd9139d9f7aa+0xc>)
    84da:	671a      	str	r2, [r3, #112]	; 0x70
    84dc:	4770      	bx	lr
    84de:	bf00      	nop
    84e0:	a8022000 	.word	0xa8022000

000084e4 <RAILINT_2224e76641c2cf7155997d9bff12d8b8>:
    84e4:	4b02      	ldr	r3, [pc, #8]	; (84f0 <RAILINT_2224e76641c2cf7155997d9bff12d8b8+0xc>)
    84e6:	6f18      	ldr	r0, [r3, #112]	; 0x70
    84e8:	f3c0 40c0 	ubfx	r0, r0, #19, #1
    84ec:	4770      	bx	lr
    84ee:	bf00      	nop
    84f0:	a8020000 	.word	0xa8020000

000084f4 <RAILINT_3bff6dfc0590d5c54bb0576abaeb38dd>:
    84f4:	4b01      	ldr	r3, [pc, #4]	; (84fc <RAILINT_3bff6dfc0590d5c54bb0576abaeb38dd+0x8>)
    84f6:	4a02      	ldr	r2, [pc, #8]	; (8500 <RAILINT_3bff6dfc0590d5c54bb0576abaeb38dd+0xc>)
    84f8:	601a      	str	r2, [r3, #0]
    84fa:	4770      	bx	lr
    84fc:	20000cc4 	.word	0x20000cc4
    8500:	000073c9 	.word	0x000073c9

00008504 <RAILINT_66d345e90816f39971179025c7079256>:
    8504:	b538      	push	{r3, r4, r5, lr}
    8506:	4615      	mov	r5, r2
    8508:	4604      	mov	r4, r0
    850a:	f7fe fd35 	bl	6f78 <RAILINT_f0f851116f368bc625e2a9fc0cccaa69>
    850e:	f005 01f7 	and.w	r1, r5, #247	; 0xf7
    8512:	4620      	mov	r0, r4
    8514:	f7ff f976 	bl	7804 <RAILINT_afeea334a0413e3fba4d9024b9c8696e>
    8518:	2200      	movs	r2, #0
    851a:	f44f 21c0 	mov.w	r1, #393216	; 0x60000
    851e:	4620      	mov	r0, r4
    8520:	f003 f84a 	bl	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>
    8524:	2000      	movs	r0, #0
    8526:	bd38      	pop	{r3, r4, r5, pc}

00008528 <RAILINT_5cc919fc20dd52f2d4dcd0fd622a0329>:
    8528:	2180      	movs	r1, #128	; 0x80
    852a:	f003 b859 	b.w	b5e0 <RAILINT_10ac1cf98a783c6bdb18657a1d32c8ed>
	...

00008530 <RAILINT_d25081615073202245609fde0f0d4fbe>:
    8530:	2200      	movs	r2, #0
    8532:	4901      	ldr	r1, [pc, #4]	; (8538 <RAILINT_d25081615073202245609fde0f0d4fbe+0x8>)
    8534:	f7ff bfe6 	b.w	8504 <RAILINT_66d345e90816f39971179025c7079256>
    8538:	0000db28 	.word	0x0000db28

0000853c <RAILINT_7f52347882ddbba7a077ea8579225490>:
    853c:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
    853e:	1c53      	adds	r3, r2, #1
    8540:	f88d 1014 	strb.w	r1, [sp, #20]
    8544:	aa05      	add	r2, sp, #20
    8546:	0a09      	lsrs	r1, r1, #8
    8548:	f88d 1015 	strb.w	r1, [sp, #21]
    854c:	9202      	str	r2, [sp, #8]
    854e:	2102      	movs	r1, #2
    8550:	2200      	movs	r2, #0
    8552:	b2db      	uxtb	r3, r3
    8554:	e9cd 2100 	strd	r2, r1, [sp]
    8558:	4611      	mov	r1, r2
    855a:	f003 f84d 	bl	b5f8 <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a>
    855e:	b007      	add	sp, #28
    8560:	f85d fb04 	ldr.w	pc, [sp], #4

00008564 <RAILINT_0bdeace83920f49d6521258171637f3c>:
    8564:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
    8566:	f88d 1014 	strb.w	r1, [sp, #20]
    856a:	ab05      	add	r3, sp, #20
    856c:	0a09      	lsrs	r1, r1, #8
    856e:	f88d 1015 	strb.w	r1, [sp, #21]
    8572:	9302      	str	r3, [sp, #8]
    8574:	2104      	movs	r1, #4
    8576:	2302      	movs	r3, #2
    8578:	3201      	adds	r2, #1
    857a:	e9cd 3100 	strd	r3, r1, [sp]
    857e:	b2d3      	uxtb	r3, r2
    8580:	2101      	movs	r1, #1
    8582:	2200      	movs	r2, #0
    8584:	f003 f838 	bl	b5f8 <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a>
    8588:	b007      	add	sp, #28
    858a:	f85d fb04 	ldr.w	pc, [sp], #4

0000858e <RAILINT_3ec854c4301ae6ed04c0338b9dec6a8d>:
    858e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
    8590:	2300      	movs	r3, #0
    8592:	9102      	str	r1, [sp, #8]
    8594:	2108      	movs	r1, #8
    8596:	3201      	adds	r2, #1
    8598:	e9cd 3100 	strd	r3, r1, [sp]
    859c:	b2d3      	uxtb	r3, r2
    859e:	2201      	movs	r2, #1
    85a0:	4611      	mov	r1, r2
    85a2:	f003 f829 	bl	b5f8 <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a>
    85a6:	b005      	add	sp, #20
    85a8:	f85d fb04 	ldr.w	pc, [sp], #4

000085ac <RAILINT_bd523e50f8dd0476bd448bb4ab0a0bba>:
    85ac:	b510      	push	{r4, lr}
    85ae:	22ff      	movs	r2, #255	; 0xff
    85b0:	f64f 71ff 	movw	r1, #65535	; 0xffff
    85b4:	4604      	mov	r4, r0
    85b6:	f7ff ffc1 	bl	853c <RAILINT_7f52347882ddbba7a077ea8579225490>
    85ba:	b968      	cbnz	r0, 85d8 <RAILINT_bd523e50f8dd0476bd448bb4ab0a0bba+0x2c>
    85bc:	22ff      	movs	r2, #255	; 0xff
    85be:	f64f 71ff 	movw	r1, #65535	; 0xffff
    85c2:	4620      	mov	r0, r4
    85c4:	f7ff ffce 	bl	8564 <RAILINT_0bdeace83920f49d6521258171637f3c>
    85c8:	b930      	cbnz	r0, 85d8 <RAILINT_bd523e50f8dd0476bd448bb4ab0a0bba+0x2c>
    85ca:	4620      	mov	r0, r4
    85cc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    85d0:	22ff      	movs	r2, #255	; 0xff
    85d2:	4902      	ldr	r1, [pc, #8]	; (85dc <RAILINT_bd523e50f8dd0476bd448bb4ab0a0bba+0x30>)
    85d4:	f7ff bfdb 	b.w	858e <RAILINT_3ec854c4301ae6ed04c0338b9dec6a8d>
    85d8:	bd10      	pop	{r4, pc}
    85da:	bf00      	nop
    85dc:	0000befc 	.word	0x0000befc

000085e0 <RAILINT_c37fe6dda1b65bd8e07f247eebfb0d24>:
    85e0:	b508      	push	{r3, lr}
    85e2:	040a      	lsls	r2, r1, #16
    85e4:	f44f 3180 	mov.w	r1, #65536	; 0x10000
    85e8:	f002 ffe6 	bl	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>
    85ec:	2000      	movs	r0, #0
    85ee:	bd08      	pop	{r3, pc}

000085f0 <RAILINT_05746359872f2c5331853a4d5044e337>:
    85f0:	0549      	lsls	r1, r1, #21
    85f2:	b508      	push	{r3, lr}
    85f4:	f031 63bc 	bics.w	r3, r1, #98566144	; 0x5e00000
    85f8:	f001 62bc 	and.w	r2, r1, #98566144	; 0x5e00000
    85fc:	d105      	bne.n	860a <RAILINT_05746359872f2c5331853a4d5044e337+0x1a>
    85fe:	f04f 61bc 	mov.w	r1, #98566144	; 0x5e00000
    8602:	f002 ffd9 	bl	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>
    8606:	2000      	movs	r0, #0
    8608:	bd08      	pop	{r3, pc}
    860a:	2001      	movs	r0, #1
    860c:	e7fc      	b.n	8608 <RAILINT_05746359872f2c5331853a4d5044e337+0x18>
	...

00008610 <RAILINT_98bbf79a9d5372aef3bfc63b8029e5b5>:
    8610:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    8614:	f8df 8068 	ldr.w	r8, [pc, #104]	; 8680 <RAILINT_98bbf79a9d5372aef3bfc63b8029e5b5+0x70>
    8618:	4605      	mov	r5, r0
    861a:	f8d8 0000 	ldr.w	r0, [r8]
    861e:	461c      	mov	r4, r3
    8620:	460e      	mov	r6, r1
    8622:	4617      	mov	r7, r2
    8624:	f001 fa1c 	bl	9a60 <RAILINT_171f424fc160b143d72e8b724c33f1c6>
    8628:	f8d8 300c 	ldr.w	r3, [r8, #12]
    862c:	b123      	cbz	r3, 8638 <RAILINT_98bbf79a9d5372aef3bfc63b8029e5b5+0x28>
    862e:	f8d8 3008 	ldr.w	r3, [r8, #8]
    8632:	6818      	ldr	r0, [r3, #0]
    8634:	f001 fa14 	bl	9a60 <RAILINT_171f424fc160b143d72e8b724c33f1c6>
    8638:	4b0f      	ldr	r3, [pc, #60]	; (8678 <RAILINT_98bbf79a9d5372aef3bfc63b8029e5b5+0x68>)
    863a:	68da      	ldr	r2, [r3, #12]
    863c:	b11a      	cbz	r2, 8646 <RAILINT_98bbf79a9d5372aef3bfc63b8029e5b5+0x36>
    863e:	689b      	ldr	r3, [r3, #8]
    8640:	6818      	ldr	r0, [r3, #0]
    8642:	f001 fa0d 	bl	9a60 <RAILINT_171f424fc160b143d72e8b724c33f1c6>
    8646:	f89d 1018 	ldrb.w	r1, [sp, #24]
    864a:	0763      	lsls	r3, r4, #29
    864c:	ea43 4407 	orr.w	r4, r3, r7, lsl #16
    8650:	0549      	lsls	r1, r1, #21
    8652:	ea44 62c6 	orr.w	r2, r4, r6, lsl #27
    8656:	f001 61bc 	and.w	r1, r1, #98566144	; 0x5e00000
    865a:	430a      	orrs	r2, r1
    865c:	4628      	mov	r0, r5
    865e:	4907      	ldr	r1, [pc, #28]	; (867c <RAILINT_98bbf79a9d5372aef3bfc63b8029e5b5+0x6c>)
    8660:	f442 72c8 	orr.w	r2, r2, #400	; 0x190
    8664:	f002 ffa8 	bl	b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>
    8668:	2200      	movs	r2, #0
    866a:	4628      	mov	r0, r5
    866c:	4611      	mov	r1, r2
    866e:	f7ff fc03 	bl	7e78 <RAILINT_2fd87bc1616c65bab5aaf8241d078d01>
    8672:	2000      	movs	r0, #0
    8674:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    8678:	0000db28 	.word	0x0000db28
    867c:	2de10790 	.word	0x2de10790
    8680:	0000d824 	.word	0x0000d824

00008684 <RAILINT_e27525372891c9e702a563a1b4973f45>:
    8684:	7840      	ldrb	r0, [r0, #1]
    8686:	3805      	subs	r0, #5
    8688:	2801      	cmp	r0, #1
    868a:	bf8c      	ite	hi
    868c:	2000      	movhi	r0, #0
    868e:	2001      	movls	r0, #1
    8690:	4770      	bx	lr
	...

00008694 <RAILINT_a779509c3ccfe3314b466cbc2527e4c8>:
    8694:	b121      	cbz	r1, 86a0 <RAILINT_a779509c3ccfe3314b466cbc2527e4c8+0xc>
    8696:	f242 0201 	movw	r2, #8193	; 0x2001
    869a:	4b0a      	ldr	r3, [pc, #40]	; (86c4 <RAILINT_a779509c3ccfe3314b466cbc2527e4c8+0x30>)
    869c:	f8c3 2228 	str.w	r2, [r3, #552]	; 0x228
    86a0:	1e43      	subs	r3, r0, #1
    86a2:	b2db      	uxtb	r3, r3
    86a4:	2bfd      	cmp	r3, #253	; 0xfd
    86a6:	d90a      	bls.n	86be <RAILINT_a779509c3ccfe3314b466cbc2527e4c8+0x2a>
    86a8:	680a      	ldr	r2, [r1, #0]
    86aa:	4b06      	ldr	r3, [pc, #24]	; (86c4 <RAILINT_a779509c3ccfe3314b466cbc2527e4c8+0x30>)
    86ac:	28ff      	cmp	r0, #255	; 0xff
    86ae:	f8c3 2250 	str.w	r2, [r3, #592]	; 0x250
    86b2:	d106      	bne.n	86c2 <RAILINT_a779509c3ccfe3314b466cbc2527e4c8+0x2e>
    86b4:	684a      	ldr	r2, [r1, #4]
    86b6:	4b03      	ldr	r3, [pc, #12]	; (86c4 <RAILINT_a779509c3ccfe3314b466cbc2527e4c8+0x30>)
    86b8:	f8c3 2254 	str.w	r2, [r3, #596]	; 0x254
    86bc:	4770      	bx	lr
    86be:	2801      	cmp	r0, #1
    86c0:	e7f7      	b.n	86b2 <RAILINT_a779509c3ccfe3314b466cbc2527e4c8+0x1e>
    86c2:	4770      	bx	lr
    86c4:	a8014000 	.word	0xa8014000

000086c8 <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945>:
    86c8:	b558      	push	{r3, r4, r6, lr}
    86ca:	4606      	mov	r6, r0
    86cc:	4610      	mov	r0, r2
    86ce:	460c      	mov	r4, r1
    86d0:	f7ff ffe0 	bl	8694 <RAILINT_a779509c3ccfe3314b466cbc2527e4c8>
    86d4:	b1ce      	cbz	r6, 870a <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945+0x42>
    86d6:	6f73      	ldr	r3, [r6, #116]	; 0x74
    86d8:	b1bb      	cbz	r3, 870a <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945+0x42>
    86da:	695b      	ldr	r3, [r3, #20]
    86dc:	b1ab      	cbz	r3, 870a <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945+0x42>
    86de:	1e42      	subs	r2, r0, #1
    86e0:	b2d2      	uxtb	r2, r2
    86e2:	2afd      	cmp	r2, #253	; 0xfd
    86e4:	d913      	bls.n	870e <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945+0x46>
    86e6:	680a      	ldr	r2, [r1, #0]
    86e8:	3201      	adds	r2, #1
    86ea:	bf04      	itt	eq
    86ec:	f06f 0201 	mvneq.w	r2, #1
    86f0:	600a      	streq	r2, [r1, #0]
    86f2:	680a      	ldr	r2, [r1, #0]
    86f4:	28ff      	cmp	r0, #255	; 0xff
    86f6:	601a      	str	r2, [r3, #0]
    86f8:	d107      	bne.n	870a <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945+0x42>
    86fa:	6862      	ldr	r2, [r4, #4]
    86fc:	3201      	adds	r2, #1
    86fe:	d102      	bne.n	8706 <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945+0x3e>
    8700:	f06f 0201 	mvn.w	r2, #1
    8704:	6062      	str	r2, [r4, #4]
    8706:	6862      	ldr	r2, [r4, #4]
    8708:	605a      	str	r2, [r3, #4]
    870a:	2000      	movs	r0, #0
    870c:	bd58      	pop	{r3, r4, r6, pc}
    870e:	2801      	cmp	r0, #1
    8710:	e7f2      	b.n	86f8 <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945+0x30>

00008712 <RAILINT_180789e54523ec093dde33f764dd8f42>:
    8712:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    8716:	b513      	push	{r0, r1, r4, lr}
    8718:	e9cd 3300 	strd	r3, r3, [sp]
    871c:	b149      	cbz	r1, 8732 <RAILINT_180789e54523ec093dde33f764dd8f42+0x20>
    871e:	18d4      	adds	r4, r2, r3
    8720:	b2e4      	uxtb	r4, r4
    8722:	2cfd      	cmp	r4, #253	; 0xfd
    8724:	d90a      	bls.n	873c <RAILINT_180789e54523ec093dde33f764dd8f42+0x2a>
    8726:	600b      	str	r3, [r1, #0]
    8728:	2aff      	cmp	r2, #255	; 0xff
    872a:	d102      	bne.n	8732 <RAILINT_180789e54523ec093dde33f764dd8f42+0x20>
    872c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    8730:	604b      	str	r3, [r1, #4]
    8732:	4669      	mov	r1, sp
    8734:	f7ff ffc8 	bl	86c8 <RAILINT_5e8e9467b0c1450a5e8b8c0a2125b945>
    8738:	b002      	add	sp, #8
    873a:	bd10      	pop	{r4, pc}
    873c:	2a01      	cmp	r2, #1
    873e:	e7f4      	b.n	872a <RAILINT_180789e54523ec093dde33f764dd8f42+0x18>

00008740 <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3>:
    8740:	b507      	push	{r0, r1, r2, lr}
    8742:	4b0c      	ldr	r3, [pc, #48]	; (8774 <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3+0x34>)
    8744:	2208      	movs	r2, #8
    8746:	7819      	ldrb	r1, [r3, #0]
    8748:	b989      	cbnz	r1, 876e <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3+0x2e>
    874a:	490b      	ldr	r1, [pc, #44]	; (8778 <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3+0x38>)
    874c:	f8c1 23fc 	str.w	r2, [r1, #1020]	; 0x3fc
    8750:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    8754:	e9cd 2200 	strd	r2, r2, [sp]
    8758:	4a08      	ldr	r2, [pc, #32]	; (877c <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3+0x3c>)
    875a:	6810      	ldr	r0, [r2, #0]
    875c:	b100      	cbz	r0, 8760 <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3+0x20>
    875e:	300c      	adds	r0, #12
    8760:	4669      	mov	r1, sp
    8762:	781a      	ldrb	r2, [r3, #0]
    8764:	f7ff ffd5 	bl	8712 <RAILINT_180789e54523ec093dde33f764dd8f42>
    8768:	b003      	add	sp, #12
    876a:	f85d fb04 	ldr.w	pc, [sp], #4
    876e:	4904      	ldr	r1, [pc, #16]	; (8780 <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3+0x40>)
    8770:	e7ec      	b.n	874c <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3+0xc>
    8772:	bf00      	nop
    8774:	200001e3 	.word	0x200001e3
    8778:	a8021000 	.word	0xa8021000
    877c:	20000aa8 	.word	0x20000aa8
    8780:	a8022000 	.word	0xa8022000

00008784 <RAILINT_d035493dc985426c706a16725f81a4c1>:
    8784:	b538      	push	{r3, r4, r5, lr}
    8786:	4604      	mov	r4, r0
    8788:	f001 f8a8 	bl	98dc <RAILINT_ff78d9bb4bfe772063473783474f9dc5>
    878c:	78e0      	ldrb	r0, [r4, #3]
    878e:	7921      	ldrb	r1, [r4, #4]
    8790:	4a17      	ldr	r2, [pc, #92]	; (87f0 <RAILINT_d035493dc985426c706a16725f81a4c1+0x6c>)
    8792:	ea40 4301 	orr.w	r3, r0, r1, lsl #16
    8796:	f8c2 34cc 	str.w	r3, [r2, #1228]	; 0x4cc
    879a:	79e5      	ldrb	r5, [r4, #7]
    879c:	79a3      	ldrb	r3, [r4, #6]
    879e:	ea43 4305 	orr.w	r3, r3, r5, lsl #16
    87a2:	f8c2 34d0 	str.w	r3, [r2, #1232]	; 0x4d0
    87a6:	7823      	ldrb	r3, [r4, #0]
    87a8:	b11b      	cbz	r3, 87b2 <RAILINT_d035493dc985426c706a16725f81a4c1+0x2e>
    87aa:	2300      	movs	r3, #0
    87ac:	2204      	movs	r2, #4
    87ae:	f7fd fc9d 	bl	60ec <GPIO_PinModeSet>
    87b2:	7863      	ldrb	r3, [r4, #1]
    87b4:	b12b      	cbz	r3, 87c2 <RAILINT_d035493dc985426c706a16725f81a4c1+0x3e>
    87b6:	2300      	movs	r3, #0
    87b8:	2204      	movs	r2, #4
    87ba:	79e1      	ldrb	r1, [r4, #7]
    87bc:	79a0      	ldrb	r0, [r4, #6]
    87be:	f7fd fc95 	bl	60ec <GPIO_PinModeSet>
    87c2:	7822      	ldrb	r2, [r4, #0]
    87c4:	2301      	movs	r3, #1
    87c6:	b17a      	cbz	r2, 87e8 <RAILINT_d035493dc985426c706a16725f81a4c1+0x64>
    87c8:	4a0a      	ldr	r2, [pc, #40]	; (87f4 <RAILINT_d035493dc985426c706a16725f81a4c1+0x70>)
    87ca:	f8c2 34c8 	str.w	r3, [r2, #1224]	; 0x4c8
    87ce:	7862      	ldrb	r2, [r4, #1]
    87d0:	2302      	movs	r3, #2
    87d2:	b15a      	cbz	r2, 87ec <RAILINT_d035493dc985426c706a16725f81a4c1+0x68>
    87d4:	4a07      	ldr	r2, [pc, #28]	; (87f4 <RAILINT_d035493dc985426c706a16725f81a4c1+0x70>)
    87d6:	f8c2 34c8 	str.w	r3, [r2, #1224]	; 0x4c8
    87da:	78a2      	ldrb	r2, [r4, #2]
    87dc:	4b06      	ldr	r3, [pc, #24]	; (87f8 <RAILINT_d035493dc985426c706a16725f81a4c1+0x74>)
    87de:	701a      	strb	r2, [r3, #0]
    87e0:	f7ff ffae 	bl	8740 <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3>
    87e4:	2000      	movs	r0, #0
    87e6:	bd38      	pop	{r3, r4, r5, pc}
    87e8:	4a04      	ldr	r2, [pc, #16]	; (87fc <RAILINT_d035493dc985426c706a16725f81a4c1+0x78>)
    87ea:	e7ee      	b.n	87ca <RAILINT_d035493dc985426c706a16725f81a4c1+0x46>
    87ec:	4a03      	ldr	r2, [pc, #12]	; (87fc <RAILINT_d035493dc985426c706a16725f81a4c1+0x78>)
    87ee:	e7f2      	b.n	87d6 <RAILINT_d035493dc985426c706a16725f81a4c1+0x52>
    87f0:	4003c000 	.word	0x4003c000
    87f4:	4003d000 	.word	0x4003d000
    87f8:	200001e3 	.word	0x200001e3
    87fc:	4003e000 	.word	0x4003e000

00008800 <RAILINT_42ba343910883753b346a02b0f77ef3e>:
    8800:	4b01      	ldr	r3, [pc, #4]	; (8808 <RAILINT_42ba343910883753b346a02b0f77ef3e+0x8>)
    8802:	7818      	ldrb	r0, [r3, #0]
    8804:	4770      	bx	lr
    8806:	bf00      	nop
    8808:	200001e3 	.word	0x200001e3

0000880c <RAILINT_33d661e401ffa5b40584048fe4dff1c2>:
    880c:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8810:	6806      	ldr	r6, [r0, #0]
    8812:	461c      	mov	r4, r3
    8814:	f89d 3030 	ldrb.w	r3, [sp, #48]	; 0x30
    8818:	f006 0607 	and.w	r6, r6, #7
    881c:	9301      	str	r3, [sp, #4]
    881e:	1db3      	adds	r3, r6, #6
    8820:	2601      	movs	r6, #1
    8822:	409e      	lsls	r6, r3
    8824:	4605      	mov	r5, r0
    8826:	4617      	mov	r7, r2
    8828:	460b      	mov	r3, r1
    882a:	f106 38ff 	add.w	r8, r6, #4294967295	; 0xffffffff
    882e:	b1a1      	cbz	r1, 885a <RAILINT_33d661e401ffa5b40584048fe4dff1c2+0x4e>
    8830:	6841      	ldr	r1, [r0, #4]
    8832:	ea04 0b08 	and.w	fp, r4, r8
    8836:	eba6 0a0b 	sub.w	sl, r6, fp
    883a:	f041 5900 	orr.w	r9, r1, #536870912	; 0x20000000
    883e:	4552      	cmp	r2, sl
    8840:	eb09 010b 	add.w	r1, r9, fp
    8844:	d918      	bls.n	8878 <RAILINT_33d661e401ffa5b40584048fe4dff1c2+0x6c>
    8846:	4652      	mov	r2, sl
    8848:	4618      	mov	r0, r3
    884a:	f003 f967 	bl	bb1c <memcpy>
    884e:	4649      	mov	r1, r9
    8850:	1bba      	subs	r2, r7, r6
    8852:	445a      	add	r2, fp
    8854:	4450      	add	r0, sl
    8856:	f003 f961 	bl	bb1c <memcpy>
    885a:	9b01      	ldr	r3, [sp, #4]
    885c:	b14b      	cbz	r3, 8872 <RAILINT_33d661e401ffa5b40584048fe4dff1c2+0x66>
    885e:	443c      	add	r4, r7
    8860:	ea48 0606 	orr.w	r6, r8, r6
    8864:	4034      	ands	r4, r6
    8866:	60ec      	str	r4, [r5, #12]
    8868:	68ab      	ldr	r3, [r5, #8]
    886a:	42a3      	cmp	r3, r4
    886c:	bf1c      	itt	ne
    886e:	2302      	movne	r3, #2
    8870:	62ab      	strne	r3, [r5, #40]	; 0x28
    8872:	b003      	add	sp, #12
    8874:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8878:	4618      	mov	r0, r3
    887a:	e7ec      	b.n	8856 <RAILINT_33d661e401ffa5b40584048fe4dff1c2+0x4a>

0000887c <RAILINT_893fd72dfcf6ebbe2598a01d375fa2c0>:
    887c:	4b12      	ldr	r3, [pc, #72]	; (88c8 <RAILINT_893fd72dfcf6ebbe2598a01d375fa2c0+0x4c>)
    887e:	f8d3 20e0 	ldr.w	r2, [r3, #224]	; 0xe0
    8882:	03d2      	lsls	r2, r2, #15
    8884:	d51e      	bpl.n	88c4 <RAILINT_893fd72dfcf6ebbe2598a01d375fa2c0+0x48>
    8886:	f44f 3280 	mov.w	r2, #65536	; 0x10000
    888a:	4910      	ldr	r1, [pc, #64]	; (88cc <RAILINT_893fd72dfcf6ebbe2598a01d375fa2c0+0x50>)
    888c:	f8c1 20e0 	str.w	r2, [r1, #224]	; 0xe0
    8890:	f5a1 5180 	sub.w	r1, r1, #4096	; 0x1000
    8894:	f8c1 20ec 	str.w	r2, [r1, #236]	; 0xec
    8898:	6c1a      	ldr	r2, [r3, #64]	; 0x40
    889a:	b2d1      	uxtb	r1, r2
    889c:	f3c2 2207 	ubfx	r2, r2, #8, #8
    88a0:	f8c3 1080 	str.w	r1, [r3, #128]	; 0x80
    88a4:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    88a8:	2204      	movs	r2, #4
    88aa:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    88ae:	2200      	movs	r2, #0
    88b0:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    88b4:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    88b8:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    88bc:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    88c0:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    88c4:	4770      	bx	lr
    88c6:	bf00      	nop
    88c8:	44004000 	.word	0x44004000
    88cc:	44006000 	.word	0x44006000

000088d0 <RAILINT_86983bfebc3fcf81f3ab3444e4625a88>:
    88d0:	b538      	push	{r3, r4, r5, lr}
    88d2:	4c0c      	ldr	r4, [pc, #48]	; (8904 <RAILINT_86983bfebc3fcf81f3ab3444e4625a88+0x34>)
    88d4:	460d      	mov	r5, r1
    88d6:	60a2      	str	r2, [r4, #8]
    88d8:	60e0      	str	r0, [r4, #12]
    88da:	f7fd fbf7 	bl	60cc <CORE_EnterCritical>
    88de:	2201      	movs	r2, #1
    88e0:	f8d4 30e0 	ldr.w	r3, [r4, #224]	; 0xe0
    88e4:	6322      	str	r2, [r4, #48]	; 0x30
    88e6:	075b      	lsls	r3, r3, #29
    88e8:	bf5c      	itt	pl
    88ea:	2204      	movpl	r2, #4
    88ec:	4b06      	ldrpl	r3, [pc, #24]	; (8908 <RAILINT_86983bfebc3fcf81f3ab3444e4625a88+0x38>)
    88ee:	6125      	str	r5, [r4, #16]
    88f0:	bf58      	it	pl
    88f2:	f8c3 20e0 	strpl.w	r2, [r3, #224]	; 0xe0
    88f6:	f7fd fbed 	bl	60d4 <CORE_ExitCritical>
    88fa:	b10d      	cbz	r5, 8900 <RAILINT_86983bfebc3fcf81f3ab3444e4625a88+0x30>
    88fc:	2302      	movs	r3, #2
    88fe:	6323      	str	r3, [r4, #48]	; 0x30
    8900:	bd38      	pop	{r3, r4, r5, pc}
    8902:	bf00      	nop
    8904:	44004000 	.word	0x44004000
    8908:	44006000 	.word	0x44006000

0000890c <RAILINT_cdbd2ef4368f95ff8e91482f629bd134>:
    890c:	f640 72ff 	movw	r2, #4095	; 0xfff
    8910:	4b03      	ldr	r3, [pc, #12]	; (8920 <RAILINT_cdbd2ef4368f95ff8e91482f629bd134+0x14>)
    8912:	6018      	str	r0, [r3, #0]
    8914:	4b03      	ldr	r3, [pc, #12]	; (8924 <RAILINT_cdbd2ef4368f95ff8e91482f629bd134+0x18>)
    8916:	6399      	str	r1, [r3, #56]	; 0x38
    8918:	63d8      	str	r0, [r3, #60]	; 0x3c
    891a:	65da      	str	r2, [r3, #92]	; 0x5c
    891c:	4770      	bx	lr
    891e:	bf00      	nop
    8920:	20000ce8 	.word	0x20000ce8
    8924:	44004000 	.word	0x44004000

00008928 <RAILINT_d098fb7ee08dc8d454a1df118de69bc4>:
    8928:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    892c:	2a04      	cmp	r2, #4
    892e:	4605      	mov	r5, r0
    8930:	b083      	sub	sp, #12
    8932:	d939      	bls.n	89a8 <RAILINT_d098fb7ee08dc8d454a1df118de69bc4+0x80>
    8934:	2601      	movs	r6, #1
    8936:	780b      	ldrb	r3, [r1, #0]
    8938:	1f14      	subs	r4, r2, #4
    893a:	6183      	str	r3, [r0, #24]
    893c:	784b      	ldrb	r3, [r1, #1]
    893e:	f101 0904 	add.w	r9, r1, #4
    8942:	6183      	str	r3, [r0, #24]
    8944:	788b      	ldrb	r3, [r1, #2]
    8946:	6183      	str	r3, [r0, #24]
    8948:	78cb      	ldrb	r3, [r1, #3]
    894a:	6183      	str	r3, [r0, #24]
    894c:	6803      	ldr	r3, [r0, #0]
    894e:	f8d0 b008 	ldr.w	fp, [r0, #8]
    8952:	f003 0307 	and.w	r3, r3, #7
    8956:	3306      	adds	r3, #6
    8958:	409e      	lsls	r6, r3
    895a:	f106 3aff 	add.w	sl, r6, #4294967295	; 0xffffffff
    895e:	ea0a 080b 	and.w	r8, sl, fp
    8962:	6847      	ldr	r7, [r0, #4]
    8964:	eba6 0208 	sub.w	r2, r6, r8
    8968:	4294      	cmp	r4, r2
    896a:	f047 5700 	orr.w	r7, r7, #536870912	; 0x20000000
    896e:	d80e      	bhi.n	898e <RAILINT_d098fb7ee08dc8d454a1df118de69bc4+0x66>
    8970:	4649      	mov	r1, r9
    8972:	4622      	mov	r2, r4
    8974:	eb07 0008 	add.w	r0, r7, r8
    8978:	f003 f8d0 	bl	bb1c <memcpy>
    897c:	ea46 060a 	orr.w	r6, r6, sl
    8980:	eb04 020b 	add.w	r2, r4, fp
    8984:	4032      	ands	r2, r6
    8986:	60aa      	str	r2, [r5, #8]
    8988:	b003      	add	sp, #12
    898a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    898e:	4649      	mov	r1, r9
    8990:	eb07 0008 	add.w	r0, r7, r8
    8994:	9201      	str	r2, [sp, #4]
    8996:	f003 f8c1 	bl	bb1c <memcpy>
    899a:	9a01      	ldr	r2, [sp, #4]
    899c:	4638      	mov	r0, r7
    899e:	eb09 0102 	add.w	r1, r9, r2
    89a2:	1ba2      	subs	r2, r4, r6
    89a4:	4442      	add	r2, r8
    89a6:	e7e7      	b.n	8978 <RAILINT_d098fb7ee08dc8d454a1df118de69bc4+0x50>
    89a8:	3a01      	subs	r2, #1
    89aa:	2a03      	cmp	r2, #3
    89ac:	d8ec      	bhi.n	8988 <RAILINT_d098fb7ee08dc8d454a1df118de69bc4+0x60>
    89ae:	e8df f002 	tbb	[pc, r2]
    89b2:	080b      	.short	0x080b
    89b4:	0205      	.short	0x0205
    89b6:	f811 3b01 	ldrb.w	r3, [r1], #1
    89ba:	6183      	str	r3, [r0, #24]
    89bc:	f811 3b01 	ldrb.w	r3, [r1], #1
    89c0:	61ab      	str	r3, [r5, #24]
    89c2:	f811 3b01 	ldrb.w	r3, [r1], #1
    89c6:	61ab      	str	r3, [r5, #24]
    89c8:	780b      	ldrb	r3, [r1, #0]
    89ca:	61ab      	str	r3, [r5, #24]
    89cc:	b003      	add	sp, #12
    89ce:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    89d2:	bf00      	nop

000089d4 <RAILINT_cf127192a488f2899b98e74293e0d50f>:
    89d4:	b537      	push	{r0, r1, r2, r4, r5, lr}
    89d6:	2500      	movs	r5, #0
    89d8:	4614      	mov	r4, r2
    89da:	9500      	str	r5, [sp, #0]
    89dc:	f7ff ff16 	bl	880c <RAILINT_33d661e401ffa5b40584048fe4dff1c2>
    89e0:	4620      	mov	r0, r4
    89e2:	b003      	add	sp, #12
    89e4:	bd30      	pop	{r4, r5, pc}
	...

000089e8 <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080>:
    89e8:	2940      	cmp	r1, #64	; 0x40
    89ea:	b538      	push	{r3, r4, r5, lr}
    89ec:	4614      	mov	r4, r2
    89ee:	f04f 0201 	mov.w	r2, #1
    89f2:	d80d      	bhi.n	8a10 <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080+0x28>
    89f4:	4d08      	ldr	r5, [pc, #32]	; (8a18 <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080+0x30>)
    89f6:	f8c5 20c0 	str.w	r2, [r5, #192]	; 0xc0
    89fa:	460a      	mov	r2, r1
    89fc:	4601      	mov	r1, r0
    89fe:	4807      	ldr	r0, [pc, #28]	; (8a1c <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080+0x34>)
    8a00:	f7ff ff92 	bl	8928 <RAILINT_d098fb7ee08dc8d454a1df118de69bc4>
    8a04:	b134      	cbz	r4, 8a14 <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080+0x2c>
    8a06:	2304      	movs	r3, #4
    8a08:	2000      	movs	r0, #0
    8a0a:	f8c5 30c0 	str.w	r3, [r5, #192]	; 0xc0
    8a0e:	bd38      	pop	{r3, r4, r5, pc}
    8a10:	4610      	mov	r0, r2
    8a12:	e7fc      	b.n	8a0e <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080+0x26>
    8a14:	4620      	mov	r0, r4
    8a16:	e7fa      	b.n	8a0e <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080+0x26>
    8a18:	44004000 	.word	0x44004000
    8a1c:	44004098 	.word	0x44004098

00008a20 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2>:
    8a20:	b510      	push	{r4, lr}
    8a22:	f7fd fb53 	bl	60cc <CORE_EnterCritical>
    8a26:	2201      	movs	r2, #1
    8a28:	4b1b      	ldr	r3, [pc, #108]	; (8a98 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x78>)
    8a2a:	491c      	ldr	r1, [pc, #112]	; (8a9c <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x7c>)
    8a2c:	661a      	str	r2, [r3, #96]	; 0x60
    8a2e:	f8c3 2090 	str.w	r2, [r3, #144]	; 0x90
    8a32:	669a      	str	r2, [r3, #104]	; 0x68
    8a34:	66d9      	str	r1, [r3, #108]	; 0x6c
    8a36:	2107      	movs	r1, #7
    8a38:	f8c3 108c 	str.w	r1, [r3, #140]	; 0x8c
    8a3c:	4b18      	ldr	r3, [pc, #96]	; (8aa0 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x80>)
    8a3e:	4c19      	ldr	r4, [pc, #100]	; (8aa4 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x84>)
    8a40:	8019      	strh	r1, [r3, #0]
    8a42:	2300      	movs	r3, #0
    8a44:	4918      	ldr	r1, [pc, #96]	; (8aa8 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x88>)
    8a46:	800b      	strh	r3, [r1, #0]
    8a48:	f44f 21a0 	mov.w	r1, #327680	; 0x50000
    8a4c:	f8c4 10e0 	str.w	r1, [r4, #224]	; 0xe0
    8a50:	f5a4 5480 	sub.w	r4, r4, #4096	; 0x1000
    8a54:	f8c4 10ec 	str.w	r1, [r4, #236]	; 0xec
    8a58:	4914      	ldr	r1, [pc, #80]	; (8aac <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x8c>)
    8a5a:	600b      	str	r3, [r1, #0]
    8a5c:	4b14      	ldr	r3, [pc, #80]	; (8ab0 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x90>)
    8a5e:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    8a60:	025c      	lsls	r4, r3, #9
    8a62:	d513      	bpl.n	8a8c <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x6c>
    8a64:	f44f 0480 	mov.w	r4, #4194304	; 0x400000
    8a68:	4b12      	ldr	r3, [pc, #72]	; (8ab4 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x94>)
    8a6a:	4913      	ldr	r1, [pc, #76]	; (8ab8 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x98>)
    8a6c:	681b      	ldr	r3, [r3, #0]
    8a6e:	670c      	str	r4, [r1, #112]	; 0x70
    8a70:	b183      	cbz	r3, 8a94 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x74>
    8a72:	6a99      	ldr	r1, [r3, #40]	; 0x28
    8a74:	0609      	lsls	r1, r1, #24
    8a76:	d409      	bmi.n	8a8c <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x6c>
    8a78:	f44f 1400 	mov.w	r4, #2097152	; 0x200000
    8a7c:	f893 30be 	ldrb.w	r3, [r3, #190]	; 0xbe
    8a80:	490e      	ldr	r1, [pc, #56]	; (8abc <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x9c>)
    8a82:	620c      	str	r4, [r1, #32]
    8a84:	b113      	cbz	r3, 8a8c <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0x6c>
    8a86:	4b0e      	ldr	r3, [pc, #56]	; (8ac0 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2+0xa0>)
    8a88:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
    8a8c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    8a90:	f7fd bb20 	b.w	60d4 <CORE_ExitCritical>
    8a94:	69db      	ldr	r3, [r3, #28]
    8a96:	deff      	udf	#255	; 0xff
    8a98:	44004000 	.word	0x44004000
    8a9c:	20000cf0 	.word	0x20000cf0
    8aa0:	20000d72 	.word	0x20000d72
    8aa4:	44006000 	.word	0x44006000
    8aa8:	20000d70 	.word	0x20000d70
    8aac:	20000d74 	.word	0x20000d74
    8ab0:	a8020000 	.word	0xa8020000
    8ab4:	20000aa8 	.word	0x20000aa8
    8ab8:	a8022000 	.word	0xa8022000
    8abc:	a8016000 	.word	0xa8016000
    8ac0:	a8015000 	.word	0xa8015000

00008ac4 <RAILINT_32732aa1d78833fa65026efd536f2c3e>:
    8ac4:	2207      	movs	r2, #7
    8ac6:	4b0d      	ldr	r3, [pc, #52]	; (8afc <RAILINT_32732aa1d78833fa65026efd536f2c3e+0x38>)
    8ac8:	21f0      	movs	r1, #240	; 0xf0
    8aca:	801a      	strh	r2, [r3, #0]
    8acc:	2200      	movs	r2, #0
    8ace:	4b0c      	ldr	r3, [pc, #48]	; (8b00 <RAILINT_32732aa1d78833fa65026efd536f2c3e+0x3c>)
    8ad0:	801a      	strh	r2, [r3, #0]
    8ad2:	4b0c      	ldr	r3, [pc, #48]	; (8b04 <RAILINT_32732aa1d78833fa65026efd536f2c3e+0x40>)
    8ad4:	f8c3 2098 	str.w	r2, [r3, #152]	; 0x98
    8ad8:	f44f 5200 	mov.w	r2, #8192	; 0x2000
    8adc:	f8c3 009c 	str.w	r0, [r3, #156]	; 0x9c
    8ae0:	f8c3 20bc 	str.w	r2, [r3, #188]	; 0xbc
    8ae4:	4a08      	ldr	r2, [pc, #32]	; (8b08 <RAILINT_32732aa1d78833fa65026efd536f2c3e+0x44>)
    8ae6:	6491      	str	r1, [r2, #72]	; 0x48
    8ae8:	21a0      	movs	r1, #160	; 0xa0
    8aea:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
    8aee:	6491      	str	r1, [r2, #72]	; 0x48
    8af0:	2201      	movs	r2, #1
    8af2:	f8c3 20c0 	str.w	r2, [r3, #192]	; 0xc0
    8af6:	f7ff bf93 	b.w	8a20 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2>
    8afa:	bf00      	nop
    8afc:	20000d72 	.word	0x20000d72
    8b00:	20000d70 	.word	0x20000d70
    8b04:	44004000 	.word	0x44004000
    8b08:	a8006000 	.word	0xa8006000

00008b0c <RAILINT_af1bec131c155099f8156b6fce969aff>:
    8b0c:	4b04      	ldr	r3, [pc, #16]	; (8b20 <RAILINT_af1bec131c155099f8156b6fce969aff+0x14>)
    8b0e:	6818      	ldr	r0, [r3, #0]
    8b10:	b120      	cbz	r0, 8b1c <RAILINT_af1bec131c155099f8156b6fce969aff+0x10>
    8b12:	f040 0201 	orr.w	r2, r0, #1
    8b16:	601a      	str	r2, [r3, #0]
    8b18:	f020 0001 	bic.w	r0, r0, #1
    8b1c:	4770      	bx	lr
    8b1e:	bf00      	nop
    8b20:	20000d74 	.word	0x20000d74

00008b24 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39>:
    8b24:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    8b28:	4604      	mov	r4, r0
    8b2a:	b1a0      	cbz	r0, 8b56 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x32>
    8b2c:	f7fd face 	bl	60cc <CORE_EnterCritical>
    8b30:	4e42      	ldr	r6, [pc, #264]	; (8c3c <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x118>)
    8b32:	4b43      	ldr	r3, [pc, #268]	; (8c40 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x11c>)
    8b34:	8831      	ldrh	r1, [r6, #0]
    8b36:	2c03      	cmp	r4, #3
    8b38:	f001 0278 	and.w	r2, r1, #120	; 0x78
    8b3c:	4605      	mov	r5, r0
    8b3e:	4f41      	ldr	r7, [pc, #260]	; (8c44 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x120>)
    8b40:	f001 0e7f 	and.w	lr, r1, #127	; 0x7f
    8b44:	441a      	add	r2, r3
    8b46:	d164      	bne.n	8c12 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0xee>
    8b48:	f8d7 c000 	ldr.w	ip, [r7]
    8b4c:	f1bc 0f00 	cmp.w	ip, #0
    8b50:	d103      	bne.n	8b5a <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x36>
    8b52:	f7fd fabf 	bl	60d4 <CORE_ExitCritical>
    8b56:	2003      	movs	r0, #3
    8b58:	e059      	b.n	8c0e <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0xea>
    8b5a:	f02c 0401 	bic.w	r4, ip, #1
    8b5e:	6838      	ldr	r0, [r7, #0]
    8b60:	f020 0001 	bic.w	r0, r0, #1
    8b64:	42a0      	cmp	r0, r4
    8b66:	d159      	bne.n	8c1c <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0xf8>
    8b68:	2300      	movs	r3, #0
    8b6a:	603b      	str	r3, [r7, #0]
    8b6c:	8823      	ldrh	r3, [r4, #0]
    8b6e:	4294      	cmp	r4, r2
    8b70:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    8b74:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    8b78:	8023      	strh	r3, [r4, #0]
    8b7a:	d144      	bne.n	8c06 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0xe2>
    8b7c:	4f32      	ldr	r7, [pc, #200]	; (8c48 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x124>)
    8b7e:	f8df c0e8 	ldr.w	ip, [pc, #232]	; 8c68 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x144>
    8b82:	883b      	ldrh	r3, [r7, #0]
    8b84:	f1ac 0880 	sub.w	r8, ip, #128	; 0x80
    8b88:	18cc      	adds	r4, r1, r3
    8b8a:	3b08      	subs	r3, #8
    8b8c:	b29b      	uxth	r3, r3
    8b8e:	f102 0108 	add.w	r1, r2, #8
    8b92:	4561      	cmp	r1, ip
    8b94:	bf28      	it	cs
    8b96:	4641      	movcs	r1, r8
    8b98:	1ae0      	subs	r0, r4, r3
    8b9a:	2b08      	cmp	r3, #8
    8b9c:	b280      	uxth	r0, r0
    8b9e:	d904      	bls.n	8baa <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x86>
    8ba0:	f9b1 e000 	ldrsh.w	lr, [r1]
    8ba4:	f1be 0f00 	cmp.w	lr, #0
    8ba8:	db43      	blt.n	8c32 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x10e>
    8baa:	7894      	ldrb	r4, [r2, #2]
    8bac:	8812      	ldrh	r2, [r2, #0]
    8bae:	4927      	ldr	r1, [pc, #156]	; (8c4c <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x128>)
    8bb0:	f3c2 020c 	ubfx	r2, r2, #0, #13
    8bb4:	803b      	strh	r3, [r7, #0]
    8bb6:	644a      	str	r2, [r1, #68]	; 0x44
    8bb8:	f44f 2280 	mov.w	r2, #262144	; 0x40000
    8bbc:	b2c0      	uxtb	r0, r0
    8bbe:	8030      	strh	r0, [r6, #0]
    8bc0:	6748      	str	r0, [r1, #116]	; 0x74
    8bc2:	f8c1 308c 	str.w	r3, [r1, #140]	; 0x8c
    8bc6:	4b22      	ldr	r3, [pc, #136]	; (8c50 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x12c>)
    8bc8:	f004 0407 	and.w	r4, r4, #7
    8bcc:	f8c3 20e0 	str.w	r2, [r3, #224]	; 0xe0
    8bd0:	f7ff fe54 	bl	887c <RAILINT_893fd72dfcf6ebbe2598a01d375fa2c0>
    8bd4:	2c04      	cmp	r4, #4
    8bd6:	d116      	bne.n	8c06 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0xe2>
    8bd8:	f44f 0180 	mov.w	r1, #4194304	; 0x400000
    8bdc:	4b1d      	ldr	r3, [pc, #116]	; (8c54 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x130>)
    8bde:	4a1e      	ldr	r2, [pc, #120]	; (8c58 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x134>)
    8be0:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    8be2:	4b1e      	ldr	r3, [pc, #120]	; (8c5c <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x138>)
    8be4:	681b      	ldr	r3, [r3, #0]
    8be6:	6711      	str	r1, [r2, #112]	; 0x70
    8be8:	b32b      	cbz	r3, 8c36 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x112>
    8bea:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    8bec:	0612      	lsls	r2, r2, #24
    8bee:	d40a      	bmi.n	8c06 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0xe2>
    8bf0:	f44f 1100 	mov.w	r1, #2097152	; 0x200000
    8bf4:	f893 30be 	ldrb.w	r3, [r3, #190]	; 0xbe
    8bf8:	4a19      	ldr	r2, [pc, #100]	; (8c60 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x13c>)
    8bfa:	6211      	str	r1, [r2, #32]
    8bfc:	b11b      	cbz	r3, 8c06 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0xe2>
    8bfe:	2201      	movs	r2, #1
    8c00:	4b18      	ldr	r3, [pc, #96]	; (8c64 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x140>)
    8c02:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
    8c06:	4628      	mov	r0, r5
    8c08:	f7fd fa64 	bl	60d4 <CORE_ExitCritical>
    8c0c:	2000      	movs	r0, #0
    8c0e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    8c12:	1e60      	subs	r0, r4, #1
    8c14:	2801      	cmp	r0, #1
    8c16:	bf98      	it	ls
    8c18:	4614      	movls	r4, r2
    8c1a:	e7a0      	b.n	8b5e <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x3a>
    8c1c:	480a      	ldr	r0, [pc, #40]	; (8c48 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x124>)
    8c1e:	4473      	add	r3, lr
    8c20:	8800      	ldrh	r0, [r0, #0]
    8c22:	1ae3      	subs	r3, r4, r3
    8c24:	bf48      	it	mi
    8c26:	3380      	addmi	r3, #128	; 0x80
    8c28:	3808      	subs	r0, #8
    8c2a:	4298      	cmp	r0, r3
    8c2c:	dc9e      	bgt.n	8b6c <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x48>
    8c2e:	4628      	mov	r0, r5
    8c30:	e78f      	b.n	8b52 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x2e>
    8c32:	460a      	mov	r2, r1
    8c34:	e7a9      	b.n	8b8a <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39+0x66>
    8c36:	69db      	ldr	r3, [r3, #28]
    8c38:	deff      	udf	#255	; 0xff
    8c3a:	bf00      	nop
    8c3c:	20000d70 	.word	0x20000d70
    8c40:	20000cf0 	.word	0x20000cf0
    8c44:	20000d74 	.word	0x20000d74
    8c48:	20000d72 	.word	0x20000d72
    8c4c:	44004000 	.word	0x44004000
    8c50:	44006000 	.word	0x44006000
    8c54:	a8020000 	.word	0xa8020000
    8c58:	a8022000 	.word	0xa8022000
    8c5c:	20000aa8 	.word	0x20000aa8
    8c60:	a8016000 	.word	0xa8016000
    8c64:	a8015000 	.word	0xa8015000
    8c68:	20000d70 	.word	0x20000d70

00008c6c <RAILINT_0906929bba6a17fd8a9605e65064a9f4>:
    8c6c:	4810      	ldr	r0, [pc, #64]	; (8cb0 <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x44>)
    8c6e:	4a11      	ldr	r2, [pc, #68]	; (8cb4 <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x48>)
    8c70:	8803      	ldrh	r3, [r0, #0]
    8c72:	8812      	ldrh	r2, [r2, #0]
    8c74:	4910      	ldr	r1, [pc, #64]	; (8cb8 <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x4c>)
    8c76:	441a      	add	r2, r3
    8c78:	3a07      	subs	r2, #7
    8c7a:	f002 0278 	and.w	r2, r2, #120	; 0x78
    8c7e:	440a      	add	r2, r1
    8c80:	3308      	adds	r3, #8
    8c82:	490e      	ldr	r1, [pc, #56]	; (8cbc <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x50>)
    8c84:	b29b      	uxth	r3, r3
    8c86:	8003      	strh	r3, [r0, #0]
    8c88:	f8c1 308c 	str.w	r3, [r1, #140]	; 0x8c
    8c8c:	f44f 2180 	mov.w	r1, #262144	; 0x40000
    8c90:	7890      	ldrb	r0, [r2, #2]
    8c92:	4b0b      	ldr	r3, [pc, #44]	; (8cc0 <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x54>)
    8c94:	f000 0007 	and.w	r0, r0, #7
    8c98:	2804      	cmp	r0, #4
    8c9a:	f8c3 10e0 	str.w	r1, [r3, #224]	; 0xe0
    8c9e:	d103      	bne.n	8ca8 <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x3c>
    8ca0:	4908      	ldr	r1, [pc, #32]	; (8cc4 <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x58>)
    8ca2:	68cb      	ldr	r3, [r1, #12]
    8ca4:	031b      	lsls	r3, r3, #12
    8ca6:	d4fc      	bmi.n	8ca2 <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x36>
    8ca8:	4b07      	ldr	r3, [pc, #28]	; (8cc8 <RAILINT_0906929bba6a17fd8a9605e65064a9f4+0x5c>)
    8caa:	601a      	str	r2, [r3, #0]
    8cac:	4770      	bx	lr
    8cae:	bf00      	nop
    8cb0:	20000d72 	.word	0x20000d72
    8cb4:	20000d70 	.word	0x20000d70
    8cb8:	20000cf0 	.word	0x20000cf0
    8cbc:	44004000 	.word	0x44004000
    8cc0:	44006000 	.word	0x44006000
    8cc4:	a8020000 	.word	0xa8020000
    8cc8:	20000d74 	.word	0x20000d74

00008ccc <RAILINT_31258cb71f8a6b9069347d576bc679f0>:
    8ccc:	b510      	push	{r4, lr}
    8cce:	4c05      	ldr	r4, [pc, #20]	; (8ce4 <RAILINT_31258cb71f8a6b9069347d576bc679f0+0x18>)
    8cd0:	6820      	ldr	r0, [r4, #0]
    8cd2:	b128      	cbz	r0, 8ce0 <RAILINT_31258cb71f8a6b9069347d576bc679f0+0x14>
    8cd4:	07c3      	lsls	r3, r0, #31
    8cd6:	d401      	bmi.n	8cdc <RAILINT_31258cb71f8a6b9069347d576bc679f0+0x10>
    8cd8:	f7ff ff24 	bl	8b24 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39>
    8cdc:	2300      	movs	r3, #0
    8cde:	6023      	str	r3, [r4, #0]
    8ce0:	bd10      	pop	{r4, pc}
    8ce2:	bf00      	nop
    8ce4:	20000d74 	.word	0x20000d74

00008ce8 <RAILINT_6e9511005f24d0489b4328a9cd887def>:
    8ce8:	f44f 3380 	mov.w	r3, #65536	; 0x10000
    8cec:	4a08      	ldr	r2, [pc, #32]	; (8d10 <RAILINT_6e9511005f24d0489b4328a9cd887def+0x28>)
    8cee:	f8c2 30ec 	str.w	r3, [r2, #236]	; 0xec
    8cf2:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
    8cf6:	f8c2 30e0 	str.w	r3, [r2, #224]	; 0xe0
    8cfa:	4b06      	ldr	r3, [pc, #24]	; (8d14 <RAILINT_6e9511005f24d0489b4328a9cd887def+0x2c>)
    8cfc:	f8d3 3088 	ldr.w	r3, [r3, #136]	; 0x88
    8d00:	f3c3 030c 	ubfx	r3, r3, #0, #13
    8d04:	2b78      	cmp	r3, #120	; 0x78
    8d06:	d801      	bhi.n	8d0c <RAILINT_6e9511005f24d0489b4328a9cd887def+0x24>
    8d08:	f7ff bdb8 	b.w	887c <RAILINT_893fd72dfcf6ebbe2598a01d375fa2c0>
    8d0c:	4770      	bx	lr
    8d0e:	bf00      	nop
    8d10:	44006000 	.word	0x44006000
    8d14:	44004000 	.word	0x44004000

00008d18 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30>:
    8d18:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    8d1c:	4605      	mov	r5, r0
    8d1e:	460e      	mov	r6, r1
    8d20:	4614      	mov	r4, r2
    8d22:	f7fd f9d3 	bl	60cc <CORE_EnterCritical>
    8d26:	4b56      	ldr	r3, [pc, #344]	; (8e80 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x168>)
    8d28:	4681      	mov	r9, r0
    8d2a:	8819      	ldrh	r1, [r3, #0]
    8d2c:	4f55      	ldr	r7, [pc, #340]	; (8e84 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x16c>)
    8d2e:	4856      	ldr	r0, [pc, #344]	; (8e88 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x170>)
    8d30:	f001 0278 	and.w	r2, r1, #120	; 0x78
    8d34:	2d03      	cmp	r5, #3
    8d36:	f8b0 c000 	ldrh.w	ip, [r0]
    8d3a:	f001 037f 	and.w	r3, r1, #127	; 0x7f
    8d3e:	443a      	add	r2, r7
    8d40:	d118      	bne.n	8d74 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x5c>
    8d42:	4852      	ldr	r0, [pc, #328]	; (8e8c <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x174>)
    8d44:	6805      	ldr	r5, [r0, #0]
    8d46:	b995      	cbnz	r5, 8d6e <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x56>
    8d48:	eb01 050c 	add.w	r5, r1, ip
    8d4c:	3d07      	subs	r5, #7
    8d4e:	f005 0578 	and.w	r5, r5, #120	; 0x78
    8d52:	443d      	add	r5, r7
    8d54:	443b      	add	r3, r7
    8d56:	1aeb      	subs	r3, r5, r3
    8d58:	bf48      	it	mi
    8d5a:	3380      	addmi	r3, #128	; 0x80
    8d5c:	4563      	cmp	r3, ip
    8d5e:	db11      	blt.n	8d84 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x6c>
    8d60:	4648      	mov	r0, r9
    8d62:	f7fd f9b7 	bl	60d4 <CORE_ExitCritical>
    8d66:	2500      	movs	r5, #0
    8d68:	4628      	mov	r0, r5
    8d6a:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    8d6e:	f025 0501 	bic.w	r5, r5, #1
    8d72:	e7ef      	b.n	8d54 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x3c>
    8d74:	2d01      	cmp	r5, #1
    8d76:	d003      	beq.n	8d80 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x68>
    8d78:	2d02      	cmp	r5, #2
    8d7a:	d1eb      	bne.n	8d54 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x3c>
    8d7c:	f1ac 0c08 	sub.w	ip, ip, #8
    8d80:	4615      	mov	r5, r2
    8d82:	e7e7      	b.n	8d54 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x3c>
    8d84:	b90e      	cbnz	r6, 8d8a <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x72>
    8d86:	2c00      	cmp	r4, #0
    8d88:	d04b      	beq.n	8e22 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x10a>
    8d8a:	4295      	cmp	r5, r2
    8d8c:	d14d      	bne.n	8e2a <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x112>
    8d8e:	4a40      	ldr	r2, [pc, #256]	; (8e90 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x178>)
    8d90:	6c57      	ldr	r7, [r2, #68]	; 0x44
    8d92:	b2bf      	uxth	r7, r7
    8d94:	b104      	cbz	r4, 8d98 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x80>
    8d96:	8027      	strh	r7, [r4, #0]
    8d98:	493d      	ldr	r1, [pc, #244]	; (8e90 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x178>)
    8d9a:	6b8a      	ldr	r2, [r1, #56]	; 0x38
    8d9c:	2e00      	cmp	r6, #0
    8d9e:	d040      	beq.n	8e22 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x10a>
    8da0:	f002 0a07 	and.w	sl, r2, #7
    8da4:	f10a 0206 	add.w	r2, sl, #6
    8da8:	f04f 0a01 	mov.w	sl, #1
    8dac:	fa0a fa02 	lsl.w	sl, sl, r2
    8db0:	f8d1 2088 	ldr.w	r2, [r1, #136]	; 0x88
    8db4:	fa1f f88a 	uxth.w	r8, sl
    8db8:	f3c2 020c 	ubfx	r2, r2, #0, #13
    8dbc:	429a      	cmp	r2, r3
    8dbe:	dd46      	ble.n	8e4e <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x136>
    8dc0:	f9b5 3000 	ldrsh.w	r3, [r5]
    8dc4:	882c      	ldrh	r4, [r5, #0]
    8dc6:	2b00      	cmp	r3, #0
    8dc8:	dbca      	blt.n	8d60 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x48>
    8dca:	78ab      	ldrb	r3, [r5, #2]
    8dcc:	f3c4 040c 	ubfx	r4, r4, #0, #13
    8dd0:	f108 32ff 	add.w	r2, r8, #4294967295	; 0xffffffff
    8dd4:	f003 0307 	and.w	r3, r3, #7
    8dd8:	1be4      	subs	r4, r4, r7
    8dda:	ea48 0202 	orr.w	r2, r8, r2
    8dde:	4014      	ands	r4, r2
    8de0:	2b05      	cmp	r3, #5
    8de2:	7033      	strb	r3, [r6, #0]
    8de4:	b2a4      	uxth	r4, r4
    8de6:	d82a      	bhi.n	8e3e <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x126>
    8de8:	b224      	sxth	r4, r4
    8dea:	43e0      	mvns	r0, r4
    8dec:	f44f 7277 	mov.w	r2, #988	; 0x3dc
    8df0:	2104      	movs	r1, #4
    8df2:	0fc0      	lsrs	r0, r0, #31
    8df4:	f7fe f9a0 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    8df8:	8074      	strh	r4, [r6, #2]
    8dfa:	78eb      	ldrb	r3, [r5, #3]
    8dfc:	7433      	strb	r3, [r6, #16]
    8dfe:	f108 33ff 	add.w	r3, r8, #4294967295	; 0xffffffff
    8e02:	401f      	ands	r7, r3
    8e04:	4b23      	ldr	r3, [pc, #140]	; (8e94 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x17c>)
    8e06:	681b      	ldr	r3, [r3, #0]
    8e08:	19da      	adds	r2, r3, r7
    8e0a:	60b2      	str	r2, [r6, #8]
    8e0c:	b2a2      	uxth	r2, r4
    8e0e:	fa17 f484 	uxtah	r4, r7, r4
    8e12:	4554      	cmp	r4, sl
    8e14:	bfd3      	iteet	le
    8e16:	2300      	movle	r3, #0
    8e18:	eba8 0707 	subgt.w	r7, r8, r7
    8e1c:	80b7      	strhgt	r7, [r6, #4]
    8e1e:	80b2      	strhle	r2, [r6, #4]
    8e20:	60f3      	str	r3, [r6, #12]
    8e22:	4648      	mov	r0, r9
    8e24:	f7fd f956 	bl	60d4 <CORE_ExitCritical>
    8e28:	e79e      	b.n	8d68 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x50>
    8e2a:	f1a5 0208 	sub.w	r2, r5, #8
    8e2e:	42ba      	cmp	r2, r7
    8e30:	bf38      	it	cc
    8e32:	f105 0278 	addcc.w	r2, r5, #120	; 0x78
    8e36:	8817      	ldrh	r7, [r2, #0]
    8e38:	f3c7 070c 	ubfx	r7, r7, #0, #13
    8e3c:	e7aa      	b.n	8d94 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x7c>
    8e3e:	4b16      	ldr	r3, [pc, #88]	; (8e98 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x180>)
    8e40:	6d5b      	ldr	r3, [r3, #84]	; 0x54
    8e42:	2b00      	cmp	r3, #0
    8e44:	bf0c      	ite	eq
    8e46:	2300      	moveq	r3, #0
    8e48:	2306      	movne	r3, #6
    8e4a:	1ae4      	subs	r4, r4, r3
    8e4c:	e7cc      	b.n	8de8 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0xd0>
    8e4e:	6c0b      	ldr	r3, [r1, #64]	; 0x40
    8e50:	f108 34ff 	add.w	r4, r8, #4294967295	; 0xffffffff
    8e54:	1bdb      	subs	r3, r3, r7
    8e56:	ea48 0404 	orr.w	r4, r8, r4
    8e5a:	401c      	ands	r4, r3
    8e5c:	4a0f      	ldr	r2, [pc, #60]	; (8e9c <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x184>)
    8e5e:	b2a1      	uxth	r1, r4
    8e60:	68d3      	ldr	r3, [r2, #12]
    8e62:	b224      	sxth	r4, r4
    8e64:	b951      	cbnz	r1, 8e7c <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x164>
    8e66:	f3c3 6303 	ubfx	r3, r3, #24, #4
    8e6a:	2b03      	cmp	r3, #3
    8e6c:	bf0c      	ite	eq
    8e6e:	2308      	moveq	r3, #8
    8e70:	2300      	movne	r3, #0
    8e72:	7033      	strb	r3, [r6, #0]
    8e74:	6f93      	ldr	r3, [r2, #120]	; 0x78
    8e76:	8071      	strh	r1, [r6, #2]
    8e78:	0a1b      	lsrs	r3, r3, #8
    8e7a:	e7bf      	b.n	8dfc <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0xe4>
    8e7c:	2308      	movs	r3, #8
    8e7e:	e7f8      	b.n	8e72 <RAILINT_3c133834576f64bd8ce53e3b0fe38f30+0x15a>
    8e80:	20000d70 	.word	0x20000d70
    8e84:	20000cf0 	.word	0x20000cf0
    8e88:	20000d72 	.word	0x20000d72
    8e8c:	20000d74 	.word	0x20000d74
    8e90:	44004000 	.word	0x44004000
    8e94:	20000ce8 	.word	0x20000ce8
    8e98:	a8004000 	.word	0xa8004000
    8e9c:	a8020000 	.word	0xa8020000

00008ea0 <RAILINT_37dcaf6b67da0fa3f13a9cf3e2b6a0ca>:
    8ea0:	4b05      	ldr	r3, [pc, #20]	; (8eb8 <RAILINT_37dcaf6b67da0fa3f13a9cf3e2b6a0ca+0x18>)
    8ea2:	226c      	movs	r2, #108	; 0x6c
    8ea4:	f8d3 014c 	ldr.w	r0, [r3, #332]	; 0x14c
    8ea8:	2131      	movs	r1, #49	; 0x31
    8eaa:	1c43      	adds	r3, r0, #1
    8eac:	bf0c      	ite	eq
    8eae:	2001      	moveq	r0, #1
    8eb0:	f3c0 7080 	ubfxne	r0, r0, #30, #1
    8eb4:	f7fe b940 	b.w	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    8eb8:	0fe08000 	.word	0x0fe08000

00008ebc <RAILINT_349a796a787499e760b79c593a14f353>:
    8ebc:	0040      	lsls	r0, r0, #1
    8ebe:	b11a      	cbz	r2, 8ec8 <RAILINT_349a796a787499e760b79c593a14f353+0xc>
    8ec0:	2802      	cmp	r0, #2
    8ec2:	bf94      	ite	ls
    8ec4:	2000      	movls	r0, #0
    8ec6:	3803      	subhi	r0, #3
    8ec8:	23fa      	movs	r3, #250	; 0xfa
    8eca:	f001 011f 	and.w	r1, r1, #31
    8ece:	4088      	lsls	r0, r1
    8ed0:	4358      	muls	r0, r3
    8ed2:	4b03      	ldr	r3, [pc, #12]	; (8ee0 <RAILINT_349a796a787499e760b79c593a14f353+0x24>)
    8ed4:	681b      	ldr	r3, [r3, #0]
    8ed6:	fbb0 f0f3 	udiv	r0, r0, r3
    8eda:	230a      	movs	r3, #10
    8edc:	4358      	muls	r0, r3
    8ede:	4770      	bx	lr
    8ee0:	20000d7c 	.word	0x20000d7c

00008ee4 <RAILINT_32f52767e5eabc91b1b4f9b9f833a69a>:
    8ee4:	b510      	push	{r4, lr}
    8ee6:	4604      	mov	r4, r0
    8ee8:	4608      	mov	r0, r1
    8eea:	210f      	movs	r1, #15
    8eec:	f7ff ffe6 	bl	8ebc <RAILINT_349a796a787499e760b79c593a14f353>
    8ef0:	fab4 f384 	clz	r3, r4
    8ef4:	fab0 f180 	clz	r1, r0
    8ef8:	4602      	mov	r2, r0
    8efa:	1a5b      	subs	r3, r3, r1
    8efc:	2b00      	cmp	r3, #0
    8efe:	bfd1      	iteee	le
    8f00:	200f      	movle	r0, #15
    8f02:	f1c3 000f 	rsbgt	r0, r3, #15
    8f06:	f003 031f 	andgt.w	r3, r3, #31
    8f0a:	40da      	lsrgt	r2, r3
    8f0c:	42a2      	cmp	r2, r4
    8f0e:	bf88      	it	hi
    8f10:	f100 30ff 	addhi.w	r0, r0, #4294967295	; 0xffffffff
    8f14:	bd10      	pop	{r4, pc}
	...

00008f18 <RAILINT_538e671f17d827f5e8fbb6213721d612>:
    8f18:	f06f 427f 	mvn.w	r2, #4278190080	; 0xff000000
    8f1c:	b508      	push	{r3, lr}
    8f1e:	4b13      	ldr	r3, [pc, #76]	; (8f6c <RAILINT_538e671f17d827f5e8fbb6213721d612+0x54>)
    8f20:	f8d3 37fc 	ldr.w	r3, [r3, #2044]	; 0x7fc
    8f24:	4293      	cmp	r3, r2
    8f26:	d017      	beq.n	8f58 <RAILINT_538e671f17d827f5e8fbb6213721d612+0x40>
    8f28:	4a11      	ldr	r2, [pc, #68]	; (8f70 <RAILINT_538e671f17d827f5e8fbb6213721d612+0x58>)
    8f2a:	f003 013f 	and.w	r1, r3, #63	; 0x3f
    8f2e:	7011      	strb	r1, [r2, #0]
    8f30:	f3c3 3203 	ubfx	r2, r3, #12, #4
    8f34:	f3c3 2103 	ubfx	r1, r3, #8, #4
    8f38:	390f      	subs	r1, #15
    8f3a:	ebc2 1202 	rsb	r2, r2, r2, lsl #4
    8f3e:	440a      	add	r2, r1
    8f40:	490c      	ldr	r1, [pc, #48]	; (8f74 <RAILINT_538e671f17d827f5e8fbb6213721d612+0x5c>)
    8f42:	700a      	strb	r2, [r1, #0]
    8f44:	f3c3 5203 	ubfx	r2, r3, #20, #4
    8f48:	f3c3 4303 	ubfx	r3, r3, #16, #4
    8f4c:	ebc2 1202 	rsb	r2, r2, r2, lsl #4
    8f50:	3b0f      	subs	r3, #15
    8f52:	4413      	add	r3, r2
    8f54:	4a08      	ldr	r2, [pc, #32]	; (8f78 <RAILINT_538e671f17d827f5e8fbb6213721d612+0x60>)
    8f56:	7013      	strb	r3, [r2, #0]
    8f58:	f000 fd0a 	bl	9970 <RAILINT_56a75a549239881c0b0573168dc43aff>
    8f5c:	f641 036a 	movw	r3, #6250	; 0x186a
    8f60:	fbb0 f0f3 	udiv	r0, r0, r3
    8f64:	4b05      	ldr	r3, [pc, #20]	; (8f7c <RAILINT_538e671f17d827f5e8fbb6213721d612+0x64>)
    8f66:	6018      	str	r0, [r3, #0]
    8f68:	bd08      	pop	{r3, pc}
    8f6a:	bf00      	nop
    8f6c:	a8020000 	.word	0xa8020000
    8f70:	200001fa 	.word	0x200001fa
    8f74:	200001fb 	.word	0x200001fb
    8f78:	200001f9 	.word	0x200001f9
    8f7c:	20000d7c 	.word	0x20000d7c

00008f80 <RAILINT_1040bf941e847cb582a86b6ad519d354>:
    8f80:	2801      	cmp	r0, #1
    8f82:	d007      	beq.n	8f94 <RAILINT_1040bf941e847cb582a86b6ad519d354+0x14>
    8f84:	2802      	cmp	r0, #2
    8f86:	d002      	beq.n	8f8e <RAILINT_1040bf941e847cb582a86b6ad519d354+0xe>
    8f88:	b130      	cbz	r0, 8f98 <RAILINT_1040bf941e847cb582a86b6ad519d354+0x18>
    8f8a:	2000      	movs	r0, #0
    8f8c:	4770      	bx	lr
    8f8e:	4b03      	ldr	r3, [pc, #12]	; (8f9c <RAILINT_1040bf941e847cb582a86b6ad519d354+0x1c>)
    8f90:	7818      	ldrb	r0, [r3, #0]
    8f92:	4770      	bx	lr
    8f94:	4b02      	ldr	r3, [pc, #8]	; (8fa0 <RAILINT_1040bf941e847cb582a86b6ad519d354+0x20>)
    8f96:	e7fb      	b.n	8f90 <RAILINT_1040bf941e847cb582a86b6ad519d354+0x10>
    8f98:	4b02      	ldr	r3, [pc, #8]	; (8fa4 <RAILINT_1040bf941e847cb582a86b6ad519d354+0x24>)
    8f9a:	e7f9      	b.n	8f90 <RAILINT_1040bf941e847cb582a86b6ad519d354+0x10>
    8f9c:	200001fa 	.word	0x200001fa
    8fa0:	200001fb 	.word	0x200001fb
    8fa4:	200001f9 	.word	0x200001f9

00008fa8 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5>:
    8fa8:	2300      	movs	r3, #0
    8faa:	b5f0      	push	{r4, r5, r6, r7, lr}
    8fac:	f890 10c0 	ldrb.w	r1, [r0, #192]	; 0xc0
    8fb0:	b085      	sub	sp, #20
    8fb2:	4602      	mov	r2, r0
    8fb4:	4608      	mov	r0, r1
    8fb6:	e9cd 3301 	strd	r3, r3, [sp, #4]
    8fba:	f8cd 300b 	str.w	r3, [sp, #11]
    8fbe:	f7ff ffdf 	bl	8f80 <RAILINT_1040bf941e847cb582a86b6ad519d354>
    8fc2:	7993      	ldrb	r3, [r2, #6]
    8fc4:	3801      	subs	r0, #1
    8fc6:	2900      	cmp	r1, #0
    8fc8:	d040      	beq.n	904c <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0xa4>
    8fca:	2901      	cmp	r1, #1
    8fcc:	d13c      	bne.n	9048 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0xa0>
    8fce:	2404      	movs	r4, #4
    8fd0:	4619      	mov	r1, r3
    8fd2:	f04f 0c0f 	mov.w	ip, #15
    8fd6:	4e3c      	ldr	r6, [pc, #240]	; (90c8 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0x120>)
    8fd8:	eb0d 0504 	add.w	r5, sp, r4
    8fdc:	fbb1 f7fc 	udiv	r7, r1, ip
    8fe0:	5df7      	ldrb	r7, [r6, r7]
    8fe2:	3c01      	subs	r4, #1
    8fe4:	1bc9      	subs	r1, r1, r7
    8fe6:	b2c9      	uxtb	r1, r1
    8fe8:	4281      	cmp	r1, r0
    8fea:	bf88      	it	hi
    8fec:	2100      	movhi	r1, #0
    8fee:	5561      	strb	r1, [r4, r5]
    8ff0:	2c00      	cmp	r4, #0
    8ff2:	d1f3      	bne.n	8fdc <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0x34>
    8ff4:	2105      	movs	r1, #5
    8ff6:	f04f 0c0f 	mov.w	ip, #15
    8ffa:	f88d 3008 	strb.w	r3, [sp, #8]
    8ffe:	b2c7      	uxtb	r7, r0
    9000:	fbb3 f4fc 	udiv	r4, r3, ip
    9004:	5d34      	ldrb	r4, [r6, r4]
    9006:	4423      	add	r3, r4
    9008:	b2db      	uxtb	r3, r3
    900a:	4283      	cmp	r3, r0
    900c:	bf28      	it	cs
    900e:	463b      	movcs	r3, r7
    9010:	546b      	strb	r3, [r5, r1]
    9012:	3101      	adds	r1, #1
    9014:	290b      	cmp	r1, #11
    9016:	d1f3      	bne.n	9000 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0x58>
    9018:	462e      	mov	r6, r5
    901a:	200f      	movs	r0, #15
    901c:	f102 04f0 	add.w	r4, r2, #240	; 0xf0
    9020:	f502 728e 	add.w	r2, r2, #284	; 0x11c
    9024:	f816 3b01 	ldrb.w	r3, [r6], #1
    9028:	fbb3 f1f0 	udiv	r1, r3, r0
    902c:	1c4d      	adds	r5, r1, #1
    902e:	ebc1 1101 	rsb	r1, r1, r1, lsl #4
    9032:	1a5b      	subs	r3, r3, r1
    9034:	3301      	adds	r3, #1
    9036:	b2db      	uxtb	r3, r3
    9038:	b2ed      	uxtb	r5, r5
    903a:	041b      	lsls	r3, r3, #16
    903c:	ea43 5305 	orr.w	r3, r3, r5, lsl #20
    9040:	f844 3b04 	str.w	r3, [r4], #4
    9044:	42a2      	cmp	r2, r4
    9046:	d1ed      	bne.n	9024 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0x7c>
    9048:	b005      	add	sp, #20
    904a:	bdf0      	pop	{r4, r5, r6, r7, pc}
    904c:	2404      	movs	r4, #4
    904e:	4619      	mov	r1, r3
    9050:	f04f 0c0f 	mov.w	ip, #15
    9054:	4f1d      	ldr	r7, [pc, #116]	; (90cc <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0x124>)
    9056:	eb0d 0604 	add.w	r6, sp, r4
    905a:	fbb1 f5fc 	udiv	r5, r1, ip
    905e:	b2ed      	uxtb	r5, r5
    9060:	5d7d      	ldrb	r5, [r7, r5]
    9062:	3c01      	subs	r4, #1
    9064:	1b49      	subs	r1, r1, r5
    9066:	b2c9      	uxtb	r1, r1
    9068:	4281      	cmp	r1, r0
    906a:	bf88      	it	hi
    906c:	2100      	movhi	r1, #0
    906e:	55a1      	strb	r1, [r4, r6]
    9070:	2c00      	cmp	r4, #0
    9072:	d1f2      	bne.n	905a <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0xb2>
    9074:	2105      	movs	r1, #5
    9076:	f04f 0c0f 	mov.w	ip, #15
    907a:	f88d 3008 	strb.w	r3, [sp, #8]
    907e:	b2c5      	uxtb	r5, r0
    9080:	fbb3 f4fc 	udiv	r4, r3, ip
    9084:	5d3c      	ldrb	r4, [r7, r4]
    9086:	4423      	add	r3, r4
    9088:	b2db      	uxtb	r3, r3
    908a:	4283      	cmp	r3, r0
    908c:	bf28      	it	cs
    908e:	462b      	movcs	r3, r5
    9090:	5473      	strb	r3, [r6, r1]
    9092:	3101      	adds	r1, #1
    9094:	290b      	cmp	r1, #11
    9096:	d1f3      	bne.n	9080 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0xd8>
    9098:	250f      	movs	r5, #15
    909a:	f102 04f0 	add.w	r4, r2, #240	; 0xf0
    909e:	f502 728e 	add.w	r2, r2, #284	; 0x11c
    90a2:	f816 3b01 	ldrb.w	r3, [r6], #1
    90a6:	fbb3 f1f5 	udiv	r1, r3, r5
    90aa:	1c48      	adds	r0, r1, #1
    90ac:	ebc1 1101 	rsb	r1, r1, r1, lsl #4
    90b0:	1a5b      	subs	r3, r3, r1
    90b2:	3301      	adds	r3, #1
    90b4:	b2db      	uxtb	r3, r3
    90b6:	b2c0      	uxtb	r0, r0
    90b8:	041b      	lsls	r3, r3, #16
    90ba:	ea43 5300 	orr.w	r3, r3, r0, lsl #20
    90be:	f844 3b04 	str.w	r3, [r4], #4
    90c2:	42a2      	cmp	r2, r4
    90c4:	d1ed      	bne.n	90a2 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0xfa>
    90c6:	e7bf      	b.n	9048 <RAILINT_0253fd9ac1e21acdc9ffa6ba468555a5+0xa0>
    90c8:	0000bf1c 	.word	0x0000bf1c
    90cc:	0000bf23 	.word	0x0000bf23

000090d0 <RAILINT_08c8419aa71adfff4194c3a91186dc0b>:
    90d0:	b538      	push	{r3, r4, r5, lr}
    90d2:	4b24      	ldr	r3, [pc, #144]	; (9164 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x94>)
    90d4:	4604      	mov	r4, r0
    90d6:	7819      	ldrb	r1, [r3, #0]
    90d8:	4a23      	ldr	r2, [pc, #140]	; (9168 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x98>)
    90da:	2904      	cmp	r1, #4
    90dc:	d102      	bne.n	90e4 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x14>
    90de:	20ff      	movs	r0, #255	; 0xff
    90e0:	7010      	strb	r0, [r2, #0]
    90e2:	bd38      	pop	{r3, r4, r5, pc}
    90e4:	4608      	mov	r0, r1
    90e6:	f7ff ff4b 	bl	8f80 <RAILINT_1040bf941e847cb582a86b6ad519d354>
    90ea:	42a0      	cmp	r0, r4
    90ec:	bf28      	it	cs
    90ee:	4620      	movcs	r0, r4
    90f0:	7813      	ldrb	r3, [r2, #0]
    90f2:	b2c0      	uxtb	r0, r0
    90f4:	4283      	cmp	r3, r0
    90f6:	d0f4      	beq.n	90e2 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x12>
    90f8:	7010      	strb	r0, [r2, #0]
    90fa:	b108      	cbz	r0, 9100 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x30>
    90fc:	3801      	subs	r0, #1
    90fe:	b2c0      	uxtb	r0, r0
    9100:	2902      	cmp	r1, #2
    9102:	d10d      	bne.n	9120 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x50>
    9104:	f04f 61fc 	mov.w	r1, #132120576	; 0x7e00000
    9108:	4b18      	ldr	r3, [pc, #96]	; (916c <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x9c>)
    910a:	f8c3 10fc 	str.w	r1, [r3, #252]	; 0xfc
    910e:	4918      	ldr	r1, [pc, #96]	; (9170 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0xa0>)
    9110:	f8d1 30fc 	ldr.w	r3, [r1, #252]	; 0xfc
    9114:	ea43 5040 	orr.w	r0, r3, r0, lsl #21
    9118:	f8c1 00fc 	str.w	r0, [r1, #252]	; 0xfc
    911c:	7810      	ldrb	r0, [r2, #0]
    911e:	e7e0      	b.n	90e2 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x12>
    9120:	4b14      	ldr	r3, [pc, #80]	; (9174 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0xa4>)
    9122:	681b      	ldr	r3, [r3, #0]
    9124:	b103      	cbz	r3, 9128 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x58>
    9126:	330c      	adds	r3, #12
    9128:	4913      	ldr	r1, [pc, #76]	; (9178 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0xa8>)
    912a:	33f0      	adds	r3, #240	; 0xf0
    912c:	f8c1 3fbc 	str.w	r3, [r1, #4028]	; 0xfbc
    9130:	f44f 017f 	mov.w	r1, #16711680	; 0xff0000
    9134:	4b0d      	ldr	r3, [pc, #52]	; (916c <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x9c>)
    9136:	f8c3 1108 	str.w	r1, [r3, #264]	; 0x108
    913a:	490d      	ldr	r1, [pc, #52]	; (9170 <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0xa0>)
    913c:	6fcb      	ldr	r3, [r1, #124]	; 0x7c
    913e:	02db      	lsls	r3, r3, #11
    9140:	d4ec      	bmi.n	911c <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x4c>
    9142:	230f      	movs	r3, #15
    9144:	fbb0 f3f3 	udiv	r3, r0, r3
    9148:	1c5d      	adds	r5, r3, #1
    914a:	ebc3 1303 	rsb	r3, r3, r3, lsl #4
    914e:	1ac3      	subs	r3, r0, r3
    9150:	3301      	adds	r3, #1
    9152:	f8d1 4108 	ldr.w	r4, [r1, #264]	; 0x108
    9156:	041b      	lsls	r3, r3, #16
    9158:	ea43 5305 	orr.w	r3, r3, r5, lsl #20
    915c:	4323      	orrs	r3, r4
    915e:	f8c1 3108 	str.w	r3, [r1, #264]	; 0x108
    9162:	e7db      	b.n	911c <RAILINT_08c8419aa71adfff4194c3a91186dc0b+0x4c>
    9164:	200001ea 	.word	0x200001ea
    9168:	200001e8 	.word	0x200001e8
    916c:	a8022000 	.word	0xa8022000
    9170:	a8020000 	.word	0xa8020000
    9174:	20000aa8 	.word	0x20000aa8
    9178:	b0001000 	.word	0xb0001000

0000917c <RAILINT_da84b4d83e32af60304869814f893155>:
    917c:	4b01      	ldr	r3, [pc, #4]	; (9184 <RAILINT_da84b4d83e32af60304869814f893155+0x8>)
    917e:	6818      	ldr	r0, [r3, #0]
    9180:	4770      	bx	lr
    9182:	bf00      	nop
    9184:	20000d80 	.word	0x20000d80

00009188 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134>:
    9188:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    918c:	f890 90c0 	ldrb.w	r9, [r0, #192]	; 0xc0
    9190:	4680      	mov	r8, r0
    9192:	f8d0 1144 	ldr.w	r1, [r0, #324]	; 0x144
    9196:	f1b9 0f00 	cmp.w	r9, #0
    919a:	d129      	bne.n	91f0 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x68>
    919c:	291f      	cmp	r1, #31
    919e:	bf38      	it	cc
    91a0:	211f      	movcc	r1, #31
    91a2:	3909      	subs	r1, #9
    91a4:	4b96      	ldr	r3, [pc, #600]	; (9400 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x278>)
    91a6:	6a1a      	ldr	r2, [r3, #32]
    91a8:	f3c2 1282 	ubfx	r2, r2, #6, #3
    91ac:	1e93      	subs	r3, r2, #2
    91ae:	2b01      	cmp	r3, #1
    91b0:	d923      	bls.n	91fa <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x72>
    91b2:	1f93      	subs	r3, r2, #6
    91b4:	f1d3 0a00 	rsbs	sl, r3, #0
    91b8:	eb4a 0a03 	adc.w	sl, sl, r3
    91bc:	4c91      	ldr	r4, [pc, #580]	; (9404 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x27c>)
    91be:	4650      	mov	r0, sl
    91c0:	6823      	ldr	r3, [r4, #0]
    91c2:	f898 5006 	ldrb.w	r5, [r8, #6]
    91c6:	428b      	cmp	r3, r1
    91c8:	f8df b260 	ldr.w	fp, [pc, #608]	; 942c <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x2a4>
    91cc:	4b8e      	ldr	r3, [pc, #568]	; (9408 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x280>)
    91ce:	d117      	bne.n	9200 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x78>
    91d0:	781e      	ldrb	r6, [r3, #0]
    91d2:	4556      	cmp	r6, sl
    91d4:	d114      	bne.n	9200 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x78>
    91d6:	4a8d      	ldr	r2, [pc, #564]	; (940c <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x284>)
    91d8:	7816      	ldrb	r6, [r2, #0]
    91da:	454e      	cmp	r6, r9
    91dc:	d110      	bne.n	9200 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x78>
    91de:	4a8c      	ldr	r2, [pc, #560]	; (9410 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x288>)
    91e0:	7816      	ldrb	r6, [r2, #0]
    91e2:	42ae      	cmp	r6, r5
    91e4:	d10c      	bne.n	9200 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x78>
    91e6:	f8bb 0004 	ldrh.w	r0, [fp, #4]
    91ea:	b003      	add	sp, #12
    91ec:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    91f0:	2903      	cmp	r1, #3
    91f2:	bf38      	it	cc
    91f4:	2103      	movcc	r1, #3
    91f6:	3902      	subs	r1, #2
    91f8:	e7d4      	b.n	91a4 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x1c>
    91fa:	f04f 0a01 	mov.w	sl, #1
    91fe:	e7dd      	b.n	91bc <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x34>
    9200:	7018      	strb	r0, [r3, #0]
    9202:	f89b 0000 	ldrb.w	r0, [fp]
    9206:	6021      	str	r1, [r4, #0]
    9208:	f7ff feba 	bl	8f80 <RAILINT_1040bf941e847cb582a86b6ad519d354>
    920c:	42a8      	cmp	r0, r5
    920e:	d312      	bcc.n	9236 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0xae>
    9210:	2d01      	cmp	r5, #1
    9212:	d814      	bhi.n	923e <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0xb6>
    9214:	2500      	movs	r5, #0
    9216:	f1ba 0f00 	cmp.w	sl, #0
    921a:	d012      	beq.n	9242 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0xba>
    921c:	f8d8 5078 	ldr.w	r5, [r8, #120]	; 0x78
    9220:	b12d      	cbz	r5, 922e <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0xa6>
    9222:	682b      	ldr	r3, [r5, #0]
    9224:	2b08      	cmp	r3, #8
    9226:	f240 80d7 	bls.w	93d8 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x250>
    922a:	f895 5038 	ldrb.w	r5, [r5, #56]	; 0x38
    922e:	f1b9 0f00 	cmp.w	r9, #0
    9232:	d110      	bne.n	9256 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0xce>
    9234:	e057      	b.n	92e6 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x15e>
    9236:	2801      	cmp	r0, #1
    9238:	d9ec      	bls.n	9214 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x8c>
    923a:	1e45      	subs	r5, r0, #1
    923c:	e7eb      	b.n	9216 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x8e>
    923e:	3d01      	subs	r5, #1
    9240:	e7e9      	b.n	9216 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x8e>
    9242:	f1b9 0f01 	cmp.w	r9, #1
    9246:	d01f      	beq.n	9288 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x100>
    9248:	f1b9 0f02 	cmp.w	r9, #2
    924c:	d003      	beq.n	9256 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0xce>
    924e:	f1b9 0f00 	cmp.w	r9, #0
    9252:	d02a      	beq.n	92aa <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x122>
    9254:	4655      	mov	r5, sl
    9256:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
    925a:	4348      	muls	r0, r1
    925c:	2201      	movs	r2, #1
    925e:	4629      	mov	r1, r5
    9260:	f200 30e7 	addw	r0, r0, #999	; 0x3e7
    9264:	f7ff fe3e 	bl	8ee4 <RAILINT_32f52767e5eabc91b1b4f9b9f833a69a>
    9268:	0204      	lsls	r4, r0, #8
    926a:	ea44 1400 	orr.w	r4, r4, r0, lsl #4
    926e:	4601      	mov	r1, r0
    9270:	2201      	movs	r2, #1
    9272:	4304      	orrs	r4, r0
    9274:	4628      	mov	r0, r5
    9276:	f7ff fe21 	bl	8ebc <RAILINT_349a796a787499e760b79c593a14f353>
    927a:	042e      	lsls	r6, r5, #16
    927c:	ea46 2605 	orr.w	r6, r6, r5, lsl #8
    9280:	432e      	orrs	r6, r5
    9282:	f500 65fa 	add.w	r5, r0, #2000	; 0x7d0
    9286:	e071      	b.n	936c <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x1e4>
    9288:	230f      	movs	r3, #15
    928a:	b2ed      	uxtb	r5, r5
    928c:	fbb5 f3f3 	udiv	r3, r5, r3
    9290:	1c58      	adds	r0, r3, #1
    9292:	ebc3 1303 	rsb	r3, r3, r3, lsl #4
    9296:	1aed      	subs	r5, r5, r3
    9298:	3501      	adds	r5, #1
    929a:	b2ed      	uxtb	r5, r5
    929c:	b2c0      	uxtb	r0, r0
    929e:	042d      	lsls	r5, r5, #16
    92a0:	ea45 5500 	orr.w	r5, r5, r0, lsl #20
    92a4:	f3c5 4507 	ubfx	r5, r5, #16, #8
    92a8:	e7d5      	b.n	9256 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0xce>
    92aa:	4c5a      	ldr	r4, [pc, #360]	; (9414 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x28c>)
    92ac:	4b5a      	ldr	r3, [pc, #360]	; (9418 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x290>)
    92ae:	7824      	ldrb	r4, [r4, #0]
    92b0:	6818      	ldr	r0, [r3, #0]
    92b2:	2c00      	cmp	r4, #0
    92b4:	f000 8092 	beq.w	93dc <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x254>
    92b8:	f1b0 6fa0 	cmp.w	r0, #83886080	; 0x5000000
    92bc:	f0c0 808e 	bcc.w	93dc <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x254>
    92c0:	f8d3 0250 	ldr.w	r0, [r3, #592]	; 0x250
    92c4:	3001      	adds	r0, #1
    92c6:	f000 8089 	beq.w	93dc <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x254>
    92ca:	200f      	movs	r0, #15
    92cc:	fbb5 f5f0 	udiv	r5, r5, r0
    92d0:	1c68      	adds	r0, r5, #1
    92d2:	2804      	cmp	r0, #4
    92d4:	d870      	bhi.n	93b8 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x230>
    92d6:	20ff      	movs	r0, #255	; 0xff
    92d8:	00ed      	lsls	r5, r5, #3
    92da:	f8d3 3250 	ldr.w	r3, [r3, #592]	; 0x250
    92de:	40a8      	lsls	r0, r5
    92e0:	4018      	ands	r0, r3
    92e2:	fa20 f505 	lsr.w	r5, r0, r5
    92e6:	f44f 777a 	mov.w	r7, #1000	; 0x3e8
    92ea:	434f      	muls	r7, r1
    92ec:	042e      	lsls	r6, r5, #16
    92ee:	f207 37e7 	addw	r7, r7, #999	; 0x3e7
    92f2:	f1ba 0f00 	cmp.w	sl, #0
    92f6:	d173      	bne.n	93e0 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x258>
    92f8:	2029      	movs	r0, #41	; 0x29
    92fa:	2364      	movs	r3, #100	; 0x64
    92fc:	4378      	muls	r0, r7
    92fe:	3d40      	subs	r5, #64	; 0x40
    9300:	4652      	mov	r2, sl
    9302:	4629      	mov	r1, r5
    9304:	fbb0 f0f3 	udiv	r0, r0, r3
    9308:	f7ff fdec 	bl	8ee4 <RAILINT_32f52767e5eabc91b1b4f9b9f833a69a>
    930c:	4652      	mov	r2, sl
    930e:	4601      	mov	r1, r0
    9310:	4604      	mov	r4, r0
    9312:	4628      	mov	r0, r5
    9314:	f7ff fdd2 	bl	8ebc <RAILINT_349a796a787499e760b79c593a14f353>
    9318:	1a3f      	subs	r7, r7, r0
    931a:	4605      	mov	r5, r0
    931c:	202a      	movs	r0, #42	; 0x2a
    931e:	2364      	movs	r3, #100	; 0x64
    9320:	4378      	muls	r0, r7
    9322:	2130      	movs	r1, #48	; 0x30
    9324:	fbb0 f0f3 	udiv	r0, r0, r3
    9328:	f7ff fddc 	bl	8ee4 <RAILINT_32f52767e5eabc91b1b4f9b9f833a69a>
    932c:	4652      	mov	r2, sl
    932e:	4601      	mov	r1, r0
    9330:	9001      	str	r0, [sp, #4]
    9332:	2030      	movs	r0, #48	; 0x30
    9334:	f7ff fdc2 	bl	8ebc <RAILINT_349a796a787499e760b79c593a14f353>
    9338:	2201      	movs	r2, #1
    933a:	4682      	mov	sl, r0
    933c:	2110      	movs	r1, #16
    933e:	1a38      	subs	r0, r7, r0
    9340:	f7ff fdd0 	bl	8ee4 <RAILINT_32f52767e5eabc91b1b4f9b9f833a69a>
    9344:	2201      	movs	r2, #1
    9346:	4607      	mov	r7, r0
    9348:	4601      	mov	r1, r0
    934a:	2010      	movs	r0, #16
    934c:	f7ff fdb6 	bl	8ebc <RAILINT_349a796a787499e760b79c593a14f353>
    9350:	9b01      	ldr	r3, [sp, #4]
    9352:	0224      	lsls	r4, r4, #8
    9354:	ea44 1403 	orr.w	r4, r4, r3, lsl #4
    9358:	f446 4680 	orr.w	r6, r6, #16384	; 0x4000
    935c:	44aa      	add	sl, r5
    935e:	433c      	orrs	r4, r7
    9360:	f046 0610 	orr.w	r6, r6, #16
    9364:	4450      	add	r0, sl
    9366:	4b2d      	ldr	r3, [pc, #180]	; (941c <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x294>)
    9368:	681d      	ldr	r5, [r3, #0]
    936a:	4405      	add	r5, r0
    936c:	f640 72ff 	movw	r2, #4095	; 0xfff
    9370:	4b2b      	ldr	r3, [pc, #172]	; (9420 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x298>)
    9372:	4628      	mov	r0, r5
    9374:	f8c3 20c0 	str.w	r2, [r3, #192]	; 0xc0
    9378:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
    937c:	f8c3 40c0 	str.w	r4, [r3, #192]	; 0xc0
    9380:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
    9384:	4c27      	ldr	r4, [pc, #156]	; (9424 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x29c>)
    9386:	f8c3 60c4 	str.w	r6, [r3, #196]	; 0xc4
    938a:	6025      	str	r5, [r4, #0]
    938c:	f000 ff1e 	bl	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    9390:	4b25      	ldr	r3, [pc, #148]	; (9428 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x2a0>)
    9392:	4240      	negs	r0, r0
    9394:	6618      	str	r0, [r3, #96]	; 0x60
    9396:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
    939a:	6823      	ldr	r3, [r4, #0]
    939c:	4a1c      	ldr	r2, [pc, #112]	; (9410 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x288>)
    939e:	fbb3 f3f0 	udiv	r3, r3, r0
    93a2:	f8ab 3004 	strh.w	r3, [fp, #4]
    93a6:	4b19      	ldr	r3, [pc, #100]	; (940c <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x284>)
    93a8:	fbb5 f0f0 	udiv	r0, r5, r0
    93ac:	f883 9000 	strb.w	r9, [r3]
    93b0:	f898 3006 	ldrb.w	r3, [r8, #6]
    93b4:	7013      	strb	r3, [r2, #0]
    93b6:	e718      	b.n	91ea <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x62>
    93b8:	2808      	cmp	r0, #8
    93ba:	f04f 00ff 	mov.w	r0, #255	; 0xff
    93be:	bf95      	itete	ls
    93c0:	3d04      	subls	r5, #4
    93c2:	3d08      	subhi	r5, #8
    93c4:	f8d3 4254 	ldrls.w	r4, [r3, #596]	; 0x254
    93c8:	f8d3 4258 	ldrhi.w	r4, [r3, #600]	; 0x258
    93cc:	00eb      	lsls	r3, r5, #3
    93ce:	fa00 f503 	lsl.w	r5, r0, r3
    93d2:	4025      	ands	r5, r4
    93d4:	40dd      	lsrs	r5, r3
    93d6:	e786      	b.n	92e6 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x15e>
    93d8:	2500      	movs	r5, #0
    93da:	e728      	b.n	922e <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0xa6>
    93dc:	25c8      	movs	r5, #200	; 0xc8
    93de:	e782      	b.n	92e6 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x15e>
    93e0:	2200      	movs	r2, #0
    93e2:	4629      	mov	r1, r5
    93e4:	4638      	mov	r0, r7
    93e6:	f7ff fd7d 	bl	8ee4 <RAILINT_32f52767e5eabc91b1b4f9b9f833a69a>
    93ea:	4604      	mov	r4, r0
    93ec:	4601      	mov	r1, r0
    93ee:	2200      	movs	r2, #0
    93f0:	4628      	mov	r0, r5
    93f2:	0224      	lsls	r4, r4, #8
    93f4:	f7ff fd62 	bl	8ebc <RAILINT_349a796a787499e760b79c593a14f353>
    93f8:	f044 0411 	orr.w	r4, r4, #17
    93fc:	e7b3      	b.n	9366 <RAILINT_692f9e407ff0da6bb4b5f2aa1969c134+0x1de>
    93fe:	bf00      	nop
    9400:	a8014000 	.word	0xa8014000
    9404:	200001e4 	.word	0x200001e4
    9408:	20000d78 	.word	0x20000d78
    940c:	200001f1 	.word	0x200001f1
    9410:	200001f0 	.word	0x200001f0
    9414:	200001f8 	.word	0x200001f8
    9418:	0fe08000 	.word	0x0fe08000
    941c:	200001f4 	.word	0x200001f4
    9420:	a8016000 	.word	0xa8016000
    9424:	20000d80 	.word	0x20000d80
    9428:	b0001f00 	.word	0xb0001f00
    942c:	200001ea 	.word	0x200001ea

00009430 <RAILINT_ac4c341889862730c8d820dc51f851c9>:
    9430:	b538      	push	{r3, r4, r5, lr}
    9432:	4605      	mov	r5, r0
    9434:	4c31      	ldr	r4, [pc, #196]	; (94fc <RAILINT_ac4c341889862730c8d820dc51f851c9+0xcc>)
    9436:	f000 fa51 	bl	98dc <RAILINT_ff78d9bb4bfe772063473783474f9dc5>
    943a:	4b31      	ldr	r3, [pc, #196]	; (9500 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xd0>)
    943c:	701d      	strb	r5, [r3, #0]
    943e:	7823      	ldrb	r3, [r4, #0]
    9440:	3b01      	subs	r3, #1
    9442:	2b01      	cmp	r3, #1
    9444:	d80c      	bhi.n	9460 <RAILINT_ac4c341889862730c8d820dc51f851c9+0x30>
    9446:	2201      	movs	r2, #1
    9448:	7c21      	ldrb	r1, [r4, #16]
    944a:	7be3      	ldrb	r3, [r4, #15]
    944c:	408a      	lsls	r2, r1
    944e:	2130      	movs	r1, #48	; 0x30
    9450:	434b      	muls	r3, r1
    9452:	f242 0110 	movw	r1, #8208	; 0x2010
    9456:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    945a:	f503 3370 	add.w	r3, r3, #245760	; 0x3c000
    945e:	505a      	str	r2, [r3, r1]
    9460:	2200      	movs	r2, #0
    9462:	4b28      	ldr	r3, [pc, #160]	; (9504 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xd4>)
    9464:	f8c3 2484 	str.w	r2, [r3, #1156]	; 0x484
    9468:	2d00      	cmp	r5, #0
    946a:	d03f      	beq.n	94ec <RAILINT_ac4c341889862730c8d820dc51f851c9+0xbc>
    946c:	6863      	ldr	r3, [r4, #4]
    946e:	b39b      	cbz	r3, 94d8 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xa8>
    9470:	f000 fa7e 	bl	9970 <RAILINT_56a75a549239881c0b0573168dc43aff>
    9474:	6862      	ldr	r2, [r4, #4]
    9476:	eb00 0352 	add.w	r3, r0, r2, lsr #1
    947a:	fbb3 f3f2 	udiv	r3, r3, r2
    947e:	3b01      	subs	r3, #1
    9480:	021b      	lsls	r3, r3, #8
    9482:	f043 03f8 	orr.w	r3, r3, #248	; 0xf8
    9486:	7822      	ldrb	r2, [r4, #0]
    9488:	2a02      	cmp	r2, #2
    948a:	d027      	beq.n	94dc <RAILINT_ac4c341889862730c8d820dc51f851c9+0xac>
    948c:	2a03      	cmp	r2, #3
    948e:	d029      	beq.n	94e4 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xb4>
    9490:	2a01      	cmp	r2, #1
    9492:	d12e      	bne.n	94f2 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xc2>
    9494:	2207      	movs	r2, #7
    9496:	f043 0302 	orr.w	r3, r3, #2
    949a:	f64f 70ff 	movw	r0, #65535	; 0xffff
    949e:	491a      	ldr	r1, [pc, #104]	; (9508 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xd8>)
    94a0:	f8c1 0084 	str.w	r0, [r1, #132]	; 0x84
    94a4:	f5a1 5180 	sub.w	r1, r1, #4096	; 0x1000
    94a8:	f8c1 3084 	str.w	r3, [r1, #132]	; 0x84
    94ac:	4b15      	ldr	r3, [pc, #84]	; (9504 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xd4>)
    94ae:	f8c3 2484 	str.w	r2, [r3, #1156]	; 0x484
    94b2:	0792      	lsls	r2, r2, #30
    94b4:	d509      	bpl.n	94ca <RAILINT_ac4c341889862730c8d820dc51f851c9+0x9a>
    94b6:	2201      	movs	r2, #1
    94b8:	7c20      	ldrb	r0, [r4, #16]
    94ba:	7be1      	ldrb	r1, [r4, #15]
    94bc:	4082      	lsls	r2, r0
    94be:	2030      	movs	r0, #48	; 0x30
    94c0:	fb00 3301 	mla	r3, r0, r1, r3
    94c4:	f241 0110 	movw	r1, #4112	; 0x1010
    94c8:	505a      	str	r2, [r3, r1]
    94ca:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    94ce:	b195      	cbz	r5, 94f6 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xc6>
    94d0:	4a0e      	ldr	r2, [pc, #56]	; (950c <RAILINT_ac4c341889862730c8d820dc51f851c9+0xdc>)
    94d2:	2000      	movs	r0, #0
    94d4:	67d3      	str	r3, [r2, #124]	; 0x7c
    94d6:	bd38      	pop	{r3, r4, r5, pc}
    94d8:	23f8      	movs	r3, #248	; 0xf8
    94da:	e7d4      	b.n	9486 <RAILINT_ac4c341889862730c8d820dc51f851c9+0x56>
    94dc:	2206      	movs	r2, #6
    94de:	f043 0301 	orr.w	r3, r3, #1
    94e2:	e7da      	b.n	949a <RAILINT_ac4c341889862730c8d820dc51f851c9+0x6a>
    94e4:	2204      	movs	r2, #4
    94e6:	f043 0305 	orr.w	r3, r3, #5
    94ea:	e7d6      	b.n	949a <RAILINT_ac4c341889862730c8d820dc51f851c9+0x6a>
    94ec:	462a      	mov	r2, r5
    94ee:	23f8      	movs	r3, #248	; 0xf8
    94f0:	e7d3      	b.n	949a <RAILINT_ac4c341889862730c8d820dc51f851c9+0x6a>
    94f2:	2200      	movs	r2, #0
    94f4:	e7d1      	b.n	949a <RAILINT_ac4c341889862730c8d820dc51f851c9+0x6a>
    94f6:	4a06      	ldr	r2, [pc, #24]	; (9510 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xe0>)
    94f8:	e7eb      	b.n	94d2 <RAILINT_ac4c341889862730c8d820dc51f851c9+0xa2>
    94fa:	bf00      	nop
    94fc:	20000d88 	.word	0x20000d88
    9500:	20000d84 	.word	0x20000d84
    9504:	4003c000 	.word	0x4003c000
    9508:	a8006000 	.word	0xa8006000
    950c:	a8021000 	.word	0xa8021000
    9510:	a8022000 	.word	0xa8022000

00009514 <PTI_AuxdataOutput>:
    9514:	4b03      	ldr	r3, [pc, #12]	; (9524 <PTI_AuxdataOutput+0x10>)
    9516:	6fdb      	ldr	r3, [r3, #124]	; 0x7c
    9518:	2b00      	cmp	r3, #0
    951a:	bfbc      	itt	lt
    951c:	4b02      	ldrlt	r3, [pc, #8]	; (9528 <PTI_AuxdataOutput+0x14>)
    951e:	f8c3 0088 	strlt.w	r0, [r3, #136]	; 0x88
    9522:	4770      	bx	lr
    9524:	a8020000 	.word	0xa8020000
    9528:	a8004000 	.word	0xa8004000

0000952c <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9>:
    952c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    9530:	4b2d      	ldr	r3, [pc, #180]	; (95e8 <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xbc>)
    9532:	4c2e      	ldr	r4, [pc, #184]	; (95ec <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xc0>)
    9534:	f44f 767a 	mov.w	r6, #1000	; 0x3e8
    9538:	60a3      	str	r3, [r4, #8]
    953a:	f000 fa19 	bl	9970 <RAILINT_56a75a549239881c0b0573168dc43aff>
    953e:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    9542:	fbb0 f6f6 	udiv	r6, r0, r6
    9546:	4373      	muls	r3, r6
    9548:	4607      	mov	r7, r0
    954a:	4829      	ldr	r0, [pc, #164]	; (95f0 <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xc4>)
    954c:	0e19      	lsrs	r1, r3, #24
    954e:	021b      	lsls	r3, r3, #8
    9550:	1818      	adds	r0, r3, r0
    9552:	4a28      	ldr	r2, [pc, #160]	; (95f4 <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xc8>)
    9554:	f04f 0300 	mov.w	r3, #0
    9558:	f141 0100 	adc.w	r1, r1, #0
    955c:	f002 f94e 	bl	b7fc <__aeabi_uldivmod>
    9560:	f5a0 7380 	sub.w	r3, r0, #256	; 0x100
    9564:	4605      	mov	r5, r0
    9566:	6323      	str	r3, [r4, #48]	; 0x30
    9568:	b920      	cbnz	r0, 9574 <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0x48>
    956a:	2260      	movs	r2, #96	; 0x60
    956c:	212b      	movs	r1, #43	; 0x2b
    956e:	f7fd fde3 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    9572:	2501      	movs	r5, #1
    9574:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    9578:	f04f 0a00 	mov.w	sl, #0
    957c:	436a      	muls	r2, r5
    957e:	4653      	mov	r3, sl
    9580:	0850      	lsrs	r0, r2, #1
    9582:	0231      	lsls	r1, r6, #8
    9584:	f002 f93a 	bl	b7fc <__aeabi_uldivmod>
    9588:	4b1b      	ldr	r3, [pc, #108]	; (95f8 <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xcc>)
    958a:	f5b7 7f7a 	cmp.w	r7, #1000	; 0x3e8
    958e:	6019      	str	r1, [r3, #0]
    9590:	4b1a      	ldr	r3, [pc, #104]	; (95fc <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xd0>)
    9592:	ea4f 6805 	mov.w	r8, r5, lsl #24
    9596:	4689      	mov	r9, r1
    9598:	4604      	mov	r4, r0
    959a:	6018      	str	r0, [r3, #0]
    959c:	ea4f 2515 	mov.w	r5, r5, lsr #8
    95a0:	d205      	bcs.n	95ae <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0x82>
    95a2:	2270      	movs	r2, #112	; 0x70
    95a4:	212b      	movs	r1, #43	; 0x2b
    95a6:	4650      	mov	r0, sl
    95a8:	f7fd fdc6 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    95ac:	2601      	movs	r6, #1
    95ae:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
    95b2:	fba8 0801 	umull	r0, r8, r8, r1
    95b6:	fb01 8105 	mla	r1, r1, r5, r8
    95ba:	0873      	lsrs	r3, r6, #1
    95bc:	18c0      	adds	r0, r0, r3
    95be:	f141 0100 	adc.w	r1, r1, #0
    95c2:	2300      	movs	r3, #0
    95c4:	4632      	mov	r2, r6
    95c6:	f002 f919 	bl	b7fc <__aeabi_uldivmod>
    95ca:	4b0d      	ldr	r3, [pc, #52]	; (9600 <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xd4>)
    95cc:	3402      	adds	r4, #2
    95ce:	6019      	str	r1, [r3, #0]
    95d0:	4b0c      	ldr	r3, [pc, #48]	; (9604 <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xd8>)
    95d2:	f149 0900 	adc.w	r9, r9, #0
    95d6:	08a4      	lsrs	r4, r4, #2
    95d8:	6018      	str	r0, [r3, #0]
    95da:	ea44 7489 	orr.w	r4, r4, r9, lsl #30
    95de:	4b03      	ldr	r3, [pc, #12]	; (95ec <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9+0xc0>)
    95e0:	3c01      	subs	r4, #1
    95e2:	639c      	str	r4, [r3, #56]	; 0x38
    95e4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    95e8:	00011102 	.word	0x00011102
    95ec:	a801c000 	.word	0xa801c000
    95f0:	0007a120 	.word	0x0007a120
    95f4:	000f4240 	.word	0x000f4240
    95f8:	20000db0 	.word	0x20000db0
    95fc:	20000dac 	.word	0x20000dac
    9600:	20000da8 	.word	0x20000da8
    9604:	20000da4 	.word	0x20000da4

00009608 <RAILINT_2867cf1f7327fd002fccf5d8ded311be>:
    9608:	2210      	movs	r2, #16
    960a:	4b04      	ldr	r3, [pc, #16]	; (961c <RAILINT_2867cf1f7327fd002fccf5d8ded311be+0x14>)
    960c:	f8c3 2184 	str.w	r2, [r3, #388]	; 0x184
    9610:	605a      	str	r2, [r3, #4]
    9612:	2201      	movs	r2, #1
    9614:	4b02      	ldr	r3, [pc, #8]	; (9620 <RAILINT_2867cf1f7327fd002fccf5d8ded311be+0x18>)
    9616:	60da      	str	r2, [r3, #12]
    9618:	4770      	bx	lr
    961a:	bf00      	nop
    961c:	e000e100 	.word	0xe000e100
    9620:	a801c000 	.word	0xa801c000

00009624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>:
    9624:	4b05      	ldr	r3, [pc, #20]	; (963c <RAILINT_4f93cdd7aecf168775f2a95c9141aec8+0x18>)
    9626:	0102      	lsls	r2, r0, #4
    9628:	4413      	add	r3, r2
    962a:	2201      	movs	r2, #1
    962c:	601a      	str	r2, [r3, #0]
    962e:	f44f 7380 	mov.w	r3, #256	; 0x100
    9632:	fa03 f000 	lsl.w	r0, r3, r0
    9636:	4b02      	ldr	r3, [pc, #8]	; (9640 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8+0x1c>)
    9638:	6658      	str	r0, [r3, #100]	; 0x64
    963a:	4770      	bx	lr
    963c:	a801e100 	.word	0xa801e100
    9640:	a801e000 	.word	0xa801e000

00009644 <RAILINT_bda0c15173302986042c4866e7e8cb7e>:
    9644:	4b03      	ldr	r3, [pc, #12]	; (9654 <RAILINT_bda0c15173302986042c4866e7e8cb7e+0x10>)
    9646:	3010      	adds	r0, #16
    9648:	0100      	lsls	r0, r0, #4
    964a:	5818      	ldr	r0, [r3, r0]
    964c:	f000 0001 	and.w	r0, r0, #1
    9650:	4770      	bx	lr
    9652:	bf00      	nop
    9654:	a801c000 	.word	0xa801c000

00009658 <RAILINT_6fba69fb8464276fb40686c982612f36>:
    9658:	4b04      	ldr	r3, [pc, #16]	; (966c <RAILINT_6fba69fb8464276fb40686c982612f36+0x14>)
    965a:	f001 71f0 	and.w	r1, r1, #31457280	; 0x1e00000
    965e:	3010      	adds	r0, #16
    9660:	f041 0103 	orr.w	r1, r1, #3
    9664:	0100      	lsls	r0, r0, #4
    9666:	5019      	str	r1, [r3, r0]
    9668:	4770      	bx	lr
    966a:	bf00      	nop
    966c:	a801c000 	.word	0xa801c000

00009670 <RAILINT_1619961c7de909eb2db91f9777cf84c9>:
    9670:	b538      	push	{r3, r4, r5, lr}
    9672:	f7fc fd34 	bl	60de <CORE_EnterAtomic>
    9676:	4b08      	ldr	r3, [pc, #32]	; (9698 <RAILINT_1619961c7de909eb2db91f9777cf84c9+0x28>)
    9678:	4a08      	ldr	r2, [pc, #32]	; (969c <RAILINT_1619961c7de909eb2db91f9777cf84c9+0x2c>)
    967a:	6a1d      	ldr	r5, [r3, #32]
    967c:	7d54      	ldrb	r4, [r2, #21]
    967e:	6e5a      	ldr	r2, [r3, #100]	; 0x64
    9680:	b2e4      	uxtb	r4, r4
    9682:	0752      	lsls	r2, r2, #29
    9684:	bf44      	itt	mi
    9686:	6a1d      	ldrmi	r5, [r3, #32]
    9688:	3401      	addmi	r4, #1
    968a:	f7fc fd2c 	bl	60e6 <CORE_ExitAtomic>
    968e:	4628      	mov	r0, r5
    9690:	f004 0103 	and.w	r1, r4, #3
    9694:	bd38      	pop	{r3, r4, r5, pc}
    9696:	bf00      	nop
    9698:	a801c000 	.word	0xa801c000
    969c:	20000e1c 	.word	0x20000e1c

000096a0 <RAILINT_91acd8a0b3b22b251b18aeabdb4a57f7>:
    96a0:	b508      	push	{r3, lr}
    96a2:	2022      	movs	r0, #34	; 0x22
    96a4:	f7ff ff36 	bl	9514 <PTI_AuxdataOutput>
    96a8:	f44f 2280 	mov.w	r2, #262144	; 0x40000
    96ac:	4b01      	ldr	r3, [pc, #4]	; (96b4 <RAILINT_91acd8a0b3b22b251b18aeabdb4a57f7+0x14>)
    96ae:	60da      	str	r2, [r3, #12]
    96b0:	bd08      	pop	{r3, pc}
    96b2:	bf00      	nop
    96b4:	a801c000 	.word	0xa801c000

000096b8 <RAILINT_3d752c35229134eb0acd91db488d7c4c>:
    96b8:	4b06      	ldr	r3, [pc, #24]	; (96d4 <RAILINT_3d752c35229134eb0acd91db488d7c4c+0x1c>)
    96ba:	681b      	ldr	r3, [r3, #0]
    96bc:	4343      	muls	r3, r0
    96be:	eb03 7181 	add.w	r1, r3, r1, lsl #30
    96c2:	4b05      	ldr	r3, [pc, #20]	; (96d8 <RAILINT_3d752c35229134eb0acd91db488d7c4c+0x20>)
    96c4:	681b      	ldr	r3, [r3, #0]
    96c6:	fba3 3000 	umull	r3, r0, r3, r0
    96ca:	f113 4300 	adds.w	r3, r3, #2147483648	; 0x80000000
    96ce:	eb41 0000 	adc.w	r0, r1, r0
    96d2:	4770      	bx	lr
    96d4:	20000da8 	.word	0x20000da8
    96d8:	20000da4 	.word	0x20000da4

000096dc <RAILINT_9eb58bc3bfde122d3a99681151a64444>:
    96dc:	b508      	push	{r3, lr}
    96de:	f7ff ffc7 	bl	9670 <RAILINT_1619961c7de909eb2db91f9777cf84c9>
    96e2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    96e6:	f7ff bfe7 	b.w	96b8 <RAILINT_3d752c35229134eb0acd91db488d7c4c>

000096ea <RAILINT_34bce41ab8660dd545debb2103a67a60>:
    96ea:	b510      	push	{r4, lr}
    96ec:	4604      	mov	r4, r0
    96ee:	f7ff ffbf 	bl	9670 <RAILINT_1619961c7de909eb2db91f9777cf84c9>
    96f2:	4284      	cmp	r4, r0
    96f4:	bf88      	it	hi
    96f6:	f101 31ff 	addhi.w	r1, r1, #4294967295	; 0xffffffff
    96fa:	4620      	mov	r0, r4
    96fc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    9700:	f001 0103 	and.w	r1, r1, #3
    9704:	f7ff bfd8 	b.w	96b8 <RAILINT_3d752c35229134eb0acd91db488d7c4c>

00009708 <RAILINT_91df45e96a2874f76867d6f26ae534a0>:
    9708:	4a0c      	ldr	r2, [pc, #48]	; (973c <RAILINT_91df45e96a2874f76867d6f26ae534a0+0x34>)
    970a:	f020 4340 	bic.w	r3, r0, #3221225472	; 0xc0000000
    970e:	4601      	mov	r1, r0
    9710:	b510      	push	{r4, lr}
    9712:	2000      	movs	r0, #0
    9714:	6814      	ldr	r4, [r2, #0]
    9716:	f04f 4200 	mov.w	r2, #2147483648	; 0x80000000
    971a:	fbe4 2003 	umlal	r2, r0, r4, r3
    971e:	4a08      	ldr	r2, [pc, #32]	; (9740 <RAILINT_91df45e96a2874f76867d6f26ae534a0+0x38>)
    9720:	0f89      	lsrs	r1, r1, #30
    9722:	6812      	ldr	r2, [r2, #0]
    9724:	fb02 0003 	mla	r0, r2, r3, r0
    9728:	4b06      	ldr	r3, [pc, #24]	; (9744 <RAILINT_91df45e96a2874f76867d6f26ae534a0+0x3c>)
    972a:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    972c:	4298      	cmp	r0, r3
    972e:	d904      	bls.n	973a <RAILINT_91df45e96a2874f76867d6f26ae534a0+0x32>
    9730:	3301      	adds	r3, #1
    9732:	3101      	adds	r1, #1
    9734:	1ac0      	subs	r0, r0, r3
    9736:	f001 0103 	and.w	r1, r1, #3
    973a:	bd10      	pop	{r4, pc}
    973c:	20000dac 	.word	0x20000dac
    9740:	20000db0 	.word	0x20000db0
    9744:	a801c000 	.word	0xa801c000

00009748 <RAILINT_880ea347ba5a380aeb65b9c33560ef79>:
    9748:	b538      	push	{r3, r4, r5, lr}
    974a:	4604      	mov	r4, r0
    974c:	f7ff ffc6 	bl	96dc <RAILINT_9eb58bc3bfde122d3a99681151a64444>
    9750:	4605      	mov	r5, r0
    9752:	f7ff ffc3 	bl	96dc <RAILINT_9eb58bc3bfde122d3a99681151a64444>
    9756:	1b43      	subs	r3, r0, r5
    9758:	42a3      	cmp	r3, r4
    975a:	d3fa      	bcc.n	9752 <RAILINT_880ea347ba5a380aeb65b9c33560ef79+0xa>
    975c:	bd38      	pop	{r3, r4, r5, pc}
	...

00009760 <RAILINT_7eef505a2ab2bf9ba8257b9a73e538f4>:
    9760:	b508      	push	{r3, lr}
    9762:	4b06      	ldr	r3, [pc, #24]	; (977c <RAILINT_7eef505a2ab2bf9ba8257b9a73e538f4+0x1c>)
    9764:	f04f 4030 	mov.w	r0, #2952790016	; 0xb0000000
    9768:	681a      	ldr	r2, [r3, #0]
    976a:	4905      	ldr	r1, [pc, #20]	; (9780 <RAILINT_7eef505a2ab2bf9ba8257b9a73e538f4+0x20>)
    976c:	0092      	lsls	r2, r2, #2
    976e:	f002 f9d5 	bl	bb1c <memcpy>
    9772:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    9776:	f000 beab 	b.w	a4d0 <RAILINT_9743c96ef075be688881e5d1e5667476>
    977a:	bf00      	nop
    977c:	0000d820 	.word	0x0000d820
    9780:	0000bf40 	.word	0x0000bf40

00009784 <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f>:
    9784:	b570      	push	{r4, r5, r6, lr}
    9786:	680c      	ldr	r4, [r1, #0]
    9788:	1c65      	adds	r5, r4, #1
    978a:	d103      	bne.n	9794 <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f+0x10>
    978c:	2300      	movs	r3, #0
    978e:	6003      	str	r3, [r0, #0]
    9790:	2301      	movs	r3, #1
    9792:	e013      	b.n	97bc <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f+0x38>
    9794:	f3c4 6602 	ubfx	r6, r4, #24, #3
    9798:	429e      	cmp	r6, r3
    979a:	f3c4 4507 	ubfx	r5, r4, #16, #8
    979e:	d10f      	bne.n	97c0 <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f+0x3c>
    97a0:	b2a4      	uxth	r4, r4
    97a2:	4294      	cmp	r4, r2
    97a4:	d80c      	bhi.n	97c0 <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f+0x3c>
    97a6:	eb04 0685 	add.w	r6, r4, r5, lsl #2
    97aa:	42b2      	cmp	r2, r6
    97ac:	d208      	bcs.n	97c0 <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f+0x3c>
    97ae:	1b13      	subs	r3, r2, r4
    97b0:	f023 0303 	bic.w	r3, r3, #3
    97b4:	18ca      	adds	r2, r1, r3
    97b6:	6853      	ldr	r3, [r2, #4]
    97b8:	6003      	str	r3, [r0, #0]
    97ba:	2300      	movs	r3, #0
    97bc:	7103      	strb	r3, [r0, #4]
    97be:	bd70      	pop	{r4, r5, r6, pc}
    97c0:	3501      	adds	r5, #1
    97c2:	eb01 0185 	add.w	r1, r1, r5, lsl #2
    97c6:	e7de      	b.n	9786 <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f+0x2>

000097c8 <RAILINT_3d92125e045a72c8ec8f5b006f79d436>:
    97c8:	4b04      	ldr	r3, [pc, #16]	; (97dc <RAILINT_3d92125e045a72c8ec8f5b006f79d436+0x14>)
    97ca:	f3c0 6201 	ubfx	r2, r0, #24, #2
    97ce:	f833 3012 	ldrh.w	r3, [r3, r2, lsl #1]
    97d2:	b280      	uxth	r0, r0
    97d4:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
    97d8:	4770      	bx	lr
    97da:	bf00      	nop
    97dc:	0000bf30 	.word	0x0000bf30

000097e0 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee>:
    97e0:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
    97e2:	460c      	mov	r4, r1
    97e4:	b28a      	uxth	r2, r1
    97e6:	0c09      	lsrs	r1, r1, #16
    97e8:	f5b1 4f28 	cmp.w	r1, #43008	; 0xa800
    97ec:	4606      	mov	r6, r0
    97ee:	460b      	mov	r3, r1
    97f0:	d012      	beq.n	9818 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x38>
    97f2:	f64a 0001 	movw	r0, #43009	; 0xa801
    97f6:	4281      	cmp	r1, r0
    97f8:	d010      	beq.n	981c <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x3c>
    97fa:	f64a 0102 	movw	r1, #43010	; 0xa802
    97fe:	428b      	cmp	r3, r1
    9800:	d00e      	beq.n	9820 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x40>
    9802:	f5b3 4f30 	cmp.w	r3, #45056	; 0xb000
    9806:	bf0c      	ite	eq
    9808:	2503      	moveq	r5, #3
    980a:	2504      	movne	r5, #4
    980c:	6f73      	ldr	r3, [r6, #116]	; 0x74
    980e:	b94b      	cbnz	r3, 9824 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x44>
    9810:	6f33      	ldr	r3, [r6, #112]	; 0x70
    9812:	b9bb      	cbnz	r3, 9844 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x64>
    9814:	6820      	ldr	r0, [r4, #0]
    9816:	e013      	b.n	9840 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x60>
    9818:	2500      	movs	r5, #0
    981a:	e7f7      	b.n	980c <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x2c>
    981c:	2501      	movs	r5, #1
    981e:	e7f5      	b.n	980c <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x2c>
    9820:	2502      	movs	r5, #2
    9822:	e7f3      	b.n	980c <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x2c>
    9824:	6819      	ldr	r1, [r3, #0]
    9826:	2900      	cmp	r1, #0
    9828:	d0f2      	beq.n	9810 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x30>
    982a:	462b      	mov	r3, r5
    982c:	a802      	add	r0, sp, #8
    982e:	9201      	str	r2, [sp, #4]
    9830:	f7ff ffa8 	bl	9784 <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f>
    9834:	f89d 300c 	ldrb.w	r3, [sp, #12]
    9838:	9802      	ldr	r0, [sp, #8]
    983a:	9a01      	ldr	r2, [sp, #4]
    983c:	2b00      	cmp	r3, #0
    983e:	d1e7      	bne.n	9810 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x30>
    9840:	b004      	add	sp, #16
    9842:	bd70      	pop	{r4, r5, r6, pc}
    9844:	6819      	ldr	r1, [r3, #0]
    9846:	2900      	cmp	r1, #0
    9848:	d0e4      	beq.n	9814 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x34>
    984a:	462b      	mov	r3, r5
    984c:	a802      	add	r0, sp, #8
    984e:	f7ff ff99 	bl	9784 <RAILINT_2e07a6872d92c4b3e3c2fd6af0b0470f>
    9852:	f89d 300c 	ldrb.w	r3, [sp, #12]
    9856:	9802      	ldr	r0, [sp, #8]
    9858:	2b00      	cmp	r3, #0
    985a:	d1db      	bne.n	9814 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x34>
    985c:	e7f0      	b.n	9840 <RAILINT_c174cd7e27ebfe1b2de47ff269c167ee+0x60>
	...

00009860 <RAILINT_2d55024751d647dfef36f5f548d0f2cb>:
    9860:	b507      	push	{r0, r1, r2, lr}
    9862:	a801      	add	r0, sp, #4
    9864:	f7fc fd36 	bl	62d4 <SYSTEM_ChipRevisionGet>
    9868:	2248      	movs	r2, #72	; 0x48
    986a:	4b07      	ldr	r3, [pc, #28]	; (9888 <RAILINT_2d55024751d647dfef36f5f548d0f2cb+0x28>)
    986c:	655a      	str	r2, [r3, #84]	; 0x54
    986e:	4a07      	ldr	r2, [pc, #28]	; (988c <RAILINT_2d55024751d647dfef36f5f548d0f2cb+0x2c>)
    9870:	f8d2 30d4 	ldr.w	r3, [r2, #212]	; 0xd4
    9874:	f423 33fc 	bic.w	r3, r3, #129024	; 0x1f800
    9878:	f8c2 30d4 	str.w	r3, [r2, #212]	; 0xd4
    987c:	4b04      	ldr	r3, [pc, #16]	; (9890 <RAILINT_2d55024751d647dfef36f5f548d0f2cb+0x30>)
    987e:	681b      	ldr	r3, [r3, #0]
    9880:	b003      	add	sp, #12
    9882:	f85d fb04 	ldr.w	pc, [sp], #4
    9886:	bf00      	nop
    9888:	a8018000 	.word	0xa8018000
    988c:	a8020000 	.word	0xa8020000
    9890:	b0002000 	.word	0xb0002000

00009894 <RAILINT_0a958662e0f9b48ba3742030a3e4e70c>:
    9894:	2200      	movs	r2, #0
    9896:	2101      	movs	r1, #1
    9898:	4b0c      	ldr	r3, [pc, #48]	; (98cc <RAILINT_0a958662e0f9b48ba3742030a3e4e70c+0x38>)
    989a:	b510      	push	{r4, lr}
    989c:	671a      	str	r2, [r3, #112]	; 0x70
    989e:	675a      	str	r2, [r3, #116]	; 0x74
    98a0:	679a      	str	r2, [r3, #120]	; 0x78
    98a2:	4a0b      	ldr	r2, [pc, #44]	; (98d0 <RAILINT_0a958662e0f9b48ba3742030a3e4e70c+0x3c>)
    98a4:	6151      	str	r1, [r2, #20]
    98a6:	68da      	ldr	r2, [r3, #12]
    98a8:	f012 6f70 	tst.w	r2, #251658240	; 0xf000000
    98ac:	d1fb      	bne.n	98a6 <RAILINT_0a958662e0f9b48ba3742030a3e4e70c+0x12>
    98ae:	f04f 4230 	mov.w	r2, #2952790016	; 0xb0000000
    98b2:	2401      	movs	r4, #1
    98b4:	665a      	str	r2, [r3, #100]	; 0x64
    98b6:	f502 52fc 	add.w	r2, r2, #8064	; 0x1f80
    98ba:	3214      	adds	r2, #20
    98bc:	669c      	str	r4, [r3, #104]	; 0x68
    98be:	64da      	str	r2, [r3, #76]	; 0x4c
    98c0:	4b04      	ldr	r3, [pc, #16]	; (98d4 <RAILINT_0a958662e0f9b48ba3742030a3e4e70c+0x40>)
    98c2:	681b      	ldr	r3, [r3, #0]
    98c4:	4798      	blx	r3
    98c6:	4b04      	ldr	r3, [pc, #16]	; (98d8 <RAILINT_0a958662e0f9b48ba3742030a3e4e70c+0x44>)
    98c8:	615c      	str	r4, [r3, #20]
    98ca:	bd10      	pop	{r4, pc}
    98cc:	a8020000 	.word	0xa8020000
    98d0:	a8021000 	.word	0xa8021000
    98d4:	200001fc 	.word	0x200001fc
    98d8:	a8022000 	.word	0xa8022000

000098dc <RAILINT_ff78d9bb4bfe772063473783474f9dc5>:
    98dc:	2301      	movs	r3, #1
    98de:	4a0f      	ldr	r2, [pc, #60]	; (991c <RAILINT_ff78d9bb4bfe772063473783474f9dc5+0x40>)
    98e0:	490f      	ldr	r1, [pc, #60]	; (9920 <RAILINT_ff78d9bb4bfe772063473783474f9dc5+0x44>)
    98e2:	f8c2 3280 	str.w	r3, [r2, #640]	; 0x280
    98e6:	6a8a      	ldr	r2, [r1, #40]	; 0x28
    98e8:	f022 0202 	bic.w	r2, r2, #2
    98ec:	628a      	str	r2, [r1, #40]	; 0x28
    98ee:	4a0d      	ldr	r2, [pc, #52]	; (9924 <RAILINT_ff78d9bb4bfe772063473783474f9dc5+0x48>)
    98f0:	6053      	str	r3, [r2, #4]
    98f2:	4a0d      	ldr	r2, [pc, #52]	; (9928 <RAILINT_ff78d9bb4bfe772063473783474f9dc5+0x4c>)
    98f4:	6053      	str	r3, [r2, #4]
    98f6:	4a0d      	ldr	r2, [pc, #52]	; (992c <RAILINT_ff78d9bb4bfe772063473783474f9dc5+0x50>)
    98f8:	6053      	str	r3, [r2, #4]
    98fa:	f5a2 4280 	sub.w	r2, r2, #16384	; 0x4000
    98fe:	6053      	str	r3, [r2, #4]
    9900:	f5a2 4240 	sub.w	r2, r2, #49152	; 0xc000
    9904:	6053      	str	r3, [r2, #4]
    9906:	f502 32c0 	add.w	r2, r2, #98304	; 0x18000
    990a:	6053      	str	r3, [r2, #4]
    990c:	f502 4280 	add.w	r2, r2, #16384	; 0x4000
    9910:	6053      	str	r3, [r2, #4]
    9912:	f5a2 4200 	sub.w	r2, r2, #32768	; 0x8000
    9916:	6053      	str	r3, [r2, #4]
    9918:	4770      	bx	lr
    991a:	bf00      	nop
    991c:	40008000 	.word	0x40008000
    9920:	4000c000 	.word	0x4000c000
    9924:	a800c000 	.word	0xa800c000
    9928:	44004000 	.word	0x44004000
    992c:	a8014000 	.word	0xa8014000

00009930 <RAILINT_83b3e2e99c8f4d3fd0b62943447c7cff>:
    9930:	b508      	push	{r3, lr}
    9932:	f7ff ffd3 	bl	98dc <RAILINT_ff78d9bb4bfe772063473783474f9dc5>
    9936:	f7ff ff93 	bl	9860 <RAILINT_2d55024751d647dfef36f5f548d0f2cb>
    993a:	2203      	movs	r2, #3
    993c:	4b0a      	ldr	r3, [pc, #40]	; (9968 <RAILINT_83b3e2e99c8f4d3fd0b62943447c7cff+0x38>)
    993e:	f8c3 20e0 	str.w	r2, [r3, #224]	; 0xe0
    9942:	4a0a      	ldr	r2, [pc, #40]	; (996c <RAILINT_83b3e2e99c8f4d3fd0b62943447c7cff+0x3c>)
    9944:	f503 4330 	add.w	r3, r3, #45056	; 0xb000
    9948:	67da      	str	r2, [r3, #124]	; 0x7c
    994a:	2201      	movs	r2, #1
    994c:	f503 5380 	add.w	r3, r3, #4096	; 0x1000
    9950:	67da      	str	r2, [r3, #124]	; 0x7c
    9952:	f44f 7260 	mov.w	r2, #896	; 0x380
    9956:	615a      	str	r2, [r3, #20]
    9958:	f44f 7200 	mov.w	r2, #512	; 0x200
    995c:	67da      	str	r2, [r3, #124]	; 0x7c
    995e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    9962:	f7fe beed 	b.w	8740 <RAILINT_7c4474e9c252fd93501bbf7d6298f3d3>
    9966:	bf00      	nop
    9968:	a8015000 	.word	0xa8015000
    996c:	00f00800 	.word	0x00f00800

00009970 <RAILINT_56a75a549239881c0b0573168dc43aff>:
    9970:	f7fc beaa 	b.w	66c8 <SystemHFXOClockGet>

00009974 <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a>:
    9974:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9978:	4604      	mov	r4, r0
    997a:	b085      	sub	sp, #20
    997c:	9000      	str	r0, [sp, #0]
    997e:	460e      	mov	r6, r1
    9980:	f856 5b04 	ldr.w	r5, [r6], #4
    9984:	1c6b      	adds	r3, r5, #1
    9986:	d106      	bne.n	9996 <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0x22>
    9988:	9b00      	ldr	r3, [sp, #0]
    998a:	6025      	str	r5, [r4, #0]
    998c:	1ae0      	subs	r0, r4, r3
    998e:	1080      	asrs	r0, r0, #2
    9990:	b005      	add	sp, #20
    9992:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9996:	ea5f 7b15 	movs.w	fp, r5, lsr #28
    999a:	bf18      	it	ne
    999c:	2101      	movne	r1, #1
    999e:	4628      	mov	r0, r5
    99a0:	bf08      	it	eq
    99a2:	f3c5 4107 	ubfxeq	r1, r5, #16, #8
    99a6:	f7ff ff0f 	bl	97c8 <RAILINT_3d92125e045a72c8ec8f5b006f79d436>
    99aa:	ea4f 09c1 	mov.w	r9, r1, lsl #3
    99ae:	4b2b      	ldr	r3, [pc, #172]	; (9a5c <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0xe8>)
    99b0:	f109 0204 	add.w	r2, r9, #4
    99b4:	4422      	add	r2, r4
    99b6:	429a      	cmp	r2, r3
    99b8:	4680      	mov	r8, r0
    99ba:	d218      	bcs.n	99ee <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0x7a>
    99bc:	f3c5 6201 	ubfx	r2, r5, #24, #2
    99c0:	2507      	movs	r5, #7
    99c2:	46b2      	mov	sl, r6
    99c4:	008b      	lsls	r3, r1, #2
    99c6:	9301      	str	r3, [sp, #4]
    99c8:	eb08 0381 	add.w	r3, r8, r1, lsl #2
    99cc:	40d5      	lsrs	r5, r2
    99ce:	9302      	str	r3, [sp, #8]
    99d0:	f10b 33ff 	add.w	r3, fp, #4294967295	; 0xffffffff
    99d4:	f005 0501 	and.w	r5, r5, #1
    99d8:	f104 0708 	add.w	r7, r4, #8
    99dc:	9303      	str	r3, [sp, #12]
    99de:	9b02      	ldr	r3, [sp, #8]
    99e0:	4598      	cmp	r8, r3
    99e2:	d109      	bne.n	99f8 <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0x84>
    99e4:	9b01      	ldr	r3, [sp, #4]
    99e6:	444c      	add	r4, r9
    99e8:	4433      	add	r3, r6
    99ea:	4619      	mov	r1, r3
    99ec:	e7c7      	b.n	997e <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0xa>
    99ee:	4b1b      	ldr	r3, [pc, #108]	; (9a5c <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0xe8>)
    99f0:	429c      	cmp	r4, r3
    99f2:	d8e3      	bhi.n	99bc <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0x48>
    99f4:	2000      	movs	r0, #0
    99f6:	e7cb      	b.n	9990 <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0x1c>
    99f8:	9b03      	ldr	r3, [sp, #12]
    99fa:	2b06      	cmp	r3, #6
    99fc:	d80b      	bhi.n	9a16 <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0xa2>
    99fe:	e8df f003 	tbb	[pc, r3]
    9a02:	0423      	.short	0x0423
    9a04:	230c040c 	.word	0x230c040c
    9a08:	04          	.byte	0x04
    9a09:	00          	.byte	0x00
    9a0a:	f240 42a7 	movw	r2, #1191	; 0x4a7
    9a0e:	2132      	movs	r1, #50	; 0x32
    9a10:	2000      	movs	r0, #0
    9a12:	f7fd fb91 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    9a16:	2200      	movs	r2, #0
    9a18:	e007      	b.n	9a2a <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0xb6>
    9a1a:	f240 42ac 	movw	r2, #1196	; 0x4ac
    9a1e:	2132      	movs	r1, #50	; 0x32
    9a20:	4628      	mov	r0, r5
    9a22:	f7fd fb89 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    9a26:	f44f 5280 	mov.w	r2, #4096	; 0x1000
    9a2a:	4442      	add	r2, r8
    9a2c:	f847 2c08 	str.w	r2, [r7, #-8]
    9a30:	f85a 2b04 	ldr.w	r2, [sl], #4
    9a34:	f1bb 0f01 	cmp.w	fp, #1
    9a38:	bf08      	it	eq
    9a3a:	43d2      	mvneq	r2, r2
    9a3c:	f108 0804 	add.w	r8, r8, #4
    9a40:	f847 2c04 	str.w	r2, [r7, #-4]
    9a44:	3708      	adds	r7, #8
    9a46:	e7ca      	b.n	99de <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0x6a>
    9a48:	f240 42b5 	movw	r2, #1205	; 0x4b5
    9a4c:	2132      	movs	r1, #50	; 0x32
    9a4e:	4628      	mov	r0, r5
    9a50:	f7fd fb72 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    9a54:	f44f 5200 	mov.w	r2, #8192	; 0x2000
    9a58:	e7e7      	b.n	9a2a <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a+0xb6>
    9a5a:	bf00      	nop
    9a5c:	b0003000 	.word	0xb0003000

00009a60 <RAILINT_171f424fc160b143d72e8b724c33f1c6>:
    9a60:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    9a64:	4605      	mov	r5, r0
    9a66:	b310      	cbz	r0, 9aae <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x4e>
    9a68:	2400      	movs	r4, #0
    9a6a:	4a17      	ldr	r2, [pc, #92]	; (9ac8 <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x68>)
    9a6c:	4917      	ldr	r1, [pc, #92]	; (9acc <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x6c>)
    9a6e:	4626      	mov	r6, r4
    9a70:	4690      	mov	r8, r2
    9a72:	460f      	mov	r7, r1
    9a74:	f852 3b04 	ldr.w	r3, [r2], #4
    9a78:	b9db      	cbnz	r3, 9ab2 <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x52>
    9a7a:	00b0      	lsls	r0, r6, #2
    9a7c:	f100 4030 	add.w	r0, r0, #2952790016	; 0xb0000000
    9a80:	4629      	mov	r1, r5
    9a82:	f500 5001 	add.w	r0, r0, #8256	; 0x2040
    9a86:	f7ff ff75 	bl	9974 <RAILINT_0db83bf7a6ec6ad175f2b3bb6bb8465a>
    9a8a:	4603      	mov	r3, r0
    9a8c:	b948      	cbnz	r0, 9aa2 <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x42>
    9a8e:	f240 521f 	movw	r2, #1311	; 0x51f
    9a92:	2136      	movs	r1, #54	; 0x36
    9a94:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    9a98:	f7fd bb4e 	b.w	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    9a9c:	f831 6b02 	ldrh.w	r6, [r1], #2
    9aa0:	e7e8      	b.n	9a74 <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x14>
    9aa2:	4433      	add	r3, r6
    9aa4:	3301      	adds	r3, #1
    9aa6:	f848 5024 	str.w	r5, [r8, r4, lsl #2]
    9aaa:	f827 3014 	strh.w	r3, [r7, r4, lsl #1]
    9aae:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    9ab2:	42ab      	cmp	r3, r5
    9ab4:	d0fb      	beq.n	9aae <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x4e>
    9ab6:	3401      	adds	r4, #1
    9ab8:	2c0c      	cmp	r4, #12
    9aba:	d1ef      	bne.n	9a9c <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x3c>
    9abc:	f240 522d 	movw	r2, #1325	; 0x52d
    9ac0:	2136      	movs	r1, #54	; 0x36
    9ac2:	2000      	movs	r0, #0
    9ac4:	e7e6      	b.n	9a94 <RAILINT_171f424fc160b143d72e8b724c33f1c6+0x34>
    9ac6:	bf00      	nop
    9ac8:	20000db4 	.word	0x20000db4
    9acc:	20000de4 	.word	0x20000de4

00009ad0 <RAILINT_cd65c06e3b1af867d6257be45870f13b>:
    9ad0:	b570      	push	{r4, r5, r6, lr}
    9ad2:	4604      	mov	r4, r0
    9ad4:	b1b8      	cbz	r0, 9b06 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x36>
    9ad6:	b1e9      	cbz	r1, 9b14 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x44>
    9ad8:	2200      	movs	r2, #0
    9ada:	4613      	mov	r3, r2
    9adc:	492c      	ldr	r1, [pc, #176]	; (9b90 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0xc0>)
    9ade:	482d      	ldr	r0, [pc, #180]	; (9b94 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0xc4>)
    9ae0:	f851 5b04 	ldr.w	r5, [r1], #4
    9ae4:	42a5      	cmp	r5, r4
    9ae6:	d112      	bne.n	9b0e <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x3e>
    9ae8:	492b      	ldr	r1, [pc, #172]	; (9b98 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0xc8>)
    9aea:	688a      	ldr	r2, [r1, #8]
    9aec:	0692      	lsls	r2, r2, #26
    9aee:	d4fc      	bmi.n	9aea <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x1a>
    9af0:	009b      	lsls	r3, r3, #2
    9af2:	4a2a      	ldr	r2, [pc, #168]	; (9b9c <RAILINT_cd65c06e3b1af867d6257be45870f13b+0xcc>)
    9af4:	f103 4330 	add.w	r3, r3, #2952790016	; 0xb0000000
    9af8:	f503 5301 	add.w	r3, r3, #8256	; 0x2040
    9afc:	f8c2 30a8 	str.w	r3, [r2, #168]	; 0xa8
    9b00:	2220      	movs	r2, #32
    9b02:	4b27      	ldr	r3, [pc, #156]	; (9ba0 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0xd0>)
    9b04:	609a      	str	r2, [r3, #8]
    9b06:	bd70      	pop	{r4, r5, r6, pc}
    9b08:	f830 3b02 	ldrh.w	r3, [r0], #2
    9b0c:	e7e8      	b.n	9ae0 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x10>
    9b0e:	3201      	adds	r2, #1
    9b10:	2a0c      	cmp	r2, #12
    9b12:	d1f9      	bne.n	9b08 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x38>
    9b14:	2501      	movs	r5, #1
    9b16:	e017      	b.n	9b48 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x78>
    9b18:	f843 0b04 	str.w	r0, [r3], #4
    9b1c:	e024      	b.n	9b68 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x98>
    9b1e:	0f09      	lsrs	r1, r1, #28
    9b20:	6860      	ldr	r0, [r4, #4]
    9b22:	3408      	adds	r4, #8
    9b24:	2907      	cmp	r1, #7
    9b26:	d80f      	bhi.n	9b48 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x78>
    9b28:	e8df f001 	tbb	[pc, r1]
    9b2c:	2708040a 	.word	0x2708040a
    9b30:	2d2a250c 	.word	0x2d2a250c
    9b34:	43c0      	mvns	r0, r0
    9b36:	f503 5300 	add.w	r3, r3, #8192	; 0x2000
    9b3a:	e001      	b.n	9b40 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x70>
    9b3c:	681a      	ldr	r2, [r3, #0]
    9b3e:	4050      	eors	r0, r2
    9b40:	6018      	str	r0, [r3, #0]
    9b42:	e001      	b.n	9b48 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x78>
    9b44:	f7ff fe00 	bl	9748 <RAILINT_880ea347ba5a380aeb65b9c33560ef79>
    9b48:	6821      	ldr	r1, [r4, #0]
    9b4a:	1c4b      	adds	r3, r1, #1
    9b4c:	d0db      	beq.n	9b06 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x36>
    9b4e:	4608      	mov	r0, r1
    9b50:	f7ff fe3a 	bl	97c8 <RAILINT_3d92125e045a72c8ec8f5b006f79d436>
    9b54:	0c0e      	lsrs	r6, r1, #16
    9b56:	f016 0ffe 	tst.w	r6, #254	; 0xfe
    9b5a:	4603      	mov	r3, r0
    9b5c:	d0df      	beq.n	9b1e <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x4e>
    9b5e:	4621      	mov	r1, r4
    9b60:	b2f6      	uxtb	r6, r6
    9b62:	00b2      	lsls	r2, r6, #2
    9b64:	eb00 0686 	add.w	r6, r0, r6, lsl #2
    9b68:	42b3      	cmp	r3, r6
    9b6a:	f851 0f04 	ldr.w	r0, [r1, #4]!
    9b6e:	d1d3      	bne.n	9b18 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x48>
    9b70:	1d13      	adds	r3, r2, #4
    9b72:	441c      	add	r4, r3
    9b74:	e7e8      	b.n	9b48 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x78>
    9b76:	fa05 f000 	lsl.w	r0, r5, r0
    9b7a:	f503 5380 	add.w	r3, r3, #4096	; 0x1000
    9b7e:	e7df      	b.n	9b40 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x70>
    9b80:	fa05 f000 	lsl.w	r0, r5, r0
    9b84:	e7d7      	b.n	9b36 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x66>
    9b86:	681a      	ldr	r2, [r3, #0]
    9b88:	ea30 0202 	bics.w	r2, r0, r2
    9b8c:	d1fb      	bne.n	9b86 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0xb6>
    9b8e:	e7db      	b.n	9b48 <RAILINT_cd65c06e3b1af867d6257be45870f13b+0x78>
    9b90:	20000db4 	.word	0x20000db4
    9b94:	20000de4 	.word	0x20000de4
    9b98:	a8020000 	.word	0xa8020000
    9b9c:	b0001e00 	.word	0xb0001e00
    9ba0:	a8021000 	.word	0xa8021000

00009ba4 <RAILINT_85395b01c0ad26d73deed4fa79fbb56f>:
    9ba4:	b508      	push	{r3, lr}
    9ba6:	f7fc fd8f 	bl	66c8 <SystemHFXOClockGet>
    9baa:	4b06      	ldr	r3, [pc, #24]	; (9bc4 <RAILINT_85395b01c0ad26d73deed4fa79fbb56f+0x20>)
    9bac:	4602      	mov	r2, r0
    9bae:	6d9b      	ldr	r3, [r3, #88]	; 0x58
    9bb0:	b298      	uxth	r0, r3
    9bb2:	b128      	cbz	r0, 9bc0 <RAILINT_85395b01c0ad26d73deed4fa79fbb56f+0x1c>
    9bb4:	f3c3 4307 	ubfx	r3, r3, #16, #8
    9bb8:	08d2      	lsrs	r2, r2, #3
    9bba:	4353      	muls	r3, r2
    9bbc:	fbb3 f0f0 	udiv	r0, r3, r0
    9bc0:	bd08      	pop	{r3, pc}
    9bc2:	bf00      	nop
    9bc4:	a8014000 	.word	0xa8014000

00009bc8 <RAILINT_98702195dd5df205b66d73f7f1b701b5>:
    9bc8:	4b06      	ldr	r3, [pc, #24]	; (9be4 <RAILINT_98702195dd5df205b66d73f7f1b701b5+0x1c>)
    9bca:	68db      	ldr	r3, [r3, #12]
    9bcc:	f3c3 6303 	ubfx	r3, r3, #24, #4
    9bd0:	4298      	cmp	r0, r3
    9bd2:	d106      	bne.n	9be2 <RAILINT_98702195dd5df205b66d73f7f1b701b5+0x1a>
    9bd4:	4804      	ldr	r0, [pc, #16]	; (9be8 <RAILINT_98702195dd5df205b66d73f7f1b701b5+0x20>)
    9bd6:	6ac3      	ldr	r3, [r0, #44]	; 0x2c
    9bd8:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
    9bdc:	ea42 1201 	orr.w	r2, r2, r1, lsl #4
    9be0:	62c2      	str	r2, [r0, #44]	; 0x2c
    9be2:	4770      	bx	lr
    9be4:	a8020000 	.word	0xa8020000
    9be8:	b0001f00 	.word	0xb0001f00

00009bec <RAILINT_1bc89bb9191442fba8e0eefadd7115db>:
    9bec:	b510      	push	{r4, lr}
    9bee:	4604      	mov	r4, r0
    9bf0:	f7ff ffd8 	bl	9ba4 <RAILINT_85395b01c0ad26d73deed4fa79fbb56f>
    9bf4:	4a0f      	ldr	r2, [pc, #60]	; (9c34 <RAILINT_1bc89bb9191442fba8e0eefadd7115db+0x48>)
    9bf6:	f8d2 3138 	ldr.w	r3, [r2, #312]	; 0x138
    9bfa:	041b      	lsls	r3, r3, #16
    9bfc:	4b0e      	ldr	r3, [pc, #56]	; (9c38 <RAILINT_1bc89bb9191442fba8e0eefadd7115db+0x4c>)
    9bfe:	bf48      	it	mi
    9c00:	0840      	lsrmi	r0, r0, #1
    9c02:	6c9b      	ldr	r3, [r3, #72]	; 0x48
    9c04:	f403 53c0 	and.w	r3, r3, #6144	; 0x1800
    9c08:	f5b3 5f80 	cmp.w	r3, #4096	; 0x1000
    9c0c:	bf0a      	itet	eq
    9c0e:	6b93      	ldreq	r3, [r2, #56]	; 0x38
    9c10:	f3c4 1301 	ubfxne	r3, r4, #4, #2
    9c14:	f3c3 6341 	ubfxeq	r3, r3, #25, #2
    9c18:	2b01      	cmp	r3, #1
    9c1a:	d002      	beq.n	9c22 <RAILINT_1bc89bb9191442fba8e0eefadd7115db+0x36>
    9c1c:	2b02      	cmp	r3, #2
    9c1e:	d002      	beq.n	9c26 <RAILINT_1bc89bb9191442fba8e0eefadd7115db+0x3a>
    9c20:	bd10      	pop	{r4, pc}
    9c22:	0840      	lsrs	r0, r0, #1
    9c24:	e7fc      	b.n	9c20 <RAILINT_1bc89bb9191442fba8e0eefadd7115db+0x34>
    9c26:	f3c4 24c4 	ubfx	r4, r4, #11, #5
    9c2a:	3401      	adds	r4, #1
    9c2c:	fbb0 f0f4 	udiv	r0, r0, r4
    9c30:	e7f6      	b.n	9c20 <RAILINT_1bc89bb9191442fba8e0eefadd7115db+0x34>
    9c32:	bf00      	nop
    9c34:	a8014000 	.word	0xa8014000
    9c38:	a8004000 	.word	0xa8004000

00009c3c <RAILINT_3d99cbb66750f16ad038aa09d2dbf23c>:
    9c3c:	f000 0330 	and.w	r3, r0, #48	; 0x30
    9c40:	2b20      	cmp	r3, #32
    9c42:	b510      	push	{r4, lr}
    9c44:	d113      	bne.n	9c6e <RAILINT_3d99cbb66750f16ad038aa09d2dbf23c+0x32>
    9c46:	f410 2fe0 	tst.w	r0, #458752	; 0x70000
    9c4a:	f3c0 4302 	ubfx	r3, r0, #16, #3
    9c4e:	bf1c      	itt	ne
    9c50:	f3c0 22c4 	ubfxne	r2, r0, #11, #5
    9c54:	fbb2 f3f3 	udivne	r3, r2, r3
    9c58:	f410 1fc0 	tst.w	r0, #1572864	; 0x180000
    9c5c:	bf18      	it	ne
    9c5e:	005b      	lslne	r3, r3, #1
    9c60:	2b05      	cmp	r3, #5
    9c62:	d80d      	bhi.n	9c80 <RAILINT_3d99cbb66750f16ad038aa09d2dbf23c+0x44>
    9c64:	085c      	lsrs	r4, r3, #1
    9c66:	f7ff ffc1 	bl	9bec <RAILINT_1bc89bb9191442fba8e0eefadd7115db>
    9c6a:	4360      	muls	r0, r4
    9c6c:	bd10      	pop	{r4, pc}
    9c6e:	f3c0 1382 	ubfx	r3, r0, #6, #3
    9c72:	2b01      	cmp	r3, #1
    9c74:	d006      	beq.n	9c84 <RAILINT_3d99cbb66750f16ad038aa09d2dbf23c+0x48>
    9c76:	2b04      	cmp	r3, #4
    9c78:	bf14      	ite	ne
    9c7a:	2401      	movne	r4, #1
    9c7c:	2402      	moveq	r4, #2
    9c7e:	e7f2      	b.n	9c66 <RAILINT_3d99cbb66750f16ad038aa09d2dbf23c+0x2a>
    9c80:	2404      	movs	r4, #4
    9c82:	e7f0      	b.n	9c66 <RAILINT_3d99cbb66750f16ad038aa09d2dbf23c+0x2a>
    9c84:	2402      	movs	r4, #2
    9c86:	e7ee      	b.n	9c66 <RAILINT_3d99cbb66750f16ad038aa09d2dbf23c+0x2a>

00009c88 <RAILINT_0f8f345c59ce02114959a6bf3fac0981>:
    9c88:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9c8c:	4605      	mov	r5, r0
    9c8e:	f7ff fd25 	bl	96dc <RAILINT_9eb58bc3bfde122d3a99681151a64444>
    9c92:	2600      	movs	r6, #0
    9c94:	4680      	mov	r8, r0
    9c96:	f8df b09c 	ldr.w	fp, [pc, #156]	; 9d34 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0xac>
    9c9a:	f7fc fa17 	bl	60cc <CORE_EnterCritical>
    9c9e:	4b22      	ldr	r3, [pc, #136]	; (9d28 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0xa0>)
    9ca0:	4682      	mov	sl, r0
    9ca2:	68d9      	ldr	r1, [r3, #12]
    9ca4:	f3c1 6303 	ubfx	r3, r1, #24, #4
    9ca8:	1e9f      	subs	r7, r3, #2
    9caa:	2b01      	cmp	r3, #1
    9cac:	b2ff      	uxtb	r7, r7
    9cae:	d028      	beq.n	9d02 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x7a>
    9cb0:	2b05      	cmp	r3, #5
    9cb2:	d028      	beq.n	9d06 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x7e>
    9cb4:	f1a3 010b 	sub.w	r1, r3, #11
    9cb8:	f1d1 0900 	rsbs	r9, r1, #0
    9cbc:	eb49 0901 	adc.w	r9, r9, r1
    9cc0:	2f01      	cmp	r7, #1
    9cc2:	d822      	bhi.n	9d0a <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x82>
    9cc4:	4b19      	ldr	r3, [pc, #100]	; (9d2c <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0xa4>)
    9cc6:	6919      	ldr	r1, [r3, #16]
    9cc8:	f3c1 1489 	ubfx	r4, r1, #6, #10
    9ccc:	040a      	lsls	r2, r1, #16
    9cce:	bf48      	it	mi
    9cd0:	ea44 040b 	orrmi.w	r4, r4, fp
    9cd4:	b224      	sxth	r4, r4
    9cd6:	1c6b      	adds	r3, r5, #1
    9cd8:	d003      	beq.n	9ce2 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x5a>
    9cda:	f7ff fcff 	bl	96dc <RAILINT_9eb58bc3bfde122d3a99681151a64444>
    9cde:	eba0 0608 	sub.w	r6, r0, r8
    9ce2:	4650      	mov	r0, sl
    9ce4:	f7fc f9f6 	bl	60d4 <CORE_ExitCritical>
    9ce8:	f514 7f00 	cmn.w	r4, #512	; 0x200
    9cec:	d114      	bne.n	9d18 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x90>
    9cee:	2f01      	cmp	r7, #1
    9cf0:	d902      	bls.n	9cf8 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x70>
    9cf2:	f1b9 0f00 	cmp.w	r9, #0
    9cf6:	d001      	beq.n	9cfc <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x74>
    9cf8:	42ae      	cmp	r6, r5
    9cfa:	d3ce      	bcc.n	9c9a <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x12>
    9cfc:	4620      	mov	r0, r4
    9cfe:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9d02:	4699      	mov	r9, r3
    9d04:	e7dc      	b.n	9cc0 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x38>
    9d06:	f04f 0901 	mov.w	r9, #1
    9d0a:	4c09      	ldr	r4, [pc, #36]	; (9d30 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0xa8>)
    9d0c:	e7e3      	b.n	9cd6 <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x4e>
    9d0e:	2c51      	cmp	r4, #81	; 0x51
    9d10:	bfa8      	it	ge
    9d12:	f44f 74fe 	movge.w	r4, #508	; 0x1fc
    9d16:	e7f1      	b.n	9cfc <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x74>
    9d18:	3cc8      	subs	r4, #200	; 0xc8
    9d1a:	b224      	sxth	r4, r4
    9d1c:	f514 7f00 	cmn.w	r4, #512	; 0x200
    9d20:	dcf5      	bgt.n	9d0e <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x86>
    9d22:	f46f 74ff 	mvn.w	r4, #510	; 0x1fe
    9d26:	e7e9      	b.n	9cfc <RAILINT_0f8f345c59ce02114959a6bf3fac0981+0x74>
    9d28:	a8020000 	.word	0xa8020000
    9d2c:	a800c000 	.word	0xa800c000
    9d30:	fffffe00 	.word	0xfffffe00
    9d34:	fffffc00 	.word	0xfffffc00

00009d38 <RAILINT_12973c63ce9f157526b71bd49da4eecd>:
    9d38:	4908      	ldr	r1, [pc, #32]	; (9d5c <RAILINT_12973c63ce9f157526b71bd49da4eecd+0x24>)
    9d3a:	b510      	push	{r4, lr}
    9d3c:	f8d1 309c 	ldr.w	r3, [r1, #156]	; 0x9c
    9d40:	b140      	cbz	r0, 9d54 <RAILINT_12973c63ce9f157526b71bd49da4eecd+0x1c>
    9d42:	461c      	mov	r4, r3
    9d44:	68ca      	ldr	r2, [r1, #12]
    9d46:	f8d1 309c 	ldr.w	r3, [r1, #156]	; 0x9c
    9d4a:	429c      	cmp	r4, r3
    9d4c:	d1f9      	bne.n	9d42 <RAILINT_12973c63ce9f157526b71bd49da4eecd+0xa>
    9d4e:	f3c2 6203 	ubfx	r2, r2, #24, #4
    9d52:	7002      	strb	r2, [r0, #0]
    9d54:	f003 000f 	and.w	r0, r3, #15
    9d58:	bd10      	pop	{r4, pc}
    9d5a:	bf00      	nop
    9d5c:	a8020000 	.word	0xa8020000

00009d60 <RAILINT_e37c2f8c4e95a72e70099c8f3fa2cfe4>:
    9d60:	f64f 0104 	movw	r1, #63492	; 0xf804
    9d64:	f64f 0205 	movw	r2, #63493	; 0xf805
    9d68:	4b04      	ldr	r3, [pc, #16]	; (9d7c <RAILINT_e37c2f8c4e95a72e70099c8f3fa2cfe4+0x1c>)
    9d6a:	2001      	movs	r0, #1
    9d6c:	6c1b      	ldr	r3, [r3, #64]	; 0x40
    9d6e:	b29b      	uxth	r3, r3
    9d70:	428b      	cmp	r3, r1
    9d72:	bf08      	it	eq
    9d74:	4613      	moveq	r3, r2
    9d76:	4a02      	ldr	r2, [pc, #8]	; (9d80 <RAILINT_e37c2f8c4e95a72e70099c8f3fa2cfe4+0x20>)
    9d78:	6613      	str	r3, [r2, #96]	; 0x60
    9d7a:	4770      	bx	lr
    9d7c:	0fe08000 	.word	0x0fe08000
    9d80:	a801c000 	.word	0xa801c000

00009d84 <PRORTC_IRQHandlerOverride>:
    9d84:	f04f 4328 	mov.w	r3, #2818572288	; 0xa8000000
    9d88:	6959      	ldr	r1, [r3, #20]
    9d8a:	699a      	ldr	r2, [r3, #24]
    9d8c:	f503 5300 	add.w	r3, r3, #8192	; 0x2000
    9d90:	400a      	ands	r2, r1
    9d92:	615a      	str	r2, [r3, #20]
    9d94:	4770      	bx	lr
	...

00009d98 <PRORTC_IRQHandler>:
    9d98:	b508      	push	{r3, lr}
    9d9a:	f7ff fff3 	bl	9d84 <PRORTC_IRQHandlerOverride>
    9d9e:	4b04      	ldr	r3, [pc, #16]	; (9db0 <PRORTC_IRQHandler+0x18>)
    9da0:	7b5b      	ldrb	r3, [r3, #13]
    9da2:	1c9a      	adds	r2, r3, #2
    9da4:	2301      	movs	r3, #1
    9da6:	4093      	lsls	r3, r2
    9da8:	4a02      	ldr	r2, [pc, #8]	; (9db4 <PRORTC_IRQHandler+0x1c>)
    9daa:	6153      	str	r3, [r2, #20]
    9dac:	bd08      	pop	{r3, pc}
    9dae:	bf00      	nop
    9db0:	20000e1c 	.word	0x20000e1c
    9db4:	48002000 	.word	0x48002000

00009db8 <RAILINT_f26e766b4223f258d2a3acd050099dec>:
    9db8:	f04f 0c00 	mov.w	ip, #0
    9dbc:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9dc0:	fba2 ab01 	umull	sl, fp, r2, r1
    9dc4:	4ea8      	ldr	r6, [pc, #672]	; (a068 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2b0>)
    9dc6:	f8df e2d0 	ldr.w	lr, [pc, #720]	; a098 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2e0>
    9dca:	eb1a 0606 	adds.w	r6, sl, r6
    9dce:	461f      	mov	r7, r3
    9dd0:	f16b 0300 	sbc.w	r3, fp, #0
    9dd4:	45b6      	cmp	lr, r6
    9dd6:	eb7c 0303 	sbcs.w	r3, ip, r3
    9dda:	d208      	bcs.n	9dee <RAILINT_f26e766b4223f258d2a3acd050099dec+0x36>
    9ddc:	f44f 72ec 	mov.w	r2, #472	; 0x1d8
    9de0:	210e      	movs	r1, #14
    9de2:	4660      	mov	r0, ip
    9de4:	f7fd f9a8 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    9de8:	2002      	movs	r0, #2
    9dea:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9dee:	f8d0 8078 	ldr.w	r8, [r0, #120]	; 0x78
    9df2:	460c      	mov	r4, r1
    9df4:	4615      	mov	r5, r2
    9df6:	f1b8 0f00 	cmp.w	r8, #0
    9dfa:	d004      	beq.n	9e06 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x4e>
    9dfc:	f8d8 3000 	ldr.w	r3, [r8]
    9e00:	2b03      	cmp	r3, #3
    9e02:	f200 80ea 	bhi.w	9fda <RAILINT_f26e766b4223f258d2a3acd050099dec+0x222>
    9e06:	4b99      	ldr	r3, [pc, #612]	; (a06c <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2b4>)
    9e08:	4a99      	ldr	r2, [pc, #612]	; (a070 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2b8>)
    9e0a:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    9e0c:	f8d2 20ec 	ldr.w	r2, [r2, #236]	; 0xec
    9e10:	4998      	ldr	r1, [pc, #608]	; (a074 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2bc>)
    9e12:	0050      	lsls	r0, r2, #1
    9e14:	4a96      	ldr	r2, [pc, #600]	; (a070 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2b8>)
    9e16:	f3c3 0314 	ubfx	r3, r3, #0, #21
    9e1a:	6e12      	ldr	r2, [r2, #96]	; 0x60
    9e1c:	bf48      	it	mi
    9e1e:	f443 1300 	orrmi.w	r3, r3, #2097152	; 0x200000
    9e22:	f8d1 80fc 	ldr.w	r8, [r1, #252]	; 0xfc
    9e26:	0751      	lsls	r1, r2, #29
    9e28:	bf4e      	itee	mi
    9e2a:	f44f 0940 	movmi.w	r9, #12582912	; 0xc00000
    9e2e:	ea4f 5982 	movpl.w	r9, r2, lsl #22
    9e32:	f009 79e0 	andpl.w	r9, r9, #29360128	; 0x1c00000
    9e36:	ea43 6345 	orr.w	r3, r3, r5, lsl #25
    9e3a:	ea43 0909 	orr.w	r9, r3, r9
    9e3e:	f7fc fc43 	bl	66c8 <SystemHFXOClockGet>
    9e42:	2d01      	cmp	r5, #1
    9e44:	4606      	mov	r6, r0
    9e46:	d1cf      	bne.n	9de8 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x30>
    9e48:	2800      	cmp	r0, #0
    9e4a:	d0cd      	beq.n	9de8 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x30>
    9e4c:	4b8a      	ldr	r3, [pc, #552]	; (a078 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2c0>)
    9e4e:	601c      	str	r4, [r3, #0]
    9e50:	4b8a      	ldr	r3, [pc, #552]	; (a07c <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2c4>)
    9e52:	4298      	cmp	r0, r3
    9e54:	f000 80d0 	beq.w	9ff8 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x240>
    9e58:	2500      	movs	r5, #0
    9e5a:	ea4f 41cb 	mov.w	r1, fp, lsl #19
    9e5e:	4632      	mov	r2, r6
    9e60:	462b      	mov	r3, r5
    9e62:	ea41 315a 	orr.w	r1, r1, sl, lsr #13
    9e66:	ea4f 40ca 	mov.w	r0, sl, lsl #19
    9e6a:	f001 fcc7 	bl	b7fc <__aeabi_uldivmod>
    9e6e:	f3c9 0313 	ubfx	r3, r9, #0, #20
    9e72:	fba3 2606 	umull	r2, r6, r3, r6
    9e76:	fb03 6505 	mla	r5, r3, r5, r6
    9e7a:	0cd6      	lsrs	r6, r2, #19
    9e7c:	ea46 3645 	orr.w	r6, r6, r5, lsl #13
    9e80:	f419 1f80 	tst.w	r9, #1048576	; 0x100000
    9e84:	bf08      	it	eq
    9e86:	4276      	negeq	r6, r6
    9e88:	4b7d      	ldr	r3, [pc, #500]	; (a080 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2c8>)
    9e8a:	4d7e      	ldr	r5, [pc, #504]	; (a084 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2cc>)
    9e8c:	4434      	add	r4, r6
    9e8e:	6038      	str	r0, [r7, #0]
    9e90:	601e      	str	r6, [r3, #0]
    9e92:	602c      	str	r4, [r5, #0]
    9e94:	f1b8 0f00 	cmp.w	r8, #0
    9e98:	f000 80b8 	beq.w	a00c <RAILINT_f26e766b4223f258d2a3acd050099dec+0x254>
    9e9c:	2300      	movs	r3, #0
    9e9e:	497a      	ldr	r1, [pc, #488]	; (a088 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2d0>)
    9ea0:	f3c9 5281 	ubfx	r2, r9, #22, #2
    9ea4:	5c8a      	ldrb	r2, [r1, r2]
    9ea6:	4619      	mov	r1, r3
    9ea8:	f019 7f80 	tst.w	r9, #16777216	; 0x1000000
    9eac:	bf18      	it	ne
    9eae:	0864      	lsrne	r4, r4, #1
    9eb0:	2e00      	cmp	r6, #0
    9eb2:	bfb8      	it	lt
    9eb4:	4276      	neglt	r6, r6
    9eb6:	0692      	lsls	r2, r2, #26
    9eb8:	0860      	lsrs	r0, r4, #1
    9eba:	fbc2 0106 	smlal	r0, r1, r2, r6
    9ebe:	4622      	mov	r2, r4
    9ec0:	f001 fc9c 	bl	b7fc <__aeabi_uldivmod>
    9ec4:	f419 1f00 	tst.w	r9, #2097152	; 0x200000
    9ec8:	f3c0 0013 	ubfx	r0, r0, #0, #20
    9ecc:	f8d8 1018 	ldr.w	r1, [r8, #24]
    9ed0:	6078      	str	r0, [r7, #4]
    9ed2:	bf0c      	ite	eq
    9ed4:	f240 1007 	movweq	r0, #263	; 0x107
    9ed8:	20c4      	movne	r0, #196	; 0xc4
    9eda:	4b6c      	ldr	r3, [pc, #432]	; (a08c <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2d4>)
    9edc:	f44f 72fa 	mov.w	r2, #500	; 0x1f4
    9ee0:	fba3 6304 	umull	r6, r3, r3, r4
    9ee4:	095b      	lsrs	r3, r3, #5
    9ee6:	fb00 f303 	mul.w	r3, r0, r3
    9eea:	fbb3 f3f1 	udiv	r3, r3, r1
    9eee:	fb03 f202 	mul.w	r2, r3, r2
    9ef2:	32fa      	adds	r2, #250	; 0xfa
    9ef4:	fba4 0600 	umull	r0, r6, r4, r0
    9ef8:	fba2 2101 	umull	r2, r1, r2, r1
    9efc:	4282      	cmp	r2, r0
    9efe:	eb71 0206 	sbcs.w	r2, r1, r6
    9f02:	bf38      	it	cc
    9f04:	3301      	addcc	r3, #1
    9f06:	b2db      	uxtb	r3, r3
    9f08:	f443 6e00 	orr.w	lr, r3, #2048	; 0x800
    9f0c:	f8c7 e008 	str.w	lr, [r7, #8]
    9f10:	2b00      	cmp	r3, #0
    9f12:	d079      	beq.n	a008 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x250>
    9f14:	fab4 f284 	clz	r2, r4
    9f18:	f8d8 101c 	ldr.w	r1, [r8, #28]
    9f1c:	2a0e      	cmp	r2, #14
    9f1e:	fba3 0601 	umull	r0, r6, r3, r1
    9f22:	dd75      	ble.n	a010 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x258>
    9f24:	03e2      	lsls	r2, r4, #15
    9f26:	2e00      	cmp	r6, #0
    9f28:	f040 808a 	bne.w	a040 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x288>
    9f2c:	fbb2 f2f0 	udiv	r2, r2, r0
    9f30:	0050      	lsls	r0, r2, #1
    9f32:	fb00 3003 	mla	r0, r0, r3, r3
    9f36:	fba1 c600 	umull	ip, r6, r1, r0
    9f3a:	ea4f 4804 	mov.w	r8, r4, lsl #16
    9f3e:	45e0      	cmp	r8, ip
    9f40:	ea4f 4414 	mov.w	r4, r4, lsr #16
    9f44:	eb74 0606 	sbcs.w	r6, r4, r6
    9f48:	d309      	bcc.n	9f5e <RAILINT_f26e766b4223f258d2a3acd050099dec+0x1a6>
    9f4a:	005b      	lsls	r3, r3, #1
    9f4c:	4418      	add	r0, r3
    9f4e:	fba1 c600 	umull	ip, r6, r1, r0
    9f52:	45e0      	cmp	r8, ip
    9f54:	eb74 0606 	sbcs.w	r6, r4, r6
    9f58:	f102 0201 	add.w	r2, r2, #1
    9f5c:	d2f6      	bcs.n	9f4c <RAILINT_f26e766b4223f258d2a3acd050099dec+0x194>
    9f5e:	f3c2 020e 	ubfx	r2, r2, #0, #15
    9f62:	ea4e 3202 	orr.w	r2, lr, r2, lsl #12
    9f66:	f042 6200 	orr.w	r2, r2, #134217728	; 0x8000000
    9f6a:	60ba      	str	r2, [r7, #8]
    9f6c:	f7fc fbac 	bl	66c8 <SystemHFXOClockGet>
    9f70:	682c      	ldr	r4, [r5, #0]
    9f72:	fab4 f384 	clz	r3, r4
    9f76:	f1d3 0302 	rsbs	r3, r3, #2
    9f7a:	bf58      	it	pl
    9f7c:	40dc      	lsrpl	r4, r3
    9f7e:	4b44      	ldr	r3, [pc, #272]	; (a090 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2d8>)
    9f80:	429c      	cmp	r4, r3
    9f82:	bf88      	it	hi
    9f84:	0864      	lsrhi	r4, r4, #1
    9f86:	2800      	cmp	r0, #0
    9f88:	d065      	beq.n	a056 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x29e>
    9f8a:	fbb4 f3f0 	udiv	r3, r4, r0
    9f8e:	2164      	movs	r1, #100	; 0x64
    9f90:	fb00 4213 	mls	r2, r0, r3, r4
    9f94:	fb01 f202 	mul.w	r2, r1, r2
    9f98:	4290      	cmp	r0, r2
    9f9a:	d862      	bhi.n	a062 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2aa>
    9f9c:	1e5a      	subs	r2, r3, #1
    9f9e:	0852      	lsrs	r2, r2, #1
    9fa0:	085b      	lsrs	r3, r3, #1
    9fa2:	3b01      	subs	r3, #1
    9fa4:	0212      	lsls	r2, r2, #8
    9fa6:	ea42 1303 	orr.w	r3, r2, r3, lsl #4
    9faa:	60fb      	str	r3, [r7, #12]
    9fac:	f7fc fb5c 	bl	6668 <SystemSYSCLKGet>
    9fb0:	2800      	cmp	r0, #0
    9fb2:	d048      	beq.n	a046 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x28e>
    9fb4:	fbb4 f3f0 	udiv	r3, r4, r0
    9fb8:	2164      	movs	r1, #100	; 0x64
    9fba:	fb00 4413 	mls	r4, r0, r3, r4
    9fbe:	fb01 f404 	mul.w	r4, r1, r4
    9fc2:	42a0      	cmp	r0, r4
    9fc4:	d845      	bhi.n	a052 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x29a>
    9fc6:	1e5a      	subs	r2, r3, #1
    9fc8:	0852      	lsrs	r2, r2, #1
    9fca:	085b      	lsrs	r3, r3, #1
    9fcc:	3b01      	subs	r3, #1
    9fce:	0212      	lsls	r2, r2, #8
    9fd0:	ea42 1303 	orr.w	r3, r2, r3, lsl #4
    9fd4:	2000      	movs	r0, #0
    9fd6:	613b      	str	r3, [r7, #16]
    9fd8:	e707      	b.n	9dea <RAILINT_f26e766b4223f258d2a3acd050099dec+0x32>
    9fda:	2b04      	cmp	r3, #4
    9fdc:	f8d8 9028 	ldr.w	r9, [r8, #40]	; 0x28
    9fe0:	f47f af2d 	bne.w	9e3e <RAILINT_f26e766b4223f258d2a3acd050099dec+0x86>
    9fe4:	f019 7f80 	tst.w	r9, #16777216	; 0x1000000
    9fe8:	bf0c      	ite	eq
    9fea:	f009 73e0 	andeq.w	r3, r9, #29360128	; 0x1c00000
    9fee:	f44f 0340 	movne.w	r3, #12582912	; 0xc00000
    9ff2:	f029 79e0 	bic.w	r9, r9, #29360128	; 0x1c00000
    9ff6:	e720      	b.n	9e3a <RAILINT_f26e766b4223f258d2a3acd050099dec+0x82>
    9ff8:	4926      	ldr	r1, [pc, #152]	; (a094 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x2dc>)
    9ffa:	2500      	movs	r5, #0
    9ffc:	fbaa a001 	umull	sl, r0, sl, r1
    a000:	fb01 000b 	mla	r0, r1, fp, r0
    a004:	0980      	lsrs	r0, r0, #6
    a006:	e732      	b.n	9e6e <RAILINT_f26e766b4223f258d2a3acd050099dec+0xb6>
    a008:	2001      	movs	r0, #1
    a00a:	e6ee      	b.n	9dea <RAILINT_f26e766b4223f258d2a3acd050099dec+0x32>
    a00c:	4640      	mov	r0, r8
    a00e:	e6ec      	b.n	9dea <RAILINT_f26e766b4223f258d2a3acd050099dec+0x32>
    a010:	f1c2 0c0f 	rsb	ip, r2, #15
    a014:	f102 0811 	add.w	r8, r2, #17
    a018:	fa06 f808 	lsl.w	r8, r6, r8
    a01c:	fa20 f00c 	lsr.w	r0, r0, ip
    a020:	ea40 0008 	orr.w	r0, r0, r8
    a024:	f1ac 0820 	sub.w	r8, ip, #32
    a028:	fa26 f808 	lsr.w	r8, r6, r8
    a02c:	ea40 0008 	orr.w	r0, r0, r8
    a030:	fa26 f60c 	lsr.w	r6, r6, ip
    a034:	3001      	adds	r0, #1
    a036:	fa04 f202 	lsl.w	r2, r4, r2
    a03a:	f146 0600 	adc.w	r6, r6, #0
    a03e:	e772      	b.n	9f26 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x16e>
    a040:	4618      	mov	r0, r3
    a042:	2200      	movs	r2, #0
    a044:	e777      	b.n	9f36 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x17e>
    a046:	f240 32ae 	movw	r2, #942	; 0x3ae
    a04a:	212b      	movs	r1, #43	; 0x2b
    a04c:	f7fd f874 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    a050:	4623      	mov	r3, r4
    a052:	3b01      	subs	r3, #1
    a054:	e7b7      	b.n	9fc6 <RAILINT_f26e766b4223f258d2a3acd050099dec+0x20e>
    a056:	f240 328b 	movw	r2, #907	; 0x38b
    a05a:	212b      	movs	r1, #43	; 0x2b
    a05c:	f7fd f86c 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    a060:	4623      	mov	r3, r4
    a062:	3b01      	subs	r3, #1
    a064:	e79a      	b.n	9f9c <RAILINT_f26e766b4223f258d2a3acd050099dec+0x1e4>
    a066:	bf00      	nop
    a068:	88ca6c00 	.word	0x88ca6c00
    a06c:	a8018000 	.word	0xa8018000
    a070:	a8014000 	.word	0xa8014000
    a074:	b0001f00 	.word	0xb0001f00
    a078:	20000e04 	.word	0x20000e04
    a07c:	0249f000 	.word	0x0249f000
    a080:	20000dfc 	.word	0x20000dfc
    a084:	20000e00 	.word	0x20000e00
    a088:	0000bf38 	.word	0x0000bf38
    a08c:	10624dd3 	.word	0x10624dd3
    a090:	2540be3f 	.word	0x2540be3f
    a094:	dfb23b0a 	.word	0xdfb23b0a
    a098:	4a817c80 	.word	0x4a817c80

0000a09c <RAILINT_40f50b01b0acf65296da94a1cd4ce85b>:
    a09c:	b510      	push	{r4, lr}
    a09e:	4604      	mov	r4, r0
    a0a0:	b086      	sub	sp, #24
    a0a2:	b949      	cbnz	r1, a0b8 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x1c>
    a0a4:	4b1f      	ldr	r3, [pc, #124]	; (a124 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x88>)
    a0a6:	6818      	ldr	r0, [r3, #0]
    a0a8:	b100      	cbz	r0, a0ac <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x10>
    a0aa:	300c      	adds	r0, #12
    a0ac:	6821      	ldr	r1, [r4, #0]
    a0ae:	79a2      	ldrb	r2, [r4, #6]
    a0b0:	ab01      	add	r3, sp, #4
    a0b2:	f7ff fe81 	bl	9db8 <RAILINT_f26e766b4223f258d2a3acd050099dec>
    a0b6:	a901      	add	r1, sp, #4
    a0b8:	4b1b      	ldr	r3, [pc, #108]	; (a128 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x8c>)
    a0ba:	680a      	ldr	r2, [r1, #0]
    a0bc:	635a      	str	r2, [r3, #52]	; 0x34
    a0be:	4b1b      	ldr	r3, [pc, #108]	; (a12c <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x90>)
    a0c0:	f8d3 30fc 	ldr.w	r3, [r3, #252]	; 0xfc
    a0c4:	b333      	cbz	r3, a114 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x78>
    a0c6:	684b      	ldr	r3, [r1, #4]
    a0c8:	b143      	cbz	r3, a0dc <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x40>
    a0ca:	4b19      	ldr	r3, [pc, #100]	; (a130 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x94>)
    a0cc:	4a19      	ldr	r2, [pc, #100]	; (a134 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x98>)
    a0ce:	f8c3 210c 	str.w	r2, [r3, #268]	; 0x10c
    a0d2:	684a      	ldr	r2, [r1, #4]
    a0d4:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
    a0d8:	f8c3 210c 	str.w	r2, [r3, #268]	; 0x10c
    a0dc:	688b      	ldr	r3, [r1, #8]
    a0de:	b143      	cbz	r3, a0f2 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x56>
    a0e0:	4b13      	ldr	r3, [pc, #76]	; (a130 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x94>)
    a0e2:	4a15      	ldr	r2, [pc, #84]	; (a138 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x9c>)
    a0e4:	f8c3 20ec 	str.w	r2, [r3, #236]	; 0xec
    a0e8:	688a      	ldr	r2, [r1, #8]
    a0ea:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
    a0ee:	f8c3 20ec 	str.w	r2, [r3, #236]	; 0xec
    a0f2:	4a12      	ldr	r2, [pc, #72]	; (a13c <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0xa0>)
    a0f4:	68c8      	ldr	r0, [r1, #12]
    a0f6:	f8d2 3164 	ldr.w	r3, [r2, #356]	; 0x164
    a0fa:	f423 63ee 	bic.w	r3, r3, #1904	; 0x770
    a0fe:	4303      	orrs	r3, r0
    a100:	f8c2 3164 	str.w	r3, [r2, #356]	; 0x164
    a104:	f8d2 315c 	ldr.w	r3, [r2, #348]	; 0x15c
    a108:	6909      	ldr	r1, [r1, #16]
    a10a:	f423 63ee 	bic.w	r3, r3, #1904	; 0x770
    a10e:	430b      	orrs	r3, r1
    a110:	f8c2 315c 	str.w	r3, [r2, #348]	; 0x15c
    a114:	2000      	movs	r0, #0
    a116:	88a2      	ldrh	r2, [r4, #4]
    a118:	4b03      	ldr	r3, [pc, #12]	; (a128 <RAILINT_40f50b01b0acf65296da94a1cd4ce85b+0x8c>)
    a11a:	641a      	str	r2, [r3, #64]	; 0x40
    a11c:	6458      	str	r0, [r3, #68]	; 0x44
    a11e:	b006      	add	sp, #24
    a120:	bd10      	pop	{r4, pc}
    a122:	bf00      	nop
    a124:	20000aa8 	.word	0x20000aa8
    a128:	a8018000 	.word	0xa8018000
    a12c:	b0001f00 	.word	0xb0001f00
    a130:	a8016000 	.word	0xa8016000
    a134:	000fffff 	.word	0x000fffff
    a138:	0ffff8ff 	.word	0x0ffff8ff
    a13c:	a8020000 	.word	0xa8020000

0000a140 <RAILINT_ffff6fd8b93bee8f8f3297dc48915167>:
    a140:	2003      	movs	r0, #3
    a142:	4770      	bx	lr

0000a144 <RAILINT_2079853137a39b9d404b4228d973f1ee>:
    a144:	2305      	movs	r3, #5
    a146:	4a05      	ldr	r2, [pc, #20]	; (a15c <RAILINT_2079853137a39b9d404b4228d973f1ee+0x18>)
    a148:	8753      	strh	r3, [r2, #58]	; 0x3a
    a14a:	f892 3039 	ldrb.w	r3, [r2, #57]	; 0x39
    a14e:	f003 0301 	and.w	r3, r3, #1
    a152:	f063 0373 	orn	r3, r3, #115	; 0x73
    a156:	f882 3039 	strb.w	r3, [r2, #57]	; 0x39
    a15a:	4770      	bx	lr
    a15c:	b0001f00 	.word	0xb0001f00

0000a160 <RAILINT_d0ad23c1600b008713957f4fe5ac160e>:
    a160:	b508      	push	{r3, lr}
    a162:	4815      	ldr	r0, [pc, #84]	; (a1b8 <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x58>)
    a164:	f7ff fad0 	bl	9708 <RAILINT_91df45e96a2874f76867d6f26ae534a0>
    a168:	4b14      	ldr	r3, [pc, #80]	; (a1bc <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x5c>)
    a16a:	f8d3 0138 	ldr.w	r0, [r3, #312]	; 0x138
    a16e:	f5a3 3380 	sub.w	r3, r3, #65536	; 0x10000
    a172:	68da      	ldr	r2, [r3, #12]
    a174:	f400 4000 	and.w	r0, r0, #32768	; 0x8000
    a178:	02d2      	lsls	r2, r2, #11
    a17a:	d41a      	bmi.n	a1b2 <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x52>
    a17c:	4a10      	ldr	r2, [pc, #64]	; (a1c0 <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x60>)
    a17e:	6892      	ldr	r2, [r2, #8]
    a180:	f8d3 10bc 	ldr.w	r1, [r3, #188]	; 0xbc
    a184:	f3c2 0281 	ubfx	r2, r2, #2, #2
    a188:	f411 6380 	ands.w	r3, r1, #1024	; 0x400
    a18c:	f102 0201 	add.w	r2, r2, #1
    a190:	b2c9      	uxtb	r1, r1
    a192:	bf18      	it	ne
    a194:	00d3      	lslne	r3, r2, #3
    a196:	29ff      	cmp	r1, #255	; 0xff
    a198:	d006      	beq.n	a1a8 <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x48>
    a19a:	490a      	ldr	r1, [pc, #40]	; (a1c4 <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x64>)
    a19c:	f8d1 10c0 	ldr.w	r1, [r1, #192]	; 0xc0
    a1a0:	0549      	lsls	r1, r1, #21
    a1a2:	d501      	bpl.n	a1a8 <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x48>
    a1a4:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
    a1a8:	b100      	cbz	r0, a1ac <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x4c>
    a1aa:	3303      	adds	r3, #3
    a1ac:	4a06      	ldr	r2, [pc, #24]	; (a1c8 <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x68>)
    a1ae:	66d3      	str	r3, [r2, #108]	; 0x6c
    a1b0:	bd08      	pop	{r3, pc}
    a1b2:	2300      	movs	r3, #0
    a1b4:	e7f8      	b.n	a1a8 <RAILINT_d0ad23c1600b008713957f4fe5ac160e+0x48>
    a1b6:	bf00      	nop
    a1b8:	000f4240 	.word	0x000f4240
    a1bc:	a8014000 	.word	0xa8014000
    a1c0:	a8010000 	.word	0xa8010000
    a1c4:	a8004000 	.word	0xa8004000
    a1c8:	b0001f00 	.word	0xb0001f00

0000a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>:
    a1cc:	4b08      	ldr	r3, [pc, #32]	; (a1f0 <RAILINT_06b1ea13261364007801a74aa7e1e357+0x24>)
    a1ce:	17c1      	asrs	r1, r0, #31
    a1d0:	681a      	ldr	r2, [r3, #0]
    a1d2:	fba2 0300 	umull	r0, r3, r2, r0
    a1d6:	fb02 3301 	mla	r3, r2, r1, r3
    a1da:	f110 7080 	adds.w	r0, r0, #16777216	; 0x1000000
    a1de:	f143 0300 	adc.w	r3, r3, #0
    a1e2:	0e40      	lsrs	r0, r0, #25
    a1e4:	ea40 10c3 	orr.w	r0, r0, r3, lsl #7
    a1e8:	3880      	subs	r0, #128	; 0x80
    a1ea:	ea20 70e0 	bic.w	r0, r0, r0, asr #31
    a1ee:	4770      	bx	lr
    a1f0:	20000e08 	.word	0x20000e08

0000a1f4 <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3>:
    a1f4:	2207      	movs	r2, #7
    a1f6:	4b16      	ldr	r3, [pc, #88]	; (a250 <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3+0x5c>)
    a1f8:	b570      	push	{r4, r5, r6, lr}
    a1fa:	66da      	str	r2, [r3, #108]	; 0x6c
    a1fc:	f7ff fbb8 	bl	9970 <RAILINT_56a75a549239881c0b0573168dc43aff>
    a200:	4b14      	ldr	r3, [pc, #80]	; (a254 <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3+0x60>)
    a202:	08c4      	lsrs	r4, r0, #3
    a204:	0b01      	lsrs	r1, r0, #12
    a206:	4605      	mov	r5, r0
    a208:	05e0      	lsls	r0, r4, #23
    a20a:	18c0      	adds	r0, r0, r3
    a20c:	4a12      	ldr	r2, [pc, #72]	; (a258 <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3+0x64>)
    a20e:	f141 0100 	adc.w	r1, r1, #0
    a212:	2300      	movs	r3, #0
    a214:	f001 faf2 	bl	b7fc <__aeabi_uldivmod>
    a218:	4b10      	ldr	r3, [pc, #64]	; (a25c <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3+0x68>)
    a21a:	4e11      	ldr	r6, [pc, #68]	; (a260 <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3+0x6c>)
    a21c:	6018      	str	r0, [r3, #0]
    a21e:	f64e 2060 	movw	r0, #60000	; 0xea60
    a222:	f7ff ffd3 	bl	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    a226:	4240      	negs	r0, r0
    a228:	f8c6 0090 	str.w	r0, [r6, #144]	; 0x90
    a22c:	480d      	ldr	r0, [pc, #52]	; (a264 <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3+0x70>)
    a22e:	f7ff fa6b 	bl	9708 <RAILINT_91df45e96a2874f76867d6f26ae534a0>
    a232:	4602      	mov	r2, r0
    a234:	b158      	cbz	r0, a24e <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3+0x5a>
    a236:	01e3      	lsls	r3, r4, #7
    a238:	0850      	lsrs	r0, r2, #1
    a23a:	1818      	adds	r0, r3, r0
    a23c:	ea4f 7115 	mov.w	r1, r5, lsr #28
    a240:	f04f 0300 	mov.w	r3, #0
    a244:	f141 0100 	adc.w	r1, r1, #0
    a248:	f001 fad8 	bl	b7fc <__aeabi_uldivmod>
    a24c:	66b0      	str	r0, [r6, #104]	; 0x68
    a24e:	bd70      	pop	{r4, r5, r6, pc}
    a250:	a8020000 	.word	0xa8020000
    a254:	000ee6b2 	.word	0x000ee6b2
    a258:	001dcd65 	.word	0x001dcd65
    a25c:	20000e08 	.word	0x20000e08
    a260:	b0001f00 	.word	0xb0001f00
    a264:	000f4240 	.word	0x000f4240

0000a268 <RAILINT_43ae21a22b6204273e89e527a423910e>:
    a268:	b130      	cbz	r0, a278 <RAILINT_43ae21a22b6204273e89e527a423910e+0x10>
    a26a:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
    a26e:	4358      	muls	r0, r3
    a270:	f6a0 50ac 	subw	r0, r0, #3500	; 0xdac
    a274:	f7ff bfaa 	b.w	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    a278:	f64e 2060 	movw	r0, #60000	; 0xea60
    a27c:	e7fa      	b.n	a274 <RAILINT_43ae21a22b6204273e89e527a423910e+0xc>
	...

0000a280 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d>:
    a280:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    a284:	460c      	mov	r4, r1
    a286:	4606      	mov	r6, r0
    a288:	2800      	cmp	r0, #0
    a28a:	f000 8082 	beq.w	a392 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x112>
    a28e:	f011 0504 	ands.w	r5, r1, #4
    a292:	d044      	beq.n	a31e <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x9e>
    a294:	69c0      	ldr	r0, [r0, #28]
    a296:	2800      	cmp	r0, #0
    a298:	d07d      	beq.n	a396 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x116>
    a29a:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
    a29e:	4358      	muls	r0, r3
    a2a0:	68b3      	ldr	r3, [r6, #8]
    a2a2:	f6a0 50ac 	subw	r0, r0, #3500	; 0xdac
    a2a6:	1ac0      	subs	r0, r0, r3
    a2a8:	f7ff ff90 	bl	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    a2ac:	4b41      	ldr	r3, [pc, #260]	; (a3b4 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x134>)
    a2ae:	f8c3 0080 	str.w	r0, [r3, #128]	; 0x80
    a2b2:	8d30      	ldrh	r0, [r6, #40]	; 0x28
    a2b4:	2800      	cmp	r0, #0
    a2b6:	d071      	beq.n	a39c <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x11c>
    a2b8:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
    a2bc:	4358      	muls	r0, r3
    a2be:	68b3      	ldr	r3, [r6, #8]
    a2c0:	f6a0 50ac 	subw	r0, r0, #3500	; 0xdac
    a2c4:	1ac0      	subs	r0, r0, r3
    a2c6:	f7ff ff81 	bl	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    a2ca:	4b3a      	ldr	r3, [pc, #232]	; (a3b4 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x134>)
    a2cc:	6798      	str	r0, [r3, #120]	; 0x78
    a2ce:	69b3      	ldr	r3, [r6, #24]
    a2d0:	2b00      	cmp	r3, #0
    a2d2:	d066      	beq.n	a3a2 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x122>
    a2d4:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    a2d8:	4353      	muls	r3, r2
    a2da:	68b2      	ldr	r2, [r6, #8]
    a2dc:	f6a3 53ac 	subw	r3, r3, #3500	; 0xdac
    a2e0:	1a9b      	subs	r3, r3, r2
    a2e2:	6872      	ldr	r2, [r6, #4]
    a2e4:	1a9b      	subs	r3, r3, r2
    a2e6:	4a34      	ldr	r2, [pc, #208]	; (a3b8 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x138>)
    a2e8:	17d8      	asrs	r0, r3, #31
    a2ea:	6811      	ldr	r1, [r2, #0]
    a2ec:	4f31      	ldr	r7, [pc, #196]	; (a3b4 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x134>)
    a2ee:	fba1 3203 	umull	r3, r2, r1, r3
    a2f2:	fb01 2200 	mla	r2, r1, r0, r2
    a2f6:	f113 7380 	adds.w	r3, r3, #16777216	; 0x1000000
    a2fa:	f142 0200 	adc.w	r2, r2, #0
    a2fe:	0e5b      	lsrs	r3, r3, #25
    a300:	ea43 13c2 	orr.w	r3, r3, r2, lsl #7
    a304:	3b80      	subs	r3, #128	; 0x80
    a306:	67fb      	str	r3, [r7, #124]	; 0x7c
    a308:	667b      	str	r3, [r7, #100]	; 0x64
    a30a:	f8d6 8024 	ldr.w	r8, [r6, #36]	; 0x24
    a30e:	f7fe ff35 	bl	917c <RAILINT_da84b4d83e32af60304869814f893155>
    a312:	4601      	mov	r1, r0
    a314:	4640      	mov	r0, r8
    a316:	f7ff ffa7 	bl	a268 <RAILINT_43ae21a22b6204273e89e527a423910e>
    a31a:	f8c7 008c 	str.w	r0, [r7, #140]	; 0x8c
    a31e:	07a3      	lsls	r3, r4, #30
    a320:	d51d      	bpl.n	a35e <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0xde>
    a322:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
    a326:	6933      	ldr	r3, [r6, #16]
    a328:	4358      	muls	r0, r3
    a32a:	b123      	cbz	r3, a336 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0xb6>
    a32c:	6833      	ldr	r3, [r6, #0]
    a32e:	f503 531c 	add.w	r3, r3, #9984	; 0x2700
    a332:	3310      	adds	r3, #16
    a334:	4418      	add	r0, r3
    a336:	f7ff ff49 	bl	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    a33a:	4b1e      	ldr	r3, [pc, #120]	; (a3b4 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x134>)
    a33c:	f8c3 0088 	str.w	r0, [r3, #136]	; 0x88
    a340:	6a33      	ldr	r3, [r6, #32]
    a342:	b38b      	cbz	r3, a3a8 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x128>
    a344:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    a348:	68b0      	ldr	r0, [r6, #8]
    a34a:	fb02 0003 	mla	r0, r2, r3, r0
    a34e:	f5a0 5003 	sub.w	r0, r0, #8384	; 0x20c0
    a352:	3810      	subs	r0, #16
    a354:	f7ff ff3a 	bl	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    a358:	4b16      	ldr	r3, [pc, #88]	; (a3b4 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x134>)
    a35a:	f8c3 0084 	str.w	r0, [r3, #132]	; 0x84
    a35e:	b1c5      	cbz	r5, a392 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x112>
    a360:	6970      	ldr	r0, [r6, #20]
    a362:	b320      	cbz	r0, a3ae <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x12e>
    a364:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
    a368:	4358      	muls	r0, r3
    a36a:	f5a0 5003 	sub.w	r0, r0, #8384	; 0x20c0
    a36e:	3810      	subs	r0, #16
    a370:	f7ff ff2c 	bl	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    a374:	4c0f      	ldr	r4, [pc, #60]	; (a3b4 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x134>)
    a376:	6720      	str	r0, [r4, #112]	; 0x70
    a378:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
    a37c:	68f3      	ldr	r3, [r6, #12]
    a37e:	4358      	muls	r0, r3
    a380:	b123      	cbz	r3, a38c <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x10c>
    a382:	6833      	ldr	r3, [r6, #0]
    a384:	f503 531c 	add.w	r3, r3, #9984	; 0x2700
    a388:	3310      	adds	r3, #16
    a38a:	4418      	add	r0, r3
    a38c:	f7ff ff1e 	bl	a1cc <RAILINT_06b1ea13261364007801a74aa7e1e357>
    a390:	6760      	str	r0, [r4, #116]	; 0x74
    a392:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    a396:	f64e 2060 	movw	r0, #60000	; 0xea60
    a39a:	e785      	b.n	a2a8 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x28>
    a39c:	f64e 2060 	movw	r0, #60000	; 0xea60
    a3a0:	e791      	b.n	a2c6 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x46>
    a3a2:	f64e 2360 	movw	r3, #60000	; 0xea60
    a3a6:	e79e      	b.n	a2e6 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0x66>
    a3a8:	f247 5030 	movw	r0, #30000	; 0x7530
    a3ac:	e7d2      	b.n	a354 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0xd4>
    a3ae:	f247 5030 	movw	r0, #30000	; 0x7530
    a3b2:	e7dd      	b.n	a370 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d+0xf0>
    a3b4:	b0001f00 	.word	0xb0001f00
    a3b8:	20000e08 	.word	0x20000e08

0000a3bc <RAILINT_dd1d5ca16feea694e6fc546b7f2eb6df>:
    a3bc:	b193      	cbz	r3, a3e4 <RAILINT_dd1d5ca16feea694e6fc546b7f2eb6df+0x28>
    a3be:	4b0b      	ldr	r3, [pc, #44]	; (a3ec <RAILINT_dd1d5ca16feea694e6fc546b7f2eb6df+0x30>)
    a3c0:	0089      	lsls	r1, r1, #2
    a3c2:	4298      	cmp	r0, r3
    a3c4:	480a      	ldr	r0, [pc, #40]	; (a3f0 <RAILINT_dd1d5ca16feea694e6fc546b7f2eb6df+0x34>)
    a3c6:	bf08      	it	eq
    a3c8:	0092      	lsleq	r2, r2, #2
    a3ca:	4411      	add	r1, r2
    a3cc:	2214      	movs	r2, #20
    a3ce:	fbb0 f2f2 	udiv	r2, r0, r2
    a3d2:	4b08      	ldr	r3, [pc, #32]	; (a3f4 <RAILINT_dd1d5ca16feea694e6fc546b7f2eb6df+0x38>)
    a3d4:	fb03 2101 	mla	r1, r3, r1, r2
    a3d8:	230a      	movs	r3, #10
    a3da:	fbb0 f0f3 	udiv	r0, r0, r3
    a3de:	fbb1 f0f0 	udiv	r0, r1, r0
    a3e2:	e001      	b.n	a3e8 <RAILINT_dd1d5ca16feea694e6fc546b7f2eb6df+0x2c>
    a3e4:	2800      	cmp	r0, #0
    a3e6:	d1f0      	bne.n	a3ca <RAILINT_dd1d5ca16feea694e6fc546b7f2eb6df+0xe>
    a3e8:	4770      	bx	lr
    a3ea:	bf00      	nop
    a3ec:	0001e848 	.word	0x0001e848
    a3f0:	0007a120 	.word	0x0007a120
    a3f4:	000186a0 	.word	0x000186a0

0000a3f8 <RAILINT_0ab27645a606deaf2cb9a3b11860eb15>:
    a3f8:	b980      	cbnz	r0, a41c <RAILINT_0ab27645a606deaf2cb9a3b11860eb15+0x24>
    a3fa:	f242 7110 	movw	r1, #10000	; 0x2710
    a3fe:	4a0a      	ldr	r2, [pc, #40]	; (a428 <RAILINT_0ab27645a606deaf2cb9a3b11860eb15+0x30>)
    a400:	6e50      	ldr	r0, [r2, #100]	; 0x64
    a402:	f3c0 1301 	ubfx	r3, r0, #4, #2
    a406:	0c00      	lsrs	r0, r0, #16
    a408:	fb03 0300 	mla	r3, r3, r0, r0
    a40c:	428b      	cmp	r3, r1
    a40e:	d807      	bhi.n	a420 <RAILINT_0ab27645a606deaf2cb9a3b11860eb15+0x28>
    a410:	6a50      	ldr	r0, [r2, #36]	; 0x24
    a412:	f000 001f 	and.w	r0, r0, #31
    a416:	3001      	adds	r0, #1
    a418:	4418      	add	r0, r3
    a41a:	4770      	bx	lr
    a41c:	202f      	movs	r0, #47	; 0x2f
    a41e:	4770      	bx	lr
    a420:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    a424:	4770      	bx	lr
    a426:	bf00      	nop
    a428:	a8014000 	.word	0xa8014000

0000a42c <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5>:
    a42c:	b538      	push	{r3, r4, r5, lr}
    a42e:	4605      	mov	r5, r0
    a430:	460c      	mov	r4, r1
    a432:	b1c9      	cbz	r1, a468 <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5+0x3c>
    a434:	798b      	ldrb	r3, [r1, #6]
    a436:	b1bb      	cbz	r3, a468 <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5+0x3c>
    a438:	3b01      	subs	r3, #1
    a43a:	2b06      	cmp	r3, #6
    a43c:	d80d      	bhi.n	a45a <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5+0x2e>
    a43e:	e8df f003 	tbb	[pc, r3]
    a442:	0423      	.short	0x0423
    a444:	251e1c06 	.word	0x251e1c06
    a448:	23          	.byte	0x23
    a449:	00          	.byte	0x00
    a44a:	2303      	movs	r3, #3
    a44c:	718b      	strb	r3, [r1, #6]
    a44e:	2000      	movs	r0, #0
    a450:	f7ff ffd2 	bl	a3f8 <RAILINT_0ab27645a606deaf2cb9a3b11860eb15>
    a454:	1c43      	adds	r3, r0, #1
    a456:	4601      	mov	r1, r0
    a458:	d107      	bne.n	a46a <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5+0x3e>
    a45a:	2000      	movs	r0, #0
    a45c:	71a0      	strb	r0, [r4, #6]
    a45e:	79a3      	ldrb	r3, [r4, #6]
    a460:	b113      	cbz	r3, a468 <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5+0x3c>
    a462:	6823      	ldr	r3, [r4, #0]
    a464:	4418      	add	r0, r3
    a466:	6020      	str	r0, [r4, #0]
    a468:	bd38      	pop	{r3, r4, r5, pc}
    a46a:	2300      	movs	r3, #0
    a46c:	88a2      	ldrh	r2, [r4, #4]
    a46e:	00d2      	lsls	r2, r2, #3
    a470:	4628      	mov	r0, r5
    a472:	f7ff ffa3 	bl	a3bc <RAILINT_dd1d5ca16feea694e6fc546b7f2eb6df>
    a476:	4240      	negs	r0, r0
    a478:	e7f1      	b.n	a45e <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5+0x32>
    a47a:	2305      	movs	r3, #5
    a47c:	718b      	strb	r3, [r1, #6]
    a47e:	2300      	movs	r3, #0
    a480:	88a2      	ldrh	r2, [r4, #4]
    a482:	4619      	mov	r1, r3
    a484:	00d2      	lsls	r2, r2, #3
    a486:	e7f3      	b.n	a470 <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5+0x44>
    a488:	2306      	movs	r3, #6
    a48a:	718b      	strb	r3, [r1, #6]
    a48c:	2000      	movs	r0, #0
    a48e:	e7e6      	b.n	a45e <RAILINT_41ffa61618f37d2827bd6e01cc6c61f5+0x32>

0000a490 <RAILINT_80090d97c419b275ef1f41db6daa21d4>:
    a490:	b570      	push	{r4, r5, r6, lr}
    a492:	4604      	mov	r4, r0
    a494:	4608      	mov	r0, r1
    a496:	4616      	mov	r6, r2
    a498:	f7ff f927 	bl	96ea <RAILINT_34bce41ab8660dd545debb2103a67a60>
    a49c:	4605      	mov	r5, r0
    a49e:	4620      	mov	r0, r4
    a4a0:	f7fe f8f0 	bl	8684 <RAILINT_e27525372891c9e702a563a1b4973f45>
    a4a4:	b160      	cbz	r0, a4c0 <RAILINT_80090d97c419b275ef1f41db6daa21d4+0x30>
    a4a6:	b14e      	cbz	r6, a4bc <RAILINT_80090d97c419b275ef1f41db6daa21d4+0x2c>
    a4a8:	4b07      	ldr	r3, [pc, #28]	; (a4c8 <RAILINT_80090d97c419b275ef1f41db6daa21d4+0x38>)
    a4aa:	685b      	ldr	r3, [r3, #4]
    a4ac:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
    a4b0:	f503 73fa 	add.w	r3, r3, #500	; 0x1f4
    a4b4:	fbb3 f0f0 	udiv	r0, r3, r0
    a4b8:	1a28      	subs	r0, r5, r0
    a4ba:	bd70      	pop	{r4, r5, r6, pc}
    a4bc:	4b03      	ldr	r3, [pc, #12]	; (a4cc <RAILINT_80090d97c419b275ef1f41db6daa21d4+0x3c>)
    a4be:	e7f4      	b.n	a4aa <RAILINT_80090d97c419b275ef1f41db6daa21d4+0x1a>
    a4c0:	f8d4 308c 	ldr.w	r3, [r4, #140]	; 0x8c
    a4c4:	e7f2      	b.n	a4ac <RAILINT_80090d97c419b275ef1f41db6daa21d4+0x1c>
    a4c6:	bf00      	nop
    a4c8:	0000bf04 	.word	0x0000bf04
    a4cc:	0000bf10 	.word	0x0000bf10

0000a4d0 <RAILINT_9743c96ef075be688881e5d1e5667476>:
    a4d0:	b570      	push	{r4, r5, r6, lr}
    a4d2:	b088      	sub	sp, #32
    a4d4:	466d      	mov	r5, sp
    a4d6:	4c11      	ldr	r4, [pc, #68]	; (a51c <RAILINT_9743c96ef075be688881e5d1e5667476+0x4c>)
    a4d8:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
    a4da:	c50f      	stmia	r5!, {r0, r1, r2, r3}
    a4dc:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
    a4e0:	e885 000f 	stmia.w	r5, {r0, r1, r2, r3}
    a4e4:	22e0      	movs	r2, #224	; 0xe0
    a4e6:	2100      	movs	r1, #0
    a4e8:	480d      	ldr	r0, [pc, #52]	; (a520 <RAILINT_9743c96ef075be688881e5d1e5667476+0x50>)
    a4ea:	f001 fb24 	bl	bb36 <memset>
    a4ee:	2284      	movs	r2, #132	; 0x84
    a4f0:	2100      	movs	r1, #0
    a4f2:	480c      	ldr	r0, [pc, #48]	; (a524 <RAILINT_9743c96ef075be688881e5d1e5667476+0x54>)
    a4f4:	f001 fb1f 	bl	bb36 <memset>
    a4f8:	4b0b      	ldr	r3, [pc, #44]	; (a528 <RAILINT_9743c96ef075be688881e5d1e5667476+0x58>)
    a4fa:	4a0c      	ldr	r2, [pc, #48]	; (a52c <RAILINT_9743c96ef075be688881e5d1e5667476+0x5c>)
    a4fc:	629a      	str	r2, [r3, #40]	; 0x28
    a4fe:	f7ff fe21 	bl	a144 <RAILINT_2079853137a39b9d404b4228d973f1ee>
    a502:	4b0b      	ldr	r3, [pc, #44]	; (a530 <RAILINT_9743c96ef075be688881e5d1e5667476+0x60>)
    a504:	781b      	ldrb	r3, [r3, #0]
    a506:	b13b      	cbz	r3, a518 <RAILINT_9743c96ef075be688881e5d1e5667476+0x48>
    a508:	466d      	mov	r5, sp
    a50a:	4e04      	ldr	r6, [pc, #16]	; (a51c <RAILINT_9743c96ef075be688881e5d1e5667476+0x4c>)
    a50c:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
    a50e:	c60f      	stmia	r6!, {r0, r1, r2, r3}
    a510:	e895 000f 	ldmia.w	r5, {r0, r1, r2, r3}
    a514:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
    a518:	b008      	add	sp, #32
    a51a:	bd70      	pop	{r4, r5, r6, pc}
    a51c:	b0001fc0 	.word	0xb0001fc0
    a520:	b0001f20 	.word	0xb0001f20
    a524:	b0001e9c 	.word	0xb0001e9c
    a528:	b0001f00 	.word	0xb0001f00
    a52c:	11111110 	.word	0x11111110
    a530:	20000d79 	.word	0x20000d79

0000a534 <RAILINT_e5849823b21bf651f5d87f5e741d2a12>:
    a534:	4b0a      	ldr	r3, [pc, #40]	; (a560 <RAILINT_e5849823b21bf651f5d87f5e741d2a12+0x2c>)
    a536:	7819      	ldrb	r1, [r3, #0]
    a538:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    a53c:	b129      	cbz	r1, a54a <RAILINT_e5849823b21bf651f5d87f5e741d2a12+0x16>
    a53e:	2100      	movs	r1, #0
    a540:	7019      	strb	r1, [r3, #0]
    a542:	4908      	ldr	r1, [pc, #32]	; (a564 <RAILINT_e5849823b21bf651f5d87f5e741d2a12+0x30>)
    a544:	0292      	lsls	r2, r2, #10
    a546:	f8c1 20b4 	str.w	r2, [r1, #180]	; 0xb4
    a54a:	7859      	ldrb	r1, [r3, #1]
    a54c:	f001 02ff 	and.w	r2, r1, #255	; 0xff
    a550:	b129      	cbz	r1, a55e <RAILINT_e5849823b21bf651f5d87f5e741d2a12+0x2a>
    a552:	2100      	movs	r1, #0
    a554:	7059      	strb	r1, [r3, #1]
    a556:	0293      	lsls	r3, r2, #10
    a558:	4a02      	ldr	r2, [pc, #8]	; (a564 <RAILINT_e5849823b21bf651f5d87f5e741d2a12+0x30>)
    a55a:	f8c2 30b8 	str.w	r3, [r2, #184]	; 0xb8
    a55e:	4770      	bx	lr
    a560:	20000e37 	.word	0x20000e37
    a564:	a8005000 	.word	0xa8005000

0000a568 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c>:
    a568:	b508      	push	{r3, lr}
    a56a:	f7fb fdaf 	bl	60cc <CORE_EnterCritical>
    a56e:	4b0e      	ldr	r3, [pc, #56]	; (a5a8 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x40>)
    a570:	781b      	ldrb	r3, [r3, #0]
    a572:	b993      	cbnz	r3, a59a <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x32>
    a574:	4a0d      	ldr	r2, [pc, #52]	; (a5ac <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x44>)
    a576:	6812      	ldr	r2, [r2, #0]
    a578:	f412 3f84 	tst.w	r2, #67584	; 0x10800
    a57c:	d10d      	bne.n	a59a <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x32>
    a57e:	2210      	movs	r2, #16
    a580:	4b0b      	ldr	r3, [pc, #44]	; (a5b0 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x48>)
    a582:	67da      	str	r2, [r3, #124]	; 0x7c
    a584:	4b09      	ldr	r3, [pc, #36]	; (a5ac <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x44>)
    a586:	681b      	ldr	r3, [r3, #0]
    a588:	05db      	lsls	r3, r3, #23
    a58a:	d40b      	bmi.n	a5a4 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x3c>
    a58c:	4b08      	ldr	r3, [pc, #32]	; (a5b0 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x48>)
    a58e:	2220      	movs	r2, #32
    a590:	67da      	str	r2, [r3, #124]	; 0x7c
    a592:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    a596:	f7fb bd9d 	b.w	60d4 <CORE_ExitCritical>
    a59a:	2110      	movs	r1, #16
    a59c:	4a05      	ldr	r2, [pc, #20]	; (a5b4 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x4c>)
    a59e:	67d1      	str	r1, [r2, #124]	; 0x7c
    a5a0:	2b00      	cmp	r3, #0
    a5a2:	d0ef      	beq.n	a584 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x1c>
    a5a4:	4b03      	ldr	r3, [pc, #12]	; (a5b4 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x4c>)
    a5a6:	e7f2      	b.n	a58e <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c+0x26>
    a5a8:	20000e19 	.word	0x20000e19
    a5ac:	20000e10 	.word	0x20000e10
    a5b0:	a8022000 	.word	0xa8022000
    a5b4:	a8021000 	.word	0xa8021000

0000a5b8 <RAILINT_6d8967e14ffa5fbb64f5f8549fa17b5c>:
    a5b8:	2200      	movs	r2, #0
    a5ba:	4b04      	ldr	r3, [pc, #16]	; (a5cc <RAILINT_6d8967e14ffa5fbb64f5f8549fa17b5c+0x14>)
    a5bc:	701a      	strb	r2, [r3, #0]
    a5be:	4b04      	ldr	r3, [pc, #16]	; (a5d0 <RAILINT_6d8967e14ffa5fbb64f5f8549fa17b5c+0x18>)
    a5c0:	7819      	ldrb	r1, [r3, #0]
    a5c2:	b111      	cbz	r1, a5ca <RAILINT_6d8967e14ffa5fbb64f5f8549fa17b5c+0x12>
    a5c4:	701a      	strb	r2, [r3, #0]
    a5c6:	f7ff bfcf 	b.w	a568 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c>
    a5ca:	4770      	bx	lr
    a5cc:	20000e1a 	.word	0x20000e1a
    a5d0:	20000e19 	.word	0x20000e19

0000a5d4 <RAILINT_ef38b49f1deb3f763f4f0e2ae372d117>:
    a5d4:	b510      	push	{r4, lr}
    a5d6:	f7fb fd79 	bl	60cc <CORE_EnterCritical>
    a5da:	210e      	movs	r1, #14
    a5dc:	4604      	mov	r4, r0
    a5de:	2003      	movs	r0, #3
    a5e0:	f7ff faf2 	bl	9bc8 <RAILINT_98702195dd5df205b66d73f7f1b701b5>
    a5e4:	f240 2201 	movw	r2, #513	; 0x201
    a5e8:	4b03      	ldr	r3, [pc, #12]	; (a5f8 <RAILINT_ef38b49f1deb3f763f4f0e2ae372d117+0x24>)
    a5ea:	4620      	mov	r0, r4
    a5ec:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    a5f0:	62da      	str	r2, [r3, #44]	; 0x2c
    a5f2:	f7fb bd6f 	b.w	60d4 <CORE_ExitCritical>
    a5f6:	bf00      	nop
    a5f8:	a8004000 	.word	0xa8004000

0000a5fc <RAILINT_1f111261e83374ea84a9c5469ceac557>:
    a5fc:	b508      	push	{r3, lr}
    a5fe:	2103      	movs	r1, #3
    a600:	2009      	movs	r0, #9
    a602:	f7ff fae1 	bl	9bc8 <RAILINT_98702195dd5df205b66d73f7f1b701b5>
    a606:	2220      	movs	r2, #32
    a608:	4b01      	ldr	r3, [pc, #4]	; (a610 <RAILINT_1f111261e83374ea84a9c5469ceac557+0x14>)
    a60a:	611a      	str	r2, [r3, #16]
    a60c:	bd08      	pop	{r3, pc}
    a60e:	bf00      	nop
    a610:	a8020000 	.word	0xa8020000

0000a614 <RAILINT_c34bfa9af18e68c24adf7137035e88f0>:
    a614:	b508      	push	{r3, lr}
    a616:	f7fb fd59 	bl	60cc <CORE_EnterCritical>
    a61a:	f04f 4200 	mov.w	r2, #2147483648	; 0x80000000
    a61e:	4b22      	ldr	r3, [pc, #136]	; (a6a8 <RAILINT_c34bfa9af18e68c24adf7137035e88f0+0x94>)
    a620:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    a624:	f3bf 8f4f 	dsb	sy
    a628:	f3bf 8f6f 	isb	sy
    a62c:	2201      	movs	r2, #1
    a62e:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    a632:	f3bf 8f4f 	dsb	sy
    a636:	f3bf 8f6f 	isb	sy
    a63a:	2202      	movs	r2, #2
    a63c:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    a640:	f3bf 8f4f 	dsb	sy
    a644:	f3bf 8f6f 	isb	sy
    a648:	2204      	movs	r2, #4
    a64a:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    a64e:	f3bf 8f4f 	dsb	sy
    a652:	f3bf 8f6f 	isb	sy
    a656:	2208      	movs	r2, #8
    a658:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    a65c:	f3bf 8f4f 	dsb	sy
    a660:	f3bf 8f6f 	isb	sy
    a664:	2210      	movs	r2, #16
    a666:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    a66a:	f3bf 8f4f 	dsb	sy
    a66e:	f3bf 8f6f 	isb	sy
    a672:	2220      	movs	r2, #32
    a674:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    a678:	f3bf 8f4f 	dsb	sy
    a67c:	f3bf 8f6f 	isb	sy
    a680:	2240      	movs	r2, #64	; 0x40
    a682:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    a686:	f3bf 8f4f 	dsb	sy
    a68a:	f3bf 8f6f 	isb	sy
    a68e:	f44f 7280 	mov.w	r2, #256	; 0x100
    a692:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    a696:	f3bf 8f4f 	dsb	sy
    a69a:	f3bf 8f6f 	isb	sy
    a69e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    a6a2:	f7fb bd17 	b.w	60d4 <CORE_ExitCritical>
    a6a6:	bf00      	nop
    a6a8:	e000e100 	.word	0xe000e100

0000a6ac <RAILINT_978af8e4393fb6ecb4e92f5256373899>:
    a6ac:	2301      	movs	r3, #1
    a6ae:	b570      	push	{r4, r5, r6, lr}
    a6b0:	4c07      	ldr	r4, [pc, #28]	; (a6d0 <RAILINT_978af8e4393fb6ecb4e92f5256373899+0x24>)
    a6b2:	7023      	strb	r3, [r4, #0]
    a6b4:	4b07      	ldr	r3, [pc, #28]	; (a6d4 <RAILINT_978af8e4393fb6ecb4e92f5256373899+0x28>)
    a6b6:	681e      	ldr	r6, [r3, #0]
    a6b8:	4b07      	ldr	r3, [pc, #28]	; (a6d8 <RAILINT_978af8e4393fb6ecb4e92f5256373899+0x2c>)
    a6ba:	4032      	ands	r2, r6
    a6bc:	e9d3 5300 	ldrd	r5, r3, [r3]
    a6c0:	4019      	ands	r1, r3
    a6c2:	4028      	ands	r0, r5
    a6c4:	f7fc ff54 	bl	7570 <RAILINT_2c0c7ba0065447faa0ab7205349f5d73>
    a6c8:	2300      	movs	r3, #0
    a6ca:	7023      	strb	r3, [r4, #0]
    a6cc:	bd70      	pop	{r4, r5, r6, pc}
    a6ce:	bf00      	nop
    a6d0:	20000e18 	.word	0x20000e18
    a6d4:	20000e0c 	.word	0x20000e0c
    a6d8:	20000e10 	.word	0x20000e10

0000a6dc <RAILINT_e56520736dccfc6b4febe00b533ea27a>:
    a6dc:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a6e0:	f8dd b028 	ldr.w	fp, [sp, #40]	; 0x28
    a6e4:	ea03 0801 	and.w	r8, r3, r1
    a6e8:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
    a6ea:	4606      	mov	r6, r0
    a6ec:	460d      	mov	r5, r1
    a6ee:	ea02 0900 	and.w	r9, r2, r0
    a6f2:	ea03 0a0b 	and.w	sl, r3, fp
    a6f6:	f1bb 0f00 	cmp.w	fp, #0
    a6fa:	f040 8168 	bne.w	a9ce <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2f2>
    a6fe:	1f03      	subs	r3, r0, #4
    a700:	430b      	orrs	r3, r1
    a702:	f000 812d 	beq.w	a960 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x284>
    a706:	2805      	cmp	r0, #5
    a708:	f171 0300 	sbcs.w	r3, r1, #0
    a70c:	f080 80fe 	bcs.w	a90c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x230>
    a710:	ea50 0301 	orrs.w	r3, r0, r1
    a714:	f000 8180 	beq.w	aa18 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x33c>
    a718:	1e43      	subs	r3, r0, #1
    a71a:	430b      	orrs	r3, r1
    a71c:	f000 813c 	beq.w	a998 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2bc>
    a720:	f7ff ff78 	bl	a614 <RAILINT_c34bfa9af18e68c24adf7137035e88f0>
    a724:	4bbd      	ldr	r3, [pc, #756]	; (aa1c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x340>)
    a726:	e9d3 4700 	ldrd	r4, r7, [r3]
    a72a:	ea27 0705 	bic.w	r7, r7, r5
    a72e:	ea24 0406 	bic.w	r4, r4, r6
    a732:	ea44 0409 	orr.w	r4, r4, r9
    a736:	ea47 0708 	orr.w	r7, r7, r8
    a73a:	e9c3 4700 	strd	r4, r7, [r3]
    a73e:	4bb8      	ldr	r3, [pc, #736]	; (aa20 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x344>)
    a740:	f8df 8334 	ldr.w	r8, [pc, #820]	; aa78 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x39c>
    a744:	681e      	ldr	r6, [r3, #0]
    a746:	ea26 060b 	bic.w	r6, r6, fp
    a74a:	ea46 060a 	orr.w	r6, r6, sl
    a74e:	601e      	str	r6, [r3, #0]
    a750:	f7ff ff0a 	bl	a568 <RAILINT_2c4dd48bdd23e67e66c47cfdf845d67c>
    a754:	f014 4f2a 	tst.w	r4, #2852126720	; 0xaa000000
    a758:	bf14      	ite	ne
    a75a:	f248 0302 	movwne	r3, #32770	; 0x8002
    a75e:	f44f 4300 	moveq.w	r3, #32768	; 0x8000
    a762:	07b2      	lsls	r2, r6, #30
    a764:	4aaf      	ldr	r2, [pc, #700]	; (aa24 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x348>)
    a766:	48b0      	ldr	r0, [pc, #704]	; (aa28 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x34c>)
    a768:	6ed2      	ldr	r2, [r2, #108]	; 0x6c
    a76a:	bf48      	it	mi
    a76c:	f443 5300 	orrmi.w	r3, r3, #8192	; 0x2000
    a770:	ea83 0102 	eor.w	r1, r3, r2
    a774:	ea22 0203 	bic.w	r2, r2, r3
    a778:	66c2      	str	r2, [r0, #108]	; 0x6c
    a77a:	4aac      	ldr	r2, [pc, #688]	; (aa2c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x350>)
    a77c:	400b      	ands	r3, r1
    a77e:	0365      	lsls	r5, r4, #13
    a780:	6681      	str	r1, [r0, #104]	; 0x68
    a782:	66d3      	str	r3, [r2, #108]	; 0x6c
    a784:	f404 2380 	and.w	r3, r4, #262144	; 0x40000
    a788:	bf48      	it	mi
    a78a:	f44f 5380 	movmi.w	r3, #4096	; 0x1000
    a78e:	0320      	lsls	r0, r4, #12
    a790:	bf48      	it	mi
    a792:	f443 7380 	orrmi.w	r3, r3, #256	; 0x100
    a796:	06e1      	lsls	r1, r4, #27
    a798:	bf48      	it	mi
    a79a:	f443 5300 	orrmi.w	r3, r3, #8192	; 0x2000
    a79e:	06a2      	lsls	r2, r4, #26
    a7a0:	4aa3      	ldr	r2, [pc, #652]	; (aa30 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x354>)
    a7a2:	bf48      	it	mi
    a7a4:	f443 7300 	orrmi.w	r3, r3, #512	; 0x200
    a7a8:	0665      	lsls	r5, r4, #25
    a7aa:	f8d2 220c 	ldr.w	r2, [r2, #524]	; 0x20c
    a7ae:	bf48      	it	mi
    a7b0:	f443 6380 	orrmi.w	r3, r3, #1024	; 0x400
    a7b4:	0620      	lsls	r0, r4, #24
    a7b6:	bf48      	it	mi
    a7b8:	f443 6300 	orrmi.w	r3, r3, #2048	; 0x800
    a7bc:	489d      	ldr	r0, [pc, #628]	; (aa34 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x358>)
    a7be:	ea83 0102 	eor.w	r1, r3, r2
    a7c2:	ea22 0203 	bic.w	r2, r2, r3
    a7c6:	f8c0 220c 	str.w	r2, [r0, #524]	; 0x20c
    a7ca:	400b      	ands	r3, r1
    a7cc:	f8c0 1208 	str.w	r1, [r0, #520]	; 0x208
    a7d0:	05b9      	lsls	r1, r7, #22
    a7d2:	f407 7500 	and.w	r5, r7, #512	; 0x200
    a7d6:	bf48      	it	mi
    a7d8:	f44f 2580 	movmi.w	r5, #262144	; 0x40000
    a7dc:	4a96      	ldr	r2, [pc, #600]	; (aa38 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x35c>)
    a7de:	f8c2 320c 	str.w	r3, [r2, #524]	; 0x20c
    a7e2:	04e2      	lsls	r2, r4, #19
    a7e4:	bf48      	it	mi
    a7e6:	f445 3580 	orrmi.w	r5, r5, #65536	; 0x10000
    a7ea:	03a3      	lsls	r3, r4, #14
    a7ec:	bf48      	it	mi
    a7ee:	f445 1580 	orrmi.w	r5, r5, #1048576	; 0x100000
    a7f2:	07a0      	lsls	r0, r4, #30
    a7f4:	bf48      	it	mi
    a7f6:	f445 1500 	orrmi.w	r5, r5, #2097152	; 0x200000
    a7fa:	f414 1f00 	tst.w	r4, #2097152	; 0x200000
    a7fe:	d008      	beq.n	a812 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x136>
    a800:	f8d8 0000 	ldr.w	r0, [r8]
    a804:	b100      	cbz	r0, a808 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x12c>
    a806:	300c      	adds	r0, #12
    a808:	f000 fff5 	bl	b7f6 <RAILINT_2d5876683a764801ac6ee9a13c687c8d>
    a80c:	b908      	cbnz	r0, a812 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x136>
    a80e:	f445 2500 	orr.w	r5, r5, #524288	; 0x80000
    a812:	02e1      	lsls	r1, r4, #11
    a814:	bf48      	it	mi
    a816:	f445 3500 	orrmi.w	r5, r5, #131072	; 0x20000
    a81a:	06fa      	lsls	r2, r7, #27
    a81c:	bf48      	it	mi
    a81e:	f445 0580 	orrmi.w	r5, r5, #4194304	; 0x400000
    a822:	0773      	lsls	r3, r6, #29
    a824:	4b85      	ldr	r3, [pc, #532]	; (aa3c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x360>)
    a826:	bf48      	it	mi
    a828:	f045 0504 	orrmi.w	r5, r5, #4
    a82c:	6a1a      	ldr	r2, [r3, #32]
    a82e:	4984      	ldr	r1, [pc, #528]	; (aa40 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x364>)
    a830:	ea85 0302 	eor.w	r3, r5, r2
    a834:	f023 0301 	bic.w	r3, r3, #1
    a838:	401a      	ands	r2, r3
    a83a:	620a      	str	r2, [r1, #32]
    a83c:	401d      	ands	r5, r3
    a83e:	61cb      	str	r3, [r1, #28]
    a840:	4a80      	ldr	r2, [pc, #512]	; (aa44 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x368>)
    a842:	4b81      	ldr	r3, [pc, #516]	; (aa48 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x36c>)
    a844:	f016 0f01 	tst.w	r6, #1
    a848:	621d      	str	r5, [r3, #32]
    a84a:	4b80      	ldr	r3, [pc, #512]	; (aa4c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x370>)
    a84c:	bf18      	it	ne
    a84e:	4613      	movne	r3, r2
    a850:	4a7f      	ldr	r2, [pc, #508]	; (aa50 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x374>)
    a852:	077d      	lsls	r5, r7, #29
    a854:	6f12      	ldr	r2, [r2, #112]	; 0x70
    a856:	bf48      	it	mi
    a858:	f043 6300 	orrmi.w	r3, r3, #134217728	; 0x8000000
    a85c:	487d      	ldr	r0, [pc, #500]	; (aa54 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x378>)
    a85e:	ea83 0102 	eor.w	r1, r3, r2
    a862:	ea22 0203 	bic.w	r2, r2, r3
    a866:	6702      	str	r2, [r0, #112]	; 0x70
    a868:	4a7b      	ldr	r2, [pc, #492]	; (aa58 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x37c>)
    a86a:	400b      	ands	r3, r1
    a86c:	6641      	str	r1, [r0, #100]	; 0x64
    a86e:	6713      	str	r3, [r2, #112]	; 0x70
    a870:	f5a2 3288 	sub.w	r2, r2, #69632	; 0x11000
    a874:	6c52      	ldr	r2, [r2, #68]	; 0x44
    a876:	f004 0301 	and.w	r3, r4, #1
    a87a:	ea83 0102 	eor.w	r1, r3, r2
    a87e:	f5a0 3080 	sub.w	r0, r0, #65536	; 0x10000
    a882:	ea22 0203 	bic.w	r2, r2, r3
    a886:	6442      	str	r2, [r0, #68]	; 0x44
    a888:	4a74      	ldr	r2, [pc, #464]	; (aa5c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x380>)
    a88a:	400b      	ands	r3, r1
    a88c:	6381      	str	r1, [r0, #56]	; 0x38
    a88e:	0220      	lsls	r0, r4, #8
    a890:	6453      	str	r3, [r2, #68]	; 0x44
    a892:	bf48      	it	mi
    a894:	4b72      	ldrmi	r3, [pc, #456]	; (aa60 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x384>)
    a896:	f8d8 2000 	ldr.w	r2, [r8]
    a89a:	bf58      	it	pl
    a89c:	4b71      	ldrpl	r3, [pc, #452]	; (aa64 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x388>)
    a89e:	0761      	lsls	r1, r4, #29
    a8a0:	bf48      	it	mi
    a8a2:	f443 6380 	orrmi.w	r3, r3, #1024	; 0x400
    a8a6:	2a00      	cmp	r2, #0
    a8a8:	f000 80b3 	beq.w	aa12 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x336>
    a8ac:	f892 20e5 	ldrb.w	r2, [r2, #229]	; 0xe5
    a8b0:	b122      	cbz	r2, a8bc <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x1e0>
    a8b2:	f414 6fc0 	tst.w	r4, #1536	; 0x600
    a8b6:	bf18      	it	ne
    a8b8:	f443 7380 	orrne.w	r3, r3, #256	; 0x100
    a8bc:	0732      	lsls	r2, r6, #28
    a8be:	4a6a      	ldr	r2, [pc, #424]	; (aa68 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x38c>)
    a8c0:	bf48      	it	mi
    a8c2:	f043 4300 	orrmi.w	r3, r3, #2147483648	; 0x80000000
    a8c6:	f8d2 10ec 	ldr.w	r1, [r2, #236]	; 0xec
    a8ca:	4868      	ldr	r0, [pc, #416]	; (aa6c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x390>)
    a8cc:	ea83 0201 	eor.w	r2, r3, r1
    a8d0:	f422 22a0 	bic.w	r2, r2, #327680	; 0x50000
    a8d4:	4011      	ands	r1, r2
    a8d6:	4013      	ands	r3, r2
    a8d8:	f8c0 10ec 	str.w	r1, [r0, #236]	; 0xec
    a8dc:	f8c0 20e0 	str.w	r2, [r0, #224]	; 0xe0
    a8e0:	4a63      	ldr	r2, [pc, #396]	; (aa70 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x394>)
    a8e2:	f8c2 30ec 	str.w	r3, [r2, #236]	; 0xec
    a8e6:	f7fb fbf1 	bl	60cc <CORE_EnterCritical>
    a8ea:	f04f 4200 	mov.w	r2, #2147483648	; 0x80000000
    a8ee:	4b61      	ldr	r3, [pc, #388]	; (aa74 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x398>)
    a8f0:	601a      	str	r2, [r3, #0]
    a8f2:	2201      	movs	r2, #1
    a8f4:	605a      	str	r2, [r3, #4]
    a8f6:	2204      	movs	r2, #4
    a8f8:	605a      	str	r2, [r3, #4]
    a8fa:	2208      	movs	r2, #8
    a8fc:	605a      	str	r2, [r3, #4]
    a8fe:	2210      	movs	r2, #16
    a900:	605a      	str	r2, [r3, #4]
    a902:	2220      	movs	r2, #32
    a904:	605a      	str	r2, [r3, #4]
    a906:	2240      	movs	r2, #64	; 0x40
    a908:	605a      	str	r2, [r3, #4]
    a90a:	e03f      	b.n	a98c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2b0>
    a90c:	f5a0 6380 	sub.w	r3, r0, #1024	; 0x400
    a910:	430b      	orrs	r3, r1
    a912:	d006      	beq.n	a922 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x246>
    a914:	f420 6380 	bic.w	r3, r0, #1024	; 0x400
    a918:	f5a3 7300 	sub.w	r3, r3, #512	; 0x200
    a91c:	430b      	orrs	r3, r1
    a91e:	f47f aeff 	bne.w	a720 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x44>
    a922:	f7fb fbd3 	bl	60cc <CORE_EnterCritical>
    a926:	4b3d      	ldr	r3, [pc, #244]	; (aa1c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x340>)
    a928:	e9d3 4100 	ldrd	r4, r1, [r3]
    a92c:	ea24 0406 	bic.w	r4, r4, r6
    a930:	ea21 0105 	bic.w	r1, r1, r5
    a934:	ea44 0409 	orr.w	r4, r4, r9
    a938:	ea41 0108 	orr.w	r1, r1, r8
    a93c:	e9c3 4100 	strd	r4, r1, [r3]
    a940:	4b4d      	ldr	r3, [pc, #308]	; (aa78 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x39c>)
    a942:	681b      	ldr	r3, [r3, #0]
    a944:	2b00      	cmp	r3, #0
    a946:	d061      	beq.n	aa0c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x330>
    a948:	f893 30e5 	ldrb.w	r3, [r3, #229]	; 0xe5
    a94c:	b313      	cbz	r3, a994 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2b8>
    a94e:	f414 6fc0 	tst.w	r4, #1536	; 0x600
    a952:	d01f      	beq.n	a994 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2b8>
    a954:	4b46      	ldr	r3, [pc, #280]	; (aa70 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x394>)
    a956:	f44f 7280 	mov.w	r2, #256	; 0x100
    a95a:	f8c3 20ec 	str.w	r2, [r3, #236]	; 0xec
    a95e:	e015      	b.n	a98c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2b0>
    a960:	f7fb fbb4 	bl	60cc <CORE_EnterCritical>
    a964:	4a2d      	ldr	r2, [pc, #180]	; (aa1c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x340>)
    a966:	e9d2 3100 	ldrd	r3, r1, [r2]
    a96a:	f023 0304 	bic.w	r3, r3, #4
    a96e:	ea43 0309 	orr.w	r3, r3, r9
    a972:	ea41 0108 	orr.w	r1, r1, r8
    a976:	e9c2 3100 	strd	r3, r1, [r2]
    a97a:	ea59 0308 	orrs.w	r3, r9, r8
    a97e:	f44f 6380 	mov.w	r3, #1024	; 0x400
    a982:	bf14      	ite	ne
    a984:	4a3a      	ldrne	r2, [pc, #232]	; (aa70 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x394>)
    a986:	4a39      	ldreq	r2, [pc, #228]	; (aa6c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x390>)
    a988:	f8c2 30ec 	str.w	r3, [r2, #236]	; 0xec
    a98c:	e8bd 4ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a990:	f7fb bba0 	b.w	60d4 <CORE_ExitCritical>
    a994:	4b35      	ldr	r3, [pc, #212]	; (aa6c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x390>)
    a996:	e7de      	b.n	a956 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x27a>
    a998:	f7fb fb98 	bl	60cc <CORE_EnterCritical>
    a99c:	4a1f      	ldr	r2, [pc, #124]	; (aa1c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x340>)
    a99e:	e9d2 3100 	ldrd	r3, r1, [r2]
    a9a2:	f023 0301 	bic.w	r3, r3, #1
    a9a6:	ea43 0309 	orr.w	r3, r3, r9
    a9aa:	ea41 0108 	orr.w	r1, r1, r8
    a9ae:	e9c2 3100 	strd	r3, r1, [r2]
    a9b2:	ea59 0308 	orrs.w	r3, r9, r8
    a9b6:	f04f 0301 	mov.w	r3, #1
    a9ba:	4a30      	ldr	r2, [pc, #192]	; (aa7c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x3a0>)
    a9bc:	bf1b      	ittet	ne
    a9be:	6393      	strne	r3, [r2, #56]	; 0x38
    a9c0:	f5a2 5280 	subne.w	r2, r2, #4096	; 0x1000
    a9c4:	6453      	streq	r3, [r2, #68]	; 0x44
    a9c6:	6453      	strne	r3, [r2, #68]	; 0x44
    a9c8:	bf08      	it	eq
    a9ca:	6393      	streq	r3, [r2, #56]	; 0x38
    a9cc:	e7de      	b.n	a98c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2b0>
    a9ce:	ea50 0301 	orrs.w	r3, r0, r1
    a9d2:	f47f aea5 	bne.w	a720 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x44>
    a9d6:	f1bb 0f01 	cmp.w	fp, #1
    a9da:	f47f aea1 	bne.w	a720 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x44>
    a9de:	f7fb fb75 	bl	60cc <CORE_EnterCritical>
    a9e2:	4a0f      	ldr	r2, [pc, #60]	; (aa20 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x344>)
    a9e4:	6813      	ldr	r3, [r2, #0]
    a9e6:	f023 0301 	bic.w	r3, r3, #1
    a9ea:	ea43 030a 	orr.w	r3, r3, sl
    a9ee:	6013      	str	r3, [r2, #0]
    a9f0:	f44f 6380 	mov.w	r3, #1024	; 0x400
    a9f4:	4a17      	ldr	r2, [pc, #92]	; (aa54 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x378>)
    a9f6:	f1ba 0f00 	cmp.w	sl, #0
    a9fa:	d004      	beq.n	aa06 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x32a>
    a9fc:	6653      	str	r3, [r2, #100]	; 0x64
    a9fe:	f5a2 5280 	sub.w	r2, r2, #4096	; 0x1000
    aa02:	6713      	str	r3, [r2, #112]	; 0x70
    aa04:	e7c2      	b.n	a98c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2b0>
    aa06:	6713      	str	r3, [r2, #112]	; 0x70
    aa08:	6653      	str	r3, [r2, #100]	; 0x64
    aa0a:	e7bf      	b.n	a98c <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x2b0>
    aa0c:	f893 30d9 	ldrb.w	r3, [r3, #217]	; 0xd9
    aa10:	deff      	udf	#255	; 0xff
    aa12:	f892 30d9 	ldrb.w	r3, [r2, #217]	; 0xd9
    aa16:	e7fb      	b.n	aa10 <RAILINT_e56520736dccfc6b4febe00b533ea27a+0x334>
    aa18:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    aa1c:	20000e10 	.word	0x20000e10
    aa20:	20000e0c 	.word	0x20000e0c
    aa24:	a8004000 	.word	0xa8004000
    aa28:	a8006000 	.word	0xa8006000
    aa2c:	a8005000 	.word	0xa8005000
    aa30:	a8014000 	.word	0xa8014000
    aa34:	a8016000 	.word	0xa8016000
    aa38:	a8015000 	.word	0xa8015000
    aa3c:	a8020000 	.word	0xa8020000
    aa40:	a8022000 	.word	0xa8022000
    aa44:	03001c04 	.word	0x03001c04
    aa48:	a8021000 	.word	0xa8021000
    aa4c:	03001804 	.word	0x03001804
    aa50:	a801c000 	.word	0xa801c000
    aa54:	a801e000 	.word	0xa801e000
    aa58:	a801d000 	.word	0xa801d000
    aa5c:	a800d000 	.word	0xa800d000
    aa60:	090a0a0d 	.word	0x090a0a0d
    aa64:	090a0a09 	.word	0x090a0a09
    aa68:	44004000 	.word	0x44004000
    aa6c:	44006000 	.word	0x44006000
    aa70:	44005000 	.word	0x44005000
    aa74:	e000e100 	.word	0xe000e100
    aa78:	20000aa8 	.word	0x20000aa8
    aa7c:	a800e000 	.word	0xa800e000

0000aa80 <RAILINT_436bf61abb715dbe168d75ac0bccdfdf>:
    aa80:	4b02      	ldr	r3, [pc, #8]	; (aa8c <RAILINT_436bf61abb715dbe168d75ac0bccdfdf+0xc>)
    aa82:	6858      	ldr	r0, [r3, #4]
    aa84:	f3c0 00c0 	ubfx	r0, r0, #3, #1
    aa88:	4770      	bx	lr
    aa8a:	bf00      	nop
    aa8c:	20000e10 	.word	0x20000e10

0000aa90 <RAILINT_0e4fab607515a0ae94861cde84b8a317>:
    aa90:	4b02      	ldr	r3, [pc, #8]	; (aa9c <RAILINT_0e4fab607515a0ae94861cde84b8a317+0xc>)
    aa92:	6818      	ldr	r0, [r3, #0]
    aa94:	f000 0001 	and.w	r0, r0, #1
    aa98:	4770      	bx	lr
    aa9a:	bf00      	nop
    aa9c:	20000e10 	.word	0x20000e10

0000aaa0 <RAILINT_5d6f9e1abd47331b2e5065ec63f9f308>:
    aaa0:	4b03      	ldr	r3, [pc, #12]	; (aab0 <RAILINT_5d6f9e1abd47331b2e5065ec63f9f308+0x10>)
    aaa2:	681b      	ldr	r3, [r3, #0]
    aaa4:	f413 6fc0 	tst.w	r3, #1536	; 0x600
    aaa8:	bf14      	ite	ne
    aaaa:	2001      	movne	r0, #1
    aaac:	2000      	moveq	r0, #0
    aaae:	4770      	bx	lr
    aab0:	20000e10 	.word	0x20000e10

0000aab4 <RAILINT_0390333908b9b36d5ab834e553f87374>:
    aab4:	b510      	push	{r4, lr}
    aab6:	4604      	mov	r4, r0
    aab8:	f7fe ff3a 	bl	9930 <RAILINT_83b3e2e99c8f4d3fd0b62943447c7cff>
    aabc:	f7ff fdaa 	bl	a614 <RAILINT_c34bfa9af18e68c24adf7137035e88f0>
    aac0:	f104 0030 	add.w	r0, r4, #48	; 0x30
    aac4:	f7fd fffe 	bl	8ac4 <RAILINT_32732aa1d78833fa65026efd536f2c3e>
    aac8:	f7fe fee4 	bl	9894 <RAILINT_0a958662e0f9b48ba3742030a3e4e70c>
    aacc:	f7fe fd2e 	bl	952c <RAILINT_a2bb09bbf0f5a66273c06b6551b0acd9>
    aad0:	f7fe fd9a 	bl	9608 <RAILINT_2867cf1f7327fd002fccf5d8ded311be>
    aad4:	f7ff fb8e 	bl	a1f4 <RAILINT_4baddb3f7581dff171ab25f7b0ebdad3>
    aad8:	2107      	movs	r1, #7
    aada:	f104 0088 	add.w	r0, r4, #136	; 0x88
    aade:	f7ff fbcf 	bl	a280 <RAILINT_aeea5e1f09f1c2b4f097efecd921db8d>
    aae2:	f04f 7180 	mov.w	r1, #16777216	; 0x1000000
    aae6:	2000      	movs	r0, #0
    aae8:	f7fe fdb6 	bl	9658 <RAILINT_6fba69fb8464276fb40686c982612f36>
    aaec:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
    aaf0:	4b0b      	ldr	r3, [pc, #44]	; (ab20 <RAILINT_0390333908b9b36d5ab834e553f87374+0x6c>)
    aaf2:	f44f 1100 	mov.w	r1, #2097152	; 0x200000
    aaf6:	2001      	movs	r0, #1
    aaf8:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
    aafc:	f7fe fdac 	bl	9658 <RAILINT_6fba69fb8464276fb40686c982612f36>
    ab00:	f7ff f92e 	bl	9d60 <RAILINT_e37c2f8c4e95a72e70099c8f3fa2cfe4>
    ab04:	b920      	cbnz	r0, ab10 <RAILINT_0390333908b9b36d5ab834e553f87374+0x5c>
    ab06:	f240 2276 	movw	r2, #630	; 0x276
    ab0a:	2114      	movs	r1, #20
    ab0c:	f7fc fb14 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    ab10:	f7ff fb16 	bl	a140 <RAILINT_ffff6fd8b93bee8f8f3297dc48915167>
    ab14:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    ab18:	2001      	movs	r0, #1
    ab1a:	f7fe bc89 	b.w	9430 <RAILINT_ac4c341889862730c8d820dc51f851c9>
    ab1e:	bf00      	nop
    ab20:	a801d000 	.word	0xa801d000

0000ab24 <RAILINT_cda8bf84b67189e08b64149f714e0ad8>:
    ab24:	22a8      	movs	r2, #168	; 0xa8
    ab26:	4b13      	ldr	r3, [pc, #76]	; (ab74 <RAILINT_cda8bf84b67189e08b64149f714e0ad8+0x50>)
    ab28:	b510      	push	{r4, lr}
    ab2a:	6f1c      	ldr	r4, [r3, #112]	; 0x70
    ab2c:	f503 5300 	add.w	r3, r3, #8192	; 0x2000
    ab30:	671a      	str	r2, [r3, #112]	; 0x70
    ab32:	2210      	movs	r2, #16
    ab34:	609a      	str	r2, [r3, #8]
    ab36:	f04f 5200 	mov.w	r2, #536870912	; 0x20000000
    ab3a:	f5a3 4380 	sub.w	r3, r3, #16384	; 0x4000
    ab3e:	671a      	str	r2, [r3, #112]	; 0x70
    ab40:	665a      	str	r2, [r3, #100]	; 0x64
    ab42:	f7ff fcf7 	bl	a534 <RAILINT_e5849823b21bf651f5d87f5e741d2a12>
    ab46:	4b0c      	ldr	r3, [pc, #48]	; (ab78 <RAILINT_cda8bf84b67189e08b64149f714e0ad8+0x54>)
    ab48:	781b      	ldrb	r3, [r3, #0]
    ab4a:	b913      	cbnz	r3, ab52 <RAILINT_cda8bf84b67189e08b64149f714e0ad8+0x2e>
    ab4c:	2003      	movs	r0, #3
    ab4e:	f7fe fd69 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    ab52:	2200      	movs	r2, #0
    ab54:	4b09      	ldr	r3, [pc, #36]	; (ab7c <RAILINT_cda8bf84b67189e08b64149f714e0ad8+0x58>)
    ab56:	679a      	str	r2, [r3, #120]	; 0x78
    ab58:	06a3      	lsls	r3, r4, #26
    ab5a:	d507      	bpl.n	ab6c <RAILINT_cda8bf84b67189e08b64149f714e0ad8+0x48>
    ab5c:	4b08      	ldr	r3, [pc, #32]	; (ab80 <RAILINT_cda8bf84b67189e08b64149f714e0ad8+0x5c>)
    ab5e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    ab60:	f5b3 7f81 	cmp.w	r3, #258	; 0x102
    ab64:	bf22      	ittt	cs
    ab66:	2280      	movcs	r2, #128	; 0x80
    ab68:	4b02      	ldrcs	r3, [pc, #8]	; (ab74 <RAILINT_cda8bf84b67189e08b64149f714e0ad8+0x50>)
    ab6a:	611a      	strcs	r2, [r3, #16]
    ab6c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    ab70:	f7fd bc7a 	b.w	8468 <RAILINT_3209015e469febd3aebf12c10b838c78>
    ab74:	a8020000 	.word	0xa8020000
    ab78:	20000e34 	.word	0x20000e34
    ab7c:	a801c000 	.word	0xa801c000
    ab80:	b0001f00 	.word	0xb0001f00

0000ab84 <RAILINT_b4349430825f42395f1799b2ff8bb1b4>:
    ab84:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    ab86:	4c08      	ldr	r4, [pc, #32]	; (aba8 <RAILINT_b4349430825f42395f1799b2ff8bb1b4+0x24>)
    ab88:	4d08      	ldr	r5, [pc, #32]	; (abac <RAILINT_b4349430825f42395f1799b2ff8bb1b4+0x28>)
    ab8a:	6f23      	ldr	r3, [r4, #112]	; 0x70
    ab8c:	2304      	movs	r3, #4
    ab8e:	4f08      	ldr	r7, [pc, #32]	; (abb0 <RAILINT_b4349430825f42395f1799b2ff8bb1b4+0x2c>)
    ab90:	672b      	str	r3, [r5, #112]	; 0x70
    ab92:	6f23      	ldr	r3, [r4, #112]	; 0x70
    ab94:	035b      	lsls	r3, r3, #13
    ab96:	d400      	bmi.n	ab9a <RAILINT_b4349430825f42395f1799b2ff8bb1b4+0x16>
    ab98:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    ab9a:	2604      	movs	r6, #4
    ab9c:	2002      	movs	r0, #2
    ab9e:	673e      	str	r6, [r7, #112]	; 0x70
    aba0:	f7fe fdd2 	bl	9748 <RAILINT_880ea347ba5a380aeb65b9c33560ef79>
    aba4:	672e      	str	r6, [r5, #112]	; 0x70
    aba6:	e7f4      	b.n	ab92 <RAILINT_b4349430825f42395f1799b2ff8bb1b4+0xe>
    aba8:	a8020000 	.word	0xa8020000
    abac:	a8021000 	.word	0xa8021000
    abb0:	a8022000 	.word	0xa8022000

0000abb4 <RAILINT_cf4e885725a47449d7a6caf77bda2061>:
    abb4:	f44f 62c0 	mov.w	r2, #1536	; 0x600
    abb8:	4b13      	ldr	r3, [pc, #76]	; (ac08 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x54>)
    abba:	b510      	push	{r4, lr}
    abbc:	62da      	str	r2, [r3, #44]	; 0x2c
    abbe:	b908      	cbnz	r0, abc4 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x10>
    abc0:	b951      	cbnz	r1, abd8 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x24>
    abc2:	bd10      	pop	{r4, pc}
    abc4:	b941      	cbnz	r1, abd8 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x24>
    abc6:	4a11      	ldr	r2, [pc, #68]	; (ac0c <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x58>)
    abc8:	68d3      	ldr	r3, [r2, #12]
    abca:	0e1b      	lsrs	r3, r3, #24
    abcc:	f013 0f0e 	tst.w	r3, #14
    abd0:	d1f7      	bne.n	abc2 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0xe>
    abd2:	6893      	ldr	r3, [r2, #8]
    abd4:	069a      	lsls	r2, r3, #26
    abd6:	d4f4      	bmi.n	abc2 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0xe>
    abd8:	4c0c      	ldr	r4, [pc, #48]	; (ac0c <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x58>)
    abda:	2000      	movs	r0, #0
    abdc:	f7ff f8ac 	bl	9d38 <RAILINT_12973c63ce9f157526b71bd49da4eecd>
    abe0:	2803      	cmp	r0, #3
    abe2:	d001      	beq.n	abe8 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x34>
    abe4:	2809      	cmp	r0, #9
    abe6:	d105      	bne.n	abf4 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x40>
    abe8:	6f63      	ldr	r3, [r4, #116]	; 0x74
    abea:	03db      	lsls	r3, r3, #15
    abec:	d4f5      	bmi.n	abda <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x26>
    abee:	6de3      	ldr	r3, [r4, #92]	; 0x5c
    abf0:	2b0c      	cmp	r3, #12
    abf2:	d9f2      	bls.n	abda <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x26>
    abf4:	f7ff ffc6 	bl	ab84 <RAILINT_b4349430825f42395f1799b2ff8bb1b4>
    abf8:	2201      	movs	r2, #1
    abfa:	4b05      	ldr	r3, [pc, #20]	; (ac10 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0x5c>)
    abfc:	615a      	str	r2, [r3, #20]
    abfe:	2204      	movs	r2, #4
    ac00:	f503 5380 	add.w	r3, r3, #4096	; 0x1000
    ac04:	671a      	str	r2, [r3, #112]	; 0x70
    ac06:	e7dc      	b.n	abc2 <RAILINT_cf4e885725a47449d7a6caf77bda2061+0xe>
    ac08:	a8016000 	.word	0xa8016000
    ac0c:	a8020000 	.word	0xa8020000
    ac10:	a8021000 	.word	0xa8021000

0000ac14 <RAILINT_519bf7b367869678ccdc4f803cd8123f>:
    ac14:	f7fd bf86 	b.w	8b24 <RAILINT_1733b4fa56ea2dd2dbc687587cdd0f39>

0000ac18 <RAILINT_a7d421cde8a91be6637558edc84e4002>:
    ac18:	b538      	push	{r3, r4, r5, lr}
    ac1a:	4605      	mov	r5, r0
    ac1c:	f7fb fa56 	bl	60cc <CORE_EnterCritical>
    ac20:	4604      	mov	r4, r0
    ac22:	f7fd fefd 	bl	8a20 <RAILINT_6281eecc9c4ea6e1ecc523be2e1d48d2>
    ac26:	b135      	cbz	r5, ac36 <RAILINT_a7d421cde8a91be6637558edc84e4002+0x1e>
    ac28:	f7ff fcc6 	bl	a5b8 <RAILINT_6d8967e14ffa5fbb64f5f8549fa17b5c>
    ac2c:	4620      	mov	r0, r4
    ac2e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    ac32:	f7fb ba4f 	b.w	60d4 <CORE_ExitCritical>
    ac36:	4b08      	ldr	r3, [pc, #32]	; (ac58 <RAILINT_a7d421cde8a91be6637558edc84e4002+0x40>)
    ac38:	781b      	ldrb	r3, [r3, #0]
    ac3a:	2b00      	cmp	r3, #0
    ac3c:	d0f6      	beq.n	ac2c <RAILINT_a7d421cde8a91be6637558edc84e4002+0x14>
    ac3e:	4b07      	ldr	r3, [pc, #28]	; (ac5c <RAILINT_a7d421cde8a91be6637558edc84e4002+0x44>)
    ac40:	781d      	ldrb	r5, [r3, #0]
    ac42:	2d00      	cmp	r5, #0
    ac44:	d1f2      	bne.n	ac2c <RAILINT_a7d421cde8a91be6637558edc84e4002+0x14>
    ac46:	f7ff fcb7 	bl	a5b8 <RAILINT_6d8967e14ffa5fbb64f5f8549fa17b5c>
    ac4a:	462a      	mov	r2, r5
    ac4c:	f44f 4080 	mov.w	r0, #16384	; 0x4000
    ac50:	2100      	movs	r1, #0
    ac52:	f7ff fd2b 	bl	a6ac <RAILINT_978af8e4393fb6ecb4e92f5256373899>
    ac56:	e7e9      	b.n	ac2c <RAILINT_a7d421cde8a91be6637558edc84e4002+0x14>
    ac58:	20000e1a 	.word	0x20000e1a
    ac5c:	20000e18 	.word	0x20000e18

0000ac60 <RAILINT_415699d4fedc812ab5645a39d53b6366>:
    ac60:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ac64:	4614      	mov	r4, r2
    ac66:	4606      	mov	r6, r0
    ac68:	460d      	mov	r5, r1
    ac6a:	f7fd fbfd 	bl	8468 <RAILINT_3209015e469febd3aebf12c10b838c78>
    ac6e:	22a0      	movs	r2, #160	; 0xa0
    ac70:	4b43      	ldr	r3, [pc, #268]	; (ad80 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x120>)
    ac72:	2003      	movs	r0, #3
    ac74:	671a      	str	r2, [r3, #112]	; 0x70
    ac76:	f7fe fce5 	bl	9644 <RAILINT_bda0c15173302986042c4866e7e8cb7e>
    ac7a:	b128      	cbz	r0, ac88 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x28>
    ac7c:	2003      	movs	r0, #3
    ac7e:	f7fe fcd1 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    ac82:	2004      	movs	r0, #4
    ac84:	f7fe fcce 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    ac88:	f04f 0900 	mov.w	r9, #0
    ac8c:	4b3d      	ldr	r3, [pc, #244]	; (ad84 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x124>)
    ac8e:	4a3e      	ldr	r2, [pc, #248]	; (ad88 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x128>)
    ac90:	f04f 0804 	mov.w	r8, #4
    ac94:	675a      	str	r2, [r3, #116]	; 0x74
    ac96:	f8c3 9078 	str.w	r9, [r3, #120]	; 0x78
    ac9a:	f7ff ff73 	bl	ab84 <RAILINT_b4349430825f42395f1799b2ff8bb1b4>
    ac9e:	4b3b      	ldr	r3, [pc, #236]	; (ad8c <RAILINT_415699d4fedc812ab5645a39d53b6366+0x12c>)
    aca0:	4837      	ldr	r0, [pc, #220]	; (ad80 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x120>)
    aca2:	f8d3 2e9c 	ldr.w	r2, [r3, #3740]	; 0xe9c
    aca6:	4f3a      	ldr	r7, [pc, #232]	; (ad90 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x130>)
    aca8:	f042 0220 	orr.w	r2, r2, #32
    acac:	f8c3 2e9c 	str.w	r2, [r3, #3740]	; 0xe9c
    acb0:	22ff      	movs	r2, #255	; 0xff
    acb2:	6082      	str	r2, [r0, #8]
    acb4:	f44f 7280 	mov.w	r2, #256	; 0x100
    acb8:	613a      	str	r2, [r7, #16]
    acba:	f8d3 1ecc 	ldr.w	r1, [r3, #3788]	; 0xecc
    acbe:	4a35      	ldr	r2, [pc, #212]	; (ad94 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x134>)
    acc0:	400a      	ands	r2, r1
    acc2:	f8c3 2ecc 	str.w	r2, [r3, #3788]	; 0xecc
    acc6:	f8c0 8070 	str.w	r8, [r0, #112]	; 0x70
    acca:	f8c3 9ea4 	str.w	r9, [r3, #3748]	; 0xea4
    acce:	b156      	cbz	r6, ace6 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x86>
    acd0:	f7ff fc80 	bl	a5d4 <RAILINT_ef38b49f1deb3f763f4f0e2ae372d117>
    acd4:	f7fe fce4 	bl	96a0 <RAILINT_91acd8a0b3b22b251b18aeabdb4a57f7>
    acd8:	f7ff fc90 	bl	a5fc <RAILINT_1f111261e83374ea84a9c5469ceac557>
    acdc:	4640      	mov	r0, r8
    acde:	f7fe fca1 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    ace2:	f7ff fc27 	bl	a534 <RAILINT_e5849823b21bf651f5d87f5e741d2a12>
    ace6:	697b      	ldr	r3, [r7, #20]
    ace8:	07d9      	lsls	r1, r3, #31
    acea:	d546      	bpl.n	ad7a <RAILINT_415699d4fedc812ab5645a39d53b6366+0x11a>
    acec:	4a28      	ldr	r2, [pc, #160]	; (ad90 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x130>)
    acee:	68d3      	ldr	r3, [r2, #12]
    acf0:	f013 6f70 	tst.w	r3, #251658240	; 0xf000000
    acf4:	d1fb      	bne.n	acee <RAILINT_415699d4fedc812ab5645a39d53b6366+0x8e>
    acf6:	4b28      	ldr	r3, [pc, #160]	; (ad98 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x138>)
    acf8:	4e21      	ldr	r6, [pc, #132]	; (ad80 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x120>)
    acfa:	4a28      	ldr	r2, [pc, #160]	; (ad9c <RAILINT_415699d4fedc812ab5645a39d53b6366+0x13c>)
    acfc:	6733      	str	r3, [r6, #112]	; 0x70
    acfe:	6ad3      	ldr	r3, [r2, #44]	; 0x2c
    ad00:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    ad04:	62d3      	str	r3, [r2, #44]	; 0x2c
    ad06:	b115      	cbz	r5, ad0e <RAILINT_415699d4fedc812ab5645a39d53b6366+0xae>
    ad08:	4620      	mov	r0, r4
    ad0a:	f7ff ff85 	bl	ac18 <RAILINT_a7d421cde8a91be6637558edc84e4002>
    ad0e:	4b24      	ldr	r3, [pc, #144]	; (ada0 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x140>)
    ad10:	f8d3 314c 	ldr.w	r3, [r3, #332]	; 0x14c
    ad14:	1c5a      	adds	r2, r3, #1
    ad16:	d001      	beq.n	ad1c <RAILINT_415699d4fedc812ab5645a39d53b6366+0xbc>
    ad18:	005b      	lsls	r3, r3, #1
    ad1a:	d501      	bpl.n	ad20 <RAILINT_415699d4fedc812ab5645a39d53b6366+0xc0>
    ad1c:	2301      	movs	r3, #1
    ad1e:	6173      	str	r3, [r6, #20]
    ad20:	b35c      	cbz	r4, ad7a <RAILINT_415699d4fedc812ab5645a39d53b6366+0x11a>
    ad22:	4b20      	ldr	r3, [pc, #128]	; (ada4 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x144>)
    ad24:	6eda      	ldr	r2, [r3, #108]	; 0x6c
    ad26:	f503 5300 	add.w	r3, r3, #8192	; 0x2000
    ad2a:	669a      	str	r2, [r3, #104]	; 0x68
    ad2c:	f503 33d0 	add.w	r3, r3, #106496	; 0x1a000
    ad30:	6a1a      	ldr	r2, [r3, #32]
    ad32:	f503 5300 	add.w	r3, r3, #8192	; 0x2000
    ad36:	61da      	str	r2, [r3, #28]
    ad38:	4a1b      	ldr	r2, [pc, #108]	; (ada8 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x148>)
    ad3a:	f8d2 120c 	ldr.w	r1, [r2, #524]	; 0x20c
    ad3e:	f502 5200 	add.w	r2, r2, #8192	; 0x2000
    ad42:	f8c2 1208 	str.w	r1, [r2, #520]	; 0x208
    ad46:	f502 5200 	add.w	r2, r2, #8192	; 0x2000
    ad4a:	f8d2 1084 	ldr.w	r1, [r2, #132]	; 0x84
    ad4e:	f502 5200 	add.w	r2, r2, #8192	; 0x2000
    ad52:	6791      	str	r1, [r2, #120]	; 0x78
    ad54:	4a15      	ldr	r2, [pc, #84]	; (adac <RAILINT_415699d4fedc812ab5645a39d53b6366+0x14c>)
    ad56:	f8d2 10ec 	ldr.w	r1, [r2, #236]	; 0xec
    ad5a:	f502 5200 	add.w	r2, r2, #8192	; 0x2000
    ad5e:	f8c2 10e0 	str.w	r1, [r2, #224]	; 0xe0
    ad62:	4a13      	ldr	r2, [pc, #76]	; (adb0 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x150>)
    ad64:	6c51      	ldr	r1, [r2, #68]	; 0x44
    ad66:	f502 5200 	add.w	r2, r2, #8192	; 0x2000
    ad6a:	6391      	str	r1, [r2, #56]	; 0x38
    ad6c:	4911      	ldr	r1, [pc, #68]	; (adb4 <RAILINT_415699d4fedc812ab5645a39d53b6366+0x154>)
    ad6e:	f502 3280 	add.w	r2, r2, #65536	; 0x10000
    ad72:	6651      	str	r1, [r2, #100]	; 0x64
    ad74:	f64f 4208 	movw	r2, #64520	; 0xfc08
    ad78:	671a      	str	r2, [r3, #112]	; 0x70
    ad7a:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ad7e:	bf00      	nop
    ad80:	a8022000 	.word	0xa8022000
    ad84:	a801c000 	.word	0xa801c000
    ad88:	01010000 	.word	0x01010000
    ad8c:	b0001000 	.word	0xb0001000
    ad90:	a8020000 	.word	0xa8020000
    ad94:	ff0000df 	.word	0xff0000df
    ad98:	00300010 	.word	0x00300010
    ad9c:	b0001f00 	.word	0xb0001f00
    ada0:	0fe08000 	.word	0x0fe08000
    ada4:	a8004000 	.word	0xa8004000
    ada8:	a8014000 	.word	0xa8014000
    adac:	44004000 	.word	0x44004000
    adb0:	a800c000 	.word	0xa800c000
    adb4:	2f000050 	.word	0x2f000050

0000adb8 <FRC_IRQHandler>:
    adb8:	4b88      	ldr	r3, [pc, #544]	; (afdc <FRC_IRQHandler+0x224>)
    adba:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    adbe:	6e9f      	ldr	r7, [r3, #104]	; 0x68
    adc0:	6edb      	ldr	r3, [r3, #108]	; 0x6c
    adc2:	b085      	sub	sp, #20
    adc4:	401f      	ands	r7, r3
    adc6:	4b86      	ldr	r3, [pc, #536]	; (afe0 <FRC_IRQHandler+0x228>)
    adc8:	669f      	str	r7, [r3, #104]	; 0x68
    adca:	4b86      	ldr	r3, [pc, #536]	; (afe4 <FRC_IRQHandler+0x22c>)
    adcc:	f8d3 40e0 	ldr.w	r4, [r3, #224]	; 0xe0
    add0:	f8d3 30ec 	ldr.w	r3, [r3, #236]	; 0xec
    add4:	401c      	ands	r4, r3
    add6:	4b84      	ldr	r3, [pc, #528]	; (afe8 <FRC_IRQHandler+0x230>)
    add8:	f8c3 40e0 	str.w	r4, [r3, #224]	; 0xe0
    addc:	4b83      	ldr	r3, [pc, #524]	; (afec <FRC_IRQHandler+0x234>)
    adde:	f8d3 2208 	ldr.w	r2, [r3, #520]	; 0x208
    ade2:	f8d3 320c 	ldr.w	r3, [r3, #524]	; 0x20c
    ade6:	ea02 0903 	and.w	r9, r2, r3
    adea:	4b81      	ldr	r3, [pc, #516]	; (aff0 <FRC_IRQHandler+0x238>)
    adec:	f8c3 9208 	str.w	r9, [r3, #520]	; 0x208
    adf0:	f503 4320 	add.w	r3, r3, #40960	; 0xa000
    adf4:	69da      	ldr	r2, [r3, #28]
    adf6:	6a1b      	ldr	r3, [r3, #32]
    adf8:	ea02 0803 	and.w	r8, r2, r3
    adfc:	4b7d      	ldr	r3, [pc, #500]	; (aff4 <FRC_IRQHandler+0x23c>)
    adfe:	4a7e      	ldr	r2, [pc, #504]	; (aff8 <FRC_IRQHandler+0x240>)
    ae00:	ea08 0303 	and.w	r3, r8, r3
    ae04:	61d3      	str	r3, [r2, #28]
    ae06:	4b7d      	ldr	r3, [pc, #500]	; (affc <FRC_IRQHandler+0x244>)
    ae08:	f8d3 2204 	ldr.w	r2, [r3, #516]	; 0x204
    ae0c:	06d0      	lsls	r0, r2, #27
    ae0e:	d406      	bmi.n	ae1e <FRC_IRQHandler+0x66>
    ae10:	f8d3 3104 	ldr.w	r3, [r3, #260]	; 0x104
    ae14:	06d9      	lsls	r1, r3, #27
    ae16:	f3c3 1600 	ubfx	r6, r3, #4, #1
    ae1a:	f140 80c4 	bpl.w	afa6 <FRC_IRQHandler+0x1ee>
    ae1e:	f7fb f955 	bl	60cc <CORE_EnterCritical>
    ae22:	4b77      	ldr	r3, [pc, #476]	; (b000 <FRC_IRQHandler+0x248>)
    ae24:	695a      	ldr	r2, [r3, #20]
    ae26:	6e5e      	ldr	r6, [r3, #100]	; 0x64
    ae28:	6f1b      	ldr	r3, [r3, #112]	; 0x70
    ae2a:	f012 0f06 	tst.w	r2, #6
    ae2e:	ea06 0603 	and.w	r6, r6, r3
    ae32:	4a74      	ldr	r2, [pc, #464]	; (b004 <FRC_IRQHandler+0x24c>)
    ae34:	f026 7300 	bic.w	r3, r6, #33554432	; 0x2000000
    ae38:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
    ae3c:	bf14      	ite	ne
    ae3e:	f04f 0a01 	movne.w	sl, #1
    ae42:	f04f 0a00 	moveq.w	sl, #0
    ae46:	6653      	str	r3, [r2, #100]	; 0x64
    ae48:	0772      	lsls	r2, r6, #29
    ae4a:	d504      	bpl.n	ae56 <FRC_IRQHandler+0x9e>
    ae4c:	4a6e      	ldr	r2, [pc, #440]	; (b008 <FRC_IRQHandler+0x250>)
    ae4e:	7d53      	ldrb	r3, [r2, #21]
    ae50:	3301      	adds	r3, #1
    ae52:	b2db      	uxtb	r3, r3
    ae54:	7553      	strb	r3, [r2, #21]
    ae56:	f7fb f93d 	bl	60d4 <CORE_ExitCritical>
    ae5a:	2f00      	cmp	r7, #0
    ae5c:	f000 80ba 	beq.w	afd4 <FRC_IRQHandler+0x21c>
    ae60:	f417 4300 	ands.w	r3, r7, #32768	; 0x8000
    ae64:	f000 80a1 	beq.w	afaa <FRC_IRQHandler+0x1f2>
    ae68:	4b68      	ldr	r3, [pc, #416]	; (b00c <FRC_IRQHandler+0x254>)
    ae6a:	f8d3 b070 	ldr.w	fp, [r3, #112]	; 0x70
    ae6e:	f503 5300 	add.w	r3, r3, #8192	; 0x2000
    ae72:	f40b 55e0 	and.w	r5, fp, #7168	; 0x1c00
    ae76:	671d      	str	r5, [r3, #112]	; 0x70
    ae78:	f7ff fe54 	bl	ab24 <RAILINT_cda8bf84b67189e08b64149f714e0ad8>
    ae7c:	2d00      	cmp	r5, #0
    ae7e:	f000 8097 	beq.w	afb0 <FRC_IRQHandler+0x1f8>
    ae82:	f41b 5580 	ands.w	r5, fp, #4096	; 0x1000
    ae86:	f040 8096 	bne.w	afb6 <FRC_IRQHandler+0x1fe>
    ae8a:	f41b 6f80 	tst.w	fp, #1024	; 0x400
    ae8e:	bf14      	ite	ne
    ae90:	f04f 6b80 	movne.w	fp, #67108864	; 0x4000000
    ae94:	f04f 5b80 	moveq.w	fp, #268435456	; 0x10000000
    ae98:	07bb      	lsls	r3, r7, #30
    ae9a:	d50a      	bpl.n	aeb2 <FRC_IRQHandler+0xfa>
    ae9c:	4a5b      	ldr	r2, [pc, #364]	; (b00c <FRC_IRQHandler+0x254>)
    ae9e:	4856      	ldr	r0, [pc, #344]	; (aff8 <FRC_IRQHandler+0x240>)
    aea0:	6f12      	ldr	r2, [r2, #112]	; 0x70
    aea2:	f402 4160 	and.w	r1, r2, #57344	; 0xe000
    aea6:	6701      	str	r1, [r0, #112]	; 0x70
    aea8:	2900      	cmp	r1, #0
    aeaa:	f040 8087 	bne.w	afbc <FRC_IRQHandler+0x204>
    aeae:	f04b 7b00 	orr.w	fp, fp, #33554432	; 0x2000000
    aeb2:	f417 5700 	ands.w	r7, r7, #8192	; 0x2000
    aeb6:	bf18      	it	ne
    aeb8:	2702      	movne	r7, #2
    aeba:	4a55      	ldr	r2, [pc, #340]	; (b010 <FRC_IRQHandler+0x258>)
    aebc:	4022      	ands	r2, r4
    aebe:	2a00      	cmp	r2, #0
    aec0:	d04a      	beq.n	af58 <FRC_IRQHandler+0x1a0>
    aec2:	f414 6f20 	tst.w	r4, #2560	; 0xa00
    aec6:	d00a      	beq.n	aede <FRC_IRQHandler+0x126>
    aec8:	2000      	movs	r0, #0
    aeca:	f7ff fea5 	bl	ac18 <RAILINT_a7d421cde8a91be6637558edc84e4002>
    aece:	f44f 62d5 	mov.w	r2, #1704	; 0x6a8
    aed2:	2106      	movs	r1, #6
    aed4:	2000      	movs	r0, #0
    aed6:	f424 2480 	bic.w	r4, r4, #262144	; 0x40000
    aeda:	f7fc f92d 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    aede:	05e2      	lsls	r2, r4, #23
    aee0:	d506      	bpl.n	aef0 <FRC_IRQHandler+0x138>
    aee2:	21ff      	movs	r1, #255	; 0xff
    aee4:	4a44      	ldr	r2, [pc, #272]	; (aff8 <FRC_IRQHandler+0x240>)
    aee6:	f44b 6bc0 	orr.w	fp, fp, #1536	; 0x600
    aeea:	6091      	str	r1, [r2, #8]
    aeec:	f7ff fb72 	bl	a5d4 <RAILINT_ef38b49f1deb3f763f4f0e2ae372d117>
    aef0:	f014 0f09 	tst.w	r4, #9
    aef4:	d00a      	beq.n	af0c <FRC_IRQHandler+0x154>
    aef6:	f7ff fb81 	bl	a5fc <RAILINT_1f111261e83374ea84a9c5469ceac557>
    aefa:	2101      	movs	r1, #1
    aefc:	4a39      	ldr	r2, [pc, #228]	; (afe4 <FRC_IRQHandler+0x22c>)
    aefe:	2000      	movs	r0, #0
    af00:	6311      	str	r1, [r2, #48]	; 0x30
    af02:	f240 62bb 	movw	r2, #1723	; 0x6bb
    af06:	2108      	movs	r1, #8
    af08:	f7fc f916 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    af0c:	f014 6f10 	tst.w	r4, #150994944	; 0x9000000
    af10:	d00c      	beq.n	af2c <FRC_IRQHandler+0x174>
    af12:	f7ff fb73 	bl	a5fc <RAILINT_1f111261e83374ea84a9c5469ceac557>
    af16:	2200      	movs	r2, #0
    af18:	4611      	mov	r1, r2
    af1a:	4610      	mov	r0, r2
    af1c:	f7fd fd64 	bl	89e8 <RAILINT_3ed2ccbe6359cb941c07e51a82b4c080>
    af20:	f240 62c4 	movw	r2, #1732	; 0x6c4
    af24:	2109      	movs	r1, #9
    af26:	2000      	movs	r0, #0
    af28:	f7fc f906 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    af2c:	f414 2f20 	tst.w	r4, #655360	; 0xa0000
    af30:	d00a      	beq.n	af48 <FRC_IRQHandler+0x190>
    af32:	2000      	movs	r0, #0
    af34:	f7ff fe70 	bl	ac18 <RAILINT_a7d421cde8a91be6637558edc84e4002>
    af38:	f240 62cf 	movw	r2, #1743	; 0x6cf
    af3c:	2107      	movs	r1, #7
    af3e:	2000      	movs	r0, #0
    af40:	f424 2480 	bic.w	r4, r4, #262144	; 0x40000
    af44:	f7fc f8f8 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    af48:	03e3      	lsls	r3, r4, #15
    af4a:	d501      	bpl.n	af50 <FRC_IRQHandler+0x198>
    af4c:	f7fd fecc 	bl	8ce8 <RAILINT_6e9511005f24d0489b4328a9cd887def>
    af50:	2c00      	cmp	r4, #0
    af52:	bfb8      	it	lt
    af54:	f047 0708 	orrlt.w	r7, r7, #8
    af58:	0760      	lsls	r0, r4, #29
    af5a:	d50d      	bpl.n	af78 <FRC_IRQHandler+0x1c0>
    af5c:	4a21      	ldr	r2, [pc, #132]	; (afe4 <FRC_IRQHandler+0x22c>)
    af5e:	6ad2      	ldr	r2, [r2, #44]	; 0x2c
    af60:	f412 5f00 	tst.w	r2, #8192	; 0x2000
    af64:	f44f 5200 	mov.w	r2, #8192	; 0x2000
    af68:	bf17      	itett	ne
    af6a:	491f      	ldrne	r1, [pc, #124]	; (afe8 <FRC_IRQHandler+0x230>)
    af6c:	4929      	ldreq	r1, [pc, #164]	; (b014 <FRC_IRQHandler+0x25c>)
    af6e:	62ca      	strne	r2, [r1, #44]	; 0x2c
    af70:	f44b 0b00 	orrne.w	fp, fp, #8388608	; 0x800000
    af74:	bf08      	it	eq
    af76:	62ca      	streq	r2, [r1, #44]	; 0x2c
    af78:	0561      	lsls	r1, r4, #21
    af7a:	bf48      	it	mi
    af7c:	f04b 0b04 	orrmi.w	fp, fp, #4
    af80:	f414 2380 	ands.w	r3, r4, #262144	; 0x40000
    af84:	9301      	str	r3, [sp, #4]
    af86:	f000 80a7 	beq.w	b0d8 <FRC_IRQHandler+0x320>
    af8a:	f7fd fe6f 	bl	8c6c <RAILINT_0906929bba6a17fd8a9605e65064a9f4>
    af8e:	3801      	subs	r0, #1
    af90:	2806      	cmp	r0, #6
    af92:	d841      	bhi.n	b018 <FRC_IRQHandler+0x260>
    af94:	e8df f010 	tbh	[pc, r0, lsl #1]
    af98:	011b0118 	.word	0x011b0118
    af9c:	011e0118 	.word	0x011e0118
    afa0:	01240121 	.word	0x01240121
    afa4:	0124      	.short	0x0124
    afa6:	46b2      	mov	sl, r6
    afa8:	e757      	b.n	ae5a <FRC_IRQHandler+0xa2>
    afaa:	469b      	mov	fp, r3
    afac:	2500      	movs	r5, #0
    afae:	e773      	b.n	ae98 <FRC_IRQHandler+0xe0>
    afb0:	f04f 7b80 	mov.w	fp, #16777216	; 0x1000000
    afb4:	e770      	b.n	ae98 <FRC_IRQHandler+0xe0>
    afb6:	f04f 4b80 	mov.w	fp, #1073741824	; 0x40000000
    afba:	e7f7      	b.n	afac <FRC_IRQHandler+0x1f4>
    afbc:	0410      	lsls	r0, r2, #16
    afbe:	d502      	bpl.n	afc6 <FRC_IRQHandler+0x20e>
    afc0:	f04b 4b00 	orr.w	fp, fp, #2147483648	; 0x80000000
    afc4:	e775      	b.n	aeb2 <FRC_IRQHandler+0xfa>
    afc6:	0491      	lsls	r1, r2, #18
    afc8:	bf4c      	ite	mi
    afca:	f04b 6b00 	orrmi.w	fp, fp, #134217728	; 0x8000000
    afce:	f04b 5b00 	orrpl.w	fp, fp, #536870912	; 0x20000000
    afd2:	e76e      	b.n	aeb2 <FRC_IRQHandler+0xfa>
    afd4:	46bb      	mov	fp, r7
    afd6:	463d      	mov	r5, r7
    afd8:	e76f      	b.n	aeba <FRC_IRQHandler+0x102>
    afda:	bf00      	nop
    afdc:	a8004000 	.word	0xa8004000
    afe0:	a8006000 	.word	0xa8006000
    afe4:	44004000 	.word	0x44004000
    afe8:	44006000 	.word	0x44006000
    afec:	a8014000 	.word	0xa8014000
    aff0:	a8016000 	.word	0xa8016000
    aff4:	fff70000 	.word	0xfff70000
    aff8:	a8022000 	.word	0xa8022000
    affc:	e000e100 	.word	0xe000e100
    b000:	a801c000 	.word	0xa801c000
    b004:	a801e000 	.word	0xa801e000
    b008:	20000e1c 	.word	0x20000e1c
    b00c:	a8020000 	.word	0xa8020000
    b010:	890b0b09 	.word	0x890b0b09
    b014:	44005000 	.word	0x44005000
    b018:	f240 62fb 	movw	r2, #1787	; 0x6fb
    b01c:	2103      	movs	r1, #3
    b01e:	2000      	movs	r0, #0
    b020:	f7fc f88a 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    b024:	2101      	movs	r1, #1
    b026:	487b      	ldr	r0, [pc, #492]	; (b214 <FRC_IRQHandler+0x45c>)
    b028:	6e82      	ldr	r2, [r0, #104]	; 0x68
    b02a:	f8d0 3088 	ldr.w	r3, [r0, #136]	; 0x88
    b02e:	f002 0207 	and.w	r2, r2, #7
    b032:	3206      	adds	r2, #6
    b034:	fa01 f202 	lsl.w	r2, r1, r2
    b038:	f3c3 0c0c 	ubfx	ip, r3, #0, #13
    b03c:	eba2 020c 	sub.w	r2, r2, ip
    b040:	b292      	uxth	r2, r2
    b042:	2a07      	cmp	r2, #7
    b044:	d912      	bls.n	b06c <FRC_IRQHandler+0x2b4>
    b046:	4a74      	ldr	r2, [pc, #464]	; (b218 <FRC_IRQHandler+0x460>)
    b048:	6f12      	ldr	r2, [r2, #112]	; 0x70
    b04a:	0252      	lsls	r2, r2, #9
    b04c:	d40e      	bmi.n	b06c <FRC_IRQHandler+0x2b4>
    b04e:	4b73      	ldr	r3, [pc, #460]	; (b21c <FRC_IRQHandler+0x464>)
    b050:	6b82      	ldr	r2, [r0, #56]	; 0x38
    b052:	6d80      	ldr	r0, [r0, #88]	; 0x58
    b054:	6d5b      	ldr	r3, [r3, #84]	; 0x54
    b056:	b15b      	cbz	r3, b070 <FRC_IRQHandler+0x2b8>
    b058:	f002 0207 	and.w	r2, r2, #7
    b05c:	3206      	adds	r2, #6
    b05e:	4091      	lsls	r1, r2
    b060:	f3c0 000c 	ubfx	r0, r0, #0, #13
    b064:	1a09      	subs	r1, r1, r0
    b066:	b289      	uxth	r1, r1
    b068:	2905      	cmp	r1, #5
    b06a:	d801      	bhi.n	b070 <FRC_IRQHandler+0x2b8>
    b06c:	f44b 7b00 	orr.w	fp, fp, #512	; 0x200
    b070:	4a6b      	ldr	r2, [pc, #428]	; (b220 <FRC_IRQHandler+0x468>)
    b072:	7812      	ldrb	r2, [r2, #0]
    b074:	2a00      	cmp	r2, #0
    b076:	d02f      	beq.n	b0d8 <FRC_IRQHandler+0x320>
    b078:	4a66      	ldr	r2, [pc, #408]	; (b214 <FRC_IRQHandler+0x45c>)
    b07a:	f8d2 20e0 	ldr.w	r2, [r2, #224]	; 0xe0
    b07e:	f412 2fa0 	tst.w	r2, #327680	; 0x50000
    b082:	d129      	bne.n	b0d8 <FRC_IRQHandler+0x320>
    b084:	4a67      	ldr	r2, [pc, #412]	; (b224 <FRC_IRQHandler+0x46c>)
    b086:	4968      	ldr	r1, [pc, #416]	; (b228 <FRC_IRQHandler+0x470>)
    b088:	7812      	ldrb	r2, [r2, #0]
    b08a:	b97a      	cbnz	r2, b0ac <FRC_IRQHandler+0x2f4>
    b08c:	f416 5280 	ands.w	r2, r6, #4096	; 0x1000
    b090:	d10c      	bne.n	b0ac <FRC_IRQHandler+0x2f4>
    b092:	7808      	ldrb	r0, [r1, #0]
    b094:	b150      	cbz	r0, b0ac <FRC_IRQHandler+0x2f4>
    b096:	f01b 0f08 	tst.w	fp, #8
    b09a:	bf08      	it	eq
    b09c:	2202      	moveq	r2, #2
    b09e:	4863      	ldr	r0, [pc, #396]	; (b22c <FRC_IRQHandler+0x474>)
    b0a0:	f8d0 0ecc 	ldr.w	r0, [r0, #3788]	; 0xecc
    b0a4:	fa20 f202 	lsr.w	r2, r0, r2
    b0a8:	0793      	lsls	r3, r2, #30
    b0aa:	d115      	bne.n	b0d8 <FRC_IRQHandler+0x320>
    b0ac:	2004      	movs	r0, #4
    b0ae:	f7fe fab9 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    b0b2:	4a5f      	ldr	r2, [pc, #380]	; (b230 <FRC_IRQHandler+0x478>)
    b0b4:	485f      	ldr	r0, [pc, #380]	; (b234 <FRC_IRQHandler+0x47c>)
    b0b6:	6750      	str	r0, [r2, #116]	; 0x74
    b0b8:	f7ff fa7e 	bl	a5b8 <RAILINT_6d8967e14ffa5fbb64f5f8549fa17b5c>
    b0bc:	495a      	ldr	r1, [pc, #360]	; (b228 <FRC_IRQHandler+0x470>)
    b0be:	780a      	ldrb	r2, [r1, #0]
    b0c0:	b932      	cbnz	r2, b0d0 <FRC_IRQHandler+0x318>
    b0c2:	4a5d      	ldr	r2, [pc, #372]	; (b238 <FRC_IRQHandler+0x480>)
    b0c4:	495d      	ldr	r1, [pc, #372]	; (b23c <FRC_IRQHandler+0x484>)
    b0c6:	6812      	ldr	r2, [r2, #0]
    b0c8:	ea0b 0202 	and.w	r2, fp, r2
    b0cc:	420a      	tst	r2, r1
    b0ce:	d101      	bne.n	b0d4 <FRC_IRQHandler+0x31c>
    b0d0:	f44b 4b80 	orr.w	fp, fp, #16384	; 0x4000
    b0d4:	f426 5680 	bic.w	r6, r6, #4096	; 0x1000
    b0d8:	f1b9 0f00 	cmp.w	r9, #0
    b0dc:	d01d      	beq.n	b11a <FRC_IRQHandler+0x362>
    b0de:	f419 5f80 	tst.w	r9, #4096	; 0x1000
    b0e2:	bf18      	it	ne
    b0e4:	f44b 2b80 	orrne.w	fp, fp, #262144	; 0x40000
    b0e8:	f419 7f80 	tst.w	r9, #256	; 0x100
    b0ec:	bf18      	it	ne
    b0ee:	f44b 2b00 	orrne.w	fp, fp, #524288	; 0x80000
    b0f2:	f419 5f00 	tst.w	r9, #8192	; 0x2000
    b0f6:	bf18      	it	ne
    b0f8:	f04b 0b10 	orrne.w	fp, fp, #16
    b0fc:	f419 7f00 	tst.w	r9, #512	; 0x200
    b100:	bf18      	it	ne
    b102:	f04b 0b20 	orrne.w	fp, fp, #32
    b106:	f419 6f80 	tst.w	r9, #1024	; 0x400
    b10a:	bf18      	it	ne
    b10c:	f04b 0b40 	orrne.w	fp, fp, #64	; 0x40
    b110:	f419 6f00 	tst.w	r9, #2048	; 0x800
    b114:	bf18      	it	ne
    b116:	f04b 0b80 	orrne.w	fp, fp, #128	; 0x80
    b11a:	f1b8 0f00 	cmp.w	r8, #0
    b11e:	d036      	beq.n	b18e <FRC_IRQHandler+0x3d6>
    b120:	f418 2f80 	tst.w	r8, #262144	; 0x40000
    b124:	bf18      	it	ne
    b126:	f44f 7500 	movne.w	r5, #512	; 0x200
    b12a:	f418 3f80 	tst.w	r8, #65536	; 0x10000
    b12e:	bf18      	it	ne
    b130:	f44b 5b80 	orrne.w	fp, fp, #4096	; 0x1000
    b134:	f418 1f80 	tst.w	r8, #1048576	; 0x100000
    b138:	bf18      	it	ne
    b13a:	f44b 3b00 	orrne.w	fp, fp, #131072	; 0x20000
    b13e:	f418 1f00 	tst.w	r8, #2097152	; 0x200000
    b142:	bf18      	it	ne
    b144:	f04b 0b02 	orrne.w	fp, fp, #2
    b148:	f418 3f00 	tst.w	r8, #131072	; 0x20000
    b14c:	bf18      	it	ne
    b14e:	f44b 1b80 	orrne.w	fp, fp, #1048576	; 0x100000
    b152:	f418 0f80 	tst.w	r8, #4194304	; 0x400000
    b156:	bf18      	it	ne
    b158:	f045 0510 	orrne.w	r5, r5, #16
    b15c:	f418 2f00 	tst.w	r8, #524288	; 0x80000
    b160:	d015      	beq.n	b18e <FRC_IRQHandler+0x3d6>
    b162:	4a32      	ldr	r2, [pc, #200]	; (b22c <FRC_IRQHandler+0x474>)
    b164:	f8d2 2e9c 	ldr.w	r2, [r2, #3740]	; 0xe9c
    b168:	f012 0fc0 	tst.w	r2, #192	; 0xc0
    b16c:	d00f      	beq.n	b18e <FRC_IRQHandler+0x3d6>
    b16e:	492a      	ldr	r1, [pc, #168]	; (b218 <FRC_IRQHandler+0x460>)
    b170:	68ca      	ldr	r2, [r1, #12]
    b172:	f3c2 6203 	ubfx	r2, r2, #24, #4
    b176:	2a03      	cmp	r2, #3
    b178:	d001      	beq.n	b17e <FRC_IRQHandler+0x3c6>
    b17a:	2a07      	cmp	r2, #7
    b17c:	d133      	bne.n	b1e6 <FRC_IRQHandler+0x42e>
    b17e:	6f4a      	ldr	r2, [r1, #116]	; 0x74
    b180:	06d0      	lsls	r0, r2, #27
    b182:	d430      	bmi.n	b1e6 <FRC_IRQHandler+0x42e>
    b184:	6f8a      	ldr	r2, [r1, #120]	; 0x78
    b186:	0712      	lsls	r2, r2, #28
    b188:	d42d      	bmi.n	b1e6 <FRC_IRQHandler+0x42e>
    b18a:	f44b 1b00 	orr.w	fp, fp, #2097152	; 0x200000
    b18e:	2e00      	cmp	r6, #0
    b190:	f000 810a 	beq.w	b3a8 <FRC_IRQHandler+0x5f0>
    b194:	0533      	lsls	r3, r6, #20
    b196:	f140 808a 	bpl.w	b2ae <FRC_IRQHandler+0x4f6>
    b19a:	4829      	ldr	r0, [pc, #164]	; (b240 <FRC_IRQHandler+0x488>)
    b19c:	f8df 9090 	ldr.w	r9, [pc, #144]	; b230 <FRC_IRQHandler+0x478>
    b1a0:	78c2      	ldrb	r2, [r0, #3]
    b1a2:	4928      	ldr	r1, [pc, #160]	; (b244 <FRC_IRQHandler+0x48c>)
    b1a4:	2a00      	cmp	r2, #0
    b1a6:	d055      	beq.n	b254 <FRC_IRQHandler+0x49c>
    b1a8:	f44f 6300 	mov.w	r3, #2048	; 0x800
    b1ac:	3a01      	subs	r2, #1
    b1ae:	b2d2      	uxtb	r2, r2
    b1b0:	664b      	str	r3, [r1, #100]	; 0x64
    b1b2:	70c2      	strb	r2, [r0, #3]
    b1b4:	bb3a      	cbnz	r2, b206 <FRC_IRQHandler+0x44e>
    b1b6:	4924      	ldr	r1, [pc, #144]	; (b248 <FRC_IRQHandler+0x490>)
    b1b8:	7808      	ldrb	r0, [r1, #0]
    b1ba:	b1d8      	cbz	r0, b1f4 <FRC_IRQHandler+0x43c>
    b1bc:	f640 4001 	movw	r0, #3073	; 0xc01
    b1c0:	4922      	ldr	r1, [pc, #136]	; (b24c <FRC_IRQHandler+0x494>)
    b1c2:	6748      	str	r0, [r1, #116]	; 0x74
    b1c4:	2100      	movs	r1, #0
    b1c6:	e06f      	b.n	b2a8 <FRC_IRQHandler+0x4f0>
    b1c8:	f44b 3b80 	orr.w	fp, fp, #65536	; 0x10000
    b1cc:	e72a      	b.n	b024 <FRC_IRQHandler+0x26c>
    b1ce:	f44b 6b00 	orr.w	fp, fp, #2048	; 0x800
    b1d2:	e727      	b.n	b024 <FRC_IRQHandler+0x26c>
    b1d4:	f44b 6b80 	orr.w	fp, fp, #1024	; 0x400
    b1d8:	e724      	b.n	b024 <FRC_IRQHandler+0x26c>
    b1da:	f44b 7b80 	orr.w	fp, fp, #256	; 0x100
    b1de:	e721      	b.n	b024 <FRC_IRQHandler+0x26c>
    b1e0:	f04b 0b08 	orr.w	fp, fp, #8
    b1e4:	e71e      	b.n	b024 <FRC_IRQHandler+0x26c>
    b1e6:	f44f 2100 	mov.w	r1, #524288	; 0x80000
    b1ea:	4a19      	ldr	r2, [pc, #100]	; (b250 <FRC_IRQHandler+0x498>)
    b1ec:	f428 2800 	bic.w	r8, r8, #524288	; 0x80000
    b1f0:	61d1      	str	r1, [r2, #28]
    b1f2:	e7cc      	b.n	b18e <FRC_IRQHandler+0x3d6>
    b1f4:	f8d9 2078 	ldr.w	r2, [r9, #120]	; 0x78
    b1f8:	f412 52a0 	ands.w	r2, r2, #5120	; 0x1400
    b1fc:	d005      	beq.n	b20a <FRC_IRQHandler+0x452>
    b1fe:	f44f 7280 	mov.w	r2, #256	; 0x100
    b202:	f8c9 2058 	str.w	r2, [r9, #88]	; 0x58
    b206:	2200      	movs	r2, #0
    b208:	e7dc      	b.n	b1c4 <FRC_IRQHandler+0x40c>
    b20a:	f640 4101 	movw	r1, #3073	; 0xc01
    b20e:	f8c9 1078 	str.w	r1, [r9, #120]	; 0x78
    b212:	e7d7      	b.n	b1c4 <FRC_IRQHandler+0x40c>
    b214:	44004000 	.word	0x44004000
    b218:	a8020000 	.word	0xa8020000
    b21c:	a8004000 	.word	0xa8004000
    b220:	20000e19 	.word	0x20000e19
    b224:	20000e1a 	.word	0x20000e1a
    b228:	20000e36 	.word	0x20000e36
    b22c:	b0001000 	.word	0xb0001000
    b230:	a801c000 	.word	0xa801c000
    b234:	01010000 	.word	0x01010000
    b238:	20000e10 	.word	0x20000e10
    b23c:	00018d08 	.word	0x00018d08
    b240:	20000d9c 	.word	0x20000d9c
    b244:	a801e000 	.word	0xa801e000
    b248:	20000e34 	.word	0x20000e34
    b24c:	a801d000 	.word	0xa801d000
    b250:	a8022000 	.word	0xa8022000
    b254:	2003      	movs	r0, #3
    b256:	f7fe f9e5 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    b25a:	f8d9 2014 	ldr.w	r2, [r9, #20]
    b25e:	f44f 6000 	mov.w	r0, #2048	; 0x800
    b262:	f012 0f06 	tst.w	r2, #6
    b266:	bf02      	ittt	eq
    b268:	f641 721f 	movweq	r2, #7967	; 0x1f1f
    b26c:	4994      	ldreq	r1, [pc, #592]	; (b4c0 <FRC_IRQHandler+0x708>)
    b26e:	674a      	streq	r2, [r1, #116]	; 0x74
    b270:	4a93      	ldr	r2, [pc, #588]	; (b4c0 <FRC_IRQHandler+0x708>)
    b272:	4994      	ldr	r1, [pc, #592]	; (b4c4 <FRC_IRQHandler+0x70c>)
    b274:	6650      	str	r0, [r2, #100]	; 0x64
    b276:	694a      	ldr	r2, [r1, #20]
    b278:	4893      	ldr	r0, [pc, #588]	; (b4c8 <FRC_IRQHandler+0x710>)
    b27a:	f012 0206 	ands.w	r2, r2, #6
    b27e:	bf08      	it	eq
    b280:	678a      	streq	r2, [r1, #120]	; 0x78
    b282:	8ac2      	ldrh	r2, [r0, #22]
    b284:	f412 6100 	ands.w	r1, r2, #2048	; 0x800
    b288:	d062      	beq.n	b350 <FRC_IRQHandler+0x598>
    b28a:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
    b28e:	82c2      	strh	r2, [r0, #22]
    b290:	4a8e      	ldr	r2, [pc, #568]	; (b4cc <FRC_IRQHandler+0x714>)
    b292:	f892 9000 	ldrb.w	r9, [r2]
    b296:	f1b9 0f00 	cmp.w	r9, #0
    b29a:	d15c      	bne.n	b356 <FRC_IRQHandler+0x59e>
    b29c:	f7fe fa00 	bl	96a0 <RAILINT_91acd8a0b3b22b251b18aeabdb4a57f7>
    b2a0:	f7ff fc40 	bl	ab24 <RAILINT_cda8bf84b67189e08b64149f714e0ad8>
    b2a4:	464a      	mov	r2, r9
    b2a6:	2120      	movs	r1, #32
    b2a8:	ea4b 0b02 	orr.w	fp, fp, r2
    b2ac:	430d      	orrs	r5, r1
    b2ae:	00b0      	lsls	r0, r6, #2
    b2b0:	d509      	bpl.n	b2c6 <FRC_IRQHandler+0x50e>
    b2b2:	202b      	movs	r0, #43	; 0x2b
    b2b4:	f7fe f92e 	bl	9514 <PTI_AuxdataOutput>
    b2b8:	f04f 5100 	mov.w	r1, #536870912	; 0x20000000
    b2bc:	4a80      	ldr	r2, [pc, #512]	; (b4c0 <FRC_IRQHandler+0x708>)
    b2be:	f045 0508 	orr.w	r5, r5, #8
    b2c2:	6711      	str	r1, [r2, #112]	; 0x70
    b2c4:	6651      	str	r1, [r2, #100]	; 0x64
    b2c6:	f016 6f30 	tst.w	r6, #184549376	; 0xb000000
    b2ca:	d105      	bne.n	b2d8 <FRC_IRQHandler+0x520>
    b2cc:	04f1      	lsls	r1, r6, #19
    b2ce:	d560      	bpl.n	b392 <FRC_IRQHandler+0x5da>
    b2d0:	f1ba 0f00 	cmp.w	sl, #0
    b2d4:	f000 8097 	beq.w	b406 <FRC_IRQHandler+0x64e>
    b2d8:	0132      	lsls	r2, r6, #4
    b2da:	d53f      	bpl.n	b35c <FRC_IRQHandler+0x5a4>
    b2dc:	2029      	movs	r0, #41	; 0x29
    b2de:	f7fe f919 	bl	9514 <PTI_AuxdataOutput>
    b2e2:	4a78      	ldr	r2, [pc, #480]	; (b4c4 <FRC_IRQHandler+0x70c>)
    b2e4:	f045 0904 	orr.w	r9, r5, #4
    b2e8:	6c52      	ldr	r2, [r2, #68]	; 0x44
    b2ea:	b112      	cbz	r2, b2f2 <FRC_IRQHandler+0x53a>
    b2ec:	2110      	movs	r1, #16
    b2ee:	4a78      	ldr	r2, [pc, #480]	; (b4d0 <FRC_IRQHandler+0x718>)
    b2f0:	6091      	str	r1, [r2, #8]
    b2f2:	f7ff fbc5 	bl	aa80 <RAILINT_436bf61abb715dbe168d75ac0bccdfdf>
    b2f6:	b188      	cbz	r0, b31c <FRC_IRQHandler+0x564>
    b2f8:	f04f 5200 	mov.w	r2, #536870912	; 0x20000000
    b2fc:	4875      	ldr	r0, [pc, #468]	; (b4d4 <FRC_IRQHandler+0x71c>)
    b2fe:	4970      	ldr	r1, [pc, #448]	; (b4c0 <FRC_IRQHandler+0x708>)
    b300:	664a      	str	r2, [r1, #100]	; 0x64
    b302:	6702      	str	r2, [r0, #112]	; 0x70
    b304:	f500 5040 	add.w	r0, r0, #12288	; 0x3000
    b308:	68c0      	ldr	r0, [r0, #12]
    b30a:	0443      	lsls	r3, r0, #17
    b30c:	d506      	bpl.n	b31c <FRC_IRQHandler+0x564>
    b30e:	670a      	str	r2, [r1, #112]	; 0x70
    b310:	202d      	movs	r0, #45	; 0x2d
    b312:	664a      	str	r2, [r1, #100]	; 0x64
    b314:	f045 090c 	orr.w	r9, r5, #12
    b318:	f7fe f8fc 	bl	9514 <PTI_AuxdataOutput>
    b31c:	f016 7a00 	ands.w	sl, r6, #33554432	; 0x2000000
    b320:	d01e      	beq.n	b360 <FRC_IRQHandler+0x5a8>
    b322:	2004      	movs	r0, #4
    b324:	f7fe f97e 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    b328:	2027      	movs	r0, #39	; 0x27
    b32a:	f7fe f8f3 	bl	9514 <PTI_AuxdataOutput>
    b32e:	f7ff fbf9 	bl	ab24 <RAILINT_cda8bf84b67189e08b64149f714e0ad8>
    b332:	f04f 7100 	mov.w	r1, #33554432	; 0x2000000
    b336:	4a62      	ldr	r2, [pc, #392]	; (b4c0 <FRC_IRQHandler+0x708>)
    b338:	6651      	str	r1, [r2, #100]	; 0x64
    b33a:	4a67      	ldr	r2, [pc, #412]	; (b4d8 <FRC_IRQHandler+0x720>)
    b33c:	f049 0902 	orr.w	r9, r9, #2
    b340:	f8d2 2ecc 	ldr.w	r2, [r2, #3788]	; 0xecc
    b344:	0651      	lsls	r1, r2, #25
    b346:	bf5e      	ittt	pl
    b348:	2102      	movpl	r1, #2
    b34a:	4a61      	ldrpl	r2, [pc, #388]	; (b4d0 <FRC_IRQHandler+0x718>)
    b34c:	6091      	strpl	r1, [r2, #8]
    b34e:	e01c      	b.n	b38a <FRC_IRQHandler+0x5d2>
    b350:	f44f 5200 	mov.w	r2, #8192	; 0x2000
    b354:	e7a8      	b.n	b2a8 <FRC_IRQHandler+0x4f0>
    b356:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    b35a:	e733      	b.n	b1c4 <FRC_IRQHandler+0x40c>
    b35c:	46a9      	mov	r9, r5
    b35e:	e7dd      	b.n	b31c <FRC_IRQHandler+0x564>
    b360:	f016 7f80 	tst.w	r6, #16777216	; 0x1000000
    b364:	4d57      	ldr	r5, [pc, #348]	; (b4c4 <FRC_IRQHandler+0x70c>)
    b366:	d03b      	beq.n	b3e0 <FRC_IRQHandler+0x628>
    b368:	2004      	movs	r0, #4
    b36a:	f7fe f95b 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    b36e:	2028      	movs	r0, #40	; 0x28
    b370:	f7fe f8d0 	bl	9514 <PTI_AuxdataOutput>
    b374:	6faa      	ldr	r2, [r5, #120]	; 0x78
    b376:	bb82      	cbnz	r2, b3da <FRC_IRQHandler+0x622>
    b378:	f7ff fbd4 	bl	ab24 <RAILINT_cda8bf84b67189e08b64149f714e0ad8>
    b37c:	f04f 5100 	mov.w	r1, #536870912	; 0x20000000
    b380:	4a4f      	ldr	r2, [pc, #316]	; (b4c0 <FRC_IRQHandler+0x708>)
    b382:	f049 0901 	orr.w	r9, r9, #1
    b386:	6711      	str	r1, [r2, #112]	; 0x70
    b388:	6651      	str	r1, [r2, #100]	; 0x64
    b38a:	2100      	movs	r1, #0
    b38c:	464d      	mov	r5, r9
    b38e:	4a4d      	ldr	r2, [pc, #308]	; (b4c4 <FRC_IRQHandler+0x70c>)
    b390:	6591      	str	r1, [r2, #88]	; 0x58
    b392:	0573      	lsls	r3, r6, #21
    b394:	d508      	bpl.n	b3a8 <FRC_IRQHandler+0x5f0>
    b396:	4951      	ldr	r1, [pc, #324]	; (b4dc <FRC_IRQHandler+0x724>)
    b398:	788a      	ldrb	r2, [r1, #2]
    b39a:	2a00      	cmp	r2, #0
    b39c:	f000 808a 	beq.w	b4b4 <FRC_IRQHandler+0x6fc>
    b3a0:	3a01      	subs	r2, #1
    b3a2:	708a      	strb	r2, [r1, #2]
    b3a4:	2200      	movs	r2, #0
    b3a6:	4317      	orrs	r7, r2
    b3a8:	463a      	mov	r2, r7
    b3aa:	4658      	mov	r0, fp
    b3ac:	4629      	mov	r1, r5
    b3ae:	f7ff f97d 	bl	a6ac <RAILINT_978af8e4393fb6ecb4e92f5256373899>
    b3b2:	9b01      	ldr	r3, [sp, #4]
    b3b4:	b10b      	cbz	r3, b3ba <FRC_IRQHandler+0x602>
    b3b6:	f7fd fc89 	bl	8ccc <RAILINT_31258cb71f8a6b9069347d576bc679f0>
    b3ba:	f418 2f00 	tst.w	r8, #524288	; 0x80000
    b3be:	bf18      	it	ne
    b3c0:	f44f 2200 	movne.w	r2, #524288	; 0x80000
    b3c4:	4b46      	ldr	r3, [pc, #280]	; (b4e0 <FRC_IRQHandler+0x728>)
    b3c6:	f004 3404 	and.w	r4, r4, #67372036	; 0x4040404
    b3ca:	f8c3 40e0 	str.w	r4, [r3, #224]	; 0xe0
    b3ce:	bf1c      	itt	ne
    b3d0:	4b3f      	ldrne	r3, [pc, #252]	; (b4d0 <FRC_IRQHandler+0x718>)
    b3d2:	61da      	strne	r2, [r3, #28]
    b3d4:	b005      	add	sp, #20
    b3d6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b3da:	f8c5 a078 	str.w	sl, [r5, #120]	; 0x78
    b3de:	e7cd      	b.n	b37c <FRC_IRQHandler+0x5c4>
    b3e0:	04f0      	lsls	r0, r6, #19
    b3e2:	d5d2      	bpl.n	b38a <FRC_IRQHandler+0x5d2>
    b3e4:	2004      	movs	r0, #4
    b3e6:	f7fe f91d 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    b3ea:	4a3e      	ldr	r2, [pc, #248]	; (b4e4 <FRC_IRQHandler+0x72c>)
    b3ec:	676a      	str	r2, [r5, #116]	; 0x74
    b3ee:	f7fe f957 	bl	96a0 <RAILINT_91acd8a0b3b22b251b18aeabdb4a57f7>
    b3f2:	6e6a      	ldr	r2, [r5, #100]	; 0x64
    b3f4:	f012 7f40 	tst.w	r2, #50331648	; 0x3000000
    b3f8:	d1c7      	bne.n	b38a <FRC_IRQHandler+0x5d2>
    b3fa:	202a      	movs	r0, #42	; 0x2a
    b3fc:	f7fe f88a 	bl	9514 <PTI_AuxdataOutput>
    b400:	f7ff fb90 	bl	ab24 <RAILINT_cda8bf84b67189e08b64149f714e0ad8>
    b404:	e799      	b.n	b33a <FRC_IRQHandler+0x582>
    b406:	4a38      	ldr	r2, [pc, #224]	; (b4e8 <FRC_IRQHandler+0x730>)
    b408:	6812      	ldr	r2, [r2, #0]
    b40a:	3201      	adds	r2, #1
    b40c:	d002      	beq.n	b414 <FRC_IRQHandler+0x65c>
    b40e:	f04b 0b01 	orr.w	fp, fp, #1
    b412:	e7be      	b.n	b392 <FRC_IRQHandler+0x5da>
    b414:	4931      	ldr	r1, [pc, #196]	; (b4dc <FRC_IRQHandler+0x724>)
    b416:	790a      	ldrb	r2, [r1, #4]
    b418:	b14a      	cbz	r2, b42e <FRC_IRQHandler+0x676>
    b41a:	3a01      	subs	r2, #1
    b41c:	b2d2      	uxtb	r2, r2
    b41e:	710a      	strb	r2, [r1, #4]
    b420:	b912      	cbnz	r2, b428 <FRC_IRQHandler+0x670>
    b422:	4a2c      	ldr	r2, [pc, #176]	; (b4d4 <FRC_IRQHandler+0x71c>)
    b424:	4931      	ldr	r1, [pc, #196]	; (b4ec <FRC_IRQHandler+0x734>)
    b426:	6751      	str	r1, [r2, #116]	; 0x74
    b428:	ea4b 0b0a 	orr.w	fp, fp, sl
    b42c:	e7b1      	b.n	b392 <FRC_IRQHandler+0x5da>
    b42e:	2004      	movs	r0, #4
    b430:	f7fe f8f8 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    b434:	2003      	movs	r0, #3
    b436:	f7fe f8f5 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    b43a:	4a22      	ldr	r2, [pc, #136]	; (b4c4 <FRC_IRQHandler+0x70c>)
    b43c:	4929      	ldr	r1, [pc, #164]	; (b4e4 <FRC_IRQHandler+0x72c>)
    b43e:	6751      	str	r1, [r2, #116]	; 0x74
    b440:	f7fa fe44 	bl	60cc <CORE_EnterCritical>
    b444:	4681      	mov	r9, r0
    b446:	f10d 000f 	add.w	r0, sp, #15
    b44a:	f7fe fc75 	bl	9d38 <RAILINT_12973c63ce9f157526b71bd49da4eecd>
    b44e:	4a28      	ldr	r2, [pc, #160]	; (b4f0 <FRC_IRQHandler+0x738>)
    b450:	4682      	mov	sl, r0
    b452:	7812      	ldrb	r2, [r2, #0]
    b454:	b10a      	cbz	r2, b45a <FRC_IRQHandler+0x6a2>
    b456:	f7ff f8bd 	bl	a5d4 <RAILINT_ef38b49f1deb3f763f4f0e2ae372d117>
    b45a:	f1ba 0f03 	cmp.w	sl, #3
    b45e:	d10e      	bne.n	b47e <FRC_IRQHandler+0x6c6>
    b460:	f8df a098 	ldr.w	sl, [pc, #152]	; b4fc <FRC_IRQHandler+0x744>
    b464:	2000      	movs	r0, #0
    b466:	f7fe fc67 	bl	9d38 <RAILINT_12973c63ce9f157526b71bd49da4eecd>
    b46a:	2803      	cmp	r0, #3
    b46c:	d107      	bne.n	b47e <FRC_IRQHandler+0x6c6>
    b46e:	f8da 2074 	ldr.w	r2, [sl, #116]	; 0x74
    b472:	03d2      	lsls	r2, r2, #15
    b474:	d4f6      	bmi.n	b464 <FRC_IRQHandler+0x6ac>
    b476:	f8da 205c 	ldr.w	r2, [sl, #92]	; 0x5c
    b47a:	2a0c      	cmp	r2, #12
    b47c:	d9f2      	bls.n	b464 <FRC_IRQHandler+0x6ac>
    b47e:	f89d 200f 	ldrb.w	r2, [sp, #15]
    b482:	2a03      	cmp	r2, #3
    b484:	d108      	bne.n	b498 <FRC_IRQHandler+0x6e0>
    b486:	2101      	movs	r1, #1
    b488:	4a1a      	ldr	r2, [pc, #104]	; (b4f4 <FRC_IRQHandler+0x73c>)
    b48a:	4648      	mov	r0, r9
    b48c:	7011      	strb	r1, [r2, #0]
    b48e:	f04f 0a00 	mov.w	sl, #0
    b492:	f7fa fe1f 	bl	60d4 <CORE_ExitCritical>
    b496:	e7c7      	b.n	b428 <FRC_IRQHandler+0x670>
    b498:	4a17      	ldr	r2, [pc, #92]	; (b4f8 <FRC_IRQHandler+0x740>)
    b49a:	f8d2 20e0 	ldr.w	r2, [r2, #224]	; 0xe0
    b49e:	f412 2fa0 	tst.w	r2, #327680	; 0x50000
    b4a2:	d1f0      	bne.n	b486 <FRC_IRQHandler+0x6ce>
    b4a4:	f7ff f888 	bl	a5b8 <RAILINT_6d8967e14ffa5fbb64f5f8549fa17b5c>
    b4a8:	4648      	mov	r0, r9
    b4aa:	f7fa fe13 	bl	60d4 <CORE_ExitCritical>
    b4ae:	f44f 4a80 	mov.w	sl, #16384	; 0x4000
    b4b2:	e7b9      	b.n	b428 <FRC_IRQHandler+0x670>
    b4b4:	2002      	movs	r0, #2
    b4b6:	f7fe f8b5 	bl	9624 <RAILINT_4f93cdd7aecf168775f2a95c9141aec8>
    b4ba:	2201      	movs	r2, #1
    b4bc:	e773      	b.n	b3a6 <FRC_IRQHandler+0x5ee>
    b4be:	bf00      	nop
    b4c0:	a801e000 	.word	0xa801e000
    b4c4:	a801c000 	.word	0xa801c000
    b4c8:	20000e1c 	.word	0x20000e1c
    b4cc:	20000e34 	.word	0x20000e34
    b4d0:	a8022000 	.word	0xa8022000
    b4d4:	a801d000 	.word	0xa801d000
    b4d8:	b0001000 	.word	0xb0001000
    b4dc:	20000d9c 	.word	0x20000d9c
    b4e0:	44006000 	.word	0x44006000
    b4e4:	01010000 	.word	0x01010000
    b4e8:	200001dc 	.word	0x200001dc
    b4ec:	0d010000 	.word	0x0d010000
    b4f0:	20000e35 	.word	0x20000e35
    b4f4:	20000e1a 	.word	0x20000e1a
    b4f8:	44004000 	.word	0x44004000
    b4fc:	a8020000 	.word	0xa8020000

0000b500 <FRC_PRI_IRQHandler>:
    b500:	f7ff bc5a 	b.w	adb8 <FRC_IRQHandler>

0000b504 <BUFC_IRQHandler>:
    b504:	f7ff bc58 	b.w	adb8 <FRC_IRQHandler>

0000b508 <PROTIMER_IRQHandler>:
    b508:	f7ff bc56 	b.w	adb8 <FRC_IRQHandler>

0000b50c <RAC_SEQ_IRQHandler>:
    b50c:	f7ff bc54 	b.w	adb8 <FRC_IRQHandler>

0000b510 <RAILCb_RadioStateChanged>:
    b510:	2201      	movs	r2, #1
    b512:	4b02      	ldr	r3, [pc, #8]	; (b51c <RAILCb_RadioStateChanged+0xc>)
    b514:	621a      	str	r2, [r3, #32]
    b516:	61da      	str	r2, [r3, #28]
    b518:	4770      	bx	lr
    b51a:	bf00      	nop
    b51c:	a8022000 	.word	0xa8022000

0000b520 <RAC_RSM_IRQHandler>:
    b520:	4b0c      	ldr	r3, [pc, #48]	; (b554 <RAC_RSM_IRQHandler+0x34>)
    b522:	b510      	push	{r4, lr}
    b524:	69dc      	ldr	r4, [r3, #28]
    b526:	6a1a      	ldr	r2, [r3, #32]
    b528:	4014      	ands	r4, r2
    b52a:	4a0b      	ldr	r2, [pc, #44]	; (b558 <RAC_RSM_IRQHandler+0x38>)
    b52c:	b2a1      	uxth	r1, r4
    b52e:	61d1      	str	r1, [r2, #28]
    b530:	07e2      	lsls	r2, r4, #31
    b532:	d504      	bpl.n	b53e <RAC_RSM_IRQHandler+0x1e>
    b534:	68d8      	ldr	r0, [r3, #12]
    b536:	f3c0 6003 	ubfx	r0, r0, #24, #4
    b53a:	f7ff ffe9 	bl	b510 <RAILCb_RadioStateChanged>
    b53e:	0763      	lsls	r3, r4, #29
    b540:	d506      	bpl.n	b550 <RAC_RSM_IRQHandler+0x30>
    b542:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    b546:	2204      	movs	r2, #4
    b548:	2000      	movs	r0, #0
    b54a:	2100      	movs	r1, #0
    b54c:	f7ff b8ae 	b.w	a6ac <RAILINT_978af8e4393fb6ecb4e92f5256373899>
    b550:	bd10      	pop	{r4, pc}
    b552:	bf00      	nop
    b554:	a8020000 	.word	0xa8020000
    b558:	a8022000 	.word	0xa8022000

0000b55c <MODEM_IRQHandler>:
    b55c:	f7ff bc2c 	b.w	adb8 <FRC_IRQHandler>

0000b560 <AGC_IRQHandler>:
    b560:	4a0c      	ldr	r2, [pc, #48]	; (b594 <AGC_IRQHandler+0x34>)
    b562:	b508      	push	{r3, lr}
    b564:	6b93      	ldr	r3, [r2, #56]	; 0x38
    b566:	6c52      	ldr	r2, [r2, #68]	; 0x44
    b568:	4013      	ands	r3, r2
    b56a:	4a0b      	ldr	r2, [pc, #44]	; (b598 <AGC_IRQHandler+0x38>)
    b56c:	6393      	str	r3, [r2, #56]	; 0x38
    b56e:	07db      	lsls	r3, r3, #31
    b570:	d50f      	bpl.n	b592 <AGC_IRQHandler+0x32>
    b572:	4b0a      	ldr	r3, [pc, #40]	; (b59c <AGC_IRQHandler+0x3c>)
    b574:	f44f 620c 	mov.w	r2, #2240	; 0x8c0
    b578:	7818      	ldrb	r0, [r3, #0]
    b57a:	2112      	movs	r1, #18
    b57c:	f000 0001 	and.w	r0, r0, #1
    b580:	f7fb fdda 	bl	7138 <RAILINT_205167ae842e22724c3f35c6430eeddb>
    b584:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    b588:	2200      	movs	r2, #0
    b58a:	2001      	movs	r0, #1
    b58c:	2100      	movs	r1, #0
    b58e:	f7ff b88d 	b.w	a6ac <RAILINT_978af8e4393fb6ecb4e92f5256373899>
    b592:	bd08      	pop	{r3, pc}
    b594:	a800c000 	.word	0xa800c000
    b598:	a800e000 	.word	0xa800e000
    b59c:	20000e10 	.word	0x20000e10

0000b5a0 <SYNTH_IRQHandler>:
    b5a0:	4b04      	ldr	r3, [pc, #16]	; (b5b4 <SYNTH_IRQHandler+0x14>)
    b5a2:	6f9a      	ldr	r2, [r3, #120]	; 0x78
    b5a4:	f8d3 1084 	ldr.w	r1, [r3, #132]	; 0x84
    b5a8:	f503 5300 	add.w	r3, r3, #8192	; 0x2000
    b5ac:	400a      	ands	r2, r1
    b5ae:	679a      	str	r2, [r3, #120]	; 0x78
    b5b0:	4770      	bx	lr
    b5b2:	bf00      	nop
    b5b4:	a8018000 	.word	0xa8018000

0000b5b8 <RAILINT_fc431c63280fcec9c8f1f2616df249e6>:
    b5b8:	b570      	push	{r4, r5, r6, lr}
    b5ba:	4614      	mov	r4, r2
    b5bc:	460d      	mov	r5, r1
    b5be:	f7fa fd85 	bl	60cc <CORE_EnterCritical>
    b5c2:	4b06      	ldr	r3, [pc, #24]	; (b5dc <RAILINT_fc431c63280fcec9c8f1f2616df249e6+0x24>)
    b5c4:	f8d3 6e9c 	ldr.w	r6, [r3, #3740]	; 0xe9c
    b5c8:	4074      	eors	r4, r6
    b5ca:	402c      	ands	r4, r5
    b5cc:	4074      	eors	r4, r6
    b5ce:	f8c3 4e9c 	str.w	r4, [r3, #3740]	; 0xe9c
    b5d2:	f7fa fd7f 	bl	60d4 <CORE_ExitCritical>
    b5d6:	ea06 0005 	and.w	r0, r6, r5
    b5da:	bd70      	pop	{r4, r5, r6, pc}
    b5dc:	b0001000 	.word	0xb0001000

0000b5e0 <RAILINT_10ac1cf98a783c6bdb18657a1d32c8ed>:
    b5e0:	4b04      	ldr	r3, [pc, #16]	; (b5f4 <RAILINT_10ac1cf98a783c6bdb18657a1d32c8ed+0x14>)
    b5e2:	f8d3 3e9c 	ldr.w	r3, [r3, #3740]	; 0xe9c
    b5e6:	ea31 0303 	bics.w	r3, r1, r3
    b5ea:	bf0c      	ite	eq
    b5ec:	2001      	moveq	r0, #1
    b5ee:	2000      	movne	r0, #0
    b5f0:	4770      	bx	lr
    b5f2:	bf00      	nop
    b5f4:	b0001000 	.word	0xb0001000

0000b5f8 <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a>:
    b5f8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    b5fc:	2901      	cmp	r1, #1
    b5fe:	4617      	mov	r7, r2
    b600:	461e      	mov	r6, r3
    b602:	f89d 4018 	ldrb.w	r4, [sp, #24]
    b606:	f89d 501c 	ldrb.w	r5, [sp, #28]
    b60a:	f8dd 8020 	ldr.w	r8, [sp, #32]
    b60e:	d82c      	bhi.n	b66a <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x72>
    b610:	2a01      	cmp	r2, #1
    b612:	d82a      	bhi.n	b66a <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x72>
    b614:	42ac      	cmp	r4, r5
    b616:	d228      	bcs.n	b66a <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x72>
    b618:	2d08      	cmp	r5, #8
    b61a:	d826      	bhi.n	b66a <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x72>
    b61c:	2b03      	cmp	r3, #3
    b61e:	d824      	bhi.n	b66a <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x72>
    b620:	f1b8 0f00 	cmp.w	r8, #0
    b624:	d021      	beq.n	b66a <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x72>
    b626:	460a      	mov	r2, r1
    b628:	2100      	movs	r1, #0
    b62a:	f7fc fea9 	bl	8380 <RAILINT_e02d00033aeee031972ce3294c5c5c74>
    b62e:	21ff      	movs	r1, #255	; 0xff
    b630:	00f6      	lsls	r6, r6, #3
    b632:	40b1      	lsls	r1, r6
    b634:	43c9      	mvns	r1, r1
    b636:	4620      	mov	r0, r4
    b638:	f8df c034 	ldr.w	ip, [pc, #52]	; b670 <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x78>
    b63c:	f108 38ff 	add.w	r8, r8, #4294967295	; 0xffffffff
    b640:	00ff      	lsls	r7, r7, #3
    b642:	183a      	adds	r2, r7, r0
    b644:	eb0c 0282 	add.w	r2, ip, r2, lsl #2
    b648:	f8d2 30d4 	ldr.w	r3, [r2, #212]	; 0xd4
    b64c:	3001      	adds	r0, #1
    b64e:	ea01 0403 	and.w	r4, r1, r3
    b652:	f818 3f01 	ldrb.w	r3, [r8, #1]!
    b656:	40b3      	lsls	r3, r6
    b658:	4323      	orrs	r3, r4
    b65a:	f8c2 30d4 	str.w	r3, [r2, #212]	; 0xd4
    b65e:	b2c3      	uxtb	r3, r0
    b660:	429d      	cmp	r5, r3
    b662:	d8ee      	bhi.n	b642 <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x4a>
    b664:	2000      	movs	r0, #0
    b666:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    b66a:	2001      	movs	r0, #1
    b66c:	e7fb      	b.n	b666 <RAILINT_97099dc7ca7699c8d5ef5cc5413c4a7a+0x6e>
    b66e:	bf00      	nop
    b670:	b0001e00 	.word	0xb0001e00

0000b674 <RAILINT_dc675e4729ddc8fc4759ebbb1d4c3bce>:
    b674:	4770      	bx	lr

0000b676 <RAILINT_b04ac2e87c7e86c14dc53c58ce128069>:
    b676:	2200      	movs	r2, #0
    b678:	428a      	cmp	r2, r1
    b67a:	d102      	bne.n	b682 <RAILINT_b04ac2e87c7e86c14dc53c58ce128069+0xc>
    b67c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    b680:	4770      	bx	lr
    b682:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
    b686:	fa93 f3a3 	rbit	r3, r3
    b68a:	fab3 f383 	clz	r3, r3
    b68e:	2b20      	cmp	r3, #32
    b690:	d002      	beq.n	b698 <RAILINT_b04ac2e87c7e86c14dc53c58ce128069+0x22>
    b692:	eb03 1042 	add.w	r0, r3, r2, lsl #5
    b696:	4770      	bx	lr
    b698:	3201      	adds	r2, #1
    b69a:	e7ed      	b.n	b678 <RAILINT_b04ac2e87c7e86c14dc53c58ce128069+0x2>

0000b69c <RAIL_ConvertDbmToRaw>:
    b69c:	f647 73ff 	movw	r3, #32767	; 0x7fff
    b6a0:	429a      	cmp	r2, r3
    b6a2:	b5f0      	push	{r4, r5, r6, r7, lr}
    b6a4:	d05e      	beq.n	b764 <RAIL_ConvertDbmToRaw+0xc8>
    b6a6:	2903      	cmp	r1, #3
    b6a8:	d85e      	bhi.n	b768 <RAIL_ConvertDbmToRaw+0xcc>
    b6aa:	4e30      	ldr	r6, [pc, #192]	; (b76c <RAIL_ConvertDbmToRaw+0xd0>)
    b6ac:	00cf      	lsls	r7, r1, #3
    b6ae:	f816 3031 	ldrb.w	r3, [r6, r1, lsl #3]
    b6b2:	eb06 00c1 	add.w	r0, r6, r1, lsl #3
    b6b6:	2b01      	cmp	r3, #1
    b6b8:	7885      	ldrb	r5, [r0, #2]
    b6ba:	d10d      	bne.n	b6d8 <RAIL_ConvertDbmToRaw+0x3c>
    b6bc:	78c3      	ldrb	r3, [r0, #3]
    b6be:	1b5b      	subs	r3, r3, r5
    b6c0:	b123      	cbz	r3, b6cc <RAIL_ConvertDbmToRaw+0x30>
    b6c2:	6841      	ldr	r1, [r0, #4]
    b6c4:	f931 1013 	ldrsh.w	r1, [r1, r3, lsl #1]
    b6c8:	4291      	cmp	r1, r2
    b6ca:	dc02      	bgt.n	b6d2 <RAIL_ConvertDbmToRaw+0x36>
    b6cc:	18e8      	adds	r0, r5, r3
    b6ce:	b2c0      	uxtb	r0, r0
    b6d0:	bdf0      	pop	{r4, r5, r6, r7, pc}
    b6d2:	3b01      	subs	r3, #1
    b6d4:	b21b      	sxth	r3, r3
    b6d6:	e7f3      	b.n	b6c0 <RAIL_ConvertDbmToRaw+0x24>
    b6d8:	6840      	ldr	r0, [r0, #4]
    b6da:	2800      	cmp	r0, #0
    b6dc:	d0f8      	beq.n	b6d0 <RAIL_ConvertDbmToRaw+0x34>
    b6de:	f9b0 3000 	ldrsh.w	r3, [r0]
    b6e2:	4293      	cmp	r3, r2
    b6e4:	db04      	blt.n	b6f0 <RAIL_ConvertDbmToRaw+0x54>
    b6e6:	f9b0 3002 	ldrsh.w	r3, [r0, #2]
    b6ea:	4293      	cmp	r3, r2
    b6ec:	bfb8      	it	lt
    b6ee:	4613      	movlt	r3, r2
    b6f0:	8882      	ldrh	r2, [r0, #4]
    b6f2:	443e      	add	r6, r7
    b6f4:	2aff      	cmp	r2, #255	; 0xff
    b6f6:	bf19      	ittee	ne
    b6f8:	24c8      	movne	r4, #200	; 0xc8
    b6fa:	2128      	movne	r1, #40	; 0x28
    b6fc:	f9b0 4006 	ldrsheq.w	r4, [r0, #6]
    b700:	f9b0 1008 	ldrsheq.w	r1, [r0, #8]
    b704:	eba4 0403 	sub.w	r4, r4, r3
    b708:	bf0c      	ite	eq
    b70a:	2201      	moveq	r2, #1
    b70c:	2200      	movne	r2, #0
    b70e:	fb94 f4f1 	sdiv	r4, r4, r1
    b712:	7876      	ldrb	r6, [r6, #1]
    b714:	4422      	add	r2, r4
    b716:	b214      	sxth	r4, r2
    b718:	1e72      	subs	r2, r6, #1
    b71a:	42a2      	cmp	r2, r4
    b71c:	bfa8      	it	ge
    b71e:	4622      	movge	r2, r4
    b720:	f44f 777a 	mov.w	r7, #1000	; 0x3e8
    b724:	eb00 04c2 	add.w	r4, r0, r2, lsl #3
    b728:	88e1      	ldrh	r1, [r4, #6]
    b72a:	68a4      	ldr	r4, [r4, #8]
    b72c:	3201      	adds	r2, #1
    b72e:	fb13 4101 	smlabb	r1, r3, r1, r4
    b732:	b212      	sxth	r2, r2
    b734:	ea21 71e1 	bic.w	r1, r1, r1, asr #31
    b738:	f501 71fa 	add.w	r1, r1, #500	; 0x1f4
    b73c:	42b2      	cmp	r2, r6
    b73e:	fbb1 f1f7 	udiv	r1, r1, r7
    b742:	da04      	bge.n	b74e <RAIL_ConvertDbmToRaw+0xb2>
    b744:	eb00 04c2 	add.w	r4, r0, r2, lsl #3
    b748:	88a4      	ldrh	r4, [r4, #4]
    b74a:	428c      	cmp	r4, r1
    b74c:	d2ea      	bcs.n	b724 <RAIL_ConvertDbmToRaw+0x88>
    b74e:	eb00 02c2 	add.w	r2, r0, r2, lsl #3
    b752:	f832 0c04 	ldrh.w	r0, [r2, #-4]
    b756:	4288      	cmp	r0, r1
    b758:	bf28      	it	cs
    b75a:	4608      	movcs	r0, r1
    b75c:	42a8      	cmp	r0, r5
    b75e:	bf38      	it	cc
    b760:	4628      	movcc	r0, r5
    b762:	e7b4      	b.n	b6ce <RAIL_ConvertDbmToRaw+0x32>
    b764:	20ff      	movs	r0, #255	; 0xff
    b766:	e7b3      	b.n	b6d0 <RAIL_ConvertDbmToRaw+0x34>
    b768:	2000      	movs	r0, #0
    b76a:	e7b1      	b.n	b6d0 <RAIL_ConvertDbmToRaw+0x34>
    b76c:	20000e3c 	.word	0x20000e3c

0000b770 <RAILINT_78eaa84173e85419c123802d17d70cee>:
    b770:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
    b772:	460c      	mov	r4, r1
    b774:	7809      	ldrb	r1, [r1, #0]
    b776:	4606      	mov	r6, r0
    b778:	b951      	cbnz	r1, b790 <RAILINT_78eaa84173e85419c123802d17d70cee+0x20>
    b77a:	9101      	str	r1, [sp, #4]
    b77c:	f7fc fb50 	bl	7e20 <RAILINT_cb27dba168c71b340f37df80e4ee5b60>
    b780:	4630      	mov	r0, r6
    b782:	9901      	ldr	r1, [sp, #4]
    b784:	f7fc fb9a 	bl	7ebc <RAILINT_5cc15e08889684ec1ad3d74b53d1f5dc>
    b788:	4630      	mov	r0, r6
    b78a:	9901      	ldr	r1, [sp, #4]
    b78c:	f7fc fb9f 	bl	7ece <RAILINT_bf9c5ad5b66e6c5ba2ba7ecd77ccb2e2>
    b790:	7823      	ldrb	r3, [r4, #0]
    b792:	bb43      	cbnz	r3, b7e6 <RAILINT_78eaa84173e85419c123802d17d70cee+0x76>
    b794:	7922      	ldrb	r2, [r4, #4]
    b796:	f88d 200c 	strb.w	r2, [sp, #12]
    b79a:	b333      	cbz	r3, b7ea <RAILINT_78eaa84173e85419c123802d17d70cee+0x7a>
    b79c:	7923      	ldrb	r3, [r4, #4]
    b79e:	4630      	mov	r0, r6
    b7a0:	a903      	add	r1, sp, #12
    b7a2:	f88d 300d 	strb.w	r3, [sp, #13]
    b7a6:	f7fb fc3f 	bl	7028 <RAILINT_9dae83c5a5b496ad1ace0cccba141a93>
    b7aa:	4605      	mov	r5, r0
    b7ac:	b9c0      	cbnz	r0, b7e0 <RAILINT_78eaa84173e85419c123802d17d70cee+0x70>
    b7ae:	7823      	ldrb	r3, [r4, #0]
    b7b0:	b9eb      	cbnz	r3, b7ee <RAILINT_78eaa84173e85419c123802d17d70cee+0x7e>
    b7b2:	79a2      	ldrb	r2, [r4, #6]
    b7b4:	f88d 200c 	strb.w	r2, [sp, #12]
    b7b8:	b1db      	cbz	r3, b7f2 <RAILINT_78eaa84173e85419c123802d17d70cee+0x82>
    b7ba:	79a3      	ldrb	r3, [r4, #6]
    b7bc:	4630      	mov	r0, r6
    b7be:	a903      	add	r1, sp, #12
    b7c0:	f88d 300d 	strb.w	r3, [sp, #13]
    b7c4:	f7fb fc1a 	bl	6ffc <RAILINT_992a3700fea39ab020ab6087e28c16df>
    b7c8:	4605      	mov	r5, r0
    b7ca:	b948      	cbnz	r0, b7e0 <RAILINT_78eaa84173e85419c123802d17d70cee+0x70>
    b7cc:	7823      	ldrb	r3, [r4, #0]
    b7ce:	b13b      	cbz	r3, b7e0 <RAILINT_78eaa84173e85419c123802d17d70cee+0x70>
    b7d0:	8861      	ldrh	r1, [r4, #2]
    b7d2:	4630      	mov	r0, r6
    b7d4:	f7fc fb3e 	bl	7e54 <RAILINT_f70b804705a044eb7f74093268741788>
    b7d8:	2101      	movs	r1, #1
    b7da:	4630      	mov	r0, r6
    b7dc:	f7fc fb20 	bl	7e20 <RAILINT_cb27dba168c71b340f37df80e4ee5b60>
    b7e0:	4628      	mov	r0, r5
    b7e2:	b004      	add	sp, #16
    b7e4:	bd70      	pop	{r4, r5, r6, pc}
    b7e6:	2204      	movs	r2, #4
    b7e8:	e7d5      	b.n	b796 <RAILINT_78eaa84173e85419c123802d17d70cee+0x26>
    b7ea:	7963      	ldrb	r3, [r4, #5]
    b7ec:	e7d7      	b.n	b79e <RAILINT_78eaa84173e85419c123802d17d70cee+0x2e>
    b7ee:	2202      	movs	r2, #2
    b7f0:	e7e0      	b.n	b7b4 <RAILINT_78eaa84173e85419c123802d17d70cee+0x44>
    b7f2:	79e3      	ldrb	r3, [r4, #7]
    b7f4:	e7e2      	b.n	b7bc <RAILINT_78eaa84173e85419c123802d17d70cee+0x4c>

0000b7f6 <RAILINT_2d5876683a764801ac6ee9a13c687c8d>:
    b7f6:	2000      	movs	r0, #0
    b7f8:	4770      	bx	lr
	...

0000b7fc <__aeabi_uldivmod>:
    b7fc:	b953      	cbnz	r3, b814 <__aeabi_uldivmod+0x18>
    b7fe:	b94a      	cbnz	r2, b814 <__aeabi_uldivmod+0x18>
    b800:	2900      	cmp	r1, #0
    b802:	bf08      	it	eq
    b804:	2800      	cmpeq	r0, #0
    b806:	bf1c      	itt	ne
    b808:	f04f 31ff 	movne.w	r1, #4294967295	; 0xffffffff
    b80c:	f04f 30ff 	movne.w	r0, #4294967295	; 0xffffffff
    b810:	f000 b982 	b.w	bb18 <__aeabi_idiv0>
    b814:	f1ad 0c08 	sub.w	ip, sp, #8
    b818:	e96d ce04 	strd	ip, lr, [sp, #-16]!
    b81c:	f000 f806 	bl	b82c <__udivmoddi4>
    b820:	f8dd e004 	ldr.w	lr, [sp, #4]
    b824:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
    b828:	b004      	add	sp, #16
    b82a:	4770      	bx	lr

0000b82c <__udivmoddi4>:
    b82c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b830:	9d09      	ldr	r5, [sp, #36]	; 0x24
    b832:	4604      	mov	r4, r0
    b834:	460f      	mov	r7, r1
    b836:	2b00      	cmp	r3, #0
    b838:	d148      	bne.n	b8cc <__udivmoddi4+0xa0>
    b83a:	428a      	cmp	r2, r1
    b83c:	4694      	mov	ip, r2
    b83e:	d961      	bls.n	b904 <__udivmoddi4+0xd8>
    b840:	fab2 f382 	clz	r3, r2
    b844:	b143      	cbz	r3, b858 <__udivmoddi4+0x2c>
    b846:	f1c3 0120 	rsb	r1, r3, #32
    b84a:	409f      	lsls	r7, r3
    b84c:	fa02 fc03 	lsl.w	ip, r2, r3
    b850:	409c      	lsls	r4, r3
    b852:	fa20 f101 	lsr.w	r1, r0, r1
    b856:	430f      	orrs	r7, r1
    b858:	ea4f 411c 	mov.w	r1, ip, lsr #16
    b85c:	fa1f fe8c 	uxth.w	lr, ip
    b860:	0c22      	lsrs	r2, r4, #16
    b862:	fbb7 f6f1 	udiv	r6, r7, r1
    b866:	fb01 7716 	mls	r7, r1, r6, r7
    b86a:	fb06 f00e 	mul.w	r0, r6, lr
    b86e:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
    b872:	4290      	cmp	r0, r2
    b874:	d908      	bls.n	b888 <__udivmoddi4+0x5c>
    b876:	eb1c 0202 	adds.w	r2, ip, r2
    b87a:	f106 37ff 	add.w	r7, r6, #4294967295	; 0xffffffff
    b87e:	d202      	bcs.n	b886 <__udivmoddi4+0x5a>
    b880:	4290      	cmp	r0, r2
    b882:	f200 8137 	bhi.w	baf4 <__udivmoddi4+0x2c8>
    b886:	463e      	mov	r6, r7
    b888:	1a12      	subs	r2, r2, r0
    b88a:	b2a4      	uxth	r4, r4
    b88c:	fbb2 f0f1 	udiv	r0, r2, r1
    b890:	fb01 2210 	mls	r2, r1, r0, r2
    b894:	fb00 fe0e 	mul.w	lr, r0, lr
    b898:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
    b89c:	45a6      	cmp	lr, r4
    b89e:	d908      	bls.n	b8b2 <__udivmoddi4+0x86>
    b8a0:	eb1c 0404 	adds.w	r4, ip, r4
    b8a4:	f100 32ff 	add.w	r2, r0, #4294967295	; 0xffffffff
    b8a8:	d202      	bcs.n	b8b0 <__udivmoddi4+0x84>
    b8aa:	45a6      	cmp	lr, r4
    b8ac:	f200 811c 	bhi.w	bae8 <__udivmoddi4+0x2bc>
    b8b0:	4610      	mov	r0, r2
    b8b2:	ea40 4006 	orr.w	r0, r0, r6, lsl #16
    b8b6:	eba4 040e 	sub.w	r4, r4, lr
    b8ba:	2600      	movs	r6, #0
    b8bc:	b11d      	cbz	r5, b8c6 <__udivmoddi4+0x9a>
    b8be:	40dc      	lsrs	r4, r3
    b8c0:	2300      	movs	r3, #0
    b8c2:	e9c5 4300 	strd	r4, r3, [r5]
    b8c6:	4631      	mov	r1, r6
    b8c8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b8cc:	428b      	cmp	r3, r1
    b8ce:	d909      	bls.n	b8e4 <__udivmoddi4+0xb8>
    b8d0:	2d00      	cmp	r5, #0
    b8d2:	f000 80fd 	beq.w	bad0 <__udivmoddi4+0x2a4>
    b8d6:	2600      	movs	r6, #0
    b8d8:	e9c5 0100 	strd	r0, r1, [r5]
    b8dc:	4630      	mov	r0, r6
    b8de:	4631      	mov	r1, r6
    b8e0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b8e4:	fab3 f683 	clz	r6, r3
    b8e8:	2e00      	cmp	r6, #0
    b8ea:	d14b      	bne.n	b984 <__udivmoddi4+0x158>
    b8ec:	428b      	cmp	r3, r1
    b8ee:	f0c0 80f2 	bcc.w	bad6 <__udivmoddi4+0x2aa>
    b8f2:	4282      	cmp	r2, r0
    b8f4:	f240 80ef 	bls.w	bad6 <__udivmoddi4+0x2aa>
    b8f8:	4630      	mov	r0, r6
    b8fa:	2d00      	cmp	r5, #0
    b8fc:	d0e3      	beq.n	b8c6 <__udivmoddi4+0x9a>
    b8fe:	e9c5 4700 	strd	r4, r7, [r5]
    b902:	e7e0      	b.n	b8c6 <__udivmoddi4+0x9a>
    b904:	b902      	cbnz	r2, b908 <__udivmoddi4+0xdc>
    b906:	deff      	udf	#255	; 0xff
    b908:	fab2 f382 	clz	r3, r2
    b90c:	2b00      	cmp	r3, #0
    b90e:	f040 809d 	bne.w	ba4c <__udivmoddi4+0x220>
    b912:	1a89      	subs	r1, r1, r2
    b914:	ea4f 4e12 	mov.w	lr, r2, lsr #16
    b918:	b297      	uxth	r7, r2
    b91a:	2601      	movs	r6, #1
    b91c:	0c20      	lsrs	r0, r4, #16
    b91e:	fbb1 f2fe 	udiv	r2, r1, lr
    b922:	fb0e 1112 	mls	r1, lr, r2, r1
    b926:	ea40 4101 	orr.w	r1, r0, r1, lsl #16
    b92a:	fb07 f002 	mul.w	r0, r7, r2
    b92e:	4288      	cmp	r0, r1
    b930:	d90f      	bls.n	b952 <__udivmoddi4+0x126>
    b932:	eb1c 0101 	adds.w	r1, ip, r1
    b936:	f102 38ff 	add.w	r8, r2, #4294967295	; 0xffffffff
    b93a:	bf2c      	ite	cs
    b93c:	f04f 0901 	movcs.w	r9, #1
    b940:	f04f 0900 	movcc.w	r9, #0
    b944:	4288      	cmp	r0, r1
    b946:	d903      	bls.n	b950 <__udivmoddi4+0x124>
    b948:	f1b9 0f00 	cmp.w	r9, #0
    b94c:	f000 80cf 	beq.w	baee <__udivmoddi4+0x2c2>
    b950:	4642      	mov	r2, r8
    b952:	1a09      	subs	r1, r1, r0
    b954:	b2a4      	uxth	r4, r4
    b956:	fbb1 f0fe 	udiv	r0, r1, lr
    b95a:	fb0e 1110 	mls	r1, lr, r0, r1
    b95e:	fb00 f707 	mul.w	r7, r0, r7
    b962:	ea44 4401 	orr.w	r4, r4, r1, lsl #16
    b966:	42a7      	cmp	r7, r4
    b968:	d908      	bls.n	b97c <__udivmoddi4+0x150>
    b96a:	eb1c 0404 	adds.w	r4, ip, r4
    b96e:	f100 31ff 	add.w	r1, r0, #4294967295	; 0xffffffff
    b972:	d202      	bcs.n	b97a <__udivmoddi4+0x14e>
    b974:	42a7      	cmp	r7, r4
    b976:	f200 80b4 	bhi.w	bae2 <__udivmoddi4+0x2b6>
    b97a:	4608      	mov	r0, r1
    b97c:	1be4      	subs	r4, r4, r7
    b97e:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
    b982:	e79b      	b.n	b8bc <__udivmoddi4+0x90>
    b984:	f1c6 0720 	rsb	r7, r6, #32
    b988:	40b3      	lsls	r3, r6
    b98a:	fa01 f406 	lsl.w	r4, r1, r6
    b98e:	fa22 fc07 	lsr.w	ip, r2, r7
    b992:	40f9      	lsrs	r1, r7
    b994:	40b2      	lsls	r2, r6
    b996:	ea4c 0c03 	orr.w	ip, ip, r3
    b99a:	fa20 f307 	lsr.w	r3, r0, r7
    b99e:	ea4f 491c 	mov.w	r9, ip, lsr #16
    b9a2:	431c      	orrs	r4, r3
    b9a4:	fa1f fe8c 	uxth.w	lr, ip
    b9a8:	fa00 f306 	lsl.w	r3, r0, r6
    b9ac:	0c20      	lsrs	r0, r4, #16
    b9ae:	fbb1 f8f9 	udiv	r8, r1, r9
    b9b2:	fb09 1118 	mls	r1, r9, r8, r1
    b9b6:	ea40 4101 	orr.w	r1, r0, r1, lsl #16
    b9ba:	fb08 f00e 	mul.w	r0, r8, lr
    b9be:	4288      	cmp	r0, r1
    b9c0:	d90f      	bls.n	b9e2 <__udivmoddi4+0x1b6>
    b9c2:	eb1c 0101 	adds.w	r1, ip, r1
    b9c6:	f108 3aff 	add.w	sl, r8, #4294967295	; 0xffffffff
    b9ca:	bf2c      	ite	cs
    b9cc:	f04f 0b01 	movcs.w	fp, #1
    b9d0:	f04f 0b00 	movcc.w	fp, #0
    b9d4:	4288      	cmp	r0, r1
    b9d6:	d903      	bls.n	b9e0 <__udivmoddi4+0x1b4>
    b9d8:	f1bb 0f00 	cmp.w	fp, #0
    b9dc:	f000 808d 	beq.w	bafa <__udivmoddi4+0x2ce>
    b9e0:	46d0      	mov	r8, sl
    b9e2:	1a09      	subs	r1, r1, r0
    b9e4:	b2a4      	uxth	r4, r4
    b9e6:	fbb1 f0f9 	udiv	r0, r1, r9
    b9ea:	fb09 1110 	mls	r1, r9, r0, r1
    b9ee:	fb00 fe0e 	mul.w	lr, r0, lr
    b9f2:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
    b9f6:	458e      	cmp	lr, r1
    b9f8:	d907      	bls.n	ba0a <__udivmoddi4+0x1de>
    b9fa:	eb1c 0101 	adds.w	r1, ip, r1
    b9fe:	f100 34ff 	add.w	r4, r0, #4294967295	; 0xffffffff
    ba02:	d201      	bcs.n	ba08 <__udivmoddi4+0x1dc>
    ba04:	458e      	cmp	lr, r1
    ba06:	d87f      	bhi.n	bb08 <__udivmoddi4+0x2dc>
    ba08:	4620      	mov	r0, r4
    ba0a:	ea40 4008 	orr.w	r0, r0, r8, lsl #16
    ba0e:	eba1 010e 	sub.w	r1, r1, lr
    ba12:	fba0 9802 	umull	r9, r8, r0, r2
    ba16:	4541      	cmp	r1, r8
    ba18:	464c      	mov	r4, r9
    ba1a:	46c6      	mov	lr, r8
    ba1c:	d302      	bcc.n	ba24 <__udivmoddi4+0x1f8>
    ba1e:	d106      	bne.n	ba2e <__udivmoddi4+0x202>
    ba20:	454b      	cmp	r3, r9
    ba22:	d204      	bcs.n	ba2e <__udivmoddi4+0x202>
    ba24:	3801      	subs	r0, #1
    ba26:	ebb9 0402 	subs.w	r4, r9, r2
    ba2a:	eb68 0e0c 	sbc.w	lr, r8, ip
    ba2e:	2d00      	cmp	r5, #0
    ba30:	d070      	beq.n	bb14 <__udivmoddi4+0x2e8>
    ba32:	1b1a      	subs	r2, r3, r4
    ba34:	eb61 010e 	sbc.w	r1, r1, lr
    ba38:	fa22 f306 	lsr.w	r3, r2, r6
    ba3c:	fa01 f707 	lsl.w	r7, r1, r7
    ba40:	40f1      	lsrs	r1, r6
    ba42:	2600      	movs	r6, #0
    ba44:	431f      	orrs	r7, r3
    ba46:	e9c5 7100 	strd	r7, r1, [r5]
    ba4a:	e73c      	b.n	b8c6 <__udivmoddi4+0x9a>
    ba4c:	fa02 fc03 	lsl.w	ip, r2, r3
    ba50:	f1c3 0020 	rsb	r0, r3, #32
    ba54:	fa01 f203 	lsl.w	r2, r1, r3
    ba58:	fa21 f600 	lsr.w	r6, r1, r0
    ba5c:	ea4f 4e1c 	mov.w	lr, ip, lsr #16
    ba60:	fa24 f100 	lsr.w	r1, r4, r0
    ba64:	fa1f f78c 	uxth.w	r7, ip
    ba68:	409c      	lsls	r4, r3
    ba6a:	4311      	orrs	r1, r2
    ba6c:	fbb6 f0fe 	udiv	r0, r6, lr
    ba70:	0c0a      	lsrs	r2, r1, #16
    ba72:	fb0e 6610 	mls	r6, lr, r0, r6
    ba76:	ea42 4206 	orr.w	r2, r2, r6, lsl #16
    ba7a:	fb00 f607 	mul.w	r6, r0, r7
    ba7e:	4296      	cmp	r6, r2
    ba80:	d90e      	bls.n	baa0 <__udivmoddi4+0x274>
    ba82:	eb1c 0202 	adds.w	r2, ip, r2
    ba86:	f100 38ff 	add.w	r8, r0, #4294967295	; 0xffffffff
    ba8a:	bf2c      	ite	cs
    ba8c:	f04f 0901 	movcs.w	r9, #1
    ba90:	f04f 0900 	movcc.w	r9, #0
    ba94:	4296      	cmp	r6, r2
    ba96:	d902      	bls.n	ba9e <__udivmoddi4+0x272>
    ba98:	f1b9 0f00 	cmp.w	r9, #0
    ba9c:	d031      	beq.n	bb02 <__udivmoddi4+0x2d6>
    ba9e:	4640      	mov	r0, r8
    baa0:	1b92      	subs	r2, r2, r6
    baa2:	b289      	uxth	r1, r1
    baa4:	fbb2 f6fe 	udiv	r6, r2, lr
    baa8:	fb0e 2216 	mls	r2, lr, r6, r2
    baac:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
    bab0:	fb06 f207 	mul.w	r2, r6, r7
    bab4:	428a      	cmp	r2, r1
    bab6:	d907      	bls.n	bac8 <__udivmoddi4+0x29c>
    bab8:	eb1c 0101 	adds.w	r1, ip, r1
    babc:	f106 38ff 	add.w	r8, r6, #4294967295	; 0xffffffff
    bac0:	d201      	bcs.n	bac6 <__udivmoddi4+0x29a>
    bac2:	428a      	cmp	r2, r1
    bac4:	d823      	bhi.n	bb0e <__udivmoddi4+0x2e2>
    bac6:	4646      	mov	r6, r8
    bac8:	1a89      	subs	r1, r1, r2
    baca:	ea46 4600 	orr.w	r6, r6, r0, lsl #16
    bace:	e725      	b.n	b91c <__udivmoddi4+0xf0>
    bad0:	462e      	mov	r6, r5
    bad2:	4628      	mov	r0, r5
    bad4:	e6f7      	b.n	b8c6 <__udivmoddi4+0x9a>
    bad6:	1a84      	subs	r4, r0, r2
    bad8:	eb61 0303 	sbc.w	r3, r1, r3
    badc:	2001      	movs	r0, #1
    bade:	461f      	mov	r7, r3
    bae0:	e70b      	b.n	b8fa <__udivmoddi4+0xce>
    bae2:	4464      	add	r4, ip
    bae4:	3802      	subs	r0, #2
    bae6:	e749      	b.n	b97c <__udivmoddi4+0x150>
    bae8:	4464      	add	r4, ip
    baea:	3802      	subs	r0, #2
    baec:	e6e1      	b.n	b8b2 <__udivmoddi4+0x86>
    baee:	3a02      	subs	r2, #2
    baf0:	4461      	add	r1, ip
    baf2:	e72e      	b.n	b952 <__udivmoddi4+0x126>
    baf4:	3e02      	subs	r6, #2
    baf6:	4462      	add	r2, ip
    baf8:	e6c6      	b.n	b888 <__udivmoddi4+0x5c>
    bafa:	f1a8 0802 	sub.w	r8, r8, #2
    bafe:	4461      	add	r1, ip
    bb00:	e76f      	b.n	b9e2 <__udivmoddi4+0x1b6>
    bb02:	3802      	subs	r0, #2
    bb04:	4462      	add	r2, ip
    bb06:	e7cb      	b.n	baa0 <__udivmoddi4+0x274>
    bb08:	3802      	subs	r0, #2
    bb0a:	4461      	add	r1, ip
    bb0c:	e77d      	b.n	ba0a <__udivmoddi4+0x1de>
    bb0e:	3e02      	subs	r6, #2
    bb10:	4461      	add	r1, ip
    bb12:	e7d9      	b.n	bac8 <__udivmoddi4+0x29c>
    bb14:	462e      	mov	r6, r5
    bb16:	e6d6      	b.n	b8c6 <__udivmoddi4+0x9a>

0000bb18 <__aeabi_idiv0>:
    bb18:	4770      	bx	lr
    bb1a:	bf00      	nop

0000bb1c <memcpy>:
    bb1c:	440a      	add	r2, r1
    bb1e:	1e43      	subs	r3, r0, #1
    bb20:	4291      	cmp	r1, r2
    bb22:	d100      	bne.n	bb26 <memcpy+0xa>
    bb24:	4770      	bx	lr
    bb26:	b510      	push	{r4, lr}
    bb28:	f811 4b01 	ldrb.w	r4, [r1], #1
    bb2c:	4291      	cmp	r1, r2
    bb2e:	f803 4f01 	strb.w	r4, [r3, #1]!
    bb32:	d1f9      	bne.n	bb28 <memcpy+0xc>
    bb34:	bd10      	pop	{r4, pc}

0000bb36 <memset>:
    bb36:	4402      	add	r2, r0
    bb38:	4603      	mov	r3, r0
    bb3a:	4293      	cmp	r3, r2
    bb3c:	d100      	bne.n	bb40 <memset+0xa>
    bb3e:	4770      	bx	lr
    bb40:	f803 1b01 	strb.w	r1, [r3], #1
    bb44:	e7f9      	b.n	bb3a <memset+0x4>
	...

0000bb48 <_strtol_l.constprop.0>:
    bb48:	2b01      	cmp	r3, #1
    bb4a:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bb4e:	d001      	beq.n	bb54 <_strtol_l.constprop.0+0xc>
    bb50:	2b24      	cmp	r3, #36	; 0x24
    bb52:	d906      	bls.n	bb62 <_strtol_l.constprop.0+0x1a>
    bb54:	f000 f884 	bl	bc60 <__errno>
    bb58:	2316      	movs	r3, #22
    bb5a:	6003      	str	r3, [r0, #0]
    bb5c:	2000      	movs	r0, #0
    bb5e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bb62:	460d      	mov	r5, r1
    bb64:	f8df c0e0 	ldr.w	ip, [pc, #224]	; bc48 <_strtol_l.constprop.0+0x100>
    bb68:	462e      	mov	r6, r5
    bb6a:	f815 4b01 	ldrb.w	r4, [r5], #1
    bb6e:	f814 700c 	ldrb.w	r7, [r4, ip]
    bb72:	f017 0708 	ands.w	r7, r7, #8
    bb76:	d1f7      	bne.n	bb68 <_strtol_l.constprop.0+0x20>
    bb78:	2c2d      	cmp	r4, #45	; 0x2d
    bb7a:	d132      	bne.n	bbe2 <_strtol_l.constprop.0+0x9a>
    bb7c:	782c      	ldrb	r4, [r5, #0]
    bb7e:	2701      	movs	r7, #1
    bb80:	1cb5      	adds	r5, r6, #2
    bb82:	2b00      	cmp	r3, #0
    bb84:	d05b      	beq.n	bc3e <_strtol_l.constprop.0+0xf6>
    bb86:	2b10      	cmp	r3, #16
    bb88:	d109      	bne.n	bb9e <_strtol_l.constprop.0+0x56>
    bb8a:	2c30      	cmp	r4, #48	; 0x30
    bb8c:	d107      	bne.n	bb9e <_strtol_l.constprop.0+0x56>
    bb8e:	782c      	ldrb	r4, [r5, #0]
    bb90:	f004 04df 	and.w	r4, r4, #223	; 0xdf
    bb94:	2c58      	cmp	r4, #88	; 0x58
    bb96:	d14d      	bne.n	bc34 <_strtol_l.constprop.0+0xec>
    bb98:	786c      	ldrb	r4, [r5, #1]
    bb9a:	2310      	movs	r3, #16
    bb9c:	3502      	adds	r5, #2
    bb9e:	f107 4800 	add.w	r8, r7, #2147483648	; 0x80000000
    bba2:	f04f 0c00 	mov.w	ip, #0
    bba6:	f108 38ff 	add.w	r8, r8, #4294967295	; 0xffffffff
    bbaa:	4666      	mov	r6, ip
    bbac:	fbb8 f9f3 	udiv	r9, r8, r3
    bbb0:	fb03 8a19 	mls	sl, r3, r9, r8
    bbb4:	f1a4 0e30 	sub.w	lr, r4, #48	; 0x30
    bbb8:	f1be 0f09 	cmp.w	lr, #9
    bbbc:	d816      	bhi.n	bbec <_strtol_l.constprop.0+0xa4>
    bbbe:	4674      	mov	r4, lr
    bbc0:	42a3      	cmp	r3, r4
    bbc2:	dd24      	ble.n	bc0e <_strtol_l.constprop.0+0xc6>
    bbc4:	f1bc 0f00 	cmp.w	ip, #0
    bbc8:	db1e      	blt.n	bc08 <_strtol_l.constprop.0+0xc0>
    bbca:	45b1      	cmp	r9, r6
    bbcc:	d31c      	bcc.n	bc08 <_strtol_l.constprop.0+0xc0>
    bbce:	d101      	bne.n	bbd4 <_strtol_l.constprop.0+0x8c>
    bbd0:	45a2      	cmp	sl, r4
    bbd2:	db19      	blt.n	bc08 <_strtol_l.constprop.0+0xc0>
    bbd4:	fb06 4603 	mla	r6, r6, r3, r4
    bbd8:	f04f 0c01 	mov.w	ip, #1
    bbdc:	f815 4b01 	ldrb.w	r4, [r5], #1
    bbe0:	e7e8      	b.n	bbb4 <_strtol_l.constprop.0+0x6c>
    bbe2:	2c2b      	cmp	r4, #43	; 0x2b
    bbe4:	bf04      	itt	eq
    bbe6:	782c      	ldrbeq	r4, [r5, #0]
    bbe8:	1cb5      	addeq	r5, r6, #2
    bbea:	e7ca      	b.n	bb82 <_strtol_l.constprop.0+0x3a>
    bbec:	f1a4 0e41 	sub.w	lr, r4, #65	; 0x41
    bbf0:	f1be 0f19 	cmp.w	lr, #25
    bbf4:	d801      	bhi.n	bbfa <_strtol_l.constprop.0+0xb2>
    bbf6:	3c37      	subs	r4, #55	; 0x37
    bbf8:	e7e2      	b.n	bbc0 <_strtol_l.constprop.0+0x78>
    bbfa:	f1a4 0e61 	sub.w	lr, r4, #97	; 0x61
    bbfe:	f1be 0f19 	cmp.w	lr, #25
    bc02:	d804      	bhi.n	bc0e <_strtol_l.constprop.0+0xc6>
    bc04:	3c57      	subs	r4, #87	; 0x57
    bc06:	e7db      	b.n	bbc0 <_strtol_l.constprop.0+0x78>
    bc08:	f04f 3cff 	mov.w	ip, #4294967295	; 0xffffffff
    bc0c:	e7e6      	b.n	bbdc <_strtol_l.constprop.0+0x94>
    bc0e:	f1bc 0f00 	cmp.w	ip, #0
    bc12:	da05      	bge.n	bc20 <_strtol_l.constprop.0+0xd8>
    bc14:	2322      	movs	r3, #34	; 0x22
    bc16:	4646      	mov	r6, r8
    bc18:	6003      	str	r3, [r0, #0]
    bc1a:	b942      	cbnz	r2, bc2e <_strtol_l.constprop.0+0xe6>
    bc1c:	4630      	mov	r0, r6
    bc1e:	e79e      	b.n	bb5e <_strtol_l.constprop.0+0x16>
    bc20:	b107      	cbz	r7, bc24 <_strtol_l.constprop.0+0xdc>
    bc22:	4276      	negs	r6, r6
    bc24:	2a00      	cmp	r2, #0
    bc26:	d0f9      	beq.n	bc1c <_strtol_l.constprop.0+0xd4>
    bc28:	f1bc 0f00 	cmp.w	ip, #0
    bc2c:	d000      	beq.n	bc30 <_strtol_l.constprop.0+0xe8>
    bc2e:	1e69      	subs	r1, r5, #1
    bc30:	6011      	str	r1, [r2, #0]
    bc32:	e7f3      	b.n	bc1c <_strtol_l.constprop.0+0xd4>
    bc34:	2430      	movs	r4, #48	; 0x30
    bc36:	2b00      	cmp	r3, #0
    bc38:	d1b1      	bne.n	bb9e <_strtol_l.constprop.0+0x56>
    bc3a:	2308      	movs	r3, #8
    bc3c:	e7af      	b.n	bb9e <_strtol_l.constprop.0+0x56>
    bc3e:	2c30      	cmp	r4, #48	; 0x30
    bc40:	d0a5      	beq.n	bb8e <_strtol_l.constprop.0+0x46>
    bc42:	230a      	movs	r3, #10
    bc44:	e7ab      	b.n	bb9e <_strtol_l.constprop.0+0x56>
    bc46:	bf00      	nop
    bc48:	0000dcb1 	.word	0x0000dcb1

0000bc4c <strtol>:
    bc4c:	4613      	mov	r3, r2
    bc4e:	460a      	mov	r2, r1
    bc50:	4601      	mov	r1, r0
    bc52:	4802      	ldr	r0, [pc, #8]	; (bc5c <strtol+0x10>)
    bc54:	6800      	ldr	r0, [r0, #0]
    bc56:	f7ff bf77 	b.w	bb48 <_strtol_l.constprop.0>
    bc5a:	bf00      	nop
    bc5c:	20000210 	.word	0x20000210

0000bc60 <__errno>:
    bc60:	4b01      	ldr	r3, [pc, #4]	; (bc68 <__errno+0x8>)
    bc62:	6818      	ldr	r0, [r3, #0]
    bc64:	4770      	bx	lr
    bc66:	bf00      	nop
    bc68:	20000210 	.word	0x20000210

0000bc6c <TABLE7_2_PANID_Compression>:
    bc6c:	00000000 01000000 00020100 03000001     ................
    bc7c:	00000100 00000002 00000301 02000100     ................
    bc8c:	00000100 00010003 00000200 00030001     ................
    bc9c:	03030100 03000001 01000003 01010202     ................
    bcac:	01030200 02030001 02000101 01000103     ................
    bcbc:	00010203 01020201 00000100 00006425     ............%d..

0000bccc <HexToAscii>:
    bccc:	33323130 37363534 42413938 46454443     0123456789ABCDEF
    bcdc:	72756f53 2f736563 2f4c4148 696c6953     Sources/HAL/Sili
    bcec:	4c6e6f63 2f736261 2f4b4453 6b636567     conLabs/SDK/geck
    bcfc:	64735f6f 2e335f6b 2f312e31 74616c70     o_sdk_3.1.1/plat
    bd0c:	6d726f66 6c6d652f 732f6269 652f6372     form/emlib/src/e
    bd1c:	6d635f6d 00632e75 72756f53 2f736563     m_cmu.c.Sources/
    bd2c:	2f4c4148 696c6953 4c6e6f63 2f736261     HAL/SiliconLabs/
    bd3c:	2f4b4453 6b636567 64735f6f 2e335f6b     SDK/gecko_sdk_3.
    bd4c:	2f312e31 74616c70 6d726f66 6c6d652f     1.1/platform/eml
    bd5c:	732f6269 652f6372 70675f6d 632e6f69     ib/src/em_gpio.c
    bd6c:	00000000 6f532f2e 65637275 41482f73     ...../Sources/HA
    bd7c:	69532f4c 6f63696c 62614c6e 44532f73     L/SiliconLabs/SD
    bd8c:	65672f4b 5f6f6b63 5f6b6473 2e312e33     K/gecko_sdk_3.1.
    bd9c:	6c702f31 6f667461 652f6d72 62696c6d     1/platform/emlib
    bdac:	636e692f 5f6d652f 6f697067 0000682e     /inc/em_gpio.h..
    bdbc:	72756f53 2f736563 2f4c4148 696c6953     Sources/HAL/Sili
    bdcc:	4c6e6f63 2f736261 2f4b4453 6b636567     conLabs/SDK/geck
    bddc:	64735f6f 2e335f6b 2f312e31 74616c70     o_sdk_3.1.1/plat
    bdec:	6d726f66 6c6d652f 732f6269 652f6372     form/emlib/src/e
    bdfc:	73755f6d 2e747261 00000063              m_usart.c...

0000be08 <rail154Config>:
    be08:	00000000 02a00000 02020202 00000064     ............d...
    be18:	000000c0 00000064 000000c0 00000000     ....d...........
	...
    be30:	0000010f 00000000 00000000 000f4240     ............@B..
    be40:	00000500 00001000 00000000 00000000     ................

0000be50 <sl_app_properties>:
    be50:	fa79b713 b7dd25c9 e0cff3ad b814b6f1     ..y..%..........
	...
    be68:	ffffffff 00000001 00000000 00000000     ................
	...
    be90:	ffffffff ffffffff ffffffff 00000000     ................
	...

0000beb4 <RAILINT_c31703a7fdcc05c41a79c5dab844e34f>:
    beb4:	08020000 00000000                       ........

0000bebc <RAILINT_6395d1d00f39eebcdfd90fd22fbd0f21>:
    bebc:	38000000 18000000 20000000 00000000     ...8....... ....

0000becc <RAILINT_e2c2f3fe6db413d95c1b5e9d1dee12f0>:
    becc:	01010100                                ....

0000bed0 <RAILINT_e88d2ff9c2ad0d21d5b6d6840de5ac12>:
    bed0:	01010000                                ....

0000bed4 <RAILINT_05cd8f4263afe5a5f0561f4363d8f82d>:
    bed4:	01000000                                ....

0000bed8 <RAILINT_cced209ae0bf7d802971ebcf473b7962>:
    bed8:	02030202 04020202 04040405              ............

0000bee4 <ieee802154_2p4_antdiv_timing>:
    bee4:	000019e1 000019e1 00000000              ............

0000bef0 <ieee802154_2p4_coherent_timing>:
    bef0:	00001964 00001964 00000000              d...d.......

0000befc <RAILINT_78ce8b40f7196493de99e0d9ea79b6c4>:
	...

0000bf04 <ble_LR_DSA_125kb_timing>:
    bf04:	0002daf5 00001770 00000bb8              ....p.......

0000bf10 <ble_LR_DSA_500kb_timing>:
    bf10:	0000bfe5 00001770 00000bb8              ....p.......

0000bf1c <RAILINT_8538875f216554bf4208f0c5a0c4ec23>:
    bf1c:	03020100                                 .......

0000bf23 <RAILINT_1b36f96a72656bd43a4afffed3254c9e>:
    bf23:	02020100 05040303 0c0c0806               .............

0000bf30 <RAILINT_d3dd13574495c9b1fcdaf482701deee1>:
    bf30:	a801a800 b000a802                       ........

0000bf38 <RAILINT_fc4f997ed88f479adfdd3de1f377abc0>:
    bf38:	08040403 00000008                       ........

0000bf40 <RAILINT_6c7715fcf8a536bb641f7a33742a842f>:
    bf40:	0d6c7048 0cda7044 11687030 14f29802     Hpl.Dp..0ph.....
    bf50:	0d567038 0d7a7034 0e5c7030 0e5c702c     8pV.4pz.0p\.,p\.
    bf60:	0fca7028 0fe27024 0d647020 1068701c     (p..$p.. pd..ph.
    bf70:	10e47018 0d5c7014 600810b1 710ad801     .p...p\....`...q
    bf80:	787fb804 787e0c02 c6001064 a0001f94     ...x..~xd.......
    bf90:	7870b81d 6018b003 b327300f 1101330f     ..px...`.0'..3..
    bfa0:	980648c0 b0290246 d8016008 dd097108     .H..F.)..`...q..
    bfb0:	bb097104 60161011 600848a0 12011004     .q.....`.H.`....
    bfc0:	502132ff 48d06008 88006008 12269806     .2!P.`.H.`....&.
    bfd0:	1f34c400 ba00a000 7110df03 7206df09     ..4........q...r
    bfe0:	03009802 7850b81d 1344a000 15411428     ......Px..D.(.A.
    bff0:	60081081 7114d802 98068810 c0001668     ...`...q....h...
    c000:	a800c014 18be9806 98069100 6001025c     ............\..`
    c010:	d82030b8 bc1e7106 c4007c63 440040e0     .0 ..q..c|...@.D
    c020:	62081244 40213201 4d187c08 32f01254     D..b.2!@.|.MT..2
    c030:	7204de40 db044840 dd0d7208 4b04720c     @..r@H...r...r.K
    c040:	481430ef 048c9806 d9401181 12b1721c     .0.H......@..r..
    c050:	4acf3230 dab13a01 d8087210 d8047106     02.J.:...r...q..
    c060:	4c807108 70407c23 12444c68 228732ff     .q.L#|@phLD..2."
    c070:	b8807504 d8814ce8 d9407132 7c237204     .u...L..2q@..r#|
    c080:	98064b08 ba04048c 7976b91c 4020c100     .K........vy.. @
    c090:	7935a801 2161217f b9067900 d801a906     ..5y.!a!.y......
    c0a0:	4c80722e 98027c30 d808022e ba07710c     .r.L0|.......q..
    c0b0:	7104d824 7018ba06 710cd804 d840ba01     $..q...p...q..@.
    c0c0:	ba02710e ba05700a 7204d820 4c20ba03     .q...p.. ..r.. L
    c0d0:	4cc01144 61081418 11911418 42113138     D..L...a....81.B
    c0e0:	61181191 7204d910 c10032ef a8014008     ...a...r.2...@..
    c0f0:	31101114 4211611e 11a11428 14186108     ...1.a.B(....a..
    c100:	18a49806 c1001418 a8014008 61181114     .........@.....a
    c110:	141831ff 401cc100 1114a800 61081418     .1.....@.......a
    c120:	4028c200 1224a801 710432ff d8084910     ..(@..$..2.q.I..
    c130:	c200713c a8004054 da101224 4cb87130     <q..T@..$...0q.L
    c140:	bd801244 25ff6da2 12444c78 3a5122fc     D....m.%xLD.."Q:
    c150:	4c101428 c10cc200 1224a801 62081428     (..L......$.(..b
    c160:	62081428 62081428 4cd01428 88301418     (..b(..b(..L..0.
    c170:	98064802 93000356 7104db08 a000f801     .H..V......q....
    c180:	300fb027 8810a000 611811b1 710ad980     '..0.......a...q
    c190:	4088c100 1108a800 a0009100 4070c400     ...@..........p@
    c1a0:	1044a800 c000a000 40004088 61821104     ..D......@.@...a
    c1b0:	60821004 72f05010 1554a000 71124550     ...`.P.r..T.PE.q
    c1c0:	04969806 042c9806 7870b807 7841b802     ......,...px..Ax
    c1d0:	7a5bba1c 7a5d7a5c c020c200 1224a801     ..[z\z]z.. ...$.
    c1e0:	16729806 1f38c500 1554a000 c3001451     ..r...8...T.Q...
    c1f0:	000001ff 64093d31 9806347f 58010266     ....1=.d.4..f..X
    c200:	75042851 28415801 1181750e d9026108     Q(.u.XA(.u...a..
    c210:	0fff7204 b80770cc f8007872 c000baeb     .r...p..rx......
    c220:	a0001f34 3a111104 7112d910 631833ff     4......:...q.3.c
    c230:	1078c100 1138a802 7974b907 a0001028     ..x...8...ty(...
    c240:	025c9806 300d4c18 48047204 c11cc100     ..\..L.0.r.H....
    c250:	1114a801 1ec4c300 1591a000 72163504     .............5.r
    c260:	bb1c1318 7104d808 d8047b6c 7b6a7104     .......ql{...qj{
    c270:	70167c2f 13184b0c d808bb1c 7b6f7104     /|.p.K.......qo{
    c280:	7104d804 7c217b6d 6002300c 04189806     ...qm{!|.0.`....
    c290:	0a809806 11b1b800 d9406118 98027206     .........a@..r..
    c2a0:	bc0103f8 4008c200 dc00a801 1524710a     .......@.....q$.
    c2b0:	4a606502 4a2c700a 65081524 35044a4c     .e`J.p,J$..eLJ.5
    c2c0:	7104d908 c1002420 a0001f2c dc001214     ...q $..,.......
    c2d0:	d8207132 b8017106 daf0700c db0c720c     2q ..q...p...r..
    c2e0:	b8027108 04209806 c3002448 a8014138     .q.... .H$..8A..
    c2f0:	7b8f1334 b902710e db081391 b9037204     4..{.q.......r..
    c300:	491c7006 c3001114 a8004088 2001b8ff     .p.I.....@..... 
    c310:	71084111 13184101 42012408 8040c100     .A.q.A...$.B..@.
    c320:	1114a801 651c4101 15914151 651e3520     .....A.eQA.. 5.e
    c330:	13184151 13481328 4084c300 1034a800     QA..(.H....@..4.
    c340:	7110d803 dc053007 c300710a 4003c484     ...q.0...q.....@
    c350:	b81d7b21 b8007850 1f2cc100 1214a000     !{..Px....,.....
    c360:	5021601c 520130f0 a0001128 64072440     .`!P.0.R(...@$.d
    c370:	ffffc000 3c010001 2002b017 28405801     .......<... .X@(
    c380:	ac187506 a000ec01 c0008820 a801c020     .u...... ... ...
    c390:	b4171204 12041321 71f85230 24406419     ....!...0R.q.d@$
    c3a0:	1f68c300 1034a000 98061114 61190cc2     ..h...4........a
    c3b0:	59119200 76062921 5911bb00 0ca29806     ...Y!).v...Y....
    c3c0:	3b316287 5a217204 a0002a41 4070c200     .b1;.r!ZA*....p@
    c3d0:	7a31a800 8830a000 6111b901 0000c300     ..1z..0....a....
    c3e0:	1031ffc0 bc002831 750c2d00 ac185411     ..1.1(...-.u.T..
    c3f0:	2d31ec01 641970f4 55411351 93002c31     ..1-.p.dQ.AU1,..
    c400:	9806a000 c20006a2 a8018054 1fd4c000     ........T.......
    c410:	1004a000 22b81208 7a237a21 7841b852     ......."!z#zR.Ax
    c420:	600cb801 b809a821 a84c6019 6e29c000     ...`!....`L...)n
    c430:	a84f0006 786eb824 b0ffb9ac 7104d804     ..O.$.nx.......q
    c440:	a923b94c 05129806 3fd3c000 a8500000     L.#........?..P.
    c450:	c000a000 a0001f48 1018b117 04969806     ....H...........
    c460:	3fd8c000 a8500000 b921bc49 b249b852     ...?..P.I.!.R.I.
    c470:	712ade07 7108de05 7c607c62 79610c1d     ..*q...qb|`|..ay
    c480:	78647867 7862786b 78637865 7c617860     gxdxkxbxexcx`xa|
    c490:	0c010c01 0c027868 786c7869 c2000c02     ....hx..ixlx....
    c4a0:	a801802c 7a287a27 786a7a26 79410c05     ,...'z(z&zjx..Ay
    c4b0:	4a780c0a 7a327a2b 7a244a58 0100c400     ..xJ+z2zXJ$z....
    c4c0:	4a400011 8410c000 12080000 c5008850     ..@J........P...
    c4d0:	00011084 bd10adfb 6b8abb01 a9fab921     ...........k!...
    c4e0:	12184ac4 7a227a21 1f28c000 1004a000     .J..!z"z..(.....
    c4f0:	6482a8fc 30301041 a9f92901 b0fbadf8     ...dA.00.)......
    c500:	a8fb6082 65a03003 48041021 7a23ec20     .`...0.e!..H .#z
    c510:	7a031004 11244a18 58014adc 10242900     ...z.J$..J.X.)$.
    c520:	50317504 5011b1f8 712a6381 40314051     .u1P...P.c*qQ@1@
    c530:	b1fc1208 a9fc6184 710e310f 2811b017     .....a...1.q...(
    c540:	5911b117 76fa2810 b1f94ac4 7a211218     ...Y.(.v.J....!z
    c550:	70a07a22 12089500 7a204a40 b8004a84     "z.p....@J z.J..
    c560:	0c021208 7a084aa4 b8210c02 4a787841     .....J.z..!.AxxJ
    c570:	7a127a0b 1fc4c200 b0ffa000 7204d808     .z.z...........r
    c580:	10244a08 710adc00 2204a840 a8411024     .J$....q@.."$.A.
    c590:	02669806 1f38c200 1024a000 c4005101     ..f...8...$..Q..
    c5a0:	000001ff 50113941 a0001208 06a29806     ....A9.P........
    c5b0:	c200bc00 a801800c b8527a21 0c027849     ........!zR.Ix..
    c5c0:	0c027848 7841b849 ac21ac52 7a084a20     Hx..I.AxR.!. J.z
    c5d0:	7a077a06 c000ac49 a0001f50 1018b117     .z.zI...P.......
    c5e0:	b859a000 b15a7840 72fcd901 b8577842     ..Y.@xZ....rBxW.
    c5f0:	b1587840 72fcd901 a0007842 800cc200     @xX....rBx......
    c600:	7a21a801 b8217a22 b8077854 a84c6015     ..!z"z!.Tx...`L.
    c610:	7861b852 4029c000 a84f0006 b8c84a58     R.ax..)@..O.XJ..
    c620:	b8241208 b84c784e 9806a823 c0000512     ..$.NxL.#.......
    c630:	a0001f5c 1018b117 3fc4c000 a8500000     \..........?..P.
    c640:	0980c000 a8404000 b1ffb809 7104d908     .....@@........q
    c650:	a853b803 d80410b1 bb56710c ba577b60     ..S......qV.`{W.
    c660:	7a607a62 710cd802 7b60bb56 7a62ba59     bz`z...qV.`{Y.bz
    c670:	b8047a60 b83d786e c0007860 00003856     `z..nx=.`x..V8..
    c680:	c024c100 1114a800 7204799f a84c4808     ..$......y.r.HL.
    c690:	b1ffb82e 7106d908 7004a84a b80fa84b     .......qJ..pK...
    c6a0:	c000a834 00005e0c 4201b246 c100aa46     4....^..F..BF...
    c6b0:	a801402c 61081114 71083106 9806b900     ,@.....a.1.q....
    c6c0:	98060f4a 9806122c d90218ca 98067206     J...,........r..
    c6d0:	98060b4c 14511226 042c9806 1f58c000     L...&.Q...,...X.
    c6e0:	b117a000 98021018 b8000f24 a84aa84c     ........$...L.J.
    c6f0:	c000a84b ffff21f3 3901b146 b804a946     K....!..F..9F...
    c700:	a000786f 1f4cc000 b117a000 bcfa1018     ox....L.........
    c710:	5c416419 c0002c51 a0001f60 2c011004     .dA\Q,..`......,
    c720:	98067506 9806042c 10b10d8e d8246018     .u..,........`$.
    c730:	ba407134 11fc9806 7c7fbc1d 7865b804     4q@........|..ex
    c740:	d8041091 b81c7116 c000786e a8004068     .....q..nx..h@..
    c750:	98067821 40010f72 7c427208 12389806     !x..r..@.rB|..8.
    c760:	0a1a9802 7871b81d 786cb804 7842b841     ......qx..lxA.Bx
    c770:	78447863 d904b1ff 98027206 c00008d4     cxDx.....r......
    c780:	00003fc4 c300a850 a0001f20 c074c200     .?..P... .....t.
    c790:	1424a800 bc001348 4b041248 14244a1c     ..$.H...H..K.J$.
    c7a0:	bc001348 ba4a1248 7a427a44 7a44ba4b     H...H.J.DzBzK.Dz
    c7b0:	7a617a42 7a64ba4c ba3d7a65 b94d7a60     BzazL.dzez=.`zM.
    c7c0:	bb3fb842 7966795b 0c027961 0c057964     B.?.[yfyay..dy..
    c7d0:	79607963 79620c05 795a7965 0134c200     cy`y..byeyZy..4.
    c7e0:	1324a802 6019b805 12084031 786ab842     ..$....`1@..B.jx
    c7f0:	784a0c02 bc400c02 da08b2ff ba4a7106     ..Jx..@......qJ.
    c800:	ba4b7006 7a657a62 7a667a67 7b66796a     .pK.bzezgzfzjyf{
    c810:	099c9802 1f20c300 c200a000 a800c074     ...... .....t...
    c820:	13481424 4a1c4b04 13481424 1248bc3f     $.H..K.J$.H.?.H.
    c830:	bc004a1c ba4a1248 7a627a64 7a64ba4b     .J..H.J.dzbzK.dz
    c840:	7a617a62 7a64ba4c ba3d7a65 d9017a60     bzazL.dzez=.`z..
    c850:	7864714e 8070c100 c000a801 00080080     Nqdx..p.........
    c860:	98061108 b8420a42 b94d7861 797e797f     ....B.B.axM..y~y
    c870:	7868786a 0c027862 0c0f797b 0c14797a     jxhxbx..{y..zy..
    c880:	78417974 79757860 b2ff0c05 7106da08     tyAx`xuy.......q
    c890:	7004b84a 7865b84b 6416bc01 d9027040     J..pK.ex...d@p..
    c8a0:	9806713c b8420a42 7868b94d 78417840     <q..B.B.M.hx@xAx
    c8b0:	797e797f 0c0f797b 0c14797a da08b2ff     .y~y{y..zy......
    c8c0:	79717108 7006ba4a ba4b7970 7a657972     .qqyJ..ppyK.ryez
    c8d0:	0c02786a 0c05784a 6416bc01 79410c02     jx..Jx.....d..Ay
    c8e0:	0c0c7940 014cc000 1048a802 048c9806     @y....L...H.....
    c8f0:	c0001451 a0001f60 2c011004 1101b017     Q...`......,....
    c900:	58016887 760e2841 69872105 2d415c41     .h.XA(.v.!.iA\A-
    c910:	70062d11 042c9806 1f5cc000 b117a000     .-.p..,...\.....
    c920:	b8421018 7b7cbb4d 0c027864 7868b829     ..B.M.|{dx..).hx
    c930:	98061451 b842042c b1ff7844 710cd901     Q...,.B.Dx.....q
    c940:	8054c100 b8cba801 c0001108 a0001f54     ..T.........T...
    c950:	1018b117 d8041091 c0007114 a0001e9c     .........q......
    c960:	d8801004 b8077106 f8007853 c100b807     .....q..Sx......
    c970:	a0001ec0 c020c200 1224a801 78761128     ...... ...$.(.vx
    c980:	10b1f800 71387894 02669806 5911b9e4     .....x8q..f....Y
    c990:	76062811 700cb800 5911b9a0 75042901     .(.v...p...Y.).u
    c9a0:	6082b8a0 1fbcc300 1334a000 10342b01     ...`......4..+4.
    c9b0:	ffffc300 b142ff00 40113931 a000a842     ......B.19.@B...
    c9c0:	7891b01d b84271fa 0c027864 aa29ba00     ...x.qB.dx....).
    c9d0:	8054c400 b842a801 c300b94d a80140c0     ..T...B.M....@..
    c9e0:	7b971334 ec407204 78440c02 aa53795c     4..{.r@...Dx\yS.
    c9f0:	14280c0a b94db842 db01b3ff 4c247126     ..(.B.M.....&q$L
    ca00:	0fffc300 143801ff 78407954 79557841     ......8.Ty@xAxUy
    ca10:	795b0c02 0c14795a 795e795f 7842784a     ..[yZy.._y^yJxBx
    ca20:	db027034 79527114 79507951 795b0c02     4p...qRyQyPy..[y
    ca30:	795f795a 701e795e 711adb04 07ffc400     Zy_y^y.p...q....
    ca40:	c3000000 a8022134 bb3f1348 0c027b46     ....4!..H.?.F{..
    ca50:	795a795b 7b40bb3d 7b44bb4c c3007b45     [yZy=.@{L.D{E{..
    ca60:	a0001f24 3c401434 c0007116 a800c068     $...4.@<.q..h...
    ca70:	13281048 481c4b04 10481434 aa4a1328     H.(..K.H4.H.(.J.
    ca80:	b804aa4b b81d786d a0007851 d80110b1     K...mx..Qx......
    ca90:	a0007204 c074c000 1104a800 b9008810     .r....t.........
    caa0:	48681018 88101104 610bb901 482c1018     ..hH.......a..,H
    cab0:	88101104 c1008800 00001c23 b84a1018     ........#.....J.
    cac0:	b84b7864 0c267864 c100b028 f00fffff     dxK.dx&.(.......
    cad0:	b9713811 4011610b b928a828 79747973     .8q..a.@(.(.syty
    cae0:	1010c200 aa453030 0c0e7954 40e8c000     ....00E.Ty.....@
    caf0:	1104a801 3030c200 aa451010 10040c0e     ......00..E.....
    cb00:	88108800 0c169806 90009100 618f8820     ............ ..a
    cb10:	9806608f 90000c16 40216a88 6a901201     .`.......j!@...j
    cb20:	c1005803 00003f3f bcff3811 28412402     .X..??...8...$A(
    cb30:	42013811 b928aa45 b84a7953 b84b7844     .8.BE.(.SyJ.DxK.
    cb40:	90007844 10189100 482c9100 91001018     Dx........,H....
    cb50:	10184868 6891a000 69916043 5b116143     hH.....hC`.iCa.[
    cb60:	28112b01 28316041 ba005b31 76062830     .+.(A`1(1[..0(.v
    cb70:	4a202831 28306341 28317606 63414a10     1( JAc0(.v1(.JAc
    cb80:	76062830 4a082831 28306341 28317606     0(.v1(.JAc0(.v1(
    cb90:	63414a04 76062830 4a022831 28306341     .JAc0(.v1(.JAc0(
    cba0:	4a017604 5911a000 7106d910 60086008     .v.J...Y...q.`.`
    cbb0:	7104d908 d9046008 60047104 7104d902     ...q.`...q.`...q
    cbc0:	d9016002 60017104 8810a000 30021104     .`...q.`.......0
    cbd0:	61087106 c0006108 0000ffff 91003811     .q.a.a.......8..
    cbe0:	ba00a000 7106d801 2a114801 6001611f     .......q.H.*.a.`
    cbf0:	72f6d801 72f63801 c200a000 a801c020     ...r.8.r.... ...
    cc00:	59111224 73122921 710e2100 c038c200     $..Y!).s.!.q..8.
    cc10:	1224a801 29212101 b002a000 7114d820     ..$..!!).... ..q
    cc20:	1ea8c000 1004a000 7945b902 11609806     ..........Ey..`.
    cc30:	b00370ea 7208789f a806b800 9806f800     .p...x.r........
    cc40:	c50006a2 a0001f74 4d048850 c000bc1c     ....t...P..M....
    cc50:	a0001eac d9011181 7c40711e 15019500     .........q@|....
    cc60:	88504d1c bbff4d04 5b316318 98061104     .MP..M...c1[....
    cc70:	29310cba 980675f8 155417ba 18ca9806     ..1).u....T.....
    cc80:	7208d901 06bc9806 98067006 bb1c0732     ...r.....p..2...
    cc90:	95007b54 9806f800 700e07aa 0a809806     T{.........p....
    cca0:	07aa9806 104a9806 066c9806 c0001921     ......J...l.!...
    ccb0:	a801402c 7809780a b910f800 9806ba01     ,@...x.x........
    ccc0:	980611f2 c5000f24 a0001f74 1291f800     ....$...t.......
    ccd0:	b91c3203 1e9cc300 1334a000 40b0c400     .2........4....@
    cce0:	b81d4400 79707842 7106de03 703e7844     .D..Bxpy...qDx>p
    ccf0:	10a17971 710ad820 06bc9806 0e689802     qy.. ..q......h.
    cd00:	711cdb80 7218d802 1408b805 301010a1     ...q...r.......0
    cd10:	14084802 1408b800 60081091 b81d1408     .H.........`....
    cd20:	10a17862 7606dc00 ba007951 31201191     bx.....vQy.... 1
    cd30:	1091611d 720ed804 1f40c100 1114a000     .a.....r..@.....
    cd40:	710ad901 98068820 92000f4a 4020c100     ...q ...J..... @
    cd50:	3305a800 72184b05 de034c08 4c907104     ...3.K.r.L...q.L
    cd60:	c3001444 00001fff 23ff3b41 49941138     D.......A;.#8..I
    cd70:	4138c300 1334a801 db806308 ba03710c     ..8A..4..c...q..
    cd80:	98066218 70080e50 98066218 490c0e50     .b..P..p.b..P..I
    cd90:	79097908 40211014 a0001108 9806bd00     .y.y..!@........
    cda0:	b9100240 7104dc03 ba01b900 11f29806     @......q........
    cdb0:	7106d902 724e4000 6118b103 9806310f     ...q.@Nr...a.1..
    cdc0:	d8ff0f72 10817228 7118d808 710add06     r...(r.....q...q
    cdd0:	02409806 720cdc03 0fb69806 12389806     ..@....r......8.
    cde0:	dd06700c 98067110 70480fbc a804b820     .p...q....Hp ...
    cdf0:	7210dd06 07aa9806 066c9806 b840f801     ...r......l...@.
    ce00:	f800a804 1e9cc000 1304a000 db016308     .............c..
    ce10:	10917122 61181101 b91d3811 7108d810     "q.....a.8.....q
    ce20:	98027944 db020e68 13a172fa 72f4db28     Dy..h....r..(..r
    ce30:	9806bd03 98060f18 c50007aa a0001f78     ............x...
    ce40:	02409806 dc03ba00 4d047204 2d211554     ..@......r.MT.!-
    ce50:	04c29806 07c49802 55011091 50513503     ...........U.5QP
    ce60:	a0001901 1f3cc100 1014a000 7142d801     ......<.......Bq
    ce70:	60084801 750e20fe d8201081 c1007108     .H.`. .u.. ..q..
    ce80:	a0001f40 d9011114 c0007128 a801402c     @.......(q..,@..
    ce90:	51211204 310f6108 52116118 c0001028     ..!Q.a.1.a.R(...
    cea0:	a8014008 12911104 31205121 19215211     .@......!Q 1.R!.
    ceb0:	1381a000 7206db80 a000b801 c014c300     .......r........
    cec0:	1034a801 722e3006 12344b6c 10344b1c     ..4..0.rlK4..K4.
    ced0:	30026018 10817220 71ded880 4a011034     .`.0 r.....q4..J
    cee0:	60046208 50213080 710a488c 234d237f     .b.`.0!P.H.q.#M#
    cef0:	30011034 bd00a000 0f189806 7847b81c     4..0..........Gx
    cf00:	78437845 7844b802 9806a000 980607aa     ExCx..Dx........
    cf10:	c5000fb6 a0001f80 98061554 980204c2     ........T.......
    cf20:	c30007c4 4003c484 98067b01 c100122c     .......@.{..,...
    cf30:	a8014138 798f1114 c100710e a80040b8     8A.....y.q...@..
    cf40:	9806ba00 ba500e50 11fc9806 0f729806     ....P.P.......r.
    cf50:	712ed8ff d8041091 d920722c 12117224     ...q....,r .$r..
    cf60:	512132ff 21807120 14112180 11d69806     .2!Q q.!.!......
    cf70:	720e4440 c200b900 a0001ea4 70061218     @D.r...........p
    cf80:	7860b804 12269806 b900f800 40a4c200     ..`x..&........@
    cf90:	12184400 b90a4a64 ba1c1218 7a517a50     .D..dJ......PzQz
    cfa0:	7942b91d a000795f 02409806 7210dc07     ..By_y....@....r
    cfb0:	20001091 9806750a 9802104a 98060d86     ... .u..J.......
    cfc0:	b901066c d8041091 b9007104 9806ba10     l........q......
    cfd0:	ba0011f2 71344000 1e9cc000 1104a000     .....@4q........
    cfe0:	d9016108 d9047112 108172e2 d8016008     .a...q...r...`..
    cff0:	b81d71da c1007864 a801c11c 04489806     .q..dx........H.
    d000:	6011b801 76042a00 9806ba00 c500104a     ...`.*.v....J...
    d010:	a0001f84 2d211554 06bc9806 1f88c500     ....T.!-........
    d020:	f800a000 1181bc00 7228d908 7232d980     ..........(r..2r
    d030:	ba10b901 11f29806 71064000 7022bc01     .........@.q.."p
    d040:	9806b900 b90011d2 1ea4c200 1218a000     ................
    d050:	9806700a 98060fb6 b8201238 f800a804     .p......8. .....
    d060:	104a9806 31021181 b9007112 4014c200     ..J....1.q.....@
    d070:	12184400 b9024a24 98061218 c5000fb6     .D..$J..........
    d080:	a0001f8c 98061554 98021842 110407c4     ....T...B.......
    d090:	71142101 7a73ba1c 12042004 20041128     .!.q..sz. ..(.. 
    d0a0:	21011104 a00072f4 048c9806 1091f801     ...!.r..........
    d0b0:	7128d810 c11cc500 1154a801 0cba9806     ..(q......T.....
    d0c0:	1ebcc500 1554a000 75ea2951 7875b807     ......T.Q).u..ux
    d0d0:	7844b81d a804b801 10b1f800 d8106018     ..Dx.........`..
    d0e0:	c000712e 44004050 4008c300 1431a800     .q..P@.D...@..1.
    d0f0:	11444c98 61081134 71fad901 10281244     .LD.4..a...qD.(.
    d100:	10286208 10286208 10286208 980270e8     .b(..b(..b(..p..
    d110:	9806027a c000122c a0001ecc baff1304     z...,...........
    d120:	72044110 51314a20 51213a11 10385311     .A.r J1Q.:!Q.S8.
    d130:	98067036 3811025c 621e7204 c100bb02     6p..\..8.r.b....
    d140:	a0001ecc 39201114 1291720c 7206da10     ...... 9.r.....r
    d150:	a0007b41 122c9806 1e9cc200 1224a000     A{....,.......$.
    d160:	7204da20 ba1c7b61 a0007a52 7a72ba1c      ..ra{..Rz....rz
    d170:	da041281 a00072fc 786bb81c 4068c000     .....r....kx..h@
    d180:	782fa800 6310a000 7963b91e ec02b900     ../x...c..cy....
    d190:	4511cd00 cc00ec02 7106db01 16189802     ...E.......q....
    d1a0:	1141b803 21fa3107 2106761c da101291     ..A..1.!.v.!....
    d1b0:	dd027108 701e7210 9806b820 38300c66     .q...r.p ...f.08
    d1c0:	b8087214 04189806 402cc000 7829a800     .r........,@..)x
    d1d0:	f8007820 d8206005 98027106 ec0213b8      x...` ..q......
    d1e0:	b805ca00 7118da23 71dadb04 71d6da20     ....#..q...q ..q
    d1f0:	72d2da10 7861b81e da01b800 ec027206     ...r..ax.....r..
    d200:	1191c800 7126d910 1eb0c100 1114a000     ......&q........
    d210:	30ff5011 6107720c 501110a1 710a3002     .P.0.r.a...P.0.q
    d220:	720adb80 709eb80a 797cb91d 11916018     ...r...p..|y.`..
    d230:	11214011 401131c0 b81e1901 d9081141     .@!..1.@....A...
    d240:	78667104 7204d920 10a17865 7206d802     .qfx ..rex.....r
    d250:	711edac0 3127b81e 7208dd23 7210db10     ...q..'1#..r...r
    d260:	dd257860 dd21710a db087208 78627104     `x%..q!..r...qbx
    d270:	1141b803 72083107 352015a1 dd0271aa     ..A..1.r.. 5.q..
    d280:	11a17220 71a0d920 7216d902 7298dacc      r.. ..q...r...r
    d290:	d9401141 b8067292 725a4d05 16189802     A.@..r...MZr....
    d2a0:	49401121 714cd9c0 154131a0 65023540     !.@I..Lq.1A.@5.e
    d2b0:	61044151 da086308 da04721e 49107236     QA.a.c...r..6r.I
    d2c0:	350215a1 db107106 3401720e db08710a     ...5.q...r.4.q..
    d2d0:	b81e7122 32cc7867 301a1011 7208dc0a     "q..gx.2...0...r
    d2e0:	7104decc c00031fd 0d0c0f0d d8016021     ...q.1......!`..
    d2f0:	b807725c 12849802 1141ba00 710cd908     \r........A....q
    d300:	ca00ec02 da30b805 340772ec 610331f0     ......0..r.4.1.a
    d310:	7104da01 c0004901 e3a300f3 d8016021     ...q.I......!`..
    d320:	c00071d2 68401498 30406021 da404401     .q....@h!`@0.D@.
    d330:	4c207104 62023204 10114a20 601f3006     .q L.2.b J...0.`
    d340:	31184201 4211611d 12a29802 c0004a20     .B.1.a.B.... J..
    d350:	50081705 30116021 88204201 7152da0d     ...P!`.0.B ...Rq
    d360:	1bdec100 bc800125 7210da04 720ada08     ....%......r...r
    d370:	8420c100 24e00010 bbff24a0 43416308     .. ....$.$...cAC
    d380:	da016402 491e7106 c0004b02 a0001f14     .d...q.I.K......
    d390:	10386308 da0220bc b9017112 13a15911     .c8.. ...q...Y..
    d3a0:	7108db80 fc00c100 101801ff 15a49802     ...q............
    d3b0:	7c43bc1e 1e9cc400 1044a000 7170d880     ..C|......D...pq
    d3c0:	9806baef 920002de dadd6204 11a1728e     .........b...r..
    d3d0:	715cd905 4040c200 12244400 14282410     ..\q..@@.D$..$(.
    d3e0:	7206d901 7132d902 711ed940 ca00ec02     ...r..2q@..q....
    d3f0:	32181021 22fa7104 7204d820 22fe2208     !..2.q." ..r."."
    d400:	ec027508 70f8c800 710ed901 c800ec02     .u.....p...q....
    d410:	7206d902 7218dc04 1e9cc000 1004a000     ...r...r........
    d420:	d801601d b81e7106 b8077864 98027873     .`...q..dx..sx..
    d430:	10641618 1f94c600 b8c3a000 02469806     ..d...........F.
    d440:	1f34c400 ba14a000 b8001428 c0001a01     ..4.....(.......
    d450:	4003c484 10917801 19013010 9806ba05     ...@.x...0......
    d460:	d90211fc b8017106 c000a804 a0001e9c     .....q..........
    d470:	db801304 98027106 ba1d1246 db017a7c     .....q..F...|z..
    d480:	c200715e a0001f18 14111124 ec0234ff     ^q......$....4..
    d490:	24ffc800 610876fa 0c769806 38116104     ...$.v.a..v..a.8
    d4a0:	6104300f 11011411 98061041 d8010c76     .0.a....A...v...
    d4b0:	b8037208 12849802 db024a04 10247116     .r.......J...q$.
    d4c0:	28112811 0c8a9806 4020c200 20ffa800     .(.(...... @... 
    d4d0:	10411208 98066008 d8010c76 bc20717c     ..A..`..v...|q .
    d4e0:	71763310 c100bb00 a0001f14 21c01514     .3vq...........!
    d4f0:	12512c11 320f6218 8840710e 98061451     .,Q..b.2.q@.Q...
    d500:	43411634 12519400 621c6508 710e320f     4.AC..Q..e.b.2.q
    d510:	14511141 16349806 4341641c 3b516508     A.Q...4..dAC.eQ;
    d520:	1ed0c100 1114a000 10311211 7112300f     ..........1..0.q
    d530:	6105ba00 7104d801 60014211 72f4d80f     ...a...q.B.`...r
    d540:	60031031 7204301e 3a00b801 b8047208     1..`.0.r...:.r..
    d550:	12849802 14709802 4220c000 1104a801     ......p... B....
    d560:	d9306108 ba1d7206 98067a63 98060f5e     .a0..r..cz..^...
    d570:	f80002dc 88508830 710834ff 24ffec02     ....0.P..4.q...$
    d580:	ec0270f8 1014cd00 5051bb01 7104d8ff     .p........QP...q
    d590:	60084431 db10631f 210471f2 72e422ff     1D.`.c...q.!.".r
    d5a0:	95004c0f a0009300 1ea0c100 1114a000     .L..............
    d5b0:	8830a000 187a9806 61081181 7206d902     ..0...z....a...r
    d5c0:	17589802 7b55bb1c d9206108 98027106     ..X...U{.a ..q..
    d5d0:	88001748 10116108 16689806 15142108     H....a....h..!..
    d5e0:	7b5c25fc c1007b5d a8014008 31071114     .%\{]{...@.....1
    d5f0:	763021fe 722ad808 23fc1351 db041334     .!0v..*rQ..#4...
    d600:	63187120 5b3133ff c010c100 1114a800      q.c.31[........
    d610:	49806108 31ff710c 75602930 7b7bbb1c     .a.I.q.10)`u..{{
    d620:	7b7b701c dd007b7c 7b7d7104 1538bb01     .p{{|{...q}{..8.
    d630:	63181381 71063340 7b71bb07 135425ec     ...c@3.q..q{.%T.
    d640:	7154df00 df052504 15547154 88201121     ..Tq.%..TqT.!. .
    d650:	0cba9806 29519200 c100753e a8014008     ......Q)>u...@..
    d660:	db021114 3107710c 29315b31 700c762a     .....q.11[1)*v.p
    d670:	7208df04 d9806101 9806721e c0001668     ...r.a...r..h...
    d680:	a800c010 18be9806 16689806 d9ff1114     ..........h.....
    d690:	98027260 9000179e a0009300 11811554     `r..........T...
    d6a0:	d9106118 250872a6 71a0d808 d8102508     .a...r.%...q.%..
    d6b0:	8820719a 98061121 25fc0cba 2a111254     .q .!......%T..*
    d6c0:	115425f8 d820250c 25f07108 25101154     .%T..% ..q.%T..%
    d6d0:	76042920 15185921 98029200 b907170a      ).v!Y..........
    d6e0:	10817971 710ad810 7844b81c 7841b802     qy.....q..Dx..Ax
    d6f0:	7974b91c 7967b904 1081f800 7108d8a0     ..ty..gy.......q
    d700:	7949b91c 6008a000 71fad802 16689806     ..Iy...`...q..h.
    d710:	98068810 6210122c 7108da10 15142108     ....,..b...q.!..
    d720:	115425f0 2000c200 2920fffe 98067512     .%T.... .. ).u..
    d730:	d90118ca 9806720a 980607aa 9400066c     .....r......l...
    d740:	1041bb1c 9806200c 1141114e 10142108     ..A.. ..N.A..!..
    d750:	114e9806 11442831 61081211 32ff31ff     ..N.1(D....a.1.2
    d760:	52102201 61187210 24041418 24041344     .".R.r.a...$D..$
    d770:	700c1438 41216118 24081418 98021408     8..p.a!A...$....
    d780:	44401226 c1007114 a0001ea4 13511514     &.@D.q........Q.
    d790:	db0f631c 6519720c 04969806 a0001541     .c...r.e....A...
    d7a0:	066c9806 122c9806 1451bb08 18029806     ..l...,...Q.....
    d7b0:	25fc1544 98021554 b91c04c2 1e9cc300     D..%T...........
    d7c0:	1334a000 db086308 1381711a 7106dba0     ..4..c...q.....q
    d7d0:	70107949 63087969 7208db02 7967b904     Iy.piy.c...r..gy
    d7e0:	a000f800 61081181 7110d902 7975b91c     .......a...q..uy
    d7f0:	16689806 31ff1114 b9ffa000 1004a000     ..h....1........
    d800:	11142108 110821f4 1181a000 31106110     .!...!.......a.1
    d810:	9806710e 21081668 21f81114 a0001114     .q..h..!...!....

0000d820 <RAILINT_9d07dc039c08503d9a4b04a0473a0ca1>:
    d820:	00000638                                8...

0000d824 <RAILINT_a5b12e51b7d2e4dad4875f46975d766b>:
    d824:	0000d920 00000000 0000d838 00000001      .......8.......
    d834:	00000000                                ....

0000d838 <RAILINT_a8ac4f5ecc0fd75e96cfb9e308101400>:
    d838:	0000d854 8f596340 004c4b40 000b000b     T...@cY.@KL.....
    d848:	7fff001a 20000208 00000000              ....... ....

0000d854 <RAILINT_804a208e3054dfe9908e7df194a25da6>:
    d854:	03011ffc 0000dc40 00034040 00000000     ....@...@@......
    d864:	00000000 000007a0 1001c01c 0007f800     ................
    d874:	3001c01c 000802f5 0001c050 0c304187     ...0....P....A0.
    d884:	01064024 0052c007 00000000 00000000     $@....R.........
    d894:	03000000 00000000 00000000 01014058     ............X@..
    d8a4:	00ff0264 01054080 08a0014b 744ac39b     d....@..K.....Jt
    d8b4:	000003f0 00000000 00000000 010540ec     .............@..
    d8c4:	8bd9a87d 00000000 07830464 3ac81388     }.......d......:
    d8d4:	000a209c 01024124 00000000 00001003     . ..$A..........
    d8e4:	010b413c 00000000 00000000 00000000     <A..............
	...
    d900:	00000001 00000000 00000000 00000000     ................
    d910:	00000000 0101423c 00000000 ffffffff     ....<B..........

0000d920 <RAILINT_6ee16ef72e3e4db6da213240f30a79f2>:
    d920:	0002400c 00148001 0000407f 00024020     .@.......@.. @..
	...
    d938:	00044030 00000000 00000000 00000000     0@..............
    d948:	00000000 00014050 00000000 0002405c     ....P@......\@..
	...
    d960:	000140a8 00000007 000440b4 00004000     .@.......@...@..
    d970:	00004cff 00004100 00004dff 0001c008     .L...A...M......
    d980:	00000000 0005c020 00004300 03b380ec     .... ....C......
    d990:	02a87543 00000000 0000022e 0003c054     Cu..........T...
    d9a0:	e6092d0e 08070654 0002b6d1 0008c064     .-..T.......d...
    d9b0:	00003004 06102040 1848f2c8 00f6e81f     .0..@ ....H.....
    d9c0:	15724bbd 0518a311 76543210 00000a98     .Kr......2Tv....
    d9d0:	0001c088 00000000 01010008 00000704     ................
    d9e0:	01010018 00000000 01010020 00008408     ........ .......
    d9f0:	0102401c 00000010 0413f920 0105405c     .@...... ...\@..
    da00:	00000841 00000001 000807b0 000000a7     A...............
    da10:	00000000 01074094 30100101 7f7f7050     .....@.....0Pp..
	...
    da34:	010240e0 00000033 00000000 01024100     .@..3........A..
    da44:	00206100 123556b7 0103410c 001254f9     .a ..V5..A...T..
    da54:	29043020 0040bb88 01034130 0c660664      0.)..@.0A..d.f.
    da64:	0000010c 00fa53e8 01034168 07830464     .....S..hA..d...
    da74:	00821388 00000000 01034230 00000000     ........0B......
    da84:	0e000000 00000000 01014244 00000000     ........DB......
    da94:	01018010 00000003 01028038 00104911     ........8....I..
    daa4:	00000001 01018088 00000000 0103809c     ................
    dab4:	000240eb 00037870 0000c0d5 110180a8     .@..px..........
    dac4:	000001f0 310180a8 01cb4205 110180ac     .......1.B......
    dad4:	000001f0 310180ac 008d2205 010280b0     .......1."......
    dae4:	02000300 01000037 02020088 04000c00     ....7...........
    daf4:	0000004c 02010094 00000400 020200d0     L...............
    db04:	0000000e 08960290 020100e4 0442093d     ............=.B.
    db14:	020100f4 00000000 02010118 02510060     ............`.Q.
    db24:	ffffffff                                ....

0000db28 <RAILINT_85fc3dfd37d182d84c7a027087c71e73>:
    db28:	0000d920 00000000 0000db3c 00000001      .......<.......
    db38:	00000000                                ....

0000db3c <RAILINT_5b1b38b546c068c8c5887053bf18986e>:
    db3c:	0000db58 8f596340 004c4b40 000b000b     X...@cY.@KL.....
    db4c:	7fff001a 20000208 00000000              ....... ....

0000db58 <RAILINT_3fd0af819a0885f761a4f33c9c04ba27>:
    db58:	03011ffc 0000dc78 00034040 00000000     ....x...@@......
    db68:	00000000 000007a0 1001c01c 0007f800     ................
    db78:	3001c01c 00080214 0001c050 04304187     ...0....P....A0.
    db88:	01064024 00620007 00007038 00000000     $@....b.8p......
    db98:	03000000 0f016800 4024b840 01014058     .....h..@.$@X@..
    dba8:	006900fc 01054080 11e06323 744ac39b     ..i..@..#c....Jt
    dbb8:	000003f0 00008003 00000abe 010540ec     .............@..
    dbc8:	8bd9a87d 00000b59 07830464 3ac81388     }...Y...d......:
    dbd8:	000a2090 01024124 00000000 00001e00     . ..$A..........
    dbe8:	010b413c 008c1400 28211a14 423b342e     <A........!(.4;B
    dbf8:	55435049 0cba9876 00006928 00000001     IPCUv...(i......
    dc08:	64282107 001a1714 69c80420 093a20a1     .!(d.... ..i. :.
    dc18:	0101423c 00000029 ffffffff              <B..).......

0000dc24 <RAILINT_adc4b242e67ed46975dd24dd00c14b5e>:
    dc24:	06013f19 00011004 06010100 00271000     .?............'.
    dc34:	00000900 00000000 00000000              ............

0000dc40 <RAILINT_a23820df1160f3a2050160d4072534e9>:
    dc40:	00000008 00666666 00000000 0000dc24     ....fff.....$...
    dc50:	0000bee4 00000c00 009a1a00 02625a00     .............Zb.
    dc60:	001e8480 00002004 02504911 00000000     ..... ...IP.....
	...

0000dc78 <RAILINT_cf8a5313f70e326938ea5b6c0694851f>:
    dc78:	00000008 00666666 00000000 0000dc24     ....fff.....$...
    dc88:	0000bef0 00000000 009a1a00 02625a00     .............Zb.
    dc98:	001e8480 00002004 02504911 00000000     ..... ...IP.....
	...

0000dcb0 <_ctype_>:
    dcb0:	20202000 20202020 28282020 20282828     .         ((((( 
    dcc0:	20202020 20202020 20202020 20202020                     
    dcd0:	10108820 10101010 10101010 10101010      ...............
    dce0:	04040410 04040404 10040404 10101010     ................
    dcf0:	41411010 41414141 01010101 01010101     ..AAAAAA........
    dd00:	01010101 01010101 01010101 10101010     ................
    dd10:	42421010 42424242 02020202 02020202     ..BBBBBB........
    dd20:	02020202 02020202 02020202 10101010     ................
    dd30:	00000020 00000000 00000000 00000000      ...............
	...
