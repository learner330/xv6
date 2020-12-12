
_alarmtest：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <periodic>:
exit();
}

void
periodic()
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
printf(1, "alarm!\n");
   6:	c7 44 24 04 a6 07 00 	movl   $0x7a6,0x4(%esp)
   d:	00 
   e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  15:	e8 16 04 00 00       	call   430 <printf>
  1a:	c9                   	leave  
  1b:	c3                   	ret    
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000020 <main>:
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	83 e4 f0             	and    $0xfffffff0,%esp
  26:	56                   	push   %esi
if((i % 250000) == 0)
  27:	be 83 de 1b 43       	mov    $0x431bde83,%esi
{
  2c:	53                   	push   %ebx
alarm(10, periodic);
  2d:	31 db                	xor    %ebx,%ebx
{
  2f:	83 ec 18             	sub    $0x18,%esp
printf(1, "alarmtest starting\n");
  32:	c7 44 24 04 ae 07 00 	movl   $0x7ae,0x4(%esp)
  39:	00 
  3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  41:	e8 ea 03 00 00       	call   430 <printf>
alarm(10, periodic);
  46:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  4d:	00 
  4e:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  55:	e8 23 03 00 00       	call   37d <alarm>
  5a:	eb 0f                	jmp    6b <main+0x4b>
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
for(i = 0; i < 25500000; i++){
  60:	83 c3 01             	add    $0x1,%ebx
  63:	81 fb 60 19 85 01    	cmp    $0x1851960,%ebx
  69:	74 3f                	je     aa <main+0x8a>
if((i % 250000) == 0)
  6b:	89 d8                	mov    %ebx,%eax
  6d:	f7 ee                	imul   %esi
  6f:	89 d8                	mov    %ebx,%eax
  71:	c1 f8 1f             	sar    $0x1f,%eax
  74:	c1 fa 10             	sar    $0x10,%edx
  77:	29 c2                	sub    %eax,%edx
  79:	69 d2 90 d0 03 00    	imul   $0x3d090,%edx,%edx
  7f:	39 d3                	cmp    %edx,%ebx
  81:	75 dd                	jne    60 <main+0x40>
for(i = 0; i < 25500000; i++){
  83:	83 c3 01             	add    $0x1,%ebx
write(2, ".", 1);
  86:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  8d:	00 
  8e:	c7 44 24 04 c2 07 00 	movl   $0x7c2,0x4(%esp)
  95:	00 
  96:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  9d:	e8 53 02 00 00       	call   2f5 <write>
for(i = 0; i < 25500000; i++){
  a2:	81 fb 60 19 85 01    	cmp    $0x1851960,%ebx
  a8:	75 c1                	jne    6b <main+0x4b>
exit();
  aa:	e8 26 02 00 00       	call   2d5 <exit>
  af:	90                   	nop

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	55                   	push   %ebp
  b1:	31 d2                	xor    %edx,%edx
  b3:	89 e5                	mov    %esp,%ebp
  b5:	8b 45 08             	mov    0x8(%ebp),%eax
  b8:	53                   	push   %ebx
  b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  c4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  c7:	83 c2 01             	add    $0x1,%edx
  ca:	84 c9                	test   %cl,%cl
  cc:	75 f2                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  ce:	5b                   	pop    %ebx
  cf:	5d                   	pop    %ebp
  d0:	c3                   	ret    
  d1:	eb 0d                	jmp    e0 <strcmp>
  d3:	90                   	nop
  d4:	90                   	nop
  d5:	90                   	nop
  d6:	90                   	nop
  d7:	90                   	nop
  d8:	90                   	nop
  d9:	90                   	nop
  da:	90                   	nop
  db:	90                   	nop
  dc:	90                   	nop
  dd:	90                   	nop
  de:	90                   	nop
  df:	90                   	nop

000000e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	53                   	push   %ebx
  e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ea:	0f b6 01             	movzbl (%ecx),%eax
  ed:	84 c0                	test   %al,%al
  ef:	75 14                	jne    105 <strcmp+0x25>
  f1:	eb 25                	jmp    118 <strcmp+0x38>
  f3:	90                   	nop
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  f8:	83 c1 01             	add    $0x1,%ecx
  fb:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  fe:	0f b6 01             	movzbl (%ecx),%eax
 101:	84 c0                	test   %al,%al
 103:	74 13                	je     118 <strcmp+0x38>
 105:	0f b6 1a             	movzbl (%edx),%ebx
 108:	38 d8                	cmp    %bl,%al
 10a:	74 ec                	je     f8 <strcmp+0x18>
 10c:	0f b6 db             	movzbl %bl,%ebx
 10f:	0f b6 c0             	movzbl %al,%eax
 112:	29 d8                	sub    %ebx,%eax
  return (uchar)*p - (uchar)*q;
}
 114:	5b                   	pop    %ebx
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	90                   	nop
  while(*p && *p == *q)
 118:	0f b6 1a             	movzbl (%edx),%ebx
 11b:	31 c0                	xor    %eax,%eax
 11d:	0f b6 db             	movzbl %bl,%ebx
 120:	29 d8                	sub    %ebx,%eax
}
 122:	5b                   	pop    %ebx
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    
 125:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strlen>:

uint
strlen(const char *s)
{
 130:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 131:	31 d2                	xor    %edx,%edx
{
 133:	89 e5                	mov    %esp,%ebp
  for(n = 0; s[n]; n++)
 135:	31 c0                	xor    %eax,%eax
{
 137:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(n = 0; s[n]; n++)
 13a:	80 39 00             	cmpb   $0x0,(%ecx)
 13d:	74 0c                	je     14b <strlen+0x1b>
 13f:	90                   	nop
 140:	83 c2 01             	add    $0x1,%edx
 143:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 147:	89 d0                	mov    %edx,%eax
 149:	75 f5                	jne    140 <strlen+0x10>
    ;
  return n;
}
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    
 14d:	8d 76 00             	lea    0x0(%esi),%esi

00000150 <memset>:

void*
memset(void *dst, int c, uint n)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
 156:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 157:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	89 d7                	mov    %edx,%edi
 15f:	fc                   	cld    
 160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 162:	89 d0                	mov    %edx,%eax
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	75 11                	jne    192 <strchr+0x22>
 181:	eb 15                	jmp    198 <strchr+0x28>
 183:	90                   	nop
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 188:	83 c0 01             	add    $0x1,%eax
 18b:	0f b6 10             	movzbl (%eax),%edx
 18e:	84 d2                	test   %dl,%dl
 190:	74 06                	je     198 <strchr+0x28>
    if(*s == c)
 192:	38 ca                	cmp    %cl,%dl
 194:	75 f2                	jne    188 <strchr+0x18>
      return (char*)s;
  return 0;
}
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    
  for(; *s; s++)
 198:	31 c0                	xor    %eax,%eax
}
 19a:	5d                   	pop    %ebp
 19b:	90                   	nop
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	c3                   	ret    
 1a1:	eb 0d                	jmp    1b0 <atoi>
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

000001b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 1b0:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1b1:	31 c0                	xor    %eax,%eax
{
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b8:	53                   	push   %ebx
  while('0' <= *s && *s <= '9')
 1b9:	0f b6 11             	movzbl (%ecx),%edx
 1bc:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1bf:	80 fb 09             	cmp    $0x9,%bl
 1c2:	77 1c                	ja     1e0 <atoi+0x30>
 1c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 1c8:	0f be d2             	movsbl %dl,%edx
 1cb:	83 c1 01             	add    $0x1,%ecx
 1ce:	8d 04 80             	lea    (%eax,%eax,4),%eax
 1d1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 1d5:	0f b6 11             	movzbl (%ecx),%edx
 1d8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1db:	80 fb 09             	cmp    $0x9,%bl
 1de:	76 e8                	jbe    1c8 <atoi+0x18>
  return n;
}
 1e0:	5b                   	pop    %ebx
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	53                   	push   %ebx
 1f8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1fe:	85 db                	test   %ebx,%ebx
 200:	7e 14                	jle    216 <memmove+0x26>
memmove(void *vdst, const void *vsrc, int n)
 202:	31 d2                	xor    %edx,%edx
 204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 208:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 20c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 20f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 212:	39 da                	cmp    %ebx,%edx
 214:	75 f2                	jne    208 <memmove+0x18>
  return vdst;
}
 216:	5b                   	pop    %ebx
 217:	5e                   	pop    %esi
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000220 <stat>:
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 226:	8b 45 08             	mov    0x8(%ebp),%eax
{
 229:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 22c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(fd < 0)
 22f:	be ff ff ff ff       	mov    $0xffffffff,%esi
  fd = open(n, O_RDONLY);
 234:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 23b:	00 
 23c:	89 04 24             	mov    %eax,(%esp)
 23f:	e8 d1 00 00 00       	call   315 <open>
  if(fd < 0)
 244:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 246:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 248:	78 19                	js     263 <stat+0x43>
  r = fstat(fd, st);
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 1c 24             	mov    %ebx,(%esp)
 250:	89 44 24 04          	mov    %eax,0x4(%esp)
 254:	e8 d4 00 00 00       	call   32d <fstat>
  close(fd);
 259:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 25c:	89 c6                	mov    %eax,%esi
  close(fd);
 25e:	e8 9a 00 00 00       	call   2fd <close>
}
 263:	89 f0                	mov    %esi,%eax
 265:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 268:	8b 75 fc             	mov    -0x4(%ebp),%esi
 26b:	89 ec                	mov    %ebp,%esp
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
 26f:	90                   	nop

00000270 <gets>:
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	31 f6                	xor    %esi,%esi
 277:	53                   	push   %ebx
 278:	83 ec 2c             	sub    $0x2c,%esp
 27b:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 27e:	eb 06                	jmp    286 <gets+0x16>
    if(c == '\n' || c == '\r')
 280:	3c 0a                	cmp    $0xa,%al
 282:	74 39                	je     2bd <gets+0x4d>
 284:	89 de                	mov    %ebx,%esi
  for(i=0; i+1 < max; ){
 286:	8d 5e 01             	lea    0x1(%esi),%ebx
 289:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 28c:	7d 31                	jge    2bf <gets+0x4f>
    cc = read(0, &c, 1);
 28e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 291:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 298:	00 
 299:	89 44 24 04          	mov    %eax,0x4(%esp)
 29d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2a4:	e8 44 00 00 00       	call   2ed <read>
    if(cc < 1)
 2a9:	85 c0                	test   %eax,%eax
 2ab:	7e 12                	jle    2bf <gets+0x4f>
    buf[i++] = c;
 2ad:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b1:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 2b5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b9:	3c 0d                	cmp    $0xd,%al
 2bb:	75 c3                	jne    280 <gets+0x10>
 2bd:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 2bf:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
}
 2c3:	89 f8                	mov    %edi,%eax
 2c5:	83 c4 2c             	add    $0x2c,%esp
 2c8:	5b                   	pop    %ebx
 2c9:	5e                   	pop    %esi
 2ca:	5f                   	pop    %edi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    

000002cd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cd:	b8 01 00 00 00       	mov    $0x1,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <exit>:
SYSCALL(exit)
 2d5:	b8 02 00 00 00       	mov    $0x2,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <wait>:
SYSCALL(wait)
 2dd:	b8 03 00 00 00       	mov    $0x3,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <pipe>:
SYSCALL(pipe)
 2e5:	b8 04 00 00 00       	mov    $0x4,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <read>:
SYSCALL(read)
 2ed:	b8 05 00 00 00       	mov    $0x5,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <write>:
SYSCALL(write)
 2f5:	b8 10 00 00 00       	mov    $0x10,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <close>:
SYSCALL(close)
 2fd:	b8 15 00 00 00       	mov    $0x15,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <kill>:
SYSCALL(kill)
 305:	b8 06 00 00 00       	mov    $0x6,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <exec>:
SYSCALL(exec)
 30d:	b8 07 00 00 00       	mov    $0x7,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <open>:
SYSCALL(open)
 315:	b8 0f 00 00 00       	mov    $0xf,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <mknod>:
SYSCALL(mknod)
 31d:	b8 11 00 00 00       	mov    $0x11,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <unlink>:
SYSCALL(unlink)
 325:	b8 12 00 00 00       	mov    $0x12,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <fstat>:
SYSCALL(fstat)
 32d:	b8 08 00 00 00       	mov    $0x8,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <link>:
SYSCALL(link)
 335:	b8 13 00 00 00       	mov    $0x13,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <mkdir>:
SYSCALL(mkdir)
 33d:	b8 14 00 00 00       	mov    $0x14,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <chdir>:
SYSCALL(chdir)
 345:	b8 09 00 00 00       	mov    $0x9,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <dup>:
SYSCALL(dup)
 34d:	b8 0a 00 00 00       	mov    $0xa,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <getpid>:
SYSCALL(getpid)
 355:	b8 0b 00 00 00       	mov    $0xb,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <sbrk>:
SYSCALL(sbrk)
 35d:	b8 0c 00 00 00       	mov    $0xc,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <sleep>:
SYSCALL(sleep)
 365:	b8 0d 00 00 00       	mov    $0xd,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <uptime>:
SYSCALL(uptime)
 36d:	b8 0e 00 00 00       	mov    $0xe,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <date>:
SYSCALL(date)
 375:	b8 16 00 00 00       	mov    $0x16,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <alarm>:
 37d:	b8 17 00 00 00       	mov    $0x17,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    
 385:	66 90                	xchg   %ax,%ax
 387:	66 90                	xchg   %ax,%ax
 389:	66 90                	xchg   %ax,%ax
 38b:	66 90                	xchg   %ax,%ax
 38d:	66 90                	xchg   %ax,%ax
 38f:	90                   	nop

00000390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	89 cf                	mov    %ecx,%edi
 396:	56                   	push   %esi
 397:	89 c6                	mov    %eax,%esi
 399:	53                   	push   %ebx
 39a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 39d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a0:	85 c9                	test   %ecx,%ecx
 3a2:	74 04                	je     3a8 <printint+0x18>
 3a4:	85 d2                	test   %edx,%edx
 3a6:	78 70                	js     418 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3a8:	89 d0                	mov    %edx,%eax
 3aa:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3b1:	31 c9                	xor    %ecx,%ecx
 3b3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3b6:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3b8:	31 d2                	xor    %edx,%edx
 3ba:	f7 f7                	div    %edi
 3bc:	0f b6 92 cb 07 00 00 	movzbl 0x7cb(%edx),%edx
 3c3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 3c6:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 3c9:	85 c0                	test   %eax,%eax
 3cb:	75 eb                	jne    3b8 <printint+0x28>
  if(neg)
 3cd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3d0:	85 c0                	test   %eax,%eax
 3d2:	74 08                	je     3dc <printint+0x4c>
    buf[i++] = '-';
 3d4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 3d9:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 3dc:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3df:	01 fb                	add    %edi,%ebx
 3e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3e8:	0f b6 03             	movzbl (%ebx),%eax
 3eb:	83 ef 01             	sub    $0x1,%edi
 3ee:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3f8:	00 
 3f9:	89 34 24             	mov    %esi,(%esp)
  while(--i >= 0)
 3fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 3ff:	8d 45 e7             	lea    -0x19(%ebp),%eax
 402:	89 44 24 04          	mov    %eax,0x4(%esp)
 406:	e8 ea fe ff ff       	call   2f5 <write>
  while(--i >= 0)
 40b:	83 ff ff             	cmp    $0xffffffff,%edi
 40e:	75 d8                	jne    3e8 <printint+0x58>
    putc(fd, buf[i]);
}
 410:	83 c4 4c             	add    $0x4c,%esp
 413:	5b                   	pop    %ebx
 414:	5e                   	pop    %esi
 415:	5f                   	pop    %edi
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
    x = -xx;
 418:	89 d0                	mov    %edx,%eax
 41a:	f7 d8                	neg    %eax
 41c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 423:	eb 8c                	jmp    3b1 <printint+0x21>
 425:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 439:	8b 45 0c             	mov    0xc(%ebp),%eax
 43c:	0f b6 10             	movzbl (%eax),%edx
 43f:	84 d2                	test   %dl,%dl
 441:	0f 84 c9 00 00 00    	je     510 <printf+0xe0>
  ap = (uint*)(void*)&fmt + 1;
 447:	8d 4d 10             	lea    0x10(%ebp),%ecx
 44a:	31 ff                	xor    %edi,%edi
 44c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 44f:	31 db                	xor    %ebx,%ebx
  write(fd, &c, 1);
 451:	8d 75 e7             	lea    -0x19(%ebp),%esi
 454:	eb 1e                	jmp    474 <printf+0x44>
 456:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 458:	83 fa 25             	cmp    $0x25,%edx
 45b:	0f 85 b7 00 00 00    	jne    518 <printf+0xe8>
 461:	66 bf 25 00          	mov    $0x25,%di
  for(i = 0; fmt[i]; i++){
 465:	83 c3 01             	add    $0x1,%ebx
 468:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 46c:	84 d2                	test   %dl,%dl
 46e:	0f 84 9c 00 00 00    	je     510 <printf+0xe0>
    if(state == 0){
 474:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 476:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 479:	74 dd                	je     458 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 47b:	83 ff 25             	cmp    $0x25,%edi
 47e:	75 e5                	jne    465 <printf+0x35>
      if(c == 'd'){
 480:	83 fa 64             	cmp    $0x64,%edx
 483:	0f 84 47 01 00 00    	je     5d0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 489:	83 fa 70             	cmp    $0x70,%edx
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 490:	0f 84 aa 00 00 00    	je     540 <printf+0x110>
 496:	83 fa 78             	cmp    $0x78,%edx
 499:	0f 84 a1 00 00 00    	je     540 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 49f:	83 fa 73             	cmp    $0x73,%edx
 4a2:	0f 84 c0 00 00 00    	je     568 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4a8:	83 fa 63             	cmp    $0x63,%edx
 4ab:	90                   	nop
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b0:	0f 84 42 01 00 00    	je     5f8 <printf+0x1c8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4b6:	83 fa 25             	cmp    $0x25,%edx
 4b9:	0f 84 01 01 00 00    	je     5c0 <printf+0x190>
  write(fd, &c, 1);
 4bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4c2:	89 55 cc             	mov    %edx,-0x34(%ebp)
 4c5:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4c9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4d0:	00 
 4d1:	89 74 24 04          	mov    %esi,0x4(%esp)
 4d5:	89 0c 24             	mov    %ecx,(%esp)
 4d8:	e8 18 fe ff ff       	call   2f5 <write>
 4dd:	8b 55 cc             	mov    -0x34(%ebp),%edx
 4e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 4e6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4e9:	31 ff                	xor    %edi,%edi
 4eb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4f2:	00 
 4f3:	89 74 24 04          	mov    %esi,0x4(%esp)
 4f7:	89 04 24             	mov    %eax,(%esp)
 4fa:	e8 f6 fd ff ff       	call   2f5 <write>
 4ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 502:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 506:	84 d2                	test   %dl,%dl
 508:	0f 85 66 ff ff ff    	jne    474 <printf+0x44>
 50e:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 510:	83 c4 3c             	add    $0x3c,%esp
 513:	5b                   	pop    %ebx
 514:	5e                   	pop    %esi
 515:	5f                   	pop    %edi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    
  write(fd, &c, 1);
 518:	8b 45 08             	mov    0x8(%ebp),%eax
      if(c == '%'){
 51b:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 51e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 525:	00 
 526:	89 74 24 04          	mov    %esi,0x4(%esp)
 52a:	89 04 24             	mov    %eax,(%esp)
 52d:	e8 c3 fd ff ff       	call   2f5 <write>
 532:	8b 45 0c             	mov    0xc(%ebp),%eax
 535:	e9 2b ff ff ff       	jmp    465 <printf+0x35>
 53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 540:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 543:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 548:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 54a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 551:	8b 10                	mov    (%eax),%edx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	e8 35 fe ff ff       	call   390 <printint>
 55b:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 55e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 562:	e9 fe fe ff ff       	jmp    465 <printf+0x35>
 567:	90                   	nop
        s = (char*)*ap;
 568:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        if(s == 0)
 56b:	b9 c4 07 00 00       	mov    $0x7c4,%ecx
        s = (char*)*ap;
 570:	8b 3a                	mov    (%edx),%edi
        ap++;
 572:	83 c2 04             	add    $0x4,%edx
 575:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 578:	85 ff                	test   %edi,%edi
 57a:	0f 44 f9             	cmove  %ecx,%edi
        while(*s != 0){
 57d:	0f b6 17             	movzbl (%edi),%edx
 580:	84 d2                	test   %dl,%dl
 582:	74 33                	je     5b7 <printf+0x187>
 584:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 587:	8b 5d 08             	mov    0x8(%ebp),%ebx
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          s++;
 590:	83 c7 01             	add    $0x1,%edi
        while(*s != 0){
 593:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 596:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 59d:	00 
 59e:	89 74 24 04          	mov    %esi,0x4(%esp)
 5a2:	89 1c 24             	mov    %ebx,(%esp)
 5a5:	e8 4b fd ff ff       	call   2f5 <write>
        while(*s != 0){
 5aa:	0f b6 17             	movzbl (%edi),%edx
 5ad:	84 d2                	test   %dl,%dl
 5af:	75 df                	jne    590 <printf+0x160>
 5b1:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  write(fd, &c, 1);
 5b7:	31 ff                	xor    %edi,%edi
 5b9:	e9 a7 fe ff ff       	jmp    465 <printf+0x35>
 5be:	66 90                	xchg   %ax,%ax
      } else if(c == '%'){
 5c0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5c4:	e9 1a ff ff ff       	jmp    4e3 <printf+0xb3>
 5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 5d8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 5db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5e2:	8b 10                	mov    (%eax),%edx
 5e4:	8b 45 08             	mov    0x8(%ebp),%eax
 5e7:	e8 a4 fd ff ff       	call   390 <printint>
 5ec:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5ef:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5f3:	e9 6d fe ff ff       	jmp    465 <printf+0x35>
      } else if(c == 'c'){
 5f8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
 5fb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
      } else if(c == 'c'){
 600:	8b 02                	mov    (%edx),%eax
  write(fd, &c, 1);
 602:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 609:	00 
 60a:	89 74 24 04          	mov    %esi,0x4(%esp)
 60e:	89 0c 24             	mov    %ecx,(%esp)
      } else if(c == 'c'){
 611:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 614:	e8 dc fc ff ff       	call   2f5 <write>
 619:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 61c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 620:	e9 40 fe ff ff       	jmp    465 <printf+0x35>
 625:	66 90                	xchg   %ax,%ax
 627:	66 90                	xchg   %ax,%ax
 629:	66 90                	xchg   %ax,%ax
 62b:	66 90                	xchg   %ax,%ax
 62d:	66 90                	xchg   %ax,%ax
 62f:	90                   	nop

00000630 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 630:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	a1 e4 07 00 00       	mov    0x7e4,%eax
{
 636:	89 e5                	mov    %esp,%ebp
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	53                   	push   %ebx
 63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 63e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	39 c8                	cmp    %ecx,%eax
 643:	73 1d                	jae    662 <free+0x32>
 645:	8d 76 00             	lea    0x0(%esi),%esi
 648:	8b 10                	mov    (%eax),%edx
 64a:	39 d1                	cmp    %edx,%ecx
 64c:	72 1a                	jb     668 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64e:	39 d0                	cmp    %edx,%eax
 650:	72 08                	jb     65a <free+0x2a>
 652:	39 c8                	cmp    %ecx,%eax
 654:	72 12                	jb     668 <free+0x38>
 656:	39 d1                	cmp    %edx,%ecx
 658:	72 0e                	jb     668 <free+0x38>
 65a:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65c:	39 c8                	cmp    %ecx,%eax
 65e:	66 90                	xchg   %ax,%ax
 660:	72 e6                	jb     648 <free+0x18>
 662:	8b 10                	mov    (%eax),%edx
 664:	eb e8                	jmp    64e <free+0x1e>
 666:	66 90                	xchg   %ax,%ax
      break;
  if(bp + bp->s.size == p->s.ptr){
 668:	8b 71 04             	mov    0x4(%ecx),%esi
 66b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66e:	39 d7                	cmp    %edx,%edi
 670:	74 19                	je     68b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 672:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 675:	8b 50 04             	mov    0x4(%eax),%edx
 678:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67b:	39 ce                	cmp    %ecx,%esi
 67d:	74 23                	je     6a2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 67f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 681:	a3 e4 07 00 00       	mov    %eax,0x7e4
}
 686:	5b                   	pop    %ebx
 687:	5e                   	pop    %esi
 688:	5f                   	pop    %edi
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 68b:	03 72 04             	add    0x4(%edx),%esi
 68e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 691:	8b 10                	mov    (%eax),%edx
 693:	8b 12                	mov    (%edx),%edx
 695:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 698:	8b 50 04             	mov    0x4(%eax),%edx
 69b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 69e:	39 ce                	cmp    %ecx,%esi
 6a0:	75 dd                	jne    67f <free+0x4f>
    p->s.size += bp->s.size;
 6a2:	03 51 04             	add    0x4(%ecx),%edx
 6a5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ab:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ad:	a3 e4 07 00 00       	mov    %eax,0x7e4
}
 6b2:	5b                   	pop    %ebx
 6b3:	5e                   	pop    %esi
 6b4:	5f                   	pop    %edi
 6b5:	5d                   	pop    %ebp
 6b6:	c3                   	ret    
 6b7:	89 f6                	mov    %esi,%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 6cc:	8b 0d e4 07 00 00    	mov    0x7e4,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d2:	83 c3 07             	add    $0x7,%ebx
 6d5:	c1 eb 03             	shr    $0x3,%ebx
 6d8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6db:	85 c9                	test   %ecx,%ecx
 6dd:	0f 84 9b 00 00 00    	je     77e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6e5:	8b 50 04             	mov    0x4(%eax),%edx
 6e8:	39 d3                	cmp    %edx,%ebx
 6ea:	76 27                	jbe    713 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6ec:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
  if(nu < 4096)
 6f3:	be 00 80 00 00       	mov    $0x8000,%esi
 6f8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6fb:	90                   	nop
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 700:	3b 05 e4 07 00 00    	cmp    0x7e4,%eax
 706:	74 30                	je     738 <malloc+0x78>
 708:	89 c1                	mov    %eax,%ecx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 70a:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 70c:	8b 50 04             	mov    0x4(%eax),%edx
 70f:	39 d3                	cmp    %edx,%ebx
 711:	77 ed                	ja     700 <malloc+0x40>
      if(p->s.size == nunits)
 713:	39 d3                	cmp    %edx,%ebx
 715:	74 61                	je     778 <malloc+0xb8>
        p->s.size -= nunits;
 717:	29 da                	sub    %ebx,%edx
 719:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 71c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 71f:	89 58 04             	mov    %ebx,0x4(%eax)
      freep = prevp;
 722:	89 0d e4 07 00 00    	mov    %ecx,0x7e4
      return (void*)(p + 1);
 728:	83 c0 08             	add    $0x8,%eax
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 72b:	83 c4 2c             	add    $0x2c,%esp
 72e:	5b                   	pop    %ebx
 72f:	5e                   	pop    %esi
 730:	5f                   	pop    %edi
 731:	5d                   	pop    %ebp
 732:	c3                   	ret    
 733:	90                   	nop
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(nu < 4096)
 738:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73b:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 741:	bf 00 10 00 00       	mov    $0x1000,%edi
 746:	0f 43 fb             	cmovae %ebx,%edi
 749:	0f 42 c6             	cmovb  %esi,%eax
  p = sbrk(nu * sizeof(Header));
 74c:	89 04 24             	mov    %eax,(%esp)
 74f:	e8 09 fc ff ff       	call   35d <sbrk>
  if(p == (char*)-1)
 754:	83 f8 ff             	cmp    $0xffffffff,%eax
 757:	74 18                	je     771 <malloc+0xb1>
  hp->s.size = nu;
 759:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 75c:	83 c0 08             	add    $0x8,%eax
 75f:	89 04 24             	mov    %eax,(%esp)
 762:	e8 c9 fe ff ff       	call   630 <free>
  return freep;
 767:	8b 0d e4 07 00 00    	mov    0x7e4,%ecx
      if((p = morecore(nunits)) == 0)
 76d:	85 c9                	test   %ecx,%ecx
 76f:	75 99                	jne    70a <malloc+0x4a>
    if(p->s.size >= nunits){
 771:	31 c0                	xor    %eax,%eax
 773:	eb b6                	jmp    72b <malloc+0x6b>
 775:	8d 76 00             	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 778:	8b 10                	mov    (%eax),%edx
 77a:	89 11                	mov    %edx,(%ecx)
 77c:	eb a4                	jmp    722 <malloc+0x62>
    base.s.ptr = freep = prevp = &base;
 77e:	c7 05 e4 07 00 00 dc 	movl   $0x7dc,0x7e4
 785:	07 00 00 
    base.s.size = 0;
 788:	b9 dc 07 00 00       	mov    $0x7dc,%ecx
    base.s.ptr = freep = prevp = &base;
 78d:	c7 05 dc 07 00 00 dc 	movl   $0x7dc,0x7dc
 794:	07 00 00 
    base.s.size = 0;
 797:	c7 05 e0 07 00 00 00 	movl   $0x0,0x7e0
 79e:	00 00 00 
 7a1:	e9 3d ff ff ff       	jmp    6e3 <malloc+0x23>
