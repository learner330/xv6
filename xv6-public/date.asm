
_date：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "date.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 40             	sub    $0x40,%esp
struct rtcdate r;

if (date(&r)) {
   9:	8d 44 24 28          	lea    0x28(%esp),%eax
   d:	89 04 24             	mov    %eax,(%esp)
  10:	e8 40 03 00 00       	call   355 <date>
  15:	85 c0                	test   %eax,%eax
  17:	74 1f                	je     38 <main+0x38>
printf(2, "date failed\n");
  19:	c7 44 24 04 78 07 00 	movl   $0x778,0x4(%esp)
  20:	00 
  21:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  28:	e8 d3 03 00 00       	call   400 <printf>
exit();
  2d:	e8 83 02 00 00       	call   2b5 <exit>
  32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
printf(1, "year%d-month%d day%d hour%d:minute%d:second%d\n", r.month, r.day, r.year, r.hour, r.minute, r.second);
  38:	8b 44 24 28          	mov    0x28(%esp),%eax
  3c:	c7 44 24 04 88 07 00 	movl   $0x788,0x4(%esp)
  43:	00 
  44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  4f:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  53:	89 44 24 18          	mov    %eax,0x18(%esp)
  57:	8b 44 24 30          	mov    0x30(%esp),%eax
  5b:	89 44 24 14          	mov    %eax,0x14(%esp)
  5f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  63:	89 44 24 10          	mov    %eax,0x10(%esp)
  67:	8b 44 24 34          	mov    0x34(%esp),%eax
  6b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  6f:	8b 44 24 38          	mov    0x38(%esp),%eax
  73:	89 44 24 08          	mov    %eax,0x8(%esp)
  77:	e8 84 03 00 00       	call   400 <printf>
exit();
  7c:	e8 34 02 00 00       	call   2b5 <exit>
  81:	66 90                	xchg   %ax,%ax
  83:	66 90                	xchg   %ax,%ax
  85:	66 90                	xchg   %ax,%ax
  87:	66 90                	xchg   %ax,%ax
  89:	66 90                	xchg   %ax,%ax
  8b:	66 90                	xchg   %ax,%ax
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  90:	55                   	push   %ebp
  91:	31 d2                	xor    %edx,%edx
  93:	89 e5                	mov    %esp,%ebp
  95:	8b 45 08             	mov    0x8(%ebp),%eax
  98:	53                   	push   %ebx
  99:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  a0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  a4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  a7:	83 c2 01             	add    $0x1,%edx
  aa:	84 c9                	test   %cl,%cl
  ac:	75 f2                	jne    a0 <strcpy+0x10>
    ;
  return os;
}
  ae:	5b                   	pop    %ebx
  af:	5d                   	pop    %ebp
  b0:	c3                   	ret    
  b1:	eb 0d                	jmp    c0 <strcmp>
  b3:	90                   	nop
  b4:	90                   	nop
  b5:	90                   	nop
  b6:	90                   	nop
  b7:	90                   	nop
  b8:	90                   	nop
  b9:	90                   	nop
  ba:	90                   	nop
  bb:	90                   	nop
  bc:	90                   	nop
  bd:	90                   	nop
  be:	90                   	nop
  bf:	90                   	nop

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	53                   	push   %ebx
  c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ca:	0f b6 01             	movzbl (%ecx),%eax
  cd:	84 c0                	test   %al,%al
  cf:	75 14                	jne    e5 <strcmp+0x25>
  d1:	eb 25                	jmp    f8 <strcmp+0x38>
  d3:	90                   	nop
  d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  d8:	83 c1 01             	add    $0x1,%ecx
  db:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  de:	0f b6 01             	movzbl (%ecx),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 13                	je     f8 <strcmp+0x38>
  e5:	0f b6 1a             	movzbl (%edx),%ebx
  e8:	38 d8                	cmp    %bl,%al
  ea:	74 ec                	je     d8 <strcmp+0x18>
  ec:	0f b6 db             	movzbl %bl,%ebx
  ef:	0f b6 c0             	movzbl %al,%eax
  f2:	29 d8                	sub    %ebx,%eax
  return (uchar)*p - (uchar)*q;
}
  f4:	5b                   	pop    %ebx
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	90                   	nop
  while(*p && *p == *q)
  f8:	0f b6 1a             	movzbl (%edx),%ebx
  fb:	31 c0                	xor    %eax,%eax
  fd:	0f b6 db             	movzbl %bl,%ebx
 100:	29 d8                	sub    %ebx,%eax
}
 102:	5b                   	pop    %ebx
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 111:	31 d2                	xor    %edx,%edx
{
 113:	89 e5                	mov    %esp,%ebp
  for(n = 0; s[n]; n++)
 115:	31 c0                	xor    %eax,%eax
{
 117:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(n = 0; s[n]; n++)
 11a:	80 39 00             	cmpb   $0x0,(%ecx)
 11d:	74 0c                	je     12b <strlen+0x1b>
 11f:	90                   	nop
 120:	83 c2 01             	add    $0x1,%edx
 123:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 127:	89 d0                	mov    %edx,%eax
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 11                	jne    172 <strchr+0x22>
 161:	eb 15                	jmp    178 <strchr+0x28>
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 168:	83 c0 01             	add    $0x1,%eax
 16b:	0f b6 10             	movzbl (%eax),%edx
 16e:	84 d2                	test   %dl,%dl
 170:	74 06                	je     178 <strchr+0x28>
    if(*s == c)
 172:	38 ca                	cmp    %cl,%dl
 174:	75 f2                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    
  for(; *s; s++)
 178:	31 c0                	xor    %eax,%eax
}
 17a:	5d                   	pop    %ebp
 17b:	90                   	nop
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 180:	c3                   	ret    
 181:	eb 0d                	jmp    190 <atoi>
 183:	90                   	nop
 184:	90                   	nop
 185:	90                   	nop
 186:	90                   	nop
 187:	90                   	nop
 188:	90                   	nop
 189:	90                   	nop
 18a:	90                   	nop
 18b:	90                   	nop
 18c:	90                   	nop
 18d:	90                   	nop
 18e:	90                   	nop
 18f:	90                   	nop

00000190 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 190:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 191:	31 c0                	xor    %eax,%eax
{
 193:	89 e5                	mov    %esp,%ebp
 195:	8b 4d 08             	mov    0x8(%ebp),%ecx
 198:	53                   	push   %ebx
  while('0' <= *s && *s <= '9')
 199:	0f b6 11             	movzbl (%ecx),%edx
 19c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 19f:	80 fb 09             	cmp    $0x9,%bl
 1a2:	77 1c                	ja     1c0 <atoi+0x30>
 1a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 1a8:	0f be d2             	movsbl %dl,%edx
 1ab:	83 c1 01             	add    $0x1,%ecx
 1ae:	8d 04 80             	lea    (%eax,%eax,4),%eax
 1b1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 1b5:	0f b6 11             	movzbl (%ecx),%edx
 1b8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1bb:	80 fb 09             	cmp    $0x9,%bl
 1be:	76 e8                	jbe    1a8 <atoi+0x18>
  return n;
}
 1c0:	5b                   	pop    %ebx
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	53                   	push   %ebx
 1d8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1de:	85 db                	test   %ebx,%ebx
 1e0:	7e 14                	jle    1f6 <memmove+0x26>
memmove(void *vdst, const void *vsrc, int n)
 1e2:	31 d2                	xor    %edx,%edx
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 1e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 1ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1ef:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 1f2:	39 da                	cmp    %ebx,%edx
 1f4:	75 f2                	jne    1e8 <memmove+0x18>
  return vdst;
}
 1f6:	5b                   	pop    %ebx
 1f7:	5e                   	pop    %esi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <stat>:
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 206:	8b 45 08             	mov    0x8(%ebp),%eax
{
 209:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 20c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(fd < 0)
 20f:	be ff ff ff ff       	mov    $0xffffffff,%esi
  fd = open(n, O_RDONLY);
 214:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 21b:	00 
 21c:	89 04 24             	mov    %eax,(%esp)
 21f:	e8 d1 00 00 00       	call   2f5 <open>
  if(fd < 0)
 224:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 226:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 228:	78 19                	js     243 <stat+0x43>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 1c 24             	mov    %ebx,(%esp)
 230:	89 44 24 04          	mov    %eax,0x4(%esp)
 234:	e8 d4 00 00 00       	call   30d <fstat>
  close(fd);
 239:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23c:	89 c6                	mov    %eax,%esi
  close(fd);
 23e:	e8 9a 00 00 00       	call   2dd <close>
}
 243:	89 f0                	mov    %esi,%eax
 245:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 248:	8b 75 fc             	mov    -0x4(%ebp),%esi
 24b:	89 ec                	mov    %ebp,%esp
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    
 24f:	90                   	nop

