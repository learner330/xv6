
kernel：     文件格式 elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc 70 b6 10 80       	mov    $0x8010b670,%esp
8010002d:	b8 60 2e 10 80       	mov    $0x80102e60,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <brelse>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	56                   	push   %esi
80100044:	53                   	push   %ebx
80100045:	83 ec 10             	sub    $0x10,%esp
80100048:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010004b:	8d 73 0c             	lea    0xc(%ebx),%esi
8010004e:	89 34 24             	mov    %esi,(%esp)
80100051:	e8 aa 3f 00 00       	call   80104000 <holdingsleep>
80100056:	85 c0                	test   %eax,%eax
80100058:	74 62                	je     801000bc <brelse+0x7c>
8010005a:	89 34 24             	mov    %esi,(%esp)
8010005d:	e8 fe 3f 00 00       	call   80104060 <releasesleep>
80100062:	c7 04 24 80 b6 10 80 	movl   $0x8010b680,(%esp)
80100069:	e8 a2 42 00 00       	call   80104310 <acquire>
8010006e:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100071:	83 e8 01             	sub    $0x1,%eax
80100074:	85 c0                	test   %eax,%eax
80100076:	89 43 4c             	mov    %eax,0x4c(%ebx)
80100079:	75 2f                	jne    801000aa <brelse+0x6a>
8010007b:	8b 43 54             	mov    0x54(%ebx),%eax
8010007e:	8b 53 50             	mov    0x50(%ebx),%edx
80100081:	89 50 50             	mov    %edx,0x50(%eax)
80100084:	8b 43 50             	mov    0x50(%ebx),%eax
80100087:	8b 53 54             	mov    0x54(%ebx),%edx
8010008a:	89 50 54             	mov    %edx,0x54(%eax)
8010008d:	a1 d0 fd 10 80       	mov    0x8010fdd0,%eax
80100092:	c7 43 50 7c fd 10 80 	movl   $0x8010fd7c,0x50(%ebx)
80100099:	89 43 54             	mov    %eax,0x54(%ebx)
8010009c:	a1 d0 fd 10 80       	mov    0x8010fdd0,%eax
801000a1:	89 58 50             	mov    %ebx,0x50(%eax)
801000a4:	89 1d d0 fd 10 80    	mov    %ebx,0x8010fdd0
801000aa:	c7 45 08 80 b6 10 80 	movl   $0x8010b680,0x8(%ebp)
801000b1:	83 c4 10             	add    $0x10,%esp
801000b4:	5b                   	pop    %ebx
801000b5:	5e                   	pop    %esi
801000b6:	5d                   	pop    %ebp
801000b7:	e9 04 42 00 00       	jmp    801042c0 <release>
801000bc:	c7 04 24 e0 6d 10 80 	movl   $0x80106de0,(%esp)
801000c3:	e8 e8 02 00 00       	call   801003b0 <panic>
801000c8:	90                   	nop
801000c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801000d0 <bwrite>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	53                   	push   %ebx
801000d4:	83 ec 14             	sub    $0x14,%esp
801000d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801000da:	8d 43 0c             	lea    0xc(%ebx),%eax
801000dd:	89 04 24             	mov    %eax,(%esp)
801000e0:	e8 1b 3f 00 00       	call   80104000 <holdingsleep>
801000e5:	85 c0                	test   %eax,%eax
801000e7:	74 10                	je     801000f9 <bwrite+0x29>
801000e9:	83 0b 04             	orl    $0x4,(%ebx)
801000ec:	89 5d 08             	mov    %ebx,0x8(%ebp)
801000ef:	83 c4 14             	add    $0x14,%esp
801000f2:	5b                   	pop    %ebx
801000f3:	5d                   	pop    %ebp
801000f4:	e9 57 1f 00 00       	jmp    80102050 <iderw>
801000f9:	c7 04 24 e7 6d 10 80 	movl   $0x80106de7,(%esp)
80100100:	e8 ab 02 00 00       	call   801003b0 <panic>
80100105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100110 <bread>:
80100110:	55                   	push   %ebp
80100111:	89 e5                	mov    %esp,%ebp
80100113:	57                   	push   %edi
80100114:	56                   	push   %esi
80100115:	53                   	push   %ebx
80100116:	83 ec 1c             	sub    $0x1c,%esp
80100119:	8b 75 08             	mov    0x8(%ebp),%esi
8010011c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010011f:	c7 04 24 80 b6 10 80 	movl   $0x8010b680,(%esp)
80100126:	e8 e5 41 00 00       	call   80104310 <acquire>
8010012b:	8b 1d d0 fd 10 80    	mov    0x8010fdd0,%ebx
80100131:	81 fb 7c fd 10 80    	cmp    $0x8010fd7c,%ebx
80100137:	75 12                	jne    8010014b <bread+0x3b>
80100139:	eb 2d                	jmp    80100168 <bread+0x58>
8010013b:	90                   	nop
8010013c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100140:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100143:	81 fb 7c fd 10 80    	cmp    $0x8010fd7c,%ebx
80100149:	74 1d                	je     80100168 <bread+0x58>
8010014b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010014e:	66 90                	xchg   %ax,%ax
80100150:	75 ee                	jne    80100140 <bread+0x30>
80100152:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100155:	75 e9                	jne    80100140 <bread+0x30>
80100157:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
8010015b:	90                   	nop
8010015c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100160:	eb 40                	jmp    801001a2 <bread+0x92>
80100162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100168:	8b 1d cc fd 10 80    	mov    0x8010fdcc,%ebx
8010016e:	81 fb 7c fd 10 80    	cmp    $0x8010fd7c,%ebx
80100174:	75 0d                	jne    80100183 <bread+0x73>
80100176:	eb 58                	jmp    801001d0 <bread+0xc0>
80100178:	8b 5b 50             	mov    0x50(%ebx),%ebx
8010017b:	81 fb 7c fd 10 80    	cmp    $0x8010fd7c,%ebx
80100181:	74 4d                	je     801001d0 <bread+0xc0>
80100183:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100186:	85 c0                	test   %eax,%eax
80100188:	75 ee                	jne    80100178 <bread+0x68>
8010018a:	f6 03 04             	testb  $0x4,(%ebx)
8010018d:	75 e9                	jne    80100178 <bread+0x68>
8010018f:	89 73 04             	mov    %esi,0x4(%ebx)
80100192:	89 7b 08             	mov    %edi,0x8(%ebx)
80100195:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010019b:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
801001a2:	c7 04 24 80 b6 10 80 	movl   $0x8010b680,(%esp)
801001a9:	e8 12 41 00 00       	call   801042c0 <release>
801001ae:	8d 43 0c             	lea    0xc(%ebx),%eax
801001b1:	89 04 24             	mov    %eax,(%esp)
801001b4:	e8 e7 3e 00 00       	call   801040a0 <acquiresleep>
801001b9:	f6 03 02             	testb  $0x2,(%ebx)
801001bc:	75 08                	jne    801001c6 <bread+0xb6>
801001be:	89 1c 24             	mov    %ebx,(%esp)
801001c1:	e8 8a 1e 00 00       	call   80102050 <iderw>
801001c6:	83 c4 1c             	add    $0x1c,%esp
801001c9:	89 d8                	mov    %ebx,%eax
801001cb:	5b                   	pop    %ebx
801001cc:	5e                   	pop    %esi
801001cd:	5f                   	pop    %edi
801001ce:	5d                   	pop    %ebp
801001cf:	c3                   	ret    
801001d0:	c7 04 24 ee 6d 10 80 	movl   $0x80106dee,(%esp)
801001d7:	e8 d4 01 00 00       	call   801003b0 <panic>
801001dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801001e0 <binit>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	53                   	push   %ebx
801001e4:	bb b4 b6 10 80       	mov    $0x8010b6b4,%ebx
801001e9:	83 ec 14             	sub    $0x14,%esp
801001ec:	c7 44 24 04 ff 6d 10 	movl   $0x80106dff,0x4(%esp)
801001f3:	80 
801001f4:	c7 04 24 80 b6 10 80 	movl   $0x8010b680,(%esp)
801001fb:	e8 40 3f 00 00       	call   80104140 <initlock>
80100200:	b8 7c fd 10 80       	mov    $0x8010fd7c,%eax
80100205:	c7 05 cc fd 10 80 7c 	movl   $0x8010fd7c,0x8010fdcc
8010020c:	fd 10 80 
8010020f:	c7 05 d0 fd 10 80 7c 	movl   $0x8010fd7c,0x8010fdd0
80100216:	fd 10 80 
80100219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100220:	89 43 54             	mov    %eax,0x54(%ebx)
80100223:	8d 43 0c             	lea    0xc(%ebx),%eax
80100226:	c7 43 50 7c fd 10 80 	movl   $0x8010fd7c,0x50(%ebx)
8010022d:	89 04 24             	mov    %eax,(%esp)
80100230:	c7 44 24 04 06 6e 10 	movl   $0x80106e06,0x4(%esp)
80100237:	80 
80100238:	e8 c3 3e 00 00       	call   80104100 <initsleeplock>
8010023d:	a1 d0 fd 10 80       	mov    0x8010fdd0,%eax
80100242:	89 58 50             	mov    %ebx,0x50(%eax)
80100245:	89 d8                	mov    %ebx,%eax
80100247:	89 1d d0 fd 10 80    	mov    %ebx,0x8010fdd0
8010024d:	81 c3 5c 02 00 00    	add    $0x25c,%ebx
80100253:	81 fb 7c fd 10 80    	cmp    $0x8010fd7c,%ebx
80100259:	75 c5                	jne    80100220 <binit+0x40>
8010025b:	83 c4 14             	add    $0x14,%esp
8010025e:	5b                   	pop    %ebx
8010025f:	5d                   	pop    %ebp
80100260:	c3                   	ret    
80100261:	66 90                	xchg   %ax,%ax
80100263:	66 90                	xchg   %ax,%ax
80100265:	66 90                	xchg   %ax,%ax
80100267:	66 90                	xchg   %ax,%ax
80100269:	66 90                	xchg   %ax,%ax
8010026b:	66 90                	xchg   %ax,%ax
8010026d:	66 90                	xchg   %ax,%ax
8010026f:	90                   	nop

80100270 <consoleinit>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	83 ec 18             	sub    $0x18,%esp
80100276:	c7 44 24 04 0d 6e 10 	movl   $0x80106e0d,0x4(%esp)
8010027d:	80 
8010027e:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
80100285:	e8 b6 3e 00 00       	call   80104140 <initlock>
8010028a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100291:	00 
80100292:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80100299:	c7 05 2c 0a 11 80 b0 	movl   $0x801005b0,0x80110a2c
801002a0:	05 10 80 
801002a3:	c7 05 28 0a 11 80 c0 	movl   $0x801002c0,0x80110a28
801002aa:	02 10 80 
801002ad:	c7 05 14 a6 10 80 01 	movl   $0x1,0x8010a614
801002b4:	00 00 00 
801002b7:	e8 84 1f 00 00       	call   80102240 <ioapicenable>
801002bc:	c9                   	leave  
801002bd:	c3                   	ret    
801002be:	66 90                	xchg   %ax,%ax

801002c0 <consoleread>:
801002c0:	55                   	push   %ebp
801002c1:	89 e5                	mov    %esp,%ebp
801002c3:	57                   	push   %edi
801002c4:	56                   	push   %esi
801002c5:	53                   	push   %ebx
801002c6:	83 ec 2c             	sub    $0x2c,%esp
801002c9:	8b 5d 10             	mov    0x10(%ebp),%ebx
801002cc:	8b 75 08             	mov    0x8(%ebp),%esi
801002cf:	89 34 24             	mov    %esi,(%esp)
801002d2:	e8 e9 19 00 00       	call   80101cc0 <iunlock>
801002d7:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801002da:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
801002e1:	e8 2a 40 00 00       	call   80104310 <acquire>
801002e6:	85 db                	test   %ebx,%ebx
801002e8:	7f 26                	jg     80100310 <consoleread+0x50>
801002ea:	e9 bb 00 00 00       	jmp    801003aa <consoleread+0xea>
801002ef:	90                   	nop
801002f0:	e8 5b 37 00 00       	call   80103a50 <myproc>
801002f5:	8b 40 24             	mov    0x24(%eax),%eax
801002f8:	85 c0                	test   %eax,%eax
801002fa:	75 5c                	jne    80100358 <consoleread+0x98>
801002fc:	c7 44 24 04 e0 a5 10 	movl   $0x8010a5e0,0x4(%esp)
80100303:	80 
80100304:	c7 04 24 60 00 11 80 	movl   $0x80110060,(%esp)
8010030b:	e8 a0 39 00 00       	call   80103cb0 <sleep>
80100310:	a1 60 00 11 80       	mov    0x80110060,%eax
80100315:	3b 05 64 00 11 80    	cmp    0x80110064,%eax
8010031b:	74 d3                	je     801002f0 <consoleread+0x30>
8010031d:	89 c2                	mov    %eax,%edx
8010031f:	83 e2 7f             	and    $0x7f,%edx
80100322:	0f b6 8a e0 ff 10 80 	movzbl -0x7fef0020(%edx),%ecx
80100329:	8d 78 01             	lea    0x1(%eax),%edi
8010032c:	89 3d 60 00 11 80    	mov    %edi,0x80110060
80100332:	0f be d1             	movsbl %cl,%edx
80100335:	83 fa 04             	cmp    $0x4,%edx
80100338:	74 3f                	je     80100379 <consoleread+0xb9>
8010033a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010033d:	83 eb 01             	sub    $0x1,%ebx
80100340:	83 fa 0a             	cmp    $0xa,%edx
80100343:	88 08                	mov    %cl,(%eax)
80100345:	74 3c                	je     80100383 <consoleread+0xc3>
80100347:	85 db                	test   %ebx,%ebx
80100349:	7e 38                	jle    80100383 <consoleread+0xc3>
8010034b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
8010034f:	eb bf                	jmp    80100310 <consoleread+0x50>
80100351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100358:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
8010035f:	e8 5c 3f 00 00       	call   801042c0 <release>
80100364:	89 34 24             	mov    %esi,(%esp)
80100367:	e8 24 16 00 00       	call   80101990 <ilock>
8010036c:	83 c4 2c             	add    $0x2c,%esp
8010036f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100374:	5b                   	pop    %ebx
80100375:	5e                   	pop    %esi
80100376:	5f                   	pop    %edi
80100377:	5d                   	pop    %ebp
80100378:	c3                   	ret    
80100379:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
8010037c:	76 05                	jbe    80100383 <consoleread+0xc3>
8010037e:	a3 60 00 11 80       	mov    %eax,0x80110060
80100383:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100386:	29 d8                	sub    %ebx,%eax
80100388:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
8010038f:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100392:	e8 29 3f 00 00       	call   801042c0 <release>
80100397:	89 34 24             	mov    %esi,(%esp)
8010039a:	e8 f1 15 00 00       	call   80101990 <ilock>
8010039f:	8b 45 e0             	mov    -0x20(%ebp),%eax
801003a2:	83 c4 2c             	add    $0x2c,%esp
801003a5:	5b                   	pop    %ebx
801003a6:	5e                   	pop    %esi
801003a7:	5f                   	pop    %edi
801003a8:	5d                   	pop    %ebp
801003a9:	c3                   	ret    
801003aa:	31 c0                	xor    %eax,%eax
801003ac:	eb da                	jmp    80100388 <consoleread+0xc8>
801003ae:	66 90                	xchg   %ax,%ax

801003b0 <panic>:
801003b0:	55                   	push   %ebp
801003b1:	89 e5                	mov    %esp,%ebp
801003b3:	56                   	push   %esi
801003b4:	53                   	push   %ebx
801003b5:	83 ec 40             	sub    $0x40,%esp
801003b8:	c7 05 14 a6 10 80 00 	movl   $0x0,0x8010a614
801003bf:	00 00 00 
801003c2:	fa                   	cli    
801003c3:	e8 58 23 00 00       	call   80102720 <lapicid>
801003c8:	8d 75 d0             	lea    -0x30(%ebp),%esi
801003cb:	31 db                	xor    %ebx,%ebx
801003cd:	c7 04 24 15 6e 10 80 	movl   $0x80106e15,(%esp)
801003d4:	89 44 24 04          	mov    %eax,0x4(%esp)
801003d8:	e8 73 04 00 00       	call   80100850 <cprintf>
801003dd:	8b 45 08             	mov    0x8(%ebp),%eax
801003e0:	89 04 24             	mov    %eax,(%esp)
801003e3:	e8 68 04 00 00       	call   80100850 <cprintf>
801003e8:	c7 04 24 51 77 10 80 	movl   $0x80107751,(%esp)
801003ef:	e8 5c 04 00 00       	call   80100850 <cprintf>
801003f4:	8d 45 08             	lea    0x8(%ebp),%eax
801003f7:	89 74 24 04          	mov    %esi,0x4(%esp)
801003fb:	89 04 24             	mov    %eax,(%esp)
801003fe:	e8 5d 3d 00 00       	call   80104160 <getcallerpcs>
80100403:	90                   	nop
80100404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100408:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
8010040b:	83 c3 01             	add    $0x1,%ebx
8010040e:	c7 04 24 29 6e 10 80 	movl   $0x80106e29,(%esp)
80100415:	89 44 24 04          	mov    %eax,0x4(%esp)
80100419:	e8 32 04 00 00       	call   80100850 <cprintf>
8010041e:	83 fb 0a             	cmp    $0xa,%ebx
80100421:	75 e5                	jne    80100408 <panic+0x58>
80100423:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
8010042a:	00 00 00 
8010042d:	eb fe                	jmp    8010042d <panic+0x7d>
8010042f:	90                   	nop

80100430 <consputc>:
80100430:	55                   	push   %ebp
80100431:	89 e5                	mov    %esp,%ebp
80100433:	57                   	push   %edi
80100434:	56                   	push   %esi
80100435:	89 c6                	mov    %eax,%esi
80100437:	53                   	push   %ebx
80100438:	83 ec 1c             	sub    $0x1c,%esp
8010043b:	83 3d c0 a5 10 80 00 	cmpl   $0x0,0x8010a5c0
80100442:	74 03                	je     80100447 <consputc+0x17>
80100444:	fa                   	cli    
80100445:	eb fe                	jmp    80100445 <consputc+0x15>
80100447:	3d 00 01 00 00       	cmp    $0x100,%eax
8010044c:	0f 84 ac 00 00 00    	je     801004fe <consputc+0xce>
80100452:	89 04 24             	mov    %eax,(%esp)
80100455:	e8 c6 54 00 00       	call   80105920 <uartputc>
8010045a:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
8010045f:	b8 0e 00 00 00       	mov    $0xe,%eax
80100464:	89 ca                	mov    %ecx,%edx
80100466:	ee                   	out    %al,(%dx)
80100467:	bf d5 03 00 00       	mov    $0x3d5,%edi
8010046c:	89 fa                	mov    %edi,%edx
8010046e:	ec                   	in     (%dx),%al
8010046f:	0f b6 d8             	movzbl %al,%ebx
80100472:	89 ca                	mov    %ecx,%edx
80100474:	c1 e3 08             	shl    $0x8,%ebx
80100477:	b8 0f 00 00 00       	mov    $0xf,%eax
8010047c:	ee                   	out    %al,(%dx)
8010047d:	89 fa                	mov    %edi,%edx
8010047f:	ec                   	in     (%dx),%al
80100480:	0f b6 c0             	movzbl %al,%eax
80100483:	09 c3                	or     %eax,%ebx
80100485:	83 fe 0a             	cmp    $0xa,%esi
80100488:	0f 84 fb 00 00 00    	je     80100589 <consputc+0x159>
8010048e:	81 fe 00 01 00 00    	cmp    $0x100,%esi
80100494:	0f 84 e1 00 00 00    	je     8010057b <consputc+0x14b>
8010049a:	66 81 e6 ff 00       	and    $0xff,%si
8010049f:	66 81 ce 00 07       	or     $0x700,%si
801004a4:	66 89 b4 1b 00 80 0b 	mov    %si,-0x7ff48000(%ebx,%ebx,1)
801004ab:	80 
801004ac:	83 c3 01             	add    $0x1,%ebx
801004af:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
801004b5:	0f 87 b4 00 00 00    	ja     8010056f <consputc+0x13f>
801004bb:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004c1:	8d bc 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%edi
801004c8:	7f 5d                	jg     80100527 <consputc+0xf7>
801004ca:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
801004cf:	b8 0e 00 00 00       	mov    $0xe,%eax
801004d4:	89 ca                	mov    %ecx,%edx
801004d6:	ee                   	out    %al,(%dx)
801004d7:	be d5 03 00 00       	mov    $0x3d5,%esi
801004dc:	89 d8                	mov    %ebx,%eax
801004de:	c1 f8 08             	sar    $0x8,%eax
801004e1:	89 f2                	mov    %esi,%edx
801004e3:	ee                   	out    %al,(%dx)
801004e4:	b8 0f 00 00 00       	mov    $0xf,%eax
801004e9:	89 ca                	mov    %ecx,%edx
801004eb:	ee                   	out    %al,(%dx)
801004ec:	89 d8                	mov    %ebx,%eax
801004ee:	89 f2                	mov    %esi,%edx
801004f0:	ee                   	out    %al,(%dx)
801004f1:	66 c7 07 20 07       	movw   $0x720,(%edi)
801004f6:	83 c4 1c             	add    $0x1c,%esp
801004f9:	5b                   	pop    %ebx
801004fa:	5e                   	pop    %esi
801004fb:	5f                   	pop    %edi
801004fc:	5d                   	pop    %ebp
801004fd:	c3                   	ret    
801004fe:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100505:	e8 16 54 00 00       	call   80105920 <uartputc>
8010050a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100511:	e8 0a 54 00 00       	call   80105920 <uartputc>
80100516:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010051d:	e8 fe 53 00 00       	call   80105920 <uartputc>
80100522:	e9 33 ff ff ff       	jmp    8010045a <consputc+0x2a>
80100527:	83 eb 50             	sub    $0x50,%ebx
8010052a:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
80100531:	00 
80100532:	8d bc 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%edi
80100539:	c7 44 24 04 a0 80 0b 	movl   $0x800b80a0,0x4(%esp)
80100540:	80 
80100541:	c7 04 24 00 80 0b 80 	movl   $0x800b8000,(%esp)
80100548:	e8 f3 3e 00 00       	call   80104440 <memmove>
8010054d:	b8 80 07 00 00       	mov    $0x780,%eax
80100552:	29 d8                	sub    %ebx,%eax
80100554:	01 c0                	add    %eax,%eax
80100556:	89 44 24 08          	mov    %eax,0x8(%esp)
8010055a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100561:	00 
80100562:	89 3c 24             	mov    %edi,(%esp)
80100565:	e8 16 3e 00 00       	call   80104380 <memset>
8010056a:	e9 5b ff ff ff       	jmp    801004ca <consputc+0x9a>
8010056f:	c7 04 24 2d 6e 10 80 	movl   $0x80106e2d,(%esp)
80100576:	e8 35 fe ff ff       	call   801003b0 <panic>
8010057b:	31 c0                	xor    %eax,%eax
8010057d:	85 db                	test   %ebx,%ebx
8010057f:	0f 9f c0             	setg   %al
80100582:	29 c3                	sub    %eax,%ebx
80100584:	e9 26 ff ff ff       	jmp    801004af <consputc+0x7f>
80100589:	89 da                	mov    %ebx,%edx
8010058b:	89 d8                	mov    %ebx,%eax
8010058d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100592:	83 c3 50             	add    $0x50,%ebx
80100595:	c1 fa 1f             	sar    $0x1f,%edx
80100598:	f7 f9                	idiv   %ecx
8010059a:	29 d3                	sub    %edx,%ebx
8010059c:	e9 0e ff ff ff       	jmp    801004af <consputc+0x7f>
801005a1:	eb 0d                	jmp    801005b0 <consolewrite>
801005a3:	90                   	nop
801005a4:	90                   	nop
801005a5:	90                   	nop
801005a6:	90                   	nop
801005a7:	90                   	nop
801005a8:	90                   	nop
801005a9:	90                   	nop
801005aa:	90                   	nop
801005ab:	90                   	nop
801005ac:	90                   	nop
801005ad:	90                   	nop
801005ae:	90                   	nop
801005af:	90                   	nop

801005b0 <consolewrite>:
801005b0:	55                   	push   %ebp
801005b1:	89 e5                	mov    %esp,%ebp
801005b3:	57                   	push   %edi
801005b4:	56                   	push   %esi
801005b5:	53                   	push   %ebx
801005b6:	83 ec 1c             	sub    $0x1c,%esp
801005b9:	8b 45 08             	mov    0x8(%ebp),%eax
801005bc:	8b 75 10             	mov    0x10(%ebp),%esi
801005bf:	8b 7d 0c             	mov    0xc(%ebp),%edi
801005c2:	89 04 24             	mov    %eax,(%esp)
801005c5:	e8 f6 16 00 00       	call   80101cc0 <iunlock>
801005ca:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
801005d1:	e8 3a 3d 00 00       	call   80104310 <acquire>
801005d6:	85 f6                	test   %esi,%esi
801005d8:	7e 16                	jle    801005f0 <consolewrite+0x40>
801005da:	31 db                	xor    %ebx,%ebx
801005dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801005e0:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801005e4:	83 c3 01             	add    $0x1,%ebx
801005e7:	e8 44 fe ff ff       	call   80100430 <consputc>
801005ec:	39 de                	cmp    %ebx,%esi
801005ee:	7f f0                	jg     801005e0 <consolewrite+0x30>
801005f0:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
801005f7:	e8 c4 3c 00 00       	call   801042c0 <release>
801005fc:	8b 45 08             	mov    0x8(%ebp),%eax
801005ff:	89 04 24             	mov    %eax,(%esp)
80100602:	e8 89 13 00 00       	call   80101990 <ilock>
80100607:	83 c4 1c             	add    $0x1c,%esp
8010060a:	89 f0                	mov    %esi,%eax
8010060c:	5b                   	pop    %ebx
8010060d:	5e                   	pop    %esi
8010060e:	5f                   	pop    %edi
8010060f:	5d                   	pop    %ebp
80100610:	c3                   	ret    
80100611:	eb 0d                	jmp    80100620 <consoleintr>
80100613:	90                   	nop
80100614:	90                   	nop
80100615:	90                   	nop
80100616:	90                   	nop
80100617:	90                   	nop
80100618:	90                   	nop
80100619:	90                   	nop
8010061a:	90                   	nop
8010061b:	90                   	nop
8010061c:	90                   	nop
8010061d:	90                   	nop
8010061e:	90                   	nop
8010061f:	90                   	nop

80100620 <consoleintr>:
80100620:	55                   	push   %ebp
80100621:	89 e5                	mov    %esp,%ebp
80100623:	57                   	push   %edi
80100624:	31 ff                	xor    %edi,%edi
80100626:	56                   	push   %esi
80100627:	53                   	push   %ebx
80100628:	83 ec 1c             	sub    $0x1c,%esp
8010062b:	8b 75 08             	mov    0x8(%ebp),%esi
8010062e:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
80100635:	e8 d6 3c 00 00       	call   80104310 <acquire>
8010063a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100640:	ff d6                	call   *%esi
80100642:	85 c0                	test   %eax,%eax
80100644:	89 c3                	mov    %eax,%ebx
80100646:	0f 88 98 00 00 00    	js     801006e4 <consoleintr+0xc4>
8010064c:	83 fb 10             	cmp    $0x10,%ebx
8010064f:	90                   	nop
80100650:	0f 84 32 01 00 00    	je     80100788 <consoleintr+0x168>
80100656:	0f 8f a4 00 00 00    	jg     80100700 <consoleintr+0xe0>
8010065c:	83 fb 08             	cmp    $0x8,%ebx
8010065f:	90                   	nop
80100660:	0f 84 a8 00 00 00    	je     8010070e <consoleintr+0xee>
80100666:	85 db                	test   %ebx,%ebx
80100668:	74 d6                	je     80100640 <consoleintr+0x20>
8010066a:	a1 68 00 11 80       	mov    0x80110068,%eax
8010066f:	89 c2                	mov    %eax,%edx
80100671:	2b 15 60 00 11 80    	sub    0x80110060,%edx
80100677:	83 fa 7f             	cmp    $0x7f,%edx
8010067a:	77 c4                	ja     80100640 <consoleintr+0x20>
8010067c:	83 fb 0d             	cmp    $0xd,%ebx
8010067f:	0f 84 0d 01 00 00    	je     80100792 <consoleintr+0x172>
80100685:	89 c2                	mov    %eax,%edx
80100687:	83 c0 01             	add    $0x1,%eax
8010068a:	83 e2 7f             	and    $0x7f,%edx
8010068d:	88 9a e0 ff 10 80    	mov    %bl,-0x7fef0020(%edx)
80100693:	a3 68 00 11 80       	mov    %eax,0x80110068
80100698:	89 d8                	mov    %ebx,%eax
8010069a:	e8 91 fd ff ff       	call   80100430 <consputc>
8010069f:	83 fb 04             	cmp    $0x4,%ebx
801006a2:	0f 84 08 01 00 00    	je     801007b0 <consoleintr+0x190>
801006a8:	83 fb 0a             	cmp    $0xa,%ebx
801006ab:	0f 84 ff 00 00 00    	je     801007b0 <consoleintr+0x190>
801006b1:	8b 15 60 00 11 80    	mov    0x80110060,%edx
801006b7:	a1 68 00 11 80       	mov    0x80110068,%eax
801006bc:	83 ea 80             	sub    $0xffffff80,%edx
801006bf:	39 d0                	cmp    %edx,%eax
801006c1:	0f 85 79 ff ff ff    	jne    80100640 <consoleintr+0x20>
801006c7:	a3 64 00 11 80       	mov    %eax,0x80110064
801006cc:	c7 04 24 60 00 11 80 	movl   $0x80110060,(%esp)
801006d3:	e8 c8 2f 00 00       	call   801036a0 <wakeup>
801006d8:	ff d6                	call   *%esi
801006da:	85 c0                	test   %eax,%eax
801006dc:	89 c3                	mov    %eax,%ebx
801006de:	0f 89 68 ff ff ff    	jns    8010064c <consoleintr+0x2c>
801006e4:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
801006eb:	e8 d0 3b 00 00       	call   801042c0 <release>
801006f0:	85 ff                	test   %edi,%edi
801006f2:	0f 85 c2 00 00 00    	jne    801007ba <consoleintr+0x19a>
801006f8:	83 c4 1c             	add    $0x1c,%esp
801006fb:	5b                   	pop    %ebx
801006fc:	5e                   	pop    %esi
801006fd:	5f                   	pop    %edi
801006fe:	5d                   	pop    %ebp
801006ff:	c3                   	ret    
80100700:	83 fb 15             	cmp    $0x15,%ebx
80100703:	74 33                	je     80100738 <consoleintr+0x118>
80100705:	83 fb 7f             	cmp    $0x7f,%ebx
80100708:	0f 85 58 ff ff ff    	jne    80100666 <consoleintr+0x46>
8010070e:	a1 68 00 11 80       	mov    0x80110068,%eax
80100713:	3b 05 64 00 11 80    	cmp    0x80110064,%eax
80100719:	0f 84 21 ff ff ff    	je     80100640 <consoleintr+0x20>
8010071f:	83 e8 01             	sub    $0x1,%eax
80100722:	a3 68 00 11 80       	mov    %eax,0x80110068
80100727:	b8 00 01 00 00       	mov    $0x100,%eax
8010072c:	e8 ff fc ff ff       	call   80100430 <consputc>
80100731:	e9 0a ff ff ff       	jmp    80100640 <consoleintr+0x20>
80100736:	66 90                	xchg   %ax,%ax
80100738:	a1 68 00 11 80       	mov    0x80110068,%eax
8010073d:	3b 05 64 00 11 80    	cmp    0x80110064,%eax
80100743:	75 2b                	jne    80100770 <consoleintr+0x150>
80100745:	e9 f6 fe ff ff       	jmp    80100640 <consoleintr+0x20>
8010074a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100750:	a3 68 00 11 80       	mov    %eax,0x80110068
80100755:	b8 00 01 00 00       	mov    $0x100,%eax
8010075a:	e8 d1 fc ff ff       	call   80100430 <consputc>
8010075f:	a1 68 00 11 80       	mov    0x80110068,%eax
80100764:	3b 05 64 00 11 80    	cmp    0x80110064,%eax
8010076a:	0f 84 d0 fe ff ff    	je     80100640 <consoleintr+0x20>
80100770:	83 e8 01             	sub    $0x1,%eax
80100773:	89 c2                	mov    %eax,%edx
80100775:	83 e2 7f             	and    $0x7f,%edx
80100778:	80 ba e0 ff 10 80 0a 	cmpb   $0xa,-0x7fef0020(%edx)
8010077f:	75 cf                	jne    80100750 <consoleintr+0x130>
80100781:	e9 ba fe ff ff       	jmp    80100640 <consoleintr+0x20>
80100786:	66 90                	xchg   %ax,%ax
80100788:	bf 01 00 00 00       	mov    $0x1,%edi
8010078d:	e9 ae fe ff ff       	jmp    80100640 <consoleintr+0x20>
80100792:	89 c2                	mov    %eax,%edx
80100794:	83 c0 01             	add    $0x1,%eax
80100797:	83 e2 7f             	and    $0x7f,%edx
8010079a:	c6 82 e0 ff 10 80 0a 	movb   $0xa,-0x7fef0020(%edx)
801007a1:	a3 68 00 11 80       	mov    %eax,0x80110068
801007a6:	b8 0a 00 00 00       	mov    $0xa,%eax
801007ab:	e8 80 fc ff ff       	call   80100430 <consputc>
801007b0:	a1 68 00 11 80       	mov    0x80110068,%eax
801007b5:	e9 0d ff ff ff       	jmp    801006c7 <consoleintr+0xa7>
801007ba:	83 c4 1c             	add    $0x1c,%esp
801007bd:	5b                   	pop    %ebx
801007be:	5e                   	pop    %esi
801007bf:	5f                   	pop    %edi
801007c0:	5d                   	pop    %ebp
801007c1:	e9 7a 2d 00 00       	jmp    80103540 <procdump>
801007c6:	8d 76 00             	lea    0x0(%esi),%esi
801007c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007d0 <printint>:
801007d0:	55                   	push   %ebp
801007d1:	89 e5                	mov    %esp,%ebp
801007d3:	57                   	push   %edi
801007d4:	56                   	push   %esi
801007d5:	89 d6                	mov    %edx,%esi
801007d7:	53                   	push   %ebx
801007d8:	83 ec 1c             	sub    $0x1c,%esp
801007db:	85 c9                	test   %ecx,%ecx
801007dd:	74 04                	je     801007e3 <printint+0x13>
801007df:	85 c0                	test   %eax,%eax
801007e1:	78 55                	js     80100838 <printint+0x68>
801007e3:	31 ff                	xor    %edi,%edi
801007e5:	31 c9                	xor    %ecx,%ecx
801007e7:	8d 5d d8             	lea    -0x28(%ebp),%ebx
801007ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007f0:	31 d2                	xor    %edx,%edx
801007f2:	f7 f6                	div    %esi
801007f4:	0f b6 92 50 6e 10 80 	movzbl -0x7fef91b0(%edx),%edx
801007fb:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801007fe:	83 c1 01             	add    $0x1,%ecx
80100801:	85 c0                	test   %eax,%eax
80100803:	75 eb                	jne    801007f0 <printint+0x20>
80100805:	85 ff                	test   %edi,%edi
80100807:	74 08                	je     80100811 <printint+0x41>
80100809:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
8010080e:	83 c1 01             	add    $0x1,%ecx
80100811:	8d 71 ff             	lea    -0x1(%ecx),%esi
80100814:	01 f3                	add    %esi,%ebx
80100816:	66 90                	xchg   %ax,%ax
80100818:	0f be 03             	movsbl (%ebx),%eax
8010081b:	83 ee 01             	sub    $0x1,%esi
8010081e:	83 eb 01             	sub    $0x1,%ebx
80100821:	e8 0a fc ff ff       	call   80100430 <consputc>
80100826:	83 fe ff             	cmp    $0xffffffff,%esi
80100829:	75 ed                	jne    80100818 <printint+0x48>
8010082b:	83 c4 1c             	add    $0x1c,%esp
8010082e:	5b                   	pop    %ebx
8010082f:	5e                   	pop    %esi
80100830:	5f                   	pop    %edi
80100831:	5d                   	pop    %ebp
80100832:	c3                   	ret    
80100833:	90                   	nop
80100834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100838:	f7 d8                	neg    %eax
8010083a:	bf 01 00 00 00       	mov    $0x1,%edi
8010083f:	eb a4                	jmp    801007e5 <printint+0x15>
80100841:	eb 0d                	jmp    80100850 <cprintf>
80100843:	90                   	nop
80100844:	90                   	nop
80100845:	90                   	nop
80100846:	90                   	nop
80100847:	90                   	nop
80100848:	90                   	nop
80100849:	90                   	nop
8010084a:	90                   	nop
8010084b:	90                   	nop
8010084c:	90                   	nop
8010084d:	90                   	nop
8010084e:	90                   	nop
8010084f:	90                   	nop

80100850 <cprintf>:
80100850:	55                   	push   %ebp
80100851:	89 e5                	mov    %esp,%ebp
80100853:	57                   	push   %edi
80100854:	56                   	push   %esi
80100855:	53                   	push   %ebx
80100856:	83 ec 2c             	sub    $0x2c,%esp
80100859:	8b 3d 14 a6 10 80    	mov    0x8010a614,%edi
8010085f:	85 ff                	test   %edi,%edi
80100861:	0f 85 39 01 00 00    	jne    801009a0 <cprintf+0x150>
80100867:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010086a:	85 c9                	test   %ecx,%ecx
8010086c:	0f 84 3f 01 00 00    	je     801009b1 <cprintf+0x161>
80100872:	0f b6 01             	movzbl (%ecx),%eax
80100875:	85 c0                	test   %eax,%eax
80100877:	0f 84 93 00 00 00    	je     80100910 <cprintf+0xc0>
8010087d:	8d 75 0c             	lea    0xc(%ebp),%esi
80100880:	31 db                	xor    %ebx,%ebx
80100882:	eb 3f                	jmp    801008c3 <cprintf+0x73>
80100884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100888:	83 fa 25             	cmp    $0x25,%edx
8010088b:	0f 84 b7 00 00 00    	je     80100948 <cprintf+0xf8>
80100891:	83 fa 64             	cmp    $0x64,%edx
80100894:	0f 84 8e 00 00 00    	je     80100928 <cprintf+0xd8>
8010089a:	b8 25 00 00 00       	mov    $0x25,%eax
8010089f:	89 55 e0             	mov    %edx,-0x20(%ebp)
801008a2:	e8 89 fb ff ff       	call   80100430 <consputc>
801008a7:	8b 55 e0             	mov    -0x20(%ebp),%edx
801008aa:	89 d0                	mov    %edx,%eax
801008ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801008b0:	e8 7b fb ff ff       	call   80100430 <consputc>
801008b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
801008b8:	83 c3 01             	add    $0x1,%ebx
801008bb:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
801008bf:	85 c0                	test   %eax,%eax
801008c1:	74 4d                	je     80100910 <cprintf+0xc0>
801008c3:	83 f8 25             	cmp    $0x25,%eax
801008c6:	75 e8                	jne    801008b0 <cprintf+0x60>
801008c8:	83 c3 01             	add    $0x1,%ebx
801008cb:	0f b6 14 19          	movzbl (%ecx,%ebx,1),%edx
801008cf:	85 d2                	test   %edx,%edx
801008d1:	74 3d                	je     80100910 <cprintf+0xc0>
801008d3:	83 fa 70             	cmp    $0x70,%edx
801008d6:	74 12                	je     801008ea <cprintf+0x9a>
801008d8:	7e ae                	jle    80100888 <cprintf+0x38>
801008da:	83 fa 73             	cmp    $0x73,%edx
801008dd:	8d 76 00             	lea    0x0(%esi),%esi
801008e0:	74 7e                	je     80100960 <cprintf+0x110>
801008e2:	83 fa 78             	cmp    $0x78,%edx
801008e5:	8d 76 00             	lea    0x0(%esi),%esi
801008e8:	75 b0                	jne    8010089a <cprintf+0x4a>
801008ea:	8b 06                	mov    (%esi),%eax
801008ec:	31 c9                	xor    %ecx,%ecx
801008ee:	ba 10 00 00 00       	mov    $0x10,%edx
801008f3:	83 c3 01             	add    $0x1,%ebx
801008f6:	83 c6 04             	add    $0x4,%esi
801008f9:	e8 d2 fe ff ff       	call   801007d0 <printint>
801008fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100901:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
80100905:	85 c0                	test   %eax,%eax
80100907:	75 ba                	jne    801008c3 <cprintf+0x73>
80100909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100910:	85 ff                	test   %edi,%edi
80100912:	74 0c                	je     80100920 <cprintf+0xd0>
80100914:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
8010091b:	e8 a0 39 00 00       	call   801042c0 <release>
80100920:	83 c4 2c             	add    $0x2c,%esp
80100923:	5b                   	pop    %ebx
80100924:	5e                   	pop    %esi
80100925:	5f                   	pop    %edi
80100926:	5d                   	pop    %ebp
80100927:	c3                   	ret    
80100928:	8b 06                	mov    (%esi),%eax
8010092a:	b9 01 00 00 00       	mov    $0x1,%ecx
8010092f:	ba 0a 00 00 00       	mov    $0xa,%edx
80100934:	83 c6 04             	add    $0x4,%esi
80100937:	e8 94 fe ff ff       	call   801007d0 <printint>
8010093c:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010093f:	e9 74 ff ff ff       	jmp    801008b8 <cprintf+0x68>
80100944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100948:	b8 25 00 00 00       	mov    $0x25,%eax
8010094d:	e8 de fa ff ff       	call   80100430 <consputc>
80100952:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100955:	e9 5e ff ff ff       	jmp    801008b8 <cprintf+0x68>
8010095a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100960:	8b 16                	mov    (%esi),%edx
80100962:	b8 49 6e 10 80       	mov    $0x80106e49,%eax
80100967:	83 c6 04             	add    $0x4,%esi
8010096a:	85 d2                	test   %edx,%edx
8010096c:	0f 44 d0             	cmove  %eax,%edx
8010096f:	0f b6 02             	movzbl (%edx),%eax
80100972:	84 c0                	test   %al,%al
80100974:	0f 84 3e ff ff ff    	je     801008b8 <cprintf+0x68>
8010097a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
8010097d:	89 d3                	mov    %edx,%ebx
8010097f:	90                   	nop
80100980:	0f be c0             	movsbl %al,%eax
80100983:	83 c3 01             	add    $0x1,%ebx
80100986:	e8 a5 fa ff ff       	call   80100430 <consputc>
8010098b:	0f b6 03             	movzbl (%ebx),%eax
8010098e:	84 c0                	test   %al,%al
80100990:	75 ee                	jne    80100980 <cprintf+0x130>
80100992:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80100995:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100998:	e9 1b ff ff ff       	jmp    801008b8 <cprintf+0x68>
8010099d:	8d 76 00             	lea    0x0(%esi),%esi
801009a0:	c7 04 24 e0 a5 10 80 	movl   $0x8010a5e0,(%esp)
801009a7:	e8 64 39 00 00       	call   80104310 <acquire>
801009ac:	e9 b6 fe ff ff       	jmp    80100867 <cprintf+0x17>
801009b1:	c7 04 24 40 6e 10 80 	movl   $0x80106e40,(%esp)
801009b8:	e8 f3 f9 ff ff       	call   801003b0 <panic>
801009bd:	66 90                	xchg   %ax,%ax
801009bf:	90                   	nop

801009c0 <exec>:
801009c0:	55                   	push   %ebp
801009c1:	89 e5                	mov    %esp,%ebp
801009c3:	57                   	push   %edi
801009c4:	56                   	push   %esi
801009c5:	53                   	push   %ebx
801009c6:	81 ec 2c 01 00 00    	sub    $0x12c,%esp
801009cc:	e8 7f 30 00 00       	call   80103a50 <myproc>
801009d1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
801009d7:	e8 24 23 00 00       	call   80102d00 <begin_op>
801009dc:	8b 45 08             	mov    0x8(%ebp),%eax
801009df:	89 04 24             	mov    %eax,(%esp)
801009e2:	e8 d9 14 00 00       	call   80101ec0 <namei>
801009e7:	85 c0                	test   %eax,%eax
801009e9:	89 c7                	mov    %eax,%edi
801009eb:	0f 84 34 03 00 00    	je     80100d25 <exec+0x365>
801009f1:	89 04 24             	mov    %eax,(%esp)
801009f4:	e8 97 0f 00 00       	call   80101990 <ilock>
801009f9:	8d 45 94             	lea    -0x6c(%ebp),%eax
801009fc:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
80100a03:	00 
80100a04:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80100a0b:	00 
80100a0c:	89 44 24 04          	mov    %eax,0x4(%esp)
80100a10:	89 3c 24             	mov    %edi,(%esp)
80100a13:	e8 e8 0c 00 00       	call   80101700 <readi>
80100a18:	83 f8 34             	cmp    $0x34,%eax
80100a1b:	0f 85 f7 01 00 00    	jne    80100c18 <exec+0x258>
80100a21:	81 7d 94 7f 45 4c 46 	cmpl   $0x464c457f,-0x6c(%ebp)
80100a28:	0f 85 ea 01 00 00    	jne    80100c18 <exec+0x258>
80100a2e:	66 90                	xchg   %ax,%ax
80100a30:	e8 4b 5e 00 00       	call   80106880 <setupkvm>
80100a35:	85 c0                	test   %eax,%eax
80100a37:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a3d:	0f 84 d5 01 00 00    	je     80100c18 <exec+0x258>
80100a43:	66 83 7d c0 00       	cmpw   $0x0,-0x40(%ebp)
80100a48:	8b 5d b0             	mov    -0x50(%ebp),%ebx
80100a4b:	0f 84 c8 02 00 00    	je     80100d19 <exec+0x359>
80100a51:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a58:	00 00 00 
80100a5b:	31 f6                	xor    %esi,%esi
80100a5d:	eb 13                	jmp    80100a72 <exec+0xb2>
80100a5f:	90                   	nop
80100a60:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80100a64:	83 c6 01             	add    $0x1,%esi
80100a67:	39 f0                	cmp    %esi,%eax
80100a69:	0f 8e c1 00 00 00    	jle    80100b30 <exec+0x170>
80100a6f:	83 c3 20             	add    $0x20,%ebx
80100a72:	8d 55 c8             	lea    -0x38(%ebp),%edx
80100a75:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100a7c:	00 
80100a7d:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80100a81:	89 54 24 04          	mov    %edx,0x4(%esp)
80100a85:	89 3c 24             	mov    %edi,(%esp)
80100a88:	e8 73 0c 00 00       	call   80101700 <readi>
80100a8d:	83 f8 20             	cmp    $0x20,%eax
80100a90:	75 76                	jne    80100b08 <exec+0x148>
80100a92:	83 7d c8 01          	cmpl   $0x1,-0x38(%ebp)
80100a96:	75 c8                	jne    80100a60 <exec+0xa0>
80100a98:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100a9b:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80100a9e:	66 90                	xchg   %ax,%ax
80100aa0:	72 66                	jb     80100b08 <exec+0x148>
80100aa2:	03 45 d0             	add    -0x30(%ebp),%eax
80100aa5:	72 61                	jb     80100b08 <exec+0x148>
80100aa7:	89 44 24 08          	mov    %eax,0x8(%esp)
80100aab:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100ab1:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100ab7:	89 4c 24 04          	mov    %ecx,0x4(%esp)
80100abb:	89 04 24             	mov    %eax,(%esp)
80100abe:	e8 4d 5f 00 00       	call   80106a10 <allocuvm>
80100ac3:	85 c0                	test   %eax,%eax
80100ac5:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100acb:	74 3b                	je     80100b08 <exec+0x148>
80100acd:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100ad0:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100ad5:	75 31                	jne    80100b08 <exec+0x148>
80100ad7:	8b 55 d8             	mov    -0x28(%ebp),%edx
80100ada:	89 7c 24 08          	mov    %edi,0x8(%esp)
80100ade:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ae2:	89 54 24 10          	mov    %edx,0x10(%esp)
80100ae6:	8b 55 cc             	mov    -0x34(%ebp),%edx
80100ae9:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100aed:	8b 95 f4 fe ff ff    	mov    -0x10c(%ebp),%edx
80100af3:	89 14 24             	mov    %edx,(%esp)
80100af6:	e8 35 60 00 00       	call   80106b30 <loaduvm>
80100afb:	85 c0                	test   %eax,%eax
80100afd:	0f 89 5d ff ff ff    	jns    80100a60 <exec+0xa0>
80100b03:	90                   	nop
80100b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100b08:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b0e:	89 04 24             	mov    %eax,(%esp)
80100b11:	e8 ea 5c 00 00       	call   80106800 <freevm>
80100b16:	85 ff                	test   %edi,%edi
80100b18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b1d:	0f 85 f5 00 00 00    	jne    80100c18 <exec+0x258>
80100b23:	81 c4 2c 01 00 00    	add    $0x12c,%esp
80100b29:	5b                   	pop    %ebx
80100b2a:	5e                   	pop    %esi
80100b2b:	5f                   	pop    %edi
80100b2c:	5d                   	pop    %ebp
80100b2d:	c3                   	ret    
80100b2e:	66 90                	xchg   %ax,%ax
80100b30:	8b 9d f0 fe ff ff    	mov    -0x110(%ebp),%ebx
80100b36:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
80100b3c:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80100b42:	8d b3 00 20 00 00    	lea    0x2000(%ebx),%esi
80100b48:	89 3c 24             	mov    %edi,(%esp)
80100b4b:	e8 c0 11 00 00       	call   80101d10 <iunlockput>
80100b50:	e8 7b 20 00 00       	call   80102bd0 <end_op>
80100b55:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100b5b:	89 74 24 08          	mov    %esi,0x8(%esp)
80100b5f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100b63:	89 0c 24             	mov    %ecx,(%esp)
80100b66:	e8 a5 5e 00 00       	call   80106a10 <allocuvm>
80100b6b:	85 c0                	test   %eax,%eax
80100b6d:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b73:	0f 84 96 00 00 00    	je     80100c0f <exec+0x24f>
80100b79:	2d 00 20 00 00       	sub    $0x2000,%eax
80100b7e:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b82:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b88:	89 04 24             	mov    %eax,(%esp)
80100b8b:	e8 00 5b 00 00       	call   80106690 <clearpteu>
80100b90:	8b 55 0c             	mov    0xc(%ebp),%edx
80100b93:	8b 02                	mov    (%edx),%eax
80100b95:	85 c0                	test   %eax,%eax
80100b97:	0f 84 a1 01 00 00    	je     80100d3e <exec+0x37e>
80100b9d:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100ba0:	31 f6                	xor    %esi,%esi
80100ba2:	8b 9d f0 fe ff ff    	mov    -0x110(%ebp),%ebx
80100ba8:	eb 28                	jmp    80100bd2 <exec+0x212>
80100baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100bb0:	89 9c b5 10 ff ff ff 	mov    %ebx,-0xf0(%ebp,%esi,4)
80100bb7:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bba:	83 c6 01             	add    $0x1,%esi
80100bbd:	8d 95 04 ff ff ff    	lea    -0xfc(%ebp),%edx
80100bc3:	8d 3c b0             	lea    (%eax,%esi,4),%edi
80100bc6:	8b 04 b0             	mov    (%eax,%esi,4),%eax
80100bc9:	85 c0                	test   %eax,%eax
80100bcb:	74 67                	je     80100c34 <exec+0x274>
80100bcd:	83 fe 20             	cmp    $0x20,%esi
80100bd0:	74 3d                	je     80100c0f <exec+0x24f>
80100bd2:	89 04 24             	mov    %eax,(%esp)
80100bd5:	e8 c6 39 00 00       	call   801045a0 <strlen>
80100bda:	f7 d0                	not    %eax
80100bdc:	8d 1c 18             	lea    (%eax,%ebx,1),%ebx
80100bdf:	8b 07                	mov    (%edi),%eax
80100be1:	83 e3 fc             	and    $0xfffffffc,%ebx
80100be4:	89 04 24             	mov    %eax,(%esp)
80100be7:	e8 b4 39 00 00       	call   801045a0 <strlen>
80100bec:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100bf2:	83 c0 01             	add    $0x1,%eax
80100bf5:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100bf9:	8b 07                	mov    (%edi),%eax
80100bfb:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100bff:	89 0c 24             	mov    %ecx,(%esp)
80100c02:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c06:	e8 65 59 00 00       	call   80106570 <copyout>
80100c0b:	85 c0                	test   %eax,%eax
80100c0d:	79 a1                	jns    80100bb0 <exec+0x1f0>
80100c0f:	31 ff                	xor    %edi,%edi
80100c11:	e9 f2 fe ff ff       	jmp    80100b08 <exec+0x148>
80100c16:	66 90                	xchg   %ax,%ax
80100c18:	89 3c 24             	mov    %edi,(%esp)
80100c1b:	90                   	nop
80100c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c20:	e8 eb 10 00 00       	call   80101d10 <iunlockput>
80100c25:	e8 a6 1f 00 00       	call   80102bd0 <end_op>
80100c2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c2f:	e9 ef fe ff ff       	jmp    80100b23 <exec+0x163>
80100c34:	8d 4e 03             	lea    0x3(%esi),%ecx
80100c37:	8d 3c b5 04 00 00 00 	lea    0x4(,%esi,4),%edi
80100c3e:	8d 04 b5 10 00 00 00 	lea    0x10(,%esi,4),%eax
80100c45:	c7 84 8d 04 ff ff ff 	movl   $0x0,-0xfc(%ebp,%ecx,4)
80100c4c:	00 00 00 00 
80100c50:	89 d9                	mov    %ebx,%ecx
80100c52:	29 c3                	sub    %eax,%ebx
80100c54:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c58:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100c5e:	29 f9                	sub    %edi,%ecx
80100c60:	c7 85 04 ff ff ff ff 	movl   $0xffffffff,-0xfc(%ebp)
80100c67:	ff ff ff 
80100c6a:	89 b5 08 ff ff ff    	mov    %esi,-0xf8(%ebp)
80100c70:	89 8d 0c ff ff ff    	mov    %ecx,-0xf4(%ebp)
80100c76:	89 54 24 08          	mov    %edx,0x8(%esp)
80100c7a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100c7e:	89 04 24             	mov    %eax,(%esp)
80100c81:	e8 ea 58 00 00       	call   80106570 <copyout>
80100c86:	85 c0                	test   %eax,%eax
80100c88:	78 85                	js     80100c0f <exec+0x24f>
80100c8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100c8d:	0f b6 11             	movzbl (%ecx),%edx
80100c90:	84 d2                	test   %dl,%dl
80100c92:	74 1c                	je     80100cb0 <exec+0x2f0>
80100c94:	89 c8                	mov    %ecx,%eax
80100c96:	83 c0 01             	add    $0x1,%eax
80100c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100ca0:	80 fa 2f             	cmp    $0x2f,%dl
80100ca3:	0f b6 10             	movzbl (%eax),%edx
80100ca6:	0f 44 c8             	cmove  %eax,%ecx
80100ca9:	83 c0 01             	add    $0x1,%eax
80100cac:	84 d2                	test   %dl,%dl
80100cae:	75 f0                	jne    80100ca0 <exec+0x2e0>
80100cb0:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100cb6:	89 4c 24 04          	mov    %ecx,0x4(%esp)
80100cba:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100cc1:	00 
80100cc2:	83 c0 6c             	add    $0x6c,%eax
80100cc5:	89 04 24             	mov    %eax,(%esp)
80100cc8:	e8 93 38 00 00       	call   80104560 <safestrcpy>
80100ccd:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100cd3:	8b 95 f4 fe ff ff    	mov    -0x10c(%ebp),%edx
80100cd9:	8b 70 04             	mov    0x4(%eax),%esi
80100cdc:	89 50 04             	mov    %edx,0x4(%eax)
80100cdf:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100ce5:	89 08                	mov    %ecx,(%eax)
80100ce7:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
80100ced:	8b 42 18             	mov    0x18(%edx),%eax
80100cf0:	8b 55 ac             	mov    -0x54(%ebp),%edx
80100cf3:	89 50 38             	mov    %edx,0x38(%eax)
80100cf6:	8b 8d ec fe ff ff    	mov    -0x114(%ebp),%ecx
80100cfc:	8b 41 18             	mov    0x18(%ecx),%eax
80100cff:	89 58 44             	mov    %ebx,0x44(%eax)
80100d02:	89 0c 24             	mov    %ecx,(%esp)
80100d05:	e8 e6 5e 00 00       	call   80106bf0 <switchuvm>
80100d0a:	89 34 24             	mov    %esi,(%esp)
80100d0d:	e8 ee 5a 00 00       	call   80106800 <freevm>
80100d12:	31 c0                	xor    %eax,%eax
80100d14:	e9 0a fe ff ff       	jmp    80100b23 <exec+0x163>
80100d19:	be 00 20 00 00       	mov    $0x2000,%esi
80100d1e:	31 db                	xor    %ebx,%ebx
80100d20:	e9 23 fe ff ff       	jmp    80100b48 <exec+0x188>
80100d25:	e8 a6 1e 00 00       	call   80102bd0 <end_op>
80100d2a:	c7 04 24 61 6e 10 80 	movl   $0x80106e61,(%esp)
80100d31:	e8 1a fb ff ff       	call   80100850 <cprintf>
80100d36:	83 c8 ff             	or     $0xffffffff,%eax
80100d39:	e9 e5 fd ff ff       	jmp    80100b23 <exec+0x163>
80100d3e:	8b 9d f0 fe ff ff    	mov    -0x110(%ebp),%ebx
80100d44:	b0 10                	mov    $0x10,%al
80100d46:	bf 04 00 00 00       	mov    $0x4,%edi
80100d4b:	b9 03 00 00 00       	mov    $0x3,%ecx
80100d50:	31 f6                	xor    %esi,%esi
80100d52:	8d 95 04 ff ff ff    	lea    -0xfc(%ebp),%edx
80100d58:	e9 e8 fe ff ff       	jmp    80100c45 <exec+0x285>
80100d5d:	66 90                	xchg   %ax,%ax
80100d5f:	90                   	nop

80100d60 <filewrite>:
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	57                   	push   %edi
80100d64:	56                   	push   %esi
80100d65:	53                   	push   %ebx
80100d66:	83 ec 2c             	sub    $0x2c,%esp
80100d69:	8b 45 0c             	mov    0xc(%ebp),%eax
80100d6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100d6f:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100d72:	8b 45 10             	mov    0x10(%ebp),%eax
80100d75:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100d78:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
80100d7c:	0f 84 ae 00 00 00    	je     80100e30 <filewrite+0xd0>
80100d82:	8b 03                	mov    (%ebx),%eax
80100d84:	83 f8 01             	cmp    $0x1,%eax
80100d87:	0f 84 c2 00 00 00    	je     80100e4f <filewrite+0xef>
80100d8d:	83 f8 02             	cmp    $0x2,%eax
80100d90:	0f 85 d7 00 00 00    	jne    80100e6d <filewrite+0x10d>
80100d96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100d99:	31 f6                	xor    %esi,%esi
80100d9b:	85 c0                	test   %eax,%eax
80100d9d:	7f 31                	jg     80100dd0 <filewrite+0x70>
80100d9f:	90                   	nop
80100da0:	e9 9b 00 00 00       	jmp    80100e40 <filewrite+0xe0>
80100da5:	8d 76 00             	lea    0x0(%esi),%esi
80100da8:	8b 53 10             	mov    0x10(%ebx),%edx
80100dab:	01 43 14             	add    %eax,0x14(%ebx)
80100dae:	89 14 24             	mov    %edx,(%esp)
80100db1:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100db4:	e8 07 0f 00 00       	call   80101cc0 <iunlock>
80100db9:	e8 12 1e 00 00       	call   80102bd0 <end_op>
80100dbe:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100dc1:	39 f8                	cmp    %edi,%eax
80100dc3:	0f 85 98 00 00 00    	jne    80100e61 <filewrite+0x101>
80100dc9:	01 c6                	add    %eax,%esi
80100dcb:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
80100dce:	7e 70                	jle    80100e40 <filewrite+0xe0>
80100dd0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80100dd3:	b8 00 06 00 00       	mov    $0x600,%eax
80100dd8:	29 f7                	sub    %esi,%edi
80100dda:	81 ff 00 06 00 00    	cmp    $0x600,%edi
80100de0:	0f 4f f8             	cmovg  %eax,%edi
80100de3:	e8 18 1f 00 00       	call   80102d00 <begin_op>
80100de8:	8b 43 10             	mov    0x10(%ebx),%eax
80100deb:	89 04 24             	mov    %eax,(%esp)
80100dee:	e8 9d 0b 00 00       	call   80101990 <ilock>
80100df3:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80100df7:	8b 43 14             	mov    0x14(%ebx),%eax
80100dfa:	89 44 24 08          	mov    %eax,0x8(%esp)
80100dfe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100e01:	01 f0                	add    %esi,%eax
80100e03:	89 44 24 04          	mov    %eax,0x4(%esp)
80100e07:	8b 43 10             	mov    0x10(%ebx),%eax
80100e0a:	89 04 24             	mov    %eax,(%esp)
80100e0d:	e8 ce 07 00 00       	call   801015e0 <writei>
80100e12:	85 c0                	test   %eax,%eax
80100e14:	7f 92                	jg     80100da8 <filewrite+0x48>
80100e16:	8b 53 10             	mov    0x10(%ebx),%edx
80100e19:	89 14 24             	mov    %edx,(%esp)
80100e1c:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100e1f:	e8 9c 0e 00 00       	call   80101cc0 <iunlock>
80100e24:	e8 a7 1d 00 00       	call   80102bd0 <end_op>
80100e29:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100e2c:	85 c0                	test   %eax,%eax
80100e2e:	74 91                	je     80100dc1 <filewrite+0x61>
80100e30:	83 c4 2c             	add    $0x2c,%esp
80100e33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100e38:	5b                   	pop    %ebx
80100e39:	5e                   	pop    %esi
80100e3a:	5f                   	pop    %edi
80100e3b:	5d                   	pop    %ebp
80100e3c:	c3                   	ret    
80100e3d:	8d 76 00             	lea    0x0(%esi),%esi
80100e40:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
80100e43:	89 f0                	mov    %esi,%eax
80100e45:	75 e9                	jne    80100e30 <filewrite+0xd0>
80100e47:	83 c4 2c             	add    $0x2c,%esp
80100e4a:	5b                   	pop    %ebx
80100e4b:	5e                   	pop    %esi
80100e4c:	5f                   	pop    %edi
80100e4d:	5d                   	pop    %ebp
80100e4e:	c3                   	ret    
80100e4f:	8b 43 0c             	mov    0xc(%ebx),%eax
80100e52:	89 45 08             	mov    %eax,0x8(%ebp)
80100e55:	83 c4 2c             	add    $0x2c,%esp
80100e58:	5b                   	pop    %ebx
80100e59:	5e                   	pop    %esi
80100e5a:	5f                   	pop    %edi
80100e5b:	5d                   	pop    %ebp
80100e5c:	e9 6f 24 00 00       	jmp    801032d0 <pipewrite>
80100e61:	c7 04 24 6d 6e 10 80 	movl   $0x80106e6d,(%esp)
80100e68:	e8 43 f5 ff ff       	call   801003b0 <panic>
80100e6d:	c7 04 24 73 6e 10 80 	movl   $0x80106e73,(%esp)
80100e74:	e8 37 f5 ff ff       	call   801003b0 <panic>
80100e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e80 <fileread>:
80100e80:	55                   	push   %ebp
80100e81:	89 e5                	mov    %esp,%ebp
80100e83:	83 ec 38             	sub    $0x38,%esp
80100e86:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80100e89:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e8c:	89 75 f8             	mov    %esi,-0x8(%ebp)
80100e8f:	8b 75 0c             	mov    0xc(%ebp),%esi
80100e92:	89 7d fc             	mov    %edi,-0x4(%ebp)
80100e95:	8b 7d 10             	mov    0x10(%ebp),%edi
80100e98:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100e9c:	74 5a                	je     80100ef8 <fileread+0x78>
80100e9e:	8b 03                	mov    (%ebx),%eax
80100ea0:	83 f8 01             	cmp    $0x1,%eax
80100ea3:	74 5b                	je     80100f00 <fileread+0x80>
80100ea5:	83 f8 02             	cmp    $0x2,%eax
80100ea8:	75 6d                	jne    80100f17 <fileread+0x97>
80100eaa:	8b 43 10             	mov    0x10(%ebx),%eax
80100ead:	89 04 24             	mov    %eax,(%esp)
80100eb0:	e8 db 0a 00 00       	call   80101990 <ilock>
80100eb5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80100eb9:	8b 43 14             	mov    0x14(%ebx),%eax
80100ebc:	89 74 24 04          	mov    %esi,0x4(%esp)
80100ec0:	89 44 24 08          	mov    %eax,0x8(%esp)
80100ec4:	8b 43 10             	mov    0x10(%ebx),%eax
80100ec7:	89 04 24             	mov    %eax,(%esp)
80100eca:	e8 31 08 00 00       	call   80101700 <readi>
80100ecf:	85 c0                	test   %eax,%eax
80100ed1:	7e 03                	jle    80100ed6 <fileread+0x56>
80100ed3:	01 43 14             	add    %eax,0x14(%ebx)
80100ed6:	8b 53 10             	mov    0x10(%ebx),%edx
80100ed9:	89 14 24             	mov    %edx,(%esp)
80100edc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100edf:	e8 dc 0d 00 00       	call   80101cc0 <iunlock>
80100ee4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ee7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100eea:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100eed:	8b 7d fc             	mov    -0x4(%ebp),%edi
80100ef0:	89 ec                	mov    %ebp,%esp
80100ef2:	5d                   	pop    %ebp
80100ef3:	c3                   	ret    
80100ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ef8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100efd:	eb e8                	jmp    80100ee7 <fileread+0x67>
80100eff:	90                   	nop
80100f00:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f03:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100f06:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100f09:	8b 7d fc             	mov    -0x4(%ebp),%edi
80100f0c:	89 45 08             	mov    %eax,0x8(%ebp)
80100f0f:	89 ec                	mov    %ebp,%esp
80100f11:	5d                   	pop    %ebp
80100f12:	e9 c9 22 00 00       	jmp    801031e0 <piperead>
80100f17:	c7 04 24 7d 6e 10 80 	movl   $0x80106e7d,(%esp)
80100f1e:	e8 8d f4 ff ff       	call   801003b0 <panic>
80100f23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f30 <filestat>:
80100f30:	55                   	push   %ebp
80100f31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f36:	89 e5                	mov    %esp,%ebp
80100f38:	53                   	push   %ebx
80100f39:	83 ec 14             	sub    $0x14,%esp
80100f3c:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f3f:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f42:	74 0c                	je     80100f50 <filestat+0x20>
80100f44:	83 c4 14             	add    $0x14,%esp
80100f47:	5b                   	pop    %ebx
80100f48:	5d                   	pop    %ebp
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f50:	8b 43 10             	mov    0x10(%ebx),%eax
80100f53:	89 04 24             	mov    %eax,(%esp)
80100f56:	e8 35 0a 00 00       	call   80101990 <ilock>
80100f5b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100f5e:	89 44 24 04          	mov    %eax,0x4(%esp)
80100f62:	8b 43 10             	mov    0x10(%ebx),%eax
80100f65:	89 04 24             	mov    %eax,(%esp)
80100f68:	e8 e3 01 00 00       	call   80101150 <stati>
80100f6d:	8b 43 10             	mov    0x10(%ebx),%eax
80100f70:	89 04 24             	mov    %eax,(%esp)
80100f73:	e8 48 0d 00 00       	call   80101cc0 <iunlock>
80100f78:	83 c4 14             	add    $0x14,%esp
80100f7b:	31 c0                	xor    %eax,%eax
80100f7d:	5b                   	pop    %ebx
80100f7e:	5d                   	pop    %ebp
80100f7f:	c3                   	ret    

80100f80 <filedup>:
80100f80:	55                   	push   %ebp
80100f81:	89 e5                	mov    %esp,%ebp
80100f83:	53                   	push   %ebx
80100f84:	83 ec 14             	sub    $0x14,%esp
80100f87:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f8a:	c7 04 24 80 00 11 80 	movl   $0x80110080,(%esp)
80100f91:	e8 7a 33 00 00       	call   80104310 <acquire>
80100f96:	8b 43 04             	mov    0x4(%ebx),%eax
80100f99:	85 c0                	test   %eax,%eax
80100f9b:	7e 1a                	jle    80100fb7 <filedup+0x37>
80100f9d:	83 c0 01             	add    $0x1,%eax
80100fa0:	89 43 04             	mov    %eax,0x4(%ebx)
80100fa3:	c7 04 24 80 00 11 80 	movl   $0x80110080,(%esp)
80100faa:	e8 11 33 00 00       	call   801042c0 <release>
80100faf:	89 d8                	mov    %ebx,%eax
80100fb1:	83 c4 14             	add    $0x14,%esp
80100fb4:	5b                   	pop    %ebx
80100fb5:	5d                   	pop    %ebp
80100fb6:	c3                   	ret    
80100fb7:	c7 04 24 86 6e 10 80 	movl   $0x80106e86,(%esp)
80100fbe:	e8 ed f3 ff ff       	call   801003b0 <panic>
80100fc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fd0 <filealloc>:
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	53                   	push   %ebx
80100fd4:	bb cc 00 11 80       	mov    $0x801100cc,%ebx
80100fd9:	83 ec 14             	sub    $0x14,%esp
80100fdc:	c7 04 24 80 00 11 80 	movl   $0x80110080,(%esp)
80100fe3:	e8 28 33 00 00       	call   80104310 <acquire>
80100fe8:	8b 0d b8 00 11 80    	mov    0x801100b8,%ecx
80100fee:	85 c9                	test   %ecx,%ecx
80100ff0:	75 11                	jne    80101003 <filealloc+0x33>
80100ff2:	eb 4a                	jmp    8010103e <filealloc+0x6e>
80100ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ff8:	83 c3 18             	add    $0x18,%ebx
80100ffb:	81 fb 14 0a 11 80    	cmp    $0x80110a14,%ebx
80101001:	74 25                	je     80101028 <filealloc+0x58>
80101003:	8b 53 04             	mov    0x4(%ebx),%edx
80101006:	85 d2                	test   %edx,%edx
80101008:	75 ee                	jne    80100ff8 <filealloc+0x28>
8010100a:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80101011:	c7 04 24 80 00 11 80 	movl   $0x80110080,(%esp)
80101018:	e8 a3 32 00 00       	call   801042c0 <release>
8010101d:	89 d8                	mov    %ebx,%eax
8010101f:	83 c4 14             	add    $0x14,%esp
80101022:	5b                   	pop    %ebx
80101023:	5d                   	pop    %ebp
80101024:	c3                   	ret    
80101025:	8d 76 00             	lea    0x0(%esi),%esi
80101028:	31 db                	xor    %ebx,%ebx
8010102a:	c7 04 24 80 00 11 80 	movl   $0x80110080,(%esp)
80101031:	e8 8a 32 00 00       	call   801042c0 <release>
80101036:	89 d8                	mov    %ebx,%eax
80101038:	83 c4 14             	add    $0x14,%esp
8010103b:	5b                   	pop    %ebx
8010103c:	5d                   	pop    %ebp
8010103d:	c3                   	ret    
8010103e:	bb b4 00 11 80       	mov    $0x801100b4,%ebx
80101043:	eb c5                	jmp    8010100a <filealloc+0x3a>
80101045:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101050 <fileclose>:
80101050:	55                   	push   %ebp
80101051:	89 e5                	mov    %esp,%ebp
80101053:	83 ec 38             	sub    $0x38,%esp
80101056:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80101059:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010105c:	89 75 f8             	mov    %esi,-0x8(%ebp)
8010105f:	89 7d fc             	mov    %edi,-0x4(%ebp)
80101062:	c7 04 24 80 00 11 80 	movl   $0x80110080,(%esp)
80101069:	e8 a2 32 00 00       	call   80104310 <acquire>
8010106e:	8b 43 04             	mov    0x4(%ebx),%eax
80101071:	85 c0                	test   %eax,%eax
80101073:	0f 8e a4 00 00 00    	jle    8010111d <fileclose+0xcd>
80101079:	83 e8 01             	sub    $0x1,%eax
8010107c:	85 c0                	test   %eax,%eax
8010107e:	89 43 04             	mov    %eax,0x4(%ebx)
80101081:	74 1d                	je     801010a0 <fileclose+0x50>
80101083:	c7 45 08 80 00 11 80 	movl   $0x80110080,0x8(%ebp)
8010108a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010108d:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101090:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101093:	89 ec                	mov    %ebp,%esp
80101095:	5d                   	pop    %ebp
80101096:	e9 25 32 00 00       	jmp    801042c0 <release>
8010109b:	90                   	nop
8010109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010a0:	8b 43 0c             	mov    0xc(%ebx),%eax
801010a3:	8b 7b 10             	mov    0x10(%ebx),%edi
801010a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010a9:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
801010ad:	88 45 e7             	mov    %al,-0x19(%ebp)
801010b0:	8b 33                	mov    (%ebx),%esi
801010b2:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
801010b9:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801010bf:	c7 04 24 80 00 11 80 	movl   $0x80110080,(%esp)
801010c6:	e8 f5 31 00 00       	call   801042c0 <release>
801010cb:	83 fe 01             	cmp    $0x1,%esi
801010ce:	74 38                	je     80101108 <fileclose+0xb8>
801010d0:	83 fe 02             	cmp    $0x2,%esi
801010d3:	74 13                	je     801010e8 <fileclose+0x98>
801010d5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801010d8:	8b 75 f8             	mov    -0x8(%ebp),%esi
801010db:	8b 7d fc             	mov    -0x4(%ebp),%edi
801010de:	89 ec                	mov    %ebp,%esp
801010e0:	5d                   	pop    %ebp
801010e1:	c3                   	ret    
801010e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801010e8:	e8 13 1c 00 00       	call   80102d00 <begin_op>
801010ed:	89 3c 24             	mov    %edi,(%esp)
801010f0:	e8 7b 09 00 00       	call   80101a70 <iput>
801010f5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801010f8:	8b 75 f8             	mov    -0x8(%ebp),%esi
801010fb:	8b 7d fc             	mov    -0x4(%ebp),%edi
801010fe:	89 ec                	mov    %ebp,%esp
80101100:	5d                   	pop    %ebp
80101101:	e9 ca 1a 00 00       	jmp    80102bd0 <end_op>
80101106:	66 90                	xchg   %ax,%ax
80101108:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
8010110c:	89 44 24 04          	mov    %eax,0x4(%esp)
80101110:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101113:	89 04 24             	mov    %eax,(%esp)
80101116:	e8 a5 22 00 00       	call   801033c0 <pipeclose>
8010111b:	eb b8                	jmp    801010d5 <fileclose+0x85>
8010111d:	c7 04 24 8e 6e 10 80 	movl   $0x80106e8e,(%esp)
80101124:	e8 87 f2 ff ff       	call   801003b0 <panic>
80101129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101130 <fileinit>:
80101130:	55                   	push   %ebp
80101131:	89 e5                	mov    %esp,%ebp
80101133:	83 ec 18             	sub    $0x18,%esp
80101136:	c7 44 24 04 98 6e 10 	movl   $0x80106e98,0x4(%esp)
8010113d:	80 
8010113e:	c7 04 24 80 00 11 80 	movl   $0x80110080,(%esp)
80101145:	e8 f6 2f 00 00       	call   80104140 <initlock>
8010114a:	c9                   	leave  
8010114b:	c3                   	ret    
8010114c:	66 90                	xchg   %ax,%ax
8010114e:	66 90                	xchg   %ax,%ax

80101150 <stati>:
80101150:	55                   	push   %ebp
80101151:	89 e5                	mov    %esp,%ebp
80101153:	8b 55 08             	mov    0x8(%ebp),%edx
80101156:	8b 45 0c             	mov    0xc(%ebp),%eax
80101159:	8b 0a                	mov    (%edx),%ecx
8010115b:	89 48 04             	mov    %ecx,0x4(%eax)
8010115e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101161:	89 48 08             	mov    %ecx,0x8(%eax)
80101164:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101168:	66 89 08             	mov    %cx,(%eax)
8010116b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010116f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101173:	8b 52 58             	mov    0x58(%edx),%edx
80101176:	89 50 10             	mov    %edx,0x10(%eax)
80101179:	5d                   	pop    %ebp
8010117a:	c3                   	ret    
8010117b:	90                   	nop
8010117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101180 <idup>:
80101180:	55                   	push   %ebp
80101181:	89 e5                	mov    %esp,%ebp
80101183:	53                   	push   %ebx
80101184:	83 ec 14             	sub    $0x14,%esp
80101187:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010118a:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
80101191:	e8 7a 31 00 00       	call   80104310 <acquire>
80101196:	83 43 08 01          	addl   $0x1,0x8(%ebx)
8010119a:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
801011a1:	e8 1a 31 00 00       	call   801042c0 <release>
801011a6:	89 d8                	mov    %ebx,%eax
801011a8:	83 c4 14             	add    $0x14,%esp
801011ab:	5b                   	pop    %ebx
801011ac:	5d                   	pop    %ebp
801011ad:	c3                   	ret    
801011ae:	66 90                	xchg   %ax,%ax

801011b0 <iget>:
801011b0:	55                   	push   %ebp
801011b1:	89 e5                	mov    %esp,%ebp
801011b3:	57                   	push   %edi
801011b4:	89 d7                	mov    %edx,%edi
801011b6:	56                   	push   %esi
801011b7:	31 f6                	xor    %esi,%esi
801011b9:	53                   	push   %ebx
801011ba:	89 c3                	mov    %eax,%ebx
801011bc:	83 ec 2c             	sub    $0x2c,%esp
801011bf:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
801011c6:	e8 45 31 00 00       	call   80104310 <acquire>
801011cb:	b8 d4 0a 11 80       	mov    $0x80110ad4,%eax
801011d0:	eb 16                	jmp    801011e8 <iget+0x38>
801011d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011d8:	85 f6                	test   %esi,%esi
801011da:	74 3c                	je     80101218 <iget+0x68>
801011dc:	05 90 00 00 00       	add    $0x90,%eax
801011e1:	3d f4 26 11 80       	cmp    $0x801126f4,%eax
801011e6:	74 48                	je     80101230 <iget+0x80>
801011e8:	8b 48 08             	mov    0x8(%eax),%ecx
801011eb:	85 c9                	test   %ecx,%ecx
801011ed:	7e e9                	jle    801011d8 <iget+0x28>
801011ef:	39 18                	cmp    %ebx,(%eax)
801011f1:	75 e5                	jne    801011d8 <iget+0x28>
801011f3:	39 78 04             	cmp    %edi,0x4(%eax)
801011f6:	75 e0                	jne    801011d8 <iget+0x28>
801011f8:	83 c1 01             	add    $0x1,%ecx
801011fb:	89 48 08             	mov    %ecx,0x8(%eax)
801011fe:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
80101205:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101208:	e8 b3 30 00 00       	call   801042c0 <release>
8010120d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101210:	83 c4 2c             	add    $0x2c,%esp
80101213:	5b                   	pop    %ebx
80101214:	5e                   	pop    %esi
80101215:	5f                   	pop    %edi
80101216:	5d                   	pop    %ebp
80101217:	c3                   	ret    
80101218:	85 c9                	test   %ecx,%ecx
8010121a:	0f 44 f0             	cmove  %eax,%esi
8010121d:	05 90 00 00 00       	add    $0x90,%eax
80101222:	3d f4 26 11 80       	cmp    $0x801126f4,%eax
80101227:	75 bf                	jne    801011e8 <iget+0x38>
80101229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101230:	85 f6                	test   %esi,%esi
80101232:	74 29                	je     8010125d <iget+0xad>
80101234:	89 1e                	mov    %ebx,(%esi)
80101236:	89 7e 04             	mov    %edi,0x4(%esi)
80101239:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101240:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101247:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
8010124e:	e8 6d 30 00 00       	call   801042c0 <release>
80101253:	83 c4 2c             	add    $0x2c,%esp
80101256:	89 f0                	mov    %esi,%eax
80101258:	5b                   	pop    %ebx
80101259:	5e                   	pop    %esi
8010125a:	5f                   	pop    %edi
8010125b:	5d                   	pop    %ebp
8010125c:	c3                   	ret    
8010125d:	c7 04 24 9f 6e 10 80 	movl   $0x80106e9f,(%esp)
80101264:	e8 47 f1 ff ff       	call   801003b0 <panic>
80101269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101270 <namecmp>:
80101270:	55                   	push   %ebp
80101271:	89 e5                	mov    %esp,%ebp
80101273:	83 ec 18             	sub    $0x18,%esp
80101276:	8b 45 0c             	mov    0xc(%ebp),%eax
80101279:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101280:	00 
80101281:	89 44 24 04          	mov    %eax,0x4(%esp)
80101285:	8b 45 08             	mov    0x8(%ebp),%eax
80101288:	89 04 24             	mov    %eax,(%esp)
8010128b:	e8 20 32 00 00       	call   801044b0 <strncmp>
80101290:	c9                   	leave  
80101291:	c3                   	ret    
80101292:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801012a0 <bfree>:
801012a0:	55                   	push   %ebp
801012a1:	89 e5                	mov    %esp,%ebp
801012a3:	83 ec 28             	sub    $0x28,%esp
801012a6:	89 75 f8             	mov    %esi,-0x8(%ebp)
801012a9:	89 d6                	mov    %edx,%esi
801012ab:	c1 ea 0c             	shr    $0xc,%edx
801012ae:	03 15 98 0a 11 80    	add    0x80110a98,%edx
801012b4:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801012b7:	89 f3                	mov    %esi,%ebx
801012b9:	89 7d fc             	mov    %edi,-0x4(%ebp)
801012bc:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
801012c2:	89 54 24 04          	mov    %edx,0x4(%esp)
801012c6:	c1 fb 03             	sar    $0x3,%ebx
801012c9:	89 04 24             	mov    %eax,(%esp)
801012cc:	e8 3f ee ff ff       	call   80100110 <bread>
801012d1:	89 f1                	mov    %esi,%ecx
801012d3:	be 01 00 00 00       	mov    $0x1,%esi
801012d8:	83 e1 07             	and    $0x7,%ecx
801012db:	d3 e6                	shl    %cl,%esi
801012dd:	0f b6 54 18 5c       	movzbl 0x5c(%eax,%ebx,1),%edx
801012e2:	89 c7                	mov    %eax,%edi
801012e4:	0f b6 c2             	movzbl %dl,%eax
801012e7:	85 f0                	test   %esi,%eax
801012e9:	74 27                	je     80101312 <bfree+0x72>
801012eb:	89 f0                	mov    %esi,%eax
801012ed:	f7 d0                	not    %eax
801012ef:	21 d0                	and    %edx,%eax
801012f1:	88 44 1f 5c          	mov    %al,0x5c(%edi,%ebx,1)
801012f5:	89 3c 24             	mov    %edi,(%esp)
801012f8:	e8 13 17 00 00       	call   80102a10 <log_write>
801012fd:	89 3c 24             	mov    %edi,(%esp)
80101300:	e8 3b ed ff ff       	call   80100040 <brelse>
80101305:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101308:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010130b:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010130e:	89 ec                	mov    %ebp,%esp
80101310:	5d                   	pop    %ebp
80101311:	c3                   	ret    
80101312:	c7 04 24 af 6e 10 80 	movl   $0x80106eaf,(%esp)
80101319:	e8 92 f0 ff ff       	call   801003b0 <panic>
8010131e:	66 90                	xchg   %ax,%ax

80101320 <iupdate>:
80101320:	55                   	push   %ebp
80101321:	89 e5                	mov    %esp,%ebp
80101323:	56                   	push   %esi
80101324:	53                   	push   %ebx
80101325:	83 ec 10             	sub    $0x10,%esp
80101328:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010132b:	8b 43 04             	mov    0x4(%ebx),%eax
8010132e:	c1 e8 03             	shr    $0x3,%eax
80101331:	03 05 94 0a 11 80    	add    0x80110a94,%eax
80101337:	89 44 24 04          	mov    %eax,0x4(%esp)
8010133b:	8b 03                	mov    (%ebx),%eax
8010133d:	89 04 24             	mov    %eax,(%esp)
80101340:	e8 cb ed ff ff       	call   80100110 <bread>
80101345:	0f b7 53 50          	movzwl 0x50(%ebx),%edx
80101349:	89 c6                	mov    %eax,%esi
8010134b:	8b 43 04             	mov    0x4(%ebx),%eax
8010134e:	83 e0 07             	and    $0x7,%eax
80101351:	c1 e0 06             	shl    $0x6,%eax
80101354:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101358:	66 89 10             	mov    %dx,(%eax)
8010135b:	0f b7 53 52          	movzwl 0x52(%ebx),%edx
8010135f:	66 89 50 02          	mov    %dx,0x2(%eax)
80101363:	0f b7 53 54          	movzwl 0x54(%ebx),%edx
80101367:	66 89 50 04          	mov    %dx,0x4(%eax)
8010136b:	0f b7 53 56          	movzwl 0x56(%ebx),%edx
8010136f:	66 89 50 06          	mov    %dx,0x6(%eax)
80101373:	8b 53 58             	mov    0x58(%ebx),%edx
80101376:	83 c3 5c             	add    $0x5c,%ebx
80101379:	89 50 08             	mov    %edx,0x8(%eax)
8010137c:	83 c0 0c             	add    $0xc,%eax
8010137f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101383:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010138a:	00 
8010138b:	89 04 24             	mov    %eax,(%esp)
8010138e:	e8 ad 30 00 00       	call   80104440 <memmove>
80101393:	89 34 24             	mov    %esi,(%esp)
80101396:	e8 75 16 00 00       	call   80102a10 <log_write>
8010139b:	89 75 08             	mov    %esi,0x8(%ebp)
8010139e:	83 c4 10             	add    $0x10,%esp
801013a1:	5b                   	pop    %ebx
801013a2:	5e                   	pop    %esi
801013a3:	5d                   	pop    %ebp
801013a4:	e9 97 ec ff ff       	jmp    80100040 <brelse>
801013a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801013b0 <readsb>:
801013b0:	55                   	push   %ebp
801013b1:	89 e5                	mov    %esp,%ebp
801013b3:	83 ec 18             	sub    $0x18,%esp
801013b6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801013b9:	89 75 fc             	mov    %esi,-0x4(%ebp)
801013bc:	8b 75 0c             	mov    0xc(%ebp),%esi
801013bf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801013c6:	00 
801013c7:	8b 45 08             	mov    0x8(%ebp),%eax
801013ca:	89 04 24             	mov    %eax,(%esp)
801013cd:	e8 3e ed ff ff       	call   80100110 <bread>
801013d2:	89 34 24             	mov    %esi,(%esp)
801013d5:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
801013dc:	00 
801013dd:	89 c3                	mov    %eax,%ebx
801013df:	83 c0 5c             	add    $0x5c,%eax
801013e2:	89 44 24 04          	mov    %eax,0x4(%esp)
801013e6:	e8 55 30 00 00       	call   80104440 <memmove>
801013eb:	8b 75 fc             	mov    -0x4(%ebp),%esi
801013ee:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013f1:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801013f4:	89 ec                	mov    %ebp,%esp
801013f6:	5d                   	pop    %ebp
801013f7:	e9 44 ec ff ff       	jmp    80100040 <brelse>
801013fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101400 <balloc>:
80101400:	55                   	push   %ebp
80101401:	89 e5                	mov    %esp,%ebp
80101403:	57                   	push   %edi
80101404:	56                   	push   %esi
80101405:	53                   	push   %ebx
80101406:	83 ec 3c             	sub    $0x3c,%esp
80101409:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010140c:	a1 80 0a 11 80       	mov    0x80110a80,%eax
80101411:	85 c0                	test   %eax,%eax
80101413:	0f 84 90 00 00 00    	je     801014a9 <balloc+0xa9>
80101419:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101420:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101423:	c1 f8 0c             	sar    $0xc,%eax
80101426:	03 05 98 0a 11 80    	add    0x80110a98,%eax
8010142c:	89 44 24 04          	mov    %eax,0x4(%esp)
80101430:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101433:	89 04 24             	mov    %eax,(%esp)
80101436:	e8 d5 ec ff ff       	call   80100110 <bread>
8010143b:	8b 15 80 0a 11 80    	mov    0x80110a80,%edx
80101441:	8b 5d dc             	mov    -0x24(%ebp),%ebx
80101444:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101447:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010144a:	31 c0                	xor    %eax,%eax
8010144c:	eb 35                	jmp    80101483 <balloc+0x83>
8010144e:	66 90                	xchg   %ax,%ax
80101450:	89 c1                	mov    %eax,%ecx
80101452:	bf 01 00 00 00       	mov    $0x1,%edi
80101457:	83 e1 07             	and    $0x7,%ecx
8010145a:	89 c2                	mov    %eax,%edx
8010145c:	d3 e7                	shl    %cl,%edi
8010145e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101461:	c1 fa 03             	sar    $0x3,%edx
80101464:	89 7d d4             	mov    %edi,-0x2c(%ebp)
80101467:	0f b6 74 11 5c       	movzbl 0x5c(%ecx,%edx,1),%esi
8010146c:	89 f1                	mov    %esi,%ecx
8010146e:	0f b6 f9             	movzbl %cl,%edi
80101471:	85 7d d4             	test   %edi,-0x2c(%ebp)
80101474:	74 42                	je     801014b8 <balloc+0xb8>
80101476:	83 c0 01             	add    $0x1,%eax
80101479:	83 c3 01             	add    $0x1,%ebx
8010147c:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101481:	74 05                	je     80101488 <balloc+0x88>
80101483:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
80101486:	72 c8                	jb     80101450 <balloc+0x50>
80101488:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010148b:	89 14 24             	mov    %edx,(%esp)
8010148e:	e8 ad eb ff ff       	call   80100040 <brelse>
80101493:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
8010149a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
8010149d:	39 0d 80 0a 11 80    	cmp    %ecx,0x80110a80
801014a3:	0f 87 77 ff ff ff    	ja     80101420 <balloc+0x20>
801014a9:	c7 04 24 c2 6e 10 80 	movl   $0x80106ec2,(%esp)
801014b0:	e8 fb ee ff ff       	call   801003b0 <panic>
801014b5:	8d 76 00             	lea    0x0(%esi),%esi
801014b8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
801014bb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801014be:	09 f1                	or     %esi,%ecx
801014c0:	88 4c 17 5c          	mov    %cl,0x5c(%edi,%edx,1)
801014c4:	89 3c 24             	mov    %edi,(%esp)
801014c7:	e8 44 15 00 00       	call   80102a10 <log_write>
801014cc:	89 3c 24             	mov    %edi,(%esp)
801014cf:	e8 6c eb ff ff       	call   80100040 <brelse>
801014d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
801014d7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801014db:	89 04 24             	mov    %eax,(%esp)
801014de:	e8 2d ec ff ff       	call   80100110 <bread>
801014e3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801014ea:	00 
801014eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801014f2:	00 
801014f3:	89 c6                	mov    %eax,%esi
801014f5:	83 c0 5c             	add    $0x5c,%eax
801014f8:	89 04 24             	mov    %eax,(%esp)
801014fb:	e8 80 2e 00 00       	call   80104380 <memset>
80101500:	89 34 24             	mov    %esi,(%esp)
80101503:	e8 08 15 00 00       	call   80102a10 <log_write>
80101508:	89 34 24             	mov    %esi,(%esp)
8010150b:	e8 30 eb ff ff       	call   80100040 <brelse>
80101510:	83 c4 3c             	add    $0x3c,%esp
80101513:	89 d8                	mov    %ebx,%eax
80101515:	5b                   	pop    %ebx
80101516:	5e                   	pop    %esi
80101517:	5f                   	pop    %edi
80101518:	5d                   	pop    %ebp
80101519:	c3                   	ret    
8010151a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101520 <bmap>:
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	83 ec 38             	sub    $0x38,%esp
80101526:	83 fa 0b             	cmp    $0xb,%edx
80101529:	89 5d f4             	mov    %ebx,-0xc(%ebp)
8010152c:	89 c3                	mov    %eax,%ebx
8010152e:	89 75 f8             	mov    %esi,-0x8(%ebp)
80101531:	89 7d fc             	mov    %edi,-0x4(%ebp)
80101534:	77 1a                	ja     80101550 <bmap+0x30>
80101536:	8d 7a 14             	lea    0x14(%edx),%edi
80101539:	8b 44 b8 0c          	mov    0xc(%eax,%edi,4),%eax
8010153d:	85 c0                	test   %eax,%eax
8010153f:	74 67                	je     801015a8 <bmap+0x88>
80101541:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101544:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101547:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010154a:	89 ec                	mov    %ebp,%esp
8010154c:	5d                   	pop    %ebp
8010154d:	c3                   	ret    
8010154e:	66 90                	xchg   %ax,%ax
80101550:	8d 7a f4             	lea    -0xc(%edx),%edi
80101553:	83 ff 7f             	cmp    $0x7f,%edi
80101556:	77 6f                	ja     801015c7 <bmap+0xa7>
80101558:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010155e:	85 c0                	test   %eax,%eax
80101560:	74 56                	je     801015b8 <bmap+0x98>
80101562:	89 44 24 04          	mov    %eax,0x4(%esp)
80101566:	8b 03                	mov    (%ebx),%eax
80101568:	89 04 24             	mov    %eax,(%esp)
8010156b:	e8 a0 eb ff ff       	call   80100110 <bread>
80101570:	8d 7c b8 5c          	lea    0x5c(%eax,%edi,4),%edi
80101574:	89 c6                	mov    %eax,%esi
80101576:	8b 07                	mov    (%edi),%eax
80101578:	85 c0                	test   %eax,%eax
8010157a:	75 17                	jne    80101593 <bmap+0x73>
8010157c:	8b 03                	mov    (%ebx),%eax
8010157e:	e8 7d fe ff ff       	call   80101400 <balloc>
80101583:	89 07                	mov    %eax,(%edi)
80101585:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101588:	89 34 24             	mov    %esi,(%esp)
8010158b:	e8 80 14 00 00       	call   80102a10 <log_write>
80101590:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101593:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101596:	89 34 24             	mov    %esi,(%esp)
80101599:	e8 a2 ea ff ff       	call   80100040 <brelse>
8010159e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801015a1:	eb 9e                	jmp    80101541 <bmap+0x21>
801015a3:	90                   	nop
801015a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801015a8:	8b 03                	mov    (%ebx),%eax
801015aa:	e8 51 fe ff ff       	call   80101400 <balloc>
801015af:	89 44 bb 0c          	mov    %eax,0xc(%ebx,%edi,4)
801015b3:	eb 8c                	jmp    80101541 <bmap+0x21>
801015b5:	8d 76 00             	lea    0x0(%esi),%esi
801015b8:	8b 03                	mov    (%ebx),%eax
801015ba:	e8 41 fe ff ff       	call   80101400 <balloc>
801015bf:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
801015c5:	eb 9b                	jmp    80101562 <bmap+0x42>
801015c7:	c7 04 24 d8 6e 10 80 	movl   $0x80106ed8,(%esp)
801015ce:	e8 dd ed ff ff       	call   801003b0 <panic>
801015d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801015d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801015e0 <writei>:
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	83 ec 38             	sub    $0x38,%esp
801015e6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801015e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015ec:	89 75 f8             	mov    %esi,-0x8(%ebp)
801015ef:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801015f2:	89 7d fc             	mov    %edi,-0x4(%ebp)
801015f5:	8b 75 10             	mov    0x10(%ebp),%esi
801015f8:	8b 7d 14             	mov    0x14(%ebp),%edi
801015fb:	66 83 7b 50 03       	cmpw   $0x3,0x50(%ebx)
80101600:	74 1e                	je     80101620 <writei+0x40>
80101602:	39 73 58             	cmp    %esi,0x58(%ebx)
80101605:	73 41                	jae    80101648 <writei+0x68>
80101607:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010160c:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010160f:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101612:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101615:	89 ec                	mov    %ebp,%esp
80101617:	5d                   	pop    %ebp
80101618:	c3                   	ret    
80101619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101620:	0f b7 43 52          	movzwl 0x52(%ebx),%eax
80101624:	66 83 f8 09          	cmp    $0x9,%ax
80101628:	77 dd                	ja     80101607 <writei+0x27>
8010162a:	98                   	cwtl   
8010162b:	8b 04 c5 24 0a 11 80 	mov    -0x7feef5dc(,%eax,8),%eax
80101632:	85 c0                	test   %eax,%eax
80101634:	74 d1                	je     80101607 <writei+0x27>
80101636:	89 7d 10             	mov    %edi,0x10(%ebp)
80101639:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010163c:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010163f:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101642:	89 ec                	mov    %ebp,%esp
80101644:	5d                   	pop    %ebp
80101645:	ff e0                	jmp    *%eax
80101647:	90                   	nop
80101648:	89 f8                	mov    %edi,%eax
8010164a:	01 f0                	add    %esi,%eax
8010164c:	72 b9                	jb     80101607 <writei+0x27>
8010164e:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101653:	77 b2                	ja     80101607 <writei+0x27>
80101655:	85 ff                	test   %edi,%edi
80101657:	0f 84 8a 00 00 00    	je     801016e7 <writei+0x107>
8010165d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101664:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101667:	89 7d dc             	mov    %edi,-0x24(%ebp)
8010166a:	89 f2                	mov    %esi,%edx
8010166c:	89 d8                	mov    %ebx,%eax
8010166e:	c1 ea 09             	shr    $0x9,%edx
80101671:	bf 00 02 00 00       	mov    $0x200,%edi
80101676:	e8 a5 fe ff ff       	call   80101520 <bmap>
8010167b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010167f:	8b 03                	mov    (%ebx),%eax
80101681:	89 04 24             	mov    %eax,(%esp)
80101684:	e8 87 ea ff ff       	call   80100110 <bread>
80101689:	8b 4d dc             	mov    -0x24(%ebp),%ecx
8010168c:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
8010168f:	89 c2                	mov    %eax,%edx
80101691:	89 f0                	mov    %esi,%eax
80101693:	25 ff 01 00 00       	and    $0x1ff,%eax
80101698:	29 c7                	sub    %eax,%edi
8010169a:	39 cf                	cmp    %ecx,%edi
8010169c:	0f 47 f9             	cmova  %ecx,%edi
8010169f:	89 7c 24 08          	mov    %edi,0x8(%esp)
801016a3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801016a6:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801016aa:	89 04 24             	mov    %eax,(%esp)
801016ad:	01 fe                	add    %edi,%esi
801016af:	89 4c 24 04          	mov    %ecx,0x4(%esp)
801016b3:	89 55 d8             	mov    %edx,-0x28(%ebp)
801016b6:	e8 85 2d 00 00       	call   80104440 <memmove>
801016bb:	8b 55 d8             	mov    -0x28(%ebp),%edx
801016be:	89 14 24             	mov    %edx,(%esp)
801016c1:	e8 4a 13 00 00       	call   80102a10 <log_write>
801016c6:	8b 55 d8             	mov    -0x28(%ebp),%edx
801016c9:	89 14 24             	mov    %edx,(%esp)
801016cc:	e8 6f e9 ff ff       	call   80100040 <brelse>
801016d1:	01 7d e4             	add    %edi,-0x1c(%ebp)
801016d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801016d7:	01 7d e0             	add    %edi,-0x20(%ebp)
801016da:	39 45 dc             	cmp    %eax,-0x24(%ebp)
801016dd:	77 8b                	ja     8010166a <writei+0x8a>
801016df:	3b 73 58             	cmp    0x58(%ebx),%esi
801016e2:	8b 7d dc             	mov    -0x24(%ebp),%edi
801016e5:	77 07                	ja     801016ee <writei+0x10e>
801016e7:	89 f8                	mov    %edi,%eax
801016e9:	e9 1e ff ff ff       	jmp    8010160c <writei+0x2c>
801016ee:	89 73 58             	mov    %esi,0x58(%ebx)
801016f1:	89 1c 24             	mov    %ebx,(%esp)
801016f4:	e8 27 fc ff ff       	call   80101320 <iupdate>
801016f9:	89 f8                	mov    %edi,%eax
801016fb:	e9 0c ff ff ff       	jmp    8010160c <writei+0x2c>

80101700 <readi>:
80101700:	55                   	push   %ebp
80101701:	89 e5                	mov    %esp,%ebp
80101703:	83 ec 38             	sub    $0x38,%esp
80101706:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80101709:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010170c:	89 75 f8             	mov    %esi,-0x8(%ebp)
8010170f:	8b 4d 14             	mov    0x14(%ebp),%ecx
80101712:	89 7d fc             	mov    %edi,-0x4(%ebp)
80101715:	8b 75 10             	mov    0x10(%ebp),%esi
80101718:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010171b:	66 83 7b 50 03       	cmpw   $0x3,0x50(%ebx)
80101720:	74 1e                	je     80101740 <readi+0x40>
80101722:	8b 43 58             	mov    0x58(%ebx),%eax
80101725:	39 f0                	cmp    %esi,%eax
80101727:	73 3f                	jae    80101768 <readi+0x68>
80101729:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010172e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101731:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101734:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101737:	89 ec                	mov    %ebp,%esp
80101739:	5d                   	pop    %ebp
8010173a:	c3                   	ret    
8010173b:	90                   	nop
8010173c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101740:	0f b7 43 52          	movzwl 0x52(%ebx),%eax
80101744:	66 83 f8 09          	cmp    $0x9,%ax
80101748:	77 df                	ja     80101729 <readi+0x29>
8010174a:	98                   	cwtl   
8010174b:	8b 04 c5 20 0a 11 80 	mov    -0x7feef5e0(,%eax,8),%eax
80101752:	85 c0                	test   %eax,%eax
80101754:	74 d3                	je     80101729 <readi+0x29>
80101756:	89 4d 10             	mov    %ecx,0x10(%ebp)
80101759:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010175c:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010175f:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101762:	89 ec                	mov    %ebp,%esp
80101764:	5d                   	pop    %ebp
80101765:	ff e0                	jmp    *%eax
80101767:	90                   	nop
80101768:	89 ca                	mov    %ecx,%edx
8010176a:	01 f2                	add    %esi,%edx
8010176c:	89 55 e0             	mov    %edx,-0x20(%ebp)
8010176f:	72 b8                	jb     80101729 <readi+0x29>
80101771:	89 c2                	mov    %eax,%edx
80101773:	29 f2                	sub    %esi,%edx
80101775:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80101778:	0f 42 ca             	cmovb  %edx,%ecx
8010177b:	85 c9                	test   %ecx,%ecx
8010177d:	74 7e                	je     801017fd <readi+0xfd>
8010177f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101786:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101789:	89 4d dc             	mov    %ecx,-0x24(%ebp)
8010178c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101790:	89 f2                	mov    %esi,%edx
80101792:	89 d8                	mov    %ebx,%eax
80101794:	c1 ea 09             	shr    $0x9,%edx
80101797:	bf 00 02 00 00       	mov    $0x200,%edi
8010179c:	e8 7f fd ff ff       	call   80101520 <bmap>
801017a1:	89 44 24 04          	mov    %eax,0x4(%esp)
801017a5:	8b 03                	mov    (%ebx),%eax
801017a7:	89 04 24             	mov    %eax,(%esp)
801017aa:	e8 61 e9 ff ff       	call   80100110 <bread>
801017af:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801017b2:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
801017b5:	89 c2                	mov    %eax,%edx
801017b7:	89 f0                	mov    %esi,%eax
801017b9:	25 ff 01 00 00       	and    $0x1ff,%eax
801017be:	29 c7                	sub    %eax,%edi
801017c0:	39 cf                	cmp    %ecx,%edi
801017c2:	0f 47 f9             	cmova  %ecx,%edi
801017c5:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801017c9:	01 fe                	add    %edi,%esi
801017cb:	89 7c 24 08          	mov    %edi,0x8(%esp)
801017cf:	89 44 24 04          	mov    %eax,0x4(%esp)
801017d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801017d6:	89 04 24             	mov    %eax,(%esp)
801017d9:	89 55 d8             	mov    %edx,-0x28(%ebp)
801017dc:	e8 5f 2c 00 00       	call   80104440 <memmove>
801017e1:	8b 55 d8             	mov    -0x28(%ebp),%edx
801017e4:	89 14 24             	mov    %edx,(%esp)
801017e7:	e8 54 e8 ff ff       	call   80100040 <brelse>
801017ec:	01 7d e4             	add    %edi,-0x1c(%ebp)
801017ef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801017f2:	01 7d e0             	add    %edi,-0x20(%ebp)
801017f5:	39 55 dc             	cmp    %edx,-0x24(%ebp)
801017f8:	77 96                	ja     80101790 <readi+0x90>
801017fa:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801017fd:	89 c8                	mov    %ecx,%eax
801017ff:	e9 2a ff ff ff       	jmp    8010172e <readi+0x2e>
80101804:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010180a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101810 <dirlookup>:
80101810:	55                   	push   %ebp
80101811:	89 e5                	mov    %esp,%ebp
80101813:	57                   	push   %edi
80101814:	56                   	push   %esi
80101815:	53                   	push   %ebx
80101816:	83 ec 2c             	sub    $0x2c,%esp
80101819:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010181c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101821:	0f 85 8c 00 00 00    	jne    801018b3 <dirlookup+0xa3>
80101827:	8b 4b 58             	mov    0x58(%ebx),%ecx
8010182a:	85 c9                	test   %ecx,%ecx
8010182c:	74 4c                	je     8010187a <dirlookup+0x6a>
8010182e:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101831:	31 f6                	xor    %esi,%esi
80101833:	90                   	nop
80101834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101838:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
8010183f:	00 
80101840:	89 74 24 08          	mov    %esi,0x8(%esp)
80101844:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101848:	89 1c 24             	mov    %ebx,(%esp)
8010184b:	e8 b0 fe ff ff       	call   80101700 <readi>
80101850:	83 f8 10             	cmp    $0x10,%eax
80101853:	75 52                	jne    801018a7 <dirlookup+0x97>
80101855:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010185a:	74 16                	je     80101872 <dirlookup+0x62>
8010185c:	8d 45 da             	lea    -0x26(%ebp),%eax
8010185f:	89 44 24 04          	mov    %eax,0x4(%esp)
80101863:	8b 45 0c             	mov    0xc(%ebp),%eax
80101866:	89 04 24             	mov    %eax,(%esp)
80101869:	e8 02 fa ff ff       	call   80101270 <namecmp>
8010186e:	85 c0                	test   %eax,%eax
80101870:	74 16                	je     80101888 <dirlookup+0x78>
80101872:	83 c6 10             	add    $0x10,%esi
80101875:	39 73 58             	cmp    %esi,0x58(%ebx)
80101878:	77 be                	ja     80101838 <dirlookup+0x28>
8010187a:	83 c4 2c             	add    $0x2c,%esp
8010187d:	31 c0                	xor    %eax,%eax
8010187f:	5b                   	pop    %ebx
80101880:	5e                   	pop    %esi
80101881:	5f                   	pop    %edi
80101882:	5d                   	pop    %ebp
80101883:	c3                   	ret    
80101884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101888:	8b 55 10             	mov    0x10(%ebp),%edx
8010188b:	85 d2                	test   %edx,%edx
8010188d:	74 05                	je     80101894 <dirlookup+0x84>
8010188f:	8b 45 10             	mov    0x10(%ebp),%eax
80101892:	89 30                	mov    %esi,(%eax)
80101894:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101898:	8b 03                	mov    (%ebx),%eax
8010189a:	e8 11 f9 ff ff       	call   801011b0 <iget>
8010189f:	83 c4 2c             	add    $0x2c,%esp
801018a2:	5b                   	pop    %ebx
801018a3:	5e                   	pop    %esi
801018a4:	5f                   	pop    %edi
801018a5:	5d                   	pop    %ebp
801018a6:	c3                   	ret    
801018a7:	c7 04 24 fd 6e 10 80 	movl   $0x80106efd,(%esp)
801018ae:	e8 fd ea ff ff       	call   801003b0 <panic>
801018b3:	c7 04 24 eb 6e 10 80 	movl   $0x80106eeb,(%esp)
801018ba:	e8 f1 ea ff ff       	call   801003b0 <panic>
801018bf:	90                   	nop

801018c0 <ialloc>:
801018c0:	55                   	push   %ebp
801018c1:	89 e5                	mov    %esp,%ebp
801018c3:	57                   	push   %edi
801018c4:	56                   	push   %esi
801018c5:	53                   	push   %ebx
801018c6:	83 ec 2c             	sub    $0x2c,%esp
801018c9:	8b 45 08             	mov    0x8(%ebp),%eax
801018cc:	83 3d 88 0a 11 80 01 	cmpl   $0x1,0x80110a88
801018d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018d6:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
801018da:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
801018de:	0f 86 95 00 00 00    	jbe    80101979 <ialloc+0xb9>
801018e4:	be 01 00 00 00       	mov    $0x1,%esi
801018e9:	bb 01 00 00 00       	mov    $0x1,%ebx
801018ee:	eb 15                	jmp    80101905 <ialloc+0x45>
801018f0:	83 c3 01             	add    $0x1,%ebx
801018f3:	89 3c 24             	mov    %edi,(%esp)
801018f6:	89 de                	mov    %ebx,%esi
801018f8:	e8 43 e7 ff ff       	call   80100040 <brelse>
801018fd:	39 1d 88 0a 11 80    	cmp    %ebx,0x80110a88
80101903:	76 74                	jbe    80101979 <ialloc+0xb9>
80101905:	89 f0                	mov    %esi,%eax
80101907:	c1 e8 03             	shr    $0x3,%eax
8010190a:	03 05 94 0a 11 80    	add    0x80110a94,%eax
80101910:	89 44 24 04          	mov    %eax,0x4(%esp)
80101914:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101917:	89 04 24             	mov    %eax,(%esp)
8010191a:	e8 f1 e7 ff ff       	call   80100110 <bread>
8010191f:	89 c7                	mov    %eax,%edi
80101921:	89 f0                	mov    %esi,%eax
80101923:	83 e0 07             	and    $0x7,%eax
80101926:	c1 e0 06             	shl    $0x6,%eax
80101929:	8d 54 07 5c          	lea    0x5c(%edi,%eax,1),%edx
8010192d:	66 83 3a 00          	cmpw   $0x0,(%edx)
80101931:	75 bd                	jne    801018f0 <ialloc+0x30>
80101933:	89 14 24             	mov    %edx,(%esp)
80101936:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
8010193d:	00 
8010193e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80101945:	00 
80101946:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101949:	e8 32 2a 00 00       	call   80104380 <memset>
8010194e:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101951:	0f b7 45 e2          	movzwl -0x1e(%ebp),%eax
80101955:	66 89 02             	mov    %ax,(%edx)
80101958:	89 3c 24             	mov    %edi,(%esp)
8010195b:	e8 b0 10 00 00       	call   80102a10 <log_write>
80101960:	89 3c 24             	mov    %edi,(%esp)
80101963:	e8 d8 e6 ff ff       	call   80100040 <brelse>
80101968:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010196b:	89 f2                	mov    %esi,%edx
8010196d:	83 c4 2c             	add    $0x2c,%esp
80101970:	5b                   	pop    %ebx
80101971:	5e                   	pop    %esi
80101972:	5f                   	pop    %edi
80101973:	5d                   	pop    %ebp
80101974:	e9 37 f8 ff ff       	jmp    801011b0 <iget>
80101979:	c7 04 24 0c 6f 10 80 	movl   $0x80106f0c,(%esp)
80101980:	e8 2b ea ff ff       	call   801003b0 <panic>
80101985:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101990 <ilock>:
80101990:	55                   	push   %ebp
80101991:	89 e5                	mov    %esp,%ebp
80101993:	56                   	push   %esi
80101994:	53                   	push   %ebx
80101995:	83 ec 10             	sub    $0x10,%esp
80101998:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010199b:	85 db                	test   %ebx,%ebx
8010199d:	0f 84 b3 00 00 00    	je     80101a56 <ilock+0xc6>
801019a3:	8b 43 08             	mov    0x8(%ebx),%eax
801019a6:	85 c0                	test   %eax,%eax
801019a8:	0f 8e a8 00 00 00    	jle    80101a56 <ilock+0xc6>
801019ae:	8d 43 0c             	lea    0xc(%ebx),%eax
801019b1:	89 04 24             	mov    %eax,(%esp)
801019b4:	e8 e7 26 00 00       	call   801040a0 <acquiresleep>
801019b9:	8b 73 4c             	mov    0x4c(%ebx),%esi
801019bc:	85 f6                	test   %esi,%esi
801019be:	74 08                	je     801019c8 <ilock+0x38>
801019c0:	83 c4 10             	add    $0x10,%esp
801019c3:	5b                   	pop    %ebx
801019c4:	5e                   	pop    %esi
801019c5:	5d                   	pop    %ebp
801019c6:	c3                   	ret    
801019c7:	90                   	nop
801019c8:	8b 43 04             	mov    0x4(%ebx),%eax
801019cb:	c1 e8 03             	shr    $0x3,%eax
801019ce:	03 05 94 0a 11 80    	add    0x80110a94,%eax
801019d4:	89 44 24 04          	mov    %eax,0x4(%esp)
801019d8:	8b 03                	mov    (%ebx),%eax
801019da:	89 04 24             	mov    %eax,(%esp)
801019dd:	e8 2e e7 ff ff       	call   80100110 <bread>
801019e2:	89 c6                	mov    %eax,%esi
801019e4:	8b 43 04             	mov    0x4(%ebx),%eax
801019e7:	83 e0 07             	and    $0x7,%eax
801019ea:	c1 e0 06             	shl    $0x6,%eax
801019ed:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801019f1:	0f b7 10             	movzwl (%eax),%edx
801019f4:	66 89 53 50          	mov    %dx,0x50(%ebx)
801019f8:	0f b7 50 02          	movzwl 0x2(%eax),%edx
801019fc:	66 89 53 52          	mov    %dx,0x52(%ebx)
80101a00:	0f b7 50 04          	movzwl 0x4(%eax),%edx
80101a04:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101a08:	0f b7 50 06          	movzwl 0x6(%eax),%edx
80101a0c:	66 89 53 56          	mov    %dx,0x56(%ebx)
80101a10:	8b 50 08             	mov    0x8(%eax),%edx
80101a13:	83 c0 0c             	add    $0xc,%eax
80101a16:	89 53 58             	mov    %edx,0x58(%ebx)
80101a19:	89 44 24 04          	mov    %eax,0x4(%esp)
80101a1d:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101a20:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101a27:	00 
80101a28:	89 04 24             	mov    %eax,(%esp)
80101a2b:	e8 10 2a 00 00       	call   80104440 <memmove>
80101a30:	89 34 24             	mov    %esi,(%esp)
80101a33:	e8 08 e6 ff ff       	call   80100040 <brelse>
80101a38:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101a3d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101a44:	0f 85 76 ff ff ff    	jne    801019c0 <ilock+0x30>
80101a4a:	c7 04 24 24 6f 10 80 	movl   $0x80106f24,(%esp)
80101a51:	e8 5a e9 ff ff       	call   801003b0 <panic>
80101a56:	c7 04 24 1e 6f 10 80 	movl   $0x80106f1e,(%esp)
80101a5d:	e8 4e e9 ff ff       	call   801003b0 <panic>
80101a62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101a70 <iput>:
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	83 ec 38             	sub    $0x38,%esp
80101a76:	89 75 f8             	mov    %esi,-0x8(%ebp)
80101a79:	8b 75 08             	mov    0x8(%ebp),%esi
80101a7c:	89 7d fc             	mov    %edi,-0x4(%ebp)
80101a7f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80101a82:	8d 7e 0c             	lea    0xc(%esi),%edi
80101a85:	89 3c 24             	mov    %edi,(%esp)
80101a88:	e8 13 26 00 00       	call   801040a0 <acquiresleep>
80101a8d:	8b 56 4c             	mov    0x4c(%esi),%edx
80101a90:	85 d2                	test   %edx,%edx
80101a92:	74 07                	je     80101a9b <iput+0x2b>
80101a94:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80101a99:	74 35                	je     80101ad0 <iput+0x60>
80101a9b:	89 3c 24             	mov    %edi,(%esp)
80101a9e:	e8 bd 25 00 00       	call   80104060 <releasesleep>
80101aa3:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
80101aaa:	e8 61 28 00 00       	call   80104310 <acquire>
80101aaf:	83 6e 08 01          	subl   $0x1,0x8(%esi)
80101ab3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101ab6:	c7 45 08 a0 0a 11 80 	movl   $0x80110aa0,0x8(%ebp)
80101abd:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101ac0:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101ac3:	89 ec                	mov    %ebp,%esp
80101ac5:	5d                   	pop    %ebp
80101ac6:	e9 f5 27 00 00       	jmp    801042c0 <release>
80101acb:	90                   	nop
80101acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ad0:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
80101ad7:	e8 34 28 00 00       	call   80104310 <acquire>
80101adc:	8b 5e 08             	mov    0x8(%esi),%ebx
80101adf:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
80101ae6:	e8 d5 27 00 00       	call   801042c0 <release>
80101aeb:	83 fb 01             	cmp    $0x1,%ebx
80101aee:	75 ab                	jne    80101a9b <iput+0x2b>
80101af0:	8d 4e 30             	lea    0x30(%esi),%ecx
80101af3:	89 f3                	mov    %esi,%ebx
80101af5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101af8:	89 f7                	mov    %esi,%edi
80101afa:	89 ce                	mov    %ecx,%esi
80101afc:	eb 09                	jmp    80101b07 <iput+0x97>
80101afe:	66 90                	xchg   %ax,%ax
80101b00:	83 c3 04             	add    $0x4,%ebx
80101b03:	39 f3                	cmp    %esi,%ebx
80101b05:	74 19                	je     80101b20 <iput+0xb0>
80101b07:	8b 53 5c             	mov    0x5c(%ebx),%edx
80101b0a:	85 d2                	test   %edx,%edx
80101b0c:	74 f2                	je     80101b00 <iput+0x90>
80101b0e:	8b 07                	mov    (%edi),%eax
80101b10:	e8 8b f7 ff ff       	call   801012a0 <bfree>
80101b15:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
80101b1c:	eb e2                	jmp    80101b00 <iput+0x90>
80101b1e:	66 90                	xchg   %ax,%ax
80101b20:	89 fe                	mov    %edi,%esi
80101b22:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101b25:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101b2b:	85 c0                	test   %eax,%eax
80101b2d:	75 29                	jne    80101b58 <iput+0xe8>
80101b2f:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101b36:	89 34 24             	mov    %esi,(%esp)
80101b39:	e8 e2 f7 ff ff       	call   80101320 <iupdate>
80101b3e:	66 c7 46 50 00 00    	movw   $0x0,0x50(%esi)
80101b44:	89 34 24             	mov    %esi,(%esp)
80101b47:	e8 d4 f7 ff ff       	call   80101320 <iupdate>
80101b4c:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101b53:	e9 43 ff ff ff       	jmp    80101a9b <iput+0x2b>
80101b58:	89 44 24 04          	mov    %eax,0x4(%esp)
80101b5c:	8b 06                	mov    (%esi),%eax
80101b5e:	31 db                	xor    %ebx,%ebx
80101b60:	89 04 24             	mov    %eax,(%esp)
80101b63:	e8 a8 e5 ff ff       	call   80100110 <bread>
80101b68:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101b6b:	89 f7                	mov    %esi,%edi
80101b6d:	89 c1                	mov    %eax,%ecx
80101b6f:	83 c1 5c             	add    $0x5c,%ecx
80101b72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101b75:	89 ce                	mov    %ecx,%esi
80101b77:	31 c0                	xor    %eax,%eax
80101b79:	eb 12                	jmp    80101b8d <iput+0x11d>
80101b7b:	90                   	nop
80101b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b80:	83 c3 01             	add    $0x1,%ebx
80101b83:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
80101b89:	89 d8                	mov    %ebx,%eax
80101b8b:	74 10                	je     80101b9d <iput+0x12d>
80101b8d:	8b 14 86             	mov    (%esi,%eax,4),%edx
80101b90:	85 d2                	test   %edx,%edx
80101b92:	74 ec                	je     80101b80 <iput+0x110>
80101b94:	8b 07                	mov    (%edi),%eax
80101b96:	e8 05 f7 ff ff       	call   801012a0 <bfree>
80101b9b:	eb e3                	jmp    80101b80 <iput+0x110>
80101b9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101ba0:	89 fe                	mov    %edi,%esi
80101ba2:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101ba5:	89 04 24             	mov    %eax,(%esp)
80101ba8:	e8 93 e4 ff ff       	call   80100040 <brelse>
80101bad:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101bb3:	8b 06                	mov    (%esi),%eax
80101bb5:	e8 e6 f6 ff ff       	call   801012a0 <bfree>
80101bba:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101bc1:	00 00 00 
80101bc4:	e9 66 ff ff ff       	jmp    80101b2f <iput+0xbf>
80101bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101bd0 <dirlink>:
80101bd0:	55                   	push   %ebp
80101bd1:	89 e5                	mov    %esp,%ebp
80101bd3:	57                   	push   %edi
80101bd4:	56                   	push   %esi
80101bd5:	53                   	push   %ebx
80101bd6:	83 ec 2c             	sub    $0x2c,%esp
80101bd9:	8b 75 08             	mov    0x8(%ebp),%esi
80101bdc:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bdf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101be6:	00 
80101be7:	89 34 24             	mov    %esi,(%esp)
80101bea:	89 44 24 04          	mov    %eax,0x4(%esp)
80101bee:	e8 1d fc ff ff       	call   80101810 <dirlookup>
80101bf3:	85 c0                	test   %eax,%eax
80101bf5:	0f 85 89 00 00 00    	jne    80101c84 <dirlink+0xb4>
80101bfb:	8b 4e 58             	mov    0x58(%esi),%ecx
80101bfe:	85 c9                	test   %ecx,%ecx
80101c00:	0f 84 8d 00 00 00    	je     80101c93 <dirlink+0xc3>
80101c06:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101c09:	31 db                	xor    %ebx,%ebx
80101c0b:	eb 0b                	jmp    80101c18 <dirlink+0x48>
80101c0d:	8d 76 00             	lea    0x0(%esi),%esi
80101c10:	83 c3 10             	add    $0x10,%ebx
80101c13:	39 5e 58             	cmp    %ebx,0x58(%esi)
80101c16:	76 24                	jbe    80101c3c <dirlink+0x6c>
80101c18:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101c1f:	00 
80101c20:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101c24:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101c28:	89 34 24             	mov    %esi,(%esp)
80101c2b:	e8 d0 fa ff ff       	call   80101700 <readi>
80101c30:	83 f8 10             	cmp    $0x10,%eax
80101c33:	75 65                	jne    80101c9a <dirlink+0xca>
80101c35:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c3a:	75 d4                	jne    80101c10 <dirlink+0x40>
80101c3c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c3f:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101c46:	00 
80101c47:	89 44 24 04          	mov    %eax,0x4(%esp)
80101c4b:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c4e:	89 04 24             	mov    %eax,(%esp)
80101c51:	e8 ba 28 00 00       	call   80104510 <strncpy>
80101c56:	8b 45 10             	mov    0x10(%ebp),%eax
80101c59:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101c60:	00 
80101c61:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101c65:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101c69:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101c6d:	89 34 24             	mov    %esi,(%esp)
80101c70:	e8 6b f9 ff ff       	call   801015e0 <writei>
80101c75:	83 f8 10             	cmp    $0x10,%eax
80101c78:	75 2c                	jne    80101ca6 <dirlink+0xd6>
80101c7a:	31 c0                	xor    %eax,%eax
80101c7c:	83 c4 2c             	add    $0x2c,%esp
80101c7f:	5b                   	pop    %ebx
80101c80:	5e                   	pop    %esi
80101c81:	5f                   	pop    %edi
80101c82:	5d                   	pop    %ebp
80101c83:	c3                   	ret    
80101c84:	89 04 24             	mov    %eax,(%esp)
80101c87:	e8 e4 fd ff ff       	call   80101a70 <iput>
80101c8c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101c91:	eb e9                	jmp    80101c7c <dirlink+0xac>
80101c93:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101c96:	31 db                	xor    %ebx,%ebx
80101c98:	eb a2                	jmp    80101c3c <dirlink+0x6c>
80101c9a:	c7 04 24 33 6f 10 80 	movl   $0x80106f33,(%esp)
80101ca1:	e8 0a e7 ff ff       	call   801003b0 <panic>
80101ca6:	c7 04 24 42 75 10 80 	movl   $0x80107542,(%esp)
80101cad:	e8 fe e6 ff ff       	call   801003b0 <panic>
80101cb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101cc0 <iunlock>:
80101cc0:	55                   	push   %ebp
80101cc1:	89 e5                	mov    %esp,%ebp
80101cc3:	83 ec 18             	sub    $0x18,%esp
80101cc6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80101cc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101ccc:	89 75 fc             	mov    %esi,-0x4(%ebp)
80101ccf:	85 db                	test   %ebx,%ebx
80101cd1:	74 27                	je     80101cfa <iunlock+0x3a>
80101cd3:	8d 73 0c             	lea    0xc(%ebx),%esi
80101cd6:	89 34 24             	mov    %esi,(%esp)
80101cd9:	e8 22 23 00 00       	call   80104000 <holdingsleep>
80101cde:	85 c0                	test   %eax,%eax
80101ce0:	74 18                	je     80101cfa <iunlock+0x3a>
80101ce2:	8b 5b 08             	mov    0x8(%ebx),%ebx
80101ce5:	85 db                	test   %ebx,%ebx
80101ce7:	7e 11                	jle    80101cfa <iunlock+0x3a>
80101ce9:	89 75 08             	mov    %esi,0x8(%ebp)
80101cec:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80101cef:	8b 75 fc             	mov    -0x4(%ebp),%esi
80101cf2:	89 ec                	mov    %ebp,%esp
80101cf4:	5d                   	pop    %ebp
80101cf5:	e9 66 23 00 00       	jmp    80104060 <releasesleep>
80101cfa:	c7 04 24 40 6f 10 80 	movl   $0x80106f40,(%esp)
80101d01:	e8 aa e6 ff ff       	call   801003b0 <panic>
80101d06:	8d 76 00             	lea    0x0(%esi),%esi
80101d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101d10 <iunlockput>:
80101d10:	55                   	push   %ebp
80101d11:	89 e5                	mov    %esp,%ebp
80101d13:	53                   	push   %ebx
80101d14:	83 ec 14             	sub    $0x14,%esp
80101d17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101d1a:	89 1c 24             	mov    %ebx,(%esp)
80101d1d:	e8 9e ff ff ff       	call   80101cc0 <iunlock>
80101d22:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101d25:	83 c4 14             	add    $0x14,%esp
80101d28:	5b                   	pop    %ebx
80101d29:	5d                   	pop    %ebp
80101d2a:	e9 41 fd ff ff       	jmp    80101a70 <iput>
80101d2f:	90                   	nop

80101d30 <namex>:
80101d30:	55                   	push   %ebp
80101d31:	89 e5                	mov    %esp,%ebp
80101d33:	57                   	push   %edi
80101d34:	56                   	push   %esi
80101d35:	53                   	push   %ebx
80101d36:	89 c3                	mov    %eax,%ebx
80101d38:	83 ec 2c             	sub    $0x2c,%esp
80101d3b:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101d3e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d41:	80 38 2f             	cmpb   $0x2f,(%eax)
80101d44:	0f 84 14 01 00 00    	je     80101e5e <namex+0x12e>
80101d4a:	e8 01 1d 00 00       	call   80103a50 <myproc>
80101d4f:	8b 40 68             	mov    0x68(%eax),%eax
80101d52:	89 04 24             	mov    %eax,(%esp)
80101d55:	e8 26 f4 ff ff       	call   80101180 <idup>
80101d5a:	89 c7                	mov    %eax,%edi
80101d5c:	eb 05                	jmp    80101d63 <namex+0x33>
80101d5e:	66 90                	xchg   %ax,%ax
80101d60:	83 c3 01             	add    $0x1,%ebx
80101d63:	0f b6 03             	movzbl (%ebx),%eax
80101d66:	3c 2f                	cmp    $0x2f,%al
80101d68:	74 f6                	je     80101d60 <namex+0x30>
80101d6a:	84 c0                	test   %al,%al
80101d6c:	75 1a                	jne    80101d88 <namex+0x58>
80101d6e:	8b 75 e0             	mov    -0x20(%ebp),%esi
80101d71:	85 f6                	test   %esi,%esi
80101d73:	0f 85 0d 01 00 00    	jne    80101e86 <namex+0x156>
80101d79:	83 c4 2c             	add    $0x2c,%esp
80101d7c:	89 f8                	mov    %edi,%eax
80101d7e:	5b                   	pop    %ebx
80101d7f:	5e                   	pop    %esi
80101d80:	5f                   	pop    %edi
80101d81:	5d                   	pop    %ebp
80101d82:	c3                   	ret    
80101d83:	90                   	nop
80101d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d88:	3c 2f                	cmp    $0x2f,%al
80101d8a:	0f 84 94 00 00 00    	je     80101e24 <namex+0xf4>
80101d90:	89 de                	mov    %ebx,%esi
80101d92:	eb 08                	jmp    80101d9c <namex+0x6c>
80101d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d98:	3c 2f                	cmp    $0x2f,%al
80101d9a:	74 0a                	je     80101da6 <namex+0x76>
80101d9c:	83 c6 01             	add    $0x1,%esi
80101d9f:	0f b6 06             	movzbl (%esi),%eax
80101da2:	84 c0                	test   %al,%al
80101da4:	75 f2                	jne    80101d98 <namex+0x68>
80101da6:	89 f2                	mov    %esi,%edx
80101da8:	29 da                	sub    %ebx,%edx
80101daa:	83 fa 0d             	cmp    $0xd,%edx
80101dad:	7e 79                	jle    80101e28 <namex+0xf8>
80101daf:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101db6:	00 
80101db7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101dbb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101dbe:	89 04 24             	mov    %eax,(%esp)
80101dc1:	e8 7a 26 00 00       	call   80104440 <memmove>
80101dc6:	eb 03                	jmp    80101dcb <namex+0x9b>
80101dc8:	83 c6 01             	add    $0x1,%esi
80101dcb:	80 3e 2f             	cmpb   $0x2f,(%esi)
80101dce:	74 f8                	je     80101dc8 <namex+0x98>
80101dd0:	85 f6                	test   %esi,%esi
80101dd2:	74 9a                	je     80101d6e <namex+0x3e>
80101dd4:	89 3c 24             	mov    %edi,(%esp)
80101dd7:	e8 b4 fb ff ff       	call   80101990 <ilock>
80101ddc:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80101de1:	75 67                	jne    80101e4a <namex+0x11a>
80101de3:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101de6:	85 c0                	test   %eax,%eax
80101de8:	74 0c                	je     80101df6 <namex+0xc6>
80101dea:	80 3e 00             	cmpb   $0x0,(%esi)
80101ded:	8d 76 00             	lea    0x0(%esi),%esi
80101df0:	0f 84 7e 00 00 00    	je     80101e74 <namex+0x144>
80101df6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101dfd:	00 
80101dfe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e01:	89 3c 24             	mov    %edi,(%esp)
80101e04:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e08:	e8 03 fa ff ff       	call   80101810 <dirlookup>
80101e0d:	85 c0                	test   %eax,%eax
80101e0f:	89 c3                	mov    %eax,%ebx
80101e11:	74 37                	je     80101e4a <namex+0x11a>
80101e13:	89 3c 24             	mov    %edi,(%esp)
80101e16:	89 df                	mov    %ebx,%edi
80101e18:	89 f3                	mov    %esi,%ebx
80101e1a:	e8 f1 fe ff ff       	call   80101d10 <iunlockput>
80101e1f:	e9 3f ff ff ff       	jmp    80101d63 <namex+0x33>
80101e24:	89 de                	mov    %ebx,%esi
80101e26:	31 d2                	xor    %edx,%edx
80101e28:	89 54 24 08          	mov    %edx,0x8(%esp)
80101e2c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101e30:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e33:	89 04 24             	mov    %eax,(%esp)
80101e36:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101e39:	e8 02 26 00 00       	call   80104440 <memmove>
80101e3e:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101e41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e44:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
80101e48:	eb 81                	jmp    80101dcb <namex+0x9b>
80101e4a:	89 3c 24             	mov    %edi,(%esp)
80101e4d:	31 ff                	xor    %edi,%edi
80101e4f:	e8 bc fe ff ff       	call   80101d10 <iunlockput>
80101e54:	83 c4 2c             	add    $0x2c,%esp
80101e57:	89 f8                	mov    %edi,%eax
80101e59:	5b                   	pop    %ebx
80101e5a:	5e                   	pop    %esi
80101e5b:	5f                   	pop    %edi
80101e5c:	5d                   	pop    %ebp
80101e5d:	c3                   	ret    
80101e5e:	ba 01 00 00 00       	mov    $0x1,%edx
80101e63:	b8 01 00 00 00       	mov    $0x1,%eax
80101e68:	e8 43 f3 ff ff       	call   801011b0 <iget>
80101e6d:	89 c7                	mov    %eax,%edi
80101e6f:	e9 ef fe ff ff       	jmp    80101d63 <namex+0x33>
80101e74:	89 3c 24             	mov    %edi,(%esp)
80101e77:	e8 44 fe ff ff       	call   80101cc0 <iunlock>
80101e7c:	83 c4 2c             	add    $0x2c,%esp
80101e7f:	89 f8                	mov    %edi,%eax
80101e81:	5b                   	pop    %ebx
80101e82:	5e                   	pop    %esi
80101e83:	5f                   	pop    %edi
80101e84:	5d                   	pop    %ebp
80101e85:	c3                   	ret    
80101e86:	89 3c 24             	mov    %edi,(%esp)
80101e89:	31 ff                	xor    %edi,%edi
80101e8b:	e8 e0 fb ff ff       	call   80101a70 <iput>
80101e90:	e9 e4 fe ff ff       	jmp    80101d79 <namex+0x49>
80101e95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ea0 <nameiparent>:
80101ea0:	55                   	push   %ebp
80101ea1:	ba 01 00 00 00       	mov    $0x1,%edx
80101ea6:	89 e5                	mov    %esp,%ebp
80101ea8:	83 ec 08             	sub    $0x8,%esp
80101eab:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eae:	8b 45 08             	mov    0x8(%ebp),%eax
80101eb1:	c9                   	leave  
80101eb2:	e9 79 fe ff ff       	jmp    80101d30 <namex>
80101eb7:	89 f6                	mov    %esi,%esi
80101eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ec0 <namei>:
80101ec0:	55                   	push   %ebp
80101ec1:	31 d2                	xor    %edx,%edx
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	83 ec 18             	sub    $0x18,%esp
80101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ecb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ece:	e8 5d fe ff ff       	call   80101d30 <namex>
80101ed3:	c9                   	leave  
80101ed4:	c3                   	ret    
80101ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <iinit>:
80101ee0:	55                   	push   %ebp
80101ee1:	89 e5                	mov    %esp,%ebp
80101ee3:	53                   	push   %ebx
80101ee4:	31 db                	xor    %ebx,%ebx
80101ee6:	83 ec 24             	sub    $0x24,%esp
80101ee9:	c7 44 24 04 48 6f 10 	movl   $0x80106f48,0x4(%esp)
80101ef0:	80 
80101ef1:	c7 04 24 a0 0a 11 80 	movl   $0x80110aa0,(%esp)
80101ef8:	e8 43 22 00 00       	call   80104140 <initlock>
80101efd:	8d 76 00             	lea    0x0(%esi),%esi
80101f00:	8d 04 db             	lea    (%ebx,%ebx,8),%eax
80101f03:	83 c3 01             	add    $0x1,%ebx
80101f06:	c1 e0 04             	shl    $0x4,%eax
80101f09:	05 e0 0a 11 80       	add    $0x80110ae0,%eax
80101f0e:	c7 44 24 04 4f 6f 10 	movl   $0x80106f4f,0x4(%esp)
80101f15:	80 
80101f16:	89 04 24             	mov    %eax,(%esp)
80101f19:	e8 e2 21 00 00       	call   80104100 <initsleeplock>
80101f1e:	83 fb 32             	cmp    $0x32,%ebx
80101f21:	75 dd                	jne    80101f00 <iinit+0x20>
80101f23:	8b 45 08             	mov    0x8(%ebp),%eax
80101f26:	c7 44 24 04 80 0a 11 	movl   $0x80110a80,0x4(%esp)
80101f2d:	80 
80101f2e:	89 04 24             	mov    %eax,(%esp)
80101f31:	e8 7a f4 ff ff       	call   801013b0 <readsb>
80101f36:	a1 98 0a 11 80       	mov    0x80110a98,%eax
80101f3b:	c7 04 24 58 6f 10 80 	movl   $0x80106f58,(%esp)
80101f42:	89 44 24 1c          	mov    %eax,0x1c(%esp)
80101f46:	a1 94 0a 11 80       	mov    0x80110a94,%eax
80101f4b:	89 44 24 18          	mov    %eax,0x18(%esp)
80101f4f:	a1 90 0a 11 80       	mov    0x80110a90,%eax
80101f54:	89 44 24 14          	mov    %eax,0x14(%esp)
80101f58:	a1 8c 0a 11 80       	mov    0x80110a8c,%eax
80101f5d:	89 44 24 10          	mov    %eax,0x10(%esp)
80101f61:	a1 88 0a 11 80       	mov    0x80110a88,%eax
80101f66:	89 44 24 0c          	mov    %eax,0xc(%esp)
80101f6a:	a1 84 0a 11 80       	mov    0x80110a84,%eax
80101f6f:	89 44 24 08          	mov    %eax,0x8(%esp)
80101f73:	a1 80 0a 11 80       	mov    0x80110a80,%eax
80101f78:	89 44 24 04          	mov    %eax,0x4(%esp)
80101f7c:	e8 cf e8 ff ff       	call   80100850 <cprintf>
80101f81:	83 c4 24             	add    $0x24,%esp
80101f84:	5b                   	pop    %ebx
80101f85:	5d                   	pop    %ebp
80101f86:	c3                   	ret    
80101f87:	66 90                	xchg   %ax,%ax
80101f89:	66 90                	xchg   %ax,%ax
80101f8b:	66 90                	xchg   %ax,%ax
80101f8d:	66 90                	xchg   %ax,%ax
80101f8f:	90                   	nop

80101f90 <idestart>:
80101f90:	55                   	push   %ebp
80101f91:	89 c1                	mov    %eax,%ecx
80101f93:	89 e5                	mov    %esp,%ebp
80101f95:	56                   	push   %esi
80101f96:	53                   	push   %ebx
80101f97:	83 ec 10             	sub    $0x10,%esp
80101f9a:	85 c0                	test   %eax,%eax
80101f9c:	0f 84 99 00 00 00    	je     8010203b <idestart+0xab>
80101fa2:	8b 58 08             	mov    0x8(%eax),%ebx
80101fa5:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101fab:	0f 87 7e 00 00 00    	ja     8010202f <idestart+0x9f>
80101fb1:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fb6:	66 90                	xchg   %ax,%ax
80101fb8:	ec                   	in     (%dx),%al
80101fb9:	25 c0 00 00 00       	and    $0xc0,%eax
80101fbe:	83 f8 40             	cmp    $0x40,%eax
80101fc1:	75 f5                	jne    80101fb8 <idestart+0x28>
80101fc3:	31 f6                	xor    %esi,%esi
80101fc5:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101fca:	89 f0                	mov    %esi,%eax
80101fcc:	ee                   	out    %al,(%dx)
80101fcd:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101fd2:	b8 01 00 00 00       	mov    $0x1,%eax
80101fd7:	ee                   	out    %al,(%dx)
80101fd8:	b2 f3                	mov    $0xf3,%dl
80101fda:	89 d8                	mov    %ebx,%eax
80101fdc:	ee                   	out    %al,(%dx)
80101fdd:	89 d8                	mov    %ebx,%eax
80101fdf:	b2 f4                	mov    $0xf4,%dl
80101fe1:	c1 f8 08             	sar    $0x8,%eax
80101fe4:	ee                   	out    %al,(%dx)
80101fe5:	b2 f5                	mov    $0xf5,%dl
80101fe7:	89 f0                	mov    %esi,%eax
80101fe9:	ee                   	out    %al,(%dx)
80101fea:	8b 41 04             	mov    0x4(%ecx),%eax
80101fed:	b2 f6                	mov    $0xf6,%dl
80101fef:	83 e0 01             	and    $0x1,%eax
80101ff2:	c1 e0 04             	shl    $0x4,%eax
80101ff5:	83 c8 e0             	or     $0xffffffe0,%eax
80101ff8:	ee                   	out    %al,(%dx)
80101ff9:	f6 01 04             	testb  $0x4,(%ecx)
80101ffc:	75 12                	jne    80102010 <idestart+0x80>
80101ffe:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102003:	b8 20 00 00 00       	mov    $0x20,%eax
80102008:	ee                   	out    %al,(%dx)
80102009:	83 c4 10             	add    $0x10,%esp
8010200c:	5b                   	pop    %ebx
8010200d:	5e                   	pop    %esi
8010200e:	5d                   	pop    %ebp
8010200f:	c3                   	ret    
80102010:	b2 f7                	mov    $0xf7,%dl
80102012:	b8 30 00 00 00       	mov    $0x30,%eax
80102017:	ee                   	out    %al,(%dx)
80102018:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010201d:	8d 71 5c             	lea    0x5c(%ecx),%esi
80102020:	b9 80 00 00 00       	mov    $0x80,%ecx
80102025:	fc                   	cld    
80102026:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80102028:	83 c4 10             	add    $0x10,%esp
8010202b:	5b                   	pop    %ebx
8010202c:	5e                   	pop    %esi
8010202d:	5d                   	pop    %ebp
8010202e:	c3                   	ret    
8010202f:	c7 04 24 b4 6f 10 80 	movl   $0x80106fb4,(%esp)
80102036:	e8 75 e3 ff ff       	call   801003b0 <panic>
8010203b:	c7 04 24 ab 6f 10 80 	movl   $0x80106fab,(%esp)
80102042:	e8 69 e3 ff ff       	call   801003b0 <panic>
80102047:	89 f6                	mov    %esi,%esi
80102049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102050 <iderw>:
80102050:	55                   	push   %ebp
80102051:	89 e5                	mov    %esp,%ebp
80102053:	53                   	push   %ebx
80102054:	83 ec 14             	sub    $0x14,%esp
80102057:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010205a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010205d:	89 04 24             	mov    %eax,(%esp)
80102060:	e8 9b 1f 00 00       	call   80104000 <holdingsleep>
80102065:	85 c0                	test   %eax,%eax
80102067:	0f 84 8f 00 00 00    	je     801020fc <iderw+0xac>
8010206d:	8b 03                	mov    (%ebx),%eax
8010206f:	83 e0 06             	and    $0x6,%eax
80102072:	83 f8 02             	cmp    $0x2,%eax
80102075:	0f 84 99 00 00 00    	je     80102114 <iderw+0xc4>
8010207b:	8b 53 04             	mov    0x4(%ebx),%edx
8010207e:	85 d2                	test   %edx,%edx
80102080:	74 09                	je     8010208b <iderw+0x3b>
80102082:	a1 58 a6 10 80       	mov    0x8010a658,%eax
80102087:	85 c0                	test   %eax,%eax
80102089:	74 7d                	je     80102108 <iderw+0xb8>
8010208b:	c7 04 24 20 a6 10 80 	movl   $0x8010a620,(%esp)
80102092:	e8 79 22 00 00       	call   80104310 <acquire>
80102097:	ba 54 a6 10 80       	mov    $0x8010a654,%edx
8010209c:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801020a3:	a1 54 a6 10 80       	mov    0x8010a654,%eax
801020a8:	85 c0                	test   %eax,%eax
801020aa:	74 0e                	je     801020ba <iderw+0x6a>
801020ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801020b0:	8d 50 58             	lea    0x58(%eax),%edx
801020b3:	8b 40 58             	mov    0x58(%eax),%eax
801020b6:	85 c0                	test   %eax,%eax
801020b8:	75 f6                	jne    801020b0 <iderw+0x60>
801020ba:	89 1a                	mov    %ebx,(%edx)
801020bc:	39 1d 54 a6 10 80    	cmp    %ebx,0x8010a654
801020c2:	75 14                	jne    801020d8 <iderw+0x88>
801020c4:	eb 2d                	jmp    801020f3 <iderw+0xa3>
801020c6:	66 90                	xchg   %ax,%ax
801020c8:	c7 44 24 04 20 a6 10 	movl   $0x8010a620,0x4(%esp)
801020cf:	80 
801020d0:	89 1c 24             	mov    %ebx,(%esp)
801020d3:	e8 d8 1b 00 00       	call   80103cb0 <sleep>
801020d8:	8b 03                	mov    (%ebx),%eax
801020da:	83 e0 06             	and    $0x6,%eax
801020dd:	83 f8 02             	cmp    $0x2,%eax
801020e0:	75 e6                	jne    801020c8 <iderw+0x78>
801020e2:	c7 45 08 20 a6 10 80 	movl   $0x8010a620,0x8(%ebp)
801020e9:	83 c4 14             	add    $0x14,%esp
801020ec:	5b                   	pop    %ebx
801020ed:	5d                   	pop    %ebp
801020ee:	e9 cd 21 00 00       	jmp    801042c0 <release>
801020f3:	89 d8                	mov    %ebx,%eax
801020f5:	e8 96 fe ff ff       	call   80101f90 <idestart>
801020fa:	eb dc                	jmp    801020d8 <iderw+0x88>
801020fc:	c7 04 24 c6 6f 10 80 	movl   $0x80106fc6,(%esp)
80102103:	e8 a8 e2 ff ff       	call   801003b0 <panic>
80102108:	c7 04 24 f1 6f 10 80 	movl   $0x80106ff1,(%esp)
8010210f:	e8 9c e2 ff ff       	call   801003b0 <panic>
80102114:	c7 04 24 dc 6f 10 80 	movl   $0x80106fdc,(%esp)
8010211b:	e8 90 e2 ff ff       	call   801003b0 <panic>

80102120 <ideintr>:
80102120:	55                   	push   %ebp
80102121:	89 e5                	mov    %esp,%ebp
80102123:	57                   	push   %edi
80102124:	53                   	push   %ebx
80102125:	83 ec 10             	sub    $0x10,%esp
80102128:	c7 04 24 20 a6 10 80 	movl   $0x8010a620,(%esp)
8010212f:	e8 dc 21 00 00       	call   80104310 <acquire>
80102134:	8b 1d 54 a6 10 80    	mov    0x8010a654,%ebx
8010213a:	85 db                	test   %ebx,%ebx
8010213c:	74 2d                	je     8010216b <ideintr+0x4b>
8010213e:	8b 43 58             	mov    0x58(%ebx),%eax
80102141:	a3 54 a6 10 80       	mov    %eax,0x8010a654
80102146:	8b 0b                	mov    (%ebx),%ecx
80102148:	f6 c1 04             	test   $0x4,%cl
8010214b:	74 33                	je     80102180 <ideintr+0x60>
8010214d:	83 c9 02             	or     $0x2,%ecx
80102150:	83 e1 fb             	and    $0xfffffffb,%ecx
80102153:	89 0b                	mov    %ecx,(%ebx)
80102155:	89 1c 24             	mov    %ebx,(%esp)
80102158:	e8 43 15 00 00       	call   801036a0 <wakeup>
8010215d:	a1 54 a6 10 80       	mov    0x8010a654,%eax
80102162:	85 c0                	test   %eax,%eax
80102164:	74 05                	je     8010216b <ideintr+0x4b>
80102166:	e8 25 fe ff ff       	call   80101f90 <idestart>
8010216b:	c7 04 24 20 a6 10 80 	movl   $0x8010a620,(%esp)
80102172:	e8 49 21 00 00       	call   801042c0 <release>
80102177:	83 c4 10             	add    $0x10,%esp
8010217a:	5b                   	pop    %ebx
8010217b:	5f                   	pop    %edi
8010217c:	5d                   	pop    %ebp
8010217d:	c3                   	ret    
8010217e:	66 90                	xchg   %ax,%ax
80102180:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102185:	8d 76 00             	lea    0x0(%esi),%esi
80102188:	ec                   	in     (%dx),%al
80102189:	0f b6 c0             	movzbl %al,%eax
8010218c:	89 c7                	mov    %eax,%edi
8010218e:	81 e7 c0 00 00 00    	and    $0xc0,%edi
80102194:	83 ff 40             	cmp    $0x40,%edi
80102197:	75 ef                	jne    80102188 <ideintr+0x68>
80102199:	a8 21                	test   $0x21,%al
8010219b:	75 b0                	jne    8010214d <ideintr+0x2d>
8010219d:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801021a0:	b9 80 00 00 00       	mov    $0x80,%ecx
801021a5:	ba f0 01 00 00       	mov    $0x1f0,%edx
801021aa:	fc                   	cld    
801021ab:	f3 6d                	rep insl (%dx),%es:(%edi)
801021ad:	8b 0b                	mov    (%ebx),%ecx
801021af:	eb 9c                	jmp    8010214d <ideintr+0x2d>
801021b1:	eb 0d                	jmp    801021c0 <ideinit>
801021b3:	90                   	nop
801021b4:	90                   	nop
801021b5:	90                   	nop
801021b6:	90                   	nop
801021b7:	90                   	nop
801021b8:	90                   	nop
801021b9:	90                   	nop
801021ba:	90                   	nop
801021bb:	90                   	nop
801021bc:	90                   	nop
801021bd:	90                   	nop
801021be:	90                   	nop
801021bf:	90                   	nop

801021c0 <ideinit>:
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	83 ec 18             	sub    $0x18,%esp
801021c6:	c7 44 24 04 0f 70 10 	movl   $0x8010700f,0x4(%esp)
801021cd:	80 
801021ce:	c7 04 24 20 a6 10 80 	movl   $0x8010a620,(%esp)
801021d5:	e8 66 1f 00 00       	call   80104140 <initlock>
801021da:	a1 c0 2d 11 80       	mov    0x80112dc0,%eax
801021df:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
801021e6:	83 e8 01             	sub    $0x1,%eax
801021e9:	89 44 24 04          	mov    %eax,0x4(%esp)
801021ed:	e8 4e 00 00 00       	call   80102240 <ioapicenable>
801021f2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021f7:	90                   	nop
801021f8:	ec                   	in     (%dx),%al
801021f9:	25 c0 00 00 00       	and    $0xc0,%eax
801021fe:	83 f8 40             	cmp    $0x40,%eax
80102201:	75 f5                	jne    801021f8 <ideinit+0x38>
80102203:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102208:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010220d:	ee                   	out    %al,(%dx)
8010220e:	31 c9                	xor    %ecx,%ecx
80102210:	b2 f7                	mov    $0xf7,%dl
80102212:	eb 0f                	jmp    80102223 <ideinit+0x63>
80102214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102218:	83 c1 01             	add    $0x1,%ecx
8010221b:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
80102221:	74 0f                	je     80102232 <ideinit+0x72>
80102223:	ec                   	in     (%dx),%al
80102224:	84 c0                	test   %al,%al
80102226:	74 f0                	je     80102218 <ideinit+0x58>
80102228:	c7 05 58 a6 10 80 01 	movl   $0x1,0x8010a658
8010222f:	00 00 00 
80102232:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102237:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010223c:	ee                   	out    %al,(%dx)
8010223d:	c9                   	leave  
8010223e:	c3                   	ret    
8010223f:	90                   	nop

80102240 <ioapicenable>:
80102240:	55                   	push   %ebp
80102241:	8b 0d f4 26 11 80    	mov    0x801126f4,%ecx
80102247:	89 e5                	mov    %esp,%ebp
80102249:	8b 55 08             	mov    0x8(%ebp),%edx
8010224c:	53                   	push   %ebx
8010224d:	8b 45 0c             	mov    0xc(%ebp),%eax
80102250:	8d 5a 20             	lea    0x20(%edx),%ebx
80102253:	8d 54 12 10          	lea    0x10(%edx,%edx,1),%edx
80102257:	89 11                	mov    %edx,(%ecx)
80102259:	8b 0d f4 26 11 80    	mov    0x801126f4,%ecx
8010225f:	83 c2 01             	add    $0x1,%edx
80102262:	c1 e0 18             	shl    $0x18,%eax
80102265:	89 59 10             	mov    %ebx,0x10(%ecx)
80102268:	8b 0d f4 26 11 80    	mov    0x801126f4,%ecx
8010226e:	89 11                	mov    %edx,(%ecx)
80102270:	8b 15 f4 26 11 80    	mov    0x801126f4,%edx
80102276:	89 42 10             	mov    %eax,0x10(%edx)
80102279:	5b                   	pop    %ebx
8010227a:	5d                   	pop    %ebp
8010227b:	c3                   	ret    
8010227c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102280 <ioapicinit>:
80102280:	55                   	push   %ebp
80102281:	89 e5                	mov    %esp,%ebp
80102283:	56                   	push   %esi
80102284:	53                   	push   %ebx
80102285:	bb 00 00 c0 fe       	mov    $0xfec00000,%ebx
8010228a:	83 ec 10             	sub    $0x10,%esp
8010228d:	0f b6 15 20 28 11 80 	movzbl 0x80112820,%edx
80102294:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
8010229b:	00 00 00 
8010229e:	8b 35 10 00 c0 fe    	mov    0xfec00010,%esi
801022a4:	c7 05 00 00 c0 fe 00 	movl   $0x0,0xfec00000
801022ab:	00 00 00 
801022ae:	a1 10 00 c0 fe       	mov    0xfec00010,%eax
801022b3:	c7 05 f4 26 11 80 00 	movl   $0xfec00000,0x801126f4
801022ba:	00 c0 fe 
801022bd:	c1 ee 10             	shr    $0x10,%esi
801022c0:	c1 e8 18             	shr    $0x18,%eax
801022c3:	81 e6 ff 00 00 00    	and    $0xff,%esi
801022c9:	39 c2                	cmp    %eax,%edx
801022cb:	74 12                	je     801022df <ioapicinit+0x5f>
801022cd:	c7 04 24 14 70 10 80 	movl   $0x80107014,(%esp)
801022d4:	e8 77 e5 ff ff       	call   80100850 <cprintf>
801022d9:	8b 1d f4 26 11 80    	mov    0x801126f4,%ebx
801022df:	ba 10 00 00 00       	mov    $0x10,%edx
801022e4:	31 c0                	xor    %eax,%eax
801022e6:	eb 06                	jmp    801022ee <ioapicinit+0x6e>
801022e8:	8b 1d f4 26 11 80    	mov    0x801126f4,%ebx
801022ee:	89 13                	mov    %edx,(%ebx)
801022f0:	8b 1d f4 26 11 80    	mov    0x801126f4,%ebx
801022f6:	8d 48 20             	lea    0x20(%eax),%ecx
801022f9:	81 c9 00 00 01 00    	or     $0x10000,%ecx
801022ff:	83 c0 01             	add    $0x1,%eax
80102302:	89 4b 10             	mov    %ecx,0x10(%ebx)
80102305:	8b 0d f4 26 11 80    	mov    0x801126f4,%ecx
8010230b:	8d 5a 01             	lea    0x1(%edx),%ebx
8010230e:	83 c2 02             	add    $0x2,%edx
80102311:	39 c6                	cmp    %eax,%esi
80102313:	89 19                	mov    %ebx,(%ecx)
80102315:	8b 0d f4 26 11 80    	mov    0x801126f4,%ecx
8010231b:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
80102322:	7d c4                	jge    801022e8 <ioapicinit+0x68>
80102324:	83 c4 10             	add    $0x10,%esp
80102327:	5b                   	pop    %ebx
80102328:	5e                   	pop    %esi
80102329:	5d                   	pop    %ebp
8010232a:	c3                   	ret    
8010232b:	66 90                	xchg   %ax,%ax
8010232d:	66 90                	xchg   %ax,%ax
8010232f:	90                   	nop

80102330 <kalloc>:
80102330:	55                   	push   %ebp
80102331:	89 e5                	mov    %esp,%ebp
80102333:	53                   	push   %ebx
80102334:	83 ec 14             	sub    $0x14,%esp
80102337:	8b 15 34 27 11 80    	mov    0x80112734,%edx
8010233d:	85 d2                	test   %edx,%edx
8010233f:	75 2f                	jne    80102370 <kalloc+0x40>
80102341:	8b 1d 38 27 11 80    	mov    0x80112738,%ebx
80102347:	85 db                	test   %ebx,%ebx
80102349:	74 07                	je     80102352 <kalloc+0x22>
8010234b:	8b 03                	mov    (%ebx),%eax
8010234d:	a3 38 27 11 80       	mov    %eax,0x80112738
80102352:	a1 34 27 11 80       	mov    0x80112734,%eax
80102357:	85 c0                	test   %eax,%eax
80102359:	74 0c                	je     80102367 <kalloc+0x37>
8010235b:	c7 04 24 00 27 11 80 	movl   $0x80112700,(%esp)
80102362:	e8 59 1f 00 00       	call   801042c0 <release>
80102367:	89 d8                	mov    %ebx,%eax
80102369:	83 c4 14             	add    $0x14,%esp
8010236c:	5b                   	pop    %ebx
8010236d:	5d                   	pop    %ebp
8010236e:	c3                   	ret    
8010236f:	90                   	nop
80102370:	c7 04 24 00 27 11 80 	movl   $0x80112700,(%esp)
80102377:	e8 94 1f 00 00       	call   80104310 <acquire>
8010237c:	eb c3                	jmp    80102341 <kalloc+0x11>
8010237e:	66 90                	xchg   %ax,%ax

80102380 <kfree>:
80102380:	55                   	push   %ebp
80102381:	89 e5                	mov    %esp,%ebp
80102383:	53                   	push   %ebx
80102384:	83 ec 14             	sub    $0x14,%esp
80102387:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010238a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102390:	75 7c                	jne    8010240e <kfree+0x8e>
80102392:	81 fb 68 55 11 80    	cmp    $0x80115568,%ebx
80102398:	72 74                	jb     8010240e <kfree+0x8e>
8010239a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801023a0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801023a5:	77 67                	ja     8010240e <kfree+0x8e>
801023a7:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801023ae:	00 
801023af:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801023b6:	00 
801023b7:	89 1c 24             	mov    %ebx,(%esp)
801023ba:	e8 c1 1f 00 00       	call   80104380 <memset>
801023bf:	a1 34 27 11 80       	mov    0x80112734,%eax
801023c4:	85 c0                	test   %eax,%eax
801023c6:	75 38                	jne    80102400 <kfree+0x80>
801023c8:	a1 38 27 11 80       	mov    0x80112738,%eax
801023cd:	89 03                	mov    %eax,(%ebx)
801023cf:	8b 0d 34 27 11 80    	mov    0x80112734,%ecx
801023d5:	89 1d 38 27 11 80    	mov    %ebx,0x80112738
801023db:	85 c9                	test   %ecx,%ecx
801023dd:	75 09                	jne    801023e8 <kfree+0x68>
801023df:	83 c4 14             	add    $0x14,%esp
801023e2:	5b                   	pop    %ebx
801023e3:	5d                   	pop    %ebp
801023e4:	c3                   	ret    
801023e5:	8d 76 00             	lea    0x0(%esi),%esi
801023e8:	c7 45 08 00 27 11 80 	movl   $0x80112700,0x8(%ebp)
801023ef:	83 c4 14             	add    $0x14,%esp
801023f2:	5b                   	pop    %ebx
801023f3:	5d                   	pop    %ebp
801023f4:	e9 c7 1e 00 00       	jmp    801042c0 <release>
801023f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102400:	c7 04 24 00 27 11 80 	movl   $0x80112700,(%esp)
80102407:	e8 04 1f 00 00       	call   80104310 <acquire>
8010240c:	eb ba                	jmp    801023c8 <kfree+0x48>
8010240e:	c7 04 24 46 70 10 80 	movl   $0x80107046,(%esp)
80102415:	e8 96 df ff ff       	call   801003b0 <panic>
8010241a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102420 <freerange>:
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	56                   	push   %esi
80102424:	53                   	push   %ebx
80102425:	83 ec 10             	sub    $0x10,%esp
80102428:	8b 55 08             	mov    0x8(%ebp),%edx
8010242b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010242e:	81 c2 ff 0f 00 00    	add    $0xfff,%edx
80102434:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
8010243a:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
80102440:	39 f3                	cmp    %esi,%ebx
80102442:	76 08                	jbe    8010244c <freerange+0x2c>
80102444:	eb 18                	jmp    8010245e <freerange+0x3e>
80102446:	66 90                	xchg   %ax,%ax
80102448:	89 da                	mov    %ebx,%edx
8010244a:	89 c3                	mov    %eax,%ebx
8010244c:	89 14 24             	mov    %edx,(%esp)
8010244f:	e8 2c ff ff ff       	call   80102380 <kfree>
80102454:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010245a:	39 f0                	cmp    %esi,%eax
8010245c:	76 ea                	jbe    80102448 <freerange+0x28>
8010245e:	83 c4 10             	add    $0x10,%esp
80102461:	5b                   	pop    %ebx
80102462:	5e                   	pop    %esi
80102463:	5d                   	pop    %ebp
80102464:	c3                   	ret    
80102465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	83 ec 18             	sub    $0x18,%esp
80102476:	8b 45 0c             	mov    0xc(%ebp),%eax
80102479:	89 44 24 04          	mov    %eax,0x4(%esp)
8010247d:	8b 45 08             	mov    0x8(%ebp),%eax
80102480:	89 04 24             	mov    %eax,(%esp)
80102483:	e8 98 ff ff ff       	call   80102420 <freerange>
80102488:	c7 05 34 27 11 80 01 	movl   $0x1,0x80112734
8010248f:	00 00 00 
80102492:	c9                   	leave  
80102493:	c3                   	ret    
80102494:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010249a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801024a0 <kinit1>:
801024a0:	55                   	push   %ebp
801024a1:	89 e5                	mov    %esp,%ebp
801024a3:	83 ec 18             	sub    $0x18,%esp
801024a6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801024a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801024ac:	89 75 fc             	mov    %esi,-0x4(%ebp)
801024af:	8b 75 0c             	mov    0xc(%ebp),%esi
801024b2:	c7 44 24 04 4c 70 10 	movl   $0x8010704c,0x4(%esp)
801024b9:	80 
801024ba:	c7 04 24 00 27 11 80 	movl   $0x80112700,(%esp)
801024c1:	e8 7a 1c 00 00       	call   80104140 <initlock>
801024c6:	c7 05 34 27 11 80 00 	movl   $0x0,0x80112734
801024cd:	00 00 00 
801024d0:	89 75 0c             	mov    %esi,0xc(%ebp)
801024d3:	8b 75 fc             	mov    -0x4(%ebp),%esi
801024d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801024d9:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801024dc:	89 ec                	mov    %ebp,%esp
801024de:	5d                   	pop    %ebp
801024df:	e9 3c ff ff ff       	jmp    80102420 <freerange>
801024e4:	66 90                	xchg   %ax,%ax
801024e6:	66 90                	xchg   %ax,%ax
801024e8:	66 90                	xchg   %ax,%ax
801024ea:	66 90                	xchg   %ax,%ax
801024ec:	66 90                	xchg   %ax,%ax
801024ee:	66 90                	xchg   %ax,%ax

801024f0 <kbdgetc>:
801024f0:	55                   	push   %ebp
801024f1:	ba 64 00 00 00       	mov    $0x64,%edx
801024f6:	89 e5                	mov    %esp,%ebp
801024f8:	ec                   	in     (%dx),%al
801024f9:	89 c2                	mov    %eax,%edx
801024fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102500:	83 e2 01             	and    $0x1,%edx
80102503:	74 41                	je     80102546 <kbdgetc+0x56>
80102505:	ba 60 00 00 00       	mov    $0x60,%edx
8010250a:	ec                   	in     (%dx),%al
8010250b:	0f b6 c0             	movzbl %al,%eax
8010250e:	3d e0 00 00 00       	cmp    $0xe0,%eax
80102513:	0f 84 7f 00 00 00    	je     80102598 <kbdgetc+0xa8>
80102519:	84 c0                	test   %al,%al
8010251b:	79 2b                	jns    80102548 <kbdgetc+0x58>
8010251d:	8b 15 5c a6 10 80    	mov    0x8010a65c,%edx
80102523:	89 c1                	mov    %eax,%ecx
80102525:	83 e1 7f             	and    $0x7f,%ecx
80102528:	f6 c2 40             	test   $0x40,%dl
8010252b:	0f 44 c1             	cmove  %ecx,%eax
8010252e:	0f b6 80 60 70 10 80 	movzbl -0x7fef8fa0(%eax),%eax
80102535:	83 c8 40             	or     $0x40,%eax
80102538:	0f b6 c0             	movzbl %al,%eax
8010253b:	f7 d0                	not    %eax
8010253d:	21 d0                	and    %edx,%eax
8010253f:	a3 5c a6 10 80       	mov    %eax,0x8010a65c
80102544:	31 c0                	xor    %eax,%eax
80102546:	5d                   	pop    %ebp
80102547:	c3                   	ret    
80102548:	8b 0d 5c a6 10 80    	mov    0x8010a65c,%ecx
8010254e:	f6 c1 40             	test   $0x40,%cl
80102551:	74 05                	je     80102558 <kbdgetc+0x68>
80102553:	0c 80                	or     $0x80,%al
80102555:	83 e1 bf             	and    $0xffffffbf,%ecx
80102558:	0f b6 90 60 70 10 80 	movzbl -0x7fef8fa0(%eax),%edx
8010255f:	09 ca                	or     %ecx,%edx
80102561:	0f b6 88 60 71 10 80 	movzbl -0x7fef8ea0(%eax),%ecx
80102568:	31 ca                	xor    %ecx,%edx
8010256a:	89 d1                	mov    %edx,%ecx
8010256c:	83 e1 03             	and    $0x3,%ecx
8010256f:	8b 0c 8d 60 72 10 80 	mov    -0x7fef8da0(,%ecx,4),%ecx
80102576:	89 15 5c a6 10 80    	mov    %edx,0x8010a65c
8010257c:	83 e2 08             	and    $0x8,%edx
8010257f:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
80102583:	74 c1                	je     80102546 <kbdgetc+0x56>
80102585:	8d 50 9f             	lea    -0x61(%eax),%edx
80102588:	83 fa 19             	cmp    $0x19,%edx
8010258b:	77 1b                	ja     801025a8 <kbdgetc+0xb8>
8010258d:	83 e8 20             	sub    $0x20,%eax
80102590:	5d                   	pop    %ebp
80102591:	c3                   	ret    
80102592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102598:	30 c0                	xor    %al,%al
8010259a:	83 0d 5c a6 10 80 40 	orl    $0x40,0x8010a65c
801025a1:	5d                   	pop    %ebp
801025a2:	c3                   	ret    
801025a3:	90                   	nop
801025a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025a8:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025ab:	8d 50 20             	lea    0x20(%eax),%edx
801025ae:	83 f9 19             	cmp    $0x19,%ecx
801025b1:	0f 46 c2             	cmovbe %edx,%eax
801025b4:	5d                   	pop    %ebp
801025b5:	c3                   	ret    
801025b6:	8d 76 00             	lea    0x0(%esi),%esi
801025b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025c0 <kbdintr>:
801025c0:	55                   	push   %ebp
801025c1:	89 e5                	mov    %esp,%ebp
801025c3:	83 ec 18             	sub    $0x18,%esp
801025c6:	c7 04 24 f0 24 10 80 	movl   $0x801024f0,(%esp)
801025cd:	e8 4e e0 ff ff       	call   80100620 <consoleintr>
801025d2:	c9                   	leave  
801025d3:	c3                   	ret    
801025d4:	66 90                	xchg   %ax,%ax
801025d6:	66 90                	xchg   %ax,%ax
801025d8:	66 90                	xchg   %ax,%ax
801025da:	66 90                	xchg   %ax,%ax
801025dc:	66 90                	xchg   %ax,%ax
801025de:	66 90                	xchg   %ax,%ax

801025e0 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
801025e0:	a1 3c 27 11 80       	mov    0x8011273c,%eax
{
801025e5:	55                   	push   %ebp
801025e6:	89 e5                	mov    %esp,%ebp
  if(!lapic)
801025e8:	85 c0                	test   %eax,%eax
801025ea:	0f 84 09 01 00 00    	je     801026f9 <lapicinit+0x119>
  lapic[index] = value;
801025f0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025f7:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801025fa:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801025ff:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102602:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102609:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010260c:	a1 3c 27 11 80       	mov    0x8011273c,%eax
80102611:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102614:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
8010261b:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
8010261e:	a1 3c 27 11 80       	mov    0x8011273c,%eax
80102623:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102626:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010262d:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102630:	a1 3c 27 11 80       	mov    0x8011273c,%eax
80102635:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102638:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010263f:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102642:	a1 3c 27 11 80       	mov    0x8011273c,%eax
80102647:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010264a:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102651:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102654:	a1 3c 27 11 80       	mov    0x8011273c,%eax
80102659:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010265c:	8b 50 30             	mov    0x30(%eax),%edx
8010265f:	c1 ea 10             	shr    $0x10,%edx
80102662:	80 fa 03             	cmp    $0x3,%dl
80102665:	0f 87 95 00 00 00    	ja     80102700 <lapicinit+0x120>
  lapic[index] = value;
8010266b:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102672:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102675:	a1 3c 27 11 80       	mov    0x8011273c,%eax
8010267a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010267d:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102684:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102687:	a1 3c 27 11 80       	mov    0x8011273c,%eax
8010268c:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010268f:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102696:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102699:	a1 3c 27 11 80       	mov    0x8011273c,%eax
8010269e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026a1:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026a8:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026ab:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801026b0:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026b3:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026ba:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026bd:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801026c2:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026c5:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026cc:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026cf:	8b 0d 3c 27 11 80    	mov    0x8011273c,%ecx
801026d5:	8b 41 20             	mov    0x20(%ecx),%eax
801026d8:	8d 91 00 03 00 00    	lea    0x300(%ecx),%edx
801026de:	66 90                	xchg   %ax,%ax
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026e0:	8b 02                	mov    (%edx),%eax
801026e2:	f6 c4 10             	test   $0x10,%ah
801026e5:	75 f9                	jne    801026e0 <lapicinit+0x100>
  lapic[index] = value;
801026e7:	c7 81 80 00 00 00 00 	movl   $0x0,0x80(%ecx)
801026ee:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026f1:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801026f6:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026f9:	5d                   	pop    %ebp
801026fa:	c3                   	ret    
801026fb:	90                   	nop
801026fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic[index] = value;
80102700:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102707:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010270a:	a1 3c 27 11 80       	mov    0x8011273c,%eax
8010270f:	8b 50 20             	mov    0x20(%eax),%edx
80102712:	e9 54 ff ff ff       	jmp    8010266b <lapicinit+0x8b>
80102717:	89 f6                	mov    %esi,%esi
80102719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102720 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
80102720:	8b 15 3c 27 11 80    	mov    0x8011273c,%edx
80102726:	31 c0                	xor    %eax,%eax
{
80102728:	55                   	push   %ebp
80102729:	89 e5                	mov    %esp,%ebp
  if (!lapic)
8010272b:	85 d2                	test   %edx,%edx
8010272d:	74 06                	je     80102735 <lapicid+0x15>
    return 0;
  return lapic[ID] >> 24;
8010272f:	8b 42 20             	mov    0x20(%edx),%eax
80102732:	c1 e8 18             	shr    $0x18,%eax
}
80102735:	5d                   	pop    %ebp
80102736:	c3                   	ret    
80102737:	89 f6                	mov    %esi,%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102740:	a1 3c 27 11 80       	mov    0x8011273c,%eax
{
80102745:	55                   	push   %ebp
80102746:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102748:	85 c0                	test   %eax,%eax
8010274a:	74 12                	je     8010275e <lapiceoi+0x1e>
  lapic[index] = value;
8010274c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102753:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102756:	a1 3c 27 11 80       	mov    0x8011273c,%eax
8010275b:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
8010275e:	5d                   	pop    %ebp
8010275f:	c3                   	ret    

80102760 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102760:	55                   	push   %ebp
80102761:	89 e5                	mov    %esp,%ebp
}
80102763:	5d                   	pop    %ebp
80102764:	c3                   	ret    
80102765:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102770 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102770:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102771:	ba 70 00 00 00       	mov    $0x70,%edx
80102776:	89 e5                	mov    %esp,%ebp
80102778:	b8 0f 00 00 00       	mov    $0xf,%eax
8010277d:	53                   	push   %ebx
8010277e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102781:	0f b6 5d 08          	movzbl 0x8(%ebp),%ebx
80102785:	ee                   	out    %al,(%dx)
80102786:	b8 0a 00 00 00       	mov    $0xa,%eax
8010278b:	b2 71                	mov    $0x71,%dl
8010278d:	ee                   	out    %al,(%dx)
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
8010278e:	89 c8                	mov    %ecx,%eax
80102790:	c1 e8 04             	shr    $0x4,%eax
80102793:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
80102799:	a1 3c 27 11 80       	mov    0x8011273c,%eax
8010279e:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
801027a1:	66 c7 05 67 04 00 80 	movw   $0x0,0x80000467
801027a8:	00 00 
  lapic[ID];  // wait for write to finish, by reading
801027aa:	c1 e9 0c             	shr    $0xc,%ecx
801027ad:	80 cd 06             	or     $0x6,%ch
  lapic[index] = value;
801027b0:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027b6:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801027bb:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027be:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027c5:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027c8:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801027cd:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027d0:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027d7:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027da:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801027df:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027e2:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027e8:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801027ed:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027f0:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027f6:	a1 3c 27 11 80       	mov    0x8011273c,%eax
801027fb:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027fe:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102804:	a1 3c 27 11 80       	mov    0x8011273c,%eax
80102809:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010280c:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102812:	a1 3c 27 11 80       	mov    0x8011273c,%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
80102817:	5b                   	pop    %ebx
80102818:	5d                   	pop    %ebp
  lapic[ID];  // wait for write to finish, by reading
80102819:	8b 40 20             	mov    0x20(%eax),%eax
}
8010281c:	c3                   	ret    
8010281d:	8d 76 00             	lea    0x0(%esi),%esi

80102820 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102820:	55                   	push   %ebp
80102821:	ba 70 00 00 00       	mov    $0x70,%edx
80102826:	89 e5                	mov    %esp,%ebp
80102828:	b8 0b 00 00 00       	mov    $0xb,%eax
8010282d:	57                   	push   %edi
8010282e:	56                   	push   %esi
8010282f:	53                   	push   %ebx
80102830:	83 ec 6c             	sub    $0x6c,%esp
80102833:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102834:	b2 71                	mov    $0x71,%dl
80102836:	ec                   	in     (%dx),%al
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102837:	bb 70 00 00 00       	mov    $0x70,%ebx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010283c:	88 45 a7             	mov    %al,-0x59(%ebp)
8010283f:	90                   	nop
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102840:	31 c0                	xor    %eax,%eax
80102842:	89 da                	mov    %ebx,%edx
80102844:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102845:	b9 71 00 00 00       	mov    $0x71,%ecx
8010284a:	89 ca                	mov    %ecx,%edx
8010284c:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
8010284d:	0f b6 f0             	movzbl %al,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102850:	89 da                	mov    %ebx,%edx
80102852:	b8 02 00 00 00       	mov    $0x2,%eax
80102857:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102858:	89 ca                	mov    %ecx,%edx
8010285a:	ec                   	in     (%dx),%al
8010285b:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010285e:	89 da                	mov    %ebx,%edx
80102860:	89 45 a8             	mov    %eax,-0x58(%ebp)
80102863:	b8 04 00 00 00       	mov    $0x4,%eax
80102868:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102869:	89 ca                	mov    %ecx,%edx
8010286b:	ec                   	in     (%dx),%al
8010286c:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010286f:	89 da                	mov    %ebx,%edx
80102871:	89 45 ac             	mov    %eax,-0x54(%ebp)
80102874:	b8 07 00 00 00       	mov    $0x7,%eax
80102879:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287a:	89 ca                	mov    %ecx,%edx
8010287c:	ec                   	in     (%dx),%al
8010287d:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102880:	89 da                	mov    %ebx,%edx
80102882:	89 45 b0             	mov    %eax,-0x50(%ebp)
80102885:	b8 08 00 00 00       	mov    $0x8,%eax
8010288a:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010288b:	89 ca                	mov    %ecx,%edx
8010288d:	ec                   	in     (%dx),%al
8010288e:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102891:	89 da                	mov    %ebx,%edx
80102893:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80102896:	b8 09 00 00 00       	mov    $0x9,%eax
8010289b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010289c:	89 ca                	mov    %ecx,%edx
8010289e:	ec                   	in     (%dx),%al
8010289f:	0f b6 f8             	movzbl %al,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028a2:	89 da                	mov    %ebx,%edx
801028a4:	b8 0a 00 00 00       	mov    $0xa,%eax
801028a9:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028aa:	89 ca                	mov    %ecx,%edx
801028ac:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028ad:	84 c0                	test   %al,%al
801028af:	78 8f                	js     80102840 <cmostime+0x20>
801028b1:	8b 45 a8             	mov    -0x58(%ebp),%eax
801028b4:	8b 55 ac             	mov    -0x54(%ebp),%edx
801028b7:	89 75 d0             	mov    %esi,-0x30(%ebp)
801028ba:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801028bd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028c0:	8b 45 b0             	mov    -0x50(%ebp),%eax
801028c3:	89 55 d8             	mov    %edx,-0x28(%ebp)
801028c6:	8b 55 b4             	mov    -0x4c(%ebp),%edx
801028c9:	89 45 dc             	mov    %eax,-0x24(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028cc:	31 c0                	xor    %eax,%eax
801028ce:	89 55 e0             	mov    %edx,-0x20(%ebp)
801028d1:	89 da                	mov    %ebx,%edx
801028d3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028d4:	89 ca                	mov    %ecx,%edx
801028d6:	ec                   	in     (%dx),%al
  r->second = cmos_read(SECS);
801028d7:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028da:	89 da                	mov    %ebx,%edx
801028dc:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028df:	b8 02 00 00 00       	mov    $0x2,%eax
801028e4:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028e5:	89 ca                	mov    %ecx,%edx
801028e7:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
801028e8:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028eb:	89 da                	mov    %ebx,%edx
801028ed:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028f0:	b8 04 00 00 00       	mov    $0x4,%eax
801028f5:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028f6:	89 ca                	mov    %ecx,%edx
801028f8:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
801028f9:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028fc:	89 da                	mov    %ebx,%edx
801028fe:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102901:	b8 07 00 00 00       	mov    $0x7,%eax
80102906:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102907:	89 ca                	mov    %ecx,%edx
80102909:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
8010290a:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010290d:	89 da                	mov    %ebx,%edx
8010290f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102912:	b8 08 00 00 00       	mov    $0x8,%eax
80102917:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102918:	89 ca                	mov    %ecx,%edx
8010291a:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
8010291b:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010291e:	89 da                	mov    %ebx,%edx
80102920:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102923:	b8 09 00 00 00       	mov    $0x9,%eax
80102928:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102929:	89 ca                	mov    %ecx,%edx
8010292b:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
8010292c:	0f b6 c8             	movzbl %al,%ecx
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010292f:	8d 55 d0             	lea    -0x30(%ebp),%edx
80102932:	8d 45 b8             	lea    -0x48(%ebp),%eax
  r->year   = cmos_read(YEAR);
80102935:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102938:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
8010293f:	00 
80102940:	89 44 24 04          	mov    %eax,0x4(%esp)
80102944:	89 14 24             	mov    %edx,(%esp)
80102947:	e8 94 1a 00 00       	call   801043e0 <memcmp>
8010294c:	85 c0                	test   %eax,%eax
8010294e:	0f 85 ec fe ff ff    	jne    80102840 <cmostime+0x20>
      break;
  }

  // convert
  if(bcd) {
80102954:	f6 45 a7 04          	testb  $0x4,-0x59(%ebp)
80102958:	75 78                	jne    801029d2 <cmostime+0x1b2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
8010295a:	8b 45 d0             	mov    -0x30(%ebp),%eax
8010295d:	89 c2                	mov    %eax,%edx
8010295f:	83 e0 0f             	and    $0xf,%eax
80102962:	c1 ea 04             	shr    $0x4,%edx
80102965:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102968:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    CONV(minute);
8010296e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80102971:	89 c2                	mov    %eax,%edx
80102973:	83 e0 0f             	and    $0xf,%eax
80102976:	c1 ea 04             	shr    $0x4,%edx
80102979:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010297c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010297f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    CONV(hour  );
80102982:	8b 45 d8             	mov    -0x28(%ebp),%eax
80102985:	89 c2                	mov    %eax,%edx
80102987:	83 e0 0f             	and    $0xf,%eax
8010298a:	c1 ea 04             	shr    $0x4,%edx
8010298d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102990:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102993:	89 45 d8             	mov    %eax,-0x28(%ebp)
    CONV(day   );
80102996:	8b 45 dc             	mov    -0x24(%ebp),%eax
80102999:	89 c2                	mov    %eax,%edx
8010299b:	83 e0 0f             	and    $0xf,%eax
8010299e:	c1 ea 04             	shr    $0x4,%edx
801029a1:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029a4:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029a7:	89 45 dc             	mov    %eax,-0x24(%ebp)
    CONV(month );
801029aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
801029ad:	89 c2                	mov    %eax,%edx
801029af:	83 e0 0f             	and    $0xf,%eax
801029b2:	c1 ea 04             	shr    $0x4,%edx
801029b5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029b8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
    CONV(year  );
801029be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801029c1:	89 c2                	mov    %eax,%edx
801029c3:	83 e0 0f             	and    $0xf,%eax
801029c6:	c1 ea 04             	shr    $0x4,%edx
801029c9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cc:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
#undef     CONV
  }

  *r = t1;
801029d2:	8b 45 d0             	mov    -0x30(%ebp),%eax
801029d5:	8b 55 08             	mov    0x8(%ebp),%edx
801029d8:	89 02                	mov    %eax,(%edx)
801029da:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801029dd:	89 42 04             	mov    %eax,0x4(%edx)
801029e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
801029e3:	89 42 08             	mov    %eax,0x8(%edx)
801029e6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801029e9:	89 42 0c             	mov    %eax,0xc(%edx)
801029ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
801029ef:	89 42 10             	mov    %eax,0x10(%edx)
801029f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801029f5:	89 42 14             	mov    %eax,0x14(%edx)
  r->year += 2000;
801029f8:	81 42 14 d0 07 00 00 	addl   $0x7d0,0x14(%edx)
}
801029ff:	83 c4 6c             	add    $0x6c,%esp
80102a02:	5b                   	pop    %ebx
80102a03:	5e                   	pop    %esi
80102a04:	5f                   	pop    %edi
80102a05:	5d                   	pop    %ebp
80102a06:	c3                   	ret    
80102a07:	66 90                	xchg   %ax,%ax
80102a09:	66 90                	xchg   %ax,%ax
80102a0b:	66 90                	xchg   %ax,%ax
80102a0d:	66 90                	xchg   %ax,%ax
80102a0f:	90                   	nop

80102a10 <log_write>:
80102a10:	55                   	push   %ebp
80102a11:	89 e5                	mov    %esp,%ebp
80102a13:	53                   	push   %ebx
80102a14:	83 ec 14             	sub    $0x14,%esp
80102a17:	a1 88 27 11 80       	mov    0x80112788,%eax
80102a1c:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102a1f:	83 f8 1d             	cmp    $0x1d,%eax
80102a22:	7f 7e                	jg     80102aa2 <log_write+0x92>
80102a24:	8b 15 78 27 11 80    	mov    0x80112778,%edx
80102a2a:	83 ea 01             	sub    $0x1,%edx
80102a2d:	39 d0                	cmp    %edx,%eax
80102a2f:	7d 71                	jge    80102aa2 <log_write+0x92>
80102a31:	a1 7c 27 11 80       	mov    0x8011277c,%eax
80102a36:	85 c0                	test   %eax,%eax
80102a38:	7e 74                	jle    80102aae <log_write+0x9e>
80102a3a:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102a41:	e8 ca 18 00 00       	call   80104310 <acquire>
80102a46:	8b 0d 88 27 11 80    	mov    0x80112788,%ecx
80102a4c:	85 c9                	test   %ecx,%ecx
80102a4e:	7e 4b                	jle    80102a9b <log_write+0x8b>
80102a50:	8b 53 08             	mov    0x8(%ebx),%edx
80102a53:	31 c0                	xor    %eax,%eax
80102a55:	39 15 8c 27 11 80    	cmp    %edx,0x8011278c
80102a5b:	75 0c                	jne    80102a69 <log_write+0x59>
80102a5d:	eb 11                	jmp    80102a70 <log_write+0x60>
80102a5f:	90                   	nop
80102a60:	3b 14 85 8c 27 11 80 	cmp    -0x7feed874(,%eax,4),%edx
80102a67:	74 07                	je     80102a70 <log_write+0x60>
80102a69:	83 c0 01             	add    $0x1,%eax
80102a6c:	39 c8                	cmp    %ecx,%eax
80102a6e:	7c f0                	jl     80102a60 <log_write+0x50>
80102a70:	89 14 85 8c 27 11 80 	mov    %edx,-0x7feed874(,%eax,4)
80102a77:	39 05 88 27 11 80    	cmp    %eax,0x80112788
80102a7d:	75 08                	jne    80102a87 <log_write+0x77>
80102a7f:	83 c0 01             	add    $0x1,%eax
80102a82:	a3 88 27 11 80       	mov    %eax,0x80112788
80102a87:	83 0b 04             	orl    $0x4,(%ebx)
80102a8a:	c7 45 08 40 27 11 80 	movl   $0x80112740,0x8(%ebp)
80102a91:	83 c4 14             	add    $0x14,%esp
80102a94:	5b                   	pop    %ebx
80102a95:	5d                   	pop    %ebp
80102a96:	e9 25 18 00 00       	jmp    801042c0 <release>
80102a9b:	8b 53 08             	mov    0x8(%ebx),%edx
80102a9e:	31 c0                	xor    %eax,%eax
80102aa0:	eb ce                	jmp    80102a70 <log_write+0x60>
80102aa2:	c7 04 24 70 72 10 80 	movl   $0x80107270,(%esp)
80102aa9:	e8 02 d9 ff ff       	call   801003b0 <panic>
80102aae:	c7 04 24 86 72 10 80 	movl   $0x80107286,(%esp)
80102ab5:	e8 f6 d8 ff ff       	call   801003b0 <panic>
80102aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102ac0 <install_trans>:
80102ac0:	55                   	push   %ebp
80102ac1:	89 e5                	mov    %esp,%ebp
80102ac3:	57                   	push   %edi
80102ac4:	56                   	push   %esi
80102ac5:	53                   	push   %ebx
80102ac6:	83 ec 1c             	sub    $0x1c,%esp
80102ac9:	8b 15 88 27 11 80    	mov    0x80112788,%edx
80102acf:	85 d2                	test   %edx,%edx
80102ad1:	7e 78                	jle    80102b4b <install_trans+0x8b>
80102ad3:	31 db                	xor    %ebx,%ebx
80102ad5:	8d 76 00             	lea    0x0(%esi),%esi
80102ad8:	a1 74 27 11 80       	mov    0x80112774,%eax
80102add:	8d 44 03 01          	lea    0x1(%ebx,%eax,1),%eax
80102ae1:	89 44 24 04          	mov    %eax,0x4(%esp)
80102ae5:	a1 84 27 11 80       	mov    0x80112784,%eax
80102aea:	89 04 24             	mov    %eax,(%esp)
80102aed:	e8 1e d6 ff ff       	call   80100110 <bread>
80102af2:	89 c7                	mov    %eax,%edi
80102af4:	8b 04 9d 8c 27 11 80 	mov    -0x7feed874(,%ebx,4),%eax
80102afb:	83 c3 01             	add    $0x1,%ebx
80102afe:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b02:	a1 84 27 11 80       	mov    0x80112784,%eax
80102b07:	89 04 24             	mov    %eax,(%esp)
80102b0a:	e8 01 d6 ff ff       	call   80100110 <bread>
80102b0f:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102b16:	00 
80102b17:	89 c6                	mov    %eax,%esi
80102b19:	8d 47 5c             	lea    0x5c(%edi),%eax
80102b1c:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b20:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b23:	89 04 24             	mov    %eax,(%esp)
80102b26:	e8 15 19 00 00       	call   80104440 <memmove>
80102b2b:	89 34 24             	mov    %esi,(%esp)
80102b2e:	e8 9d d5 ff ff       	call   801000d0 <bwrite>
80102b33:	89 3c 24             	mov    %edi,(%esp)
80102b36:	e8 05 d5 ff ff       	call   80100040 <brelse>
80102b3b:	89 34 24             	mov    %esi,(%esp)
80102b3e:	e8 fd d4 ff ff       	call   80100040 <brelse>
80102b43:	39 1d 88 27 11 80    	cmp    %ebx,0x80112788
80102b49:	7f 8d                	jg     80102ad8 <install_trans+0x18>
80102b4b:	83 c4 1c             	add    $0x1c,%esp
80102b4e:	5b                   	pop    %ebx
80102b4f:	5e                   	pop    %esi
80102b50:	5f                   	pop    %edi
80102b51:	5d                   	pop    %ebp
80102b52:	c3                   	ret    
80102b53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b60 <write_head>:
80102b60:	55                   	push   %ebp
80102b61:	89 e5                	mov    %esp,%ebp
80102b63:	56                   	push   %esi
80102b64:	53                   	push   %ebx
80102b65:	83 ec 10             	sub    $0x10,%esp
80102b68:	a1 74 27 11 80       	mov    0x80112774,%eax
80102b6d:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b71:	a1 84 27 11 80       	mov    0x80112784,%eax
80102b76:	89 04 24             	mov    %eax,(%esp)
80102b79:	e8 92 d5 ff ff       	call   80100110 <bread>
80102b7e:	89 c6                	mov    %eax,%esi
80102b80:	8d 58 5c             	lea    0x5c(%eax),%ebx
80102b83:	a1 88 27 11 80       	mov    0x80112788,%eax
80102b88:	89 46 5c             	mov    %eax,0x5c(%esi)
80102b8b:	8b 0d 88 27 11 80    	mov    0x80112788,%ecx
80102b91:	85 c9                	test   %ecx,%ecx
80102b93:	7e 19                	jle    80102bae <write_head+0x4e>
80102b95:	31 d2                	xor    %edx,%edx
80102b97:	90                   	nop
80102b98:	8b 0c 95 8c 27 11 80 	mov    -0x7feed874(,%edx,4),%ecx
80102b9f:	89 4c 93 04          	mov    %ecx,0x4(%ebx,%edx,4)
80102ba3:	83 c2 01             	add    $0x1,%edx
80102ba6:	39 15 88 27 11 80    	cmp    %edx,0x80112788
80102bac:	7f ea                	jg     80102b98 <write_head+0x38>
80102bae:	89 34 24             	mov    %esi,(%esp)
80102bb1:	e8 1a d5 ff ff       	call   801000d0 <bwrite>
80102bb6:	89 34 24             	mov    %esi,(%esp)
80102bb9:	e8 82 d4 ff ff       	call   80100040 <brelse>
80102bbe:	83 c4 10             	add    $0x10,%esp
80102bc1:	5b                   	pop    %ebx
80102bc2:	5e                   	pop    %esi
80102bc3:	5d                   	pop    %ebp
80102bc4:	c3                   	ret    
80102bc5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bd0 <end_op>:
80102bd0:	55                   	push   %ebp
80102bd1:	89 e5                	mov    %esp,%ebp
80102bd3:	57                   	push   %edi
80102bd4:	56                   	push   %esi
80102bd5:	53                   	push   %ebx
80102bd6:	83 ec 1c             	sub    $0x1c,%esp
80102bd9:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102be0:	e8 2b 17 00 00       	call   80104310 <acquire>
80102be5:	a1 7c 27 11 80       	mov    0x8011277c,%eax
80102bea:	8b 3d 80 27 11 80    	mov    0x80112780,%edi
80102bf0:	83 e8 01             	sub    $0x1,%eax
80102bf3:	85 ff                	test   %edi,%edi
80102bf5:	a3 7c 27 11 80       	mov    %eax,0x8011277c
80102bfa:	0f 85 f2 00 00 00    	jne    80102cf2 <end_op+0x122>
80102c00:	85 c0                	test   %eax,%eax
80102c02:	0f 85 ca 00 00 00    	jne    80102cd2 <end_op+0x102>
80102c08:	c7 05 80 27 11 80 01 	movl   $0x1,0x80112780
80102c0f:	00 00 00 
80102c12:	31 db                	xor    %ebx,%ebx
80102c14:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102c1b:	e8 a0 16 00 00       	call   801042c0 <release>
80102c20:	8b 35 88 27 11 80    	mov    0x80112788,%esi
80102c26:	85 f6                	test   %esi,%esi
80102c28:	0f 8e 8e 00 00 00    	jle    80102cbc <end_op+0xec>
80102c2e:	66 90                	xchg   %ax,%ax
80102c30:	a1 74 27 11 80       	mov    0x80112774,%eax
80102c35:	8d 44 03 01          	lea    0x1(%ebx,%eax,1),%eax
80102c39:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c3d:	a1 84 27 11 80       	mov    0x80112784,%eax
80102c42:	89 04 24             	mov    %eax,(%esp)
80102c45:	e8 c6 d4 ff ff       	call   80100110 <bread>
80102c4a:	89 c6                	mov    %eax,%esi
80102c4c:	8b 04 9d 8c 27 11 80 	mov    -0x7feed874(,%ebx,4),%eax
80102c53:	83 c3 01             	add    $0x1,%ebx
80102c56:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c5a:	a1 84 27 11 80       	mov    0x80112784,%eax
80102c5f:	89 04 24             	mov    %eax,(%esp)
80102c62:	e8 a9 d4 ff ff       	call   80100110 <bread>
80102c67:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102c6e:	00 
80102c6f:	89 c7                	mov    %eax,%edi
80102c71:	83 c0 5c             	add    $0x5c,%eax
80102c74:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c78:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c7b:	89 04 24             	mov    %eax,(%esp)
80102c7e:	e8 bd 17 00 00       	call   80104440 <memmove>
80102c83:	89 34 24             	mov    %esi,(%esp)
80102c86:	e8 45 d4 ff ff       	call   801000d0 <bwrite>
80102c8b:	89 3c 24             	mov    %edi,(%esp)
80102c8e:	e8 ad d3 ff ff       	call   80100040 <brelse>
80102c93:	89 34 24             	mov    %esi,(%esp)
80102c96:	e8 a5 d3 ff ff       	call   80100040 <brelse>
80102c9b:	3b 1d 88 27 11 80    	cmp    0x80112788,%ebx
80102ca1:	7c 8d                	jl     80102c30 <end_op+0x60>
80102ca3:	e8 b8 fe ff ff       	call   80102b60 <write_head>
80102ca8:	e8 13 fe ff ff       	call   80102ac0 <install_trans>
80102cad:	c7 05 88 27 11 80 00 	movl   $0x0,0x80112788
80102cb4:	00 00 00 
80102cb7:	e8 a4 fe ff ff       	call   80102b60 <write_head>
80102cbc:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102cc3:	e8 48 16 00 00       	call   80104310 <acquire>
80102cc8:	c7 05 80 27 11 80 00 	movl   $0x0,0x80112780
80102ccf:	00 00 00 
80102cd2:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102cd9:	e8 c2 09 00 00       	call   801036a0 <wakeup>
80102cde:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102ce5:	e8 d6 15 00 00       	call   801042c0 <release>
80102cea:	83 c4 1c             	add    $0x1c,%esp
80102ced:	5b                   	pop    %ebx
80102cee:	5e                   	pop    %esi
80102cef:	5f                   	pop    %edi
80102cf0:	5d                   	pop    %ebp
80102cf1:	c3                   	ret    
80102cf2:	c7 04 24 a1 72 10 80 	movl   $0x801072a1,(%esp)
80102cf9:	e8 b2 d6 ff ff       	call   801003b0 <panic>
80102cfe:	66 90                	xchg   %ax,%ax

80102d00 <begin_op>:
80102d00:	55                   	push   %ebp
80102d01:	89 e5                	mov    %esp,%ebp
80102d03:	83 ec 18             	sub    $0x18,%esp
80102d06:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102d0d:	e8 fe 15 00 00       	call   80104310 <acquire>
80102d12:	eb 18                	jmp    80102d2c <begin_op+0x2c>
80102d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102d18:	c7 44 24 04 40 27 11 	movl   $0x80112740,0x4(%esp)
80102d1f:	80 
80102d20:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102d27:	e8 84 0f 00 00       	call   80103cb0 <sleep>
80102d2c:	a1 80 27 11 80       	mov    0x80112780,%eax
80102d31:	85 c0                	test   %eax,%eax
80102d33:	75 e3                	jne    80102d18 <begin_op+0x18>
80102d35:	8b 15 7c 27 11 80    	mov    0x8011277c,%edx
80102d3b:	83 c2 01             	add    $0x1,%edx
80102d3e:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102d41:	01 c0                	add    %eax,%eax
80102d43:	03 05 88 27 11 80    	add    0x80112788,%eax
80102d49:	83 f8 1e             	cmp    $0x1e,%eax
80102d4c:	7f ca                	jg     80102d18 <begin_op+0x18>
80102d4e:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102d55:	89 15 7c 27 11 80    	mov    %edx,0x8011277c
80102d5b:	e8 60 15 00 00       	call   801042c0 <release>
80102d60:	c9                   	leave  
80102d61:	c3                   	ret    
80102d62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102d70 <initlog>:
80102d70:	55                   	push   %ebp
80102d71:	89 e5                	mov    %esp,%ebp
80102d73:	56                   	push   %esi
80102d74:	53                   	push   %ebx
80102d75:	83 ec 30             	sub    $0x30,%esp
80102d78:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d7b:	c7 44 24 04 b0 72 10 	movl   $0x801072b0,0x4(%esp)
80102d82:	80 
80102d83:	c7 04 24 40 27 11 80 	movl   $0x80112740,(%esp)
80102d8a:	e8 b1 13 00 00       	call   80104140 <initlock>
80102d8f:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102d92:	89 44 24 04          	mov    %eax,0x4(%esp)
80102d96:	89 1c 24             	mov    %ebx,(%esp)
80102d99:	e8 12 e6 ff ff       	call   801013b0 <readsb>
80102d9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102da1:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102da4:	89 1d 84 27 11 80    	mov    %ebx,0x80112784
80102daa:	89 1c 24             	mov    %ebx,(%esp)
80102dad:	a3 74 27 11 80       	mov    %eax,0x80112774
80102db2:	89 15 78 27 11 80    	mov    %edx,0x80112778
80102db8:	89 44 24 04          	mov    %eax,0x4(%esp)
80102dbc:	e8 4f d3 ff ff       	call   80100110 <bread>
80102dc1:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102dc4:	8d 70 5c             	lea    0x5c(%eax),%esi
80102dc7:	85 db                	test   %ebx,%ebx
80102dc9:	89 1d 88 27 11 80    	mov    %ebx,0x80112788
80102dcf:	7e 19                	jle    80102dea <initlog+0x7a>
80102dd1:	31 d2                	xor    %edx,%edx
80102dd3:	90                   	nop
80102dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102dd8:	8b 4c 96 04          	mov    0x4(%esi,%edx,4),%ecx
80102ddc:	89 0c 95 8c 27 11 80 	mov    %ecx,-0x7feed874(,%edx,4)
80102de3:	83 c2 01             	add    $0x1,%edx
80102de6:	39 da                	cmp    %ebx,%edx
80102de8:	75 ee                	jne    80102dd8 <initlog+0x68>
80102dea:	89 04 24             	mov    %eax,(%esp)
80102ded:	e8 4e d2 ff ff       	call   80100040 <brelse>
80102df2:	e8 c9 fc ff ff       	call   80102ac0 <install_trans>
80102df7:	c7 05 88 27 11 80 00 	movl   $0x0,0x80112788
80102dfe:	00 00 00 
80102e01:	e8 5a fd ff ff       	call   80102b60 <write_head>
80102e06:	83 c4 30             	add    $0x30,%esp
80102e09:	5b                   	pop    %ebx
80102e0a:	5e                   	pop    %esi
80102e0b:	5d                   	pop    %ebp
80102e0c:	c3                   	ret    
80102e0d:	66 90                	xchg   %ax,%ax
80102e0f:	90                   	nop

80102e10 <mpmain>:
80102e10:	55                   	push   %ebp
80102e11:	89 e5                	mov    %esp,%ebp
80102e13:	53                   	push   %ebx
80102e14:	83 ec 14             	sub    $0x14,%esp
80102e17:	e8 a4 11 00 00       	call   80103fc0 <cpuid>
80102e1c:	89 c3                	mov    %eax,%ebx
80102e1e:	e8 9d 11 00 00       	call   80103fc0 <cpuid>
80102e23:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80102e27:	c7 04 24 b4 72 10 80 	movl   $0x801072b4,(%esp)
80102e2e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102e32:	e8 19 da ff ff       	call   80100850 <cprintf>
80102e37:	e8 24 27 00 00       	call   80105560 <idtinit>
80102e3c:	e8 ef 0a 00 00       	call   80103930 <mycpu>
80102e41:	89 c2                	mov    %eax,%edx
80102e43:	b8 01 00 00 00       	mov    $0x1,%eax
80102e48:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102e4f:	e8 5c 0b 00 00       	call   801039b0 <scheduler>
80102e54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102e60 <main>:
80102e60:	55                   	push   %ebp
80102e61:	89 e5                	mov    %esp,%ebp
80102e63:	83 e4 f0             	and    $0xfffffff0,%esp
80102e66:	53                   	push   %ebx
80102e67:	83 ec 1c             	sub    $0x1c,%esp
80102e6a:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80102e71:	80 
80102e72:	c7 04 24 68 55 11 80 	movl   $0x80115568,(%esp)
80102e79:	e8 22 f6 ff ff       	call   801024a0 <kinit1>
80102e7e:	e8 8d 3a 00 00       	call   80106910 <kvmalloc>
80102e83:	e8 98 01 00 00       	call   80103020 <mpinit>
80102e88:	e8 53 f7 ff ff       	call   801025e0 <lapicinit>
80102e8d:	8d 76 00             	lea    0x0(%esi),%esi
80102e90:	e8 5b 3e 00 00       	call   80106cf0 <seginit>
80102e95:	e8 26 03 00 00       	call   801031c0 <picinit>
80102e9a:	e8 e1 f3 ff ff       	call   80102280 <ioapicinit>
80102e9f:	90                   	nop
80102ea0:	e8 cb d3 ff ff       	call   80100270 <consoleinit>
80102ea5:	e8 c6 2a 00 00       	call   80105970 <uartinit>
80102eaa:	e8 31 11 00 00       	call   80103fe0 <pinit>
80102eaf:	90                   	nop
80102eb0:	e8 8b 29 00 00       	call   80105840 <tvinit>
80102eb5:	e8 26 d3 ff ff       	call   801001e0 <binit>
80102eba:	e8 71 e2 ff ff       	call   80101130 <fileinit>
80102ebf:	90                   	nop
80102ec0:	e8 fb f2 ff ff       	call   801021c0 <ideinit>
80102ec5:	c7 44 24 08 8a 00 00 	movl   $0x8a,0x8(%esp)
80102ecc:	00 
80102ecd:	c7 44 24 04 2c a5 10 	movl   $0x8010a52c,0x4(%esp)
80102ed4:	80 
80102ed5:	c7 04 24 00 70 00 80 	movl   $0x80007000,(%esp)
80102edc:	e8 5f 15 00 00       	call   80104440 <memmove>
80102ee1:	69 05 c0 2d 11 80 b0 	imul   $0xb0,0x80112dc0,%eax
80102ee8:	00 00 00 
80102eeb:	05 40 28 11 80       	add    $0x80112840,%eax
80102ef0:	3d 40 28 11 80       	cmp    $0x80112840,%eax
80102ef5:	76 6c                	jbe    80102f63 <main+0x103>
80102ef7:	bb 40 28 11 80       	mov    $0x80112840,%ebx
80102efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102f00:	e8 2b 0a 00 00       	call   80103930 <mycpu>
80102f05:	39 d8                	cmp    %ebx,%eax
80102f07:	74 41                	je     80102f4a <main+0xea>
80102f09:	e8 22 f4 ff ff       	call   80102330 <kalloc>
80102f0e:	c7 05 f8 6f 00 80 90 	movl   $0x80102f90,0x80006ff8
80102f15:	2f 10 80 
80102f18:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f1f:	90 10 00 
80102f22:	05 00 10 00 00       	add    $0x1000,%eax
80102f27:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f2c:	0f b6 03             	movzbl (%ebx),%eax
80102f2f:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
80102f36:	00 
80102f37:	89 04 24             	mov    %eax,(%esp)
80102f3a:	e8 31 f8 ff ff       	call   80102770 <lapicstartap>
80102f3f:	90                   	nop
80102f40:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f46:	85 c0                	test   %eax,%eax
80102f48:	74 f6                	je     80102f40 <main+0xe0>
80102f4a:	69 05 c0 2d 11 80 b0 	imul   $0xb0,0x80112dc0,%eax
80102f51:	00 00 00 
80102f54:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f5a:	05 40 28 11 80       	add    $0x80112840,%eax
80102f5f:	39 c3                	cmp    %eax,%ebx
80102f61:	72 9d                	jb     80102f00 <main+0xa0>
80102f63:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80102f6a:	8e 
80102f6b:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80102f72:	e8 f9 f4 ff ff       	call   80102470 <kinit2>
80102f77:	e8 b4 08 00 00       	call   80103830 <userinit>
80102f7c:	e8 8f fe ff ff       	call   80102e10 <mpmain>
80102f81:	eb 0d                	jmp    80102f90 <mpenter>
80102f83:	90                   	nop
80102f84:	90                   	nop
80102f85:	90                   	nop
80102f86:	90                   	nop
80102f87:	90                   	nop
80102f88:	90                   	nop
80102f89:	90                   	nop
80102f8a:	90                   	nop
80102f8b:	90                   	nop
80102f8c:	90                   	nop
80102f8d:	90                   	nop
80102f8e:	90                   	nop
80102f8f:	90                   	nop

80102f90 <mpenter>:
80102f90:	55                   	push   %ebp
80102f91:	89 e5                	mov    %esp,%ebp
80102f93:	83 ec 08             	sub    $0x8,%esp
80102f96:	e8 e5 34 00 00       	call   80106480 <switchkvm>
80102f9b:	e8 50 3d 00 00       	call   80106cf0 <seginit>
80102fa0:	e8 3b f6 ff ff       	call   801025e0 <lapicinit>
80102fa5:	e8 66 fe ff ff       	call   80102e10 <mpmain>
80102faa:	66 90                	xchg   %ax,%ax
80102fac:	66 90                	xchg   %ax,%ax
80102fae:	66 90                	xchg   %ax,%ax

80102fb0 <mpsearch1>:
80102fb0:	55                   	push   %ebp
80102fb1:	89 e5                	mov    %esp,%ebp
80102fb3:	56                   	push   %esi
80102fb4:	53                   	push   %ebx
80102fb5:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80102fbb:	83 ec 10             	sub    $0x10,%esp
80102fbe:	8d 34 13             	lea    (%ebx,%edx,1),%esi
80102fc1:	39 f3                	cmp    %esi,%ebx
80102fc3:	73 3c                	jae    80103001 <mpsearch1+0x51>
80102fc5:	8d 76 00             	lea    0x0(%esi),%esi
80102fc8:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80102fcf:	00 
80102fd0:	c7 44 24 04 c8 72 10 	movl   $0x801072c8,0x4(%esp)
80102fd7:	80 
80102fd8:	89 1c 24             	mov    %ebx,(%esp)
80102fdb:	e8 00 14 00 00       	call   801043e0 <memcmp>
80102fe0:	85 c0                	test   %eax,%eax
80102fe2:	75 16                	jne    80102ffa <mpsearch1+0x4a>
80102fe4:	31 d2                	xor    %edx,%edx
80102fe6:	66 90                	xchg   %ax,%ax
80102fe8:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
80102fec:	83 c0 01             	add    $0x1,%eax
80102fef:	01 ca                	add    %ecx,%edx
80102ff1:	83 f8 10             	cmp    $0x10,%eax
80102ff4:	75 f2                	jne    80102fe8 <mpsearch1+0x38>
80102ff6:	84 d2                	test   %dl,%dl
80102ff8:	74 10                	je     8010300a <mpsearch1+0x5a>
80102ffa:	83 c3 10             	add    $0x10,%ebx
80102ffd:	39 de                	cmp    %ebx,%esi
80102fff:	77 c7                	ja     80102fc8 <mpsearch1+0x18>
80103001:	83 c4 10             	add    $0x10,%esp
80103004:	31 c0                	xor    %eax,%eax
80103006:	5b                   	pop    %ebx
80103007:	5e                   	pop    %esi
80103008:	5d                   	pop    %ebp
80103009:	c3                   	ret    
8010300a:	83 c4 10             	add    $0x10,%esp
8010300d:	89 d8                	mov    %ebx,%eax
8010300f:	5b                   	pop    %ebx
80103010:	5e                   	pop    %esi
80103011:	5d                   	pop    %ebp
80103012:	c3                   	ret    
80103013:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103020 <mpinit>:
80103020:	55                   	push   %ebp
80103021:	89 e5                	mov    %esp,%ebp
80103023:	57                   	push   %edi
80103024:	56                   	push   %esi
80103025:	53                   	push   %ebx
80103026:	83 ec 2c             	sub    $0x2c,%esp
80103029:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103030:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103037:	c1 e0 08             	shl    $0x8,%eax
8010303a:	09 d0                	or     %edx,%eax
8010303c:	c1 e0 04             	shl    $0x4,%eax
8010303f:	85 c0                	test   %eax,%eax
80103041:	75 1b                	jne    8010305e <mpinit+0x3e>
80103043:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010304a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103051:	c1 e0 08             	shl    $0x8,%eax
80103054:	09 d0                	or     %edx,%eax
80103056:	c1 e0 0a             	shl    $0xa,%eax
80103059:	2d 00 04 00 00       	sub    $0x400,%eax
8010305e:	ba 00 04 00 00       	mov    $0x400,%edx
80103063:	e8 48 ff ff ff       	call   80102fb0 <mpsearch1>
80103068:	85 c0                	test   %eax,%eax
8010306a:	89 c7                	mov    %eax,%edi
8010306c:	0f 84 9b 00 00 00    	je     8010310d <mpinit+0xed>
80103072:	8b 77 04             	mov    0x4(%edi),%esi
80103075:	85 f6                	test   %esi,%esi
80103077:	75 0c                	jne    80103085 <mpinit+0x65>
80103079:	c7 04 24 d2 72 10 80 	movl   $0x801072d2,(%esp)
80103080:	e8 2b d3 ff ff       	call   801003b0 <panic>
80103085:	8d 9e 00 00 00 80    	lea    -0x80000000(%esi),%ebx
8010308b:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80103092:	00 
80103093:	c7 44 24 04 cd 72 10 	movl   $0x801072cd,0x4(%esp)
8010309a:	80 
8010309b:	89 1c 24             	mov    %ebx,(%esp)
8010309e:	e8 3d 13 00 00       	call   801043e0 <memcmp>
801030a3:	85 c0                	test   %eax,%eax
801030a5:	75 d2                	jne    80103079 <mpinit+0x59>
801030a7:	0f b6 43 06          	movzbl 0x6(%ebx),%eax
801030ab:	3c 04                	cmp    $0x4,%al
801030ad:	74 04                	je     801030b3 <mpinit+0x93>
801030af:	3c 01                	cmp    $0x1,%al
801030b1:	75 c6                	jne    80103079 <mpinit+0x59>
801030b3:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
801030b7:	89 d8                	mov    %ebx,%eax
801030b9:	8d 8c 16 00 00 00 80 	lea    -0x80000000(%esi,%edx,1),%ecx
801030c0:	31 d2                	xor    %edx,%edx
801030c2:	eb 08                	jmp    801030cc <mpinit+0xac>
801030c4:	0f b6 30             	movzbl (%eax),%esi
801030c7:	83 c0 01             	add    $0x1,%eax
801030ca:	01 f2                	add    %esi,%edx
801030cc:	39 c8                	cmp    %ecx,%eax
801030ce:	75 f4                	jne    801030c4 <mpinit+0xa4>
801030d0:	84 d2                	test   %dl,%dl
801030d2:	75 a5                	jne    80103079 <mpinit+0x59>
801030d4:	8b 43 24             	mov    0x24(%ebx),%eax
801030d7:	a3 3c 27 11 80       	mov    %eax,0x8011273c
801030dc:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
801030e0:	8d 43 2c             	lea    0x2c(%ebx),%eax
801030e3:	8d 14 13             	lea    (%ebx,%edx,1),%edx
801030e6:	bb 01 00 00 00       	mov    $0x1,%ebx
801030eb:	90                   	nop
801030ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801030f0:	39 d0                	cmp    %edx,%eax
801030f2:	73 4b                	jae    8010313f <mpinit+0x11f>
801030f4:	0f b6 08             	movzbl (%eax),%ecx
801030f7:	80 f9 04             	cmp    $0x4,%cl
801030fa:	76 07                	jbe    80103103 <mpinit+0xe3>
801030fc:	31 db                	xor    %ebx,%ebx
801030fe:	80 f9 04             	cmp    $0x4,%cl
80103101:	77 f9                	ja     801030fc <mpinit+0xdc>
80103103:	0f b6 c9             	movzbl %cl,%ecx
80103106:	ff 24 8d 0c 73 10 80 	jmp    *-0x7fef8cf4(,%ecx,4)
8010310d:	ba 00 00 01 00       	mov    $0x10000,%edx
80103112:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103117:	e8 94 fe ff ff       	call   80102fb0 <mpsearch1>
8010311c:	85 c0                	test   %eax,%eax
8010311e:	89 c7                	mov    %eax,%edi
80103120:	0f 85 4c ff ff ff    	jne    80103072 <mpinit+0x52>
80103126:	c7 04 24 d2 72 10 80 	movl   $0x801072d2,(%esp)
8010312d:	e8 7e d2 ff ff       	call   801003b0 <panic>
80103132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103138:	83 c0 08             	add    $0x8,%eax
8010313b:	39 d0                	cmp    %edx,%eax
8010313d:	72 b5                	jb     801030f4 <mpinit+0xd4>
8010313f:	85 db                	test   %ebx,%ebx
80103141:	74 6f                	je     801031b2 <mpinit+0x192>
80103143:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
80103147:	74 12                	je     8010315b <mpinit+0x13b>
80103149:	ba 22 00 00 00       	mov    $0x22,%edx
8010314e:	b8 70 00 00 00       	mov    $0x70,%eax
80103153:	ee                   	out    %al,(%dx)
80103154:	b2 23                	mov    $0x23,%dl
80103156:	ec                   	in     (%dx),%al
80103157:	83 c8 01             	or     $0x1,%eax
8010315a:	ee                   	out    %al,(%dx)
8010315b:	83 c4 2c             	add    $0x2c,%esp
8010315e:	5b                   	pop    %ebx
8010315f:	5e                   	pop    %esi
80103160:	5f                   	pop    %edi
80103161:	5d                   	pop    %ebp
80103162:	c3                   	ret    
80103163:	90                   	nop
80103164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103168:	8b 0d c0 2d 11 80    	mov    0x80112dc0,%ecx
8010316e:	83 f9 07             	cmp    $0x7,%ecx
80103171:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103174:	7f 1c                	jg     80103192 <mpinit+0x172>
80103176:	69 f1 b0 00 00 00    	imul   $0xb0,%ecx,%esi
8010317c:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
80103180:	88 8e 40 28 11 80    	mov    %cl,-0x7feed7c0(%esi)
80103186:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103189:	83 c1 01             	add    $0x1,%ecx
8010318c:	89 0d c0 2d 11 80    	mov    %ecx,0x80112dc0
80103192:	83 c0 14             	add    $0x14,%eax
80103195:	e9 56 ff ff ff       	jmp    801030f0 <mpinit+0xd0>
8010319a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801031a0:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
801031a4:	83 c0 08             	add    $0x8,%eax
801031a7:	88 0d 20 28 11 80    	mov    %cl,0x80112820
801031ad:	e9 3e ff ff ff       	jmp    801030f0 <mpinit+0xd0>
801031b2:	c7 04 24 ec 72 10 80 	movl   $0x801072ec,(%esp)
801031b9:	e8 f2 d1 ff ff       	call   801003b0 <panic>
801031be:	66 90                	xchg   %ax,%ax

801031c0 <picinit>:
801031c0:	55                   	push   %ebp
801031c1:	ba 21 00 00 00       	mov    $0x21,%edx
801031c6:	89 e5                	mov    %esp,%ebp
801031c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031cd:	ee                   	out    %al,(%dx)
801031ce:	b2 a1                	mov    $0xa1,%dl
801031d0:	ee                   	out    %al,(%dx)
801031d1:	5d                   	pop    %ebp
801031d2:	c3                   	ret    
801031d3:	66 90                	xchg   %ax,%ax
801031d5:	66 90                	xchg   %ax,%ax
801031d7:	66 90                	xchg   %ax,%ax
801031d9:	66 90                	xchg   %ax,%ax
801031db:	66 90                	xchg   %ax,%ax
801031dd:	66 90                	xchg   %ax,%ax
801031df:	90                   	nop

801031e0 <piperead>:
801031e0:	55                   	push   %ebp
801031e1:	89 e5                	mov    %esp,%ebp
801031e3:	57                   	push   %edi
801031e4:	56                   	push   %esi
801031e5:	53                   	push   %ebx
801031e6:	83 ec 1c             	sub    $0x1c,%esp
801031e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801031ec:	8b 7d 10             	mov    0x10(%ebp),%edi
801031ef:	89 1c 24             	mov    %ebx,(%esp)
801031f2:	e8 19 11 00 00       	call   80104310 <acquire>
801031f7:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
801031fd:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103203:	75 5b                	jne    80103260 <piperead+0x80>
80103205:	8b 8b 40 02 00 00    	mov    0x240(%ebx),%ecx
8010320b:	85 c9                	test   %ecx,%ecx
8010320d:	74 51                	je     80103260 <piperead+0x80>
8010320f:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
80103215:	eb 25                	jmp    8010323c <piperead+0x5c>
80103217:	90                   	nop
80103218:	89 5c 24 04          	mov    %ebx,0x4(%esp)
8010321c:	89 34 24             	mov    %esi,(%esp)
8010321f:	e8 8c 0a 00 00       	call   80103cb0 <sleep>
80103224:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010322a:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103230:	75 2e                	jne    80103260 <piperead+0x80>
80103232:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103238:	85 c0                	test   %eax,%eax
8010323a:	74 24                	je     80103260 <piperead+0x80>
8010323c:	e8 0f 08 00 00       	call   80103a50 <myproc>
80103241:	8b 50 24             	mov    0x24(%eax),%edx
80103244:	85 d2                	test   %edx,%edx
80103246:	74 d0                	je     80103218 <piperead+0x38>
80103248:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010324d:	89 1c 24             	mov    %ebx,(%esp)
80103250:	e8 6b 10 00 00       	call   801042c0 <release>
80103255:	83 c4 1c             	add    $0x1c,%esp
80103258:	89 f0                	mov    %esi,%eax
8010325a:	5b                   	pop    %ebx
8010325b:	5e                   	pop    %esi
8010325c:	5f                   	pop    %edi
8010325d:	5d                   	pop    %ebp
8010325e:	c3                   	ret    
8010325f:	90                   	nop
80103260:	85 ff                	test   %edi,%edi
80103262:	7e 5e                	jle    801032c2 <piperead+0xe2>
80103264:	31 f6                	xor    %esi,%esi
80103266:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
8010326c:	75 12                	jne    80103280 <piperead+0xa0>
8010326e:	66 90                	xchg   %ax,%ax
80103270:	eb 50                	jmp    801032c2 <piperead+0xe2>
80103272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103278:	39 93 38 02 00 00    	cmp    %edx,0x238(%ebx)
8010327e:	74 22                	je     801032a2 <piperead+0xc2>
80103280:	89 d0                	mov    %edx,%eax
80103282:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103285:	83 c2 01             	add    $0x1,%edx
80103288:	25 ff 01 00 00       	and    $0x1ff,%eax
8010328d:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103292:	88 04 31             	mov    %al,(%ecx,%esi,1)
80103295:	83 c6 01             	add    $0x1,%esi
80103298:	39 f7                	cmp    %esi,%edi
8010329a:	89 93 34 02 00 00    	mov    %edx,0x234(%ebx)
801032a0:	7f d6                	jg     80103278 <piperead+0x98>
801032a2:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801032a8:	89 04 24             	mov    %eax,(%esp)
801032ab:	e8 f0 03 00 00       	call   801036a0 <wakeup>
801032b0:	89 1c 24             	mov    %ebx,(%esp)
801032b3:	e8 08 10 00 00       	call   801042c0 <release>
801032b8:	83 c4 1c             	add    $0x1c,%esp
801032bb:	89 f0                	mov    %esi,%eax
801032bd:	5b                   	pop    %ebx
801032be:	5e                   	pop    %esi
801032bf:	5f                   	pop    %edi
801032c0:	5d                   	pop    %ebp
801032c1:	c3                   	ret    
801032c2:	31 f6                	xor    %esi,%esi
801032c4:	eb dc                	jmp    801032a2 <piperead+0xc2>
801032c6:	8d 76 00             	lea    0x0(%esi),%esi
801032c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801032d0 <pipewrite>:
801032d0:	55                   	push   %ebp
801032d1:	89 e5                	mov    %esp,%ebp
801032d3:	57                   	push   %edi
801032d4:	56                   	push   %esi
801032d5:	53                   	push   %ebx
801032d6:	83 ec 3c             	sub    $0x3c,%esp
801032d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032dc:	89 1c 24             	mov    %ebx,(%esp)
801032df:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801032e5:	e8 26 10 00 00       	call   80104310 <acquire>
801032ea:	8b 4d 10             	mov    0x10(%ebp),%ecx
801032ed:	85 c9                	test   %ecx,%ecx
801032ef:	0f 8e 8c 00 00 00    	jle    80103381 <pipewrite+0xb1>
801032f5:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801032fb:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
80103301:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80103308:	eb 36                	jmp    80103340 <pipewrite+0x70>
8010330a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103310:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80103316:	85 d2                	test   %edx,%edx
80103318:	74 7e                	je     80103398 <pipewrite+0xc8>
8010331a:	e8 31 07 00 00       	call   80103a50 <myproc>
8010331f:	8b 40 24             	mov    0x24(%eax),%eax
80103322:	85 c0                	test   %eax,%eax
80103324:	75 72                	jne    80103398 <pipewrite+0xc8>
80103326:	89 34 24             	mov    %esi,(%esp)
80103329:	e8 72 03 00 00       	call   801036a0 <wakeup>
8010332e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103332:	89 3c 24             	mov    %edi,(%esp)
80103335:	e8 76 09 00 00       	call   80103cb0 <sleep>
8010333a:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103340:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
80103346:	81 c2 00 02 00 00    	add    $0x200,%edx
8010334c:	39 d0                	cmp    %edx,%eax
8010334e:	74 c0                	je     80103310 <pipewrite+0x40>
80103350:	89 c2                	mov    %eax,%edx
80103352:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103355:	83 c0 01             	add    $0x1,%eax
80103358:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010335e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80103361:	8b 55 0c             	mov    0xc(%ebp),%edx
80103364:	0f b6 0c 0a          	movzbl (%edx,%ecx,1),%ecx
80103368:	8b 55 d4             	mov    -0x2c(%ebp),%edx
8010336b:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010336f:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103375:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103379:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010337c:	39 4d 10             	cmp    %ecx,0x10(%ebp)
8010337f:	7f bf                	jg     80103340 <pipewrite+0x70>
80103381:	89 34 24             	mov    %esi,(%esp)
80103384:	e8 17 03 00 00       	call   801036a0 <wakeup>
80103389:	89 1c 24             	mov    %ebx,(%esp)
8010338c:	e8 2f 0f 00 00       	call   801042c0 <release>
80103391:	eb 14                	jmp    801033a7 <pipewrite+0xd7>
80103393:	90                   	nop
80103394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103398:	89 1c 24             	mov    %ebx,(%esp)
8010339b:	e8 20 0f 00 00       	call   801042c0 <release>
801033a0:	c7 45 10 ff ff ff ff 	movl   $0xffffffff,0x10(%ebp)
801033a7:	8b 45 10             	mov    0x10(%ebp),%eax
801033aa:	83 c4 3c             	add    $0x3c,%esp
801033ad:	5b                   	pop    %ebx
801033ae:	5e                   	pop    %esi
801033af:	5f                   	pop    %edi
801033b0:	5d                   	pop    %ebp
801033b1:	c3                   	ret    
801033b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801033c0 <pipeclose>:
801033c0:	55                   	push   %ebp
801033c1:	89 e5                	mov    %esp,%ebp
801033c3:	83 ec 18             	sub    $0x18,%esp
801033c6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801033c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033cc:	89 75 fc             	mov    %esi,-0x4(%ebp)
801033cf:	8b 75 0c             	mov    0xc(%ebp),%esi
801033d2:	89 1c 24             	mov    %ebx,(%esp)
801033d5:	e8 36 0f 00 00       	call   80104310 <acquire>
801033da:	85 f6                	test   %esi,%esi
801033dc:	74 42                	je     80103420 <pipeclose+0x60>
801033de:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801033e4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801033eb:	00 00 00 
801033ee:	89 04 24             	mov    %eax,(%esp)
801033f1:	e8 aa 02 00 00       	call   801036a0 <wakeup>
801033f6:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801033fc:	85 c0                	test   %eax,%eax
801033fe:	75 0a                	jne    8010340a <pipeclose+0x4a>
80103400:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
80103406:	85 f6                	test   %esi,%esi
80103408:	74 36                	je     80103440 <pipeclose+0x80>
8010340a:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010340d:	8b 75 fc             	mov    -0x4(%ebp),%esi
80103410:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80103413:	89 ec                	mov    %ebp,%esp
80103415:	5d                   	pop    %ebp
80103416:	e9 a5 0e 00 00       	jmp    801042c0 <release>
8010341b:	90                   	nop
8010341c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103420:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103426:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
8010342d:	00 00 00 
80103430:	89 04 24             	mov    %eax,(%esp)
80103433:	e8 68 02 00 00       	call   801036a0 <wakeup>
80103438:	eb bc                	jmp    801033f6 <pipeclose+0x36>
8010343a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103440:	89 1c 24             	mov    %ebx,(%esp)
80103443:	e8 78 0e 00 00       	call   801042c0 <release>
80103448:	8b 75 fc             	mov    -0x4(%ebp),%esi
8010344b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010344e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80103451:	89 ec                	mov    %ebp,%esp
80103453:	5d                   	pop    %ebp
80103454:	e9 27 ef ff ff       	jmp    80102380 <kfree>
80103459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103460 <pipealloc>:
80103460:	55                   	push   %ebp
80103461:	89 e5                	mov    %esp,%ebp
80103463:	57                   	push   %edi
80103464:	56                   	push   %esi
80103465:	53                   	push   %ebx
80103466:	83 ec 1c             	sub    $0x1c,%esp
80103469:	8b 75 08             	mov    0x8(%ebp),%esi
8010346c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010346f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103475:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010347b:	e8 50 db ff ff       	call   80100fd0 <filealloc>
80103480:	85 c0                	test   %eax,%eax
80103482:	89 06                	mov    %eax,(%esi)
80103484:	0f 84 9c 00 00 00    	je     80103526 <pipealloc+0xc6>
8010348a:	e8 41 db ff ff       	call   80100fd0 <filealloc>
8010348f:	85 c0                	test   %eax,%eax
80103491:	89 03                	mov    %eax,(%ebx)
80103493:	0f 84 7f 00 00 00    	je     80103518 <pipealloc+0xb8>
80103499:	e8 92 ee ff ff       	call   80102330 <kalloc>
8010349e:	85 c0                	test   %eax,%eax
801034a0:	89 c7                	mov    %eax,%edi
801034a2:	74 74                	je     80103518 <pipealloc+0xb8>
801034a4:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801034ab:	00 00 00 
801034ae:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801034b5:	00 00 00 
801034b8:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801034bf:	00 00 00 
801034c2:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801034c9:	00 00 00 
801034cc:	89 04 24             	mov    %eax,(%esp)
801034cf:	c7 44 24 04 20 73 10 	movl   $0x80107320,0x4(%esp)
801034d6:	80 
801034d7:	e8 64 0c 00 00       	call   80104140 <initlock>
801034dc:	8b 06                	mov    (%esi),%eax
801034de:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801034e4:	8b 06                	mov    (%esi),%eax
801034e6:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801034ea:	8b 06                	mov    (%esi),%eax
801034ec:	c6 40 09 00          	movb   $0x0,0x9(%eax)
801034f0:	8b 06                	mov    (%esi),%eax
801034f2:	89 78 0c             	mov    %edi,0xc(%eax)
801034f5:	8b 03                	mov    (%ebx),%eax
801034f7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801034fd:	8b 03                	mov    (%ebx),%eax
801034ff:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103503:	8b 03                	mov    (%ebx),%eax
80103505:	c6 40 09 01          	movb   $0x1,0x9(%eax)
80103509:	8b 03                	mov    (%ebx),%eax
8010350b:	89 78 0c             	mov    %edi,0xc(%eax)
8010350e:	31 c0                	xor    %eax,%eax
80103510:	83 c4 1c             	add    $0x1c,%esp
80103513:	5b                   	pop    %ebx
80103514:	5e                   	pop    %esi
80103515:	5f                   	pop    %edi
80103516:	5d                   	pop    %ebp
80103517:	c3                   	ret    
80103518:	8b 06                	mov    (%esi),%eax
8010351a:	85 c0                	test   %eax,%eax
8010351c:	74 08                	je     80103526 <pipealloc+0xc6>
8010351e:	89 04 24             	mov    %eax,(%esp)
80103521:	e8 2a db ff ff       	call   80101050 <fileclose>
80103526:	8b 13                	mov    (%ebx),%edx
80103528:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010352d:	85 d2                	test   %edx,%edx
8010352f:	74 df                	je     80103510 <pipealloc+0xb0>
80103531:	89 14 24             	mov    %edx,(%esp)
80103534:	e8 17 db ff ff       	call   80101050 <fileclose>
80103539:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010353e:	eb d0                	jmp    80103510 <pipealloc+0xb0>

80103540 <procdump>:
80103540:	55                   	push   %ebp
80103541:	89 e5                	mov    %esp,%ebp
80103543:	57                   	push   %edi
80103544:	56                   	push   %esi
80103545:	53                   	push   %ebx
80103546:	bb 14 2e 11 80       	mov    $0x80112e14,%ebx
8010354b:	83 ec 4c             	sub    $0x4c,%esp
8010354e:	8d 7d c0             	lea    -0x40(%ebp),%edi
80103551:	eb 4b                	jmp    8010359e <procdump+0x5e>
80103553:	90                   	nop
80103554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103558:	8b 04 85 30 74 10 80 	mov    -0x7fef8bd0(,%eax,4),%eax
8010355f:	85 c0                	test   %eax,%eax
80103561:	74 47                	je     801035aa <procdump+0x6a>
80103563:	89 44 24 08          	mov    %eax,0x8(%esp)
80103567:	8b 43 10             	mov    0x10(%ebx),%eax
8010356a:	8d 53 6c             	lea    0x6c(%ebx),%edx
8010356d:	89 54 24 0c          	mov    %edx,0xc(%esp)
80103571:	c7 04 24 29 73 10 80 	movl   $0x80107329,(%esp)
80103578:	89 44 24 04          	mov    %eax,0x4(%esp)
8010357c:	e8 cf d2 ff ff       	call   80100850 <cprintf>
80103581:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80103585:	74 31                	je     801035b8 <procdump+0x78>
80103587:	c7 04 24 51 77 10 80 	movl   $0x80107751,(%esp)
8010358e:	e8 bd d2 ff ff       	call   80100850 <cprintf>
80103593:	83 c3 7c             	add    $0x7c,%ebx
80103596:	81 fb 14 4d 11 80    	cmp    $0x80114d14,%ebx
8010359c:	74 5a                	je     801035f8 <procdump+0xb8>
8010359e:	8b 43 0c             	mov    0xc(%ebx),%eax
801035a1:	85 c0                	test   %eax,%eax
801035a3:	74 ee                	je     80103593 <procdump+0x53>
801035a5:	83 f8 05             	cmp    $0x5,%eax
801035a8:	76 ae                	jbe    80103558 <procdump+0x18>
801035aa:	b8 25 73 10 80       	mov    $0x80107325,%eax
801035af:	eb b2                	jmp    80103563 <procdump+0x23>
801035b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035b8:	8b 43 1c             	mov    0x1c(%ebx),%eax
801035bb:	31 f6                	xor    %esi,%esi
801035bd:	89 7c 24 04          	mov    %edi,0x4(%esp)
801035c1:	8b 40 0c             	mov    0xc(%eax),%eax
801035c4:	83 c0 08             	add    $0x8,%eax
801035c7:	89 04 24             	mov    %eax,(%esp)
801035ca:	e8 91 0b 00 00       	call   80104160 <getcallerpcs>
801035cf:	90                   	nop
801035d0:	8b 04 b7             	mov    (%edi,%esi,4),%eax
801035d3:	85 c0                	test   %eax,%eax
801035d5:	74 b0                	je     80103587 <procdump+0x47>
801035d7:	83 c6 01             	add    $0x1,%esi
801035da:	89 44 24 04          	mov    %eax,0x4(%esp)
801035de:	c7 04 24 29 6e 10 80 	movl   $0x80106e29,(%esp)
801035e5:	e8 66 d2 ff ff       	call   80100850 <cprintf>
801035ea:	83 fe 0a             	cmp    $0xa,%esi
801035ed:	75 e1                	jne    801035d0 <procdump+0x90>
801035ef:	eb 96                	jmp    80103587 <procdump+0x47>
801035f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035f8:	83 c4 4c             	add    $0x4c,%esp
801035fb:	5b                   	pop    %ebx
801035fc:	5e                   	pop    %esi
801035fd:	5f                   	pop    %edi
801035fe:	5d                   	pop    %ebp
801035ff:	90                   	nop
80103600:	c3                   	ret    
80103601:	eb 0d                	jmp    80103610 <kill>
80103603:	90                   	nop
80103604:	90                   	nop
80103605:	90                   	nop
80103606:	90                   	nop
80103607:	90                   	nop
80103608:	90                   	nop
80103609:	90                   	nop
8010360a:	90                   	nop
8010360b:	90                   	nop
8010360c:	90                   	nop
8010360d:	90                   	nop
8010360e:	90                   	nop
8010360f:	90                   	nop

80103610 <kill>:
80103610:	55                   	push   %ebp
80103611:	89 e5                	mov    %esp,%ebp
80103613:	53                   	push   %ebx
80103614:	83 ec 14             	sub    $0x14,%esp
80103617:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010361a:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103621:	e8 ea 0c 00 00       	call   80104310 <acquire>
80103626:	b8 90 2e 11 80       	mov    $0x80112e90,%eax
8010362b:	39 1d 24 2e 11 80    	cmp    %ebx,0x80112e24
80103631:	75 0f                	jne    80103642 <kill+0x32>
80103633:	eb 5a                	jmp    8010368f <kill+0x7f>
80103635:	8d 76 00             	lea    0x0(%esi),%esi
80103638:	83 c0 7c             	add    $0x7c,%eax
8010363b:	3d 14 4d 11 80       	cmp    $0x80114d14,%eax
80103640:	74 36                	je     80103678 <kill+0x68>
80103642:	39 58 10             	cmp    %ebx,0x10(%eax)
80103645:	75 f1                	jne    80103638 <kill+0x28>
80103647:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010364b:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80103652:	74 14                	je     80103668 <kill+0x58>
80103654:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
8010365b:	e8 60 0c 00 00       	call   801042c0 <release>
80103660:	83 c4 14             	add    $0x14,%esp
80103663:	31 c0                	xor    %eax,%eax
80103665:	5b                   	pop    %ebx
80103666:	5d                   	pop    %ebp
80103667:	c3                   	ret    
80103668:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010366f:	eb e3                	jmp    80103654 <kill+0x44>
80103671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103678:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
8010367f:	e8 3c 0c 00 00       	call   801042c0 <release>
80103684:	83 c4 14             	add    $0x14,%esp
80103687:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010368c:	5b                   	pop    %ebx
8010368d:	5d                   	pop    %ebp
8010368e:	c3                   	ret    
8010368f:	b8 14 2e 11 80       	mov    $0x80112e14,%eax
80103694:	eb b1                	jmp    80103647 <kill+0x37>
80103696:	8d 76 00             	lea    0x0(%esi),%esi
80103699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036a0 <wakeup>:
801036a0:	55                   	push   %ebp
801036a1:	89 e5                	mov    %esp,%ebp
801036a3:	53                   	push   %ebx
801036a4:	83 ec 14             	sub    $0x14,%esp
801036a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801036aa:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
801036b1:	e8 5a 0c 00 00       	call   80104310 <acquire>
801036b6:	b8 14 2e 11 80       	mov    $0x80112e14,%eax
801036bb:	eb 0d                	jmp    801036ca <wakeup+0x2a>
801036bd:	8d 76 00             	lea    0x0(%esi),%esi
801036c0:	83 c0 7c             	add    $0x7c,%eax
801036c3:	3d 14 4d 11 80       	cmp    $0x80114d14,%eax
801036c8:	74 1e                	je     801036e8 <wakeup+0x48>
801036ca:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801036ce:	75 f0                	jne    801036c0 <wakeup+0x20>
801036d0:	3b 58 20             	cmp    0x20(%eax),%ebx
801036d3:	75 eb                	jne    801036c0 <wakeup+0x20>
801036d5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801036dc:	83 c0 7c             	add    $0x7c,%eax
801036df:	3d 14 4d 11 80       	cmp    $0x80114d14,%eax
801036e4:	75 e4                	jne    801036ca <wakeup+0x2a>
801036e6:	66 90                	xchg   %ax,%ax
801036e8:	c7 45 08 e0 2d 11 80 	movl   $0x80112de0,0x8(%ebp)
801036ef:	83 c4 14             	add    $0x14,%esp
801036f2:	5b                   	pop    %ebx
801036f3:	5d                   	pop    %ebp
801036f4:	e9 c7 0b 00 00       	jmp    801042c0 <release>
801036f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103700 <forkret>:
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	83 ec 18             	sub    $0x18,%esp
80103706:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
8010370d:	e8 ae 0b 00 00       	call   801042c0 <release>
80103712:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103717:	85 c0                	test   %eax,%eax
80103719:	75 05                	jne    80103720 <forkret+0x20>
8010371b:	c9                   	leave  
8010371c:	c3                   	ret    
8010371d:	8d 76 00             	lea    0x0(%esi),%esi
80103720:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
80103727:	00 00 00 
8010372a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80103731:	e8 aa e7 ff ff       	call   80101ee0 <iinit>
80103736:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010373d:	e8 2e f6 ff ff       	call   80102d70 <initlog>
80103742:	c9                   	leave  
80103743:	c3                   	ret    
80103744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010374a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103750 <allocproc>:
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	53                   	push   %ebx
80103754:	83 ec 14             	sub    $0x14,%esp
80103757:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
8010375e:	e8 ad 0b 00 00       	call   80104310 <acquire>
80103763:	8b 0d 20 2e 11 80    	mov    0x80112e20,%ecx
80103769:	85 c9                	test   %ecx,%ecx
8010376b:	0f 84 a5 00 00 00    	je     80103816 <allocproc+0xc6>
80103771:	bb 90 2e 11 80       	mov    $0x80112e90,%ebx
80103776:	eb 0b                	jmp    80103783 <allocproc+0x33>
80103778:	83 c3 7c             	add    $0x7c,%ebx
8010377b:	81 fb 14 4d 11 80    	cmp    $0x80114d14,%ebx
80103781:	74 7d                	je     80103800 <allocproc+0xb0>
80103783:	8b 53 0c             	mov    0xc(%ebx),%edx
80103786:	85 d2                	test   %edx,%edx
80103788:	75 ee                	jne    80103778 <allocproc+0x28>
8010378a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
80103791:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103796:	89 43 10             	mov    %eax,0x10(%ebx)
80103799:	83 c0 01             	add    $0x1,%eax
8010379c:	a3 00 a0 10 80       	mov    %eax,0x8010a000
801037a1:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
801037a8:	e8 13 0b 00 00       	call   801042c0 <release>
801037ad:	e8 7e eb ff ff       	call   80102330 <kalloc>
801037b2:	85 c0                	test   %eax,%eax
801037b4:	89 43 08             	mov    %eax,0x8(%ebx)
801037b7:	74 67                	je     80103820 <allocproc+0xd0>
801037b9:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801037bf:	89 53 18             	mov    %edx,0x18(%ebx)
801037c2:	c7 80 b0 0f 00 00 54 	movl   $0x80105554,0xfb0(%eax)
801037c9:	55 10 80 
801037cc:	05 9c 0f 00 00       	add    $0xf9c,%eax
801037d1:	89 43 1c             	mov    %eax,0x1c(%ebx)
801037d4:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801037db:	00 
801037dc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801037e3:	00 
801037e4:	89 04 24             	mov    %eax,(%esp)
801037e7:	e8 94 0b 00 00       	call   80104380 <memset>
801037ec:	8b 43 1c             	mov    0x1c(%ebx),%eax
801037ef:	c7 40 10 00 37 10 80 	movl   $0x80103700,0x10(%eax)
801037f6:	89 d8                	mov    %ebx,%eax
801037f8:	83 c4 14             	add    $0x14,%esp
801037fb:	5b                   	pop    %ebx
801037fc:	5d                   	pop    %ebp
801037fd:	c3                   	ret    
801037fe:	66 90                	xchg   %ax,%ax
80103800:	31 db                	xor    %ebx,%ebx
80103802:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103809:	e8 b2 0a 00 00       	call   801042c0 <release>
8010380e:	89 d8                	mov    %ebx,%eax
80103810:	83 c4 14             	add    $0x14,%esp
80103813:	5b                   	pop    %ebx
80103814:	5d                   	pop    %ebp
80103815:	c3                   	ret    
80103816:	bb 14 2e 11 80       	mov    $0x80112e14,%ebx
8010381b:	e9 6a ff ff ff       	jmp    8010378a <allocproc+0x3a>
80103820:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103827:	31 db                	xor    %ebx,%ebx
80103829:	eb cb                	jmp    801037f6 <allocproc+0xa6>
8010382b:	90                   	nop
8010382c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103830 <userinit>:
80103830:	55                   	push   %ebp
80103831:	89 e5                	mov    %esp,%ebp
80103833:	53                   	push   %ebx
80103834:	83 ec 14             	sub    $0x14,%esp
80103837:	e8 14 ff ff ff       	call   80103750 <allocproc>
8010383c:	89 c3                	mov    %eax,%ebx
8010383e:	a3 60 a6 10 80       	mov    %eax,0x8010a660
80103843:	e8 38 30 00 00       	call   80106880 <setupkvm>
80103848:	85 c0                	test   %eax,%eax
8010384a:	89 43 04             	mov    %eax,0x4(%ebx)
8010384d:	0f 84 ce 00 00 00    	je     80103921 <userinit+0xf1>
80103853:	89 04 24             	mov    %eax,(%esp)
80103856:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
8010385d:	00 
8010385e:	c7 44 24 04 00 a5 10 	movl   $0x8010a500,0x4(%esp)
80103865:	80 
80103866:	e8 55 2e 00 00       	call   801066c0 <inituvm>
8010386b:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
80103871:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
80103878:	00 
80103879:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80103880:	00 
80103881:	8b 43 18             	mov    0x18(%ebx),%eax
80103884:	89 04 24             	mov    %eax,(%esp)
80103887:	e8 f4 0a 00 00       	call   80104380 <memset>
8010388c:	8b 43 18             	mov    0x18(%ebx),%eax
8010388f:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
80103895:	8b 43 18             	mov    0x18(%ebx),%eax
80103898:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
8010389e:	8b 43 18             	mov    0x18(%ebx),%eax
801038a1:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038a5:	66 89 50 28          	mov    %dx,0x28(%eax)
801038a9:	8b 43 18             	mov    0x18(%ebx),%eax
801038ac:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038b0:	66 89 50 48          	mov    %dx,0x48(%eax)
801038b4:	8b 43 18             	mov    0x18(%ebx),%eax
801038b7:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
801038be:	8b 43 18             	mov    0x18(%ebx),%eax
801038c1:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
801038c8:	8b 43 18             	mov    0x18(%ebx),%eax
801038cb:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
801038d2:	8d 43 6c             	lea    0x6c(%ebx),%eax
801038d5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
801038dc:	00 
801038dd:	c7 44 24 04 4b 73 10 	movl   $0x8010734b,0x4(%esp)
801038e4:	80 
801038e5:	89 04 24             	mov    %eax,(%esp)
801038e8:	e8 73 0c 00 00       	call   80104560 <safestrcpy>
801038ed:	c7 04 24 54 73 10 80 	movl   $0x80107354,(%esp)
801038f4:	e8 c7 e5 ff ff       	call   80101ec0 <namei>
801038f9:	89 43 68             	mov    %eax,0x68(%ebx)
801038fc:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103903:	e8 08 0a 00 00       	call   80104310 <acquire>
80103908:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
8010390f:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103916:	e8 a5 09 00 00       	call   801042c0 <release>
8010391b:	83 c4 14             	add    $0x14,%esp
8010391e:	5b                   	pop    %ebx
8010391f:	5d                   	pop    %ebp
80103920:	c3                   	ret    
80103921:	c7 04 24 32 73 10 80 	movl   $0x80107332,(%esp)
80103928:	e8 83 ca ff ff       	call   801003b0 <panic>
8010392d:	8d 76 00             	lea    0x0(%esi),%esi

80103930 <mycpu>:
80103930:	55                   	push   %ebp
80103931:	89 e5                	mov    %esp,%ebp
80103933:	57                   	push   %edi
80103934:	56                   	push   %esi
80103935:	53                   	push   %ebx
80103936:	83 ec 1c             	sub    $0x1c,%esp
80103939:	9c                   	pushf  
8010393a:	58                   	pop    %eax
8010393b:	f6 c4 02             	test   $0x2,%ah
8010393e:	75 5e                	jne    8010399e <mycpu+0x6e>
80103940:	e8 db ed ff ff       	call   80102720 <lapicid>
80103945:	8b 35 c0 2d 11 80    	mov    0x80112dc0,%esi
8010394b:	85 f6                	test   %esi,%esi
8010394d:	7e 43                	jle    80103992 <mycpu+0x62>
8010394f:	0f b6 3d 40 28 11 80 	movzbl 0x80112840,%edi
80103956:	31 d2                	xor    %edx,%edx
80103958:	b9 f0 28 11 80       	mov    $0x801128f0,%ecx
8010395d:	bb 40 28 11 80       	mov    $0x80112840,%ebx
80103962:	39 f8                	cmp    %edi,%eax
80103964:	74 22                	je     80103988 <mycpu+0x58>
80103966:	66 90                	xchg   %ax,%ax
80103968:	83 c2 01             	add    $0x1,%edx
8010396b:	39 f2                	cmp    %esi,%edx
8010396d:	7d 23                	jge    80103992 <mycpu+0x62>
8010396f:	0f b6 19             	movzbl (%ecx),%ebx
80103972:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103978:	39 d8                	cmp    %ebx,%eax
8010397a:	75 ec                	jne    80103968 <mycpu+0x38>
8010397c:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
80103982:	8d 9a 40 28 11 80    	lea    -0x7feed7c0(%edx),%ebx
80103988:	83 c4 1c             	add    $0x1c,%esp
8010398b:	89 d8                	mov    %ebx,%eax
8010398d:	5b                   	pop    %ebx
8010398e:	5e                   	pop    %esi
8010398f:	5f                   	pop    %edi
80103990:	5d                   	pop    %ebp
80103991:	c3                   	ret    
80103992:	c7 04 24 56 73 10 80 	movl   $0x80107356,(%esp)
80103999:	e8 12 ca ff ff       	call   801003b0 <panic>
8010399e:	c7 04 24 08 74 10 80 	movl   $0x80107408,(%esp)
801039a5:	e8 06 ca ff ff       	call   801003b0 <panic>
801039aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801039b0 <scheduler>:
801039b0:	55                   	push   %ebp
801039b1:	89 e5                	mov    %esp,%ebp
801039b3:	57                   	push   %edi
801039b4:	56                   	push   %esi
801039b5:	53                   	push   %ebx
801039b6:	83 ec 1c             	sub    $0x1c,%esp
801039b9:	e8 72 ff ff ff       	call   80103930 <mycpu>
801039be:	89 c6                	mov    %eax,%esi
801039c0:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
801039c7:	00 00 00 
801039ca:	8d 78 04             	lea    0x4(%eax),%edi
801039cd:	8d 76 00             	lea    0x0(%esi),%esi
801039d0:	fb                   	sti    
801039d1:	bb 14 2e 11 80       	mov    $0x80112e14,%ebx
801039d6:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
801039dd:	e8 2e 09 00 00       	call   80104310 <acquire>
801039e2:	eb 0f                	jmp    801039f3 <scheduler+0x43>
801039e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801039e8:	83 c3 7c             	add    $0x7c,%ebx
801039eb:	81 fb 14 4d 11 80    	cmp    $0x80114d14,%ebx
801039f1:	74 45                	je     80103a38 <scheduler+0x88>
801039f3:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
801039f7:	75 ef                	jne    801039e8 <scheduler+0x38>
801039f9:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
801039ff:	89 1c 24             	mov    %ebx,(%esp)
80103a02:	e8 e9 31 00 00       	call   80106bf0 <switchuvm>
80103a07:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103a0a:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
80103a11:	83 c3 7c             	add    $0x7c,%ebx
80103a14:	89 3c 24             	mov    %edi,(%esp)
80103a17:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a1b:	e8 9b 0b 00 00       	call   801045bb <swtch>
80103a20:	e8 5b 2a 00 00       	call   80106480 <switchkvm>
80103a25:	81 fb 14 4d 11 80    	cmp    $0x80114d14,%ebx
80103a2b:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103a32:	00 00 00 
80103a35:	75 bc                	jne    801039f3 <scheduler+0x43>
80103a37:	90                   	nop
80103a38:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103a3f:	e8 7c 08 00 00       	call   801042c0 <release>
80103a44:	eb 8a                	jmp    801039d0 <scheduler+0x20>
80103a46:	8d 76 00             	lea    0x0(%esi),%esi
80103a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a50 <myproc>:
80103a50:	55                   	push   %ebp
80103a51:	89 e5                	mov    %esp,%ebp
80103a53:	53                   	push   %ebx
80103a54:	83 ec 04             	sub    $0x4,%esp
80103a57:	e8 d4 07 00 00       	call   80104230 <pushcli>
80103a5c:	e8 cf fe ff ff       	call   80103930 <mycpu>
80103a61:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103a67:	e8 54 07 00 00       	call   801041c0 <popcli>
80103a6c:	83 c4 04             	add    $0x4,%esp
80103a6f:	89 d8                	mov    %ebx,%eax
80103a71:	5b                   	pop    %ebx
80103a72:	5d                   	pop    %ebp
80103a73:	c3                   	ret    
80103a74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103a7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103a80 <fork>:
80103a80:	55                   	push   %ebp
80103a81:	89 e5                	mov    %esp,%ebp
80103a83:	57                   	push   %edi
80103a84:	56                   	push   %esi
80103a85:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103a8a:	53                   	push   %ebx
80103a8b:	83 ec 2c             	sub    $0x2c,%esp
80103a8e:	e8 bd ff ff ff       	call   80103a50 <myproc>
80103a93:	89 c3                	mov    %eax,%ebx
80103a95:	e8 b6 fc ff ff       	call   80103750 <allocproc>
80103a9a:	85 c0                	test   %eax,%eax
80103a9c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a9f:	0f 84 bf 00 00 00    	je     80103b64 <fork+0xe4>
80103aa5:	8b 03                	mov    (%ebx),%eax
80103aa7:	89 44 24 04          	mov    %eax,0x4(%esp)
80103aab:	8b 43 04             	mov    0x4(%ebx),%eax
80103aae:	89 04 24             	mov    %eax,(%esp)
80103ab1:	e8 7a 2e 00 00       	call   80106930 <copyuvm>
80103ab6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ab9:	85 c0                	test   %eax,%eax
80103abb:	89 42 04             	mov    %eax,0x4(%edx)
80103abe:	0f 84 aa 00 00 00    	je     80103b6e <fork+0xee>
80103ac4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ac7:	b9 13 00 00 00       	mov    $0x13,%ecx
80103acc:	8b 03                	mov    (%ebx),%eax
80103ace:	89 5a 14             	mov    %ebx,0x14(%edx)
80103ad1:	89 02                	mov    %eax,(%edx)
80103ad3:	8b 42 18             	mov    0x18(%edx),%eax
80103ad6:	8b 73 18             	mov    0x18(%ebx),%esi
80103ad9:	89 c7                	mov    %eax,%edi
80103adb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103add:	31 f6                	xor    %esi,%esi
80103adf:	8b 42 18             	mov    0x18(%edx),%eax
80103ae2:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103af0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103af4:	85 c0                	test   %eax,%eax
80103af6:	74 0f                	je     80103b07 <fork+0x87>
80103af8:	89 04 24             	mov    %eax,(%esp)
80103afb:	e8 80 d4 ff ff       	call   80100f80 <filedup>
80103b00:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b03:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103b07:	83 c6 01             	add    $0x1,%esi
80103b0a:	83 fe 10             	cmp    $0x10,%esi
80103b0d:	75 e1                	jne    80103af0 <fork+0x70>
80103b0f:	8b 43 68             	mov    0x68(%ebx),%eax
80103b12:	83 c3 6c             	add    $0x6c,%ebx
80103b15:	89 04 24             	mov    %eax,(%esp)
80103b18:	e8 63 d6 ff ff       	call   80101180 <idup>
80103b1d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b20:	89 42 68             	mov    %eax,0x68(%edx)
80103b23:	89 d0                	mov    %edx,%eax
80103b25:	83 c0 6c             	add    $0x6c,%eax
80103b28:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103b2f:	00 
80103b30:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103b34:	89 04 24             	mov    %eax,(%esp)
80103b37:	e8 24 0a 00 00       	call   80104560 <safestrcpy>
80103b3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103b3f:	8b 70 10             	mov    0x10(%eax),%esi
80103b42:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103b49:	e8 c2 07 00 00       	call   80104310 <acquire>
80103b4e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b51:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
80103b58:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103b5f:	e8 5c 07 00 00       	call   801042c0 <release>
80103b64:	83 c4 2c             	add    $0x2c,%esp
80103b67:	89 f0                	mov    %esi,%eax
80103b69:	5b                   	pop    %ebx
80103b6a:	5e                   	pop    %esi
80103b6b:	5f                   	pop    %edi
80103b6c:	5d                   	pop    %ebp
80103b6d:	c3                   	ret    
80103b6e:	8b 42 08             	mov    0x8(%edx),%eax
80103b71:	89 04 24             	mov    %eax,(%esp)
80103b74:	e8 07 e8 ff ff       	call   80102380 <kfree>
80103b79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103b7c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80103b83:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
80103b8a:	eb d8                	jmp    80103b64 <fork+0xe4>
80103b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103b90 <growproc>:
80103b90:	55                   	push   %ebp
80103b91:	89 e5                	mov    %esp,%ebp
80103b93:	83 ec 18             	sub    $0x18,%esp
80103b96:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80103b99:	89 75 fc             	mov    %esi,-0x4(%ebp)
80103b9c:	8b 75 08             	mov    0x8(%ebp),%esi
80103b9f:	e8 ac fe ff ff       	call   80103a50 <myproc>
80103ba4:	83 fe 00             	cmp    $0x0,%esi
80103ba7:	89 c3                	mov    %eax,%ebx
80103ba9:	8b 00                	mov    (%eax),%eax
80103bab:	7f 1b                	jg     80103bc8 <growproc+0x38>
80103bad:	75 39                	jne    80103be8 <growproc+0x58>
80103baf:	89 03                	mov    %eax,(%ebx)
80103bb1:	89 1c 24             	mov    %ebx,(%esp)
80103bb4:	e8 37 30 00 00       	call   80106bf0 <switchuvm>
80103bb9:	31 c0                	xor    %eax,%eax
80103bbb:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80103bbe:	8b 75 fc             	mov    -0x4(%ebp),%esi
80103bc1:	89 ec                	mov    %ebp,%esp
80103bc3:	5d                   	pop    %ebp
80103bc4:	c3                   	ret    
80103bc5:	8d 76 00             	lea    0x0(%esi),%esi
80103bc8:	01 c6                	add    %eax,%esi
80103bca:	89 74 24 08          	mov    %esi,0x8(%esp)
80103bce:	89 44 24 04          	mov    %eax,0x4(%esp)
80103bd2:	8b 43 04             	mov    0x4(%ebx),%eax
80103bd5:	89 04 24             	mov    %eax,(%esp)
80103bd8:	e8 33 2e 00 00       	call   80106a10 <allocuvm>
80103bdd:	85 c0                	test   %eax,%eax
80103bdf:	75 ce                	jne    80103baf <growproc+0x1f>
80103be1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103be6:	eb d3                	jmp    80103bbb <growproc+0x2b>
80103be8:	01 c6                	add    %eax,%esi
80103bea:	89 74 24 08          	mov    %esi,0x8(%esp)
80103bee:	89 44 24 04          	mov    %eax,0x4(%esp)
80103bf2:	8b 43 04             	mov    0x4(%ebx),%eax
80103bf5:	89 04 24             	mov    %eax,(%esp)
80103bf8:	e8 53 2b 00 00       	call   80106750 <deallocuvm>
80103bfd:	85 c0                	test   %eax,%eax
80103bff:	75 ae                	jne    80103baf <growproc+0x1f>
80103c01:	eb de                	jmp    80103be1 <growproc+0x51>
80103c03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c10 <sched>:
80103c10:	55                   	push   %ebp
80103c11:	89 e5                	mov    %esp,%ebp
80103c13:	56                   	push   %esi
80103c14:	53                   	push   %ebx
80103c15:	83 ec 10             	sub    $0x10,%esp
80103c18:	e8 33 fe ff ff       	call   80103a50 <myproc>
80103c1d:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103c24:	89 c3                	mov    %eax,%ebx
80103c26:	e8 45 06 00 00       	call   80104270 <holding>
80103c2b:	85 c0                	test   %eax,%eax
80103c2d:	74 4f                	je     80103c7e <sched+0x6e>
80103c2f:	e8 fc fc ff ff       	call   80103930 <mycpu>
80103c34:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103c3b:	75 65                	jne    80103ca2 <sched+0x92>
80103c3d:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103c41:	74 53                	je     80103c96 <sched+0x86>
80103c43:	9c                   	pushf  
80103c44:	58                   	pop    %eax
80103c45:	f6 c4 02             	test   $0x2,%ah
80103c48:	75 40                	jne    80103c8a <sched+0x7a>
80103c4a:	e8 e1 fc ff ff       	call   80103930 <mycpu>
80103c4f:	83 c3 1c             	add    $0x1c,%ebx
80103c52:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
80103c58:	e8 d3 fc ff ff       	call   80103930 <mycpu>
80103c5d:	8b 40 04             	mov    0x4(%eax),%eax
80103c60:	89 1c 24             	mov    %ebx,(%esp)
80103c63:	89 44 24 04          	mov    %eax,0x4(%esp)
80103c67:	e8 4f 09 00 00       	call   801045bb <swtch>
80103c6c:	e8 bf fc ff ff       	call   80103930 <mycpu>
80103c71:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80103c77:	83 c4 10             	add    $0x10,%esp
80103c7a:	5b                   	pop    %ebx
80103c7b:	5e                   	pop    %esi
80103c7c:	5d                   	pop    %ebp
80103c7d:	c3                   	ret    
80103c7e:	c7 04 24 66 73 10 80 	movl   $0x80107366,(%esp)
80103c85:	e8 26 c7 ff ff       	call   801003b0 <panic>
80103c8a:	c7 04 24 92 73 10 80 	movl   $0x80107392,(%esp)
80103c91:	e8 1a c7 ff ff       	call   801003b0 <panic>
80103c96:	c7 04 24 84 73 10 80 	movl   $0x80107384,(%esp)
80103c9d:	e8 0e c7 ff ff       	call   801003b0 <panic>
80103ca2:	c7 04 24 78 73 10 80 	movl   $0x80107378,(%esp)
80103ca9:	e8 02 c7 ff ff       	call   801003b0 <panic>
80103cae:	66 90                	xchg   %ax,%ax

80103cb0 <sleep>:
80103cb0:	55                   	push   %ebp
80103cb1:	89 e5                	mov    %esp,%ebp
80103cb3:	83 ec 28             	sub    $0x28,%esp
80103cb6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80103cb9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80103cbc:	89 75 f8             	mov    %esi,-0x8(%ebp)
80103cbf:	8b 75 08             	mov    0x8(%ebp),%esi
80103cc2:	89 7d fc             	mov    %edi,-0x4(%ebp)
80103cc5:	e8 86 fd ff ff       	call   80103a50 <myproc>
80103cca:	85 c0                	test   %eax,%eax
80103ccc:	89 c7                	mov    %eax,%edi
80103cce:	0f 84 8b 00 00 00    	je     80103d5f <sleep+0xaf>
80103cd4:	85 db                	test   %ebx,%ebx
80103cd6:	74 7b                	je     80103d53 <sleep+0xa3>
80103cd8:	81 fb e0 2d 11 80    	cmp    $0x80112de0,%ebx
80103cde:	74 50                	je     80103d30 <sleep+0x80>
80103ce0:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103ce7:	e8 24 06 00 00       	call   80104310 <acquire>
80103cec:	89 1c 24             	mov    %ebx,(%esp)
80103cef:	e8 cc 05 00 00       	call   801042c0 <release>
80103cf4:	89 77 20             	mov    %esi,0x20(%edi)
80103cf7:	c7 47 0c 02 00 00 00 	movl   $0x2,0xc(%edi)
80103cfe:	e8 0d ff ff ff       	call   80103c10 <sched>
80103d03:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%edi)
80103d0a:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103d11:	e8 aa 05 00 00       	call   801042c0 <release>
80103d16:	8b 75 f8             	mov    -0x8(%ebp),%esi
80103d19:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103d1c:	8b 7d fc             	mov    -0x4(%ebp),%edi
80103d1f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80103d22:	89 ec                	mov    %ebp,%esp
80103d24:	5d                   	pop    %ebp
80103d25:	e9 e6 05 00 00       	jmp    80104310 <acquire>
80103d2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d30:	89 70 20             	mov    %esi,0x20(%eax)
80103d33:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
80103d3a:	e8 d1 fe ff ff       	call   80103c10 <sched>
80103d3f:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%edi)
80103d46:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80103d49:	8b 75 f8             	mov    -0x8(%ebp),%esi
80103d4c:	8b 7d fc             	mov    -0x4(%ebp),%edi
80103d4f:	89 ec                	mov    %ebp,%esp
80103d51:	5d                   	pop    %ebp
80103d52:	c3                   	ret    
80103d53:	c7 04 24 ac 73 10 80 	movl   $0x801073ac,(%esp)
80103d5a:	e8 51 c6 ff ff       	call   801003b0 <panic>
80103d5f:	c7 04 24 a6 73 10 80 	movl   $0x801073a6,(%esp)
80103d66:	e8 45 c6 ff ff       	call   801003b0 <panic>
80103d6b:	90                   	nop
80103d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103d70 <wait>:
80103d70:	55                   	push   %ebp
80103d71:	89 e5                	mov    %esp,%ebp
80103d73:	56                   	push   %esi
80103d74:	53                   	push   %ebx
80103d75:	bb 14 2e 11 80       	mov    $0x80112e14,%ebx
80103d7a:	83 ec 20             	sub    $0x20,%esp
80103d7d:	e8 ce fc ff ff       	call   80103a50 <myproc>
80103d82:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103d89:	89 c6                	mov    %eax,%esi
80103d8b:	e8 80 05 00 00       	call   80104310 <acquire>
80103d90:	31 c0                	xor    %eax,%eax
80103d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d98:	81 fb 14 4d 11 80    	cmp    $0x80114d14,%ebx
80103d9e:	72 2a                	jb     80103dca <wait+0x5a>
80103da0:	85 c0                	test   %eax,%eax
80103da2:	74 4c                	je     80103df0 <wait+0x80>
80103da4:	8b 5e 24             	mov    0x24(%esi),%ebx
80103da7:	85 db                	test   %ebx,%ebx
80103da9:	75 45                	jne    80103df0 <wait+0x80>
80103dab:	bb 14 2e 11 80       	mov    $0x80112e14,%ebx
80103db0:	c7 44 24 04 e0 2d 11 	movl   $0x80112de0,0x4(%esp)
80103db7:	80 
80103db8:	89 34 24             	mov    %esi,(%esp)
80103dbb:	e8 f0 fe ff ff       	call   80103cb0 <sleep>
80103dc0:	31 c0                	xor    %eax,%eax
80103dc2:	81 fb 14 4d 11 80    	cmp    $0x80114d14,%ebx
80103dc8:	73 d6                	jae    80103da0 <wait+0x30>
80103dca:	3b 73 14             	cmp    0x14(%ebx),%esi
80103dcd:	74 09                	je     80103dd8 <wait+0x68>
80103dcf:	83 c3 7c             	add    $0x7c,%ebx
80103dd2:	eb c4                	jmp    80103d98 <wait+0x28>
80103dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103dd8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103de0:	74 26                	je     80103e08 <wait+0x98>
80103de2:	b8 01 00 00 00       	mov    $0x1,%eax
80103de7:	eb e6                	jmp    80103dcf <wait+0x5f>
80103de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103df0:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103df7:	e8 c4 04 00 00       	call   801042c0 <release>
80103dfc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103e01:	83 c4 20             	add    $0x20,%esp
80103e04:	5b                   	pop    %ebx
80103e05:	5e                   	pop    %esi
80103e06:	5d                   	pop    %ebp
80103e07:	c3                   	ret    
80103e08:	8b 43 10             	mov    0x10(%ebx),%eax
80103e0b:	8b 53 08             	mov    0x8(%ebx),%edx
80103e0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103e11:	89 14 24             	mov    %edx,(%esp)
80103e14:	e8 67 e5 ff ff       	call   80102380 <kfree>
80103e19:	8b 53 04             	mov    0x4(%ebx),%edx
80103e1c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103e23:	89 14 24             	mov    %edx,(%esp)
80103e26:	e8 d5 29 00 00       	call   80106800 <freevm>
80103e2b:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80103e32:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103e39:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103e3d:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80103e44:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103e4b:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103e52:	e8 69 04 00 00       	call   801042c0 <release>
80103e57:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103e5a:	eb a5                	jmp    80103e01 <wait+0x91>
80103e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103e60 <yield>:
80103e60:	55                   	push   %ebp
80103e61:	89 e5                	mov    %esp,%ebp
80103e63:	83 ec 18             	sub    $0x18,%esp
80103e66:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103e6d:	e8 9e 04 00 00       	call   80104310 <acquire>
80103e72:	e8 d9 fb ff ff       	call   80103a50 <myproc>
80103e77:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e7e:	e8 8d fd ff ff       	call   80103c10 <sched>
80103e83:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103e8a:	e8 31 04 00 00       	call   801042c0 <release>
80103e8f:	c9                   	leave  
80103e90:	c3                   	ret    
80103e91:	eb 0d                	jmp    80103ea0 <exit>
80103e93:	90                   	nop
80103e94:	90                   	nop
80103e95:	90                   	nop
80103e96:	90                   	nop
80103e97:	90                   	nop
80103e98:	90                   	nop
80103e99:	90                   	nop
80103e9a:	90                   	nop
80103e9b:	90                   	nop
80103e9c:	90                   	nop
80103e9d:	90                   	nop
80103e9e:	90                   	nop
80103e9f:	90                   	nop

80103ea0 <exit>:
80103ea0:	55                   	push   %ebp
80103ea1:	89 e5                	mov    %esp,%ebp
80103ea3:	56                   	push   %esi
80103ea4:	31 f6                	xor    %esi,%esi
80103ea6:	53                   	push   %ebx
80103ea7:	83 ec 10             	sub    $0x10,%esp
80103eaa:	e8 a1 fb ff ff       	call   80103a50 <myproc>
80103eaf:	3b 05 60 a6 10 80    	cmp    0x8010a660,%eax
80103eb5:	89 c3                	mov    %eax,%ebx
80103eb7:	0f 84 ed 00 00 00    	je     80103faa <exit+0x10a>
80103ebd:	8d 76 00             	lea    0x0(%esi),%esi
80103ec0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103ec4:	85 c0                	test   %eax,%eax
80103ec6:	74 10                	je     80103ed8 <exit+0x38>
80103ec8:	89 04 24             	mov    %eax,(%esp)
80103ecb:	e8 80 d1 ff ff       	call   80101050 <fileclose>
80103ed0:	c7 44 b3 28 00 00 00 	movl   $0x0,0x28(%ebx,%esi,4)
80103ed7:	00 
80103ed8:	83 c6 01             	add    $0x1,%esi
80103edb:	83 fe 10             	cmp    $0x10,%esi
80103ede:	75 e0                	jne    80103ec0 <exit+0x20>
80103ee0:	e8 1b ee ff ff       	call   80102d00 <begin_op>
80103ee5:	8b 43 68             	mov    0x68(%ebx),%eax
80103ee8:	89 04 24             	mov    %eax,(%esp)
80103eeb:	e8 80 db ff ff       	call   80101a70 <iput>
80103ef0:	e8 db ec ff ff       	call   80102bd0 <end_op>
80103ef5:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)
80103efc:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103f03:	e8 08 04 00 00       	call   80104310 <acquire>
80103f08:	8b 43 14             	mov    0x14(%ebx),%eax
80103f0b:	ba 14 2e 11 80       	mov    $0x80112e14,%edx
80103f10:	eb 11                	jmp    80103f23 <exit+0x83>
80103f12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103f18:	83 c2 7c             	add    $0x7c,%edx
80103f1b:	81 fa 14 4d 11 80    	cmp    $0x80114d14,%edx
80103f21:	74 1d                	je     80103f40 <exit+0xa0>
80103f23:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103f27:	75 ef                	jne    80103f18 <exit+0x78>
80103f29:	3b 42 20             	cmp    0x20(%edx),%eax
80103f2c:	75 ea                	jne    80103f18 <exit+0x78>
80103f2e:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
80103f35:	83 c2 7c             	add    $0x7c,%edx
80103f38:	81 fa 14 4d 11 80    	cmp    $0x80114d14,%edx
80103f3e:	75 e3                	jne    80103f23 <exit+0x83>
80103f40:	a1 60 a6 10 80       	mov    0x8010a660,%eax
80103f45:	b9 14 2e 11 80       	mov    $0x80112e14,%ecx
80103f4a:	eb 0f                	jmp    80103f5b <exit+0xbb>
80103f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f50:	83 c1 7c             	add    $0x7c,%ecx
80103f53:	81 f9 14 4d 11 80    	cmp    $0x80114d14,%ecx
80103f59:	74 37                	je     80103f92 <exit+0xf2>
80103f5b:	3b 59 14             	cmp    0x14(%ecx),%ebx
80103f5e:	75 f0                	jne    80103f50 <exit+0xb0>
80103f60:	83 79 0c 05          	cmpl   $0x5,0xc(%ecx)
80103f64:	89 41 14             	mov    %eax,0x14(%ecx)
80103f67:	75 e7                	jne    80103f50 <exit+0xb0>
80103f69:	ba 14 2e 11 80       	mov    $0x80112e14,%edx
80103f6e:	eb 0b                	jmp    80103f7b <exit+0xdb>
80103f70:	83 c2 7c             	add    $0x7c,%edx
80103f73:	81 fa 14 4d 11 80    	cmp    $0x80114d14,%edx
80103f79:	74 d5                	je     80103f50 <exit+0xb0>
80103f7b:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103f7f:	75 ef                	jne    80103f70 <exit+0xd0>
80103f81:	3b 42 20             	cmp    0x20(%edx),%eax
80103f84:	75 ea                	jne    80103f70 <exit+0xd0>
80103f86:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
80103f8d:	8d 76 00             	lea    0x0(%esi),%esi
80103f90:	eb de                	jmp    80103f70 <exit+0xd0>
80103f92:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
80103f99:	e8 72 fc ff ff       	call   80103c10 <sched>
80103f9e:	c7 04 24 ca 73 10 80 	movl   $0x801073ca,(%esp)
80103fa5:	e8 06 c4 ff ff       	call   801003b0 <panic>
80103faa:	c7 04 24 bd 73 10 80 	movl   $0x801073bd,(%esp)
80103fb1:	e8 fa c3 ff ff       	call   801003b0 <panic>
80103fb6:	8d 76 00             	lea    0x0(%esi),%esi
80103fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fc0 <cpuid>:
80103fc0:	55                   	push   %ebp
80103fc1:	89 e5                	mov    %esp,%ebp
80103fc3:	83 ec 08             	sub    $0x8,%esp
80103fc6:	e8 65 f9 ff ff       	call   80103930 <mycpu>
80103fcb:	c9                   	leave  
80103fcc:	2d 40 28 11 80       	sub    $0x80112840,%eax
80103fd1:	c1 f8 04             	sar    $0x4,%eax
80103fd4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
80103fda:	c3                   	ret    
80103fdb:	90                   	nop
80103fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103fe0 <pinit>:
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	83 ec 18             	sub    $0x18,%esp
80103fe6:	c7 44 24 04 d6 73 10 	movl   $0x801073d6,0x4(%esp)
80103fed:	80 
80103fee:	c7 04 24 e0 2d 11 80 	movl   $0x80112de0,(%esp)
80103ff5:	e8 46 01 00 00       	call   80104140 <initlock>
80103ffa:	c9                   	leave  
80103ffb:	c3                   	ret    
80103ffc:	66 90                	xchg   %ax,%ax
80103ffe:	66 90                	xchg   %ax,%ax

80104000 <holdingsleep>:
80104000:	55                   	push   %ebp
80104001:	89 e5                	mov    %esp,%ebp
80104003:	83 ec 28             	sub    $0x28,%esp
80104006:	89 75 f8             	mov    %esi,-0x8(%ebp)
80104009:	8b 75 08             	mov    0x8(%ebp),%esi
8010400c:	89 5d f4             	mov    %ebx,-0xc(%ebp)
8010400f:	89 7d fc             	mov    %edi,-0x4(%ebp)
80104012:	8d 5e 04             	lea    0x4(%esi),%ebx
80104015:	89 1c 24             	mov    %ebx,(%esp)
80104018:	e8 f3 02 00 00       	call   80104310 <acquire>
8010401d:	8b 06                	mov    (%esi),%eax
8010401f:	85 c0                	test   %eax,%eax
80104021:	75 1d                	jne    80104040 <holdingsleep+0x40>
80104023:	31 ff                	xor    %edi,%edi
80104025:	89 1c 24             	mov    %ebx,(%esp)
80104028:	e8 93 02 00 00       	call   801042c0 <release>
8010402d:	89 f8                	mov    %edi,%eax
8010402f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104032:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104035:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104038:	89 ec                	mov    %ebp,%esp
8010403a:	5d                   	pop    %ebp
8010403b:	c3                   	ret    
8010403c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104040:	8b 76 3c             	mov    0x3c(%esi),%esi
80104043:	bf 01 00 00 00       	mov    $0x1,%edi
80104048:	e8 03 fa ff ff       	call   80103a50 <myproc>
8010404d:	3b 70 10             	cmp    0x10(%eax),%esi
80104050:	75 d1                	jne    80104023 <holdingsleep+0x23>
80104052:	eb d1                	jmp    80104025 <holdingsleep+0x25>
80104054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010405a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104060 <releasesleep>:
80104060:	55                   	push   %ebp
80104061:	89 e5                	mov    %esp,%ebp
80104063:	83 ec 18             	sub    $0x18,%esp
80104066:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104069:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010406c:	89 75 fc             	mov    %esi,-0x4(%ebp)
8010406f:	8d 73 04             	lea    0x4(%ebx),%esi
80104072:	89 34 24             	mov    %esi,(%esp)
80104075:	e8 96 02 00 00       	call   80104310 <acquire>
8010407a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104080:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104087:	89 1c 24             	mov    %ebx,(%esp)
8010408a:	e8 11 f6 ff ff       	call   801036a0 <wakeup>
8010408f:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104092:	89 75 08             	mov    %esi,0x8(%ebp)
80104095:	8b 75 fc             	mov    -0x4(%ebp),%esi
80104098:	89 ec                	mov    %ebp,%esp
8010409a:	5d                   	pop    %ebp
8010409b:	e9 20 02 00 00       	jmp    801042c0 <release>

801040a0 <acquiresleep>:
801040a0:	55                   	push   %ebp
801040a1:	89 e5                	mov    %esp,%ebp
801040a3:	56                   	push   %esi
801040a4:	53                   	push   %ebx
801040a5:	83 ec 10             	sub    $0x10,%esp
801040a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040ab:	8d 73 04             	lea    0x4(%ebx),%esi
801040ae:	89 34 24             	mov    %esi,(%esp)
801040b1:	e8 5a 02 00 00       	call   80104310 <acquire>
801040b6:	8b 0b                	mov    (%ebx),%ecx
801040b8:	85 c9                	test   %ecx,%ecx
801040ba:	74 16                	je     801040d2 <acquiresleep+0x32>
801040bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801040c0:	89 74 24 04          	mov    %esi,0x4(%esp)
801040c4:	89 1c 24             	mov    %ebx,(%esp)
801040c7:	e8 e4 fb ff ff       	call   80103cb0 <sleep>
801040cc:	8b 13                	mov    (%ebx),%edx
801040ce:	85 d2                	test   %edx,%edx
801040d0:	75 ee                	jne    801040c0 <acquiresleep+0x20>
801040d2:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
801040d8:	e8 73 f9 ff ff       	call   80103a50 <myproc>
801040dd:	8b 40 10             	mov    0x10(%eax),%eax
801040e0:	89 43 3c             	mov    %eax,0x3c(%ebx)
801040e3:	89 75 08             	mov    %esi,0x8(%ebp)
801040e6:	83 c4 10             	add    $0x10,%esp
801040e9:	5b                   	pop    %ebx
801040ea:	5e                   	pop    %esi
801040eb:	5d                   	pop    %ebp
801040ec:	e9 cf 01 00 00       	jmp    801042c0 <release>
801040f1:	eb 0d                	jmp    80104100 <initsleeplock>
801040f3:	90                   	nop
801040f4:	90                   	nop
801040f5:	90                   	nop
801040f6:	90                   	nop
801040f7:	90                   	nop
801040f8:	90                   	nop
801040f9:	90                   	nop
801040fa:	90                   	nop
801040fb:	90                   	nop
801040fc:	90                   	nop
801040fd:	90                   	nop
801040fe:	90                   	nop
801040ff:	90                   	nop

80104100 <initsleeplock>:
80104100:	55                   	push   %ebp
80104101:	89 e5                	mov    %esp,%ebp
80104103:	53                   	push   %ebx
80104104:	83 ec 14             	sub    $0x14,%esp
80104107:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010410a:	c7 44 24 04 48 74 10 	movl   $0x80107448,0x4(%esp)
80104111:	80 
80104112:	8d 43 04             	lea    0x4(%ebx),%eax
80104115:	89 04 24             	mov    %eax,(%esp)
80104118:	e8 23 00 00 00       	call   80104140 <initlock>
8010411d:	8b 45 0c             	mov    0xc(%ebp),%eax
80104120:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104126:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010412d:	89 43 38             	mov    %eax,0x38(%ebx)
80104130:	83 c4 14             	add    $0x14,%esp
80104133:	5b                   	pop    %ebx
80104134:	5d                   	pop    %ebp
80104135:	c3                   	ret    
80104136:	66 90                	xchg   %ax,%ax
80104138:	66 90                	xchg   %ax,%ax
8010413a:	66 90                	xchg   %ax,%ax
8010413c:	66 90                	xchg   %ax,%ax
8010413e:	66 90                	xchg   %ax,%ax

80104140 <initlock>:
80104140:	55                   	push   %ebp
80104141:	89 e5                	mov    %esp,%ebp
80104143:	8b 45 08             	mov    0x8(%ebp),%eax
80104146:	8b 55 0c             	mov    0xc(%ebp),%edx
80104149:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010414f:	89 50 04             	mov    %edx,0x4(%eax)
80104152:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104159:	5d                   	pop    %ebp
8010415a:	c3                   	ret    
8010415b:	90                   	nop
8010415c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104160 <getcallerpcs>:
80104160:	55                   	push   %ebp
80104161:	31 c0                	xor    %eax,%eax
80104163:	89 e5                	mov    %esp,%ebp
80104165:	53                   	push   %ebx
80104166:	8b 55 08             	mov    0x8(%ebp),%edx
80104169:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010416c:	83 ea 08             	sub    $0x8,%edx
8010416f:	90                   	nop
80104170:	8d 8a 00 00 00 80    	lea    -0x80000000(%edx),%ecx
80104176:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
8010417c:	77 1a                	ja     80104198 <getcallerpcs+0x38>
8010417e:	8b 4a 04             	mov    0x4(%edx),%ecx
80104181:	89 0c 83             	mov    %ecx,(%ebx,%eax,4)
80104184:	83 c0 01             	add    $0x1,%eax
80104187:	8b 12                	mov    (%edx),%edx
80104189:	83 f8 0a             	cmp    $0xa,%eax
8010418c:	75 e2                	jne    80104170 <getcallerpcs+0x10>
8010418e:	5b                   	pop    %ebx
8010418f:	5d                   	pop    %ebp
80104190:	c3                   	ret    
80104191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104198:	83 f8 09             	cmp    $0x9,%eax
8010419b:	7f f1                	jg     8010418e <getcallerpcs+0x2e>
8010419d:	8d 14 83             	lea    (%ebx,%eax,4),%edx
801041a0:	83 c0 01             	add    $0x1,%eax
801041a3:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
801041a9:	83 c2 04             	add    $0x4,%edx
801041ac:	83 f8 0a             	cmp    $0xa,%eax
801041af:	75 ef                	jne    801041a0 <getcallerpcs+0x40>
801041b1:	5b                   	pop    %ebx
801041b2:	5d                   	pop    %ebp
801041b3:	c3                   	ret    
801041b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801041c0 <popcli>:
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	83 ec 18             	sub    $0x18,%esp
801041c6:	9c                   	pushf  
801041c7:	58                   	pop    %eax
801041c8:	f6 c4 02             	test   $0x2,%ah
801041cb:	75 49                	jne    80104216 <popcli+0x56>
801041cd:	e8 5e f7 ff ff       	call   80103930 <mycpu>
801041d2:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801041d8:	83 ea 01             	sub    $0x1,%edx
801041db:	85 d2                	test   %edx,%edx
801041dd:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801041e3:	78 25                	js     8010420a <popcli+0x4a>
801041e5:	e8 46 f7 ff ff       	call   80103930 <mycpu>
801041ea:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801041f0:	85 d2                	test   %edx,%edx
801041f2:	74 04                	je     801041f8 <popcli+0x38>
801041f4:	c9                   	leave  
801041f5:	c3                   	ret    
801041f6:	66 90                	xchg   %ax,%ax
801041f8:	e8 33 f7 ff ff       	call   80103930 <mycpu>
801041fd:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
80104203:	85 c0                	test   %eax,%eax
80104205:	74 ed                	je     801041f4 <popcli+0x34>
80104207:	fb                   	sti    
80104208:	c9                   	leave  
80104209:	c3                   	ret    
8010420a:	c7 04 24 6a 74 10 80 	movl   $0x8010746a,(%esp)
80104211:	e8 9a c1 ff ff       	call   801003b0 <panic>
80104216:	c7 04 24 53 74 10 80 	movl   $0x80107453,(%esp)
8010421d:	e8 8e c1 ff ff       	call   801003b0 <panic>
80104222:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104230 <pushcli>:
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	53                   	push   %ebx
80104234:	83 ec 04             	sub    $0x4,%esp
80104237:	9c                   	pushf  
80104238:	5b                   	pop    %ebx
80104239:	fa                   	cli    
8010423a:	e8 f1 f6 ff ff       	call   80103930 <mycpu>
8010423f:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104245:	85 c9                	test   %ecx,%ecx
80104247:	75 11                	jne    8010425a <pushcli+0x2a>
80104249:	e8 e2 f6 ff ff       	call   80103930 <mycpu>
8010424e:	81 e3 00 02 00 00    	and    $0x200,%ebx
80104254:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
8010425a:	e8 d1 f6 ff ff       	call   80103930 <mycpu>
8010425f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104266:	83 c4 04             	add    $0x4,%esp
80104269:	5b                   	pop    %ebx
8010426a:	5d                   	pop    %ebp
8010426b:	c3                   	ret    
8010426c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104270 <holding>:
80104270:	55                   	push   %ebp
80104271:	89 e5                	mov    %esp,%ebp
80104273:	83 ec 08             	sub    $0x8,%esp
80104276:	89 1c 24             	mov    %ebx,(%esp)
80104279:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010427c:	89 74 24 04          	mov    %esi,0x4(%esp)
80104280:	e8 ab ff ff ff       	call   80104230 <pushcli>
80104285:	8b 33                	mov    (%ebx),%esi
80104287:	85 f6                	test   %esi,%esi
80104289:	75 15                	jne    801042a0 <holding+0x30>
8010428b:	31 f6                	xor    %esi,%esi
8010428d:	e8 2e ff ff ff       	call   801041c0 <popcli>
80104292:	89 f0                	mov    %esi,%eax
80104294:	8b 1c 24             	mov    (%esp),%ebx
80104297:	8b 74 24 04          	mov    0x4(%esp),%esi
8010429b:	89 ec                	mov    %ebp,%esp
8010429d:	5d                   	pop    %ebp
8010429e:	c3                   	ret    
8010429f:	90                   	nop
801042a0:	8b 5b 08             	mov    0x8(%ebx),%ebx
801042a3:	be 01 00 00 00       	mov    $0x1,%esi
801042a8:	e8 83 f6 ff ff       	call   80103930 <mycpu>
801042ad:	39 c3                	cmp    %eax,%ebx
801042af:	75 da                	jne    8010428b <holding+0x1b>
801042b1:	eb da                	jmp    8010428d <holding+0x1d>
801042b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042c0 <release>:
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	53                   	push   %ebx
801042c4:	83 ec 14             	sub    $0x14,%esp
801042c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042ca:	89 1c 24             	mov    %ebx,(%esp)
801042cd:	e8 9e ff ff ff       	call   80104270 <holding>
801042d2:	85 c0                	test   %eax,%eax
801042d4:	74 23                	je     801042f9 <release+0x39>
801042d6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801042dd:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801042e4:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801042e9:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801042ef:	83 c4 14             	add    $0x14,%esp
801042f2:	5b                   	pop    %ebx
801042f3:	5d                   	pop    %ebp
801042f4:	e9 c7 fe ff ff       	jmp    801041c0 <popcli>
801042f9:	c7 04 24 71 74 10 80 	movl   $0x80107471,(%esp)
80104300:	e8 ab c0 ff ff       	call   801003b0 <panic>
80104305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104310 <acquire>:
80104310:	55                   	push   %ebp
80104311:	89 e5                	mov    %esp,%ebp
80104313:	53                   	push   %ebx
80104314:	83 ec 14             	sub    $0x14,%esp
80104317:	e8 14 ff ff ff       	call   80104230 <pushcli>
8010431c:	8b 45 08             	mov    0x8(%ebp),%eax
8010431f:	89 04 24             	mov    %eax,(%esp)
80104322:	e8 49 ff ff ff       	call   80104270 <holding>
80104327:	85 c0                	test   %eax,%eax
80104329:	75 3c                	jne    80104367 <acquire+0x57>
8010432b:	b9 01 00 00 00       	mov    $0x1,%ecx
80104330:	8b 55 08             	mov    0x8(%ebp),%edx
80104333:	89 c8                	mov    %ecx,%eax
80104335:	f0 87 02             	lock xchg %eax,(%edx)
80104338:	85 c0                	test   %eax,%eax
8010433a:	75 f4                	jne    80104330 <acquire+0x20>
8010433c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104341:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104344:	e8 e7 f5 ff ff       	call   80103930 <mycpu>
80104349:	89 43 08             	mov    %eax,0x8(%ebx)
8010434c:	8b 45 08             	mov    0x8(%ebp),%eax
8010434f:	83 c0 0c             	add    $0xc,%eax
80104352:	89 44 24 04          	mov    %eax,0x4(%esp)
80104356:	8d 45 08             	lea    0x8(%ebp),%eax
80104359:	89 04 24             	mov    %eax,(%esp)
8010435c:	e8 ff fd ff ff       	call   80104160 <getcallerpcs>
80104361:	83 c4 14             	add    $0x14,%esp
80104364:	5b                   	pop    %ebx
80104365:	5d                   	pop    %ebp
80104366:	c3                   	ret    
80104367:	c7 04 24 79 74 10 80 	movl   $0x80107479,(%esp)
8010436e:	e8 3d c0 ff ff       	call   801003b0 <panic>
80104373:	66 90                	xchg   %ax,%ax
80104375:	66 90                	xchg   %ax,%ax
80104377:	66 90                	xchg   %ax,%ax
80104379:	66 90                	xchg   %ax,%ax
8010437b:	66 90                	xchg   %ax,%ax
8010437d:	66 90                	xchg   %ax,%ax
8010437f:	90                   	nop

80104380 <memset>:
80104380:	55                   	push   %ebp
80104381:	89 e5                	mov    %esp,%ebp
80104383:	83 ec 08             	sub    $0x8,%esp
80104386:	8b 55 08             	mov    0x8(%ebp),%edx
80104389:	89 1c 24             	mov    %ebx,(%esp)
8010438c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010438f:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104393:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104396:	f6 c2 03             	test   $0x3,%dl
80104399:	75 05                	jne    801043a0 <memset+0x20>
8010439b:	f6 c1 03             	test   $0x3,%cl
8010439e:	74 18                	je     801043b8 <memset+0x38>
801043a0:	89 d7                	mov    %edx,%edi
801043a2:	fc                   	cld    
801043a3:	f3 aa                	rep stos %al,%es:(%edi)
801043a5:	89 d0                	mov    %edx,%eax
801043a7:	8b 1c 24             	mov    (%esp),%ebx
801043aa:	8b 7c 24 04          	mov    0x4(%esp),%edi
801043ae:	89 ec                	mov    %ebp,%esp
801043b0:	5d                   	pop    %ebp
801043b1:	c3                   	ret    
801043b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043b8:	0f b6 f8             	movzbl %al,%edi
801043bb:	89 f8                	mov    %edi,%eax
801043bd:	89 fb                	mov    %edi,%ebx
801043bf:	c1 e0 18             	shl    $0x18,%eax
801043c2:	c1 e3 10             	shl    $0x10,%ebx
801043c5:	09 d8                	or     %ebx,%eax
801043c7:	09 f8                	or     %edi,%eax
801043c9:	c1 e7 08             	shl    $0x8,%edi
801043cc:	09 f8                	or     %edi,%eax
801043ce:	89 d7                	mov    %edx,%edi
801043d0:	c1 e9 02             	shr    $0x2,%ecx
801043d3:	fc                   	cld    
801043d4:	f3 ab                	rep stos %eax,%es:(%edi)
801043d6:	eb cd                	jmp    801043a5 <memset+0x25>
801043d8:	90                   	nop
801043d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801043e0 <memcmp>:
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	57                   	push   %edi
801043e4:	56                   	push   %esi
801043e5:	53                   	push   %ebx
801043e6:	8b 55 10             	mov    0x10(%ebp),%edx
801043e9:	8b 75 08             	mov    0x8(%ebp),%esi
801043ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
801043ef:	85 d2                	test   %edx,%edx
801043f1:	74 2d                	je     80104420 <memcmp+0x40>
801043f3:	0f b6 1e             	movzbl (%esi),%ebx
801043f6:	0f b6 0f             	movzbl (%edi),%ecx
801043f9:	38 cb                	cmp    %cl,%bl
801043fb:	75 2b                	jne    80104428 <memcmp+0x48>
801043fd:	83 ea 01             	sub    $0x1,%edx
80104400:	31 c0                	xor    %eax,%eax
80104402:	eb 18                	jmp    8010441c <memcmp+0x3c>
80104404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104408:	0f b6 5c 06 01       	movzbl 0x1(%esi,%eax,1),%ebx
8010440d:	83 ea 01             	sub    $0x1,%edx
80104410:	0f b6 4c 07 01       	movzbl 0x1(%edi,%eax,1),%ecx
80104415:	83 c0 01             	add    $0x1,%eax
80104418:	38 cb                	cmp    %cl,%bl
8010441a:	75 0c                	jne    80104428 <memcmp+0x48>
8010441c:	85 d2                	test   %edx,%edx
8010441e:	75 e8                	jne    80104408 <memcmp+0x28>
80104420:	31 c0                	xor    %eax,%eax
80104422:	5b                   	pop    %ebx
80104423:	5e                   	pop    %esi
80104424:	5f                   	pop    %edi
80104425:	5d                   	pop    %ebp
80104426:	c3                   	ret    
80104427:	90                   	nop
80104428:	0f b6 c3             	movzbl %bl,%eax
8010442b:	0f b6 c9             	movzbl %cl,%ecx
8010442e:	29 c8                	sub    %ecx,%eax
80104430:	5b                   	pop    %ebx
80104431:	5e                   	pop    %esi
80104432:	5f                   	pop    %edi
80104433:	5d                   	pop    %ebp
80104434:	c3                   	ret    
80104435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104440 <memmove>:
80104440:	55                   	push   %ebp
80104441:	89 e5                	mov    %esp,%ebp
80104443:	57                   	push   %edi
80104444:	56                   	push   %esi
80104445:	53                   	push   %ebx
80104446:	8b 45 08             	mov    0x8(%ebp),%eax
80104449:	8b 75 0c             	mov    0xc(%ebp),%esi
8010444c:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010444f:	39 c6                	cmp    %eax,%esi
80104451:	73 2d                	jae    80104480 <memmove+0x40>
80104453:	8d 3c 1e             	lea    (%esi,%ebx,1),%edi
80104456:	39 f8                	cmp    %edi,%eax
80104458:	73 26                	jae    80104480 <memmove+0x40>
8010445a:	85 db                	test   %ebx,%ebx
8010445c:	74 1d                	je     8010447b <memmove+0x3b>
8010445e:	8d 34 18             	lea    (%eax,%ebx,1),%esi
80104461:	31 d2                	xor    %edx,%edx
80104463:	90                   	nop
80104464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104468:	0f b6 4c 17 ff       	movzbl -0x1(%edi,%edx,1),%ecx
8010446d:	88 4c 16 ff          	mov    %cl,-0x1(%esi,%edx,1)
80104471:	83 ea 01             	sub    $0x1,%edx
80104474:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
80104477:	85 c9                	test   %ecx,%ecx
80104479:	75 ed                	jne    80104468 <memmove+0x28>
8010447b:	5b                   	pop    %ebx
8010447c:	5e                   	pop    %esi
8010447d:	5f                   	pop    %edi
8010447e:	5d                   	pop    %ebp
8010447f:	c3                   	ret    
80104480:	31 d2                	xor    %edx,%edx
80104482:	85 db                	test   %ebx,%ebx
80104484:	74 f5                	je     8010447b <memmove+0x3b>
80104486:	66 90                	xchg   %ax,%ax
80104488:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
8010448c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010448f:	83 c2 01             	add    $0x1,%edx
80104492:	39 d3                	cmp    %edx,%ebx
80104494:	75 f2                	jne    80104488 <memmove+0x48>
80104496:	5b                   	pop    %ebx
80104497:	5e                   	pop    %esi
80104498:	5f                   	pop    %edi
80104499:	5d                   	pop    %ebp
8010449a:	c3                   	ret    
8010449b:	90                   	nop
8010449c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044a0 <memcpy>:
801044a0:	55                   	push   %ebp
801044a1:	89 e5                	mov    %esp,%ebp
801044a3:	5d                   	pop    %ebp
801044a4:	eb 9a                	jmp    80104440 <memmove>
801044a6:	8d 76 00             	lea    0x0(%esi),%esi
801044a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044b0 <strncmp>:
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	57                   	push   %edi
801044b4:	56                   	push   %esi
801044b5:	53                   	push   %ebx
801044b6:	8b 7d 10             	mov    0x10(%ebp),%edi
801044b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801044bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801044bf:	85 ff                	test   %edi,%edi
801044c1:	74 3d                	je     80104500 <strncmp+0x50>
801044c3:	0f b6 01             	movzbl (%ecx),%eax
801044c6:	84 c0                	test   %al,%al
801044c8:	75 18                	jne    801044e2 <strncmp+0x32>
801044ca:	eb 3c                	jmp    80104508 <strncmp+0x58>
801044cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044d0:	83 ef 01             	sub    $0x1,%edi
801044d3:	74 2b                	je     80104500 <strncmp+0x50>
801044d5:	83 c1 01             	add    $0x1,%ecx
801044d8:	83 c3 01             	add    $0x1,%ebx
801044db:	0f b6 01             	movzbl (%ecx),%eax
801044de:	84 c0                	test   %al,%al
801044e0:	74 26                	je     80104508 <strncmp+0x58>
801044e2:	0f b6 33             	movzbl (%ebx),%esi
801044e5:	89 f2                	mov    %esi,%edx
801044e7:	38 d0                	cmp    %dl,%al
801044e9:	74 e5                	je     801044d0 <strncmp+0x20>
801044eb:	81 e6 ff 00 00 00    	and    $0xff,%esi
801044f1:	0f b6 c0             	movzbl %al,%eax
801044f4:	29 f0                	sub    %esi,%eax
801044f6:	5b                   	pop    %ebx
801044f7:	5e                   	pop    %esi
801044f8:	5f                   	pop    %edi
801044f9:	5d                   	pop    %ebp
801044fa:	c3                   	ret    
801044fb:	90                   	nop
801044fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104500:	31 c0                	xor    %eax,%eax
80104502:	5b                   	pop    %ebx
80104503:	5e                   	pop    %esi
80104504:	5f                   	pop    %edi
80104505:	5d                   	pop    %ebp
80104506:	c3                   	ret    
80104507:	90                   	nop
80104508:	0f b6 33             	movzbl (%ebx),%esi
8010450b:	eb de                	jmp    801044eb <strncmp+0x3b>
8010450d:	8d 76 00             	lea    0x0(%esi),%esi

80104510 <strncpy>:
80104510:	55                   	push   %ebp
80104511:	89 e5                	mov    %esp,%ebp
80104513:	8b 45 08             	mov    0x8(%ebp),%eax
80104516:	56                   	push   %esi
80104517:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010451a:	53                   	push   %ebx
8010451b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010451e:	89 c3                	mov    %eax,%ebx
80104520:	eb 09                	jmp    8010452b <strncpy+0x1b>
80104522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104528:	83 c6 01             	add    $0x1,%esi
8010452b:	83 e9 01             	sub    $0x1,%ecx
8010452e:	8d 51 01             	lea    0x1(%ecx),%edx
80104531:	85 d2                	test   %edx,%edx
80104533:	7e 0c                	jle    80104541 <strncpy+0x31>
80104535:	0f b6 16             	movzbl (%esi),%edx
80104538:	88 13                	mov    %dl,(%ebx)
8010453a:	83 c3 01             	add    $0x1,%ebx
8010453d:	84 d2                	test   %dl,%dl
8010453f:	75 e7                	jne    80104528 <strncpy+0x18>
80104541:	31 d2                	xor    %edx,%edx
80104543:	85 c9                	test   %ecx,%ecx
80104545:	7e 0c                	jle    80104553 <strncpy+0x43>
80104547:	90                   	nop
80104548:	c6 04 13 00          	movb   $0x0,(%ebx,%edx,1)
8010454c:	83 c2 01             	add    $0x1,%edx
8010454f:	39 ca                	cmp    %ecx,%edx
80104551:	75 f5                	jne    80104548 <strncpy+0x38>
80104553:	5b                   	pop    %ebx
80104554:	5e                   	pop    %esi
80104555:	5d                   	pop    %ebp
80104556:	c3                   	ret    
80104557:	89 f6                	mov    %esi,%esi
80104559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104560 <safestrcpy>:
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	8b 55 10             	mov    0x10(%ebp),%edx
80104566:	56                   	push   %esi
80104567:	8b 45 08             	mov    0x8(%ebp),%eax
8010456a:	53                   	push   %ebx
8010456b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010456e:	85 d2                	test   %edx,%edx
80104570:	7e 1f                	jle    80104591 <safestrcpy+0x31>
80104572:	89 c1                	mov    %eax,%ecx
80104574:	eb 05                	jmp    8010457b <safestrcpy+0x1b>
80104576:	66 90                	xchg   %ax,%ax
80104578:	83 c6 01             	add    $0x1,%esi
8010457b:	83 ea 01             	sub    $0x1,%edx
8010457e:	85 d2                	test   %edx,%edx
80104580:	7e 0c                	jle    8010458e <safestrcpy+0x2e>
80104582:	0f b6 1e             	movzbl (%esi),%ebx
80104585:	88 19                	mov    %bl,(%ecx)
80104587:	83 c1 01             	add    $0x1,%ecx
8010458a:	84 db                	test   %bl,%bl
8010458c:	75 ea                	jne    80104578 <safestrcpy+0x18>
8010458e:	c6 01 00             	movb   $0x0,(%ecx)
80104591:	5b                   	pop    %ebx
80104592:	5e                   	pop    %esi
80104593:	5d                   	pop    %ebp
80104594:	c3                   	ret    
80104595:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045a0 <strlen>:
801045a0:	55                   	push   %ebp
801045a1:	31 c0                	xor    %eax,%eax
801045a3:	89 e5                	mov    %esp,%ebp
801045a5:	8b 55 08             	mov    0x8(%ebp),%edx
801045a8:	80 3a 00             	cmpb   $0x0,(%edx)
801045ab:	74 0c                	je     801045b9 <strlen+0x19>
801045ad:	8d 76 00             	lea    0x0(%esi),%esi
801045b0:	83 c0 01             	add    $0x1,%eax
801045b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801045b7:	75 f7                	jne    801045b0 <strlen+0x10>
801045b9:	5d                   	pop    %ebp
801045ba:	c3                   	ret    

801045bb <swtch>:
801045bb:	8b 44 24 04          	mov    0x4(%esp),%eax
801045bf:	8b 54 24 08          	mov    0x8(%esp),%edx
801045c3:	55                   	push   %ebp
801045c4:	53                   	push   %ebx
801045c5:	56                   	push   %esi
801045c6:	57                   	push   %edi
801045c7:	89 20                	mov    %esp,(%eax)
801045c9:	89 d4                	mov    %edx,%esp
801045cb:	5f                   	pop    %edi
801045cc:	5e                   	pop    %esi
801045cd:	5b                   	pop    %ebx
801045ce:	5d                   	pop    %ebp
801045cf:	c3                   	ret    

801045d0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	53                   	push   %ebx
801045d4:	83 ec 04             	sub    $0x4,%esp
801045d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801045da:	e8 71 f4 ff ff       	call   80103a50 <myproc>

  if(addr >= curproc->sz)
801045df:	39 18                	cmp    %ebx,(%eax)
801045e1:	77 0d                	ja     801045f0 <fetchstr+0x20>
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
801045e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
801045e8:	83 c4 04             	add    $0x4,%esp
801045eb:	5b                   	pop    %ebx
801045ec:	5d                   	pop    %ebp
801045ed:	c3                   	ret    
801045ee:	66 90                	xchg   %ax,%ax
  *pp = (char*)addr;
801045f0:	8b 55 0c             	mov    0xc(%ebp),%edx
801045f3:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
801045f5:	8b 08                	mov    (%eax),%ecx
  for(s = *pp; s < ep; s++){
801045f7:	39 cb                	cmp    %ecx,%ebx
801045f9:	73 e8                	jae    801045e3 <fetchstr+0x13>
    if(*s == 0)
801045fb:	31 c0                	xor    %eax,%eax
801045fd:	89 da                	mov    %ebx,%edx
801045ff:	80 3b 00             	cmpb   $0x0,(%ebx)
80104602:	74 e4                	je     801045e8 <fetchstr+0x18>
80104604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(s = *pp; s < ep; s++){
80104608:	83 c2 01             	add    $0x1,%edx
8010460b:	39 d1                	cmp    %edx,%ecx
8010460d:	76 d4                	jbe    801045e3 <fetchstr+0x13>
    if(*s == 0)
8010460f:	80 3a 00             	cmpb   $0x0,(%edx)
80104612:	75 f4                	jne    80104608 <fetchstr+0x38>
80104614:	89 d0                	mov    %edx,%eax
80104616:	29 d8                	sub    %ebx,%eax
80104618:	eb ce                	jmp    801045e8 <fetchstr+0x18>
8010461a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104620 <fetchint>:
{
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	53                   	push   %ebx
80104624:	83 ec 04             	sub    $0x4,%esp
80104627:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010462a:	e8 21 f4 ff ff       	call   80103a50 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010462f:	8b 00                	mov    (%eax),%eax
80104631:	39 d8                	cmp    %ebx,%eax
80104633:	77 0b                	ja     80104640 <fetchint+0x20>
  return 0;
80104635:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010463a:	83 c4 04             	add    $0x4,%esp
8010463d:	5b                   	pop    %ebx
8010463e:	5d                   	pop    %ebp
8010463f:	c3                   	ret    
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104640:	8d 53 04             	lea    0x4(%ebx),%edx
80104643:	39 d0                	cmp    %edx,%eax
80104645:	72 ee                	jb     80104635 <fetchint+0x15>
  *ip = *(int*)(addr);
80104647:	8b 45 0c             	mov    0xc(%ebp),%eax
8010464a:	8b 13                	mov    (%ebx),%edx
8010464c:	89 10                	mov    %edx,(%eax)
8010464e:	31 c0                	xor    %eax,%eax
  return 0;
80104650:	eb e8                	jmp    8010463a <fetchint+0x1a>
80104652:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104660 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104660:	55                   	push   %ebp
80104661:	89 e5                	mov    %esp,%ebp
80104663:	83 ec 08             	sub    $0x8,%esp
80104666:	89 1c 24             	mov    %ebx,(%esp)
80104669:	89 74 24 04          	mov    %esi,0x4(%esp)
8010466d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104670:	8b 75 0c             	mov    0xc(%ebp),%esi
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104673:	e8 d8 f3 ff ff       	call   80103a50 <myproc>
80104678:	89 75 0c             	mov    %esi,0xc(%ebp)
8010467b:	8b 40 18             	mov    0x18(%eax),%eax
8010467e:	8b 40 44             	mov    0x44(%eax),%eax
80104681:	8d 44 98 04          	lea    0x4(%eax,%ebx,4),%eax
80104685:	89 45 08             	mov    %eax,0x8(%ebp)
}
80104688:	8b 1c 24             	mov    (%esp),%ebx
8010468b:	8b 74 24 04          	mov    0x4(%esp),%esi
8010468f:	89 ec                	mov    %ebp,%esp
80104691:	5d                   	pop    %ebp
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104692:	eb 8c                	jmp    80104620 <fetchint>
80104694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010469a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801046a0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	83 ec 28             	sub    $0x28,%esp
  int addr;
  if(argint(n, &addr) < 0)
801046a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801046a9:	89 44 24 04          	mov    %eax,0x4(%esp)
801046ad:	8b 45 08             	mov    0x8(%ebp),%eax
801046b0:	89 04 24             	mov    %eax,(%esp)
801046b3:	e8 a8 ff ff ff       	call   80104660 <argint>
801046b8:	89 c2                	mov    %eax,%edx
801046ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046bf:	85 d2                	test   %edx,%edx
801046c1:	78 12                	js     801046d5 <argstr+0x35>
    return -1;
  return fetchstr(addr, pp);
801046c3:	8b 45 0c             	mov    0xc(%ebp),%eax
801046c6:	89 44 24 04          	mov    %eax,0x4(%esp)
801046ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
801046cd:	89 04 24             	mov    %eax,(%esp)
801046d0:	e8 fb fe ff ff       	call   801045d0 <fetchstr>
}
801046d5:	c9                   	leave  
801046d6:	c3                   	ret    
801046d7:	89 f6                	mov    %esi,%esi
801046d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046e0 <argptr>:
{
801046e0:	55                   	push   %ebp
801046e1:	89 e5                	mov    %esp,%ebp
801046e3:	83 ec 28             	sub    $0x28,%esp
801046e6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801046e9:	8b 5d 10             	mov    0x10(%ebp),%ebx
801046ec:	89 75 fc             	mov    %esi,-0x4(%ebp)
  struct proc *curproc = myproc();
801046ef:	e8 5c f3 ff ff       	call   80103a50 <myproc>
801046f4:	89 c6                	mov    %eax,%esi
  if(argint(n, &i) < 0)
801046f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801046f9:	89 44 24 04          	mov    %eax,0x4(%esp)
801046fd:	8b 45 08             	mov    0x8(%ebp),%eax
80104700:	89 04 24             	mov    %eax,(%esp)
80104703:	e8 58 ff ff ff       	call   80104660 <argint>
80104708:	85 c0                	test   %eax,%eax
8010470a:	79 14                	jns    80104720 <argptr+0x40>
  return 0;
8010470c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104711:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104714:	8b 75 fc             	mov    -0x4(%ebp),%esi
80104717:	89 ec                	mov    %ebp,%esp
80104719:	5d                   	pop    %ebp
8010471a:	c3                   	ret    
8010471b:	90                   	nop
8010471c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104720:	85 db                	test   %ebx,%ebx
80104722:	78 e8                	js     8010470c <argptr+0x2c>
80104724:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104727:	8b 16                	mov    (%esi),%edx
80104729:	39 d0                	cmp    %edx,%eax
8010472b:	73 df                	jae    8010470c <argptr+0x2c>
8010472d:	01 c3                	add    %eax,%ebx
8010472f:	39 da                	cmp    %ebx,%edx
80104731:	72 d9                	jb     8010470c <argptr+0x2c>
  *pp = (char*)i;
80104733:	8b 55 0c             	mov    0xc(%ebp),%edx
80104736:	89 02                	mov    %eax,(%edx)
80104738:	31 c0                	xor    %eax,%eax
  return 0;
8010473a:	eb d5                	jmp    80104711 <argptr+0x31>
8010473c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104740 <syscall>:
[SYS_date]   sys_date
};

void
syscall(void)
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	83 ec 28             	sub    $0x28,%esp
80104746:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80104749:	89 75 f8             	mov    %esi,-0x8(%ebp)
8010474c:	89 7d fc             	mov    %edi,-0x4(%ebp)
  int num;
  struct proc *curproc = myproc();
8010474f:	e8 fc f2 ff ff       	call   80103a50 <myproc>

  num = curproc->tf->eax;
80104754:	8b 78 18             	mov    0x18(%eax),%edi
  struct proc *curproc = myproc();
80104757:	89 c3                	mov    %eax,%ebx
  num = curproc->tf->eax;
80104759:	8b 77 1c             	mov    0x1c(%edi),%esi
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
8010475c:	8d 46 ff             	lea    -0x1(%esi),%eax
8010475f:	83 f8 15             	cmp    $0x15,%eax
80104762:	77 3c                	ja     801047a0 <syscall+0x60>
80104764:	8b 04 b5 c0 74 10 80 	mov    -0x7fef8b40(,%esi,4),%eax
8010476b:	85 c0                	test   %eax,%eax
8010476d:	74 31                	je     801047a0 <syscall+0x60>
    curproc->tf->eax = syscalls[num]();
8010476f:	ff d0                	call   *%eax
80104771:	89 47 1c             	mov    %eax,0x1c(%edi)
    cprintf("%s->%d\n",syscall_name[num],curproc->tf->eax);
80104774:	8b 43 18             	mov    0x18(%ebx),%eax
80104777:	8b 40 1c             	mov    0x1c(%eax),%eax
8010477a:	c7 04 24 81 74 10 80 	movl   $0x80107481,(%esp)
80104781:	89 44 24 08          	mov    %eax,0x8(%esp)
80104785:	8d 04 76             	lea    (%esi,%esi,2),%eax
80104788:	8d 84 00 20 a0 10 80 	lea    -0x7fef5fe0(%eax,%eax,1),%eax
8010478f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104793:	e8 b8 c0 ff ff       	call   80100850 <cprintf>
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104798:	eb 2e                	jmp    801047c8 <syscall+0x88>
8010479a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801047a0:	8d 43 6c             	lea    0x6c(%ebx),%eax
801047a3:	89 74 24 0c          	mov    %esi,0xc(%esp)
801047a7:	89 44 24 08          	mov    %eax,0x8(%esp)
801047ab:	8b 43 10             	mov    0x10(%ebx),%eax
801047ae:	c7 04 24 89 74 10 80 	movl   $0x80107489,(%esp)
801047b5:	89 44 24 04          	mov    %eax,0x4(%esp)
801047b9:	e8 92 c0 ff ff       	call   80100850 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
801047be:	8b 43 18             	mov    0x18(%ebx),%eax
801047c1:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
801047c8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801047cb:	8b 75 f8             	mov    -0x8(%ebp),%esi
801047ce:	8b 7d fc             	mov    -0x4(%ebp),%edi
801047d1:	89 ec                	mov    %ebp,%esp
801047d3:	5d                   	pop    %ebp
801047d4:	c3                   	ret    
801047d5:	66 90                	xchg   %ax,%ax
801047d7:	66 90                	xchg   %ax,%ax
801047d9:	66 90                	xchg   %ax,%ax
801047db:	66 90                	xchg   %ax,%ax
801047dd:	66 90                	xchg   %ax,%ax
801047df:	90                   	nop

801047e0 <fdalloc>:
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	53                   	push   %ebx
801047e4:	89 c3                	mov    %eax,%ebx
801047e6:	83 ec 04             	sub    $0x4,%esp
801047e9:	e8 62 f2 ff ff       	call   80103a50 <myproc>
801047ee:	89 c2                	mov    %eax,%edx
801047f0:	31 c0                	xor    %eax,%eax
801047f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047f8:	8b 4c 82 28          	mov    0x28(%edx,%eax,4),%ecx
801047fc:	85 c9                	test   %ecx,%ecx
801047fe:	74 18                	je     80104818 <fdalloc+0x38>
80104800:	83 c0 01             	add    $0x1,%eax
80104803:	83 f8 10             	cmp    $0x10,%eax
80104806:	75 f0                	jne    801047f8 <fdalloc+0x18>
80104808:	83 c4 04             	add    $0x4,%esp
8010480b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104810:	5b                   	pop    %ebx
80104811:	5d                   	pop    %ebp
80104812:	c3                   	ret    
80104813:	90                   	nop
80104814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104818:	89 5c 82 28          	mov    %ebx,0x28(%edx,%eax,4)
8010481c:	83 c4 04             	add    $0x4,%esp
8010481f:	5b                   	pop    %ebx
80104820:	5d                   	pop    %ebp
80104821:	c3                   	ret    
80104822:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104830 <sys_pipe>:
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	53                   	push   %ebx
80104834:	83 ec 24             	sub    $0x24,%esp
80104837:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010483a:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
80104841:	00 
80104842:	89 44 24 04          	mov    %eax,0x4(%esp)
80104846:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010484d:	e8 8e fe ff ff       	call   801046e0 <argptr>
80104852:	85 c0                	test   %eax,%eax
80104854:	79 12                	jns    80104868 <sys_pipe+0x38>
80104856:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010485b:	83 c4 24             	add    $0x24,%esp
8010485e:	5b                   	pop    %ebx
8010485f:	5d                   	pop    %ebp
80104860:	c3                   	ret    
80104861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104868:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010486b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010486f:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104872:	89 04 24             	mov    %eax,(%esp)
80104875:	e8 e6 eb ff ff       	call   80103460 <pipealloc>
8010487a:	85 c0                	test   %eax,%eax
8010487c:	78 d8                	js     80104856 <sys_pipe+0x26>
8010487e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104881:	e8 5a ff ff ff       	call   801047e0 <fdalloc>
80104886:	85 c0                	test   %eax,%eax
80104888:	89 c3                	mov    %eax,%ebx
8010488a:	78 28                	js     801048b4 <sys_pipe+0x84>
8010488c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010488f:	e8 4c ff ff ff       	call   801047e0 <fdalloc>
80104894:	85 c0                	test   %eax,%eax
80104896:	78 0f                	js     801048a7 <sys_pipe+0x77>
80104898:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010489b:	89 1a                	mov    %ebx,(%edx)
8010489d:	8b 55 f4             	mov    -0xc(%ebp),%edx
801048a0:	89 42 04             	mov    %eax,0x4(%edx)
801048a3:	31 c0                	xor    %eax,%eax
801048a5:	eb b4                	jmp    8010485b <sys_pipe+0x2b>
801048a7:	e8 a4 f1 ff ff       	call   80103a50 <myproc>
801048ac:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
801048b3:	00 
801048b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801048b7:	89 04 24             	mov    %eax,(%esp)
801048ba:	e8 91 c7 ff ff       	call   80101050 <fileclose>
801048bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
801048c2:	89 04 24             	mov    %eax,(%esp)
801048c5:	e8 86 c7 ff ff       	call   80101050 <fileclose>
801048ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048cf:	eb 8a                	jmp    8010485b <sys_pipe+0x2b>
801048d1:	eb 0d                	jmp    801048e0 <sys_exec>
801048d3:	90                   	nop
801048d4:	90                   	nop
801048d5:	90                   	nop
801048d6:	90                   	nop
801048d7:	90                   	nop
801048d8:	90                   	nop
801048d9:	90                   	nop
801048da:	90                   	nop
801048db:	90                   	nop
801048dc:	90                   	nop
801048dd:	90                   	nop
801048de:	90                   	nop
801048df:	90                   	nop

801048e0 <sys_exec>:
801048e0:	55                   	push   %ebp
801048e1:	89 e5                	mov    %esp,%ebp
801048e3:	81 ec b8 00 00 00    	sub    $0xb8,%esp
801048e9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801048ec:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801048ef:	89 75 f8             	mov    %esi,-0x8(%ebp)
801048f2:	89 7d fc             	mov    %edi,-0x4(%ebp)
801048f5:	89 44 24 04          	mov    %eax,0x4(%esp)
801048f9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104900:	e8 9b fd ff ff       	call   801046a0 <argstr>
80104905:	85 c0                	test   %eax,%eax
80104907:	79 17                	jns    80104920 <sys_exec+0x40>
80104909:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010490e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104911:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104914:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104917:	89 ec                	mov    %ebp,%esp
80104919:	5d                   	pop    %ebp
8010491a:	c3                   	ret    
8010491b:	90                   	nop
8010491c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104920:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104923:	89 44 24 04          	mov    %eax,0x4(%esp)
80104927:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010492e:	e8 2d fd ff ff       	call   80104660 <argint>
80104933:	85 c0                	test   %eax,%eax
80104935:	78 d2                	js     80104909 <sys_exec+0x29>
80104937:	8d bd 5c ff ff ff    	lea    -0xa4(%ebp),%edi
8010493d:	31 f6                	xor    %esi,%esi
8010493f:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80104946:	00 
80104947:	31 db                	xor    %ebx,%ebx
80104949:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104950:	00 
80104951:	89 3c 24             	mov    %edi,(%esp)
80104954:	e8 27 fa ff ff       	call   80104380 <memset>
80104959:	eb 22                	jmp    8010497d <sys_exec+0x9d>
8010495b:	90                   	nop
8010495c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104960:	8d 14 b7             	lea    (%edi,%esi,4),%edx
80104963:	89 54 24 04          	mov    %edx,0x4(%esp)
80104967:	89 04 24             	mov    %eax,(%esp)
8010496a:	e8 61 fc ff ff       	call   801045d0 <fetchstr>
8010496f:	85 c0                	test   %eax,%eax
80104971:	78 96                	js     80104909 <sys_exec+0x29>
80104973:	83 c3 01             	add    $0x1,%ebx
80104976:	83 fb 20             	cmp    $0x20,%ebx
80104979:	89 de                	mov    %ebx,%esi
8010497b:	74 8c                	je     80104909 <sys_exec+0x29>
8010497d:	8d 45 dc             	lea    -0x24(%ebp),%eax
80104980:	89 44 24 04          	mov    %eax,0x4(%esp)
80104984:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
8010498b:	03 45 e0             	add    -0x20(%ebp),%eax
8010498e:	89 04 24             	mov    %eax,(%esp)
80104991:	e8 8a fc ff ff       	call   80104620 <fetchint>
80104996:	85 c0                	test   %eax,%eax
80104998:	0f 88 6b ff ff ff    	js     80104909 <sys_exec+0x29>
8010499e:	8b 45 dc             	mov    -0x24(%ebp),%eax
801049a1:	85 c0                	test   %eax,%eax
801049a3:	75 bb                	jne    80104960 <sys_exec+0x80>
801049a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801049a8:	c7 84 9d 5c ff ff ff 	movl   $0x0,-0xa4(%ebp,%ebx,4)
801049af:	00 00 00 00 
801049b3:	89 7c 24 04          	mov    %edi,0x4(%esp)
801049b7:	89 04 24             	mov    %eax,(%esp)
801049ba:	e8 01 c0 ff ff       	call   801009c0 <exec>
801049bf:	e9 4a ff ff ff       	jmp    8010490e <sys_exec+0x2e>
801049c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801049d0 <sys_chdir>:
801049d0:	55                   	push   %ebp
801049d1:	89 e5                	mov    %esp,%ebp
801049d3:	56                   	push   %esi
801049d4:	53                   	push   %ebx
801049d5:	83 ec 20             	sub    $0x20,%esp
801049d8:	e8 73 f0 ff ff       	call   80103a50 <myproc>
801049dd:	89 c3                	mov    %eax,%ebx
801049df:	e8 1c e3 ff ff       	call   80102d00 <begin_op>
801049e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049e7:	89 44 24 04          	mov    %eax,0x4(%esp)
801049eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801049f2:	e8 a9 fc ff ff       	call   801046a0 <argstr>
801049f7:	85 c0                	test   %eax,%eax
801049f9:	78 4d                	js     80104a48 <sys_chdir+0x78>
801049fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801049fe:	89 04 24             	mov    %eax,(%esp)
80104a01:	e8 ba d4 ff ff       	call   80101ec0 <namei>
80104a06:	85 c0                	test   %eax,%eax
80104a08:	89 c6                	mov    %eax,%esi
80104a0a:	74 3c                	je     80104a48 <sys_chdir+0x78>
80104a0c:	89 04 24             	mov    %eax,(%esp)
80104a0f:	e8 7c cf ff ff       	call   80101990 <ilock>
80104a14:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104a19:	75 25                	jne    80104a40 <sys_chdir+0x70>
80104a1b:	89 34 24             	mov    %esi,(%esp)
80104a1e:	e8 9d d2 ff ff       	call   80101cc0 <iunlock>
80104a23:	8b 43 68             	mov    0x68(%ebx),%eax
80104a26:	89 04 24             	mov    %eax,(%esp)
80104a29:	e8 42 d0 ff ff       	call   80101a70 <iput>
80104a2e:	e8 9d e1 ff ff       	call   80102bd0 <end_op>
80104a33:	31 c0                	xor    %eax,%eax
80104a35:	89 73 68             	mov    %esi,0x68(%ebx)
80104a38:	83 c4 20             	add    $0x20,%esp
80104a3b:	5b                   	pop    %ebx
80104a3c:	5e                   	pop    %esi
80104a3d:	5d                   	pop    %ebp
80104a3e:	c3                   	ret    
80104a3f:	90                   	nop
80104a40:	89 34 24             	mov    %esi,(%esp)
80104a43:	e8 c8 d2 ff ff       	call   80101d10 <iunlockput>
80104a48:	e8 83 e1 ff ff       	call   80102bd0 <end_op>
80104a4d:	83 c4 20             	add    $0x20,%esp
80104a50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a55:	5b                   	pop    %ebx
80104a56:	5e                   	pop    %esi
80104a57:	5d                   	pop    %ebp
80104a58:	c3                   	ret    
80104a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104a60 <create>:
80104a60:	55                   	push   %ebp
80104a61:	89 e5                	mov    %esp,%ebp
80104a63:	83 ec 48             	sub    $0x48,%esp
80104a66:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80104a69:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104a6c:	89 75 f8             	mov    %esi,-0x8(%ebp)
80104a6f:	8d 75 da             	lea    -0x26(%ebp),%esi
80104a72:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80104a75:	31 db                	xor    %ebx,%ebx
80104a77:	89 7d fc             	mov    %edi,-0x4(%ebp)
80104a7a:	89 d7                	mov    %edx,%edi
80104a7c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104a7f:	89 74 24 04          	mov    %esi,0x4(%esp)
80104a83:	89 04 24             	mov    %eax,(%esp)
80104a86:	e8 15 d4 ff ff       	call   80101ea0 <nameiparent>
80104a8b:	85 c0                	test   %eax,%eax
80104a8d:	74 48                	je     80104ad7 <create+0x77>
80104a8f:	89 04 24             	mov    %eax,(%esp)
80104a92:	89 45 cc             	mov    %eax,-0x34(%ebp)
80104a95:	e8 f6 ce ff ff       	call   80101990 <ilock>
80104a9a:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104a9d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80104aa4:	00 
80104aa5:	89 74 24 04          	mov    %esi,0x4(%esp)
80104aa9:	89 14 24             	mov    %edx,(%esp)
80104aac:	e8 5f cd ff ff       	call   80101810 <dirlookup>
80104ab1:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104ab4:	85 c0                	test   %eax,%eax
80104ab6:	89 c3                	mov    %eax,%ebx
80104ab8:	74 3e                	je     80104af8 <create+0x98>
80104aba:	89 14 24             	mov    %edx,(%esp)
80104abd:	e8 4e d2 ff ff       	call   80101d10 <iunlockput>
80104ac2:	89 1c 24             	mov    %ebx,(%esp)
80104ac5:	e8 c6 ce ff ff       	call   80101990 <ilock>
80104aca:	66 83 ff 02          	cmp    $0x2,%di
80104ace:	75 18                	jne    80104ae8 <create+0x88>
80104ad0:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104ad5:	75 11                	jne    80104ae8 <create+0x88>
80104ad7:	89 d8                	mov    %ebx,%eax
80104ad9:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104adc:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104adf:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104ae2:	89 ec                	mov    %ebp,%esp
80104ae4:	5d                   	pop    %ebp
80104ae5:	c3                   	ret    
80104ae6:	66 90                	xchg   %ax,%ax
80104ae8:	89 1c 24             	mov    %ebx,(%esp)
80104aeb:	31 db                	xor    %ebx,%ebx
80104aed:	e8 1e d2 ff ff       	call   80101d10 <iunlockput>
80104af2:	eb e3                	jmp    80104ad7 <create+0x77>
80104af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104af8:	0f bf c7             	movswl %di,%eax
80104afb:	89 44 24 04          	mov    %eax,0x4(%esp)
80104aff:	8b 02                	mov    (%edx),%eax
80104b01:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104b04:	89 04 24             	mov    %eax,(%esp)
80104b07:	e8 b4 cd ff ff       	call   801018c0 <ialloc>
80104b0c:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104b0f:	85 c0                	test   %eax,%eax
80104b11:	89 c3                	mov    %eax,%ebx
80104b13:	0f 84 b7 00 00 00    	je     80104bd0 <create+0x170>
80104b19:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104b1c:	89 04 24             	mov    %eax,(%esp)
80104b1f:	e8 6c ce ff ff       	call   80101990 <ilock>
80104b24:	0f b7 45 d4          	movzwl -0x2c(%ebp),%eax
80104b28:	66 89 43 52          	mov    %ax,0x52(%ebx)
80104b2c:	0f b7 4d d0          	movzwl -0x30(%ebp),%ecx
80104b30:	66 c7 43 56 01 00    	movw   $0x1,0x56(%ebx)
80104b36:	66 89 4b 54          	mov    %cx,0x54(%ebx)
80104b3a:	89 1c 24             	mov    %ebx,(%esp)
80104b3d:	e8 de c7 ff ff       	call   80101320 <iupdate>
80104b42:	66 83 ff 01          	cmp    $0x1,%di
80104b46:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104b49:	74 2d                	je     80104b78 <create+0x118>
80104b4b:	8b 43 04             	mov    0x4(%ebx),%eax
80104b4e:	89 14 24             	mov    %edx,(%esp)
80104b51:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104b54:	89 74 24 04          	mov    %esi,0x4(%esp)
80104b58:	89 44 24 08          	mov    %eax,0x8(%esp)
80104b5c:	e8 6f d0 ff ff       	call   80101bd0 <dirlink>
80104b61:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104b64:	85 c0                	test   %eax,%eax
80104b66:	78 74                	js     80104bdc <create+0x17c>
80104b68:	89 14 24             	mov    %edx,(%esp)
80104b6b:	e8 a0 d1 ff ff       	call   80101d10 <iunlockput>
80104b70:	e9 62 ff ff ff       	jmp    80104ad7 <create+0x77>
80104b75:	8d 76 00             	lea    0x0(%esi),%esi
80104b78:	66 83 42 56 01       	addw   $0x1,0x56(%edx)
80104b7d:	89 14 24             	mov    %edx,(%esp)
80104b80:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104b83:	e8 98 c7 ff ff       	call   80101320 <iupdate>
80104b88:	8b 43 04             	mov    0x4(%ebx),%eax
80104b8b:	c7 44 24 04 2c 75 10 	movl   $0x8010752c,0x4(%esp)
80104b92:	80 
80104b93:	89 1c 24             	mov    %ebx,(%esp)
80104b96:	89 44 24 08          	mov    %eax,0x8(%esp)
80104b9a:	e8 31 d0 ff ff       	call   80101bd0 <dirlink>
80104b9f:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104ba2:	85 c0                	test   %eax,%eax
80104ba4:	78 1e                	js     80104bc4 <create+0x164>
80104ba6:	8b 42 04             	mov    0x4(%edx),%eax
80104ba9:	c7 44 24 04 2b 75 10 	movl   $0x8010752b,0x4(%esp)
80104bb0:	80 
80104bb1:	89 1c 24             	mov    %ebx,(%esp)
80104bb4:	89 44 24 08          	mov    %eax,0x8(%esp)
80104bb8:	e8 13 d0 ff ff       	call   80101bd0 <dirlink>
80104bbd:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104bc0:	85 c0                	test   %eax,%eax
80104bc2:	79 87                	jns    80104b4b <create+0xeb>
80104bc4:	c7 04 24 2e 75 10 80 	movl   $0x8010752e,(%esp)
80104bcb:	e8 e0 b7 ff ff       	call   801003b0 <panic>
80104bd0:	c7 04 24 1c 75 10 80 	movl   $0x8010751c,(%esp)
80104bd7:	e8 d4 b7 ff ff       	call   801003b0 <panic>
80104bdc:	c7 04 24 3a 75 10 80 	movl   $0x8010753a,(%esp)
80104be3:	e8 c8 b7 ff ff       	call   801003b0 <panic>
80104be8:	90                   	nop
80104be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104bf0 <sys_mknod>:
80104bf0:	55                   	push   %ebp
80104bf1:	89 e5                	mov    %esp,%ebp
80104bf3:	83 ec 28             	sub    $0x28,%esp
80104bf6:	e8 05 e1 ff ff       	call   80102d00 <begin_op>
80104bfb:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104bfe:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c02:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104c09:	e8 92 fa ff ff       	call   801046a0 <argstr>
80104c0e:	85 c0                	test   %eax,%eax
80104c10:	78 5e                	js     80104c70 <sys_mknod+0x80>
80104c12:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c15:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c19:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104c20:	e8 3b fa ff ff       	call   80104660 <argint>
80104c25:	85 c0                	test   %eax,%eax
80104c27:	78 47                	js     80104c70 <sys_mknod+0x80>
80104c29:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104c2c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c30:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104c37:	e8 24 fa ff ff       	call   80104660 <argint>
80104c3c:	85 c0                	test   %eax,%eax
80104c3e:	78 30                	js     80104c70 <sys_mknod+0x80>
80104c40:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
80104c44:	ba 03 00 00 00       	mov    $0x3,%edx
80104c49:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104c4d:	89 04 24             	mov    %eax,(%esp)
80104c50:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c53:	e8 08 fe ff ff       	call   80104a60 <create>
80104c58:	85 c0                	test   %eax,%eax
80104c5a:	74 14                	je     80104c70 <sys_mknod+0x80>
80104c5c:	89 04 24             	mov    %eax,(%esp)
80104c5f:	e8 ac d0 ff ff       	call   80101d10 <iunlockput>
80104c64:	e8 67 df ff ff       	call   80102bd0 <end_op>
80104c69:	31 c0                	xor    %eax,%eax
80104c6b:	c9                   	leave  
80104c6c:	c3                   	ret    
80104c6d:	8d 76 00             	lea    0x0(%esi),%esi
80104c70:	e8 5b df ff ff       	call   80102bd0 <end_op>
80104c75:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c7a:	c9                   	leave  
80104c7b:	c3                   	ret    
80104c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104c80 <sys_mkdir>:
80104c80:	55                   	push   %ebp
80104c81:	89 e5                	mov    %esp,%ebp
80104c83:	83 ec 28             	sub    $0x28,%esp
80104c86:	e8 75 e0 ff ff       	call   80102d00 <begin_op>
80104c8b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c8e:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c92:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104c99:	e8 02 fa ff ff       	call   801046a0 <argstr>
80104c9e:	85 c0                	test   %eax,%eax
80104ca0:	78 2e                	js     80104cd0 <sys_mkdir+0x50>
80104ca2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104ca9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cac:	31 c9                	xor    %ecx,%ecx
80104cae:	ba 01 00 00 00       	mov    $0x1,%edx
80104cb3:	e8 a8 fd ff ff       	call   80104a60 <create>
80104cb8:	85 c0                	test   %eax,%eax
80104cba:	74 14                	je     80104cd0 <sys_mkdir+0x50>
80104cbc:	89 04 24             	mov    %eax,(%esp)
80104cbf:	e8 4c d0 ff ff       	call   80101d10 <iunlockput>
80104cc4:	e8 07 df ff ff       	call   80102bd0 <end_op>
80104cc9:	31 c0                	xor    %eax,%eax
80104ccb:	c9                   	leave  
80104ccc:	c3                   	ret    
80104ccd:	8d 76 00             	lea    0x0(%esi),%esi
80104cd0:	e8 fb de ff ff       	call   80102bd0 <end_op>
80104cd5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cda:	c9                   	leave  
80104cdb:	c3                   	ret    
80104cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104ce0 <sys_link>:
80104ce0:	55                   	push   %ebp
80104ce1:	89 e5                	mov    %esp,%ebp
80104ce3:	83 ec 48             	sub    $0x48,%esp
80104ce6:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104ce9:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80104cec:	89 75 f8             	mov    %esi,-0x8(%ebp)
80104cef:	89 7d fc             	mov    %edi,-0x4(%ebp)
80104cf2:	89 44 24 04          	mov    %eax,0x4(%esp)
80104cf6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104cfd:	e8 9e f9 ff ff       	call   801046a0 <argstr>
80104d02:	85 c0                	test   %eax,%eax
80104d04:	79 12                	jns    80104d18 <sys_link+0x38>
80104d06:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d0b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104d0e:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104d11:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104d14:	89 ec                	mov    %ebp,%esp
80104d16:	5d                   	pop    %ebp
80104d17:	c3                   	ret    
80104d18:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104d1b:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d1f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104d26:	e8 75 f9 ff ff       	call   801046a0 <argstr>
80104d2b:	85 c0                	test   %eax,%eax
80104d2d:	78 d7                	js     80104d06 <sys_link+0x26>
80104d2f:	e8 cc df ff ff       	call   80102d00 <begin_op>
80104d34:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104d37:	89 04 24             	mov    %eax,(%esp)
80104d3a:	e8 81 d1 ff ff       	call   80101ec0 <namei>
80104d3f:	85 c0                	test   %eax,%eax
80104d41:	89 c3                	mov    %eax,%ebx
80104d43:	0f 84 a6 00 00 00    	je     80104def <sys_link+0x10f>
80104d49:	89 04 24             	mov    %eax,(%esp)
80104d4c:	e8 3f cc ff ff       	call   80101990 <ilock>
80104d51:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d56:	0f 84 8b 00 00 00    	je     80104de7 <sys_link+0x107>
80104d5c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104d61:	8d 7d d2             	lea    -0x2e(%ebp),%edi
80104d64:	89 1c 24             	mov    %ebx,(%esp)
80104d67:	e8 b4 c5 ff ff       	call   80101320 <iupdate>
80104d6c:	89 1c 24             	mov    %ebx,(%esp)
80104d6f:	e8 4c cf ff ff       	call   80101cc0 <iunlock>
80104d74:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104d77:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104d7b:	89 04 24             	mov    %eax,(%esp)
80104d7e:	e8 1d d1 ff ff       	call   80101ea0 <nameiparent>
80104d83:	85 c0                	test   %eax,%eax
80104d85:	89 c6                	mov    %eax,%esi
80104d87:	74 49                	je     80104dd2 <sys_link+0xf2>
80104d89:	89 04 24             	mov    %eax,(%esp)
80104d8c:	e8 ff cb ff ff       	call   80101990 <ilock>
80104d91:	8b 06                	mov    (%esi),%eax
80104d93:	3b 03                	cmp    (%ebx),%eax
80104d95:	75 33                	jne    80104dca <sys_link+0xea>
80104d97:	8b 43 04             	mov    0x4(%ebx),%eax
80104d9a:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104d9e:	89 34 24             	mov    %esi,(%esp)
80104da1:	89 44 24 08          	mov    %eax,0x8(%esp)
80104da5:	e8 26 ce ff ff       	call   80101bd0 <dirlink>
80104daa:	85 c0                	test   %eax,%eax
80104dac:	78 1c                	js     80104dca <sys_link+0xea>
80104dae:	89 34 24             	mov    %esi,(%esp)
80104db1:	e8 5a cf ff ff       	call   80101d10 <iunlockput>
80104db6:	89 1c 24             	mov    %ebx,(%esp)
80104db9:	e8 b2 cc ff ff       	call   80101a70 <iput>
80104dbe:	e8 0d de ff ff       	call   80102bd0 <end_op>
80104dc3:	31 c0                	xor    %eax,%eax
80104dc5:	e9 41 ff ff ff       	jmp    80104d0b <sys_link+0x2b>
80104dca:	89 34 24             	mov    %esi,(%esp)
80104dcd:	e8 3e cf ff ff       	call   80101d10 <iunlockput>
80104dd2:	89 1c 24             	mov    %ebx,(%esp)
80104dd5:	e8 b6 cb ff ff       	call   80101990 <ilock>
80104dda:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104ddf:	89 1c 24             	mov    %ebx,(%esp)
80104de2:	e8 39 c5 ff ff       	call   80101320 <iupdate>
80104de7:	89 1c 24             	mov    %ebx,(%esp)
80104dea:	e8 21 cf ff ff       	call   80101d10 <iunlockput>
80104def:	e8 dc dd ff ff       	call   80102bd0 <end_op>
80104df4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104df9:	e9 0d ff ff ff       	jmp    80104d0b <sys_link+0x2b>
80104dfe:	66 90                	xchg   %ax,%ax

80104e00 <sys_open>:
80104e00:	55                   	push   %ebp
80104e01:	89 e5                	mov    %esp,%ebp
80104e03:	83 ec 38             	sub    $0x38,%esp
80104e06:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e09:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104e0c:	89 75 fc             	mov    %esi,-0x4(%ebp)
80104e0f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e13:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104e1a:	e8 81 f8 ff ff       	call   801046a0 <argstr>
80104e1f:	85 c0                	test   %eax,%eax
80104e21:	79 15                	jns    80104e38 <sys_open+0x38>
80104e23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e28:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104e2b:	8b 75 fc             	mov    -0x4(%ebp),%esi
80104e2e:	89 ec                	mov    %ebp,%esp
80104e30:	5d                   	pop    %ebp
80104e31:	c3                   	ret    
80104e32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e38:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e3b:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e3f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104e46:	e8 15 f8 ff ff       	call   80104660 <argint>
80104e4b:	85 c0                	test   %eax,%eax
80104e4d:	78 d4                	js     80104e23 <sys_open+0x23>
80104e4f:	e8 ac de ff ff       	call   80102d00 <begin_op>
80104e54:	f6 45 f1 02          	testb  $0x2,-0xf(%ebp)
80104e58:	74 76                	je     80104ed0 <sys_open+0xd0>
80104e5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104e5d:	31 c9                	xor    %ecx,%ecx
80104e5f:	ba 02 00 00 00       	mov    $0x2,%edx
80104e64:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104e6b:	e8 f0 fb ff ff       	call   80104a60 <create>
80104e70:	85 c0                	test   %eax,%eax
80104e72:	89 c6                	mov    %eax,%esi
80104e74:	0f 84 a2 00 00 00    	je     80104f1c <sys_open+0x11c>
80104e7a:	e8 51 c1 ff ff       	call   80100fd0 <filealloc>
80104e7f:	85 c0                	test   %eax,%eax
80104e81:	89 c3                	mov    %eax,%ebx
80104e83:	0f 84 8b 00 00 00    	je     80104f14 <sys_open+0x114>
80104e89:	e8 52 f9 ff ff       	call   801047e0 <fdalloc>
80104e8e:	85 c0                	test   %eax,%eax
80104e90:	78 7a                	js     80104f0c <sys_open+0x10c>
80104e92:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80104e95:	89 34 24             	mov    %esi,(%esp)
80104e98:	e8 23 ce ff ff       	call   80101cc0 <iunlock>
80104e9d:	e8 2e dd ff ff       	call   80102bd0 <end_op>
80104ea2:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
80104ea8:	89 73 10             	mov    %esi,0x10(%ebx)
80104eab:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80104eb2:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104eb5:	83 f2 01             	xor    $0x1,%edx
80104eb8:	83 e2 01             	and    $0x1,%edx
80104ebb:	88 53 08             	mov    %dl,0x8(%ebx)
80104ebe:	f6 45 f0 03          	testb  $0x3,-0x10(%ebp)
80104ec2:	0f 95 43 09          	setne  0x9(%ebx)
80104ec6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104ec9:	e9 5a ff ff ff       	jmp    80104e28 <sys_open+0x28>
80104ece:	66 90                	xchg   %ax,%ax
80104ed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104ed3:	89 04 24             	mov    %eax,(%esp)
80104ed6:	e8 e5 cf ff ff       	call   80101ec0 <namei>
80104edb:	85 c0                	test   %eax,%eax
80104edd:	89 c6                	mov    %eax,%esi
80104edf:	74 3b                	je     80104f1c <sys_open+0x11c>
80104ee1:	89 04 24             	mov    %eax,(%esp)
80104ee4:	e8 a7 ca ff ff       	call   80101990 <ilock>
80104ee9:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104eee:	75 8a                	jne    80104e7a <sys_open+0x7a>
80104ef0:	8b 5d f0             	mov    -0x10(%ebp),%ebx
80104ef3:	85 db                	test   %ebx,%ebx
80104ef5:	74 83                	je     80104e7a <sys_open+0x7a>
80104ef7:	89 34 24             	mov    %esi,(%esp)
80104efa:	e8 11 ce ff ff       	call   80101d10 <iunlockput>
80104eff:	e8 cc dc ff ff       	call   80102bd0 <end_op>
80104f04:	83 c8 ff             	or     $0xffffffff,%eax
80104f07:	e9 1c ff ff ff       	jmp    80104e28 <sys_open+0x28>
80104f0c:	89 1c 24             	mov    %ebx,(%esp)
80104f0f:	e8 3c c1 ff ff       	call   80101050 <fileclose>
80104f14:	89 34 24             	mov    %esi,(%esp)
80104f17:	e8 f4 cd ff ff       	call   80101d10 <iunlockput>
80104f1c:	e8 af dc ff ff       	call   80102bd0 <end_op>
80104f21:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f26:	e9 fd fe ff ff       	jmp    80104e28 <sys_open+0x28>
80104f2b:	90                   	nop
80104f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104f30 <sys_unlink>:
80104f30:	55                   	push   %ebp
80104f31:	89 e5                	mov    %esp,%ebp
80104f33:	57                   	push   %edi
80104f34:	56                   	push   %esi
80104f35:	53                   	push   %ebx
80104f36:	83 ec 6c             	sub    $0x6c,%esp
80104f39:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104f3c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104f47:	e8 54 f7 ff ff       	call   801046a0 <argstr>
80104f4c:	89 c2                	mov    %eax,%edx
80104f4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f53:	85 d2                	test   %edx,%edx
80104f55:	0f 88 0b 01 00 00    	js     80105066 <sys_unlink+0x136>
80104f5b:	8d 5d d2             	lea    -0x2e(%ebp),%ebx
80104f5e:	e8 9d dd ff ff       	call   80102d00 <begin_op>
80104f63:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104f67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104f6a:	89 04 24             	mov    %eax,(%esp)
80104f6d:	e8 2e cf ff ff       	call   80101ea0 <nameiparent>
80104f72:	85 c0                	test   %eax,%eax
80104f74:	89 45 a4             	mov    %eax,-0x5c(%ebp)
80104f77:	0f 84 53 01 00 00    	je     801050d0 <sys_unlink+0x1a0>
80104f7d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104f80:	89 04 24             	mov    %eax,(%esp)
80104f83:	e8 08 ca ff ff       	call   80101990 <ilock>
80104f88:	c7 44 24 04 2c 75 10 	movl   $0x8010752c,0x4(%esp)
80104f8f:	80 
80104f90:	89 1c 24             	mov    %ebx,(%esp)
80104f93:	e8 d8 c2 ff ff       	call   80101270 <namecmp>
80104f98:	85 c0                	test   %eax,%eax
80104f9a:	0f 84 25 01 00 00    	je     801050c5 <sys_unlink+0x195>
80104fa0:	c7 44 24 04 2b 75 10 	movl   $0x8010752b,0x4(%esp)
80104fa7:	80 
80104fa8:	89 1c 24             	mov    %ebx,(%esp)
80104fab:	e8 c0 c2 ff ff       	call   80101270 <namecmp>
80104fb0:	85 c0                	test   %eax,%eax
80104fb2:	0f 84 0d 01 00 00    	je     801050c5 <sys_unlink+0x195>
80104fb8:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104fbb:	89 44 24 08          	mov    %eax,0x8(%esp)
80104fbf:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104fc3:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104fc6:	89 04 24             	mov    %eax,(%esp)
80104fc9:	e8 42 c8 ff ff       	call   80101810 <dirlookup>
80104fce:	85 c0                	test   %eax,%eax
80104fd0:	89 c6                	mov    %eax,%esi
80104fd2:	0f 84 ed 00 00 00    	je     801050c5 <sys_unlink+0x195>
80104fd8:	89 04 24             	mov    %eax,(%esp)
80104fdb:	e8 b0 c9 ff ff       	call   80101990 <ilock>
80104fe0:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80104fe5:	0f 8e 2a 01 00 00    	jle    80105115 <sys_unlink+0x1e5>
80104feb:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104ff0:	74 7e                	je     80105070 <sys_unlink+0x140>
80104ff2:	8d 5d c2             	lea    -0x3e(%ebp),%ebx
80104ff5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104ffc:	00 
80104ffd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105004:	00 
80105005:	89 1c 24             	mov    %ebx,(%esp)
80105008:	e8 73 f3 ff ff       	call   80104380 <memset>
8010500d:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80105014:	00 
80105015:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105018:	89 5c 24 04          	mov    %ebx,0x4(%esp)
8010501c:	89 44 24 08          	mov    %eax,0x8(%esp)
80105020:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80105023:	89 04 24             	mov    %eax,(%esp)
80105026:	e8 b5 c5 ff ff       	call   801015e0 <writei>
8010502b:	83 f8 10             	cmp    $0x10,%eax
8010502e:	0f 85 d5 00 00 00    	jne    80105109 <sys_unlink+0x1d9>
80105034:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105039:	0f 84 a9 00 00 00    	je     801050e8 <sys_unlink+0x1b8>
8010503f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80105042:	89 04 24             	mov    %eax,(%esp)
80105045:	e8 c6 cc ff ff       	call   80101d10 <iunlockput>
8010504a:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
8010504f:	89 34 24             	mov    %esi,(%esp)
80105052:	e8 c9 c2 ff ff       	call   80101320 <iupdate>
80105057:	89 34 24             	mov    %esi,(%esp)
8010505a:	e8 b1 cc ff ff       	call   80101d10 <iunlockput>
8010505f:	e8 6c db ff ff       	call   80102bd0 <end_op>
80105064:	31 c0                	xor    %eax,%eax
80105066:	83 c4 6c             	add    $0x6c,%esp
80105069:	5b                   	pop    %ebx
8010506a:	5e                   	pop    %esi
8010506b:	5f                   	pop    %edi
8010506c:	5d                   	pop    %ebp
8010506d:	c3                   	ret    
8010506e:	66 90                	xchg   %ax,%ax
80105070:	83 7e 58 20          	cmpl   $0x20,0x58(%esi)
80105074:	0f 86 78 ff ff ff    	jbe    80104ff2 <sys_unlink+0xc2>
8010507a:	8d 7d b2             	lea    -0x4e(%ebp),%edi
8010507d:	bb 20 00 00 00       	mov    $0x20,%ebx
80105082:	eb 10                	jmp    80105094 <sys_unlink+0x164>
80105084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105088:	83 c3 10             	add    $0x10,%ebx
8010508b:	3b 5e 58             	cmp    0x58(%esi),%ebx
8010508e:	0f 83 5e ff ff ff    	jae    80104ff2 <sys_unlink+0xc2>
80105094:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
8010509b:	00 
8010509c:	89 5c 24 08          	mov    %ebx,0x8(%esp)
801050a0:	89 7c 24 04          	mov    %edi,0x4(%esp)
801050a4:	89 34 24             	mov    %esi,(%esp)
801050a7:	e8 54 c6 ff ff       	call   80101700 <readi>
801050ac:	83 f8 10             	cmp    $0x10,%eax
801050af:	75 4c                	jne    801050fd <sys_unlink+0x1cd>
801050b1:	66 83 7d b2 00       	cmpw   $0x0,-0x4e(%ebp)
801050b6:	74 d0                	je     80105088 <sys_unlink+0x158>
801050b8:	89 34 24             	mov    %esi,(%esp)
801050bb:	90                   	nop
801050bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801050c0:	e8 4b cc ff ff       	call   80101d10 <iunlockput>
801050c5:	8b 45 a4             	mov    -0x5c(%ebp),%eax
801050c8:	89 04 24             	mov    %eax,(%esp)
801050cb:	e8 40 cc ff ff       	call   80101d10 <iunlockput>
801050d0:	e8 fb da ff ff       	call   80102bd0 <end_op>
801050d5:	83 c4 6c             	add    $0x6c,%esp
801050d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050dd:	5b                   	pop    %ebx
801050de:	5e                   	pop    %esi
801050df:	5f                   	pop    %edi
801050e0:	5d                   	pop    %ebp
801050e1:	c3                   	ret    
801050e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050e8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
801050eb:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
801050f0:	89 04 24             	mov    %eax,(%esp)
801050f3:	e8 28 c2 ff ff       	call   80101320 <iupdate>
801050f8:	e9 42 ff ff ff       	jmp    8010503f <sys_unlink+0x10f>
801050fd:	c7 04 24 5c 75 10 80 	movl   $0x8010755c,(%esp)
80105104:	e8 a7 b2 ff ff       	call   801003b0 <panic>
80105109:	c7 04 24 6e 75 10 80 	movl   $0x8010756e,(%esp)
80105110:	e8 9b b2 ff ff       	call   801003b0 <panic>
80105115:	c7 04 24 4a 75 10 80 	movl   $0x8010754a,(%esp)
8010511c:	e8 8f b2 ff ff       	call   801003b0 <panic>
80105121:	eb 0d                	jmp    80105130 <T.62>
80105123:	90                   	nop
80105124:	90                   	nop
80105125:	90                   	nop
80105126:	90                   	nop
80105127:	90                   	nop
80105128:	90                   	nop
80105129:	90                   	nop
8010512a:	90                   	nop
8010512b:	90                   	nop
8010512c:	90                   	nop
8010512d:	90                   	nop
8010512e:	90                   	nop
8010512f:	90                   	nop

80105130 <T.62>:
80105130:	55                   	push   %ebp
80105131:	89 e5                	mov    %esp,%ebp
80105133:	83 ec 28             	sub    $0x28,%esp
80105136:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80105139:	89 c3                	mov    %eax,%ebx
8010513b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010513e:	89 75 fc             	mov    %esi,-0x4(%ebp)
80105141:	89 d6                	mov    %edx,%esi
80105143:	89 44 24 04          	mov    %eax,0x4(%esp)
80105147:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010514e:	e8 0d f5 ff ff       	call   80104660 <argint>
80105153:	85 c0                	test   %eax,%eax
80105155:	79 11                	jns    80105168 <T.62+0x38>
80105157:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010515c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
8010515f:	8b 75 fc             	mov    -0x4(%ebp),%esi
80105162:	89 ec                	mov    %ebp,%esp
80105164:	5d                   	pop    %ebp
80105165:	c3                   	ret    
80105166:	66 90                	xchg   %ax,%ax
80105168:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010516c:	77 e9                	ja     80105157 <T.62+0x27>
8010516e:	e8 dd e8 ff ff       	call   80103a50 <myproc>
80105173:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80105176:	8b 54 88 28          	mov    0x28(%eax,%ecx,4),%edx
8010517a:	85 d2                	test   %edx,%edx
8010517c:	74 d9                	je     80105157 <T.62+0x27>
8010517e:	85 db                	test   %ebx,%ebx
80105180:	74 02                	je     80105184 <T.62+0x54>
80105182:	89 0b                	mov    %ecx,(%ebx)
80105184:	31 c0                	xor    %eax,%eax
80105186:	85 f6                	test   %esi,%esi
80105188:	74 d2                	je     8010515c <T.62+0x2c>
8010518a:	89 16                	mov    %edx,(%esi)
8010518c:	eb ce                	jmp    8010515c <T.62+0x2c>
8010518e:	66 90                	xchg   %ax,%ax

80105190 <sys_dup>:
80105190:	55                   	push   %ebp
80105191:	31 c0                	xor    %eax,%eax
80105193:	89 e5                	mov    %esp,%ebp
80105195:	53                   	push   %ebx
80105196:	83 ec 24             	sub    $0x24,%esp
80105199:	8d 55 f4             	lea    -0xc(%ebp),%edx
8010519c:	e8 8f ff ff ff       	call   80105130 <T.62>
801051a1:	85 c0                	test   %eax,%eax
801051a3:	79 13                	jns    801051b8 <sys_dup+0x28>
801051a5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801051aa:	89 d8                	mov    %ebx,%eax
801051ac:	83 c4 24             	add    $0x24,%esp
801051af:	5b                   	pop    %ebx
801051b0:	5d                   	pop    %ebp
801051b1:	c3                   	ret    
801051b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801051b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051bb:	e8 20 f6 ff ff       	call   801047e0 <fdalloc>
801051c0:	85 c0                	test   %eax,%eax
801051c2:	89 c3                	mov    %eax,%ebx
801051c4:	78 df                	js     801051a5 <sys_dup+0x15>
801051c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051c9:	89 04 24             	mov    %eax,(%esp)
801051cc:	e8 af bd ff ff       	call   80100f80 <filedup>
801051d1:	eb d7                	jmp    801051aa <sys_dup+0x1a>
801051d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801051d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801051e0 <sys_read>:
801051e0:	55                   	push   %ebp
801051e1:	31 c0                	xor    %eax,%eax
801051e3:	89 e5                	mov    %esp,%ebp
801051e5:	83 ec 28             	sub    $0x28,%esp
801051e8:	8d 55 f4             	lea    -0xc(%ebp),%edx
801051eb:	e8 40 ff ff ff       	call   80105130 <T.62>
801051f0:	85 c0                	test   %eax,%eax
801051f2:	79 0c                	jns    80105200 <sys_read+0x20>
801051f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051f9:	c9                   	leave  
801051fa:	c3                   	ret    
801051fb:	90                   	nop
801051fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105200:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105203:	89 44 24 04          	mov    %eax,0x4(%esp)
80105207:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
8010520e:	e8 4d f4 ff ff       	call   80104660 <argint>
80105213:	85 c0                	test   %eax,%eax
80105215:	78 dd                	js     801051f4 <sys_read+0x14>
80105217:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010521a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105221:	89 44 24 08          	mov    %eax,0x8(%esp)
80105225:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105228:	89 44 24 04          	mov    %eax,0x4(%esp)
8010522c:	e8 af f4 ff ff       	call   801046e0 <argptr>
80105231:	85 c0                	test   %eax,%eax
80105233:	78 bf                	js     801051f4 <sys_read+0x14>
80105235:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105238:	89 44 24 08          	mov    %eax,0x8(%esp)
8010523c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010523f:	89 44 24 04          	mov    %eax,0x4(%esp)
80105243:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105246:	89 04 24             	mov    %eax,(%esp)
80105249:	e8 32 bc ff ff       	call   80100e80 <fileread>
8010524e:	c9                   	leave  
8010524f:	c3                   	ret    

80105250 <sys_write>:
80105250:	55                   	push   %ebp
80105251:	31 c0                	xor    %eax,%eax
80105253:	89 e5                	mov    %esp,%ebp
80105255:	83 ec 28             	sub    $0x28,%esp
80105258:	8d 55 f4             	lea    -0xc(%ebp),%edx
8010525b:	e8 d0 fe ff ff       	call   80105130 <T.62>
80105260:	85 c0                	test   %eax,%eax
80105262:	79 0c                	jns    80105270 <sys_write+0x20>
80105264:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105269:	c9                   	leave  
8010526a:	c3                   	ret    
8010526b:	90                   	nop
8010526c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105270:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105273:	89 44 24 04          	mov    %eax,0x4(%esp)
80105277:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
8010527e:	e8 dd f3 ff ff       	call   80104660 <argint>
80105283:	85 c0                	test   %eax,%eax
80105285:	78 dd                	js     80105264 <sys_write+0x14>
80105287:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010528a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105291:	89 44 24 08          	mov    %eax,0x8(%esp)
80105295:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105298:	89 44 24 04          	mov    %eax,0x4(%esp)
8010529c:	e8 3f f4 ff ff       	call   801046e0 <argptr>
801052a1:	85 c0                	test   %eax,%eax
801052a3:	78 bf                	js     80105264 <sys_write+0x14>
801052a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
801052a8:	89 44 24 08          	mov    %eax,0x8(%esp)
801052ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
801052af:	89 44 24 04          	mov    %eax,0x4(%esp)
801052b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801052b6:	89 04 24             	mov    %eax,(%esp)
801052b9:	e8 a2 ba ff ff       	call   80100d60 <filewrite>
801052be:	c9                   	leave  
801052bf:	c3                   	ret    

801052c0 <sys_fstat>:
801052c0:	55                   	push   %ebp
801052c1:	31 c0                	xor    %eax,%eax
801052c3:	89 e5                	mov    %esp,%ebp
801052c5:	83 ec 28             	sub    $0x28,%esp
801052c8:	8d 55 f4             	lea    -0xc(%ebp),%edx
801052cb:	e8 60 fe ff ff       	call   80105130 <T.62>
801052d0:	85 c0                	test   %eax,%eax
801052d2:	79 0c                	jns    801052e0 <sys_fstat+0x20>
801052d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052d9:	c9                   	leave  
801052da:	c3                   	ret    
801052db:	90                   	nop
801052dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801052e0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052e3:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801052ea:	00 
801052eb:	89 44 24 04          	mov    %eax,0x4(%esp)
801052ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801052f6:	e8 e5 f3 ff ff       	call   801046e0 <argptr>
801052fb:	85 c0                	test   %eax,%eax
801052fd:	78 d5                	js     801052d4 <sys_fstat+0x14>
801052ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105302:	89 44 24 04          	mov    %eax,0x4(%esp)
80105306:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105309:	89 04 24             	mov    %eax,(%esp)
8010530c:	e8 1f bc ff ff       	call   80100f30 <filestat>
80105311:	c9                   	leave  
80105312:	c3                   	ret    
80105313:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105320 <sys_close>:
80105320:	55                   	push   %ebp
80105321:	89 e5                	mov    %esp,%ebp
80105323:	83 ec 28             	sub    $0x28,%esp
80105326:	8d 55 f0             	lea    -0x10(%ebp),%edx
80105329:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010532c:	e8 ff fd ff ff       	call   80105130 <T.62>
80105331:	89 c2                	mov    %eax,%edx
80105333:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105338:	85 d2                	test   %edx,%edx
8010533a:	78 1d                	js     80105359 <sys_close+0x39>
8010533c:	e8 0f e7 ff ff       	call   80103a50 <myproc>
80105341:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105344:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
8010534b:	00 
8010534c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010534f:	89 04 24             	mov    %eax,(%esp)
80105352:	e8 f9 bc ff ff       	call   80101050 <fileclose>
80105357:	31 c0                	xor    %eax,%eax
80105359:	c9                   	leave  
8010535a:	c3                   	ret    
8010535b:	66 90                	xchg   %ax,%ax
8010535d:	66 90                	xchg   %ax,%ax
8010535f:	90                   	nop

80105360 <sys_date>:
  return xticks;
}

int
sys_date(struct rtcdate *r)
{
80105360:	55                   	push   %ebp
80105361:	89 e5                	mov    %esp,%ebp
80105363:	83 ec 18             	sub    $0x18,%esp
if (argptr(0, (void *)&r, sizeof(*r)) < 0)
80105366:	8d 45 08             	lea    0x8(%ebp),%eax
80105369:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
80105370:	00 
80105371:	89 44 24 04          	mov    %eax,0x4(%esp)
80105375:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010537c:	e8 5f f3 ff ff       	call   801046e0 <argptr>
80105381:	89 c2                	mov    %eax,%edx
80105383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105388:	85 d2                	test   %edx,%edx
8010538a:	78 0d                	js     80105399 <sys_date+0x39>
          return -1;
  cmostime(r);
8010538c:	8b 45 08             	mov    0x8(%ebp),%eax
8010538f:	89 04 24             	mov    %eax,(%esp)
80105392:	e8 89 d4 ff ff       	call   80102820 <cmostime>
80105397:	31 c0                	xor    %eax,%eax

  return 0;

  
80105399:	c9                   	leave  
8010539a:	c3                   	ret    
8010539b:	90                   	nop
8010539c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053a0 <sys_uptime>:
{
801053a0:	55                   	push   %ebp
801053a1:	89 e5                	mov    %esp,%ebp
801053a3:	53                   	push   %ebx
801053a4:	83 ec 14             	sub    $0x14,%esp
  acquire(&tickslock);
801053a7:	c7 04 24 20 4d 11 80 	movl   $0x80114d20,(%esp)
801053ae:	e8 5d ef ff ff       	call   80104310 <acquire>
  xticks = ticks;
801053b3:	8b 1d 60 55 11 80    	mov    0x80115560,%ebx
  release(&tickslock);
801053b9:	c7 04 24 20 4d 11 80 	movl   $0x80114d20,(%esp)
801053c0:	e8 fb ee ff ff       	call   801042c0 <release>
}
801053c5:	83 c4 14             	add    $0x14,%esp
801053c8:	89 d8                	mov    %ebx,%eax
801053ca:	5b                   	pop    %ebx
801053cb:	5d                   	pop    %ebp
801053cc:	c3                   	ret    
801053cd:	8d 76 00             	lea    0x0(%esi),%esi

801053d0 <sys_getpid>:
{
801053d0:	55                   	push   %ebp
801053d1:	89 e5                	mov    %esp,%ebp
801053d3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801053d6:	e8 75 e6 ff ff       	call   80103a50 <myproc>
801053db:	8b 40 10             	mov    0x10(%eax),%eax
}
801053de:	c9                   	leave  
801053df:	c3                   	ret    

801053e0 <sys_sleep>:
{
801053e0:	55                   	push   %ebp
801053e1:	89 e5                	mov    %esp,%ebp
801053e3:	53                   	push   %ebx
801053e4:	83 ec 24             	sub    $0x24,%esp
  if(argint(0, &n) < 0)
801053e7:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053ea:	89 44 24 04          	mov    %eax,0x4(%esp)
801053ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801053f5:	e8 66 f2 ff ff       	call   80104660 <argint>
801053fa:	89 c2                	mov    %eax,%edx
801053fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105401:	85 d2                	test   %edx,%edx
80105403:	78 58                	js     8010545d <sys_sleep+0x7d>
  acquire(&tickslock);
80105405:	c7 04 24 20 4d 11 80 	movl   $0x80114d20,(%esp)
8010540c:	e8 ff ee ff ff       	call   80104310 <acquire>
  while(ticks - ticks0 < n){
80105411:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
80105414:	8b 1d 60 55 11 80    	mov    0x80115560,%ebx
  while(ticks - ticks0 < n){
8010541a:	85 d2                	test   %edx,%edx
8010541c:	75 22                	jne    80105440 <sys_sleep+0x60>
8010541e:	eb 48                	jmp    80105468 <sys_sleep+0x88>
    sleep(&ticks, &tickslock);
80105420:	c7 44 24 04 20 4d 11 	movl   $0x80114d20,0x4(%esp)
80105427:	80 
80105428:	c7 04 24 60 55 11 80 	movl   $0x80115560,(%esp)
8010542f:	e8 7c e8 ff ff       	call   80103cb0 <sleep>
  while(ticks - ticks0 < n){
80105434:	a1 60 55 11 80       	mov    0x80115560,%eax
80105439:	29 d8                	sub    %ebx,%eax
8010543b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010543e:	73 28                	jae    80105468 <sys_sleep+0x88>
    if(myproc()->killed){
80105440:	e8 0b e6 ff ff       	call   80103a50 <myproc>
80105445:	8b 40 24             	mov    0x24(%eax),%eax
80105448:	85 c0                	test   %eax,%eax
8010544a:	74 d4                	je     80105420 <sys_sleep+0x40>
      release(&tickslock);
8010544c:	c7 04 24 20 4d 11 80 	movl   $0x80114d20,(%esp)
80105453:	e8 68 ee ff ff       	call   801042c0 <release>
80105458:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010545d:	83 c4 24             	add    $0x24,%esp
80105460:	5b                   	pop    %ebx
80105461:	5d                   	pop    %ebp
80105462:	c3                   	ret    
80105463:	90                   	nop
80105464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&tickslock);
80105468:	c7 04 24 20 4d 11 80 	movl   $0x80114d20,(%esp)
8010546f:	e8 4c ee ff ff       	call   801042c0 <release>
}
80105474:	83 c4 24             	add    $0x24,%esp
  release(&tickslock);
80105477:	31 c0                	xor    %eax,%eax
}
80105479:	5b                   	pop    %ebx
8010547a:	5d                   	pop    %ebp
8010547b:	c3                   	ret    
8010547c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105480 <sys_sbrk>:
{
80105480:	55                   	push   %ebp
80105481:	89 e5                	mov    %esp,%ebp
80105483:	53                   	push   %ebx
80105484:	83 ec 24             	sub    $0x24,%esp
  if(argint(0, &n) < 0)
80105487:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010548a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010548e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105495:	e8 c6 f1 ff ff       	call   80104660 <argint>
8010549a:	85 c0                	test   %eax,%eax
8010549c:	79 12                	jns    801054b0 <sys_sbrk+0x30>
  return addr;
8010549e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801054a3:	83 c4 24             	add    $0x24,%esp
801054a6:	5b                   	pop    %ebx
801054a7:	5d                   	pop    %ebp
801054a8:	c3                   	ret    
801054a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  addr = myproc()->sz;
801054b0:	e8 9b e5 ff ff       	call   80103a50 <myproc>
801054b5:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801054b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801054ba:	89 04 24             	mov    %eax,(%esp)
801054bd:	e8 ce e6 ff ff       	call   80103b90 <growproc>
801054c2:	89 c2                	mov    %eax,%edx
  addr = myproc()->sz;
801054c4:	89 d8                	mov    %ebx,%eax
  if(growproc(n) < 0)
801054c6:	85 d2                	test   %edx,%edx
801054c8:	79 d9                	jns    801054a3 <sys_sbrk+0x23>
801054ca:	eb d2                	jmp    8010549e <sys_sbrk+0x1e>
801054cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054d0 <sys_kill>:
{
801054d0:	55                   	push   %ebp
801054d1:	89 e5                	mov    %esp,%ebp
801054d3:	83 ec 28             	sub    $0x28,%esp
  if(argint(0, &pid) < 0)
801054d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054d9:	89 44 24 04          	mov    %eax,0x4(%esp)
801054dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801054e4:	e8 77 f1 ff ff       	call   80104660 <argint>
801054e9:	89 c2                	mov    %eax,%edx
801054eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054f0:	85 d2                	test   %edx,%edx
801054f2:	78 0b                	js     801054ff <sys_kill+0x2f>
  return kill(pid);
801054f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801054f7:	89 04 24             	mov    %eax,(%esp)
801054fa:	e8 11 e1 ff ff       	call   80103610 <kill>
}
801054ff:	c9                   	leave  
80105500:	c3                   	ret    
80105501:	eb 0d                	jmp    80105510 <sys_wait>
80105503:	90                   	nop
80105504:	90                   	nop
80105505:	90                   	nop
80105506:	90                   	nop
80105507:	90                   	nop
80105508:	90                   	nop
80105509:	90                   	nop
8010550a:	90                   	nop
8010550b:	90                   	nop
8010550c:	90                   	nop
8010550d:	90                   	nop
8010550e:	90                   	nop
8010550f:	90                   	nop

80105510 <sys_wait>:
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	83 ec 08             	sub    $0x8,%esp
}
80105516:	c9                   	leave  
  return wait();
80105517:	e9 54 e8 ff ff       	jmp    80103d70 <wait>
8010551c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105520 <sys_exit>:
{
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
80105523:	83 ec 08             	sub    $0x8,%esp
  exit();
80105526:	e8 75 e9 ff ff       	call   80103ea0 <exit>
}
8010552b:	31 c0                	xor    %eax,%eax
8010552d:	c9                   	leave  
8010552e:	c3                   	ret    
8010552f:	90                   	nop

80105530 <sys_fork>:
{
80105530:	55                   	push   %ebp
80105531:	89 e5                	mov    %esp,%ebp
80105533:	83 ec 08             	sub    $0x8,%esp
}
80105536:	c9                   	leave  
  return fork();
80105537:	e9 44 e5 ff ff       	jmp    80103a80 <fork>

8010553c <alltraps>:
8010553c:	1e                   	push   %ds
8010553d:	06                   	push   %es
8010553e:	0f a0                	push   %fs
80105540:	0f a8                	push   %gs
80105542:	60                   	pusha  
80105543:	66 b8 10 00          	mov    $0x10,%ax
80105547:	8e d8                	mov    %eax,%ds
80105549:	8e c0                	mov    %eax,%es
8010554b:	54                   	push   %esp
8010554c:	e8 3f 00 00 00       	call   80105590 <trap>
80105551:	83 c4 04             	add    $0x4,%esp

80105554 <trapret>:
80105554:	61                   	popa   
80105555:	0f a9                	pop    %gs
80105557:	0f a1                	pop    %fs
80105559:	07                   	pop    %es
8010555a:	1f                   	pop    %ds
8010555b:	83 c4 08             	add    $0x8,%esp
8010555e:	cf                   	iret   
8010555f:	90                   	nop

80105560 <idtinit>:
80105560:	55                   	push   %ebp
80105561:	b8 60 4d 11 80       	mov    $0x80114d60,%eax
80105566:	89 e5                	mov    %esp,%ebp
80105568:	83 ec 10             	sub    $0x10,%esp
8010556b:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
80105571:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105575:	c1 e8 10             	shr    $0x10,%eax
80105578:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
8010557c:	8d 45 fa             	lea    -0x6(%ebp),%eax
8010557f:	0f 01 18             	lidtl  (%eax)
80105582:	c9                   	leave  
80105583:	c3                   	ret    
80105584:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010558a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105590 <trap>:
80105590:	55                   	push   %ebp
80105591:	89 e5                	mov    %esp,%ebp
80105593:	83 ec 48             	sub    $0x48,%esp
80105596:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80105599:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010559c:	89 75 f8             	mov    %esi,-0x8(%ebp)
8010559f:	89 7d fc             	mov    %edi,-0x4(%ebp)
801055a2:	8b 43 30             	mov    0x30(%ebx),%eax
801055a5:	83 f8 40             	cmp    $0x40,%eax
801055a8:	0f 84 02 02 00 00    	je     801057b0 <trap+0x220>
801055ae:	83 e8 20             	sub    $0x20,%eax
801055b1:	83 f8 1f             	cmp    $0x1f,%eax
801055b4:	0f 86 fe 00 00 00    	jbe    801056b8 <trap+0x128>
801055ba:	e8 91 e4 ff ff       	call   80103a50 <myproc>
801055bf:	85 c0                	test   %eax,%eax
801055c1:	0f 84 43 02 00 00    	je     8010580a <trap+0x27a>
801055c7:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
801055cb:	0f 84 39 02 00 00    	je     8010580a <trap+0x27a>
801055d1:	0f 20 d2             	mov    %cr2,%edx
801055d4:	8b 7b 38             	mov    0x38(%ebx),%edi
801055d7:	89 55 dc             	mov    %edx,-0x24(%ebp)
801055da:	e8 e1 e9 ff ff       	call   80103fc0 <cpuid>
801055df:	8b 4b 34             	mov    0x34(%ebx),%ecx
801055e2:	89 c6                	mov    %eax,%esi
801055e4:	8b 43 30             	mov    0x30(%ebx),%eax
801055e7:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801055ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801055ed:	e8 5e e4 ff ff       	call   80103a50 <myproc>
801055f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
801055f5:	e8 56 e4 ff ff       	call   80103a50 <myproc>
801055fa:	8b 55 dc             	mov    -0x24(%ebp),%edx
801055fd:	89 7c 24 18          	mov    %edi,0x18(%esp)
80105601:	89 74 24 14          	mov    %esi,0x14(%esp)
80105605:	89 54 24 1c          	mov    %edx,0x1c(%esp)
80105609:	8b 4d d8             	mov    -0x28(%ebp),%ecx
8010560c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
80105610:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105613:	89 54 24 0c          	mov    %edx,0xc(%esp)
80105617:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010561a:	83 c2 6c             	add    $0x6c,%edx
8010561d:	89 54 24 08          	mov    %edx,0x8(%esp)
80105621:	8b 40 10             	mov    0x10(%eax),%eax
80105624:	c7 04 24 d8 75 10 80 	movl   $0x801075d8,(%esp)
8010562b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010562f:	e8 1c b2 ff ff       	call   80100850 <cprintf>
80105634:	e8 17 e4 ff ff       	call   80103a50 <myproc>
80105639:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105640:	e8 0b e4 ff ff       	call   80103a50 <myproc>
80105645:	85 c0                	test   %eax,%eax
80105647:	74 1c                	je     80105665 <trap+0xd5>
80105649:	e8 02 e4 ff ff       	call   80103a50 <myproc>
8010564e:	8b 50 24             	mov    0x24(%eax),%edx
80105651:	85 d2                	test   %edx,%edx
80105653:	74 10                	je     80105665 <trap+0xd5>
80105655:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105659:	83 e0 03             	and    $0x3,%eax
8010565c:	83 f8 03             	cmp    $0x3,%eax
8010565f:	0f 84 8b 01 00 00    	je     801057f0 <trap+0x260>
80105665:	e8 e6 e3 ff ff       	call   80103a50 <myproc>
8010566a:	85 c0                	test   %eax,%eax
8010566c:	74 11                	je     8010567f <trap+0xef>
8010566e:	66 90                	xchg   %ax,%ax
80105670:	e8 db e3 ff ff       	call   80103a50 <myproc>
80105675:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105679:	0f 84 11 01 00 00    	je     80105790 <trap+0x200>
8010567f:	90                   	nop
80105680:	e8 cb e3 ff ff       	call   80103a50 <myproc>
80105685:	85 c0                	test   %eax,%eax
80105687:	74 1c                	je     801056a5 <trap+0x115>
80105689:	e8 c2 e3 ff ff       	call   80103a50 <myproc>
8010568e:	8b 40 24             	mov    0x24(%eax),%eax
80105691:	85 c0                	test   %eax,%eax
80105693:	74 10                	je     801056a5 <trap+0x115>
80105695:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105699:	83 e0 03             	and    $0x3,%eax
8010569c:	83 f8 03             	cmp    $0x3,%eax
8010569f:	0f 84 34 01 00 00    	je     801057d9 <trap+0x249>
801056a5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801056a8:	8b 75 f8             	mov    -0x8(%ebp),%esi
801056ab:	8b 7d fc             	mov    -0x4(%ebp),%edi
801056ae:	89 ec                	mov    %ebp,%esp
801056b0:	5d                   	pop    %ebp
801056b1:	c3                   	ret    
801056b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801056b8:	ff 24 85 28 76 10 80 	jmp    *-0x7fef89d8(,%eax,4)
801056bf:	90                   	nop
801056c0:	e8 5b ca ff ff       	call   80102120 <ideintr>
801056c5:	8d 76 00             	lea    0x0(%esi),%esi
801056c8:	e8 73 d0 ff ff       	call   80102740 <lapiceoi>
801056cd:	8d 76 00             	lea    0x0(%esi),%esi
801056d0:	e9 6b ff ff ff       	jmp    80105640 <trap+0xb0>
801056d5:	8d 76 00             	lea    0x0(%esi),%esi
801056d8:	8b 7b 38             	mov    0x38(%ebx),%edi
801056db:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
801056df:	e8 dc e8 ff ff       	call   80103fc0 <cpuid>
801056e4:	c7 04 24 80 75 10 80 	movl   $0x80107580,(%esp)
801056eb:	89 7c 24 0c          	mov    %edi,0xc(%esp)
801056ef:	89 74 24 08          	mov    %esi,0x8(%esp)
801056f3:	89 44 24 04          	mov    %eax,0x4(%esp)
801056f7:	e8 54 b1 ff ff       	call   80100850 <cprintf>
801056fc:	e8 3f d0 ff ff       	call   80102740 <lapiceoi>
80105701:	e9 3a ff ff ff       	jmp    80105640 <trap+0xb0>
80105706:	66 90                	xchg   %ax,%ax
80105708:	90                   	nop
80105709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105710:	e8 eb 01 00 00       	call   80105900 <uartintr>
80105715:	8d 76 00             	lea    0x0(%esi),%esi
80105718:	e8 23 d0 ff ff       	call   80102740 <lapiceoi>
8010571d:	8d 76 00             	lea    0x0(%esi),%esi
80105720:	e9 1b ff ff ff       	jmp    80105640 <trap+0xb0>
80105725:	8d 76 00             	lea    0x0(%esi),%esi
80105728:	90                   	nop
80105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105730:	e8 8b ce ff ff       	call   801025c0 <kbdintr>
80105735:	8d 76 00             	lea    0x0(%esi),%esi
80105738:	e8 03 d0 ff ff       	call   80102740 <lapiceoi>
8010573d:	8d 76 00             	lea    0x0(%esi),%esi
80105740:	e9 fb fe ff ff       	jmp    80105640 <trap+0xb0>
80105745:	8d 76 00             	lea    0x0(%esi),%esi
80105748:	90                   	nop
80105749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105750:	e8 6b e8 ff ff       	call   80103fc0 <cpuid>
80105755:	85 c0                	test   %eax,%eax
80105757:	0f 85 68 ff ff ff    	jne    801056c5 <trap+0x135>
8010575d:	c7 04 24 20 4d 11 80 	movl   $0x80114d20,(%esp)
80105764:	e8 a7 eb ff ff       	call   80104310 <acquire>
80105769:	83 05 60 55 11 80 01 	addl   $0x1,0x80115560
80105770:	c7 04 24 60 55 11 80 	movl   $0x80115560,(%esp)
80105777:	e8 24 df ff ff       	call   801036a0 <wakeup>
8010577c:	c7 04 24 20 4d 11 80 	movl   $0x80114d20,(%esp)
80105783:	e8 38 eb ff ff       	call   801042c0 <release>
80105788:	e9 38 ff ff ff       	jmp    801056c5 <trap+0x135>
8010578d:	8d 76 00             	lea    0x0(%esi),%esi
80105790:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105794:	0f 85 e5 fe ff ff    	jne    8010567f <trap+0xef>
8010579a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801057a0:	e8 bb e6 ff ff       	call   80103e60 <yield>
801057a5:	e9 d5 fe ff ff       	jmp    8010567f <trap+0xef>
801057aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801057b0:	e8 9b e2 ff ff       	call   80103a50 <myproc>
801057b5:	8b 70 24             	mov    0x24(%eax),%esi
801057b8:	85 f6                	test   %esi,%esi
801057ba:	75 44                	jne    80105800 <trap+0x270>
801057bc:	e8 8f e2 ff ff       	call   80103a50 <myproc>
801057c1:	89 58 18             	mov    %ebx,0x18(%eax)
801057c4:	e8 77 ef ff ff       	call   80104740 <syscall>
801057c9:	e8 82 e2 ff ff       	call   80103a50 <myproc>
801057ce:	8b 48 24             	mov    0x24(%eax),%ecx
801057d1:	85 c9                	test   %ecx,%ecx
801057d3:	0f 84 cc fe ff ff    	je     801056a5 <trap+0x115>
801057d9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801057dc:	8b 75 f8             	mov    -0x8(%ebp),%esi
801057df:	8b 7d fc             	mov    -0x4(%ebp),%edi
801057e2:	89 ec                	mov    %ebp,%esp
801057e4:	5d                   	pop    %ebp
801057e5:	e9 b6 e6 ff ff       	jmp    80103ea0 <exit>
801057ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801057f0:	e8 ab e6 ff ff       	call   80103ea0 <exit>
801057f5:	e9 6b fe ff ff       	jmp    80105665 <trap+0xd5>
801057fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105800:	e8 9b e6 ff ff       	call   80103ea0 <exit>
80105805:	8d 76 00             	lea    0x0(%esi),%esi
80105808:	eb b2                	jmp    801057bc <trap+0x22c>
8010580a:	0f 20 d7             	mov    %cr2,%edi
8010580d:	8b 73 38             	mov    0x38(%ebx),%esi
80105810:	e8 ab e7 ff ff       	call   80103fc0 <cpuid>
80105815:	89 7c 24 10          	mov    %edi,0x10(%esp)
80105819:	89 74 24 0c          	mov    %esi,0xc(%esp)
8010581d:	89 44 24 08          	mov    %eax,0x8(%esp)
80105821:	8b 43 30             	mov    0x30(%ebx),%eax
80105824:	c7 04 24 a4 75 10 80 	movl   $0x801075a4,(%esp)
8010582b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010582f:	e8 1c b0 ff ff       	call   80100850 <cprintf>
80105834:	c7 04 24 1b 76 10 80 	movl   $0x8010761b,(%esp)
8010583b:	e8 70 ab ff ff       	call   801003b0 <panic>

80105840 <tvinit>:
80105840:	55                   	push   %ebp
80105841:	31 c0                	xor    %eax,%eax
80105843:	89 e5                	mov    %esp,%ebp
80105845:	ba 60 4d 11 80       	mov    $0x80114d60,%edx
8010584a:	83 ec 18             	sub    $0x18,%esp
8010584d:	8d 76 00             	lea    0x0(%esi),%esi
80105850:	8b 0c 85 aa a0 10 80 	mov    -0x7fef5f56(,%eax,4),%ecx
80105857:	66 89 0c c5 60 4d 11 	mov    %cx,-0x7feeb2a0(,%eax,8)
8010585e:	80 
8010585f:	c1 e9 10             	shr    $0x10,%ecx
80105862:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
80105869:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
8010586e:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
80105873:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
80105878:	83 c0 01             	add    $0x1,%eax
8010587b:	3d 00 01 00 00       	cmp    $0x100,%eax
80105880:	75 ce                	jne    80105850 <tvinit+0x10>
80105882:	a1 aa a1 10 80       	mov    0x8010a1aa,%eax
80105887:	c7 44 24 04 20 76 10 	movl   $0x80107620,0x4(%esp)
8010588e:	80 
8010588f:	c7 04 24 20 4d 11 80 	movl   $0x80114d20,(%esp)
80105896:	66 c7 05 62 4f 11 80 	movw   $0x8,0x80114f62
8010589d:	08 00 
8010589f:	66 a3 60 4f 11 80    	mov    %ax,0x80114f60
801058a5:	c1 e8 10             	shr    $0x10,%eax
801058a8:	c6 05 64 4f 11 80 00 	movb   $0x0,0x80114f64
801058af:	c6 05 65 4f 11 80 ef 	movb   $0xef,0x80114f65
801058b6:	66 a3 66 4f 11 80    	mov    %ax,0x80114f66
801058bc:	e8 7f e8 ff ff       	call   80104140 <initlock>
801058c1:	c9                   	leave  
801058c2:	c3                   	ret    
801058c3:	66 90                	xchg   %ax,%ax
801058c5:	66 90                	xchg   %ax,%ax
801058c7:	66 90                	xchg   %ax,%ax
801058c9:	66 90                	xchg   %ax,%ax
801058cb:	66 90                	xchg   %ax,%ax
801058cd:	66 90                	xchg   %ax,%ax
801058cf:	90                   	nop

801058d0 <uartgetc>:
801058d0:	a1 64 a6 10 80       	mov    0x8010a664,%eax
801058d5:	55                   	push   %ebp
801058d6:	89 e5                	mov    %esp,%ebp
801058d8:	85 c0                	test   %eax,%eax
801058da:	75 0c                	jne    801058e8 <uartgetc+0x18>
801058dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058e1:	5d                   	pop    %ebp
801058e2:	c3                   	ret    
801058e3:	90                   	nop
801058e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801058e8:	ba fd 03 00 00       	mov    $0x3fd,%edx
801058ed:	ec                   	in     (%dx),%al
801058ee:	a8 01                	test   $0x1,%al
801058f0:	74 ea                	je     801058dc <uartgetc+0xc>
801058f2:	b2 f8                	mov    $0xf8,%dl
801058f4:	ec                   	in     (%dx),%al
801058f5:	0f b6 c0             	movzbl %al,%eax
801058f8:	5d                   	pop    %ebp
801058f9:	c3                   	ret    
801058fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105900 <uartintr>:
80105900:	55                   	push   %ebp
80105901:	89 e5                	mov    %esp,%ebp
80105903:	83 ec 18             	sub    $0x18,%esp
80105906:	c7 04 24 d0 58 10 80 	movl   $0x801058d0,(%esp)
8010590d:	e8 0e ad ff ff       	call   80100620 <consoleintr>
80105912:	c9                   	leave  
80105913:	c3                   	ret    
80105914:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010591a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105920 <uartputc>:
80105920:	55                   	push   %ebp
80105921:	89 e5                	mov    %esp,%ebp
80105923:	56                   	push   %esi
80105924:	be fd 03 00 00       	mov    $0x3fd,%esi
80105929:	53                   	push   %ebx
8010592a:	31 db                	xor    %ebx,%ebx
8010592c:	83 ec 10             	sub    $0x10,%esp
8010592f:	8b 15 64 a6 10 80    	mov    0x8010a664,%edx
80105935:	85 d2                	test   %edx,%edx
80105937:	75 1e                	jne    80105957 <uartputc+0x37>
80105939:	eb 2c                	jmp    80105967 <uartputc+0x47>
8010593b:	90                   	nop
8010593c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105940:	83 c3 01             	add    $0x1,%ebx
80105943:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
8010594a:	e8 11 ce ff ff       	call   80102760 <microdelay>
8010594f:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
80105955:	74 07                	je     8010595e <uartputc+0x3e>
80105957:	89 f2                	mov    %esi,%edx
80105959:	ec                   	in     (%dx),%al
8010595a:	a8 20                	test   $0x20,%al
8010595c:	74 e2                	je     80105940 <uartputc+0x20>
8010595e:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105963:	8b 45 08             	mov    0x8(%ebp),%eax
80105966:	ee                   	out    %al,(%dx)
80105967:	83 c4 10             	add    $0x10,%esp
8010596a:	5b                   	pop    %ebx
8010596b:	5e                   	pop    %esi
8010596c:	5d                   	pop    %ebp
8010596d:	c3                   	ret    
8010596e:	66 90                	xchg   %ax,%ax

80105970 <uartinit>:
80105970:	55                   	push   %ebp
80105971:	31 c9                	xor    %ecx,%ecx
80105973:	89 e5                	mov    %esp,%ebp
80105975:	89 c8                	mov    %ecx,%eax
80105977:	57                   	push   %edi
80105978:	bf fa 03 00 00       	mov    $0x3fa,%edi
8010597d:	56                   	push   %esi
8010597e:	89 fa                	mov    %edi,%edx
80105980:	53                   	push   %ebx
80105981:	83 ec 1c             	sub    $0x1c,%esp
80105984:	ee                   	out    %al,(%dx)
80105985:	bb fb 03 00 00       	mov    $0x3fb,%ebx
8010598a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
8010598f:	89 da                	mov    %ebx,%edx
80105991:	ee                   	out    %al,(%dx)
80105992:	b8 0c 00 00 00       	mov    $0xc,%eax
80105997:	b2 f8                	mov    $0xf8,%dl
80105999:	ee                   	out    %al,(%dx)
8010599a:	be f9 03 00 00       	mov    $0x3f9,%esi
8010599f:	89 c8                	mov    %ecx,%eax
801059a1:	89 f2                	mov    %esi,%edx
801059a3:	ee                   	out    %al,(%dx)
801059a4:	b8 03 00 00 00       	mov    $0x3,%eax
801059a9:	89 da                	mov    %ebx,%edx
801059ab:	ee                   	out    %al,(%dx)
801059ac:	b2 fc                	mov    $0xfc,%dl
801059ae:	89 c8                	mov    %ecx,%eax
801059b0:	ee                   	out    %al,(%dx)
801059b1:	b8 01 00 00 00       	mov    $0x1,%eax
801059b6:	89 f2                	mov    %esi,%edx
801059b8:	ee                   	out    %al,(%dx)
801059b9:	b2 fd                	mov    $0xfd,%dl
801059bb:	ec                   	in     (%dx),%al
801059bc:	3c ff                	cmp    $0xff,%al
801059be:	74 45                	je     80105a05 <uartinit+0x95>
801059c0:	c7 05 64 a6 10 80 01 	movl   $0x1,0x8010a664
801059c7:	00 00 00 
801059ca:	89 fa                	mov    %edi,%edx
801059cc:	ec                   	in     (%dx),%al
801059cd:	b2 f8                	mov    $0xf8,%dl
801059cf:	ec                   	in     (%dx),%al
801059d0:	bb a8 76 10 80       	mov    $0x801076a8,%ebx
801059d5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801059dc:	00 
801059dd:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
801059e4:	e8 57 c8 ff ff       	call   80102240 <ioapicenable>
801059e9:	b8 78 00 00 00       	mov    $0x78,%eax
801059ee:	66 90                	xchg   %ax,%ax
801059f0:	0f be c0             	movsbl %al,%eax
801059f3:	83 c3 01             	add    $0x1,%ebx
801059f6:	89 04 24             	mov    %eax,(%esp)
801059f9:	e8 22 ff ff ff       	call   80105920 <uartputc>
801059fe:	0f b6 03             	movzbl (%ebx),%eax
80105a01:	84 c0                	test   %al,%al
80105a03:	75 eb                	jne    801059f0 <uartinit+0x80>
80105a05:	83 c4 1c             	add    $0x1c,%esp
80105a08:	5b                   	pop    %ebx
80105a09:	5e                   	pop    %esi
80105a0a:	5f                   	pop    %edi
80105a0b:	5d                   	pop    %ebp
80105a0c:	c3                   	ret    

80105a0d <vector0>:
80105a0d:	6a 00                	push   $0x0
80105a0f:	6a 00                	push   $0x0
80105a11:	e9 26 fb ff ff       	jmp    8010553c <alltraps>

80105a16 <vector1>:
80105a16:	6a 00                	push   $0x0
80105a18:	6a 01                	push   $0x1
80105a1a:	e9 1d fb ff ff       	jmp    8010553c <alltraps>

80105a1f <vector2>:
80105a1f:	6a 00                	push   $0x0
80105a21:	6a 02                	push   $0x2
80105a23:	e9 14 fb ff ff       	jmp    8010553c <alltraps>

80105a28 <vector3>:
80105a28:	6a 00                	push   $0x0
80105a2a:	6a 03                	push   $0x3
80105a2c:	e9 0b fb ff ff       	jmp    8010553c <alltraps>

80105a31 <vector4>:
80105a31:	6a 00                	push   $0x0
80105a33:	6a 04                	push   $0x4
80105a35:	e9 02 fb ff ff       	jmp    8010553c <alltraps>

80105a3a <vector5>:
80105a3a:	6a 00                	push   $0x0
80105a3c:	6a 05                	push   $0x5
80105a3e:	e9 f9 fa ff ff       	jmp    8010553c <alltraps>

80105a43 <vector6>:
80105a43:	6a 00                	push   $0x0
80105a45:	6a 06                	push   $0x6
80105a47:	e9 f0 fa ff ff       	jmp    8010553c <alltraps>

80105a4c <vector7>:
80105a4c:	6a 00                	push   $0x0
80105a4e:	6a 07                	push   $0x7
80105a50:	e9 e7 fa ff ff       	jmp    8010553c <alltraps>

80105a55 <vector8>:
80105a55:	6a 08                	push   $0x8
80105a57:	e9 e0 fa ff ff       	jmp    8010553c <alltraps>

80105a5c <vector9>:
80105a5c:	6a 00                	push   $0x0
80105a5e:	6a 09                	push   $0x9
80105a60:	e9 d7 fa ff ff       	jmp    8010553c <alltraps>

80105a65 <vector10>:
80105a65:	6a 0a                	push   $0xa
80105a67:	e9 d0 fa ff ff       	jmp    8010553c <alltraps>

80105a6c <vector11>:
80105a6c:	6a 0b                	push   $0xb
80105a6e:	e9 c9 fa ff ff       	jmp    8010553c <alltraps>

80105a73 <vector12>:
80105a73:	6a 0c                	push   $0xc
80105a75:	e9 c2 fa ff ff       	jmp    8010553c <alltraps>

80105a7a <vector13>:
80105a7a:	6a 0d                	push   $0xd
80105a7c:	e9 bb fa ff ff       	jmp    8010553c <alltraps>

80105a81 <vector14>:
80105a81:	6a 0e                	push   $0xe
80105a83:	e9 b4 fa ff ff       	jmp    8010553c <alltraps>

80105a88 <vector15>:
80105a88:	6a 00                	push   $0x0
80105a8a:	6a 0f                	push   $0xf
80105a8c:	e9 ab fa ff ff       	jmp    8010553c <alltraps>

80105a91 <vector16>:
80105a91:	6a 00                	push   $0x0
80105a93:	6a 10                	push   $0x10
80105a95:	e9 a2 fa ff ff       	jmp    8010553c <alltraps>

80105a9a <vector17>:
80105a9a:	6a 11                	push   $0x11
80105a9c:	e9 9b fa ff ff       	jmp    8010553c <alltraps>

80105aa1 <vector18>:
80105aa1:	6a 00                	push   $0x0
80105aa3:	6a 12                	push   $0x12
80105aa5:	e9 92 fa ff ff       	jmp    8010553c <alltraps>

80105aaa <vector19>:
80105aaa:	6a 00                	push   $0x0
80105aac:	6a 13                	push   $0x13
80105aae:	e9 89 fa ff ff       	jmp    8010553c <alltraps>

80105ab3 <vector20>:
80105ab3:	6a 00                	push   $0x0
80105ab5:	6a 14                	push   $0x14
80105ab7:	e9 80 fa ff ff       	jmp    8010553c <alltraps>

80105abc <vector21>:
80105abc:	6a 00                	push   $0x0
80105abe:	6a 15                	push   $0x15
80105ac0:	e9 77 fa ff ff       	jmp    8010553c <alltraps>

80105ac5 <vector22>:
80105ac5:	6a 00                	push   $0x0
80105ac7:	6a 16                	push   $0x16
80105ac9:	e9 6e fa ff ff       	jmp    8010553c <alltraps>

80105ace <vector23>:
80105ace:	6a 00                	push   $0x0
80105ad0:	6a 17                	push   $0x17
80105ad2:	e9 65 fa ff ff       	jmp    8010553c <alltraps>

80105ad7 <vector24>:
80105ad7:	6a 00                	push   $0x0
80105ad9:	6a 18                	push   $0x18
80105adb:	e9 5c fa ff ff       	jmp    8010553c <alltraps>

80105ae0 <vector25>:
80105ae0:	6a 00                	push   $0x0
80105ae2:	6a 19                	push   $0x19
80105ae4:	e9 53 fa ff ff       	jmp    8010553c <alltraps>

80105ae9 <vector26>:
80105ae9:	6a 00                	push   $0x0
80105aeb:	6a 1a                	push   $0x1a
80105aed:	e9 4a fa ff ff       	jmp    8010553c <alltraps>

80105af2 <vector27>:
80105af2:	6a 00                	push   $0x0
80105af4:	6a 1b                	push   $0x1b
80105af6:	e9 41 fa ff ff       	jmp    8010553c <alltraps>

80105afb <vector28>:
80105afb:	6a 00                	push   $0x0
80105afd:	6a 1c                	push   $0x1c
80105aff:	e9 38 fa ff ff       	jmp    8010553c <alltraps>

80105b04 <vector29>:
80105b04:	6a 00                	push   $0x0
80105b06:	6a 1d                	push   $0x1d
80105b08:	e9 2f fa ff ff       	jmp    8010553c <alltraps>

80105b0d <vector30>:
80105b0d:	6a 00                	push   $0x0
80105b0f:	6a 1e                	push   $0x1e
80105b11:	e9 26 fa ff ff       	jmp    8010553c <alltraps>

80105b16 <vector31>:
80105b16:	6a 00                	push   $0x0
80105b18:	6a 1f                	push   $0x1f
80105b1a:	e9 1d fa ff ff       	jmp    8010553c <alltraps>

80105b1f <vector32>:
80105b1f:	6a 00                	push   $0x0
80105b21:	6a 20                	push   $0x20
80105b23:	e9 14 fa ff ff       	jmp    8010553c <alltraps>

80105b28 <vector33>:
80105b28:	6a 00                	push   $0x0
80105b2a:	6a 21                	push   $0x21
80105b2c:	e9 0b fa ff ff       	jmp    8010553c <alltraps>

80105b31 <vector34>:
80105b31:	6a 00                	push   $0x0
80105b33:	6a 22                	push   $0x22
80105b35:	e9 02 fa ff ff       	jmp    8010553c <alltraps>

80105b3a <vector35>:
80105b3a:	6a 00                	push   $0x0
80105b3c:	6a 23                	push   $0x23
80105b3e:	e9 f9 f9 ff ff       	jmp    8010553c <alltraps>

80105b43 <vector36>:
80105b43:	6a 00                	push   $0x0
80105b45:	6a 24                	push   $0x24
80105b47:	e9 f0 f9 ff ff       	jmp    8010553c <alltraps>

80105b4c <vector37>:
80105b4c:	6a 00                	push   $0x0
80105b4e:	6a 25                	push   $0x25
80105b50:	e9 e7 f9 ff ff       	jmp    8010553c <alltraps>

80105b55 <vector38>:
80105b55:	6a 00                	push   $0x0
80105b57:	6a 26                	push   $0x26
80105b59:	e9 de f9 ff ff       	jmp    8010553c <alltraps>

80105b5e <vector39>:
80105b5e:	6a 00                	push   $0x0
80105b60:	6a 27                	push   $0x27
80105b62:	e9 d5 f9 ff ff       	jmp    8010553c <alltraps>

80105b67 <vector40>:
80105b67:	6a 00                	push   $0x0
80105b69:	6a 28                	push   $0x28
80105b6b:	e9 cc f9 ff ff       	jmp    8010553c <alltraps>

80105b70 <vector41>:
80105b70:	6a 00                	push   $0x0
80105b72:	6a 29                	push   $0x29
80105b74:	e9 c3 f9 ff ff       	jmp    8010553c <alltraps>

80105b79 <vector42>:
80105b79:	6a 00                	push   $0x0
80105b7b:	6a 2a                	push   $0x2a
80105b7d:	e9 ba f9 ff ff       	jmp    8010553c <alltraps>

80105b82 <vector43>:
80105b82:	6a 00                	push   $0x0
80105b84:	6a 2b                	push   $0x2b
80105b86:	e9 b1 f9 ff ff       	jmp    8010553c <alltraps>

80105b8b <vector44>:
80105b8b:	6a 00                	push   $0x0
80105b8d:	6a 2c                	push   $0x2c
80105b8f:	e9 a8 f9 ff ff       	jmp    8010553c <alltraps>

80105b94 <vector45>:
80105b94:	6a 00                	push   $0x0
80105b96:	6a 2d                	push   $0x2d
80105b98:	e9 9f f9 ff ff       	jmp    8010553c <alltraps>

80105b9d <vector46>:
80105b9d:	6a 00                	push   $0x0
80105b9f:	6a 2e                	push   $0x2e
80105ba1:	e9 96 f9 ff ff       	jmp    8010553c <alltraps>

80105ba6 <vector47>:
80105ba6:	6a 00                	push   $0x0
80105ba8:	6a 2f                	push   $0x2f
80105baa:	e9 8d f9 ff ff       	jmp    8010553c <alltraps>

80105baf <vector48>:
80105baf:	6a 00                	push   $0x0
80105bb1:	6a 30                	push   $0x30
80105bb3:	e9 84 f9 ff ff       	jmp    8010553c <alltraps>

80105bb8 <vector49>:
80105bb8:	6a 00                	push   $0x0
80105bba:	6a 31                	push   $0x31
80105bbc:	e9 7b f9 ff ff       	jmp    8010553c <alltraps>

80105bc1 <vector50>:
80105bc1:	6a 00                	push   $0x0
80105bc3:	6a 32                	push   $0x32
80105bc5:	e9 72 f9 ff ff       	jmp    8010553c <alltraps>

80105bca <vector51>:
80105bca:	6a 00                	push   $0x0
80105bcc:	6a 33                	push   $0x33
80105bce:	e9 69 f9 ff ff       	jmp    8010553c <alltraps>

80105bd3 <vector52>:
80105bd3:	6a 00                	push   $0x0
80105bd5:	6a 34                	push   $0x34
80105bd7:	e9 60 f9 ff ff       	jmp    8010553c <alltraps>

80105bdc <vector53>:
80105bdc:	6a 00                	push   $0x0
80105bde:	6a 35                	push   $0x35
80105be0:	e9 57 f9 ff ff       	jmp    8010553c <alltraps>

80105be5 <vector54>:
80105be5:	6a 00                	push   $0x0
80105be7:	6a 36                	push   $0x36
80105be9:	e9 4e f9 ff ff       	jmp    8010553c <alltraps>

80105bee <vector55>:
80105bee:	6a 00                	push   $0x0
80105bf0:	6a 37                	push   $0x37
80105bf2:	e9 45 f9 ff ff       	jmp    8010553c <alltraps>

80105bf7 <vector56>:
80105bf7:	6a 00                	push   $0x0
80105bf9:	6a 38                	push   $0x38
80105bfb:	e9 3c f9 ff ff       	jmp    8010553c <alltraps>

80105c00 <vector57>:
80105c00:	6a 00                	push   $0x0
80105c02:	6a 39                	push   $0x39
80105c04:	e9 33 f9 ff ff       	jmp    8010553c <alltraps>

80105c09 <vector58>:
80105c09:	6a 00                	push   $0x0
80105c0b:	6a 3a                	push   $0x3a
80105c0d:	e9 2a f9 ff ff       	jmp    8010553c <alltraps>

80105c12 <vector59>:
80105c12:	6a 00                	push   $0x0
80105c14:	6a 3b                	push   $0x3b
80105c16:	e9 21 f9 ff ff       	jmp    8010553c <alltraps>

80105c1b <vector60>:
80105c1b:	6a 00                	push   $0x0
80105c1d:	6a 3c                	push   $0x3c
80105c1f:	e9 18 f9 ff ff       	jmp    8010553c <alltraps>

80105c24 <vector61>:
80105c24:	6a 00                	push   $0x0
80105c26:	6a 3d                	push   $0x3d
80105c28:	e9 0f f9 ff ff       	jmp    8010553c <alltraps>

80105c2d <vector62>:
80105c2d:	6a 00                	push   $0x0
80105c2f:	6a 3e                	push   $0x3e
80105c31:	e9 06 f9 ff ff       	jmp    8010553c <alltraps>

80105c36 <vector63>:
80105c36:	6a 00                	push   $0x0
80105c38:	6a 3f                	push   $0x3f
80105c3a:	e9 fd f8 ff ff       	jmp    8010553c <alltraps>

80105c3f <vector64>:
80105c3f:	6a 00                	push   $0x0
80105c41:	6a 40                	push   $0x40
80105c43:	e9 f4 f8 ff ff       	jmp    8010553c <alltraps>

80105c48 <vector65>:
80105c48:	6a 00                	push   $0x0
80105c4a:	6a 41                	push   $0x41
80105c4c:	e9 eb f8 ff ff       	jmp    8010553c <alltraps>

80105c51 <vector66>:
80105c51:	6a 00                	push   $0x0
80105c53:	6a 42                	push   $0x42
80105c55:	e9 e2 f8 ff ff       	jmp    8010553c <alltraps>

80105c5a <vector67>:
80105c5a:	6a 00                	push   $0x0
80105c5c:	6a 43                	push   $0x43
80105c5e:	e9 d9 f8 ff ff       	jmp    8010553c <alltraps>

80105c63 <vector68>:
80105c63:	6a 00                	push   $0x0
80105c65:	6a 44                	push   $0x44
80105c67:	e9 d0 f8 ff ff       	jmp    8010553c <alltraps>

80105c6c <vector69>:
80105c6c:	6a 00                	push   $0x0
80105c6e:	6a 45                	push   $0x45
80105c70:	e9 c7 f8 ff ff       	jmp    8010553c <alltraps>

80105c75 <vector70>:
80105c75:	6a 00                	push   $0x0
80105c77:	6a 46                	push   $0x46
80105c79:	e9 be f8 ff ff       	jmp    8010553c <alltraps>

80105c7e <vector71>:
80105c7e:	6a 00                	push   $0x0
80105c80:	6a 47                	push   $0x47
80105c82:	e9 b5 f8 ff ff       	jmp    8010553c <alltraps>

80105c87 <vector72>:
80105c87:	6a 00                	push   $0x0
80105c89:	6a 48                	push   $0x48
80105c8b:	e9 ac f8 ff ff       	jmp    8010553c <alltraps>

80105c90 <vector73>:
80105c90:	6a 00                	push   $0x0
80105c92:	6a 49                	push   $0x49
80105c94:	e9 a3 f8 ff ff       	jmp    8010553c <alltraps>

80105c99 <vector74>:
80105c99:	6a 00                	push   $0x0
80105c9b:	6a 4a                	push   $0x4a
80105c9d:	e9 9a f8 ff ff       	jmp    8010553c <alltraps>

80105ca2 <vector75>:
80105ca2:	6a 00                	push   $0x0
80105ca4:	6a 4b                	push   $0x4b
80105ca6:	e9 91 f8 ff ff       	jmp    8010553c <alltraps>

80105cab <vector76>:
80105cab:	6a 00                	push   $0x0
80105cad:	6a 4c                	push   $0x4c
80105caf:	e9 88 f8 ff ff       	jmp    8010553c <alltraps>

80105cb4 <vector77>:
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 4d                	push   $0x4d
80105cb8:	e9 7f f8 ff ff       	jmp    8010553c <alltraps>

80105cbd <vector78>:
80105cbd:	6a 00                	push   $0x0
80105cbf:	6a 4e                	push   $0x4e
80105cc1:	e9 76 f8 ff ff       	jmp    8010553c <alltraps>

80105cc6 <vector79>:
80105cc6:	6a 00                	push   $0x0
80105cc8:	6a 4f                	push   $0x4f
80105cca:	e9 6d f8 ff ff       	jmp    8010553c <alltraps>

80105ccf <vector80>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	6a 50                	push   $0x50
80105cd3:	e9 64 f8 ff ff       	jmp    8010553c <alltraps>

80105cd8 <vector81>:
80105cd8:	6a 00                	push   $0x0
80105cda:	6a 51                	push   $0x51
80105cdc:	e9 5b f8 ff ff       	jmp    8010553c <alltraps>

80105ce1 <vector82>:
80105ce1:	6a 00                	push   $0x0
80105ce3:	6a 52                	push   $0x52
80105ce5:	e9 52 f8 ff ff       	jmp    8010553c <alltraps>

80105cea <vector83>:
80105cea:	6a 00                	push   $0x0
80105cec:	6a 53                	push   $0x53
80105cee:	e9 49 f8 ff ff       	jmp    8010553c <alltraps>

80105cf3 <vector84>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	6a 54                	push   $0x54
80105cf7:	e9 40 f8 ff ff       	jmp    8010553c <alltraps>

80105cfc <vector85>:
80105cfc:	6a 00                	push   $0x0
80105cfe:	6a 55                	push   $0x55
80105d00:	e9 37 f8 ff ff       	jmp    8010553c <alltraps>

80105d05 <vector86>:
80105d05:	6a 00                	push   $0x0
80105d07:	6a 56                	push   $0x56
80105d09:	e9 2e f8 ff ff       	jmp    8010553c <alltraps>

80105d0e <vector87>:
80105d0e:	6a 00                	push   $0x0
80105d10:	6a 57                	push   $0x57
80105d12:	e9 25 f8 ff ff       	jmp    8010553c <alltraps>

80105d17 <vector88>:
80105d17:	6a 00                	push   $0x0
80105d19:	6a 58                	push   $0x58
80105d1b:	e9 1c f8 ff ff       	jmp    8010553c <alltraps>

80105d20 <vector89>:
80105d20:	6a 00                	push   $0x0
80105d22:	6a 59                	push   $0x59
80105d24:	e9 13 f8 ff ff       	jmp    8010553c <alltraps>

80105d29 <vector90>:
80105d29:	6a 00                	push   $0x0
80105d2b:	6a 5a                	push   $0x5a
80105d2d:	e9 0a f8 ff ff       	jmp    8010553c <alltraps>

80105d32 <vector91>:
80105d32:	6a 00                	push   $0x0
80105d34:	6a 5b                	push   $0x5b
80105d36:	e9 01 f8 ff ff       	jmp    8010553c <alltraps>

80105d3b <vector92>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	6a 5c                	push   $0x5c
80105d3f:	e9 f8 f7 ff ff       	jmp    8010553c <alltraps>

80105d44 <vector93>:
80105d44:	6a 00                	push   $0x0
80105d46:	6a 5d                	push   $0x5d
80105d48:	e9 ef f7 ff ff       	jmp    8010553c <alltraps>

80105d4d <vector94>:
80105d4d:	6a 00                	push   $0x0
80105d4f:	6a 5e                	push   $0x5e
80105d51:	e9 e6 f7 ff ff       	jmp    8010553c <alltraps>

80105d56 <vector95>:
80105d56:	6a 00                	push   $0x0
80105d58:	6a 5f                	push   $0x5f
80105d5a:	e9 dd f7 ff ff       	jmp    8010553c <alltraps>

80105d5f <vector96>:
80105d5f:	6a 00                	push   $0x0
80105d61:	6a 60                	push   $0x60
80105d63:	e9 d4 f7 ff ff       	jmp    8010553c <alltraps>

80105d68 <vector97>:
80105d68:	6a 00                	push   $0x0
80105d6a:	6a 61                	push   $0x61
80105d6c:	e9 cb f7 ff ff       	jmp    8010553c <alltraps>

80105d71 <vector98>:
80105d71:	6a 00                	push   $0x0
80105d73:	6a 62                	push   $0x62
80105d75:	e9 c2 f7 ff ff       	jmp    8010553c <alltraps>

80105d7a <vector99>:
80105d7a:	6a 00                	push   $0x0
80105d7c:	6a 63                	push   $0x63
80105d7e:	e9 b9 f7 ff ff       	jmp    8010553c <alltraps>

80105d83 <vector100>:
80105d83:	6a 00                	push   $0x0
80105d85:	6a 64                	push   $0x64
80105d87:	e9 b0 f7 ff ff       	jmp    8010553c <alltraps>

80105d8c <vector101>:
80105d8c:	6a 00                	push   $0x0
80105d8e:	6a 65                	push   $0x65
80105d90:	e9 a7 f7 ff ff       	jmp    8010553c <alltraps>

80105d95 <vector102>:
80105d95:	6a 00                	push   $0x0
80105d97:	6a 66                	push   $0x66
80105d99:	e9 9e f7 ff ff       	jmp    8010553c <alltraps>

80105d9e <vector103>:
80105d9e:	6a 00                	push   $0x0
80105da0:	6a 67                	push   $0x67
80105da2:	e9 95 f7 ff ff       	jmp    8010553c <alltraps>

80105da7 <vector104>:
80105da7:	6a 00                	push   $0x0
80105da9:	6a 68                	push   $0x68
80105dab:	e9 8c f7 ff ff       	jmp    8010553c <alltraps>

80105db0 <vector105>:
80105db0:	6a 00                	push   $0x0
80105db2:	6a 69                	push   $0x69
80105db4:	e9 83 f7 ff ff       	jmp    8010553c <alltraps>

80105db9 <vector106>:
80105db9:	6a 00                	push   $0x0
80105dbb:	6a 6a                	push   $0x6a
80105dbd:	e9 7a f7 ff ff       	jmp    8010553c <alltraps>

80105dc2 <vector107>:
80105dc2:	6a 00                	push   $0x0
80105dc4:	6a 6b                	push   $0x6b
80105dc6:	e9 71 f7 ff ff       	jmp    8010553c <alltraps>

80105dcb <vector108>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	6a 6c                	push   $0x6c
80105dcf:	e9 68 f7 ff ff       	jmp    8010553c <alltraps>

80105dd4 <vector109>:
80105dd4:	6a 00                	push   $0x0
80105dd6:	6a 6d                	push   $0x6d
80105dd8:	e9 5f f7 ff ff       	jmp    8010553c <alltraps>

80105ddd <vector110>:
80105ddd:	6a 00                	push   $0x0
80105ddf:	6a 6e                	push   $0x6e
80105de1:	e9 56 f7 ff ff       	jmp    8010553c <alltraps>

80105de6 <vector111>:
80105de6:	6a 00                	push   $0x0
80105de8:	6a 6f                	push   $0x6f
80105dea:	e9 4d f7 ff ff       	jmp    8010553c <alltraps>

80105def <vector112>:
80105def:	6a 00                	push   $0x0
80105df1:	6a 70                	push   $0x70
80105df3:	e9 44 f7 ff ff       	jmp    8010553c <alltraps>

80105df8 <vector113>:
80105df8:	6a 00                	push   $0x0
80105dfa:	6a 71                	push   $0x71
80105dfc:	e9 3b f7 ff ff       	jmp    8010553c <alltraps>

80105e01 <vector114>:
80105e01:	6a 00                	push   $0x0
80105e03:	6a 72                	push   $0x72
80105e05:	e9 32 f7 ff ff       	jmp    8010553c <alltraps>

80105e0a <vector115>:
80105e0a:	6a 00                	push   $0x0
80105e0c:	6a 73                	push   $0x73
80105e0e:	e9 29 f7 ff ff       	jmp    8010553c <alltraps>

80105e13 <vector116>:
80105e13:	6a 00                	push   $0x0
80105e15:	6a 74                	push   $0x74
80105e17:	e9 20 f7 ff ff       	jmp    8010553c <alltraps>

80105e1c <vector117>:
80105e1c:	6a 00                	push   $0x0
80105e1e:	6a 75                	push   $0x75
80105e20:	e9 17 f7 ff ff       	jmp    8010553c <alltraps>

80105e25 <vector118>:
80105e25:	6a 00                	push   $0x0
80105e27:	6a 76                	push   $0x76
80105e29:	e9 0e f7 ff ff       	jmp    8010553c <alltraps>

80105e2e <vector119>:
80105e2e:	6a 00                	push   $0x0
80105e30:	6a 77                	push   $0x77
80105e32:	e9 05 f7 ff ff       	jmp    8010553c <alltraps>

80105e37 <vector120>:
80105e37:	6a 00                	push   $0x0
80105e39:	6a 78                	push   $0x78
80105e3b:	e9 fc f6 ff ff       	jmp    8010553c <alltraps>

80105e40 <vector121>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 79                	push   $0x79
80105e44:	e9 f3 f6 ff ff       	jmp    8010553c <alltraps>

80105e49 <vector122>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 7a                	push   $0x7a
80105e4d:	e9 ea f6 ff ff       	jmp    8010553c <alltraps>

80105e52 <vector123>:
80105e52:	6a 00                	push   $0x0
80105e54:	6a 7b                	push   $0x7b
80105e56:	e9 e1 f6 ff ff       	jmp    8010553c <alltraps>

80105e5b <vector124>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	6a 7c                	push   $0x7c
80105e5f:	e9 d8 f6 ff ff       	jmp    8010553c <alltraps>

80105e64 <vector125>:
80105e64:	6a 00                	push   $0x0
80105e66:	6a 7d                	push   $0x7d
80105e68:	e9 cf f6 ff ff       	jmp    8010553c <alltraps>

80105e6d <vector126>:
80105e6d:	6a 00                	push   $0x0
80105e6f:	6a 7e                	push   $0x7e
80105e71:	e9 c6 f6 ff ff       	jmp    8010553c <alltraps>

80105e76 <vector127>:
80105e76:	6a 00                	push   $0x0
80105e78:	6a 7f                	push   $0x7f
80105e7a:	e9 bd f6 ff ff       	jmp    8010553c <alltraps>

80105e7f <vector128>:
80105e7f:	6a 00                	push   $0x0
80105e81:	68 80 00 00 00       	push   $0x80
80105e86:	e9 b1 f6 ff ff       	jmp    8010553c <alltraps>

80105e8b <vector129>:
80105e8b:	6a 00                	push   $0x0
80105e8d:	68 81 00 00 00       	push   $0x81
80105e92:	e9 a5 f6 ff ff       	jmp    8010553c <alltraps>

80105e97 <vector130>:
80105e97:	6a 00                	push   $0x0
80105e99:	68 82 00 00 00       	push   $0x82
80105e9e:	e9 99 f6 ff ff       	jmp    8010553c <alltraps>

80105ea3 <vector131>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	68 83 00 00 00       	push   $0x83
80105eaa:	e9 8d f6 ff ff       	jmp    8010553c <alltraps>

80105eaf <vector132>:
80105eaf:	6a 00                	push   $0x0
80105eb1:	68 84 00 00 00       	push   $0x84
80105eb6:	e9 81 f6 ff ff       	jmp    8010553c <alltraps>

80105ebb <vector133>:
80105ebb:	6a 00                	push   $0x0
80105ebd:	68 85 00 00 00       	push   $0x85
80105ec2:	e9 75 f6 ff ff       	jmp    8010553c <alltraps>

80105ec7 <vector134>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	68 86 00 00 00       	push   $0x86
80105ece:	e9 69 f6 ff ff       	jmp    8010553c <alltraps>

80105ed3 <vector135>:
80105ed3:	6a 00                	push   $0x0
80105ed5:	68 87 00 00 00       	push   $0x87
80105eda:	e9 5d f6 ff ff       	jmp    8010553c <alltraps>

80105edf <vector136>:
80105edf:	6a 00                	push   $0x0
80105ee1:	68 88 00 00 00       	push   $0x88
80105ee6:	e9 51 f6 ff ff       	jmp    8010553c <alltraps>

80105eeb <vector137>:
80105eeb:	6a 00                	push   $0x0
80105eed:	68 89 00 00 00       	push   $0x89
80105ef2:	e9 45 f6 ff ff       	jmp    8010553c <alltraps>

80105ef7 <vector138>:
80105ef7:	6a 00                	push   $0x0
80105ef9:	68 8a 00 00 00       	push   $0x8a
80105efe:	e9 39 f6 ff ff       	jmp    8010553c <alltraps>

80105f03 <vector139>:
80105f03:	6a 00                	push   $0x0
80105f05:	68 8b 00 00 00       	push   $0x8b
80105f0a:	e9 2d f6 ff ff       	jmp    8010553c <alltraps>

80105f0f <vector140>:
80105f0f:	6a 00                	push   $0x0
80105f11:	68 8c 00 00 00       	push   $0x8c
80105f16:	e9 21 f6 ff ff       	jmp    8010553c <alltraps>

80105f1b <vector141>:
80105f1b:	6a 00                	push   $0x0
80105f1d:	68 8d 00 00 00       	push   $0x8d
80105f22:	e9 15 f6 ff ff       	jmp    8010553c <alltraps>

80105f27 <vector142>:
80105f27:	6a 00                	push   $0x0
80105f29:	68 8e 00 00 00       	push   $0x8e
80105f2e:	e9 09 f6 ff ff       	jmp    8010553c <alltraps>

80105f33 <vector143>:
80105f33:	6a 00                	push   $0x0
80105f35:	68 8f 00 00 00       	push   $0x8f
80105f3a:	e9 fd f5 ff ff       	jmp    8010553c <alltraps>

80105f3f <vector144>:
80105f3f:	6a 00                	push   $0x0
80105f41:	68 90 00 00 00       	push   $0x90
80105f46:	e9 f1 f5 ff ff       	jmp    8010553c <alltraps>

80105f4b <vector145>:
80105f4b:	6a 00                	push   $0x0
80105f4d:	68 91 00 00 00       	push   $0x91
80105f52:	e9 e5 f5 ff ff       	jmp    8010553c <alltraps>

80105f57 <vector146>:
80105f57:	6a 00                	push   $0x0
80105f59:	68 92 00 00 00       	push   $0x92
80105f5e:	e9 d9 f5 ff ff       	jmp    8010553c <alltraps>

80105f63 <vector147>:
80105f63:	6a 00                	push   $0x0
80105f65:	68 93 00 00 00       	push   $0x93
80105f6a:	e9 cd f5 ff ff       	jmp    8010553c <alltraps>

80105f6f <vector148>:
80105f6f:	6a 00                	push   $0x0
80105f71:	68 94 00 00 00       	push   $0x94
80105f76:	e9 c1 f5 ff ff       	jmp    8010553c <alltraps>

80105f7b <vector149>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	68 95 00 00 00       	push   $0x95
80105f82:	e9 b5 f5 ff ff       	jmp    8010553c <alltraps>

80105f87 <vector150>:
80105f87:	6a 00                	push   $0x0
80105f89:	68 96 00 00 00       	push   $0x96
80105f8e:	e9 a9 f5 ff ff       	jmp    8010553c <alltraps>

80105f93 <vector151>:
80105f93:	6a 00                	push   $0x0
80105f95:	68 97 00 00 00       	push   $0x97
80105f9a:	e9 9d f5 ff ff       	jmp    8010553c <alltraps>

80105f9f <vector152>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	68 98 00 00 00       	push   $0x98
80105fa6:	e9 91 f5 ff ff       	jmp    8010553c <alltraps>

80105fab <vector153>:
80105fab:	6a 00                	push   $0x0
80105fad:	68 99 00 00 00       	push   $0x99
80105fb2:	e9 85 f5 ff ff       	jmp    8010553c <alltraps>

80105fb7 <vector154>:
80105fb7:	6a 00                	push   $0x0
80105fb9:	68 9a 00 00 00       	push   $0x9a
80105fbe:	e9 79 f5 ff ff       	jmp    8010553c <alltraps>

80105fc3 <vector155>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	68 9b 00 00 00       	push   $0x9b
80105fca:	e9 6d f5 ff ff       	jmp    8010553c <alltraps>

80105fcf <vector156>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	68 9c 00 00 00       	push   $0x9c
80105fd6:	e9 61 f5 ff ff       	jmp    8010553c <alltraps>

80105fdb <vector157>:
80105fdb:	6a 00                	push   $0x0
80105fdd:	68 9d 00 00 00       	push   $0x9d
80105fe2:	e9 55 f5 ff ff       	jmp    8010553c <alltraps>

80105fe7 <vector158>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	68 9e 00 00 00       	push   $0x9e
80105fee:	e9 49 f5 ff ff       	jmp    8010553c <alltraps>

80105ff3 <vector159>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	68 9f 00 00 00       	push   $0x9f
80105ffa:	e9 3d f5 ff ff       	jmp    8010553c <alltraps>

80105fff <vector160>:
80105fff:	6a 00                	push   $0x0
80106001:	68 a0 00 00 00       	push   $0xa0
80106006:	e9 31 f5 ff ff       	jmp    8010553c <alltraps>

8010600b <vector161>:
8010600b:	6a 00                	push   $0x0
8010600d:	68 a1 00 00 00       	push   $0xa1
80106012:	e9 25 f5 ff ff       	jmp    8010553c <alltraps>

80106017 <vector162>:
80106017:	6a 00                	push   $0x0
80106019:	68 a2 00 00 00       	push   $0xa2
8010601e:	e9 19 f5 ff ff       	jmp    8010553c <alltraps>

80106023 <vector163>:
80106023:	6a 00                	push   $0x0
80106025:	68 a3 00 00 00       	push   $0xa3
8010602a:	e9 0d f5 ff ff       	jmp    8010553c <alltraps>

8010602f <vector164>:
8010602f:	6a 00                	push   $0x0
80106031:	68 a4 00 00 00       	push   $0xa4
80106036:	e9 01 f5 ff ff       	jmp    8010553c <alltraps>

8010603b <vector165>:
8010603b:	6a 00                	push   $0x0
8010603d:	68 a5 00 00 00       	push   $0xa5
80106042:	e9 f5 f4 ff ff       	jmp    8010553c <alltraps>

80106047 <vector166>:
80106047:	6a 00                	push   $0x0
80106049:	68 a6 00 00 00       	push   $0xa6
8010604e:	e9 e9 f4 ff ff       	jmp    8010553c <alltraps>

80106053 <vector167>:
80106053:	6a 00                	push   $0x0
80106055:	68 a7 00 00 00       	push   $0xa7
8010605a:	e9 dd f4 ff ff       	jmp    8010553c <alltraps>

8010605f <vector168>:
8010605f:	6a 00                	push   $0x0
80106061:	68 a8 00 00 00       	push   $0xa8
80106066:	e9 d1 f4 ff ff       	jmp    8010553c <alltraps>

8010606b <vector169>:
8010606b:	6a 00                	push   $0x0
8010606d:	68 a9 00 00 00       	push   $0xa9
80106072:	e9 c5 f4 ff ff       	jmp    8010553c <alltraps>

80106077 <vector170>:
80106077:	6a 00                	push   $0x0
80106079:	68 aa 00 00 00       	push   $0xaa
8010607e:	e9 b9 f4 ff ff       	jmp    8010553c <alltraps>

80106083 <vector171>:
80106083:	6a 00                	push   $0x0
80106085:	68 ab 00 00 00       	push   $0xab
8010608a:	e9 ad f4 ff ff       	jmp    8010553c <alltraps>

8010608f <vector172>:
8010608f:	6a 00                	push   $0x0
80106091:	68 ac 00 00 00       	push   $0xac
80106096:	e9 a1 f4 ff ff       	jmp    8010553c <alltraps>

8010609b <vector173>:
8010609b:	6a 00                	push   $0x0
8010609d:	68 ad 00 00 00       	push   $0xad
801060a2:	e9 95 f4 ff ff       	jmp    8010553c <alltraps>

801060a7 <vector174>:
801060a7:	6a 00                	push   $0x0
801060a9:	68 ae 00 00 00       	push   $0xae
801060ae:	e9 89 f4 ff ff       	jmp    8010553c <alltraps>

801060b3 <vector175>:
801060b3:	6a 00                	push   $0x0
801060b5:	68 af 00 00 00       	push   $0xaf
801060ba:	e9 7d f4 ff ff       	jmp    8010553c <alltraps>

801060bf <vector176>:
801060bf:	6a 00                	push   $0x0
801060c1:	68 b0 00 00 00       	push   $0xb0
801060c6:	e9 71 f4 ff ff       	jmp    8010553c <alltraps>

801060cb <vector177>:
801060cb:	6a 00                	push   $0x0
801060cd:	68 b1 00 00 00       	push   $0xb1
801060d2:	e9 65 f4 ff ff       	jmp    8010553c <alltraps>

801060d7 <vector178>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 b2 00 00 00       	push   $0xb2
801060de:	e9 59 f4 ff ff       	jmp    8010553c <alltraps>

801060e3 <vector179>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 b3 00 00 00       	push   $0xb3
801060ea:	e9 4d f4 ff ff       	jmp    8010553c <alltraps>

801060ef <vector180>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 b4 00 00 00       	push   $0xb4
801060f6:	e9 41 f4 ff ff       	jmp    8010553c <alltraps>

801060fb <vector181>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 b5 00 00 00       	push   $0xb5
80106102:	e9 35 f4 ff ff       	jmp    8010553c <alltraps>

80106107 <vector182>:
80106107:	6a 00                	push   $0x0
80106109:	68 b6 00 00 00       	push   $0xb6
8010610e:	e9 29 f4 ff ff       	jmp    8010553c <alltraps>

80106113 <vector183>:
80106113:	6a 00                	push   $0x0
80106115:	68 b7 00 00 00       	push   $0xb7
8010611a:	e9 1d f4 ff ff       	jmp    8010553c <alltraps>

8010611f <vector184>:
8010611f:	6a 00                	push   $0x0
80106121:	68 b8 00 00 00       	push   $0xb8
80106126:	e9 11 f4 ff ff       	jmp    8010553c <alltraps>

8010612b <vector185>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 b9 00 00 00       	push   $0xb9
80106132:	e9 05 f4 ff ff       	jmp    8010553c <alltraps>

80106137 <vector186>:
80106137:	6a 00                	push   $0x0
80106139:	68 ba 00 00 00       	push   $0xba
8010613e:	e9 f9 f3 ff ff       	jmp    8010553c <alltraps>

80106143 <vector187>:
80106143:	6a 00                	push   $0x0
80106145:	68 bb 00 00 00       	push   $0xbb
8010614a:	e9 ed f3 ff ff       	jmp    8010553c <alltraps>

8010614f <vector188>:
8010614f:	6a 00                	push   $0x0
80106151:	68 bc 00 00 00       	push   $0xbc
80106156:	e9 e1 f3 ff ff       	jmp    8010553c <alltraps>

8010615b <vector189>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 bd 00 00 00       	push   $0xbd
80106162:	e9 d5 f3 ff ff       	jmp    8010553c <alltraps>

80106167 <vector190>:
80106167:	6a 00                	push   $0x0
80106169:	68 be 00 00 00       	push   $0xbe
8010616e:	e9 c9 f3 ff ff       	jmp    8010553c <alltraps>

80106173 <vector191>:
80106173:	6a 00                	push   $0x0
80106175:	68 bf 00 00 00       	push   $0xbf
8010617a:	e9 bd f3 ff ff       	jmp    8010553c <alltraps>

8010617f <vector192>:
8010617f:	6a 00                	push   $0x0
80106181:	68 c0 00 00 00       	push   $0xc0
80106186:	e9 b1 f3 ff ff       	jmp    8010553c <alltraps>

8010618b <vector193>:
8010618b:	6a 00                	push   $0x0
8010618d:	68 c1 00 00 00       	push   $0xc1
80106192:	e9 a5 f3 ff ff       	jmp    8010553c <alltraps>

80106197 <vector194>:
80106197:	6a 00                	push   $0x0
80106199:	68 c2 00 00 00       	push   $0xc2
8010619e:	e9 99 f3 ff ff       	jmp    8010553c <alltraps>

801061a3 <vector195>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 c3 00 00 00       	push   $0xc3
801061aa:	e9 8d f3 ff ff       	jmp    8010553c <alltraps>

801061af <vector196>:
801061af:	6a 00                	push   $0x0
801061b1:	68 c4 00 00 00       	push   $0xc4
801061b6:	e9 81 f3 ff ff       	jmp    8010553c <alltraps>

801061bb <vector197>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 c5 00 00 00       	push   $0xc5
801061c2:	e9 75 f3 ff ff       	jmp    8010553c <alltraps>

801061c7 <vector198>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 c6 00 00 00       	push   $0xc6
801061ce:	e9 69 f3 ff ff       	jmp    8010553c <alltraps>

801061d3 <vector199>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 c7 00 00 00       	push   $0xc7
801061da:	e9 5d f3 ff ff       	jmp    8010553c <alltraps>

801061df <vector200>:
801061df:	6a 00                	push   $0x0
801061e1:	68 c8 00 00 00       	push   $0xc8
801061e6:	e9 51 f3 ff ff       	jmp    8010553c <alltraps>

801061eb <vector201>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 c9 00 00 00       	push   $0xc9
801061f2:	e9 45 f3 ff ff       	jmp    8010553c <alltraps>

801061f7 <vector202>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 ca 00 00 00       	push   $0xca
801061fe:	e9 39 f3 ff ff       	jmp    8010553c <alltraps>

80106203 <vector203>:
80106203:	6a 00                	push   $0x0
80106205:	68 cb 00 00 00       	push   $0xcb
8010620a:	e9 2d f3 ff ff       	jmp    8010553c <alltraps>

8010620f <vector204>:
8010620f:	6a 00                	push   $0x0
80106211:	68 cc 00 00 00       	push   $0xcc
80106216:	e9 21 f3 ff ff       	jmp    8010553c <alltraps>

8010621b <vector205>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 cd 00 00 00       	push   $0xcd
80106222:	e9 15 f3 ff ff       	jmp    8010553c <alltraps>

80106227 <vector206>:
80106227:	6a 00                	push   $0x0
80106229:	68 ce 00 00 00       	push   $0xce
8010622e:	e9 09 f3 ff ff       	jmp    8010553c <alltraps>

80106233 <vector207>:
80106233:	6a 00                	push   $0x0
80106235:	68 cf 00 00 00       	push   $0xcf
8010623a:	e9 fd f2 ff ff       	jmp    8010553c <alltraps>

8010623f <vector208>:
8010623f:	6a 00                	push   $0x0
80106241:	68 d0 00 00 00       	push   $0xd0
80106246:	e9 f1 f2 ff ff       	jmp    8010553c <alltraps>

8010624b <vector209>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 d1 00 00 00       	push   $0xd1
80106252:	e9 e5 f2 ff ff       	jmp    8010553c <alltraps>

80106257 <vector210>:
80106257:	6a 00                	push   $0x0
80106259:	68 d2 00 00 00       	push   $0xd2
8010625e:	e9 d9 f2 ff ff       	jmp    8010553c <alltraps>

80106263 <vector211>:
80106263:	6a 00                	push   $0x0
80106265:	68 d3 00 00 00       	push   $0xd3
8010626a:	e9 cd f2 ff ff       	jmp    8010553c <alltraps>

8010626f <vector212>:
8010626f:	6a 00                	push   $0x0
80106271:	68 d4 00 00 00       	push   $0xd4
80106276:	e9 c1 f2 ff ff       	jmp    8010553c <alltraps>

8010627b <vector213>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 d5 00 00 00       	push   $0xd5
80106282:	e9 b5 f2 ff ff       	jmp    8010553c <alltraps>

80106287 <vector214>:
80106287:	6a 00                	push   $0x0
80106289:	68 d6 00 00 00       	push   $0xd6
8010628e:	e9 a9 f2 ff ff       	jmp    8010553c <alltraps>

80106293 <vector215>:
80106293:	6a 00                	push   $0x0
80106295:	68 d7 00 00 00       	push   $0xd7
8010629a:	e9 9d f2 ff ff       	jmp    8010553c <alltraps>

8010629f <vector216>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 d8 00 00 00       	push   $0xd8
801062a6:	e9 91 f2 ff ff       	jmp    8010553c <alltraps>

801062ab <vector217>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 d9 00 00 00       	push   $0xd9
801062b2:	e9 85 f2 ff ff       	jmp    8010553c <alltraps>

801062b7 <vector218>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 da 00 00 00       	push   $0xda
801062be:	e9 79 f2 ff ff       	jmp    8010553c <alltraps>

801062c3 <vector219>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 db 00 00 00       	push   $0xdb
801062ca:	e9 6d f2 ff ff       	jmp    8010553c <alltraps>

801062cf <vector220>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 dc 00 00 00       	push   $0xdc
801062d6:	e9 61 f2 ff ff       	jmp    8010553c <alltraps>

801062db <vector221>:
801062db:	6a 00                	push   $0x0
801062dd:	68 dd 00 00 00       	push   $0xdd
801062e2:	e9 55 f2 ff ff       	jmp    8010553c <alltraps>

801062e7 <vector222>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 de 00 00 00       	push   $0xde
801062ee:	e9 49 f2 ff ff       	jmp    8010553c <alltraps>

801062f3 <vector223>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 df 00 00 00       	push   $0xdf
801062fa:	e9 3d f2 ff ff       	jmp    8010553c <alltraps>

801062ff <vector224>:
801062ff:	6a 00                	push   $0x0
80106301:	68 e0 00 00 00       	push   $0xe0
80106306:	e9 31 f2 ff ff       	jmp    8010553c <alltraps>

8010630b <vector225>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 e1 00 00 00       	push   $0xe1
80106312:	e9 25 f2 ff ff       	jmp    8010553c <alltraps>

80106317 <vector226>:
80106317:	6a 00                	push   $0x0
80106319:	68 e2 00 00 00       	push   $0xe2
8010631e:	e9 19 f2 ff ff       	jmp    8010553c <alltraps>

80106323 <vector227>:
80106323:	6a 00                	push   $0x0
80106325:	68 e3 00 00 00       	push   $0xe3
8010632a:	e9 0d f2 ff ff       	jmp    8010553c <alltraps>

8010632f <vector228>:
8010632f:	6a 00                	push   $0x0
80106331:	68 e4 00 00 00       	push   $0xe4
80106336:	e9 01 f2 ff ff       	jmp    8010553c <alltraps>

8010633b <vector229>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 e5 00 00 00       	push   $0xe5
80106342:	e9 f5 f1 ff ff       	jmp    8010553c <alltraps>

80106347 <vector230>:
80106347:	6a 00                	push   $0x0
80106349:	68 e6 00 00 00       	push   $0xe6
8010634e:	e9 e9 f1 ff ff       	jmp    8010553c <alltraps>

80106353 <vector231>:
80106353:	6a 00                	push   $0x0
80106355:	68 e7 00 00 00       	push   $0xe7
8010635a:	e9 dd f1 ff ff       	jmp    8010553c <alltraps>

8010635f <vector232>:
8010635f:	6a 00                	push   $0x0
80106361:	68 e8 00 00 00       	push   $0xe8
80106366:	e9 d1 f1 ff ff       	jmp    8010553c <alltraps>

8010636b <vector233>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 e9 00 00 00       	push   $0xe9
80106372:	e9 c5 f1 ff ff       	jmp    8010553c <alltraps>

80106377 <vector234>:
80106377:	6a 00                	push   $0x0
80106379:	68 ea 00 00 00       	push   $0xea
8010637e:	e9 b9 f1 ff ff       	jmp    8010553c <alltraps>

80106383 <vector235>:
80106383:	6a 00                	push   $0x0
80106385:	68 eb 00 00 00       	push   $0xeb
8010638a:	e9 ad f1 ff ff       	jmp    8010553c <alltraps>

8010638f <vector236>:
8010638f:	6a 00                	push   $0x0
80106391:	68 ec 00 00 00       	push   $0xec
80106396:	e9 a1 f1 ff ff       	jmp    8010553c <alltraps>

8010639b <vector237>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 ed 00 00 00       	push   $0xed
801063a2:	e9 95 f1 ff ff       	jmp    8010553c <alltraps>

801063a7 <vector238>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 ee 00 00 00       	push   $0xee
801063ae:	e9 89 f1 ff ff       	jmp    8010553c <alltraps>

801063b3 <vector239>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 ef 00 00 00       	push   $0xef
801063ba:	e9 7d f1 ff ff       	jmp    8010553c <alltraps>

801063bf <vector240>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 f0 00 00 00       	push   $0xf0
801063c6:	e9 71 f1 ff ff       	jmp    8010553c <alltraps>

801063cb <vector241>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 f1 00 00 00       	push   $0xf1
801063d2:	e9 65 f1 ff ff       	jmp    8010553c <alltraps>

801063d7 <vector242>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 f2 00 00 00       	push   $0xf2
801063de:	e9 59 f1 ff ff       	jmp    8010553c <alltraps>

801063e3 <vector243>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 f3 00 00 00       	push   $0xf3
801063ea:	e9 4d f1 ff ff       	jmp    8010553c <alltraps>

801063ef <vector244>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 f4 00 00 00       	push   $0xf4
801063f6:	e9 41 f1 ff ff       	jmp    8010553c <alltraps>

801063fb <vector245>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 f5 00 00 00       	push   $0xf5
80106402:	e9 35 f1 ff ff       	jmp    8010553c <alltraps>

80106407 <vector246>:
80106407:	6a 00                	push   $0x0
80106409:	68 f6 00 00 00       	push   $0xf6
8010640e:	e9 29 f1 ff ff       	jmp    8010553c <alltraps>

80106413 <vector247>:
80106413:	6a 00                	push   $0x0
80106415:	68 f7 00 00 00       	push   $0xf7
8010641a:	e9 1d f1 ff ff       	jmp    8010553c <alltraps>

8010641f <vector248>:
8010641f:	6a 00                	push   $0x0
80106421:	68 f8 00 00 00       	push   $0xf8
80106426:	e9 11 f1 ff ff       	jmp    8010553c <alltraps>

8010642b <vector249>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 f9 00 00 00       	push   $0xf9
80106432:	e9 05 f1 ff ff       	jmp    8010553c <alltraps>

80106437 <vector250>:
80106437:	6a 00                	push   $0x0
80106439:	68 fa 00 00 00       	push   $0xfa
8010643e:	e9 f9 f0 ff ff       	jmp    8010553c <alltraps>

80106443 <vector251>:
80106443:	6a 00                	push   $0x0
80106445:	68 fb 00 00 00       	push   $0xfb
8010644a:	e9 ed f0 ff ff       	jmp    8010553c <alltraps>

8010644f <vector252>:
8010644f:	6a 00                	push   $0x0
80106451:	68 fc 00 00 00       	push   $0xfc
80106456:	e9 e1 f0 ff ff       	jmp    8010553c <alltraps>

8010645b <vector253>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 fd 00 00 00       	push   $0xfd
80106462:	e9 d5 f0 ff ff       	jmp    8010553c <alltraps>

80106467 <vector254>:
80106467:	6a 00                	push   $0x0
80106469:	68 fe 00 00 00       	push   $0xfe
8010646e:	e9 c9 f0 ff ff       	jmp    8010553c <alltraps>

80106473 <vector255>:
80106473:	6a 00                	push   $0x0
80106475:	68 ff 00 00 00       	push   $0xff
8010647a:	e9 bd f0 ff ff       	jmp    8010553c <alltraps>
8010647f:	90                   	nop

80106480 <switchkvm>:
80106480:	a1 64 55 11 80       	mov    0x80115564,%eax
80106485:	55                   	push   %ebp
80106486:	89 e5                	mov    %esp,%ebp
80106488:	2d 00 00 00 80       	sub    $0x80000000,%eax
8010648d:	0f 22 d8             	mov    %eax,%cr3
80106490:	5d                   	pop    %ebp
80106491:	c3                   	ret    
80106492:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801064a0 <walkpgdir>:
801064a0:	55                   	push   %ebp
801064a1:	89 e5                	mov    %esp,%ebp
801064a3:	83 ec 28             	sub    $0x28,%esp
801064a6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801064a9:	89 d3                	mov    %edx,%ebx
801064ab:	c1 eb 16             	shr    $0x16,%ebx
801064ae:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
801064b1:	89 75 fc             	mov    %esi,-0x4(%ebp)
801064b4:	8b 33                	mov    (%ebx),%esi
801064b6:	f7 c6 01 00 00 00    	test   $0x1,%esi
801064bc:	74 22                	je     801064e0 <walkpgdir+0x40>
801064be:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
801064c4:	81 ee 00 00 00 80    	sub    $0x80000000,%esi
801064ca:	c1 ea 0a             	shr    $0xa,%edx
801064cd:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801064d3:	8d 04 16             	lea    (%esi,%edx,1),%eax
801064d6:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801064d9:	8b 75 fc             	mov    -0x4(%ebp),%esi
801064dc:	89 ec                	mov    %ebp,%esp
801064de:	5d                   	pop    %ebp
801064df:	c3                   	ret    
801064e0:	85 c9                	test   %ecx,%ecx
801064e2:	75 04                	jne    801064e8 <walkpgdir+0x48>
801064e4:	31 c0                	xor    %eax,%eax
801064e6:	eb ee                	jmp    801064d6 <walkpgdir+0x36>
801064e8:	89 55 f4             	mov    %edx,-0xc(%ebp)
801064eb:	90                   	nop
801064ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801064f0:	e8 3b be ff ff       	call   80102330 <kalloc>
801064f5:	85 c0                	test   %eax,%eax
801064f7:	89 c6                	mov    %eax,%esi
801064f9:	74 e9                	je     801064e4 <walkpgdir+0x44>
801064fb:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106502:	00 
80106503:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010650a:	00 
8010650b:	89 04 24             	mov    %eax,(%esp)
8010650e:	e8 6d de ff ff       	call   80104380 <memset>
80106513:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106519:	83 c8 07             	or     $0x7,%eax
8010651c:	89 03                	mov    %eax,(%ebx)
8010651e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80106521:	eb a7                	jmp    801064ca <walkpgdir+0x2a>
80106523:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106530 <uva2ka>:
80106530:	55                   	push   %ebp
80106531:	31 c9                	xor    %ecx,%ecx
80106533:	89 e5                	mov    %esp,%ebp
80106535:	83 ec 08             	sub    $0x8,%esp
80106538:	8b 55 0c             	mov    0xc(%ebp),%edx
8010653b:	8b 45 08             	mov    0x8(%ebp),%eax
8010653e:	e8 5d ff ff ff       	call   801064a0 <walkpgdir>
80106543:	8b 00                	mov    (%eax),%eax
80106545:	a8 01                	test   $0x1,%al
80106547:	75 07                	jne    80106550 <uva2ka+0x20>
80106549:	31 c0                	xor    %eax,%eax
8010654b:	c9                   	leave  
8010654c:	c3                   	ret    
8010654d:	8d 76 00             	lea    0x0(%esi),%esi
80106550:	a8 04                	test   $0x4,%al
80106552:	74 f5                	je     80106549 <uva2ka+0x19>
80106554:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106559:	2d 00 00 00 80       	sub    $0x80000000,%eax
8010655e:	c9                   	leave  
8010655f:	90                   	nop
80106560:	c3                   	ret    
80106561:	eb 0d                	jmp    80106570 <copyout>
80106563:	90                   	nop
80106564:	90                   	nop
80106565:	90                   	nop
80106566:	90                   	nop
80106567:	90                   	nop
80106568:	90                   	nop
80106569:	90                   	nop
8010656a:	90                   	nop
8010656b:	90                   	nop
8010656c:	90                   	nop
8010656d:	90                   	nop
8010656e:	90                   	nop
8010656f:	90                   	nop

80106570 <copyout>:
80106570:	55                   	push   %ebp
80106571:	89 e5                	mov    %esp,%ebp
80106573:	57                   	push   %edi
80106574:	56                   	push   %esi
80106575:	53                   	push   %ebx
80106576:	83 ec 2c             	sub    $0x2c,%esp
80106579:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010657c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010657f:	85 db                	test   %ebx,%ebx
80106581:	74 75                	je     801065f8 <copyout+0x88>
80106583:	8b 45 10             	mov    0x10(%ebp),%eax
80106586:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106589:	eb 39                	jmp    801065c4 <copyout+0x54>
8010658b:	90                   	nop
8010658c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106590:	89 f7                	mov    %esi,%edi
80106592:	29 d7                	sub    %edx,%edi
80106594:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010659a:	39 df                	cmp    %ebx,%edi
8010659c:	0f 47 fb             	cmova  %ebx,%edi
8010659f:	29 f2                	sub    %esi,%edx
801065a1:	89 7c 24 08          	mov    %edi,0x8(%esp)
801065a5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801065a8:	8d 14 10             	lea    (%eax,%edx,1),%edx
801065ab:	89 14 24             	mov    %edx,(%esp)
801065ae:	89 4c 24 04          	mov    %ecx,0x4(%esp)
801065b2:	e8 89 de ff ff       	call   80104440 <memmove>
801065b7:	29 fb                	sub    %edi,%ebx
801065b9:	74 3d                	je     801065f8 <copyout+0x88>
801065bb:	01 7d e4             	add    %edi,-0x1c(%ebp)
801065be:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
801065c4:	89 d6                	mov    %edx,%esi
801065c6:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
801065cc:	89 74 24 04          	mov    %esi,0x4(%esp)
801065d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
801065d3:	89 0c 24             	mov    %ecx,(%esp)
801065d6:	89 55 e0             	mov    %edx,-0x20(%ebp)
801065d9:	e8 52 ff ff ff       	call   80106530 <uva2ka>
801065de:	8b 55 e0             	mov    -0x20(%ebp),%edx
801065e1:	85 c0                	test   %eax,%eax
801065e3:	75 ab                	jne    80106590 <copyout+0x20>
801065e5:	83 c4 2c             	add    $0x2c,%esp
801065e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801065ed:	5b                   	pop    %ebx
801065ee:	5e                   	pop    %esi
801065ef:	5f                   	pop    %edi
801065f0:	5d                   	pop    %ebp
801065f1:	c3                   	ret    
801065f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801065f8:	83 c4 2c             	add    $0x2c,%esp
801065fb:	31 c0                	xor    %eax,%eax
801065fd:	5b                   	pop    %ebx
801065fe:	5e                   	pop    %esi
801065ff:	5f                   	pop    %edi
80106600:	5d                   	pop    %ebp
80106601:	c3                   	ret    
80106602:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106610 <mappages>:
80106610:	55                   	push   %ebp
80106611:	89 e5                	mov    %esp,%ebp
80106613:	57                   	push   %edi
80106614:	56                   	push   %esi
80106615:	53                   	push   %ebx
80106616:	89 d3                	mov    %edx,%ebx
80106618:	8d 7c 0a ff          	lea    -0x1(%edx,%ecx,1),%edi
8010661c:	83 ec 2c             	sub    $0x2c,%esp
8010661f:	8b 75 08             	mov    0x8(%ebp),%esi
80106622:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106625:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010662b:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106631:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
80106635:	eb 1d                	jmp    80106654 <mappages+0x44>
80106637:	90                   	nop
80106638:	f6 00 01             	testb  $0x1,(%eax)
8010663b:	75 45                	jne    80106682 <mappages+0x72>
8010663d:	8b 55 0c             	mov    0xc(%ebp),%edx
80106640:	09 f2                	or     %esi,%edx
80106642:	39 fb                	cmp    %edi,%ebx
80106644:	89 10                	mov    %edx,(%eax)
80106646:	74 30                	je     80106678 <mappages+0x68>
80106648:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010664e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106654:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106657:	b9 01 00 00 00       	mov    $0x1,%ecx
8010665c:	89 da                	mov    %ebx,%edx
8010665e:	e8 3d fe ff ff       	call   801064a0 <walkpgdir>
80106663:	85 c0                	test   %eax,%eax
80106665:	75 d1                	jne    80106638 <mappages+0x28>
80106667:	83 c4 2c             	add    $0x2c,%esp
8010666a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010666f:	5b                   	pop    %ebx
80106670:	5e                   	pop    %esi
80106671:	5f                   	pop    %edi
80106672:	5d                   	pop    %ebp
80106673:	c3                   	ret    
80106674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106678:	83 c4 2c             	add    $0x2c,%esp
8010667b:	31 c0                	xor    %eax,%eax
8010667d:	5b                   	pop    %ebx
8010667e:	5e                   	pop    %esi
8010667f:	5f                   	pop    %edi
80106680:	5d                   	pop    %ebp
80106681:	c3                   	ret    
80106682:	c7 04 24 b0 76 10 80 	movl   $0x801076b0,(%esp)
80106689:	e8 22 9d ff ff       	call   801003b0 <panic>
8010668e:	66 90                	xchg   %ax,%ax

80106690 <clearpteu>:
80106690:	55                   	push   %ebp
80106691:	31 c9                	xor    %ecx,%ecx
80106693:	89 e5                	mov    %esp,%ebp
80106695:	83 ec 18             	sub    $0x18,%esp
80106698:	8b 55 0c             	mov    0xc(%ebp),%edx
8010669b:	8b 45 08             	mov    0x8(%ebp),%eax
8010669e:	e8 fd fd ff ff       	call   801064a0 <walkpgdir>
801066a3:	85 c0                	test   %eax,%eax
801066a5:	74 05                	je     801066ac <clearpteu+0x1c>
801066a7:	83 20 fb             	andl   $0xfffffffb,(%eax)
801066aa:	c9                   	leave  
801066ab:	c3                   	ret    
801066ac:	c7 04 24 b6 76 10 80 	movl   $0x801076b6,(%esp)
801066b3:	e8 f8 9c ff ff       	call   801003b0 <panic>
801066b8:	90                   	nop
801066b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801066c0 <inituvm>:
801066c0:	55                   	push   %ebp
801066c1:	89 e5                	mov    %esp,%ebp
801066c3:	83 ec 38             	sub    $0x38,%esp
801066c6:	89 75 f8             	mov    %esi,-0x8(%ebp)
801066c9:	8b 75 10             	mov    0x10(%ebp),%esi
801066cc:	8b 45 08             	mov    0x8(%ebp),%eax
801066cf:	89 7d fc             	mov    %edi,-0x4(%ebp)
801066d2:	8b 7d 0c             	mov    0xc(%ebp),%edi
801066d5:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801066d8:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801066de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801066e1:	77 59                	ja     8010673c <inituvm+0x7c>
801066e3:	e8 48 bc ff ff       	call   80102330 <kalloc>
801066e8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801066ef:	00 
801066f0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801066f7:	00 
801066f8:	89 c3                	mov    %eax,%ebx
801066fa:	89 04 24             	mov    %eax,(%esp)
801066fd:	e8 7e dc ff ff       	call   80104380 <memset>
80106702:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106708:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010670d:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106714:	00 
80106715:	31 d2                	xor    %edx,%edx
80106717:	89 04 24             	mov    %eax,(%esp)
8010671a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010671d:	e8 ee fe ff ff       	call   80106610 <mappages>
80106722:	89 75 10             	mov    %esi,0x10(%ebp)
80106725:	8b 75 f8             	mov    -0x8(%ebp),%esi
80106728:	89 7d 0c             	mov    %edi,0xc(%ebp)
8010672b:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010672e:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106731:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80106734:	89 ec                	mov    %ebp,%esp
80106736:	5d                   	pop    %ebp
80106737:	e9 04 dd ff ff       	jmp    80104440 <memmove>
8010673c:	c7 04 24 c0 76 10 80 	movl   $0x801076c0,(%esp)
80106743:	e8 68 9c ff ff       	call   801003b0 <panic>
80106748:	90                   	nop
80106749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106750 <deallocuvm>:
80106750:	55                   	push   %ebp
80106751:	89 e5                	mov    %esp,%ebp
80106753:	57                   	push   %edi
80106754:	56                   	push   %esi
80106755:	53                   	push   %ebx
80106756:	83 ec 2c             	sub    $0x2c,%esp
80106759:	8b 75 0c             	mov    0xc(%ebp),%esi
8010675c:	39 75 10             	cmp    %esi,0x10(%ebp)
8010675f:	8b 7d 08             	mov    0x8(%ebp),%edi
80106762:	89 f0                	mov    %esi,%eax
80106764:	73 7d                	jae    801067e3 <deallocuvm+0x93>
80106766:	8b 5d 10             	mov    0x10(%ebp),%ebx
80106769:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
8010676f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106775:	39 de                	cmp    %ebx,%esi
80106777:	77 3d                	ja     801067b6 <deallocuvm+0x66>
80106779:	eb 65                	jmp    801067e0 <deallocuvm+0x90>
8010677b:	90                   	nop
8010677c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106780:	8b 10                	mov    (%eax),%edx
80106782:	f6 c2 01             	test   $0x1,%dl
80106785:	74 25                	je     801067ac <deallocuvm+0x5c>
80106787:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
8010678d:	8d 76 00             	lea    0x0(%esi),%esi
80106790:	74 59                	je     801067eb <deallocuvm+0x9b>
80106792:	81 ea 00 00 00 80    	sub    $0x80000000,%edx
80106798:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010679b:	89 14 24             	mov    %edx,(%esp)
8010679e:	e8 dd bb ff ff       	call   80102380 <kfree>
801067a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801067a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801067ac:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067b2:	39 de                	cmp    %ebx,%esi
801067b4:	76 2a                	jbe    801067e0 <deallocuvm+0x90>
801067b6:	31 c9                	xor    %ecx,%ecx
801067b8:	89 da                	mov    %ebx,%edx
801067ba:	89 f8                	mov    %edi,%eax
801067bc:	e8 df fc ff ff       	call   801064a0 <walkpgdir>
801067c1:	85 c0                	test   %eax,%eax
801067c3:	75 bb                	jne    80106780 <deallocuvm+0x30>
801067c5:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
801067cb:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
801067d1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067d7:	39 de                	cmp    %ebx,%esi
801067d9:	77 db                	ja     801067b6 <deallocuvm+0x66>
801067db:	90                   	nop
801067dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801067e0:	8b 45 10             	mov    0x10(%ebp),%eax
801067e3:	83 c4 2c             	add    $0x2c,%esp
801067e6:	5b                   	pop    %ebx
801067e7:	5e                   	pop    %esi
801067e8:	5f                   	pop    %edi
801067e9:	5d                   	pop    %ebp
801067ea:	c3                   	ret    
801067eb:	c7 04 24 46 70 10 80 	movl   $0x80107046,(%esp)
801067f2:	e8 b9 9b ff ff       	call   801003b0 <panic>
801067f7:	89 f6                	mov    %esi,%esi
801067f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106800 <freevm>:
80106800:	55                   	push   %ebp
80106801:	89 e5                	mov    %esp,%ebp
80106803:	56                   	push   %esi
80106804:	53                   	push   %ebx
80106805:	83 ec 10             	sub    $0x10,%esp
80106808:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010680b:	85 db                	test   %ebx,%ebx
8010680d:	74 5e                	je     8010686d <freevm+0x6d>
8010680f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80106816:	00 
80106817:	31 f6                	xor    %esi,%esi
80106819:	c7 44 24 04 00 00 00 	movl   $0x80000000,0x4(%esp)
80106820:	80 
80106821:	89 1c 24             	mov    %ebx,(%esp)
80106824:	e8 27 ff ff ff       	call   80106750 <deallocuvm>
80106829:	eb 10                	jmp    8010683b <freevm+0x3b>
8010682b:	90                   	nop
8010682c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106830:	83 c6 01             	add    $0x1,%esi
80106833:	81 fe 00 04 00 00    	cmp    $0x400,%esi
80106839:	74 24                	je     8010685f <freevm+0x5f>
8010683b:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
8010683e:	a8 01                	test   $0x1,%al
80106840:	74 ee                	je     80106830 <freevm+0x30>
80106842:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106847:	83 c6 01             	add    $0x1,%esi
8010684a:	2d 00 00 00 80       	sub    $0x80000000,%eax
8010684f:	89 04 24             	mov    %eax,(%esp)
80106852:	e8 29 bb ff ff       	call   80102380 <kfree>
80106857:	81 fe 00 04 00 00    	cmp    $0x400,%esi
8010685d:	75 dc                	jne    8010683b <freevm+0x3b>
8010685f:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106862:	83 c4 10             	add    $0x10,%esp
80106865:	5b                   	pop    %ebx
80106866:	5e                   	pop    %esi
80106867:	5d                   	pop    %ebp
80106868:	e9 13 bb ff ff       	jmp    80102380 <kfree>
8010686d:	c7 04 24 da 76 10 80 	movl   $0x801076da,(%esp)
80106874:	e8 37 9b ff ff       	call   801003b0 <panic>
80106879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106880 <setupkvm>:
80106880:	55                   	push   %ebp
80106881:	89 e5                	mov    %esp,%ebp
80106883:	56                   	push   %esi
80106884:	53                   	push   %ebx
80106885:	83 ec 10             	sub    $0x10,%esp
80106888:	e8 a3 ba ff ff       	call   80102330 <kalloc>
8010688d:	85 c0                	test   %eax,%eax
8010688f:	89 c6                	mov    %eax,%esi
80106891:	74 53                	je     801068e6 <setupkvm+0x66>
80106893:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010689a:	00 
8010689b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801068a2:	00 
801068a3:	89 04 24             	mov    %eax,(%esp)
801068a6:	e8 d5 da ff ff       	call   80104380 <memset>
801068ab:	b8 00 a5 10 80       	mov    $0x8010a500,%eax
801068b0:	3d c0 a4 10 80       	cmp    $0x8010a4c0,%eax
801068b5:	76 2f                	jbe    801068e6 <setupkvm+0x66>
801068b7:	bb c0 a4 10 80       	mov    $0x8010a4c0,%ebx
801068bc:	8b 43 04             	mov    0x4(%ebx),%eax
801068bf:	8b 53 0c             	mov    0xc(%ebx),%edx
801068c2:	8b 4b 08             	mov    0x8(%ebx),%ecx
801068c5:	89 04 24             	mov    %eax,(%esp)
801068c8:	89 54 24 04          	mov    %edx,0x4(%esp)
801068cc:	8b 13                	mov    (%ebx),%edx
801068ce:	29 c1                	sub    %eax,%ecx
801068d0:	89 f0                	mov    %esi,%eax
801068d2:	e8 39 fd ff ff       	call   80106610 <mappages>
801068d7:	85 c0                	test   %eax,%eax
801068d9:	78 15                	js     801068f0 <setupkvm+0x70>
801068db:	83 c3 10             	add    $0x10,%ebx
801068de:	81 fb 00 a5 10 80    	cmp    $0x8010a500,%ebx
801068e4:	75 d6                	jne    801068bc <setupkvm+0x3c>
801068e6:	83 c4 10             	add    $0x10,%esp
801068e9:	89 f0                	mov    %esi,%eax
801068eb:	5b                   	pop    %ebx
801068ec:	5e                   	pop    %esi
801068ed:	5d                   	pop    %ebp
801068ee:	c3                   	ret    
801068ef:	90                   	nop
801068f0:	89 34 24             	mov    %esi,(%esp)
801068f3:	31 f6                	xor    %esi,%esi
801068f5:	e8 06 ff ff ff       	call   80106800 <freevm>
801068fa:	83 c4 10             	add    $0x10,%esp
801068fd:	89 f0                	mov    %esi,%eax
801068ff:	5b                   	pop    %ebx
80106900:	5e                   	pop    %esi
80106901:	5d                   	pop    %ebp
80106902:	c3                   	ret    
80106903:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106910 <kvmalloc>:
80106910:	55                   	push   %ebp
80106911:	89 e5                	mov    %esp,%ebp
80106913:	83 ec 08             	sub    $0x8,%esp
80106916:	e8 65 ff ff ff       	call   80106880 <setupkvm>
8010691b:	a3 64 55 11 80       	mov    %eax,0x80115564
80106920:	2d 00 00 00 80       	sub    $0x80000000,%eax
80106925:	0f 22 d8             	mov    %eax,%cr3
80106928:	c9                   	leave  
80106929:	c3                   	ret    
8010692a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106930 <copyuvm>:
80106930:	55                   	push   %ebp
80106931:	89 e5                	mov    %esp,%ebp
80106933:	57                   	push   %edi
80106934:	56                   	push   %esi
80106935:	53                   	push   %ebx
80106936:	83 ec 2c             	sub    $0x2c,%esp
80106939:	e8 42 ff ff ff       	call   80106880 <setupkvm>
8010693e:	85 c0                	test   %eax,%eax
80106940:	89 c7                	mov    %eax,%edi
80106942:	0f 84 91 00 00 00    	je     801069d9 <copyuvm+0xa9>
80106948:	8b 45 0c             	mov    0xc(%ebp),%eax
8010694b:	85 c0                	test   %eax,%eax
8010694d:	0f 84 86 00 00 00    	je     801069d9 <copyuvm+0xa9>
80106953:	31 f6                	xor    %esi,%esi
80106955:	eb 54                	jmp    801069ab <copyuvm+0x7b>
80106957:	90                   	nop
80106958:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010695b:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106962:	00 
80106963:	89 1c 24             	mov    %ebx,(%esp)
80106966:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010696b:	2d 00 00 00 80       	sub    $0x80000000,%eax
80106970:	89 44 24 04          	mov    %eax,0x4(%esp)
80106974:	e8 c7 da ff ff       	call   80104440 <memmove>
80106979:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010697c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106981:	89 f2                	mov    %esi,%edx
80106983:	25 ff 0f 00 00       	and    $0xfff,%eax
80106988:	89 44 24 04          	mov    %eax,0x4(%esp)
8010698c:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106992:	89 04 24             	mov    %eax,(%esp)
80106995:	89 f8                	mov    %edi,%eax
80106997:	e8 74 fc ff ff       	call   80106610 <mappages>
8010699c:	85 c0                	test   %eax,%eax
8010699e:	78 48                	js     801069e8 <copyuvm+0xb8>
801069a0:	81 c6 00 10 00 00    	add    $0x1000,%esi
801069a6:	39 75 0c             	cmp    %esi,0xc(%ebp)
801069a9:	76 2e                	jbe    801069d9 <copyuvm+0xa9>
801069ab:	8b 45 08             	mov    0x8(%ebp),%eax
801069ae:	31 c9                	xor    %ecx,%ecx
801069b0:	89 f2                	mov    %esi,%edx
801069b2:	e8 e9 fa ff ff       	call   801064a0 <walkpgdir>
801069b7:	85 c0                	test   %eax,%eax
801069b9:	74 43                	je     801069fe <copyuvm+0xce>
801069bb:	8b 00                	mov    (%eax),%eax
801069bd:	a8 01                	test   $0x1,%al
801069bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801069c2:	74 2e                	je     801069f2 <copyuvm+0xc2>
801069c4:	e8 67 b9 ff ff       	call   80102330 <kalloc>
801069c9:	85 c0                	test   %eax,%eax
801069cb:	89 c3                	mov    %eax,%ebx
801069cd:	75 89                	jne    80106958 <copyuvm+0x28>
801069cf:	89 3c 24             	mov    %edi,(%esp)
801069d2:	31 ff                	xor    %edi,%edi
801069d4:	e8 27 fe ff ff       	call   80106800 <freevm>
801069d9:	83 c4 2c             	add    $0x2c,%esp
801069dc:	89 f8                	mov    %edi,%eax
801069de:	5b                   	pop    %ebx
801069df:	5e                   	pop    %esi
801069e0:	5f                   	pop    %edi
801069e1:	5d                   	pop    %ebp
801069e2:	c3                   	ret    
801069e3:	90                   	nop
801069e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801069e8:	89 1c 24             	mov    %ebx,(%esp)
801069eb:	e8 90 b9 ff ff       	call   80102380 <kfree>
801069f0:	eb dd                	jmp    801069cf <copyuvm+0x9f>
801069f2:	c7 04 24 05 77 10 80 	movl   $0x80107705,(%esp)
801069f9:	e8 b2 99 ff ff       	call   801003b0 <panic>
801069fe:	c7 04 24 eb 76 10 80 	movl   $0x801076eb,(%esp)
80106a05:	e8 a6 99 ff ff       	call   801003b0 <panic>
80106a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106a10 <allocuvm>:
80106a10:	55                   	push   %ebp
80106a11:	89 e5                	mov    %esp,%ebp
80106a13:	57                   	push   %edi
80106a14:	56                   	push   %esi
80106a15:	53                   	push   %ebx
80106a16:	83 ec 2c             	sub    $0x2c,%esp
80106a19:	8b 7d 10             	mov    0x10(%ebp),%edi
80106a1c:	85 ff                	test   %edi,%edi
80106a1e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106a21:	0f 88 9c 00 00 00    	js     80106ac3 <allocuvm+0xb3>
80106a27:	8b 45 0c             	mov    0xc(%ebp),%eax
80106a2a:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
80106a2d:	0f 82 a5 00 00 00    	jb     80106ad8 <allocuvm+0xc8>
80106a33:	8b 75 0c             	mov    0xc(%ebp),%esi
80106a36:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80106a3c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106a42:	39 f7                	cmp    %esi,%edi
80106a44:	77 50                	ja     80106a96 <allocuvm+0x86>
80106a46:	e9 90 00 00 00       	jmp    80106adb <allocuvm+0xcb>
80106a4b:	90                   	nop
80106a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106a50:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106a57:	00 
80106a58:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106a5f:	00 
80106a60:	89 04 24             	mov    %eax,(%esp)
80106a63:	e8 18 d9 ff ff       	call   80104380 <memset>
80106a68:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106a6e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106a73:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106a7a:	00 
80106a7b:	89 f2                	mov    %esi,%edx
80106a7d:	89 04 24             	mov    %eax,(%esp)
80106a80:	8b 45 08             	mov    0x8(%ebp),%eax
80106a83:	e8 88 fb ff ff       	call   80106610 <mappages>
80106a88:	85 c0                	test   %eax,%eax
80106a8a:	78 5c                	js     80106ae8 <allocuvm+0xd8>
80106a8c:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106a92:	39 f7                	cmp    %esi,%edi
80106a94:	76 45                	jbe    80106adb <allocuvm+0xcb>
80106a96:	e8 95 b8 ff ff       	call   80102330 <kalloc>
80106a9b:	85 c0                	test   %eax,%eax
80106a9d:	89 c3                	mov    %eax,%ebx
80106a9f:	75 af                	jne    80106a50 <allocuvm+0x40>
80106aa1:	c7 04 24 1f 77 10 80 	movl   $0x8010771f,(%esp)
80106aa8:	e8 a3 9d ff ff       	call   80100850 <cprintf>
80106aad:	8b 45 0c             	mov    0xc(%ebp),%eax
80106ab0:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106ab4:	89 44 24 08          	mov    %eax,0x8(%esp)
80106ab8:	8b 45 08             	mov    0x8(%ebp),%eax
80106abb:	89 04 24             	mov    %eax,(%esp)
80106abe:	e8 8d fc ff ff       	call   80106750 <deallocuvm>
80106ac3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106aca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106acd:	83 c4 2c             	add    $0x2c,%esp
80106ad0:	5b                   	pop    %ebx
80106ad1:	5e                   	pop    %esi
80106ad2:	5f                   	pop    %edi
80106ad3:	5d                   	pop    %ebp
80106ad4:	c3                   	ret    
80106ad5:	8d 76 00             	lea    0x0(%esi),%esi
80106ad8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106adb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106ade:	83 c4 2c             	add    $0x2c,%esp
80106ae1:	5b                   	pop    %ebx
80106ae2:	5e                   	pop    %esi
80106ae3:	5f                   	pop    %edi
80106ae4:	5d                   	pop    %ebp
80106ae5:	c3                   	ret    
80106ae6:	66 90                	xchg   %ax,%ax
80106ae8:	c7 04 24 37 77 10 80 	movl   $0x80107737,(%esp)
80106aef:	e8 5c 9d ff ff       	call   80100850 <cprintf>
80106af4:	8b 45 0c             	mov    0xc(%ebp),%eax
80106af7:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106afb:	89 44 24 08          	mov    %eax,0x8(%esp)
80106aff:	8b 45 08             	mov    0x8(%ebp),%eax
80106b02:	89 04 24             	mov    %eax,(%esp)
80106b05:	e8 46 fc ff ff       	call   80106750 <deallocuvm>
80106b0a:	89 1c 24             	mov    %ebx,(%esp)
80106b0d:	e8 6e b8 ff ff       	call   80102380 <kfree>
80106b12:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106b19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b1c:	83 c4 2c             	add    $0x2c,%esp
80106b1f:	5b                   	pop    %ebx
80106b20:	5e                   	pop    %esi
80106b21:	5f                   	pop    %edi
80106b22:	5d                   	pop    %ebp
80106b23:	c3                   	ret    
80106b24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106b30 <loaduvm>:
80106b30:	55                   	push   %ebp
80106b31:	89 e5                	mov    %esp,%ebp
80106b33:	57                   	push   %edi
80106b34:	56                   	push   %esi
80106b35:	53                   	push   %ebx
80106b36:	83 ec 2c             	sub    $0x2c,%esp
80106b39:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106b3c:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
80106b42:	0f 85 96 00 00 00    	jne    80106bde <loaduvm+0xae>
80106b48:	8b 75 18             	mov    0x18(%ebp),%esi
80106b4b:	31 db                	xor    %ebx,%ebx
80106b4d:	85 f6                	test   %esi,%esi
80106b4f:	75 18                	jne    80106b69 <loaduvm+0x39>
80106b51:	eb 75                	jmp    80106bc8 <loaduvm+0x98>
80106b53:	90                   	nop
80106b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106b58:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b5e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106b64:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106b67:	76 5f                	jbe    80106bc8 <loaduvm+0x98>
80106b69:	8b 45 08             	mov    0x8(%ebp),%eax
80106b6c:	31 c9                	xor    %ecx,%ecx
80106b6e:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
80106b71:	e8 2a f9 ff ff       	call   801064a0 <walkpgdir>
80106b76:	85 c0                	test   %eax,%eax
80106b78:	74 58                	je     80106bd2 <loaduvm+0xa2>
80106b7a:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
80106b80:	ba 00 10 00 00       	mov    $0x1000,%edx
80106b85:	8b 00                	mov    (%eax),%eax
80106b87:	0f 42 d6             	cmovb  %esi,%edx
80106b8a:	89 54 24 0c          	mov    %edx,0xc(%esp)
80106b8e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106b91:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b96:	2d 00 00 00 80       	sub    $0x80000000,%eax
80106b9b:	8d 0c 0b             	lea    (%ebx,%ecx,1),%ecx
80106b9e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80106ba2:	89 44 24 04          	mov    %eax,0x4(%esp)
80106ba6:	8b 45 10             	mov    0x10(%ebp),%eax
80106ba9:	89 04 24             	mov    %eax,(%esp)
80106bac:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106baf:	e8 4c ab ff ff       	call   80101700 <readi>
80106bb4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106bb7:	39 d0                	cmp    %edx,%eax
80106bb9:	74 9d                	je     80106b58 <loaduvm+0x28>
80106bbb:	83 c4 2c             	add    $0x2c,%esp
80106bbe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106bc3:	5b                   	pop    %ebx
80106bc4:	5e                   	pop    %esi
80106bc5:	5f                   	pop    %edi
80106bc6:	5d                   	pop    %ebp
80106bc7:	c3                   	ret    
80106bc8:	83 c4 2c             	add    $0x2c,%esp
80106bcb:	31 c0                	xor    %eax,%eax
80106bcd:	5b                   	pop    %ebx
80106bce:	5e                   	pop    %esi
80106bcf:	5f                   	pop    %edi
80106bd0:	5d                   	pop    %ebp
80106bd1:	c3                   	ret    
80106bd2:	c7 04 24 53 77 10 80 	movl   $0x80107753,(%esp)
80106bd9:	e8 d2 97 ff ff       	call   801003b0 <panic>
80106bde:	c7 04 24 b0 77 10 80 	movl   $0x801077b0,(%esp)
80106be5:	e8 c6 97 ff ff       	call   801003b0 <panic>
80106bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106bf0 <switchuvm>:
80106bf0:	55                   	push   %ebp
80106bf1:	89 e5                	mov    %esp,%ebp
80106bf3:	57                   	push   %edi
80106bf4:	56                   	push   %esi
80106bf5:	53                   	push   %ebx
80106bf6:	83 ec 2c             	sub    $0x2c,%esp
80106bf9:	8b 75 08             	mov    0x8(%ebp),%esi
80106bfc:	85 f6                	test   %esi,%esi
80106bfe:	0f 84 c4 00 00 00    	je     80106cc8 <switchuvm+0xd8>
80106c04:	8b 4e 08             	mov    0x8(%esi),%ecx
80106c07:	85 c9                	test   %ecx,%ecx
80106c09:	0f 84 d1 00 00 00    	je     80106ce0 <switchuvm+0xf0>
80106c0f:	8b 56 04             	mov    0x4(%esi),%edx
80106c12:	85 d2                	test   %edx,%edx
80106c14:	0f 84 ba 00 00 00    	je     80106cd4 <switchuvm+0xe4>
80106c1a:	e8 11 d6 ff ff       	call   80104230 <pushcli>
80106c1f:	e8 0c cd ff ff       	call   80103930 <mycpu>
80106c24:	89 c3                	mov    %eax,%ebx
80106c26:	e8 05 cd ff ff       	call   80103930 <mycpu>
80106c2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c2e:	e8 fd cc ff ff       	call   80103930 <mycpu>
80106c33:	89 c7                	mov    %eax,%edi
80106c35:	e8 f6 cc ff ff       	call   80103930 <mycpu>
80106c3a:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80106c41:	67 00 
80106c43:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106c46:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106c4d:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106c54:	83 c2 08             	add    $0x8,%edx
80106c57:	66 89 93 9a 00 00 00 	mov    %dx,0x9a(%ebx)
80106c5e:	83 c0 08             	add    $0x8,%eax
80106c61:	8d 57 08             	lea    0x8(%edi),%edx
80106c64:	c1 ea 10             	shr    $0x10,%edx
80106c67:	c1 e8 18             	shr    $0x18,%eax
80106c6a:	88 93 9c 00 00 00    	mov    %dl,0x9c(%ebx)
80106c70:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106c76:	e8 b5 cc ff ff       	call   80103930 <mycpu>
80106c7b:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106c82:	e8 a9 cc ff ff       	call   80103930 <mycpu>
80106c87:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
80106c8d:	e8 9e cc ff ff       	call   80103930 <mycpu>
80106c92:	8b 56 08             	mov    0x8(%esi),%edx
80106c95:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106c9b:	89 50 0c             	mov    %edx,0xc(%eax)
80106c9e:	e8 8d cc ff ff       	call   80103930 <mycpu>
80106ca3:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
80106ca9:	b8 28 00 00 00       	mov    $0x28,%eax
80106cae:	0f 00 d8             	ltr    %ax
80106cb1:	8b 46 04             	mov    0x4(%esi),%eax
80106cb4:	2d 00 00 00 80       	sub    $0x80000000,%eax
80106cb9:	0f 22 d8             	mov    %eax,%cr3
80106cbc:	83 c4 2c             	add    $0x2c,%esp
80106cbf:	5b                   	pop    %ebx
80106cc0:	5e                   	pop    %esi
80106cc1:	5f                   	pop    %edi
80106cc2:	5d                   	pop    %ebp
80106cc3:	e9 f8 d4 ff ff       	jmp    801041c0 <popcli>
80106cc8:	c7 04 24 71 77 10 80 	movl   $0x80107771,(%esp)
80106ccf:	e8 dc 96 ff ff       	call   801003b0 <panic>
80106cd4:	c7 04 24 9c 77 10 80 	movl   $0x8010779c,(%esp)
80106cdb:	e8 d0 96 ff ff       	call   801003b0 <panic>
80106ce0:	c7 04 24 87 77 10 80 	movl   $0x80107787,(%esp)
80106ce7:	e8 c4 96 ff ff       	call   801003b0 <panic>
80106cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106cf0 <seginit>:
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	83 ec 18             	sub    $0x18,%esp
80106cf6:	e8 c5 d2 ff ff       	call   80103fc0 <cpuid>
80106cfb:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106d01:	05 40 28 11 80       	add    $0x80112840,%eax
80106d06:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
80106d0c:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
80106d12:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
80106d16:	c6 40 7d 9a          	movb   $0x9a,0x7d(%eax)
80106d1a:	c6 40 7e cf          	movb   $0xcf,0x7e(%eax)
80106d1e:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
80106d22:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
80106d29:	ff ff 
80106d2b:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
80106d32:	00 00 
80106d34:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
80106d3b:	c6 80 85 00 00 00 92 	movb   $0x92,0x85(%eax)
80106d42:	c6 80 86 00 00 00 cf 	movb   $0xcf,0x86(%eax)
80106d49:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
80106d50:	66 c7 80 88 00 00 00 	movw   $0xffff,0x88(%eax)
80106d57:	ff ff 
80106d59:	66 c7 80 8a 00 00 00 	movw   $0x0,0x8a(%eax)
80106d60:	00 00 
80106d62:	c6 80 8c 00 00 00 00 	movb   $0x0,0x8c(%eax)
80106d69:	c6 80 8d 00 00 00 fa 	movb   $0xfa,0x8d(%eax)
80106d70:	c6 80 8e 00 00 00 cf 	movb   $0xcf,0x8e(%eax)
80106d77:	c6 80 8f 00 00 00 00 	movb   $0x0,0x8f(%eax)
80106d7e:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
80106d85:	ff ff 
80106d87:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
80106d8e:	00 00 
80106d90:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
80106d97:	c6 80 95 00 00 00 f2 	movb   $0xf2,0x95(%eax)
80106d9e:	c6 80 96 00 00 00 cf 	movb   $0xcf,0x96(%eax)
80106da5:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
80106dac:	83 c0 70             	add    $0x70,%eax
80106daf:	66 c7 45 f2 2f 00    	movw   $0x2f,-0xe(%ebp)
80106db5:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106db9:	c1 e8 10             	shr    $0x10,%eax
80106dbc:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106dc0:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106dc3:	0f 01 10             	lgdtl  (%eax)
80106dc6:	c9                   	leave  
80106dc7:	c3                   	ret    
