
_usertests：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
       3:	5d                   	pop    %ebp
       4:	c3                   	ret    
       5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
       9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000010 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
      10:	69 05 50 59 00 00 0d 	imul   $0x19660d,0x5950,%eax
      17:	66 19 00 
{
      1a:	55                   	push   %ebp
      1b:	89 e5                	mov    %esp,%ebp
  return randstate;
}
      1d:	5d                   	pop    %ebp
  randstate = randstate * 1664525 + 1013904223;
      1e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
      23:	a3 50 59 00 00       	mov    %eax,0x5950
}
      28:	c3                   	ret    
      29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000030 <bsstest>:
{
      30:	55                   	push   %ebp
      31:	89 e5                	mov    %esp,%ebp
      33:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "bss test\n");
      36:	a1 4c 59 00 00       	mov    0x594c,%eax
      3b:	c7 44 24 04 88 41 00 	movl   $0x4188,0x4(%esp)
      42:	00 
      43:	89 04 24             	mov    %eax,(%esp)
      46:	e8 c5 3d 00 00       	call   3e10 <printf>
    if(uninit[i] != '\0'){
      4b:	80 3d 00 5a 00 00 00 	cmpb   $0x0,0x5a00
      52:	75 36                	jne    8a <bsstest+0x5a>
      54:	b8 01 00 00 00       	mov    $0x1,%eax
      59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      60:	80 b8 00 5a 00 00 00 	cmpb   $0x0,0x5a00(%eax)
      67:	75 21                	jne    8a <bsstest+0x5a>
  for(i = 0; i < sizeof(uninit); i++){
      69:	83 c0 01             	add    $0x1,%eax
      6c:	3d 10 27 00 00       	cmp    $0x2710,%eax
      71:	75 ed                	jne    60 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
      73:	a1 4c 59 00 00       	mov    0x594c,%eax
      78:	c7 44 24 04 a3 41 00 	movl   $0x41a3,0x4(%esp)
      7f:	00 
      80:	89 04 24             	mov    %eax,(%esp)
      83:	e8 88 3d 00 00       	call   3e10 <printf>
}
      88:	c9                   	leave  
      89:	c3                   	ret    
      printf(stdout, "bss test failed\n");
      8a:	a1 4c 59 00 00       	mov    0x594c,%eax
      8f:	c7 44 24 04 92 41 00 	movl   $0x4192,0x4(%esp)
      96:	00 
      97:	89 04 24             	mov    %eax,(%esp)
      9a:	e8 71 3d 00 00       	call   3e10 <printf>
      exit();
      9f:	e8 21 3c 00 00       	call   3cc5 <exit>
      a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <opentest>:
{
      b0:	55                   	push   %ebp
      b1:	89 e5                	mov    %esp,%ebp
      b3:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "open test\n");
      b6:	a1 4c 59 00 00       	mov    0x594c,%eax
      bb:	c7 44 24 04 b0 41 00 	movl   $0x41b0,0x4(%esp)
      c2:	00 
      c3:	89 04 24             	mov    %eax,(%esp)
      c6:	e8 45 3d 00 00       	call   3e10 <printf>
  fd = open("echo", 0);
      cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      d2:	00 
      d3:	c7 04 24 bb 41 00 00 	movl   $0x41bb,(%esp)
      da:	e8 26 3c 00 00       	call   3d05 <open>
  if(fd < 0){
      df:	85 c0                	test   %eax,%eax
      e1:	78 37                	js     11a <opentest+0x6a>
  close(fd);
      e3:	89 04 24             	mov    %eax,(%esp)
      e6:	e8 02 3c 00 00       	call   3ced <close>
  fd = open("doesnotexist", 0);
      eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      f2:	00 
      f3:	c7 04 24 d3 41 00 00 	movl   $0x41d3,(%esp)
      fa:	e8 06 3c 00 00       	call   3d05 <open>
  if(fd >= 0){
      ff:	85 c0                	test   %eax,%eax
     101:	79 31                	jns    134 <opentest+0x84>
  printf(stdout, "open test ok\n");
     103:	a1 4c 59 00 00       	mov    0x594c,%eax
     108:	c7 44 24 04 fe 41 00 	movl   $0x41fe,0x4(%esp)
     10f:	00 
     110:	89 04 24             	mov    %eax,(%esp)
     113:	e8 f8 3c 00 00       	call   3e10 <printf>
}
     118:	c9                   	leave  
     119:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     11a:	a1 4c 59 00 00       	mov    0x594c,%eax
     11f:	c7 44 24 04 c0 41 00 	movl   $0x41c0,0x4(%esp)
     126:	00 
     127:	89 04 24             	mov    %eax,(%esp)
     12a:	e8 e1 3c 00 00       	call   3e10 <printf>
    exit();
     12f:	e8 91 3b 00 00       	call   3cc5 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     134:	a1 4c 59 00 00       	mov    0x594c,%eax
     139:	c7 44 24 04 e0 41 00 	movl   $0x41e0,0x4(%esp)
     140:	00 
     141:	89 04 24             	mov    %eax,(%esp)
     144:	e8 c7 3c 00 00       	call   3e10 <printf>
    exit();
     149:	e8 77 3b 00 00       	call   3cc5 <exit>
     14e:	66 90                	xchg   %ax,%ax

00000150 <argptest>:
{
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	53                   	push   %ebx
     154:	83 ec 14             	sub    $0x14,%esp
  fd = open("init", O_RDONLY);
     157:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     15e:	00 
     15f:	c7 04 24 0c 42 00 00 	movl   $0x420c,(%esp)
     166:	e8 9a 3b 00 00       	call   3d05 <open>
  if (fd < 0) {
     16b:	85 c0                	test   %eax,%eax
  fd = open("init", O_RDONLY);
     16d:	89 c3                	mov    %eax,%ebx
  if (fd < 0) {
     16f:	78 45                	js     1b6 <argptest+0x66>
  read(fd, sbrk(0) - 1, -1);
     171:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     178:	e8 d0 3b 00 00       	call   3d4d <sbrk>
     17d:	89 1c 24             	mov    %ebx,(%esp)
     180:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
     187:	ff 
     188:	83 e8 01             	sub    $0x1,%eax
     18b:	89 44 24 04          	mov    %eax,0x4(%esp)
     18f:	e8 49 3b 00 00       	call   3cdd <read>
  close(fd);
     194:	89 1c 24             	mov    %ebx,(%esp)
     197:	e8 51 3b 00 00       	call   3ced <close>
  printf(1, "arg test passed\n");
     19c:	c7 44 24 04 1e 42 00 	movl   $0x421e,0x4(%esp)
     1a3:	00 
     1a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1ab:	e8 60 3c 00 00       	call   3e10 <printf>
}
     1b0:	83 c4 14             	add    $0x14,%esp
     1b3:	5b                   	pop    %ebx
     1b4:	5d                   	pop    %ebp
     1b5:	c3                   	ret    
    printf(2, "open failed\n");
     1b6:	c7 44 24 04 11 42 00 	movl   $0x4211,0x4(%esp)
     1bd:	00 
     1be:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1c5:	e8 46 3c 00 00       	call   3e10 <printf>
    exit();
     1ca:	e8 f6 3a 00 00       	call   3cc5 <exit>
     1cf:	90                   	nop

000001d0 <uio>:
{
     1d0:	55                   	push   %ebp
     1d1:	89 e5                	mov    %esp,%ebp
     1d3:	83 ec 18             	sub    $0x18,%esp
  printf(1, "uio test\n");
     1d6:	c7 44 24 04 2f 42 00 	movl   $0x422f,0x4(%esp)
     1dd:	00 
     1de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1e5:	e8 26 3c 00 00       	call   3e10 <printf>
  pid = fork();
     1ea:	e8 ce 3a 00 00       	call   3cbd <fork>
  if(pid == 0){
     1ef:	83 f8 00             	cmp    $0x0,%eax
     1f2:	74 1f                	je     213 <uio+0x43>
  } else if(pid < 0){
     1f4:	7c 44                	jl     23a <uio+0x6a>
     1f6:	66 90                	xchg   %ax,%ax
  wait();
     1f8:	e8 d0 3a 00 00       	call   3ccd <wait>
  printf(1, "uio test done\n");
     1fd:	c7 44 24 04 39 42 00 	movl   $0x4239,0x4(%esp)
     204:	00 
     205:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     20c:	e8 ff 3b 00 00       	call   3e10 <printf>
}
     211:	c9                   	leave  
     212:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
     213:	ba 70 00 00 00       	mov    $0x70,%edx
     218:	b8 09 00 00 00       	mov    $0x9,%eax
     21d:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
     21e:	b2 71                	mov    $0x71,%dl
     220:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
     221:	c7 44 24 04 ac 51 00 	movl   $0x51ac,0x4(%esp)
     228:	00 
     229:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     230:	e8 db 3b 00 00       	call   3e10 <printf>
    exit();
     235:	e8 8b 3a 00 00       	call   3cc5 <exit>
    printf (1, "fork failed\n");
     23a:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
     241:	00 
     242:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     249:	e8 c2 3b 00 00       	call   3e10 <printf>
    exit();
     24e:	e8 72 3a 00 00       	call   3cc5 <exit>
     253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <forktest>:
{
     260:	55                   	push   %ebp
     261:	89 e5                	mov    %esp,%ebp
     263:	53                   	push   %ebx
  printf(1, "fork test\n");
     264:	31 db                	xor    %ebx,%ebx
{
     266:	83 ec 14             	sub    $0x14,%esp
  printf(1, "fork test\n");
     269:	c7 44 24 04 48 42 00 	movl   $0x4248,0x4(%esp)
     270:	00 
     271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     278:	e8 93 3b 00 00       	call   3e10 <printf>
     27d:	eb 13                	jmp    292 <forktest+0x32>
     27f:	90                   	nop
    if(pid == 0)
     280:	74 72                	je     2f4 <forktest+0x94>
  for(n=0; n<1000; n++){
     282:	83 c3 01             	add    $0x1,%ebx
     285:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
     28b:	90                   	nop
     28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     290:	74 4e                	je     2e0 <forktest+0x80>
     292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pid = fork();
     298:	e8 20 3a 00 00       	call   3cbd <fork>
    if(pid < 0)
     29d:	83 f8 00             	cmp    $0x0,%eax
     2a0:	7d de                	jge    280 <forktest+0x20>
  for(; n > 0; n--){
     2a2:	85 db                	test   %ebx,%ebx
     2a4:	74 11                	je     2b7 <forktest+0x57>
     2a6:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
     2a8:	e8 20 3a 00 00       	call   3ccd <wait>
     2ad:	85 c0                	test   %eax,%eax
     2af:	90                   	nop
     2b0:	78 47                	js     2f9 <forktest+0x99>
  for(; n > 0; n--){
     2b2:	83 eb 01             	sub    $0x1,%ebx
     2b5:	75 f1                	jne    2a8 <forktest+0x48>
     2b7:	90                   	nop
  if(wait() != -1){
     2b8:	e8 10 3a 00 00       	call   3ccd <wait>
     2bd:	83 f8 ff             	cmp    $0xffffffff,%eax
     2c0:	75 50                	jne    312 <forktest+0xb2>
  printf(1, "fork test OK\n");
     2c2:	c7 44 24 04 7a 42 00 	movl   $0x427a,0x4(%esp)
     2c9:	00 
     2ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2d1:	e8 3a 3b 00 00       	call   3e10 <printf>
}
     2d6:	83 c4 14             	add    $0x14,%esp
     2d9:	5b                   	pop    %ebx
     2da:	5d                   	pop    %ebp
     2db:	c3                   	ret    
     2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fork claimed to work 1000 times!\n");
     2e0:	c7 44 24 04 d0 51 00 	movl   $0x51d0,0x4(%esp)
     2e7:	00 
     2e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2ef:	e8 1c 3b 00 00       	call   3e10 <printf>
    exit();
     2f4:	e8 cc 39 00 00       	call   3cc5 <exit>
      printf(1, "wait stopped early\n");
     2f9:	c7 44 24 04 53 42 00 	movl   $0x4253,0x4(%esp)
     300:	00 
     301:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     308:	e8 03 3b 00 00       	call   3e10 <printf>
      exit();
     30d:	e8 b3 39 00 00       	call   3cc5 <exit>
    printf(1, "wait got too many\n");
     312:	c7 44 24 04 67 42 00 	movl   $0x4267,0x4(%esp)
     319:	00 
     31a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     321:	e8 ea 3a 00 00       	call   3e10 <printf>
    exit();
     326:	e8 9a 39 00 00       	call   3cc5 <exit>
     32b:	90                   	nop
     32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <exitwait>:
{
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	56                   	push   %esi
     334:	31 f6                	xor    %esi,%esi
     336:	53                   	push   %ebx
     337:	83 ec 10             	sub    $0x10,%esp
     33a:	eb 17                	jmp    353 <exitwait+0x23>
     33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     340:	74 79                	je     3bb <exitwait+0x8b>
      if(wait() != pid){
     342:	e8 86 39 00 00       	call   3ccd <wait>
     347:	39 c3                	cmp    %eax,%ebx
     349:	75 35                	jne    380 <exitwait+0x50>
  for(i = 0; i < 100; i++){
     34b:	83 c6 01             	add    $0x1,%esi
     34e:	83 fe 64             	cmp    $0x64,%esi
     351:	74 4d                	je     3a0 <exitwait+0x70>
    pid = fork();
     353:	e8 65 39 00 00       	call   3cbd <fork>
    if(pid < 0){
     358:	83 f8 00             	cmp    $0x0,%eax
    pid = fork();
     35b:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     35d:	7d e1                	jge    340 <exitwait+0x10>
      printf(1, "fork failed\n");
     35f:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
     366:	00 
     367:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     36e:	e8 9d 3a 00 00       	call   3e10 <printf>
}
     373:	83 c4 10             	add    $0x10,%esp
     376:	5b                   	pop    %ebx
     377:	5e                   	pop    %esi
     378:	5d                   	pop    %ebp
     379:	c3                   	ret    
     37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, "wait wrong pid\n");
     380:	c7 44 24 04 88 42 00 	movl   $0x4288,0x4(%esp)
     387:	00 
     388:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     38f:	e8 7c 3a 00 00       	call   3e10 <printf>
}
     394:	83 c4 10             	add    $0x10,%esp
     397:	5b                   	pop    %ebx
     398:	5e                   	pop    %esi
     399:	5d                   	pop    %ebp
     39a:	c3                   	ret    
     39b:	90                   	nop
     39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "exitwait ok\n");
     3a0:	c7 44 24 04 98 42 00 	movl   $0x4298,0x4(%esp)
     3a7:	00 
     3a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3af:	e8 5c 3a 00 00       	call   3e10 <printf>
}
     3b4:	83 c4 10             	add    $0x10,%esp
     3b7:	5b                   	pop    %ebx
     3b8:	5e                   	pop    %esi
     3b9:	5d                   	pop    %ebp
     3ba:	c3                   	ret    
      exit();
     3bb:	e8 05 39 00 00       	call   3cc5 <exit>

000003c0 <fsfull>:
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	57                   	push   %edi
     3c4:	56                   	push   %esi
     3c5:	53                   	push   %ebx
  printf(1, "fsfull test\n");
     3c6:	31 db                	xor    %ebx,%ebx
{
     3c8:	83 ec 5c             	sub    $0x5c,%esp
  printf(1, "fsfull test\n");
     3cb:	c7 44 24 04 a5 42 00 	movl   $0x42a5,0x4(%esp)
     3d2:	00 
     3d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3da:	e8 31 3a 00 00       	call   3e10 <printf>
     3df:	90                   	nop
    name[1] = '0' + nfiles / 1000;
     3e0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
     3e5:	89 d9                	mov    %ebx,%ecx
     3e7:	f7 eb                	imul   %ebx
     3e9:	c1 f9 1f             	sar    $0x1f,%ecx
    name[0] = 'f';
     3ec:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
     3f0:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
     3f4:	c1 fa 06             	sar    $0x6,%edx
     3f7:	29 ca                	sub    %ecx,%edx
    name[2] = '0' + (nfiles % 1000) / 100;
     3f9:	69 f2 e8 03 00 00    	imul   $0x3e8,%edx,%esi
    name[1] = '0' + nfiles / 1000;
     3ff:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
     402:	89 da                	mov    %ebx,%edx
    name[1] = '0' + nfiles / 1000;
     404:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
     407:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    printf(1, "writing %s\n", name);
     40c:	c7 44 24 04 b2 42 00 	movl   $0x42b2,0x4(%esp)
     413:	00 
    name[2] = '0' + (nfiles % 1000) / 100;
     414:	29 f2                	sub    %esi,%edx
     416:	89 d6                	mov    %edx,%esi
     418:	f7 ea                	imul   %edx
    name[3] = '0' + (nfiles % 100) / 10;
     41a:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
     41f:	c1 fe 1f             	sar    $0x1f,%esi
    printf(1, "writing %s\n", name);
     422:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    name[2] = '0' + (nfiles % 1000) / 100;
     429:	c1 fa 05             	sar    $0x5,%edx
     42c:	29 f2                	sub    %esi,%edx
    name[3] = '0' + (nfiles % 100) / 10;
     42e:	be 67 66 66 66       	mov    $0x66666667,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
     433:	83 c2 30             	add    $0x30,%edx
     436:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
     439:	f7 eb                	imul   %ebx
     43b:	c1 fa 05             	sar    $0x5,%edx
     43e:	29 ca                	sub    %ecx,%edx
     440:	6b fa 64             	imul   $0x64,%edx,%edi
     443:	89 da                	mov    %ebx,%edx
     445:	29 fa                	sub    %edi,%edx
     447:	89 d0                	mov    %edx,%eax
     449:	89 d7                	mov    %edx,%edi
     44b:	f7 ee                	imul   %esi
    name[4] = '0' + (nfiles % 10);
     44d:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
     44f:	c1 ff 1f             	sar    $0x1f,%edi
     452:	c1 fa 02             	sar    $0x2,%edx
     455:	29 fa                	sub    %edi,%edx
     457:	83 c2 30             	add    $0x30,%edx
     45a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
     45d:	f7 ee                	imul   %esi
     45f:	c1 fa 02             	sar    $0x2,%edx
     462:	29 ca                	sub    %ecx,%edx
     464:	8d 04 92             	lea    (%edx,%edx,4),%eax
     467:	89 da                	mov    %ebx,%edx
     469:	01 c0                	add    %eax,%eax
     46b:	29 c2                	sub    %eax,%edx
     46d:	89 d0                	mov    %edx,%eax
     46f:	83 c0 30             	add    $0x30,%eax
     472:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
     475:	8d 45 a8             	lea    -0x58(%ebp),%eax
     478:	89 44 24 08          	mov    %eax,0x8(%esp)
     47c:	e8 8f 39 00 00       	call   3e10 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
     481:	8d 55 a8             	lea    -0x58(%ebp),%edx
     484:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     48b:	00 
     48c:	89 14 24             	mov    %edx,(%esp)
     48f:	e8 71 38 00 00       	call   3d05 <open>
    if(fd < 0){
     494:	85 c0                	test   %eax,%eax
    int fd = open(name, O_CREATE|O_RDWR);
     496:	89 c7                	mov    %eax,%edi
    if(fd < 0){
     498:	78 53                	js     4ed <fsfull+0x12d>
      break;
     49a:	31 f6                	xor    %esi,%esi
     49c:	eb 04                	jmp    4a2 <fsfull+0xe2>
     49e:	66 90                	xchg   %ax,%ax
      total += cc;
     4a0:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
     4a2:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     4a9:	00 
     4aa:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
     4b1:	00 
     4b2:	89 3c 24             	mov    %edi,(%esp)
     4b5:	e8 2b 38 00 00       	call   3ce5 <write>
      if(cc < 512)
     4ba:	3d ff 01 00 00       	cmp    $0x1ff,%eax
     4bf:	7f df                	jg     4a0 <fsfull+0xe0>
    printf(1, "wrote %d bytes\n", total);
     4c1:	89 74 24 08          	mov    %esi,0x8(%esp)
     4c5:	c7 44 24 04 ce 42 00 	movl   $0x42ce,0x4(%esp)
     4cc:	00 
     4cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4d4:	e8 37 39 00 00       	call   3e10 <printf>
    close(fd);
     4d9:	89 3c 24             	mov    %edi,(%esp)
     4dc:	e8 0c 38 00 00       	call   3ced <close>
    if(total == 0)
     4e1:	85 f6                	test   %esi,%esi
     4e3:	74 23                	je     508 <fsfull+0x148>
  for(nfiles = 0; ; nfiles++){
     4e5:	83 c3 01             	add    $0x1,%ebx
  }
     4e8:	e9 f3 fe ff ff       	jmp    3e0 <fsfull+0x20>
      printf(1, "open %s failed\n", name);
     4ed:	8d 45 a8             	lea    -0x58(%ebp),%eax
     4f0:	89 44 24 08          	mov    %eax,0x8(%esp)
     4f4:	c7 44 24 04 be 42 00 	movl   $0x42be,0x4(%esp)
     4fb:	00 
     4fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     503:	e8 08 39 00 00       	call   3e10 <printf>
    name[1] = '0' + nfiles / 1000;
     508:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
     50d:	89 d9                	mov    %ebx,%ecx
     50f:	f7 eb                	imul   %ebx
     511:	c1 f9 1f             	sar    $0x1f,%ecx
    name[0] = 'f';
     514:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
     518:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
     51c:	c1 fa 06             	sar    $0x6,%edx
     51f:	29 ca                	sub    %ecx,%edx
    name[2] = '0' + (nfiles % 1000) / 100;
     521:	69 f2 e8 03 00 00    	imul   $0x3e8,%edx,%esi
    name[1] = '0' + nfiles / 1000;
     527:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
     52a:	89 da                	mov    %ebx,%edx
    name[1] = '0' + nfiles / 1000;
     52c:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
     52f:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     534:	29 f2                	sub    %esi,%edx
     536:	89 d6                	mov    %edx,%esi
     538:	f7 ea                	imul   %edx
    name[3] = '0' + (nfiles % 100) / 10;
     53a:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
     53f:	c1 fe 1f             	sar    $0x1f,%esi
     542:	c1 fa 05             	sar    $0x5,%edx
     545:	29 f2                	sub    %esi,%edx
    name[3] = '0' + (nfiles % 100) / 10;
     547:	be 67 66 66 66       	mov    $0x66666667,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
     54c:	83 c2 30             	add    $0x30,%edx
     54f:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
     552:	f7 eb                	imul   %ebx
     554:	c1 fa 05             	sar    $0x5,%edx
     557:	29 ca                	sub    %ecx,%edx
     559:	6b fa 64             	imul   $0x64,%edx,%edi
     55c:	89 da                	mov    %ebx,%edx
     55e:	29 fa                	sub    %edi,%edx
     560:	89 d0                	mov    %edx,%eax
     562:	89 d7                	mov    %edx,%edi
     564:	f7 ee                	imul   %esi
    name[4] = '0' + (nfiles % 10);
     566:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
     568:	c1 ff 1f             	sar    $0x1f,%edi
     56b:	c1 fa 02             	sar    $0x2,%edx
     56e:	29 fa                	sub    %edi,%edx
     570:	83 c2 30             	add    $0x30,%edx
     573:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
     576:	f7 ee                	imul   %esi
     578:	c1 fa 02             	sar    $0x2,%edx
     57b:	29 ca                	sub    %ecx,%edx
     57d:	8d 04 92             	lea    (%edx,%edx,4),%eax
     580:	89 da                	mov    %ebx,%edx
     582:	01 c0                	add    %eax,%eax
    nfiles--;
     584:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
     587:	29 c2                	sub    %eax,%edx
     589:	89 d0                	mov    %edx,%eax
     58b:	83 c0 30             	add    $0x30,%eax
     58e:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
     591:	8d 45 a8             	lea    -0x58(%ebp),%eax
     594:	89 04 24             	mov    %eax,(%esp)
     597:	e8 79 37 00 00       	call   3d15 <unlink>
  while(nfiles >= 0){
     59c:	83 fb ff             	cmp    $0xffffffff,%ebx
     59f:	0f 85 63 ff ff ff    	jne    508 <fsfull+0x148>
  printf(1, "fsfull test finished\n");
     5a5:	c7 44 24 04 de 42 00 	movl   $0x42de,0x4(%esp)
     5ac:	00 
     5ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5b4:	e8 57 38 00 00       	call   3e10 <printf>
}
     5b9:	83 c4 5c             	add    $0x5c,%esp
     5bc:	5b                   	pop    %ebx
     5bd:	5e                   	pop    %esi
     5be:	5f                   	pop    %edi
     5bf:	5d                   	pop    %ebp
     5c0:	c3                   	ret    
     5c1:	eb 0d                	jmp    5d0 <bigwrite>
     5c3:	90                   	nop
     5c4:	90                   	nop
     5c5:	90                   	nop
     5c6:	90                   	nop
     5c7:	90                   	nop
     5c8:	90                   	nop
     5c9:	90                   	nop
     5ca:	90                   	nop
     5cb:	90                   	nop
     5cc:	90                   	nop
     5cd:	90                   	nop
     5ce:	90                   	nop
     5cf:	90                   	nop

000005d0 <bigwrite>:
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	56                   	push   %esi
     5d4:	53                   	push   %ebx
  unlink("bigwrite");
     5d5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
{
     5da:	83 ec 10             	sub    $0x10,%esp
  printf(1, "bigwrite test\n");
     5dd:	c7 44 24 04 f4 42 00 	movl   $0x42f4,0x4(%esp)
     5e4:	00 
     5e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5ec:	e8 1f 38 00 00       	call   3e10 <printf>
  unlink("bigwrite");
     5f1:	c7 04 24 03 43 00 00 	movl   $0x4303,(%esp)
     5f8:	e8 18 37 00 00       	call   3d15 <unlink>
     5fd:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
     600:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     607:	00 
     608:	c7 04 24 03 43 00 00 	movl   $0x4303,(%esp)
     60f:	e8 f1 36 00 00       	call   3d05 <open>
    if(fd < 0){
     614:	85 c0                	test   %eax,%eax
    fd = open("bigwrite", O_CREATE | O_RDWR);
     616:	89 c6                	mov    %eax,%esi
    if(fd < 0){
     618:	0f 88 8e 00 00 00    	js     6ac <bigwrite+0xdc>
      int cc = write(fd, buf, sz);
     61e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     622:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
     629:	00 
     62a:	89 04 24             	mov    %eax,(%esp)
     62d:	e8 b3 36 00 00       	call   3ce5 <write>
      if(cc != sz){
     632:	39 c3                	cmp    %eax,%ebx
     634:	75 55                	jne    68b <bigwrite+0xbb>
      int cc = write(fd, buf, sz);
     636:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     63a:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
     641:	00 
     642:	89 34 24             	mov    %esi,(%esp)
     645:	e8 9b 36 00 00       	call   3ce5 <write>
      if(cc != sz){
     64a:	39 d8                	cmp    %ebx,%eax
     64c:	75 3d                	jne    68b <bigwrite+0xbb>
  for(sz = 499; sz < 12*512; sz += 471){
     64e:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
     654:	89 34 24             	mov    %esi,(%esp)
     657:	e8 91 36 00 00       	call   3ced <close>
    unlink("bigwrite");
     65c:	c7 04 24 03 43 00 00 	movl   $0x4303,(%esp)
     663:	e8 ad 36 00 00       	call   3d15 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
     668:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
     66e:	75 90                	jne    600 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
     670:	c7 44 24 04 36 43 00 	movl   $0x4336,0x4(%esp)
     677:	00 
     678:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     67f:	e8 8c 37 00 00       	call   3e10 <printf>
}
     684:	83 c4 10             	add    $0x10,%esp
     687:	5b                   	pop    %ebx
     688:	5e                   	pop    %esi
     689:	5d                   	pop    %ebp
     68a:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
     68b:	89 44 24 0c          	mov    %eax,0xc(%esp)
     68f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     693:	c7 44 24 04 24 43 00 	movl   $0x4324,0x4(%esp)
     69a:	00 
     69b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6a2:	e8 69 37 00 00       	call   3e10 <printf>
        exit();
     6a7:	e8 19 36 00 00       	call   3cc5 <exit>
      printf(1, "cannot create bigwrite\n");
     6ac:	c7 44 24 04 0c 43 00 	movl   $0x430c,0x4(%esp)
     6b3:	00 
     6b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6bb:	e8 50 37 00 00       	call   3e10 <printf>
      exit();
     6c0:	e8 00 36 00 00       	call   3cc5 <exit>
     6c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006d0 <unlinkread>:
{
     6d0:	55                   	push   %ebp
     6d1:	89 e5                	mov    %esp,%ebp
     6d3:	56                   	push   %esi
     6d4:	53                   	push   %ebx
     6d5:	83 ec 10             	sub    $0x10,%esp
  printf(1, "unlinkread test\n");
     6d8:	c7 44 24 04 43 43 00 	movl   $0x4343,0x4(%esp)
     6df:	00 
     6e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6e7:	e8 24 37 00 00       	call   3e10 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
     6ec:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     6f3:	00 
     6f4:	c7 04 24 54 43 00 00 	movl   $0x4354,(%esp)
     6fb:	e8 05 36 00 00       	call   3d05 <open>
  if(fd < 0){
     700:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_CREATE | O_RDWR);
     702:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
     704:	0f 88 fe 00 00 00    	js     808 <unlinkread+0x138>
  write(fd, "hello", 5);
     70a:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
     711:	00 
     712:	c7 44 24 04 79 43 00 	movl   $0x4379,0x4(%esp)
     719:	00 
     71a:	89 04 24             	mov    %eax,(%esp)
     71d:	e8 c3 35 00 00       	call   3ce5 <write>
  close(fd);
     722:	89 1c 24             	mov    %ebx,(%esp)
     725:	e8 c3 35 00 00       	call   3ced <close>
  fd = open("unlinkread", O_RDWR);
     72a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     731:	00 
     732:	c7 04 24 54 43 00 00 	movl   $0x4354,(%esp)
     739:	e8 c7 35 00 00       	call   3d05 <open>
  if(fd < 0){
     73e:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_RDWR);
     740:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
     742:	0f 88 3d 01 00 00    	js     885 <unlinkread+0x1b5>
  if(unlink("unlinkread") != 0){
     748:	c7 04 24 54 43 00 00 	movl   $0x4354,(%esp)
     74f:	e8 c1 35 00 00       	call   3d15 <unlink>
     754:	85 c0                	test   %eax,%eax
     756:	0f 85 10 01 00 00    	jne    86c <unlinkread+0x19c>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
     75c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     763:	00 
     764:	c7 04 24 54 43 00 00 	movl   $0x4354,(%esp)
     76b:	e8 95 35 00 00       	call   3d05 <open>
  write(fd1, "yyy", 3);
     770:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
     777:	00 
     778:	c7 44 24 04 b1 43 00 	movl   $0x43b1,0x4(%esp)
     77f:	00 
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
     780:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
     782:	89 04 24             	mov    %eax,(%esp)
     785:	e8 5b 35 00 00       	call   3ce5 <write>
  close(fd1);
     78a:	89 34 24             	mov    %esi,(%esp)
     78d:	e8 5b 35 00 00       	call   3ced <close>
  if(read(fd, buf, sizeof(buf)) != 5){
     792:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     799:	00 
     79a:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
     7a1:	00 
     7a2:	89 1c 24             	mov    %ebx,(%esp)
     7a5:	e8 33 35 00 00       	call   3cdd <read>
     7aa:	83 f8 05             	cmp    $0x5,%eax
     7ad:	0f 85 a0 00 00 00    	jne    853 <unlinkread+0x183>
  if(buf[0] != 'h'){
     7b3:	80 3d 20 81 00 00 68 	cmpb   $0x68,0x8120
     7ba:	75 7e                	jne    83a <unlinkread+0x16a>
  if(write(fd, buf, 10) != 10){
     7bc:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     7c3:	00 
     7c4:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
     7cb:	00 
     7cc:	89 1c 24             	mov    %ebx,(%esp)
     7cf:	e8 11 35 00 00       	call   3ce5 <write>
     7d4:	83 f8 0a             	cmp    $0xa,%eax
     7d7:	75 48                	jne    821 <unlinkread+0x151>
  close(fd);
     7d9:	89 1c 24             	mov    %ebx,(%esp)
     7dc:	e8 0c 35 00 00       	call   3ced <close>
  unlink("unlinkread");
     7e1:	c7 04 24 54 43 00 00 	movl   $0x4354,(%esp)
     7e8:	e8 28 35 00 00       	call   3d15 <unlink>
  printf(1, "unlinkread ok\n");
     7ed:	c7 44 24 04 fc 43 00 	movl   $0x43fc,0x4(%esp)
     7f4:	00 
     7f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7fc:	e8 0f 36 00 00       	call   3e10 <printf>
}
     801:	83 c4 10             	add    $0x10,%esp
     804:	5b                   	pop    %ebx
     805:	5e                   	pop    %esi
     806:	5d                   	pop    %ebp
     807:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
     808:	c7 44 24 04 5f 43 00 	movl   $0x435f,0x4(%esp)
     80f:	00 
     810:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     817:	e8 f4 35 00 00       	call   3e10 <printf>
    exit();
     81c:	e8 a4 34 00 00       	call   3cc5 <exit>
    printf(1, "unlinkread write failed\n");
     821:	c7 44 24 04 e3 43 00 	movl   $0x43e3,0x4(%esp)
     828:	00 
     829:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     830:	e8 db 35 00 00       	call   3e10 <printf>
    exit();
     835:	e8 8b 34 00 00       	call   3cc5 <exit>
    printf(1, "unlinkread wrong data\n");
     83a:	c7 44 24 04 cc 43 00 	movl   $0x43cc,0x4(%esp)
     841:	00 
     842:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     849:	e8 c2 35 00 00       	call   3e10 <printf>
    exit();
     84e:	e8 72 34 00 00       	call   3cc5 <exit>
    printf(1, "unlinkread read failed");
     853:	c7 44 24 04 b5 43 00 	movl   $0x43b5,0x4(%esp)
     85a:	00 
     85b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     862:	e8 a9 35 00 00       	call   3e10 <printf>
    exit();
     867:	e8 59 34 00 00       	call   3cc5 <exit>
    printf(1, "unlink unlinkread failed\n");
     86c:	c7 44 24 04 97 43 00 	movl   $0x4397,0x4(%esp)
     873:	00 
     874:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     87b:	e8 90 35 00 00       	call   3e10 <printf>
    exit();
     880:	e8 40 34 00 00       	call   3cc5 <exit>
    printf(1, "open unlinkread failed\n");
     885:	c7 44 24 04 7f 43 00 	movl   $0x437f,0x4(%esp)
     88c:	00 
     88d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     894:	e8 77 35 00 00       	call   3e10 <printf>
    exit();
     899:	e8 27 34 00 00       	call   3cc5 <exit>
     89e:	66 90                	xchg   %ax,%ax

000008a0 <createdelete>:
{
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	57                   	push   %edi
     8a4:	56                   	push   %esi
     8a5:	53                   	push   %ebx
  printf(1, "createdelete test\n");
     8a6:	31 db                	xor    %ebx,%ebx
{
     8a8:	83 ec 4c             	sub    $0x4c,%esp
  printf(1, "createdelete test\n");
     8ab:	c7 44 24 04 0b 44 00 	movl   $0x440b,0x4(%esp)
     8b2:	00 
     8b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8ba:	e8 51 35 00 00       	call   3e10 <printf>
    pid = fork();
     8bf:	e8 f9 33 00 00       	call   3cbd <fork>
    if(pid < 0){
     8c4:	83 f8 00             	cmp    $0x0,%eax
     8c7:	0f 8c c8 01 00 00    	jl     a95 <createdelete+0x1f5>
     8cd:	8d 76 00             	lea    0x0(%esi),%esi
    if(pid == 0){
     8d0:	0f 84 e9 00 00 00    	je     9bf <createdelete+0x11f>
  for(pi = 0; pi < 4; pi++){
     8d6:	83 c3 01             	add    $0x1,%ebx
     8d9:	83 fb 04             	cmp    $0x4,%ebx
     8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     8e0:	75 dd                	jne    8bf <createdelete+0x1f>
     8e2:	8d 75 c8             	lea    -0x38(%ebp),%esi
  name[0] = name[1] = name[2] = 0;
     8e5:	31 ff                	xor    %edi,%edi
    wait();
     8e7:	e8 e1 33 00 00       	call   3ccd <wait>
     8ec:	e8 dc 33 00 00       	call   3ccd <wait>
     8f1:	e8 d7 33 00 00       	call   3ccd <wait>
     8f6:	e8 d2 33 00 00       	call   3ccd <wait>
  name[0] = name[1] = name[2] = 0;
     8fb:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
     8ff:	89 75 c0             	mov    %esi,-0x40(%ebp)
     902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < N; i++){
     908:	85 ff                	test   %edi,%edi
     90a:	bb 70 00 00 00       	mov    $0x70,%ebx
     90f:	8d 47 30             	lea    0x30(%edi),%eax
     912:	0f 94 c2             	sete   %dl
     915:	83 ff 09             	cmp    $0x9,%edi
     918:	89 d6                	mov    %edx,%esi
     91a:	88 45 c4             	mov    %al,-0x3c(%ebp)
     91d:	0f 9f c0             	setg   %al
     920:	09 c6                	or     %eax,%esi
      } else if((i >= 1 && i < N/2) && fd >= 0){
     922:	8d 47 ff             	lea    -0x1(%edi),%eax
     925:	89 45 bc             	mov    %eax,-0x44(%ebp)
      fd = open(name, 0);
     928:	8b 55 c0             	mov    -0x40(%ebp),%edx
      name[1] = '0' + i;
     92b:	0f b6 45 c4          	movzbl -0x3c(%ebp),%eax
      name[0] = 'p' + pi;
     92f:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
     932:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     939:	00 
     93a:	89 14 24             	mov    %edx,(%esp)
      name[1] = '0' + i;
     93d:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
     940:	e8 c0 33 00 00       	call   3d05 <open>
      if((i == 0 || i >= N/2) && fd < 0){
     945:	89 f2                	mov    %esi,%edx
     947:	84 d2                	test   %dl,%dl
     949:	74 08                	je     953 <createdelete+0xb3>
     94b:	85 c0                	test   %eax,%eax
     94d:	0f 88 ee 00 00 00    	js     a41 <createdelete+0x1a1>
      } else if((i >= 1 && i < N/2) && fd >= 0){
     953:	85 c0                	test   %eax,%eax
     955:	0f 89 06 01 00 00    	jns    a61 <createdelete+0x1c1>
        close(fd);
     95b:	83 c3 01             	add    $0x1,%ebx
    for(pi = 0; pi < 4; pi++){
     95e:	80 fb 74             	cmp    $0x74,%bl
     961:	75 c5                	jne    928 <createdelete+0x88>
  for(i = 0; i < N; i++){
     963:	83 c7 01             	add    $0x1,%edi
     966:	83 ff 14             	cmp    $0x14,%edi
     969:	75 9d                	jne    908 <createdelete+0x68>
     96b:	8b 75 c0             	mov    -0x40(%ebp),%esi
     96e:	bf 70 00 00 00       	mov    $0x70,%edi
     973:	89 75 c4             	mov    %esi,-0x3c(%ebp)
     976:	66 90                	xchg   %ax,%ax
  for(i = 0; i < N; i++){
     978:	8d 77 c0             	lea    -0x40(%edi),%esi
     97b:	31 db                	xor    %ebx,%ebx
      name[0] = 'p' + i;
     97d:	89 fa                	mov    %edi,%edx
      name[1] = '0' + i;
     97f:	89 f0                	mov    %esi,%eax
      name[0] = 'p' + i;
     981:	88 55 c8             	mov    %dl,-0x38(%ebp)
      unlink(name);
     984:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    for(pi = 0; pi < 4; pi++){
     987:	83 c3 01             	add    $0x1,%ebx
      name[1] = '0' + i;
     98a:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
     98d:	89 14 24             	mov    %edx,(%esp)
     990:	e8 80 33 00 00       	call   3d15 <unlink>
    for(pi = 0; pi < 4; pi++){
     995:	83 fb 04             	cmp    $0x4,%ebx
     998:	75 e3                	jne    97d <createdelete+0xdd>
     99a:	83 c7 01             	add    $0x1,%edi
  for(i = 0; i < N; i++){
     99d:	89 f8                	mov    %edi,%eax
     99f:	3c 84                	cmp    $0x84,%al
     9a1:	75 d5                	jne    978 <createdelete+0xd8>
  printf(1, "createdelete ok\n");
     9a3:	c7 44 24 04 2d 44 00 	movl   $0x442d,0x4(%esp)
     9aa:	00 
     9ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9b2:	e8 59 34 00 00       	call   3e10 <printf>
}
     9b7:	83 c4 4c             	add    $0x4c,%esp
     9ba:	5b                   	pop    %ebx
     9bb:	5e                   	pop    %esi
     9bc:	5f                   	pop    %edi
     9bd:	5d                   	pop    %ebp
     9be:	c3                   	ret    
      name[0] = 'p' + pi;
     9bf:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
     9c2:	bf 01 00 00 00       	mov    $0x1,%edi
      name[0] = 'p' + pi;
     9c7:	88 5d c8             	mov    %bl,-0x38(%ebp)
     9ca:	8d 75 c8             	lea    -0x38(%ebp),%esi
      name[2] = '\0';
     9cd:	31 db                	xor    %ebx,%ebx
     9cf:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
     9d3:	eb 0e                	jmp    9e3 <createdelete+0x143>
     9d5:	8d 76 00             	lea    0x0(%esi),%esi
      for(i = 0; i < N; i++){
     9d8:	83 ff 13             	cmp    $0x13,%edi
     9db:	7f 7f                	jg     a5c <createdelete+0x1bc>
      name[2] = '\0';
     9dd:	83 c3 01             	add    $0x1,%ebx
     9e0:	83 c7 01             	add    $0x1,%edi
        name[1] = '0' + i;
     9e3:	8d 43 30             	lea    0x30(%ebx),%eax
     9e6:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
     9e9:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     9f0:	00 
     9f1:	89 34 24             	mov    %esi,(%esp)
     9f4:	e8 0c 33 00 00       	call   3d05 <open>
        if(fd < 0){
     9f9:	85 c0                	test   %eax,%eax
     9fb:	0f 88 ad 00 00 00    	js     aae <createdelete+0x20e>
        close(fd);
     a01:	89 04 24             	mov    %eax,(%esp)
     a04:	e8 e4 32 00 00       	call   3ced <close>
        if(i > 0 && (i % 2 ) == 0){
     a09:	85 db                	test   %ebx,%ebx
     a0b:	74 d0                	je     9dd <createdelete+0x13d>
     a0d:	f6 c3 01             	test   $0x1,%bl
     a10:	75 c6                	jne    9d8 <createdelete+0x138>
          name[1] = '0' + (i / 2);
     a12:	89 d8                	mov    %ebx,%eax
     a14:	d1 f8                	sar    %eax
     a16:	83 c0 30             	add    $0x30,%eax
     a19:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
     a1c:	89 34 24             	mov    %esi,(%esp)
     a1f:	e8 f1 32 00 00       	call   3d15 <unlink>
     a24:	85 c0                	test   %eax,%eax
     a26:	79 b0                	jns    9d8 <createdelete+0x138>
            printf(1, "unlink failed\n");
     a28:	c7 44 24 04 1e 44 00 	movl   $0x441e,0x4(%esp)
     a2f:	00 
     a30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a37:	e8 d4 33 00 00       	call   3e10 <printf>
            exit();
     a3c:	e8 84 32 00 00       	call   3cc5 <exit>
     a41:	8b 75 c0             	mov    -0x40(%ebp),%esi
        printf(1, "oops createdelete %s didn't exist\n", name);
     a44:	c7 44 24 04 f4 51 00 	movl   $0x51f4,0x4(%esp)
     a4b:	00 
     a4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a53:	89 74 24 08          	mov    %esi,0x8(%esp)
     a57:	e8 b4 33 00 00       	call   3e10 <printf>
        exit();
     a5c:	e8 64 32 00 00       	call   3cc5 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
     a61:	83 7d bc 08          	cmpl   $0x8,-0x44(%ebp)
     a65:	76 0e                	jbe    a75 <createdelete+0x1d5>
        close(fd);
     a67:	89 04 24             	mov    %eax,(%esp)
     a6a:	e8 7e 32 00 00       	call   3ced <close>
     a6f:	90                   	nop
     a70:	e9 e6 fe ff ff       	jmp    95b <createdelete+0xbb>
     a75:	8b 75 c0             	mov    -0x40(%ebp),%esi
        printf(1, "oops createdelete %s did exist\n", name);
     a78:	c7 44 24 04 18 52 00 	movl   $0x5218,0x4(%esp)
     a7f:	00 
     a80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a87:	89 74 24 08          	mov    %esi,0x8(%esp)
     a8b:	e8 80 33 00 00       	call   3e10 <printf>
        exit();
     a90:	e8 30 32 00 00       	call   3cc5 <exit>
      printf(1, "fork failed\n");
     a95:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
     a9c:	00 
     a9d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     aa4:	e8 67 33 00 00       	call   3e10 <printf>
      exit();
     aa9:	e8 17 32 00 00       	call   3cc5 <exit>
          printf(1, "create failed\n");
     aae:	c7 44 24 04 95 46 00 	movl   $0x4695,0x4(%esp)
     ab5:	00 
     ab6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     abd:	e8 4e 33 00 00       	call   3e10 <printf>
          exit();
     ac2:	e8 fe 31 00 00       	call   3cc5 <exit>
     ac7:	89 f6                	mov    %esi,%esi
     ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ad0 <createtest>:
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	53                   	push   %ebx
  name[2] = '\0';
     ad4:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     ad9:	83 ec 14             	sub    $0x14,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     adc:	a1 4c 59 00 00       	mov    0x594c,%eax
     ae1:	c7 44 24 04 38 52 00 	movl   $0x5238,0x4(%esp)
     ae8:	00 
     ae9:	89 04 24             	mov    %eax,(%esp)
     aec:	e8 1f 33 00 00       	call   3e10 <printf>
  name[0] = 'a';
     af1:	c6 05 20 a1 00 00 61 	movb   $0x61,0xa120
  name[2] = '\0';
     af8:	c6 05 22 a1 00 00 00 	movb   $0x0,0xa122
     aff:	90                   	nop
    name[1] = '0' + i;
     b00:	88 1d 21 a1 00 00    	mov    %bl,0xa121
    close(fd);
     b06:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     b09:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     b10:	00 
     b11:	c7 04 24 20 a1 00 00 	movl   $0xa120,(%esp)
     b18:	e8 e8 31 00 00       	call   3d05 <open>
    close(fd);
     b1d:	89 04 24             	mov    %eax,(%esp)
     b20:	e8 c8 31 00 00       	call   3ced <close>
  for(i = 0; i < 52; i++){
     b25:	80 fb 64             	cmp    $0x64,%bl
     b28:	75 d6                	jne    b00 <createtest+0x30>
  name[0] = 'a';
     b2a:	c6 05 20 a1 00 00 61 	movb   $0x61,0xa120
  name[2] = '\0';
     b31:	bb 30 00 00 00       	mov    $0x30,%ebx
     b36:	c6 05 22 a1 00 00 00 	movb   $0x0,0xa122
     b3d:	8d 76 00             	lea    0x0(%esi),%esi
    name[1] = '0' + i;
     b40:	88 1d 21 a1 00 00    	mov    %bl,0xa121
    unlink(name);
     b46:	83 c3 01             	add    $0x1,%ebx
     b49:	c7 04 24 20 a1 00 00 	movl   $0xa120,(%esp)
     b50:	e8 c0 31 00 00       	call   3d15 <unlink>
  for(i = 0; i < 52; i++){
     b55:	80 fb 64             	cmp    $0x64,%bl
     b58:	75 e6                	jne    b40 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     b5a:	a1 4c 59 00 00       	mov    0x594c,%eax
     b5f:	c7 44 24 04 60 52 00 	movl   $0x5260,0x4(%esp)
     b66:	00 
     b67:	89 04 24             	mov    %eax,(%esp)
     b6a:	e8 a1 32 00 00       	call   3e10 <printf>
}
     b6f:	83 c4 14             	add    $0x14,%esp
     b72:	5b                   	pop    %ebx
     b73:	5d                   	pop    %ebp
     b74:	c3                   	ret    
     b75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b80 <writetest1>:
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	56                   	push   %esi
     b84:	53                   	push   %ebx
     b85:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "big files test\n");
     b88:	a1 4c 59 00 00       	mov    0x594c,%eax
     b8d:	c7 44 24 04 3e 44 00 	movl   $0x443e,0x4(%esp)
     b94:	00 
     b95:	89 04 24             	mov    %eax,(%esp)
     b98:	e8 73 32 00 00       	call   3e10 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     b9d:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     ba4:	00 
     ba5:	c7 04 24 b8 44 00 00 	movl   $0x44b8,(%esp)
     bac:	e8 54 31 00 00       	call   3d05 <open>
  if(fd < 0){
     bb1:	85 c0                	test   %eax,%eax
  fd = open("big", O_CREATE|O_RDWR);
     bb3:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     bb5:	0f 88 7a 01 00 00    	js     d35 <writetest1+0x1b5>
    exit();
     bbb:	31 db                	xor    %ebx,%ebx
     bbd:	8d 76 00             	lea    0x0(%esi),%esi
    ((int*)buf)[0] = i;
     bc0:	89 1d 20 81 00 00    	mov    %ebx,0x8120
    if(write(fd, buf, 512) != 512){
     bc6:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     bcd:	00 
     bce:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
     bd5:	00 
     bd6:	89 34 24             	mov    %esi,(%esp)
     bd9:	e8 07 31 00 00       	call   3ce5 <write>
     bde:	3d 00 02 00 00       	cmp    $0x200,%eax
     be3:	0f 85 b2 00 00 00    	jne    c9b <writetest1+0x11b>
  for(i = 0; i < MAXFILE; i++){
     be9:	83 c3 01             	add    $0x1,%ebx
     bec:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     bf2:	75 cc                	jne    bc0 <writetest1+0x40>
  close(fd);
     bf4:	89 34 24             	mov    %esi,(%esp)
     bf7:	e8 f1 30 00 00       	call   3ced <close>
  fd = open("big", O_RDONLY);
     bfc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     c03:	00 
     c04:	c7 04 24 b8 44 00 00 	movl   $0x44b8,(%esp)
     c0b:	e8 f5 30 00 00       	call   3d05 <open>
  if(fd < 0){
     c10:	85 c0                	test   %eax,%eax
  fd = open("big", O_RDONLY);
     c12:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     c14:	0f 88 01 01 00 00    	js     d1b <writetest1+0x19b>
    exit();
     c1a:	31 db                	xor    %ebx,%ebx
     c1c:	eb 1d                	jmp    c3b <writetest1+0xbb>
     c1e:	66 90                	xchg   %ax,%ax
    } else if(i != 512){
     c20:	3d 00 02 00 00       	cmp    $0x200,%eax
     c25:	0f 85 b0 00 00 00    	jne    cdb <writetest1+0x15b>
    if(((int*)buf)[0] != n){
     c2b:	a1 20 81 00 00       	mov    0x8120,%eax
     c30:	39 d8                	cmp    %ebx,%eax
     c32:	0f 85 81 00 00 00    	jne    cb9 <writetest1+0x139>
    n++;
     c38:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     c3b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     c42:	00 
     c43:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
     c4a:	00 
     c4b:	89 34 24             	mov    %esi,(%esp)
     c4e:	e8 8a 30 00 00       	call   3cdd <read>
    if(i == 0){
     c53:	85 c0                	test   %eax,%eax
     c55:	75 c9                	jne    c20 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     c57:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     c5d:	0f 84 96 00 00 00    	je     cf9 <writetest1+0x179>
  close(fd);
     c63:	89 34 24             	mov    %esi,(%esp)
     c66:	e8 82 30 00 00       	call   3ced <close>
  if(unlink("big") < 0){
     c6b:	c7 04 24 b8 44 00 00 	movl   $0x44b8,(%esp)
     c72:	e8 9e 30 00 00       	call   3d15 <unlink>
     c77:	85 c0                	test   %eax,%eax
     c79:	0f 88 d0 00 00 00    	js     d4f <writetest1+0x1cf>
  printf(stdout, "big files ok\n");
     c7f:	a1 4c 59 00 00       	mov    0x594c,%eax
     c84:	c7 44 24 04 df 44 00 	movl   $0x44df,0x4(%esp)
     c8b:	00 
     c8c:	89 04 24             	mov    %eax,(%esp)
     c8f:	e8 7c 31 00 00       	call   3e10 <printf>
}
     c94:	83 c4 10             	add    $0x10,%esp
     c97:	5b                   	pop    %ebx
     c98:	5e                   	pop    %esi
     c99:	5d                   	pop    %ebp
     c9a:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     c9b:	a1 4c 59 00 00       	mov    0x594c,%eax
     ca0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     ca4:	c7 44 24 04 68 44 00 	movl   $0x4468,0x4(%esp)
     cab:	00 
     cac:	89 04 24             	mov    %eax,(%esp)
     caf:	e8 5c 31 00 00       	call   3e10 <printf>
      exit();
     cb4:	e8 0c 30 00 00       	call   3cc5 <exit>
      printf(stdout, "read content of block %d is %d\n",
     cb9:	89 44 24 0c          	mov    %eax,0xc(%esp)
     cbd:	a1 4c 59 00 00       	mov    0x594c,%eax
     cc2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     cc6:	c7 44 24 04 88 52 00 	movl   $0x5288,0x4(%esp)
     ccd:	00 
     cce:	89 04 24             	mov    %eax,(%esp)
     cd1:	e8 3a 31 00 00       	call   3e10 <printf>
      exit();
     cd6:	e8 ea 2f 00 00       	call   3cc5 <exit>
      printf(stdout, "read failed %d\n", i);
     cdb:	89 44 24 08          	mov    %eax,0x8(%esp)
     cdf:	a1 4c 59 00 00       	mov    0x594c,%eax
     ce4:	c7 44 24 04 bc 44 00 	movl   $0x44bc,0x4(%esp)
     ceb:	00 
     cec:	89 04 24             	mov    %eax,(%esp)
     cef:	e8 1c 31 00 00       	call   3e10 <printf>
      exit();
     cf4:	e8 cc 2f 00 00       	call   3cc5 <exit>
        printf(stdout, "read only %d blocks from big", n);
     cf9:	a1 4c 59 00 00       	mov    0x594c,%eax
     cfe:	c7 44 24 08 8b 00 00 	movl   $0x8b,0x8(%esp)
     d05:	00 
     d06:	c7 44 24 04 9f 44 00 	movl   $0x449f,0x4(%esp)
     d0d:	00 
     d0e:	89 04 24             	mov    %eax,(%esp)
     d11:	e8 fa 30 00 00       	call   3e10 <printf>
        exit();
     d16:	e8 aa 2f 00 00       	call   3cc5 <exit>
    printf(stdout, "error: open big failed!\n");
     d1b:	a1 4c 59 00 00       	mov    0x594c,%eax
     d20:	c7 44 24 04 86 44 00 	movl   $0x4486,0x4(%esp)
     d27:	00 
     d28:	89 04 24             	mov    %eax,(%esp)
     d2b:	e8 e0 30 00 00       	call   3e10 <printf>
    exit();
     d30:	e8 90 2f 00 00       	call   3cc5 <exit>
    printf(stdout, "error: creat big failed!\n");
     d35:	a1 4c 59 00 00       	mov    0x594c,%eax
     d3a:	c7 44 24 04 4e 44 00 	movl   $0x444e,0x4(%esp)
     d41:	00 
     d42:	89 04 24             	mov    %eax,(%esp)
     d45:	e8 c6 30 00 00       	call   3e10 <printf>
    exit();
     d4a:	e8 76 2f 00 00       	call   3cc5 <exit>
    printf(stdout, "unlink big failed\n");
     d4f:	a1 4c 59 00 00       	mov    0x594c,%eax
     d54:	c7 44 24 04 cc 44 00 	movl   $0x44cc,0x4(%esp)
     d5b:	00 
     d5c:	89 04 24             	mov    %eax,(%esp)
     d5f:	e8 ac 30 00 00       	call   3e10 <printf>
    exit();
     d64:	e8 5c 2f 00 00       	call   3cc5 <exit>
     d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d70 <writetest>:
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	56                   	push   %esi
     d74:	53                   	push   %ebx
     d75:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "small file test\n");
     d78:	a1 4c 59 00 00       	mov    0x594c,%eax
     d7d:	c7 44 24 04 ed 44 00 	movl   $0x44ed,0x4(%esp)
     d84:	00 
     d85:	89 04 24             	mov    %eax,(%esp)
     d88:	e8 83 30 00 00       	call   3e10 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     d8d:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     d94:	00 
     d95:	c7 04 24 fe 44 00 00 	movl   $0x44fe,(%esp)
     d9c:	e8 64 2f 00 00       	call   3d05 <open>
  if(fd >= 0){
     da1:	85 c0                	test   %eax,%eax
  fd = open("small", O_CREATE|O_RDWR);
     da3:	89 c6                	mov    %eax,%esi
  if(fd >= 0){
     da5:	0f 88 b1 01 00 00    	js     f5c <writetest+0x1ec>
    printf(stdout, "creat small succeeded; ok\n");
     dab:	a1 4c 59 00 00       	mov    0x594c,%eax
     db0:	31 db                	xor    %ebx,%ebx
     db2:	c7 44 24 04 04 45 00 	movl   $0x4504,0x4(%esp)
     db9:	00 
     dba:	89 04 24             	mov    %eax,(%esp)
     dbd:	e8 4e 30 00 00       	call   3e10 <printf>
     dc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     dc8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     dcf:	00 
     dd0:	c7 44 24 04 3b 45 00 	movl   $0x453b,0x4(%esp)
     dd7:	00 
     dd8:	89 34 24             	mov    %esi,(%esp)
     ddb:	e8 05 2f 00 00       	call   3ce5 <write>
     de0:	83 f8 0a             	cmp    $0xa,%eax
     de3:	0f 85 e9 00 00 00    	jne    ed2 <writetest+0x162>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     de9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     df0:	00 
     df1:	c7 44 24 04 46 45 00 	movl   $0x4546,0x4(%esp)
     df8:	00 
     df9:	89 34 24             	mov    %esi,(%esp)
     dfc:	e8 e4 2e 00 00       	call   3ce5 <write>
     e01:	83 f8 0a             	cmp    $0xa,%eax
     e04:	0f 85 e6 00 00 00    	jne    ef0 <writetest+0x180>
  for(i = 0; i < 100; i++){
     e0a:	83 c3 01             	add    $0x1,%ebx
     e0d:	83 fb 64             	cmp    $0x64,%ebx
     e10:	75 b6                	jne    dc8 <writetest+0x58>
  printf(stdout, "writes ok\n");
     e12:	a1 4c 59 00 00       	mov    0x594c,%eax
     e17:	c7 44 24 04 51 45 00 	movl   $0x4551,0x4(%esp)
     e1e:	00 
     e1f:	89 04 24             	mov    %eax,(%esp)
     e22:	e8 e9 2f 00 00       	call   3e10 <printf>
  close(fd);
     e27:	89 34 24             	mov    %esi,(%esp)
     e2a:	e8 be 2e 00 00       	call   3ced <close>
  fd = open("small", O_RDONLY);
     e2f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     e36:	00 
     e37:	c7 04 24 fe 44 00 00 	movl   $0x44fe,(%esp)
     e3e:	e8 c2 2e 00 00       	call   3d05 <open>
  if(fd >= 0){
     e43:	85 c0                	test   %eax,%eax
  fd = open("small", O_RDONLY);
     e45:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     e47:	0f 88 c1 00 00 00    	js     f0e <writetest+0x19e>
    printf(stdout, "open small succeeded ok\n");
     e4d:	a1 4c 59 00 00       	mov    0x594c,%eax
     e52:	c7 44 24 04 5c 45 00 	movl   $0x455c,0x4(%esp)
     e59:	00 
     e5a:	89 04 24             	mov    %eax,(%esp)
     e5d:	e8 ae 2f 00 00       	call   3e10 <printf>
  i = read(fd, buf, 2000);
     e62:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
     e69:	00 
     e6a:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
     e71:	00 
     e72:	89 1c 24             	mov    %ebx,(%esp)
     e75:	e8 63 2e 00 00       	call   3cdd <read>
  if(i == 2000){
     e7a:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     e7f:	0f 85 a3 00 00 00    	jne    f28 <writetest+0x1b8>
    printf(stdout, "read succeeded ok\n");
     e85:	a1 4c 59 00 00       	mov    0x594c,%eax
     e8a:	c7 44 24 04 90 45 00 	movl   $0x4590,0x4(%esp)
     e91:	00 
     e92:	89 04 24             	mov    %eax,(%esp)
     e95:	e8 76 2f 00 00       	call   3e10 <printf>
  close(fd);
     e9a:	89 1c 24             	mov    %ebx,(%esp)
     e9d:	e8 4b 2e 00 00       	call   3ced <close>
  if(unlink("small") < 0){
     ea2:	c7 04 24 fe 44 00 00 	movl   $0x44fe,(%esp)
     ea9:	e8 67 2e 00 00       	call   3d15 <unlink>
     eae:	85 c0                	test   %eax,%eax
     eb0:	0f 88 8c 00 00 00    	js     f42 <writetest+0x1d2>
  printf(stdout, "small file test ok\n");
     eb6:	a1 4c 59 00 00       	mov    0x594c,%eax
     ebb:	c7 44 24 04 b8 45 00 	movl   $0x45b8,0x4(%esp)
     ec2:	00 
     ec3:	89 04 24             	mov    %eax,(%esp)
     ec6:	e8 45 2f 00 00       	call   3e10 <printf>
}
     ecb:	83 c4 10             	add    $0x10,%esp
     ece:	5b                   	pop    %ebx
     ecf:	5e                   	pop    %esi
     ed0:	5d                   	pop    %ebp
     ed1:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     ed2:	a1 4c 59 00 00       	mov    0x594c,%eax
     ed7:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     edb:	c7 44 24 04 a8 52 00 	movl   $0x52a8,0x4(%esp)
     ee2:	00 
     ee3:	89 04 24             	mov    %eax,(%esp)
     ee6:	e8 25 2f 00 00       	call   3e10 <printf>
      exit();
     eeb:	e8 d5 2d 00 00       	call   3cc5 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     ef0:	a1 4c 59 00 00       	mov    0x594c,%eax
     ef5:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     ef9:	c7 44 24 04 cc 52 00 	movl   $0x52cc,0x4(%esp)
     f00:	00 
     f01:	89 04 24             	mov    %eax,(%esp)
     f04:	e8 07 2f 00 00       	call   3e10 <printf>
      exit();
     f09:	e8 b7 2d 00 00       	call   3cc5 <exit>
    printf(stdout, "error: open small failed!\n");
     f0e:	a1 4c 59 00 00       	mov    0x594c,%eax
     f13:	c7 44 24 04 75 45 00 	movl   $0x4575,0x4(%esp)
     f1a:	00 
     f1b:	89 04 24             	mov    %eax,(%esp)
     f1e:	e8 ed 2e 00 00       	call   3e10 <printf>
    exit();
     f23:	e8 9d 2d 00 00       	call   3cc5 <exit>
    printf(stdout, "read failed\n");
     f28:	a1 4c 59 00 00       	mov    0x594c,%eax
     f2d:	c7 44 24 04 6c 43 00 	movl   $0x436c,0x4(%esp)
     f34:	00 
     f35:	89 04 24             	mov    %eax,(%esp)
     f38:	e8 d3 2e 00 00       	call   3e10 <printf>
    exit();
     f3d:	e8 83 2d 00 00       	call   3cc5 <exit>
    printf(stdout, "unlink small failed\n");
     f42:	a1 4c 59 00 00       	mov    0x594c,%eax
     f47:	c7 44 24 04 a3 45 00 	movl   $0x45a3,0x4(%esp)
     f4e:	00 
     f4f:	89 04 24             	mov    %eax,(%esp)
     f52:	e8 b9 2e 00 00       	call   3e10 <printf>
    exit();
     f57:	e8 69 2d 00 00       	call   3cc5 <exit>
    printf(stdout, "error: creat small failed!\n");
     f5c:	a1 4c 59 00 00       	mov    0x594c,%eax
     f61:	c7 44 24 04 1f 45 00 	movl   $0x451f,0x4(%esp)
     f68:	00 
     f69:	89 04 24             	mov    %eax,(%esp)
     f6c:	e8 9f 2e 00 00       	call   3e10 <printf>
    exit();
     f71:	e8 4f 2d 00 00       	call   3cc5 <exit>
     f76:	8d 76 00             	lea    0x0(%esi),%esi
     f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f80 <bigargtest>:
{
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	83 ec 18             	sub    $0x18,%esp
  unlink("bigarg-ok");
     f86:	c7 04 24 cc 45 00 00 	movl   $0x45cc,(%esp)
     f8d:	e8 83 2d 00 00       	call   3d15 <unlink>
  pid = fork();
     f92:	e8 26 2d 00 00       	call   3cbd <fork>
  if(pid == 0){
     f97:	83 f8 00             	cmp    $0x0,%eax
     f9a:	74 44                	je     fe0 <bigargtest+0x60>
     f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else if(pid < 0){
     fa0:	0f 8c d0 00 00 00    	jl     1076 <bigargtest+0xf6>
     fa6:	66 90                	xchg   %ax,%ax
  wait();
     fa8:	e8 20 2d 00 00       	call   3ccd <wait>
  fd = open("bigarg-ok", 0);
     fad:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     fb4:	00 
     fb5:	c7 04 24 cc 45 00 00 	movl   $0x45cc,(%esp)
     fbc:	e8 44 2d 00 00       	call   3d05 <open>
  if(fd < 0){
     fc1:	85 c0                	test   %eax,%eax
     fc3:	0f 88 93 00 00 00    	js     105c <bigargtest+0xdc>
  close(fd);
     fc9:	89 04 24             	mov    %eax,(%esp)
     fcc:	e8 1c 2d 00 00       	call   3ced <close>
  unlink("bigarg-ok");
     fd1:	c7 04 24 cc 45 00 00 	movl   $0x45cc,(%esp)
     fd8:	e8 38 2d 00 00       	call   3d15 <unlink>
}
     fdd:	c9                   	leave  
     fde:	c3                   	ret    
     fdf:	90                   	nop
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
     fe0:	c7 04 85 60 59 00 00 	movl   $0x52f0,0x5960(,%eax,4)
     fe7:	f0 52 00 00 
    for(i = 0; i < MAXARG-1; i++)
     feb:	83 c0 01             	add    $0x1,%eax
     fee:	83 f8 1f             	cmp    $0x1f,%eax
     ff1:	75 ed                	jne    fe0 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
     ff3:	a1 4c 59 00 00       	mov    0x594c,%eax
    args[MAXARG-1] = 0;
     ff8:	c7 05 dc 59 00 00 00 	movl   $0x0,0x59dc
     fff:	00 00 00 
    printf(stdout, "bigarg test\n");
    1002:	c7 44 24 04 d6 45 00 	movl   $0x45d6,0x4(%esp)
    1009:	00 
    100a:	89 04 24             	mov    %eax,(%esp)
    100d:	e8 fe 2d 00 00       	call   3e10 <printf>
    exec("echo", args);
    1012:	c7 44 24 04 60 59 00 	movl   $0x5960,0x4(%esp)
    1019:	00 
    101a:	c7 04 24 bb 41 00 00 	movl   $0x41bb,(%esp)
    1021:	e8 d7 2c 00 00       	call   3cfd <exec>
    printf(stdout, "bigarg test ok\n");
    1026:	a1 4c 59 00 00       	mov    0x594c,%eax
    102b:	c7 44 24 04 e3 45 00 	movl   $0x45e3,0x4(%esp)
    1032:	00 
    1033:	89 04 24             	mov    %eax,(%esp)
    1036:	e8 d5 2d 00 00       	call   3e10 <printf>
    fd = open("bigarg-ok", O_CREATE);
    103b:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1042:	00 
    1043:	c7 04 24 cc 45 00 00 	movl   $0x45cc,(%esp)
    104a:	e8 b6 2c 00 00       	call   3d05 <open>
    close(fd);
    104f:	89 04 24             	mov    %eax,(%esp)
    1052:	e8 96 2c 00 00       	call   3ced <close>
    exit();
    1057:	e8 69 2c 00 00       	call   3cc5 <exit>
    printf(stdout, "bigarg test failed!\n");
    105c:	a1 4c 59 00 00       	mov    0x594c,%eax
    1061:	c7 44 24 04 0c 46 00 	movl   $0x460c,0x4(%esp)
    1068:	00 
    1069:	89 04 24             	mov    %eax,(%esp)
    106c:	e8 9f 2d 00 00       	call   3e10 <printf>
    exit();
    1071:	e8 4f 2c 00 00       	call   3cc5 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    1076:	a1 4c 59 00 00       	mov    0x594c,%eax
    107b:	c7 44 24 04 f3 45 00 	movl   $0x45f3,0x4(%esp)
    1082:	00 
    1083:	89 04 24             	mov    %eax,(%esp)
    1086:	e8 85 2d 00 00       	call   3e10 <printf>
    exit();
    108b:	e8 35 2c 00 00       	call   3cc5 <exit>

00001090 <exectest>:
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
    1096:	a1 4c 59 00 00       	mov    0x594c,%eax
    109b:	c7 44 24 04 21 46 00 	movl   $0x4621,0x4(%esp)
    10a2:	00 
    10a3:	89 04 24             	mov    %eax,(%esp)
    10a6:	e8 65 2d 00 00       	call   3e10 <printf>
  if(exec("echo", echoargv) < 0){
    10ab:	c7 44 24 04 38 59 00 	movl   $0x5938,0x4(%esp)
    10b2:	00 
    10b3:	c7 04 24 bb 41 00 00 	movl   $0x41bb,(%esp)
    10ba:	e8 3e 2c 00 00       	call   3cfd <exec>
    10bf:	85 c0                	test   %eax,%eax
    10c1:	78 02                	js     10c5 <exectest+0x35>
}
    10c3:	c9                   	leave  
    10c4:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
    10c5:	a1 4c 59 00 00       	mov    0x594c,%eax
    10ca:	c7 44 24 04 2c 46 00 	movl   $0x462c,0x4(%esp)
    10d1:	00 
    10d2:	89 04 24             	mov    %eax,(%esp)
    10d5:	e8 36 2d 00 00       	call   3e10 <printf>
    exit();
    10da:	e8 e6 2b 00 00       	call   3cc5 <exit>
    10df:	90                   	nop

000010e0 <validatetest>:
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	56                   	push   %esi
    10e4:	53                   	push   %ebx
  printf(stdout, "validate test\n");
    10e5:	31 db                	xor    %ebx,%ebx
{
    10e7:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "validate test\n");
    10ea:	a1 4c 59 00 00       	mov    0x594c,%eax
    10ef:	c7 44 24 04 3e 46 00 	movl   $0x463e,0x4(%esp)
    10f6:	00 
    10f7:	89 04 24             	mov    %eax,(%esp)
    10fa:	e8 11 2d 00 00       	call   3e10 <printf>
    10ff:	90                   	nop
    if((pid = fork()) == 0){
    1100:	e8 b8 2b 00 00       	call   3cbd <fork>
    1105:	85 c0                	test   %eax,%eax
    1107:	89 c6                	mov    %eax,%esi
    1109:	74 79                	je     1184 <validatetest+0xa4>
    sleep(0);
    110b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1112:	e8 3e 2c 00 00       	call   3d55 <sleep>
    sleep(0);
    1117:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    111e:	e8 32 2c 00 00       	call   3d55 <sleep>
    kill(pid);
    1123:	89 34 24             	mov    %esi,(%esp)
    1126:	e8 ca 2b 00 00       	call   3cf5 <kill>
    wait();
    112b:	e8 9d 2b 00 00       	call   3ccd <wait>
    if(link("nosuchfile", (char*)p) != -1){
    1130:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1134:	c7 04 24 4d 46 00 00 	movl   $0x464d,(%esp)
    113b:	e8 e5 2b 00 00       	call   3d25 <link>
    1140:	83 f8 ff             	cmp    $0xffffffff,%eax
    1143:	75 2a                	jne    116f <validatetest+0x8f>
  for(p = 0; p <= (uint)hi; p += 4096){
    1145:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    114b:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    1151:	75 ad                	jne    1100 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    1153:	a1 4c 59 00 00       	mov    0x594c,%eax
    1158:	c7 44 24 04 71 46 00 	movl   $0x4671,0x4(%esp)
    115f:	00 
    1160:	89 04 24             	mov    %eax,(%esp)
    1163:	e8 a8 2c 00 00       	call   3e10 <printf>
}
    1168:	83 c4 10             	add    $0x10,%esp
    116b:	5b                   	pop    %ebx
    116c:	5e                   	pop    %esi
    116d:	5d                   	pop    %ebp
    116e:	c3                   	ret    
      printf(stdout, "link should not succeed\n");
    116f:	a1 4c 59 00 00       	mov    0x594c,%eax
    1174:	c7 44 24 04 58 46 00 	movl   $0x4658,0x4(%esp)
    117b:	00 
    117c:	89 04 24             	mov    %eax,(%esp)
    117f:	e8 8c 2c 00 00       	call   3e10 <printf>
      exit();
    1184:	e8 3c 2b 00 00       	call   3cc5 <exit>
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001190 <bigdir>:
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	56                   	push   %esi
    1194:	53                   	push   %ebx
    1195:	83 ec 20             	sub    $0x20,%esp
  printf(1, "bigdir test\n");
    1198:	c7 44 24 04 7e 46 00 	movl   $0x467e,0x4(%esp)
    119f:	00 
    11a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11a7:	e8 64 2c 00 00       	call   3e10 <printf>
  unlink("bd");
    11ac:	c7 04 24 8b 46 00 00 	movl   $0x468b,(%esp)
    11b3:	e8 5d 2b 00 00       	call   3d15 <unlink>
  fd = open("bd", O_CREATE);
    11b8:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    11bf:	00 
    11c0:	c7 04 24 8b 46 00 00 	movl   $0x468b,(%esp)
    11c7:	e8 39 2b 00 00       	call   3d05 <open>
  if(fd < 0){
    11cc:	85 c0                	test   %eax,%eax
    11ce:	0f 88 e6 00 00 00    	js     12ba <bigdir+0x12a>
  close(fd);
    11d4:	89 04 24             	mov    %eax,(%esp)
    11d7:	31 db                	xor    %ebx,%ebx
    11d9:	e8 0f 2b 00 00       	call   3ced <close>
    11de:	8d 75 ee             	lea    -0x12(%ebp),%esi
    11e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    name[1] = '0' + (i / 64);
    11e8:	89 d8                	mov    %ebx,%eax
    11ea:	c1 f8 06             	sar    $0x6,%eax
    11ed:	83 c0 30             	add    $0x30,%eax
    11f0:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    11f3:	89 d8                	mov    %ebx,%eax
    11f5:	83 e0 3f             	and    $0x3f,%eax
    11f8:	83 c0 30             	add    $0x30,%eax
    name[0] = 'x';
    11fb:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[2] = '0' + (i % 64);
    11ff:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1202:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(link("bd", name) != 0){
    1206:	89 74 24 04          	mov    %esi,0x4(%esp)
    120a:	c7 04 24 8b 46 00 00 	movl   $0x468b,(%esp)
    1211:	e8 0f 2b 00 00       	call   3d25 <link>
    1216:	85 c0                	test   %eax,%eax
    1218:	75 6e                	jne    1288 <bigdir+0xf8>
  for(i = 0; i < 500; i++){
    121a:	83 c3 01             	add    $0x1,%ebx
    121d:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1223:	75 c3                	jne    11e8 <bigdir+0x58>
  unlink("bd");
    1225:	c7 04 24 8b 46 00 00 	movl   $0x468b,(%esp)
    122c:	66 31 db             	xor    %bx,%bx
    122f:	e8 e1 2a 00 00       	call   3d15 <unlink>
    1234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    name[1] = '0' + (i / 64);
    1238:	89 d8                	mov    %ebx,%eax
    123a:	c1 f8 06             	sar    $0x6,%eax
    123d:	83 c0 30             	add    $0x30,%eax
    1240:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1243:	89 d8                	mov    %ebx,%eax
    1245:	83 e0 3f             	and    $0x3f,%eax
    1248:	83 c0 30             	add    $0x30,%eax
    name[0] = 'x';
    124b:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[2] = '0' + (i % 64);
    124f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1252:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(unlink(name) != 0){
    1256:	89 34 24             	mov    %esi,(%esp)
    1259:	e8 b7 2a 00 00       	call   3d15 <unlink>
    125e:	85 c0                	test   %eax,%eax
    1260:	75 3f                	jne    12a1 <bigdir+0x111>
  for(i = 0; i < 500; i++){
    1262:	83 c3 01             	add    $0x1,%ebx
    1265:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    126b:	75 cb                	jne    1238 <bigdir+0xa8>
  printf(1, "bigdir ok\n");
    126d:	c7 44 24 04 cd 46 00 	movl   $0x46cd,0x4(%esp)
    1274:	00 
    1275:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    127c:	e8 8f 2b 00 00       	call   3e10 <printf>
}
    1281:	83 c4 20             	add    $0x20,%esp
    1284:	5b                   	pop    %ebx
    1285:	5e                   	pop    %esi
    1286:	5d                   	pop    %ebp
    1287:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1288:	c7 44 24 04 a4 46 00 	movl   $0x46a4,0x4(%esp)
    128f:	00 
    1290:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1297:	e8 74 2b 00 00       	call   3e10 <printf>
      exit();
    129c:	e8 24 2a 00 00       	call   3cc5 <exit>
      printf(1, "bigdir unlink failed");
    12a1:	c7 44 24 04 b8 46 00 	movl   $0x46b8,0x4(%esp)
    12a8:	00 
    12a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12b0:	e8 5b 2b 00 00       	call   3e10 <printf>
      exit();
    12b5:	e8 0b 2a 00 00       	call   3cc5 <exit>
    printf(1, "bigdir create failed\n");
    12ba:	c7 44 24 04 8e 46 00 	movl   $0x468e,0x4(%esp)
    12c1:	00 
    12c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12c9:	e8 42 2b 00 00       	call   3e10 <printf>
    exit();
    12ce:	e8 f2 29 00 00       	call   3cc5 <exit>
    12d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012e0 <linkunlink>:
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	57                   	push   %edi
    12e4:	56                   	push   %esi
    12e5:	53                   	push   %ebx
    12e6:	83 ec 2c             	sub    $0x2c,%esp
  printf(1, "linkunlink test\n");
    12e9:	c7 44 24 04 d8 46 00 	movl   $0x46d8,0x4(%esp)
    12f0:	00 
    12f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12f8:	e8 13 2b 00 00       	call   3e10 <printf>
  unlink("x");
    12fd:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    1304:	e8 0c 2a 00 00       	call   3d15 <unlink>
  pid = fork();
    1309:	e8 af 29 00 00       	call   3cbd <fork>
  if(pid < 0){
    130e:	85 c0                	test   %eax,%eax
  pid = fork();
    1310:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1313:	0f 88 b8 00 00 00    	js     13d1 <linkunlink+0xf1>
  unsigned int x = (pid ? 1 : 97);
    1319:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    if((x % 3) == 0){
    131d:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
  unsigned int x = (pid ? 1 : 97);
    1322:	19 db                	sbb    %ebx,%ebx
    1324:	31 f6                	xor    %esi,%esi
    1326:	83 e3 60             	and    $0x60,%ebx
    1329:	83 c3 01             	add    $0x1,%ebx
    132c:	eb 1f                	jmp    134d <linkunlink+0x6d>
    132e:	66 90                	xchg   %ax,%ax
    } else if((x % 3) == 1){
    1330:	83 f8 01             	cmp    $0x1,%eax
    1333:	0f 84 7f 00 00 00    	je     13b8 <linkunlink+0xd8>
      unlink("x");
    1339:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    1340:	e8 d0 29 00 00       	call   3d15 <unlink>
  for(i = 0; i < 100; i++){
    1345:	83 c6 01             	add    $0x1,%esi
    1348:	83 fe 64             	cmp    $0x64,%esi
    134b:	74 3f                	je     138c <linkunlink+0xac>
    x = x * 1103515245 + 12345;
    134d:	69 db 6d 4e c6 41    	imul   $0x41c64e6d,%ebx,%ebx
    1353:	81 c3 39 30 00 00    	add    $0x3039,%ebx
    if((x % 3) == 0){
    1359:	89 d8                	mov    %ebx,%eax
    135b:	f7 e7                	mul    %edi
    135d:	89 d8                	mov    %ebx,%eax
    135f:	d1 ea                	shr    %edx
    1361:	8d 14 52             	lea    (%edx,%edx,2),%edx
    1364:	29 d0                	sub    %edx,%eax
    1366:	75 c8                	jne    1330 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1368:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    136f:	00 
  for(i = 0; i < 100; i++){
    1370:	83 c6 01             	add    $0x1,%esi
      close(open("x", O_RDWR | O_CREATE));
    1373:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    137a:	e8 86 29 00 00       	call   3d05 <open>
    137f:	89 04 24             	mov    %eax,(%esp)
    1382:	e8 66 29 00 00       	call   3ced <close>
  for(i = 0; i < 100; i++){
    1387:	83 fe 64             	cmp    $0x64,%esi
    138a:	75 c1                	jne    134d <linkunlink+0x6d>
  if(pid)
    138c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    138f:	85 c0                	test   %eax,%eax
    1391:	74 57                	je     13ea <linkunlink+0x10a>
    wait();
    1393:	e8 35 29 00 00       	call   3ccd <wait>
  printf(1, "linkunlink ok\n");
    1398:	c7 44 24 04 ed 46 00 	movl   $0x46ed,0x4(%esp)
    139f:	00 
    13a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13a7:	e8 64 2a 00 00       	call   3e10 <printf>
}
    13ac:	83 c4 2c             	add    $0x2c,%esp
    13af:	5b                   	pop    %ebx
    13b0:	5e                   	pop    %esi
    13b1:	5f                   	pop    %edi
    13b2:	5d                   	pop    %ebp
    13b3:	c3                   	ret    
    13b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      link("cat", "x");
    13b8:	c7 44 24 04 b5 4d 00 	movl   $0x4db5,0x4(%esp)
    13bf:	00 
    13c0:	c7 04 24 e9 46 00 00 	movl   $0x46e9,(%esp)
    13c7:	e8 59 29 00 00       	call   3d25 <link>
    13cc:	e9 74 ff ff ff       	jmp    1345 <linkunlink+0x65>
    printf(1, "fork failed\n");
    13d1:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
    13d8:	00 
    13d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13e0:	e8 2b 2a 00 00       	call   3e10 <printf>
    exit();
    13e5:	e8 db 28 00 00       	call   3cc5 <exit>
    exit();
    13ea:	e8 d6 28 00 00       	call   3cc5 <exit>
    13ef:	90                   	nop

000013f0 <linktest>:
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	53                   	push   %ebx
    13f4:	83 ec 14             	sub    $0x14,%esp
  printf(1, "linktest\n");
    13f7:	c7 44 24 04 fc 46 00 	movl   $0x46fc,0x4(%esp)
    13fe:	00 
    13ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1406:	e8 05 2a 00 00       	call   3e10 <printf>
  unlink("lf1");
    140b:	c7 04 24 06 47 00 00 	movl   $0x4706,(%esp)
    1412:	e8 fe 28 00 00       	call   3d15 <unlink>
  unlink("lf2");
    1417:	c7 04 24 0a 47 00 00 	movl   $0x470a,(%esp)
    141e:	e8 f2 28 00 00       	call   3d15 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    1423:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    142a:	00 
    142b:	c7 04 24 06 47 00 00 	movl   $0x4706,(%esp)
    1432:	e8 ce 28 00 00       	call   3d05 <open>
  if(fd < 0){
    1437:	85 c0                	test   %eax,%eax
  fd = open("lf1", O_CREATE|O_RDWR);
    1439:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    143b:	0f 88 26 01 00 00    	js     1567 <linktest+0x177>
  if(write(fd, "hello", 5) != 5){
    1441:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    1448:	00 
    1449:	c7 44 24 04 79 43 00 	movl   $0x4379,0x4(%esp)
    1450:	00 
    1451:	89 04 24             	mov    %eax,(%esp)
    1454:	e8 8c 28 00 00       	call   3ce5 <write>
    1459:	83 f8 05             	cmp    $0x5,%eax
    145c:	0f 85 cd 01 00 00    	jne    162f <linktest+0x23f>
  close(fd);
    1462:	89 1c 24             	mov    %ebx,(%esp)
    1465:	e8 83 28 00 00       	call   3ced <close>
  if(link("lf1", "lf2") < 0){
    146a:	c7 44 24 04 0a 47 00 	movl   $0x470a,0x4(%esp)
    1471:	00 
    1472:	c7 04 24 06 47 00 00 	movl   $0x4706,(%esp)
    1479:	e8 a7 28 00 00       	call   3d25 <link>
    147e:	85 c0                	test   %eax,%eax
    1480:	0f 88 90 01 00 00    	js     1616 <linktest+0x226>
  unlink("lf1");
    1486:	c7 04 24 06 47 00 00 	movl   $0x4706,(%esp)
    148d:	e8 83 28 00 00       	call   3d15 <unlink>
  if(open("lf1", 0) >= 0){
    1492:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1499:	00 
    149a:	c7 04 24 06 47 00 00 	movl   $0x4706,(%esp)
    14a1:	e8 5f 28 00 00       	call   3d05 <open>
    14a6:	85 c0                	test   %eax,%eax
    14a8:	0f 89 4f 01 00 00    	jns    15fd <linktest+0x20d>
  fd = open("lf2", 0);
    14ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14b5:	00 
    14b6:	c7 04 24 0a 47 00 00 	movl   $0x470a,(%esp)
    14bd:	e8 43 28 00 00       	call   3d05 <open>
  if(fd < 0){
    14c2:	85 c0                	test   %eax,%eax
  fd = open("lf2", 0);
    14c4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    14c6:	0f 88 18 01 00 00    	js     15e4 <linktest+0x1f4>
  if(read(fd, buf, sizeof(buf)) != 5){
    14cc:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    14d3:	00 
    14d4:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    14db:	00 
    14dc:	89 04 24             	mov    %eax,(%esp)
    14df:	e8 f9 27 00 00       	call   3cdd <read>
    14e4:	83 f8 05             	cmp    $0x5,%eax
    14e7:	0f 85 de 00 00 00    	jne    15cb <linktest+0x1db>
  close(fd);
    14ed:	89 1c 24             	mov    %ebx,(%esp)
    14f0:	e8 f8 27 00 00       	call   3ced <close>
  if(link("lf2", "lf2") >= 0){
    14f5:	c7 44 24 04 0a 47 00 	movl   $0x470a,0x4(%esp)
    14fc:	00 
    14fd:	c7 04 24 0a 47 00 00 	movl   $0x470a,(%esp)
    1504:	e8 1c 28 00 00       	call   3d25 <link>
    1509:	85 c0                	test   %eax,%eax
    150b:	0f 89 a1 00 00 00    	jns    15b2 <linktest+0x1c2>
  unlink("lf2");
    1511:	c7 04 24 0a 47 00 00 	movl   $0x470a,(%esp)
    1518:	e8 f8 27 00 00       	call   3d15 <unlink>
  if(link("lf2", "lf1") >= 0){
    151d:	c7 44 24 04 06 47 00 	movl   $0x4706,0x4(%esp)
    1524:	00 
    1525:	c7 04 24 0a 47 00 00 	movl   $0x470a,(%esp)
    152c:	e8 f4 27 00 00       	call   3d25 <link>
    1531:	85 c0                	test   %eax,%eax
    1533:	79 64                	jns    1599 <linktest+0x1a9>
  if(link(".", "lf1") >= 0){
    1535:	c7 44 24 04 06 47 00 	movl   $0x4706,0x4(%esp)
    153c:	00 
    153d:	c7 04 24 d2 4c 00 00 	movl   $0x4cd2,(%esp)
    1544:	e8 dc 27 00 00       	call   3d25 <link>
    1549:	85 c0                	test   %eax,%eax
    154b:	79 33                	jns    1580 <linktest+0x190>
  printf(1, "linktest ok\n");
    154d:	c7 44 24 04 a4 47 00 	movl   $0x47a4,0x4(%esp)
    1554:	00 
    1555:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    155c:	e8 af 28 00 00       	call   3e10 <printf>
}
    1561:	83 c4 14             	add    $0x14,%esp
    1564:	5b                   	pop    %ebx
    1565:	5d                   	pop    %ebp
    1566:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1567:	c7 44 24 04 0e 47 00 	movl   $0x470e,0x4(%esp)
    156e:	00 
    156f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1576:	e8 95 28 00 00       	call   3e10 <printf>
    exit();
    157b:	e8 45 27 00 00       	call   3cc5 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1580:	c7 44 24 04 88 47 00 	movl   $0x4788,0x4(%esp)
    1587:	00 
    1588:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    158f:	e8 7c 28 00 00       	call   3e10 <printf>
    exit();
    1594:	e8 2c 27 00 00       	call   3cc5 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    1599:	c7 44 24 04 f8 53 00 	movl   $0x53f8,0x4(%esp)
    15a0:	00 
    15a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15a8:	e8 63 28 00 00       	call   3e10 <printf>
    exit();
    15ad:	e8 13 27 00 00       	call   3cc5 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    15b2:	c7 44 24 04 6a 47 00 	movl   $0x476a,0x4(%esp)
    15b9:	00 
    15ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15c1:	e8 4a 28 00 00       	call   3e10 <printf>
    exit();
    15c6:	e8 fa 26 00 00       	call   3cc5 <exit>
    printf(1, "read lf2 failed\n");
    15cb:	c7 44 24 04 59 47 00 	movl   $0x4759,0x4(%esp)
    15d2:	00 
    15d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15da:	e8 31 28 00 00       	call   3e10 <printf>
    exit();
    15df:	e8 e1 26 00 00       	call   3cc5 <exit>
    printf(1, "open lf2 failed\n");
    15e4:	c7 44 24 04 48 47 00 	movl   $0x4748,0x4(%esp)
    15eb:	00 
    15ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15f3:	e8 18 28 00 00       	call   3e10 <printf>
    exit();
    15f8:	e8 c8 26 00 00       	call   3cc5 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    15fd:	c7 44 24 04 d0 53 00 	movl   $0x53d0,0x4(%esp)
    1604:	00 
    1605:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    160c:	e8 ff 27 00 00       	call   3e10 <printf>
    exit();
    1611:	e8 af 26 00 00       	call   3cc5 <exit>
    printf(1, "link lf1 lf2 failed\n");
    1616:	c7 44 24 04 33 47 00 	movl   $0x4733,0x4(%esp)
    161d:	00 
    161e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1625:	e8 e6 27 00 00       	call   3e10 <printf>
    exit();
    162a:	e8 96 26 00 00       	call   3cc5 <exit>
    printf(1, "write lf1 failed\n");
    162f:	c7 44 24 04 21 47 00 	movl   $0x4721,0x4(%esp)
    1636:	00 
    1637:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    163e:	e8 cd 27 00 00       	call   3e10 <printf>
    exit();
    1643:	e8 7d 26 00 00       	call   3cc5 <exit>
    1648:	90                   	nop
    1649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001650 <sbrktest>:
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	57                   	push   %edi
    1654:	56                   	push   %esi
  a = sbrk(0);
    1655:	31 f6                	xor    %esi,%esi
{
    1657:	53                   	push   %ebx
    1658:	83 ec 7c             	sub    $0x7c,%esp
  printf(stdout, "sbrk test\n");
    165b:	a1 4c 59 00 00       	mov    0x594c,%eax
    1660:	c7 44 24 04 b1 47 00 	movl   $0x47b1,0x4(%esp)
    1667:	00 
    1668:	89 04 24             	mov    %eax,(%esp)
    166b:	e8 a0 27 00 00       	call   3e10 <printf>
  oldbrk = sbrk(0);
    1670:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1677:	e8 d1 26 00 00       	call   3d4d <sbrk>
  a = sbrk(0);
    167c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    1683:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  a = sbrk(0);
    1686:	e8 c2 26 00 00       	call   3d4d <sbrk>
    168b:	89 c3                	mov    %eax,%ebx
    168d:	8d 76 00             	lea    0x0(%esi),%esi
    b = sbrk(1);
    1690:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1697:	e8 b1 26 00 00       	call   3d4d <sbrk>
    if(b != a){
    169c:	39 c3                	cmp    %eax,%ebx
    169e:	0f 85 8a 02 00 00    	jne    192e <sbrktest+0x2de>
  for(i = 0; i < 5000; i++){
    16a4:	83 c6 01             	add    $0x1,%esi
    *b = 1;
    16a7:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    16aa:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; i < 5000; i++){
    16ad:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    16b3:	75 db                	jne    1690 <sbrktest+0x40>
  pid = fork();
    16b5:	e8 03 26 00 00       	call   3cbd <fork>
  if(pid < 0){
    16ba:	85 c0                	test   %eax,%eax
  pid = fork();
    16bc:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    16be:	0f 88 d8 03 00 00    	js     1a9c <sbrktest+0x44c>
  c = sbrk(1);
    16c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  if(c != a + 1){
    16cb:	83 c3 01             	add    $0x1,%ebx
  c = sbrk(1);
    16ce:	e8 7a 26 00 00       	call   3d4d <sbrk>
  c = sbrk(1);
    16d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16da:	e8 6e 26 00 00       	call   3d4d <sbrk>
  if(c != a + 1){
    16df:	39 d8                	cmp    %ebx,%eax
    16e1:	0f 85 9b 03 00 00    	jne    1a82 <sbrktest+0x432>
  if(pid == 0)
    16e7:	85 f6                	test   %esi,%esi
    16e9:	0f 84 8e 03 00 00    	je     1a7d <sbrktest+0x42d>
    16ef:	90                   	nop
  wait();
    16f0:	e8 d8 25 00 00       	call   3ccd <wait>
  a = sbrk(0);
    16f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16fc:	e8 4c 26 00 00       	call   3d4d <sbrk>
    1701:	89 c3                	mov    %eax,%ebx
  p = sbrk(amt);
    1703:	b8 00 00 40 06       	mov    $0x6400000,%eax
    1708:	29 d8                	sub    %ebx,%eax
    170a:	89 04 24             	mov    %eax,(%esp)
    170d:	e8 3b 26 00 00       	call   3d4d <sbrk>
  if (p != a) {
    1712:	39 c3                	cmp    %eax,%ebx
    1714:	0f 85 4e 03 00 00    	jne    1a68 <sbrktest+0x418>
  *lastaddr = 99;
    171a:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    1721:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1728:	e8 20 26 00 00       	call   3d4d <sbrk>
  c = sbrk(-4096);
    172d:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    1734:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    1736:	e8 12 26 00 00       	call   3d4d <sbrk>
  if(c == (char*)0xffffffff){
    173b:	83 f8 ff             	cmp    $0xffffffff,%eax
    173e:	0f 84 0a 03 00 00    	je     1a4e <sbrktest+0x3fe>
  c = sbrk(0);
    1744:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    174b:	e8 fd 25 00 00       	call   3d4d <sbrk>
  if(c != a - 4096){
    1750:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    1756:	39 d0                	cmp    %edx,%eax
    1758:	0f 85 ce 02 00 00    	jne    1a2c <sbrktest+0x3dc>
  a = sbrk(0);
    175e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1765:	e8 e3 25 00 00       	call   3d4d <sbrk>
  c = sbrk(4096);
    176a:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  a = sbrk(0);
    1771:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    1773:	e8 d5 25 00 00       	call   3d4d <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    1778:	39 c3                	cmp    %eax,%ebx
  c = sbrk(4096);
    177a:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    177c:	0f 85 88 02 00 00    	jne    1a0a <sbrktest+0x3ba>
    1782:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1789:	e8 bf 25 00 00       	call   3d4d <sbrk>
    178e:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    1794:	39 d0                	cmp    %edx,%eax
    1796:	0f 85 6e 02 00 00    	jne    1a0a <sbrktest+0x3ba>
  if(*lastaddr == 99){
    179c:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    17a3:	0f 84 47 02 00 00    	je     19f0 <sbrktest+0x3a0>
  a = sbrk(0);
    17a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    exit();
    17b0:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  a = sbrk(0);
    17b5:	e8 93 25 00 00       	call   3d4d <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    17ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    17c1:	89 c6                	mov    %eax,%esi
  c = sbrk(-(sbrk(0) - oldbrk));
    17c3:	e8 85 25 00 00       	call   3d4d <sbrk>
    17c8:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    17cb:	29 c2                	sub    %eax,%edx
    17cd:	89 14 24             	mov    %edx,(%esp)
    17d0:	e8 78 25 00 00       	call   3d4d <sbrk>
  if(c != a){
    17d5:	39 c6                	cmp    %eax,%esi
    17d7:	0f 85 f1 01 00 00    	jne    19ce <sbrktest+0x37e>
    17dd:	8d 76 00             	lea    0x0(%esi),%esi
    ppid = getpid();
    17e0:	e8 60 25 00 00       	call   3d45 <getpid>
    17e5:	89 c6                	mov    %eax,%esi
    pid = fork();
    17e7:	e8 d1 24 00 00       	call   3cbd <fork>
    if(pid < 0){
    17ec:	83 f8 00             	cmp    $0x0,%eax
    17ef:	0f 8c bf 01 00 00    	jl     19b4 <sbrktest+0x364>
    if(pid == 0){
    17f5:	0f 84 8c 01 00 00    	je     1987 <sbrktest+0x337>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    17fb:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    1801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wait();
    1808:	e8 c0 24 00 00       	call   3ccd <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    180d:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    1813:	75 cb                	jne    17e0 <sbrktest+0x190>
  if(pipe(fds) != 0){
    1815:	8d 45 dc             	lea    -0x24(%ebp),%eax
    1818:	89 04 24             	mov    %eax,(%esp)
    181b:	e8 b5 24 00 00       	call   3cd5 <pipe>
    1820:	85 c0                	test   %eax,%eax
    1822:	0f 85 46 01 00 00    	jne    196e <sbrktest+0x31e>
    exit();
    1828:	31 db                	xor    %ebx,%ebx
    182a:	8d 7d b4             	lea    -0x4c(%ebp),%edi
    if((pids[i] = fork()) == 0){
    182d:	e8 8b 24 00 00       	call   3cbd <fork>
    1832:	85 c0                	test   %eax,%eax
    1834:	89 c6                	mov    %eax,%esi
    1836:	0f 84 a7 00 00 00    	je     18e3 <sbrktest+0x293>
    if(pids[i] != -1)
    183c:	83 f8 ff             	cmp    $0xffffffff,%eax
    183f:	74 1a                	je     185b <sbrktest+0x20b>
      read(fds[0], &scratch, 1);
    1841:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1844:	89 44 24 04          	mov    %eax,0x4(%esp)
    1848:	8b 45 dc             	mov    -0x24(%ebp),%eax
    184b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1852:	00 
    1853:	89 04 24             	mov    %eax,(%esp)
    1856:	e8 82 24 00 00       	call   3cdd <read>
    if((pids[i] = fork()) == 0){
    185b:	89 34 9f             	mov    %esi,(%edi,%ebx,4)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    185e:	83 c3 01             	add    $0x1,%ebx
    1861:	83 fb 0a             	cmp    $0xa,%ebx
    1864:	75 c7                	jne    182d <sbrktest+0x1dd>
  c = sbrk(4096);
    1866:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    186d:	30 db                	xor    %bl,%bl
    186f:	e8 d9 24 00 00       	call   3d4d <sbrk>
    1874:	89 c6                	mov    %eax,%esi
    if(pids[i] == -1)
    1876:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
    1879:	83 f8 ff             	cmp    $0xffffffff,%eax
    187c:	74 0d                	je     188b <sbrktest+0x23b>
    kill(pids[i]);
    187e:	89 04 24             	mov    %eax,(%esp)
    1881:	e8 6f 24 00 00       	call   3cf5 <kill>
    wait();
    1886:	e8 42 24 00 00       	call   3ccd <wait>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    188b:	83 c3 01             	add    $0x1,%ebx
    188e:	83 fb 0a             	cmp    $0xa,%ebx
    1891:	75 e3                	jne    1876 <sbrktest+0x226>
  if(c == (char*)0xffffffff){
    1893:	83 fe ff             	cmp    $0xffffffff,%esi
    1896:	0f 84 b8 00 00 00    	je     1954 <sbrktest+0x304>
  if(sbrk(0) > oldbrk)
    189c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18a3:	e8 a5 24 00 00       	call   3d4d <sbrk>
    18a8:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    18ab:	73 19                	jae    18c6 <sbrktest+0x276>
    sbrk(-(sbrk(0) - oldbrk));
    18ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18b4:	e8 94 24 00 00       	call   3d4d <sbrk>
    18b9:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    18bc:	29 c2                	sub    %eax,%edx
    18be:	89 14 24             	mov    %edx,(%esp)
    18c1:	e8 87 24 00 00       	call   3d4d <sbrk>
  printf(stdout, "sbrk test OK\n");
    18c6:	a1 4c 59 00 00       	mov    0x594c,%eax
    18cb:	c7 44 24 04 68 48 00 	movl   $0x4868,0x4(%esp)
    18d2:	00 
    18d3:	89 04 24             	mov    %eax,(%esp)
    18d6:	e8 35 25 00 00       	call   3e10 <printf>
}
    18db:	83 c4 7c             	add    $0x7c,%esp
    18de:	5b                   	pop    %ebx
    18df:	5e                   	pop    %esi
    18e0:	5f                   	pop    %edi
    18e1:	5d                   	pop    %ebp
    18e2:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    18e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18ea:	e8 5e 24 00 00       	call   3d4d <sbrk>
    18ef:	ba 00 00 40 06       	mov    $0x6400000,%edx
    18f4:	29 c2                	sub    %eax,%edx
    18f6:	89 14 24             	mov    %edx,(%esp)
    18f9:	e8 4f 24 00 00       	call   3d4d <sbrk>
      write(fds[1], "x", 1);
    18fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1901:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1908:	00 
    1909:	c7 44 24 04 b5 4d 00 	movl   $0x4db5,0x4(%esp)
    1910:	00 
    1911:	89 04 24             	mov    %eax,(%esp)
    1914:	e8 cc 23 00 00       	call   3ce5 <write>
    1919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(;;) sleep(1000);
    1920:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    1927:	e8 29 24 00 00       	call   3d55 <sleep>
    192c:	eb f2                	jmp    1920 <sbrktest+0x2d0>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    192e:	89 44 24 10          	mov    %eax,0x10(%esp)
    1932:	a1 4c 59 00 00       	mov    0x594c,%eax
    1937:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    193b:	89 74 24 08          	mov    %esi,0x8(%esp)
    193f:	c7 44 24 04 bc 47 00 	movl   $0x47bc,0x4(%esp)
    1946:	00 
    1947:	89 04 24             	mov    %eax,(%esp)
    194a:	e8 c1 24 00 00       	call   3e10 <printf>
      exit();
    194f:	e8 71 23 00 00       	call   3cc5 <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    1954:	a1 4c 59 00 00       	mov    0x594c,%eax
    1959:	c7 44 24 04 4d 48 00 	movl   $0x484d,0x4(%esp)
    1960:	00 
    1961:	89 04 24             	mov    %eax,(%esp)
    1964:	e8 a7 24 00 00       	call   3e10 <printf>
    exit();
    1969:	e8 57 23 00 00       	call   3cc5 <exit>
    printf(1, "pipe() failed\n");
    196e:	c7 44 24 04 3e 48 00 	movl   $0x483e,0x4(%esp)
    1975:	00 
    1976:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    197d:	e8 8e 24 00 00       	call   3e10 <printf>
    exit();
    1982:	e8 3e 23 00 00       	call   3cc5 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    1987:	0f be 03             	movsbl (%ebx),%eax
    198a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    198e:	c7 44 24 04 25 48 00 	movl   $0x4825,0x4(%esp)
    1995:	00 
    1996:	89 44 24 0c          	mov    %eax,0xc(%esp)
    199a:	a1 4c 59 00 00       	mov    0x594c,%eax
    199f:	89 04 24             	mov    %eax,(%esp)
    19a2:	e8 69 24 00 00       	call   3e10 <printf>
      kill(ppid);
    19a7:	89 34 24             	mov    %esi,(%esp)
    19aa:	e8 46 23 00 00       	call   3cf5 <kill>
      exit();
    19af:	e8 11 23 00 00       	call   3cc5 <exit>
      printf(stdout, "fork failed\n");
    19b4:	a1 4c 59 00 00       	mov    0x594c,%eax
    19b9:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
    19c0:	00 
    19c1:	89 04 24             	mov    %eax,(%esp)
    19c4:	e8 47 24 00 00       	call   3e10 <printf>
      exit();
    19c9:	e8 f7 22 00 00       	call   3cc5 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    19ce:	89 44 24 0c          	mov    %eax,0xc(%esp)
    19d2:	a1 4c 59 00 00       	mov    0x594c,%eax
    19d7:	89 74 24 08          	mov    %esi,0x8(%esp)
    19db:	c7 44 24 04 ec 54 00 	movl   $0x54ec,0x4(%esp)
    19e2:	00 
    19e3:	89 04 24             	mov    %eax,(%esp)
    19e6:	e8 25 24 00 00       	call   3e10 <printf>
    exit();
    19eb:	e8 d5 22 00 00       	call   3cc5 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    19f0:	a1 4c 59 00 00       	mov    0x594c,%eax
    19f5:	c7 44 24 04 bc 54 00 	movl   $0x54bc,0x4(%esp)
    19fc:	00 
    19fd:	89 04 24             	mov    %eax,(%esp)
    1a00:	e8 0b 24 00 00       	call   3e10 <printf>
    exit();
    1a05:	e8 bb 22 00 00       	call   3cc5 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    1a0a:	a1 4c 59 00 00       	mov    0x594c,%eax
    1a0f:	89 74 24 0c          	mov    %esi,0xc(%esp)
    1a13:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    1a17:	c7 44 24 04 94 54 00 	movl   $0x5494,0x4(%esp)
    1a1e:	00 
    1a1f:	89 04 24             	mov    %eax,(%esp)
    1a22:	e8 e9 23 00 00       	call   3e10 <printf>
    exit();
    1a27:	e8 99 22 00 00       	call   3cc5 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    1a2c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1a30:	a1 4c 59 00 00       	mov    0x594c,%eax
    1a35:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    1a39:	c7 44 24 04 5c 54 00 	movl   $0x545c,0x4(%esp)
    1a40:	00 
    1a41:	89 04 24             	mov    %eax,(%esp)
    1a44:	e8 c7 23 00 00       	call   3e10 <printf>
    exit();
    1a49:	e8 77 22 00 00       	call   3cc5 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    1a4e:	a1 4c 59 00 00       	mov    0x594c,%eax
    1a53:	c7 44 24 04 0a 48 00 	movl   $0x480a,0x4(%esp)
    1a5a:	00 
    1a5b:	89 04 24             	mov    %eax,(%esp)
    1a5e:	e8 ad 23 00 00       	call   3e10 <printf>
    exit();
    1a63:	e8 5d 22 00 00       	call   3cc5 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    1a68:	a1 4c 59 00 00       	mov    0x594c,%eax
    1a6d:	c7 44 24 04 1c 54 00 	movl   $0x541c,0x4(%esp)
    1a74:	00 
    1a75:	89 04 24             	mov    %eax,(%esp)
    1a78:	e8 93 23 00 00       	call   3e10 <printf>
    exit();
    1a7d:	e8 43 22 00 00       	call   3cc5 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    1a82:	a1 4c 59 00 00       	mov    0x594c,%eax
    1a87:	c7 44 24 04 ee 47 00 	movl   $0x47ee,0x4(%esp)
    1a8e:	00 
    1a8f:	89 04 24             	mov    %eax,(%esp)
    1a92:	e8 79 23 00 00       	call   3e10 <printf>
    exit();
    1a97:	e8 29 22 00 00       	call   3cc5 <exit>
    printf(stdout, "sbrk test fork failed\n");
    1a9c:	a1 4c 59 00 00       	mov    0x594c,%eax
    1aa1:	c7 44 24 04 d7 47 00 	movl   $0x47d7,0x4(%esp)
    1aa8:	00 
    1aa9:	89 04 24             	mov    %eax,(%esp)
    1aac:	e8 5f 23 00 00       	call   3e10 <printf>
    exit();
    1ab1:	e8 0f 22 00 00       	call   3cc5 <exit>
    1ab6:	8d 76 00             	lea    0x0(%esi),%esi
    1ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001ac0 <preempt>:
{
    1ac0:	55                   	push   %ebp
    1ac1:	89 e5                	mov    %esp,%ebp
    1ac3:	57                   	push   %edi
    1ac4:	56                   	push   %esi
    1ac5:	53                   	push   %ebx
    1ac6:	83 ec 2c             	sub    $0x2c,%esp
  printf(1, "preempt: ");
    1ac9:	c7 44 24 04 76 48 00 	movl   $0x4876,0x4(%esp)
    1ad0:	00 
    1ad1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ad8:	e8 33 23 00 00       	call   3e10 <printf>
  pid1 = fork();
    1add:	e8 db 21 00 00       	call   3cbd <fork>
  if(pid1 == 0)
    1ae2:	85 c0                	test   %eax,%eax
  pid1 = fork();
    1ae4:	89 c7                	mov    %eax,%edi
  if(pid1 == 0)
    1ae6:	75 02                	jne    1aea <preempt+0x2a>
    1ae8:	eb fe                	jmp    1ae8 <preempt+0x28>
    1aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pid2 = fork();
    1af0:	e8 c8 21 00 00       	call   3cbd <fork>
  if(pid2 == 0)
    1af5:	85 c0                	test   %eax,%eax
  pid2 = fork();
    1af7:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
    1af9:	75 02                	jne    1afd <preempt+0x3d>
    1afb:	eb fe                	jmp    1afb <preempt+0x3b>
  pipe(pfds);
    1afd:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1b00:	89 04 24             	mov    %eax,(%esp)
    1b03:	e8 cd 21 00 00       	call   3cd5 <pipe>
  pid3 = fork();
    1b08:	e8 b0 21 00 00       	call   3cbd <fork>
  if(pid3 == 0){
    1b0d:	85 c0                	test   %eax,%eax
  pid3 = fork();
    1b0f:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
    1b11:	75 4c                	jne    1b5f <preempt+0x9f>
    close(pfds[0]);
    1b13:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b16:	89 04 24             	mov    %eax,(%esp)
    1b19:	e8 cf 21 00 00       	call   3ced <close>
    if(write(pfds[1], "x", 1) != 1)
    1b1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1b28:	00 
    1b29:	c7 44 24 04 b5 4d 00 	movl   $0x4db5,0x4(%esp)
    1b30:	00 
    1b31:	89 04 24             	mov    %eax,(%esp)
    1b34:	e8 ac 21 00 00       	call   3ce5 <write>
    1b39:	83 f8 01             	cmp    $0x1,%eax
    1b3c:	74 14                	je     1b52 <preempt+0x92>
      printf(1, "preempt write error");
    1b3e:	c7 44 24 04 80 48 00 	movl   $0x4880,0x4(%esp)
    1b45:	00 
    1b46:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b4d:	e8 be 22 00 00       	call   3e10 <printf>
    close(pfds[1]);
    1b52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b55:	89 04 24             	mov    %eax,(%esp)
    1b58:	e8 90 21 00 00       	call   3ced <close>
    1b5d:	eb fe                	jmp    1b5d <preempt+0x9d>
  close(pfds[1]);
    1b5f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b62:	89 04 24             	mov    %eax,(%esp)
    1b65:	e8 83 21 00 00       	call   3ced <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    1b6a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b6d:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1b74:	00 
    1b75:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    1b7c:	00 
    1b7d:	89 04 24             	mov    %eax,(%esp)
    1b80:	e8 58 21 00 00       	call   3cdd <read>
    1b85:	83 f8 01             	cmp    $0x1,%eax
    1b88:	74 1c                	je     1ba6 <preempt+0xe6>
    printf(1, "preempt read error");
    1b8a:	c7 44 24 04 94 48 00 	movl   $0x4894,0x4(%esp)
    1b91:	00 
    1b92:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b99:	e8 72 22 00 00       	call   3e10 <printf>
}
    1b9e:	83 c4 2c             	add    $0x2c,%esp
    1ba1:	5b                   	pop    %ebx
    1ba2:	5e                   	pop    %esi
    1ba3:	5f                   	pop    %edi
    1ba4:	5d                   	pop    %ebp
    1ba5:	c3                   	ret    
  close(pfds[0]);
    1ba6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ba9:	89 04 24             	mov    %eax,(%esp)
    1bac:	e8 3c 21 00 00       	call   3ced <close>
  printf(1, "kill... ");
    1bb1:	c7 44 24 04 a7 48 00 	movl   $0x48a7,0x4(%esp)
    1bb8:	00 
    1bb9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bc0:	e8 4b 22 00 00       	call   3e10 <printf>
  kill(pid1);
    1bc5:	89 3c 24             	mov    %edi,(%esp)
    1bc8:	e8 28 21 00 00       	call   3cf5 <kill>
  kill(pid2);
    1bcd:	89 34 24             	mov    %esi,(%esp)
    1bd0:	e8 20 21 00 00       	call   3cf5 <kill>
  kill(pid3);
    1bd5:	89 1c 24             	mov    %ebx,(%esp)
    1bd8:	e8 18 21 00 00       	call   3cf5 <kill>
  printf(1, "wait... ");
    1bdd:	c7 44 24 04 b0 48 00 	movl   $0x48b0,0x4(%esp)
    1be4:	00 
    1be5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bec:	e8 1f 22 00 00       	call   3e10 <printf>
  wait();
    1bf1:	e8 d7 20 00 00       	call   3ccd <wait>
  wait();
    1bf6:	e8 d2 20 00 00       	call   3ccd <wait>
    1bfb:	90                   	nop
    1bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  wait();
    1c00:	e8 c8 20 00 00       	call   3ccd <wait>
  printf(1, "preempt ok\n");
    1c05:	c7 44 24 04 b9 48 00 	movl   $0x48b9,0x4(%esp)
    1c0c:	00 
    1c0d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c14:	e8 f7 21 00 00       	call   3e10 <printf>
    1c19:	eb 83                	jmp    1b9e <preempt+0xde>
    1c1b:	90                   	nop
    1c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001c20 <pipe1>:
{
    1c20:	55                   	push   %ebp
    1c21:	89 e5                	mov    %esp,%ebp
    1c23:	57                   	push   %edi
    1c24:	56                   	push   %esi
    1c25:	53                   	push   %ebx
    1c26:	83 ec 2c             	sub    $0x2c,%esp
  if(pipe(fds) != 0){
    1c29:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1c2c:	89 04 24             	mov    %eax,(%esp)
    1c2f:	e8 a1 20 00 00       	call   3cd5 <pipe>
    1c34:	85 c0                	test   %eax,%eax
    1c36:	0f 85 44 01 00 00    	jne    1d80 <pipe1+0x160>
  pid = fork();
    1c3c:	e8 7c 20 00 00       	call   3cbd <fork>
  if(pid == 0){
    1c41:	83 f8 00             	cmp    $0x0,%eax
    1c44:	0f 84 88 00 00 00    	je     1cd2 <pipe1+0xb2>
    1c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  } else if(pid > 0){
    1c50:	0f 8e 43 01 00 00    	jle    1d99 <pipe1+0x179>
    close(fds[1]);
    1c56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1c59:	31 ff                	xor    %edi,%edi
    1c5b:	be 01 00 00 00       	mov    $0x1,%esi
    1c60:	31 db                	xor    %ebx,%ebx
    1c62:	89 04 24             	mov    %eax,(%esp)
    1c65:	e8 83 20 00 00       	call   3ced <close>
    while((n = read(fds[0], buf, cc)) > 0){
    1c6a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1c6d:	89 74 24 08          	mov    %esi,0x8(%esp)
    1c71:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    1c78:	00 
    1c79:	89 04 24             	mov    %eax,(%esp)
    1c7c:	e8 5c 20 00 00       	call   3cdd <read>
    1c81:	85 c0                	test   %eax,%eax
    1c83:	0f 8e ac 00 00 00    	jle    1d35 <pipe1+0x115>
    1c89:	31 d2                	xor    %edx,%edx
    1c8b:	90                   	nop
    1c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1c90:	38 9a 20 81 00 00    	cmp    %bl,0x8120(%edx)
    1c96:	75 1e                	jne    1cb6 <pipe1+0x96>
      for(i = 0; i < n; i++){
    1c98:	83 c2 01             	add    $0x1,%edx
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1c9b:	83 c3 01             	add    $0x1,%ebx
      for(i = 0; i < n; i++){
    1c9e:	39 d0                	cmp    %edx,%eax
    1ca0:	7f ee                	jg     1c90 <pipe1+0x70>
      cc = cc * 2;
    1ca2:	01 f6                	add    %esi,%esi
      if(cc > sizeof(buf))
    1ca4:	ba 00 20 00 00       	mov    $0x2000,%edx
    1ca9:	81 fe 01 20 00 00    	cmp    $0x2001,%esi
    1caf:	0f 43 f2             	cmovae %edx,%esi
      total += n;
    1cb2:	01 c7                	add    %eax,%edi
    1cb4:	eb b4                	jmp    1c6a <pipe1+0x4a>
          printf(1, "pipe1 oops 2\n");
    1cb6:	c7 44 24 04 d3 48 00 	movl   $0x48d3,0x4(%esp)
    1cbd:	00 
    1cbe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cc5:	e8 46 21 00 00       	call   3e10 <printf>
}
    1cca:	83 c4 2c             	add    $0x2c,%esp
    1ccd:	5b                   	pop    %ebx
    1cce:	5e                   	pop    %esi
    1ccf:	5f                   	pop    %edi
    1cd0:	5d                   	pop    %ebp
    1cd1:	c3                   	ret    
    close(fds[0]);
    1cd2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1cd5:	31 db                	xor    %ebx,%ebx
    1cd7:	89 04 24             	mov    %eax,(%esp)
    1cda:	e8 0e 20 00 00       	call   3ced <close>
    for(n = 0; n < 5; n++){
    1cdf:	31 c0                	xor    %eax,%eax
    1ce1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buf[i] = seq++;
    1ce8:	8d 14 18             	lea    (%eax,%ebx,1),%edx
    1ceb:	88 90 20 81 00 00    	mov    %dl,0x8120(%eax)
      for(i = 0; i < 1033; i++)
    1cf1:	83 c0 01             	add    $0x1,%eax
    1cf4:	3d 09 04 00 00       	cmp    $0x409,%eax
    1cf9:	75 ed                	jne    1ce8 <pipe1+0xc8>
      if(write(fds[1], buf, 1033) != 1033){
    1cfb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      for(i = 0; i < 1033; i++)
    1cfe:	81 c3 09 04 00 00    	add    $0x409,%ebx
      if(write(fds[1], buf, 1033) != 1033){
    1d04:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
    1d0b:	00 
    1d0c:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    1d13:	00 
    1d14:	89 04 24             	mov    %eax,(%esp)
    1d17:	e8 c9 1f 00 00       	call   3ce5 <write>
    1d1c:	3d 09 04 00 00       	cmp    $0x409,%eax
    1d21:	0f 85 8b 00 00 00    	jne    1db2 <pipe1+0x192>
    for(n = 0; n < 5; n++){
    1d27:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
    1d2d:	75 b0                	jne    1cdf <pipe1+0xbf>
    1d2f:	90                   	nop
      exit();
    1d30:	e8 90 1f 00 00       	call   3cc5 <exit>
    if(total != 5 * 1033){
    1d35:	81 ff 2d 14 00 00    	cmp    $0x142d,%edi
    1d3b:	75 29                	jne    1d66 <pipe1+0x146>
    close(fds[0]);
    1d3d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1d40:	89 04 24             	mov    %eax,(%esp)
    1d43:	e8 a5 1f 00 00       	call   3ced <close>
    wait();
    1d48:	e8 80 1f 00 00       	call   3ccd <wait>
  printf(1, "pipe1 ok\n");
    1d4d:	c7 44 24 04 f8 48 00 	movl   $0x48f8,0x4(%esp)
    1d54:	00 
    1d55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d5c:	e8 af 20 00 00       	call   3e10 <printf>
    1d61:	e9 64 ff ff ff       	jmp    1cca <pipe1+0xaa>
      printf(1, "pipe1 oops 3 total %d\n", total);
    1d66:	89 7c 24 08          	mov    %edi,0x8(%esp)
    1d6a:	c7 44 24 04 e1 48 00 	movl   $0x48e1,0x4(%esp)
    1d71:	00 
    1d72:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d79:	e8 92 20 00 00       	call   3e10 <printf>
    1d7e:	eb af                	jmp    1d2f <pipe1+0x10f>
    printf(1, "pipe() failed\n");
    1d80:	c7 44 24 04 3e 48 00 	movl   $0x483e,0x4(%esp)
    1d87:	00 
    1d88:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d8f:	e8 7c 20 00 00       	call   3e10 <printf>
    exit();
    1d94:	e8 2c 1f 00 00       	call   3cc5 <exit>
    printf(1, "fork() failed\n");
    1d99:	c7 44 24 04 02 49 00 	movl   $0x4902,0x4(%esp)
    1da0:	00 
    1da1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1da8:	e8 63 20 00 00       	call   3e10 <printf>
    exit();
    1dad:	e8 13 1f 00 00       	call   3cc5 <exit>
        printf(1, "pipe1 oops 1\n");
    1db2:	c7 44 24 04 c5 48 00 	movl   $0x48c5,0x4(%esp)
    1db9:	00 
    1dba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1dc1:	e8 4a 20 00 00       	call   3e10 <printf>
        exit();
    1dc6:	e8 fa 1e 00 00       	call   3cc5 <exit>
    1dcb:	90                   	nop
    1dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001dd0 <fourteen>:
{
    1dd0:	55                   	push   %ebp
    1dd1:	89 e5                	mov    %esp,%ebp
    1dd3:	83 ec 18             	sub    $0x18,%esp
  printf(1, "fourteen test\n");
    1dd6:	c7 44 24 04 11 49 00 	movl   $0x4911,0x4(%esp)
    1ddd:	00 
    1dde:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1de5:	e8 26 20 00 00       	call   3e10 <printf>
  if(mkdir("12345678901234") != 0){
    1dea:	c7 04 24 4c 49 00 00 	movl   $0x494c,(%esp)
    1df1:	e8 37 1f 00 00       	call   3d2d <mkdir>
    1df6:	85 c0                	test   %eax,%eax
    1df8:	0f 85 92 00 00 00    	jne    1e90 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    1dfe:	c7 04 24 10 55 00 00 	movl   $0x5510,(%esp)
    1e05:	e8 23 1f 00 00       	call   3d2d <mkdir>
    1e0a:	85 c0                	test   %eax,%eax
    1e0c:	0f 85 fb 00 00 00    	jne    1f0d <fourteen+0x13d>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    1e12:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1e19:	00 
    1e1a:	c7 04 24 60 55 00 00 	movl   $0x5560,(%esp)
    1e21:	e8 df 1e 00 00       	call   3d05 <open>
  if(fd < 0){
    1e26:	85 c0                	test   %eax,%eax
    1e28:	0f 88 c6 00 00 00    	js     1ef4 <fourteen+0x124>
  close(fd);
    1e2e:	89 04 24             	mov    %eax,(%esp)
    1e31:	e8 b7 1e 00 00       	call   3ced <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    1e36:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e3d:	00 
    1e3e:	c7 04 24 d0 55 00 00 	movl   $0x55d0,(%esp)
    1e45:	e8 bb 1e 00 00       	call   3d05 <open>
  if(fd < 0){
    1e4a:	85 c0                	test   %eax,%eax
    1e4c:	0f 88 89 00 00 00    	js     1edb <fourteen+0x10b>
  close(fd);
    1e52:	89 04 24             	mov    %eax,(%esp)
    1e55:	e8 93 1e 00 00       	call   3ced <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    1e5a:	c7 04 24 3d 49 00 00 	movl   $0x493d,(%esp)
    1e61:	e8 c7 1e 00 00       	call   3d2d <mkdir>
    1e66:	85 c0                	test   %eax,%eax
    1e68:	74 58                	je     1ec2 <fourteen+0xf2>
  if(mkdir("123456789012345/12345678901234") == 0){
    1e6a:	c7 04 24 6c 56 00 00 	movl   $0x566c,(%esp)
    1e71:	e8 b7 1e 00 00       	call   3d2d <mkdir>
    1e76:	85 c0                	test   %eax,%eax
    1e78:	74 2f                	je     1ea9 <fourteen+0xd9>
  printf(1, "fourteen ok\n");
    1e7a:	c7 44 24 04 5b 49 00 	movl   $0x495b,0x4(%esp)
    1e81:	00 
    1e82:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e89:	e8 82 1f 00 00       	call   3e10 <printf>
}
    1e8e:	c9                   	leave  
    1e8f:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    1e90:	c7 44 24 04 20 49 00 	movl   $0x4920,0x4(%esp)
    1e97:	00 
    1e98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e9f:	e8 6c 1f 00 00       	call   3e10 <printf>
    exit();
    1ea4:	e8 1c 1e 00 00       	call   3cc5 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    1ea9:	c7 44 24 04 8c 56 00 	movl   $0x568c,0x4(%esp)
    1eb0:	00 
    1eb1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1eb8:	e8 53 1f 00 00       	call   3e10 <printf>
    exit();
    1ebd:	e8 03 1e 00 00       	call   3cc5 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    1ec2:	c7 44 24 04 3c 56 00 	movl   $0x563c,0x4(%esp)
    1ec9:	00 
    1eca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ed1:	e8 3a 1f 00 00       	call   3e10 <printf>
    exit();
    1ed6:	e8 ea 1d 00 00       	call   3cc5 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    1edb:	c7 44 24 04 00 56 00 	movl   $0x5600,0x4(%esp)
    1ee2:	00 
    1ee3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1eea:	e8 21 1f 00 00       	call   3e10 <printf>
    exit();
    1eef:	e8 d1 1d 00 00       	call   3cc5 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    1ef4:	c7 44 24 04 90 55 00 	movl   $0x5590,0x4(%esp)
    1efb:	00 
    1efc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f03:	e8 08 1f 00 00       	call   3e10 <printf>
    exit();
    1f08:	e8 b8 1d 00 00       	call   3cc5 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    1f0d:	c7 44 24 04 30 55 00 	movl   $0x5530,0x4(%esp)
    1f14:	00 
    1f15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f1c:	e8 ef 1e 00 00       	call   3e10 <printf>
    exit();
    1f21:	e8 9f 1d 00 00       	call   3cc5 <exit>
    1f26:	8d 76 00             	lea    0x0(%esi),%esi
    1f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001f30 <openiputtest>:
{
    1f30:	55                   	push   %ebp
    1f31:	89 e5                	mov    %esp,%ebp
    1f33:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "openiput test\n");
    1f36:	a1 4c 59 00 00       	mov    0x594c,%eax
    1f3b:	c7 44 24 04 68 49 00 	movl   $0x4968,0x4(%esp)
    1f42:	00 
    1f43:	89 04 24             	mov    %eax,(%esp)
    1f46:	e8 c5 1e 00 00       	call   3e10 <printf>
  if(mkdir("oidir") < 0){
    1f4b:	c7 04 24 77 49 00 00 	movl   $0x4977,(%esp)
    1f52:	e8 d6 1d 00 00       	call   3d2d <mkdir>
    1f57:	85 c0                	test   %eax,%eax
    1f59:	0f 88 9e 00 00 00    	js     1ffd <openiputtest+0xcd>
  pid = fork();
    1f5f:	e8 59 1d 00 00       	call   3cbd <fork>
  if(pid < 0){
    1f64:	83 f8 00             	cmp    $0x0,%eax
    1f67:	0f 8c aa 00 00 00    	jl     2017 <openiputtest+0xe7>
    1f6d:	8d 76 00             	lea    0x0(%esi),%esi
  if(pid == 0){
    1f70:	75 36                	jne    1fa8 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
    1f72:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1f79:	00 
    1f7a:	c7 04 24 77 49 00 00 	movl   $0x4977,(%esp)
    1f81:	e8 7f 1d 00 00       	call   3d05 <open>
    if(fd >= 0){
    1f86:	85 c0                	test   %eax,%eax
    1f88:	78 6e                	js     1ff8 <openiputtest+0xc8>
      printf(stdout, "open directory for write succeeded\n");
    1f8a:	a1 4c 59 00 00       	mov    0x594c,%eax
    1f8f:	c7 44 24 04 c0 56 00 	movl   $0x56c0,0x4(%esp)
    1f96:	00 
    1f97:	89 04 24             	mov    %eax,(%esp)
    1f9a:	e8 71 1e 00 00       	call   3e10 <printf>
      exit();
    1f9f:	e8 21 1d 00 00       	call   3cc5 <exit>
    1fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  sleep(1);
    1fa8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1faf:	e8 a1 1d 00 00       	call   3d55 <sleep>
  if(unlink("oidir") != 0){
    1fb4:	c7 04 24 77 49 00 00 	movl   $0x4977,(%esp)
    1fbb:	e8 55 1d 00 00       	call   3d15 <unlink>
    1fc0:	85 c0                	test   %eax,%eax
    1fc2:	75 1c                	jne    1fe0 <openiputtest+0xb0>
  wait();
    1fc4:	e8 04 1d 00 00       	call   3ccd <wait>
  printf(stdout, "openiput test ok\n");
    1fc9:	a1 4c 59 00 00       	mov    0x594c,%eax
    1fce:	c7 44 24 04 91 49 00 	movl   $0x4991,0x4(%esp)
    1fd5:	00 
    1fd6:	89 04 24             	mov    %eax,(%esp)
    1fd9:	e8 32 1e 00 00       	call   3e10 <printf>
}
    1fde:	c9                   	leave  
    1fdf:	c3                   	ret    
    printf(stdout, "unlink failed\n");
    1fe0:	a1 4c 59 00 00       	mov    0x594c,%eax
    1fe5:	c7 44 24 04 1e 44 00 	movl   $0x441e,0x4(%esp)
    1fec:	00 
    1fed:	89 04 24             	mov    %eax,(%esp)
    1ff0:	e8 1b 1e 00 00       	call   3e10 <printf>
    1ff5:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
    1ff8:	e8 c8 1c 00 00       	call   3cc5 <exit>
    printf(stdout, "mkdir oidir failed\n");
    1ffd:	a1 4c 59 00 00       	mov    0x594c,%eax
    2002:	c7 44 24 04 7d 49 00 	movl   $0x497d,0x4(%esp)
    2009:	00 
    200a:	89 04 24             	mov    %eax,(%esp)
    200d:	e8 fe 1d 00 00       	call   3e10 <printf>
    exit();
    2012:	e8 ae 1c 00 00       	call   3cc5 <exit>
    printf(stdout, "fork failed\n");
    2017:	a1 4c 59 00 00       	mov    0x594c,%eax
    201c:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
    2023:	00 
    2024:	89 04 24             	mov    %eax,(%esp)
    2027:	e8 e4 1d 00 00       	call   3e10 <printf>
    exit();
    202c:	e8 94 1c 00 00       	call   3cc5 <exit>
    2031:	eb 0d                	jmp    2040 <iref>
    2033:	90                   	nop
    2034:	90                   	nop
    2035:	90                   	nop
    2036:	90                   	nop
    2037:	90                   	nop
    2038:	90                   	nop
    2039:	90                   	nop
    203a:	90                   	nop
    203b:	90                   	nop
    203c:	90                   	nop
    203d:	90                   	nop
    203e:	90                   	nop
    203f:	90                   	nop

00002040 <iref>:
{
    2040:	55                   	push   %ebp
    2041:	89 e5                	mov    %esp,%ebp
    2043:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2044:	31 db                	xor    %ebx,%ebx
{
    2046:	83 ec 14             	sub    $0x14,%esp
  printf(1, "empty file name\n");
    2049:	c7 44 24 04 a3 49 00 	movl   $0x49a3,0x4(%esp)
    2050:	00 
    2051:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2058:	e8 b3 1d 00 00       	call   3e10 <printf>
    205d:	8d 76 00             	lea    0x0(%esi),%esi
    if(mkdir("irefd") != 0){
    2060:	c7 04 24 b4 49 00 00 	movl   $0x49b4,(%esp)
    2067:	e8 c1 1c 00 00       	call   3d2d <mkdir>
    206c:	85 c0                	test   %eax,%eax
    206e:	0f 85 b2 00 00 00    	jne    2126 <iref+0xe6>
    if(chdir("irefd") != 0){
    2074:	c7 04 24 b4 49 00 00 	movl   $0x49b4,(%esp)
    207b:	e8 b5 1c 00 00       	call   3d35 <chdir>
    2080:	85 c0                	test   %eax,%eax
    2082:	0f 85 b7 00 00 00    	jne    213f <iref+0xff>
    mkdir("");
    2088:	c7 04 24 6d 51 00 00 	movl   $0x516d,(%esp)
    208f:	e8 99 1c 00 00       	call   3d2d <mkdir>
    link("README", "");
    2094:	c7 44 24 04 6d 51 00 	movl   $0x516d,0x4(%esp)
    209b:	00 
    209c:	c7 04 24 e2 49 00 00 	movl   $0x49e2,(%esp)
    20a3:	e8 7d 1c 00 00       	call   3d25 <link>
    fd = open("", O_CREATE);
    20a8:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    20af:	00 
    20b0:	c7 04 24 6d 51 00 00 	movl   $0x516d,(%esp)
    20b7:	e8 49 1c 00 00       	call   3d05 <open>
    if(fd >= 0)
    20bc:	85 c0                	test   %eax,%eax
    20be:	78 08                	js     20c8 <iref+0x88>
      close(fd);
    20c0:	89 04 24             	mov    %eax,(%esp)
    20c3:	e8 25 1c 00 00       	call   3ced <close>
    fd = open("xx", O_CREATE);
    20c8:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    20cf:	00 
    20d0:	c7 04 24 b4 4d 00 00 	movl   $0x4db4,(%esp)
    20d7:	e8 29 1c 00 00       	call   3d05 <open>
    if(fd >= 0)
    20dc:	85 c0                	test   %eax,%eax
    20de:	78 08                	js     20e8 <iref+0xa8>
      close(fd);
    20e0:	89 04 24             	mov    %eax,(%esp)
    20e3:	e8 05 1c 00 00       	call   3ced <close>
  for(i = 0; i < 50 + 1; i++){
    20e8:	83 c3 01             	add    $0x1,%ebx
    unlink("xx");
    20eb:	c7 04 24 b4 4d 00 00 	movl   $0x4db4,(%esp)
    20f2:	e8 1e 1c 00 00       	call   3d15 <unlink>
  for(i = 0; i < 50 + 1; i++){
    20f7:	83 fb 33             	cmp    $0x33,%ebx
    20fa:	0f 85 60 ff ff ff    	jne    2060 <iref+0x20>
  chdir("/");
    2100:	c7 04 24 e9 49 00 00 	movl   $0x49e9,(%esp)
    2107:	e8 29 1c 00 00       	call   3d35 <chdir>
  printf(1, "empty file name OK\n");
    210c:	c7 44 24 04 eb 49 00 	movl   $0x49eb,0x4(%esp)
    2113:	00 
    2114:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    211b:	e8 f0 1c 00 00       	call   3e10 <printf>
}
    2120:	83 c4 14             	add    $0x14,%esp
    2123:	5b                   	pop    %ebx
    2124:	5d                   	pop    %ebp
    2125:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2126:	c7 44 24 04 ba 49 00 	movl   $0x49ba,0x4(%esp)
    212d:	00 
    212e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2135:	e8 d6 1c 00 00       	call   3e10 <printf>
      exit();
    213a:	e8 86 1b 00 00       	call   3cc5 <exit>
      printf(1, "chdir irefd failed\n");
    213f:	c7 44 24 04 ce 49 00 	movl   $0x49ce,0x4(%esp)
    2146:	00 
    2147:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    214e:	e8 bd 1c 00 00       	call   3e10 <printf>
      exit();
    2153:	e8 6d 1b 00 00       	call   3cc5 <exit>
    2158:	90                   	nop
    2159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002160 <dirfile>:
{
    2160:	55                   	push   %ebp
    2161:	89 e5                	mov    %esp,%ebp
    2163:	53                   	push   %ebx
    2164:	83 ec 14             	sub    $0x14,%esp
  printf(1, "dir vs file\n");
    2167:	c7 44 24 04 ff 49 00 	movl   $0x49ff,0x4(%esp)
    216e:	00 
    216f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2176:	e8 95 1c 00 00       	call   3e10 <printf>
  fd = open("dirfile", O_CREATE);
    217b:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2182:	00 
    2183:	c7 04 24 0c 4a 00 00 	movl   $0x4a0c,(%esp)
    218a:	e8 76 1b 00 00       	call   3d05 <open>
  if(fd < 0){
    218f:	85 c0                	test   %eax,%eax
    2191:	0f 88 4e 01 00 00    	js     22e5 <dirfile+0x185>
  close(fd);
    2197:	89 04 24             	mov    %eax,(%esp)
    219a:	e8 4e 1b 00 00       	call   3ced <close>
  if(chdir("dirfile") == 0){
    219f:	c7 04 24 0c 4a 00 00 	movl   $0x4a0c,(%esp)
    21a6:	e8 8a 1b 00 00       	call   3d35 <chdir>
    21ab:	85 c0                	test   %eax,%eax
    21ad:	0f 84 19 01 00 00    	je     22cc <dirfile+0x16c>
  fd = open("dirfile/xx", 0);
    21b3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    21ba:	00 
    21bb:	c7 04 24 45 4a 00 00 	movl   $0x4a45,(%esp)
    21c2:	e8 3e 1b 00 00       	call   3d05 <open>
  if(fd >= 0){
    21c7:	85 c0                	test   %eax,%eax
    21c9:	0f 89 e4 00 00 00    	jns    22b3 <dirfile+0x153>
  fd = open("dirfile/xx", O_CREATE);
    21cf:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    21d6:	00 
    21d7:	c7 04 24 45 4a 00 00 	movl   $0x4a45,(%esp)
    21de:	e8 22 1b 00 00       	call   3d05 <open>
  if(fd >= 0){
    21e3:	85 c0                	test   %eax,%eax
    21e5:	0f 89 c8 00 00 00    	jns    22b3 <dirfile+0x153>
  if(mkdir("dirfile/xx") == 0){
    21eb:	c7 04 24 45 4a 00 00 	movl   $0x4a45,(%esp)
    21f2:	e8 36 1b 00 00       	call   3d2d <mkdir>
    21f7:	85 c0                	test   %eax,%eax
    21f9:	0f 84 7c 01 00 00    	je     237b <dirfile+0x21b>
  if(unlink("dirfile/xx") == 0){
    21ff:	c7 04 24 45 4a 00 00 	movl   $0x4a45,(%esp)
    2206:	e8 0a 1b 00 00       	call   3d15 <unlink>
    220b:	85 c0                	test   %eax,%eax
    220d:	0f 84 4f 01 00 00    	je     2362 <dirfile+0x202>
  if(link("README", "dirfile/xx") == 0){
    2213:	c7 44 24 04 45 4a 00 	movl   $0x4a45,0x4(%esp)
    221a:	00 
    221b:	c7 04 24 e2 49 00 00 	movl   $0x49e2,(%esp)
    2222:	e8 fe 1a 00 00       	call   3d25 <link>
    2227:	85 c0                	test   %eax,%eax
    2229:	0f 84 1a 01 00 00    	je     2349 <dirfile+0x1e9>
  if(unlink("dirfile") != 0){
    222f:	c7 04 24 0c 4a 00 00 	movl   $0x4a0c,(%esp)
    2236:	e8 da 1a 00 00       	call   3d15 <unlink>
    223b:	85 c0                	test   %eax,%eax
    223d:	0f 85 ed 00 00 00    	jne    2330 <dirfile+0x1d0>
  fd = open(".", O_RDWR);
    2243:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    224a:	00 
    224b:	c7 04 24 d2 4c 00 00 	movl   $0x4cd2,(%esp)
    2252:	e8 ae 1a 00 00       	call   3d05 <open>
  if(fd >= 0){
    2257:	85 c0                	test   %eax,%eax
    2259:	0f 89 b8 00 00 00    	jns    2317 <dirfile+0x1b7>
  fd = open(".", 0);
    225f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2266:	00 
    2267:	c7 04 24 d2 4c 00 00 	movl   $0x4cd2,(%esp)
    226e:	e8 92 1a 00 00       	call   3d05 <open>
  if(write(fd, "x", 1) > 0){
    2273:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    227a:	00 
    227b:	c7 44 24 04 b5 4d 00 	movl   $0x4db5,0x4(%esp)
    2282:	00 
  fd = open(".", 0);
    2283:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2285:	89 04 24             	mov    %eax,(%esp)
    2288:	e8 58 1a 00 00       	call   3ce5 <write>
    228d:	85 c0                	test   %eax,%eax
    228f:	7f 6d                	jg     22fe <dirfile+0x19e>
  close(fd);
    2291:	89 1c 24             	mov    %ebx,(%esp)
    2294:	e8 54 1a 00 00       	call   3ced <close>
  printf(1, "dir vs file OK\n");
    2299:	c7 44 24 04 d5 4a 00 	movl   $0x4ad5,0x4(%esp)
    22a0:	00 
    22a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22a8:	e8 63 1b 00 00       	call   3e10 <printf>
}
    22ad:	83 c4 14             	add    $0x14,%esp
    22b0:	5b                   	pop    %ebx
    22b1:	5d                   	pop    %ebp
    22b2:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    22b3:	c7 44 24 04 50 4a 00 	movl   $0x4a50,0x4(%esp)
    22ba:	00 
    22bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22c2:	e8 49 1b 00 00       	call   3e10 <printf>
    exit();
    22c7:	e8 f9 19 00 00       	call   3cc5 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    22cc:	c7 44 24 04 2b 4a 00 	movl   $0x4a2b,0x4(%esp)
    22d3:	00 
    22d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22db:	e8 30 1b 00 00       	call   3e10 <printf>
    exit();
    22e0:	e8 e0 19 00 00       	call   3cc5 <exit>
    printf(1, "create dirfile failed\n");
    22e5:	c7 44 24 04 14 4a 00 	movl   $0x4a14,0x4(%esp)
    22ec:	00 
    22ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22f4:	e8 17 1b 00 00       	call   3e10 <printf>
    exit();
    22f9:	e8 c7 19 00 00       	call   3cc5 <exit>
    printf(1, "write . succeeded!\n");
    22fe:	c7 44 24 04 c1 4a 00 	movl   $0x4ac1,0x4(%esp)
    2305:	00 
    2306:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    230d:	e8 fe 1a 00 00       	call   3e10 <printf>
    exit();
    2312:	e8 ae 19 00 00       	call   3cc5 <exit>
    printf(1, "open . for writing succeeded!\n");
    2317:	c7 44 24 04 04 57 00 	movl   $0x5704,0x4(%esp)
    231e:	00 
    231f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2326:	e8 e5 1a 00 00       	call   3e10 <printf>
    exit();
    232b:	e8 95 19 00 00       	call   3cc5 <exit>
    printf(1, "unlink dirfile failed!\n");
    2330:	c7 44 24 04 a9 4a 00 	movl   $0x4aa9,0x4(%esp)
    2337:	00 
    2338:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    233f:	e8 cc 1a 00 00       	call   3e10 <printf>
    exit();
    2344:	e8 7c 19 00 00       	call   3cc5 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2349:	c7 44 24 04 e4 56 00 	movl   $0x56e4,0x4(%esp)
    2350:	00 
    2351:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2358:	e8 b3 1a 00 00       	call   3e10 <printf>
    exit();
    235d:	e8 63 19 00 00       	call   3cc5 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2362:	c7 44 24 04 8b 4a 00 	movl   $0x4a8b,0x4(%esp)
    2369:	00 
    236a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2371:	e8 9a 1a 00 00       	call   3e10 <printf>
    exit();
    2376:	e8 4a 19 00 00       	call   3cc5 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    237b:	c7 44 24 04 6e 4a 00 	movl   $0x4a6e,0x4(%esp)
    2382:	00 
    2383:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    238a:	e8 81 1a 00 00       	call   3e10 <printf>
    exit();
    238f:	e8 31 19 00 00       	call   3cc5 <exit>
    2394:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    239a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000023a0 <rmdot>:
{
    23a0:	55                   	push   %ebp
    23a1:	89 e5                	mov    %esp,%ebp
    23a3:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    23a6:	c7 44 24 04 e5 4a 00 	movl   $0x4ae5,0x4(%esp)
    23ad:	00 
    23ae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23b5:	e8 56 1a 00 00       	call   3e10 <printf>
  if(mkdir("dots") != 0){
    23ba:	c7 04 24 f1 4a 00 00 	movl   $0x4af1,(%esp)
    23c1:	e8 67 19 00 00       	call   3d2d <mkdir>
    23c6:	85 c0                	test   %eax,%eax
    23c8:	0f 85 9a 00 00 00    	jne    2468 <rmdot+0xc8>
  if(chdir("dots") != 0){
    23ce:	c7 04 24 f1 4a 00 00 	movl   $0x4af1,(%esp)
    23d5:	e8 5b 19 00 00       	call   3d35 <chdir>
    23da:	85 c0                	test   %eax,%eax
    23dc:	0f 85 35 01 00 00    	jne    2517 <rmdot+0x177>
  if(unlink(".") == 0){
    23e2:	c7 04 24 d2 4c 00 00 	movl   $0x4cd2,(%esp)
    23e9:	e8 27 19 00 00       	call   3d15 <unlink>
    23ee:	85 c0                	test   %eax,%eax
    23f0:	0f 84 08 01 00 00    	je     24fe <rmdot+0x15e>
  if(unlink("..") == 0){
    23f6:	c7 04 24 d1 4c 00 00 	movl   $0x4cd1,(%esp)
    23fd:	e8 13 19 00 00       	call   3d15 <unlink>
    2402:	85 c0                	test   %eax,%eax
    2404:	0f 84 db 00 00 00    	je     24e5 <rmdot+0x145>
  if(chdir("/") != 0){
    240a:	c7 04 24 e9 49 00 00 	movl   $0x49e9,(%esp)
    2411:	e8 1f 19 00 00       	call   3d35 <chdir>
    2416:	85 c0                	test   %eax,%eax
    2418:	0f 85 ae 00 00 00    	jne    24cc <rmdot+0x12c>
  if(unlink("dots/.") == 0){
    241e:	c7 04 24 49 4b 00 00 	movl   $0x4b49,(%esp)
    2425:	e8 eb 18 00 00       	call   3d15 <unlink>
    242a:	85 c0                	test   %eax,%eax
    242c:	0f 84 81 00 00 00    	je     24b3 <rmdot+0x113>
  if(unlink("dots/..") == 0){
    2432:	c7 04 24 67 4b 00 00 	movl   $0x4b67,(%esp)
    2439:	e8 d7 18 00 00       	call   3d15 <unlink>
    243e:	85 c0                	test   %eax,%eax
    2440:	74 58                	je     249a <rmdot+0xfa>
  if(unlink("dots") != 0){
    2442:	c7 04 24 f1 4a 00 00 	movl   $0x4af1,(%esp)
    2449:	e8 c7 18 00 00       	call   3d15 <unlink>
    244e:	85 c0                	test   %eax,%eax
    2450:	75 2f                	jne    2481 <rmdot+0xe1>
  printf(1, "rmdot ok\n");
    2452:	c7 44 24 04 9c 4b 00 	movl   $0x4b9c,0x4(%esp)
    2459:	00 
    245a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2461:	e8 aa 19 00 00       	call   3e10 <printf>
}
    2466:	c9                   	leave  
    2467:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    2468:	c7 44 24 04 f6 4a 00 	movl   $0x4af6,0x4(%esp)
    246f:	00 
    2470:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2477:	e8 94 19 00 00       	call   3e10 <printf>
    exit();
    247c:	e8 44 18 00 00       	call   3cc5 <exit>
    printf(1, "unlink dots failed!\n");
    2481:	c7 44 24 04 87 4b 00 	movl   $0x4b87,0x4(%esp)
    2488:	00 
    2489:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2490:	e8 7b 19 00 00       	call   3e10 <printf>
    exit();
    2495:	e8 2b 18 00 00       	call   3cc5 <exit>
    printf(1, "unlink dots/.. worked!\n");
    249a:	c7 44 24 04 6f 4b 00 	movl   $0x4b6f,0x4(%esp)
    24a1:	00 
    24a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24a9:	e8 62 19 00 00       	call   3e10 <printf>
    exit();
    24ae:	e8 12 18 00 00       	call   3cc5 <exit>
    printf(1, "unlink dots/. worked!\n");
    24b3:	c7 44 24 04 50 4b 00 	movl   $0x4b50,0x4(%esp)
    24ba:	00 
    24bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24c2:	e8 49 19 00 00       	call   3e10 <printf>
    exit();
    24c7:	e8 f9 17 00 00       	call   3cc5 <exit>
    printf(1, "chdir / failed\n");
    24cc:	c7 44 24 04 39 4b 00 	movl   $0x4b39,0x4(%esp)
    24d3:	00 
    24d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24db:	e8 30 19 00 00       	call   3e10 <printf>
    exit();
    24e0:	e8 e0 17 00 00       	call   3cc5 <exit>
    printf(1, "rm .. worked!\n");
    24e5:	c7 44 24 04 2a 4b 00 	movl   $0x4b2a,0x4(%esp)
    24ec:	00 
    24ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24f4:	e8 17 19 00 00       	call   3e10 <printf>
    exit();
    24f9:	e8 c7 17 00 00       	call   3cc5 <exit>
    printf(1, "rm . worked!\n");
    24fe:	c7 44 24 04 1c 4b 00 	movl   $0x4b1c,0x4(%esp)
    2505:	00 
    2506:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    250d:	e8 fe 18 00 00       	call   3e10 <printf>
    exit();
    2512:	e8 ae 17 00 00       	call   3cc5 <exit>
    printf(1, "chdir dots failed\n");
    2517:	c7 44 24 04 09 4b 00 	movl   $0x4b09,0x4(%esp)
    251e:	00 
    251f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2526:	e8 e5 18 00 00       	call   3e10 <printf>
    exit();
    252b:	e8 95 17 00 00       	call   3cc5 <exit>

00002530 <subdir>:
{
    2530:	55                   	push   %ebp
    2531:	89 e5                	mov    %esp,%ebp
    2533:	53                   	push   %ebx
    2534:	83 ec 14             	sub    $0x14,%esp
  printf(1, "subdir test\n");
    2537:	c7 44 24 04 a6 4b 00 	movl   $0x4ba6,0x4(%esp)
    253e:	00 
    253f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2546:	e8 c5 18 00 00       	call   3e10 <printf>
  unlink("ff");
    254b:	c7 04 24 2f 4c 00 00 	movl   $0x4c2f,(%esp)
    2552:	e8 be 17 00 00       	call   3d15 <unlink>
  if(mkdir("dd") != 0){
    2557:	c7 04 24 cc 4c 00 00 	movl   $0x4ccc,(%esp)
    255e:	e8 ca 17 00 00       	call   3d2d <mkdir>
    2563:	85 c0                	test   %eax,%eax
    2565:	0f 85 07 06 00 00    	jne    2b72 <subdir+0x642>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    256b:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2572:	00 
    2573:	c7 04 24 05 4c 00 00 	movl   $0x4c05,(%esp)
    257a:	e8 86 17 00 00       	call   3d05 <open>
  if(fd < 0){
    257f:	85 c0                	test   %eax,%eax
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2581:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2583:	0f 88 d0 05 00 00    	js     2b59 <subdir+0x629>
  write(fd, "ff", 2);
    2589:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    2590:	00 
    2591:	c7 44 24 04 2f 4c 00 	movl   $0x4c2f,0x4(%esp)
    2598:	00 
    2599:	89 04 24             	mov    %eax,(%esp)
    259c:	e8 44 17 00 00       	call   3ce5 <write>
  close(fd);
    25a1:	89 1c 24             	mov    %ebx,(%esp)
    25a4:	e8 44 17 00 00       	call   3ced <close>
  if(unlink("dd") >= 0){
    25a9:	c7 04 24 cc 4c 00 00 	movl   $0x4ccc,(%esp)
    25b0:	e8 60 17 00 00       	call   3d15 <unlink>
    25b5:	85 c0                	test   %eax,%eax
    25b7:	0f 89 83 05 00 00    	jns    2b40 <subdir+0x610>
  if(mkdir("/dd/dd") != 0){
    25bd:	c7 04 24 e0 4b 00 00 	movl   $0x4be0,(%esp)
    25c4:	e8 64 17 00 00       	call   3d2d <mkdir>
    25c9:	85 c0                	test   %eax,%eax
    25cb:	0f 85 56 05 00 00    	jne    2b27 <subdir+0x5f7>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    25d1:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    25d8:	00 
    25d9:	c7 04 24 02 4c 00 00 	movl   $0x4c02,(%esp)
    25e0:	e8 20 17 00 00       	call   3d05 <open>
  if(fd < 0){
    25e5:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    25e7:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    25e9:	0f 88 25 04 00 00    	js     2a14 <subdir+0x4e4>
  write(fd, "FF", 2);
    25ef:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    25f6:	00 
    25f7:	c7 44 24 04 23 4c 00 	movl   $0x4c23,0x4(%esp)
    25fe:	00 
    25ff:	89 04 24             	mov    %eax,(%esp)
    2602:	e8 de 16 00 00       	call   3ce5 <write>
  close(fd);
    2607:	89 1c 24             	mov    %ebx,(%esp)
    260a:	e8 de 16 00 00       	call   3ced <close>
  fd = open("dd/dd/../ff", 0);
    260f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2616:	00 
    2617:	c7 04 24 26 4c 00 00 	movl   $0x4c26,(%esp)
    261e:	e8 e2 16 00 00       	call   3d05 <open>
  if(fd < 0){
    2623:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/../ff", 0);
    2625:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2627:	0f 88 ce 03 00 00    	js     29fb <subdir+0x4cb>
  cc = read(fd, buf, sizeof(buf));
    262d:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    2634:	00 
    2635:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    263c:	00 
    263d:	89 04 24             	mov    %eax,(%esp)
    2640:	e8 98 16 00 00       	call   3cdd <read>
  if(cc != 2 || buf[0] != 'f'){
    2645:	83 f8 02             	cmp    $0x2,%eax
    2648:	0f 85 fe 02 00 00    	jne    294c <subdir+0x41c>
    264e:	80 3d 20 81 00 00 66 	cmpb   $0x66,0x8120
    2655:	0f 85 f1 02 00 00    	jne    294c <subdir+0x41c>
  close(fd);
    265b:	89 1c 24             	mov    %ebx,(%esp)
    265e:	e8 8a 16 00 00       	call   3ced <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2663:	c7 44 24 04 66 4c 00 	movl   $0x4c66,0x4(%esp)
    266a:	00 
    266b:	c7 04 24 02 4c 00 00 	movl   $0x4c02,(%esp)
    2672:	e8 ae 16 00 00       	call   3d25 <link>
    2677:	85 c0                	test   %eax,%eax
    2679:	0f 85 c7 03 00 00    	jne    2a46 <subdir+0x516>
  if(unlink("dd/dd/ff") != 0){
    267f:	c7 04 24 02 4c 00 00 	movl   $0x4c02,(%esp)
    2686:	e8 8a 16 00 00       	call   3d15 <unlink>
    268b:	85 c0                	test   %eax,%eax
    268d:	0f 85 eb 02 00 00    	jne    297e <subdir+0x44e>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2693:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    269a:	00 
    269b:	c7 04 24 02 4c 00 00 	movl   $0x4c02,(%esp)
    26a2:	e8 5e 16 00 00       	call   3d05 <open>
    26a7:	85 c0                	test   %eax,%eax
    26a9:	0f 89 5f 04 00 00    	jns    2b0e <subdir+0x5de>
  if(chdir("dd") != 0){
    26af:	c7 04 24 cc 4c 00 00 	movl   $0x4ccc,(%esp)
    26b6:	e8 7a 16 00 00       	call   3d35 <chdir>
    26bb:	85 c0                	test   %eax,%eax
    26bd:	0f 85 32 04 00 00    	jne    2af5 <subdir+0x5c5>
  if(chdir("dd/../../dd") != 0){
    26c3:	c7 04 24 9a 4c 00 00 	movl   $0x4c9a,(%esp)
    26ca:	e8 66 16 00 00       	call   3d35 <chdir>
    26cf:	85 c0                	test   %eax,%eax
    26d1:	0f 85 8e 02 00 00    	jne    2965 <subdir+0x435>
  if(chdir("dd/../../../dd") != 0){
    26d7:	c7 04 24 c0 4c 00 00 	movl   $0x4cc0,(%esp)
    26de:	e8 52 16 00 00       	call   3d35 <chdir>
    26e3:	85 c0                	test   %eax,%eax
    26e5:	0f 85 7a 02 00 00    	jne    2965 <subdir+0x435>
  if(chdir("./..") != 0){
    26eb:	c7 04 24 cf 4c 00 00 	movl   $0x4ccf,(%esp)
    26f2:	e8 3e 16 00 00       	call   3d35 <chdir>
    26f7:	85 c0                	test   %eax,%eax
    26f9:	0f 85 2e 03 00 00    	jne    2a2d <subdir+0x4fd>
  fd = open("dd/dd/ffff", 0);
    26ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2706:	00 
    2707:	c7 04 24 66 4c 00 00 	movl   $0x4c66,(%esp)
    270e:	e8 f2 15 00 00       	call   3d05 <open>
  if(fd < 0){
    2713:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ffff", 0);
    2715:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2717:	0f 88 81 05 00 00    	js     2c9e <subdir+0x76e>
  if(read(fd, buf, sizeof(buf)) != 2){
    271d:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    2724:	00 
    2725:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    272c:	00 
    272d:	89 04 24             	mov    %eax,(%esp)
    2730:	e8 a8 15 00 00       	call   3cdd <read>
    2735:	83 f8 02             	cmp    $0x2,%eax
    2738:	0f 85 47 05 00 00    	jne    2c85 <subdir+0x755>
  close(fd);
    273e:	89 1c 24             	mov    %ebx,(%esp)
    2741:	e8 a7 15 00 00       	call   3ced <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2746:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    274d:	00 
    274e:	c7 04 24 02 4c 00 00 	movl   $0x4c02,(%esp)
    2755:	e8 ab 15 00 00       	call   3d05 <open>
    275a:	85 c0                	test   %eax,%eax
    275c:	0f 89 4e 02 00 00    	jns    29b0 <subdir+0x480>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2762:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2769:	00 
    276a:	c7 04 24 1a 4d 00 00 	movl   $0x4d1a,(%esp)
    2771:	e8 8f 15 00 00       	call   3d05 <open>
    2776:	85 c0                	test   %eax,%eax
    2778:	0f 89 19 02 00 00    	jns    2997 <subdir+0x467>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    277e:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2785:	00 
    2786:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    278d:	e8 73 15 00 00       	call   3d05 <open>
    2792:	85 c0                	test   %eax,%eax
    2794:	0f 89 42 03 00 00    	jns    2adc <subdir+0x5ac>
  if(open("dd", O_CREATE) >= 0){
    279a:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    27a1:	00 
    27a2:	c7 04 24 cc 4c 00 00 	movl   $0x4ccc,(%esp)
    27a9:	e8 57 15 00 00       	call   3d05 <open>
    27ae:	85 c0                	test   %eax,%eax
    27b0:	0f 89 0d 03 00 00    	jns    2ac3 <subdir+0x593>
  if(open("dd", O_RDWR) >= 0){
    27b6:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    27bd:	00 
    27be:	c7 04 24 cc 4c 00 00 	movl   $0x4ccc,(%esp)
    27c5:	e8 3b 15 00 00       	call   3d05 <open>
    27ca:	85 c0                	test   %eax,%eax
    27cc:	0f 89 d8 02 00 00    	jns    2aaa <subdir+0x57a>
  if(open("dd", O_WRONLY) >= 0){
    27d2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    27d9:	00 
    27da:	c7 04 24 cc 4c 00 00 	movl   $0x4ccc,(%esp)
    27e1:	e8 1f 15 00 00       	call   3d05 <open>
    27e6:	85 c0                	test   %eax,%eax
    27e8:	0f 89 a3 02 00 00    	jns    2a91 <subdir+0x561>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    27ee:	c7 44 24 04 ae 4d 00 	movl   $0x4dae,0x4(%esp)
    27f5:	00 
    27f6:	c7 04 24 1a 4d 00 00 	movl   $0x4d1a,(%esp)
    27fd:	e8 23 15 00 00       	call   3d25 <link>
    2802:	85 c0                	test   %eax,%eax
    2804:	0f 84 6e 02 00 00    	je     2a78 <subdir+0x548>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    280a:	c7 44 24 04 ae 4d 00 	movl   $0x4dae,0x4(%esp)
    2811:	00 
    2812:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    2819:	e8 07 15 00 00       	call   3d25 <link>
    281e:	85 c0                	test   %eax,%eax
    2820:	0f 84 39 02 00 00    	je     2a5f <subdir+0x52f>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2826:	c7 44 24 04 66 4c 00 	movl   $0x4c66,0x4(%esp)
    282d:	00 
    282e:	c7 04 24 05 4c 00 00 	movl   $0x4c05,(%esp)
    2835:	e8 eb 14 00 00       	call   3d25 <link>
    283a:	85 c0                	test   %eax,%eax
    283c:	0f 84 a0 01 00 00    	je     29e2 <subdir+0x4b2>
  if(mkdir("dd/ff/ff") == 0){
    2842:	c7 04 24 1a 4d 00 00 	movl   $0x4d1a,(%esp)
    2849:	e8 df 14 00 00       	call   3d2d <mkdir>
    284e:	85 c0                	test   %eax,%eax
    2850:	0f 84 73 01 00 00    	je     29c9 <subdir+0x499>
  if(mkdir("dd/xx/ff") == 0){
    2856:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    285d:	e8 cb 14 00 00       	call   3d2d <mkdir>
    2862:	85 c0                	test   %eax,%eax
    2864:	0f 84 02 04 00 00    	je     2c6c <subdir+0x73c>
  if(mkdir("dd/dd/ffff") == 0){
    286a:	c7 04 24 66 4c 00 00 	movl   $0x4c66,(%esp)
    2871:	e8 b7 14 00 00       	call   3d2d <mkdir>
    2876:	85 c0                	test   %eax,%eax
    2878:	0f 84 d5 03 00 00    	je     2c53 <subdir+0x723>
  if(unlink("dd/xx/ff") == 0){
    287e:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    2885:	e8 8b 14 00 00       	call   3d15 <unlink>
    288a:	85 c0                	test   %eax,%eax
    288c:	0f 84 a8 03 00 00    	je     2c3a <subdir+0x70a>
  if(unlink("dd/ff/ff") == 0){
    2892:	c7 04 24 1a 4d 00 00 	movl   $0x4d1a,(%esp)
    2899:	e8 77 14 00 00       	call   3d15 <unlink>
    289e:	85 c0                	test   %eax,%eax
    28a0:	0f 84 7b 03 00 00    	je     2c21 <subdir+0x6f1>
  if(chdir("dd/ff") == 0){
    28a6:	c7 04 24 05 4c 00 00 	movl   $0x4c05,(%esp)
    28ad:	e8 83 14 00 00       	call   3d35 <chdir>
    28b2:	85 c0                	test   %eax,%eax
    28b4:	0f 84 4e 03 00 00    	je     2c08 <subdir+0x6d8>
  if(chdir("dd/xx") == 0){
    28ba:	c7 04 24 b1 4d 00 00 	movl   $0x4db1,(%esp)
    28c1:	e8 6f 14 00 00       	call   3d35 <chdir>
    28c6:	85 c0                	test   %eax,%eax
    28c8:	0f 84 21 03 00 00    	je     2bef <subdir+0x6bf>
  if(unlink("dd/dd/ffff") != 0){
    28ce:	c7 04 24 66 4c 00 00 	movl   $0x4c66,(%esp)
    28d5:	e8 3b 14 00 00       	call   3d15 <unlink>
    28da:	85 c0                	test   %eax,%eax
    28dc:	0f 85 9c 00 00 00    	jne    297e <subdir+0x44e>
  if(unlink("dd/ff") != 0){
    28e2:	c7 04 24 05 4c 00 00 	movl   $0x4c05,(%esp)
    28e9:	e8 27 14 00 00       	call   3d15 <unlink>
    28ee:	85 c0                	test   %eax,%eax
    28f0:	0f 85 e0 02 00 00    	jne    2bd6 <subdir+0x6a6>
  if(unlink("dd") == 0){
    28f6:	c7 04 24 cc 4c 00 00 	movl   $0x4ccc,(%esp)
    28fd:	e8 13 14 00 00       	call   3d15 <unlink>
    2902:	85 c0                	test   %eax,%eax
    2904:	0f 84 b3 02 00 00    	je     2bbd <subdir+0x68d>
  if(unlink("dd/dd") < 0){
    290a:	c7 04 24 e1 4b 00 00 	movl   $0x4be1,(%esp)
    2911:	e8 ff 13 00 00       	call   3d15 <unlink>
    2916:	85 c0                	test   %eax,%eax
    2918:	0f 88 86 02 00 00    	js     2ba4 <subdir+0x674>
  if(unlink("dd") < 0){
    291e:	c7 04 24 cc 4c 00 00 	movl   $0x4ccc,(%esp)
    2925:	e8 eb 13 00 00       	call   3d15 <unlink>
    292a:	85 c0                	test   %eax,%eax
    292c:	0f 88 59 02 00 00    	js     2b8b <subdir+0x65b>
  printf(1, "subdir ok\n");
    2932:	c7 44 24 04 ae 4e 00 	movl   $0x4eae,0x4(%esp)
    2939:	00 
    293a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2941:	e8 ca 14 00 00       	call   3e10 <printf>
}
    2946:	83 c4 14             	add    $0x14,%esp
    2949:	5b                   	pop    %ebx
    294a:	5d                   	pop    %ebp
    294b:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    294c:	c7 44 24 04 4b 4c 00 	movl   $0x4c4b,0x4(%esp)
    2953:	00 
    2954:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    295b:	e8 b0 14 00 00       	call   3e10 <printf>
    exit();
    2960:	e8 60 13 00 00       	call   3cc5 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2965:	c7 44 24 04 a6 4c 00 	movl   $0x4ca6,0x4(%esp)
    296c:	00 
    296d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2974:	e8 97 14 00 00       	call   3e10 <printf>
    exit();
    2979:	e8 47 13 00 00       	call   3cc5 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    297e:	c7 44 24 04 71 4c 00 	movl   $0x4c71,0x4(%esp)
    2985:	00 
    2986:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    298d:	e8 7e 14 00 00       	call   3e10 <printf>
    exit();
    2992:	e8 2e 13 00 00       	call   3cc5 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    2997:	c7 44 24 04 23 4d 00 	movl   $0x4d23,0x4(%esp)
    299e:	00 
    299f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29a6:	e8 65 14 00 00       	call   3e10 <printf>
    exit();
    29ab:	e8 15 13 00 00       	call   3cc5 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    29b0:	c7 44 24 04 94 57 00 	movl   $0x5794,0x4(%esp)
    29b7:	00 
    29b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29bf:	e8 4c 14 00 00       	call   3e10 <printf>
    exit();
    29c4:	e8 fc 12 00 00       	call   3cc5 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    29c9:	c7 44 24 04 b7 4d 00 	movl   $0x4db7,0x4(%esp)
    29d0:	00 
    29d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29d8:	e8 33 14 00 00       	call   3e10 <printf>
    exit();
    29dd:	e8 e3 12 00 00       	call   3cc5 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    29e2:	c7 44 24 04 04 58 00 	movl   $0x5804,0x4(%esp)
    29e9:	00 
    29ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29f1:	e8 1a 14 00 00       	call   3e10 <printf>
    exit();
    29f6:	e8 ca 12 00 00       	call   3cc5 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    29fb:	c7 44 24 04 32 4c 00 	movl   $0x4c32,0x4(%esp)
    2a02:	00 
    2a03:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a0a:	e8 01 14 00 00       	call   3e10 <printf>
    exit();
    2a0f:	e8 b1 12 00 00       	call   3cc5 <exit>
    printf(1, "create dd/dd/ff failed\n");
    2a14:	c7 44 24 04 0b 4c 00 	movl   $0x4c0b,0x4(%esp)
    2a1b:	00 
    2a1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a23:	e8 e8 13 00 00       	call   3e10 <printf>
    exit();
    2a28:	e8 98 12 00 00       	call   3cc5 <exit>
    printf(1, "chdir ./.. failed\n");
    2a2d:	c7 44 24 04 d4 4c 00 	movl   $0x4cd4,0x4(%esp)
    2a34:	00 
    2a35:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a3c:	e8 cf 13 00 00       	call   3e10 <printf>
    exit();
    2a41:	e8 7f 12 00 00       	call   3cc5 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2a46:	c7 44 24 04 4c 57 00 	movl   $0x574c,0x4(%esp)
    2a4d:	00 
    2a4e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a55:	e8 b6 13 00 00       	call   3e10 <printf>
    exit();
    2a5a:	e8 66 12 00 00       	call   3cc5 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2a5f:	c7 44 24 04 e0 57 00 	movl   $0x57e0,0x4(%esp)
    2a66:	00 
    2a67:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a6e:	e8 9d 13 00 00       	call   3e10 <printf>
    exit();
    2a73:	e8 4d 12 00 00       	call   3cc5 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2a78:	c7 44 24 04 bc 57 00 	movl   $0x57bc,0x4(%esp)
    2a7f:	00 
    2a80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a87:	e8 84 13 00 00       	call   3e10 <printf>
    exit();
    2a8c:	e8 34 12 00 00       	call   3cc5 <exit>
    printf(1, "open dd wronly succeeded!\n");
    2a91:	c7 44 24 04 93 4d 00 	movl   $0x4d93,0x4(%esp)
    2a98:	00 
    2a99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aa0:	e8 6b 13 00 00       	call   3e10 <printf>
    exit();
    2aa5:	e8 1b 12 00 00       	call   3cc5 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    2aaa:	c7 44 24 04 7a 4d 00 	movl   $0x4d7a,0x4(%esp)
    2ab1:	00 
    2ab2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ab9:	e8 52 13 00 00       	call   3e10 <printf>
    exit();
    2abe:	e8 02 12 00 00       	call   3cc5 <exit>
    printf(1, "create dd succeeded!\n");
    2ac3:	c7 44 24 04 64 4d 00 	movl   $0x4d64,0x4(%esp)
    2aca:	00 
    2acb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ad2:	e8 39 13 00 00       	call   3e10 <printf>
    exit();
    2ad7:	e8 e9 11 00 00       	call   3cc5 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    2adc:	c7 44 24 04 48 4d 00 	movl   $0x4d48,0x4(%esp)
    2ae3:	00 
    2ae4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aeb:	e8 20 13 00 00       	call   3e10 <printf>
    exit();
    2af0:	e8 d0 11 00 00       	call   3cc5 <exit>
    printf(1, "chdir dd failed\n");
    2af5:	c7 44 24 04 89 4c 00 	movl   $0x4c89,0x4(%esp)
    2afc:	00 
    2afd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b04:	e8 07 13 00 00       	call   3e10 <printf>
    exit();
    2b09:	e8 b7 11 00 00       	call   3cc5 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    2b0e:	c7 44 24 04 70 57 00 	movl   $0x5770,0x4(%esp)
    2b15:	00 
    2b16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b1d:	e8 ee 12 00 00       	call   3e10 <printf>
    exit();
    2b22:	e8 9e 11 00 00       	call   3cc5 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    2b27:	c7 44 24 04 e7 4b 00 	movl   $0x4be7,0x4(%esp)
    2b2e:	00 
    2b2f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b36:	e8 d5 12 00 00       	call   3e10 <printf>
    exit();
    2b3b:	e8 85 11 00 00       	call   3cc5 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2b40:	c7 44 24 04 24 57 00 	movl   $0x5724,0x4(%esp)
    2b47:	00 
    2b48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b4f:	e8 bc 12 00 00       	call   3e10 <printf>
    exit();
    2b54:	e8 6c 11 00 00       	call   3cc5 <exit>
    printf(1, "create dd/ff failed\n");
    2b59:	c7 44 24 04 cb 4b 00 	movl   $0x4bcb,0x4(%esp)
    2b60:	00 
    2b61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b68:	e8 a3 12 00 00       	call   3e10 <printf>
    exit();
    2b6d:	e8 53 11 00 00       	call   3cc5 <exit>
    printf(1, "subdir mkdir dd failed\n");
    2b72:	c7 44 24 04 b3 4b 00 	movl   $0x4bb3,0x4(%esp)
    2b79:	00 
    2b7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b81:	e8 8a 12 00 00       	call   3e10 <printf>
    exit();
    2b86:	e8 3a 11 00 00       	call   3cc5 <exit>
    printf(1, "unlink dd failed\n");
    2b8b:	c7 44 24 04 9c 4e 00 	movl   $0x4e9c,0x4(%esp)
    2b92:	00 
    2b93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b9a:	e8 71 12 00 00       	call   3e10 <printf>
    exit();
    2b9f:	e8 21 11 00 00       	call   3cc5 <exit>
    printf(1, "unlink dd/dd failed\n");
    2ba4:	c7 44 24 04 87 4e 00 	movl   $0x4e87,0x4(%esp)
    2bab:	00 
    2bac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bb3:	e8 58 12 00 00       	call   3e10 <printf>
    exit();
    2bb8:	e8 08 11 00 00       	call   3cc5 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2bbd:	c7 44 24 04 28 58 00 	movl   $0x5828,0x4(%esp)
    2bc4:	00 
    2bc5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bcc:	e8 3f 12 00 00       	call   3e10 <printf>
    exit();
    2bd1:	e8 ef 10 00 00       	call   3cc5 <exit>
    printf(1, "unlink dd/ff failed\n");
    2bd6:	c7 44 24 04 72 4e 00 	movl   $0x4e72,0x4(%esp)
    2bdd:	00 
    2bde:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2be5:	e8 26 12 00 00       	call   3e10 <printf>
    exit();
    2bea:	e8 d6 10 00 00       	call   3cc5 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    2bef:	c7 44 24 04 5a 4e 00 	movl   $0x4e5a,0x4(%esp)
    2bf6:	00 
    2bf7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bfe:	e8 0d 12 00 00       	call   3e10 <printf>
    exit();
    2c03:	e8 bd 10 00 00       	call   3cc5 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    2c08:	c7 44 24 04 42 4e 00 	movl   $0x4e42,0x4(%esp)
    2c0f:	00 
    2c10:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c17:	e8 f4 11 00 00       	call   3e10 <printf>
    exit();
    2c1c:	e8 a4 10 00 00       	call   3cc5 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2c21:	c7 44 24 04 26 4e 00 	movl   $0x4e26,0x4(%esp)
    2c28:	00 
    2c29:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c30:	e8 db 11 00 00       	call   3e10 <printf>
    exit();
    2c35:	e8 8b 10 00 00       	call   3cc5 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2c3a:	c7 44 24 04 0a 4e 00 	movl   $0x4e0a,0x4(%esp)
    2c41:	00 
    2c42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c49:	e8 c2 11 00 00       	call   3e10 <printf>
    exit();
    2c4e:	e8 72 10 00 00       	call   3cc5 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2c53:	c7 44 24 04 ed 4d 00 	movl   $0x4ded,0x4(%esp)
    2c5a:	00 
    2c5b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c62:	e8 a9 11 00 00       	call   3e10 <printf>
    exit();
    2c67:	e8 59 10 00 00       	call   3cc5 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2c6c:	c7 44 24 04 d2 4d 00 	movl   $0x4dd2,0x4(%esp)
    2c73:	00 
    2c74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c7b:	e8 90 11 00 00       	call   3e10 <printf>
    exit();
    2c80:	e8 40 10 00 00       	call   3cc5 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    2c85:	c7 44 24 04 ff 4c 00 	movl   $0x4cff,0x4(%esp)
    2c8c:	00 
    2c8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c94:	e8 77 11 00 00       	call   3e10 <printf>
    exit();
    2c99:	e8 27 10 00 00       	call   3cc5 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    2c9e:	c7 44 24 04 e7 4c 00 	movl   $0x4ce7,0x4(%esp)
    2ca5:	00 
    2ca6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cad:	e8 5e 11 00 00       	call   3e10 <printf>
    exit();
    2cb2:	e8 0e 10 00 00       	call   3cc5 <exit>
    2cb7:	89 f6                	mov    %esi,%esi
    2cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002cc0 <dirtest>:
{
    2cc0:	55                   	push   %ebp
    2cc1:	89 e5                	mov    %esp,%ebp
    2cc3:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
    2cc6:	a1 4c 59 00 00       	mov    0x594c,%eax
    2ccb:	c7 44 24 04 b9 4e 00 	movl   $0x4eb9,0x4(%esp)
    2cd2:	00 
    2cd3:	89 04 24             	mov    %eax,(%esp)
    2cd6:	e8 35 11 00 00       	call   3e10 <printf>
  if(mkdir("dir0") < 0){
    2cdb:	c7 04 24 c5 4e 00 00 	movl   $0x4ec5,(%esp)
    2ce2:	e8 46 10 00 00       	call   3d2d <mkdir>
    2ce7:	85 c0                	test   %eax,%eax
    2ce9:	78 4b                	js     2d36 <dirtest+0x76>
  if(chdir("dir0") < 0){
    2ceb:	c7 04 24 c5 4e 00 00 	movl   $0x4ec5,(%esp)
    2cf2:	e8 3e 10 00 00       	call   3d35 <chdir>
    2cf7:	85 c0                	test   %eax,%eax
    2cf9:	0f 88 85 00 00 00    	js     2d84 <dirtest+0xc4>
  if(chdir("..") < 0){
    2cff:	c7 04 24 d1 4c 00 00 	movl   $0x4cd1,(%esp)
    2d06:	e8 2a 10 00 00       	call   3d35 <chdir>
    2d0b:	85 c0                	test   %eax,%eax
    2d0d:	78 5b                	js     2d6a <dirtest+0xaa>
  if(unlink("dir0") < 0){
    2d0f:	c7 04 24 c5 4e 00 00 	movl   $0x4ec5,(%esp)
    2d16:	e8 fa 0f 00 00       	call   3d15 <unlink>
    2d1b:	85 c0                	test   %eax,%eax
    2d1d:	78 31                	js     2d50 <dirtest+0x90>
  printf(stdout, "mkdir test ok\n");
    2d1f:	a1 4c 59 00 00       	mov    0x594c,%eax
    2d24:	c7 44 24 04 10 4f 00 	movl   $0x4f10,0x4(%esp)
    2d2b:	00 
    2d2c:	89 04 24             	mov    %eax,(%esp)
    2d2f:	e8 dc 10 00 00       	call   3e10 <printf>
}
    2d34:	c9                   	leave  
    2d35:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
    2d36:	a1 4c 59 00 00       	mov    0x594c,%eax
    2d3b:	c7 44 24 04 ca 4e 00 	movl   $0x4eca,0x4(%esp)
    2d42:	00 
    2d43:	89 04 24             	mov    %eax,(%esp)
    2d46:	e8 c5 10 00 00       	call   3e10 <printf>
    exit();
    2d4b:	e8 75 0f 00 00       	call   3cc5 <exit>
    printf(stdout, "unlink dir0 failed\n");
    2d50:	a1 4c 59 00 00       	mov    0x594c,%eax
    2d55:	c7 44 24 04 fc 4e 00 	movl   $0x4efc,0x4(%esp)
    2d5c:	00 
    2d5d:	89 04 24             	mov    %eax,(%esp)
    2d60:	e8 ab 10 00 00       	call   3e10 <printf>
    exit();
    2d65:	e8 5b 0f 00 00       	call   3cc5 <exit>
    printf(stdout, "chdir .. failed\n");
    2d6a:	a1 4c 59 00 00       	mov    0x594c,%eax
    2d6f:	c7 44 24 04 eb 4e 00 	movl   $0x4eeb,0x4(%esp)
    2d76:	00 
    2d77:	89 04 24             	mov    %eax,(%esp)
    2d7a:	e8 91 10 00 00       	call   3e10 <printf>
    exit();
    2d7f:	e8 41 0f 00 00       	call   3cc5 <exit>
    printf(stdout, "chdir dir0 failed\n");
    2d84:	a1 4c 59 00 00       	mov    0x594c,%eax
    2d89:	c7 44 24 04 d8 4e 00 	movl   $0x4ed8,0x4(%esp)
    2d90:	00 
    2d91:	89 04 24             	mov    %eax,(%esp)
    2d94:	e8 77 10 00 00       	call   3e10 <printf>
    exit();
    2d99:	e8 27 0f 00 00       	call   3cc5 <exit>
    2d9e:	66 90                	xchg   %ax,%ax

00002da0 <exitiputtest>:
{
    2da0:	55                   	push   %ebp
    2da1:	89 e5                	mov    %esp,%ebp
    2da3:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exitiput test\n");
    2da6:	a1 4c 59 00 00       	mov    0x594c,%eax
    2dab:	c7 44 24 04 1f 4f 00 	movl   $0x4f1f,0x4(%esp)
    2db2:	00 
    2db3:	89 04 24             	mov    %eax,(%esp)
    2db6:	e8 55 10 00 00       	call   3e10 <printf>
  pid = fork();
    2dbb:	e8 fd 0e 00 00       	call   3cbd <fork>
  if(pid < 0){
    2dc0:	83 f8 00             	cmp    $0x0,%eax
    2dc3:	7c 75                	jl     2e3a <exitiputtest+0x9a>
  if(pid == 0){
    2dc5:	75 39                	jne    2e00 <exitiputtest+0x60>
    if(mkdir("iputdir") < 0){
    2dc7:	c7 04 24 45 4f 00 00 	movl   $0x4f45,(%esp)
    2dce:	e8 5a 0f 00 00       	call   3d2d <mkdir>
    2dd3:	85 c0                	test   %eax,%eax
    2dd5:	0f 88 93 00 00 00    	js     2e6e <exitiputtest+0xce>
    if(chdir("iputdir") < 0){
    2ddb:	c7 04 24 45 4f 00 00 	movl   $0x4f45,(%esp)
    2de2:	e8 4e 0f 00 00       	call   3d35 <chdir>
    2de7:	85 c0                	test   %eax,%eax
    2de9:	78 69                	js     2e54 <exitiputtest+0xb4>
    if(unlink("../iputdir") < 0){
    2deb:	c7 04 24 42 4f 00 00 	movl   $0x4f42,(%esp)
    2df2:	e8 1e 0f 00 00       	call   3d15 <unlink>
    2df7:	85 c0                	test   %eax,%eax
    2df9:	78 25                	js     2e20 <exitiputtest+0x80>
    exit();
    2dfb:	e8 c5 0e 00 00       	call   3cc5 <exit>
  wait();
    2e00:	e8 c8 0e 00 00       	call   3ccd <wait>
  printf(stdout, "exitiput test ok\n");
    2e05:	a1 4c 59 00 00       	mov    0x594c,%eax
    2e0a:	c7 44 24 04 67 4f 00 	movl   $0x4f67,0x4(%esp)
    2e11:	00 
    2e12:	89 04 24             	mov    %eax,(%esp)
    2e15:	e8 f6 0f 00 00       	call   3e10 <printf>
}
    2e1a:	c9                   	leave  
    2e1b:	c3                   	ret    
    2e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(stdout, "unlink ../iputdir failed\n");
    2e20:	a1 4c 59 00 00       	mov    0x594c,%eax
    2e25:	c7 44 24 04 4d 4f 00 	movl   $0x4f4d,0x4(%esp)
    2e2c:	00 
    2e2d:	89 04 24             	mov    %eax,(%esp)
    2e30:	e8 db 0f 00 00       	call   3e10 <printf>
      exit();
    2e35:	e8 8b 0e 00 00       	call   3cc5 <exit>
    printf(stdout, "fork failed\n");
    2e3a:	a1 4c 59 00 00       	mov    0x594c,%eax
    2e3f:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
    2e46:	00 
    2e47:	89 04 24             	mov    %eax,(%esp)
    2e4a:	e8 c1 0f 00 00       	call   3e10 <printf>
    exit();
    2e4f:	e8 71 0e 00 00       	call   3cc5 <exit>
      printf(stdout, "child chdir failed\n");
    2e54:	a1 4c 59 00 00       	mov    0x594c,%eax
    2e59:	c7 44 24 04 2e 4f 00 	movl   $0x4f2e,0x4(%esp)
    2e60:	00 
    2e61:	89 04 24             	mov    %eax,(%esp)
    2e64:	e8 a7 0f 00 00       	call   3e10 <printf>
      exit();
    2e69:	e8 57 0e 00 00       	call   3cc5 <exit>
      printf(stdout, "mkdir failed\n");
    2e6e:	a1 4c 59 00 00       	mov    0x594c,%eax
    2e73:	c7 44 24 04 ca 4e 00 	movl   $0x4eca,0x4(%esp)
    2e7a:	00 
    2e7b:	89 04 24             	mov    %eax,(%esp)
    2e7e:	e8 8d 0f 00 00       	call   3e10 <printf>
      exit();
    2e83:	e8 3d 0e 00 00       	call   3cc5 <exit>
    2e88:	90                   	nop
    2e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002e90 <iputtest>:
{
    2e90:	55                   	push   %ebp
    2e91:	89 e5                	mov    %esp,%ebp
    2e93:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "iput test\n");
    2e96:	a1 4c 59 00 00       	mov    0x594c,%eax
    2e9b:	c7 44 24 04 6c 49 00 	movl   $0x496c,0x4(%esp)
    2ea2:	00 
    2ea3:	89 04 24             	mov    %eax,(%esp)
    2ea6:	e8 65 0f 00 00       	call   3e10 <printf>
  if(mkdir("iputdir") < 0){
    2eab:	c7 04 24 45 4f 00 00 	movl   $0x4f45,(%esp)
    2eb2:	e8 76 0e 00 00       	call   3d2d <mkdir>
    2eb7:	85 c0                	test   %eax,%eax
    2eb9:	78 4b                	js     2f06 <iputtest+0x76>
  if(chdir("iputdir") < 0){
    2ebb:	c7 04 24 45 4f 00 00 	movl   $0x4f45,(%esp)
    2ec2:	e8 6e 0e 00 00       	call   3d35 <chdir>
    2ec7:	85 c0                	test   %eax,%eax
    2ec9:	0f 88 85 00 00 00    	js     2f54 <iputtest+0xc4>
  if(unlink("../iputdir") < 0){
    2ecf:	c7 04 24 42 4f 00 00 	movl   $0x4f42,(%esp)
    2ed6:	e8 3a 0e 00 00       	call   3d15 <unlink>
    2edb:	85 c0                	test   %eax,%eax
    2edd:	78 5b                	js     2f3a <iputtest+0xaa>
  if(chdir("/") < 0){
    2edf:	c7 04 24 e9 49 00 00 	movl   $0x49e9,(%esp)
    2ee6:	e8 4a 0e 00 00       	call   3d35 <chdir>
    2eeb:	85 c0                	test   %eax,%eax
    2eed:	78 31                	js     2f20 <iputtest+0x90>
  printf(stdout, "iput test ok\n");
    2eef:	a1 4c 59 00 00       	mov    0x594c,%eax
    2ef4:	c7 44 24 04 95 49 00 	movl   $0x4995,0x4(%esp)
    2efb:	00 
    2efc:	89 04 24             	mov    %eax,(%esp)
    2eff:	e8 0c 0f 00 00       	call   3e10 <printf>
}
    2f04:	c9                   	leave  
    2f05:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
    2f06:	a1 4c 59 00 00       	mov    0x594c,%eax
    2f0b:	c7 44 24 04 ca 4e 00 	movl   $0x4eca,0x4(%esp)
    2f12:	00 
    2f13:	89 04 24             	mov    %eax,(%esp)
    2f16:	e8 f5 0e 00 00       	call   3e10 <printf>
    exit();
    2f1b:	e8 a5 0d 00 00       	call   3cc5 <exit>
    printf(stdout, "chdir / failed\n");
    2f20:	a1 4c 59 00 00       	mov    0x594c,%eax
    2f25:	c7 44 24 04 39 4b 00 	movl   $0x4b39,0x4(%esp)
    2f2c:	00 
    2f2d:	89 04 24             	mov    %eax,(%esp)
    2f30:	e8 db 0e 00 00       	call   3e10 <printf>
    exit();
    2f35:	e8 8b 0d 00 00       	call   3cc5 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
    2f3a:	a1 4c 59 00 00       	mov    0x594c,%eax
    2f3f:	c7 44 24 04 4d 4f 00 	movl   $0x4f4d,0x4(%esp)
    2f46:	00 
    2f47:	89 04 24             	mov    %eax,(%esp)
    2f4a:	e8 c1 0e 00 00       	call   3e10 <printf>
    exit();
    2f4f:	e8 71 0d 00 00       	call   3cc5 <exit>
    printf(stdout, "chdir iputdir failed\n");
    2f54:	a1 4c 59 00 00       	mov    0x594c,%eax
    2f59:	c7 44 24 04 79 4f 00 	movl   $0x4f79,0x4(%esp)
    2f60:	00 
    2f61:	89 04 24             	mov    %eax,(%esp)
    2f64:	e8 a7 0e 00 00       	call   3e10 <printf>
    exit();
    2f69:	e8 57 0d 00 00       	call   3cc5 <exit>
    2f6e:	66 90                	xchg   %ax,%ax

00002f70 <bigfile>:
{
    2f70:	55                   	push   %ebp
    2f71:	89 e5                	mov    %esp,%ebp
    2f73:	57                   	push   %edi
    2f74:	56                   	push   %esi
    2f75:	53                   	push   %ebx
    2f76:	83 ec 1c             	sub    $0x1c,%esp
  printf(1, "bigfile test\n");
    2f79:	c7 44 24 04 8f 4f 00 	movl   $0x4f8f,0x4(%esp)
    2f80:	00 
    2f81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f88:	e8 83 0e 00 00       	call   3e10 <printf>
  unlink("bigfile");
    2f8d:	c7 04 24 ab 4f 00 00 	movl   $0x4fab,(%esp)
    2f94:	e8 7c 0d 00 00       	call   3d15 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2f99:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2fa0:	00 
    2fa1:	c7 04 24 ab 4f 00 00 	movl   $0x4fab,(%esp)
    2fa8:	e8 58 0d 00 00       	call   3d05 <open>
  if(fd < 0){
    2fad:	85 c0                	test   %eax,%eax
  fd = open("bigfile", O_CREATE | O_RDWR);
    2faf:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2fb1:	0f 88 7f 01 00 00    	js     3136 <bigfile+0x1c6>
    exit();
    2fb7:	31 db                	xor    %ebx,%ebx
    2fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    2fc0:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    2fc7:	00 
    2fc8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    2fcc:	c7 04 24 20 81 00 00 	movl   $0x8120,(%esp)
    2fd3:	e8 68 0b 00 00       	call   3b40 <memset>
    if(write(fd, buf, 600) != 600){
    2fd8:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    2fdf:	00 
    2fe0:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    2fe7:	00 
    2fe8:	89 34 24             	mov    %esi,(%esp)
    2feb:	e8 f5 0c 00 00       	call   3ce5 <write>
    2ff0:	3d 58 02 00 00       	cmp    $0x258,%eax
    2ff5:	0f 85 09 01 00 00    	jne    3104 <bigfile+0x194>
  for(i = 0; i < 20; i++){
    2ffb:	83 c3 01             	add    $0x1,%ebx
    2ffe:	83 fb 14             	cmp    $0x14,%ebx
    3001:	75 bd                	jne    2fc0 <bigfile+0x50>
  close(fd);
    3003:	89 34 24             	mov    %esi,(%esp)
    3006:	e8 e2 0c 00 00       	call   3ced <close>
  fd = open("bigfile", 0);
    300b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3012:	00 
    3013:	c7 04 24 ab 4f 00 00 	movl   $0x4fab,(%esp)
    301a:	e8 e6 0c 00 00       	call   3d05 <open>
  if(fd < 0){
    301f:	85 c0                	test   %eax,%eax
  fd = open("bigfile", 0);
    3021:	89 c7                	mov    %eax,%edi
  if(fd < 0){
    3023:	0f 88 f4 00 00 00    	js     311d <bigfile+0x1ad>
    exit();
    3029:	31 f6                	xor    %esi,%esi
    302b:	31 db                	xor    %ebx,%ebx
    302d:	eb 2f                	jmp    305e <bigfile+0xee>
    302f:	90                   	nop
    if(cc != 300){
    3030:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    3035:	0f 85 97 00 00 00    	jne    30d2 <bigfile+0x162>
    if(buf[0] != i/2 || buf[299] != i/2){
    303b:	0f be 05 20 81 00 00 	movsbl 0x8120,%eax
    3042:	89 da                	mov    %ebx,%edx
    3044:	d1 fa                	sar    %edx
    3046:	39 d0                	cmp    %edx,%eax
    3048:	75 6f                	jne    30b9 <bigfile+0x149>
    304a:	0f be 15 4b 82 00 00 	movsbl 0x824b,%edx
    3051:	39 d0                	cmp    %edx,%eax
    3053:	75 64                	jne    30b9 <bigfile+0x149>
    total += cc;
    3055:	81 c6 2c 01 00 00    	add    $0x12c,%esi
  for(i = 0; ; i++){
    305b:	83 c3 01             	add    $0x1,%ebx
    cc = read(fd, buf, 300);
    305e:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    3065:	00 
    3066:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    306d:	00 
    306e:	89 3c 24             	mov    %edi,(%esp)
    3071:	e8 67 0c 00 00       	call   3cdd <read>
    if(cc < 0){
    3076:	83 f8 00             	cmp    $0x0,%eax
    3079:	7c 70                	jl     30eb <bigfile+0x17b>
    if(cc == 0)
    307b:	75 b3                	jne    3030 <bigfile+0xc0>
  close(fd);
    307d:	89 3c 24             	mov    %edi,(%esp)
    3080:	e8 68 0c 00 00       	call   3ced <close>
  if(total != 20*600){
    3085:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    308b:	0f 85 be 00 00 00    	jne    314f <bigfile+0x1df>
  unlink("bigfile");
    3091:	c7 04 24 ab 4f 00 00 	movl   $0x4fab,(%esp)
    3098:	e8 78 0c 00 00       	call   3d15 <unlink>
  printf(1, "bigfile test ok\n");
    309d:	c7 44 24 04 3a 50 00 	movl   $0x503a,0x4(%esp)
    30a4:	00 
    30a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30ac:	e8 5f 0d 00 00       	call   3e10 <printf>
}
    30b1:	83 c4 1c             	add    $0x1c,%esp
    30b4:	5b                   	pop    %ebx
    30b5:	5e                   	pop    %esi
    30b6:	5f                   	pop    %edi
    30b7:	5d                   	pop    %ebp
    30b8:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    30b9:	c7 44 24 04 07 50 00 	movl   $0x5007,0x4(%esp)
    30c0:	00 
    30c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30c8:	e8 43 0d 00 00       	call   3e10 <printf>
      exit();
    30cd:	e8 f3 0b 00 00       	call   3cc5 <exit>
      printf(1, "short read bigfile\n");
    30d2:	c7 44 24 04 f3 4f 00 	movl   $0x4ff3,0x4(%esp)
    30d9:	00 
    30da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30e1:	e8 2a 0d 00 00       	call   3e10 <printf>
      exit();
    30e6:	e8 da 0b 00 00       	call   3cc5 <exit>
      printf(1, "read bigfile failed\n");
    30eb:	c7 44 24 04 de 4f 00 	movl   $0x4fde,0x4(%esp)
    30f2:	00 
    30f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30fa:	e8 11 0d 00 00       	call   3e10 <printf>
      exit();
    30ff:	e8 c1 0b 00 00       	call   3cc5 <exit>
      printf(1, "write bigfile failed\n");
    3104:	c7 44 24 04 b3 4f 00 	movl   $0x4fb3,0x4(%esp)
    310b:	00 
    310c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3113:	e8 f8 0c 00 00       	call   3e10 <printf>
      exit();
    3118:	e8 a8 0b 00 00       	call   3cc5 <exit>
    printf(1, "cannot open bigfile\n");
    311d:	c7 44 24 04 c9 4f 00 	movl   $0x4fc9,0x4(%esp)
    3124:	00 
    3125:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    312c:	e8 df 0c 00 00       	call   3e10 <printf>
    exit();
    3131:	e8 8f 0b 00 00       	call   3cc5 <exit>
    printf(1, "cannot create bigfile");
    3136:	c7 44 24 04 9d 4f 00 	movl   $0x4f9d,0x4(%esp)
    313d:	00 
    313e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3145:	e8 c6 0c 00 00       	call   3e10 <printf>
    exit();
    314a:	e8 76 0b 00 00       	call   3cc5 <exit>
    printf(1, "read bigfile wrong total\n");
    314f:	c7 44 24 04 20 50 00 	movl   $0x5020,0x4(%esp)
    3156:	00 
    3157:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    315e:	e8 ad 0c 00 00       	call   3e10 <printf>
    exit();
    3163:	e8 5d 0b 00 00       	call   3cc5 <exit>
    3168:	90                   	nop
    3169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003170 <concreate>:
{
    3170:	55                   	push   %ebp
    3171:	89 e5                	mov    %esp,%ebp
    3173:	57                   	push   %edi
    3174:	56                   	push   %esi
    3175:	53                   	push   %ebx
  file[2] = '\0';
    3176:	31 db                	xor    %ebx,%ebx
{
    3178:	83 ec 6c             	sub    $0x6c,%esp
  printf(1, "concreate test\n");
    317b:	c7 44 24 04 4b 50 00 	movl   $0x504b,0x4(%esp)
    3182:	00 
    3183:	8d 75 e5             	lea    -0x1b(%ebp),%esi
    3186:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    318d:	e8 7e 0c 00 00       	call   3e10 <printf>
  file[0] = 'C';
    3192:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    3196:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    319a:	eb 4f                	jmp    31eb <concreate+0x7b>
    319c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid && (i % 3) == 1){
    31a0:	b8 56 55 55 55       	mov    $0x55555556,%eax
    31a5:	f7 eb                	imul   %ebx
    31a7:	89 d8                	mov    %ebx,%eax
    31a9:	c1 f8 1f             	sar    $0x1f,%eax
    31ac:	29 c2                	sub    %eax,%edx
    31ae:	8d 04 52             	lea    (%edx,%edx,2),%eax
    31b1:	89 da                	mov    %ebx,%edx
    31b3:	29 c2                	sub    %eax,%edx
    31b5:	83 fa 01             	cmp    $0x1,%edx
    31b8:	74 7e                	je     3238 <concreate+0xc8>
      fd = open(file, O_CREATE | O_RDWR);
    31ba:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    31c1:	00 
    31c2:	89 34 24             	mov    %esi,(%esp)
    31c5:	e8 3b 0b 00 00       	call   3d05 <open>
      if(fd < 0){
    31ca:	85 c0                	test   %eax,%eax
    31cc:	0f 88 5b 02 00 00    	js     342d <concreate+0x2bd>
      close(fd);
    31d2:	89 04 24             	mov    %eax,(%esp)
    31d5:	e8 13 0b 00 00       	call   3ced <close>
    if(pid == 0)
    31da:	85 ff                	test   %edi,%edi
    31dc:	74 52                	je     3230 <concreate+0xc0>
  for(i = 0; i < 40; i++){
    31de:	83 c3 01             	add    $0x1,%ebx
      wait();
    31e1:	e8 e7 0a 00 00       	call   3ccd <wait>
  for(i = 0; i < 40; i++){
    31e6:	83 fb 28             	cmp    $0x28,%ebx
    31e9:	74 6d                	je     3258 <concreate+0xe8>
    file[1] = '0' + i;
    31eb:	8d 43 30             	lea    0x30(%ebx),%eax
    31ee:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    31f1:	89 34 24             	mov    %esi,(%esp)
    31f4:	e8 1c 0b 00 00       	call   3d15 <unlink>
    pid = fork();
    31f9:	e8 bf 0a 00 00       	call   3cbd <fork>
    if(pid && (i % 3) == 1){
    31fe:	85 c0                	test   %eax,%eax
    pid = fork();
    3200:	89 c7                	mov    %eax,%edi
    if(pid && (i % 3) == 1){
    3202:	75 9c                	jne    31a0 <concreate+0x30>
    } else if(pid == 0 && (i % 5) == 1){
    3204:	b8 67 66 66 66       	mov    $0x66666667,%eax
    3209:	f7 eb                	imul   %ebx
    320b:	89 d8                	mov    %ebx,%eax
    320d:	c1 f8 1f             	sar    $0x1f,%eax
    3210:	d1 fa                	sar    %edx
    3212:	29 c2                	sub    %eax,%edx
    3214:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3217:	89 da                	mov    %ebx,%edx
    3219:	29 c2                	sub    %eax,%edx
    321b:	83 fa 01             	cmp    $0x1,%edx
    321e:	75 9a                	jne    31ba <concreate+0x4a>
      link("C0", file);
    3220:	89 74 24 04          	mov    %esi,0x4(%esp)
    3224:	c7 04 24 5b 50 00 00 	movl   $0x505b,(%esp)
    322b:	e8 f5 0a 00 00       	call   3d25 <link>
        exit();
    3230:	e8 90 0a 00 00       	call   3cc5 <exit>
    3235:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 40; i++){
    3238:	83 c3 01             	add    $0x1,%ebx
      link("C0", file);
    323b:	89 74 24 04          	mov    %esi,0x4(%esp)
    323f:	c7 04 24 5b 50 00 00 	movl   $0x505b,(%esp)
    3246:	e8 da 0a 00 00       	call   3d25 <link>
      wait();
    324b:	e8 7d 0a 00 00       	call   3ccd <wait>
  for(i = 0; i < 40; i++){
    3250:	83 fb 28             	cmp    $0x28,%ebx
    3253:	75 96                	jne    31eb <concreate+0x7b>
    3255:	8d 76 00             	lea    0x0(%esi),%esi
  memset(fa, 0, sizeof(fa));
    3258:	8d 45 ac             	lea    -0x54(%ebp),%eax
    325b:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    3262:	00 
    3263:	8d 7d d4             	lea    -0x2c(%ebp),%edi
    3266:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    326d:	00 
    326e:	89 04 24             	mov    %eax,(%esp)
    3271:	e8 ca 08 00 00       	call   3b40 <memset>
  fd = open(".", 0);
    3276:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    327d:	00 
    327e:	c7 04 24 d2 4c 00 00 	movl   $0x4cd2,(%esp)
    3285:	e8 7b 0a 00 00       	call   3d05 <open>
    328a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    3291:	89 c3                	mov    %eax,%ebx
    3293:	90                   	nop
    3294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    3298:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    329f:	00 
    32a0:	89 7c 24 04          	mov    %edi,0x4(%esp)
    32a4:	89 1c 24             	mov    %ebx,(%esp)
    32a7:	e8 31 0a 00 00       	call   3cdd <read>
    32ac:	85 c0                	test   %eax,%eax
    32ae:	7e 40                	jle    32f0 <concreate+0x180>
    if(de.inum == 0)
    32b0:	66 83 7d d4 00       	cmpw   $0x0,-0x2c(%ebp)
    32b5:	74 e1                	je     3298 <concreate+0x128>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    32b7:	80 7d d6 43          	cmpb   $0x43,-0x2a(%ebp)
    32bb:	90                   	nop
    32bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    32c0:	75 d6                	jne    3298 <concreate+0x128>
    32c2:	80 7d d8 00          	cmpb   $0x0,-0x28(%ebp)
    32c6:	75 d0                	jne    3298 <concreate+0x128>
      i = de.name[1] - '0';
    32c8:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
    32cc:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    32cf:	83 f8 27             	cmp    $0x27,%eax
    32d2:	0f 87 72 01 00 00    	ja     344a <concreate+0x2da>
      if(fa[i]){
    32d8:	80 7c 05 ac 00       	cmpb   $0x0,-0x54(%ebp,%eax,1)
    32dd:	0f 85 a0 01 00 00    	jne    3483 <concreate+0x313>
      fa[i] = 1;
    32e3:	c6 44 05 ac 01       	movb   $0x1,-0x54(%ebp,%eax,1)
      n++;
    32e8:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    32ec:	eb aa                	jmp    3298 <concreate+0x128>
    32ee:	66 90                	xchg   %ax,%ax
  close(fd);
    32f0:	89 1c 24             	mov    %ebx,(%esp)
    32f3:	e8 f5 09 00 00       	call   3ced <close>
  if(n != 40){
    32f8:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    32fc:	0f 85 68 01 00 00    	jne    346a <concreate+0x2fa>
    exit();
    3302:	31 db                	xor    %ebx,%ebx
    3304:	e9 92 00 00 00       	jmp    339b <concreate+0x22b>
    3309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(((i % 3) == 0 && pid == 0) ||
    3310:	83 f8 01             	cmp    $0x1,%eax
    3313:	0f 85 b6 00 00 00    	jne    33cf <concreate+0x25f>
    3319:	85 ff                	test   %edi,%edi
    331b:	90                   	nop
    331c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3320:	0f 84 a9 00 00 00    	je     33cf <concreate+0x25f>
      close(open(file, 0));
    3326:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    332d:	00 
    332e:	89 34 24             	mov    %esi,(%esp)
    3331:	e8 cf 09 00 00       	call   3d05 <open>
    3336:	89 04 24             	mov    %eax,(%esp)
    3339:	e8 af 09 00 00       	call   3ced <close>
      close(open(file, 0));
    333e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3345:	00 
    3346:	89 34 24             	mov    %esi,(%esp)
    3349:	e8 b7 09 00 00       	call   3d05 <open>
    334e:	89 04 24             	mov    %eax,(%esp)
    3351:	e8 97 09 00 00       	call   3ced <close>
      close(open(file, 0));
    3356:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    335d:	00 
    335e:	89 34 24             	mov    %esi,(%esp)
    3361:	e8 9f 09 00 00       	call   3d05 <open>
    3366:	89 04 24             	mov    %eax,(%esp)
    3369:	e8 7f 09 00 00       	call   3ced <close>
      close(open(file, 0));
    336e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3375:	00 
    3376:	89 34 24             	mov    %esi,(%esp)
    3379:	e8 87 09 00 00       	call   3d05 <open>
    337e:	89 04 24             	mov    %eax,(%esp)
    3381:	e8 67 09 00 00       	call   3ced <close>
    if(pid == 0)
    3386:	85 ff                	test   %edi,%edi
    3388:	0f 84 a2 fe ff ff    	je     3230 <concreate+0xc0>
  for(i = 0; i < 40; i++){
    338e:	83 c3 01             	add    $0x1,%ebx
      wait();
    3391:	e8 37 09 00 00       	call   3ccd <wait>
  for(i = 0; i < 40; i++){
    3396:	83 fb 28             	cmp    $0x28,%ebx
    3399:	74 5d                	je     33f8 <concreate+0x288>
    file[1] = '0' + i;
    339b:	8d 43 30             	lea    0x30(%ebx),%eax
    339e:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    33a1:	e8 17 09 00 00       	call   3cbd <fork>
    if(pid < 0){
    33a6:	85 c0                	test   %eax,%eax
    pid = fork();
    33a8:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    33aa:	78 68                	js     3414 <concreate+0x2a4>
    if(((i % 3) == 0 && pid == 0) ||
    33ac:	b8 56 55 55 55       	mov    $0x55555556,%eax
    33b1:	f7 eb                	imul   %ebx
    33b3:	89 d8                	mov    %ebx,%eax
    33b5:	c1 f8 1f             	sar    $0x1f,%eax
    33b8:	29 c2                	sub    %eax,%edx
    33ba:	89 d8                	mov    %ebx,%eax
    33bc:	8d 14 52             	lea    (%edx,%edx,2),%edx
    33bf:	29 d0                	sub    %edx,%eax
    33c1:	0f 85 49 ff ff ff    	jne    3310 <concreate+0x1a0>
    33c7:	85 ff                	test   %edi,%edi
    33c9:	0f 84 57 ff ff ff    	je     3326 <concreate+0x1b6>
      unlink(file);
    33cf:	89 34 24             	mov    %esi,(%esp)
    33d2:	e8 3e 09 00 00       	call   3d15 <unlink>
      unlink(file);
    33d7:	89 34 24             	mov    %esi,(%esp)
    33da:	e8 36 09 00 00       	call   3d15 <unlink>
      unlink(file);
    33df:	89 34 24             	mov    %esi,(%esp)
    33e2:	e8 2e 09 00 00       	call   3d15 <unlink>
      unlink(file);
    33e7:	89 34 24             	mov    %esi,(%esp)
    33ea:	e8 26 09 00 00       	call   3d15 <unlink>
    33ef:	eb 95                	jmp    3386 <concreate+0x216>
    33f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "concreate ok\n");
    33f8:	c7 44 24 04 b0 50 00 	movl   $0x50b0,0x4(%esp)
    33ff:	00 
    3400:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3407:	e8 04 0a 00 00       	call   3e10 <printf>
}
    340c:	83 c4 6c             	add    $0x6c,%esp
    340f:	5b                   	pop    %ebx
    3410:	5e                   	pop    %esi
    3411:	5f                   	pop    %edi
    3412:	5d                   	pop    %ebp
    3413:	c3                   	ret    
      printf(1, "fork failed\n");
    3414:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
    341b:	00 
    341c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3423:	e8 e8 09 00 00       	call   3e10 <printf>
      exit();
    3428:	e8 98 08 00 00       	call   3cc5 <exit>
        printf(1, "concreate create %s failed\n", file);
    342d:	89 74 24 08          	mov    %esi,0x8(%esp)
    3431:	c7 44 24 04 5e 50 00 	movl   $0x505e,0x4(%esp)
    3438:	00 
    3439:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3440:	e8 cb 09 00 00       	call   3e10 <printf>
        exit();
    3445:	e8 7b 08 00 00       	call   3cc5 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    344a:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    344d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3451:	c7 44 24 04 7a 50 00 	movl   $0x507a,0x4(%esp)
    3458:	00 
    3459:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3460:	e8 ab 09 00 00       	call   3e10 <printf>
    3465:	e9 c6 fd ff ff       	jmp    3230 <concreate+0xc0>
    printf(1, "concreate not enough files in directory listing\n");
    346a:	c7 44 24 04 48 58 00 	movl   $0x5848,0x4(%esp)
    3471:	00 
    3472:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3479:	e8 92 09 00 00       	call   3e10 <printf>
    exit();
    347e:	e8 42 08 00 00       	call   3cc5 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    3483:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    3486:	89 44 24 08          	mov    %eax,0x8(%esp)
    348a:	c7 44 24 04 93 50 00 	movl   $0x5093,0x4(%esp)
    3491:	00 
    3492:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3499:	e8 72 09 00 00       	call   3e10 <printf>
        exit();
    349e:	e8 22 08 00 00       	call   3cc5 <exit>
    34a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    34a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000034b0 <fourfiles>:
{
    34b0:	55                   	push   %ebp
    34b1:	89 e5                	mov    %esp,%ebp
    34b3:	57                   	push   %edi
    34b4:	56                   	push   %esi
  printf(1, "fourfiles test\n");
    34b5:	be be 50 00 00       	mov    $0x50be,%esi
{
    34ba:	53                   	push   %ebx
  printf(1, "fourfiles test\n");
    34bb:	31 db                	xor    %ebx,%ebx
{
    34bd:	83 ec 3c             	sub    $0x3c,%esp
  printf(1, "fourfiles test\n");
    34c0:	c7 44 24 04 c4 50 00 	movl   $0x50c4,0x4(%esp)
    34c7:	00 
  for(pi = 0; pi < 4; pi++){
    34c8:	8d 7d d8             	lea    -0x28(%ebp),%edi
  char *names[] = { "f0", "f1", "f2", "f3" };
    34cb:	c7 45 d8 be 50 00 00 	movl   $0x50be,-0x28(%ebp)
    34d2:	c7 45 dc 07 47 00 00 	movl   $0x4707,-0x24(%ebp)
    34d9:	c7 45 e0 0b 47 00 00 	movl   $0x470b,-0x20(%ebp)
    34e0:	c7 45 e4 c1 50 00 00 	movl   $0x50c1,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    34e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34ee:	e8 1d 09 00 00       	call   3e10 <printf>
    unlink(fname);
    34f3:	89 34 24             	mov    %esi,(%esp)
    34f6:	e8 1a 08 00 00       	call   3d15 <unlink>
    pid = fork();
    34fb:	e8 bd 07 00 00       	call   3cbd <fork>
    if(pid < 0){
    3500:	83 f8 00             	cmp    $0x0,%eax
    3503:	0f 8c 88 01 00 00    	jl     3691 <fourfiles+0x1e1>
    if(pid == 0){
    3509:	0f 84 e8 00 00 00    	je     35f7 <fourfiles+0x147>
  for(pi = 0; pi < 4; pi++){
    350f:	83 c3 01             	add    $0x1,%ebx
    3512:	83 fb 04             	cmp    $0x4,%ebx
    3515:	74 05                	je     351c <fourfiles+0x6c>
    3517:	8b 34 9f             	mov    (%edi,%ebx,4),%esi
    351a:	eb d7                	jmp    34f3 <fourfiles+0x43>
    351c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    wait();
    3520:	e8 a8 07 00 00       	call   3ccd <wait>
    3525:	bb 30 00 00 00       	mov    $0x30,%ebx
    352a:	e8 9e 07 00 00       	call   3ccd <wait>
    352f:	e8 99 07 00 00       	call   3ccd <wait>
    3534:	e8 94 07 00 00       	call   3ccd <wait>
    3539:	c7 45 d4 be 50 00 00 	movl   $0x50be,-0x2c(%ebp)
    fd = open(fname, 0);
    3540:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3543:	31 f6                	xor    %esi,%esi
    3545:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    354c:	00 
    354d:	89 04 24             	mov    %eax,(%esp)
    3550:	e8 b0 07 00 00       	call   3d05 <open>
    3555:	89 c7                	mov    %eax,%edi
    3557:	90                   	nop
    while((n = read(fd, buf, sizeof(buf))) > 0){
    3558:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    355f:	00 
    3560:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    3567:	00 
    3568:	89 3c 24             	mov    %edi,(%esp)
    356b:	e8 6d 07 00 00       	call   3cdd <read>
    3570:	85 c0                	test   %eax,%eax
    3572:	7e 1a                	jle    358e <fourfiles+0xde>
    3574:	31 d2                	xor    %edx,%edx
    3576:	66 90                	xchg   %ax,%ax
        if(buf[j] != '0'+i){
    3578:	0f be 8a 20 81 00 00 	movsbl 0x8120(%edx),%ecx
    357f:	39 d9                	cmp    %ebx,%ecx
    3581:	75 5b                	jne    35de <fourfiles+0x12e>
      for(j = 0; j < n; j++){
    3583:	83 c2 01             	add    $0x1,%edx
    3586:	39 d0                	cmp    %edx,%eax
    3588:	7f ee                	jg     3578 <fourfiles+0xc8>
      total += n;
    358a:	01 c6                	add    %eax,%esi
    358c:	eb ca                	jmp    3558 <fourfiles+0xa8>
    close(fd);
    358e:	89 3c 24             	mov    %edi,(%esp)
    3591:	e8 57 07 00 00       	call   3ced <close>
    if(total != 12*500){
    3596:	81 fe 70 17 00 00    	cmp    $0x1770,%esi
    359c:	0f 85 d2 00 00 00    	jne    3674 <fourfiles+0x1c4>
    unlink(fname);
    35a2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    35a5:	89 04 24             	mov    %eax,(%esp)
    35a8:	e8 68 07 00 00       	call   3d15 <unlink>
  for(i = 0; i < 2; i++){
    35ad:	83 fb 31             	cmp    $0x31,%ebx
    35b0:	75 1c                	jne    35ce <fourfiles+0x11e>
  printf(1, "fourfiles ok\n");
    35b2:	c7 44 24 04 02 51 00 	movl   $0x5102,0x4(%esp)
    35b9:	00 
    35ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35c1:	e8 4a 08 00 00       	call   3e10 <printf>
}
    35c6:	83 c4 3c             	add    $0x3c,%esp
    35c9:	5b                   	pop    %ebx
    35ca:	5e                   	pop    %esi
    35cb:	5f                   	pop    %edi
    35cc:	5d                   	pop    %ebp
    35cd:	c3                   	ret    
  for(i = 0; i < 2; i++){
    35ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
    35d1:	bb 31 00 00 00       	mov    $0x31,%ebx
    35d6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    35d9:	e9 62 ff ff ff       	jmp    3540 <fourfiles+0x90>
          printf(1, "wrong char\n");
    35de:	c7 44 24 04 e5 50 00 	movl   $0x50e5,0x4(%esp)
    35e5:	00 
    35e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35ed:	e8 1e 08 00 00       	call   3e10 <printf>
          exit();
    35f2:	e8 ce 06 00 00       	call   3cc5 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    35f7:	89 34 24             	mov    %esi,(%esp)
    35fa:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3601:	00 
    3602:	e8 fe 06 00 00       	call   3d05 <open>
      if(fd < 0){
    3607:	85 c0                	test   %eax,%eax
      fd = open(fname, O_CREATE | O_RDWR);
    3609:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    360b:	0f 88 99 00 00 00    	js     36aa <fourfiles+0x1fa>
      memset(buf, '0'+pi, 512);
    3611:	83 c3 30             	add    $0x30,%ebx
    3614:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    3618:	31 db                	xor    %ebx,%ebx
    361a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3621:	00 
    3622:	c7 04 24 20 81 00 00 	movl   $0x8120,(%esp)
    3629:	e8 12 05 00 00       	call   3b40 <memset>
    362e:	eb 08                	jmp    3638 <fourfiles+0x188>
      for(i = 0; i < 12; i++){
    3630:	83 c3 01             	add    $0x1,%ebx
    3633:	83 fb 0c             	cmp    $0xc,%ebx
    3636:	74 ba                	je     35f2 <fourfiles+0x142>
        if((n = write(fd, buf, 500)) != 500){
    3638:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
    363f:	00 
    3640:	c7 44 24 04 20 81 00 	movl   $0x8120,0x4(%esp)
    3647:	00 
    3648:	89 34 24             	mov    %esi,(%esp)
    364b:	e8 95 06 00 00       	call   3ce5 <write>
    3650:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    3655:	74 d9                	je     3630 <fourfiles+0x180>
          printf(1, "write failed %d\n", n);
    3657:	89 44 24 08          	mov    %eax,0x8(%esp)
    365b:	c7 44 24 04 d4 50 00 	movl   $0x50d4,0x4(%esp)
    3662:	00 
    3663:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    366a:	e8 a1 07 00 00       	call   3e10 <printf>
          exit();
    366f:	e8 51 06 00 00       	call   3cc5 <exit>
      printf(1, "wrong length %d\n", total);
    3674:	89 74 24 08          	mov    %esi,0x8(%esp)
    3678:	c7 44 24 04 f1 50 00 	movl   $0x50f1,0x4(%esp)
    367f:	00 
    3680:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3687:	e8 84 07 00 00       	call   3e10 <printf>
      exit();
    368c:	e8 34 06 00 00       	call   3cc5 <exit>
      printf(1, "fork failed\n");
    3691:	c7 44 24 04 ff 45 00 	movl   $0x45ff,0x4(%esp)
    3698:	00 
    3699:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36a0:	e8 6b 07 00 00       	call   3e10 <printf>
      exit();
    36a5:	e8 1b 06 00 00       	call   3cc5 <exit>
        printf(1, "create failed\n");
    36aa:	c7 44 24 04 95 46 00 	movl   $0x4695,0x4(%esp)
    36b1:	00 
    36b2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36b9:	e8 52 07 00 00       	call   3e10 <printf>
        exit();
    36be:	e8 02 06 00 00       	call   3cc5 <exit>
    36c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036d0 <sharedfd>:
{
    36d0:	55                   	push   %ebp
    36d1:	89 e5                	mov    %esp,%ebp
    36d3:	57                   	push   %edi
    36d4:	56                   	push   %esi
    36d5:	53                   	push   %ebx
    36d6:	83 ec 3c             	sub    $0x3c,%esp
  printf(1, "sharedfd test\n");
    36d9:	c7 44 24 04 10 51 00 	movl   $0x5110,0x4(%esp)
    36e0:	00 
    36e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36e8:	e8 23 07 00 00       	call   3e10 <printf>
  unlink("sharedfd");
    36ed:	c7 04 24 1f 51 00 00 	movl   $0x511f,(%esp)
    36f4:	e8 1c 06 00 00       	call   3d15 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    36f9:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3700:	00 
    3701:	c7 04 24 1f 51 00 00 	movl   $0x511f,(%esp)
    3708:	e8 f8 05 00 00       	call   3d05 <open>
  if(fd < 0){
    370d:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
    370f:	89 c7                	mov    %eax,%edi
  if(fd < 0){
    3711:	0f 88 2d 01 00 00    	js     3844 <sharedfd+0x174>
  pid = fork();
    3717:	e8 a1 05 00 00       	call   3cbd <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
    371c:	8d 75 de             	lea    -0x22(%ebp),%esi
    371f:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
    3722:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
    3725:	19 c0                	sbb    %eax,%eax
    3727:	31 db                	xor    %ebx,%ebx
    3729:	83 e0 f3             	and    $0xfffffff3,%eax
    372c:	83 c0 70             	add    $0x70,%eax
    372f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    3736:	00 
    3737:	89 44 24 04          	mov    %eax,0x4(%esp)
    373b:	89 34 24             	mov    %esi,(%esp)
    373e:	e8 fd 03 00 00       	call   3b40 <memset>
    3743:	eb 0e                	jmp    3753 <sharedfd+0x83>
    3745:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 1000; i++){
    3748:	83 c3 01             	add    $0x1,%ebx
    374b:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    3751:	74 2d                	je     3780 <sharedfd+0xb0>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    3753:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    375a:	00 
    375b:	89 74 24 04          	mov    %esi,0x4(%esp)
    375f:	89 3c 24             	mov    %edi,(%esp)
    3762:	e8 7e 05 00 00       	call   3ce5 <write>
    3767:	83 f8 0a             	cmp    $0xa,%eax
    376a:	74 dc                	je     3748 <sharedfd+0x78>
      printf(1, "fstests: write sharedfd failed\n");
    376c:	c7 44 24 04 a8 58 00 	movl   $0x58a8,0x4(%esp)
    3773:	00 
    3774:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    377b:	e8 90 06 00 00       	call   3e10 <printf>
  if(pid == 0)
    3780:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3783:	85 d2                	test   %edx,%edx
    3785:	0f 84 07 01 00 00    	je     3892 <sharedfd+0x1c2>
    wait();
    378b:	e8 3d 05 00 00       	call   3ccd <wait>
  if(fd < 0){
    3790:	31 db                	xor    %ebx,%ebx
  close(fd);
    3792:	89 3c 24             	mov    %edi,(%esp)
  if(fd < 0){
    3795:	31 ff                	xor    %edi,%edi
  close(fd);
    3797:	e8 51 05 00 00       	call   3ced <close>
  fd = open("sharedfd", 0);
    379c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    37a3:	00 
    37a4:	c7 04 24 1f 51 00 00 	movl   $0x511f,(%esp)
    37ab:	e8 55 05 00 00       	call   3d05 <open>
  if(fd < 0){
    37b0:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", 0);
    37b2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  if(fd < 0){
    37b5:	0f 88 a5 00 00 00    	js     3860 <sharedfd+0x190>
    37bb:	90                   	nop
    37bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
    37c0:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    37c7:	00 
    37c8:	89 74 24 04          	mov    %esi,0x4(%esp)
    37cc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    37cf:	89 04 24             	mov    %eax,(%esp)
    37d2:	e8 06 05 00 00       	call   3cdd <read>
    37d7:	85 c0                	test   %eax,%eax
    37d9:	7e 26                	jle    3801 <sharedfd+0x131>
    return;
    37db:	31 c0                	xor    %eax,%eax
    37dd:	eb 14                	jmp    37f3 <sharedfd+0x123>
    37df:	90                   	nop
        np++;
    37e0:	80 fa 70             	cmp    $0x70,%dl
    37e3:	0f 94 c2             	sete   %dl
    37e6:	0f b6 d2             	movzbl %dl,%edx
    37e9:	01 d3                	add    %edx,%ebx
    for(i = 0; i < sizeof(buf); i++){
    37eb:	83 c0 01             	add    $0x1,%eax
    37ee:	83 f8 0a             	cmp    $0xa,%eax
    37f1:	74 cd                	je     37c0 <sharedfd+0xf0>
      if(buf[i] == 'c')
    37f3:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
    37f7:	80 fa 63             	cmp    $0x63,%dl
    37fa:	75 e4                	jne    37e0 <sharedfd+0x110>
        nc++;
    37fc:	83 c7 01             	add    $0x1,%edi
    37ff:	eb ea                	jmp    37eb <sharedfd+0x11b>
  close(fd);
    3801:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3804:	89 04 24             	mov    %eax,(%esp)
    3807:	e8 e1 04 00 00       	call   3ced <close>
  unlink("sharedfd");
    380c:	c7 04 24 1f 51 00 00 	movl   $0x511f,(%esp)
    3813:	e8 fd 04 00 00       	call   3d15 <unlink>
  if(nc == 10000 && np == 10000){
    3818:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    381e:	75 56                	jne    3876 <sharedfd+0x1a6>
    3820:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
    3826:	75 4e                	jne    3876 <sharedfd+0x1a6>
    printf(1, "sharedfd ok\n");
    3828:	c7 44 24 04 28 51 00 	movl   $0x5128,0x4(%esp)
    382f:	00 
    3830:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3837:	e8 d4 05 00 00       	call   3e10 <printf>
}
    383c:	83 c4 3c             	add    $0x3c,%esp
    383f:	5b                   	pop    %ebx
    3840:	5e                   	pop    %esi
    3841:	5f                   	pop    %edi
    3842:	5d                   	pop    %ebp
    3843:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for writing");
    3844:	c7 44 24 04 7c 58 00 	movl   $0x587c,0x4(%esp)
    384b:	00 
    384c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3853:	e8 b8 05 00 00       	call   3e10 <printf>
}
    3858:	83 c4 3c             	add    $0x3c,%esp
    385b:	5b                   	pop    %ebx
    385c:	5e                   	pop    %esi
    385d:	5f                   	pop    %edi
    385e:	5d                   	pop    %ebp
    385f:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
    3860:	c7 44 24 04 c8 58 00 	movl   $0x58c8,0x4(%esp)
    3867:	00 
    3868:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    386f:	e8 9c 05 00 00       	call   3e10 <printf>
    return;
    3874:	eb c6                	jmp    383c <sharedfd+0x16c>
    printf(1, "sharedfd oops %d %d\n", nc, np);
    3876:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    387a:	89 7c 24 08          	mov    %edi,0x8(%esp)
    387e:	c7 44 24 04 35 51 00 	movl   $0x5135,0x4(%esp)
    3885:	00 
    3886:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    388d:	e8 7e 05 00 00       	call   3e10 <printf>
    exit();
    3892:	e8 2e 04 00 00       	call   3cc5 <exit>
    3897:	89 f6                	mov    %esi,%esi
    3899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000038a0 <mem>:
{
    38a0:	55                   	push   %ebp
    38a1:	89 e5                	mov    %esp,%ebp
    38a3:	57                   	push   %edi
    38a4:	56                   	push   %esi
    38a5:	53                   	push   %ebx
  if((pid = fork()) == 0){
    38a6:	31 db                	xor    %ebx,%ebx
{
    38a8:	83 ec 1c             	sub    $0x1c,%esp
  printf(1, "mem test\n");
    38ab:	c7 44 24 04 4a 51 00 	movl   $0x514a,0x4(%esp)
    38b2:	00 
    38b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38ba:	e8 51 05 00 00       	call   3e10 <printf>
  ppid = getpid();
    38bf:	e8 81 04 00 00       	call   3d45 <getpid>
    38c4:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
    38c6:	e8 f2 03 00 00       	call   3cbd <fork>
    38cb:	85 c0                	test   %eax,%eax
    38cd:	74 0d                	je     38dc <mem+0x3c>
    38cf:	90                   	nop
    38d0:	eb 5f                	jmp    3931 <mem+0x91>
    38d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *(char**)m2 = m1;
    38d8:	89 18                	mov    %ebx,(%eax)
    38da:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
    38dc:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
    38e3:	e8 b8 07 00 00       	call   40a0 <malloc>
    38e8:	85 c0                	test   %eax,%eax
    38ea:	75 ec                	jne    38d8 <mem+0x38>
    while(m1){
    38ec:	85 db                	test   %ebx,%ebx
    38ee:	74 10                	je     3900 <mem+0x60>
      m2 = *(char**)m1;
    38f0:	8b 3b                	mov    (%ebx),%edi
      free(m1);
    38f2:	89 1c 24             	mov    %ebx,(%esp)
    38f5:	e8 16 07 00 00       	call   4010 <free>
    38fa:	89 fb                	mov    %edi,%ebx
    while(m1){
    38fc:	85 db                	test   %ebx,%ebx
    38fe:	75 f0                	jne    38f0 <mem+0x50>
    m1 = malloc(1024*20);
    3900:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
    3907:	e8 94 07 00 00       	call   40a0 <malloc>
    if(m1 == 0){
    390c:	85 c0                	test   %eax,%eax
    390e:	74 30                	je     3940 <mem+0xa0>
    free(m1);
    3910:	89 04 24             	mov    %eax,(%esp)
    3913:	e8 f8 06 00 00       	call   4010 <free>
    printf(1, "mem ok\n");
    3918:	c7 44 24 04 6e 51 00 	movl   $0x516e,0x4(%esp)
    391f:	00 
    3920:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3927:	e8 e4 04 00 00       	call   3e10 <printf>
    exit();
    392c:	e8 94 03 00 00       	call   3cc5 <exit>
}
    3931:	83 c4 1c             	add    $0x1c,%esp
    3934:	5b                   	pop    %ebx
    3935:	5e                   	pop    %esi
    3936:	5f                   	pop    %edi
    3937:	5d                   	pop    %ebp
    wait();
    3938:	e9 90 03 00 00       	jmp    3ccd <wait>
    393d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, "couldn't allocate mem?!!\n");
    3940:	c7 44 24 04 54 51 00 	movl   $0x5154,0x4(%esp)
    3947:	00 
    3948:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    394f:	e8 bc 04 00 00       	call   3e10 <printf>
      kill(ppid);
    3954:	89 34 24             	mov    %esi,(%esp)
    3957:	e8 99 03 00 00       	call   3cf5 <kill>
      exit();
    395c:	e8 64 03 00 00       	call   3cc5 <exit>
    3961:	eb 0d                	jmp    3970 <main>
    3963:	90                   	nop
    3964:	90                   	nop
    3965:	90                   	nop
    3966:	90                   	nop
    3967:	90                   	nop
    3968:	90                   	nop
    3969:	90                   	nop
    396a:	90                   	nop
    396b:	90                   	nop
    396c:	90                   	nop
    396d:	90                   	nop
    396e:	90                   	nop
    396f:	90                   	nop

00003970 <main>:

int
main(int argc, char *argv[])
{
    3970:	55                   	push   %ebp
    3971:	89 e5                	mov    %esp,%ebp
    3973:	83 e4 f0             	and    $0xfffffff0,%esp
    3976:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
    3979:	c7 44 24 04 76 51 00 	movl   $0x5176,0x4(%esp)
    3980:	00 
    3981:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3988:	e8 83 04 00 00       	call   3e10 <printf>

  if(open("usertests.ran", 0) >= 0){
    398d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3994:	00 
    3995:	c7 04 24 8a 51 00 00 	movl   $0x518a,(%esp)
    399c:	e8 64 03 00 00       	call   3d05 <open>
    39a1:	85 c0                	test   %eax,%eax
    39a3:	78 1b                	js     39c0 <main+0x50>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    39a5:	c7 44 24 04 f4 58 00 	movl   $0x58f4,0x4(%esp)
    39ac:	00 
    39ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    39b4:	e8 57 04 00 00       	call   3e10 <printf>
    exit();
    39b9:	e8 07 03 00 00       	call   3cc5 <exit>
    39be:	66 90                	xchg   %ax,%ax
  }
  close(open("usertests.ran", O_CREATE));
    39c0:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    39c7:	00 
    39c8:	c7 04 24 8a 51 00 00 	movl   $0x518a,(%esp)
    39cf:	e8 31 03 00 00       	call   3d05 <open>
    39d4:	89 04 24             	mov    %eax,(%esp)
    39d7:	e8 11 03 00 00       	call   3ced <close>

  argptest();
    39dc:	e8 6f c7 ff ff       	call   150 <argptest>
  createdelete();
    39e1:	e8 ba ce ff ff       	call   8a0 <createdelete>
  linkunlink();
    39e6:	e8 f5 d8 ff ff       	call   12e0 <linkunlink>
    39eb:	90                   	nop
    39ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  concreate();
    39f0:	e8 7b f7 ff ff       	call   3170 <concreate>
  fourfiles();
    39f5:	e8 b6 fa ff ff       	call   34b0 <fourfiles>
  sharedfd();
    39fa:	e8 d1 fc ff ff       	call   36d0 <sharedfd>
    39ff:	90                   	nop

  bigargtest();
    3a00:	e8 7b d5 ff ff       	call   f80 <bigargtest>
  bigwrite();
    3a05:	e8 c6 cb ff ff       	call   5d0 <bigwrite>
  bigargtest();
    3a0a:	e8 71 d5 ff ff       	call   f80 <bigargtest>
    3a0f:	90                   	nop
  bsstest();
    3a10:	e8 1b c6 ff ff       	call   30 <bsstest>
  sbrktest();
    3a15:	e8 36 dc ff ff       	call   1650 <sbrktest>
  validatetest();
    3a1a:	e8 c1 d6 ff ff       	call   10e0 <validatetest>
    3a1f:	90                   	nop

  opentest();
    3a20:	e8 8b c6 ff ff       	call   b0 <opentest>
  writetest();
    3a25:	e8 46 d3 ff ff       	call   d70 <writetest>
  writetest1();
    3a2a:	e8 51 d1 ff ff       	call   b80 <writetest1>
    3a2f:	90                   	nop
  createtest();
    3a30:	e8 9b d0 ff ff       	call   ad0 <createtest>

  openiputtest();
    3a35:	e8 f6 e4 ff ff       	call   1f30 <openiputtest>
  exitiputtest();
    3a3a:	e8 61 f3 ff ff       	call   2da0 <exitiputtest>
    3a3f:	90                   	nop
  iputtest();
    3a40:	e8 4b f4 ff ff       	call   2e90 <iputtest>

  mem();
    3a45:	e8 56 fe ff ff       	call   38a0 <mem>
  pipe1();
    3a4a:	e8 d1 e1 ff ff       	call   1c20 <pipe1>
    3a4f:	90                   	nop
  preempt();
    3a50:	e8 6b e0 ff ff       	call   1ac0 <preempt>
  exitwait();
    3a55:	e8 d6 c8 ff ff       	call   330 <exitwait>

  rmdot();
    3a5a:	e8 41 e9 ff ff       	call   23a0 <rmdot>
    3a5f:	90                   	nop
  fourteen();
    3a60:	e8 6b e3 ff ff       	call   1dd0 <fourteen>
  bigfile();
    3a65:	e8 06 f5 ff ff       	call   2f70 <bigfile>
  subdir();
    3a6a:	e8 c1 ea ff ff       	call   2530 <subdir>
    3a6f:	90                   	nop
  linktest();
    3a70:	e8 7b d9 ff ff       	call   13f0 <linktest>
  unlinkread();
    3a75:	e8 56 cc ff ff       	call   6d0 <unlinkread>
  dirfile();
    3a7a:	e8 e1 e6 ff ff       	call   2160 <dirfile>
    3a7f:	90                   	nop
  iref();
    3a80:	e8 bb e5 ff ff       	call   2040 <iref>
  forktest();
    3a85:	e8 d6 c7 ff ff       	call   260 <forktest>
  bigdir(); // slow
    3a8a:	e8 01 d7 ff ff       	call   1190 <bigdir>
    3a8f:	90                   	nop

  uio();
    3a90:	e8 3b c7 ff ff       	call   1d0 <uio>

  exectest();
    3a95:	e8 f6 d5 ff ff       	call   1090 <exectest>

  exit();
    3a9a:	e8 26 02 00 00       	call   3cc5 <exit>
    3a9f:	90                   	nop

00003aa0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3aa0:	55                   	push   %ebp
    3aa1:	31 d2                	xor    %edx,%edx
    3aa3:	89 e5                	mov    %esp,%ebp
    3aa5:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa8:	53                   	push   %ebx
    3aa9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    3aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3ab0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
    3ab4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    3ab7:	83 c2 01             	add    $0x1,%edx
    3aba:	84 c9                	test   %cl,%cl
    3abc:	75 f2                	jne    3ab0 <strcpy+0x10>
    ;
  return os;
}
    3abe:	5b                   	pop    %ebx
    3abf:	5d                   	pop    %ebp
    3ac0:	c3                   	ret    
    3ac1:	eb 0d                	jmp    3ad0 <strcmp>
    3ac3:	90                   	nop
    3ac4:	90                   	nop
    3ac5:	90                   	nop
    3ac6:	90                   	nop
    3ac7:	90                   	nop
    3ac8:	90                   	nop
    3ac9:	90                   	nop
    3aca:	90                   	nop
    3acb:	90                   	nop
    3acc:	90                   	nop
    3acd:	90                   	nop
    3ace:	90                   	nop
    3acf:	90                   	nop

00003ad0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3ad0:	55                   	push   %ebp
    3ad1:	89 e5                	mov    %esp,%ebp
    3ad3:	53                   	push   %ebx
    3ad4:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3ad7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    3ada:	0f b6 01             	movzbl (%ecx),%eax
    3add:	84 c0                	test   %al,%al
    3adf:	75 14                	jne    3af5 <strcmp+0x25>
    3ae1:	eb 25                	jmp    3b08 <strcmp+0x38>
    3ae3:	90                   	nop
    3ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
    3ae8:	83 c1 01             	add    $0x1,%ecx
    3aeb:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    3aee:	0f b6 01             	movzbl (%ecx),%eax
    3af1:	84 c0                	test   %al,%al
    3af3:	74 13                	je     3b08 <strcmp+0x38>
    3af5:	0f b6 1a             	movzbl (%edx),%ebx
    3af8:	38 d8                	cmp    %bl,%al
    3afa:	74 ec                	je     3ae8 <strcmp+0x18>
    3afc:	0f b6 db             	movzbl %bl,%ebx
    3aff:	0f b6 c0             	movzbl %al,%eax
    3b02:	29 d8                	sub    %ebx,%eax
  return (uchar)*p - (uchar)*q;
}
    3b04:	5b                   	pop    %ebx
    3b05:	5d                   	pop    %ebp
    3b06:	c3                   	ret    
    3b07:	90                   	nop
  while(*p && *p == *q)
    3b08:	0f b6 1a             	movzbl (%edx),%ebx
    3b0b:	31 c0                	xor    %eax,%eax
    3b0d:	0f b6 db             	movzbl %bl,%ebx
    3b10:	29 d8                	sub    %ebx,%eax
}
    3b12:	5b                   	pop    %ebx
    3b13:	5d                   	pop    %ebp
    3b14:	c3                   	ret    
    3b15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003b20 <strlen>:

uint
strlen(const char *s)
{
    3b20:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
    3b21:	31 d2                	xor    %edx,%edx
{
    3b23:	89 e5                	mov    %esp,%ebp
  for(n = 0; s[n]; n++)
    3b25:	31 c0                	xor    %eax,%eax
{
    3b27:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(n = 0; s[n]; n++)
    3b2a:	80 39 00             	cmpb   $0x0,(%ecx)
    3b2d:	74 0c                	je     3b3b <strlen+0x1b>
    3b2f:	90                   	nop
    3b30:	83 c2 01             	add    $0x1,%edx
    3b33:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3b37:	89 d0                	mov    %edx,%eax
    3b39:	75 f5                	jne    3b30 <strlen+0x10>
    ;
  return n;
}
    3b3b:	5d                   	pop    %ebp
    3b3c:	c3                   	ret    
    3b3d:	8d 76 00             	lea    0x0(%esi),%esi

00003b40 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3b40:	55                   	push   %ebp
    3b41:	89 e5                	mov    %esp,%ebp
    3b43:	8b 55 08             	mov    0x8(%ebp),%edx
    3b46:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3b47:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3b4a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b4d:	89 d7                	mov    %edx,%edi
    3b4f:	fc                   	cld    
    3b50:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3b52:	89 d0                	mov    %edx,%eax
    3b54:	5f                   	pop    %edi
    3b55:	5d                   	pop    %ebp
    3b56:	c3                   	ret    
    3b57:	89 f6                	mov    %esi,%esi
    3b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003b60 <strchr>:

char*
strchr(const char *s, char c)
{
    3b60:	55                   	push   %ebp
    3b61:	89 e5                	mov    %esp,%ebp
    3b63:	8b 45 08             	mov    0x8(%ebp),%eax
    3b66:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    3b6a:	0f b6 10             	movzbl (%eax),%edx
    3b6d:	84 d2                	test   %dl,%dl
    3b6f:	75 11                	jne    3b82 <strchr+0x22>
    3b71:	eb 15                	jmp    3b88 <strchr+0x28>
    3b73:	90                   	nop
    3b74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b78:	83 c0 01             	add    $0x1,%eax
    3b7b:	0f b6 10             	movzbl (%eax),%edx
    3b7e:	84 d2                	test   %dl,%dl
    3b80:	74 06                	je     3b88 <strchr+0x28>
    if(*s == c)
    3b82:	38 ca                	cmp    %cl,%dl
    3b84:	75 f2                	jne    3b78 <strchr+0x18>
      return (char*)s;
  return 0;
}
    3b86:	5d                   	pop    %ebp
    3b87:	c3                   	ret    
  for(; *s; s++)
    3b88:	31 c0                	xor    %eax,%eax
}
    3b8a:	5d                   	pop    %ebp
    3b8b:	90                   	nop
    3b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b90:	c3                   	ret    
    3b91:	eb 0d                	jmp    3ba0 <atoi>
    3b93:	90                   	nop
    3b94:	90                   	nop
    3b95:	90                   	nop
    3b96:	90                   	nop
    3b97:	90                   	nop
    3b98:	90                   	nop
    3b99:	90                   	nop
    3b9a:	90                   	nop
    3b9b:	90                   	nop
    3b9c:	90                   	nop
    3b9d:	90                   	nop
    3b9e:	90                   	nop
    3b9f:	90                   	nop

00003ba0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    3ba0:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3ba1:	31 c0                	xor    %eax,%eax
{
    3ba3:	89 e5                	mov    %esp,%ebp
    3ba5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3ba8:	53                   	push   %ebx
  while('0' <= *s && *s <= '9')
    3ba9:	0f b6 11             	movzbl (%ecx),%edx
    3bac:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3baf:	80 fb 09             	cmp    $0x9,%bl
    3bb2:	77 1c                	ja     3bd0 <atoi+0x30>
    3bb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
    3bb8:	0f be d2             	movsbl %dl,%edx
    3bbb:	83 c1 01             	add    $0x1,%ecx
    3bbe:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3bc1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    3bc5:	0f b6 11             	movzbl (%ecx),%edx
    3bc8:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3bcb:	80 fb 09             	cmp    $0x9,%bl
    3bce:	76 e8                	jbe    3bb8 <atoi+0x18>
  return n;
}
    3bd0:	5b                   	pop    %ebx
    3bd1:	5d                   	pop    %ebp
    3bd2:	c3                   	ret    
    3bd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003be0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    3be0:	55                   	push   %ebp
    3be1:	89 e5                	mov    %esp,%ebp
    3be3:	56                   	push   %esi
    3be4:	8b 45 08             	mov    0x8(%ebp),%eax
    3be7:	53                   	push   %ebx
    3be8:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3beb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3bee:	85 db                	test   %ebx,%ebx
    3bf0:	7e 14                	jle    3c06 <memmove+0x26>
memmove(void *vdst, const void *vsrc, int n)
    3bf2:	31 d2                	xor    %edx,%edx
    3bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3bf8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    3bfc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    3bff:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    3c02:	39 da                	cmp    %ebx,%edx
    3c04:	75 f2                	jne    3bf8 <memmove+0x18>
  return vdst;
}
    3c06:	5b                   	pop    %ebx
    3c07:	5e                   	pop    %esi
    3c08:	5d                   	pop    %ebp
    3c09:	c3                   	ret    
    3c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003c10 <stat>:
{
    3c10:	55                   	push   %ebp
    3c11:	89 e5                	mov    %esp,%ebp
    3c13:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
    3c16:	8b 45 08             	mov    0x8(%ebp),%eax
{
    3c19:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    3c1c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(fd < 0)
    3c1f:	be ff ff ff ff       	mov    $0xffffffff,%esi
  fd = open(n, O_RDONLY);
    3c24:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3c2b:	00 
    3c2c:	89 04 24             	mov    %eax,(%esp)
    3c2f:	e8 d1 00 00 00       	call   3d05 <open>
  if(fd < 0)
    3c34:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    3c36:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    3c38:	78 19                	js     3c53 <stat+0x43>
  r = fstat(fd, st);
    3c3a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c3d:	89 1c 24             	mov    %ebx,(%esp)
    3c40:	89 44 24 04          	mov    %eax,0x4(%esp)
    3c44:	e8 d4 00 00 00       	call   3d1d <fstat>
  close(fd);
    3c49:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    3c4c:	89 c6                	mov    %eax,%esi
  close(fd);
    3c4e:	e8 9a 00 00 00       	call   3ced <close>
}
    3c53:	89 f0                	mov    %esi,%eax
    3c55:	8b 5d f8             	mov    -0x8(%ebp),%ebx
    3c58:	8b 75 fc             	mov    -0x4(%ebp),%esi
    3c5b:	89 ec                	mov    %ebp,%esp
    3c5d:	5d                   	pop    %ebp
    3c5e:	c3                   	ret    
    3c5f:	90                   	nop

00003c60 <gets>:
{
    3c60:	55                   	push   %ebp
    3c61:	89 e5                	mov    %esp,%ebp
    3c63:	57                   	push   %edi
    3c64:	56                   	push   %esi
    3c65:	31 f6                	xor    %esi,%esi
    3c67:	53                   	push   %ebx
    3c68:	83 ec 2c             	sub    $0x2c,%esp
    3c6b:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    3c6e:	eb 06                	jmp    3c76 <gets+0x16>
    if(c == '\n' || c == '\r')
    3c70:	3c 0a                	cmp    $0xa,%al
    3c72:	74 39                	je     3cad <gets+0x4d>
    3c74:	89 de                	mov    %ebx,%esi
  for(i=0; i+1 < max; ){
    3c76:	8d 5e 01             	lea    0x1(%esi),%ebx
    3c79:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3c7c:	7d 31                	jge    3caf <gets+0x4f>
    cc = read(0, &c, 1);
    3c7e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3c81:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3c88:	00 
    3c89:	89 44 24 04          	mov    %eax,0x4(%esp)
    3c8d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c94:	e8 44 00 00 00       	call   3cdd <read>
    if(cc < 1)
    3c99:	85 c0                	test   %eax,%eax
    3c9b:	7e 12                	jle    3caf <gets+0x4f>
    buf[i++] = c;
    3c9d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3ca1:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
    3ca5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3ca9:	3c 0d                	cmp    $0xd,%al
    3cab:	75 c3                	jne    3c70 <gets+0x10>
    3cad:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
    3caf:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
}
    3cb3:	89 f8                	mov    %edi,%eax
    3cb5:	83 c4 2c             	add    $0x2c,%esp
    3cb8:	5b                   	pop    %ebx
    3cb9:	5e                   	pop    %esi
    3cba:	5f                   	pop    %edi
    3cbb:	5d                   	pop    %ebp
    3cbc:	c3                   	ret    

00003cbd <fork>:
    3cbd:	b8 01 00 00 00       	mov    $0x1,%eax
    3cc2:	cd 40                	int    $0x40
    3cc4:	c3                   	ret    

00003cc5 <exit>:
    3cc5:	b8 02 00 00 00       	mov    $0x2,%eax
    3cca:	cd 40                	int    $0x40
    3ccc:	c3                   	ret    

00003ccd <wait>:
    3ccd:	b8 03 00 00 00       	mov    $0x3,%eax
    3cd2:	cd 40                	int    $0x40
    3cd4:	c3                   	ret    

00003cd5 <pipe>:
    3cd5:	b8 04 00 00 00       	mov    $0x4,%eax
    3cda:	cd 40                	int    $0x40
    3cdc:	c3                   	ret    

00003cdd <read>:
    3cdd:	b8 05 00 00 00       	mov    $0x5,%eax
    3ce2:	cd 40                	int    $0x40
    3ce4:	c3                   	ret    

00003ce5 <write>:
    3ce5:	b8 10 00 00 00       	mov    $0x10,%eax
    3cea:	cd 40                	int    $0x40
    3cec:	c3                   	ret    

00003ced <close>:
    3ced:	b8 15 00 00 00       	mov    $0x15,%eax
    3cf2:	cd 40                	int    $0x40
    3cf4:	c3                   	ret    

00003cf5 <kill>:
    3cf5:	b8 06 00 00 00       	mov    $0x6,%eax
    3cfa:	cd 40                	int    $0x40
    3cfc:	c3                   	ret    

00003cfd <exec>:
    3cfd:	b8 07 00 00 00       	mov    $0x7,%eax
    3d02:	cd 40                	int    $0x40
    3d04:	c3                   	ret    

00003d05 <open>:
    3d05:	b8 0f 00 00 00       	mov    $0xf,%eax
    3d0a:	cd 40                	int    $0x40
    3d0c:	c3                   	ret    

00003d0d <mknod>:
    3d0d:	b8 11 00 00 00       	mov    $0x11,%eax
    3d12:	cd 40                	int    $0x40
    3d14:	c3                   	ret    

00003d15 <unlink>:
    3d15:	b8 12 00 00 00       	mov    $0x12,%eax
    3d1a:	cd 40                	int    $0x40
    3d1c:	c3                   	ret    

00003d1d <fstat>:
    3d1d:	b8 08 00 00 00       	mov    $0x8,%eax
    3d22:	cd 40                	int    $0x40
    3d24:	c3                   	ret    

00003d25 <link>:
    3d25:	b8 13 00 00 00       	mov    $0x13,%eax
    3d2a:	cd 40                	int    $0x40
    3d2c:	c3                   	ret    

00003d2d <mkdir>:
    3d2d:	b8 14 00 00 00       	mov    $0x14,%eax
    3d32:	cd 40                	int    $0x40
    3d34:	c3                   	ret    

00003d35 <chdir>:
    3d35:	b8 09 00 00 00       	mov    $0x9,%eax
    3d3a:	cd 40                	int    $0x40
    3d3c:	c3                   	ret    

00003d3d <dup>:
    3d3d:	b8 0a 00 00 00       	mov    $0xa,%eax
    3d42:	cd 40                	int    $0x40
    3d44:	c3                   	ret    

00003d45 <getpid>:
    3d45:	b8 0b 00 00 00       	mov    $0xb,%eax
    3d4a:	cd 40                	int    $0x40
    3d4c:	c3                   	ret    

00003d4d <sbrk>:
    3d4d:	b8 0c 00 00 00       	mov    $0xc,%eax
    3d52:	cd 40                	int    $0x40
    3d54:	c3                   	ret    

00003d55 <sleep>:
    3d55:	b8 0d 00 00 00       	mov    $0xd,%eax
    3d5a:	cd 40                	int    $0x40
    3d5c:	c3                   	ret    

00003d5d <uptime>:
    3d5d:	b8 0e 00 00 00       	mov    $0xe,%eax
    3d62:	cd 40                	int    $0x40
    3d64:	c3                   	ret    

00003d65 <date>:
    3d65:	b8 16 00 00 00       	mov    $0x16,%eax
    3d6a:	cd 40                	int    $0x40
    3d6c:	c3                   	ret    
    3d6d:	66 90                	xchg   %ax,%ax
    3d6f:	90                   	nop

00003d70 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3d70:	55                   	push   %ebp
    3d71:	89 e5                	mov    %esp,%ebp
    3d73:	57                   	push   %edi
    3d74:	89 cf                	mov    %ecx,%edi
    3d76:	56                   	push   %esi
    3d77:	89 c6                	mov    %eax,%esi
    3d79:	53                   	push   %ebx
    3d7a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3d7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3d80:	85 c9                	test   %ecx,%ecx
    3d82:	74 04                	je     3d88 <printint+0x18>
    3d84:	85 d2                	test   %edx,%edx
    3d86:	78 70                	js     3df8 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3d88:	89 d0                	mov    %edx,%eax
    3d8a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3d91:	31 c9                	xor    %ecx,%ecx
    3d93:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3d96:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3d98:	31 d2                	xor    %edx,%edx
    3d9a:	f7 f7                	div    %edi
    3d9c:	0f b6 92 27 59 00 00 	movzbl 0x5927(%edx),%edx
    3da3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
    3da6:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
    3da9:	85 c0                	test   %eax,%eax
    3dab:	75 eb                	jne    3d98 <printint+0x28>
  if(neg)
    3dad:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3db0:	85 c0                	test   %eax,%eax
    3db2:	74 08                	je     3dbc <printint+0x4c>
    buf[i++] = '-';
    3db4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
    3db9:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
    3dbc:	8d 79 ff             	lea    -0x1(%ecx),%edi
    3dbf:	01 fb                	add    %edi,%ebx
    3dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3dc8:	0f b6 03             	movzbl (%ebx),%eax
    3dcb:	83 ef 01             	sub    $0x1,%edi
    3dce:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    3dd1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3dd8:	00 
    3dd9:	89 34 24             	mov    %esi,(%esp)
  while(--i >= 0)
    3ddc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    3ddf:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3de2:	89 44 24 04          	mov    %eax,0x4(%esp)
    3de6:	e8 fa fe ff ff       	call   3ce5 <write>
  while(--i >= 0)
    3deb:	83 ff ff             	cmp    $0xffffffff,%edi
    3dee:	75 d8                	jne    3dc8 <printint+0x58>
    putc(fd, buf[i]);
}
    3df0:	83 c4 4c             	add    $0x4c,%esp
    3df3:	5b                   	pop    %ebx
    3df4:	5e                   	pop    %esi
    3df5:	5f                   	pop    %edi
    3df6:	5d                   	pop    %ebp
    3df7:	c3                   	ret    
    x = -xx;
    3df8:	89 d0                	mov    %edx,%eax
    3dfa:	f7 d8                	neg    %eax
    3dfc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    3e03:	eb 8c                	jmp    3d91 <printint+0x21>
    3e05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003e10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3e10:	55                   	push   %ebp
    3e11:	89 e5                	mov    %esp,%ebp
    3e13:	57                   	push   %edi
    3e14:	56                   	push   %esi
    3e15:	53                   	push   %ebx
    3e16:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3e19:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e1c:	0f b6 10             	movzbl (%eax),%edx
    3e1f:	84 d2                	test   %dl,%dl
    3e21:	0f 84 c9 00 00 00    	je     3ef0 <printf+0xe0>
  ap = (uint*)(void*)&fmt + 1;
    3e27:	8d 4d 10             	lea    0x10(%ebp),%ecx
    3e2a:	31 ff                	xor    %edi,%edi
    3e2c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    3e2f:	31 db                	xor    %ebx,%ebx
  write(fd, &c, 1);
    3e31:	8d 75 e7             	lea    -0x19(%ebp),%esi
    3e34:	eb 1e                	jmp    3e54 <printf+0x44>
    3e36:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3e38:	83 fa 25             	cmp    $0x25,%edx
    3e3b:	0f 85 b7 00 00 00    	jne    3ef8 <printf+0xe8>
    3e41:	66 bf 25 00          	mov    $0x25,%di
  for(i = 0; fmt[i]; i++){
    3e45:	83 c3 01             	add    $0x1,%ebx
    3e48:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
    3e4c:	84 d2                	test   %dl,%dl
    3e4e:	0f 84 9c 00 00 00    	je     3ef0 <printf+0xe0>
    if(state == 0){
    3e54:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    3e56:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
    3e59:	74 dd                	je     3e38 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3e5b:	83 ff 25             	cmp    $0x25,%edi
    3e5e:	75 e5                	jne    3e45 <printf+0x35>
      if(c == 'd'){
    3e60:	83 fa 64             	cmp    $0x64,%edx
    3e63:	0f 84 47 01 00 00    	je     3fb0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3e69:	83 fa 70             	cmp    $0x70,%edx
    3e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3e70:	0f 84 aa 00 00 00    	je     3f20 <printf+0x110>
    3e76:	83 fa 78             	cmp    $0x78,%edx
    3e79:	0f 84 a1 00 00 00    	je     3f20 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3e7f:	83 fa 73             	cmp    $0x73,%edx
    3e82:	0f 84 c0 00 00 00    	je     3f48 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3e88:	83 fa 63             	cmp    $0x63,%edx
    3e8b:	90                   	nop
    3e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3e90:	0f 84 42 01 00 00    	je     3fd8 <printf+0x1c8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3e96:	83 fa 25             	cmp    $0x25,%edx
    3e99:	0f 84 01 01 00 00    	je     3fa0 <printf+0x190>
  write(fd, &c, 1);
    3e9f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3ea2:	89 55 cc             	mov    %edx,-0x34(%ebp)
    3ea5:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3ea9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3eb0:	00 
    3eb1:	89 74 24 04          	mov    %esi,0x4(%esp)
    3eb5:	89 0c 24             	mov    %ecx,(%esp)
    3eb8:	e8 28 fe ff ff       	call   3ce5 <write>
    3ebd:	8b 55 cc             	mov    -0x34(%ebp),%edx
    3ec0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    3ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i = 0; fmt[i]; i++){
    3ec6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    3ec9:	31 ff                	xor    %edi,%edi
    3ecb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3ed2:	00 
    3ed3:	89 74 24 04          	mov    %esi,0x4(%esp)
    3ed7:	89 04 24             	mov    %eax,(%esp)
    3eda:	e8 06 fe ff ff       	call   3ce5 <write>
    3edf:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(i = 0; fmt[i]; i++){
    3ee2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
    3ee6:	84 d2                	test   %dl,%dl
    3ee8:	0f 85 66 ff ff ff    	jne    3e54 <printf+0x44>
    3eee:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3ef0:	83 c4 3c             	add    $0x3c,%esp
    3ef3:	5b                   	pop    %ebx
    3ef4:	5e                   	pop    %esi
    3ef5:	5f                   	pop    %edi
    3ef6:	5d                   	pop    %ebp
    3ef7:	c3                   	ret    
  write(fd, &c, 1);
    3ef8:	8b 45 08             	mov    0x8(%ebp),%eax
      if(c == '%'){
    3efb:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    3efe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3f05:	00 
    3f06:	89 74 24 04          	mov    %esi,0x4(%esp)
    3f0a:	89 04 24             	mov    %eax,(%esp)
    3f0d:	e8 d3 fd ff ff       	call   3ce5 <write>
    3f12:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f15:	e9 2b ff ff ff       	jmp    3e45 <printf+0x35>
    3f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    3f20:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3f23:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    3f28:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    3f2a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f31:	8b 10                	mov    (%eax),%edx
    3f33:	8b 45 08             	mov    0x8(%ebp),%eax
    3f36:	e8 35 fe ff ff       	call   3d70 <printint>
    3f3b:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
    3f3e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    3f42:	e9 fe fe ff ff       	jmp    3e45 <printf+0x35>
    3f47:	90                   	nop
        s = (char*)*ap;
    3f48:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        if(s == 0)
    3f4b:	b9 20 59 00 00       	mov    $0x5920,%ecx
        s = (char*)*ap;
    3f50:	8b 3a                	mov    (%edx),%edi
        ap++;
    3f52:	83 c2 04             	add    $0x4,%edx
    3f55:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
    3f58:	85 ff                	test   %edi,%edi
    3f5a:	0f 44 f9             	cmove  %ecx,%edi
        while(*s != 0){
    3f5d:	0f b6 17             	movzbl (%edi),%edx
    3f60:	84 d2                	test   %dl,%dl
    3f62:	74 33                	je     3f97 <printf+0x187>
    3f64:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    3f67:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          s++;
    3f70:	83 c7 01             	add    $0x1,%edi
        while(*s != 0){
    3f73:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    3f76:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3f7d:	00 
    3f7e:	89 74 24 04          	mov    %esi,0x4(%esp)
    3f82:	89 1c 24             	mov    %ebx,(%esp)
    3f85:	e8 5b fd ff ff       	call   3ce5 <write>
        while(*s != 0){
    3f8a:	0f b6 17             	movzbl (%edi),%edx
    3f8d:	84 d2                	test   %dl,%dl
    3f8f:	75 df                	jne    3f70 <printf+0x160>
    3f91:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3f94:	8b 45 0c             	mov    0xc(%ebp),%eax
  write(fd, &c, 1);
    3f97:	31 ff                	xor    %edi,%edi
    3f99:	e9 a7 fe ff ff       	jmp    3e45 <printf+0x35>
    3f9e:	66 90                	xchg   %ax,%ax
      } else if(c == '%'){
    3fa0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3fa4:	e9 1a ff ff ff       	jmp    3ec3 <printf+0xb3>
    3fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    3fb0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3fb3:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
    3fb8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    3fbb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3fc2:	8b 10                	mov    (%eax),%edx
    3fc4:	8b 45 08             	mov    0x8(%ebp),%eax
    3fc7:	e8 a4 fd ff ff       	call   3d70 <printint>
    3fcc:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
    3fcf:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    3fd3:	e9 6d fe ff ff       	jmp    3e45 <printf+0x35>
      } else if(c == 'c'){
    3fd8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
    3fdb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    3fdd:	8b 4d 08             	mov    0x8(%ebp),%ecx
      } else if(c == 'c'){
    3fe0:	8b 02                	mov    (%edx),%eax
  write(fd, &c, 1);
    3fe2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3fe9:	00 
    3fea:	89 74 24 04          	mov    %esi,0x4(%esp)
    3fee:	89 0c 24             	mov    %ecx,(%esp)
      } else if(c == 'c'){
    3ff1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    3ff4:	e8 ec fc ff ff       	call   3ce5 <write>
    3ff9:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
    3ffc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    4000:	e9 40 fe ff ff       	jmp    3e45 <printf+0x35>
    4005:	66 90                	xchg   %ax,%ax
    4007:	66 90                	xchg   %ax,%ax
    4009:	66 90                	xchg   %ax,%ax
    400b:	66 90                	xchg   %ax,%ax
    400d:	66 90                	xchg   %ax,%ax
    400f:	90                   	nop

00004010 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4010:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4011:	a1 e8 59 00 00       	mov    0x59e8,%eax
{
    4016:	89 e5                	mov    %esp,%ebp
    4018:	57                   	push   %edi
    4019:	56                   	push   %esi
    401a:	53                   	push   %ebx
    401b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    401e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4021:	39 c8                	cmp    %ecx,%eax
    4023:	73 1d                	jae    4042 <free+0x32>
    4025:	8d 76 00             	lea    0x0(%esi),%esi
    4028:	8b 10                	mov    (%eax),%edx
    402a:	39 d1                	cmp    %edx,%ecx
    402c:	72 1a                	jb     4048 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    402e:	39 d0                	cmp    %edx,%eax
    4030:	72 08                	jb     403a <free+0x2a>
    4032:	39 c8                	cmp    %ecx,%eax
    4034:	72 12                	jb     4048 <free+0x38>
    4036:	39 d1                	cmp    %edx,%ecx
    4038:	72 0e                	jb     4048 <free+0x38>
    403a:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    403c:	39 c8                	cmp    %ecx,%eax
    403e:	66 90                	xchg   %ax,%ax
    4040:	72 e6                	jb     4028 <free+0x18>
    4042:	8b 10                	mov    (%eax),%edx
    4044:	eb e8                	jmp    402e <free+0x1e>
    4046:	66 90                	xchg   %ax,%ax
      break;
  if(bp + bp->s.size == p->s.ptr){
    4048:	8b 71 04             	mov    0x4(%ecx),%esi
    404b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    404e:	39 d7                	cmp    %edx,%edi
    4050:	74 19                	je     406b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    4052:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    4055:	8b 50 04             	mov    0x4(%eax),%edx
    4058:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    405b:	39 ce                	cmp    %ecx,%esi
    405d:	74 23                	je     4082 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    405f:	89 08                	mov    %ecx,(%eax)
  freep = p;
    4061:	a3 e8 59 00 00       	mov    %eax,0x59e8
}
    4066:	5b                   	pop    %ebx
    4067:	5e                   	pop    %esi
    4068:	5f                   	pop    %edi
    4069:	5d                   	pop    %ebp
    406a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    406b:	03 72 04             	add    0x4(%edx),%esi
    406e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
    4071:	8b 10                	mov    (%eax),%edx
    4073:	8b 12                	mov    (%edx),%edx
    4075:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    4078:	8b 50 04             	mov    0x4(%eax),%edx
    407b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    407e:	39 ce                	cmp    %ecx,%esi
    4080:	75 dd                	jne    405f <free+0x4f>
    p->s.size += bp->s.size;
    4082:	03 51 04             	add    0x4(%ecx),%edx
    4085:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4088:	8b 53 f8             	mov    -0x8(%ebx),%edx
    408b:	89 10                	mov    %edx,(%eax)
  freep = p;
    408d:	a3 e8 59 00 00       	mov    %eax,0x59e8
}
    4092:	5b                   	pop    %ebx
    4093:	5e                   	pop    %esi
    4094:	5f                   	pop    %edi
    4095:	5d                   	pop    %ebp
    4096:	c3                   	ret    
    4097:	89 f6                	mov    %esi,%esi
    4099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000040a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    40a0:	55                   	push   %ebp
    40a1:	89 e5                	mov    %esp,%ebp
    40a3:	57                   	push   %edi
    40a4:	56                   	push   %esi
    40a5:	53                   	push   %ebx
    40a6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    40a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
    40ac:	8b 0d e8 59 00 00    	mov    0x59e8,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    40b2:	83 c3 07             	add    $0x7,%ebx
    40b5:	c1 eb 03             	shr    $0x3,%ebx
    40b8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    40bb:	85 c9                	test   %ecx,%ecx
    40bd:	0f 84 9b 00 00 00    	je     415e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    40c3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    40c5:	8b 50 04             	mov    0x4(%eax),%edx
    40c8:	39 d3                	cmp    %edx,%ebx
    40ca:	76 27                	jbe    40f3 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    40cc:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
  if(nu < 4096)
    40d3:	be 00 80 00 00       	mov    $0x8000,%esi
    40d8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    40db:	90                   	nop
    40dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
    40e0:	3b 05 e8 59 00 00    	cmp    0x59e8,%eax
    40e6:	74 30                	je     4118 <malloc+0x78>
    40e8:	89 c1                	mov    %eax,%ecx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    40ea:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    40ec:	8b 50 04             	mov    0x4(%eax),%edx
    40ef:	39 d3                	cmp    %edx,%ebx
    40f1:	77 ed                	ja     40e0 <malloc+0x40>
      if(p->s.size == nunits)
    40f3:	39 d3                	cmp    %edx,%ebx
    40f5:	74 61                	je     4158 <malloc+0xb8>
        p->s.size -= nunits;
    40f7:	29 da                	sub    %ebx,%edx
    40f9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    40fc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    40ff:	89 58 04             	mov    %ebx,0x4(%eax)
      freep = prevp;
    4102:	89 0d e8 59 00 00    	mov    %ecx,0x59e8
      return (void*)(p + 1);
    4108:	83 c0 08             	add    $0x8,%eax
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    410b:	83 c4 2c             	add    $0x2c,%esp
    410e:	5b                   	pop    %ebx
    410f:	5e                   	pop    %esi
    4110:	5f                   	pop    %edi
    4111:	5d                   	pop    %ebp
    4112:	c3                   	ret    
    4113:	90                   	nop
    4114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(nu < 4096)
    4118:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    411b:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
    4121:	bf 00 10 00 00       	mov    $0x1000,%edi
    4126:	0f 43 fb             	cmovae %ebx,%edi
    4129:	0f 42 c6             	cmovb  %esi,%eax
  p = sbrk(nu * sizeof(Header));
    412c:	89 04 24             	mov    %eax,(%esp)
    412f:	e8 19 fc ff ff       	call   3d4d <sbrk>
  if(p == (char*)-1)
    4134:	83 f8 ff             	cmp    $0xffffffff,%eax
    4137:	74 18                	je     4151 <malloc+0xb1>
  hp->s.size = nu;
    4139:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    413c:	83 c0 08             	add    $0x8,%eax
    413f:	89 04 24             	mov    %eax,(%esp)
    4142:	e8 c9 fe ff ff       	call   4010 <free>
  return freep;
    4147:	8b 0d e8 59 00 00    	mov    0x59e8,%ecx
      if((p = morecore(nunits)) == 0)
    414d:	85 c9                	test   %ecx,%ecx
    414f:	75 99                	jne    40ea <malloc+0x4a>
    if(p->s.size >= nunits){
    4151:	31 c0                	xor    %eax,%eax
    4153:	eb b6                	jmp    410b <malloc+0x6b>
    4155:	8d 76 00             	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    4158:	8b 10                	mov    (%eax),%edx
    415a:	89 11                	mov    %edx,(%ecx)
    415c:	eb a4                	jmp    4102 <malloc+0x62>
    base.s.ptr = freep = prevp = &base;
    415e:	c7 05 e8 59 00 00 e0 	movl   $0x59e0,0x59e8
    4165:	59 00 00 
    base.s.size = 0;
    4168:	b9 e0 59 00 00       	mov    $0x59e0,%ecx
    base.s.ptr = freep = prevp = &base;
    416d:	c7 05 e0 59 00 00 e0 	movl   $0x59e0,0x59e0
    4174:	59 00 00 
    base.s.size = 0;
    4177:	c7 05 e4 59 00 00 00 	movl   $0x0,0x59e4
    417e:	00 00 00 
    4181:	e9 3d ff ff ff       	jmp    40c3 <malloc+0x23>