00000250 <gets>:
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
 255:	31 f6                	xor    %esi,%esi
 257:	53                   	push   %ebx
 258:	83 ec 2c             	sub    $0x2c,%esp
 25b:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 25e:	eb 06                	jmp    266 <gets+0x16>
    if(c == '\n' || c == '\r')
 260:	3c 0a                	cmp    $0xa,%al
 262:	74 39                	je     29d <gets+0x4d>
 264:	89 de                	mov    %ebx,%esi
  for(i=0; i+1 < max; ){
 266:	8d 5e 01             	lea    0x1(%esi),%ebx
 269:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26c:	7d 31                	jge    29f <gets+0x4f>
    cc = read(0, &c, 1);
 26e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 271:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 278:	00 
 279:	89 44 24 04          	mov    %eax,0x4(%esp)
 27d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 284:	e8 44 00 00 00       	call   2cd <read>
    if(cc < 1)
 289:	85 c0                	test   %eax,%eax
 28b:	7e 12                	jle    29f <gets+0x4f>
    buf[i++] = c;
 28d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 291:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 295:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 299:	3c 0d                	cmp    $0xd,%al
 29b:	75 c3                	jne    260 <gets+0x10>
 29d:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 29f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
}
 2a3:	89 f8                	mov    %edi,%eax
 2a5:	83 c4 2c             	add    $0x2c,%esp
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    

