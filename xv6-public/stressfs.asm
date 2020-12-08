
_stressfs：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	57                   	push   %edi
   7:	56                   	push   %esi
   8:	53                   	push   %ebx

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
    if(fork() > 0)
   9:	31 db                	xor    %ebx,%ebx
{
   b:	81 ec 24 02 00 00    	sub    $0x224,%esp
  memset(data, 'a', sizeof(data));
  11:	8d 74 24 16          	lea    0x16(%esp),%esi
  char path[] = "stressfs0";
  15:	c7 84 24 16 02 00 00 	movl   $0x65727473,0x216(%esp)
  1c:	73 74 72 65 
  20:	c7 84 24 1a 02 00 00 	movl   $0x73667373,0x21a(%esp)
  27:	73 73 66 73 
  2b:	66 c7 84 24 1e 02 00 	movw   $0x30,0x21e(%esp)
  32:	00 30 00 
  printf(1, "stressfs starting\n");
  35:	c7 44 24 04 46 08 00 	movl   $0x846,0x4(%esp)
  3c:	00 
  3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  44:	e8 87 04 00 00       	call   4d0 <printf>
  memset(data, 'a', sizeof(data));
  49:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  50:	00 
  51:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  58:	00 
  59:	89 34 24             	mov    %esi,(%esp)
  5c:	e8 9f 01 00 00       	call   200 <memset>
    if(fork() > 0)
  61:	e8 17 03 00 00       	call   37d <fork>
  66:	85 c0                	test   %eax,%eax
  68:	7f 2b                	jg     95 <main+0x95>
  6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  70:	e8 08 03 00 00       	call   37d <fork>
  75:	b3 01                	mov    $0x1,%bl
  77:	85 c0                	test   %eax,%eax
  79:	7f 1a                	jg     95 <main+0x95>
  7b:	e8 fd 02 00 00       	call   37d <fork>
  80:	b3 02                	mov    $0x2,%bl
  82:	85 c0                	test   %eax,%eax
  84:	7f 0f                	jg     95 <main+0x95>
  86:	e8 f2 02 00 00       	call   37d <fork>
  8b:	31 db                	xor    %ebx,%ebx
  8d:	85 c0                	test   %eax,%eax
  8f:	0f 9e c3             	setle  %bl
  92:	83 c3 03             	add    $0x3,%ebx
      break;

  printf(1, "write %d\n", i);
  95:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  99:	c7 44 24 04 59 08 00 	movl   $0x859,0x4(%esp)
  a0:	00 
  a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a8:	e8 23 04 00 00       	call   4d0 <printf>

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  ad:	8d 84 24 16 02 00 00 	lea    0x216(%esp),%eax
  path[8] += i;
  b4:	00 9c 24 1e 02 00 00 	add    %bl,0x21e(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  bb:	31 db                	xor    %ebx,%ebx
  bd:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c4:	00 
  c5:	89 04 24             	mov    %eax,(%esp)
  c8:	e8 f8 02 00 00       	call   3c5 <open>
  cd:	89 c7                	mov    %eax,%edi
  cf:	90                   	nop
  for(i = 0; i < 20; i++)
  d0:	83 c3 01             	add    $0x1,%ebx
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  d3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  da:	00 
  db:	89 74 24 04          	mov    %esi,0x4(%esp)
  df:	89 3c 24             	mov    %edi,(%esp)
  e2:	e8 be 02 00 00       	call   3a5 <write>
  for(i = 0; i < 20; i++)
  e7:	83 fb 14             	cmp    $0x14,%ebx
  ea:	75 e4                	jne    d0 <main+0xd0>
  close(fd);
  ec:	89 3c 24             	mov    %edi,(%esp)

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  ef:	30 db                	xor    %bl,%bl
  close(fd);
  f1:	e8 b7 02 00 00       	call   3ad <close>
  printf(1, "read\n");
  f6:	c7 44 24 04 63 08 00 	movl   $0x863,0x4(%esp)
  fd:	00 
  fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 105:	e8 c6 03 00 00       	call   4d0 <printf>
  fd = open(path, O_RDONLY);
 10a:	8d 84 24 16 02 00 00 	lea    0x216(%esp),%eax
 111:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 118:	00 
 119:	89 04 24             	mov    %eax,(%esp)
 11c:	e8 a4 02 00 00       	call   3c5 <open>
 121:	89 c7                	mov    %eax,%edi
 123:	90                   	nop
 124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
 128:	83 c3 01             	add    $0x1,%ebx
    read(fd, data, sizeof(data));
 12b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 132:	00 
 133:	89 74 24 04          	mov    %esi,0x4(%esp)
 137:	89 3c 24             	mov    %edi,(%esp)
 13a:	e8 5e 02 00 00       	call   39d <read>
  for (i = 0; i < 20; i++)
 13f:	83 fb 14             	cmp    $0x14,%ebx
 142:	75 e4                	jne    128 <main+0x128>
  close(fd);
 144:	89 3c 24             	mov    %edi,(%esp)
 147:	e8 61 02 00 00       	call   3ad <close>

  wait();
 14c:	e8 3c 02 00 00       	call   38d <wait>

  exit();
 151:	e8 2f 02 00 00       	call   385 <exit>
 156:	66 90                	xchg   %ax,%ax
 158:	66 90                	xchg   %ax,%ax
 15a:	66 90                	xchg   %ax,%ax
 15c:	66 90                	xchg   %ax,%ax
 15e:	66 90                	xchg   %ax,%ax

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	31 d2                	xor    %edx,%edx
 163:	89 e5                	mov    %esp,%ebp
 165:	8b 45 08             	mov    0x8(%ebp),%eax
 168:	53                   	push   %ebx
 169:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 170:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 174:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 177:	83 c2 01             	add    $0x1,%edx
 17a:	84 c9                	test   %cl,%cl
 17c:	75 f2                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 17e:	5b                   	pop    %ebx
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	eb 0d                	jmp    190 <strcmp>
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

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 4d 08             	mov    0x8(%ebp),%ecx
 197:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 19a:	0f b6 01             	movzbl (%ecx),%eax
 19d:	84 c0                	test   %al,%al
 19f:	75 14                	jne    1b5 <strcmp+0x25>
 1a1:	eb 25                	jmp    1c8 <strcmp+0x38>
 1a3:	90                   	nop
 1a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 1a8:	83 c1 01             	add    $0x1,%ecx
 1ab:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ae:	0f b6 01             	movzbl (%ecx),%eax
 1b1:	84 c0                	test   %al,%al
 1b3:	74 13                	je     1c8 <strcmp+0x38>
 1b5:	0f b6 1a             	movzbl (%edx),%ebx
 1b8:	38 d8                	cmp    %bl,%al
 1ba:	74 ec                	je     1a8 <strcmp+0x18>
 1bc:	0f b6 db             	movzbl %bl,%ebx
 1bf:	0f b6 c0             	movzbl %al,%eax
 1c2:	29 d8                	sub    %ebx,%eax
  return (uchar)*p - (uchar)*q;
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	90                   	nop
  while(*p && *p == *q)
 1c8:	0f b6 1a             	movzbl (%edx),%ebx
 1cb:	31 c0                	xor    %eax,%eax
 1cd:	0f b6 db             	movzbl %bl,%ebx
 1d0:	29 d8                	sub    %ebx,%eax
}
 1d2:	5b                   	pop    %ebx
 1d3:	5d                   	pop    %ebp
 1d4:	c3                   	ret    
 1d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strlen>:

uint
strlen(const char *s)
{
 1e0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1e1:	31 d2                	xor    %edx,%edx
{
 1e3:	89 e5                	mov    %esp,%ebp
  for(n = 0; s[n]; n++)
 1e5:	31 c0                	xor    %eax,%eax
{
 1e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(n = 0; s[n]; n++)
 1ea:	80 39 00             	cmpb   $0x0,(%ecx)
 1ed:	74 0c                	je     1fb <strlen+0x1b>
 1ef:	90                   	nop
 1f0:	83 c2 01             	add    $0x1,%edx
 1f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1f7:	89 d0                	mov    %edx,%eax
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
    ;
  return n;
}
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 55 08             	mov    0x8(%ebp),%edx
 206:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	89 d0                	mov    %edx,%eax
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	75 11                	jne    242 <strchr+0x22>
 231:	eb 15                	jmp    248 <strchr+0x28>
 233:	90                   	nop
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 238:	83 c0 01             	add    $0x1,%eax
 23b:	0f b6 10             	movzbl (%eax),%edx
 23e:	84 d2                	test   %dl,%dl
 240:	74 06                	je     248 <strchr+0x28>
    if(*s == c)
 242:	38 ca                	cmp    %cl,%dl
 244:	75 f2                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
  for(; *s; s++)
 248:	31 c0                	xor    %eax,%eax
}
 24a:	5d                   	pop    %ebp
 24b:	90                   	nop
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 250:	c3                   	ret    
 251:	eb 0d                	jmp    260 <atoi>
 253:	90                   	nop
 254:	90                   	nop
 255:	90                   	nop
 256:	90                   	nop
 257:	90                   	nop
 258:	90                   	nop
 259:	90                   	nop
 25a:	90                   	nop
 25b:	90                   	nop
 25c:	90                   	nop
 25d:	90                   	nop
 25e:	90                   	nop
 25f:	90                   	nop

00000260 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 261:	31 c0                	xor    %eax,%eax
{
 263:	89 e5                	mov    %esp,%ebp
 265:	8b 4d 08             	mov    0x8(%ebp),%ecx
 268:	53                   	push   %ebx
  while('0' <= *s && *s <= '9')
 269:	0f b6 11             	movzbl (%ecx),%edx
 26c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 26f:	80 fb 09             	cmp    $0x9,%bl
 272:	77 1c                	ja     290 <atoi+0x30>
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 278:	0f be d2             	movsbl %dl,%edx
 27b:	83 c1 01             	add    $0x1,%ecx
 27e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 281:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 285:	0f b6 11             	movzbl (%ecx),%edx
 288:	8d 5a d0             	lea    -0x30(%edx),%ebx
 28b:	80 fb 09             	cmp    $0x9,%bl
 28e:	76 e8                	jbe    278 <atoi+0x18>
  return n;
}
 290:	5b                   	pop    %ebx
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	53                   	push   %ebx
 2a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 db                	test   %ebx,%ebx
 2b0:	7e 14                	jle    2c6 <memmove+0x26>
memmove(void *vdst, const void *vsrc, int n)
 2b2:	31 d2                	xor    %edx,%edx
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2c2:	39 da                	cmp    %ebx,%edx
 2c4:	75 f2                	jne    2b8 <memmove+0x18>
  return vdst;
}
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <stat>:
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 2d6:	8b 45 08             	mov    0x8(%ebp),%eax
{
 2d9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 2dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(fd < 0)
 2df:	be ff ff ff ff       	mov    $0xffffffff,%esi
  fd = open(n, O_RDONLY);
 2e4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2eb:	00 
 2ec:	89 04 24             	mov    %eax,(%esp)
 2ef:	e8 d1 00 00 00       	call   3c5 <open>
  if(fd < 0)
 2f4:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 2f6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2f8:	78 19                	js     313 <stat+0x43>
  r = fstat(fd, st);
 2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fd:	89 1c 24             	mov    %ebx,(%esp)
 300:	89 44 24 04          	mov    %eax,0x4(%esp)
 304:	e8 d4 00 00 00       	call   3dd <fstat>
  close(fd);
 309:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30c:	89 c6                	mov    %eax,%esi
  close(fd);
 30e:	e8 9a 00 00 00       	call   3ad <close>
}
 313:	89 f0                	mov    %esi,%eax
 315:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 318:	8b 75 fc             	mov    -0x4(%ebp),%esi
 31b:	89 ec                	mov    %ebp,%esp
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    
 31f:	90                   	nop

00000320 <gets>:
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	31 f6                	xor    %esi,%esi
 327:	53                   	push   %ebx
 328:	83 ec 2c             	sub    $0x2c,%esp
 32b:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 32e:	eb 06                	jmp    336 <gets+0x16>
    if(c == '\n' || c == '\r')
 330:	3c 0a                	cmp    $0xa,%al
 332:	74 39                	je     36d <gets+0x4d>
 334:	89 de                	mov    %ebx,%esi
  for(i=0; i+1 < max; ){
 336:	8d 5e 01             	lea    0x1(%esi),%ebx
 339:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 33c:	7d 31                	jge    36f <gets+0x4f>
    cc = read(0, &c, 1);
 33e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 341:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 348:	00 
 349:	89 44 24 04          	mov    %eax,0x4(%esp)
 34d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 354:	e8 44 00 00 00       	call   39d <read>
    if(cc < 1)
 359:	85 c0                	test   %eax,%eax
 35b:	7e 12                	jle    36f <gets+0x4f>
    buf[i++] = c;
 35d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 361:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 365:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 369:	3c 0d                	cmp    $0xd,%al
 36b:	75 c3                	jne    330 <gets+0x10>
 36d:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 36f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
}
 373:	89 f8                	mov    %edi,%eax
 375:	83 c4 2c             	add    $0x2c,%esp
 378:	5b                   	pop    %ebx
 379:	5e                   	pop    %esi
 37a:	5f                   	pop    %edi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    

0000037d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37d:	b8 01 00 00 00       	mov    $0x1,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <exit>:
SYSCALL(exit)
 385:	b8 02 00 00 00       	mov    $0x2,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <wait>:
SYSCALL(wait)
 38d:	b8 03 00 00 00       	mov    $0x3,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <pipe>:
SYSCALL(pipe)
 395:	b8 04 00 00 00       	mov    $0x4,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <read>:
SYSCALL(read)
 39d:	b8 05 00 00 00       	mov    $0x5,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <write>:
SYSCALL(write)
 3a5:	b8 10 00 00 00       	mov    $0x10,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <close>:
SYSCALL(close)
 3ad:	b8 15 00 00 00       	mov    $0x15,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <kill>:
SYSCALL(kill)
 3b5:	b8 06 00 00 00       	mov    $0x6,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <exec>:
SYSCALL(exec)
 3bd:	b8 07 00 00 00       	mov    $0x7,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <open>:
SYSCALL(open)
 3c5:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <mknod>:
SYSCALL(mknod)
 3cd:	b8 11 00 00 00       	mov    $0x11,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <unlink>:
SYSCALL(unlink)
 3d5:	b8 12 00 00 00       	mov    $0x12,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <fstat>:
SYSCALL(fstat)
 3dd:	b8 08 00 00 00       	mov    $0x8,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <link>:
SYSCALL(link)
 3e5:	b8 13 00 00 00       	mov    $0x13,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <mkdir>:
SYSCALL(mkdir)
 3ed:	b8 14 00 00 00       	mov    $0x14,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <chdir>:
SYSCALL(chdir)
 3f5:	b8 09 00 00 00       	mov    $0x9,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <dup>:
SYSCALL(dup)
 3fd:	b8 0a 00 00 00       	mov    $0xa,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <getpid>:
SYSCALL(getpid)
 405:	b8 0b 00 00 00       	mov    $0xb,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <sbrk>:
SYSCALL(sbrk)
 40d:	b8 0c 00 00 00       	mov    $0xc,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <sleep>:
SYSCALL(sleep)
 415:	b8 0d 00 00 00       	mov    $0xd,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <uptime>:
SYSCALL(uptime)
 41d:	b8 0e 00 00 00       	mov    $0xe,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <date>:
 425:	b8 16 00 00 00       	mov    $0x16,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    
 42d:	66 90                	xchg   %ax,%ax
 42f:	90                   	nop

00000430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	89 cf                	mov    %ecx,%edi
 436:	56                   	push   %esi
 437:	89 c6                	mov    %eax,%esi
 439:	53                   	push   %ebx
 43a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 43d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 440:	85 c9                	test   %ecx,%ecx
 442:	74 04                	je     448 <printint+0x18>
 444:	85 d2                	test   %edx,%edx
 446:	78 70                	js     4b8 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 448:	89 d0                	mov    %edx,%eax
 44a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 451:	31 c9                	xor    %ecx,%ecx
 453:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 456:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 458:	31 d2                	xor    %edx,%edx
 45a:	f7 f7                	div    %edi
 45c:	0f b6 92 70 08 00 00 	movzbl 0x870(%edx),%edx
 463:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 466:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 469:	85 c0                	test   %eax,%eax
 46b:	75 eb                	jne    458 <printint+0x28>
  if(neg)
 46d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 470:	85 c0                	test   %eax,%eax
 472:	74 08                	je     47c <printint+0x4c>
    buf[i++] = '-';
 474:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 479:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 47c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 47f:	01 fb                	add    %edi,%ebx
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	0f b6 03             	movzbl (%ebx),%eax
 48b:	83 ef 01             	sub    $0x1,%edi
 48e:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 491:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 498:	00 
 499:	89 34 24             	mov    %esi,(%esp)
  while(--i >= 0)
 49c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 49f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a6:	e8 fa fe ff ff       	call   3a5 <write>
  while(--i >= 0)
 4ab:	83 ff ff             	cmp    $0xffffffff,%edi
 4ae:	75 d8                	jne    488 <printint+0x58>
    putc(fd, buf[i]);
}
 4b0:	83 c4 4c             	add    $0x4c,%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
    x = -xx;
 4b8:	89 d0                	mov    %edx,%eax
 4ba:	f7 d8                	neg    %eax
 4bc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4c3:	eb 8c                	jmp    451 <printint+0x21>
 4c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dc:	0f b6 10             	movzbl (%eax),%edx
 4df:	84 d2                	test   %dl,%dl
 4e1:	0f 84 c9 00 00 00    	je     5b0 <printf+0xe0>
  ap = (uint*)(void*)&fmt + 1;
 4e7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4ea:	31 ff                	xor    %edi,%edi
 4ec:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4ef:	31 db                	xor    %ebx,%ebx
  write(fd, &c, 1);
 4f1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 4f4:	eb 1e                	jmp    514 <printf+0x44>
 4f6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4f8:	83 fa 25             	cmp    $0x25,%edx
 4fb:	0f 85 b7 00 00 00    	jne    5b8 <printf+0xe8>
 501:	66 bf 25 00          	mov    $0x25,%di
  for(i = 0; fmt[i]; i++){
 505:	83 c3 01             	add    $0x1,%ebx
 508:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 50c:	84 d2                	test   %dl,%dl
 50e:	0f 84 9c 00 00 00    	je     5b0 <printf+0xe0>
    if(state == 0){
 514:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 516:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 519:	74 dd                	je     4f8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 51b:	83 ff 25             	cmp    $0x25,%edi
 51e:	75 e5                	jne    505 <printf+0x35>
      if(c == 'd'){
 520:	83 fa 64             	cmp    $0x64,%edx
 523:	0f 84 47 01 00 00    	je     670 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 529:	83 fa 70             	cmp    $0x70,%edx
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 530:	0f 84 aa 00 00 00    	je     5e0 <printf+0x110>
 536:	83 fa 78             	cmp    $0x78,%edx
 539:	0f 84 a1 00 00 00    	je     5e0 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 53f:	83 fa 73             	cmp    $0x73,%edx
 542:	0f 84 c0 00 00 00    	je     608 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 548:	83 fa 63             	cmp    $0x63,%edx
 54b:	90                   	nop
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 550:	0f 84 42 01 00 00    	je     698 <printf+0x1c8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 556:	83 fa 25             	cmp    $0x25,%edx
 559:	0f 84 01 01 00 00    	je     660 <printf+0x190>
  write(fd, &c, 1);
 55f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 562:	89 55 cc             	mov    %edx,-0x34(%ebp)
 565:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 569:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 570:	00 
 571:	89 74 24 04          	mov    %esi,0x4(%esp)
 575:	89 0c 24             	mov    %ecx,(%esp)
 578:	e8 28 fe ff ff       	call   3a5 <write>
 57d:	8b 55 cc             	mov    -0x34(%ebp),%edx
 580:	88 55 e7             	mov    %dl,-0x19(%ebp)
 583:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 586:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 589:	31 ff                	xor    %edi,%edi
 58b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 592:	00 
 593:	89 74 24 04          	mov    %esi,0x4(%esp)
 597:	89 04 24             	mov    %eax,(%esp)
 59a:	e8 06 fe ff ff       	call   3a5 <write>
 59f:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 5a2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 5a6:	84 d2                	test   %dl,%dl
 5a8:	0f 85 66 ff ff ff    	jne    514 <printf+0x44>
 5ae:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5b0:	83 c4 3c             	add    $0x3c,%esp
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
  write(fd, &c, 1);
 5b8:	8b 45 08             	mov    0x8(%ebp),%eax
      if(c == '%'){
 5bb:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c5:	00 
 5c6:	89 74 24 04          	mov    %esi,0x4(%esp)
 5ca:	89 04 24             	mov    %eax,(%esp)
 5cd:	e8 d3 fd ff ff       	call   3a5 <write>
 5d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d5:	e9 2b ff ff ff       	jmp    505 <printf+0x35>
 5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5e3:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 5e8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 5ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5f1:	8b 10                	mov    (%eax),%edx
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	e8 35 fe ff ff       	call   430 <printint>
 5fb:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5fe:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 602:	e9 fe fe ff ff       	jmp    505 <printf+0x35>
 607:	90                   	nop
        s = (char*)*ap;
 608:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        if(s == 0)
 60b:	b9 69 08 00 00       	mov    $0x869,%ecx
        s = (char*)*ap;
 610:	8b 3a                	mov    (%edx),%edi
        ap++;
 612:	83 c2 04             	add    $0x4,%edx
 615:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 618:	85 ff                	test   %edi,%edi
 61a:	0f 44 f9             	cmove  %ecx,%edi
        while(*s != 0){
 61d:	0f b6 17             	movzbl (%edi),%edx
 620:	84 d2                	test   %dl,%dl
 622:	74 33                	je     657 <printf+0x187>
 624:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 627:	8b 5d 08             	mov    0x8(%ebp),%ebx
 62a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          s++;
 630:	83 c7 01             	add    $0x1,%edi
        while(*s != 0){
 633:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 636:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 63d:	00 
 63e:	89 74 24 04          	mov    %esi,0x4(%esp)
 642:	89 1c 24             	mov    %ebx,(%esp)
 645:	e8 5b fd ff ff       	call   3a5 <write>
        while(*s != 0){
 64a:	0f b6 17             	movzbl (%edi),%edx
 64d:	84 d2                	test   %dl,%dl
 64f:	75 df                	jne    630 <printf+0x160>
 651:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 654:	8b 45 0c             	mov    0xc(%ebp),%eax
  write(fd, &c, 1);
 657:	31 ff                	xor    %edi,%edi
 659:	e9 a7 fe ff ff       	jmp    505 <printf+0x35>
 65e:	66 90                	xchg   %ax,%ax
      } else if(c == '%'){
 660:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 664:	e9 1a ff ff ff       	jmp    583 <printf+0xb3>
 669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 670:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 673:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 678:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 67b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 682:	8b 10                	mov    (%eax),%edx
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	e8 a4 fd ff ff       	call   430 <printint>
 68c:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 68f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 693:	e9 6d fe ff ff       	jmp    505 <printf+0x35>
      } else if(c == 'c'){
 698:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
 69b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 69d:	8b 4d 08             	mov    0x8(%ebp),%ecx
      } else if(c == 'c'){
 6a0:	8b 02                	mov    (%edx),%eax
  write(fd, &c, 1);
 6a2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6a9:	00 
 6aa:	89 74 24 04          	mov    %esi,0x4(%esp)
 6ae:	89 0c 24             	mov    %ecx,(%esp)
      } else if(c == 'c'){
 6b1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b4:	e8 ec fc ff ff       	call   3a5 <write>
 6b9:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 6bc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6c0:	e9 40 fe ff ff       	jmp    505 <printf+0x35>
 6c5:	66 90                	xchg   %ax,%ax
 6c7:	66 90                	xchg   %ax,%ax
 6c9:	66 90                	xchg   %ax,%ax
 6cb:	66 90                	xchg   %ax,%ax
 6cd:	66 90                	xchg   %ax,%ax
 6cf:	90                   	nop

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	a1 8c 08 00 00       	mov    0x88c,%eax
{
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	57                   	push   %edi
 6d9:	56                   	push   %esi
 6da:	53                   	push   %ebx
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	39 c8                	cmp    %ecx,%eax
 6e3:	73 1d                	jae    702 <free+0x32>
 6e5:	8d 76 00             	lea    0x0(%esi),%esi
 6e8:	8b 10                	mov    (%eax),%edx
 6ea:	39 d1                	cmp    %edx,%ecx
 6ec:	72 1a                	jb     708 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ee:	39 d0                	cmp    %edx,%eax
 6f0:	72 08                	jb     6fa <free+0x2a>
 6f2:	39 c8                	cmp    %ecx,%eax
 6f4:	72 12                	jb     708 <free+0x38>
 6f6:	39 d1                	cmp    %edx,%ecx
 6f8:	72 0e                	jb     708 <free+0x38>
 6fa:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fc:	39 c8                	cmp    %ecx,%eax
 6fe:	66 90                	xchg   %ax,%ax
 700:	72 e6                	jb     6e8 <free+0x18>
 702:	8b 10                	mov    (%eax),%edx
 704:	eb e8                	jmp    6ee <free+0x1e>
 706:	66 90                	xchg   %ax,%ax
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 71 04             	mov    0x4(%ecx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 d7                	cmp    %edx,%edi
 710:	74 19                	je     72b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 712:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 715:	8b 50 04             	mov    0x4(%eax),%edx
 718:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 71b:	39 ce                	cmp    %ecx,%esi
 71d:	74 23                	je     742 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 71f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 721:	a3 8c 08 00 00       	mov    %eax,0x88c
}
 726:	5b                   	pop    %ebx
 727:	5e                   	pop    %esi
 728:	5f                   	pop    %edi
 729:	5d                   	pop    %ebp
 72a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 72b:	03 72 04             	add    0x4(%edx),%esi
 72e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 731:	8b 10                	mov    (%eax),%edx
 733:	8b 12                	mov    (%edx),%edx
 735:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 738:	8b 50 04             	mov    0x4(%eax),%edx
 73b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 73e:	39 ce                	cmp    %ecx,%esi
 740:	75 dd                	jne    71f <free+0x4f>
    p->s.size += bp->s.size;
 742:	03 51 04             	add    0x4(%ecx),%edx
 745:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 748:	8b 53 f8             	mov    -0x8(%ebx),%edx
 74b:	89 10                	mov    %edx,(%eax)
  freep = p;
 74d:	a3 8c 08 00 00       	mov    %eax,0x88c
}
 752:	5b                   	pop    %ebx
 753:	5e                   	pop    %esi
 754:	5f                   	pop    %edi
 755:	5d                   	pop    %ebp
 756:	c3                   	ret    
 757:	89 f6                	mov    %esi,%esi
 759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 769:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 76c:	8b 0d 8c 08 00 00    	mov    0x88c,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 772:	83 c3 07             	add    $0x7,%ebx
 775:	c1 eb 03             	shr    $0x3,%ebx
 778:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 77b:	85 c9                	test   %ecx,%ecx
 77d:	0f 84 9b 00 00 00    	je     81e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 783:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 785:	8b 50 04             	mov    0x4(%eax),%edx
 788:	39 d3                	cmp    %edx,%ebx
 78a:	76 27                	jbe    7b3 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 78c:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
  if(nu < 4096)
 793:	be 00 80 00 00       	mov    $0x8000,%esi
 798:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 79b:	90                   	nop
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 7a0:	3b 05 8c 08 00 00    	cmp    0x88c,%eax
 7a6:	74 30                	je     7d8 <malloc+0x78>
 7a8:	89 c1                	mov    %eax,%ecx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7aa:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7ac:	8b 50 04             	mov    0x4(%eax),%edx
 7af:	39 d3                	cmp    %edx,%ebx
 7b1:	77 ed                	ja     7a0 <malloc+0x40>
      if(p->s.size == nunits)
 7b3:	39 d3                	cmp    %edx,%ebx
 7b5:	74 61                	je     818 <malloc+0xb8>
        p->s.size -= nunits;
 7b7:	29 da                	sub    %ebx,%edx
 7b9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7bc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7bf:	89 58 04             	mov    %ebx,0x4(%eax)
      freep = prevp;
 7c2:	89 0d 8c 08 00 00    	mov    %ecx,0x88c
      return (void*)(p + 1);
 7c8:	83 c0 08             	add    $0x8,%eax
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7cb:	83 c4 2c             	add    $0x2c,%esp
 7ce:	5b                   	pop    %ebx
 7cf:	5e                   	pop    %esi
 7d0:	5f                   	pop    %edi
 7d1:	5d                   	pop    %ebp
 7d2:	c3                   	ret    
 7d3:	90                   	nop
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(nu < 4096)
 7d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7db:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 7e1:	bf 00 10 00 00       	mov    $0x1000,%edi
 7e6:	0f 43 fb             	cmovae %ebx,%edi
 7e9:	0f 42 c6             	cmovb  %esi,%eax
  p = sbrk(nu * sizeof(Header));
 7ec:	89 04 24             	mov    %eax,(%esp)
 7ef:	e8 19 fc ff ff       	call   40d <sbrk>
  if(p == (char*)-1)
 7f4:	83 f8 ff             	cmp    $0xffffffff,%eax
 7f7:	74 18                	je     811 <malloc+0xb1>
  hp->s.size = nu;
 7f9:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7fc:	83 c0 08             	add    $0x8,%eax
 7ff:	89 04 24             	mov    %eax,(%esp)
 802:	e8 c9 fe ff ff       	call   6d0 <free>
  return freep;
 807:	8b 0d 8c 08 00 00    	mov    0x88c,%ecx
      if((p = morecore(nunits)) == 0)
 80d:	85 c9                	test   %ecx,%ecx
 80f:	75 99                	jne    7aa <malloc+0x4a>
    if(p->s.size >= nunits){
 811:	31 c0                	xor    %eax,%eax
 813:	eb b6                	jmp    7cb <malloc+0x6b>
 815:	8d 76 00             	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 818:	8b 10                	mov    (%eax),%edx
 81a:	89 11                	mov    %edx,(%ecx)
 81c:	eb a4                	jmp    7c2 <malloc+0x62>
    base.s.ptr = freep = prevp = &base;
 81e:	c7 05 8c 08 00 00 84 	movl   $0x884,0x88c
 825:	08 00 00 
    base.s.size = 0;
 828:	b9 84 08 00 00       	mov    $0x884,%ecx
    base.s.ptr = freep = prevp = &base;
 82d:	c7 05 84 08 00 00 84 	movl   $0x884,0x884
 834:	08 00 00 
    base.s.size = 0;
 837:	c7 05 88 08 00 00 00 	movl   $0x0,0x888
 83e:	00 00 00 
 841:	e9 3d ff ff ff       	jmp    783 <malloc+0x23>
