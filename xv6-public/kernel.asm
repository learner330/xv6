
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
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp
8010002d:	b8 60 2e 10 80       	mov    $0x80102e60,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	56                   	push   %esi
80100044:	53                   	push   %ebx
80100045:	83 ec 10             	sub    $0x10,%esp
80100048:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
8010004b:	8d 73 0c             	lea    0xc(%ebx),%esi
8010004e:	89 34 24             	mov    %esi,(%esp)
80100051:	e8 da 3f 00 00       	call   80104030 <holdingsleep>
80100056:	85 c0                	test   %eax,%eax
80100058:	74 62                	je     801000bc <brelse+0x7c>
    panic("brelse");

  releasesleep(&b->lock);
8010005a:	89 34 24             	mov    %esi,(%esp)
8010005d:	e8 2e 40 00 00       	call   80104090 <releasesleep>

  acquire(&bcache.lock);
80100062:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100069:	e8 d2 42 00 00       	call   80104340 <acquire>
  b->refcnt--;
8010006e:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100071:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100074:	85 c0                	test   %eax,%eax
  b->refcnt--;
80100076:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
80100079:	75 2f                	jne    801000aa <brelse+0x6a>
    // no one is waiting for it.
    b->next->prev = b->prev;
8010007b:	8b 43 54             	mov    0x54(%ebx),%eax
8010007e:	8b 53 50             	mov    0x50(%ebx),%edx
80100081:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100084:	8b 43 50             	mov    0x50(%ebx),%eax
80100087:	8b 53 54             	mov    0x54(%ebx),%edx
8010008a:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
8010008d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
    b->prev = &bcache.head;
80100092:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
    b->next = bcache.head.next;
80100099:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
8010009c:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
801000a1:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
801000a4:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
  }
  
  release(&bcache.lock);
801000aa:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
}
801000b1:	83 c4 10             	add    $0x10,%esp
801000b4:	5b                   	pop    %ebx
801000b5:	5e                   	pop    %esi
801000b6:	5d                   	pop    %ebp
  release(&bcache.lock);
801000b7:	e9 34 42 00 00       	jmp    801042f0 <release>
    panic("brelse");
801000bc:	c7 04 24 40 6f 10 80 	movl   $0x80106f40,(%esp)
801000c3:	e8 e8 02 00 00       	call   801003b0 <panic>
801000c8:	90                   	nop
801000c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801000d0 <bwrite>:
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	53                   	push   %ebx
801000d4:	83 ec 14             	sub    $0x14,%esp
801000d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801000da:	8d 43 0c             	lea    0xc(%ebx),%eax
801000dd:	89 04 24             	mov    %eax,(%esp)
801000e0:	e8 4b 3f 00 00       	call   80104030 <holdingsleep>
801000e5:	85 c0                	test   %eax,%eax
801000e7:	74 10                	je     801000f9 <bwrite+0x29>
  b->flags |= B_DIRTY;
801000e9:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801000ec:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801000ef:	83 c4 14             	add    $0x14,%esp
801000f2:	5b                   	pop    %ebx
801000f3:	5d                   	pop    %ebp
  iderw(b);
801000f4:	e9 57 1f 00 00       	jmp    80102050 <iderw>
    panic("bwrite");
801000f9:	c7 04 24 47 6f 10 80 	movl   $0x80106f47,(%esp)
80100100:	e8 ab 02 00 00       	call   801003b0 <panic>
80100105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100110 <bread>:
{
80100110:	55                   	push   %ebp
80100111:	89 e5                	mov    %esp,%ebp
80100113:	57                   	push   %edi
80100114:	56                   	push   %esi
80100115:	53                   	push   %ebx
80100116:	83 ec 1c             	sub    $0x1c,%esp
80100119:	8b 75 08             	mov    0x8(%ebp),%esi
8010011c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
8010011f:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100126:	e8 15 42 00 00       	call   80104340 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
8010012b:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
80100131:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100137:	75 12                	jne    8010014b <bread+0x3b>
80100139:	eb 2d                	jmp    80100168 <bread+0x58>
8010013b:	90                   	nop
8010013c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100140:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100143:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100149:	74 1d                	je     80100168 <bread+0x58>
    if(b->dev == dev && b->blockno == blockno){
8010014b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010014e:	66 90                	xchg   %ax,%ax
80100150:	75 ee                	jne    80100140 <bread+0x30>
80100152:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100155:	75 e9                	jne    80100140 <bread+0x30>
      b->refcnt++;
80100157:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
8010015b:	90                   	nop
8010015c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100160:	eb 40                	jmp    801001a2 <bread+0x92>
80100162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100168:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
8010016e:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100174:	75 0d                	jne    80100183 <bread+0x73>
80100176:	eb 58                	jmp    801001d0 <bread+0xc0>
80100178:	8b 5b 50             	mov    0x50(%ebx),%ebx
8010017b:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100181:	74 4d                	je     801001d0 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
80100183:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100186:	85 c0                	test   %eax,%eax
80100188:	75 ee                	jne    80100178 <bread+0x68>
8010018a:	f6 03 04             	testb  $0x4,(%ebx)
8010018d:	75 e9                	jne    80100178 <bread+0x68>
      b->dev = dev;
8010018f:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
80100192:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
80100195:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
8010019b:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
801001a2:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
801001a9:	e8 42 41 00 00       	call   801042f0 <release>
      acquiresleep(&b->lock);
801001ae:	8d 43 0c             	lea    0xc(%ebx),%eax
801001b1:	89 04 24             	mov    %eax,(%esp)
801001b4:	e8 17 3f 00 00       	call   801040d0 <acquiresleep>
  if((b->flags & B_VALID) == 0) {
801001b9:	f6 03 02             	testb  $0x2,(%ebx)
801001bc:	75 08                	jne    801001c6 <bread+0xb6>
    iderw(b);
801001be:	89 1c 24             	mov    %ebx,(%esp)
801001c1:	e8 8a 1e 00 00       	call   80102050 <iderw>
}
801001c6:	83 c4 1c             	add    $0x1c,%esp
801001c9:	89 d8                	mov    %ebx,%eax
801001cb:	5b                   	pop    %ebx
801001cc:	5e                   	pop    %esi
801001cd:	5f                   	pop    %edi
801001ce:	5d                   	pop    %ebp
801001cf:	c3                   	ret    
  panic("bget: no buffers");
801001d0:	c7 04 24 4e 6f 10 80 	movl   $0x80106f4e,(%esp)
801001d7:	e8 d4 01 00 00       	call   801003b0 <panic>
801001dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801001e0 <binit>:
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	53                   	push   %ebx
binit(void)
801001e4:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
{
801001e9:	83 ec 14             	sub    $0x14,%esp
  initlock(&bcache.lock, "bcache");
801001ec:	c7 44 24 04 5f 6f 10 	movl   $0x80106f5f,0x4(%esp)
801001f3:	80 
801001f4:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
801001fb:	e8 70 3f 00 00       	call   80104170 <initlock>
binit(void)
80100200:	b8 dc fc 10 80       	mov    $0x8010fcdc,%eax
  bcache.head.prev = &bcache.head;
80100205:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
8010020c:	fc 10 80 
  bcache.head.next = &bcache.head;
8010020f:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
80100216:	fc 10 80 
80100219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    b->next = bcache.head.next;
80100220:	89 43 54             	mov    %eax,0x54(%ebx)
    initsleeplock(&b->lock, "buffer");
80100223:	8d 43 0c             	lea    0xc(%ebx),%eax
    b->prev = &bcache.head;
80100226:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
8010022d:	89 04 24             	mov    %eax,(%esp)
80100230:	c7 44 24 04 66 6f 10 	movl   $0x80106f66,0x4(%esp)
80100237:	80 
80100238:	e8 f3 3e 00 00       	call   80104130 <initsleeplock>
    bcache.head.next->prev = b;
8010023d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100242:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100245:	89 d8                	mov    %ebx,%eax
    bcache.head.next = b;
80100247:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
8010024d:	81 c3 5c 02 00 00    	add    $0x25c,%ebx
80100253:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100259:	75 c5                	jne    80100220 <binit+0x40>
}
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
  return n;
}

void
consoleinit(void)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
80100276:	c7 44 24 04 6d 6f 10 	movl   $0x80106f6d,0x4(%esp)
8010027d:	80 
8010027e:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
80100285:	e8 e6 3e 00 00       	call   80104170 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
8010028a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100291:	00 
80100292:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  devsw[CONSOLE].write = consolewrite;
80100299:	c7 05 8c 09 11 80 b0 	movl   $0x801005b0,0x8011098c
801002a0:	05 10 80 
  devsw[CONSOLE].read = consoleread;
801002a3:	c7 05 88 09 11 80 c0 	movl   $0x801002c0,0x80110988
801002aa:	02 10 80 
  cons.locking = 1;
801002ad:	c7 05 74 a5 10 80 01 	movl   $0x1,0x8010a574
801002b4:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
801002b7:	e8 84 1f 00 00       	call   80102240 <ioapicenable>
}
801002bc:	c9                   	leave  
801002bd:	c3                   	ret    
801002be:	66 90                	xchg   %ax,%ax

801002c0 <consoleread>:
{
801002c0:	55                   	push   %ebp
801002c1:	89 e5                	mov    %esp,%ebp
801002c3:	57                   	push   %edi
801002c4:	56                   	push   %esi
801002c5:	53                   	push   %ebx
801002c6:	83 ec 2c             	sub    $0x2c,%esp
801002c9:	8b 5d 10             	mov    0x10(%ebp),%ebx
801002cc:	8b 75 08             	mov    0x8(%ebp),%esi
  iunlock(ip);
801002cf:	89 34 24             	mov    %esi,(%esp)
801002d2:	e8 e9 19 00 00       	call   80101cc0 <iunlock>
  target = n;
801002d7:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  acquire(&cons.lock);
801002da:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
801002e1:	e8 5a 40 00 00       	call   80104340 <acquire>
  while(n > 0){
801002e6:	85 db                	test   %ebx,%ebx
801002e8:	7f 26                	jg     80100310 <consoleread+0x50>
801002ea:	e9 bb 00 00 00       	jmp    801003aa <consoleread+0xea>
801002ef:	90                   	nop
      if(myproc()->killed){
801002f0:	e8 7b 37 00 00       	call   80103a70 <myproc>
801002f5:	8b 40 24             	mov    0x24(%eax),%eax
801002f8:	85 c0                	test   %eax,%eax
801002fa:	75 5c                	jne    80100358 <consoleread+0x98>
      sleep(&input.r, &cons.lock);
801002fc:	c7 44 24 04 40 a5 10 	movl   $0x8010a540,0x4(%esp)
80100303:	80 
80100304:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
8010030b:	e8 c0 39 00 00       	call   80103cd0 <sleep>
    while(input.r == input.w){
80100310:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
80100315:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010031b:	74 d3                	je     801002f0 <consoleread+0x30>
    c = input.buf[input.r++ % INPUT_BUF];
8010031d:	89 c2                	mov    %eax,%edx
8010031f:	83 e2 7f             	and    $0x7f,%edx
80100322:	0f b6 8a 40 ff 10 80 	movzbl -0x7fef00c0(%edx),%ecx
80100329:	8d 78 01             	lea    0x1(%eax),%edi
8010032c:	89 3d c0 ff 10 80    	mov    %edi,0x8010ffc0
80100332:	0f be d1             	movsbl %cl,%edx
    if(c == C('D')){  // EOF
80100335:	83 fa 04             	cmp    $0x4,%edx
80100338:	74 3f                	je     80100379 <consoleread+0xb9>
    *dst++ = c;
8010033a:	8b 45 0c             	mov    0xc(%ebp),%eax
    --n;
8010033d:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100340:	83 fa 0a             	cmp    $0xa,%edx
    *dst++ = c;
80100343:	88 08                	mov    %cl,(%eax)
    if(c == '\n')
80100345:	74 3c                	je     80100383 <consoleread+0xc3>
  while(n > 0){
80100347:	85 db                	test   %ebx,%ebx
80100349:	7e 38                	jle    80100383 <consoleread+0xc3>
    *dst++ = c;
8010034b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
8010034f:	eb bf                	jmp    80100310 <consoleread+0x50>
80100351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        release(&cons.lock);
80100358:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
8010035f:	e8 8c 3f 00 00       	call   801042f0 <release>
        ilock(ip);
80100364:	89 34 24             	mov    %esi,(%esp)
80100367:	e8 24 16 00 00       	call   80101990 <ilock>
}
8010036c:	83 c4 2c             	add    $0x2c,%esp
        ilock(ip);
8010036f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100374:	5b                   	pop    %ebx
80100375:	5e                   	pop    %esi
80100376:	5f                   	pop    %edi
80100377:	5d                   	pop    %ebp
80100378:	c3                   	ret    
      if(n < target){
80100379:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
8010037c:	76 05                	jbe    80100383 <consoleread+0xc3>
        input.r--;
8010037e:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100383:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100386:	29 d8                	sub    %ebx,%eax
  release(&cons.lock);
80100388:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
8010038f:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100392:	e8 59 3f 00 00       	call   801042f0 <release>
  ilock(ip);
80100397:	89 34 24             	mov    %esi,(%esp)
8010039a:	e8 f1 15 00 00       	call   80101990 <ilock>
8010039f:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
801003a2:	83 c4 2c             	add    $0x2c,%esp
801003a5:	5b                   	pop    %ebx
801003a6:	5e                   	pop    %esi
801003a7:	5f                   	pop    %edi
801003a8:	5d                   	pop    %ebp
801003a9:	c3                   	ret    
    while(input.r == input.w){
801003aa:	31 c0                	xor    %eax,%eax
801003ac:	eb da                	jmp    80100388 <consoleread+0xc8>
801003ae:	66 90                	xchg   %ax,%ax

801003b0 <panic>:
{
801003b0:	55                   	push   %ebp
801003b1:	89 e5                	mov    %esp,%ebp
801003b3:	56                   	push   %esi
801003b4:	53                   	push   %ebx
801003b5:	83 ec 40             	sub    $0x40,%esp
  cons.locking = 0;
801003b8:	c7 05 74 a5 10 80 00 	movl   $0x0,0x8010a574
801003bf:	00 00 00 
}

static inline void
cli(void)
{
  asm volatile("cli");
801003c2:	fa                   	cli    
  cprintf("lapicid %d: panic: ", lapicid());
801003c3:	e8 58 23 00 00       	call   80102720 <lapicid>
  getcallerpcs(&s, pcs);
801003c8:	8d 75 d0             	lea    -0x30(%ebp),%esi
801003cb:	31 db                	xor    %ebx,%ebx
  cprintf("lapicid %d: panic: ", lapicid());
801003cd:	c7 04 24 75 6f 10 80 	movl   $0x80106f75,(%esp)
801003d4:	89 44 24 04          	mov    %eax,0x4(%esp)
801003d8:	e8 73 04 00 00       	call   80100850 <cprintf>
  cprintf(s);
801003dd:	8b 45 08             	mov    0x8(%ebp),%eax
801003e0:	89 04 24             	mov    %eax,(%esp)
801003e3:	e8 68 04 00 00       	call   80100850 <cprintf>
  cprintf("\n");
801003e8:	c7 04 24 51 77 10 80 	movl   $0x80107751,(%esp)
801003ef:	e8 5c 04 00 00       	call   80100850 <cprintf>
  getcallerpcs(&s, pcs);
801003f4:	8d 45 08             	lea    0x8(%ebp),%eax
801003f7:	89 74 24 04          	mov    %esi,0x4(%esp)
801003fb:	89 04 24             	mov    %eax,(%esp)
801003fe:	e8 8d 3d 00 00       	call   80104190 <getcallerpcs>
80100403:	90                   	nop
80100404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf(" %p", pcs[i]);
80100408:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
  for(i=0; i<10; i++)
8010040b:	83 c3 01             	add    $0x1,%ebx
    cprintf(" %p", pcs[i]);
8010040e:	c7 04 24 89 6f 10 80 	movl   $0x80106f89,(%esp)
80100415:	89 44 24 04          	mov    %eax,0x4(%esp)
80100419:	e8 32 04 00 00       	call   80100850 <cprintf>
  for(i=0; i<10; i++)
8010041e:	83 fb 0a             	cmp    $0xa,%ebx
80100421:	75 e5                	jne    80100408 <panic+0x58>
  panicked = 1; // freeze other CPU
80100423:	c7 05 20 a5 10 80 01 	movl   $0x1,0x8010a520
8010042a:	00 00 00 
8010042d:	eb fe                	jmp    8010042d <panic+0x7d>
8010042f:	90                   	nop

80100430 <consputc>:
{
80100430:	55                   	push   %ebp
80100431:	89 e5                	mov    %esp,%ebp
80100433:	57                   	push   %edi
80100434:	56                   	push   %esi
80100435:	89 c6                	mov    %eax,%esi
80100437:	53                   	push   %ebx
80100438:	83 ec 1c             	sub    $0x1c,%esp
  if(panicked){
8010043b:	83 3d 20 a5 10 80 00 	cmpl   $0x0,0x8010a520
80100442:	74 03                	je     80100447 <consputc+0x17>
80100444:	fa                   	cli    
80100445:	eb fe                	jmp    80100445 <consputc+0x15>
  if(c == BACKSPACE){
80100447:	3d 00 01 00 00       	cmp    $0x100,%eax
8010044c:	0f 84 ac 00 00 00    	je     801004fe <consputc+0xce>
    uartputc(c);
80100452:	89 04 24             	mov    %eax,(%esp)
80100455:	e8 e6 55 00 00       	call   80105a40 <uartputc>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010045a:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
8010045f:	b8 0e 00 00 00       	mov    $0xe,%eax
80100464:	89 ca                	mov    %ecx,%edx
80100466:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100467:	bf d5 03 00 00       	mov    $0x3d5,%edi
8010046c:	89 fa                	mov    %edi,%edx
8010046e:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
8010046f:	0f b6 d8             	movzbl %al,%ebx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100472:	89 ca                	mov    %ecx,%edx
80100474:	c1 e3 08             	shl    $0x8,%ebx
80100477:	b8 0f 00 00 00       	mov    $0xf,%eax
8010047c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010047d:	89 fa                	mov    %edi,%edx
8010047f:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
80100480:	0f b6 c0             	movzbl %al,%eax
80100483:	09 c3                	or     %eax,%ebx
  if(c == '\n')
80100485:	83 fe 0a             	cmp    $0xa,%esi
80100488:	0f 84 fb 00 00 00    	je     80100589 <consputc+0x159>
  else if(c == BACKSPACE){
8010048e:	81 fe 00 01 00 00    	cmp    $0x100,%esi
80100494:	0f 84 e1 00 00 00    	je     8010057b <consputc+0x14b>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010049a:	66 81 e6 ff 00       	and    $0xff,%si
8010049f:	66 81 ce 00 07       	or     $0x700,%si
801004a4:	66 89 b4 1b 00 80 0b 	mov    %si,-0x7ff48000(%ebx,%ebx,1)
801004ab:	80 
801004ac:	83 c3 01             	add    $0x1,%ebx
  if(pos < 0 || pos > 25*80)
801004af:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
801004b5:	0f 87 b4 00 00 00    	ja     8010056f <consputc+0x13f>
  if((pos/80) >= 24){  // Scroll up.
801004bb:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004c1:	8d bc 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%edi
801004c8:	7f 5d                	jg     80100527 <consputc+0xf7>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
  crt[pos] = ' ' | 0x0700;
801004f1:	66 c7 07 20 07       	movw   $0x720,(%edi)
}
801004f6:	83 c4 1c             	add    $0x1c,%esp
801004f9:	5b                   	pop    %ebx
801004fa:	5e                   	pop    %esi
801004fb:	5f                   	pop    %edi
801004fc:	5d                   	pop    %ebp
801004fd:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004fe:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100505:	e8 36 55 00 00       	call   80105a40 <uartputc>
8010050a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100511:	e8 2a 55 00 00       	call   80105a40 <uartputc>
80100516:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010051d:	e8 1e 55 00 00       	call   80105a40 <uartputc>
80100522:	e9 33 ff ff ff       	jmp    8010045a <consputc+0x2a>
    pos -= 80;
80100527:	83 eb 50             	sub    $0x50,%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
8010052a:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
80100531:	00 
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100532:	8d bc 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%edi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100539:	c7 44 24 04 a0 80 0b 	movl   $0x800b80a0,0x4(%esp)
80100540:	80 
80100541:	c7 04 24 00 80 0b 80 	movl   $0x800b8000,(%esp)
80100548:	e8 23 3f 00 00       	call   80104470 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010054d:	b8 80 07 00 00       	mov    $0x780,%eax
80100552:	29 d8                	sub    %ebx,%eax
80100554:	01 c0                	add    %eax,%eax
80100556:	89 44 24 08          	mov    %eax,0x8(%esp)
8010055a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100561:	00 
80100562:	89 3c 24             	mov    %edi,(%esp)
80100565:	e8 46 3e 00 00       	call   801043b0 <memset>
8010056a:	e9 5b ff ff ff       	jmp    801004ca <consputc+0x9a>
    panic("pos under/overflow");
8010056f:	c7 04 24 8d 6f 10 80 	movl   $0x80106f8d,(%esp)
80100576:	e8 35 fe ff ff       	call   801003b0 <panic>
    if(pos > 0) --pos;
8010057b:	31 c0                	xor    %eax,%eax
8010057d:	85 db                	test   %ebx,%ebx
8010057f:	0f 9f c0             	setg   %al
80100582:	29 c3                	sub    %eax,%ebx
80100584:	e9 26 ff ff ff       	jmp    801004af <consputc+0x7f>
    pos += 80 - pos%80;
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
{
801005b0:	55                   	push   %ebp
801005b1:	89 e5                	mov    %esp,%ebp
801005b3:	57                   	push   %edi
801005b4:	56                   	push   %esi
801005b5:	53                   	push   %ebx
801005b6:	83 ec 1c             	sub    $0x1c,%esp
  iunlock(ip);
801005b9:	8b 45 08             	mov    0x8(%ebp),%eax
{
801005bc:	8b 75 10             	mov    0x10(%ebp),%esi
801005bf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  iunlock(ip);
801005c2:	89 04 24             	mov    %eax,(%esp)
801005c5:	e8 f6 16 00 00       	call   80101cc0 <iunlock>
  acquire(&cons.lock);
801005ca:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
801005d1:	e8 6a 3d 00 00       	call   80104340 <acquire>
  for(i = 0; i < n; i++)
801005d6:	85 f6                	test   %esi,%esi
801005d8:	7e 16                	jle    801005f0 <consolewrite+0x40>
801005da:	31 db                	xor    %ebx,%ebx
801005dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    consputc(buf[i] & 0xff);
801005e0:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
  for(i = 0; i < n; i++)
801005e4:	83 c3 01             	add    $0x1,%ebx
    consputc(buf[i] & 0xff);
801005e7:	e8 44 fe ff ff       	call   80100430 <consputc>
  for(i = 0; i < n; i++)
801005ec:	39 de                	cmp    %ebx,%esi
801005ee:	7f f0                	jg     801005e0 <consolewrite+0x30>
  release(&cons.lock);
801005f0:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
801005f7:	e8 f4 3c 00 00       	call   801042f0 <release>
  ilock(ip);
801005fc:	8b 45 08             	mov    0x8(%ebp),%eax
801005ff:	89 04 24             	mov    %eax,(%esp)
80100602:	e8 89 13 00 00       	call   80101990 <ilock>
}
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
{
80100620:	55                   	push   %ebp
80100621:	89 e5                	mov    %esp,%ebp
80100623:	57                   	push   %edi
  acquire(&cons.lock);
80100624:	31 ff                	xor    %edi,%edi
{
80100626:	56                   	push   %esi
80100627:	53                   	push   %ebx
80100628:	83 ec 1c             	sub    $0x1c,%esp
8010062b:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&cons.lock);
8010062e:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
80100635:	e8 06 3d 00 00       	call   80104340 <acquire>
8010063a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  while((c = getc()) >= 0){
80100640:	ff d6                	call   *%esi
80100642:	85 c0                	test   %eax,%eax
80100644:	89 c3                	mov    %eax,%ebx
80100646:	0f 88 98 00 00 00    	js     801006e4 <consoleintr+0xc4>
    switch(c){
8010064c:	83 fb 10             	cmp    $0x10,%ebx
8010064f:	90                   	nop
80100650:	0f 84 32 01 00 00    	je     80100788 <consoleintr+0x168>
80100656:	0f 8f a4 00 00 00    	jg     80100700 <consoleintr+0xe0>
8010065c:	83 fb 08             	cmp    $0x8,%ebx
8010065f:	90                   	nop
80100660:	0f 84 a8 00 00 00    	je     8010070e <consoleintr+0xee>
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100666:	85 db                	test   %ebx,%ebx
80100668:	74 d6                	je     80100640 <consoleintr+0x20>
8010066a:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010066f:	89 c2                	mov    %eax,%edx
80100671:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100677:	83 fa 7f             	cmp    $0x7f,%edx
8010067a:	77 c4                	ja     80100640 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
8010067c:	83 fb 0d             	cmp    $0xd,%ebx
8010067f:	0f 84 0d 01 00 00    	je     80100792 <consoleintr+0x172>
        input.buf[input.e++ % INPUT_BUF] = c;
80100685:	89 c2                	mov    %eax,%edx
80100687:	83 c0 01             	add    $0x1,%eax
8010068a:	83 e2 7f             	and    $0x7f,%edx
8010068d:	88 9a 40 ff 10 80    	mov    %bl,-0x7fef00c0(%edx)
80100693:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(c);
80100698:	89 d8                	mov    %ebx,%eax
8010069a:	e8 91 fd ff ff       	call   80100430 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
8010069f:	83 fb 04             	cmp    $0x4,%ebx
801006a2:	0f 84 08 01 00 00    	je     801007b0 <consoleintr+0x190>
801006a8:	83 fb 0a             	cmp    $0xa,%ebx
801006ab:	0f 84 ff 00 00 00    	je     801007b0 <consoleintr+0x190>
801006b1:	8b 15 c0 ff 10 80    	mov    0x8010ffc0,%edx
801006b7:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801006bc:	83 ea 80             	sub    $0xffffff80,%edx
801006bf:	39 d0                	cmp    %edx,%eax
801006c1:	0f 85 79 ff ff ff    	jne    80100640 <consoleintr+0x20>
          input.w = input.e;
801006c7:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
          wakeup(&input.r);
801006cc:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
801006d3:	e8 c8 2f 00 00       	call   801036a0 <wakeup>
  while((c = getc()) >= 0){
801006d8:	ff d6                	call   *%esi
801006da:	85 c0                	test   %eax,%eax
801006dc:	89 c3                	mov    %eax,%ebx
801006de:	0f 89 68 ff ff ff    	jns    8010064c <consoleintr+0x2c>
  release(&cons.lock);
801006e4:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
801006eb:	e8 00 3c 00 00       	call   801042f0 <release>
  if(doprocdump) {
801006f0:	85 ff                	test   %edi,%edi
801006f2:	0f 85 c2 00 00 00    	jne    801007ba <consoleintr+0x19a>
}
801006f8:	83 c4 1c             	add    $0x1c,%esp
801006fb:	5b                   	pop    %ebx
801006fc:	5e                   	pop    %esi
801006fd:	5f                   	pop    %edi
801006fe:	5d                   	pop    %ebp
801006ff:	c3                   	ret    
    switch(c){
80100700:	83 fb 15             	cmp    $0x15,%ebx
80100703:	74 33                	je     80100738 <consoleintr+0x118>
80100705:	83 fb 7f             	cmp    $0x7f,%ebx
80100708:	0f 85 58 ff ff ff    	jne    80100666 <consoleintr+0x46>
      if(input.e != input.w){
8010070e:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100713:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
80100719:	0f 84 21 ff ff ff    	je     80100640 <consoleintr+0x20>
        input.e--;
8010071f:	83 e8 01             	sub    $0x1,%eax
80100722:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100727:	b8 00 01 00 00       	mov    $0x100,%eax
8010072c:	e8 ff fc ff ff       	call   80100430 <consputc>
80100731:	e9 0a ff ff ff       	jmp    80100640 <consoleintr+0x20>
80100736:	66 90                	xchg   %ax,%ax
      while(input.e != input.w &&
80100738:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010073d:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
80100743:	75 2b                	jne    80100770 <consoleintr+0x150>
80100745:	e9 f6 fe ff ff       	jmp    80100640 <consoleintr+0x20>
8010074a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100750:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100755:	b8 00 01 00 00       	mov    $0x100,%eax
8010075a:	e8 d1 fc ff ff       	call   80100430 <consputc>
      while(input.e != input.w &&
8010075f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100764:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010076a:	0f 84 d0 fe ff ff    	je     80100640 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100770:	83 e8 01             	sub    $0x1,%eax
80100773:	89 c2                	mov    %eax,%edx
80100775:	83 e2 7f             	and    $0x7f,%edx
80100778:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010077f:	75 cf                	jne    80100750 <consoleintr+0x130>
80100781:	e9 ba fe ff ff       	jmp    80100640 <consoleintr+0x20>
80100786:	66 90                	xchg   %ax,%ax
    switch(c){
80100788:	bf 01 00 00 00       	mov    $0x1,%edi
8010078d:	e9 ae fe ff ff       	jmp    80100640 <consoleintr+0x20>
        input.buf[input.e++ % INPUT_BUF] = c;
80100792:	89 c2                	mov    %eax,%edx
80100794:	83 c0 01             	add    $0x1,%eax
80100797:	83 e2 7f             	and    $0x7f,%edx
8010079a:	c6 82 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%edx)
801007a1:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(c);
801007a6:	b8 0a 00 00 00       	mov    $0xa,%eax
801007ab:	e8 80 fc ff ff       	call   80100430 <consputc>
801007b0:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801007b5:	e9 0d ff ff ff       	jmp    801006c7 <consoleintr+0xa7>
}
801007ba:	83 c4 1c             	add    $0x1c,%esp
801007bd:	5b                   	pop    %ebx
801007be:	5e                   	pop    %esi
801007bf:	5f                   	pop    %edi
801007c0:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
801007c1:	e9 7a 2d 00 00       	jmp    80103540 <procdump>
801007c6:	8d 76 00             	lea    0x0(%esi),%esi
801007c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007d0 <printint>:
{
801007d0:	55                   	push   %ebp
801007d1:	89 e5                	mov    %esp,%ebp
801007d3:	57                   	push   %edi
801007d4:	56                   	push   %esi
801007d5:	89 d6                	mov    %edx,%esi
801007d7:	53                   	push   %ebx
801007d8:	83 ec 1c             	sub    $0x1c,%esp
  if(sign && (sign = xx < 0))
801007db:	85 c9                	test   %ecx,%ecx
801007dd:	74 04                	je     801007e3 <printint+0x13>
801007df:	85 c0                	test   %eax,%eax
801007e1:	78 55                	js     80100838 <printint+0x68>
    x = xx;
801007e3:	31 ff                	xor    %edi,%edi
801007e5:	31 c9                	xor    %ecx,%ecx
801007e7:	8d 5d d8             	lea    -0x28(%ebp),%ebx
801007ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    buf[i++] = digits[x % base];
801007f0:	31 d2                	xor    %edx,%edx
801007f2:	f7 f6                	div    %esi
801007f4:	0f b6 92 b0 6f 10 80 	movzbl -0x7fef9050(%edx),%edx
801007fb:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801007fe:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
80100801:	85 c0                	test   %eax,%eax
80100803:	75 eb                	jne    801007f0 <printint+0x20>
  if(sign)
80100805:	85 ff                	test   %edi,%edi
80100807:	74 08                	je     80100811 <printint+0x41>
    buf[i++] = '-';
80100809:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
8010080e:	83 c1 01             	add    $0x1,%ecx
  while(--i >= 0)
80100811:	8d 71 ff             	lea    -0x1(%ecx),%esi
80100814:	01 f3                	add    %esi,%ebx
80100816:	66 90                	xchg   %ax,%ax
    consputc(buf[i]);
80100818:	0f be 03             	movsbl (%ebx),%eax
  while(--i >= 0)
8010081b:	83 ee 01             	sub    $0x1,%esi
8010081e:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
80100821:	e8 0a fc ff ff       	call   80100430 <consputc>
  while(--i >= 0)
80100826:	83 fe ff             	cmp    $0xffffffff,%esi
80100829:	75 ed                	jne    80100818 <printint+0x48>
}
8010082b:	83 c4 1c             	add    $0x1c,%esp
8010082e:	5b                   	pop    %ebx
8010082f:	5e                   	pop    %esi
80100830:	5f                   	pop    %edi
80100831:	5d                   	pop    %ebp
80100832:	c3                   	ret    
80100833:	90                   	nop
80100834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
80100838:	f7 d8                	neg    %eax
8010083a:	bf 01 00 00 00       	mov    $0x1,%edi
  if(sign && (sign = xx < 0))
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
{
80100850:	55                   	push   %ebp
80100851:	89 e5                	mov    %esp,%ebp
80100853:	57                   	push   %edi
80100854:	56                   	push   %esi
80100855:	53                   	push   %ebx
80100856:	83 ec 2c             	sub    $0x2c,%esp
  locking = cons.locking;
80100859:	8b 3d 74 a5 10 80    	mov    0x8010a574,%edi
  if(locking)
8010085f:	85 ff                	test   %edi,%edi
80100861:	0f 85 39 01 00 00    	jne    801009a0 <cprintf+0x150>
  if (fmt == 0)
80100867:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010086a:	85 c9                	test   %ecx,%ecx
8010086c:	0f 84 3f 01 00 00    	je     801009b1 <cprintf+0x161>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100872:	0f b6 01             	movzbl (%ecx),%eax
80100875:	85 c0                	test   %eax,%eax
80100877:	0f 84 93 00 00 00    	je     80100910 <cprintf+0xc0>
  argp = (uint*)(void*)(&fmt + 1);
8010087d:	8d 75 0c             	lea    0xc(%ebp),%esi
80100880:	31 db                	xor    %ebx,%ebx
80100882:	eb 3f                	jmp    801008c3 <cprintf+0x73>
80100884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100888:	83 fa 25             	cmp    $0x25,%edx
8010088b:	0f 84 b7 00 00 00    	je     80100948 <cprintf+0xf8>
80100891:	83 fa 64             	cmp    $0x64,%edx
80100894:	0f 84 8e 00 00 00    	je     80100928 <cprintf+0xd8>
      consputc('%');
8010089a:	b8 25 00 00 00       	mov    $0x25,%eax
8010089f:	89 55 e0             	mov    %edx,-0x20(%ebp)
801008a2:	e8 89 fb ff ff       	call   80100430 <consputc>
      consputc(c);
801008a7:	8b 55 e0             	mov    -0x20(%ebp),%edx
801008aa:	89 d0                	mov    %edx,%eax
801008ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801008b0:	e8 7b fb ff ff       	call   80100430 <consputc>
801008b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801008b8:	83 c3 01             	add    $0x1,%ebx
801008bb:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
801008bf:	85 c0                	test   %eax,%eax
801008c1:	74 4d                	je     80100910 <cprintf+0xc0>
    if(c != '%'){
801008c3:	83 f8 25             	cmp    $0x25,%eax
801008c6:	75 e8                	jne    801008b0 <cprintf+0x60>
    c = fmt[++i] & 0xff;
801008c8:	83 c3 01             	add    $0x1,%ebx
801008cb:	0f b6 14 19          	movzbl (%ecx,%ebx,1),%edx
    if(c == 0)
801008cf:	85 d2                	test   %edx,%edx
801008d1:	74 3d                	je     80100910 <cprintf+0xc0>
    switch(c){
801008d3:	83 fa 70             	cmp    $0x70,%edx
801008d6:	74 12                	je     801008ea <cprintf+0x9a>
801008d8:	7e ae                	jle    80100888 <cprintf+0x38>
801008da:	83 fa 73             	cmp    $0x73,%edx
801008dd:	8d 76 00             	lea    0x0(%esi),%esi
801008e0:	74 7e                	je     80100960 <cprintf+0x110>
801008e2:	83 fa 78             	cmp    $0x78,%edx
801008e5:	8d 76 00             	lea    0x0(%esi),%esi
801008e8:	75 b0                	jne    8010089a <cprintf+0x4a>
      printint(*argp++, 16, 0);
801008ea:	8b 06                	mov    (%esi),%eax
801008ec:	31 c9                	xor    %ecx,%ecx
801008ee:	ba 10 00 00 00       	mov    $0x10,%edx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801008f3:	83 c3 01             	add    $0x1,%ebx
      printint(*argp++, 16, 0);
801008f6:	83 c6 04             	add    $0x4,%esi
801008f9:	e8 d2 fe ff ff       	call   801007d0 <printint>
801008fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100901:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
80100905:	85 c0                	test   %eax,%eax
80100907:	75 ba                	jne    801008c3 <cprintf+0x73>
80100909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(locking)
80100910:	85 ff                	test   %edi,%edi
80100912:	74 0c                	je     80100920 <cprintf+0xd0>
    release(&cons.lock);
80100914:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
8010091b:	e8 d0 39 00 00       	call   801042f0 <release>
}
80100920:	83 c4 2c             	add    $0x2c,%esp
80100923:	5b                   	pop    %ebx
80100924:	5e                   	pop    %esi
80100925:	5f                   	pop    %edi
80100926:	5d                   	pop    %ebp
80100927:	c3                   	ret    
      printint(*argp++, 10, 1);
80100928:	8b 06                	mov    (%esi),%eax
8010092a:	b9 01 00 00 00       	mov    $0x1,%ecx
8010092f:	ba 0a 00 00 00       	mov    $0xa,%edx
80100934:	83 c6 04             	add    $0x4,%esi
80100937:	e8 94 fe ff ff       	call   801007d0 <printint>
8010093c:	8b 4d 08             	mov    0x8(%ebp),%ecx
      break;
8010093f:	e9 74 ff ff ff       	jmp    801008b8 <cprintf+0x68>
80100944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100948:	b8 25 00 00 00       	mov    $0x25,%eax
8010094d:	e8 de fa ff ff       	call   80100430 <consputc>
80100952:	8b 4d 08             	mov    0x8(%ebp),%ecx
      break;
80100955:	e9 5e ff ff ff       	jmp    801008b8 <cprintf+0x68>
8010095a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if((s = (char*)*argp++) == 0)
80100960:	8b 16                	mov    (%esi),%edx
80100962:	b8 a9 6f 10 80       	mov    $0x80106fa9,%eax
80100967:	83 c6 04             	add    $0x4,%esi
8010096a:	85 d2                	test   %edx,%edx
8010096c:	0f 44 d0             	cmove  %eax,%edx
      for(; *s; s++)
8010096f:	0f b6 02             	movzbl (%edx),%eax
80100972:	84 c0                	test   %al,%al
80100974:	0f 84 3e ff ff ff    	je     801008b8 <cprintf+0x68>
8010097a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
8010097d:	89 d3                	mov    %edx,%ebx
8010097f:	90                   	nop
        consputc(*s);
80100980:	0f be c0             	movsbl %al,%eax
      for(; *s; s++)
80100983:	83 c3 01             	add    $0x1,%ebx
        consputc(*s);
80100986:	e8 a5 fa ff ff       	call   80100430 <consputc>
      for(; *s; s++)
8010098b:	0f b6 03             	movzbl (%ebx),%eax
8010098e:	84 c0                	test   %al,%al
80100990:	75 ee                	jne    80100980 <cprintf+0x130>
80100992:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80100995:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100998:	e9 1b ff ff ff       	jmp    801008b8 <cprintf+0x68>
8010099d:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&cons.lock);
801009a0:	c7 04 24 40 a5 10 80 	movl   $0x8010a540,(%esp)
801009a7:	e8 94 39 00 00       	call   80104340 <acquire>
801009ac:	e9 b6 fe ff ff       	jmp    80100867 <cprintf+0x17>
    panic("null fmt");
801009b1:	c7 04 24 a0 6f 10 80 	movl   $0x80106fa0,(%esp)
801009b8:	e8 f3 f9 ff ff       	call   801003b0 <panic>
801009bd:	66 90                	xchg   %ax,%ax
801009bf:	90                   	nop

801009c0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009c0:	55                   	push   %ebp
801009c1:	89 e5                	mov    %esp,%ebp
801009c3:	57                   	push   %edi
801009c4:	56                   	push   %esi
801009c5:	53                   	push   %ebx
801009c6:	81 ec 2c 01 00 00    	sub    $0x12c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009cc:	e8 9f 30 00 00       	call   80103a70 <myproc>
801009d1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

  begin_op();
801009d7:	e8 24 23 00 00       	call   80102d00 <begin_op>

  if((ip = namei(path)) == 0){
801009dc:	8b 45 08             	mov    0x8(%ebp),%eax
801009df:	89 04 24             	mov    %eax,(%esp)
801009e2:	e8 d9 14 00 00       	call   80101ec0 <namei>
801009e7:	85 c0                	test   %eax,%eax
801009e9:	89 c7                	mov    %eax,%edi
801009eb:	0f 84 34 03 00 00    	je     80100d25 <exec+0x365>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
801009f1:	89 04 24             	mov    %eax,(%esp)
801009f4:	e8 97 0f 00 00       	call   80101990 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
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
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a21:	81 7d 94 7f 45 4c 46 	cmpl   $0x464c457f,-0x6c(%ebp)
80100a28:	0f 85 ea 01 00 00    	jne    80100c18 <exec+0x258>
80100a2e:	66 90                	xchg   %ax,%ax
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a30:	e8 8b 5f 00 00       	call   801069c0 <setupkvm>
80100a35:	85 c0                	test   %eax,%eax
80100a37:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a3d:	0f 84 d5 01 00 00    	je     80100c18 <exec+0x258>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
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
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100a72:	8d 55 c8             	lea    -0x38(%ebp),%edx
80100a75:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100a7c:	00 
80100a7d:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80100a81:	89 54 24 04          	mov    %edx,0x4(%esp)
80100a85:	89 3c 24             	mov    %edi,(%esp)
80100a88:	e8 73 0c 00 00       	call   80101700 <readi>
80100a8d:	83 f8 20             	cmp    $0x20,%eax
80100a90:	75 76                	jne    80100b08 <exec+0x148>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100a92:	83 7d c8 01          	cmpl   $0x1,-0x38(%ebp)
80100a96:	75 c8                	jne    80100a60 <exec+0xa0>
      continue;
    if(ph.memsz < ph.filesz)
80100a98:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100a9b:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80100a9e:	66 90                	xchg   %ax,%ax
80100aa0:	72 66                	jb     80100b08 <exec+0x148>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100aa2:	03 45 d0             	add    -0x30(%ebp),%eax
80100aa5:	72 61                	jb     80100b08 <exec+0x148>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100aa7:	89 44 24 08          	mov    %eax,0x8(%esp)
80100aab:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100ab1:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100ab7:	89 4c 24 04          	mov    %ecx,0x4(%esp)
80100abb:	89 04 24             	mov    %eax,(%esp)
80100abe:	e8 ad 60 00 00       	call   80106b70 <allocuvm>
80100ac3:	85 c0                	test   %eax,%eax
80100ac5:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100acb:	74 3b                	je     80100b08 <exec+0x148>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100acd:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100ad0:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100ad5:	75 31                	jne    80100b08 <exec+0x148>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100ad7:	8b 55 d8             	mov    -0x28(%ebp),%edx
80100ada:	89 7c 24 08          	mov    %edi,0x8(%esp)
80100ade:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ae2:	89 54 24 10          	mov    %edx,0x10(%esp)
80100ae6:	8b 55 cc             	mov    -0x34(%ebp),%edx
80100ae9:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100aed:	8b 95 f4 fe ff ff    	mov    -0x10c(%ebp),%edx
80100af3:	89 14 24             	mov    %edx,(%esp)
80100af6:	e8 a5 61 00 00       	call   80106ca0 <loaduvm>
80100afb:	85 c0                	test   %eax,%eax
80100afd:	0f 89 5d ff ff ff    	jns    80100a60 <exec+0xa0>
80100b03:	90                   	nop
80100b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b08:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b0e:	89 04 24             	mov    %eax,(%esp)
80100b11:	e8 2a 5e 00 00       	call   80106940 <freevm>
  if(ip){
80100b16:	85 ff                	test   %edi,%edi
80100b18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b1d:	0f 85 f5 00 00 00    	jne    80100c18 <exec+0x258>
    iunlockput(ip);
    end_op();
  }
  return -1;
}
80100b23:	81 c4 2c 01 00 00    	add    $0x12c,%esp
80100b29:	5b                   	pop    %ebx
80100b2a:	5e                   	pop    %esi
80100b2b:	5f                   	pop    %edi
80100b2c:	5d                   	pop    %ebp
80100b2d:	c3                   	ret    
80100b2e:	66 90                	xchg   %ax,%ax
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b30:	8b 9d f0 fe ff ff    	mov    -0x110(%ebp),%ebx
80100b36:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
80100b3c:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80100b42:	8d b3 00 20 00 00    	lea    0x2000(%ebx),%esi
  iunlockput(ip);
80100b48:	89 3c 24             	mov    %edi,(%esp)
80100b4b:	e8 c0 11 00 00       	call   80101d10 <iunlockput>
  end_op();
80100b50:	e8 7b 20 00 00       	call   80102bd0 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b55:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100b5b:	89 74 24 08          	mov    %esi,0x8(%esp)
80100b5f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100b63:	89 0c 24             	mov    %ecx,(%esp)
80100b66:	e8 05 60 00 00       	call   80106b70 <allocuvm>
80100b6b:	85 c0                	test   %eax,%eax
80100b6d:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b73:	0f 84 96 00 00 00    	je     80100c0f <exec+0x24f>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100b79:	2d 00 20 00 00       	sub    $0x2000,%eax
80100b7e:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b82:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b88:	89 04 24             	mov    %eax,(%esp)
80100b8b:	e8 a0 5b 00 00       	call   80106730 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100b90:	8b 55 0c             	mov    0xc(%ebp),%edx
80100b93:	8b 02                	mov    (%edx),%eax
80100b95:	85 c0                	test   %eax,%eax
80100b97:	0f 84 a1 01 00 00    	je     80100d3e <exec+0x37e>
80100b9d:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100ba0:	31 f6                	xor    %esi,%esi
80100ba2:	8b 9d f0 fe ff ff    	mov    -0x110(%ebp),%ebx
80100ba8:	eb 28                	jmp    80100bd2 <exec+0x212>
80100baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ustack[3+argc] = sp;
80100bb0:	89 9c b5 10 ff ff ff 	mov    %ebx,-0xf0(%ebp,%esi,4)
exec(char *path, char **argv)
80100bb7:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(argc = 0; argv[argc]; argc++) {
80100bba:	83 c6 01             	add    $0x1,%esi
    ustack[3+argc] = sp;
80100bbd:	8d 95 04 ff ff ff    	lea    -0xfc(%ebp),%edx
exec(char *path, char **argv)
80100bc3:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  for(argc = 0; argv[argc]; argc++) {
80100bc6:	8b 04 b0             	mov    (%eax,%esi,4),%eax
80100bc9:	85 c0                	test   %eax,%eax
80100bcb:	74 67                	je     80100c34 <exec+0x274>
    if(argc >= MAXARG)
80100bcd:	83 fe 20             	cmp    $0x20,%esi
80100bd0:	74 3d                	je     80100c0f <exec+0x24f>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bd2:	89 04 24             	mov    %eax,(%esp)
80100bd5:	e8 f6 39 00 00       	call   801045d0 <strlen>
80100bda:	f7 d0                	not    %eax
80100bdc:	8d 1c 18             	lea    (%eax,%ebx,1),%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bdf:	8b 07                	mov    (%edi),%eax
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100be1:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100be4:	89 04 24             	mov    %eax,(%esp)
80100be7:	e8 e4 39 00 00       	call   801045d0 <strlen>
80100bec:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100bf2:	83 c0 01             	add    $0x1,%eax
80100bf5:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100bf9:	8b 07                	mov    (%edi),%eax
80100bfb:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100bff:	89 0c 24             	mov    %ecx,(%esp)
80100c02:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c06:	e8 85 5a 00 00       	call   80106690 <copyout>
80100c0b:	85 c0                	test   %eax,%eax
80100c0d:	79 a1                	jns    80100bb0 <exec+0x1f0>
    end_op();
80100c0f:	31 ff                	xor    %edi,%edi
80100c11:	e9 f2 fe ff ff       	jmp    80100b08 <exec+0x148>
80100c16:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80100c18:	89 3c 24             	mov    %edi,(%esp)
80100c1b:	90                   	nop
80100c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c20:	e8 eb 10 00 00       	call   80101d10 <iunlockput>
    end_op();
80100c25:	e8 a6 1f 00 00       	call   80102bd0 <end_op>
80100c2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c2f:	e9 ef fe ff ff       	jmp    80100b23 <exec+0x163>
  for(argc = 0; argv[argc]; argc++) {
80100c34:	8d 4e 03             	lea    0x3(%esi),%ecx
80100c37:	8d 3c b5 04 00 00 00 	lea    0x4(,%esi,4),%edi
80100c3e:	8d 04 b5 10 00 00 00 	lea    0x10(,%esi,4),%eax
  ustack[3+argc] = 0;
80100c45:	c7 84 8d 04 ff ff ff 	movl   $0x0,-0xfc(%ebp,%ecx,4)
80100c4c:	00 00 00 00 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c50:	89 d9                	mov    %ebx,%ecx
  sp -= (3+argc+1) * 4;
80100c52:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c54:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c58:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c5e:	29 f9                	sub    %edi,%ecx
  ustack[0] = 0xffffffff;  // fake return PC
80100c60:	c7 85 04 ff ff ff ff 	movl   $0xffffffff,-0xfc(%ebp)
80100c67:	ff ff ff 
  ustack[1] = argc;
80100c6a:	89 b5 08 ff ff ff    	mov    %esi,-0xf8(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c70:	89 8d 0c ff ff ff    	mov    %ecx,-0xf4(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c76:	89 54 24 08          	mov    %edx,0x8(%esp)
80100c7a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100c7e:	89 04 24             	mov    %eax,(%esp)
80100c81:	e8 0a 5a 00 00       	call   80106690 <copyout>
80100c86:	85 c0                	test   %eax,%eax
80100c88:	78 85                	js     80100c0f <exec+0x24f>
  for(last=s=path; *s; s++)
80100c8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100c8d:	0f b6 11             	movzbl (%ecx),%edx
80100c90:	84 d2                	test   %dl,%dl
80100c92:	74 1c                	je     80100cb0 <exec+0x2f0>
80100c94:	89 c8                	mov    %ecx,%eax
80100c96:	83 c0 01             	add    $0x1,%eax
80100c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(*s == '/')
80100ca0:	80 fa 2f             	cmp    $0x2f,%dl
  for(last=s=path; *s; s++)
80100ca3:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
80100ca6:	0f 44 c8             	cmove  %eax,%ecx
  for(last=s=path; *s; s++)
80100ca9:	83 c0 01             	add    $0x1,%eax
80100cac:	84 d2                	test   %dl,%dl
80100cae:	75 f0                	jne    80100ca0 <exec+0x2e0>
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cb0:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100cb6:	89 4c 24 04          	mov    %ecx,0x4(%esp)
80100cba:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100cc1:	00 
80100cc2:	83 c0 6c             	add    $0x6c,%eax
80100cc5:	89 04 24             	mov    %eax,(%esp)
80100cc8:	e8 c3 38 00 00       	call   80104590 <safestrcpy>
  oldpgdir = curproc->pgdir;
80100ccd:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  curproc->pgdir = pgdir;
80100cd3:	8b 95 f4 fe ff ff    	mov    -0x10c(%ebp),%edx
  oldpgdir = curproc->pgdir;
80100cd9:	8b 70 04             	mov    0x4(%eax),%esi
  curproc->pgdir = pgdir;
80100cdc:	89 50 04             	mov    %edx,0x4(%eax)
  curproc->sz = sz;
80100cdf:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100ce5:	89 08                	mov    %ecx,(%eax)
  curproc->tf->eip = elf.entry;  // main
80100ce7:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
80100ced:	8b 42 18             	mov    0x18(%edx),%eax
80100cf0:	8b 55 ac             	mov    -0x54(%ebp),%edx
80100cf3:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100cf6:	8b 8d ec fe ff ff    	mov    -0x114(%ebp),%ecx
80100cfc:	8b 41 18             	mov    0x18(%ecx),%eax
80100cff:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d02:	89 0c 24             	mov    %ecx,(%esp)
80100d05:	e8 56 60 00 00       	call   80106d60 <switchuvm>
  freevm(oldpgdir);
80100d0a:	89 34 24             	mov    %esi,(%esp)
80100d0d:	e8 2e 5c 00 00       	call   80106940 <freevm>
80100d12:	31 c0                	xor    %eax,%eax
  return 0;
80100d14:	e9 0a fe ff ff       	jmp    80100b23 <exec+0x163>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d19:	be 00 20 00 00       	mov    $0x2000,%esi
80100d1e:	31 db                	xor    %ebx,%ebx
80100d20:	e9 23 fe ff ff       	jmp    80100b48 <exec+0x188>
    end_op();
80100d25:	e8 a6 1e 00 00       	call   80102bd0 <end_op>
    cprintf("exec: fail\n");
80100d2a:	c7 04 24 c1 6f 10 80 	movl   $0x80106fc1,(%esp)
80100d31:	e8 1a fb ff ff       	call   80100850 <cprintf>
80100d36:	83 c8 ff             	or     $0xffffffff,%eax
    return -1;
80100d39:	e9 e5 fd ff ff       	jmp    80100b23 <exec+0x163>
  for(argc = 0; argv[argc]; argc++) {
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

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
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
  int r;

  if(f->writable == 0)
80100d78:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
80100d7c:	0f 84 ae 00 00 00    	je     80100e30 <filewrite+0xd0>
    return -1;
  if(f->type == FD_PIPE)
80100d82:	8b 03                	mov    (%ebx),%eax
80100d84:	83 f8 01             	cmp    $0x1,%eax
80100d87:	0f 84 c2 00 00 00    	je     80100e4f <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100d8d:	83 f8 02             	cmp    $0x2,%eax
80100d90:	0f 85 d7 00 00 00    	jne    80100e6d <filewrite+0x10d>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80100d96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100d99:	31 f6                	xor    %esi,%esi
80100d9b:	85 c0                	test   %eax,%eax
80100d9d:	7f 31                	jg     80100dd0 <filewrite+0x70>
80100d9f:	90                   	nop
80100da0:	e9 9b 00 00 00       	jmp    80100e40 <filewrite+0xe0>
80100da5:	8d 76 00             	lea    0x0(%esi),%esi

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
      iunlock(f->ip);
80100da8:	8b 53 10             	mov    0x10(%ebx),%edx
        f->off += r;
80100dab:	01 43 14             	add    %eax,0x14(%ebx)
      iunlock(f->ip);
80100dae:	89 14 24             	mov    %edx,(%esp)
80100db1:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100db4:	e8 07 0f 00 00       	call   80101cc0 <iunlock>
      end_op();
80100db9:	e8 12 1e 00 00       	call   80102bd0 <end_op>
80100dbe:	8b 45 dc             	mov    -0x24(%ebp),%eax

      if(r < 0)
        break;
      if(r != n1)
80100dc1:	39 f8                	cmp    %edi,%eax
80100dc3:	0f 85 98 00 00 00    	jne    80100e61 <filewrite+0x101>
        panic("short filewrite");
      i += r;
80100dc9:	01 c6                	add    %eax,%esi
    while(i < n){
80100dcb:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
80100dce:	7e 70                	jle    80100e40 <filewrite+0xe0>
      int n1 = n - i;
80100dd0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80100dd3:	b8 00 06 00 00       	mov    $0x600,%eax
80100dd8:	29 f7                	sub    %esi,%edi
80100dda:	81 ff 00 06 00 00    	cmp    $0x600,%edi
80100de0:	0f 4f f8             	cmovg  %eax,%edi
      begin_op();
80100de3:	e8 18 1f 00 00       	call   80102d00 <begin_op>
      ilock(f->ip);
80100de8:	8b 43 10             	mov    0x10(%ebx),%eax
80100deb:	89 04 24             	mov    %eax,(%esp)
80100dee:	e8 9d 0b 00 00       	call   80101990 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
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
      iunlock(f->ip);
80100e16:	8b 53 10             	mov    0x10(%ebx),%edx
80100e19:	89 14 24             	mov    %edx,(%esp)
80100e1c:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100e1f:	e8 9c 0e 00 00       	call   80101cc0 <iunlock>
      end_op();
80100e24:	e8 a7 1d 00 00       	call   80102bd0 <end_op>
      if(r < 0)
80100e29:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100e2c:	85 c0                	test   %eax,%eax
80100e2e:	74 91                	je     80100dc1 <filewrite+0x61>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
80100e30:	83 c4 2c             	add    $0x2c,%esp
  panic("filewrite");
80100e33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100e38:	5b                   	pop    %ebx
80100e39:	5e                   	pop    %esi
80100e3a:	5f                   	pop    %edi
80100e3b:	5d                   	pop    %ebp
80100e3c:	c3                   	ret    
80100e3d:	8d 76 00             	lea    0x0(%esi),%esi
    return i == n ? n : -1;
80100e40:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  panic("filewrite");
80100e43:	89 f0                	mov    %esi,%eax
    return i == n ? n : -1;
80100e45:	75 e9                	jne    80100e30 <filewrite+0xd0>
}
80100e47:	83 c4 2c             	add    $0x2c,%esp
80100e4a:	5b                   	pop    %ebx
80100e4b:	5e                   	pop    %esi
80100e4c:	5f                   	pop    %edi
80100e4d:	5d                   	pop    %ebp
80100e4e:	c3                   	ret    
    return pipewrite(f->pipe, addr, n);
80100e4f:	8b 43 0c             	mov    0xc(%ebx),%eax
80100e52:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100e55:	83 c4 2c             	add    $0x2c,%esp
80100e58:	5b                   	pop    %ebx
80100e59:	5e                   	pop    %esi
80100e5a:	5f                   	pop    %edi
80100e5b:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
80100e5c:	e9 6f 24 00 00       	jmp    801032d0 <pipewrite>
        panic("short filewrite");
80100e61:	c7 04 24 cd 6f 10 80 	movl   $0x80106fcd,(%esp)
80100e68:	e8 43 f5 ff ff       	call   801003b0 <panic>
  panic("filewrite");
80100e6d:	c7 04 24 d3 6f 10 80 	movl   $0x80106fd3,(%esp)
80100e74:	e8 37 f5 ff ff       	call   801003b0 <panic>
80100e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e80 <fileread>:
{
80100e80:	55                   	push   %ebp
80100e81:	89 e5                	mov    %esp,%ebp
80100e83:	83 ec 38             	sub    $0x38,%esp
80100e86:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80100e89:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e8c:	89 75 f8             	mov    %esi,-0x8(%ebp)
80100e8f:	8b 75 0c             	mov    0xc(%ebp),%esi
80100e92:	89 7d fc             	mov    %edi,-0x4(%ebp)
80100e95:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(f->readable == 0)
80100e98:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100e9c:	74 5a                	je     80100ef8 <fileread+0x78>
  if(f->type == FD_PIPE)
80100e9e:	8b 03                	mov    (%ebx),%eax
80100ea0:	83 f8 01             	cmp    $0x1,%eax
80100ea3:	74 5b                	je     80100f00 <fileread+0x80>
  if(f->type == FD_INODE){
80100ea5:	83 f8 02             	cmp    $0x2,%eax
80100ea8:	75 6d                	jne    80100f17 <fileread+0x97>
    ilock(f->ip);
80100eaa:	8b 43 10             	mov    0x10(%ebx),%eax
80100ead:	89 04 24             	mov    %eax,(%esp)
80100eb0:	e8 db 0a 00 00       	call   80101990 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100eb5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80100eb9:	8b 43 14             	mov    0x14(%ebx),%eax
80100ebc:	89 74 24 04          	mov    %esi,0x4(%esp)
80100ec0:	89 44 24 08          	mov    %eax,0x8(%esp)
80100ec4:	8b 43 10             	mov    0x10(%ebx),%eax
80100ec7:	89 04 24             	mov    %eax,(%esp)
80100eca:	e8 31 08 00 00       	call   80101700 <readi>
80100ecf:	85 c0                	test   %eax,%eax
80100ed1:	7e 03                	jle    80100ed6 <fileread+0x56>
      f->off += r;
80100ed3:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100ed6:	8b 53 10             	mov    0x10(%ebx),%edx
80100ed9:	89 14 24             	mov    %edx,(%esp)
80100edc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100edf:	e8 dc 0d 00 00       	call   80101cc0 <iunlock>
    return r;
80100ee4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80100ee7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100eea:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100eed:	8b 7d fc             	mov    -0x4(%ebp),%edi
80100ef0:	89 ec                	mov    %ebp,%esp
80100ef2:	5d                   	pop    %ebp
80100ef3:	c3                   	ret    
80100ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  panic("fileread");
80100ef8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100efd:	eb e8                	jmp    80100ee7 <fileread+0x67>
80100eff:	90                   	nop
    return piperead(f->pipe, addr, n);
80100f00:	8b 43 0c             	mov    0xc(%ebx),%eax
}
80100f03:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100f06:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100f09:	8b 7d fc             	mov    -0x4(%ebp),%edi
    return piperead(f->pipe, addr, n);
80100f0c:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100f0f:	89 ec                	mov    %ebp,%esp
80100f11:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100f12:	e9 c9 22 00 00       	jmp    801031e0 <piperead>
  panic("fileread");
80100f17:	c7 04 24 dd 6f 10 80 	movl   $0x80106fdd,(%esp)
80100f1e:	e8 8d f4 ff ff       	call   801003b0 <panic>
80100f23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f30 <filestat>:
{
80100f30:	55                   	push   %ebp
  if(f->type == FD_INODE){
80100f31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
{
80100f36:	89 e5                	mov    %esp,%ebp
80100f38:	53                   	push   %ebx
80100f39:	83 ec 14             	sub    $0x14,%esp
80100f3c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f3f:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f42:	74 0c                	je     80100f50 <filestat+0x20>
}
80100f44:	83 c4 14             	add    $0x14,%esp
80100f47:	5b                   	pop    %ebx
80100f48:	5d                   	pop    %ebp
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
80100f50:	8b 43 10             	mov    0x10(%ebx),%eax
80100f53:	89 04 24             	mov    %eax,(%esp)
80100f56:	e8 35 0a 00 00       	call   80101990 <ilock>
    stati(f->ip, st);
80100f5b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100f5e:	89 44 24 04          	mov    %eax,0x4(%esp)
80100f62:	8b 43 10             	mov    0x10(%ebx),%eax
80100f65:	89 04 24             	mov    %eax,(%esp)
80100f68:	e8 e3 01 00 00       	call   80101150 <stati>
    iunlock(f->ip);
80100f6d:	8b 43 10             	mov    0x10(%ebx),%eax
80100f70:	89 04 24             	mov    %eax,(%esp)
80100f73:	e8 48 0d 00 00       	call   80101cc0 <iunlock>
}
80100f78:	83 c4 14             	add    $0x14,%esp
    iunlock(f->ip);
80100f7b:	31 c0                	xor    %eax,%eax
}
80100f7d:	5b                   	pop    %ebx
80100f7e:	5d                   	pop    %ebp
80100f7f:	c3                   	ret    

80100f80 <filedup>:
{
80100f80:	55                   	push   %ebp
80100f81:	89 e5                	mov    %esp,%ebp
80100f83:	53                   	push   %ebx
80100f84:	83 ec 14             	sub    $0x14,%esp
80100f87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100f8a:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100f91:	e8 aa 33 00 00       	call   80104340 <acquire>
  if(f->ref < 1)
80100f96:	8b 43 04             	mov    0x4(%ebx),%eax
80100f99:	85 c0                	test   %eax,%eax
80100f9b:	7e 1a                	jle    80100fb7 <filedup+0x37>
  f->ref++;
80100f9d:	83 c0 01             	add    $0x1,%eax
80100fa0:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100fa3:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100faa:	e8 41 33 00 00       	call   801042f0 <release>
}
80100faf:	89 d8                	mov    %ebx,%eax
80100fb1:	83 c4 14             	add    $0x14,%esp
80100fb4:	5b                   	pop    %ebx
80100fb5:	5d                   	pop    %ebp
80100fb6:	c3                   	ret    
    panic("filedup");
80100fb7:	c7 04 24 e6 6f 10 80 	movl   $0x80106fe6,(%esp)
80100fbe:	e8 ed f3 ff ff       	call   801003b0 <panic>
80100fc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fd0 <filealloc>:
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	53                   	push   %ebx
filealloc(void)
80100fd4:	bb 2c 00 11 80       	mov    $0x8011002c,%ebx
{
80100fd9:	83 ec 14             	sub    $0x14,%esp
  acquire(&ftable.lock);
80100fdc:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80100fe3:	e8 58 33 00 00       	call   80104340 <acquire>
    if(f->ref == 0){
80100fe8:	8b 0d 18 00 11 80    	mov    0x80110018,%ecx
80100fee:	85 c9                	test   %ecx,%ecx
80100ff0:	75 11                	jne    80101003 <filealloc+0x33>
80100ff2:	eb 4a                	jmp    8010103e <filealloc+0x6e>
80100ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100ff8:	83 c3 18             	add    $0x18,%ebx
80100ffb:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80101001:	74 25                	je     80101028 <filealloc+0x58>
    if(f->ref == 0){
80101003:	8b 53 04             	mov    0x4(%ebx),%edx
80101006:	85 d2                	test   %edx,%edx
80101008:	75 ee                	jne    80100ff8 <filealloc+0x28>
      f->ref = 1;
8010100a:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80101011:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80101018:	e8 d3 32 00 00       	call   801042f0 <release>
}
8010101d:	89 d8                	mov    %ebx,%eax
8010101f:	83 c4 14             	add    $0x14,%esp
80101022:	5b                   	pop    %ebx
80101023:	5d                   	pop    %ebp
80101024:	c3                   	ret    
80101025:	8d 76 00             	lea    0x0(%esi),%esi
  release(&ftable.lock);
80101028:	31 db                	xor    %ebx,%ebx
8010102a:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80101031:	e8 ba 32 00 00       	call   801042f0 <release>
}
80101036:	89 d8                	mov    %ebx,%eax
80101038:	83 c4 14             	add    $0x14,%esp
8010103b:	5b                   	pop    %ebx
8010103c:	5d                   	pop    %ebp
8010103d:	c3                   	ret    
    if(f->ref == 0){
8010103e:	bb 14 00 11 80       	mov    $0x80110014,%ebx
80101043:	eb c5                	jmp    8010100a <filealloc+0x3a>
80101045:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101050 <fileclose>:
{
80101050:	55                   	push   %ebp
80101051:	89 e5                	mov    %esp,%ebp
80101053:	83 ec 38             	sub    $0x38,%esp
80101056:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80101059:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010105c:	89 75 f8             	mov    %esi,-0x8(%ebp)
8010105f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  acquire(&ftable.lock);
80101062:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80101069:	e8 d2 32 00 00       	call   80104340 <acquire>
  if(f->ref < 1)
8010106e:	8b 43 04             	mov    0x4(%ebx),%eax
80101071:	85 c0                	test   %eax,%eax
80101073:	0f 8e a4 00 00 00    	jle    8010111d <fileclose+0xcd>
  if(--f->ref > 0){
80101079:	83 e8 01             	sub    $0x1,%eax
8010107c:	85 c0                	test   %eax,%eax
8010107e:	89 43 04             	mov    %eax,0x4(%ebx)
80101081:	74 1d                	je     801010a0 <fileclose+0x50>
    release(&ftable.lock);
80101083:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
}
8010108a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010108d:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101090:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101093:	89 ec                	mov    %ebp,%esp
80101095:	5d                   	pop    %ebp
    release(&ftable.lock);
80101096:	e9 55 32 00 00       	jmp    801042f0 <release>
8010109b:	90                   	nop
8010109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ff = *f;
801010a0:	8b 43 0c             	mov    0xc(%ebx),%eax
801010a3:	8b 7b 10             	mov    0x10(%ebx),%edi
801010a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010a9:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
801010ad:	88 45 e7             	mov    %al,-0x19(%ebp)
801010b0:	8b 33                	mov    (%ebx),%esi
  f->ref = 0;
801010b2:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
  f->type = FD_NONE;
801010b9:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  release(&ftable.lock);
801010bf:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
801010c6:	e8 25 32 00 00       	call   801042f0 <release>
  if(ff.type == FD_PIPE)
801010cb:	83 fe 01             	cmp    $0x1,%esi
801010ce:	74 38                	je     80101108 <fileclose+0xb8>
  else if(ff.type == FD_INODE){
801010d0:	83 fe 02             	cmp    $0x2,%esi
801010d3:	74 13                	je     801010e8 <fileclose+0x98>
}
801010d5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801010d8:	8b 75 f8             	mov    -0x8(%ebp),%esi
801010db:	8b 7d fc             	mov    -0x4(%ebp),%edi
801010de:	89 ec                	mov    %ebp,%esp
801010e0:	5d                   	pop    %ebp
801010e1:	c3                   	ret    
801010e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    begin_op();
801010e8:	e8 13 1c 00 00       	call   80102d00 <begin_op>
    iput(ff.ip);
801010ed:	89 3c 24             	mov    %edi,(%esp)
801010f0:	e8 7b 09 00 00       	call   80101a70 <iput>
}
801010f5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801010f8:	8b 75 f8             	mov    -0x8(%ebp),%esi
801010fb:	8b 7d fc             	mov    -0x4(%ebp),%edi
801010fe:	89 ec                	mov    %ebp,%esp
80101100:	5d                   	pop    %ebp
    end_op();
80101101:	e9 ca 1a 00 00       	jmp    80102bd0 <end_op>
80101106:	66 90                	xchg   %ax,%ax
    pipeclose(ff.pipe, ff.writable);
80101108:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
8010110c:	89 44 24 04          	mov    %eax,0x4(%esp)
80101110:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101113:	89 04 24             	mov    %eax,(%esp)
80101116:	e8 a5 22 00 00       	call   801033c0 <pipeclose>
8010111b:	eb b8                	jmp    801010d5 <fileclose+0x85>
    panic("fileclose");
8010111d:	c7 04 24 ee 6f 10 80 	movl   $0x80106fee,(%esp)
80101124:	e8 87 f2 ff ff       	call   801003b0 <panic>
80101129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101130 <fileinit>:
{
80101130:	55                   	push   %ebp
80101131:	89 e5                	mov    %esp,%ebp
80101133:	83 ec 18             	sub    $0x18,%esp
  initlock(&ftable.lock, "ftable");
80101136:	c7 44 24 04 f8 6f 10 	movl   $0x80106ff8,0x4(%esp)
8010113d:	80 
8010113e:	c7 04 24 e0 ff 10 80 	movl   $0x8010ffe0,(%esp)
80101145:	e8 26 30 00 00       	call   80104170 <initlock>
}
8010114a:	c9                   	leave  
8010114b:	c3                   	ret    
8010114c:	66 90                	xchg   %ax,%ax
8010114e:	66 90                	xchg   %ax,%ax

80101150 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101150:	55                   	push   %ebp
80101151:	89 e5                	mov    %esp,%ebp
80101153:	8b 55 08             	mov    0x8(%ebp),%edx
80101156:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101159:	8b 0a                	mov    (%edx),%ecx
8010115b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010115e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101161:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101164:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101168:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010116b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010116f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101173:	8b 52 58             	mov    0x58(%edx),%edx
80101176:	89 50 10             	mov    %edx,0x10(%eax)
}
80101179:	5d                   	pop    %ebp
8010117a:	c3                   	ret    
8010117b:	90                   	nop
8010117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101180 <idup>:
{
80101180:	55                   	push   %ebp
80101181:	89 e5                	mov    %esp,%ebp
80101183:	53                   	push   %ebx
80101184:	83 ec 14             	sub    $0x14,%esp
80101187:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010118a:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101191:	e8 aa 31 00 00       	call   80104340 <acquire>
  ip->ref++;
80101196:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010119a:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801011a1:	e8 4a 31 00 00       	call   801042f0 <release>
}
801011a6:	89 d8                	mov    %ebx,%eax
801011a8:	83 c4 14             	add    $0x14,%esp
801011ab:	5b                   	pop    %ebx
801011ac:	5d                   	pop    %ebp
801011ad:	c3                   	ret    
801011ae:	66 90                	xchg   %ax,%ax

801011b0 <iget>:
{
801011b0:	55                   	push   %ebp
801011b1:	89 e5                	mov    %esp,%ebp
801011b3:	57                   	push   %edi
801011b4:	89 d7                	mov    %edx,%edi
801011b6:	56                   	push   %esi
iget(uint dev, uint inum)
801011b7:	31 f6                	xor    %esi,%esi
{
801011b9:	53                   	push   %ebx
801011ba:	89 c3                	mov    %eax,%ebx
801011bc:	83 ec 2c             	sub    $0x2c,%esp
  acquire(&icache.lock);
801011bf:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801011c6:	e8 75 31 00 00       	call   80104340 <acquire>
iget(uint dev, uint inum)
801011cb:	b8 34 0a 11 80       	mov    $0x80110a34,%eax
801011d0:	eb 16                	jmp    801011e8 <iget+0x38>
801011d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801011d8:	85 f6                	test   %esi,%esi
801011da:	74 3c                	je     80101218 <iget+0x68>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801011dc:	05 90 00 00 00       	add    $0x90,%eax
801011e1:	3d 54 26 11 80       	cmp    $0x80112654,%eax
801011e6:	74 48                	je     80101230 <iget+0x80>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801011e8:	8b 48 08             	mov    0x8(%eax),%ecx
801011eb:	85 c9                	test   %ecx,%ecx
801011ed:	7e e9                	jle    801011d8 <iget+0x28>
801011ef:	39 18                	cmp    %ebx,(%eax)
801011f1:	75 e5                	jne    801011d8 <iget+0x28>
801011f3:	39 78 04             	cmp    %edi,0x4(%eax)
801011f6:	75 e0                	jne    801011d8 <iget+0x28>
      ip->ref++;
801011f8:	83 c1 01             	add    $0x1,%ecx
801011fb:	89 48 08             	mov    %ecx,0x8(%eax)
      release(&icache.lock);
801011fe:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101205:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101208:	e8 e3 30 00 00       	call   801042f0 <release>
      return ip;
8010120d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101210:	83 c4 2c             	add    $0x2c,%esp
80101213:	5b                   	pop    %ebx
80101214:	5e                   	pop    %esi
80101215:	5f                   	pop    %edi
80101216:	5d                   	pop    %ebp
80101217:	c3                   	ret    
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101218:	85 c9                	test   %ecx,%ecx
8010121a:	0f 44 f0             	cmove  %eax,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010121d:	05 90 00 00 00       	add    $0x90,%eax
80101222:	3d 54 26 11 80       	cmp    $0x80112654,%eax
80101227:	75 bf                	jne    801011e8 <iget+0x38>
80101229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(empty == 0)
80101230:	85 f6                	test   %esi,%esi
80101232:	74 29                	je     8010125d <iget+0xad>
  ip->dev = dev;
80101234:	89 1e                	mov    %ebx,(%esi)
  ip->inum = inum;
80101236:	89 7e 04             	mov    %edi,0x4(%esi)
  ip->ref = 1;
80101239:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101240:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
80101247:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010124e:	e8 9d 30 00 00       	call   801042f0 <release>
}
80101253:	83 c4 2c             	add    $0x2c,%esp
  release(&icache.lock);
80101256:	89 f0                	mov    %esi,%eax
}
80101258:	5b                   	pop    %ebx
80101259:	5e                   	pop    %esi
8010125a:	5f                   	pop    %edi
8010125b:	5d                   	pop    %ebp
8010125c:	c3                   	ret    
    panic("iget: no inodes");
8010125d:	c7 04 24 ff 6f 10 80 	movl   $0x80106fff,(%esp)
80101264:	e8 47 f1 ff ff       	call   801003b0 <panic>
80101269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101270 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101270:	55                   	push   %ebp
80101271:	89 e5                	mov    %esp,%ebp
80101273:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
80101276:	8b 45 0c             	mov    0xc(%ebp),%eax
80101279:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101280:	00 
80101281:	89 44 24 04          	mov    %eax,0x4(%esp)
80101285:	8b 45 08             	mov    0x8(%ebp),%eax
80101288:	89 04 24             	mov    %eax,(%esp)
8010128b:	e8 50 32 00 00       	call   801044e0 <strncmp>
}
80101290:	c9                   	leave  
80101291:	c3                   	ret    
80101292:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801012a0 <bfree>:
{
801012a0:	55                   	push   %ebp
801012a1:	89 e5                	mov    %esp,%ebp
801012a3:	83 ec 28             	sub    $0x28,%esp
801012a6:	89 75 f8             	mov    %esi,-0x8(%ebp)
801012a9:	89 d6                	mov    %edx,%esi
  bp = bread(dev, BBLOCK(b, sb));
801012ab:	c1 ea 0c             	shr    $0xc,%edx
801012ae:	03 15 f8 09 11 80    	add    0x801109f8,%edx
{
801012b4:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  bi = b % BPB;
801012b7:	89 f3                	mov    %esi,%ebx
{
801012b9:	89 7d fc             	mov    %edi,-0x4(%ebp)
  bi = b % BPB;
801012bc:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  bp = bread(dev, BBLOCK(b, sb));
801012c2:	89 54 24 04          	mov    %edx,0x4(%esp)
  if((bp->data[bi/8] & m) == 0)
801012c6:	c1 fb 03             	sar    $0x3,%ebx
  bp = bread(dev, BBLOCK(b, sb));
801012c9:	89 04 24             	mov    %eax,(%esp)
801012cc:	e8 3f ee ff ff       	call   80100110 <bread>
  m = 1 << (bi % 8);
801012d1:	89 f1                	mov    %esi,%ecx
801012d3:	be 01 00 00 00       	mov    $0x1,%esi
801012d8:	83 e1 07             	and    $0x7,%ecx
801012db:	d3 e6                	shl    %cl,%esi
  if((bp->data[bi/8] & m) == 0)
801012dd:	0f b6 54 18 5c       	movzbl 0x5c(%eax,%ebx,1),%edx
  bp = bread(dev, BBLOCK(b, sb));
801012e2:	89 c7                	mov    %eax,%edi
  if((bp->data[bi/8] & m) == 0)
801012e4:	0f b6 c2             	movzbl %dl,%eax
801012e7:	85 f0                	test   %esi,%eax
801012e9:	74 27                	je     80101312 <bfree+0x72>
  bp->data[bi/8] &= ~m;
801012eb:	89 f0                	mov    %esi,%eax
801012ed:	f7 d0                	not    %eax
801012ef:	21 d0                	and    %edx,%eax
801012f1:	88 44 1f 5c          	mov    %al,0x5c(%edi,%ebx,1)
  log_write(bp);
801012f5:	89 3c 24             	mov    %edi,(%esp)
801012f8:	e8 13 17 00 00       	call   80102a10 <log_write>
  brelse(bp);
801012fd:	89 3c 24             	mov    %edi,(%esp)
80101300:	e8 3b ed ff ff       	call   80100040 <brelse>
}
80101305:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101308:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010130b:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010130e:	89 ec                	mov    %ebp,%esp
80101310:	5d                   	pop    %ebp
80101311:	c3                   	ret    
    panic("freeing free block");
80101312:	c7 04 24 0f 70 10 80 	movl   $0x8010700f,(%esp)
80101319:	e8 92 f0 ff ff       	call   801003b0 <panic>
8010131e:	66 90                	xchg   %ax,%ax

80101320 <iupdate>:
{
80101320:	55                   	push   %ebp
80101321:	89 e5                	mov    %esp,%ebp
80101323:	56                   	push   %esi
80101324:	53                   	push   %ebx
80101325:	83 ec 10             	sub    $0x10,%esp
80101328:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010132b:	8b 43 04             	mov    0x4(%ebx),%eax
8010132e:	c1 e8 03             	shr    $0x3,%eax
80101331:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101337:	89 44 24 04          	mov    %eax,0x4(%esp)
8010133b:	8b 03                	mov    (%ebx),%eax
8010133d:	89 04 24             	mov    %eax,(%esp)
80101340:	e8 cb ed ff ff       	call   80100110 <bread>
  dip->type = ip->type;
80101345:	0f b7 53 50          	movzwl 0x50(%ebx),%edx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101349:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010134b:	8b 43 04             	mov    0x4(%ebx),%eax
8010134e:	83 e0 07             	and    $0x7,%eax
80101351:	c1 e0 06             	shl    $0x6,%eax
80101354:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101358:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010135b:	0f b7 53 52          	movzwl 0x52(%ebx),%edx
8010135f:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
80101363:	0f b7 53 54          	movzwl 0x54(%ebx),%edx
80101367:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
8010136b:	0f b7 53 56          	movzwl 0x56(%ebx),%edx
8010136f:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
80101373:	8b 53 58             	mov    0x58(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101376:	83 c3 5c             	add    $0x5c,%ebx
  dip->size = ip->size;
80101379:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010137c:	83 c0 0c             	add    $0xc,%eax
8010137f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101383:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010138a:	00 
8010138b:	89 04 24             	mov    %eax,(%esp)
8010138e:	e8 dd 30 00 00       	call   80104470 <memmove>
  log_write(bp);
80101393:	89 34 24             	mov    %esi,(%esp)
80101396:	e8 75 16 00 00       	call   80102a10 <log_write>
  brelse(bp);
8010139b:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010139e:	83 c4 10             	add    $0x10,%esp
801013a1:	5b                   	pop    %ebx
801013a2:	5e                   	pop    %esi
801013a3:	5d                   	pop    %ebp
  brelse(bp);
801013a4:	e9 97 ec ff ff       	jmp    80100040 <brelse>
801013a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801013b0 <readsb>:
{
801013b0:	55                   	push   %ebp
801013b1:	89 e5                	mov    %esp,%ebp
801013b3:	83 ec 18             	sub    $0x18,%esp
801013b6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801013b9:	89 75 fc             	mov    %esi,-0x4(%ebp)
801013bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
801013bf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801013c6:	00 
801013c7:	8b 45 08             	mov    0x8(%ebp),%eax
801013ca:	89 04 24             	mov    %eax,(%esp)
801013cd:	e8 3e ed ff ff       	call   80100110 <bread>
  memmove(sb, bp->data, sizeof(*sb));
801013d2:	89 34 24             	mov    %esi,(%esp)
801013d5:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
801013dc:	00 
  bp = bread(dev, 1);
801013dd:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013df:	83 c0 5c             	add    $0x5c,%eax
801013e2:	89 44 24 04          	mov    %eax,0x4(%esp)
801013e6:	e8 85 30 00 00       	call   80104470 <memmove>
}
801013eb:	8b 75 fc             	mov    -0x4(%ebp),%esi
  brelse(bp);
801013ee:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801013f1:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801013f4:	89 ec                	mov    %ebp,%esp
801013f6:	5d                   	pop    %ebp
  brelse(bp);
801013f7:	e9 44 ec ff ff       	jmp    80100040 <brelse>
801013fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101400 <balloc>:
{
80101400:	55                   	push   %ebp
80101401:	89 e5                	mov    %esp,%ebp
80101403:	57                   	push   %edi
80101404:	56                   	push   %esi
80101405:	53                   	push   %ebx
80101406:	83 ec 3c             	sub    $0x3c,%esp
80101409:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
8010140c:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101411:	85 c0                	test   %eax,%eax
80101413:	0f 84 90 00 00 00    	je     801014a9 <balloc+0xa9>
80101419:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101420:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101423:	c1 f8 0c             	sar    $0xc,%eax
80101426:	03 05 f8 09 11 80    	add    0x801109f8,%eax
8010142c:	89 44 24 04          	mov    %eax,0x4(%esp)
80101430:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101433:	89 04 24             	mov    %eax,(%esp)
80101436:	e8 d5 ec ff ff       	call   80100110 <bread>
8010143b:	8b 15 e0 09 11 80    	mov    0x801109e0,%edx
80101441:	8b 5d dc             	mov    -0x24(%ebp),%ebx
80101444:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101447:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010144a:	31 c0                	xor    %eax,%eax
8010144c:	eb 35                	jmp    80101483 <balloc+0x83>
8010144e:	66 90                	xchg   %ax,%ax
      m = 1 << (bi % 8);
80101450:	89 c1                	mov    %eax,%ecx
80101452:	bf 01 00 00 00       	mov    $0x1,%edi
80101457:	83 e1 07             	and    $0x7,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010145a:	89 c2                	mov    %eax,%edx
      m = 1 << (bi % 8);
8010145c:	d3 e7                	shl    %cl,%edi
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010145e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101461:	c1 fa 03             	sar    $0x3,%edx
      m = 1 << (bi % 8);
80101464:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101467:	0f b6 74 11 5c       	movzbl 0x5c(%ecx,%edx,1),%esi
8010146c:	89 f1                	mov    %esi,%ecx
8010146e:	0f b6 f9             	movzbl %cl,%edi
80101471:	85 7d d4             	test   %edi,-0x2c(%ebp)
80101474:	74 42                	je     801014b8 <balloc+0xb8>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101476:	83 c0 01             	add    $0x1,%eax
80101479:	83 c3 01             	add    $0x1,%ebx
8010147c:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101481:	74 05                	je     80101488 <balloc+0x88>
80101483:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
80101486:	72 c8                	jb     80101450 <balloc+0x50>
    brelse(bp);
80101488:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010148b:	89 14 24             	mov    %edx,(%esp)
8010148e:	e8 ad eb ff ff       	call   80100040 <brelse>
  for(b = 0; b < sb.size; b += BPB){
80101493:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
8010149a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
8010149d:	39 0d e0 09 11 80    	cmp    %ecx,0x801109e0
801014a3:	0f 87 77 ff ff ff    	ja     80101420 <balloc+0x20>
  panic("balloc: out of blocks");
801014a9:	c7 04 24 22 70 10 80 	movl   $0x80107022,(%esp)
801014b0:	e8 fb ee ff ff       	call   801003b0 <panic>
801014b5:	8d 76 00             	lea    0x0(%esi),%esi
801014b8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
        bp->data[bi/8] |= m;  // Mark block in use.
801014bb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801014be:	09 f1                	or     %esi,%ecx
801014c0:	88 4c 17 5c          	mov    %cl,0x5c(%edi,%edx,1)
        log_write(bp);
801014c4:	89 3c 24             	mov    %edi,(%esp)
801014c7:	e8 44 15 00 00       	call   80102a10 <log_write>
        brelse(bp);
801014cc:	89 3c 24             	mov    %edi,(%esp)
801014cf:	e8 6c eb ff ff       	call   80100040 <brelse>
  bp = bread(dev, bno);
801014d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
801014d7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801014db:	89 04 24             	mov    %eax,(%esp)
801014de:	e8 2d ec ff ff       	call   80100110 <bread>
  memset(bp->data, 0, BSIZE);
801014e3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801014ea:	00 
801014eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801014f2:	00 
  bp = bread(dev, bno);
801014f3:	89 c6                	mov    %eax,%esi
  memset(bp->data, 0, BSIZE);
801014f5:	83 c0 5c             	add    $0x5c,%eax
801014f8:	89 04 24             	mov    %eax,(%esp)
801014fb:	e8 b0 2e 00 00       	call   801043b0 <memset>
  log_write(bp);
80101500:	89 34 24             	mov    %esi,(%esp)
80101503:	e8 08 15 00 00       	call   80102a10 <log_write>
  brelse(bp);
80101508:	89 34 24             	mov    %esi,(%esp)
8010150b:	e8 30 eb ff ff       	call   80100040 <brelse>
}
80101510:	83 c4 3c             	add    $0x3c,%esp
80101513:	89 d8                	mov    %ebx,%eax
80101515:	5b                   	pop    %ebx
80101516:	5e                   	pop    %esi
80101517:	5f                   	pop    %edi
80101518:	5d                   	pop    %ebp
80101519:	c3                   	ret    
8010151a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101520 <bmap>:
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	83 ec 38             	sub    $0x38,%esp
  if(bn < NDIRECT){
80101526:	83 fa 0b             	cmp    $0xb,%edx
{
80101529:	89 5d f4             	mov    %ebx,-0xc(%ebp)
8010152c:	89 c3                	mov    %eax,%ebx
8010152e:	89 75 f8             	mov    %esi,-0x8(%ebp)
80101531:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(bn < NDIRECT){
80101534:	77 1a                	ja     80101550 <bmap+0x30>
    if((addr = ip->addrs[bn]) == 0)
80101536:	8d 7a 14             	lea    0x14(%edx),%edi
80101539:	8b 44 b8 0c          	mov    0xc(%eax,%edi,4),%eax
8010153d:	85 c0                	test   %eax,%eax
8010153f:	74 67                	je     801015a8 <bmap+0x88>
}
80101541:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101544:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101547:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010154a:	89 ec                	mov    %ebp,%esp
8010154c:	5d                   	pop    %ebp
8010154d:	c3                   	ret    
8010154e:	66 90                	xchg   %ax,%ax
  bn -= NDIRECT;
80101550:	8d 7a f4             	lea    -0xc(%edx),%edi
  if(bn < NINDIRECT){
80101553:	83 ff 7f             	cmp    $0x7f,%edi
80101556:	77 6f                	ja     801015c7 <bmap+0xa7>
    if((addr = ip->addrs[NDIRECT]) == 0)
80101558:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010155e:	85 c0                	test   %eax,%eax
80101560:	74 56                	je     801015b8 <bmap+0x98>
    bp = bread(ip->dev, addr);
80101562:	89 44 24 04          	mov    %eax,0x4(%esp)
80101566:	8b 03                	mov    (%ebx),%eax
80101568:	89 04 24             	mov    %eax,(%esp)
8010156b:	e8 a0 eb ff ff       	call   80100110 <bread>
    if((addr = a[bn]) == 0){
80101570:	8d 7c b8 5c          	lea    0x5c(%eax,%edi,4),%edi
    bp = bread(ip->dev, addr);
80101574:	89 c6                	mov    %eax,%esi
    if((addr = a[bn]) == 0){
80101576:	8b 07                	mov    (%edi),%eax
80101578:	85 c0                	test   %eax,%eax
8010157a:	75 17                	jne    80101593 <bmap+0x73>
      a[bn] = addr = balloc(ip->dev);
8010157c:	8b 03                	mov    (%ebx),%eax
8010157e:	e8 7d fe ff ff       	call   80101400 <balloc>
80101583:	89 07                	mov    %eax,(%edi)
      log_write(bp);
80101585:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101588:	89 34 24             	mov    %esi,(%esp)
8010158b:	e8 80 14 00 00       	call   80102a10 <log_write>
80101590:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    brelse(bp);
80101593:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101596:	89 34 24             	mov    %esi,(%esp)
80101599:	e8 a2 ea ff ff       	call   80100040 <brelse>
    return addr;
8010159e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801015a1:	eb 9e                	jmp    80101541 <bmap+0x21>
801015a3:	90                   	nop
801015a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ip->addrs[bn] = addr = balloc(ip->dev);
801015a8:	8b 03                	mov    (%ebx),%eax
801015aa:	e8 51 fe ff ff       	call   80101400 <balloc>
801015af:	89 44 bb 0c          	mov    %eax,0xc(%ebx,%edi,4)
801015b3:	eb 8c                	jmp    80101541 <bmap+0x21>
801015b5:	8d 76 00             	lea    0x0(%esi),%esi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801015b8:	8b 03                	mov    (%ebx),%eax
801015ba:	e8 41 fe ff ff       	call   80101400 <balloc>
801015bf:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
801015c5:	eb 9b                	jmp    80101562 <bmap+0x42>
  panic("bmap: out of range");
801015c7:	c7 04 24 38 70 10 80 	movl   $0x80107038,(%esp)
801015ce:	e8 dd ed ff ff       	call   801003b0 <panic>
801015d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801015d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801015e0 <writei>:
{
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
  if(ip->type == T_DEV){
801015fb:	66 83 7b 50 03       	cmpw   $0x3,0x50(%ebx)
80101600:	74 1e                	je     80101620 <writei+0x40>
  if(off > ip->size || off + n < off)
80101602:	39 73 58             	cmp    %esi,0x58(%ebx)
80101605:	73 41                	jae    80101648 <writei+0x68>
  return n;
80101607:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010160c:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010160f:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101612:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101615:	89 ec                	mov    %ebp,%esp
80101617:	5d                   	pop    %ebp
80101618:	c3                   	ret    
80101619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101620:	0f b7 43 52          	movzwl 0x52(%ebx),%eax
80101624:	66 83 f8 09          	cmp    $0x9,%ax
80101628:	77 dd                	ja     80101607 <writei+0x27>
8010162a:	98                   	cwtl   
8010162b:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101632:	85 c0                	test   %eax,%eax
80101634:	74 d1                	je     80101607 <writei+0x27>
    return devsw[ip->major].write(ip, src, n);
80101636:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101639:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010163c:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010163f:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101642:	89 ec                	mov    %ebp,%esp
80101644:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101645:	ff e0                	jmp    *%eax
80101647:	90                   	nop
  if(off > ip->size || off + n < off)
80101648:	89 f8                	mov    %edi,%eax
8010164a:	01 f0                	add    %esi,%eax
8010164c:	72 b9                	jb     80101607 <writei+0x27>
  if(off + n > MAXFILE*BSIZE)
8010164e:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101653:	77 b2                	ja     80101607 <writei+0x27>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101655:	85 ff                	test   %edi,%edi
80101657:	0f 84 8a 00 00 00    	je     801016e7 <writei+0x107>
8010165d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101664:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101667:	89 7d dc             	mov    %edi,-0x24(%ebp)
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
8010166a:	89 f2                	mov    %esi,%edx
8010166c:	89 d8                	mov    %ebx,%eax
8010166e:	c1 ea 09             	shr    $0x9,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101671:	bf 00 02 00 00       	mov    $0x200,%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101676:	e8 a5 fe ff ff       	call   80101520 <bmap>
8010167b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010167f:	8b 03                	mov    (%ebx),%eax
80101681:	89 04 24             	mov    %eax,(%esp)
80101684:	e8 87 ea ff ff       	call   80100110 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101689:	8b 4d dc             	mov    -0x24(%ebp),%ecx
8010168c:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
8010168f:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101691:	89 f0                	mov    %esi,%eax
80101693:	25 ff 01 00 00       	and    $0x1ff,%eax
80101698:	29 c7                	sub    %eax,%edi
8010169a:	39 cf                	cmp    %ecx,%edi
8010169c:	0f 47 f9             	cmova  %ecx,%edi
    memmove(bp->data + off%BSIZE, src, m);
8010169f:	89 7c 24 08          	mov    %edi,0x8(%esp)
801016a3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801016a6:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801016aa:	89 04 24             	mov    %eax,(%esp)
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
801016ad:	01 fe                	add    %edi,%esi
    memmove(bp->data + off%BSIZE, src, m);
801016af:	89 4c 24 04          	mov    %ecx,0x4(%esp)
801016b3:	89 55 d8             	mov    %edx,-0x28(%ebp)
801016b6:	e8 b5 2d 00 00       	call   80104470 <memmove>
    log_write(bp);
801016bb:	8b 55 d8             	mov    -0x28(%ebp),%edx
801016be:	89 14 24             	mov    %edx,(%esp)
801016c1:	e8 4a 13 00 00       	call   80102a10 <log_write>
    brelse(bp);
801016c6:	8b 55 d8             	mov    -0x28(%ebp),%edx
801016c9:	89 14 24             	mov    %edx,(%esp)
801016cc:	e8 6f e9 ff ff       	call   80100040 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
801016d1:	01 7d e4             	add    %edi,-0x1c(%ebp)
801016d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801016d7:	01 7d e0             	add    %edi,-0x20(%ebp)
801016da:	39 45 dc             	cmp    %eax,-0x24(%ebp)
801016dd:	77 8b                	ja     8010166a <writei+0x8a>
  if(n > 0 && off > ip->size){
801016df:	3b 73 58             	cmp    0x58(%ebx),%esi
801016e2:	8b 7d dc             	mov    -0x24(%ebp),%edi
801016e5:	77 07                	ja     801016ee <writei+0x10e>
  return n;
801016e7:	89 f8                	mov    %edi,%eax
801016e9:	e9 1e ff ff ff       	jmp    8010160c <writei+0x2c>
    ip->size = off;
801016ee:	89 73 58             	mov    %esi,0x58(%ebx)
    iupdate(ip);
801016f1:	89 1c 24             	mov    %ebx,(%esp)
801016f4:	e8 27 fc ff ff       	call   80101320 <iupdate>
  return n;
801016f9:	89 f8                	mov    %edi,%eax
801016fb:	e9 0c ff ff ff       	jmp    8010160c <writei+0x2c>

80101700 <readi>:
{
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
  if(ip->type == T_DEV){
8010171b:	66 83 7b 50 03       	cmpw   $0x3,0x50(%ebx)
80101720:	74 1e                	je     80101740 <readi+0x40>
  if(off > ip->size || off + n < off)
80101722:	8b 43 58             	mov    0x58(%ebx),%eax
80101725:	39 f0                	cmp    %esi,%eax
80101727:	73 3f                	jae    80101768 <readi+0x68>
  return n;
80101729:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010172e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101731:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101734:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101737:	89 ec                	mov    %ebp,%esp
80101739:	5d                   	pop    %ebp
8010173a:	c3                   	ret    
8010173b:	90                   	nop
8010173c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101740:	0f b7 43 52          	movzwl 0x52(%ebx),%eax
80101744:	66 83 f8 09          	cmp    $0x9,%ax
80101748:	77 df                	ja     80101729 <readi+0x29>
8010174a:	98                   	cwtl   
8010174b:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101752:	85 c0                	test   %eax,%eax
80101754:	74 d3                	je     80101729 <readi+0x29>
    return devsw[ip->major].read(ip, dst, n);
80101756:	89 4d 10             	mov    %ecx,0x10(%ebp)
}
80101759:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010175c:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010175f:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101762:	89 ec                	mov    %ebp,%esp
80101764:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101765:	ff e0                	jmp    *%eax
80101767:	90                   	nop
  if(off > ip->size || off + n < off)
80101768:	89 ca                	mov    %ecx,%edx
8010176a:	01 f2                	add    %esi,%edx
8010176c:	89 55 e0             	mov    %edx,-0x20(%ebp)
8010176f:	72 b8                	jb     80101729 <readi+0x29>
    n = ip->size - off;
80101771:	89 c2                	mov    %eax,%edx
80101773:	29 f2                	sub    %esi,%edx
80101775:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80101778:	0f 42 ca             	cmovb  %edx,%ecx
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010177b:	85 c9                	test   %ecx,%ecx
8010177d:	74 7e                	je     801017fd <readi+0xfd>
8010177f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101786:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101789:	89 4d dc             	mov    %ecx,-0x24(%ebp)
8010178c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101790:	89 f2                	mov    %esi,%edx
80101792:	89 d8                	mov    %ebx,%eax
80101794:	c1 ea 09             	shr    $0x9,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101797:	bf 00 02 00 00       	mov    $0x200,%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
8010179c:	e8 7f fd ff ff       	call   80101520 <bmap>
801017a1:	89 44 24 04          	mov    %eax,0x4(%esp)
801017a5:	8b 03                	mov    (%ebx),%eax
801017a7:	89 04 24             	mov    %eax,(%esp)
801017aa:	e8 61 e9 ff ff       	call   80100110 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801017af:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801017b2:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801017b5:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801017b7:	89 f0                	mov    %esi,%eax
801017b9:	25 ff 01 00 00       	and    $0x1ff,%eax
801017be:	29 c7                	sub    %eax,%edi
801017c0:	39 cf                	cmp    %ecx,%edi
801017c2:	0f 47 f9             	cmova  %ecx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
801017c5:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801017c9:	01 fe                	add    %edi,%esi
    memmove(dst, bp->data + off%BSIZE, m);
801017cb:	89 7c 24 08          	mov    %edi,0x8(%esp)
801017cf:	89 44 24 04          	mov    %eax,0x4(%esp)
801017d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801017d6:	89 04 24             	mov    %eax,(%esp)
801017d9:	89 55 d8             	mov    %edx,-0x28(%ebp)
801017dc:	e8 8f 2c 00 00       	call   80104470 <memmove>
    brelse(bp);
801017e1:	8b 55 d8             	mov    -0x28(%ebp),%edx
801017e4:	89 14 24             	mov    %edx,(%esp)
801017e7:	e8 54 e8 ff ff       	call   80100040 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801017ec:	01 7d e4             	add    %edi,-0x1c(%ebp)
801017ef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801017f2:	01 7d e0             	add    %edi,-0x20(%ebp)
801017f5:	39 55 dc             	cmp    %edx,-0x24(%ebp)
801017f8:	77 96                	ja     80101790 <readi+0x90>
801017fa:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  return n;
801017fd:	89 c8                	mov    %ecx,%eax
801017ff:	e9 2a ff ff ff       	jmp    8010172e <readi+0x2e>
80101804:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010180a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101810 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101810:	55                   	push   %ebp
80101811:	89 e5                	mov    %esp,%ebp
80101813:	57                   	push   %edi
80101814:	56                   	push   %esi
80101815:	53                   	push   %ebx
80101816:	83 ec 2c             	sub    $0x2c,%esp
80101819:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
8010181c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101821:	0f 85 8c 00 00 00    	jne    801018b3 <dirlookup+0xa3>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101827:	8b 4b 58             	mov    0x58(%ebx),%ecx
8010182a:	85 c9                	test   %ecx,%ecx
8010182c:	74 4c                	je     8010187a <dirlookup+0x6a>
    panic("dirlookup not DIR");
8010182e:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101831:	31 f6                	xor    %esi,%esi
80101833:	90                   	nop
80101834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101838:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
8010183f:	00 
80101840:	89 74 24 08          	mov    %esi,0x8(%esp)
80101844:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101848:	89 1c 24             	mov    %ebx,(%esp)
8010184b:	e8 b0 fe ff ff       	call   80101700 <readi>
80101850:	83 f8 10             	cmp    $0x10,%eax
80101853:	75 52                	jne    801018a7 <dirlookup+0x97>
      panic("dirlookup read");
    if(de.inum == 0)
80101855:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010185a:	74 16                	je     80101872 <dirlookup+0x62>
      continue;
    if(namecmp(name, de.name) == 0){
8010185c:	8d 45 da             	lea    -0x26(%ebp),%eax
8010185f:	89 44 24 04          	mov    %eax,0x4(%esp)
80101863:	8b 45 0c             	mov    0xc(%ebp),%eax
80101866:	89 04 24             	mov    %eax,(%esp)
80101869:	e8 02 fa ff ff       	call   80101270 <namecmp>
8010186e:	85 c0                	test   %eax,%eax
80101870:	74 16                	je     80101888 <dirlookup+0x78>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101872:	83 c6 10             	add    $0x10,%esi
80101875:	39 73 58             	cmp    %esi,0x58(%ebx)
80101878:	77 be                	ja     80101838 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
8010187a:	83 c4 2c             	add    $0x2c,%esp
  for(off = 0; off < dp->size; off += sizeof(de)){
8010187d:	31 c0                	xor    %eax,%eax
}
8010187f:	5b                   	pop    %ebx
80101880:	5e                   	pop    %esi
80101881:	5f                   	pop    %edi
80101882:	5d                   	pop    %ebp
80101883:	c3                   	ret    
80101884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(poff)
80101888:	8b 55 10             	mov    0x10(%ebp),%edx
8010188b:	85 d2                	test   %edx,%edx
8010188d:	74 05                	je     80101894 <dirlookup+0x84>
        *poff = off;
8010188f:	8b 45 10             	mov    0x10(%ebp),%eax
80101892:	89 30                	mov    %esi,(%eax)
      return iget(dp->dev, inum);
80101894:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101898:	8b 03                	mov    (%ebx),%eax
8010189a:	e8 11 f9 ff ff       	call   801011b0 <iget>
}
8010189f:	83 c4 2c             	add    $0x2c,%esp
801018a2:	5b                   	pop    %ebx
801018a3:	5e                   	pop    %esi
801018a4:	5f                   	pop    %edi
801018a5:	5d                   	pop    %ebp
801018a6:	c3                   	ret    
      panic("dirlookup read");
801018a7:	c7 04 24 5d 70 10 80 	movl   $0x8010705d,(%esp)
801018ae:	e8 fd ea ff ff       	call   801003b0 <panic>
    panic("dirlookup not DIR");
801018b3:	c7 04 24 4b 70 10 80 	movl   $0x8010704b,(%esp)
801018ba:	e8 f1 ea ff ff       	call   801003b0 <panic>
801018bf:	90                   	nop

801018c0 <ialloc>:
{
801018c0:	55                   	push   %ebp
801018c1:	89 e5                	mov    %esp,%ebp
801018c3:	57                   	push   %edi
801018c4:	56                   	push   %esi
801018c5:	53                   	push   %ebx
801018c6:	83 ec 2c             	sub    $0x2c,%esp
801018c9:	8b 45 08             	mov    0x8(%ebp),%eax
  for(inum = 1; inum < sb.ninodes; inum++){
801018cc:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
{
801018d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018d6:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
801018da:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
801018de:	0f 86 95 00 00 00    	jbe    80101979 <ialloc+0xb9>
801018e4:	be 01 00 00 00       	mov    $0x1,%esi
801018e9:	bb 01 00 00 00       	mov    $0x1,%ebx
801018ee:	eb 15                	jmp    80101905 <ialloc+0x45>
801018f0:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
801018f3:	89 3c 24             	mov    %edi,(%esp)
  for(inum = 1; inum < sb.ninodes; inum++){
801018f6:	89 de                	mov    %ebx,%esi
    brelse(bp);
801018f8:	e8 43 e7 ff ff       	call   80100040 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
801018fd:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101903:	76 74                	jbe    80101979 <ialloc+0xb9>
    bp = bread(dev, IBLOCK(inum, sb));
80101905:	89 f0                	mov    %esi,%eax
80101907:	c1 e8 03             	shr    $0x3,%eax
8010190a:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101910:	89 44 24 04          	mov    %eax,0x4(%esp)
80101914:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101917:	89 04 24             	mov    %eax,(%esp)
8010191a:	e8 f1 e7 ff ff       	call   80100110 <bread>
8010191f:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
80101921:	89 f0                	mov    %esi,%eax
80101923:	83 e0 07             	and    $0x7,%eax
80101926:	c1 e0 06             	shl    $0x6,%eax
80101929:	8d 54 07 5c          	lea    0x5c(%edi,%eax,1),%edx
    if(dip->type == 0){  // a free inode
8010192d:	66 83 3a 00          	cmpw   $0x0,(%edx)
80101931:	75 bd                	jne    801018f0 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101933:	89 14 24             	mov    %edx,(%esp)
80101936:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
8010193d:	00 
8010193e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80101945:	00 
80101946:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101949:	e8 62 2a 00 00       	call   801043b0 <memset>
      dip->type = type;
8010194e:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101951:	0f b7 45 e2          	movzwl -0x1e(%ebp),%eax
80101955:	66 89 02             	mov    %ax,(%edx)
      log_write(bp);   // mark it allocated on the disk
80101958:	89 3c 24             	mov    %edi,(%esp)
8010195b:	e8 b0 10 00 00       	call   80102a10 <log_write>
      brelse(bp);
80101960:	89 3c 24             	mov    %edi,(%esp)
80101963:	e8 d8 e6 ff ff       	call   80100040 <brelse>
      return iget(dev, inum);
80101968:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010196b:	89 f2                	mov    %esi,%edx
}
8010196d:	83 c4 2c             	add    $0x2c,%esp
80101970:	5b                   	pop    %ebx
80101971:	5e                   	pop    %esi
80101972:	5f                   	pop    %edi
80101973:	5d                   	pop    %ebp
      return iget(dev, inum);
80101974:	e9 37 f8 ff ff       	jmp    801011b0 <iget>
  panic("ialloc: no inodes");
80101979:	c7 04 24 6c 70 10 80 	movl   $0x8010706c,(%esp)
80101980:	e8 2b ea ff ff       	call   801003b0 <panic>
80101985:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101990 <ilock>:
{
80101990:	55                   	push   %ebp
80101991:	89 e5                	mov    %esp,%ebp
80101993:	56                   	push   %esi
80101994:	53                   	push   %ebx
80101995:	83 ec 10             	sub    $0x10,%esp
80101998:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
8010199b:	85 db                	test   %ebx,%ebx
8010199d:	0f 84 b3 00 00 00    	je     80101a56 <ilock+0xc6>
801019a3:	8b 43 08             	mov    0x8(%ebx),%eax
801019a6:	85 c0                	test   %eax,%eax
801019a8:	0f 8e a8 00 00 00    	jle    80101a56 <ilock+0xc6>
  acquiresleep(&ip->lock);
801019ae:	8d 43 0c             	lea    0xc(%ebx),%eax
801019b1:	89 04 24             	mov    %eax,(%esp)
801019b4:	e8 17 27 00 00       	call   801040d0 <acquiresleep>
  if(ip->valid == 0){
801019b9:	8b 73 4c             	mov    0x4c(%ebx),%esi
801019bc:	85 f6                	test   %esi,%esi
801019be:	74 08                	je     801019c8 <ilock+0x38>
}
801019c0:	83 c4 10             	add    $0x10,%esp
801019c3:	5b                   	pop    %ebx
801019c4:	5e                   	pop    %esi
801019c5:	5d                   	pop    %ebp
801019c6:	c3                   	ret    
801019c7:	90                   	nop
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801019c8:	8b 43 04             	mov    0x4(%ebx),%eax
801019cb:	c1 e8 03             	shr    $0x3,%eax
801019ce:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801019d4:	89 44 24 04          	mov    %eax,0x4(%esp)
801019d8:	8b 03                	mov    (%ebx),%eax
801019da:	89 04 24             	mov    %eax,(%esp)
801019dd:	e8 2e e7 ff ff       	call   80100110 <bread>
801019e2:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801019e4:	8b 43 04             	mov    0x4(%ebx),%eax
801019e7:	83 e0 07             	and    $0x7,%eax
801019ea:	c1 e0 06             	shl    $0x6,%eax
801019ed:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801019f1:	0f b7 10             	movzwl (%eax),%edx
801019f4:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801019f8:	0f b7 50 02          	movzwl 0x2(%eax),%edx
801019fc:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
80101a00:	0f b7 50 04          	movzwl 0x4(%eax),%edx
80101a04:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101a08:	0f b7 50 06          	movzwl 0x6(%eax),%edx
80101a0c:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
80101a10:	8b 50 08             	mov    0x8(%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101a13:	83 c0 0c             	add    $0xc,%eax
    ip->size = dip->size;
80101a16:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101a19:	89 44 24 04          	mov    %eax,0x4(%esp)
80101a1d:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101a20:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101a27:	00 
80101a28:	89 04 24             	mov    %eax,(%esp)
80101a2b:	e8 40 2a 00 00       	call   80104470 <memmove>
    brelse(bp);
80101a30:	89 34 24             	mov    %esi,(%esp)
80101a33:	e8 08 e6 ff ff       	call   80100040 <brelse>
    if(ip->type == 0)
80101a38:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
80101a3d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101a44:	0f 85 76 ff ff ff    	jne    801019c0 <ilock+0x30>
      panic("ilock: no type");
80101a4a:	c7 04 24 84 70 10 80 	movl   $0x80107084,(%esp)
80101a51:	e8 5a e9 ff ff       	call   801003b0 <panic>
    panic("ilock");
80101a56:	c7 04 24 7e 70 10 80 	movl   $0x8010707e,(%esp)
80101a5d:	e8 4e e9 ff ff       	call   801003b0 <panic>
80101a62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101a70 <iput>:
{
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	83 ec 38             	sub    $0x38,%esp
80101a76:	89 75 f8             	mov    %esi,-0x8(%ebp)
80101a79:	8b 75 08             	mov    0x8(%ebp),%esi
80101a7c:	89 7d fc             	mov    %edi,-0x4(%ebp)
80101a7f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  acquiresleep(&ip->lock);
80101a82:	8d 7e 0c             	lea    0xc(%esi),%edi
80101a85:	89 3c 24             	mov    %edi,(%esp)
80101a88:	e8 43 26 00 00       	call   801040d0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
80101a8d:	8b 56 4c             	mov    0x4c(%esi),%edx
80101a90:	85 d2                	test   %edx,%edx
80101a92:	74 07                	je     80101a9b <iput+0x2b>
80101a94:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80101a99:	74 35                	je     80101ad0 <iput+0x60>
  releasesleep(&ip->lock);
80101a9b:	89 3c 24             	mov    %edi,(%esp)
80101a9e:	e8 ed 25 00 00       	call   80104090 <releasesleep>
  acquire(&icache.lock);
80101aa3:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101aaa:	e8 91 28 00 00       	call   80104340 <acquire>
  ip->ref--;
80101aaf:	83 6e 08 01          	subl   $0x1,0x8(%esi)
}
80101ab3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  release(&icache.lock);
80101ab6:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
80101abd:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101ac0:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101ac3:	89 ec                	mov    %ebp,%esp
80101ac5:	5d                   	pop    %ebp
  release(&icache.lock);
80101ac6:	e9 25 28 00 00       	jmp    801042f0 <release>
80101acb:	90                   	nop
80101acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    acquire(&icache.lock);
80101ad0:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101ad7:	e8 64 28 00 00       	call   80104340 <acquire>
    int r = ip->ref;
80101adc:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
80101adf:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101ae6:	e8 05 28 00 00       	call   801042f0 <release>
    if(r == 1){
80101aeb:	83 fb 01             	cmp    $0x1,%ebx
80101aee:	75 ab                	jne    80101a9b <iput+0x2b>
iput(struct inode *ip)
80101af0:	8d 4e 30             	lea    0x30(%esi),%ecx
    if(r == 1){
80101af3:	89 f3                	mov    %esi,%ebx
iput(struct inode *ip)
80101af5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101af8:	89 f7                	mov    %esi,%edi
80101afa:	89 ce                	mov    %ecx,%esi
80101afc:	eb 09                	jmp    80101b07 <iput+0x97>
80101afe:	66 90                	xchg   %ax,%ax
      ip->addrs[i] = 0;
80101b00:	83 c3 04             	add    $0x4,%ebx
  for(i = 0; i < NDIRECT; i++){
80101b03:	39 f3                	cmp    %esi,%ebx
80101b05:	74 19                	je     80101b20 <iput+0xb0>
    if(ip->addrs[i]){
80101b07:	8b 53 5c             	mov    0x5c(%ebx),%edx
80101b0a:	85 d2                	test   %edx,%edx
80101b0c:	74 f2                	je     80101b00 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
80101b0e:	8b 07                	mov    (%edi),%eax
80101b10:	e8 8b f7 ff ff       	call   801012a0 <bfree>
      ip->addrs[i] = 0;
80101b15:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
80101b1c:	eb e2                	jmp    80101b00 <iput+0x90>
80101b1e:	66 90                	xchg   %ax,%ax
80101b20:	89 fe                	mov    %edi,%esi
80101b22:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  if(ip->addrs[NDIRECT]){
80101b25:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101b2b:	85 c0                	test   %eax,%eax
80101b2d:	75 29                	jne    80101b58 <iput+0xe8>
  ip->size = 0;
80101b2f:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101b36:	89 34 24             	mov    %esi,(%esp)
80101b39:	e8 e2 f7 ff ff       	call   80101320 <iupdate>
      ip->type = 0;
80101b3e:	66 c7 46 50 00 00    	movw   $0x0,0x50(%esi)
      iupdate(ip);
80101b44:	89 34 24             	mov    %esi,(%esp)
80101b47:	e8 d4 f7 ff ff       	call   80101320 <iupdate>
      ip->valid = 0;
80101b4c:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101b53:	e9 43 ff ff ff       	jmp    80101a9b <iput+0x2b>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101b58:	89 44 24 04          	mov    %eax,0x4(%esp)
80101b5c:	8b 06                	mov    (%esi),%eax
    a = (uint*)bp->data;
80101b5e:	31 db                	xor    %ebx,%ebx
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101b60:	89 04 24             	mov    %eax,(%esp)
80101b63:	e8 a8 e5 ff ff       	call   80100110 <bread>
    a = (uint*)bp->data;
80101b68:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101b6b:	89 f7                	mov    %esi,%edi
80101b6d:	89 c1                	mov    %eax,%ecx
80101b6f:	83 c1 5c             	add    $0x5c,%ecx
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101b72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101b75:	89 ce                	mov    %ecx,%esi
80101b77:	31 c0                	xor    %eax,%eax
80101b79:	eb 12                	jmp    80101b8d <iput+0x11d>
80101b7b:	90                   	nop
80101b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(j = 0; j < NINDIRECT; j++){
80101b80:	83 c3 01             	add    $0x1,%ebx
80101b83:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
80101b89:	89 d8                	mov    %ebx,%eax
80101b8b:	74 10                	je     80101b9d <iput+0x12d>
      if(a[j])
80101b8d:	8b 14 86             	mov    (%esi,%eax,4),%edx
80101b90:	85 d2                	test   %edx,%edx
80101b92:	74 ec                	je     80101b80 <iput+0x110>
        bfree(ip->dev, a[j]);
80101b94:	8b 07                	mov    (%edi),%eax
80101b96:	e8 05 f7 ff ff       	call   801012a0 <bfree>
80101b9b:	eb e3                	jmp    80101b80 <iput+0x110>
    brelse(bp);
80101b9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101ba0:	89 fe                	mov    %edi,%esi
80101ba2:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101ba5:	89 04 24             	mov    %eax,(%esp)
80101ba8:	e8 93 e4 ff ff       	call   80100040 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80101bad:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101bb3:	8b 06                	mov    (%esi),%eax
80101bb5:	e8 e6 f6 ff ff       	call   801012a0 <bfree>
    ip->addrs[NDIRECT] = 0;
80101bba:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101bc1:	00 00 00 
80101bc4:	e9 66 ff ff ff       	jmp    80101b2f <iput+0xbf>
80101bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101bd0 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101bd0:	55                   	push   %ebp
80101bd1:	89 e5                	mov    %esp,%ebp
80101bd3:	57                   	push   %edi
80101bd4:	56                   	push   %esi
80101bd5:	53                   	push   %ebx
80101bd6:	83 ec 2c             	sub    $0x2c,%esp
80101bd9:	8b 75 08             	mov    0x8(%ebp),%esi
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101bdc:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bdf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101be6:	00 
80101be7:	89 34 24             	mov    %esi,(%esp)
80101bea:	89 44 24 04          	mov    %eax,0x4(%esp)
80101bee:	e8 1d fc ff ff       	call   80101810 <dirlookup>
80101bf3:	85 c0                	test   %eax,%eax
80101bf5:	0f 85 89 00 00 00    	jne    80101c84 <dirlink+0xb4>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101bfb:	8b 4e 58             	mov    0x58(%esi),%ecx
80101bfe:	85 c9                	test   %ecx,%ecx
80101c00:	0f 84 8d 00 00 00    	je     80101c93 <dirlink+0xc3>
    return -1;
80101c06:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101c09:	31 db                	xor    %ebx,%ebx
80101c0b:	eb 0b                	jmp    80101c18 <dirlink+0x48>
80101c0d:	8d 76 00             	lea    0x0(%esi),%esi
  for(off = 0; off < dp->size; off += sizeof(de)){
80101c10:	83 c3 10             	add    $0x10,%ebx
80101c13:	39 5e 58             	cmp    %ebx,0x58(%esi)
80101c16:	76 24                	jbe    80101c3c <dirlink+0x6c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c18:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101c1f:	00 
80101c20:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101c24:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101c28:	89 34 24             	mov    %esi,(%esp)
80101c2b:	e8 d0 fa ff ff       	call   80101700 <readi>
80101c30:	83 f8 10             	cmp    $0x10,%eax
80101c33:	75 65                	jne    80101c9a <dirlink+0xca>
      panic("dirlink read");
    if(de.inum == 0)
80101c35:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c3a:	75 d4                	jne    80101c10 <dirlink+0x40>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101c3c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c3f:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101c46:	00 
80101c47:	89 44 24 04          	mov    %eax,0x4(%esp)
80101c4b:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c4e:	89 04 24             	mov    %eax,(%esp)
80101c51:	e8 ea 28 00 00       	call   80104540 <strncpy>
  de.inum = inum;
80101c56:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c59:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101c60:	00 
80101c61:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101c65:	89 7c 24 04          	mov    %edi,0x4(%esp)
  de.inum = inum;
80101c69:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c6d:	89 34 24             	mov    %esi,(%esp)
80101c70:	e8 6b f9 ff ff       	call   801015e0 <writei>
80101c75:	83 f8 10             	cmp    $0x10,%eax
80101c78:	75 2c                	jne    80101ca6 <dirlink+0xd6>
    panic("dirlink");
80101c7a:	31 c0                	xor    %eax,%eax

  return 0;
}
80101c7c:	83 c4 2c             	add    $0x2c,%esp
80101c7f:	5b                   	pop    %ebx
80101c80:	5e                   	pop    %esi
80101c81:	5f                   	pop    %edi
80101c82:	5d                   	pop    %ebp
80101c83:	c3                   	ret    
    iput(ip);
80101c84:	89 04 24             	mov    %eax,(%esp)
80101c87:	e8 e4 fd ff ff       	call   80101a70 <iput>
80101c8c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
80101c91:	eb e9                	jmp    80101c7c <dirlink+0xac>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101c93:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101c96:	31 db                	xor    %ebx,%ebx
80101c98:	eb a2                	jmp    80101c3c <dirlink+0x6c>
      panic("dirlink read");
80101c9a:	c7 04 24 93 70 10 80 	movl   $0x80107093,(%esp)
80101ca1:	e8 0a e7 ff ff       	call   801003b0 <panic>
    panic("dirlink");
80101ca6:	c7 04 24 86 76 10 80 	movl   $0x80107686,(%esp)
80101cad:	e8 fe e6 ff ff       	call   801003b0 <panic>
80101cb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101cc0 <iunlock>:
{
80101cc0:	55                   	push   %ebp
80101cc1:	89 e5                	mov    %esp,%ebp
80101cc3:	83 ec 18             	sub    $0x18,%esp
80101cc6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80101cc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101ccc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101ccf:	85 db                	test   %ebx,%ebx
80101cd1:	74 27                	je     80101cfa <iunlock+0x3a>
80101cd3:	8d 73 0c             	lea    0xc(%ebx),%esi
80101cd6:	89 34 24             	mov    %esi,(%esp)
80101cd9:	e8 52 23 00 00       	call   80104030 <holdingsleep>
80101cde:	85 c0                	test   %eax,%eax
80101ce0:	74 18                	je     80101cfa <iunlock+0x3a>
80101ce2:	8b 5b 08             	mov    0x8(%ebx),%ebx
80101ce5:	85 db                	test   %ebx,%ebx
80101ce7:	7e 11                	jle    80101cfa <iunlock+0x3a>
  releasesleep(&ip->lock);
80101ce9:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101cec:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80101cef:	8b 75 fc             	mov    -0x4(%ebp),%esi
80101cf2:	89 ec                	mov    %ebp,%esp
80101cf4:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
80101cf5:	e9 96 23 00 00       	jmp    80104090 <releasesleep>
    panic("iunlock");
80101cfa:	c7 04 24 a0 70 10 80 	movl   $0x801070a0,(%esp)
80101d01:	e8 aa e6 ff ff       	call   801003b0 <panic>
80101d06:	8d 76 00             	lea    0x0(%esi),%esi
80101d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101d10 <iunlockput>:
{
80101d10:	55                   	push   %ebp
80101d11:	89 e5                	mov    %esp,%ebp
80101d13:	53                   	push   %ebx
80101d14:	83 ec 14             	sub    $0x14,%esp
80101d17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
80101d1a:	89 1c 24             	mov    %ebx,(%esp)
80101d1d:	e8 9e ff ff ff       	call   80101cc0 <iunlock>
  iput(ip);
80101d22:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80101d25:	83 c4 14             	add    $0x14,%esp
80101d28:	5b                   	pop    %ebx
80101d29:	5d                   	pop    %ebp
  iput(ip);
80101d2a:	e9 41 fd ff ff       	jmp    80101a70 <iput>
80101d2f:	90                   	nop

80101d30 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101d30:	55                   	push   %ebp
80101d31:	89 e5                	mov    %esp,%ebp
80101d33:	57                   	push   %edi
80101d34:	56                   	push   %esi
80101d35:	53                   	push   %ebx
80101d36:	89 c3                	mov    %eax,%ebx
80101d38:	83 ec 2c             	sub    $0x2c,%esp
80101d3b:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101d3e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101d41:	80 38 2f             	cmpb   $0x2f,(%eax)
80101d44:	0f 84 14 01 00 00    	je     80101e5e <namex+0x12e>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101d4a:	e8 21 1d 00 00       	call   80103a70 <myproc>
80101d4f:	8b 40 68             	mov    0x68(%eax),%eax
80101d52:	89 04 24             	mov    %eax,(%esp)
80101d55:	e8 26 f4 ff ff       	call   80101180 <idup>
80101d5a:	89 c7                	mov    %eax,%edi
80101d5c:	eb 05                	jmp    80101d63 <namex+0x33>
80101d5e:	66 90                	xchg   %ax,%ax
    path++;
80101d60:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d63:	0f b6 03             	movzbl (%ebx),%eax
80101d66:	3c 2f                	cmp    $0x2f,%al
80101d68:	74 f6                	je     80101d60 <namex+0x30>
  if(*path == 0)
80101d6a:	84 c0                	test   %al,%al
80101d6c:	75 1a                	jne    80101d88 <namex+0x58>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d6e:	8b 75 e0             	mov    -0x20(%ebp),%esi
80101d71:	85 f6                	test   %esi,%esi
80101d73:	0f 85 0d 01 00 00    	jne    80101e86 <namex+0x156>
    iput(ip);
    return 0;
  }
  return ip;
}
80101d79:	83 c4 2c             	add    $0x2c,%esp
80101d7c:	89 f8                	mov    %edi,%eax
80101d7e:	5b                   	pop    %ebx
80101d7f:	5e                   	pop    %esi
80101d80:	5f                   	pop    %edi
80101d81:	5d                   	pop    %ebp
80101d82:	c3                   	ret    
80101d83:	90                   	nop
80101d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*path != '/' && *path != 0)
80101d88:	3c 2f                	cmp    $0x2f,%al
80101d8a:	0f 84 94 00 00 00    	je     80101e24 <namex+0xf4>
80101d90:	89 de                	mov    %ebx,%esi
80101d92:	eb 08                	jmp    80101d9c <namex+0x6c>
80101d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d98:	3c 2f                	cmp    $0x2f,%al
80101d9a:	74 0a                	je     80101da6 <namex+0x76>
    path++;
80101d9c:	83 c6 01             	add    $0x1,%esi
  while(*path != '/' && *path != 0)
80101d9f:	0f b6 06             	movzbl (%esi),%eax
80101da2:	84 c0                	test   %al,%al
80101da4:	75 f2                	jne    80101d98 <namex+0x68>
80101da6:	89 f2                	mov    %esi,%edx
80101da8:	29 da                	sub    %ebx,%edx
  if(len >= DIRSIZ)
80101daa:	83 fa 0d             	cmp    $0xd,%edx
80101dad:	7e 79                	jle    80101e28 <namex+0xf8>
    memmove(name, s, DIRSIZ);
80101daf:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101db6:	00 
80101db7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101dbb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101dbe:	89 04 24             	mov    %eax,(%esp)
80101dc1:	e8 aa 26 00 00       	call   80104470 <memmove>
80101dc6:	eb 03                	jmp    80101dcb <namex+0x9b>
    path++;
80101dc8:	83 c6 01             	add    $0x1,%esi
  while(*path == '/')
80101dcb:	80 3e 2f             	cmpb   $0x2f,(%esi)
80101dce:	74 f8                	je     80101dc8 <namex+0x98>
  while((path = skipelem(path, name)) != 0){
80101dd0:	85 f6                	test   %esi,%esi
80101dd2:	74 9a                	je     80101d6e <namex+0x3e>
    ilock(ip);
80101dd4:	89 3c 24             	mov    %edi,(%esp)
80101dd7:	e8 b4 fb ff ff       	call   80101990 <ilock>
    if(ip->type != T_DIR){
80101ddc:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80101de1:	75 67                	jne    80101e4a <namex+0x11a>
    if(nameiparent && *path == '\0'){
80101de3:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101de6:	85 c0                	test   %eax,%eax
80101de8:	74 0c                	je     80101df6 <namex+0xc6>
80101dea:	80 3e 00             	cmpb   $0x0,(%esi)
80101ded:	8d 76 00             	lea    0x0(%esi),%esi
80101df0:	0f 84 7e 00 00 00    	je     80101e74 <namex+0x144>
    if((next = dirlookup(ip, name, 0)) == 0){
80101df6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101dfd:	00 
80101dfe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e01:	89 3c 24             	mov    %edi,(%esp)
80101e04:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e08:	e8 03 fa ff ff       	call   80101810 <dirlookup>
80101e0d:	85 c0                	test   %eax,%eax
80101e0f:	89 c3                	mov    %eax,%ebx
80101e11:	74 37                	je     80101e4a <namex+0x11a>
    iunlockput(ip);
80101e13:	89 3c 24             	mov    %edi,(%esp)
80101e16:	89 df                	mov    %ebx,%edi
80101e18:	89 f3                	mov    %esi,%ebx
80101e1a:	e8 f1 fe ff ff       	call   80101d10 <iunlockput>
80101e1f:	e9 3f ff ff ff       	jmp    80101d63 <namex+0x33>
  while(*path == '/')
80101e24:	89 de                	mov    %ebx,%esi
80101e26:	31 d2                	xor    %edx,%edx
    memmove(name, s, len);
80101e28:	89 54 24 08          	mov    %edx,0x8(%esp)
80101e2c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101e30:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e33:	89 04 24             	mov    %eax,(%esp)
80101e36:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101e39:	e8 32 26 00 00       	call   80104470 <memmove>
    name[len] = 0;
80101e3e:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101e41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e44:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
80101e48:	eb 81                	jmp    80101dcb <namex+0x9b>
      iunlockput(ip);
80101e4a:	89 3c 24             	mov    %edi,(%esp)
80101e4d:	31 ff                	xor    %edi,%edi
80101e4f:	e8 bc fe ff ff       	call   80101d10 <iunlockput>
}
80101e54:	83 c4 2c             	add    $0x2c,%esp
80101e57:	89 f8                	mov    %edi,%eax
80101e59:	5b                   	pop    %ebx
80101e5a:	5e                   	pop    %esi
80101e5b:	5f                   	pop    %edi
80101e5c:	5d                   	pop    %ebp
80101e5d:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101e5e:	ba 01 00 00 00       	mov    $0x1,%edx
80101e63:	b8 01 00 00 00       	mov    $0x1,%eax
80101e68:	e8 43 f3 ff ff       	call   801011b0 <iget>
80101e6d:	89 c7                	mov    %eax,%edi
80101e6f:	e9 ef fe ff ff       	jmp    80101d63 <namex+0x33>
      iunlock(ip);
80101e74:	89 3c 24             	mov    %edi,(%esp)
80101e77:	e8 44 fe ff ff       	call   80101cc0 <iunlock>
}
80101e7c:	83 c4 2c             	add    $0x2c,%esp
80101e7f:	89 f8                	mov    %edi,%eax
80101e81:	5b                   	pop    %ebx
80101e82:	5e                   	pop    %esi
80101e83:	5f                   	pop    %edi
80101e84:	5d                   	pop    %ebp
80101e85:	c3                   	ret    
    iput(ip);
80101e86:	89 3c 24             	mov    %edi,(%esp)
80101e89:	31 ff                	xor    %edi,%edi
80101e8b:	e8 e0 fb ff ff       	call   80101a70 <iput>
    return 0;
80101e90:	e9 e4 fe ff ff       	jmp    80101d79 <namex+0x49>
80101e95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ea0 <nameiparent>:
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101ea0:	55                   	push   %ebp
  return namex(path, 1, name);
80101ea1:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101ea6:	89 e5                	mov    %esp,%ebp
80101ea8:	83 ec 08             	sub    $0x8,%esp
  return namex(path, 1, name);
80101eab:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eae:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101eb1:	c9                   	leave  
  return namex(path, 1, name);
80101eb2:	e9 79 fe ff ff       	jmp    80101d30 <namex>
80101eb7:	89 f6                	mov    %esi,%esi
80101eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ec0 <namei>:
{
80101ec0:	55                   	push   %ebp
  return namex(path, 0, name);
80101ec1:	31 d2                	xor    %edx,%edx
{
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ecb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ece:	e8 5d fe ff ff       	call   80101d30 <namex>
}
80101ed3:	c9                   	leave  
80101ed4:	c3                   	ret    
80101ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <iinit>:
{
80101ee0:	55                   	push   %ebp
80101ee1:	89 e5                	mov    %esp,%ebp
80101ee3:	53                   	push   %ebx
  initlock(&icache.lock, "icache");
80101ee4:	31 db                	xor    %ebx,%ebx
{
80101ee6:	83 ec 24             	sub    $0x24,%esp
  initlock(&icache.lock, "icache");
80101ee9:	c7 44 24 04 a8 70 10 	movl   $0x801070a8,0x4(%esp)
80101ef0:	80 
80101ef1:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101ef8:	e8 73 22 00 00       	call   80104170 <initlock>
80101efd:	8d 76 00             	lea    0x0(%esi),%esi
    initsleeplock(&icache.inode[i].lock, "inode");
80101f00:	8d 04 db             	lea    (%ebx,%ebx,8),%eax
  for(i = 0; i < NINODE; i++) {
80101f03:	83 c3 01             	add    $0x1,%ebx
    initsleeplock(&icache.inode[i].lock, "inode");
80101f06:	c1 e0 04             	shl    $0x4,%eax
80101f09:	05 40 0a 11 80       	add    $0x80110a40,%eax
80101f0e:	c7 44 24 04 af 70 10 	movl   $0x801070af,0x4(%esp)
80101f15:	80 
80101f16:	89 04 24             	mov    %eax,(%esp)
80101f19:	e8 12 22 00 00       	call   80104130 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
80101f1e:	83 fb 32             	cmp    $0x32,%ebx
80101f21:	75 dd                	jne    80101f00 <iinit+0x20>
  readsb(dev, &sb);
80101f23:	8b 45 08             	mov    0x8(%ebp),%eax
80101f26:	c7 44 24 04 e0 09 11 	movl   $0x801109e0,0x4(%esp)
80101f2d:	80 
80101f2e:	89 04 24             	mov    %eax,(%esp)
80101f31:	e8 7a f4 ff ff       	call   801013b0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
80101f36:	a1 f8 09 11 80       	mov    0x801109f8,%eax
80101f3b:	c7 04 24 b8 70 10 80 	movl   $0x801070b8,(%esp)
80101f42:	89 44 24 1c          	mov    %eax,0x1c(%esp)
80101f46:	a1 f4 09 11 80       	mov    0x801109f4,%eax
80101f4b:	89 44 24 18          	mov    %eax,0x18(%esp)
80101f4f:	a1 f0 09 11 80       	mov    0x801109f0,%eax
80101f54:	89 44 24 14          	mov    %eax,0x14(%esp)
80101f58:	a1 ec 09 11 80       	mov    0x801109ec,%eax
80101f5d:	89 44 24 10          	mov    %eax,0x10(%esp)
80101f61:	a1 e8 09 11 80       	mov    0x801109e8,%eax
80101f66:	89 44 24 0c          	mov    %eax,0xc(%esp)
80101f6a:	a1 e4 09 11 80       	mov    0x801109e4,%eax
80101f6f:	89 44 24 08          	mov    %eax,0x8(%esp)
80101f73:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101f78:	89 44 24 04          	mov    %eax,0x4(%esp)
80101f7c:	e8 cf e8 ff ff       	call   80100850 <cprintf>
}
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
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f90:	55                   	push   %ebp
80101f91:	89 c1                	mov    %eax,%ecx
80101f93:	89 e5                	mov    %esp,%ebp
80101f95:	56                   	push   %esi
80101f96:	53                   	push   %ebx
80101f97:	83 ec 10             	sub    $0x10,%esp
  if(b == 0)
80101f9a:	85 c0                	test   %eax,%eax
80101f9c:	0f 84 99 00 00 00    	je     8010203b <idestart+0xab>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101fa2:	8b 58 08             	mov    0x8(%eax),%ebx
80101fa5:	81 fb cf 07 00 00    	cmp    $0x7cf,%ebx
80101fab:	0f 87 7e 00 00 00    	ja     8010202f <idestart+0x9f>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fb1:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fb6:	66 90                	xchg   %ax,%ax
80101fb8:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101fb9:	25 c0 00 00 00       	and    $0xc0,%eax
80101fbe:	83 f8 40             	cmp    $0x40,%eax
80101fc1:	75 f5                	jne    80101fb8 <idestart+0x28>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80101ff9:	f6 01 04             	testb  $0x4,(%ecx)
80101ffc:	75 12                	jne    80102010 <idestart+0x80>
80101ffe:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102003:	b8 20 00 00 00       	mov    $0x20,%eax
80102008:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80102009:	83 c4 10             	add    $0x10,%esp
8010200c:	5b                   	pop    %ebx
8010200d:	5e                   	pop    %esi
8010200e:	5d                   	pop    %ebp
8010200f:	c3                   	ret    
80102010:	b2 f7                	mov    $0xf7,%dl
80102012:	b8 30 00 00 00       	mov    $0x30,%eax
80102017:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
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
    panic("incorrect blockno");
8010202f:	c7 04 24 14 71 10 80 	movl   $0x80107114,(%esp)
80102036:	e8 75 e3 ff ff       	call   801003b0 <panic>
    panic("idestart");
8010203b:	c7 04 24 0b 71 10 80 	movl   $0x8010710b,(%esp)
80102042:	e8 69 e3 ff ff       	call   801003b0 <panic>
80102047:	89 f6                	mov    %esi,%esi
80102049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102050 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102050:	55                   	push   %ebp
80102051:	89 e5                	mov    %esp,%ebp
80102053:	53                   	push   %ebx
80102054:	83 ec 14             	sub    $0x14,%esp
80102057:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010205a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010205d:	89 04 24             	mov    %eax,(%esp)
80102060:	e8 cb 1f 00 00       	call   80104030 <holdingsleep>
80102065:	85 c0                	test   %eax,%eax
80102067:	0f 84 8f 00 00 00    	je     801020fc <iderw+0xac>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010206d:	8b 03                	mov    (%ebx),%eax
8010206f:	83 e0 06             	and    $0x6,%eax
80102072:	83 f8 02             	cmp    $0x2,%eax
80102075:	0f 84 99 00 00 00    	je     80102114 <iderw+0xc4>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010207b:	8b 53 04             	mov    0x4(%ebx),%edx
8010207e:	85 d2                	test   %edx,%edx
80102080:	74 09                	je     8010208b <iderw+0x3b>
80102082:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102087:	85 c0                	test   %eax,%eax
80102089:	74 7d                	je     80102108 <iderw+0xb8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
8010208b:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102092:	e8 a9 22 00 00       	call   80104340 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102097:	ba b4 a5 10 80       	mov    $0x8010a5b4,%edx
  b->qnext = 0;
8010209c:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801020a3:	a1 b4 a5 10 80       	mov    0x8010a5b4,%eax
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801020a8:	85 c0                	test   %eax,%eax
801020aa:	74 0e                	je     801020ba <iderw+0x6a>
801020ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801020b0:	8d 50 58             	lea    0x58(%eax),%edx
801020b3:	8b 40 58             	mov    0x58(%eax),%eax
801020b6:	85 c0                	test   %eax,%eax
801020b8:	75 f6                	jne    801020b0 <iderw+0x60>
    ;
  *pp = b;
801020ba:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801020bc:	39 1d b4 a5 10 80    	cmp    %ebx,0x8010a5b4
801020c2:	75 14                	jne    801020d8 <iderw+0x88>
801020c4:	eb 2d                	jmp    801020f3 <iderw+0xa3>
801020c6:	66 90                	xchg   %ax,%ax
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
801020c8:	c7 44 24 04 80 a5 10 	movl   $0x8010a580,0x4(%esp)
801020cf:	80 
801020d0:	89 1c 24             	mov    %ebx,(%esp)
801020d3:	e8 f8 1b 00 00       	call   80103cd0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801020d8:	8b 03                	mov    (%ebx),%eax
801020da:	83 e0 06             	and    $0x6,%eax
801020dd:	83 f8 02             	cmp    $0x2,%eax
801020e0:	75 e6                	jne    801020c8 <iderw+0x78>
  }


  release(&idelock);
801020e2:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801020e9:	83 c4 14             	add    $0x14,%esp
801020ec:	5b                   	pop    %ebx
801020ed:	5d                   	pop    %ebp
  release(&idelock);
801020ee:	e9 fd 21 00 00       	jmp    801042f0 <release>
    idestart(b);
801020f3:	89 d8                	mov    %ebx,%eax
801020f5:	e8 96 fe ff ff       	call   80101f90 <idestart>
801020fa:	eb dc                	jmp    801020d8 <iderw+0x88>
    panic("iderw: buf not locked");
801020fc:	c7 04 24 26 71 10 80 	movl   $0x80107126,(%esp)
80102103:	e8 a8 e2 ff ff       	call   801003b0 <panic>
    panic("iderw: ide disk 1 not present");
80102108:	c7 04 24 51 71 10 80 	movl   $0x80107151,(%esp)
8010210f:	e8 9c e2 ff ff       	call   801003b0 <panic>
    panic("iderw: nothing to do");
80102114:	c7 04 24 3c 71 10 80 	movl   $0x8010713c,(%esp)
8010211b:	e8 90 e2 ff ff       	call   801003b0 <panic>

80102120 <ideintr>:
{
80102120:	55                   	push   %ebp
80102121:	89 e5                	mov    %esp,%ebp
80102123:	57                   	push   %edi
80102124:	53                   	push   %ebx
80102125:	83 ec 10             	sub    $0x10,%esp
  acquire(&idelock);
80102128:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
8010212f:	e8 0c 22 00 00       	call   80104340 <acquire>
  if((b = idequeue) == 0){
80102134:	8b 1d b4 a5 10 80    	mov    0x8010a5b4,%ebx
8010213a:	85 db                	test   %ebx,%ebx
8010213c:	74 2d                	je     8010216b <ideintr+0x4b>
  idequeue = b->qnext;
8010213e:	8b 43 58             	mov    0x58(%ebx),%eax
80102141:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102146:	8b 0b                	mov    (%ebx),%ecx
80102148:	f6 c1 04             	test   $0x4,%cl
8010214b:	74 33                	je     80102180 <ideintr+0x60>
  b->flags &= ~B_DIRTY;
8010214d:	83 c9 02             	or     $0x2,%ecx
80102150:	83 e1 fb             	and    $0xfffffffb,%ecx
80102153:	89 0b                	mov    %ecx,(%ebx)
  wakeup(b);
80102155:	89 1c 24             	mov    %ebx,(%esp)
80102158:	e8 43 15 00 00       	call   801036a0 <wakeup>
  if(idequeue != 0)
8010215d:	a1 b4 a5 10 80       	mov    0x8010a5b4,%eax
80102162:	85 c0                	test   %eax,%eax
80102164:	74 05                	je     8010216b <ideintr+0x4b>
    idestart(idequeue);
80102166:	e8 25 fe ff ff       	call   80101f90 <idestart>
  release(&idelock);
8010216b:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102172:	e8 79 21 00 00       	call   801042f0 <release>
}
80102177:	83 c4 10             	add    $0x10,%esp
8010217a:	5b                   	pop    %ebx
8010217b:	5f                   	pop    %edi
8010217c:	5d                   	pop    %ebp
8010217d:	c3                   	ret    
8010217e:	66 90                	xchg   %ax,%ax
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102180:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102185:	8d 76 00             	lea    0x0(%esi),%esi
80102188:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102189:	0f b6 c0             	movzbl %al,%eax
8010218c:	89 c7                	mov    %eax,%edi
8010218e:	81 e7 c0 00 00 00    	and    $0xc0,%edi
80102194:	83 ff 40             	cmp    $0x40,%edi
80102197:	75 ef                	jne    80102188 <ideintr+0x68>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80102199:	a8 21                	test   $0x21,%al
8010219b:	75 b0                	jne    8010214d <ideintr+0x2d>
  asm volatile("cld; rep insl" :
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
{
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	83 ec 18             	sub    $0x18,%esp
  initlock(&idelock, "ide");
801021c6:	c7 44 24 04 6f 71 10 	movl   $0x8010716f,0x4(%esp)
801021cd:	80 
801021ce:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
801021d5:	e8 96 1f 00 00       	call   80104170 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
801021da:	a1 20 2d 11 80       	mov    0x80112d20,%eax
801021df:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
801021e6:	83 e8 01             	sub    $0x1,%eax
801021e9:	89 44 24 04          	mov    %eax,0x4(%esp)
801021ed:	e8 4e 00 00 00       	call   80102240 <ioapicenable>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801021f2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021f7:	90                   	nop
801021f8:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801021f9:	25 c0 00 00 00       	and    $0xc0,%eax
801021fe:	83 f8 40             	cmp    $0x40,%eax
80102201:	75 f5                	jne    801021f8 <ideinit+0x38>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102203:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102208:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010220d:	ee                   	out    %al,(%dx)
8010220e:	31 c9                	xor    %ecx,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102210:	b2 f7                	mov    $0xf7,%dl
80102212:	eb 0f                	jmp    80102223 <ideinit+0x63>
80102214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<1000; i++){
80102218:	83 c1 01             	add    $0x1,%ecx
8010221b:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
80102221:	74 0f                	je     80102232 <ideinit+0x72>
80102223:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102224:	84 c0                	test   %al,%al
80102226:	74 f0                	je     80102218 <ideinit+0x58>
      havedisk1 = 1;
80102228:	c7 05 b8 a5 10 80 01 	movl   $0x1,0x8010a5b8
8010222f:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102232:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102237:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010223c:	ee                   	out    %al,(%dx)
}
8010223d:	c9                   	leave  
8010223e:	c3                   	ret    
8010223f:	90                   	nop

80102240 <ioapicenable>:
80102240:	55                   	push   %ebp
80102241:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102247:	89 e5                	mov    %esp,%ebp
80102249:	8b 55 08             	mov    0x8(%ebp),%edx
8010224c:	53                   	push   %ebx
8010224d:	8b 45 0c             	mov    0xc(%ebp),%eax
80102250:	8d 5a 20             	lea    0x20(%edx),%ebx
80102253:	8d 54 12 10          	lea    0x10(%edx,%edx,1),%edx
80102257:	89 11                	mov    %edx,(%ecx)
80102259:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010225f:	83 c2 01             	add    $0x1,%edx
80102262:	c1 e0 18             	shl    $0x18,%eax
80102265:	89 59 10             	mov    %ebx,0x10(%ecx)
80102268:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010226e:	89 11                	mov    %edx,(%ecx)
80102270:	8b 15 54 26 11 80    	mov    0x80112654,%edx
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
8010228d:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80102294:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
8010229b:	00 00 00 
8010229e:	8b 35 10 00 c0 fe    	mov    0xfec00010,%esi
801022a4:	c7 05 00 00 c0 fe 00 	movl   $0x0,0xfec00000
801022ab:	00 00 00 
801022ae:	a1 10 00 c0 fe       	mov    0xfec00010,%eax
801022b3:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
801022ba:	00 c0 fe 
801022bd:	c1 ee 10             	shr    $0x10,%esi
801022c0:	c1 e8 18             	shr    $0x18,%eax
801022c3:	81 e6 ff 00 00 00    	and    $0xff,%esi
801022c9:	39 c2                	cmp    %eax,%edx
801022cb:	74 12                	je     801022df <ioapicinit+0x5f>
801022cd:	c7 04 24 74 71 10 80 	movl   $0x80107174,(%esp)
801022d4:	e8 77 e5 ff ff       	call   80100850 <cprintf>
801022d9:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
801022df:	ba 10 00 00 00       	mov    $0x10,%edx
801022e4:	31 c0                	xor    %eax,%eax
801022e6:	eb 06                	jmp    801022ee <ioapicinit+0x6e>
801022e8:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
801022ee:	89 13                	mov    %edx,(%ebx)
801022f0:	8b 1d 54 26 11 80    	mov    0x80112654,%ebx
801022f6:	8d 48 20             	lea    0x20(%eax),%ecx
801022f9:	81 c9 00 00 01 00    	or     $0x10000,%ecx
801022ff:	83 c0 01             	add    $0x1,%eax
80102302:	89 4b 10             	mov    %ecx,0x10(%ebx)
80102305:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010230b:	8d 5a 01             	lea    0x1(%edx),%ebx
8010230e:	83 c2 02             	add    $0x2,%edx
80102311:	39 c6                	cmp    %eax,%esi
80102313:	89 19                	mov    %ebx,(%ecx)
80102315:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
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
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102330:	55                   	push   %ebp
80102331:	89 e5                	mov    %esp,%ebp
80102333:	53                   	push   %ebx
80102334:	83 ec 14             	sub    $0x14,%esp
  struct run *r;

  if(kmem.use_lock)
80102337:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010233d:	85 d2                	test   %edx,%edx
8010233f:	75 2f                	jne    80102370 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102341:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
80102347:	85 db                	test   %ebx,%ebx
80102349:	74 07                	je     80102352 <kalloc+0x22>
    kmem.freelist = r->next;
8010234b:	8b 03                	mov    (%ebx),%eax
8010234d:	a3 98 26 11 80       	mov    %eax,0x80112698
  if(kmem.use_lock)
80102352:	a1 94 26 11 80       	mov    0x80112694,%eax
80102357:	85 c0                	test   %eax,%eax
80102359:	74 0c                	je     80102367 <kalloc+0x37>
    release(&kmem.lock);
8010235b:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
80102362:	e8 89 1f 00 00       	call   801042f0 <release>
  return (char*)r;
}
80102367:	89 d8                	mov    %ebx,%eax
80102369:	83 c4 14             	add    $0x14,%esp
8010236c:	5b                   	pop    %ebx
8010236d:	5d                   	pop    %ebp
8010236e:	c3                   	ret    
8010236f:	90                   	nop
    acquire(&kmem.lock);
80102370:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
80102377:	e8 c4 1f 00 00       	call   80104340 <acquire>
8010237c:	eb c3                	jmp    80102341 <kalloc+0x11>
8010237e:	66 90                	xchg   %ax,%ax

80102380 <kfree>:
{
80102380:	55                   	push   %ebp
80102381:	89 e5                	mov    %esp,%ebp
80102383:	53                   	push   %ebx
80102384:	83 ec 14             	sub    $0x14,%esp
80102387:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010238a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102390:	75 7c                	jne    8010240e <kfree+0x8e>
80102392:	81 fb c8 57 11 80    	cmp    $0x801157c8,%ebx
80102398:	72 74                	jb     8010240e <kfree+0x8e>
8010239a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801023a0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801023a5:	77 67                	ja     8010240e <kfree+0x8e>
  memset(v, 1, PGSIZE);
801023a7:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801023ae:	00 
801023af:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801023b6:	00 
801023b7:	89 1c 24             	mov    %ebx,(%esp)
801023ba:	e8 f1 1f 00 00       	call   801043b0 <memset>
  if(kmem.use_lock)
801023bf:	a1 94 26 11 80       	mov    0x80112694,%eax
801023c4:	85 c0                	test   %eax,%eax
801023c6:	75 38                	jne    80102400 <kfree+0x80>
  r->next = kmem.freelist;
801023c8:	a1 98 26 11 80       	mov    0x80112698,%eax
801023cd:	89 03                	mov    %eax,(%ebx)
  if(kmem.use_lock)
801023cf:	8b 0d 94 26 11 80    	mov    0x80112694,%ecx
  kmem.freelist = r;
801023d5:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
  if(kmem.use_lock)
801023db:	85 c9                	test   %ecx,%ecx
801023dd:	75 09                	jne    801023e8 <kfree+0x68>
}
801023df:	83 c4 14             	add    $0x14,%esp
801023e2:	5b                   	pop    %ebx
801023e3:	5d                   	pop    %ebp
801023e4:	c3                   	ret    
801023e5:	8d 76 00             	lea    0x0(%esi),%esi
    release(&kmem.lock);
801023e8:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
}
801023ef:	83 c4 14             	add    $0x14,%esp
801023f2:	5b                   	pop    %ebx
801023f3:	5d                   	pop    %ebp
    release(&kmem.lock);
801023f4:	e9 f7 1e 00 00       	jmp    801042f0 <release>
801023f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&kmem.lock);
80102400:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
80102407:	e8 34 1f 00 00       	call   80104340 <acquire>
8010240c:	eb ba                	jmp    801023c8 <kfree+0x48>
    panic("kfree");
8010240e:	c7 04 24 a6 71 10 80 	movl   $0x801071a6,(%esp)
80102415:	e8 96 df ff ff       	call   801003b0 <panic>
8010241a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102420 <freerange>:
{
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	56                   	push   %esi
80102424:	53                   	push   %ebx
80102425:	83 ec 10             	sub    $0x10,%esp
  p = (char*)PGROUNDUP((uint)vstart);
80102428:	8b 55 08             	mov    0x8(%ebp),%edx
{
8010242b:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010242e:	81 c2 ff 0f 00 00    	add    $0xfff,%edx
80102434:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010243a:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
80102440:	39 f3                	cmp    %esi,%ebx
80102442:	76 08                	jbe    8010244c <freerange+0x2c>
80102444:	eb 18                	jmp    8010245e <freerange+0x3e>
80102446:	66 90                	xchg   %ax,%ax
80102448:	89 da                	mov    %ebx,%edx
8010244a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010244c:	89 14 24             	mov    %edx,(%esp)
8010244f:	e8 2c ff ff ff       	call   80102380 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102454:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010245a:	39 f0                	cmp    %esi,%eax
8010245c:	76 ea                	jbe    80102448 <freerange+0x28>
}
8010245e:	83 c4 10             	add    $0x10,%esp
80102461:	5b                   	pop    %ebx
80102462:	5e                   	pop    %esi
80102463:	5d                   	pop    %ebp
80102464:	c3                   	ret    
80102465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
{
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	83 ec 18             	sub    $0x18,%esp
  freerange(vstart, vend);
80102476:	8b 45 0c             	mov    0xc(%ebp),%eax
80102479:	89 44 24 04          	mov    %eax,0x4(%esp)
8010247d:	8b 45 08             	mov    0x8(%ebp),%eax
80102480:	89 04 24             	mov    %eax,(%esp)
80102483:	e8 98 ff ff ff       	call   80102420 <freerange>
  kmem.use_lock = 1;
80102488:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
8010248f:	00 00 00 
}
80102492:	c9                   	leave  
80102493:	c3                   	ret    
80102494:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010249a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801024a0 <kinit1>:
{
801024a0:	55                   	push   %ebp
801024a1:	89 e5                	mov    %esp,%ebp
801024a3:	83 ec 18             	sub    $0x18,%esp
801024a6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801024a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801024ac:	89 75 fc             	mov    %esi,-0x4(%ebp)
801024af:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801024b2:	c7 44 24 04 ac 71 10 	movl   $0x801071ac,0x4(%esp)
801024b9:	80 
801024ba:	c7 04 24 60 26 11 80 	movl   $0x80112660,(%esp)
801024c1:	e8 aa 1c 00 00       	call   80104170 <initlock>
  kmem.use_lock = 0;
801024c6:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
801024cd:	00 00 00 
  freerange(vstart, vend);
801024d0:	89 75 0c             	mov    %esi,0xc(%ebp)
}
801024d3:	8b 75 fc             	mov    -0x4(%ebp),%esi
  freerange(vstart, vend);
801024d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801024d9:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801024dc:	89 ec                	mov    %ebp,%esp
801024de:	5d                   	pop    %ebp
  freerange(vstart, vend);
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
8010251d:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80102523:	89 c1                	mov    %eax,%ecx
80102525:	83 e1 7f             	and    $0x7f,%ecx
80102528:	f6 c2 40             	test   $0x40,%dl
8010252b:	0f 44 c1             	cmove  %ecx,%eax
8010252e:	0f b6 80 c0 71 10 80 	movzbl -0x7fef8e40(%eax),%eax
80102535:	83 c8 40             	or     $0x40,%eax
80102538:	0f b6 c0             	movzbl %al,%eax
8010253b:	f7 d0                	not    %eax
8010253d:	21 d0                	and    %edx,%eax
8010253f:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
80102544:	31 c0                	xor    %eax,%eax
80102546:	5d                   	pop    %ebp
80102547:	c3                   	ret    
80102548:	8b 0d bc a5 10 80    	mov    0x8010a5bc,%ecx
8010254e:	f6 c1 40             	test   $0x40,%cl
80102551:	74 05                	je     80102558 <kbdgetc+0x68>
80102553:	0c 80                	or     $0x80,%al
80102555:	83 e1 bf             	and    $0xffffffbf,%ecx
80102558:	0f b6 90 c0 71 10 80 	movzbl -0x7fef8e40(%eax),%edx
8010255f:	09 ca                	or     %ecx,%edx
80102561:	0f b6 88 c0 72 10 80 	movzbl -0x7fef8d40(%eax),%ecx
80102568:	31 ca                	xor    %ecx,%edx
8010256a:	89 d1                	mov    %edx,%ecx
8010256c:	83 e1 03             	and    $0x3,%ecx
8010256f:	8b 0c 8d c0 73 10 80 	mov    -0x7fef8c40(,%ecx,4),%ecx
80102576:	89 15 bc a5 10 80    	mov    %edx,0x8010a5bc
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
8010259a:	83 0d bc a5 10 80 40 	orl    $0x40,0x8010a5bc
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
801025e0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
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
801025fa:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801025ff:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102602:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102609:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010260c:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102611:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102614:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
8010261b:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
8010261e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102623:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102626:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010262d:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102630:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102635:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102638:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010263f:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102642:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102647:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010264a:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102651:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102654:	a1 9c 26 11 80       	mov    0x8011269c,%eax
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
80102675:	a1 9c 26 11 80       	mov    0x8011269c,%eax
8010267a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010267d:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102684:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102687:	a1 9c 26 11 80       	mov    0x8011269c,%eax
8010268c:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010268f:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102696:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102699:	a1 9c 26 11 80       	mov    0x8011269c,%eax
8010269e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026a1:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026a8:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026ab:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801026b0:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026b3:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026ba:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026bd:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801026c2:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026c5:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026cc:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026cf:	8b 0d 9c 26 11 80    	mov    0x8011269c,%ecx
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
801026f1:	a1 9c 26 11 80       	mov    0x8011269c,%eax
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
8010270a:	a1 9c 26 11 80       	mov    0x8011269c,%eax
8010270f:	8b 50 20             	mov    0x20(%eax),%edx
80102712:	e9 54 ff ff ff       	jmp    8010266b <lapicinit+0x8b>
80102717:	89 f6                	mov    %esi,%esi
80102719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102720 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
80102720:	8b 15 9c 26 11 80    	mov    0x8011269c,%edx
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
80102740:	a1 9c 26 11 80       	mov    0x8011269c,%eax
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
80102756:	a1 9c 26 11 80       	mov    0x8011269c,%eax
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
80102799:	a1 9c 26 11 80       	mov    0x8011269c,%eax
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
801027b6:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027bb:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027be:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027c5:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027c8:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027cd:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027d0:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027d7:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027da:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027df:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027e2:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027e8:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027ed:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027f0:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027f6:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027fb:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027fe:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102804:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102809:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010280c:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102812:	a1 9c 26 11 80       	mov    0x8011269c,%eax
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
80102947:	e8 c4 1a 00 00       	call   80104410 <memcmp>
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
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102a10:	55                   	push   %ebp
80102a11:	89 e5                	mov    %esp,%ebp
80102a13:	53                   	push   %ebx
80102a14:	83 ec 14             	sub    $0x14,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102a17:	a1 e8 26 11 80       	mov    0x801126e8,%eax
{
80102a1c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102a1f:	83 f8 1d             	cmp    $0x1d,%eax
80102a22:	7f 7e                	jg     80102aa2 <log_write+0x92>
80102a24:	8b 15 d8 26 11 80    	mov    0x801126d8,%edx
80102a2a:	83 ea 01             	sub    $0x1,%edx
80102a2d:	39 d0                	cmp    %edx,%eax
80102a2f:	7d 71                	jge    80102aa2 <log_write+0x92>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102a31:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102a36:	85 c0                	test   %eax,%eax
80102a38:	7e 74                	jle    80102aae <log_write+0x9e>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102a3a:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102a41:	e8 fa 18 00 00       	call   80104340 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102a46:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102a4c:	85 c9                	test   %ecx,%ecx
80102a4e:	7e 4b                	jle    80102a9b <log_write+0x8b>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102a50:	8b 53 08             	mov    0x8(%ebx),%edx
80102a53:	31 c0                	xor    %eax,%eax
80102a55:	39 15 ec 26 11 80    	cmp    %edx,0x801126ec
80102a5b:	75 0c                	jne    80102a69 <log_write+0x59>
80102a5d:	eb 11                	jmp    80102a70 <log_write+0x60>
80102a5f:	90                   	nop
80102a60:	3b 14 85 ec 26 11 80 	cmp    -0x7feed914(,%eax,4),%edx
80102a67:	74 07                	je     80102a70 <log_write+0x60>
  for (i = 0; i < log.lh.n; i++) {
80102a69:	83 c0 01             	add    $0x1,%eax
80102a6c:	39 c8                	cmp    %ecx,%eax
80102a6e:	7c f0                	jl     80102a60 <log_write+0x50>
      break;
  }
  log.lh.block[i] = b->blockno;
80102a70:	89 14 85 ec 26 11 80 	mov    %edx,-0x7feed914(,%eax,4)
  if (i == log.lh.n)
80102a77:	39 05 e8 26 11 80    	cmp    %eax,0x801126e8
80102a7d:	75 08                	jne    80102a87 <log_write+0x77>
    log.lh.n++;
80102a7f:	83 c0 01             	add    $0x1,%eax
80102a82:	a3 e8 26 11 80       	mov    %eax,0x801126e8
  b->flags |= B_DIRTY; // prevent eviction
80102a87:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102a8a:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
}
80102a91:	83 c4 14             	add    $0x14,%esp
80102a94:	5b                   	pop    %ebx
80102a95:	5d                   	pop    %ebp
  release(&log.lock);
80102a96:	e9 55 18 00 00       	jmp    801042f0 <release>
  for (i = 0; i < log.lh.n; i++) {
80102a9b:	8b 53 08             	mov    0x8(%ebx),%edx
80102a9e:	31 c0                	xor    %eax,%eax
80102aa0:	eb ce                	jmp    80102a70 <log_write+0x60>
    panic("too big a transaction");
80102aa2:	c7 04 24 d0 73 10 80 	movl   $0x801073d0,(%esp)
80102aa9:	e8 02 d9 ff ff       	call   801003b0 <panic>
    panic("log_write outside of trans");
80102aae:	c7 04 24 e6 73 10 80 	movl   $0x801073e6,(%esp)
80102ab5:	e8 f6 d8 ff ff       	call   801003b0 <panic>
80102aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102ac0 <install_trans>:
{
80102ac0:	55                   	push   %ebp
80102ac1:	89 e5                	mov    %esp,%ebp
80102ac3:	57                   	push   %edi
80102ac4:	56                   	push   %esi
80102ac5:	53                   	push   %ebx
80102ac6:	83 ec 1c             	sub    $0x1c,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
80102ac9:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102acf:	85 d2                	test   %edx,%edx
80102ad1:	7e 78                	jle    80102b4b <install_trans+0x8b>
80102ad3:	31 db                	xor    %ebx,%ebx
80102ad5:	8d 76 00             	lea    0x0(%esi),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102ad8:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102add:	8d 44 03 01          	lea    0x1(%ebx,%eax,1),%eax
80102ae1:	89 44 24 04          	mov    %eax,0x4(%esp)
80102ae5:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102aea:	89 04 24             	mov    %eax,(%esp)
80102aed:	e8 1e d6 ff ff       	call   80100110 <bread>
80102af2:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102af4:	8b 04 9d ec 26 11 80 	mov    -0x7feed914(,%ebx,4),%eax
  for (tail = 0; tail < log.lh.n; tail++) {
80102afb:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102afe:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b02:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102b07:	89 04 24             	mov    %eax,(%esp)
80102b0a:	e8 01 d6 ff ff       	call   80100110 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102b0f:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102b16:	00 
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102b17:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102b19:	8d 47 5c             	lea    0x5c(%edi),%eax
80102b1c:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b20:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b23:	89 04 24             	mov    %eax,(%esp)
80102b26:	e8 45 19 00 00       	call   80104470 <memmove>
    bwrite(dbuf);  // write dst to disk
80102b2b:	89 34 24             	mov    %esi,(%esp)
80102b2e:	e8 9d d5 ff ff       	call   801000d0 <bwrite>
    brelse(lbuf);
80102b33:	89 3c 24             	mov    %edi,(%esp)
80102b36:	e8 05 d5 ff ff       	call   80100040 <brelse>
    brelse(dbuf);
80102b3b:	89 34 24             	mov    %esi,(%esp)
80102b3e:	e8 fd d4 ff ff       	call   80100040 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102b43:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102b49:	7f 8d                	jg     80102ad8 <install_trans+0x18>
}
80102b4b:	83 c4 1c             	add    $0x1c,%esp
80102b4e:	5b                   	pop    %ebx
80102b4f:	5e                   	pop    %esi
80102b50:	5f                   	pop    %edi
80102b51:	5d                   	pop    %ebp
80102b52:	c3                   	ret    
80102b53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b60 <write_head>:
{
80102b60:	55                   	push   %ebp
80102b61:	89 e5                	mov    %esp,%ebp
80102b63:	56                   	push   %esi
80102b64:	53                   	push   %ebx
80102b65:	83 ec 10             	sub    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102b68:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102b6d:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b71:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102b76:	89 04 24             	mov    %eax,(%esp)
80102b79:	e8 92 d5 ff ff       	call   80100110 <bread>
80102b7e:	89 c6                	mov    %eax,%esi
  struct logheader *hb = (struct logheader *) (buf->data);
80102b80:	8d 58 5c             	lea    0x5c(%eax),%ebx
  hb->n = log.lh.n;
80102b83:	a1 e8 26 11 80       	mov    0x801126e8,%eax
80102b88:	89 46 5c             	mov    %eax,0x5c(%esi)
  for (i = 0; i < log.lh.n; i++) {
80102b8b:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102b91:	85 c9                	test   %ecx,%ecx
80102b93:	7e 19                	jle    80102bae <write_head+0x4e>
80102b95:	31 d2                	xor    %edx,%edx
80102b97:	90                   	nop
    hb->block[i] = log.lh.block[i];
80102b98:	8b 0c 95 ec 26 11 80 	mov    -0x7feed914(,%edx,4),%ecx
80102b9f:	89 4c 93 04          	mov    %ecx,0x4(%ebx,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102ba3:	83 c2 01             	add    $0x1,%edx
80102ba6:	39 15 e8 26 11 80    	cmp    %edx,0x801126e8
80102bac:	7f ea                	jg     80102b98 <write_head+0x38>
  bwrite(buf);
80102bae:	89 34 24             	mov    %esi,(%esp)
80102bb1:	e8 1a d5 ff ff       	call   801000d0 <bwrite>
  brelse(buf);
80102bb6:	89 34 24             	mov    %esi,(%esp)
80102bb9:	e8 82 d4 ff ff       	call   80100040 <brelse>
}
80102bbe:	83 c4 10             	add    $0x10,%esp
80102bc1:	5b                   	pop    %ebx
80102bc2:	5e                   	pop    %esi
80102bc3:	5d                   	pop    %ebp
80102bc4:	c3                   	ret    
80102bc5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bd0 <end_op>:
{
80102bd0:	55                   	push   %ebp
80102bd1:	89 e5                	mov    %esp,%ebp
80102bd3:	57                   	push   %edi
80102bd4:	56                   	push   %esi
80102bd5:	53                   	push   %ebx
80102bd6:	83 ec 1c             	sub    $0x1c,%esp
  acquire(&log.lock);
80102bd9:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102be0:	e8 5b 17 00 00       	call   80104340 <acquire>
  log.outstanding -= 1;
80102be5:	a1 dc 26 11 80       	mov    0x801126dc,%eax
  if(log.committing)
80102bea:	8b 3d e0 26 11 80    	mov    0x801126e0,%edi
  log.outstanding -= 1;
80102bf0:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102bf3:	85 ff                	test   %edi,%edi
  log.outstanding -= 1;
80102bf5:	a3 dc 26 11 80       	mov    %eax,0x801126dc
  if(log.committing)
80102bfa:	0f 85 f2 00 00 00    	jne    80102cf2 <end_op+0x122>
  if(log.outstanding == 0){
80102c00:	85 c0                	test   %eax,%eax
80102c02:	0f 85 ca 00 00 00    	jne    80102cd2 <end_op+0x102>
    log.committing = 1;
80102c08:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c0f:	00 00 00 
  release(&log.lock);
80102c12:	31 db                	xor    %ebx,%ebx
80102c14:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102c1b:	e8 d0 16 00 00       	call   801042f0 <release>
  if (log.lh.n > 0) {
80102c20:	8b 35 e8 26 11 80    	mov    0x801126e8,%esi
80102c26:	85 f6                	test   %esi,%esi
80102c28:	0f 8e 8e 00 00 00    	jle    80102cbc <end_op+0xec>
80102c2e:	66 90                	xchg   %ax,%ax
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c30:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102c35:	8d 44 03 01          	lea    0x1(%ebx,%eax,1),%eax
80102c39:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c3d:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102c42:	89 04 24             	mov    %eax,(%esp)
80102c45:	e8 c6 d4 ff ff       	call   80100110 <bread>
80102c4a:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c4c:	8b 04 9d ec 26 11 80 	mov    -0x7feed914(,%ebx,4),%eax
  for (tail = 0; tail < log.lh.n; tail++) {
80102c53:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c56:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c5a:	a1 e4 26 11 80       	mov    0x801126e4,%eax
80102c5f:	89 04 24             	mov    %eax,(%esp)
80102c62:	e8 a9 d4 ff ff       	call   80100110 <bread>
    memmove(to->data, from->data, BSIZE);
80102c67:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102c6e:	00 
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c6f:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c71:	83 c0 5c             	add    $0x5c,%eax
80102c74:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c78:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c7b:	89 04 24             	mov    %eax,(%esp)
80102c7e:	e8 ed 17 00 00       	call   80104470 <memmove>
    bwrite(to);  // write the log
80102c83:	89 34 24             	mov    %esi,(%esp)
80102c86:	e8 45 d4 ff ff       	call   801000d0 <bwrite>
    brelse(from);
80102c8b:	89 3c 24             	mov    %edi,(%esp)
80102c8e:	e8 ad d3 ff ff       	call   80100040 <brelse>
    brelse(to);
80102c93:	89 34 24             	mov    %esi,(%esp)
80102c96:	e8 a5 d3 ff ff       	call   80100040 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102c9b:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102ca1:	7c 8d                	jl     80102c30 <end_op+0x60>
    write_head();    // Write header to disk -- the real commit
80102ca3:	e8 b8 fe ff ff       	call   80102b60 <write_head>
    install_trans(); // Now install writes to home locations
80102ca8:	e8 13 fe ff ff       	call   80102ac0 <install_trans>
    log.lh.n = 0;
80102cad:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102cb4:	00 00 00 
    write_head();    // Erase the transaction from the log
80102cb7:	e8 a4 fe ff ff       	call   80102b60 <write_head>
    acquire(&log.lock);
80102cbc:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102cc3:	e8 78 16 00 00       	call   80104340 <acquire>
    log.committing = 0;
80102cc8:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102ccf:	00 00 00 
    wakeup(&log);
80102cd2:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102cd9:	e8 c2 09 00 00       	call   801036a0 <wakeup>
    release(&log.lock);
80102cde:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102ce5:	e8 06 16 00 00       	call   801042f0 <release>
}
80102cea:	83 c4 1c             	add    $0x1c,%esp
80102ced:	5b                   	pop    %ebx
80102cee:	5e                   	pop    %esi
80102cef:	5f                   	pop    %edi
80102cf0:	5d                   	pop    %ebp
80102cf1:	c3                   	ret    
    panic("log.committing");
80102cf2:	c7 04 24 01 74 10 80 	movl   $0x80107401,(%esp)
80102cf9:	e8 b2 d6 ff ff       	call   801003b0 <panic>
80102cfe:	66 90                	xchg   %ax,%ax

80102d00 <begin_op>:
{
80102d00:	55                   	push   %ebp
80102d01:	89 e5                	mov    %esp,%ebp
80102d03:	83 ec 18             	sub    $0x18,%esp
  acquire(&log.lock);
80102d06:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d0d:	e8 2e 16 00 00       	call   80104340 <acquire>
80102d12:	eb 18                	jmp    80102d2c <begin_op+0x2c>
80102d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      sleep(&log, &log.lock);
80102d18:	c7 44 24 04 a0 26 11 	movl   $0x801126a0,0x4(%esp)
80102d1f:	80 
80102d20:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d27:	e8 a4 0f 00 00       	call   80103cd0 <sleep>
    if(log.committing){
80102d2c:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102d31:	85 c0                	test   %eax,%eax
80102d33:	75 e3                	jne    80102d18 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102d35:	8b 15 dc 26 11 80    	mov    0x801126dc,%edx
80102d3b:	83 c2 01             	add    $0x1,%edx
80102d3e:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102d41:	01 c0                	add    %eax,%eax
80102d43:	03 05 e8 26 11 80    	add    0x801126e8,%eax
80102d49:	83 f8 1e             	cmp    $0x1e,%eax
80102d4c:	7f ca                	jg     80102d18 <begin_op+0x18>
      release(&log.lock);
80102d4e:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
      log.outstanding += 1;
80102d55:	89 15 dc 26 11 80    	mov    %edx,0x801126dc
      release(&log.lock);
80102d5b:	e8 90 15 00 00       	call   801042f0 <release>
}
80102d60:	c9                   	leave  
80102d61:	c3                   	ret    
80102d62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102d70 <initlog>:
{
80102d70:	55                   	push   %ebp
80102d71:	89 e5                	mov    %esp,%ebp
80102d73:	56                   	push   %esi
80102d74:	53                   	push   %ebx
80102d75:	83 ec 30             	sub    $0x30,%esp
80102d78:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102d7b:	c7 44 24 04 10 74 10 	movl   $0x80107410,0x4(%esp)
80102d82:	80 
80102d83:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d8a:	e8 e1 13 00 00       	call   80104170 <initlock>
  readsb(dev, &sb);
80102d8f:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102d92:	89 44 24 04          	mov    %eax,0x4(%esp)
80102d96:	89 1c 24             	mov    %ebx,(%esp)
80102d99:	e8 12 e6 ff ff       	call   801013b0 <readsb>
  log.start = sb.logstart;
80102d9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  log.size = sb.nlog;
80102da1:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.dev = dev;
80102da4:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4
  struct buf *buf = bread(log.dev, log.start);
80102daa:	89 1c 24             	mov    %ebx,(%esp)
  log.start = sb.logstart;
80102dad:	a3 d4 26 11 80       	mov    %eax,0x801126d4
  log.size = sb.nlog;
80102db2:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
  struct buf *buf = bread(log.dev, log.start);
80102db8:	89 44 24 04          	mov    %eax,0x4(%esp)
80102dbc:	e8 4f d3 ff ff       	call   80100110 <bread>
  log.lh.n = lh->n;
80102dc1:	8b 58 5c             	mov    0x5c(%eax),%ebx
  struct logheader *lh = (struct logheader *) (buf->data);
80102dc4:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102dc7:	85 db                	test   %ebx,%ebx
  log.lh.n = lh->n;
80102dc9:	89 1d e8 26 11 80    	mov    %ebx,0x801126e8
  for (i = 0; i < log.lh.n; i++) {
80102dcf:	7e 19                	jle    80102dea <initlog+0x7a>
80102dd1:	31 d2                	xor    %edx,%edx
80102dd3:	90                   	nop
80102dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    log.lh.block[i] = lh->block[i];
80102dd8:	8b 4c 96 04          	mov    0x4(%esi,%edx,4),%ecx
80102ddc:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102de3:	83 c2 01             	add    $0x1,%edx
80102de6:	39 da                	cmp    %ebx,%edx
80102de8:	75 ee                	jne    80102dd8 <initlog+0x68>
  brelse(buf);
80102dea:	89 04 24             	mov    %eax,(%esp)
80102ded:	e8 4e d2 ff ff       	call   80100040 <brelse>
  install_trans(); // if committed, copy from log to disk
80102df2:	e8 c9 fc ff ff       	call   80102ac0 <install_trans>
  log.lh.n = 0;
80102df7:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102dfe:	00 00 00 
  write_head(); // clear the log
80102e01:	e8 5a fd ff ff       	call   80102b60 <write_head>
}
80102e06:	83 c4 30             	add    $0x30,%esp
80102e09:	5b                   	pop    %ebx
80102e0a:	5e                   	pop    %esi
80102e0b:	5d                   	pop    %ebp
80102e0c:	c3                   	ret    
80102e0d:	66 90                	xchg   %ax,%ax
80102e0f:	90                   	nop

80102e10 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e10:	55                   	push   %ebp
80102e11:	89 e5                	mov    %esp,%ebp
80102e13:	53                   	push   %ebx
80102e14:	83 ec 14             	sub    $0x14,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102e17:	e8 d4 11 00 00       	call   80103ff0 <cpuid>
80102e1c:	89 c3                	mov    %eax,%ebx
80102e1e:	e8 cd 11 00 00       	call   80103ff0 <cpuid>
80102e23:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80102e27:	c7 04 24 14 74 10 80 	movl   $0x80107414,(%esp)
80102e2e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102e32:	e8 19 da ff ff       	call   80100850 <cprintf>
  idtinit();       // load idt register
80102e37:	e8 94 27 00 00       	call   801055d0 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e3c:	e8 0f 0b 00 00       	call   80103950 <mycpu>
80102e41:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e43:	b8 01 00 00 00       	mov    $0x1,%eax
80102e48:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e4f:	e8 7c 0b 00 00       	call   801039d0 <scheduler>
80102e54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102e60 <main>:
{
80102e60:	55                   	push   %ebp
80102e61:	89 e5                	mov    %esp,%ebp
80102e63:	83 e4 f0             	and    $0xfffffff0,%esp
80102e66:	53                   	push   %ebx
80102e67:	83 ec 1c             	sub    $0x1c,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e6a:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80102e71:	80 
80102e72:	c7 04 24 c8 57 11 80 	movl   $0x801157c8,(%esp)
80102e79:	e8 22 f6 ff ff       	call   801024a0 <kinit1>
  kvmalloc();      // kernel page table
80102e7e:	e8 dd 3b 00 00       	call   80106a60 <kvmalloc>
  mpinit();        // detect other processors
80102e83:	e8 98 01 00 00       	call   80103020 <mpinit>
  lapicinit();     // interrupt controller
80102e88:	e8 53 f7 ff ff       	call   801025e0 <lapicinit>
80102e8d:	8d 76 00             	lea    0x0(%esi),%esi
  seginit();       // segment descriptors
80102e90:	e8 cb 3f 00 00       	call   80106e60 <seginit>
  picinit();       // disable pic
80102e95:	e8 26 03 00 00       	call   801031c0 <picinit>
  ioapicinit();    // another interrupt controller
80102e9a:	e8 e1 f3 ff ff       	call   80102280 <ioapicinit>
80102e9f:	90                   	nop
  consoleinit();   // console hardware
80102ea0:	e8 cb d3 ff ff       	call   80100270 <consoleinit>
  uartinit();      // serial port
80102ea5:	e8 e6 2b 00 00       	call   80105a90 <uartinit>
  pinit();         // process table
80102eaa:	e8 61 11 00 00       	call   80104010 <pinit>
80102eaf:	90                   	nop
  tvinit();        // trap vectors
80102eb0:	e8 ab 2a 00 00       	call   80105960 <tvinit>
  binit();         // buffer cache
80102eb5:	e8 26 d3 ff ff       	call   801001e0 <binit>
  fileinit();      // file table
80102eba:	e8 71 e2 ff ff       	call   80101130 <fileinit>
80102ebf:	90                   	nop
  ideinit();       // disk 
80102ec0:	e8 fb f2 ff ff       	call   801021c0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ec5:	c7 44 24 08 8a 00 00 	movl   $0x8a,0x8(%esp)
80102ecc:	00 
80102ecd:	c7 44 24 04 8c a4 10 	movl   $0x8010a48c,0x4(%esp)
80102ed4:	80 
80102ed5:	c7 04 24 00 70 00 80 	movl   $0x80007000,(%esp)
80102edc:	e8 8f 15 00 00       	call   80104470 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102ee1:	69 05 20 2d 11 80 b0 	imul   $0xb0,0x80112d20,%eax
80102ee8:	00 00 00 
80102eeb:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102ef0:	3d a0 27 11 80       	cmp    $0x801127a0,%eax
80102ef5:	76 6c                	jbe    80102f63 <main+0x103>
80102ef7:	bb a0 27 11 80       	mov    $0x801127a0,%ebx
80102efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102f00:	e8 4b 0a 00 00       	call   80103950 <mycpu>
80102f05:	39 d8                	cmp    %ebx,%eax
80102f07:	74 41                	je     80102f4a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f09:	e8 22 f4 ff ff       	call   80102330 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void(**)(void))(code-8) = mpenter;
80102f0e:	c7 05 f8 6f 00 80 90 	movl   $0x80102f90,0x80006ff8
80102f15:	2f 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f18:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f1f:	90 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f22:	05 00 10 00 00       	add    $0x1000,%eax
80102f27:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
80102f2c:	0f b6 03             	movzbl (%ebx),%eax
80102f2f:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
80102f36:	00 
80102f37:	89 04 24             	mov    %eax,(%esp)
80102f3a:	e8 31 f8 ff ff       	call   80102770 <lapicstartap>
80102f3f:	90                   	nop

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f40:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f46:	85 c0                	test   %eax,%eax
80102f48:	74 f6                	je     80102f40 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
80102f4a:	69 05 20 2d 11 80 b0 	imul   $0xb0,0x80112d20,%eax
80102f51:	00 00 00 
80102f54:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f5a:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f5f:	39 c3                	cmp    %eax,%ebx
80102f61:	72 9d                	jb     80102f00 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f63:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80102f6a:	8e 
80102f6b:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80102f72:	e8 f9 f4 ff ff       	call   80102470 <kinit2>
  userinit();      // first user process
80102f77:	e8 d4 08 00 00       	call   80103850 <userinit>
  mpmain();        // finish this processor's setup
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
{
80102f90:	55                   	push   %ebp
80102f91:	89 e5                	mov    %esp,%ebp
80102f93:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102f96:	e8 05 36 00 00       	call   801065a0 <switchkvm>
  seginit();
80102f9b:	e8 c0 3e 00 00       	call   80106e60 <seginit>
  lapicinit();
80102fa0:	e8 3b f6 ff ff       	call   801025e0 <lapicinit>
  mpmain();
80102fa5:	e8 66 fe ff ff       	call   80102e10 <mpmain>
80102faa:	66 90                	xchg   %ax,%ax
80102fac:	66 90                	xchg   %ax,%ax
80102fae:	66 90                	xchg   %ax,%ax

80102fb0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102fb0:	55                   	push   %ebp
80102fb1:	89 e5                	mov    %esp,%ebp
80102fb3:	56                   	push   %esi
80102fb4:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
80102fb5:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
{
80102fbb:	83 ec 10             	sub    $0x10,%esp
  e = addr+len;
80102fbe:	8d 34 13             	lea    (%ebx,%edx,1),%esi
  for(p = addr; p < e; p += sizeof(struct mp))
80102fc1:	39 f3                	cmp    %esi,%ebx
80102fc3:	73 3c                	jae    80103001 <mpsearch1+0x51>
80102fc5:	8d 76 00             	lea    0x0(%esi),%esi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fc8:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80102fcf:	00 
80102fd0:	c7 44 24 04 28 74 10 	movl   $0x80107428,0x4(%esp)
80102fd7:	80 
80102fd8:	89 1c 24             	mov    %ebx,(%esp)
80102fdb:	e8 30 14 00 00       	call   80104410 <memcmp>
80102fe0:	85 c0                	test   %eax,%eax
80102fe2:	75 16                	jne    80102ffa <mpsearch1+0x4a>
80102fe4:	31 d2                	xor    %edx,%edx
80102fe6:	66 90                	xchg   %ax,%ax
    sum += addr[i];
80102fe8:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
  for(i=0; i<len; i++)
80102fec:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
80102fef:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
80102ff1:	83 f8 10             	cmp    $0x10,%eax
80102ff4:	75 f2                	jne    80102fe8 <mpsearch1+0x38>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102ff6:	84 d2                	test   %dl,%dl
80102ff8:	74 10                	je     8010300a <mpsearch1+0x5a>
  for(p = addr; p < e; p += sizeof(struct mp))
80102ffa:	83 c3 10             	add    $0x10,%ebx
80102ffd:	39 de                	cmp    %ebx,%esi
80102fff:	77 c7                	ja     80102fc8 <mpsearch1+0x18>
      return (struct mp*)p;
  return 0;
}
80103001:	83 c4 10             	add    $0x10,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80103004:	31 c0                	xor    %eax,%eax
}
80103006:	5b                   	pop    %ebx
80103007:	5e                   	pop    %esi
80103008:	5d                   	pop    %ebp
80103009:	c3                   	ret    
8010300a:	83 c4 10             	add    $0x10,%esp
      return (struct mp*)p;
8010300d:	89 d8                	mov    %ebx,%eax
}
8010300f:	5b                   	pop    %ebx
80103010:	5e                   	pop    %esi
80103011:	5d                   	pop    %ebp
80103012:	c3                   	ret    
80103013:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103020 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103020:	55                   	push   %ebp
80103021:	89 e5                	mov    %esp,%ebp
80103023:	57                   	push   %edi
80103024:	56                   	push   %esi
80103025:	53                   	push   %ebx
80103026:	83 ec 2c             	sub    $0x2c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103029:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103030:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103037:	c1 e0 08             	shl    $0x8,%eax
8010303a:	09 d0                	or     %edx,%eax
8010303c:	c1 e0 04             	shl    $0x4,%eax
8010303f:	85 c0                	test   %eax,%eax
80103041:	75 1b                	jne    8010305e <mpinit+0x3e>
    if((mp = mpsearch1(p-1024, 1024)))
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
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103072:	8b 77 04             	mov    0x4(%edi),%esi
80103075:	85 f6                	test   %esi,%esi
80103077:	75 0c                	jne    80103085 <mpinit+0x65>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
80103079:	c7 04 24 32 74 10 80 	movl   $0x80107432,(%esp)
80103080:	e8 2b d3 ff ff       	call   801003b0 <panic>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103085:	8d 9e 00 00 00 80    	lea    -0x80000000(%esi),%ebx
  if(memcmp(conf, "PCMP", 4) != 0)
8010308b:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80103092:	00 
80103093:	c7 44 24 04 2d 74 10 	movl   $0x8010742d,0x4(%esp)
8010309a:	80 
8010309b:	89 1c 24             	mov    %ebx,(%esp)
8010309e:	e8 6d 13 00 00       	call   80104410 <memcmp>
801030a3:	85 c0                	test   %eax,%eax
801030a5:	75 d2                	jne    80103079 <mpinit+0x59>
  if(conf->version != 1 && conf->version != 4)
801030a7:	0f b6 43 06          	movzbl 0x6(%ebx),%eax
801030ab:	3c 04                	cmp    $0x4,%al
801030ad:	74 04                	je     801030b3 <mpinit+0x93>
801030af:	3c 01                	cmp    $0x1,%al
801030b1:	75 c6                	jne    80103079 <mpinit+0x59>
mpinit(void)
801030b3:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
  if(sum((uchar*)conf, conf->length) != 0)
801030b7:	89 d8                	mov    %ebx,%eax
mpinit(void)
801030b9:	8d 8c 16 00 00 00 80 	lea    -0x80000000(%esi,%edx,1),%ecx
801030c0:	31 d2                	xor    %edx,%edx
801030c2:	eb 08                	jmp    801030cc <mpinit+0xac>
    sum += addr[i];
801030c4:	0f b6 30             	movzbl (%eax),%esi
801030c7:	83 c0 01             	add    $0x1,%eax
801030ca:	01 f2                	add    %esi,%edx
  for(i=0; i<len; i++)
801030cc:	39 c8                	cmp    %ecx,%eax
801030ce:	75 f4                	jne    801030c4 <mpinit+0xa4>
  if(sum((uchar*)conf, conf->length) != 0)
801030d0:	84 d2                	test   %dl,%dl
801030d2:	75 a5                	jne    80103079 <mpinit+0x59>
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801030d4:	8b 43 24             	mov    0x24(%ebx),%eax
801030d7:	a3 9c 26 11 80       	mov    %eax,0x8011269c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030dc:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
801030e0:	8d 43 2c             	lea    0x2c(%ebx),%eax
801030e3:	8d 14 13             	lea    (%ebx,%edx,1),%edx
801030e6:	bb 01 00 00 00       	mov    $0x1,%ebx
801030eb:	90                   	nop
801030ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801030f0:	39 d0                	cmp    %edx,%eax
801030f2:	73 4b                	jae    8010313f <mpinit+0x11f>
801030f4:	0f b6 08             	movzbl (%eax),%ecx
    switch(*p){
801030f7:	80 f9 04             	cmp    $0x4,%cl
801030fa:	76 07                	jbe    80103103 <mpinit+0xe3>
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030fc:	31 db                	xor    %ebx,%ebx
    switch(*p){
801030fe:	80 f9 04             	cmp    $0x4,%cl
80103101:	77 f9                	ja     801030fc <mpinit+0xdc>
80103103:	0f b6 c9             	movzbl %cl,%ecx
80103106:	ff 24 8d 6c 74 10 80 	jmp    *-0x7fef8b94(,%ecx,4)
  return mpsearch1(0xF0000, 0x10000);
8010310d:	ba 00 00 01 00       	mov    $0x10000,%edx
80103112:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103117:	e8 94 fe ff ff       	call   80102fb0 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010311c:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
8010311e:	89 c7                	mov    %eax,%edi
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103120:	0f 85 4c ff ff ff    	jne    80103072 <mpinit+0x52>
    panic("Expect to run on an SMP");
80103126:	c7 04 24 32 74 10 80 	movl   $0x80107432,(%esp)
8010312d:	e8 7e d2 ff ff       	call   801003b0 <panic>
80103132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103138:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010313b:	39 d0                	cmp    %edx,%eax
8010313d:	72 b5                	jb     801030f4 <mpinit+0xd4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
8010313f:	85 db                	test   %ebx,%ebx
80103141:	74 6f                	je     801031b2 <mpinit+0x192>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
80103143:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
80103147:	74 12                	je     8010315b <mpinit+0x13b>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103149:	ba 22 00 00 00       	mov    $0x22,%edx
8010314e:	b8 70 00 00 00       	mov    $0x70,%eax
80103153:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103154:	b2 23                	mov    $0x23,%dl
80103156:	ec                   	in     (%dx),%al
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103157:	83 c8 01             	or     $0x1,%eax
8010315a:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010315b:	83 c4 2c             	add    $0x2c,%esp
8010315e:	5b                   	pop    %ebx
8010315f:	5e                   	pop    %esi
80103160:	5f                   	pop    %edi
80103161:	5d                   	pop    %ebp
80103162:	c3                   	ret    
80103163:	90                   	nop
80103164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(ncpu < NCPU) {
80103168:	8b 0d 20 2d 11 80    	mov    0x80112d20,%ecx
8010316e:	83 f9 07             	cmp    $0x7,%ecx
80103171:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103174:	7f 1c                	jg     80103192 <mpinit+0x172>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103176:	69 f1 b0 00 00 00    	imul   $0xb0,%ecx,%esi
8010317c:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
80103180:	88 8e a0 27 11 80    	mov    %cl,-0x7feed860(%esi)
        ncpu++;
80103186:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103189:	83 c1 01             	add    $0x1,%ecx
8010318c:	89 0d 20 2d 11 80    	mov    %ecx,0x80112d20
      p += sizeof(struct mpproc);
80103192:	83 c0 14             	add    $0x14,%eax
      continue;
80103195:	e9 56 ff ff ff       	jmp    801030f0 <mpinit+0xd0>
8010319a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ioapicid = ioapic->apicno;
801031a0:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
      p += sizeof(struct mpioapic);
801031a4:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
801031a7:	88 0d 80 27 11 80    	mov    %cl,0x80112780
      continue;
801031ad:	e9 3e ff ff ff       	jmp    801030f0 <mpinit+0xd0>
    panic("Didn't find a suitable machine");
801031b2:	c7 04 24 4c 74 10 80 	movl   $0x8010744c,(%esp)
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
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
801031e0:	55                   	push   %ebp
801031e1:	89 e5                	mov    %esp,%ebp
801031e3:	57                   	push   %edi
801031e4:	56                   	push   %esi
801031e5:	53                   	push   %ebx
801031e6:	83 ec 1c             	sub    $0x1c,%esp
801031e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801031ec:	8b 7d 10             	mov    0x10(%ebp),%edi
  int i;

  acquire(&p->lock);
801031ef:	89 1c 24             	mov    %ebx,(%esp)
801031f2:	e8 49 11 00 00       	call   80104340 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801031f7:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
801031fd:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103203:	75 5b                	jne    80103260 <piperead+0x80>
80103205:	8b 8b 40 02 00 00    	mov    0x240(%ebx),%ecx
8010320b:	85 c9                	test   %ecx,%ecx
8010320d:	74 51                	je     80103260 <piperead+0x80>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
8010320f:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
80103215:	eb 25                	jmp    8010323c <piperead+0x5c>
80103217:	90                   	nop
80103218:	89 5c 24 04          	mov    %ebx,0x4(%esp)
8010321c:	89 34 24             	mov    %esi,(%esp)
8010321f:	e8 ac 0a 00 00       	call   80103cd0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103224:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010322a:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103230:	75 2e                	jne    80103260 <piperead+0x80>
80103232:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103238:	85 c0                	test   %eax,%eax
8010323a:	74 24                	je     80103260 <piperead+0x80>
    if(myproc()->killed){
8010323c:	e8 2f 08 00 00       	call   80103a70 <myproc>
80103241:	8b 50 24             	mov    0x24(%eax),%edx
80103244:	85 d2                	test   %edx,%edx
80103246:	74 d0                	je     80103218 <piperead+0x38>
      release(&p->lock);
80103248:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010324d:	89 1c 24             	mov    %ebx,(%esp)
80103250:	e8 9b 10 00 00       	call   801042f0 <release>
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103255:	83 c4 1c             	add    $0x1c,%esp
80103258:	89 f0                	mov    %esi,%eax
8010325a:	5b                   	pop    %ebx
8010325b:	5e                   	pop    %esi
8010325c:	5f                   	pop    %edi
8010325d:	5d                   	pop    %ebp
8010325e:	c3                   	ret    
8010325f:	90                   	nop
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103260:	85 ff                	test   %edi,%edi
80103262:	7e 5e                	jle    801032c2 <piperead+0xe2>
    if(p->nread == p->nwrite)
80103264:	31 f6                	xor    %esi,%esi
80103266:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
8010326c:	75 12                	jne    80103280 <piperead+0xa0>
8010326e:	66 90                	xchg   %ax,%ax
80103270:	eb 50                	jmp    801032c2 <piperead+0xe2>
80103272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103278:	39 93 38 02 00 00    	cmp    %edx,0x238(%ebx)
8010327e:	74 22                	je     801032a2 <piperead+0xc2>
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103280:	89 d0                	mov    %edx,%eax
80103282:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103285:	83 c2 01             	add    $0x1,%edx
80103288:	25 ff 01 00 00       	and    $0x1ff,%eax
8010328d:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103292:	88 04 31             	mov    %al,(%ecx,%esi,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103295:	83 c6 01             	add    $0x1,%esi
80103298:	39 f7                	cmp    %esi,%edi
    addr[i] = p->data[p->nread++ % PIPESIZE];
8010329a:	89 93 34 02 00 00    	mov    %edx,0x234(%ebx)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801032a0:	7f d6                	jg     80103278 <piperead+0x98>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
801032a2:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801032a8:	89 04 24             	mov    %eax,(%esp)
801032ab:	e8 f0 03 00 00       	call   801036a0 <wakeup>
  release(&p->lock);
801032b0:	89 1c 24             	mov    %ebx,(%esp)
801032b3:	e8 38 10 00 00       	call   801042f0 <release>
}
801032b8:	83 c4 1c             	add    $0x1c,%esp
801032bb:	89 f0                	mov    %esi,%eax
801032bd:	5b                   	pop    %ebx
801032be:	5e                   	pop    %esi
801032bf:	5f                   	pop    %edi
801032c0:	5d                   	pop    %ebp
801032c1:	c3                   	ret    
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801032c2:	31 f6                	xor    %esi,%esi
801032c4:	eb dc                	jmp    801032a2 <piperead+0xc2>
801032c6:	8d 76 00             	lea    0x0(%esi),%esi
801032c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801032d0 <pipewrite>:
{
801032d0:	55                   	push   %ebp
801032d1:	89 e5                	mov    %esp,%ebp
801032d3:	57                   	push   %edi
801032d4:	56                   	push   %esi
801032d5:	53                   	push   %ebx
801032d6:	83 ec 3c             	sub    $0x3c,%esp
801032d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&p->lock);
801032dc:	89 1c 24             	mov    %ebx,(%esp)
801032df:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801032e5:	e8 56 10 00 00       	call   80104340 <acquire>
  for(i = 0; i < n; i++){
801032ea:	8b 4d 10             	mov    0x10(%ebp),%ecx
801032ed:	85 c9                	test   %ecx,%ecx
801032ef:	0f 8e 8c 00 00 00    	jle    80103381 <pipewrite+0xb1>
801032f5:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801032fb:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
80103301:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80103308:	eb 36                	jmp    80103340 <pipewrite+0x70>
8010330a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->readopen == 0 || myproc()->killed){
80103310:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80103316:	85 d2                	test   %edx,%edx
80103318:	74 7e                	je     80103398 <pipewrite+0xc8>
8010331a:	e8 51 07 00 00       	call   80103a70 <myproc>
8010331f:	8b 40 24             	mov    0x24(%eax),%eax
80103322:	85 c0                	test   %eax,%eax
80103324:	75 72                	jne    80103398 <pipewrite+0xc8>
      wakeup(&p->nread);
80103326:	89 34 24             	mov    %esi,(%esp)
80103329:	e8 72 03 00 00       	call   801036a0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010332e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103332:	89 3c 24             	mov    %edi,(%esp)
80103335:	e8 96 09 00 00       	call   80103cd0 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010333a:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103340:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
80103346:	81 c2 00 02 00 00    	add    $0x200,%edx
8010334c:	39 d0                	cmp    %edx,%eax
8010334e:	74 c0                	je     80103310 <pipewrite+0x40>
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
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
  for(i = 0; i < n; i++){
80103375:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103379:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010337c:	39 4d 10             	cmp    %ecx,0x10(%ebp)
8010337f:	7f bf                	jg     80103340 <pipewrite+0x70>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103381:	89 34 24             	mov    %esi,(%esp)
80103384:	e8 17 03 00 00       	call   801036a0 <wakeup>
  release(&p->lock);
80103389:	89 1c 24             	mov    %ebx,(%esp)
8010338c:	e8 5f 0f 00 00       	call   801042f0 <release>
  return n;
80103391:	eb 14                	jmp    801033a7 <pipewrite+0xd7>
80103393:	90                   	nop
80103394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        release(&p->lock);
80103398:	89 1c 24             	mov    %ebx,(%esp)
8010339b:	e8 50 0f 00 00       	call   801042f0 <release>
801033a0:	c7 45 10 ff ff ff ff 	movl   $0xffffffff,0x10(%ebp)
}
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
{
801033c0:	55                   	push   %ebp
801033c1:	89 e5                	mov    %esp,%ebp
801033c3:	83 ec 18             	sub    $0x18,%esp
801033c6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801033c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033cc:	89 75 fc             	mov    %esi,-0x4(%ebp)
801033cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801033d2:	89 1c 24             	mov    %ebx,(%esp)
801033d5:	e8 66 0f 00 00       	call   80104340 <acquire>
  if(writable){
801033da:	85 f6                	test   %esi,%esi
801033dc:	74 42                	je     80103420 <pipeclose+0x60>
    wakeup(&p->nread);
801033de:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
    p->writeopen = 0;
801033e4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801033eb:	00 00 00 
    wakeup(&p->nread);
801033ee:	89 04 24             	mov    %eax,(%esp)
801033f1:	e8 aa 02 00 00       	call   801036a0 <wakeup>
  if(p->readopen == 0 && p->writeopen == 0){
801033f6:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801033fc:	85 c0                	test   %eax,%eax
801033fe:	75 0a                	jne    8010340a <pipeclose+0x4a>
80103400:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
80103406:	85 f6                	test   %esi,%esi
80103408:	74 36                	je     80103440 <pipeclose+0x80>
    release(&p->lock);
8010340a:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010340d:	8b 75 fc             	mov    -0x4(%ebp),%esi
80103410:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80103413:	89 ec                	mov    %ebp,%esp
80103415:	5d                   	pop    %ebp
    release(&p->lock);
80103416:	e9 d5 0e 00 00       	jmp    801042f0 <release>
8010341b:	90                   	nop
8010341c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
80103420:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
    p->readopen = 0;
80103426:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
8010342d:	00 00 00 
    wakeup(&p->nwrite);
80103430:	89 04 24             	mov    %eax,(%esp)
80103433:	e8 68 02 00 00       	call   801036a0 <wakeup>
80103438:	eb bc                	jmp    801033f6 <pipeclose+0x36>
8010343a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&p->lock);
80103440:	89 1c 24             	mov    %ebx,(%esp)
80103443:	e8 a8 0e 00 00       	call   801042f0 <release>
}
80103448:	8b 75 fc             	mov    -0x4(%ebp),%esi
    kfree((char*)p);
8010344b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010344e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80103451:	89 ec                	mov    %ebp,%esp
80103453:	5d                   	pop    %ebp
    kfree((char*)p);
80103454:	e9 27 ef ff ff       	jmp    80102380 <kfree>
80103459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103460 <pipealloc>:
{
80103460:	55                   	push   %ebp
80103461:	89 e5                	mov    %esp,%ebp
80103463:	57                   	push   %edi
80103464:	56                   	push   %esi
80103465:	53                   	push   %ebx
80103466:	83 ec 1c             	sub    $0x1c,%esp
80103469:	8b 75 08             	mov    0x8(%ebp),%esi
8010346c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  *f0 = *f1 = 0;
8010346f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103475:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010347b:	e8 50 db ff ff       	call   80100fd0 <filealloc>
80103480:	85 c0                	test   %eax,%eax
80103482:	89 06                	mov    %eax,(%esi)
80103484:	0f 84 9c 00 00 00    	je     80103526 <pipealloc+0xc6>
8010348a:	e8 41 db ff ff       	call   80100fd0 <filealloc>
8010348f:	85 c0                	test   %eax,%eax
80103491:	89 03                	mov    %eax,(%ebx)
80103493:	0f 84 7f 00 00 00    	je     80103518 <pipealloc+0xb8>
  if((p = (struct pipe*)kalloc()) == 0)
80103499:	e8 92 ee ff ff       	call   80102330 <kalloc>
8010349e:	85 c0                	test   %eax,%eax
801034a0:	89 c7                	mov    %eax,%edi
801034a2:	74 74                	je     80103518 <pipealloc+0xb8>
  p->readopen = 1;
801034a4:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801034ab:	00 00 00 
  p->writeopen = 1;
801034ae:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801034b5:	00 00 00 
  p->nwrite = 0;
801034b8:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801034bf:	00 00 00 
  p->nread = 0;
801034c2:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801034c9:	00 00 00 
  initlock(&p->lock, "pipe");
801034cc:	89 04 24             	mov    %eax,(%esp)
801034cf:	c7 44 24 04 80 74 10 	movl   $0x80107480,0x4(%esp)
801034d6:	80 
801034d7:	e8 94 0c 00 00       	call   80104170 <initlock>
  (*f0)->type = FD_PIPE;
801034dc:	8b 06                	mov    (%esi),%eax
801034de:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801034e4:	8b 06                	mov    (%esi),%eax
801034e6:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801034ea:	8b 06                	mov    (%esi),%eax
801034ec:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801034f0:	8b 06                	mov    (%esi),%eax
801034f2:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801034f5:	8b 03                	mov    (%ebx),%eax
801034f7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801034fd:	8b 03                	mov    (%ebx),%eax
801034ff:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103503:	8b 03                	mov    (%ebx),%eax
80103505:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103509:	8b 03                	mov    (%ebx),%eax
8010350b:	89 78 0c             	mov    %edi,0xc(%eax)
8010350e:	31 c0                	xor    %eax,%eax
}
80103510:	83 c4 1c             	add    $0x1c,%esp
80103513:	5b                   	pop    %ebx
80103514:	5e                   	pop    %esi
80103515:	5f                   	pop    %edi
80103516:	5d                   	pop    %ebp
80103517:	c3                   	ret    
  if(*f0)
80103518:	8b 06                	mov    (%esi),%eax
8010351a:	85 c0                	test   %eax,%eax
8010351c:	74 08                	je     80103526 <pipealloc+0xc6>
    fileclose(*f0);
8010351e:	89 04 24             	mov    %eax,(%esp)
80103521:	e8 2a db ff ff       	call   80101050 <fileclose>
  if(*f1)
80103526:	8b 13                	mov    (%ebx),%edx
80103528:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010352d:	85 d2                	test   %edx,%edx
8010352f:	74 df                	je     80103510 <pipealloc+0xb0>
    fileclose(*f1);
80103531:	89 14 24             	mov    %edx,(%esp)
80103534:	e8 17 db ff ff       	call   80101050 <fileclose>
80103539:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010353e:	eb d0                	jmp    80103510 <pipealloc+0xb0>

80103540 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103540:	55                   	push   %ebp
80103541:	89 e5                	mov    %esp,%ebp
80103543:	57                   	push   %edi
80103544:	56                   	push   %esi
80103545:	53                   	push   %ebx
procdump(void)
80103546:	bb 74 2d 11 80       	mov    $0x80112d74,%ebx
{
8010354b:	83 ec 4c             	sub    $0x4c,%esp
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
8010354e:	8d 7d c0             	lea    -0x40(%ebp),%edi
80103551:	eb 4e                	jmp    801035a1 <procdump+0x61>
80103553:	90                   	nop
80103554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103558:	8b 04 85 90 75 10 80 	mov    -0x7fef8a70(,%eax,4),%eax
8010355f:	85 c0                	test   %eax,%eax
80103561:	74 4a                	je     801035ad <procdump+0x6d>
    cprintf("%d %s %s", p->pid, state, p->name);
80103563:	89 44 24 08          	mov    %eax,0x8(%esp)
80103567:	8b 43 10             	mov    0x10(%ebx),%eax
8010356a:	8d 53 6c             	lea    0x6c(%ebx),%edx
8010356d:	89 54 24 0c          	mov    %edx,0xc(%esp)
80103571:	c7 04 24 89 74 10 80 	movl   $0x80107489,(%esp)
80103578:	89 44 24 04          	mov    %eax,0x4(%esp)
8010357c:	e8 cf d2 ff ff       	call   80100850 <cprintf>
    if(p->state == SLEEPING){
80103581:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80103585:	74 31                	je     801035b8 <procdump+0x78>
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80103587:	c7 04 24 51 77 10 80 	movl   $0x80107751,(%esp)
8010358e:	e8 bd d2 ff ff       	call   80100850 <cprintf>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103593:	81 c3 88 00 00 00    	add    $0x88,%ebx
80103599:	81 fb 74 4f 11 80    	cmp    $0x80114f74,%ebx
8010359f:	74 57                	je     801035f8 <procdump+0xb8>
    if(p->state == UNUSED)
801035a1:	8b 43 0c             	mov    0xc(%ebx),%eax
801035a4:	85 c0                	test   %eax,%eax
801035a6:	74 eb                	je     80103593 <procdump+0x53>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801035a8:	83 f8 05             	cmp    $0x5,%eax
801035ab:	76 ab                	jbe    80103558 <procdump+0x18>
801035ad:	b8 85 74 10 80       	mov    $0x80107485,%eax
801035b2:	eb af                	jmp    80103563 <procdump+0x23>
801035b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      getcallerpcs((uint*)p->context->ebp+2, pc);
801035b8:	8b 43 1c             	mov    0x1c(%ebx),%eax
801035bb:	31 f6                	xor    %esi,%esi
801035bd:	89 7c 24 04          	mov    %edi,0x4(%esp)
801035c1:	8b 40 0c             	mov    0xc(%eax),%eax
801035c4:	83 c0 08             	add    $0x8,%eax
801035c7:	89 04 24             	mov    %eax,(%esp)
801035ca:	e8 c1 0b 00 00       	call   80104190 <getcallerpcs>
801035cf:	90                   	nop
      for(i=0; i<10 && pc[i] != 0; i++)
801035d0:	8b 04 b7             	mov    (%edi,%esi,4),%eax
801035d3:	85 c0                	test   %eax,%eax
801035d5:	74 b0                	je     80103587 <procdump+0x47>
801035d7:	83 c6 01             	add    $0x1,%esi
        cprintf(" %p", pc[i]);
801035da:	89 44 24 04          	mov    %eax,0x4(%esp)
801035de:	c7 04 24 89 6f 10 80 	movl   $0x80106f89,(%esp)
801035e5:	e8 66 d2 ff ff       	call   80100850 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
801035ea:	83 fe 0a             	cmp    $0xa,%esi
801035ed:	75 e1                	jne    801035d0 <procdump+0x90>
801035ef:	eb 96                	jmp    80103587 <procdump+0x47>
801035f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }
}
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
{
80103610:	55                   	push   %ebp
80103611:	89 e5                	mov    %esp,%ebp
80103613:	53                   	push   %ebx
80103614:	83 ec 14             	sub    $0x14,%esp
80103617:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010361a:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103621:	e8 1a 0d 00 00       	call   80104340 <acquire>
kill(int pid)
80103626:	b8 fc 2d 11 80       	mov    $0x80112dfc,%eax
    if(p->pid == pid){
8010362b:	39 1d 84 2d 11 80    	cmp    %ebx,0x80112d84
80103631:	75 11                	jne    80103644 <kill+0x34>
80103633:	eb 62                	jmp    80103697 <kill+0x87>
80103635:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103638:	05 88 00 00 00       	add    $0x88,%eax
8010363d:	3d 74 4f 11 80       	cmp    $0x80114f74,%eax
80103642:	74 3c                	je     80103680 <kill+0x70>
    if(p->pid == pid){
80103644:	39 58 10             	cmp    %ebx,0x10(%eax)
80103647:	75 ef                	jne    80103638 <kill+0x28>
      if(p->state == SLEEPING)
80103649:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
8010364d:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
80103654:	74 1a                	je     80103670 <kill+0x60>
      release(&ptable.lock);
80103656:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
8010365d:	e8 8e 0c 00 00       	call   801042f0 <release>
}
80103662:	83 c4 14             	add    $0x14,%esp
      release(&ptable.lock);
80103665:	31 c0                	xor    %eax,%eax
}
80103667:	5b                   	pop    %ebx
80103668:	5d                   	pop    %ebp
80103669:	c3                   	ret    
8010366a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        p->state = RUNNABLE;
80103670:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103677:	eb dd                	jmp    80103656 <kill+0x46>
80103679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80103680:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103687:	e8 64 0c 00 00       	call   801042f0 <release>
}
8010368c:	83 c4 14             	add    $0x14,%esp
  release(&ptable.lock);
8010368f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103694:	5b                   	pop    %ebx
80103695:	5d                   	pop    %ebp
80103696:	c3                   	ret    
    if(p->pid == pid){
80103697:	b8 74 2d 11 80       	mov    $0x80112d74,%eax
8010369c:	eb ab                	jmp    80103649 <kill+0x39>
8010369e:	66 90                	xchg   %ax,%ax

801036a0 <wakeup>:
{
801036a0:	55                   	push   %ebp
801036a1:	89 e5                	mov    %esp,%ebp
801036a3:	53                   	push   %ebx
801036a4:	83 ec 14             	sub    $0x14,%esp
801036a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
801036aa:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
801036b1:	e8 8a 0c 00 00       	call   80104340 <acquire>
wakeup(void *chan)
801036b6:	b8 74 2d 11 80       	mov    $0x80112d74,%eax
801036bb:	eb 0f                	jmp    801036cc <wakeup+0x2c>
801036bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036c0:	05 88 00 00 00       	add    $0x88,%eax
801036c5:	3d 74 4f 11 80       	cmp    $0x80114f74,%eax
801036ca:	74 24                	je     801036f0 <wakeup+0x50>
    if(p->state == SLEEPING && p->chan == chan)
801036cc:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801036d0:	75 ee                	jne    801036c0 <wakeup+0x20>
801036d2:	3b 58 20             	cmp    0x20(%eax),%ebx
801036d5:	75 e9                	jne    801036c0 <wakeup+0x20>
      p->state = RUNNABLE;
801036d7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036de:	05 88 00 00 00       	add    $0x88,%eax
801036e3:	3d 74 4f 11 80       	cmp    $0x80114f74,%eax
801036e8:	75 e2                	jne    801036cc <wakeup+0x2c>
801036ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
801036f0:	c7 45 08 40 2d 11 80 	movl   $0x80112d40,0x8(%ebp)
}
801036f7:	83 c4 14             	add    $0x14,%esp
801036fa:	5b                   	pop    %ebx
801036fb:	5d                   	pop    %ebp
  release(&ptable.lock);
801036fc:	e9 ef 0b 00 00       	jmp    801042f0 <release>
80103701:	eb 0d                	jmp    80103710 <forkret>
80103703:	90                   	nop
80103704:	90                   	nop
80103705:	90                   	nop
80103706:	90                   	nop
80103707:	90                   	nop
80103708:	90                   	nop
80103709:	90                   	nop
8010370a:	90                   	nop
8010370b:	90                   	nop
8010370c:	90                   	nop
8010370d:	90                   	nop
8010370e:	90                   	nop
8010370f:	90                   	nop

80103710 <forkret>:
{
80103710:	55                   	push   %ebp
80103711:	89 e5                	mov    %esp,%ebp
80103713:	83 ec 18             	sub    $0x18,%esp
  release(&ptable.lock);
80103716:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
8010371d:	e8 ce 0b 00 00       	call   801042f0 <release>
  if (first) {
80103722:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103727:	85 c0                	test   %eax,%eax
80103729:	75 05                	jne    80103730 <forkret+0x20>
}
8010372b:	c9                   	leave  
8010372c:	c3                   	ret    
8010372d:	8d 76 00             	lea    0x0(%esi),%esi
    first = 0;
80103730:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
80103737:	00 00 00 
    iinit(ROOTDEV);
8010373a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80103741:	e8 9a e7 ff ff       	call   80101ee0 <iinit>
    initlog(ROOTDEV);
80103746:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010374d:	e8 1e f6 ff ff       	call   80102d70 <initlog>
}
80103752:	c9                   	leave  
80103753:	c3                   	ret    
80103754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010375a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103760 <allocproc>:
{
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	53                   	push   %ebx
80103764:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);
80103767:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
8010376e:	e8 cd 0b 00 00       	call   80104340 <acquire>
    if(p->state == UNUSED)
80103773:	8b 0d 80 2d 11 80    	mov    0x80112d80,%ecx
80103779:	85 c9                	test   %ecx,%ecx
8010377b:	0f 84 ad 00 00 00    	je     8010382e <allocproc+0xce>
allocproc(void)
80103781:	bb fc 2d 11 80       	mov    $0x80112dfc,%ebx
80103786:	eb 12                	jmp    8010379a <allocproc+0x3a>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103788:	81 c3 88 00 00 00    	add    $0x88,%ebx
8010378e:	81 fb 74 4f 11 80    	cmp    $0x80114f74,%ebx
80103794:	0f 84 7e 00 00 00    	je     80103818 <allocproc+0xb8>
    if(p->state == UNUSED)
8010379a:	8b 53 0c             	mov    0xc(%ebx),%edx
8010379d:	85 d2                	test   %edx,%edx
8010379f:	75 e7                	jne    80103788 <allocproc+0x28>
  p->state = EMBRYO;
801037a1:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
801037a8:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801037ad:	89 43 10             	mov    %eax,0x10(%ebx)
801037b0:	83 c0 01             	add    $0x1,%eax
801037b3:	a3 00 a0 10 80       	mov    %eax,0x8010a000
  release(&ptable.lock);
801037b8:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
801037bf:	e8 2c 0b 00 00       	call   801042f0 <release>
  if((p->kstack = kalloc()) == 0){
801037c4:	e8 67 eb ff ff       	call   80102330 <kalloc>
801037c9:	85 c0                	test   %eax,%eax
801037cb:	89 43 08             	mov    %eax,0x8(%ebx)
801037ce:	74 68                	je     80103838 <allocproc+0xd8>
  sp -= sizeof *p->tf;
801037d0:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  p->tf = (struct trapframe*)sp;
801037d6:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
801037d9:	c7 80 b0 0f 00 00 c4 	movl   $0x801055c4,0xfb0(%eax)
801037e0:	55 10 80 
  p->context = (struct context*)sp;
801037e3:	05 9c 0f 00 00       	add    $0xf9c,%eax
801037e8:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
801037eb:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801037f2:	00 
801037f3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801037fa:	00 
801037fb:	89 04 24             	mov    %eax,(%esp)
801037fe:	e8 ad 0b 00 00       	call   801043b0 <memset>
  p->context->eip = (uint)forkret;
80103803:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103806:	c7 40 10 10 37 10 80 	movl   $0x80103710,0x10(%eax)
}
8010380d:	89 d8                	mov    %ebx,%eax
8010380f:	83 c4 14             	add    $0x14,%esp
80103812:	5b                   	pop    %ebx
80103813:	5d                   	pop    %ebp
80103814:	c3                   	ret    
80103815:	8d 76 00             	lea    0x0(%esi),%esi
  release(&ptable.lock);
80103818:	31 db                	xor    %ebx,%ebx
8010381a:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103821:	e8 ca 0a 00 00       	call   801042f0 <release>
}
80103826:	89 d8                	mov    %ebx,%eax
80103828:	83 c4 14             	add    $0x14,%esp
8010382b:	5b                   	pop    %ebx
8010382c:	5d                   	pop    %ebp
8010382d:	c3                   	ret    
  return 0;
8010382e:	bb 74 2d 11 80       	mov    $0x80112d74,%ebx
80103833:	e9 69 ff ff ff       	jmp    801037a1 <allocproc+0x41>
    p->state = UNUSED;
80103838:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010383f:	31 db                	xor    %ebx,%ebx
    return 0;
80103841:	eb ca                	jmp    8010380d <allocproc+0xad>
80103843:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103850 <userinit>:
{
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	53                   	push   %ebx
80103854:	83 ec 14             	sub    $0x14,%esp
  p = allocproc();
80103857:	e8 04 ff ff ff       	call   80103760 <allocproc>
8010385c:	89 c3                	mov    %eax,%ebx
  initproc = p;
8010385e:	a3 c0 a5 10 80       	mov    %eax,0x8010a5c0
  if((p->pgdir = setupkvm()) == 0)
80103863:	e8 58 31 00 00       	call   801069c0 <setupkvm>
80103868:	85 c0                	test   %eax,%eax
8010386a:	89 43 04             	mov    %eax,0x4(%ebx)
8010386d:	0f 84 ce 00 00 00    	je     80103941 <userinit+0xf1>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103873:	89 04 24             	mov    %eax,(%esp)
80103876:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
8010387d:	00 
8010387e:	c7 44 24 04 60 a4 10 	movl   $0x8010a460,0x4(%esp)
80103885:	80 
80103886:	e8 65 2f 00 00       	call   801067f0 <inituvm>
  p->sz = PGSIZE;
8010388b:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103891:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
80103898:	00 
80103899:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801038a0:	00 
801038a1:	8b 43 18             	mov    0x18(%ebx),%eax
801038a4:	89 04 24             	mov    %eax,(%esp)
801038a7:	e8 04 0b 00 00       	call   801043b0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801038ac:	8b 43 18             	mov    0x18(%ebx),%eax
801038af:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801038b5:	8b 43 18             	mov    0x18(%ebx),%eax
801038b8:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
  p->tf->es = p->tf->ds;
801038be:	8b 43 18             	mov    0x18(%ebx),%eax
801038c1:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038c5:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801038c9:	8b 43 18             	mov    0x18(%ebx),%eax
801038cc:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038d0:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801038d4:	8b 43 18             	mov    0x18(%ebx),%eax
801038d7:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801038de:	8b 43 18             	mov    0x18(%ebx),%eax
801038e1:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801038e8:	8b 43 18             	mov    0x18(%ebx),%eax
801038eb:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
801038f2:	8d 43 6c             	lea    0x6c(%ebx),%eax
801038f5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
801038fc:	00 
801038fd:	c7 44 24 04 ab 74 10 	movl   $0x801074ab,0x4(%esp)
80103904:	80 
80103905:	89 04 24             	mov    %eax,(%esp)
80103908:	e8 83 0c 00 00       	call   80104590 <safestrcpy>
  p->cwd = namei("/");
8010390d:	c7 04 24 b4 74 10 80 	movl   $0x801074b4,(%esp)
80103914:	e8 a7 e5 ff ff       	call   80101ec0 <namei>
80103919:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
8010391c:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103923:	e8 18 0a 00 00       	call   80104340 <acquire>
  p->state = RUNNABLE;
80103928:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
8010392f:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103936:	e8 b5 09 00 00       	call   801042f0 <release>
}
8010393b:	83 c4 14             	add    $0x14,%esp
8010393e:	5b                   	pop    %ebx
8010393f:	5d                   	pop    %ebp
80103940:	c3                   	ret    
    panic("userinit: out of memory?");
80103941:	c7 04 24 92 74 10 80 	movl   $0x80107492,(%esp)
80103948:	e8 63 ca ff ff       	call   801003b0 <panic>
8010394d:	8d 76 00             	lea    0x0(%esi),%esi

80103950 <mycpu>:
{
80103950:	55                   	push   %ebp
80103951:	89 e5                	mov    %esp,%ebp
80103953:	57                   	push   %edi
80103954:	56                   	push   %esi
80103955:	53                   	push   %ebx
80103956:	83 ec 1c             	sub    $0x1c,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103959:	9c                   	pushf  
8010395a:	58                   	pop    %eax
  if(readeflags()&FL_IF)
8010395b:	f6 c4 02             	test   $0x2,%ah
8010395e:	75 5e                	jne    801039be <mycpu+0x6e>
  apicid = lapicid();
80103960:	e8 bb ed ff ff       	call   80102720 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103965:	8b 35 20 2d 11 80    	mov    0x80112d20,%esi
8010396b:	85 f6                	test   %esi,%esi
8010396d:	7e 43                	jle    801039b2 <mycpu+0x62>
    if (cpus[i].apicid == apicid)
8010396f:	0f b6 3d a0 27 11 80 	movzbl 0x801127a0,%edi
80103976:	31 d2                	xor    %edx,%edx
80103978:	b9 50 28 11 80       	mov    $0x80112850,%ecx
8010397d:	bb a0 27 11 80       	mov    $0x801127a0,%ebx
80103982:	39 f8                	cmp    %edi,%eax
80103984:	74 22                	je     801039a8 <mycpu+0x58>
80103986:	66 90                	xchg   %ax,%ax
  for (i = 0; i < ncpu; ++i) {
80103988:	83 c2 01             	add    $0x1,%edx
8010398b:	39 f2                	cmp    %esi,%edx
8010398d:	7d 23                	jge    801039b2 <mycpu+0x62>
    if (cpus[i].apicid == apicid)
8010398f:	0f b6 19             	movzbl (%ecx),%ebx
80103992:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103998:	39 d8                	cmp    %ebx,%eax
8010399a:	75 ec                	jne    80103988 <mycpu+0x38>
8010399c:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
801039a2:	8d 9a a0 27 11 80    	lea    -0x7feed860(%edx),%ebx
}
801039a8:	83 c4 1c             	add    $0x1c,%esp
801039ab:	89 d8                	mov    %ebx,%eax
801039ad:	5b                   	pop    %ebx
801039ae:	5e                   	pop    %esi
801039af:	5f                   	pop    %edi
801039b0:	5d                   	pop    %ebp
801039b1:	c3                   	ret    
  panic("unknown apicid\n");
801039b2:	c7 04 24 b6 74 10 80 	movl   $0x801074b6,(%esp)
801039b9:	e8 f2 c9 ff ff       	call   801003b0 <panic>
    panic("mycpu called with interrupts enabled\n");
801039be:	c7 04 24 68 75 10 80 	movl   $0x80107568,(%esp)
801039c5:	e8 e6 c9 ff ff       	call   801003b0 <panic>
801039ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801039d0 <scheduler>:
{
801039d0:	55                   	push   %ebp
801039d1:	89 e5                	mov    %esp,%ebp
801039d3:	57                   	push   %edi
801039d4:	56                   	push   %esi
801039d5:	53                   	push   %ebx
801039d6:	83 ec 1c             	sub    $0x1c,%esp
  struct cpu *c = mycpu();
801039d9:	e8 72 ff ff ff       	call   80103950 <mycpu>
801039de:	89 c6                	mov    %eax,%esi
  c->proc = 0;
801039e0:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
801039e7:	00 00 00 
      swtch(&(c->scheduler), p->context);
801039ea:	8d 78 04             	lea    0x4(%eax),%edi
801039ed:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
801039f0:	fb                   	sti    
scheduler(void)
801039f1:	bb 74 2d 11 80       	mov    $0x80112d74,%ebx
    acquire(&ptable.lock);
801039f6:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
801039fd:	e8 3e 09 00 00       	call   80104340 <acquire>
80103a02:	eb 12                	jmp    80103a16 <scheduler+0x46>
80103a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a08:	81 c3 88 00 00 00    	add    $0x88,%ebx
80103a0e:	81 fb 74 4f 11 80    	cmp    $0x80114f74,%ebx
80103a14:	74 4a                	je     80103a60 <scheduler+0x90>
      if(p->state != RUNNABLE)
80103a16:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103a1a:	75 ec                	jne    80103a08 <scheduler+0x38>
      c->proc = p;
80103a1c:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103a22:	89 1c 24             	mov    %ebx,(%esp)
80103a25:	e8 36 33 00 00       	call   80106d60 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103a2a:	8b 43 1c             	mov    0x1c(%ebx),%eax
      p->state = RUNNING;
80103a2d:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a34:	81 c3 88 00 00 00    	add    $0x88,%ebx
      swtch(&(c->scheduler), p->context);
80103a3a:	89 3c 24             	mov    %edi,(%esp)
80103a3d:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a41:	e8 a5 0b 00 00       	call   801045eb <swtch>
      switchkvm();
80103a46:	e8 55 2b 00 00       	call   801065a0 <switchkvm>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a4b:	81 fb 74 4f 11 80    	cmp    $0x80114f74,%ebx
      c->proc = 0;
80103a51:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103a58:	00 00 00 
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a5b:	75 b9                	jne    80103a16 <scheduler+0x46>
80103a5d:	8d 76 00             	lea    0x0(%esi),%esi
    release(&ptable.lock);
80103a60:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103a67:	e8 84 08 00 00       	call   801042f0 <release>
  }
80103a6c:	eb 82                	jmp    801039f0 <scheduler+0x20>
80103a6e:	66 90                	xchg   %ax,%ax

80103a70 <myproc>:
myproc(void) {
80103a70:	55                   	push   %ebp
80103a71:	89 e5                	mov    %esp,%ebp
80103a73:	53                   	push   %ebx
80103a74:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103a77:	e8 e4 07 00 00       	call   80104260 <pushcli>
  c = mycpu();
80103a7c:	e8 cf fe ff ff       	call   80103950 <mycpu>
  p = c->proc;
80103a81:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a87:	e8 64 07 00 00       	call   801041f0 <popcli>
}
80103a8c:	83 c4 04             	add    $0x4,%esp
80103a8f:	89 d8                	mov    %ebx,%eax
80103a91:	5b                   	pop    %ebx
80103a92:	5d                   	pop    %ebp
80103a93:	c3                   	ret    
80103a94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103a9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103aa0 <fork>:
{
80103aa0:	55                   	push   %ebp
80103aa1:	89 e5                	mov    %esp,%ebp
80103aa3:	57                   	push   %edi
80103aa4:	56                   	push   %esi
  if((np = allocproc()) == 0){
80103aa5:	be ff ff ff ff       	mov    $0xffffffff,%esi
{
80103aaa:	53                   	push   %ebx
80103aab:	83 ec 2c             	sub    $0x2c,%esp
  struct proc *curproc = myproc();
80103aae:	e8 bd ff ff ff       	call   80103a70 <myproc>
80103ab3:	89 c3                	mov    %eax,%ebx
  if((np = allocproc()) == 0){
80103ab5:	e8 a6 fc ff ff       	call   80103760 <allocproc>
80103aba:	85 c0                	test   %eax,%eax
80103abc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103abf:	0f 84 bf 00 00 00    	je     80103b84 <fork+0xe4>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103ac5:	8b 03                	mov    (%ebx),%eax
80103ac7:	89 44 24 04          	mov    %eax,0x4(%esp)
80103acb:	8b 43 04             	mov    0x4(%ebx),%eax
80103ace:	89 04 24             	mov    %eax,(%esp)
80103ad1:	e8 aa 2f 00 00       	call   80106a80 <copyuvm>
80103ad6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103ad9:	85 c0                	test   %eax,%eax
80103adb:	89 42 04             	mov    %eax,0x4(%edx)
80103ade:	0f 84 aa 00 00 00    	je     80103b8e <fork+0xee>
  np->sz = curproc->sz;
80103ae4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  *np->tf = *curproc->tf;
80103ae7:	b9 13 00 00 00       	mov    $0x13,%ecx
  np->sz = curproc->sz;
80103aec:	8b 03                	mov    (%ebx),%eax
  np->parent = curproc;
80103aee:	89 5a 14             	mov    %ebx,0x14(%edx)
  np->sz = curproc->sz;
80103af1:	89 02                	mov    %eax,(%edx)
  *np->tf = *curproc->tf;
80103af3:	8b 42 18             	mov    0x18(%edx),%eax
80103af6:	8b 73 18             	mov    0x18(%ebx),%esi
80103af9:	89 c7                	mov    %eax,%edi
80103afb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->tf->eax = 0;
80103afd:	31 f6                	xor    %esi,%esi
80103aff:	8b 42 18             	mov    0x18(%edx),%eax
80103b02:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[i])
80103b10:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103b14:	85 c0                	test   %eax,%eax
80103b16:	74 0f                	je     80103b27 <fork+0x87>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103b18:	89 04 24             	mov    %eax,(%esp)
80103b1b:	e8 60 d4 ff ff       	call   80100f80 <filedup>
80103b20:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b23:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103b27:	83 c6 01             	add    $0x1,%esi
80103b2a:	83 fe 10             	cmp    $0x10,%esi
80103b2d:	75 e1                	jne    80103b10 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103b2f:	8b 43 68             	mov    0x68(%ebx),%eax
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b32:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103b35:	89 04 24             	mov    %eax,(%esp)
80103b38:	e8 43 d6 ff ff       	call   80101180 <idup>
80103b3d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b40:	89 42 68             	mov    %eax,0x68(%edx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b43:	89 d0                	mov    %edx,%eax
80103b45:	83 c0 6c             	add    $0x6c,%eax
80103b48:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103b4f:	00 
80103b50:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103b54:	89 04 24             	mov    %eax,(%esp)
80103b57:	e8 34 0a 00 00       	call   80104590 <safestrcpy>
  pid = np->pid;
80103b5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103b5f:	8b 70 10             	mov    0x10(%eax),%esi
  acquire(&ptable.lock);
80103b62:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103b69:	e8 d2 07 00 00       	call   80104340 <acquire>
  np->state = RUNNABLE;
80103b6e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b71:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
  release(&ptable.lock);
80103b78:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103b7f:	e8 6c 07 00 00       	call   801042f0 <release>
}
80103b84:	83 c4 2c             	add    $0x2c,%esp
80103b87:	89 f0                	mov    %esi,%eax
80103b89:	5b                   	pop    %ebx
80103b8a:	5e                   	pop    %esi
80103b8b:	5f                   	pop    %edi
80103b8c:	5d                   	pop    %ebp
80103b8d:	c3                   	ret    
    kfree(np->kstack);
80103b8e:	8b 42 08             	mov    0x8(%edx),%eax
80103b91:	89 04 24             	mov    %eax,(%esp)
80103b94:	e8 e7 e7 ff ff       	call   80102380 <kfree>
    np->kstack = 0;
80103b99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103b9c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    np->state = UNUSED;
80103ba3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    return -1;
80103baa:	eb d8                	jmp    80103b84 <fork+0xe4>
80103bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103bb0 <growproc>:
{
80103bb0:	55                   	push   %ebp
80103bb1:	89 e5                	mov    %esp,%ebp
80103bb3:	83 ec 18             	sub    $0x18,%esp
80103bb6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80103bb9:	89 75 fc             	mov    %esi,-0x4(%ebp)
80103bbc:	8b 75 08             	mov    0x8(%ebp),%esi
  struct proc *curproc = myproc();
80103bbf:	e8 ac fe ff ff       	call   80103a70 <myproc>
  if(n > 0){
80103bc4:	83 fe 00             	cmp    $0x0,%esi
  struct proc *curproc = myproc();
80103bc7:	89 c3                	mov    %eax,%ebx
  sz = curproc->sz;
80103bc9:	8b 00                	mov    (%eax),%eax
  if(n > 0){
80103bcb:	7f 1b                	jg     80103be8 <growproc+0x38>
  } else if(n < 0){
80103bcd:	75 39                	jne    80103c08 <growproc+0x58>
  curproc->sz = sz;
80103bcf:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103bd1:	89 1c 24             	mov    %ebx,(%esp)
80103bd4:	e8 87 31 00 00       	call   80106d60 <switchuvm>
80103bd9:	31 c0                	xor    %eax,%eax
}
80103bdb:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80103bde:	8b 75 fc             	mov    -0x4(%ebp),%esi
80103be1:	89 ec                	mov    %ebp,%esp
80103be3:	5d                   	pop    %ebp
80103be4:	c3                   	ret    
80103be5:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103be8:	01 c6                	add    %eax,%esi
80103bea:	89 74 24 08          	mov    %esi,0x8(%esp)
80103bee:	89 44 24 04          	mov    %eax,0x4(%esp)
80103bf2:	8b 43 04             	mov    0x4(%ebx),%eax
80103bf5:	89 04 24             	mov    %eax,(%esp)
80103bf8:	e8 73 2f 00 00       	call   80106b70 <allocuvm>
80103bfd:	85 c0                	test   %eax,%eax
80103bff:	75 ce                	jne    80103bcf <growproc+0x1f>
  return 0;
80103c01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103c06:	eb d3                	jmp    80103bdb <growproc+0x2b>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103c08:	01 c6                	add    %eax,%esi
80103c0a:	89 74 24 08          	mov    %esi,0x8(%esp)
80103c0e:	89 44 24 04          	mov    %eax,0x4(%esp)
80103c12:	8b 43 04             	mov    0x4(%ebx),%eax
80103c15:	89 04 24             	mov    %eax,(%esp)
80103c18:	e8 73 2c 00 00       	call   80106890 <deallocuvm>
80103c1d:	85 c0                	test   %eax,%eax
80103c1f:	75 ae                	jne    80103bcf <growproc+0x1f>
80103c21:	eb de                	jmp    80103c01 <growproc+0x51>
80103c23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c30 <sched>:
{
80103c30:	55                   	push   %ebp
80103c31:	89 e5                	mov    %esp,%ebp
80103c33:	56                   	push   %esi
80103c34:	53                   	push   %ebx
80103c35:	83 ec 10             	sub    $0x10,%esp
  struct proc *p = myproc();
80103c38:	e8 33 fe ff ff       	call   80103a70 <myproc>
  if(!holding(&ptable.lock))
80103c3d:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
  struct proc *p = myproc();
80103c44:	89 c3                	mov    %eax,%ebx
  if(!holding(&ptable.lock))
80103c46:	e8 55 06 00 00       	call   801042a0 <holding>
80103c4b:	85 c0                	test   %eax,%eax
80103c4d:	74 4f                	je     80103c9e <sched+0x6e>
  if(mycpu()->ncli != 1)
80103c4f:	e8 fc fc ff ff       	call   80103950 <mycpu>
80103c54:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103c5b:	75 65                	jne    80103cc2 <sched+0x92>
  if(p->state == RUNNING)
80103c5d:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103c61:	74 53                	je     80103cb6 <sched+0x86>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103c63:	9c                   	pushf  
80103c64:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103c65:	f6 c4 02             	test   $0x2,%ah
80103c68:	75 40                	jne    80103caa <sched+0x7a>
  intena = mycpu()->intena;
80103c6a:	e8 e1 fc ff ff       	call   80103950 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103c6f:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103c72:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103c78:	e8 d3 fc ff ff       	call   80103950 <mycpu>
80103c7d:	8b 40 04             	mov    0x4(%eax),%eax
80103c80:	89 1c 24             	mov    %ebx,(%esp)
80103c83:	89 44 24 04          	mov    %eax,0x4(%esp)
80103c87:	e8 5f 09 00 00       	call   801045eb <swtch>
  mycpu()->intena = intena;
80103c8c:	e8 bf fc ff ff       	call   80103950 <mycpu>
80103c91:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103c97:	83 c4 10             	add    $0x10,%esp
80103c9a:	5b                   	pop    %ebx
80103c9b:	5e                   	pop    %esi
80103c9c:	5d                   	pop    %ebp
80103c9d:	c3                   	ret    
    panic("sched ptable.lock");
80103c9e:	c7 04 24 c6 74 10 80 	movl   $0x801074c6,(%esp)
80103ca5:	e8 06 c7 ff ff       	call   801003b0 <panic>
    panic("sched interruptible");
80103caa:	c7 04 24 f2 74 10 80 	movl   $0x801074f2,(%esp)
80103cb1:	e8 fa c6 ff ff       	call   801003b0 <panic>
    panic("sched running");
80103cb6:	c7 04 24 e4 74 10 80 	movl   $0x801074e4,(%esp)
80103cbd:	e8 ee c6 ff ff       	call   801003b0 <panic>
    panic("sched locks");
80103cc2:	c7 04 24 d8 74 10 80 	movl   $0x801074d8,(%esp)
80103cc9:	e8 e2 c6 ff ff       	call   801003b0 <panic>
80103cce:	66 90                	xchg   %ax,%ax

80103cd0 <sleep>:
{
80103cd0:	55                   	push   %ebp
80103cd1:	89 e5                	mov    %esp,%ebp
80103cd3:	83 ec 28             	sub    $0x28,%esp
80103cd6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80103cd9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80103cdc:	89 75 f8             	mov    %esi,-0x8(%ebp)
80103cdf:	8b 75 08             	mov    0x8(%ebp),%esi
80103ce2:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct proc *p = myproc();
80103ce5:	e8 86 fd ff ff       	call   80103a70 <myproc>
  if(p == 0)
80103cea:	85 c0                	test   %eax,%eax
  struct proc *p = myproc();
80103cec:	89 c7                	mov    %eax,%edi
  if(p == 0)
80103cee:	0f 84 8b 00 00 00    	je     80103d7f <sleep+0xaf>
  if(lk == 0)
80103cf4:	85 db                	test   %ebx,%ebx
80103cf6:	74 7b                	je     80103d73 <sleep+0xa3>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103cf8:	81 fb 40 2d 11 80    	cmp    $0x80112d40,%ebx
80103cfe:	74 50                	je     80103d50 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d00:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103d07:	e8 34 06 00 00       	call   80104340 <acquire>
    release(lk);
80103d0c:	89 1c 24             	mov    %ebx,(%esp)
80103d0f:	e8 dc 05 00 00       	call   801042f0 <release>
  p->chan = chan;
80103d14:	89 77 20             	mov    %esi,0x20(%edi)
  p->state = SLEEPING;
80103d17:	c7 47 0c 02 00 00 00 	movl   $0x2,0xc(%edi)
  sched();
80103d1e:	e8 0d ff ff ff       	call   80103c30 <sched>
  p->chan = 0;
80103d23:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%edi)
    release(&ptable.lock);
80103d2a:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103d31:	e8 ba 05 00 00       	call   801042f0 <release>
}
80103d36:	8b 75 f8             	mov    -0x8(%ebp),%esi
    acquire(lk);
80103d39:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80103d3c:	8b 7d fc             	mov    -0x4(%ebp),%edi
80103d3f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80103d42:	89 ec                	mov    %ebp,%esp
80103d44:	5d                   	pop    %ebp
    acquire(lk);
80103d45:	e9 f6 05 00 00       	jmp    80104340 <acquire>
80103d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  p->chan = chan;
80103d50:	89 70 20             	mov    %esi,0x20(%eax)
  p->state = SLEEPING;
80103d53:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103d5a:	e8 d1 fe ff ff       	call   80103c30 <sched>
  p->chan = 0;
80103d5f:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%edi)
}
80103d66:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80103d69:	8b 75 f8             	mov    -0x8(%ebp),%esi
80103d6c:	8b 7d fc             	mov    -0x4(%ebp),%edi
80103d6f:	89 ec                	mov    %ebp,%esp
80103d71:	5d                   	pop    %ebp
80103d72:	c3                   	ret    
    panic("sleep without lk");
80103d73:	c7 04 24 0c 75 10 80 	movl   $0x8010750c,(%esp)
80103d7a:	e8 31 c6 ff ff       	call   801003b0 <panic>
    panic("sleep");
80103d7f:	c7 04 24 06 75 10 80 	movl   $0x80107506,(%esp)
80103d86:	e8 25 c6 ff ff       	call   801003b0 <panic>
80103d8b:	90                   	nop
80103d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103d90 <wait>:
{
80103d90:	55                   	push   %ebp
80103d91:	89 e5                	mov    %esp,%ebp
80103d93:	56                   	push   %esi
80103d94:	53                   	push   %ebx
  acquire(&ptable.lock);
80103d95:	bb 74 2d 11 80       	mov    $0x80112d74,%ebx
{
80103d9a:	83 ec 20             	sub    $0x20,%esp
  struct proc *curproc = myproc();
80103d9d:	e8 ce fc ff ff       	call   80103a70 <myproc>
  acquire(&ptable.lock);
80103da2:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
  struct proc *curproc = myproc();
80103da9:	89 c6                	mov    %eax,%esi
  acquire(&ptable.lock);
80103dab:	e8 90 05 00 00       	call   80104340 <acquire>
80103db0:	31 c0                	xor    %eax,%eax
80103db2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103db8:	81 fb 74 4f 11 80    	cmp    $0x80114f74,%ebx
80103dbe:	72 2a                	jb     80103dea <wait+0x5a>
    if(!havekids || curproc->killed){
80103dc0:	85 c0                	test   %eax,%eax
80103dc2:	74 4c                	je     80103e10 <wait+0x80>
80103dc4:	8b 5e 24             	mov    0x24(%esi),%ebx
80103dc7:	85 db                	test   %ebx,%ebx
80103dc9:	75 45                	jne    80103e10 <wait+0x80>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103dcb:	bb 74 2d 11 80       	mov    $0x80112d74,%ebx
80103dd0:	c7 44 24 04 40 2d 11 	movl   $0x80112d40,0x4(%esp)
80103dd7:	80 
80103dd8:	89 34 24             	mov    %esi,(%esp)
80103ddb:	e8 f0 fe ff ff       	call   80103cd0 <sleep>
80103de0:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103de2:	81 fb 74 4f 11 80    	cmp    $0x80114f74,%ebx
80103de8:	73 d6                	jae    80103dc0 <wait+0x30>
      if(p->parent != curproc)
80103dea:	3b 73 14             	cmp    0x14(%ebx),%esi
80103ded:	74 09                	je     80103df8 <wait+0x68>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103def:	81 c3 88 00 00 00    	add    $0x88,%ebx
80103df5:	eb c1                	jmp    80103db8 <wait+0x28>
80103df7:	90                   	nop
      if(p->state == ZOMBIE){
80103df8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e00:	74 26                	je     80103e28 <wait+0x98>
        return pid;
80103e02:	b8 01 00 00 00       	mov    $0x1,%eax
80103e07:	eb e6                	jmp    80103def <wait+0x5f>
80103e09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
80103e10:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103e17:	e8 d4 04 00 00       	call   801042f0 <release>
80103e1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103e21:	83 c4 20             	add    $0x20,%esp
80103e24:	5b                   	pop    %ebx
80103e25:	5e                   	pop    %esi
80103e26:	5d                   	pop    %ebp
80103e27:	c3                   	ret    
        pid = p->pid;
80103e28:	8b 43 10             	mov    0x10(%ebx),%eax
        kfree(p->kstack);
80103e2b:	8b 53 08             	mov    0x8(%ebx),%edx
80103e2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103e31:	89 14 24             	mov    %edx,(%esp)
80103e34:	e8 47 e5 ff ff       	call   80102380 <kfree>
        freevm(p->pgdir);
80103e39:	8b 53 04             	mov    0x4(%ebx),%edx
        p->kstack = 0;
80103e3c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103e43:	89 14 24             	mov    %edx,(%esp)
80103e46:	e8 f5 2a 00 00       	call   80106940 <freevm>
        p->pid = 0;
80103e4b:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103e52:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103e59:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103e5d:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103e64:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103e6b:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103e72:	e8 79 04 00 00       	call   801042f0 <release>
        return pid;
80103e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103e7a:	eb a5                	jmp    80103e21 <wait+0x91>
80103e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103e80 <yield>:
{
80103e80:	55                   	push   %ebp
80103e81:	89 e5                	mov    %esp,%ebp
80103e83:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e86:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103e8d:	e8 ae 04 00 00       	call   80104340 <acquire>
  myproc()->state = RUNNABLE;
80103e92:	e8 d9 fb ff ff       	call   80103a70 <myproc>
80103e97:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103e9e:	e8 8d fd ff ff       	call   80103c30 <sched>
  release(&ptable.lock);
80103ea3:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103eaa:	e8 41 04 00 00       	call   801042f0 <release>
}
80103eaf:	c9                   	leave  
80103eb0:	c3                   	ret    
80103eb1:	eb 0d                	jmp    80103ec0 <exit>
80103eb3:	90                   	nop
80103eb4:	90                   	nop
80103eb5:	90                   	nop
80103eb6:	90                   	nop
80103eb7:	90                   	nop
80103eb8:	90                   	nop
80103eb9:	90                   	nop
80103eba:	90                   	nop
80103ebb:	90                   	nop
80103ebc:	90                   	nop
80103ebd:	90                   	nop
80103ebe:	90                   	nop
80103ebf:	90                   	nop

80103ec0 <exit>:
{
80103ec0:	55                   	push   %ebp
80103ec1:	89 e5                	mov    %esp,%ebp
80103ec3:	56                   	push   %esi
    panic("init exiting");
80103ec4:	31 f6                	xor    %esi,%esi
{
80103ec6:	53                   	push   %ebx
80103ec7:	83 ec 10             	sub    $0x10,%esp
  struct proc *curproc = myproc();
80103eca:	e8 a1 fb ff ff       	call   80103a70 <myproc>
  if(curproc == initproc)
80103ecf:	3b 05 c0 a5 10 80    	cmp    0x8010a5c0,%eax
  struct proc *curproc = myproc();
80103ed5:	89 c3                	mov    %eax,%ebx
  if(curproc == initproc)
80103ed7:	0f 84 fd 00 00 00    	je     80103fda <exit+0x11a>
80103edd:	8d 76 00             	lea    0x0(%esi),%esi
    if(curproc->ofile[fd]){
80103ee0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103ee4:	85 c0                	test   %eax,%eax
80103ee6:	74 10                	je     80103ef8 <exit+0x38>
      fileclose(curproc->ofile[fd]);
80103ee8:	89 04 24             	mov    %eax,(%esp)
80103eeb:	e8 60 d1 ff ff       	call   80101050 <fileclose>
      curproc->ofile[fd] = 0;
80103ef0:	c7 44 b3 28 00 00 00 	movl   $0x0,0x28(%ebx,%esi,4)
80103ef7:	00 
  for(fd = 0; fd < NOFILE; fd++){
80103ef8:	83 c6 01             	add    $0x1,%esi
80103efb:	83 fe 10             	cmp    $0x10,%esi
80103efe:	75 e0                	jne    80103ee0 <exit+0x20>
  begin_op();
80103f00:	e8 fb ed ff ff       	call   80102d00 <begin_op>
  iput(curproc->cwd);
80103f05:	8b 43 68             	mov    0x68(%ebx),%eax
80103f08:	89 04 24             	mov    %eax,(%esp)
80103f0b:	e8 60 db ff ff       	call   80101a70 <iput>
  end_op();
80103f10:	e8 bb ec ff ff       	call   80102bd0 <end_op>
  curproc->cwd = 0;
80103f15:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)
  acquire(&ptable.lock);
80103f1c:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103f23:	e8 18 04 00 00       	call   80104340 <acquire>
  wakeup1(curproc->parent);
80103f28:	8b 43 14             	mov    0x14(%ebx),%eax
exit(void)
80103f2b:	ba 74 2d 11 80       	mov    $0x80112d74,%edx
80103f30:	eb 14                	jmp    80103f46 <exit+0x86>
80103f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f38:	81 c2 88 00 00 00    	add    $0x88,%edx
80103f3e:	81 fa 74 4f 11 80    	cmp    $0x80114f74,%edx
80103f44:	74 20                	je     80103f66 <exit+0xa6>
    if(p->state == SLEEPING && p->chan == chan)
80103f46:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103f4a:	75 ec                	jne    80103f38 <exit+0x78>
80103f4c:	3b 42 20             	cmp    0x20(%edx),%eax
80103f4f:	75 e7                	jne    80103f38 <exit+0x78>
      p->state = RUNNABLE;
80103f51:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f58:	81 c2 88 00 00 00    	add    $0x88,%edx
80103f5e:	81 fa 74 4f 11 80    	cmp    $0x80114f74,%edx
80103f64:	75 e0                	jne    80103f46 <exit+0x86>
      p->parent = initproc;
80103f66:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80103f6b:	b9 74 2d 11 80       	mov    $0x80112d74,%ecx
80103f70:	eb 14                	jmp    80103f86 <exit+0xc6>
80103f72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f78:	81 c1 88 00 00 00    	add    $0x88,%ecx
80103f7e:	81 f9 74 4f 11 80    	cmp    $0x80114f74,%ecx
80103f84:	74 3c                	je     80103fc2 <exit+0x102>
    if(p->parent == curproc){
80103f86:	3b 59 14             	cmp    0x14(%ecx),%ebx
80103f89:	75 ed                	jne    80103f78 <exit+0xb8>
      if(p->state == ZOMBIE)
80103f8b:	83 79 0c 05          	cmpl   $0x5,0xc(%ecx)
      p->parent = initproc;
80103f8f:	89 41 14             	mov    %eax,0x14(%ecx)
      if(p->state == ZOMBIE)
80103f92:	75 e4                	jne    80103f78 <exit+0xb8>
80103f94:	ba 74 2d 11 80       	mov    $0x80112d74,%edx
80103f99:	eb 13                	jmp    80103fae <exit+0xee>
80103f9b:	90                   	nop
80103f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103fa0:	81 c2 88 00 00 00    	add    $0x88,%edx
80103fa6:	81 fa 74 4f 11 80    	cmp    $0x80114f74,%edx
80103fac:	74 ca                	je     80103f78 <exit+0xb8>
    if(p->state == SLEEPING && p->chan == chan)
80103fae:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103fb2:	75 ec                	jne    80103fa0 <exit+0xe0>
80103fb4:	3b 42 20             	cmp    0x20(%edx),%eax
80103fb7:	75 e7                	jne    80103fa0 <exit+0xe0>
      p->state = RUNNABLE;
80103fb9:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
80103fc0:	eb de                	jmp    80103fa0 <exit+0xe0>
  curproc->state = ZOMBIE;
80103fc2:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
  sched();
80103fc9:	e8 62 fc ff ff       	call   80103c30 <sched>
  panic("zombie exit");
80103fce:	c7 04 24 2a 75 10 80 	movl   $0x8010752a,(%esp)
80103fd5:	e8 d6 c3 ff ff       	call   801003b0 <panic>
    panic("init exiting");
80103fda:	c7 04 24 1d 75 10 80 	movl   $0x8010751d,(%esp)
80103fe1:	e8 ca c3 ff ff       	call   801003b0 <panic>
80103fe6:	8d 76 00             	lea    0x0(%esi),%esi
80103fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ff0 <cpuid>:
cpuid() {
80103ff0:	55                   	push   %ebp
80103ff1:	89 e5                	mov    %esp,%ebp
80103ff3:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103ff6:	e8 55 f9 ff ff       	call   80103950 <mycpu>
}
80103ffb:	c9                   	leave  
  return mycpu()-cpus;
80103ffc:	2d a0 27 11 80       	sub    $0x801127a0,%eax
80104001:	c1 f8 04             	sar    $0x4,%eax
80104004:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010400a:	c3                   	ret    
8010400b:	90                   	nop
8010400c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104010 <pinit>:
{
80104010:	55                   	push   %ebp
80104011:	89 e5                	mov    %esp,%ebp
80104013:	83 ec 18             	sub    $0x18,%esp
  initlock(&ptable.lock, "ptable");
80104016:	c7 44 24 04 36 75 10 	movl   $0x80107536,0x4(%esp)
8010401d:	80 
8010401e:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80104025:	e8 46 01 00 00       	call   80104170 <initlock>
}
8010402a:	c9                   	leave  
8010402b:	c3                   	ret    
8010402c:	66 90                	xchg   %ax,%ax
8010402e:	66 90                	xchg   %ax,%ax

80104030 <holdingsleep>:
  release(&lk->lk);
}

int
holdingsleep(struct sleeplock *lk)
{
80104030:	55                   	push   %ebp
80104031:	89 e5                	mov    %esp,%ebp
80104033:	83 ec 28             	sub    $0x28,%esp
80104036:	89 75 f8             	mov    %esi,-0x8(%ebp)
80104039:	8b 75 08             	mov    0x8(%ebp),%esi
8010403c:	89 5d f4             	mov    %ebx,-0xc(%ebp)
8010403f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  int r;
  
  acquire(&lk->lk);
80104042:	8d 5e 04             	lea    0x4(%esi),%ebx
80104045:	89 1c 24             	mov    %ebx,(%esp)
80104048:	e8 f3 02 00 00       	call   80104340 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
8010404d:	8b 06                	mov    (%esi),%eax
8010404f:	85 c0                	test   %eax,%eax
80104051:	75 1d                	jne    80104070 <holdingsleep+0x40>
80104053:	31 ff                	xor    %edi,%edi
  release(&lk->lk);
80104055:	89 1c 24             	mov    %ebx,(%esp)
80104058:	e8 93 02 00 00       	call   801042f0 <release>
  return r;
}
8010405d:	89 f8                	mov    %edi,%eax
8010405f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104062:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104065:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104068:	89 ec                	mov    %ebp,%esp
8010406a:	5d                   	pop    %ebp
8010406b:	c3                   	ret    
8010406c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  r = lk->locked && (lk->pid == myproc()->pid);
80104070:	8b 76 3c             	mov    0x3c(%esi),%esi
80104073:	bf 01 00 00 00       	mov    $0x1,%edi
80104078:	e8 f3 f9 ff ff       	call   80103a70 <myproc>
8010407d:	3b 70 10             	cmp    0x10(%eax),%esi
80104080:	75 d1                	jne    80104053 <holdingsleep+0x23>
80104082:	eb d1                	jmp    80104055 <holdingsleep+0x25>
80104084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010408a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104090 <releasesleep>:
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	83 ec 18             	sub    $0x18,%esp
80104096:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104099:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010409c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  acquire(&lk->lk);
8010409f:	8d 73 04             	lea    0x4(%ebx),%esi
801040a2:	89 34 24             	mov    %esi,(%esp)
801040a5:	e8 96 02 00 00       	call   80104340 <acquire>
  lk->locked = 0;
801040aa:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801040b0:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801040b7:	89 1c 24             	mov    %ebx,(%esp)
801040ba:	e8 e1 f5 ff ff       	call   801036a0 <wakeup>
}
801040bf:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  release(&lk->lk);
801040c2:	89 75 08             	mov    %esi,0x8(%ebp)
}
801040c5:	8b 75 fc             	mov    -0x4(%ebp),%esi
801040c8:	89 ec                	mov    %ebp,%esp
801040ca:	5d                   	pop    %ebp
  release(&lk->lk);
801040cb:	e9 20 02 00 00       	jmp    801042f0 <release>

801040d0 <acquiresleep>:
{
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	56                   	push   %esi
801040d4:	53                   	push   %ebx
801040d5:	83 ec 10             	sub    $0x10,%esp
801040d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801040db:	8d 73 04             	lea    0x4(%ebx),%esi
801040de:	89 34 24             	mov    %esi,(%esp)
801040e1:	e8 5a 02 00 00       	call   80104340 <acquire>
  while (lk->locked) {
801040e6:	8b 0b                	mov    (%ebx),%ecx
801040e8:	85 c9                	test   %ecx,%ecx
801040ea:	74 16                	je     80104102 <acquiresleep+0x32>
801040ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sleep(lk, &lk->lk);
801040f0:	89 74 24 04          	mov    %esi,0x4(%esp)
801040f4:	89 1c 24             	mov    %ebx,(%esp)
801040f7:	e8 d4 fb ff ff       	call   80103cd0 <sleep>
  while (lk->locked) {
801040fc:	8b 13                	mov    (%ebx),%edx
801040fe:	85 d2                	test   %edx,%edx
80104100:	75 ee                	jne    801040f0 <acquiresleep+0x20>
  lk->locked = 1;
80104102:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104108:	e8 63 f9 ff ff       	call   80103a70 <myproc>
8010410d:	8b 40 10             	mov    0x10(%eax),%eax
80104110:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104113:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104116:	83 c4 10             	add    $0x10,%esp
80104119:	5b                   	pop    %ebx
8010411a:	5e                   	pop    %esi
8010411b:	5d                   	pop    %ebp
  release(&lk->lk);
8010411c:	e9 cf 01 00 00       	jmp    801042f0 <release>
80104121:	eb 0d                	jmp    80104130 <initsleeplock>
80104123:	90                   	nop
80104124:	90                   	nop
80104125:	90                   	nop
80104126:	90                   	nop
80104127:	90                   	nop
80104128:	90                   	nop
80104129:	90                   	nop
8010412a:	90                   	nop
8010412b:	90                   	nop
8010412c:	90                   	nop
8010412d:	90                   	nop
8010412e:	90                   	nop
8010412f:	90                   	nop

80104130 <initsleeplock>:
{
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	53                   	push   %ebx
80104134:	83 ec 14             	sub    $0x14,%esp
80104137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010413a:	c7 44 24 04 a8 75 10 	movl   $0x801075a8,0x4(%esp)
80104141:	80 
80104142:	8d 43 04             	lea    0x4(%ebx),%eax
80104145:	89 04 24             	mov    %eax,(%esp)
80104148:	e8 23 00 00 00       	call   80104170 <initlock>
  lk->name = name;
8010414d:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
80104150:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80104156:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010415d:	89 43 38             	mov    %eax,0x38(%ebx)
}
80104160:	83 c4 14             	add    $0x14,%esp
80104163:	5b                   	pop    %ebx
80104164:	5d                   	pop    %ebp
80104165:	c3                   	ret    
80104166:	66 90                	xchg   %ax,%ax
80104168:	66 90                	xchg   %ax,%ax
8010416a:	66 90                	xchg   %ax,%ax
8010416c:	66 90                	xchg   %ax,%ax
8010416e:	66 90                	xchg   %ax,%ax

80104170 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104176:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104179:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010417f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80104182:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104189:	5d                   	pop    %ebp
8010418a:	c3                   	ret    
8010418b:	90                   	nop
8010418c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104190 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104190:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104191:	31 c0                	xor    %eax,%eax
{
80104193:	89 e5                	mov    %esp,%ebp
80104195:	53                   	push   %ebx
  ebp = (uint*)v - 2;
80104196:	8b 55 08             	mov    0x8(%ebp),%edx
{
80104199:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ebp = (uint*)v - 2;
8010419c:	83 ea 08             	sub    $0x8,%edx
8010419f:	90                   	nop
  for(i = 0; i < 10; i++){
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801041a0:	8d 8a 00 00 00 80    	lea    -0x80000000(%edx),%ecx
801041a6:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
801041ac:	77 1a                	ja     801041c8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801041ae:	8b 4a 04             	mov    0x4(%edx),%ecx
801041b1:	89 0c 83             	mov    %ecx,(%ebx,%eax,4)
  for(i = 0; i < 10; i++){
801041b4:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
801041b7:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
801041b9:	83 f8 0a             	cmp    $0xa,%eax
801041bc:	75 e2                	jne    801041a0 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801041be:	5b                   	pop    %ebx
801041bf:	5d                   	pop    %ebp
801041c0:	c3                   	ret    
801041c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(; i < 10; i++)
801041c8:	83 f8 09             	cmp    $0x9,%eax
801041cb:	7f f1                	jg     801041be <getcallerpcs+0x2e>
    ebp = (uint*)ebp[0]; // saved %ebp
801041cd:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  for(; i < 10; i++)
801041d0:	83 c0 01             	add    $0x1,%eax
    pcs[i] = 0;
801041d3:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  for(; i < 10; i++)
801041d9:	83 c2 04             	add    $0x4,%edx
801041dc:	83 f8 0a             	cmp    $0xa,%eax
801041df:	75 ef                	jne    801041d0 <getcallerpcs+0x40>
}
801041e1:	5b                   	pop    %ebx
801041e2:	5d                   	pop    %ebp
801041e3:	c3                   	ret    
801041e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801041f0 <popcli>:
  mycpu()->ncli += 1;
}

void
popcli(void)
{
801041f0:	55                   	push   %ebp
801041f1:	89 e5                	mov    %esp,%ebp
801041f3:	83 ec 18             	sub    $0x18,%esp
801041f6:	9c                   	pushf  
801041f7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801041f8:	f6 c4 02             	test   $0x2,%ah
801041fb:	75 49                	jne    80104246 <popcli+0x56>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801041fd:	e8 4e f7 ff ff       	call   80103950 <mycpu>
80104202:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104208:	83 ea 01             	sub    $0x1,%edx
8010420b:	85 d2                	test   %edx,%edx
8010420d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104213:	78 25                	js     8010423a <popcli+0x4a>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104215:	e8 36 f7 ff ff       	call   80103950 <mycpu>
8010421a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104220:	85 d2                	test   %edx,%edx
80104222:	74 04                	je     80104228 <popcli+0x38>
    sti();
}
80104224:	c9                   	leave  
80104225:	c3                   	ret    
80104226:	66 90                	xchg   %ax,%ax
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104228:	e8 23 f7 ff ff       	call   80103950 <mycpu>
8010422d:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
80104233:	85 c0                	test   %eax,%eax
80104235:	74 ed                	je     80104224 <popcli+0x34>
  asm volatile("sti");
80104237:	fb                   	sti    
}
80104238:	c9                   	leave  
80104239:	c3                   	ret    
    panic("popcli");
8010423a:	c7 04 24 ca 75 10 80 	movl   $0x801075ca,(%esp)
80104241:	e8 6a c1 ff ff       	call   801003b0 <panic>
    panic("popcli - interruptible");
80104246:	c7 04 24 b3 75 10 80 	movl   $0x801075b3,(%esp)
8010424d:	e8 5e c1 ff ff       	call   801003b0 <panic>
80104252:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104260 <pushcli>:
{
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	53                   	push   %ebx
80104264:	83 ec 04             	sub    $0x4,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104267:	9c                   	pushf  
80104268:	5b                   	pop    %ebx
  asm volatile("cli");
80104269:	fa                   	cli    
  if(mycpu()->ncli == 0)
8010426a:	e8 e1 f6 ff ff       	call   80103950 <mycpu>
8010426f:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104275:	85 c9                	test   %ecx,%ecx
80104277:	75 11                	jne    8010428a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104279:	e8 d2 f6 ff ff       	call   80103950 <mycpu>
8010427e:	81 e3 00 02 00 00    	and    $0x200,%ebx
80104284:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010428a:	e8 c1 f6 ff ff       	call   80103950 <mycpu>
8010428f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104296:	83 c4 04             	add    $0x4,%esp
80104299:	5b                   	pop    %ebx
8010429a:	5d                   	pop    %ebp
8010429b:	c3                   	ret    
8010429c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042a0 <holding>:
{
801042a0:	55                   	push   %ebp
801042a1:	89 e5                	mov    %esp,%ebp
801042a3:	83 ec 08             	sub    $0x8,%esp
801042a6:	89 1c 24             	mov    %ebx,(%esp)
801042a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042ac:	89 74 24 04          	mov    %esi,0x4(%esp)
  pushcli();
801042b0:	e8 ab ff ff ff       	call   80104260 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801042b5:	8b 33                	mov    (%ebx),%esi
801042b7:	85 f6                	test   %esi,%esi
801042b9:	75 15                	jne    801042d0 <holding+0x30>
801042bb:	31 f6                	xor    %esi,%esi
  popcli();
801042bd:	e8 2e ff ff ff       	call   801041f0 <popcli>
}
801042c2:	89 f0                	mov    %esi,%eax
801042c4:	8b 1c 24             	mov    (%esp),%ebx
801042c7:	8b 74 24 04          	mov    0x4(%esp),%esi
801042cb:	89 ec                	mov    %ebp,%esp
801042cd:	5d                   	pop    %ebp
801042ce:	c3                   	ret    
801042cf:	90                   	nop
  r = lock->locked && lock->cpu == mycpu();
801042d0:	8b 5b 08             	mov    0x8(%ebx),%ebx
801042d3:	be 01 00 00 00       	mov    $0x1,%esi
801042d8:	e8 73 f6 ff ff       	call   80103950 <mycpu>
801042dd:	39 c3                	cmp    %eax,%ebx
801042df:	75 da                	jne    801042bb <holding+0x1b>
801042e1:	eb da                	jmp    801042bd <holding+0x1d>
801042e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042f0 <release>:
{
801042f0:	55                   	push   %ebp
801042f1:	89 e5                	mov    %esp,%ebp
801042f3:	53                   	push   %ebx
801042f4:	83 ec 14             	sub    $0x14,%esp
801042f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
801042fa:	89 1c 24             	mov    %ebx,(%esp)
801042fd:	e8 9e ff ff ff       	call   801042a0 <holding>
80104302:	85 c0                	test   %eax,%eax
80104304:	74 23                	je     80104329 <release+0x39>
  lk->pcs[0] = 0;
80104306:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
8010430d:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80104314:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104319:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
8010431f:	83 c4 14             	add    $0x14,%esp
80104322:	5b                   	pop    %ebx
80104323:	5d                   	pop    %ebp
  popcli();
80104324:	e9 c7 fe ff ff       	jmp    801041f0 <popcli>
    panic("release");
80104329:	c7 04 24 d1 75 10 80 	movl   $0x801075d1,(%esp)
80104330:	e8 7b c0 ff ff       	call   801003b0 <panic>
80104335:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104340 <acquire>:
{
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	53                   	push   %ebx
80104344:	83 ec 14             	sub    $0x14,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104347:	e8 14 ff ff ff       	call   80104260 <pushcli>
  if(holding(lk))
8010434c:	8b 45 08             	mov    0x8(%ebp),%eax
8010434f:	89 04 24             	mov    %eax,(%esp)
80104352:	e8 49 ff ff ff       	call   801042a0 <holding>
80104357:	85 c0                	test   %eax,%eax
80104359:	75 3c                	jne    80104397 <acquire+0x57>
  asm volatile("lock; xchgl %0, %1" :
8010435b:	b9 01 00 00 00       	mov    $0x1,%ecx
  while(xchg(&lk->locked, 1) != 0)
80104360:	8b 55 08             	mov    0x8(%ebp),%edx
80104363:	89 c8                	mov    %ecx,%eax
80104365:	f0 87 02             	lock xchg %eax,(%edx)
80104368:	85 c0                	test   %eax,%eax
8010436a:	75 f4                	jne    80104360 <acquire+0x20>
  __sync_synchronize();
8010436c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104371:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104374:	e8 d7 f5 ff ff       	call   80103950 <mycpu>
80104379:	89 43 08             	mov    %eax,0x8(%ebx)
  getcallerpcs(&lk, lk->pcs);
8010437c:	8b 45 08             	mov    0x8(%ebp),%eax
8010437f:	83 c0 0c             	add    $0xc,%eax
80104382:	89 44 24 04          	mov    %eax,0x4(%esp)
80104386:	8d 45 08             	lea    0x8(%ebp),%eax
80104389:	89 04 24             	mov    %eax,(%esp)
8010438c:	e8 ff fd ff ff       	call   80104190 <getcallerpcs>
}
80104391:	83 c4 14             	add    $0x14,%esp
80104394:	5b                   	pop    %ebx
80104395:	5d                   	pop    %ebp
80104396:	c3                   	ret    
    panic("acquire");
80104397:	c7 04 24 d9 75 10 80 	movl   $0x801075d9,(%esp)
8010439e:	e8 0d c0 ff ff       	call   801003b0 <panic>
801043a3:	66 90                	xchg   %ax,%ax
801043a5:	66 90                	xchg   %ax,%ax
801043a7:	66 90                	xchg   %ax,%ax
801043a9:	66 90                	xchg   %ax,%ax
801043ab:	66 90                	xchg   %ax,%ax
801043ad:	66 90                	xchg   %ax,%ax
801043af:	90                   	nop

801043b0 <memset>:
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	83 ec 08             	sub    $0x8,%esp
801043b6:	8b 55 08             	mov    0x8(%ebp),%edx
801043b9:	89 1c 24             	mov    %ebx,(%esp)
801043bc:	8b 45 0c             	mov    0xc(%ebp),%eax
801043bf:	89 7c 24 04          	mov    %edi,0x4(%esp)
801043c3:	8b 4d 10             	mov    0x10(%ebp),%ecx
801043c6:	f6 c2 03             	test   $0x3,%dl
801043c9:	75 05                	jne    801043d0 <memset+0x20>
801043cb:	f6 c1 03             	test   $0x3,%cl
801043ce:	74 18                	je     801043e8 <memset+0x38>
801043d0:	89 d7                	mov    %edx,%edi
801043d2:	fc                   	cld    
801043d3:	f3 aa                	rep stos %al,%es:(%edi)
801043d5:	89 d0                	mov    %edx,%eax
801043d7:	8b 1c 24             	mov    (%esp),%ebx
801043da:	8b 7c 24 04          	mov    0x4(%esp),%edi
801043de:	89 ec                	mov    %ebp,%esp
801043e0:	5d                   	pop    %ebp
801043e1:	c3                   	ret    
801043e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043e8:	0f b6 f8             	movzbl %al,%edi
801043eb:	89 f8                	mov    %edi,%eax
801043ed:	89 fb                	mov    %edi,%ebx
801043ef:	c1 e0 18             	shl    $0x18,%eax
801043f2:	c1 e3 10             	shl    $0x10,%ebx
801043f5:	09 d8                	or     %ebx,%eax
801043f7:	09 f8                	or     %edi,%eax
801043f9:	c1 e7 08             	shl    $0x8,%edi
801043fc:	09 f8                	or     %edi,%eax
801043fe:	89 d7                	mov    %edx,%edi
80104400:	c1 e9 02             	shr    $0x2,%ecx
80104403:	fc                   	cld    
80104404:	f3 ab                	rep stos %eax,%es:(%edi)
80104406:	eb cd                	jmp    801043d5 <memset+0x25>
80104408:	90                   	nop
80104409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104410 <memcmp>:
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	57                   	push   %edi
80104414:	56                   	push   %esi
80104415:	53                   	push   %ebx
80104416:	8b 55 10             	mov    0x10(%ebp),%edx
80104419:	8b 75 08             	mov    0x8(%ebp),%esi
8010441c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010441f:	85 d2                	test   %edx,%edx
80104421:	74 2d                	je     80104450 <memcmp+0x40>
80104423:	0f b6 1e             	movzbl (%esi),%ebx
80104426:	0f b6 0f             	movzbl (%edi),%ecx
80104429:	38 cb                	cmp    %cl,%bl
8010442b:	75 2b                	jne    80104458 <memcmp+0x48>
8010442d:	83 ea 01             	sub    $0x1,%edx
80104430:	31 c0                	xor    %eax,%eax
80104432:	eb 18                	jmp    8010444c <memcmp+0x3c>
80104434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104438:	0f b6 5c 06 01       	movzbl 0x1(%esi,%eax,1),%ebx
8010443d:	83 ea 01             	sub    $0x1,%edx
80104440:	0f b6 4c 07 01       	movzbl 0x1(%edi,%eax,1),%ecx
80104445:	83 c0 01             	add    $0x1,%eax
80104448:	38 cb                	cmp    %cl,%bl
8010444a:	75 0c                	jne    80104458 <memcmp+0x48>
8010444c:	85 d2                	test   %edx,%edx
8010444e:	75 e8                	jne    80104438 <memcmp+0x28>
80104450:	31 c0                	xor    %eax,%eax
80104452:	5b                   	pop    %ebx
80104453:	5e                   	pop    %esi
80104454:	5f                   	pop    %edi
80104455:	5d                   	pop    %ebp
80104456:	c3                   	ret    
80104457:	90                   	nop
80104458:	0f b6 c3             	movzbl %bl,%eax
8010445b:	0f b6 c9             	movzbl %cl,%ecx
8010445e:	29 c8                	sub    %ecx,%eax
80104460:	5b                   	pop    %ebx
80104461:	5e                   	pop    %esi
80104462:	5f                   	pop    %edi
80104463:	5d                   	pop    %ebp
80104464:	c3                   	ret    
80104465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104470 <memmove>:
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	57                   	push   %edi
80104474:	56                   	push   %esi
80104475:	53                   	push   %ebx
80104476:	8b 45 08             	mov    0x8(%ebp),%eax
80104479:	8b 75 0c             	mov    0xc(%ebp),%esi
8010447c:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010447f:	39 c6                	cmp    %eax,%esi
80104481:	73 2d                	jae    801044b0 <memmove+0x40>
80104483:	8d 3c 1e             	lea    (%esi,%ebx,1),%edi
80104486:	39 f8                	cmp    %edi,%eax
80104488:	73 26                	jae    801044b0 <memmove+0x40>
8010448a:	85 db                	test   %ebx,%ebx
8010448c:	74 1d                	je     801044ab <memmove+0x3b>
8010448e:	8d 34 18             	lea    (%eax,%ebx,1),%esi
80104491:	31 d2                	xor    %edx,%edx
80104493:	90                   	nop
80104494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104498:	0f b6 4c 17 ff       	movzbl -0x1(%edi,%edx,1),%ecx
8010449d:	88 4c 16 ff          	mov    %cl,-0x1(%esi,%edx,1)
801044a1:	83 ea 01             	sub    $0x1,%edx
801044a4:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
801044a7:	85 c9                	test   %ecx,%ecx
801044a9:	75 ed                	jne    80104498 <memmove+0x28>
801044ab:	5b                   	pop    %ebx
801044ac:	5e                   	pop    %esi
801044ad:	5f                   	pop    %edi
801044ae:	5d                   	pop    %ebp
801044af:	c3                   	ret    
801044b0:	31 d2                	xor    %edx,%edx
801044b2:	85 db                	test   %ebx,%ebx
801044b4:	74 f5                	je     801044ab <memmove+0x3b>
801044b6:	66 90                	xchg   %ax,%ax
801044b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801044bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801044bf:	83 c2 01             	add    $0x1,%edx
801044c2:	39 d3                	cmp    %edx,%ebx
801044c4:	75 f2                	jne    801044b8 <memmove+0x48>
801044c6:	5b                   	pop    %ebx
801044c7:	5e                   	pop    %esi
801044c8:	5f                   	pop    %edi
801044c9:	5d                   	pop    %ebp
801044ca:	c3                   	ret    
801044cb:	90                   	nop
801044cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044d0 <memcpy>:
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	5d                   	pop    %ebp
801044d4:	eb 9a                	jmp    80104470 <memmove>
801044d6:	8d 76 00             	lea    0x0(%esi),%esi
801044d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044e0 <strncmp>:
801044e0:	55                   	push   %ebp
801044e1:	89 e5                	mov    %esp,%ebp
801044e3:	57                   	push   %edi
801044e4:	56                   	push   %esi
801044e5:	53                   	push   %ebx
801044e6:	8b 7d 10             	mov    0x10(%ebp),%edi
801044e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801044ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801044ef:	85 ff                	test   %edi,%edi
801044f1:	74 3d                	je     80104530 <strncmp+0x50>
801044f3:	0f b6 01             	movzbl (%ecx),%eax
801044f6:	84 c0                	test   %al,%al
801044f8:	75 18                	jne    80104512 <strncmp+0x32>
801044fa:	eb 3c                	jmp    80104538 <strncmp+0x58>
801044fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104500:	83 ef 01             	sub    $0x1,%edi
80104503:	74 2b                	je     80104530 <strncmp+0x50>
80104505:	83 c1 01             	add    $0x1,%ecx
80104508:	83 c3 01             	add    $0x1,%ebx
8010450b:	0f b6 01             	movzbl (%ecx),%eax
8010450e:	84 c0                	test   %al,%al
80104510:	74 26                	je     80104538 <strncmp+0x58>
80104512:	0f b6 33             	movzbl (%ebx),%esi
80104515:	89 f2                	mov    %esi,%edx
80104517:	38 d0                	cmp    %dl,%al
80104519:	74 e5                	je     80104500 <strncmp+0x20>
8010451b:	81 e6 ff 00 00 00    	and    $0xff,%esi
80104521:	0f b6 c0             	movzbl %al,%eax
80104524:	29 f0                	sub    %esi,%eax
80104526:	5b                   	pop    %ebx
80104527:	5e                   	pop    %esi
80104528:	5f                   	pop    %edi
80104529:	5d                   	pop    %ebp
8010452a:	c3                   	ret    
8010452b:	90                   	nop
8010452c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104530:	31 c0                	xor    %eax,%eax
80104532:	5b                   	pop    %ebx
80104533:	5e                   	pop    %esi
80104534:	5f                   	pop    %edi
80104535:	5d                   	pop    %ebp
80104536:	c3                   	ret    
80104537:	90                   	nop
80104538:	0f b6 33             	movzbl (%ebx),%esi
8010453b:	eb de                	jmp    8010451b <strncmp+0x3b>
8010453d:	8d 76 00             	lea    0x0(%esi),%esi

80104540 <strncpy>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	8b 45 08             	mov    0x8(%ebp),%eax
80104546:	56                   	push   %esi
80104547:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010454a:	53                   	push   %ebx
8010454b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010454e:	89 c3                	mov    %eax,%ebx
80104550:	eb 09                	jmp    8010455b <strncpy+0x1b>
80104552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104558:	83 c6 01             	add    $0x1,%esi
8010455b:	83 e9 01             	sub    $0x1,%ecx
8010455e:	8d 51 01             	lea    0x1(%ecx),%edx
80104561:	85 d2                	test   %edx,%edx
80104563:	7e 0c                	jle    80104571 <strncpy+0x31>
80104565:	0f b6 16             	movzbl (%esi),%edx
80104568:	88 13                	mov    %dl,(%ebx)
8010456a:	83 c3 01             	add    $0x1,%ebx
8010456d:	84 d2                	test   %dl,%dl
8010456f:	75 e7                	jne    80104558 <strncpy+0x18>
80104571:	31 d2                	xor    %edx,%edx
80104573:	85 c9                	test   %ecx,%ecx
80104575:	7e 0c                	jle    80104583 <strncpy+0x43>
80104577:	90                   	nop
80104578:	c6 04 13 00          	movb   $0x0,(%ebx,%edx,1)
8010457c:	83 c2 01             	add    $0x1,%edx
8010457f:	39 ca                	cmp    %ecx,%edx
80104581:	75 f5                	jne    80104578 <strncpy+0x38>
80104583:	5b                   	pop    %ebx
80104584:	5e                   	pop    %esi
80104585:	5d                   	pop    %ebp
80104586:	c3                   	ret    
80104587:	89 f6                	mov    %esi,%esi
80104589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104590 <safestrcpy>:
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	8b 55 10             	mov    0x10(%ebp),%edx
80104596:	56                   	push   %esi
80104597:	8b 45 08             	mov    0x8(%ebp),%eax
8010459a:	53                   	push   %ebx
8010459b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010459e:	85 d2                	test   %edx,%edx
801045a0:	7e 1f                	jle    801045c1 <safestrcpy+0x31>
801045a2:	89 c1                	mov    %eax,%ecx
801045a4:	eb 05                	jmp    801045ab <safestrcpy+0x1b>
801045a6:	66 90                	xchg   %ax,%ax
801045a8:	83 c6 01             	add    $0x1,%esi
801045ab:	83 ea 01             	sub    $0x1,%edx
801045ae:	85 d2                	test   %edx,%edx
801045b0:	7e 0c                	jle    801045be <safestrcpy+0x2e>
801045b2:	0f b6 1e             	movzbl (%esi),%ebx
801045b5:	88 19                	mov    %bl,(%ecx)
801045b7:	83 c1 01             	add    $0x1,%ecx
801045ba:	84 db                	test   %bl,%bl
801045bc:	75 ea                	jne    801045a8 <safestrcpy+0x18>
801045be:	c6 01 00             	movb   $0x0,(%ecx)
801045c1:	5b                   	pop    %ebx
801045c2:	5e                   	pop    %esi
801045c3:	5d                   	pop    %ebp
801045c4:	c3                   	ret    
801045c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045d0 <strlen>:
801045d0:	55                   	push   %ebp
801045d1:	31 c0                	xor    %eax,%eax
801045d3:	89 e5                	mov    %esp,%ebp
801045d5:	8b 55 08             	mov    0x8(%ebp),%edx
801045d8:	80 3a 00             	cmpb   $0x0,(%edx)
801045db:	74 0c                	je     801045e9 <strlen+0x19>
801045dd:	8d 76 00             	lea    0x0(%esi),%esi
801045e0:	83 c0 01             	add    $0x1,%eax
801045e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801045e7:	75 f7                	jne    801045e0 <strlen+0x10>
801045e9:	5d                   	pop    %ebp
801045ea:	c3                   	ret    

801045eb <swtch>:
801045eb:	8b 44 24 04          	mov    0x4(%esp),%eax
801045ef:	8b 54 24 08          	mov    0x8(%esp),%edx
801045f3:	55                   	push   %ebp
801045f4:	53                   	push   %ebx
801045f5:	56                   	push   %esi
801045f6:	57                   	push   %edi
801045f7:	89 20                	mov    %esp,(%eax)
801045f9:	89 d4                	mov    %edx,%esp
801045fb:	5f                   	pop    %edi
801045fc:	5e                   	pop    %esi
801045fd:	5b                   	pop    %ebx
801045fe:	5d                   	pop    %ebp
801045ff:	c3                   	ret    

80104600 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104600:	55                   	push   %ebp
80104601:	89 e5                	mov    %esp,%ebp
80104603:	53                   	push   %ebx
80104604:	83 ec 04             	sub    $0x4,%esp
80104607:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010460a:	e8 61 f4 ff ff       	call   80103a70 <myproc>

  if(addr >= curproc->sz)
8010460f:	39 18                	cmp    %ebx,(%eax)
80104611:	77 0d                	ja     80104620 <fetchstr+0x20>
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
80104613:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
80104618:	83 c4 04             	add    $0x4,%esp
8010461b:	5b                   	pop    %ebx
8010461c:	5d                   	pop    %ebp
8010461d:	c3                   	ret    
8010461e:	66 90                	xchg   %ax,%ax
  *pp = (char*)addr;
80104620:	8b 55 0c             	mov    0xc(%ebp),%edx
80104623:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
80104625:	8b 08                	mov    (%eax),%ecx
  for(s = *pp; s < ep; s++){
80104627:	39 cb                	cmp    %ecx,%ebx
80104629:	73 e8                	jae    80104613 <fetchstr+0x13>
    if(*s == 0)
8010462b:	31 c0                	xor    %eax,%eax
8010462d:	89 da                	mov    %ebx,%edx
8010462f:	80 3b 00             	cmpb   $0x0,(%ebx)
80104632:	74 e4                	je     80104618 <fetchstr+0x18>
80104634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(s = *pp; s < ep; s++){
80104638:	83 c2 01             	add    $0x1,%edx
8010463b:	39 d1                	cmp    %edx,%ecx
8010463d:	76 d4                	jbe    80104613 <fetchstr+0x13>
    if(*s == 0)
8010463f:	80 3a 00             	cmpb   $0x0,(%edx)
80104642:	75 f4                	jne    80104638 <fetchstr+0x38>
80104644:	89 d0                	mov    %edx,%eax
80104646:	29 d8                	sub    %ebx,%eax
80104648:	eb ce                	jmp    80104618 <fetchstr+0x18>
8010464a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104650 <fetchint>:
{
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	53                   	push   %ebx
80104654:	83 ec 04             	sub    $0x4,%esp
80104657:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010465a:	e8 11 f4 ff ff       	call   80103a70 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010465f:	8b 00                	mov    (%eax),%eax
80104661:	39 d8                	cmp    %ebx,%eax
80104663:	77 0b                	ja     80104670 <fetchint+0x20>
  return 0;
80104665:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010466a:	83 c4 04             	add    $0x4,%esp
8010466d:	5b                   	pop    %ebx
8010466e:	5d                   	pop    %ebp
8010466f:	c3                   	ret    
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104670:	8d 53 04             	lea    0x4(%ebx),%edx
80104673:	39 d0                	cmp    %edx,%eax
80104675:	72 ee                	jb     80104665 <fetchint+0x15>
  *ip = *(int*)(addr);
80104677:	8b 45 0c             	mov    0xc(%ebp),%eax
8010467a:	8b 13                	mov    (%ebx),%edx
8010467c:	89 10                	mov    %edx,(%eax)
8010467e:	31 c0                	xor    %eax,%eax
  return 0;
80104680:	eb e8                	jmp    8010466a <fetchint+0x1a>
80104682:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104690 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	83 ec 08             	sub    $0x8,%esp
80104696:	89 1c 24             	mov    %ebx,(%esp)
80104699:	89 74 24 04          	mov    %esi,0x4(%esp)
8010469d:	8b 5d 08             	mov    0x8(%ebp),%ebx
801046a0:	8b 75 0c             	mov    0xc(%ebp),%esi
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801046a3:	e8 c8 f3 ff ff       	call   80103a70 <myproc>
801046a8:	89 75 0c             	mov    %esi,0xc(%ebp)
801046ab:	8b 40 18             	mov    0x18(%eax),%eax
801046ae:	8b 40 44             	mov    0x44(%eax),%eax
801046b1:	8d 44 98 04          	lea    0x4(%eax,%ebx,4),%eax
801046b5:	89 45 08             	mov    %eax,0x8(%ebp)
}
801046b8:	8b 1c 24             	mov    (%esp),%ebx
801046bb:	8b 74 24 04          	mov    0x4(%esp),%esi
801046bf:	89 ec                	mov    %ebp,%esp
801046c1:	5d                   	pop    %ebp
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801046c2:	eb 8c                	jmp    80104650 <fetchint>
801046c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801046d0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	83 ec 28             	sub    $0x28,%esp
  int addr;
  if(argint(n, &addr) < 0)
801046d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801046d9:	89 44 24 04          	mov    %eax,0x4(%esp)
801046dd:	8b 45 08             	mov    0x8(%ebp),%eax
801046e0:	89 04 24             	mov    %eax,(%esp)
801046e3:	e8 a8 ff ff ff       	call   80104690 <argint>
801046e8:	89 c2                	mov    %eax,%edx
801046ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046ef:	85 d2                	test   %edx,%edx
801046f1:	78 12                	js     80104705 <argstr+0x35>
    return -1;
  return fetchstr(addr, pp);
801046f3:	8b 45 0c             	mov    0xc(%ebp),%eax
801046f6:	89 44 24 04          	mov    %eax,0x4(%esp)
801046fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
801046fd:	89 04 24             	mov    %eax,(%esp)
80104700:	e8 fb fe ff ff       	call   80104600 <fetchstr>
}
80104705:	c9                   	leave  
80104706:	c3                   	ret    
80104707:	89 f6                	mov    %esi,%esi
80104709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104710 <argptr>:
{
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	83 ec 28             	sub    $0x28,%esp
80104716:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104719:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010471c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  struct proc *curproc = myproc();
8010471f:	e8 4c f3 ff ff       	call   80103a70 <myproc>
80104724:	89 c6                	mov    %eax,%esi
  if(argint(n, &i) < 0)
80104726:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104729:	89 44 24 04          	mov    %eax,0x4(%esp)
8010472d:	8b 45 08             	mov    0x8(%ebp),%eax
80104730:	89 04 24             	mov    %eax,(%esp)
80104733:	e8 58 ff ff ff       	call   80104690 <argint>
80104738:	85 c0                	test   %eax,%eax
8010473a:	79 14                	jns    80104750 <argptr+0x40>
  return 0;
8010473c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104741:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104744:	8b 75 fc             	mov    -0x4(%ebp),%esi
80104747:	89 ec                	mov    %ebp,%esp
80104749:	5d                   	pop    %ebp
8010474a:	c3                   	ret    
8010474b:	90                   	nop
8010474c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104750:	85 db                	test   %ebx,%ebx
80104752:	78 e8                	js     8010473c <argptr+0x2c>
80104754:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104757:	8b 16                	mov    (%esi),%edx
80104759:	39 d0                	cmp    %edx,%eax
8010475b:	73 df                	jae    8010473c <argptr+0x2c>
8010475d:	01 c3                	add    %eax,%ebx
8010475f:	39 da                	cmp    %ebx,%edx
80104761:	72 d9                	jb     8010473c <argptr+0x2c>
  *pp = (char*)i;
80104763:	8b 55 0c             	mov    0xc(%ebp),%edx
80104766:	89 02                	mov    %eax,(%edx)
80104768:	31 c0                	xor    %eax,%eax
  return 0;
8010476a:	eb d5                	jmp    80104741 <argptr+0x31>
8010476c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104770 <syscall>:
[SYS_alarm]   sys_alarm
};

void
syscall(void)
{
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	83 ec 18             	sub    $0x18,%esp
80104776:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104779:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int num;
  struct proc *curproc = myproc();
8010477c:	e8 ef f2 ff ff       	call   80103a70 <myproc>

  num = curproc->tf->eax;
80104781:	8b 58 18             	mov    0x18(%eax),%ebx
  struct proc *curproc = myproc();
80104784:	89 c6                	mov    %eax,%esi
  num = curproc->tf->eax;
80104786:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104789:	8d 50 ff             	lea    -0x1(%eax),%edx
8010478c:	83 fa 16             	cmp    $0x16,%edx
8010478f:	77 1f                	ja     801047b0 <syscall+0x40>
80104791:	8b 14 85 00 76 10 80 	mov    -0x7fef8a00(,%eax,4),%edx
80104798:	85 d2                	test   %edx,%edx
8010479a:	74 14                	je     801047b0 <syscall+0x40>
    curproc->tf->eax = syscalls[num]();
8010479c:	ff d2                	call   *%edx
8010479e:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
801047a1:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801047a4:	8b 75 fc             	mov    -0x4(%ebp),%esi
801047a7:	89 ec                	mov    %ebp,%esp
801047a9:	5d                   	pop    %ebp
801047aa:	c3                   	ret    
801047ab:	90                   	nop
801047ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
801047b0:	89 44 24 0c          	mov    %eax,0xc(%esp)
801047b4:	8d 46 6c             	lea    0x6c(%esi),%eax
801047b7:	89 44 24 08          	mov    %eax,0x8(%esp)
801047bb:	8b 46 10             	mov    0x10(%esi),%eax
801047be:	c7 04 24 e1 75 10 80 	movl   $0x801075e1,(%esp)
801047c5:	89 44 24 04          	mov    %eax,0x4(%esp)
801047c9:	e8 82 c0 ff ff       	call   80100850 <cprintf>
    curproc->tf->eax = -1;
801047ce:	8b 46 18             	mov    0x18(%esi),%eax
801047d1:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
801047d8:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801047db:	8b 75 fc             	mov    -0x4(%ebp),%esi
801047de:	89 ec                	mov    %ebp,%esp
801047e0:	5d                   	pop    %ebp
801047e1:	c3                   	ret    
801047e2:	66 90                	xchg   %ax,%ax
801047e4:	66 90                	xchg   %ax,%ax
801047e6:	66 90                	xchg   %ax,%ax
801047e8:	66 90                	xchg   %ax,%ax
801047ea:	66 90                	xchg   %ax,%ax
801047ec:	66 90                	xchg   %ax,%ax
801047ee:	66 90                	xchg   %ax,%ax

801047f0 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
801047f0:	55                   	push   %ebp
801047f1:	89 e5                	mov    %esp,%ebp
801047f3:	53                   	push   %ebx
801047f4:	89 c3                	mov    %eax,%ebx
801047f6:	83 ec 04             	sub    $0x4,%esp
  int fd;
  struct proc *curproc = myproc();
801047f9:	e8 72 f2 ff ff       	call   80103a70 <myproc>
801047fe:	89 c2                	mov    %eax,%edx
80104800:	31 c0                	xor    %eax,%eax
80104802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80104808:	8b 4c 82 28          	mov    0x28(%edx,%eax,4),%ecx
8010480c:	85 c9                	test   %ecx,%ecx
8010480e:	74 18                	je     80104828 <fdalloc+0x38>
  for(fd = 0; fd < NOFILE; fd++){
80104810:	83 c0 01             	add    $0x1,%eax
80104813:	83 f8 10             	cmp    $0x10,%eax
80104816:	75 f0                	jne    80104808 <fdalloc+0x18>
      curproc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}
80104818:	83 c4 04             	add    $0x4,%esp
  for(fd = 0; fd < NOFILE; fd++){
8010481b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104820:	5b                   	pop    %ebx
80104821:	5d                   	pop    %ebp
80104822:	c3                   	ret    
80104823:	90                   	nop
80104824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      curproc->ofile[fd] = f;
80104828:	89 5c 82 28          	mov    %ebx,0x28(%edx,%eax,4)
}
8010482c:	83 c4 04             	add    $0x4,%esp
8010482f:	5b                   	pop    %ebx
80104830:	5d                   	pop    %ebp
80104831:	c3                   	ret    
80104832:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104840 <sys_pipe>:
  return exec(path, argv);
}

int
sys_pipe(void)
{
80104840:	55                   	push   %ebp
80104841:	89 e5                	mov    %esp,%ebp
80104843:	53                   	push   %ebx
80104844:	83 ec 24             	sub    $0x24,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80104847:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010484a:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
80104851:	00 
80104852:	89 44 24 04          	mov    %eax,0x4(%esp)
80104856:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010485d:	e8 ae fe ff ff       	call   80104710 <argptr>
80104862:	85 c0                	test   %eax,%eax
80104864:	79 12                	jns    80104878 <sys_pipe+0x38>
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
80104866:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010486b:	83 c4 24             	add    $0x24,%esp
8010486e:	5b                   	pop    %ebx
8010486f:	5d                   	pop    %ebp
80104870:	c3                   	ret    
80104871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(pipealloc(&rf, &wf) < 0)
80104878:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010487b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010487f:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104882:	89 04 24             	mov    %eax,(%esp)
80104885:	e8 d6 eb ff ff       	call   80103460 <pipealloc>
8010488a:	85 c0                	test   %eax,%eax
8010488c:	78 d8                	js     80104866 <sys_pipe+0x26>
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010488e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104891:	e8 5a ff ff ff       	call   801047f0 <fdalloc>
80104896:	85 c0                	test   %eax,%eax
80104898:	89 c3                	mov    %eax,%ebx
8010489a:	78 28                	js     801048c4 <sys_pipe+0x84>
8010489c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010489f:	e8 4c ff ff ff       	call   801047f0 <fdalloc>
801048a4:	85 c0                	test   %eax,%eax
801048a6:	78 0f                	js     801048b7 <sys_pipe+0x77>
  fd[0] = fd0;
801048a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
801048ab:	89 1a                	mov    %ebx,(%edx)
  fd[1] = fd1;
801048ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
801048b0:	89 42 04             	mov    %eax,0x4(%edx)
801048b3:	31 c0                	xor    %eax,%eax
  return 0;
801048b5:	eb b4                	jmp    8010486b <sys_pipe+0x2b>
      myproc()->ofile[fd0] = 0;
801048b7:	e8 b4 f1 ff ff       	call   80103a70 <myproc>
801048bc:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
801048c3:	00 
    fileclose(rf);
801048c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801048c7:	89 04 24             	mov    %eax,(%esp)
801048ca:	e8 81 c7 ff ff       	call   80101050 <fileclose>
    fileclose(wf);
801048cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
801048d2:	89 04 24             	mov    %eax,(%esp)
801048d5:	e8 76 c7 ff ff       	call   80101050 <fileclose>
801048da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
801048df:	eb 8a                	jmp    8010486b <sys_pipe+0x2b>
801048e1:	eb 0d                	jmp    801048f0 <sys_exec>
801048e3:	90                   	nop
801048e4:	90                   	nop
801048e5:	90                   	nop
801048e6:	90                   	nop
801048e7:	90                   	nop
801048e8:	90                   	nop
801048e9:	90                   	nop
801048ea:	90                   	nop
801048eb:	90                   	nop
801048ec:	90                   	nop
801048ed:	90                   	nop
801048ee:	90                   	nop
801048ef:	90                   	nop

801048f0 <sys_exec>:
{
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	81 ec b8 00 00 00    	sub    $0xb8,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801048f9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
801048fc:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801048ff:	89 75 f8             	mov    %esi,-0x8(%ebp)
80104902:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80104905:	89 44 24 04          	mov    %eax,0x4(%esp)
80104909:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104910:	e8 bb fd ff ff       	call   801046d0 <argstr>
80104915:	85 c0                	test   %eax,%eax
80104917:	79 17                	jns    80104930 <sys_exec+0x40>
    if(i >= NELEM(argv))
80104919:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010491e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104921:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104924:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104927:	89 ec                	mov    %ebp,%esp
80104929:	5d                   	pop    %ebp
8010492a:	c3                   	ret    
8010492b:	90                   	nop
8010492c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80104930:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104933:	89 44 24 04          	mov    %eax,0x4(%esp)
80104937:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010493e:	e8 4d fd ff ff       	call   80104690 <argint>
80104943:	85 c0                	test   %eax,%eax
80104945:	78 d2                	js     80104919 <sys_exec+0x29>
  memset(argv, 0, sizeof(argv));
80104947:	8d bd 5c ff ff ff    	lea    -0xa4(%ebp),%edi
8010494d:	31 f6                	xor    %esi,%esi
8010494f:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80104956:	00 
80104957:	31 db                	xor    %ebx,%ebx
80104959:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104960:	00 
80104961:	89 3c 24             	mov    %edi,(%esp)
80104964:	e8 47 fa ff ff       	call   801043b0 <memset>
80104969:	eb 22                	jmp    8010498d <sys_exec+0x9d>
8010496b:	90                   	nop
8010496c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fetchstr(uarg, &argv[i]) < 0)
80104970:	8d 14 b7             	lea    (%edi,%esi,4),%edx
80104973:	89 54 24 04          	mov    %edx,0x4(%esp)
80104977:	89 04 24             	mov    %eax,(%esp)
8010497a:	e8 81 fc ff ff       	call   80104600 <fetchstr>
8010497f:	85 c0                	test   %eax,%eax
80104981:	78 96                	js     80104919 <sys_exec+0x29>
  for(i=0;; i++){
80104983:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
80104986:	83 fb 20             	cmp    $0x20,%ebx
  for(i=0;; i++){
80104989:	89 de                	mov    %ebx,%esi
    if(i >= NELEM(argv))
8010498b:	74 8c                	je     80104919 <sys_exec+0x29>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
8010498d:	8d 45 dc             	lea    -0x24(%ebp),%eax
80104990:	89 44 24 04          	mov    %eax,0x4(%esp)
80104994:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
8010499b:	03 45 e0             	add    -0x20(%ebp),%eax
8010499e:	89 04 24             	mov    %eax,(%esp)
801049a1:	e8 aa fc ff ff       	call   80104650 <fetchint>
801049a6:	85 c0                	test   %eax,%eax
801049a8:	0f 88 6b ff ff ff    	js     80104919 <sys_exec+0x29>
    if(uarg == 0){
801049ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
801049b1:	85 c0                	test   %eax,%eax
801049b3:	75 bb                	jne    80104970 <sys_exec+0x80>
  return exec(path, argv);
801049b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      argv[i] = 0;
801049b8:	c7 84 9d 5c ff ff ff 	movl   $0x0,-0xa4(%ebp,%ebx,4)
801049bf:	00 00 00 00 
  return exec(path, argv);
801049c3:	89 7c 24 04          	mov    %edi,0x4(%esp)
801049c7:	89 04 24             	mov    %eax,(%esp)
801049ca:	e8 f1 bf ff ff       	call   801009c0 <exec>
801049cf:	e9 4a ff ff ff       	jmp    8010491e <sys_exec+0x2e>
801049d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801049e0 <sys_chdir>:
{
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	56                   	push   %esi
801049e4:	53                   	push   %ebx
801049e5:	83 ec 20             	sub    $0x20,%esp
  struct proc *curproc = myproc();
801049e8:	e8 83 f0 ff ff       	call   80103a70 <myproc>
801049ed:	89 c3                	mov    %eax,%ebx
  begin_op();
801049ef:	e8 0c e3 ff ff       	call   80102d00 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801049f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049f7:	89 44 24 04          	mov    %eax,0x4(%esp)
801049fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104a02:	e8 c9 fc ff ff       	call   801046d0 <argstr>
80104a07:	85 c0                	test   %eax,%eax
80104a09:	78 4d                	js     80104a58 <sys_chdir+0x78>
80104a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a0e:	89 04 24             	mov    %eax,(%esp)
80104a11:	e8 aa d4 ff ff       	call   80101ec0 <namei>
80104a16:	85 c0                	test   %eax,%eax
80104a18:	89 c6                	mov    %eax,%esi
80104a1a:	74 3c                	je     80104a58 <sys_chdir+0x78>
  ilock(ip);
80104a1c:	89 04 24             	mov    %eax,(%esp)
80104a1f:	e8 6c cf ff ff       	call   80101990 <ilock>
  if(ip->type != T_DIR){
80104a24:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104a29:	75 25                	jne    80104a50 <sys_chdir+0x70>
  iunlock(ip);
80104a2b:	89 34 24             	mov    %esi,(%esp)
80104a2e:	e8 8d d2 ff ff       	call   80101cc0 <iunlock>
  iput(curproc->cwd);
80104a33:	8b 43 68             	mov    0x68(%ebx),%eax
80104a36:	89 04 24             	mov    %eax,(%esp)
80104a39:	e8 32 d0 ff ff       	call   80101a70 <iput>
  end_op();
80104a3e:	e8 8d e1 ff ff       	call   80102bd0 <end_op>
  curproc->cwd = ip;
80104a43:	31 c0                	xor    %eax,%eax
80104a45:	89 73 68             	mov    %esi,0x68(%ebx)
}
80104a48:	83 c4 20             	add    $0x20,%esp
80104a4b:	5b                   	pop    %ebx
80104a4c:	5e                   	pop    %esi
80104a4d:	5d                   	pop    %ebp
80104a4e:	c3                   	ret    
80104a4f:	90                   	nop
    iunlockput(ip);
80104a50:	89 34 24             	mov    %esi,(%esp)
80104a53:	e8 b8 d2 ff ff       	call   80101d10 <iunlockput>
    end_op();
80104a58:	e8 73 e1 ff ff       	call   80102bd0 <end_op>
}
80104a5d:	83 c4 20             	add    $0x20,%esp
    end_op();
80104a60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104a65:	5b                   	pop    %ebx
80104a66:	5e                   	pop    %esi
80104a67:	5d                   	pop    %ebp
80104a68:	c3                   	ret    
80104a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104a70 <create>:
{
80104a70:	55                   	push   %ebp
80104a71:	89 e5                	mov    %esp,%ebp
80104a73:	83 ec 48             	sub    $0x48,%esp
80104a76:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80104a79:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104a7c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104a7f:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104a82:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104a85:	31 db                	xor    %ebx,%ebx
{
80104a87:	89 7d fc             	mov    %edi,-0x4(%ebp)
80104a8a:	89 d7                	mov    %edx,%edi
80104a8c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104a8f:	89 74 24 04          	mov    %esi,0x4(%esp)
80104a93:	89 04 24             	mov    %eax,(%esp)
80104a96:	e8 05 d4 ff ff       	call   80101ea0 <nameiparent>
80104a9b:	85 c0                	test   %eax,%eax
80104a9d:	74 48                	je     80104ae7 <create+0x77>
  ilock(dp);
80104a9f:	89 04 24             	mov    %eax,(%esp)
80104aa2:	89 45 cc             	mov    %eax,-0x34(%ebp)
80104aa5:	e8 e6 ce ff ff       	call   80101990 <ilock>
  if((ip = dirlookup(dp, name, 0)) != 0){
80104aaa:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104aad:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80104ab4:	00 
80104ab5:	89 74 24 04          	mov    %esi,0x4(%esp)
80104ab9:	89 14 24             	mov    %edx,(%esp)
80104abc:	e8 4f cd ff ff       	call   80101810 <dirlookup>
80104ac1:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104ac4:	85 c0                	test   %eax,%eax
80104ac6:	89 c3                	mov    %eax,%ebx
80104ac8:	74 3e                	je     80104b08 <create+0x98>
    iunlockput(dp);
80104aca:	89 14 24             	mov    %edx,(%esp)
80104acd:	e8 3e d2 ff ff       	call   80101d10 <iunlockput>
    ilock(ip);
80104ad2:	89 1c 24             	mov    %ebx,(%esp)
80104ad5:	e8 b6 ce ff ff       	call   80101990 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104ada:	66 83 ff 02          	cmp    $0x2,%di
80104ade:	75 18                	jne    80104af8 <create+0x88>
80104ae0:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104ae5:	75 11                	jne    80104af8 <create+0x88>
}
80104ae7:	89 d8                	mov    %ebx,%eax
80104ae9:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104aec:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104aef:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104af2:	89 ec                	mov    %ebp,%esp
80104af4:	5d                   	pop    %ebp
80104af5:	c3                   	ret    
80104af6:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104af8:	89 1c 24             	mov    %ebx,(%esp)
80104afb:	31 db                	xor    %ebx,%ebx
80104afd:	e8 0e d2 ff ff       	call   80101d10 <iunlockput>
    return 0;
80104b02:	eb e3                	jmp    80104ae7 <create+0x77>
80104b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if((ip = ialloc(dp->dev, type)) == 0)
80104b08:	0f bf c7             	movswl %di,%eax
80104b0b:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b0f:	8b 02                	mov    (%edx),%eax
80104b11:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104b14:	89 04 24             	mov    %eax,(%esp)
80104b17:	e8 a4 cd ff ff       	call   801018c0 <ialloc>
80104b1c:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104b1f:	85 c0                	test   %eax,%eax
80104b21:	89 c3                	mov    %eax,%ebx
80104b23:	0f 84 b7 00 00 00    	je     80104be0 <create+0x170>
  ilock(ip);
80104b29:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104b2c:	89 04 24             	mov    %eax,(%esp)
80104b2f:	e8 5c ce ff ff       	call   80101990 <ilock>
  ip->major = major;
80104b34:	0f b7 45 d4          	movzwl -0x2c(%ebp),%eax
80104b38:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104b3c:	0f b7 4d d0          	movzwl -0x30(%ebp),%ecx
  ip->nlink = 1;
80104b40:	66 c7 43 56 01 00    	movw   $0x1,0x56(%ebx)
  ip->minor = minor;
80104b46:	66 89 4b 54          	mov    %cx,0x54(%ebx)
  iupdate(ip);
80104b4a:	89 1c 24             	mov    %ebx,(%esp)
80104b4d:	e8 ce c7 ff ff       	call   80101320 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104b52:	66 83 ff 01          	cmp    $0x1,%di
80104b56:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104b59:	74 2d                	je     80104b88 <create+0x118>
  if(dirlink(dp, name, ip->inum) < 0)
80104b5b:	8b 43 04             	mov    0x4(%ebx),%eax
80104b5e:	89 14 24             	mov    %edx,(%esp)
80104b61:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104b64:	89 74 24 04          	mov    %esi,0x4(%esp)
80104b68:	89 44 24 08          	mov    %eax,0x8(%esp)
80104b6c:	e8 5f d0 ff ff       	call   80101bd0 <dirlink>
80104b71:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104b74:	85 c0                	test   %eax,%eax
80104b76:	78 74                	js     80104bec <create+0x17c>
  iunlockput(dp);
80104b78:	89 14 24             	mov    %edx,(%esp)
80104b7b:	e8 90 d1 ff ff       	call   80101d10 <iunlockput>
  return ip;
80104b80:	e9 62 ff ff ff       	jmp    80104ae7 <create+0x77>
80104b85:	8d 76 00             	lea    0x0(%esi),%esi
    dp->nlink++;  // for ".."
80104b88:	66 83 42 56 01       	addw   $0x1,0x56(%edx)
    iupdate(dp);
80104b8d:	89 14 24             	mov    %edx,(%esp)
80104b90:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104b93:	e8 88 c7 ff ff       	call   80101320 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104b98:	8b 43 04             	mov    0x4(%ebx),%eax
80104b9b:	c7 44 24 04 70 76 10 	movl   $0x80107670,0x4(%esp)
80104ba2:	80 
80104ba3:	89 1c 24             	mov    %ebx,(%esp)
80104ba6:	89 44 24 08          	mov    %eax,0x8(%esp)
80104baa:	e8 21 d0 ff ff       	call   80101bd0 <dirlink>
80104baf:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104bb2:	85 c0                	test   %eax,%eax
80104bb4:	78 1e                	js     80104bd4 <create+0x164>
80104bb6:	8b 42 04             	mov    0x4(%edx),%eax
80104bb9:	c7 44 24 04 6f 76 10 	movl   $0x8010766f,0x4(%esp)
80104bc0:	80 
80104bc1:	89 1c 24             	mov    %ebx,(%esp)
80104bc4:	89 44 24 08          	mov    %eax,0x8(%esp)
80104bc8:	e8 03 d0 ff ff       	call   80101bd0 <dirlink>
80104bcd:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104bd0:	85 c0                	test   %eax,%eax
80104bd2:	79 87                	jns    80104b5b <create+0xeb>
      panic("create dots");
80104bd4:	c7 04 24 72 76 10 80 	movl   $0x80107672,(%esp)
80104bdb:	e8 d0 b7 ff ff       	call   801003b0 <panic>
    panic("create: ialloc");
80104be0:	c7 04 24 60 76 10 80 	movl   $0x80107660,(%esp)
80104be7:	e8 c4 b7 ff ff       	call   801003b0 <panic>
    panic("create: dirlink");
80104bec:	c7 04 24 7e 76 10 80 	movl   $0x8010767e,(%esp)
80104bf3:	e8 b8 b7 ff ff       	call   801003b0 <panic>
80104bf8:	90                   	nop
80104bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104c00 <sys_mknod>:
{
80104c00:	55                   	push   %ebp
80104c01:	89 e5                	mov    %esp,%ebp
80104c03:	83 ec 28             	sub    $0x28,%esp
  begin_op();
80104c06:	e8 f5 e0 ff ff       	call   80102d00 <begin_op>
  if((argstr(0, &path)) < 0 ||
80104c0b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c0e:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c12:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104c19:	e8 b2 fa ff ff       	call   801046d0 <argstr>
80104c1e:	85 c0                	test   %eax,%eax
80104c20:	78 5e                	js     80104c80 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80104c22:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c25:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c29:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104c30:	e8 5b fa ff ff       	call   80104690 <argint>
  if((argstr(0, &path)) < 0 ||
80104c35:	85 c0                	test   %eax,%eax
80104c37:	78 47                	js     80104c80 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80104c39:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104c3c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c40:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104c47:	e8 44 fa ff ff       	call   80104690 <argint>
  if((argstr(0, &path)) < 0 ||
80104c4c:	85 c0                	test   %eax,%eax
80104c4e:	78 30                	js     80104c80 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
80104c50:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
80104c54:	ba 03 00 00 00       	mov    $0x3,%edx
80104c59:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104c5d:	89 04 24             	mov    %eax,(%esp)
80104c60:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c63:	e8 08 fe ff ff       	call   80104a70 <create>
  if((argstr(0, &path)) < 0 ||
80104c68:	85 c0                	test   %eax,%eax
80104c6a:	74 14                	je     80104c80 <sys_mknod+0x80>
  iunlockput(ip);
80104c6c:	89 04 24             	mov    %eax,(%esp)
80104c6f:	e8 9c d0 ff ff       	call   80101d10 <iunlockput>
  end_op();
80104c74:	e8 57 df ff ff       	call   80102bd0 <end_op>
80104c79:	31 c0                	xor    %eax,%eax
}
80104c7b:	c9                   	leave  
80104c7c:	c3                   	ret    
80104c7d:	8d 76 00             	lea    0x0(%esi),%esi
    end_op();
80104c80:	e8 4b df ff ff       	call   80102bd0 <end_op>
80104c85:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c8a:	c9                   	leave  
80104c8b:	c3                   	ret    
80104c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104c90 <sys_mkdir>:
{
80104c90:	55                   	push   %ebp
80104c91:	89 e5                	mov    %esp,%ebp
80104c93:	83 ec 28             	sub    $0x28,%esp
  begin_op();
80104c96:	e8 65 e0 ff ff       	call   80102d00 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80104c9b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c9e:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ca2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104ca9:	e8 22 fa ff ff       	call   801046d0 <argstr>
80104cae:	85 c0                	test   %eax,%eax
80104cb0:	78 2e                	js     80104ce0 <sys_mkdir+0x50>
80104cb2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cbc:	31 c9                	xor    %ecx,%ecx
80104cbe:	ba 01 00 00 00       	mov    $0x1,%edx
80104cc3:	e8 a8 fd ff ff       	call   80104a70 <create>
80104cc8:	85 c0                	test   %eax,%eax
80104cca:	74 14                	je     80104ce0 <sys_mkdir+0x50>
  iunlockput(ip);
80104ccc:	89 04 24             	mov    %eax,(%esp)
80104ccf:	e8 3c d0 ff ff       	call   80101d10 <iunlockput>
  end_op();
80104cd4:	e8 f7 de ff ff       	call   80102bd0 <end_op>
80104cd9:	31 c0                	xor    %eax,%eax
}
80104cdb:	c9                   	leave  
80104cdc:	c3                   	ret    
80104cdd:	8d 76 00             	lea    0x0(%esi),%esi
    end_op();
80104ce0:	e8 eb de ff ff       	call   80102bd0 <end_op>
80104ce5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104cea:	c9                   	leave  
80104ceb:	c3                   	ret    
80104cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104cf0 <sys_link>:
{
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	83 ec 48             	sub    $0x48,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104cf6:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80104cf9:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80104cfc:	89 75 f8             	mov    %esi,-0x8(%ebp)
80104cff:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d02:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d06:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104d0d:	e8 be f9 ff ff       	call   801046d0 <argstr>
80104d12:	85 c0                	test   %eax,%eax
80104d14:	79 12                	jns    80104d28 <sys_link+0x38>
  return -1;
80104d16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d1b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104d1e:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104d21:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104d24:	89 ec                	mov    %ebp,%esp
80104d26:	5d                   	pop    %ebp
80104d27:	c3                   	ret    
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d28:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104d2b:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d2f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104d36:	e8 95 f9 ff ff       	call   801046d0 <argstr>
80104d3b:	85 c0                	test   %eax,%eax
80104d3d:	78 d7                	js     80104d16 <sys_link+0x26>
  begin_op();
80104d3f:	e8 bc df ff ff       	call   80102d00 <begin_op>
  if((ip = namei(old)) == 0){
80104d44:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104d47:	89 04 24             	mov    %eax,(%esp)
80104d4a:	e8 71 d1 ff ff       	call   80101ec0 <namei>
80104d4f:	85 c0                	test   %eax,%eax
80104d51:	89 c3                	mov    %eax,%ebx
80104d53:	0f 84 a6 00 00 00    	je     80104dff <sys_link+0x10f>
  ilock(ip);
80104d59:	89 04 24             	mov    %eax,(%esp)
80104d5c:	e8 2f cc ff ff       	call   80101990 <ilock>
  if(ip->type == T_DIR){
80104d61:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d66:	0f 84 8b 00 00 00    	je     80104df7 <sys_link+0x107>
  ip->nlink++;
80104d6c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  if((dp = nameiparent(new, name)) == 0)
80104d71:	8d 7d d2             	lea    -0x2e(%ebp),%edi
  iupdate(ip);
80104d74:	89 1c 24             	mov    %ebx,(%esp)
80104d77:	e8 a4 c5 ff ff       	call   80101320 <iupdate>
  iunlock(ip);
80104d7c:	89 1c 24             	mov    %ebx,(%esp)
80104d7f:	e8 3c cf ff ff       	call   80101cc0 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104d84:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104d87:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104d8b:	89 04 24             	mov    %eax,(%esp)
80104d8e:	e8 0d d1 ff ff       	call   80101ea0 <nameiparent>
80104d93:	85 c0                	test   %eax,%eax
80104d95:	89 c6                	mov    %eax,%esi
80104d97:	74 49                	je     80104de2 <sys_link+0xf2>
  ilock(dp);
80104d99:	89 04 24             	mov    %eax,(%esp)
80104d9c:	e8 ef cb ff ff       	call   80101990 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104da1:	8b 06                	mov    (%esi),%eax
80104da3:	3b 03                	cmp    (%ebx),%eax
80104da5:	75 33                	jne    80104dda <sys_link+0xea>
80104da7:	8b 43 04             	mov    0x4(%ebx),%eax
80104daa:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104dae:	89 34 24             	mov    %esi,(%esp)
80104db1:	89 44 24 08          	mov    %eax,0x8(%esp)
80104db5:	e8 16 ce ff ff       	call   80101bd0 <dirlink>
80104dba:	85 c0                	test   %eax,%eax
80104dbc:	78 1c                	js     80104dda <sys_link+0xea>
  iunlockput(dp);
80104dbe:	89 34 24             	mov    %esi,(%esp)
80104dc1:	e8 4a cf ff ff       	call   80101d10 <iunlockput>
  iput(ip);
80104dc6:	89 1c 24             	mov    %ebx,(%esp)
80104dc9:	e8 a2 cc ff ff       	call   80101a70 <iput>
  end_op();
80104dce:	e8 fd dd ff ff       	call   80102bd0 <end_op>
80104dd3:	31 c0                	xor    %eax,%eax
  return 0;
80104dd5:	e9 41 ff ff ff       	jmp    80104d1b <sys_link+0x2b>
    iunlockput(dp);
80104dda:	89 34 24             	mov    %esi,(%esp)
80104ddd:	e8 2e cf ff ff       	call   80101d10 <iunlockput>
  ilock(ip);
80104de2:	89 1c 24             	mov    %ebx,(%esp)
80104de5:	e8 a6 cb ff ff       	call   80101990 <ilock>
  ip->nlink--;
80104dea:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104def:	89 1c 24             	mov    %ebx,(%esp)
80104df2:	e8 29 c5 ff ff       	call   80101320 <iupdate>
  iunlockput(ip);
80104df7:	89 1c 24             	mov    %ebx,(%esp)
80104dfa:	e8 11 cf ff ff       	call   80101d10 <iunlockput>
  end_op();
80104dff:	e8 cc dd ff ff       	call   80102bd0 <end_op>
80104e04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return -1;
80104e09:	e9 0d ff ff ff       	jmp    80104d1b <sys_link+0x2b>
80104e0e:	66 90                	xchg   %ax,%ax

80104e10 <sys_open>:
{
80104e10:	55                   	push   %ebp
80104e11:	89 e5                	mov    %esp,%ebp
80104e13:	83 ec 38             	sub    $0x38,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104e16:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80104e19:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104e1c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104e1f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e23:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104e2a:	e8 a1 f8 ff ff       	call   801046d0 <argstr>
80104e2f:	85 c0                	test   %eax,%eax
80104e31:	79 15                	jns    80104e48 <sys_open+0x38>
  return fd;
80104e33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e38:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104e3b:	8b 75 fc             	mov    -0x4(%ebp),%esi
80104e3e:	89 ec                	mov    %ebp,%esp
80104e40:	5d                   	pop    %ebp
80104e41:	c3                   	ret    
80104e42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104e48:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e4b:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104e56:	e8 35 f8 ff ff       	call   80104690 <argint>
80104e5b:	85 c0                	test   %eax,%eax
80104e5d:	78 d4                	js     80104e33 <sys_open+0x23>
  begin_op();
80104e5f:	e8 9c de ff ff       	call   80102d00 <begin_op>
  if(omode & O_CREATE){
80104e64:	f6 45 f1 02          	testb  $0x2,-0xf(%ebp)
80104e68:	74 76                	je     80104ee0 <sys_open+0xd0>
    ip = create(path, T_FILE, 0, 0);
80104e6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104e6d:	31 c9                	xor    %ecx,%ecx
80104e6f:	ba 02 00 00 00       	mov    $0x2,%edx
80104e74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104e7b:	e8 f0 fb ff ff       	call   80104a70 <create>
    if(ip == 0){
80104e80:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80104e82:	89 c6                	mov    %eax,%esi
    if(ip == 0){
80104e84:	0f 84 a2 00 00 00    	je     80104f2c <sys_open+0x11c>
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80104e8a:	e8 41 c1 ff ff       	call   80100fd0 <filealloc>
80104e8f:	85 c0                	test   %eax,%eax
80104e91:	89 c3                	mov    %eax,%ebx
80104e93:	0f 84 8b 00 00 00    	je     80104f24 <sys_open+0x114>
80104e99:	e8 52 f9 ff ff       	call   801047f0 <fdalloc>
80104e9e:	85 c0                	test   %eax,%eax
80104ea0:	78 7a                	js     80104f1c <sys_open+0x10c>
  iunlock(ip);
80104ea2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80104ea5:	89 34 24             	mov    %esi,(%esp)
80104ea8:	e8 13 ce ff ff       	call   80101cc0 <iunlock>
  end_op();
80104ead:	e8 1e dd ff ff       	call   80102bd0 <end_op>
  f->type = FD_INODE;
80104eb2:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  f->ip = ip;
80104eb8:	89 73 10             	mov    %esi,0x10(%ebx)
  f->off = 0;
80104ebb:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  f->readable = !(omode & O_WRONLY);
80104ec2:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104ec5:	83 f2 01             	xor    $0x1,%edx
80104ec8:	83 e2 01             	and    $0x1,%edx
80104ecb:	88 53 08             	mov    %dl,0x8(%ebx)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104ece:	f6 45 f0 03          	testb  $0x3,-0x10(%ebp)
80104ed2:	0f 95 43 09          	setne  0x9(%ebx)
  return fd;
80104ed6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104ed9:	e9 5a ff ff ff       	jmp    80104e38 <sys_open+0x28>
80104ede:	66 90                	xchg   %ax,%ax
    if((ip = namei(path)) == 0){
80104ee0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104ee3:	89 04 24             	mov    %eax,(%esp)
80104ee6:	e8 d5 cf ff ff       	call   80101ec0 <namei>
80104eeb:	85 c0                	test   %eax,%eax
80104eed:	89 c6                	mov    %eax,%esi
80104eef:	74 3b                	je     80104f2c <sys_open+0x11c>
    ilock(ip);
80104ef1:	89 04 24             	mov    %eax,(%esp)
80104ef4:	e8 97 ca ff ff       	call   80101990 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104ef9:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104efe:	75 8a                	jne    80104e8a <sys_open+0x7a>
80104f00:	8b 5d f0             	mov    -0x10(%ebp),%ebx
80104f03:	85 db                	test   %ebx,%ebx
80104f05:	74 83                	je     80104e8a <sys_open+0x7a>
      iunlockput(ip);
80104f07:	89 34 24             	mov    %esi,(%esp)
80104f0a:	e8 01 ce ff ff       	call   80101d10 <iunlockput>
      end_op();
80104f0f:	e8 bc dc ff ff       	call   80102bd0 <end_op>
80104f14:	83 c8 ff             	or     $0xffffffff,%eax
      return -1;
80104f17:	e9 1c ff ff ff       	jmp    80104e38 <sys_open+0x28>
      fileclose(f);
80104f1c:	89 1c 24             	mov    %ebx,(%esp)
80104f1f:	e8 2c c1 ff ff       	call   80101050 <fileclose>
    iunlockput(ip);
80104f24:	89 34 24             	mov    %esi,(%esp)
80104f27:	e8 e4 cd ff ff       	call   80101d10 <iunlockput>
    end_op();
80104f2c:	e8 9f dc ff ff       	call   80102bd0 <end_op>
80104f31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
80104f36:	e9 fd fe ff ff       	jmp    80104e38 <sys_open+0x28>
80104f3b:	90                   	nop
80104f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104f40 <sys_unlink>:
{
80104f40:	55                   	push   %ebp
80104f41:	89 e5                	mov    %esp,%ebp
80104f43:	57                   	push   %edi
80104f44:	56                   	push   %esi
80104f45:	53                   	push   %ebx
80104f46:	83 ec 6c             	sub    $0x6c,%esp
  if(argstr(0, &path) < 0)
80104f49:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104f4c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f50:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104f57:	e8 74 f7 ff ff       	call   801046d0 <argstr>
80104f5c:	89 c2                	mov    %eax,%edx
80104f5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f63:	85 d2                	test   %edx,%edx
80104f65:	0f 88 0b 01 00 00    	js     80105076 <sys_unlink+0x136>
  if((dp = nameiparent(path, name)) == 0){
80104f6b:	8d 5d d2             	lea    -0x2e(%ebp),%ebx
  begin_op();
80104f6e:	e8 8d dd ff ff       	call   80102d00 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104f73:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104f77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104f7a:	89 04 24             	mov    %eax,(%esp)
80104f7d:	e8 1e cf ff ff       	call   80101ea0 <nameiparent>
80104f82:	85 c0                	test   %eax,%eax
80104f84:	89 45 a4             	mov    %eax,-0x5c(%ebp)
80104f87:	0f 84 53 01 00 00    	je     801050e0 <sys_unlink+0x1a0>
  ilock(dp);
80104f8d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104f90:	89 04 24             	mov    %eax,(%esp)
80104f93:	e8 f8 c9 ff ff       	call   80101990 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104f98:	c7 44 24 04 70 76 10 	movl   $0x80107670,0x4(%esp)
80104f9f:	80 
80104fa0:	89 1c 24             	mov    %ebx,(%esp)
80104fa3:	e8 c8 c2 ff ff       	call   80101270 <namecmp>
80104fa8:	85 c0                	test   %eax,%eax
80104faa:	0f 84 25 01 00 00    	je     801050d5 <sys_unlink+0x195>
80104fb0:	c7 44 24 04 6f 76 10 	movl   $0x8010766f,0x4(%esp)
80104fb7:	80 
80104fb8:	89 1c 24             	mov    %ebx,(%esp)
80104fbb:	e8 b0 c2 ff ff       	call   80101270 <namecmp>
80104fc0:	85 c0                	test   %eax,%eax
80104fc2:	0f 84 0d 01 00 00    	je     801050d5 <sys_unlink+0x195>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104fc8:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104fcb:	89 44 24 08          	mov    %eax,0x8(%esp)
80104fcf:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104fd3:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104fd6:	89 04 24             	mov    %eax,(%esp)
80104fd9:	e8 32 c8 ff ff       	call   80101810 <dirlookup>
80104fde:	85 c0                	test   %eax,%eax
80104fe0:	89 c6                	mov    %eax,%esi
80104fe2:	0f 84 ed 00 00 00    	je     801050d5 <sys_unlink+0x195>
  ilock(ip);
80104fe8:	89 04 24             	mov    %eax,(%esp)
80104feb:	e8 a0 c9 ff ff       	call   80101990 <ilock>
  if(ip->nlink < 1)
80104ff0:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80104ff5:	0f 8e 2a 01 00 00    	jle    80105125 <sys_unlink+0x1e5>
  if(ip->type == T_DIR && !isdirempty(ip)){
80104ffb:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105000:	74 7e                	je     80105080 <sys_unlink+0x140>
  memset(&de, 0, sizeof(de));
80105002:	8d 5d c2             	lea    -0x3e(%ebp),%ebx
80105005:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
8010500c:	00 
8010500d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105014:	00 
80105015:	89 1c 24             	mov    %ebx,(%esp)
80105018:	e8 93 f3 ff ff       	call   801043b0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010501d:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80105024:	00 
80105025:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105028:	89 5c 24 04          	mov    %ebx,0x4(%esp)
8010502c:	89 44 24 08          	mov    %eax,0x8(%esp)
80105030:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80105033:	89 04 24             	mov    %eax,(%esp)
80105036:	e8 a5 c5 ff ff       	call   801015e0 <writei>
8010503b:	83 f8 10             	cmp    $0x10,%eax
8010503e:	0f 85 d5 00 00 00    	jne    80105119 <sys_unlink+0x1d9>
  if(ip->type == T_DIR){
80105044:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105049:	0f 84 a9 00 00 00    	je     801050f8 <sys_unlink+0x1b8>
  iunlockput(dp);
8010504f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80105052:	89 04 24             	mov    %eax,(%esp)
80105055:	e8 b6 cc ff ff       	call   80101d10 <iunlockput>
  ip->nlink--;
8010505a:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
  iupdate(ip);
8010505f:	89 34 24             	mov    %esi,(%esp)
80105062:	e8 b9 c2 ff ff       	call   80101320 <iupdate>
  iunlockput(ip);
80105067:	89 34 24             	mov    %esi,(%esp)
8010506a:	e8 a1 cc ff ff       	call   80101d10 <iunlockput>
  end_op();
8010506f:	e8 5c db ff ff       	call   80102bd0 <end_op>
80105074:	31 c0                	xor    %eax,%eax
}
80105076:	83 c4 6c             	add    $0x6c,%esp
80105079:	5b                   	pop    %ebx
8010507a:	5e                   	pop    %esi
8010507b:	5f                   	pop    %edi
8010507c:	5d                   	pop    %ebp
8010507d:	c3                   	ret    
8010507e:	66 90                	xchg   %ax,%ax
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105080:	83 7e 58 20          	cmpl   $0x20,0x58(%esi)
80105084:	0f 86 78 ff ff ff    	jbe    80105002 <sys_unlink+0xc2>
8010508a:	8d 7d b2             	lea    -0x4e(%ebp),%edi
8010508d:	bb 20 00 00 00       	mov    $0x20,%ebx
80105092:	eb 10                	jmp    801050a4 <sys_unlink+0x164>
80105094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105098:	83 c3 10             	add    $0x10,%ebx
8010509b:	3b 5e 58             	cmp    0x58(%esi),%ebx
8010509e:	0f 83 5e ff ff ff    	jae    80105002 <sys_unlink+0xc2>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801050a4:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
801050ab:	00 
801050ac:	89 5c 24 08          	mov    %ebx,0x8(%esp)
801050b0:	89 7c 24 04          	mov    %edi,0x4(%esp)
801050b4:	89 34 24             	mov    %esi,(%esp)
801050b7:	e8 44 c6 ff ff       	call   80101700 <readi>
801050bc:	83 f8 10             	cmp    $0x10,%eax
801050bf:	75 4c                	jne    8010510d <sys_unlink+0x1cd>
    if(de.inum != 0)
801050c1:	66 83 7d b2 00       	cmpw   $0x0,-0x4e(%ebp)
801050c6:	74 d0                	je     80105098 <sys_unlink+0x158>
    iunlockput(ip);
801050c8:	89 34 24             	mov    %esi,(%esp)
801050cb:	90                   	nop
801050cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801050d0:	e8 3b cc ff ff       	call   80101d10 <iunlockput>
  iunlockput(dp);
801050d5:	8b 45 a4             	mov    -0x5c(%ebp),%eax
801050d8:	89 04 24             	mov    %eax,(%esp)
801050db:	e8 30 cc ff ff       	call   80101d10 <iunlockput>
  end_op();
801050e0:	e8 eb da ff ff       	call   80102bd0 <end_op>
}
801050e5:	83 c4 6c             	add    $0x6c,%esp
  end_op();
801050e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801050ed:	5b                   	pop    %ebx
801050ee:	5e                   	pop    %esi
801050ef:	5f                   	pop    %edi
801050f0:	5d                   	pop    %ebp
801050f1:	c3                   	ret    
801050f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    dp->nlink--;
801050f8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
801050fb:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80105100:	89 04 24             	mov    %eax,(%esp)
80105103:	e8 18 c2 ff ff       	call   80101320 <iupdate>
80105108:	e9 42 ff ff ff       	jmp    8010504f <sys_unlink+0x10f>
      panic("isdirempty: readi");
8010510d:	c7 04 24 a0 76 10 80 	movl   $0x801076a0,(%esp)
80105114:	e8 97 b2 ff ff       	call   801003b0 <panic>
    panic("unlink: writei");
80105119:	c7 04 24 b2 76 10 80 	movl   $0x801076b2,(%esp)
80105120:	e8 8b b2 ff ff       	call   801003b0 <panic>
    panic("unlink: nlink < 1");
80105125:	c7 04 24 8e 76 10 80 	movl   $0x8010768e,(%esp)
8010512c:	e8 7f b2 ff ff       	call   801003b0 <panic>
80105131:	eb 0d                	jmp    80105140 <T.62>
80105133:	90                   	nop
80105134:	90                   	nop
80105135:	90                   	nop
80105136:	90                   	nop
80105137:	90                   	nop
80105138:	90                   	nop
80105139:	90                   	nop
8010513a:	90                   	nop
8010513b:	90                   	nop
8010513c:	90                   	nop
8010513d:	90                   	nop
8010513e:	90                   	nop
8010513f:	90                   	nop

80105140 <T.62>:
argfd(int n, int *pfd, struct file **pf)
80105140:	55                   	push   %ebp
80105141:	89 e5                	mov    %esp,%ebp
80105143:	83 ec 28             	sub    $0x28,%esp
80105146:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80105149:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
8010514b:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
8010514e:	89 75 fc             	mov    %esi,-0x4(%ebp)
80105151:	89 d6                	mov    %edx,%esi
  if(argint(n, &fd) < 0)
80105153:	89 44 24 04          	mov    %eax,0x4(%esp)
80105157:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010515e:	e8 2d f5 ff ff       	call   80104690 <argint>
80105163:	85 c0                	test   %eax,%eax
80105165:	79 11                	jns    80105178 <T.62+0x38>
    *pf = f;
80105167:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010516c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
8010516f:	8b 75 fc             	mov    -0x4(%ebp),%esi
80105172:	89 ec                	mov    %ebp,%esp
80105174:	5d                   	pop    %ebp
80105175:	c3                   	ret    
80105176:	66 90                	xchg   %ax,%ax
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80105178:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010517c:	77 e9                	ja     80105167 <T.62+0x27>
8010517e:	e8 ed e8 ff ff       	call   80103a70 <myproc>
80105183:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80105186:	8b 54 88 28          	mov    0x28(%eax,%ecx,4),%edx
8010518a:	85 d2                	test   %edx,%edx
8010518c:	74 d9                	je     80105167 <T.62+0x27>
  if(pfd)
8010518e:	85 db                	test   %ebx,%ebx
80105190:	74 02                	je     80105194 <T.62+0x54>
    *pfd = fd;
80105192:	89 0b                	mov    %ecx,(%ebx)
  if(pf)
80105194:	31 c0                	xor    %eax,%eax
80105196:	85 f6                	test   %esi,%esi
80105198:	74 d2                	je     8010516c <T.62+0x2c>
    *pf = f;
8010519a:	89 16                	mov    %edx,(%esi)
8010519c:	eb ce                	jmp    8010516c <T.62+0x2c>
8010519e:	66 90                	xchg   %ax,%ax

801051a0 <sys_dup>:
{
801051a0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
801051a1:	31 c0                	xor    %eax,%eax
{
801051a3:	89 e5                	mov    %esp,%ebp
801051a5:	53                   	push   %ebx
801051a6:	83 ec 24             	sub    $0x24,%esp
  if(argfd(0, 0, &f) < 0)
801051a9:	8d 55 f4             	lea    -0xc(%ebp),%edx
801051ac:	e8 8f ff ff ff       	call   80105140 <T.62>
801051b1:	85 c0                	test   %eax,%eax
801051b3:	79 13                	jns    801051c8 <sys_dup+0x28>
  return fd;
801051b5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
801051ba:	89 d8                	mov    %ebx,%eax
801051bc:	83 c4 24             	add    $0x24,%esp
801051bf:	5b                   	pop    %ebx
801051c0:	5d                   	pop    %ebp
801051c1:	c3                   	ret    
801051c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if((fd=fdalloc(f)) < 0)
801051c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051cb:	e8 20 f6 ff ff       	call   801047f0 <fdalloc>
801051d0:	85 c0                	test   %eax,%eax
801051d2:	89 c3                	mov    %eax,%ebx
801051d4:	78 df                	js     801051b5 <sys_dup+0x15>
  filedup(f);
801051d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051d9:	89 04 24             	mov    %eax,(%esp)
801051dc:	e8 9f bd ff ff       	call   80100f80 <filedup>
  return fd;
801051e1:	eb d7                	jmp    801051ba <sys_dup+0x1a>
801051e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801051e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801051f0 <sys_read>:
{
801051f0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801051f1:	31 c0                	xor    %eax,%eax
{
801051f3:	89 e5                	mov    %esp,%ebp
801051f5:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801051f8:	8d 55 f4             	lea    -0xc(%ebp),%edx
801051fb:	e8 40 ff ff ff       	call   80105140 <T.62>
80105200:	85 c0                	test   %eax,%eax
80105202:	79 0c                	jns    80105210 <sys_read+0x20>
  return fileread(f, p, n);
80105204:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105209:	c9                   	leave  
8010520a:	c3                   	ret    
8010520b:	90                   	nop
8010520c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105210:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105213:	89 44 24 04          	mov    %eax,0x4(%esp)
80105217:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
8010521e:	e8 6d f4 ff ff       	call   80104690 <argint>
80105223:	85 c0                	test   %eax,%eax
80105225:	78 dd                	js     80105204 <sys_read+0x14>
80105227:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010522a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105231:	89 44 24 08          	mov    %eax,0x8(%esp)
80105235:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105238:	89 44 24 04          	mov    %eax,0x4(%esp)
8010523c:	e8 cf f4 ff ff       	call   80104710 <argptr>
80105241:	85 c0                	test   %eax,%eax
80105243:	78 bf                	js     80105204 <sys_read+0x14>
  return fileread(f, p, n);
80105245:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105248:	89 44 24 08          	mov    %eax,0x8(%esp)
8010524c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010524f:	89 44 24 04          	mov    %eax,0x4(%esp)
80105253:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105256:	89 04 24             	mov    %eax,(%esp)
80105259:	e8 22 bc ff ff       	call   80100e80 <fileread>
}
8010525e:	c9                   	leave  
8010525f:	c3                   	ret    

80105260 <sys_write>:
{
80105260:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105261:	31 c0                	xor    %eax,%eax
{
80105263:	89 e5                	mov    %esp,%ebp
80105265:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105268:	8d 55 f4             	lea    -0xc(%ebp),%edx
8010526b:	e8 d0 fe ff ff       	call   80105140 <T.62>
80105270:	85 c0                	test   %eax,%eax
80105272:	79 0c                	jns    80105280 <sys_write+0x20>
  return filewrite(f, p, n);
80105274:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105279:	c9                   	leave  
8010527a:	c3                   	ret    
8010527b:	90                   	nop
8010527c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105280:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105283:	89 44 24 04          	mov    %eax,0x4(%esp)
80105287:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
8010528e:	e8 fd f3 ff ff       	call   80104690 <argint>
80105293:	85 c0                	test   %eax,%eax
80105295:	78 dd                	js     80105274 <sys_write+0x14>
80105297:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010529a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801052a1:	89 44 24 08          	mov    %eax,0x8(%esp)
801052a5:	8d 45 ec             	lea    -0x14(%ebp),%eax
801052a8:	89 44 24 04          	mov    %eax,0x4(%esp)
801052ac:	e8 5f f4 ff ff       	call   80104710 <argptr>
801052b1:	85 c0                	test   %eax,%eax
801052b3:	78 bf                	js     80105274 <sys_write+0x14>
  return filewrite(f, p, n);
801052b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
801052b8:	89 44 24 08          	mov    %eax,0x8(%esp)
801052bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
801052bf:	89 44 24 04          	mov    %eax,0x4(%esp)
801052c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801052c6:	89 04 24             	mov    %eax,(%esp)
801052c9:	e8 92 ba ff ff       	call   80100d60 <filewrite>
}
801052ce:	c9                   	leave  
801052cf:	c3                   	ret    

801052d0 <sys_fstat>:
{
801052d0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801052d1:	31 c0                	xor    %eax,%eax
{
801052d3:	89 e5                	mov    %esp,%ebp
801052d5:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801052d8:	8d 55 f4             	lea    -0xc(%ebp),%edx
801052db:	e8 60 fe ff ff       	call   80105140 <T.62>
801052e0:	85 c0                	test   %eax,%eax
801052e2:	79 0c                	jns    801052f0 <sys_fstat+0x20>
  return filestat(f, st);
801052e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801052e9:	c9                   	leave  
801052ea:	c3                   	ret    
801052eb:	90                   	nop
801052ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801052f0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052f3:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801052fa:	00 
801052fb:	89 44 24 04          	mov    %eax,0x4(%esp)
801052ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105306:	e8 05 f4 ff ff       	call   80104710 <argptr>
8010530b:	85 c0                	test   %eax,%eax
8010530d:	78 d5                	js     801052e4 <sys_fstat+0x14>
  return filestat(f, st);
8010530f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105312:	89 44 24 04          	mov    %eax,0x4(%esp)
80105316:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105319:	89 04 24             	mov    %eax,(%esp)
8010531c:	e8 0f bc ff ff       	call   80100f30 <filestat>
}
80105321:	c9                   	leave  
80105322:	c3                   	ret    
80105323:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105330 <sys_close>:
{
80105330:	55                   	push   %ebp
80105331:	89 e5                	mov    %esp,%ebp
80105333:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, &fd, &f) < 0)
80105336:	8d 55 f0             	lea    -0x10(%ebp),%edx
80105339:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010533c:	e8 ff fd ff ff       	call   80105140 <T.62>
80105341:	89 c2                	mov    %eax,%edx
80105343:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105348:	85 d2                	test   %edx,%edx
8010534a:	78 1d                	js     80105369 <sys_close+0x39>
  myproc()->ofile[fd] = 0;
8010534c:	e8 1f e7 ff ff       	call   80103a70 <myproc>
80105351:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105354:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
8010535b:	00 
  fileclose(f);
8010535c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010535f:	89 04 24             	mov    %eax,(%esp)
80105362:	e8 e9 bc ff ff       	call   80101050 <fileclose>
80105367:	31 c0                	xor    %eax,%eax
}
80105369:	c9                   	leave  
8010536a:	c3                   	ret    
8010536b:	66 90                	xchg   %ax,%ax
8010536d:	66 90                	xchg   %ax,%ax
8010536f:	90                   	nop

80105370 <sys_alarm>:
  
}

    int
    sys_alarm(void)
    {
80105370:	55                   	push   %ebp
80105371:	89 e5                	mov    %esp,%ebp
80105373:	83 ec 28             	sub    $0x28,%esp
      int ticks;
      void (*handler)();
      if(argint(0, &ticks) < 0)
80105376:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105379:	89 44 24 04          	mov    %eax,0x4(%esp)
8010537d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105384:	e8 07 f3 ff ff       	call   80104690 <argint>
80105389:	85 c0                	test   %eax,%eax
8010538b:	79 0b                	jns    80105398 <sys_alarm+0x28>
        return -1;
      if(argptr(1, (char**)&handler, 1) < 0)
        return -1;
      myproc()->alarmticks = ticks;
      myproc()->alarmhandler = handler;
      return 0;
8010538d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105392:	c9                   	leave  
80105393:	c3                   	ret    
80105394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(argptr(1, (char**)&handler, 1) < 0)
80105398:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010539b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
801053a2:	00 
801053a3:	89 44 24 04          	mov    %eax,0x4(%esp)
801053a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801053ae:	e8 5d f3 ff ff       	call   80104710 <argptr>
801053b3:	85 c0                	test   %eax,%eax
801053b5:	78 d6                	js     8010538d <sys_alarm+0x1d>
      myproc()->alarmticks = ticks;
801053b7:	e8 b4 e6 ff ff       	call   80103a70 <myproc>
801053bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
801053bf:	89 50 7c             	mov    %edx,0x7c(%eax)
      myproc()->alarmhandler = handler;
801053c2:	e8 a9 e6 ff ff       	call   80103a70 <myproc>
801053c7:	8b 55 f0             	mov    -0x10(%ebp),%edx
801053ca:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
801053d0:	31 c0                	xor    %eax,%eax
801053d2:	c9                   	leave  
801053d3:	c3                   	ret    
801053d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801053da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801053e0 <sys_sbrk>:
{
801053e0:	55                   	push   %ebp
801053e1:	89 e5                	mov    %esp,%ebp
801053e3:	53                   	push   %ebx
  if(argint(0, &n) < 0)
801053e4:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
{
801053e9:	83 ec 24             	sub    $0x24,%esp
  if(argint(0, &n) < 0)
801053ec:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053ef:	89 44 24 04          	mov    %eax,0x4(%esp)
801053f3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801053fa:	e8 91 f2 ff ff       	call   80104690 <argint>
801053ff:	85 c0                	test   %eax,%eax
80105401:	78 11                	js     80105414 <sys_sbrk+0x34>
  addr = myproc()->sz;
80105403:	e8 68 e6 ff ff       	call   80103a70 <myproc>
80105408:	8b 18                	mov    (%eax),%ebx
  myproc()->sz+=n;
8010540a:	e8 61 e6 ff ff       	call   80103a70 <myproc>
8010540f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105412:	01 10                	add    %edx,(%eax)
}
80105414:	89 d8                	mov    %ebx,%eax
80105416:	83 c4 24             	add    $0x24,%esp
80105419:	5b                   	pop    %ebx
8010541a:	5d                   	pop    %ebp
8010541b:	c3                   	ret    
8010541c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_getpid>:
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105426:	e8 45 e6 ff ff       	call   80103a70 <myproc>
8010542b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010542e:	c9                   	leave  
8010542f:	c3                   	ret    

80105430 <sys_date>:
{
80105430:	55                   	push   %ebp
80105431:	89 e5                	mov    %esp,%ebp
80105433:	83 ec 18             	sub    $0x18,%esp
if (argptr(0, (void *)&r, sizeof(*r)) < 0)
80105436:	8d 45 08             	lea    0x8(%ebp),%eax
80105439:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
80105440:	00 
80105441:	89 44 24 04          	mov    %eax,0x4(%esp)
80105445:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010544c:	e8 bf f2 ff ff       	call   80104710 <argptr>
80105451:	89 c2                	mov    %eax,%edx
80105453:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105458:	85 d2                	test   %edx,%edx
8010545a:	78 0d                	js     80105469 <sys_date+0x39>
  cmostime(r);
8010545c:	8b 45 08             	mov    0x8(%ebp),%eax
8010545f:	89 04 24             	mov    %eax,(%esp)
80105462:	e8 b9 d3 ff ff       	call   80102820 <cmostime>
80105467:	31 c0                	xor    %eax,%eax
}
80105469:	c9                   	leave  
8010546a:	c3                   	ret    
8010546b:	90                   	nop
8010546c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105470 <sys_uptime>:
{
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	53                   	push   %ebx
80105474:	83 ec 14             	sub    $0x14,%esp
  acquire(&tickslock);
80105477:	c7 04 24 80 4f 11 80 	movl   $0x80114f80,(%esp)
8010547e:	e8 bd ee ff ff       	call   80104340 <acquire>
  xticks = ticks;
80105483:	8b 1d c0 57 11 80    	mov    0x801157c0,%ebx
  release(&tickslock);
80105489:	c7 04 24 80 4f 11 80 	movl   $0x80114f80,(%esp)
80105490:	e8 5b ee ff ff       	call   801042f0 <release>
}
80105495:	83 c4 14             	add    $0x14,%esp
80105498:	89 d8                	mov    %ebx,%eax
8010549a:	5b                   	pop    %ebx
8010549b:	5d                   	pop    %ebp
8010549c:	c3                   	ret    
8010549d:	8d 76 00             	lea    0x0(%esi),%esi

801054a0 <sys_sleep>:
{
801054a0:	55                   	push   %ebp
801054a1:	89 e5                	mov    %esp,%ebp
801054a3:	53                   	push   %ebx
801054a4:	83 ec 24             	sub    $0x24,%esp
  if(argint(0, &n) < 0)
801054a7:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054aa:	89 44 24 04          	mov    %eax,0x4(%esp)
801054ae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801054b5:	e8 d6 f1 ff ff       	call   80104690 <argint>
801054ba:	89 c2                	mov    %eax,%edx
801054bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054c1:	85 d2                	test   %edx,%edx
801054c3:	78 58                	js     8010551d <sys_sleep+0x7d>
  acquire(&tickslock);
801054c5:	c7 04 24 80 4f 11 80 	movl   $0x80114f80,(%esp)
801054cc:	e8 6f ee ff ff       	call   80104340 <acquire>
  while(ticks - ticks0 < n){
801054d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
801054d4:	8b 1d c0 57 11 80    	mov    0x801157c0,%ebx
  while(ticks - ticks0 < n){
801054da:	85 d2                	test   %edx,%edx
801054dc:	75 22                	jne    80105500 <sys_sleep+0x60>
801054de:	eb 48                	jmp    80105528 <sys_sleep+0x88>
    sleep(&ticks, &tickslock);
801054e0:	c7 44 24 04 80 4f 11 	movl   $0x80114f80,0x4(%esp)
801054e7:	80 
801054e8:	c7 04 24 c0 57 11 80 	movl   $0x801157c0,(%esp)
801054ef:	e8 dc e7 ff ff       	call   80103cd0 <sleep>
  while(ticks - ticks0 < n){
801054f4:	a1 c0 57 11 80       	mov    0x801157c0,%eax
801054f9:	29 d8                	sub    %ebx,%eax
801054fb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801054fe:	73 28                	jae    80105528 <sys_sleep+0x88>
    if(myproc()->killed){
80105500:	e8 6b e5 ff ff       	call   80103a70 <myproc>
80105505:	8b 40 24             	mov    0x24(%eax),%eax
80105508:	85 c0                	test   %eax,%eax
8010550a:	74 d4                	je     801054e0 <sys_sleep+0x40>
      release(&tickslock);
8010550c:	c7 04 24 80 4f 11 80 	movl   $0x80114f80,(%esp)
80105513:	e8 d8 ed ff ff       	call   801042f0 <release>
80105518:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010551d:	83 c4 24             	add    $0x24,%esp
80105520:	5b                   	pop    %ebx
80105521:	5d                   	pop    %ebp
80105522:	c3                   	ret    
80105523:	90                   	nop
80105524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&tickslock);
80105528:	c7 04 24 80 4f 11 80 	movl   $0x80114f80,(%esp)
8010552f:	e8 bc ed ff ff       	call   801042f0 <release>
}
80105534:	83 c4 24             	add    $0x24,%esp
  release(&tickslock);
80105537:	31 c0                	xor    %eax,%eax
}
80105539:	5b                   	pop    %ebx
8010553a:	5d                   	pop    %ebp
8010553b:	c3                   	ret    
8010553c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105540 <sys_kill>:
{
80105540:	55                   	push   %ebp
80105541:	89 e5                	mov    %esp,%ebp
80105543:	83 ec 28             	sub    $0x28,%esp
  if(argint(0, &pid) < 0)
80105546:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105549:	89 44 24 04          	mov    %eax,0x4(%esp)
8010554d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105554:	e8 37 f1 ff ff       	call   80104690 <argint>
80105559:	89 c2                	mov    %eax,%edx
8010555b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105560:	85 d2                	test   %edx,%edx
80105562:	78 0b                	js     8010556f <sys_kill+0x2f>
  return kill(pid);
80105564:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105567:	89 04 24             	mov    %eax,(%esp)
8010556a:	e8 a1 e0 ff ff       	call   80103610 <kill>
}
8010556f:	c9                   	leave  
80105570:	c3                   	ret    
80105571:	eb 0d                	jmp    80105580 <sys_wait>
80105573:	90                   	nop
80105574:	90                   	nop
80105575:	90                   	nop
80105576:	90                   	nop
80105577:	90                   	nop
80105578:	90                   	nop
80105579:	90                   	nop
8010557a:	90                   	nop
8010557b:	90                   	nop
8010557c:	90                   	nop
8010557d:	90                   	nop
8010557e:	90                   	nop
8010557f:	90                   	nop

80105580 <sys_wait>:
{
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	83 ec 08             	sub    $0x8,%esp
}
80105586:	c9                   	leave  
  return wait();
80105587:	e9 04 e8 ff ff       	jmp    80103d90 <wait>
8010558c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105590 <sys_exit>:
{
80105590:	55                   	push   %ebp
80105591:	89 e5                	mov    %esp,%ebp
80105593:	83 ec 08             	sub    $0x8,%esp
  exit();
80105596:	e8 25 e9 ff ff       	call   80103ec0 <exit>
}
8010559b:	31 c0                	xor    %eax,%eax
8010559d:	c9                   	leave  
8010559e:	c3                   	ret    
8010559f:	90                   	nop

801055a0 <sys_fork>:
{
801055a0:	55                   	push   %ebp
801055a1:	89 e5                	mov    %esp,%ebp
801055a3:	83 ec 08             	sub    $0x8,%esp
}
801055a6:	c9                   	leave  
  return fork();
801055a7:	e9 f4 e4 ff ff       	jmp    80103aa0 <fork>

801055ac <alltraps>:
801055ac:	1e                   	push   %ds
801055ad:	06                   	push   %es
801055ae:	0f a0                	push   %fs
801055b0:	0f a8                	push   %gs
801055b2:	60                   	pusha  
801055b3:	66 b8 10 00          	mov    $0x10,%ax
801055b7:	8e d8                	mov    %eax,%ds
801055b9:	8e c0                	mov    %eax,%es
801055bb:	54                   	push   %esp
801055bc:	e8 3f 00 00 00       	call   80105600 <trap>
801055c1:	83 c4 04             	add    $0x4,%esp

801055c4 <trapret>:
801055c4:	61                   	popa   
801055c5:	0f a9                	pop    %gs
801055c7:	0f a1                	pop    %fs
801055c9:	07                   	pop    %es
801055ca:	1f                   	pop    %ds
801055cb:	83 c4 08             	add    $0x8,%esp
801055ce:	cf                   	iret   
801055cf:	90                   	nop

801055d0 <idtinit>:
  initlock(&tickslock, "time");
}

void
idtinit(void)
{
801055d0:	55                   	push   %ebp
  pd[1] = (uint)p;
801055d1:	b8 c0 4f 11 80       	mov    $0x80114fc0,%eax
801055d6:	89 e5                	mov    %esp,%ebp
801055d8:	83 ec 10             	sub    $0x10,%esp
  pd[0] = size-1;
801055db:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
  pd[1] = (uint)p;
801055e1:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
801055e5:	c1 e8 10             	shr    $0x10,%eax
801055e8:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
801055ec:	8d 45 fa             	lea    -0x6(%ebp),%eax
801055ef:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
801055f2:	c9                   	leave  
801055f3:	c3                   	ret    
801055f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801055fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105600 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105600:	55                   	push   %ebp
80105601:	89 e5                	mov    %esp,%ebp
80105603:	57                   	push   %edi
80105604:	56                   	push   %esi
80105605:	53                   	push   %ebx
80105606:	83 ec 2c             	sub    $0x2c,%esp
80105609:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
8010560c:	8b 47 30             	mov    0x30(%edi),%eax
8010560f:	83 f8 40             	cmp    $0x40,%eax
80105612:	0f 84 68 02 00 00    	je     80105880 <trap+0x280>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105618:	83 e8 20             	sub    $0x20,%eax
8010561b:	83 f8 1f             	cmp    $0x1f,%eax
8010561e:	0f 86 b4 00 00 00    	jbe    801056d8 <trap+0xd8>
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105624:	e8 47 e4 ff ff       	call   80103a70 <myproc>
80105629:	85 c0                	test   %eax,%eax
8010562b:	0f 84 ef 02 00 00    	je     80105920 <trap+0x320>
80105631:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105635:	0f 84 e5 02 00 00    	je     80105920 <trap+0x320>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
8010563b:	0f 20 d3             	mov    %cr2,%ebx

 char *mem;
  uint a;


  a = PGROUNDDOWN(rcr2());
8010563e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < myproc()->sz; a += PGSIZE){
80105644:	eb 08                	jmp    8010564e <trap+0x4e>
80105646:	66 90                	xchg   %ax,%ax
80105648:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010564e:	e8 1d e4 ff ff       	call   80103a70 <myproc>
80105653:	3b 18                	cmp    (%eax),%ebx
80105655:	0f 83 a2 00 00 00    	jae    801056fd <trap+0xfd>
    mem = kalloc();
8010565b:	e8 d0 cc ff ff       	call   80102330 <kalloc>
    if(mem == 0){
80105660:	85 c0                	test   %eax,%eax
    mem = kalloc();
80105662:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80105664:	0f 84 4e 02 00 00    	je     801058b8 <trap+0x2b8>
      cprintf("allocuvm out of memory\n");
      exit();
      
    }
    memset(mem, 0, PGSIZE);
8010566a:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80105671:	00 
80105672:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105679:	00 
8010567a:	89 34 24             	mov    %esi,(%esp)
8010567d:	e8 2e ed ff ff       	call   801043b0 <memset>
    if(mappages(myproc()->pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80105682:	e8 e9 e3 ff ff       	call   80103a70 <myproc>
80105687:	8d 96 00 00 00 80    	lea    -0x80000000(%esi),%edx
8010568d:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
80105694:	00 
80105695:	89 54 24 0c          	mov    %edx,0xc(%esp)
80105699:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801056a0:	00 
801056a1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801056a5:	8b 40 04             	mov    0x4(%eax),%eax
801056a8:	89 04 24             	mov    %eax,(%esp)
801056ab:	e8 b0 10 00 00       	call   80106760 <mappages>
801056b0:	85 c0                	test   %eax,%eax
801056b2:	79 94                	jns    80105648 <trap+0x48>
      cprintf("allocuvm out of memory (2)\n");
801056b4:	c7 04 24 37 77 10 80 	movl   $0x80107737,(%esp)
801056bb:	e8 90 b1 ff ff       	call   80100850 <cprintf>
      kfree(mem);
801056c0:	89 34 24             	mov    %esi,(%esp)
801056c3:	e8 b8 cc ff ff       	call   80102380 <kfree>
      exit();
801056c8:	e8 f3 e7 ff ff       	call   80103ec0 <exit>
801056cd:	8d 76 00             	lea    0x0(%esi),%esi
801056d0:	e9 73 ff ff ff       	jmp    80105648 <trap+0x48>
801056d5:	8d 76 00             	lea    0x0(%esi),%esi
801056d8:	90                   	nop
801056d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(tf->trapno){
801056e0:	ff 24 85 58 77 10 80 	jmp    *-0x7fef88a8(,%eax,4)
801056e7:	90                   	nop
801056e8:	90                   	nop
801056e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ideintr();
801056f0:	e8 2b ca ff ff       	call   80102120 <ideintr>
801056f5:	8d 76 00             	lea    0x0(%esi),%esi
    lapiceoi();
801056f8:	e8 43 d0 ff ff       	call   80102740 <lapiceoi>
801056fd:	8d 76 00             	lea    0x0(%esi),%esi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105700:	e8 6b e3 ff ff       	call   80103a70 <myproc>
80105705:	85 c0                	test   %eax,%eax
80105707:	74 1c                	je     80105725 <trap+0x125>
80105709:	e8 62 e3 ff ff       	call   80103a70 <myproc>
8010570e:	8b 50 24             	mov    0x24(%eax),%edx
80105711:	85 d2                	test   %edx,%edx
80105713:	74 10                	je     80105725 <trap+0x125>
80105715:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105719:	83 e0 03             	and    $0x3,%eax
8010571c:	83 f8 03             	cmp    $0x3,%eax
8010571f:	0f 84 ab 01 00 00    	je     801058d0 <trap+0x2d0>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105725:	e8 46 e3 ff ff       	call   80103a70 <myproc>
8010572a:	85 c0                	test   %eax,%eax
8010572c:	74 11                	je     8010573f <trap+0x13f>
8010572e:	66 90                	xchg   %ax,%ax
80105730:	e8 3b e3 ff ff       	call   80103a70 <myproc>
80105735:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105739:	0f 84 29 01 00 00    	je     80105868 <trap+0x268>
8010573f:	90                   	nop
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105740:	e8 2b e3 ff ff       	call   80103a70 <myproc>
80105745:	85 c0                	test   %eax,%eax
80105747:	74 1c                	je     80105765 <trap+0x165>
80105749:	e8 22 e3 ff ff       	call   80103a70 <myproc>
8010574e:	8b 40 24             	mov    0x24(%eax),%eax
80105751:	85 c0                	test   %eax,%eax
80105753:	74 10                	je     80105765 <trap+0x165>
80105755:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105759:	83 e0 03             	and    $0x3,%eax
8010575c:	83 f8 03             	cmp    $0x3,%eax
8010575f:	0f 84 44 01 00 00    	je     801058a9 <trap+0x2a9>
    exit();
}
80105765:	83 c4 2c             	add    $0x2c,%esp
80105768:	5b                   	pop    %ebx
80105769:	5e                   	pop    %esi
8010576a:	5f                   	pop    %edi
8010576b:	5d                   	pop    %ebp
8010576c:	c3                   	ret    
8010576d:	8d 76 00             	lea    0x0(%esi),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105770:	8b 77 38             	mov    0x38(%edi),%esi
80105773:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105777:	e8 74 e8 ff ff       	call   80103ff0 <cpuid>
8010577c:	c7 04 24 c4 76 10 80 	movl   $0x801076c4,(%esp)
80105783:	89 74 24 0c          	mov    %esi,0xc(%esp)
80105787:	89 5c 24 08          	mov    %ebx,0x8(%esp)
8010578b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010578f:	e8 bc b0 ff ff       	call   80100850 <cprintf>
    lapiceoi();
80105794:	e8 a7 cf ff ff       	call   80102740 <lapiceoi>
    break;
80105799:	e9 5f ff ff ff       	jmp    801056fd <trap+0xfd>
8010579e:	66 90                	xchg   %ax,%ax
    uartintr();
801057a0:	e8 7b 02 00 00       	call   80105a20 <uartintr>
801057a5:	8d 76 00             	lea    0x0(%esi),%esi
    lapiceoi();
801057a8:	e8 93 cf ff ff       	call   80102740 <lapiceoi>
801057ad:	8d 76 00             	lea    0x0(%esi),%esi
    break;
801057b0:	e9 48 ff ff ff       	jmp    801056fd <trap+0xfd>
801057b5:	8d 76 00             	lea    0x0(%esi),%esi
801057b8:	90                   	nop
801057b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
801057c0:	e8 fb cd ff ff       	call   801025c0 <kbdintr>
801057c5:	8d 76 00             	lea    0x0(%esi),%esi
    lapiceoi();
801057c8:	e8 73 cf ff ff       	call   80102740 <lapiceoi>
801057cd:	8d 76 00             	lea    0x0(%esi),%esi
    break;
801057d0:	e9 28 ff ff ff       	jmp    801056fd <trap+0xfd>
801057d5:	8d 76 00             	lea    0x0(%esi),%esi
801057d8:	90                   	nop
801057d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(cpuid() == 0){
801057e0:	e8 0b e8 ff ff       	call   80103ff0 <cpuid>
801057e5:	85 c0                	test   %eax,%eax
801057e7:	0f 84 03 01 00 00    	je     801058f0 <trap+0x2f0>
801057ed:	8d 76 00             	lea    0x0(%esi),%esi
if(myproc() && (tf->cs & 3) == 3){
801057f0:	e8 7b e2 ff ff       	call   80103a70 <myproc>
801057f5:	85 c0                	test   %eax,%eax
801057f7:	0f 84 f8 fe ff ff    	je     801056f5 <trap+0xf5>
801057fd:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105801:	83 e0 03             	and    $0x3,%eax
80105804:	83 f8 03             	cmp    $0x3,%eax
80105807:	0f 85 e8 fe ff ff    	jne    801056f5 <trap+0xf5>
        myproc()->tickscount++;
8010580d:	e8 5e e2 ff ff       	call   80103a70 <myproc>
80105812:	83 80 84 00 00 00 01 	addl   $0x1,0x84(%eax)
        if(myproc()->alarmticks == myproc()->tickscount){  // 到达了周期
80105819:	e8 52 e2 ff ff       	call   80103a70 <myproc>
8010581e:	8b 58 7c             	mov    0x7c(%eax),%ebx
80105821:	e8 4a e2 ff ff       	call   80103a70 <myproc>
80105826:	3b 98 84 00 00 00    	cmp    0x84(%eax),%ebx
8010582c:	0f 85 c3 fe ff ff    	jne    801056f5 <trap+0xf5>
            myproc()->tickscount = 0;
80105832:	e8 39 e2 ff ff       	call   80103a70 <myproc>
80105837:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
8010583e:	00 00 00 
          tf->esp -= 4;    
80105841:	8b 47 44             	mov    0x44(%edi),%eax
80105844:	8d 50 fc             	lea    -0x4(%eax),%edx
80105847:	89 57 44             	mov    %edx,0x44(%edi)
          *((uint *)(tf->esp)) = tf->eip;
8010584a:	8b 57 38             	mov    0x38(%edi),%edx
8010584d:	89 50 fc             	mov    %edx,-0x4(%eax)
          tf->eip =(uint) myproc()->alarmhandler;
80105850:	e8 1b e2 ff ff       	call   80103a70 <myproc>
80105855:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
8010585b:	89 47 38             	mov    %eax,0x38(%edi)
8010585e:	e9 92 fe ff ff       	jmp    801056f5 <trap+0xf5>
80105863:	90                   	nop
80105864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     tf->trapno == T_IRQ0+IRQ_TIMER)
80105868:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
8010586c:	0f 85 cd fe ff ff    	jne    8010573f <trap+0x13f>
    yield();
80105872:	e8 09 e6 ff ff       	call   80103e80 <yield>
80105877:	e9 c3 fe ff ff       	jmp    8010573f <trap+0x13f>
8010587c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed)
80105880:	e8 eb e1 ff ff       	call   80103a70 <myproc>
80105885:	8b 58 24             	mov    0x24(%eax),%ebx
80105888:	85 db                	test   %ebx,%ebx
8010588a:	75 54                	jne    801058e0 <trap+0x2e0>
    myproc()->tf = tf;
8010588c:	e8 df e1 ff ff       	call   80103a70 <myproc>
80105891:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105894:	e8 d7 ee ff ff       	call   80104770 <syscall>
    if(myproc()->killed)
80105899:	e8 d2 e1 ff ff       	call   80103a70 <myproc>
8010589e:	8b 48 24             	mov    0x24(%eax),%ecx
801058a1:	85 c9                	test   %ecx,%ecx
801058a3:	0f 84 bc fe ff ff    	je     80105765 <trap+0x165>
}
801058a9:	83 c4 2c             	add    $0x2c,%esp
801058ac:	5b                   	pop    %ebx
801058ad:	5e                   	pop    %esi
801058ae:	5f                   	pop    %edi
801058af:	5d                   	pop    %ebp
    exit();
801058b0:	e9 0b e6 ff ff       	jmp    80103ec0 <exit>
801058b5:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory\n");
801058b8:	c7 04 24 1f 77 10 80 	movl   $0x8010771f,(%esp)
801058bf:	e8 8c af ff ff       	call   80100850 <cprintf>
      exit();
801058c4:	e8 f7 e5 ff ff       	call   80103ec0 <exit>
801058c9:	e9 9c fd ff ff       	jmp    8010566a <trap+0x6a>
801058ce:	66 90                	xchg   %ax,%ax
    exit();
801058d0:	e8 eb e5 ff ff       	call   80103ec0 <exit>
801058d5:	8d 76 00             	lea    0x0(%esi),%esi
801058d8:	e9 48 fe ff ff       	jmp    80105725 <trap+0x125>
801058dd:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
801058e0:	e8 db e5 ff ff       	call   80103ec0 <exit>
801058e5:	8d 76 00             	lea    0x0(%esi),%esi
801058e8:	eb a2                	jmp    8010588c <trap+0x28c>
801058ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
801058f0:	c7 04 24 80 4f 11 80 	movl   $0x80114f80,(%esp)
801058f7:	e8 44 ea ff ff       	call   80104340 <acquire>
      ticks++;
801058fc:	83 05 c0 57 11 80 01 	addl   $0x1,0x801157c0
      wakeup(&ticks);
80105903:	c7 04 24 c0 57 11 80 	movl   $0x801157c0,(%esp)
8010590a:	e8 91 dd ff ff       	call   801036a0 <wakeup>
      release(&tickslock);
8010590f:	c7 04 24 80 4f 11 80 	movl   $0x80114f80,(%esp)
80105916:	e8 d5 e9 ff ff       	call   801042f0 <release>
8010591b:	e9 cd fe ff ff       	jmp    801057ed <trap+0x1ed>
80105920:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105923:	8b 5f 38             	mov    0x38(%edi),%ebx
80105926:	e8 c5 e6 ff ff       	call   80103ff0 <cpuid>
8010592b:	89 74 24 10          	mov    %esi,0x10(%esp)
8010592f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
80105933:	89 44 24 08          	mov    %eax,0x8(%esp)
80105937:	8b 47 30             	mov    0x30(%edi),%eax
8010593a:	c7 04 24 e8 76 10 80 	movl   $0x801076e8,(%esp)
80105941:	89 44 24 04          	mov    %eax,0x4(%esp)
80105945:	e8 06 af ff ff       	call   80100850 <cprintf>
      panic("trap");
8010594a:	c7 04 24 1a 77 10 80 	movl   $0x8010771a,(%esp)
80105951:	e8 5a aa ff ff       	call   801003b0 <panic>
80105956:	8d 76 00             	lea    0x0(%esi),%esi
80105959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105960 <tvinit>:
{
80105960:	55                   	push   %ebp
80105961:	31 c0                	xor    %eax,%eax
80105963:	89 e5                	mov    %esp,%ebp
80105965:	ba c0 4f 11 80       	mov    $0x80114fc0,%edx
8010596a:	83 ec 18             	sub    $0x18,%esp
8010596d:	8d 76 00             	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105970:	8b 0c 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%ecx
80105977:	66 89 0c c5 c0 4f 11 	mov    %cx,-0x7feeb040(,%eax,8)
8010597e:	80 
8010597f:	c1 e9 10             	shr    $0x10,%ecx
80105982:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
80105989:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
8010598e:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
80105993:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
  for(i = 0; i < 256; i++)
80105998:	83 c0 01             	add    $0x1,%eax
8010599b:	3d 00 01 00 00       	cmp    $0x100,%eax
801059a0:	75 ce                	jne    80105970 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801059a2:	a1 08 a1 10 80       	mov    0x8010a108,%eax
  initlock(&tickslock, "time");
801059a7:	c7 44 24 04 53 77 10 	movl   $0x80107753,0x4(%esp)
801059ae:	80 
801059af:	c7 04 24 80 4f 11 80 	movl   $0x80114f80,(%esp)
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801059b6:	66 c7 05 c2 51 11 80 	movw   $0x8,0x801151c2
801059bd:	08 00 
801059bf:	66 a3 c0 51 11 80    	mov    %ax,0x801151c0
801059c5:	c1 e8 10             	shr    $0x10,%eax
801059c8:	c6 05 c4 51 11 80 00 	movb   $0x0,0x801151c4
801059cf:	c6 05 c5 51 11 80 ef 	movb   $0xef,0x801151c5
801059d6:	66 a3 c6 51 11 80    	mov    %ax,0x801151c6
  initlock(&tickslock, "time");
801059dc:	e8 8f e7 ff ff       	call   80104170 <initlock>
}
801059e1:	c9                   	leave  
801059e2:	c3                   	ret    
801059e3:	66 90                	xchg   %ax,%ax
801059e5:	66 90                	xchg   %ax,%ax
801059e7:	66 90                	xchg   %ax,%ax
801059e9:	66 90                	xchg   %ax,%ax
801059eb:	66 90                	xchg   %ax,%ax
801059ed:	66 90                	xchg   %ax,%ax
801059ef:	90                   	nop

801059f0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
801059f0:	a1 c4 a5 10 80       	mov    0x8010a5c4,%eax
{
801059f5:	55                   	push   %ebp
801059f6:	89 e5                	mov    %esp,%ebp
  if(!uart)
801059f8:	85 c0                	test   %eax,%eax
801059fa:	75 0c                	jne    80105a08 <uartgetc+0x18>
    return -1;
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
801059fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105a01:	5d                   	pop    %ebp
80105a02:	c3                   	ret    
80105a03:	90                   	nop
80105a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105a08:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a0d:	ec                   	in     (%dx),%al
  if(!(inb(COM1+5) & 0x01))
80105a0e:	a8 01                	test   $0x1,%al
80105a10:	74 ea                	je     801059fc <uartgetc+0xc>
80105a12:	b2 f8                	mov    $0xf8,%dl
80105a14:	ec                   	in     (%dx),%al
  return inb(COM1+0);
80105a15:	0f b6 c0             	movzbl %al,%eax
}
80105a18:	5d                   	pop    %ebp
80105a19:	c3                   	ret    
80105a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105a20 <uartintr>:

void
uartintr(void)
{
80105a20:	55                   	push   %ebp
80105a21:	89 e5                	mov    %esp,%ebp
80105a23:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
80105a26:	c7 04 24 f0 59 10 80 	movl   $0x801059f0,(%esp)
80105a2d:	e8 ee ab ff ff       	call   80100620 <consoleintr>
}
80105a32:	c9                   	leave  
80105a33:	c3                   	ret    
80105a34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105a3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105a40 <uartputc>:
{
80105a40:	55                   	push   %ebp
80105a41:	89 e5                	mov    %esp,%ebp
80105a43:	56                   	push   %esi
80105a44:	be fd 03 00 00       	mov    $0x3fd,%esi
80105a49:	53                   	push   %ebx
  if(!uart)
80105a4a:	31 db                	xor    %ebx,%ebx
{
80105a4c:	83 ec 10             	sub    $0x10,%esp
  if(!uart)
80105a4f:	8b 15 c4 a5 10 80    	mov    0x8010a5c4,%edx
80105a55:	85 d2                	test   %edx,%edx
80105a57:	75 1e                	jne    80105a77 <uartputc+0x37>
80105a59:	eb 2c                	jmp    80105a87 <uartputc+0x47>
80105a5b:	90                   	nop
80105a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105a60:	83 c3 01             	add    $0x1,%ebx
    microdelay(10);
80105a63:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
80105a6a:	e8 f1 cc ff ff       	call   80102760 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105a6f:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
80105a75:	74 07                	je     80105a7e <uartputc+0x3e>
80105a77:	89 f2                	mov    %esi,%edx
80105a79:	ec                   	in     (%dx),%al
80105a7a:	a8 20                	test   $0x20,%al
80105a7c:	74 e2                	je     80105a60 <uartputc+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105a7e:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a83:	8b 45 08             	mov    0x8(%ebp),%eax
80105a86:	ee                   	out    %al,(%dx)
}
80105a87:	83 c4 10             	add    $0x10,%esp
80105a8a:	5b                   	pop    %ebx
80105a8b:	5e                   	pop    %esi
80105a8c:	5d                   	pop    %ebp
80105a8d:	c3                   	ret    
80105a8e:	66 90                	xchg   %ax,%ax

80105a90 <uartinit>:
{
80105a90:	55                   	push   %ebp
80105a91:	31 c9                	xor    %ecx,%ecx
80105a93:	89 e5                	mov    %esp,%ebp
80105a95:	89 c8                	mov    %ecx,%eax
80105a97:	57                   	push   %edi
80105a98:	bf fa 03 00 00       	mov    $0x3fa,%edi
80105a9d:	56                   	push   %esi
80105a9e:	89 fa                	mov    %edi,%edx
80105aa0:	53                   	push   %ebx
80105aa1:	83 ec 1c             	sub    $0x1c,%esp
80105aa4:	ee                   	out    %al,(%dx)
80105aa5:	bb fb 03 00 00       	mov    $0x3fb,%ebx
80105aaa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105aaf:	89 da                	mov    %ebx,%edx
80105ab1:	ee                   	out    %al,(%dx)
80105ab2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105ab7:	b2 f8                	mov    $0xf8,%dl
80105ab9:	ee                   	out    %al,(%dx)
80105aba:	be f9 03 00 00       	mov    $0x3f9,%esi
80105abf:	89 c8                	mov    %ecx,%eax
80105ac1:	89 f2                	mov    %esi,%edx
80105ac3:	ee                   	out    %al,(%dx)
80105ac4:	b8 03 00 00 00       	mov    $0x3,%eax
80105ac9:	89 da                	mov    %ebx,%edx
80105acb:	ee                   	out    %al,(%dx)
80105acc:	b2 fc                	mov    $0xfc,%dl
80105ace:	89 c8                	mov    %ecx,%eax
80105ad0:	ee                   	out    %al,(%dx)
80105ad1:	b8 01 00 00 00       	mov    $0x1,%eax
80105ad6:	89 f2                	mov    %esi,%edx
80105ad8:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105ad9:	b2 fd                	mov    $0xfd,%dl
80105adb:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105adc:	3c ff                	cmp    $0xff,%al
80105ade:	74 45                	je     80105b25 <uartinit+0x95>
  uart = 1;
80105ae0:	c7 05 c4 a5 10 80 01 	movl   $0x1,0x8010a5c4
80105ae7:	00 00 00 
80105aea:	89 fa                	mov    %edi,%edx
80105aec:	ec                   	in     (%dx),%al
80105aed:	b2 f8                	mov    $0xf8,%dl
80105aef:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105af0:	bb d8 77 10 80       	mov    $0x801077d8,%ebx
80105af5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105afc:	00 
80105afd:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80105b04:	e8 37 c7 ff ff       	call   80102240 <ioapicenable>
80105b09:	b8 78 00 00 00       	mov    $0x78,%eax
80105b0e:	66 90                	xchg   %ax,%ax
    uartputc(*p);
80105b10:	0f be c0             	movsbl %al,%eax
  for(p="xv6...\n"; *p; p++)
80105b13:	83 c3 01             	add    $0x1,%ebx
    uartputc(*p);
80105b16:	89 04 24             	mov    %eax,(%esp)
80105b19:	e8 22 ff ff ff       	call   80105a40 <uartputc>
  for(p="xv6...\n"; *p; p++)
80105b1e:	0f b6 03             	movzbl (%ebx),%eax
80105b21:	84 c0                	test   %al,%al
80105b23:	75 eb                	jne    80105b10 <uartinit+0x80>
}
80105b25:	83 c4 1c             	add    $0x1c,%esp
80105b28:	5b                   	pop    %ebx
80105b29:	5e                   	pop    %esi
80105b2a:	5f                   	pop    %edi
80105b2b:	5d                   	pop    %ebp
80105b2c:	c3                   	ret    

80105b2d <vector0>:
80105b2d:	6a 00                	push   $0x0
80105b2f:	6a 00                	push   $0x0
80105b31:	e9 76 fa ff ff       	jmp    801055ac <alltraps>

80105b36 <vector1>:
80105b36:	6a 00                	push   $0x0
80105b38:	6a 01                	push   $0x1
80105b3a:	e9 6d fa ff ff       	jmp    801055ac <alltraps>

80105b3f <vector2>:
80105b3f:	6a 00                	push   $0x0
80105b41:	6a 02                	push   $0x2
80105b43:	e9 64 fa ff ff       	jmp    801055ac <alltraps>

80105b48 <vector3>:
80105b48:	6a 00                	push   $0x0
80105b4a:	6a 03                	push   $0x3
80105b4c:	e9 5b fa ff ff       	jmp    801055ac <alltraps>

80105b51 <vector4>:
80105b51:	6a 00                	push   $0x0
80105b53:	6a 04                	push   $0x4
80105b55:	e9 52 fa ff ff       	jmp    801055ac <alltraps>

80105b5a <vector5>:
80105b5a:	6a 00                	push   $0x0
80105b5c:	6a 05                	push   $0x5
80105b5e:	e9 49 fa ff ff       	jmp    801055ac <alltraps>

80105b63 <vector6>:
80105b63:	6a 00                	push   $0x0
80105b65:	6a 06                	push   $0x6
80105b67:	e9 40 fa ff ff       	jmp    801055ac <alltraps>

80105b6c <vector7>:
80105b6c:	6a 00                	push   $0x0
80105b6e:	6a 07                	push   $0x7
80105b70:	e9 37 fa ff ff       	jmp    801055ac <alltraps>

80105b75 <vector8>:
80105b75:	6a 08                	push   $0x8
80105b77:	e9 30 fa ff ff       	jmp    801055ac <alltraps>

80105b7c <vector9>:
80105b7c:	6a 00                	push   $0x0
80105b7e:	6a 09                	push   $0x9
80105b80:	e9 27 fa ff ff       	jmp    801055ac <alltraps>

80105b85 <vector10>:
80105b85:	6a 0a                	push   $0xa
80105b87:	e9 20 fa ff ff       	jmp    801055ac <alltraps>

80105b8c <vector11>:
80105b8c:	6a 0b                	push   $0xb
80105b8e:	e9 19 fa ff ff       	jmp    801055ac <alltraps>

80105b93 <vector12>:
80105b93:	6a 0c                	push   $0xc
80105b95:	e9 12 fa ff ff       	jmp    801055ac <alltraps>

80105b9a <vector13>:
80105b9a:	6a 0d                	push   $0xd
80105b9c:	e9 0b fa ff ff       	jmp    801055ac <alltraps>

80105ba1 <vector14>:
80105ba1:	6a 0e                	push   $0xe
80105ba3:	e9 04 fa ff ff       	jmp    801055ac <alltraps>

80105ba8 <vector15>:
80105ba8:	6a 00                	push   $0x0
80105baa:	6a 0f                	push   $0xf
80105bac:	e9 fb f9 ff ff       	jmp    801055ac <alltraps>

80105bb1 <vector16>:
80105bb1:	6a 00                	push   $0x0
80105bb3:	6a 10                	push   $0x10
80105bb5:	e9 f2 f9 ff ff       	jmp    801055ac <alltraps>

80105bba <vector17>:
80105bba:	6a 11                	push   $0x11
80105bbc:	e9 eb f9 ff ff       	jmp    801055ac <alltraps>

80105bc1 <vector18>:
80105bc1:	6a 00                	push   $0x0
80105bc3:	6a 12                	push   $0x12
80105bc5:	e9 e2 f9 ff ff       	jmp    801055ac <alltraps>

80105bca <vector19>:
80105bca:	6a 00                	push   $0x0
80105bcc:	6a 13                	push   $0x13
80105bce:	e9 d9 f9 ff ff       	jmp    801055ac <alltraps>

80105bd3 <vector20>:
80105bd3:	6a 00                	push   $0x0
80105bd5:	6a 14                	push   $0x14
80105bd7:	e9 d0 f9 ff ff       	jmp    801055ac <alltraps>

80105bdc <vector21>:
80105bdc:	6a 00                	push   $0x0
80105bde:	6a 15                	push   $0x15
80105be0:	e9 c7 f9 ff ff       	jmp    801055ac <alltraps>

80105be5 <vector22>:
80105be5:	6a 00                	push   $0x0
80105be7:	6a 16                	push   $0x16
80105be9:	e9 be f9 ff ff       	jmp    801055ac <alltraps>

80105bee <vector23>:
80105bee:	6a 00                	push   $0x0
80105bf0:	6a 17                	push   $0x17
80105bf2:	e9 b5 f9 ff ff       	jmp    801055ac <alltraps>

80105bf7 <vector24>:
80105bf7:	6a 00                	push   $0x0
80105bf9:	6a 18                	push   $0x18
80105bfb:	e9 ac f9 ff ff       	jmp    801055ac <alltraps>

80105c00 <vector25>:
80105c00:	6a 00                	push   $0x0
80105c02:	6a 19                	push   $0x19
80105c04:	e9 a3 f9 ff ff       	jmp    801055ac <alltraps>

80105c09 <vector26>:
80105c09:	6a 00                	push   $0x0
80105c0b:	6a 1a                	push   $0x1a
80105c0d:	e9 9a f9 ff ff       	jmp    801055ac <alltraps>

80105c12 <vector27>:
80105c12:	6a 00                	push   $0x0
80105c14:	6a 1b                	push   $0x1b
80105c16:	e9 91 f9 ff ff       	jmp    801055ac <alltraps>

80105c1b <vector28>:
80105c1b:	6a 00                	push   $0x0
80105c1d:	6a 1c                	push   $0x1c
80105c1f:	e9 88 f9 ff ff       	jmp    801055ac <alltraps>

80105c24 <vector29>:
80105c24:	6a 00                	push   $0x0
80105c26:	6a 1d                	push   $0x1d
80105c28:	e9 7f f9 ff ff       	jmp    801055ac <alltraps>

80105c2d <vector30>:
80105c2d:	6a 00                	push   $0x0
80105c2f:	6a 1e                	push   $0x1e
80105c31:	e9 76 f9 ff ff       	jmp    801055ac <alltraps>

80105c36 <vector31>:
80105c36:	6a 00                	push   $0x0
80105c38:	6a 1f                	push   $0x1f
80105c3a:	e9 6d f9 ff ff       	jmp    801055ac <alltraps>

80105c3f <vector32>:
80105c3f:	6a 00                	push   $0x0
80105c41:	6a 20                	push   $0x20
80105c43:	e9 64 f9 ff ff       	jmp    801055ac <alltraps>

80105c48 <vector33>:
80105c48:	6a 00                	push   $0x0
80105c4a:	6a 21                	push   $0x21
80105c4c:	e9 5b f9 ff ff       	jmp    801055ac <alltraps>

80105c51 <vector34>:
80105c51:	6a 00                	push   $0x0
80105c53:	6a 22                	push   $0x22
80105c55:	e9 52 f9 ff ff       	jmp    801055ac <alltraps>

80105c5a <vector35>:
80105c5a:	6a 00                	push   $0x0
80105c5c:	6a 23                	push   $0x23
80105c5e:	e9 49 f9 ff ff       	jmp    801055ac <alltraps>

80105c63 <vector36>:
80105c63:	6a 00                	push   $0x0
80105c65:	6a 24                	push   $0x24
80105c67:	e9 40 f9 ff ff       	jmp    801055ac <alltraps>

80105c6c <vector37>:
80105c6c:	6a 00                	push   $0x0
80105c6e:	6a 25                	push   $0x25
80105c70:	e9 37 f9 ff ff       	jmp    801055ac <alltraps>

80105c75 <vector38>:
80105c75:	6a 00                	push   $0x0
80105c77:	6a 26                	push   $0x26
80105c79:	e9 2e f9 ff ff       	jmp    801055ac <alltraps>

80105c7e <vector39>:
80105c7e:	6a 00                	push   $0x0
80105c80:	6a 27                	push   $0x27
80105c82:	e9 25 f9 ff ff       	jmp    801055ac <alltraps>

80105c87 <vector40>:
80105c87:	6a 00                	push   $0x0
80105c89:	6a 28                	push   $0x28
80105c8b:	e9 1c f9 ff ff       	jmp    801055ac <alltraps>

80105c90 <vector41>:
80105c90:	6a 00                	push   $0x0
80105c92:	6a 29                	push   $0x29
80105c94:	e9 13 f9 ff ff       	jmp    801055ac <alltraps>

80105c99 <vector42>:
80105c99:	6a 00                	push   $0x0
80105c9b:	6a 2a                	push   $0x2a
80105c9d:	e9 0a f9 ff ff       	jmp    801055ac <alltraps>

80105ca2 <vector43>:
80105ca2:	6a 00                	push   $0x0
80105ca4:	6a 2b                	push   $0x2b
80105ca6:	e9 01 f9 ff ff       	jmp    801055ac <alltraps>

80105cab <vector44>:
80105cab:	6a 00                	push   $0x0
80105cad:	6a 2c                	push   $0x2c
80105caf:	e9 f8 f8 ff ff       	jmp    801055ac <alltraps>

80105cb4 <vector45>:
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 2d                	push   $0x2d
80105cb8:	e9 ef f8 ff ff       	jmp    801055ac <alltraps>

80105cbd <vector46>:
80105cbd:	6a 00                	push   $0x0
80105cbf:	6a 2e                	push   $0x2e
80105cc1:	e9 e6 f8 ff ff       	jmp    801055ac <alltraps>

80105cc6 <vector47>:
80105cc6:	6a 00                	push   $0x0
80105cc8:	6a 2f                	push   $0x2f
80105cca:	e9 dd f8 ff ff       	jmp    801055ac <alltraps>

80105ccf <vector48>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	6a 30                	push   $0x30
80105cd3:	e9 d4 f8 ff ff       	jmp    801055ac <alltraps>

80105cd8 <vector49>:
80105cd8:	6a 00                	push   $0x0
80105cda:	6a 31                	push   $0x31
80105cdc:	e9 cb f8 ff ff       	jmp    801055ac <alltraps>

80105ce1 <vector50>:
80105ce1:	6a 00                	push   $0x0
80105ce3:	6a 32                	push   $0x32
80105ce5:	e9 c2 f8 ff ff       	jmp    801055ac <alltraps>

80105cea <vector51>:
80105cea:	6a 00                	push   $0x0
80105cec:	6a 33                	push   $0x33
80105cee:	e9 b9 f8 ff ff       	jmp    801055ac <alltraps>

80105cf3 <vector52>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	6a 34                	push   $0x34
80105cf7:	e9 b0 f8 ff ff       	jmp    801055ac <alltraps>

80105cfc <vector53>:
80105cfc:	6a 00                	push   $0x0
80105cfe:	6a 35                	push   $0x35
80105d00:	e9 a7 f8 ff ff       	jmp    801055ac <alltraps>

80105d05 <vector54>:
80105d05:	6a 00                	push   $0x0
80105d07:	6a 36                	push   $0x36
80105d09:	e9 9e f8 ff ff       	jmp    801055ac <alltraps>

80105d0e <vector55>:
80105d0e:	6a 00                	push   $0x0
80105d10:	6a 37                	push   $0x37
80105d12:	e9 95 f8 ff ff       	jmp    801055ac <alltraps>

80105d17 <vector56>:
80105d17:	6a 00                	push   $0x0
80105d19:	6a 38                	push   $0x38
80105d1b:	e9 8c f8 ff ff       	jmp    801055ac <alltraps>

80105d20 <vector57>:
80105d20:	6a 00                	push   $0x0
80105d22:	6a 39                	push   $0x39
80105d24:	e9 83 f8 ff ff       	jmp    801055ac <alltraps>

80105d29 <vector58>:
80105d29:	6a 00                	push   $0x0
80105d2b:	6a 3a                	push   $0x3a
80105d2d:	e9 7a f8 ff ff       	jmp    801055ac <alltraps>

80105d32 <vector59>:
80105d32:	6a 00                	push   $0x0
80105d34:	6a 3b                	push   $0x3b
80105d36:	e9 71 f8 ff ff       	jmp    801055ac <alltraps>

80105d3b <vector60>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	6a 3c                	push   $0x3c
80105d3f:	e9 68 f8 ff ff       	jmp    801055ac <alltraps>

80105d44 <vector61>:
80105d44:	6a 00                	push   $0x0
80105d46:	6a 3d                	push   $0x3d
80105d48:	e9 5f f8 ff ff       	jmp    801055ac <alltraps>

80105d4d <vector62>:
80105d4d:	6a 00                	push   $0x0
80105d4f:	6a 3e                	push   $0x3e
80105d51:	e9 56 f8 ff ff       	jmp    801055ac <alltraps>

80105d56 <vector63>:
80105d56:	6a 00                	push   $0x0
80105d58:	6a 3f                	push   $0x3f
80105d5a:	e9 4d f8 ff ff       	jmp    801055ac <alltraps>

80105d5f <vector64>:
80105d5f:	6a 00                	push   $0x0
80105d61:	6a 40                	push   $0x40
80105d63:	e9 44 f8 ff ff       	jmp    801055ac <alltraps>

80105d68 <vector65>:
80105d68:	6a 00                	push   $0x0
80105d6a:	6a 41                	push   $0x41
80105d6c:	e9 3b f8 ff ff       	jmp    801055ac <alltraps>

80105d71 <vector66>:
80105d71:	6a 00                	push   $0x0
80105d73:	6a 42                	push   $0x42
80105d75:	e9 32 f8 ff ff       	jmp    801055ac <alltraps>

80105d7a <vector67>:
80105d7a:	6a 00                	push   $0x0
80105d7c:	6a 43                	push   $0x43
80105d7e:	e9 29 f8 ff ff       	jmp    801055ac <alltraps>

80105d83 <vector68>:
80105d83:	6a 00                	push   $0x0
80105d85:	6a 44                	push   $0x44
80105d87:	e9 20 f8 ff ff       	jmp    801055ac <alltraps>

80105d8c <vector69>:
80105d8c:	6a 00                	push   $0x0
80105d8e:	6a 45                	push   $0x45
80105d90:	e9 17 f8 ff ff       	jmp    801055ac <alltraps>

80105d95 <vector70>:
80105d95:	6a 00                	push   $0x0
80105d97:	6a 46                	push   $0x46
80105d99:	e9 0e f8 ff ff       	jmp    801055ac <alltraps>

80105d9e <vector71>:
80105d9e:	6a 00                	push   $0x0
80105da0:	6a 47                	push   $0x47
80105da2:	e9 05 f8 ff ff       	jmp    801055ac <alltraps>

80105da7 <vector72>:
80105da7:	6a 00                	push   $0x0
80105da9:	6a 48                	push   $0x48
80105dab:	e9 fc f7 ff ff       	jmp    801055ac <alltraps>

80105db0 <vector73>:
80105db0:	6a 00                	push   $0x0
80105db2:	6a 49                	push   $0x49
80105db4:	e9 f3 f7 ff ff       	jmp    801055ac <alltraps>

80105db9 <vector74>:
80105db9:	6a 00                	push   $0x0
80105dbb:	6a 4a                	push   $0x4a
80105dbd:	e9 ea f7 ff ff       	jmp    801055ac <alltraps>

80105dc2 <vector75>:
80105dc2:	6a 00                	push   $0x0
80105dc4:	6a 4b                	push   $0x4b
80105dc6:	e9 e1 f7 ff ff       	jmp    801055ac <alltraps>

80105dcb <vector76>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	6a 4c                	push   $0x4c
80105dcf:	e9 d8 f7 ff ff       	jmp    801055ac <alltraps>

80105dd4 <vector77>:
80105dd4:	6a 00                	push   $0x0
80105dd6:	6a 4d                	push   $0x4d
80105dd8:	e9 cf f7 ff ff       	jmp    801055ac <alltraps>

80105ddd <vector78>:
80105ddd:	6a 00                	push   $0x0
80105ddf:	6a 4e                	push   $0x4e
80105de1:	e9 c6 f7 ff ff       	jmp    801055ac <alltraps>

80105de6 <vector79>:
80105de6:	6a 00                	push   $0x0
80105de8:	6a 4f                	push   $0x4f
80105dea:	e9 bd f7 ff ff       	jmp    801055ac <alltraps>

80105def <vector80>:
80105def:	6a 00                	push   $0x0
80105df1:	6a 50                	push   $0x50
80105df3:	e9 b4 f7 ff ff       	jmp    801055ac <alltraps>

80105df8 <vector81>:
80105df8:	6a 00                	push   $0x0
80105dfa:	6a 51                	push   $0x51
80105dfc:	e9 ab f7 ff ff       	jmp    801055ac <alltraps>

80105e01 <vector82>:
80105e01:	6a 00                	push   $0x0
80105e03:	6a 52                	push   $0x52
80105e05:	e9 a2 f7 ff ff       	jmp    801055ac <alltraps>

80105e0a <vector83>:
80105e0a:	6a 00                	push   $0x0
80105e0c:	6a 53                	push   $0x53
80105e0e:	e9 99 f7 ff ff       	jmp    801055ac <alltraps>

80105e13 <vector84>:
80105e13:	6a 00                	push   $0x0
80105e15:	6a 54                	push   $0x54
80105e17:	e9 90 f7 ff ff       	jmp    801055ac <alltraps>

80105e1c <vector85>:
80105e1c:	6a 00                	push   $0x0
80105e1e:	6a 55                	push   $0x55
80105e20:	e9 87 f7 ff ff       	jmp    801055ac <alltraps>

80105e25 <vector86>:
80105e25:	6a 00                	push   $0x0
80105e27:	6a 56                	push   $0x56
80105e29:	e9 7e f7 ff ff       	jmp    801055ac <alltraps>

80105e2e <vector87>:
80105e2e:	6a 00                	push   $0x0
80105e30:	6a 57                	push   $0x57
80105e32:	e9 75 f7 ff ff       	jmp    801055ac <alltraps>

80105e37 <vector88>:
80105e37:	6a 00                	push   $0x0
80105e39:	6a 58                	push   $0x58
80105e3b:	e9 6c f7 ff ff       	jmp    801055ac <alltraps>

80105e40 <vector89>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 59                	push   $0x59
80105e44:	e9 63 f7 ff ff       	jmp    801055ac <alltraps>

80105e49 <vector90>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 5a                	push   $0x5a
80105e4d:	e9 5a f7 ff ff       	jmp    801055ac <alltraps>

80105e52 <vector91>:
80105e52:	6a 00                	push   $0x0
80105e54:	6a 5b                	push   $0x5b
80105e56:	e9 51 f7 ff ff       	jmp    801055ac <alltraps>

80105e5b <vector92>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	6a 5c                	push   $0x5c
80105e5f:	e9 48 f7 ff ff       	jmp    801055ac <alltraps>

80105e64 <vector93>:
80105e64:	6a 00                	push   $0x0
80105e66:	6a 5d                	push   $0x5d
80105e68:	e9 3f f7 ff ff       	jmp    801055ac <alltraps>

80105e6d <vector94>:
80105e6d:	6a 00                	push   $0x0
80105e6f:	6a 5e                	push   $0x5e
80105e71:	e9 36 f7 ff ff       	jmp    801055ac <alltraps>

80105e76 <vector95>:
80105e76:	6a 00                	push   $0x0
80105e78:	6a 5f                	push   $0x5f
80105e7a:	e9 2d f7 ff ff       	jmp    801055ac <alltraps>

80105e7f <vector96>:
80105e7f:	6a 00                	push   $0x0
80105e81:	6a 60                	push   $0x60
80105e83:	e9 24 f7 ff ff       	jmp    801055ac <alltraps>

80105e88 <vector97>:
80105e88:	6a 00                	push   $0x0
80105e8a:	6a 61                	push   $0x61
80105e8c:	e9 1b f7 ff ff       	jmp    801055ac <alltraps>

80105e91 <vector98>:
80105e91:	6a 00                	push   $0x0
80105e93:	6a 62                	push   $0x62
80105e95:	e9 12 f7 ff ff       	jmp    801055ac <alltraps>

80105e9a <vector99>:
80105e9a:	6a 00                	push   $0x0
80105e9c:	6a 63                	push   $0x63
80105e9e:	e9 09 f7 ff ff       	jmp    801055ac <alltraps>

80105ea3 <vector100>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	6a 64                	push   $0x64
80105ea7:	e9 00 f7 ff ff       	jmp    801055ac <alltraps>

80105eac <vector101>:
80105eac:	6a 00                	push   $0x0
80105eae:	6a 65                	push   $0x65
80105eb0:	e9 f7 f6 ff ff       	jmp    801055ac <alltraps>

80105eb5 <vector102>:
80105eb5:	6a 00                	push   $0x0
80105eb7:	6a 66                	push   $0x66
80105eb9:	e9 ee f6 ff ff       	jmp    801055ac <alltraps>

80105ebe <vector103>:
80105ebe:	6a 00                	push   $0x0
80105ec0:	6a 67                	push   $0x67
80105ec2:	e9 e5 f6 ff ff       	jmp    801055ac <alltraps>

80105ec7 <vector104>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	6a 68                	push   $0x68
80105ecb:	e9 dc f6 ff ff       	jmp    801055ac <alltraps>

80105ed0 <vector105>:
80105ed0:	6a 00                	push   $0x0
80105ed2:	6a 69                	push   $0x69
80105ed4:	e9 d3 f6 ff ff       	jmp    801055ac <alltraps>

80105ed9 <vector106>:
80105ed9:	6a 00                	push   $0x0
80105edb:	6a 6a                	push   $0x6a
80105edd:	e9 ca f6 ff ff       	jmp    801055ac <alltraps>

80105ee2 <vector107>:
80105ee2:	6a 00                	push   $0x0
80105ee4:	6a 6b                	push   $0x6b
80105ee6:	e9 c1 f6 ff ff       	jmp    801055ac <alltraps>

80105eeb <vector108>:
80105eeb:	6a 00                	push   $0x0
80105eed:	6a 6c                	push   $0x6c
80105eef:	e9 b8 f6 ff ff       	jmp    801055ac <alltraps>

80105ef4 <vector109>:
80105ef4:	6a 00                	push   $0x0
80105ef6:	6a 6d                	push   $0x6d
80105ef8:	e9 af f6 ff ff       	jmp    801055ac <alltraps>

80105efd <vector110>:
80105efd:	6a 00                	push   $0x0
80105eff:	6a 6e                	push   $0x6e
80105f01:	e9 a6 f6 ff ff       	jmp    801055ac <alltraps>

80105f06 <vector111>:
80105f06:	6a 00                	push   $0x0
80105f08:	6a 6f                	push   $0x6f
80105f0a:	e9 9d f6 ff ff       	jmp    801055ac <alltraps>

80105f0f <vector112>:
80105f0f:	6a 00                	push   $0x0
80105f11:	6a 70                	push   $0x70
80105f13:	e9 94 f6 ff ff       	jmp    801055ac <alltraps>

80105f18 <vector113>:
80105f18:	6a 00                	push   $0x0
80105f1a:	6a 71                	push   $0x71
80105f1c:	e9 8b f6 ff ff       	jmp    801055ac <alltraps>

80105f21 <vector114>:
80105f21:	6a 00                	push   $0x0
80105f23:	6a 72                	push   $0x72
80105f25:	e9 82 f6 ff ff       	jmp    801055ac <alltraps>

80105f2a <vector115>:
80105f2a:	6a 00                	push   $0x0
80105f2c:	6a 73                	push   $0x73
80105f2e:	e9 79 f6 ff ff       	jmp    801055ac <alltraps>

80105f33 <vector116>:
80105f33:	6a 00                	push   $0x0
80105f35:	6a 74                	push   $0x74
80105f37:	e9 70 f6 ff ff       	jmp    801055ac <alltraps>

80105f3c <vector117>:
80105f3c:	6a 00                	push   $0x0
80105f3e:	6a 75                	push   $0x75
80105f40:	e9 67 f6 ff ff       	jmp    801055ac <alltraps>

80105f45 <vector118>:
80105f45:	6a 00                	push   $0x0
80105f47:	6a 76                	push   $0x76
80105f49:	e9 5e f6 ff ff       	jmp    801055ac <alltraps>

80105f4e <vector119>:
80105f4e:	6a 00                	push   $0x0
80105f50:	6a 77                	push   $0x77
80105f52:	e9 55 f6 ff ff       	jmp    801055ac <alltraps>

80105f57 <vector120>:
80105f57:	6a 00                	push   $0x0
80105f59:	6a 78                	push   $0x78
80105f5b:	e9 4c f6 ff ff       	jmp    801055ac <alltraps>

80105f60 <vector121>:
80105f60:	6a 00                	push   $0x0
80105f62:	6a 79                	push   $0x79
80105f64:	e9 43 f6 ff ff       	jmp    801055ac <alltraps>

80105f69 <vector122>:
80105f69:	6a 00                	push   $0x0
80105f6b:	6a 7a                	push   $0x7a
80105f6d:	e9 3a f6 ff ff       	jmp    801055ac <alltraps>

80105f72 <vector123>:
80105f72:	6a 00                	push   $0x0
80105f74:	6a 7b                	push   $0x7b
80105f76:	e9 31 f6 ff ff       	jmp    801055ac <alltraps>

80105f7b <vector124>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	6a 7c                	push   $0x7c
80105f7f:	e9 28 f6 ff ff       	jmp    801055ac <alltraps>

80105f84 <vector125>:
80105f84:	6a 00                	push   $0x0
80105f86:	6a 7d                	push   $0x7d
80105f88:	e9 1f f6 ff ff       	jmp    801055ac <alltraps>

80105f8d <vector126>:
80105f8d:	6a 00                	push   $0x0
80105f8f:	6a 7e                	push   $0x7e
80105f91:	e9 16 f6 ff ff       	jmp    801055ac <alltraps>

80105f96 <vector127>:
80105f96:	6a 00                	push   $0x0
80105f98:	6a 7f                	push   $0x7f
80105f9a:	e9 0d f6 ff ff       	jmp    801055ac <alltraps>

80105f9f <vector128>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	68 80 00 00 00       	push   $0x80
80105fa6:	e9 01 f6 ff ff       	jmp    801055ac <alltraps>

80105fab <vector129>:
80105fab:	6a 00                	push   $0x0
80105fad:	68 81 00 00 00       	push   $0x81
80105fb2:	e9 f5 f5 ff ff       	jmp    801055ac <alltraps>

80105fb7 <vector130>:
80105fb7:	6a 00                	push   $0x0
80105fb9:	68 82 00 00 00       	push   $0x82
80105fbe:	e9 e9 f5 ff ff       	jmp    801055ac <alltraps>

80105fc3 <vector131>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	68 83 00 00 00       	push   $0x83
80105fca:	e9 dd f5 ff ff       	jmp    801055ac <alltraps>

80105fcf <vector132>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	68 84 00 00 00       	push   $0x84
80105fd6:	e9 d1 f5 ff ff       	jmp    801055ac <alltraps>

80105fdb <vector133>:
80105fdb:	6a 00                	push   $0x0
80105fdd:	68 85 00 00 00       	push   $0x85
80105fe2:	e9 c5 f5 ff ff       	jmp    801055ac <alltraps>

80105fe7 <vector134>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	68 86 00 00 00       	push   $0x86
80105fee:	e9 b9 f5 ff ff       	jmp    801055ac <alltraps>

80105ff3 <vector135>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	68 87 00 00 00       	push   $0x87
80105ffa:	e9 ad f5 ff ff       	jmp    801055ac <alltraps>

80105fff <vector136>:
80105fff:	6a 00                	push   $0x0
80106001:	68 88 00 00 00       	push   $0x88
80106006:	e9 a1 f5 ff ff       	jmp    801055ac <alltraps>

8010600b <vector137>:
8010600b:	6a 00                	push   $0x0
8010600d:	68 89 00 00 00       	push   $0x89
80106012:	e9 95 f5 ff ff       	jmp    801055ac <alltraps>

80106017 <vector138>:
80106017:	6a 00                	push   $0x0
80106019:	68 8a 00 00 00       	push   $0x8a
8010601e:	e9 89 f5 ff ff       	jmp    801055ac <alltraps>

80106023 <vector139>:
80106023:	6a 00                	push   $0x0
80106025:	68 8b 00 00 00       	push   $0x8b
8010602a:	e9 7d f5 ff ff       	jmp    801055ac <alltraps>

8010602f <vector140>:
8010602f:	6a 00                	push   $0x0
80106031:	68 8c 00 00 00       	push   $0x8c
80106036:	e9 71 f5 ff ff       	jmp    801055ac <alltraps>

8010603b <vector141>:
8010603b:	6a 00                	push   $0x0
8010603d:	68 8d 00 00 00       	push   $0x8d
80106042:	e9 65 f5 ff ff       	jmp    801055ac <alltraps>

80106047 <vector142>:
80106047:	6a 00                	push   $0x0
80106049:	68 8e 00 00 00       	push   $0x8e
8010604e:	e9 59 f5 ff ff       	jmp    801055ac <alltraps>

80106053 <vector143>:
80106053:	6a 00                	push   $0x0
80106055:	68 8f 00 00 00       	push   $0x8f
8010605a:	e9 4d f5 ff ff       	jmp    801055ac <alltraps>

8010605f <vector144>:
8010605f:	6a 00                	push   $0x0
80106061:	68 90 00 00 00       	push   $0x90
80106066:	e9 41 f5 ff ff       	jmp    801055ac <alltraps>

8010606b <vector145>:
8010606b:	6a 00                	push   $0x0
8010606d:	68 91 00 00 00       	push   $0x91
80106072:	e9 35 f5 ff ff       	jmp    801055ac <alltraps>

80106077 <vector146>:
80106077:	6a 00                	push   $0x0
80106079:	68 92 00 00 00       	push   $0x92
8010607e:	e9 29 f5 ff ff       	jmp    801055ac <alltraps>

80106083 <vector147>:
80106083:	6a 00                	push   $0x0
80106085:	68 93 00 00 00       	push   $0x93
8010608a:	e9 1d f5 ff ff       	jmp    801055ac <alltraps>

8010608f <vector148>:
8010608f:	6a 00                	push   $0x0
80106091:	68 94 00 00 00       	push   $0x94
80106096:	e9 11 f5 ff ff       	jmp    801055ac <alltraps>

8010609b <vector149>:
8010609b:	6a 00                	push   $0x0
8010609d:	68 95 00 00 00       	push   $0x95
801060a2:	e9 05 f5 ff ff       	jmp    801055ac <alltraps>

801060a7 <vector150>:
801060a7:	6a 00                	push   $0x0
801060a9:	68 96 00 00 00       	push   $0x96
801060ae:	e9 f9 f4 ff ff       	jmp    801055ac <alltraps>

801060b3 <vector151>:
801060b3:	6a 00                	push   $0x0
801060b5:	68 97 00 00 00       	push   $0x97
801060ba:	e9 ed f4 ff ff       	jmp    801055ac <alltraps>

801060bf <vector152>:
801060bf:	6a 00                	push   $0x0
801060c1:	68 98 00 00 00       	push   $0x98
801060c6:	e9 e1 f4 ff ff       	jmp    801055ac <alltraps>

801060cb <vector153>:
801060cb:	6a 00                	push   $0x0
801060cd:	68 99 00 00 00       	push   $0x99
801060d2:	e9 d5 f4 ff ff       	jmp    801055ac <alltraps>

801060d7 <vector154>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 9a 00 00 00       	push   $0x9a
801060de:	e9 c9 f4 ff ff       	jmp    801055ac <alltraps>

801060e3 <vector155>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 9b 00 00 00       	push   $0x9b
801060ea:	e9 bd f4 ff ff       	jmp    801055ac <alltraps>

801060ef <vector156>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 9c 00 00 00       	push   $0x9c
801060f6:	e9 b1 f4 ff ff       	jmp    801055ac <alltraps>

801060fb <vector157>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 9d 00 00 00       	push   $0x9d
80106102:	e9 a5 f4 ff ff       	jmp    801055ac <alltraps>

80106107 <vector158>:
80106107:	6a 00                	push   $0x0
80106109:	68 9e 00 00 00       	push   $0x9e
8010610e:	e9 99 f4 ff ff       	jmp    801055ac <alltraps>

80106113 <vector159>:
80106113:	6a 00                	push   $0x0
80106115:	68 9f 00 00 00       	push   $0x9f
8010611a:	e9 8d f4 ff ff       	jmp    801055ac <alltraps>

8010611f <vector160>:
8010611f:	6a 00                	push   $0x0
80106121:	68 a0 00 00 00       	push   $0xa0
80106126:	e9 81 f4 ff ff       	jmp    801055ac <alltraps>

8010612b <vector161>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 a1 00 00 00       	push   $0xa1
80106132:	e9 75 f4 ff ff       	jmp    801055ac <alltraps>

80106137 <vector162>:
80106137:	6a 00                	push   $0x0
80106139:	68 a2 00 00 00       	push   $0xa2
8010613e:	e9 69 f4 ff ff       	jmp    801055ac <alltraps>

80106143 <vector163>:
80106143:	6a 00                	push   $0x0
80106145:	68 a3 00 00 00       	push   $0xa3
8010614a:	e9 5d f4 ff ff       	jmp    801055ac <alltraps>

8010614f <vector164>:
8010614f:	6a 00                	push   $0x0
80106151:	68 a4 00 00 00       	push   $0xa4
80106156:	e9 51 f4 ff ff       	jmp    801055ac <alltraps>

8010615b <vector165>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 a5 00 00 00       	push   $0xa5
80106162:	e9 45 f4 ff ff       	jmp    801055ac <alltraps>

80106167 <vector166>:
80106167:	6a 00                	push   $0x0
80106169:	68 a6 00 00 00       	push   $0xa6
8010616e:	e9 39 f4 ff ff       	jmp    801055ac <alltraps>

80106173 <vector167>:
80106173:	6a 00                	push   $0x0
80106175:	68 a7 00 00 00       	push   $0xa7
8010617a:	e9 2d f4 ff ff       	jmp    801055ac <alltraps>

8010617f <vector168>:
8010617f:	6a 00                	push   $0x0
80106181:	68 a8 00 00 00       	push   $0xa8
80106186:	e9 21 f4 ff ff       	jmp    801055ac <alltraps>

8010618b <vector169>:
8010618b:	6a 00                	push   $0x0
8010618d:	68 a9 00 00 00       	push   $0xa9
80106192:	e9 15 f4 ff ff       	jmp    801055ac <alltraps>

80106197 <vector170>:
80106197:	6a 00                	push   $0x0
80106199:	68 aa 00 00 00       	push   $0xaa
8010619e:	e9 09 f4 ff ff       	jmp    801055ac <alltraps>

801061a3 <vector171>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 ab 00 00 00       	push   $0xab
801061aa:	e9 fd f3 ff ff       	jmp    801055ac <alltraps>

801061af <vector172>:
801061af:	6a 00                	push   $0x0
801061b1:	68 ac 00 00 00       	push   $0xac
801061b6:	e9 f1 f3 ff ff       	jmp    801055ac <alltraps>

801061bb <vector173>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 ad 00 00 00       	push   $0xad
801061c2:	e9 e5 f3 ff ff       	jmp    801055ac <alltraps>

801061c7 <vector174>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 ae 00 00 00       	push   $0xae
801061ce:	e9 d9 f3 ff ff       	jmp    801055ac <alltraps>

801061d3 <vector175>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 af 00 00 00       	push   $0xaf
801061da:	e9 cd f3 ff ff       	jmp    801055ac <alltraps>

801061df <vector176>:
801061df:	6a 00                	push   $0x0
801061e1:	68 b0 00 00 00       	push   $0xb0
801061e6:	e9 c1 f3 ff ff       	jmp    801055ac <alltraps>

801061eb <vector177>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 b1 00 00 00       	push   $0xb1
801061f2:	e9 b5 f3 ff ff       	jmp    801055ac <alltraps>

801061f7 <vector178>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 b2 00 00 00       	push   $0xb2
801061fe:	e9 a9 f3 ff ff       	jmp    801055ac <alltraps>

80106203 <vector179>:
80106203:	6a 00                	push   $0x0
80106205:	68 b3 00 00 00       	push   $0xb3
8010620a:	e9 9d f3 ff ff       	jmp    801055ac <alltraps>

8010620f <vector180>:
8010620f:	6a 00                	push   $0x0
80106211:	68 b4 00 00 00       	push   $0xb4
80106216:	e9 91 f3 ff ff       	jmp    801055ac <alltraps>

8010621b <vector181>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 b5 00 00 00       	push   $0xb5
80106222:	e9 85 f3 ff ff       	jmp    801055ac <alltraps>

80106227 <vector182>:
80106227:	6a 00                	push   $0x0
80106229:	68 b6 00 00 00       	push   $0xb6
8010622e:	e9 79 f3 ff ff       	jmp    801055ac <alltraps>

80106233 <vector183>:
80106233:	6a 00                	push   $0x0
80106235:	68 b7 00 00 00       	push   $0xb7
8010623a:	e9 6d f3 ff ff       	jmp    801055ac <alltraps>

8010623f <vector184>:
8010623f:	6a 00                	push   $0x0
80106241:	68 b8 00 00 00       	push   $0xb8
80106246:	e9 61 f3 ff ff       	jmp    801055ac <alltraps>

8010624b <vector185>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 b9 00 00 00       	push   $0xb9
80106252:	e9 55 f3 ff ff       	jmp    801055ac <alltraps>

80106257 <vector186>:
80106257:	6a 00                	push   $0x0
80106259:	68 ba 00 00 00       	push   $0xba
8010625e:	e9 49 f3 ff ff       	jmp    801055ac <alltraps>

80106263 <vector187>:
80106263:	6a 00                	push   $0x0
80106265:	68 bb 00 00 00       	push   $0xbb
8010626a:	e9 3d f3 ff ff       	jmp    801055ac <alltraps>

8010626f <vector188>:
8010626f:	6a 00                	push   $0x0
80106271:	68 bc 00 00 00       	push   $0xbc
80106276:	e9 31 f3 ff ff       	jmp    801055ac <alltraps>

8010627b <vector189>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 bd 00 00 00       	push   $0xbd
80106282:	e9 25 f3 ff ff       	jmp    801055ac <alltraps>

80106287 <vector190>:
80106287:	6a 00                	push   $0x0
80106289:	68 be 00 00 00       	push   $0xbe
8010628e:	e9 19 f3 ff ff       	jmp    801055ac <alltraps>

80106293 <vector191>:
80106293:	6a 00                	push   $0x0
80106295:	68 bf 00 00 00       	push   $0xbf
8010629a:	e9 0d f3 ff ff       	jmp    801055ac <alltraps>

8010629f <vector192>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 c0 00 00 00       	push   $0xc0
801062a6:	e9 01 f3 ff ff       	jmp    801055ac <alltraps>

801062ab <vector193>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 c1 00 00 00       	push   $0xc1
801062b2:	e9 f5 f2 ff ff       	jmp    801055ac <alltraps>

801062b7 <vector194>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 c2 00 00 00       	push   $0xc2
801062be:	e9 e9 f2 ff ff       	jmp    801055ac <alltraps>

801062c3 <vector195>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 c3 00 00 00       	push   $0xc3
801062ca:	e9 dd f2 ff ff       	jmp    801055ac <alltraps>

801062cf <vector196>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 c4 00 00 00       	push   $0xc4
801062d6:	e9 d1 f2 ff ff       	jmp    801055ac <alltraps>

801062db <vector197>:
801062db:	6a 00                	push   $0x0
801062dd:	68 c5 00 00 00       	push   $0xc5
801062e2:	e9 c5 f2 ff ff       	jmp    801055ac <alltraps>

801062e7 <vector198>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 c6 00 00 00       	push   $0xc6
801062ee:	e9 b9 f2 ff ff       	jmp    801055ac <alltraps>

801062f3 <vector199>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 c7 00 00 00       	push   $0xc7
801062fa:	e9 ad f2 ff ff       	jmp    801055ac <alltraps>

801062ff <vector200>:
801062ff:	6a 00                	push   $0x0
80106301:	68 c8 00 00 00       	push   $0xc8
80106306:	e9 a1 f2 ff ff       	jmp    801055ac <alltraps>

8010630b <vector201>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 c9 00 00 00       	push   $0xc9
80106312:	e9 95 f2 ff ff       	jmp    801055ac <alltraps>

80106317 <vector202>:
80106317:	6a 00                	push   $0x0
80106319:	68 ca 00 00 00       	push   $0xca
8010631e:	e9 89 f2 ff ff       	jmp    801055ac <alltraps>

80106323 <vector203>:
80106323:	6a 00                	push   $0x0
80106325:	68 cb 00 00 00       	push   $0xcb
8010632a:	e9 7d f2 ff ff       	jmp    801055ac <alltraps>

8010632f <vector204>:
8010632f:	6a 00                	push   $0x0
80106331:	68 cc 00 00 00       	push   $0xcc
80106336:	e9 71 f2 ff ff       	jmp    801055ac <alltraps>

8010633b <vector205>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 cd 00 00 00       	push   $0xcd
80106342:	e9 65 f2 ff ff       	jmp    801055ac <alltraps>

80106347 <vector206>:
80106347:	6a 00                	push   $0x0
80106349:	68 ce 00 00 00       	push   $0xce
8010634e:	e9 59 f2 ff ff       	jmp    801055ac <alltraps>

80106353 <vector207>:
80106353:	6a 00                	push   $0x0
80106355:	68 cf 00 00 00       	push   $0xcf
8010635a:	e9 4d f2 ff ff       	jmp    801055ac <alltraps>

8010635f <vector208>:
8010635f:	6a 00                	push   $0x0
80106361:	68 d0 00 00 00       	push   $0xd0
80106366:	e9 41 f2 ff ff       	jmp    801055ac <alltraps>

8010636b <vector209>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 d1 00 00 00       	push   $0xd1
80106372:	e9 35 f2 ff ff       	jmp    801055ac <alltraps>

80106377 <vector210>:
80106377:	6a 00                	push   $0x0
80106379:	68 d2 00 00 00       	push   $0xd2
8010637e:	e9 29 f2 ff ff       	jmp    801055ac <alltraps>

80106383 <vector211>:
80106383:	6a 00                	push   $0x0
80106385:	68 d3 00 00 00       	push   $0xd3
8010638a:	e9 1d f2 ff ff       	jmp    801055ac <alltraps>

8010638f <vector212>:
8010638f:	6a 00                	push   $0x0
80106391:	68 d4 00 00 00       	push   $0xd4
80106396:	e9 11 f2 ff ff       	jmp    801055ac <alltraps>

8010639b <vector213>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 d5 00 00 00       	push   $0xd5
801063a2:	e9 05 f2 ff ff       	jmp    801055ac <alltraps>

801063a7 <vector214>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 d6 00 00 00       	push   $0xd6
801063ae:	e9 f9 f1 ff ff       	jmp    801055ac <alltraps>

801063b3 <vector215>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 d7 00 00 00       	push   $0xd7
801063ba:	e9 ed f1 ff ff       	jmp    801055ac <alltraps>

801063bf <vector216>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 d8 00 00 00       	push   $0xd8
801063c6:	e9 e1 f1 ff ff       	jmp    801055ac <alltraps>

801063cb <vector217>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 d9 00 00 00       	push   $0xd9
801063d2:	e9 d5 f1 ff ff       	jmp    801055ac <alltraps>

801063d7 <vector218>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 da 00 00 00       	push   $0xda
801063de:	e9 c9 f1 ff ff       	jmp    801055ac <alltraps>

801063e3 <vector219>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 db 00 00 00       	push   $0xdb
801063ea:	e9 bd f1 ff ff       	jmp    801055ac <alltraps>

801063ef <vector220>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 dc 00 00 00       	push   $0xdc
801063f6:	e9 b1 f1 ff ff       	jmp    801055ac <alltraps>

801063fb <vector221>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 dd 00 00 00       	push   $0xdd
80106402:	e9 a5 f1 ff ff       	jmp    801055ac <alltraps>

80106407 <vector222>:
80106407:	6a 00                	push   $0x0
80106409:	68 de 00 00 00       	push   $0xde
8010640e:	e9 99 f1 ff ff       	jmp    801055ac <alltraps>

80106413 <vector223>:
80106413:	6a 00                	push   $0x0
80106415:	68 df 00 00 00       	push   $0xdf
8010641a:	e9 8d f1 ff ff       	jmp    801055ac <alltraps>

8010641f <vector224>:
8010641f:	6a 00                	push   $0x0
80106421:	68 e0 00 00 00       	push   $0xe0
80106426:	e9 81 f1 ff ff       	jmp    801055ac <alltraps>

8010642b <vector225>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 e1 00 00 00       	push   $0xe1
80106432:	e9 75 f1 ff ff       	jmp    801055ac <alltraps>

80106437 <vector226>:
80106437:	6a 00                	push   $0x0
80106439:	68 e2 00 00 00       	push   $0xe2
8010643e:	e9 69 f1 ff ff       	jmp    801055ac <alltraps>

80106443 <vector227>:
80106443:	6a 00                	push   $0x0
80106445:	68 e3 00 00 00       	push   $0xe3
8010644a:	e9 5d f1 ff ff       	jmp    801055ac <alltraps>

8010644f <vector228>:
8010644f:	6a 00                	push   $0x0
80106451:	68 e4 00 00 00       	push   $0xe4
80106456:	e9 51 f1 ff ff       	jmp    801055ac <alltraps>

8010645b <vector229>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 e5 00 00 00       	push   $0xe5
80106462:	e9 45 f1 ff ff       	jmp    801055ac <alltraps>

80106467 <vector230>:
80106467:	6a 00                	push   $0x0
80106469:	68 e6 00 00 00       	push   $0xe6
8010646e:	e9 39 f1 ff ff       	jmp    801055ac <alltraps>

80106473 <vector231>:
80106473:	6a 00                	push   $0x0
80106475:	68 e7 00 00 00       	push   $0xe7
8010647a:	e9 2d f1 ff ff       	jmp    801055ac <alltraps>

8010647f <vector232>:
8010647f:	6a 00                	push   $0x0
80106481:	68 e8 00 00 00       	push   $0xe8
80106486:	e9 21 f1 ff ff       	jmp    801055ac <alltraps>

8010648b <vector233>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 e9 00 00 00       	push   $0xe9
80106492:	e9 15 f1 ff ff       	jmp    801055ac <alltraps>

80106497 <vector234>:
80106497:	6a 00                	push   $0x0
80106499:	68 ea 00 00 00       	push   $0xea
8010649e:	e9 09 f1 ff ff       	jmp    801055ac <alltraps>

801064a3 <vector235>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 eb 00 00 00       	push   $0xeb
801064aa:	e9 fd f0 ff ff       	jmp    801055ac <alltraps>

801064af <vector236>:
801064af:	6a 00                	push   $0x0
801064b1:	68 ec 00 00 00       	push   $0xec
801064b6:	e9 f1 f0 ff ff       	jmp    801055ac <alltraps>

801064bb <vector237>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 ed 00 00 00       	push   $0xed
801064c2:	e9 e5 f0 ff ff       	jmp    801055ac <alltraps>

801064c7 <vector238>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 ee 00 00 00       	push   $0xee
801064ce:	e9 d9 f0 ff ff       	jmp    801055ac <alltraps>

801064d3 <vector239>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 ef 00 00 00       	push   $0xef
801064da:	e9 cd f0 ff ff       	jmp    801055ac <alltraps>

801064df <vector240>:
801064df:	6a 00                	push   $0x0
801064e1:	68 f0 00 00 00       	push   $0xf0
801064e6:	e9 c1 f0 ff ff       	jmp    801055ac <alltraps>

801064eb <vector241>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 f1 00 00 00       	push   $0xf1
801064f2:	e9 b5 f0 ff ff       	jmp    801055ac <alltraps>

801064f7 <vector242>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 f2 00 00 00       	push   $0xf2
801064fe:	e9 a9 f0 ff ff       	jmp    801055ac <alltraps>

80106503 <vector243>:
80106503:	6a 00                	push   $0x0
80106505:	68 f3 00 00 00       	push   $0xf3
8010650a:	e9 9d f0 ff ff       	jmp    801055ac <alltraps>

8010650f <vector244>:
8010650f:	6a 00                	push   $0x0
80106511:	68 f4 00 00 00       	push   $0xf4
80106516:	e9 91 f0 ff ff       	jmp    801055ac <alltraps>

8010651b <vector245>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 f5 00 00 00       	push   $0xf5
80106522:	e9 85 f0 ff ff       	jmp    801055ac <alltraps>

80106527 <vector246>:
80106527:	6a 00                	push   $0x0
80106529:	68 f6 00 00 00       	push   $0xf6
8010652e:	e9 79 f0 ff ff       	jmp    801055ac <alltraps>

80106533 <vector247>:
80106533:	6a 00                	push   $0x0
80106535:	68 f7 00 00 00       	push   $0xf7
8010653a:	e9 6d f0 ff ff       	jmp    801055ac <alltraps>

8010653f <vector248>:
8010653f:	6a 00                	push   $0x0
80106541:	68 f8 00 00 00       	push   $0xf8
80106546:	e9 61 f0 ff ff       	jmp    801055ac <alltraps>

8010654b <vector249>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 f9 00 00 00       	push   $0xf9
80106552:	e9 55 f0 ff ff       	jmp    801055ac <alltraps>

80106557 <vector250>:
80106557:	6a 00                	push   $0x0
80106559:	68 fa 00 00 00       	push   $0xfa
8010655e:	e9 49 f0 ff ff       	jmp    801055ac <alltraps>

80106563 <vector251>:
80106563:	6a 00                	push   $0x0
80106565:	68 fb 00 00 00       	push   $0xfb
8010656a:	e9 3d f0 ff ff       	jmp    801055ac <alltraps>

8010656f <vector252>:
8010656f:	6a 00                	push   $0x0
80106571:	68 fc 00 00 00       	push   $0xfc
80106576:	e9 31 f0 ff ff       	jmp    801055ac <alltraps>

8010657b <vector253>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 fd 00 00 00       	push   $0xfd
80106582:	e9 25 f0 ff ff       	jmp    801055ac <alltraps>

80106587 <vector254>:
80106587:	6a 00                	push   $0x0
80106589:	68 fe 00 00 00       	push   $0xfe
8010658e:	e9 19 f0 ff ff       	jmp    801055ac <alltraps>

80106593 <vector255>:
80106593:	6a 00                	push   $0x0
80106595:	68 ff 00 00 00       	push   $0xff
8010659a:	e9 0d f0 ff ff       	jmp    801055ac <alltraps>
8010659f:	90                   	nop

801065a0 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801065a0:	a1 c4 57 11 80       	mov    0x801157c4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
801065a5:	55                   	push   %ebp
801065a6:	89 e5                	mov    %esp,%ebp
801065a8:	2d 00 00 00 80       	sub    $0x80000000,%eax
801065ad:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
801065b0:	5d                   	pop    %ebp
801065b1:	c3                   	ret    
801065b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801065b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801065c0 <walkpgdir>:
{
801065c0:	55                   	push   %ebp
801065c1:	89 e5                	mov    %esp,%ebp
801065c3:	83 ec 28             	sub    $0x28,%esp
801065c6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  pde = &pgdir[PDX(va)];
801065c9:	89 d3                	mov    %edx,%ebx
801065cb:	c1 eb 16             	shr    $0x16,%ebx
801065ce:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
{
801065d1:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(*pde & PTE_P){
801065d4:	8b 33                	mov    (%ebx),%esi
801065d6:	f7 c6 01 00 00 00    	test   $0x1,%esi
801065dc:	74 22                	je     80106600 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801065de:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
801065e4:	81 ee 00 00 00 80    	sub    $0x80000000,%esi
  return &pgtab[PTX(va)];
801065ea:	c1 ea 0a             	shr    $0xa,%edx
801065ed:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801065f3:	8d 04 16             	lea    (%esi,%edx,1),%eax
}
801065f6:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801065f9:	8b 75 fc             	mov    -0x4(%ebp),%esi
801065fc:	89 ec                	mov    %ebp,%esp
801065fe:	5d                   	pop    %ebp
801065ff:	c3                   	ret    
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106600:	85 c9                	test   %ecx,%ecx
80106602:	75 04                	jne    80106608 <walkpgdir+0x48>
  return &pgtab[PTX(va)];
80106604:	31 c0                	xor    %eax,%eax
80106606:	eb ee                	jmp    801065f6 <walkpgdir+0x36>
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106608:	89 55 f4             	mov    %edx,-0xc(%ebp)
8010660b:	90                   	nop
8010660c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106610:	e8 1b bd ff ff       	call   80102330 <kalloc>
80106615:	85 c0                	test   %eax,%eax
80106617:	89 c6                	mov    %eax,%esi
80106619:	74 e9                	je     80106604 <walkpgdir+0x44>
    memset(pgtab, 0, PGSIZE);
8010661b:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106622:	00 
80106623:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010662a:	00 
8010662b:	89 04 24             	mov    %eax,(%esp)
8010662e:	e8 7d dd ff ff       	call   801043b0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106633:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106639:	83 c8 07             	or     $0x7,%eax
8010663c:	89 03                	mov    %eax,(%ebx)
8010663e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80106641:	eb a7                	jmp    801065ea <walkpgdir+0x2a>
80106643:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106650 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106650:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106651:	31 c9                	xor    %ecx,%ecx
{
80106653:	89 e5                	mov    %esp,%ebp
80106655:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106658:	8b 55 0c             	mov    0xc(%ebp),%edx
8010665b:	8b 45 08             	mov    0x8(%ebp),%eax
8010665e:	e8 5d ff ff ff       	call   801065c0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106663:	8b 00                	mov    (%eax),%eax
80106665:	a8 01                	test   $0x1,%al
80106667:	75 07                	jne    80106670 <uva2ka+0x20>
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106669:	31 c0                	xor    %eax,%eax
}
8010666b:	c9                   	leave  
8010666c:	c3                   	ret    
8010666d:	8d 76 00             	lea    0x0(%esi),%esi
  if((*pte & PTE_U) == 0)
80106670:	a8 04                	test   $0x4,%al
80106672:	74 f5                	je     80106669 <uva2ka+0x19>
  return (char*)P2V(PTE_ADDR(*pte));
80106674:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106679:	2d 00 00 00 80       	sub    $0x80000000,%eax
}
8010667e:	c9                   	leave  
8010667f:	90                   	nop
80106680:	c3                   	ret    
80106681:	eb 0d                	jmp    80106690 <copyout>
80106683:	90                   	nop
80106684:	90                   	nop
80106685:	90                   	nop
80106686:	90                   	nop
80106687:	90                   	nop
80106688:	90                   	nop
80106689:	90                   	nop
8010668a:	90                   	nop
8010668b:	90                   	nop
8010668c:	90                   	nop
8010668d:	90                   	nop
8010668e:	90                   	nop
8010668f:	90                   	nop

80106690 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106690:	55                   	push   %ebp
80106691:	89 e5                	mov    %esp,%ebp
80106693:	57                   	push   %edi
80106694:	56                   	push   %esi
80106695:	53                   	push   %ebx
80106696:	83 ec 2c             	sub    $0x2c,%esp
80106699:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010669c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
8010669f:	85 db                	test   %ebx,%ebx
801066a1:	74 75                	je     80106718 <copyout+0x88>
  buf = (char*)p;
801066a3:	8b 45 10             	mov    0x10(%ebp),%eax
801066a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801066a9:	eb 39                	jmp    801066e4 <copyout+0x54>
801066ab:	90                   	nop
801066ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
801066b0:	89 f7                	mov    %esi,%edi
801066b2:	29 d7                	sub    %edx,%edi
801066b4:	81 c7 00 10 00 00    	add    $0x1000,%edi
801066ba:	39 df                	cmp    %ebx,%edi
801066bc:	0f 47 fb             	cmova  %ebx,%edi
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801066bf:	29 f2                	sub    %esi,%edx
801066c1:	89 7c 24 08          	mov    %edi,0x8(%esp)
801066c5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801066c8:	8d 14 10             	lea    (%eax,%edx,1),%edx
801066cb:	89 14 24             	mov    %edx,(%esp)
801066ce:	89 4c 24 04          	mov    %ecx,0x4(%esp)
801066d2:	e8 99 dd ff ff       	call   80104470 <memmove>
  while(len > 0){
801066d7:	29 fb                	sub    %edi,%ebx
801066d9:	74 3d                	je     80106718 <copyout+0x88>
    len -= n;
    buf += n;
801066db:	01 7d e4             	add    %edi,-0x1c(%ebp)
    va = va0 + PGSIZE;
801066de:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    va0 = (uint)PGROUNDDOWN(va);
801066e4:	89 d6                	mov    %edx,%esi
801066e6:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801066ec:	89 74 24 04          	mov    %esi,0x4(%esp)
801066f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
801066f3:	89 0c 24             	mov    %ecx,(%esp)
801066f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
801066f9:	e8 52 ff ff ff       	call   80106650 <uva2ka>
    if(pa0 == 0)
801066fe:	8b 55 e0             	mov    -0x20(%ebp),%edx
80106701:	85 c0                	test   %eax,%eax
80106703:	75 ab                	jne    801066b0 <copyout+0x20>
  }
  return 0;
}
80106705:	83 c4 2c             	add    $0x2c,%esp
    va = va0 + PGSIZE;
80106708:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010670d:	5b                   	pop    %ebx
8010670e:	5e                   	pop    %esi
8010670f:	5f                   	pop    %edi
80106710:	5d                   	pop    %ebp
80106711:	c3                   	ret    
80106712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106718:	83 c4 2c             	add    $0x2c,%esp
    va = va0 + PGSIZE;
8010671b:	31 c0                	xor    %eax,%eax
}
8010671d:	5b                   	pop    %ebx
8010671e:	5e                   	pop    %esi
8010671f:	5f                   	pop    %edi
80106720:	5d                   	pop    %ebp
80106721:	c3                   	ret    
80106722:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106730 <clearpteu>:
{
80106730:	55                   	push   %ebp
  pte = walkpgdir(pgdir, uva, 0);
80106731:	31 c9                	xor    %ecx,%ecx
{
80106733:	89 e5                	mov    %esp,%ebp
80106735:	83 ec 18             	sub    $0x18,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106738:	8b 55 0c             	mov    0xc(%ebp),%edx
8010673b:	8b 45 08             	mov    0x8(%ebp),%eax
8010673e:	e8 7d fe ff ff       	call   801065c0 <walkpgdir>
  if(pte == 0)
80106743:	85 c0                	test   %eax,%eax
80106745:	74 05                	je     8010674c <clearpteu+0x1c>
  *pte &= ~PTE_U;
80106747:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010674a:	c9                   	leave  
8010674b:	c3                   	ret    
    panic("clearpteu");
8010674c:	c7 04 24 e0 77 10 80 	movl   $0x801077e0,(%esp)
80106753:	e8 58 9c ff ff       	call   801003b0 <panic>
80106758:	90                   	nop
80106759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106760 <mappages>:
{
80106760:	55                   	push   %ebp
80106761:	89 e5                	mov    %esp,%ebp
80106763:	57                   	push   %edi
80106764:	56                   	push   %esi
80106765:	53                   	push   %ebx
80106766:	83 ec 1c             	sub    $0x1c,%esp
80106769:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010676c:	8b 75 14             	mov    0x14(%ebp),%esi
    *pte = pa | perm | PTE_P;
8010676f:	83 4d 18 01          	orl    $0x1,0x18(%ebp)
  a = (char*)PGROUNDDOWN((uint)va);
80106773:	89 fb                	mov    %edi,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106775:	03 7d 10             	add    0x10(%ebp),%edi
  a = (char*)PGROUNDDOWN((uint)va);
80106778:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
8010677e:	83 ef 01             	sub    $0x1,%edi
80106781:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106787:	eb 23                	jmp    801067ac <mappages+0x4c>
80106789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(*pte & PTE_P)
80106790:	f6 00 01             	testb  $0x1,(%eax)
80106793:	75 45                	jne    801067da <mappages+0x7a>
    *pte = pa | perm | PTE_P;
80106795:	8b 55 18             	mov    0x18(%ebp),%edx
80106798:	09 f2                	or     %esi,%edx
    if(a == last)
8010679a:	39 fb                	cmp    %edi,%ebx
    *pte = pa | perm | PTE_P;
8010679c:	89 10                	mov    %edx,(%eax)
    if(a == last)
8010679e:	74 30                	je     801067d0 <mappages+0x70>
    a += PGSIZE;
801067a0:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    pa += PGSIZE;
801067a6:	81 c6 00 10 00 00    	add    $0x1000,%esi
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801067ac:	8b 45 08             	mov    0x8(%ebp),%eax
801067af:	b9 01 00 00 00       	mov    $0x1,%ecx
801067b4:	89 da                	mov    %ebx,%edx
801067b6:	e8 05 fe ff ff       	call   801065c0 <walkpgdir>
801067bb:	85 c0                	test   %eax,%eax
801067bd:	75 d1                	jne    80106790 <mappages+0x30>
}
801067bf:	83 c4 1c             	add    $0x1c,%esp
  }
801067c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801067c7:	5b                   	pop    %ebx
801067c8:	5e                   	pop    %esi
801067c9:	5f                   	pop    %edi
801067ca:	5d                   	pop    %ebp
801067cb:	c3                   	ret    
801067cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801067d0:	83 c4 1c             	add    $0x1c,%esp
    if(a == last)
801067d3:	31 c0                	xor    %eax,%eax
}
801067d5:	5b                   	pop    %ebx
801067d6:	5e                   	pop    %esi
801067d7:	5f                   	pop    %edi
801067d8:	5d                   	pop    %ebp
801067d9:	c3                   	ret    
      panic("remap");
801067da:	c7 04 24 ea 77 10 80 	movl   $0x801077ea,(%esp)
801067e1:	e8 ca 9b ff ff       	call   801003b0 <panic>
801067e6:	8d 76 00             	lea    0x0(%esi),%esi
801067e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801067f0 <inituvm>:
{
801067f0:	55                   	push   %ebp
801067f1:	89 e5                	mov    %esp,%ebp
801067f3:	83 ec 48             	sub    $0x48,%esp
801067f6:	89 75 f8             	mov    %esi,-0x8(%ebp)
801067f9:	8b 75 10             	mov    0x10(%ebp),%esi
801067fc:	89 7d fc             	mov    %edi,-0x4(%ebp)
801067ff:	8b 55 08             	mov    0x8(%ebp),%edx
80106802:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80106805:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106808:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
8010680e:	77 69                	ja     80106879 <inituvm+0x89>
  mem = kalloc();
80106810:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106813:	e8 18 bb ff ff       	call   80102330 <kalloc>
  memset(mem, 0, PGSIZE);
80106818:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010681f:	00 
80106820:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106827:	00 
  mem = kalloc();
80106828:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
8010682a:	89 04 24             	mov    %eax,(%esp)
8010682d:	e8 7e db ff ff       	call   801043b0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106832:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106838:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
8010683f:	00 
80106840:	89 44 24 0c          	mov    %eax,0xc(%esp)
80106844:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010684b:	00 
8010684c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106853:	00 
80106854:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106857:	89 14 24             	mov    %edx,(%esp)
8010685a:	e8 01 ff ff ff       	call   80106760 <mappages>
  memmove(mem, init, sz);
8010685f:	89 75 10             	mov    %esi,0x10(%ebp)
}
80106862:	8b 75 f8             	mov    -0x8(%ebp),%esi
  memmove(mem, init, sz);
80106865:	89 7d 0c             	mov    %edi,0xc(%ebp)
}
80106868:	8b 7d fc             	mov    -0x4(%ebp),%edi
  memmove(mem, init, sz);
8010686b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010686e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80106871:	89 ec                	mov    %ebp,%esp
80106873:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106874:	e9 f7 db ff ff       	jmp    80104470 <memmove>
    panic("inituvm: more than a page");
80106879:	c7 04 24 f0 77 10 80 	movl   $0x801077f0,(%esp)
80106880:	e8 2b 9b ff ff       	call   801003b0 <panic>
80106885:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106890 <deallocuvm>:
{
80106890:	55                   	push   %ebp
80106891:	89 e5                	mov    %esp,%ebp
80106893:	57                   	push   %edi
80106894:	56                   	push   %esi
80106895:	53                   	push   %ebx
80106896:	83 ec 2c             	sub    $0x2c,%esp
80106899:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(newsz >= oldsz)
8010689c:	39 75 10             	cmp    %esi,0x10(%ebp)
{
8010689f:	8b 7d 08             	mov    0x8(%ebp),%edi
    return oldsz;
801068a2:	89 f0                	mov    %esi,%eax
  if(newsz >= oldsz)
801068a4:	73 7d                	jae    80106923 <deallocuvm+0x93>
  a = PGROUNDUP(newsz);
801068a6:	8b 5d 10             	mov    0x10(%ebp),%ebx
801068a9:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
801068af:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
801068b5:	39 de                	cmp    %ebx,%esi
801068b7:	77 3d                	ja     801068f6 <deallocuvm+0x66>
801068b9:	eb 65                	jmp    80106920 <deallocuvm+0x90>
801068bb:	90                   	nop
801068bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    else if((*pte & PTE_P) != 0){
801068c0:	8b 10                	mov    (%eax),%edx
801068c2:	f6 c2 01             	test   $0x1,%dl
801068c5:	74 25                	je     801068ec <deallocuvm+0x5c>
      if(pa == 0)
801068c7:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801068cd:	8d 76 00             	lea    0x0(%esi),%esi
801068d0:	74 59                	je     8010692b <deallocuvm+0x9b>
      kfree(v);
801068d2:	81 ea 00 00 00 80    	sub    $0x80000000,%edx
801068d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801068db:	89 14 24             	mov    %edx,(%esp)
801068de:	e8 9d ba ff ff       	call   80102380 <kfree>
      *pte = 0;
801068e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801068e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
801068ec:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801068f2:	39 de                	cmp    %ebx,%esi
801068f4:	76 2a                	jbe    80106920 <deallocuvm+0x90>
    pte = walkpgdir(pgdir, (char*)a, 0);
801068f6:	31 c9                	xor    %ecx,%ecx
801068f8:	89 da                	mov    %ebx,%edx
801068fa:	89 f8                	mov    %edi,%eax
801068fc:	e8 bf fc ff ff       	call   801065c0 <walkpgdir>
    if(!pte)
80106901:	85 c0                	test   %eax,%eax
80106903:	75 bb                	jne    801068c0 <deallocuvm+0x30>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106905:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
8010690b:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106911:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106917:	39 de                	cmp    %ebx,%esi
80106919:	77 db                	ja     801068f6 <deallocuvm+0x66>
8010691b:	90                   	nop
8010691c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return newsz;
80106920:	8b 45 10             	mov    0x10(%ebp),%eax
}
80106923:	83 c4 2c             	add    $0x2c,%esp
80106926:	5b                   	pop    %ebx
80106927:	5e                   	pop    %esi
80106928:	5f                   	pop    %edi
80106929:	5d                   	pop    %ebp
8010692a:	c3                   	ret    
        panic("kfree");
8010692b:	c7 04 24 a6 71 10 80 	movl   $0x801071a6,(%esp)
80106932:	e8 79 9a ff ff       	call   801003b0 <panic>
80106937:	89 f6                	mov    %esi,%esi
80106939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106940 <freevm>:
{
80106940:	55                   	push   %ebp
80106941:	89 e5                	mov    %esp,%ebp
80106943:	56                   	push   %esi
80106944:	53                   	push   %ebx
80106945:	83 ec 10             	sub    $0x10,%esp
80106948:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(pgdir == 0)
8010694b:	85 db                	test   %ebx,%ebx
8010694d:	74 5e                	je     801069ad <freevm+0x6d>
  deallocuvm(pgdir, KERNBASE, 0);
8010694f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80106956:	00 
80106957:	31 f6                	xor    %esi,%esi
80106959:	c7 44 24 04 00 00 00 	movl   $0x80000000,0x4(%esp)
80106960:	80 
80106961:	89 1c 24             	mov    %ebx,(%esp)
80106964:	e8 27 ff ff ff       	call   80106890 <deallocuvm>
80106969:	eb 10                	jmp    8010697b <freevm+0x3b>
8010696b:	90                   	nop
8010696c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < NPDENTRIES; i++){
80106970:	83 c6 01             	add    $0x1,%esi
80106973:	81 fe 00 04 00 00    	cmp    $0x400,%esi
80106979:	74 24                	je     8010699f <freevm+0x5f>
    if(pgdir[i] & PTE_P){
8010697b:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
8010697e:	a8 01                	test   $0x1,%al
80106980:	74 ee                	je     80106970 <freevm+0x30>
      kfree(v);
80106982:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  for(i = 0; i < NPDENTRIES; i++){
80106987:	83 c6 01             	add    $0x1,%esi
      kfree(v);
8010698a:	2d 00 00 00 80       	sub    $0x80000000,%eax
8010698f:	89 04 24             	mov    %eax,(%esp)
80106992:	e8 e9 b9 ff ff       	call   80102380 <kfree>
  for(i = 0; i < NPDENTRIES; i++){
80106997:	81 fe 00 04 00 00    	cmp    $0x400,%esi
8010699d:	75 dc                	jne    8010697b <freevm+0x3b>
  kfree((char*)pgdir);
8010699f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801069a2:	83 c4 10             	add    $0x10,%esp
801069a5:	5b                   	pop    %ebx
801069a6:	5e                   	pop    %esi
801069a7:	5d                   	pop    %ebp
  kfree((char*)pgdir);
801069a8:	e9 d3 b9 ff ff       	jmp    80102380 <kfree>
    panic("freevm: no pgdir");
801069ad:	c7 04 24 0a 78 10 80 	movl   $0x8010780a,(%esp)
801069b4:	e8 f7 99 ff ff       	call   801003b0 <panic>
801069b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801069c0 <setupkvm>:
{
801069c0:	55                   	push   %ebp
801069c1:	89 e5                	mov    %esp,%ebp
801069c3:	56                   	push   %esi
801069c4:	53                   	push   %ebx
801069c5:	83 ec 20             	sub    $0x20,%esp
  if((pgdir = (pde_t*)kalloc()) == 0)
801069c8:	e8 63 b9 ff ff       	call   80102330 <kalloc>
801069cd:	85 c0                	test   %eax,%eax
801069cf:	89 c6                	mov    %eax,%esi
801069d1:	74 5d                	je     80106a30 <setupkvm+0x70>
  memset(pgdir, 0, PGSIZE);
801069d3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801069da:	00 
801069db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801069e2:	00 
801069e3:	89 04 24             	mov    %eax,(%esp)
801069e6:	e8 c5 d9 ff ff       	call   801043b0 <memset>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801069eb:	b8 60 a4 10 80       	mov    $0x8010a460,%eax
801069f0:	3d 20 a4 10 80       	cmp    $0x8010a420,%eax
801069f5:	76 39                	jbe    80106a30 <setupkvm+0x70>
setupkvm(void)
801069f7:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
801069fc:	8b 53 04             	mov    0x4(%ebx),%edx
801069ff:	8b 43 0c             	mov    0xc(%ebx),%eax
80106a02:	89 54 24 0c          	mov    %edx,0xc(%esp)
80106a06:	89 44 24 10          	mov    %eax,0x10(%esp)
80106a0a:	8b 43 08             	mov    0x8(%ebx),%eax
80106a0d:	29 d0                	sub    %edx,%eax
80106a0f:	89 44 24 08          	mov    %eax,0x8(%esp)
80106a13:	8b 03                	mov    (%ebx),%eax
80106a15:	89 34 24             	mov    %esi,(%esp)
80106a18:	89 44 24 04          	mov    %eax,0x4(%esp)
80106a1c:	e8 3f fd ff ff       	call   80106760 <mappages>
80106a21:	85 c0                	test   %eax,%eax
80106a23:	78 1b                	js     80106a40 <setupkvm+0x80>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106a25:	83 c3 10             	add    $0x10,%ebx
80106a28:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106a2e:	75 cc                	jne    801069fc <setupkvm+0x3c>
}
80106a30:	83 c4 20             	add    $0x20,%esp
80106a33:	89 f0                	mov    %esi,%eax
80106a35:	5b                   	pop    %ebx
80106a36:	5e                   	pop    %esi
80106a37:	5d                   	pop    %ebp
80106a38:	c3                   	ret    
80106a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80106a40:	89 34 24             	mov    %esi,(%esp)
80106a43:	31 f6                	xor    %esi,%esi
80106a45:	e8 f6 fe ff ff       	call   80106940 <freevm>
}
80106a4a:	83 c4 20             	add    $0x20,%esp
80106a4d:	89 f0                	mov    %esi,%eax
80106a4f:	5b                   	pop    %ebx
80106a50:	5e                   	pop    %esi
80106a51:	5d                   	pop    %ebp
80106a52:	c3                   	ret    
80106a53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a60 <kvmalloc>:
{
80106a60:	55                   	push   %ebp
80106a61:	89 e5                	mov    %esp,%ebp
80106a63:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106a66:	e8 55 ff ff ff       	call   801069c0 <setupkvm>
80106a6b:	a3 c4 57 11 80       	mov    %eax,0x801157c4
80106a70:	2d 00 00 00 80       	sub    $0x80000000,%eax
80106a75:	0f 22 d8             	mov    %eax,%cr3
}
80106a78:	c9                   	leave  
80106a79:	c3                   	ret    
80106a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106a80 <copyuvm>:
{
80106a80:	55                   	push   %ebp
80106a81:	89 e5                	mov    %esp,%ebp
80106a83:	57                   	push   %edi
80106a84:	56                   	push   %esi
80106a85:	53                   	push   %ebx
80106a86:	83 ec 3c             	sub    $0x3c,%esp
  if((d = setupkvm()) == 0)
80106a89:	e8 32 ff ff ff       	call   801069c0 <setupkvm>
80106a8e:	85 c0                	test   %eax,%eax
80106a90:	89 c6                	mov    %eax,%esi
80106a92:	0f 84 98 00 00 00    	je     80106b30 <copyuvm+0xb0>
  for(i = 0; i < sz; i += PGSIZE){
80106a98:	8b 45 0c             	mov    0xc(%ebp),%eax
80106a9b:	85 c0                	test   %eax,%eax
80106a9d:	0f 84 8d 00 00 00    	je     80106b30 <copyuvm+0xb0>
80106aa3:	31 db                	xor    %ebx,%ebx
80106aa5:	eb 5b                	jmp    80106b02 <copyuvm+0x82>
80106aa7:	90                   	nop
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106aa8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106aab:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106ab2:	00 
80106ab3:	89 3c 24             	mov    %edi,(%esp)
80106ab6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106abb:	2d 00 00 00 80       	sub    $0x80000000,%eax
80106ac0:	89 44 24 04          	mov    %eax,0x4(%esp)
80106ac4:	e8 a7 d9 ff ff       	call   80104470 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106ac9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106acc:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106ad3:	00 
80106ad4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80106ad8:	89 34 24             	mov    %esi,(%esp)
80106adb:	25 ff 0f 00 00       	and    $0xfff,%eax
80106ae0:	89 44 24 10          	mov    %eax,0x10(%esp)
80106ae4:	8d 87 00 00 00 80    	lea    -0x80000000(%edi),%eax
80106aea:	89 44 24 0c          	mov    %eax,0xc(%esp)
80106aee:	e8 6d fc ff ff       	call   80106760 <mappages>
80106af3:	85 c0                	test   %eax,%eax
80106af5:	78 49                	js     80106b40 <copyuvm+0xc0>
  for(i = 0; i < sz; i += PGSIZE){
80106af7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106afd:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
80106b00:	76 2e                	jbe    80106b30 <copyuvm+0xb0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106b02:	8b 45 08             	mov    0x8(%ebp),%eax
80106b05:	31 c9                	xor    %ecx,%ecx
80106b07:	89 da                	mov    %ebx,%edx
80106b09:	e8 b2 fa ff ff       	call   801065c0 <walkpgdir>
80106b0e:	85 c0                	test   %eax,%eax
80106b10:	74 44                	je     80106b56 <copyuvm+0xd6>
    if(!(*pte & PTE_P))
80106b12:	8b 00                	mov    (%eax),%eax
80106b14:	a8 01                	test   $0x1,%al
80106b16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106b19:	74 2f                	je     80106b4a <copyuvm+0xca>
    if((mem = kalloc()) == 0)
80106b1b:	e8 10 b8 ff ff       	call   80102330 <kalloc>
80106b20:	85 c0                	test   %eax,%eax
80106b22:	89 c7                	mov    %eax,%edi
80106b24:	75 82                	jne    80106aa8 <copyuvm+0x28>
  freevm(d);
80106b26:	89 34 24             	mov    %esi,(%esp)
80106b29:	31 f6                	xor    %esi,%esi
80106b2b:	e8 10 fe ff ff       	call   80106940 <freevm>
}
80106b30:	83 c4 3c             	add    $0x3c,%esp
80106b33:	89 f0                	mov    %esi,%eax
80106b35:	5b                   	pop    %ebx
80106b36:	5e                   	pop    %esi
80106b37:	5f                   	pop    %edi
80106b38:	5d                   	pop    %ebp
80106b39:	c3                   	ret    
80106b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      kfree(mem);
80106b40:	89 3c 24             	mov    %edi,(%esp)
80106b43:	e8 38 b8 ff ff       	call   80102380 <kfree>
      goto bad;
80106b48:	eb dc                	jmp    80106b26 <copyuvm+0xa6>
      panic("copyuvm: page not present");
80106b4a:	c7 04 24 35 78 10 80 	movl   $0x80107835,(%esp)
80106b51:	e8 5a 98 ff ff       	call   801003b0 <panic>
      panic("copyuvm: pte should exist");
80106b56:	c7 04 24 1b 78 10 80 	movl   $0x8010781b,(%esp)
80106b5d:	e8 4e 98 ff ff       	call   801003b0 <panic>
80106b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b70 <allocuvm>:
{
80106b70:	55                   	push   %ebp
80106b71:	89 e5                	mov    %esp,%ebp
80106b73:	57                   	push   %edi
80106b74:	56                   	push   %esi
80106b75:	53                   	push   %ebx
80106b76:	83 ec 3c             	sub    $0x3c,%esp
80106b79:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(newsz >= KERNBASE)
80106b7c:	85 ff                	test   %edi,%edi
80106b7e:	89 7d e0             	mov    %edi,-0x20(%ebp)
80106b81:	0f 88 ae 00 00 00    	js     80106c35 <allocuvm+0xc5>
  if(newsz < oldsz)
80106b87:	8b 45 0c             	mov    0xc(%ebp),%eax
80106b8a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80106b8d:	0f 82 b5 00 00 00    	jb     80106c48 <allocuvm+0xd8>
  a = PGROUNDUP(oldsz);
80106b93:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80106b96:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
80106b9c:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106ba2:	39 df                	cmp    %ebx,%edi
80106ba4:	0f 86 a1 00 00 00    	jbe    80106c4b <allocuvm+0xdb>
80106baa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106bad:	8b 7d 08             	mov    0x8(%ebp),%edi
80106bb0:	eb 53                	jmp    80106c05 <allocuvm+0x95>
80106bb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80106bb8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106bbf:	00 
80106bc0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106bc7:	00 
80106bc8:	89 04 24             	mov    %eax,(%esp)
80106bcb:	e8 e0 d7 ff ff       	call   801043b0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106bd0:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106bd6:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
80106bdd:	00 
80106bde:	89 44 24 0c          	mov    %eax,0xc(%esp)
80106be2:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106be9:	00 
80106bea:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80106bee:	89 3c 24             	mov    %edi,(%esp)
80106bf1:	e8 6a fb ff ff       	call   80106760 <mappages>
80106bf6:	85 c0                	test   %eax,%eax
80106bf8:	78 5e                	js     80106c58 <allocuvm+0xe8>
  for(; a < newsz; a += PGSIZE){
80106bfa:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c00:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
80106c03:	76 46                	jbe    80106c4b <allocuvm+0xdb>
    mem = kalloc();
80106c05:	e8 26 b7 ff ff       	call   80102330 <kalloc>
    if(mem == 0){
80106c0a:	85 c0                	test   %eax,%eax
    mem = kalloc();
80106c0c:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106c0e:	75 a8                	jne    80106bb8 <allocuvm+0x48>
80106c10:	8b 7d e4             	mov    -0x1c(%ebp),%edi
      cprintf("allocuvm out of memory\n");
80106c13:	c7 04 24 1f 77 10 80 	movl   $0x8010771f,(%esp)
80106c1a:	e8 31 9c ff ff       	call   80100850 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80106c1f:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c22:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106c26:	89 44 24 08          	mov    %eax,0x8(%esp)
80106c2a:	8b 45 08             	mov    0x8(%ebp),%eax
80106c2d:	89 04 24             	mov    %eax,(%esp)
80106c30:	e8 5b fc ff ff       	call   80106890 <deallocuvm>
80106c35:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80106c3c:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c3f:	83 c4 3c             	add    $0x3c,%esp
80106c42:	5b                   	pop    %ebx
80106c43:	5e                   	pop    %esi
80106c44:	5f                   	pop    %edi
80106c45:	5d                   	pop    %ebp
80106c46:	c3                   	ret    
80106c47:	90                   	nop
    return oldsz;
80106c48:	89 45 e0             	mov    %eax,-0x20(%ebp)
}
80106c4b:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c4e:	83 c4 3c             	add    $0x3c,%esp
80106c51:	5b                   	pop    %ebx
80106c52:	5e                   	pop    %esi
80106c53:	5f                   	pop    %edi
80106c54:	5d                   	pop    %ebp
80106c55:	c3                   	ret    
80106c56:	66 90                	xchg   %ax,%ax
80106c58:	8b 7d e4             	mov    -0x1c(%ebp),%edi
      cprintf("allocuvm out of memory (2)\n");
80106c5b:	c7 04 24 37 77 10 80 	movl   $0x80107737,(%esp)
80106c62:	e8 e9 9b ff ff       	call   80100850 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80106c67:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c6a:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106c6e:	89 44 24 08          	mov    %eax,0x8(%esp)
80106c72:	8b 45 08             	mov    0x8(%ebp),%eax
80106c75:	89 04 24             	mov    %eax,(%esp)
80106c78:	e8 13 fc ff ff       	call   80106890 <deallocuvm>
      kfree(mem);
80106c7d:	89 34 24             	mov    %esi,(%esp)
80106c80:	e8 fb b6 ff ff       	call   80102380 <kfree>
80106c85:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
80106c8c:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c8f:	83 c4 3c             	add    $0x3c,%esp
80106c92:	5b                   	pop    %ebx
80106c93:	5e                   	pop    %esi
80106c94:	5f                   	pop    %edi
80106c95:	5d                   	pop    %ebp
80106c96:	c3                   	ret    
80106c97:	89 f6                	mov    %esi,%esi
80106c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ca0 <loaduvm>:
{
80106ca0:	55                   	push   %ebp
80106ca1:	89 e5                	mov    %esp,%ebp
80106ca3:	57                   	push   %edi
80106ca4:	56                   	push   %esi
80106ca5:	53                   	push   %ebx
80106ca6:	83 ec 2c             	sub    $0x2c,%esp
80106ca9:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if((uint) addr % PGSIZE != 0)
80106cac:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
80106cb2:	0f 85 96 00 00 00    	jne    80106d4e <loaduvm+0xae>
    panic("loaduvm: addr must be page aligned");
80106cb8:	8b 75 18             	mov    0x18(%ebp),%esi
80106cbb:	31 db                	xor    %ebx,%ebx
  for(i = 0; i < sz; i += PGSIZE){
80106cbd:	85 f6                	test   %esi,%esi
80106cbf:	75 18                	jne    80106cd9 <loaduvm+0x39>
80106cc1:	eb 75                	jmp    80106d38 <loaduvm+0x98>
80106cc3:	90                   	nop
80106cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106cc8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106cce:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106cd4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106cd7:	76 5f                	jbe    80106d38 <loaduvm+0x98>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106cd9:	8b 45 08             	mov    0x8(%ebp),%eax
80106cdc:	31 c9                	xor    %ecx,%ecx
80106cde:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
80106ce1:	e8 da f8 ff ff       	call   801065c0 <walkpgdir>
80106ce6:	85 c0                	test   %eax,%eax
80106ce8:	74 58                	je     80106d42 <loaduvm+0xa2>
    if(sz - i < PGSIZE)
80106cea:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
80106cf0:	ba 00 10 00 00       	mov    $0x1000,%edx
    pa = PTE_ADDR(*pte);
80106cf5:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
80106cf7:	0f 42 d6             	cmovb  %esi,%edx
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106cfa:	89 54 24 0c          	mov    %edx,0xc(%esp)
80106cfe:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106d01:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d06:	2d 00 00 00 80       	sub    $0x80000000,%eax
80106d0b:	8d 0c 0b             	lea    (%ebx,%ecx,1),%ecx
80106d0e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80106d12:	89 44 24 04          	mov    %eax,0x4(%esp)
80106d16:	8b 45 10             	mov    0x10(%ebp),%eax
80106d19:	89 04 24             	mov    %eax,(%esp)
80106d1c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106d1f:	e8 dc a9 ff ff       	call   80101700 <readi>
80106d24:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106d27:	39 d0                	cmp    %edx,%eax
80106d29:	74 9d                	je     80106cc8 <loaduvm+0x28>
}
80106d2b:	83 c4 2c             	add    $0x2c,%esp
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106d2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106d33:	5b                   	pop    %ebx
80106d34:	5e                   	pop    %esi
80106d35:	5f                   	pop    %edi
80106d36:	5d                   	pop    %ebp
80106d37:	c3                   	ret    
80106d38:	83 c4 2c             	add    $0x2c,%esp
  for(i = 0; i < sz; i += PGSIZE){
80106d3b:	31 c0                	xor    %eax,%eax
}
80106d3d:	5b                   	pop    %ebx
80106d3e:	5e                   	pop    %esi
80106d3f:	5f                   	pop    %edi
80106d40:	5d                   	pop    %ebp
80106d41:	c3                   	ret    
      panic("loaduvm: address should exist");
80106d42:	c7 04 24 4f 78 10 80 	movl   $0x8010784f,(%esp)
80106d49:	e8 62 96 ff ff       	call   801003b0 <panic>
    panic("loaduvm: addr must be page aligned");
80106d4e:	c7 04 24 ac 78 10 80 	movl   $0x801078ac,(%esp)
80106d55:	e8 56 96 ff ff       	call   801003b0 <panic>
80106d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d60 <switchuvm>:
{
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
80106d66:	83 ec 2c             	sub    $0x2c,%esp
80106d69:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80106d6c:	85 f6                	test   %esi,%esi
80106d6e:	0f 84 c4 00 00 00    	je     80106e38 <switchuvm+0xd8>
  if(p->kstack == 0)
80106d74:	8b 4e 08             	mov    0x8(%esi),%ecx
80106d77:	85 c9                	test   %ecx,%ecx
80106d79:	0f 84 d1 00 00 00    	je     80106e50 <switchuvm+0xf0>
  if(p->pgdir == 0)
80106d7f:	8b 56 04             	mov    0x4(%esi),%edx
80106d82:	85 d2                	test   %edx,%edx
80106d84:	0f 84 ba 00 00 00    	je     80106e44 <switchuvm+0xe4>
  pushcli();
80106d8a:	e8 d1 d4 ff ff       	call   80104260 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106d8f:	e8 bc cb ff ff       	call   80103950 <mycpu>
80106d94:	89 c3                	mov    %eax,%ebx
80106d96:	e8 b5 cb ff ff       	call   80103950 <mycpu>
80106d9b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106d9e:	e8 ad cb ff ff       	call   80103950 <mycpu>
80106da3:	89 c7                	mov    %eax,%edi
80106da5:	e8 a6 cb ff ff       	call   80103950 <mycpu>
80106daa:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80106db1:	67 00 
80106db3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106db6:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106dbd:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106dc4:	83 c2 08             	add    $0x8,%edx
80106dc7:	66 89 93 9a 00 00 00 	mov    %dx,0x9a(%ebx)
80106dce:	83 c0 08             	add    $0x8,%eax
80106dd1:	8d 57 08             	lea    0x8(%edi),%edx
80106dd4:	c1 ea 10             	shr    $0x10,%edx
80106dd7:	c1 e8 18             	shr    $0x18,%eax
80106dda:	88 93 9c 00 00 00    	mov    %dl,0x9c(%ebx)
80106de0:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
80106de6:	e8 65 cb ff ff       	call   80103950 <mycpu>
80106deb:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106df2:	e8 59 cb ff ff       	call   80103950 <mycpu>
80106df7:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106dfd:	e8 4e cb ff ff       	call   80103950 <mycpu>
80106e02:	8b 56 08             	mov    0x8(%esi),%edx
80106e05:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106e0b:	89 50 0c             	mov    %edx,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106e0e:	e8 3d cb ff ff       	call   80103950 <mycpu>
80106e13:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106e19:	b8 28 00 00 00       	mov    $0x28,%eax
80106e1e:	0f 00 d8             	ltr    %ax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106e21:	8b 46 04             	mov    0x4(%esi),%eax
80106e24:	2d 00 00 00 80       	sub    $0x80000000,%eax
80106e29:	0f 22 d8             	mov    %eax,%cr3
}
80106e2c:	83 c4 2c             	add    $0x2c,%esp
80106e2f:	5b                   	pop    %ebx
80106e30:	5e                   	pop    %esi
80106e31:	5f                   	pop    %edi
80106e32:	5d                   	pop    %ebp
  popcli();
80106e33:	e9 b8 d3 ff ff       	jmp    801041f0 <popcli>
    panic("switchuvm: no process");
80106e38:	c7 04 24 6d 78 10 80 	movl   $0x8010786d,(%esp)
80106e3f:	e8 6c 95 ff ff       	call   801003b0 <panic>
    panic("switchuvm: no pgdir");
80106e44:	c7 04 24 98 78 10 80 	movl   $0x80107898,(%esp)
80106e4b:	e8 60 95 ff ff       	call   801003b0 <panic>
    panic("switchuvm: no kstack");
80106e50:	c7 04 24 83 78 10 80 	movl   $0x80107883,(%esp)
80106e57:	e8 54 95 ff ff       	call   801003b0 <panic>
80106e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e60 <seginit>:
{
80106e60:	55                   	push   %ebp
80106e61:	89 e5                	mov    %esp,%ebp
80106e63:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106e66:	e8 85 d1 ff ff       	call   80103ff0 <cpuid>
80106e6b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106e71:	05 a0 27 11 80       	add    $0x801127a0,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106e76:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
80106e7c:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
80106e82:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
80106e86:	c6 40 7d 9a          	movb   $0x9a,0x7d(%eax)
80106e8a:	c6 40 7e cf          	movb   $0xcf,0x7e(%eax)
80106e8e:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106e92:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
80106e99:	ff ff 
80106e9b:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
80106ea2:	00 00 
80106ea4:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
80106eab:	c6 80 85 00 00 00 92 	movb   $0x92,0x85(%eax)
80106eb2:	c6 80 86 00 00 00 cf 	movb   $0xcf,0x86(%eax)
80106eb9:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106ec0:	66 c7 80 88 00 00 00 	movw   $0xffff,0x88(%eax)
80106ec7:	ff ff 
80106ec9:	66 c7 80 8a 00 00 00 	movw   $0x0,0x8a(%eax)
80106ed0:	00 00 
80106ed2:	c6 80 8c 00 00 00 00 	movb   $0x0,0x8c(%eax)
80106ed9:	c6 80 8d 00 00 00 fa 	movb   $0xfa,0x8d(%eax)
80106ee0:	c6 80 8e 00 00 00 cf 	movb   $0xcf,0x8e(%eax)
80106ee7:	c6 80 8f 00 00 00 00 	movb   $0x0,0x8f(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106eee:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
80106ef5:	ff ff 
80106ef7:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
80106efe:	00 00 
80106f00:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
80106f07:	c6 80 95 00 00 00 f2 	movb   $0xf2,0x95(%eax)
80106f0e:	c6 80 96 00 00 00 cf 	movb   $0xcf,0x96(%eax)
80106f15:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
80106f1c:	83 c0 70             	add    $0x70,%eax
  pd[0] = size-1;
80106f1f:	66 c7 45 f2 2f 00    	movw   $0x2f,-0xe(%ebp)
  pd[1] = (uint)p;
80106f25:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106f29:	c1 e8 10             	shr    $0x10,%eax
80106f2c:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106f30:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106f33:	0f 01 10             	lgdtl  (%eax)
}
80106f36:	c9                   	leave  
80106f37:	c3                   	ret    