000002ad <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ad:	b8 01 00 00 00       	mov    $0x1,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <exit>:
SYSCALL(exit)
 2b5:	b8 02 00 00 00       	mov    $0x2,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <wait>:
SYSCALL(wait)
 2bd:	b8 03 00 00 00       	mov    $0x3,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <pipe>:
SYSCALL(pipe)
 2c5:	b8 04 00 00 00       	mov    $0x4,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <read>:
SYSCALL(read)
 2cd:	b8 05 00 00 00       	mov    $0x5,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <write>:
SYSCALL(write)
 2d5:	b8 10 00 00 00       	mov    $0x10,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <close>:
SYSCALL(close)
 2dd:	b8 15 00 00 00       	mov    $0x15,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <kill>:
SYSCALL(kill)
 2e5:	b8 06 00 00 00       	mov    $0x6,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <exec>:
SYSCALL(exec)
 2ed:	b8 07 00 00 00       	mov    $0x7,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <open>:
SYSCALL(open)
 2f5:	b8 0f 00 00 00       	mov    $0xf,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <mknod>:
SYSCALL(mknod)
 2fd:	b8 11 00 00 00       	mov    $0x11,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <unlink>:
SYSCALL(unlink)
 305:	b8 12 00 00 00       	mov    $0x12,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <fstat>:
SYSCALL(fstat)
 30d:	b8 08 00 00 00       	mov    $0x8,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <link>:
SYSCALL(link)
 315:	b8 13 00 00 00       	mov    $0x13,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <mkdir>:
SYSCALL(mkdir)
 31d:	b8 14 00 00 00       	mov    $0x14,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <chdir>:
SYSCALL(chdir)
 325:	b8 09 00 00 00       	mov    $0x9,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <dup>:
SYSCALL(dup)
 32d:	b8 0a 00 00 00       	mov    $0xa,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <getpid>:
SYSCALL(getpid)
 335:	b8 0b 00 00 00       	mov    $0xb,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <sbrk>:
SYSCALL(sbrk)
 33d:	b8 0c 00 00 00       	mov    $0xc,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <sleep>:
SYSCALL(sleep)
 345:	b8 0d 00 00 00       	mov    $0xd,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <uptime>:
SYSCALL(uptime)
 34d:	b8 0e 00 00 00       	mov    $0xe,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <date>:
 355:	b8 16 00 00 00       	mov    $0x16,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	89 cf                	mov    %ecx,%edi
 366:	56                   	push   %esi
 367:	89 c6                	mov    %eax,%esi
 369:	53                   	push   %ebx
 36a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 36d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 370:	85 c9                	test   %ecx,%ecx
 372:	74 04                	je     378 <printint+0x18>
 374:	85 d2                	test   %edx,%edx
 376:	78 70                	js     3e8 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 378:	89 d0                	mov    %edx,%eax
 37a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 381:	31 c9                	xor    %ecx,%ecx
 383:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 386:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 388:	31 d2                	xor    %edx,%edx
 38a:	f7 f7                	div    %edi
 38c:	0f b6 92 bf 07 00 00 	movzbl 0x7bf(%edx),%edx
 393:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 396:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 399:	85 c0                	test   %eax,%eax
 39b:	75 eb                	jne    388 <printint+0x28>
  if(neg)
 39d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3a0:	85 c0                	test   %eax,%eax
 3a2:	74 08                	je     3ac <printint+0x4c>
    buf[i++] = '-';
 3a4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 3a9:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 3ac:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3af:	01 fb                	add    %edi,%ebx
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3b8:	0f b6 03             	movzbl (%ebx),%eax
 3bb:	83 ef 01             	sub    $0x1,%edi
 3be:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3c8:	00 
 3c9:	89 34 24             	mov    %esi,(%esp)
  while(--i >= 0)
 3cc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 3cf:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 3d6:	e8 fa fe ff ff       	call   2d5 <write>
  while(--i >= 0)
 3db:	83 ff ff             	cmp    $0xffffffff,%edi
 3de:	75 d8                	jne    3b8 <printint+0x58>
    putc(fd, buf[i]);
}
 3e0:	83 c4 4c             	add    $0x4c,%esp
 3e3:	5b                   	pop    %ebx
 3e4:	5e                   	pop    %esi
 3e5:	5f                   	pop    %edi
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    
    x = -xx;
 3e8:	89 d0                	mov    %edx,%eax
 3ea:	f7 d8                	neg    %eax
 3ec:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3f3:	eb 8c                	jmp    381 <printint+0x21>
 3f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	0f b6 10             	movzbl (%eax),%edx
 40f:	84 d2                	test   %dl,%dl
 411:	0f 84 c9 00 00 00    	je     4e0 <printf+0xe0>
  ap = (uint*)(void*)&fmt + 1;
 417:	8d 4d 10             	lea    0x10(%ebp),%ecx
 41a:	31 ff                	xor    %edi,%edi
 41c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 41f:	31 db                	xor    %ebx,%ebx
  write(fd, &c, 1);
 421:	8d 75 e7             	lea    -0x19(%ebp),%esi
 424:	eb 1e                	jmp    444 <printf+0x44>
 426:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 428:	83 fa 25             	cmp    $0x25,%edx
 42b:	0f 85 b7 00 00 00    	jne    4e8 <printf+0xe8>
 431:	66 bf 25 00          	mov    $0x25,%di
  for(i = 0; fmt[i]; i++){
 435:	83 c3 01             	add    $0x1,%ebx
 438:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 43c:	84 d2                	test   %dl,%dl
 43e:	0f 84 9c 00 00 00    	je     4e0 <printf+0xe0>
    if(state == 0){
 444:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 446:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 449:	74 dd                	je     428 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 44b:	83 ff 25             	cmp    $0x25,%edi
 44e:	75 e5                	jne    435 <printf+0x35>
      if(c == 'd'){
 450:	83 fa 64             	cmp    $0x64,%edx
 453:	0f 84 47 01 00 00    	je     5a0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 459:	83 fa 70             	cmp    $0x70,%edx
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 460:	0f 84 aa 00 00 00    	je     510 <printf+0x110>
 466:	83 fa 78             	cmp    $0x78,%edx
 469:	0f 84 a1 00 00 00    	je     510 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 46f:	83 fa 73             	cmp    $0x73,%edx
 472:	0f 84 c0 00 00 00    	je     538 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 478:	83 fa 63             	cmp    $0x63,%edx
 47b:	90                   	nop
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 480:	0f 84 42 01 00 00    	je     5c8 <printf+0x1c8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 486:	83 fa 25             	cmp    $0x25,%edx
 489:	0f 84 01 01 00 00    	je     590 <printf+0x190>
  write(fd, &c, 1);
 48f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 492:	89 55 cc             	mov    %edx,-0x34(%ebp)
 495:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 499:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a0:	00 
 4a1:	89 74 24 04          	mov    %esi,0x4(%esp)
 4a5:	89 0c 24             	mov    %ecx,(%esp)
 4a8:	e8 28 fe ff ff       	call   2d5 <write>
 4ad:	8b 55 cc             	mov    -0x34(%ebp),%edx
 4b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 4b6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4b9:	31 ff                	xor    %edi,%edi
 4bb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c2:	00 
 4c3:	89 74 24 04          	mov    %esi,0x4(%esp)
 4c7:	89 04 24             	mov    %eax,(%esp)
 4ca:	e8 06 fe ff ff       	call   2d5 <write>
 4cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 4d2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4d6:	84 d2                	test   %dl,%dl
 4d8:	0f 85 66 ff ff ff    	jne    444 <printf+0x44>
 4de:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4e0:	83 c4 3c             	add    $0x3c,%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5f                   	pop    %edi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    
  write(fd, &c, 1);
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
      if(c == '%'){
 4eb:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 4ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4f5:	00 
 4f6:	89 74 24 04          	mov    %esi,0x4(%esp)
 4fa:	89 04 24             	mov    %eax,(%esp)
 4fd:	e8 d3 fd ff ff       	call   2d5 <write>
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	e9 2b ff ff ff       	jmp    435 <printf+0x35>
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 510:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 518:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 51a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 521:	8b 10                	mov    (%eax),%edx
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	e8 35 fe ff ff       	call   360 <printint>
 52b:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 52e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 532:	e9 fe fe ff ff       	jmp    435 <printf+0x35>
 537:	90                   	nop
        s = (char*)*ap;
 538:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        if(s == 0)
 53b:	b9 b8 07 00 00       	mov    $0x7b8,%ecx
        s = (char*)*ap;
 540:	8b 3a                	mov    (%edx),%edi
        ap++;
 542:	83 c2 04             	add    $0x4,%edx
 545:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 548:	85 ff                	test   %edi,%edi
 54a:	0f 44 f9             	cmove  %ecx,%edi
        while(*s != 0){
 54d:	0f b6 17             	movzbl (%edi),%edx
 550:	84 d2                	test   %dl,%dl
 552:	74 33                	je     587 <printf+0x187>
 554:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 557:	8b 5d 08             	mov    0x8(%ebp),%ebx
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          s++;
 560:	83 c7 01             	add    $0x1,%edi
        while(*s != 0){
 563:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 566:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 56d:	00 
 56e:	89 74 24 04          	mov    %esi,0x4(%esp)
 572:	89 1c 24             	mov    %ebx,(%esp)
 575:	e8 5b fd ff ff       	call   2d5 <write>
        while(*s != 0){
 57a:	0f b6 17             	movzbl (%edi),%edx
 57d:	84 d2                	test   %dl,%dl
 57f:	75 df                	jne    560 <printf+0x160>
 581:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 584:	8b 45 0c             	mov    0xc(%ebp),%eax
  write(fd, &c, 1);
 587:	31 ff                	xor    %edi,%edi
 589:	e9 a7 fe ff ff       	jmp    435 <printf+0x35>
 58e:	66 90                	xchg   %ax,%ax
      } else if(c == '%'){
 590:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 594:	e9 1a ff ff ff       	jmp    4b3 <printf+0xb3>
 599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 5a8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 5ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5b2:	8b 10                	mov    (%eax),%edx
 5b4:	8b 45 08             	mov    0x8(%ebp),%eax
 5b7:	e8 a4 fd ff ff       	call   360 <printint>
 5bc:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5bf:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5c3:	e9 6d fe ff ff       	jmp    435 <printf+0x35>
      } else if(c == 'c'){
 5c8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
 5cb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
      } else if(c == 'c'){
 5d0:	8b 02                	mov    (%edx),%eax
  write(fd, &c, 1);
 5d2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d9:	00 
 5da:	89 74 24 04          	mov    %esi,0x4(%esp)
 5de:	89 0c 24             	mov    %ecx,(%esp)
      } else if(c == 'c'){
 5e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5e4:	e8 ec fc ff ff       	call   2d5 <write>
 5e9:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5ec:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5f0:	e9 40 fe ff ff       	jmp    435 <printf+0x35>
 5f5:	66 90                	xchg   %ax,%ax
 5f7:	66 90                	xchg   %ax,%ax
 5f9:	66 90                	xchg   %ax,%ax
 5fb:	66 90                	xchg   %ax,%ax
 5fd:	66 90                	xchg   %ax,%ax
 5ff:	90                   	nop

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 d8 07 00 00       	mov    0x7d8,%eax
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 60e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	39 c8                	cmp    %ecx,%eax
 613:	73 1d                	jae    632 <free+0x32>
 615:	8d 76 00             	lea    0x0(%esi),%esi
 618:	8b 10                	mov    (%eax),%edx
 61a:	39 d1                	cmp    %edx,%ecx
 61c:	72 1a                	jb     638 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61e:	39 d0                	cmp    %edx,%eax
 620:	72 08                	jb     62a <free+0x2a>
 622:	39 c8                	cmp    %ecx,%eax
 624:	72 12                	jb     638 <free+0x38>
 626:	39 d1                	cmp    %edx,%ecx
 628:	72 0e                	jb     638 <free+0x38>
 62a:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62c:	39 c8                	cmp    %ecx,%eax
 62e:	66 90                	xchg   %ax,%ax
 630:	72 e6                	jb     618 <free+0x18>
 632:	8b 10                	mov    (%eax),%edx
 634:	eb e8                	jmp    61e <free+0x1e>
 636:	66 90                	xchg   %ax,%ax
      break;
  if(bp + bp->s.size == p->s.ptr){
 638:	8b 71 04             	mov    0x4(%ecx),%esi
 63b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63e:	39 d7                	cmp    %edx,%edi
 640:	74 19                	je     65b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 642:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 645:	8b 50 04             	mov    0x4(%eax),%edx
 648:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 64b:	39 ce                	cmp    %ecx,%esi
 64d:	74 23                	je     672 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 64f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 651:	a3 d8 07 00 00       	mov    %eax,0x7d8
}
 656:	5b                   	pop    %ebx
 657:	5e                   	pop    %esi
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 65b:	03 72 04             	add    0x4(%edx),%esi
 65e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 661:	8b 10                	mov    (%eax),%edx
 663:	8b 12                	mov    (%edx),%edx
 665:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 668:	8b 50 04             	mov    0x4(%eax),%edx
 66b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 66e:	39 ce                	cmp    %ecx,%esi
 670:	75 dd                	jne    64f <free+0x4f>
    p->s.size += bp->s.size;
 672:	03 51 04             	add    0x4(%ecx),%edx
 675:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 678:	8b 53 f8             	mov    -0x8(%ebx),%edx
 67b:	89 10                	mov    %edx,(%eax)
  freep = p;
 67d:	a3 d8 07 00 00       	mov    %eax,0x7d8
}
 682:	5b                   	pop    %ebx
 683:	5e                   	pop    %esi
 684:	5f                   	pop    %edi
 685:	5d                   	pop    %ebp
 686:	c3                   	ret    
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 699:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 69c:	8b 0d d8 07 00 00    	mov    0x7d8,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a2:	83 c3 07             	add    $0x7,%ebx
 6a5:	c1 eb 03             	shr    $0x3,%ebx
 6a8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6ab:	85 c9                	test   %ecx,%ecx
 6ad:	0f 84 9b 00 00 00    	je     74e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6b5:	8b 50 04             	mov    0x4(%eax),%edx
 6b8:	39 d3                	cmp    %edx,%ebx
 6ba:	76 27                	jbe    6e3 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6bc:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
  if(nu < 4096)
 6c3:	be 00 80 00 00       	mov    $0x8000,%esi
 6c8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6cb:	90                   	nop
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 6d0:	3b 05 d8 07 00 00    	cmp    0x7d8,%eax
 6d6:	74 30                	je     708 <malloc+0x78>
 6d8:	89 c1                	mov    %eax,%ecx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6da:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6dc:	8b 50 04             	mov    0x4(%eax),%edx
 6df:	39 d3                	cmp    %edx,%ebx
 6e1:	77 ed                	ja     6d0 <malloc+0x40>
      if(p->s.size == nunits)
 6e3:	39 d3                	cmp    %edx,%ebx
 6e5:	74 61                	je     748 <malloc+0xb8>
        p->s.size -= nunits;
 6e7:	29 da                	sub    %ebx,%edx
 6e9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6ec:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6ef:	89 58 04             	mov    %ebx,0x4(%eax)
      freep = prevp;
 6f2:	89 0d d8 07 00 00    	mov    %ecx,0x7d8
      return (void*)(p + 1);
 6f8:	83 c0 08             	add    $0x8,%eax
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6fb:	83 c4 2c             	add    $0x2c,%esp
 6fe:	5b                   	pop    %ebx
 6ff:	5e                   	pop    %esi
 700:	5f                   	pop    %edi
 701:	5d                   	pop    %ebp
 702:	c3                   	ret    
 703:	90                   	nop
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(nu < 4096)
 708:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 70b:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 711:	bf 00 10 00 00       	mov    $0x1000,%edi
 716:	0f 43 fb             	cmovae %ebx,%edi
 719:	0f 42 c6             	cmovb  %esi,%eax
  p = sbrk(nu * sizeof(Header));
 71c:	89 04 24             	mov    %eax,(%esp)
 71f:	e8 19 fc ff ff       	call   33d <sbrk>
  if(p == (char*)-1)
 724:	83 f8 ff             	cmp    $0xffffffff,%eax
 727:	74 18                	je     741 <malloc+0xb1>
  hp->s.size = nu;
 729:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 72c:	83 c0 08             	add    $0x8,%eax
 72f:	89 04 24             	mov    %eax,(%esp)
 732:	e8 c9 fe ff ff       	call   600 <free>
  return freep;
 737:	8b 0d d8 07 00 00    	mov    0x7d8,%ecx
      if((p = morecore(nunits)) == 0)
 73d:	85 c9                	test   %ecx,%ecx
 73f:	75 99                	jne    6da <malloc+0x4a>
    if(p->s.size >= nunits){
 741:	31 c0                	xor    %eax,%eax
 743:	eb b6                	jmp    6fb <malloc+0x6b>
 745:	8d 76 00             	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 748:	8b 10                	mov    (%eax),%edx
 74a:	89 11                	mov    %edx,(%ecx)
 74c:	eb a4                	jmp    6f2 <malloc+0x62>
    base.s.ptr = freep = prevp = &base;
 74e:	c7 05 d8 07 00 00 d0 	movl   $0x7d0,0x7d8
 755:	07 00 00 
    base.s.size = 0;
 758:	b9 d0 07 00 00       	mov    $0x7d0,%ecx
    base.s.ptr = freep = prevp = &base;
 75d:	c7 05 d0 07 00 00 d0 	movl   $0x7d0,0x7d0
 764:	07 00 00 
    base.s.size = 0;
 767:	c7 05 d4 07 00 00 00 	movl   $0x0,0x7d4
 76e:	00 00 00 
 771:	e9 3d ff ff ff       	jmp    6b3 <malloc+0x23>
