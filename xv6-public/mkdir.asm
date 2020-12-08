
_mkdir：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	57                   	push   %edi
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	83 ec 14             	sub    $0x14,%esp
   c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  if(argc < 2){
   f:	83 ff 01             	cmp    $0x1,%edi
  12:	7e 4c                	jle    60 <main+0x60>
    printf(2, "Usage: mkdir files...\n");
    exit();
  14:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  17:	be 01 00 00 00       	mov    $0x1,%esi
  1c:	83 c3 04             	add    $0x4,%ebx
  1f:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  20:	8b 03                	mov    (%ebx),%eax
  22:	89 04 24             	mov    %eax,(%esp)
  25:	e8 e3 02 00 00       	call   30d <mkdir>
  2a:	85 c0                	test   %eax,%eax
  2c:	78 12                	js     40 <main+0x40>
  for(i = 1; i < argc; i++){
  2e:	83 c6 01             	add    $0x1,%esi
  31:	83 c3 04             	add    $0x4,%ebx
  34:	39 f7                	cmp    %esi,%edi
  36:	7f e8                	jg     20 <main+0x20>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  38:	e8 68 02 00 00       	call   2a5 <exit>
  3d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  40:	8b 03                	mov    (%ebx),%eax
  42:	c7 44 24 04 7d 07 00 	movl   $0x77d,0x4(%esp)
  49:	00 
  4a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  51:	89 44 24 08          	mov    %eax,0x8(%esp)
  55:	e8 96 03 00 00       	call   3f0 <printf>
  exit();
  5a:	e8 46 02 00 00       	call   2a5 <exit>
  5f:	90                   	nop
    printf(2, "Usage: mkdir files...\n");
  60:	c7 44 24 04 66 07 00 	movl   $0x766,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 7c 03 00 00       	call   3f0 <printf>
    exit();
  74:	e8 2c 02 00 00       	call   2a5 <exit>
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  81:	31 d2                	xor    %edx,%edx
  83:	89 e5                	mov    %esp,%ebp
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	53                   	push   %ebx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  90:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  94:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 c9                	test   %cl,%cl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	5b                   	pop    %ebx
  9f:	5d                   	pop    %ebp
  a0:	c3                   	ret    
  a1:	eb 0d                	jmp    b0 <strcmp>
  a3:	90                   	nop
  a4:	90                   	nop
  a5:	90                   	nop
  a6:	90                   	nop
  a7:	90                   	nop
  a8:	90                   	nop
  a9:	90                   	nop
  aa:	90                   	nop
  ab:	90                   	nop
  ac:	90                   	nop
  ad:	90                   	nop
  ae:	90                   	nop
  af:	90                   	nop

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ba:	0f b6 01             	movzbl (%ecx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 14                	jne    d5 <strcmp+0x25>
  c1:	eb 25                	jmp    e8 <strcmp+0x38>
  c3:	90                   	nop
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  c8:	83 c1 01             	add    $0x1,%ecx
  cb:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ce:	0f b6 01             	movzbl (%ecx),%eax
  d1:	84 c0                	test   %al,%al
  d3:	74 13                	je     e8 <strcmp+0x38>
  d5:	0f b6 1a             	movzbl (%edx),%ebx
  d8:	38 d8                	cmp    %bl,%al
  da:	74 ec                	je     c8 <strcmp+0x18>
  dc:	0f b6 db             	movzbl %bl,%ebx
  df:	0f b6 c0             	movzbl %al,%eax
  e2:	29 d8                	sub    %ebx,%eax
  return (uchar)*p - (uchar)*q;
}
  e4:	5b                   	pop    %ebx
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	90                   	nop
  while(*p && *p == *q)
  e8:	0f b6 1a             	movzbl (%edx),%ebx
  eb:	31 c0                	xor    %eax,%eax
  ed:	0f b6 db             	movzbl %bl,%ebx
  f0:	29 d8                	sub    %ebx,%eax
}
  f2:	5b                   	pop    %ebx
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 101:	31 d2                	xor    %edx,%edx
{
 103:	89 e5                	mov    %esp,%ebp
  for(n = 0; s[n]; n++)
 105:	31 c0                	xor    %eax,%eax
{
 107:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(n = 0; s[n]; n++)
 10a:	80 39 00             	cmpb   $0x0,(%ecx)
 10d:	74 0c                	je     11b <strlen+0x1b>
 10f:	90                   	nop
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 55 08             	mov    0x8(%ebp),%edx
 126:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 11                	jne    162 <strchr+0x22>
 151:	eb 15                	jmp    168 <strchr+0x28>
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 158:	83 c0 01             	add    $0x1,%eax
 15b:	0f b6 10             	movzbl (%eax),%edx
 15e:	84 d2                	test   %dl,%dl
 160:	74 06                	je     168 <strchr+0x28>
    if(*s == c)
 162:	38 ca                	cmp    %cl,%dl
 164:	75 f2                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    
  for(; *s; s++)
 168:	31 c0                	xor    %eax,%eax
}
 16a:	5d                   	pop    %ebp
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	c3                   	ret    
 171:	eb 0d                	jmp    180 <atoi>
 173:	90                   	nop
 174:	90                   	nop
 175:	90                   	nop
 176:	90                   	nop
 177:	90                   	nop
 178:	90                   	nop
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop
 17c:	90                   	nop
 17d:	90                   	nop
 17e:	90                   	nop
 17f:	90                   	nop

00000180 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 180:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	8b 4d 08             	mov    0x8(%ebp),%ecx
 188:	53                   	push   %ebx
  while('0' <= *s && *s <= '9')
 189:	0f b6 11             	movzbl (%ecx),%edx
 18c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 18f:	80 fb 09             	cmp    $0x9,%bl
 192:	77 1c                	ja     1b0 <atoi+0x30>
 194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 198:	0f be d2             	movsbl %dl,%edx
 19b:	83 c1 01             	add    $0x1,%ecx
 19e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 1a1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 1a5:	0f b6 11             	movzbl (%ecx),%edx
 1a8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1ab:	80 fb 09             	cmp    $0x9,%bl
 1ae:	76 e8                	jbe    198 <atoi+0x18>
  return n;
}
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	53                   	push   %ebx
 1c8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1ce:	85 db                	test   %ebx,%ebx
 1d0:	7e 14                	jle    1e6 <memmove+0x26>
memmove(void *vdst, const void *vsrc, int n)
 1d2:	31 d2                	xor    %edx,%edx
 1d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 1d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 1dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 1e2:	39 da                	cmp    %ebx,%edx
 1e4:	75 f2                	jne    1d8 <memmove+0x18>
  return vdst;
}
 1e6:	5b                   	pop    %ebx
 1e7:	5e                   	pop    %esi
 1e8:	5d                   	pop    %ebp
 1e9:	c3                   	ret    
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001f0 <stat>:
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
{
 1f9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1fc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(fd < 0)
 1ff:	be ff ff ff ff       	mov    $0xffffffff,%esi
  fd = open(n, O_RDONLY);
 204:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20b:	00 
 20c:	89 04 24             	mov    %eax,(%esp)
 20f:	e8 d1 00 00 00       	call   2e5 <open>
  if(fd < 0)
 214:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 216:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 218:	78 19                	js     233 <stat+0x43>
  r = fstat(fd, st);
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 1c 24             	mov    %ebx,(%esp)
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	e8 d4 00 00 00       	call   2fd <fstat>
  close(fd);
 229:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22c:	89 c6                	mov    %eax,%esi
  close(fd);
 22e:	e8 9a 00 00 00       	call   2cd <close>
}
 233:	89 f0                	mov    %esi,%eax
 235:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 238:	8b 75 fc             	mov    -0x4(%ebp),%esi
 23b:	89 ec                	mov    %ebp,%esp
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret    
 23f:	90                   	nop

00000240 <gets>:
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
 245:	31 f6                	xor    %esi,%esi
 247:	53                   	push   %ebx
 248:	83 ec 2c             	sub    $0x2c,%esp
 24b:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 24e:	eb 06                	jmp    256 <gets+0x16>
    if(c == '\n' || c == '\r')
 250:	3c 0a                	cmp    $0xa,%al
 252:	74 39                	je     28d <gets+0x4d>
 254:	89 de                	mov    %ebx,%esi
  for(i=0; i+1 < max; ){
 256:	8d 5e 01             	lea    0x1(%esi),%ebx
 259:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 25c:	7d 31                	jge    28f <gets+0x4f>
    cc = read(0, &c, 1);
 25e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 261:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 268:	00 
 269:	89 44 24 04          	mov    %eax,0x4(%esp)
 26d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 274:	e8 44 00 00 00       	call   2bd <read>
    if(cc < 1)
 279:	85 c0                	test   %eax,%eax
 27b:	7e 12                	jle    28f <gets+0x4f>
    buf[i++] = c;
 27d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 281:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 285:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 289:	3c 0d                	cmp    $0xd,%al
 28b:	75 c3                	jne    250 <gets+0x10>
 28d:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 28f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
}
 293:	89 f8                	mov    %edi,%eax
 295:	83 c4 2c             	add    $0x2c,%esp
 298:	5b                   	pop    %ebx
 299:	5e                   	pop    %esi
 29a:	5f                   	pop    %edi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    

0000029d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29d:	b8 01 00 00 00       	mov    $0x1,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <exit>:
SYSCALL(exit)
 2a5:	b8 02 00 00 00       	mov    $0x2,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <wait>:
SYSCALL(wait)
 2ad:	b8 03 00 00 00       	mov    $0x3,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <pipe>:
SYSCALL(pipe)
 2b5:	b8 04 00 00 00       	mov    $0x4,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <read>:
SYSCALL(read)
 2bd:	b8 05 00 00 00       	mov    $0x5,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <write>:
SYSCALL(write)
 2c5:	b8 10 00 00 00       	mov    $0x10,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <close>:
SYSCALL(close)
 2cd:	b8 15 00 00 00       	mov    $0x15,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <kill>:
SYSCALL(kill)
 2d5:	b8 06 00 00 00       	mov    $0x6,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <exec>:
SYSCALL(exec)
 2dd:	b8 07 00 00 00       	mov    $0x7,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <open>:
SYSCALL(open)
 2e5:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <mknod>:
SYSCALL(mknod)
 2ed:	b8 11 00 00 00       	mov    $0x11,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <unlink>:
SYSCALL(unlink)
 2f5:	b8 12 00 00 00       	mov    $0x12,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <fstat>:
SYSCALL(fstat)
 2fd:	b8 08 00 00 00       	mov    $0x8,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <link>:
SYSCALL(link)
 305:	b8 13 00 00 00       	mov    $0x13,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <mkdir>:
SYSCALL(mkdir)
 30d:	b8 14 00 00 00       	mov    $0x14,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <chdir>:
SYSCALL(chdir)
 315:	b8 09 00 00 00       	mov    $0x9,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <dup>:
SYSCALL(dup)
 31d:	b8 0a 00 00 00       	mov    $0xa,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <getpid>:
SYSCALL(getpid)
 325:	b8 0b 00 00 00       	mov    $0xb,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <sbrk>:
SYSCALL(sbrk)
 32d:	b8 0c 00 00 00       	mov    $0xc,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <sleep>:
SYSCALL(sleep)
 335:	b8 0d 00 00 00       	mov    $0xd,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <uptime>:
SYSCALL(uptime)
 33d:	b8 0e 00 00 00       	mov    $0xe,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <date>:
 345:	b8 16 00 00 00       	mov    $0x16,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    
 34d:	66 90                	xchg   %ax,%ax
 34f:	90                   	nop

00000350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	89 cf                	mov    %ecx,%edi
 356:	56                   	push   %esi
 357:	89 c6                	mov    %eax,%esi
 359:	53                   	push   %ebx
 35a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 35d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 360:	85 c9                	test   %ecx,%ecx
 362:	74 04                	je     368 <printint+0x18>
 364:	85 d2                	test   %edx,%edx
 366:	78 70                	js     3d8 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 368:	89 d0                	mov    %edx,%eax
 36a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 371:	31 c9                	xor    %ecx,%ecx
 373:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 376:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 378:	31 d2                	xor    %edx,%edx
 37a:	f7 f7                	div    %edi
 37c:	0f b6 92 a0 07 00 00 	movzbl 0x7a0(%edx),%edx
 383:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 386:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 389:	85 c0                	test   %eax,%eax
 38b:	75 eb                	jne    378 <printint+0x28>
  if(neg)
 38d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 390:	85 c0                	test   %eax,%eax
 392:	74 08                	je     39c <printint+0x4c>
    buf[i++] = '-';
 394:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 399:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 39c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 39f:	01 fb                	add    %edi,%ebx
 3a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a8:	0f b6 03             	movzbl (%ebx),%eax
 3ab:	83 ef 01             	sub    $0x1,%edi
 3ae:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3b8:	00 
 3b9:	89 34 24             	mov    %esi,(%esp)
  while(--i >= 0)
 3bc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 3bf:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c6:	e8 fa fe ff ff       	call   2c5 <write>
  while(--i >= 0)
 3cb:	83 ff ff             	cmp    $0xffffffff,%edi
 3ce:	75 d8                	jne    3a8 <printint+0x58>
    putc(fd, buf[i]);
}
 3d0:	83 c4 4c             	add    $0x4c,%esp
 3d3:	5b                   	pop    %ebx
 3d4:	5e                   	pop    %esi
 3d5:	5f                   	pop    %edi
 3d6:	5d                   	pop    %ebp
 3d7:	c3                   	ret    
    x = -xx;
 3d8:	89 d0                	mov    %edx,%eax
 3da:	f7 d8                	neg    %eax
 3dc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3e3:	eb 8c                	jmp    371 <printint+0x21>
 3e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fc:	0f b6 10             	movzbl (%eax),%edx
 3ff:	84 d2                	test   %dl,%dl
 401:	0f 84 c9 00 00 00    	je     4d0 <printf+0xe0>
  ap = (uint*)(void*)&fmt + 1;
 407:	8d 4d 10             	lea    0x10(%ebp),%ecx
 40a:	31 ff                	xor    %edi,%edi
 40c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 40f:	31 db                	xor    %ebx,%ebx
  write(fd, &c, 1);
 411:	8d 75 e7             	lea    -0x19(%ebp),%esi
 414:	eb 1e                	jmp    434 <printf+0x44>
 416:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 418:	83 fa 25             	cmp    $0x25,%edx
 41b:	0f 85 b7 00 00 00    	jne    4d8 <printf+0xe8>
 421:	66 bf 25 00          	mov    $0x25,%di
  for(i = 0; fmt[i]; i++){
 425:	83 c3 01             	add    $0x1,%ebx
 428:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 42c:	84 d2                	test   %dl,%dl
 42e:	0f 84 9c 00 00 00    	je     4d0 <printf+0xe0>
    if(state == 0){
 434:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 436:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 439:	74 dd                	je     418 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 43b:	83 ff 25             	cmp    $0x25,%edi
 43e:	75 e5                	jne    425 <printf+0x35>
      if(c == 'd'){
 440:	83 fa 64             	cmp    $0x64,%edx
 443:	0f 84 47 01 00 00    	je     590 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 449:	83 fa 70             	cmp    $0x70,%edx
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 450:	0f 84 aa 00 00 00    	je     500 <printf+0x110>
 456:	83 fa 78             	cmp    $0x78,%edx
 459:	0f 84 a1 00 00 00    	je     500 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 45f:	83 fa 73             	cmp    $0x73,%edx
 462:	0f 84 c0 00 00 00    	je     528 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 468:	83 fa 63             	cmp    $0x63,%edx
 46b:	90                   	nop
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 470:	0f 84 42 01 00 00    	je     5b8 <printf+0x1c8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 476:	83 fa 25             	cmp    $0x25,%edx
 479:	0f 84 01 01 00 00    	je     580 <printf+0x190>
  write(fd, &c, 1);
 47f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 482:	89 55 cc             	mov    %edx,-0x34(%ebp)
 485:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 489:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 490:	00 
 491:	89 74 24 04          	mov    %esi,0x4(%esp)
 495:	89 0c 24             	mov    %ecx,(%esp)
 498:	e8 28 fe ff ff       	call   2c5 <write>
 49d:	8b 55 cc             	mov    -0x34(%ebp),%edx
 4a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 4a6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4a9:	31 ff                	xor    %edi,%edi
 4ab:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b2:	00 
 4b3:	89 74 24 04          	mov    %esi,0x4(%esp)
 4b7:	89 04 24             	mov    %eax,(%esp)
 4ba:	e8 06 fe ff ff       	call   2c5 <write>
 4bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 4c2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4c6:	84 d2                	test   %dl,%dl
 4c8:	0f 85 66 ff ff ff    	jne    434 <printf+0x44>
 4ce:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4d0:	83 c4 3c             	add    $0x3c,%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5f                   	pop    %edi
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    
  write(fd, &c, 1);
 4d8:	8b 45 08             	mov    0x8(%ebp),%eax
      if(c == '%'){
 4db:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 4de:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4e5:	00 
 4e6:	89 74 24 04          	mov    %esi,0x4(%esp)
 4ea:	89 04 24             	mov    %eax,(%esp)
 4ed:	e8 d3 fd ff ff       	call   2c5 <write>
 4f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f5:	e9 2b ff ff ff       	jmp    425 <printf+0x35>
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 500:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 508:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 50a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 511:	8b 10                	mov    (%eax),%edx
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	e8 35 fe ff ff       	call   350 <printint>
 51b:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 51e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 522:	e9 fe fe ff ff       	jmp    425 <printf+0x35>
 527:	90                   	nop
        s = (char*)*ap;
 528:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        if(s == 0)
 52b:	b9 99 07 00 00       	mov    $0x799,%ecx
        s = (char*)*ap;
 530:	8b 3a                	mov    (%edx),%edi
        ap++;
 532:	83 c2 04             	add    $0x4,%edx
 535:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 538:	85 ff                	test   %edi,%edi
 53a:	0f 44 f9             	cmove  %ecx,%edi
        while(*s != 0){
 53d:	0f b6 17             	movzbl (%edi),%edx
 540:	84 d2                	test   %dl,%dl
 542:	74 33                	je     577 <printf+0x187>
 544:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 547:	8b 5d 08             	mov    0x8(%ebp),%ebx
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          s++;
 550:	83 c7 01             	add    $0x1,%edi
        while(*s != 0){
 553:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 556:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 55d:	00 
 55e:	89 74 24 04          	mov    %esi,0x4(%esp)
 562:	89 1c 24             	mov    %ebx,(%esp)
 565:	e8 5b fd ff ff       	call   2c5 <write>
        while(*s != 0){
 56a:	0f b6 17             	movzbl (%edi),%edx
 56d:	84 d2                	test   %dl,%dl
 56f:	75 df                	jne    550 <printf+0x160>
 571:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 574:	8b 45 0c             	mov    0xc(%ebp),%eax
  write(fd, &c, 1);
 577:	31 ff                	xor    %edi,%edi
 579:	e9 a7 fe ff ff       	jmp    425 <printf+0x35>
 57e:	66 90                	xchg   %ax,%ax
      } else if(c == '%'){
 580:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 584:	e9 1a ff ff ff       	jmp    4a3 <printf+0xb3>
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 590:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 593:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 598:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 59b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5a2:	8b 10                	mov    (%eax),%edx
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	e8 a4 fd ff ff       	call   350 <printint>
 5ac:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5af:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5b3:	e9 6d fe ff ff       	jmp    425 <printf+0x35>
      } else if(c == 'c'){
 5b8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
 5bb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
      } else if(c == 'c'){
 5c0:	8b 02                	mov    (%edx),%eax
  write(fd, &c, 1);
 5c2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c9:	00 
 5ca:	89 74 24 04          	mov    %esi,0x4(%esp)
 5ce:	89 0c 24             	mov    %ecx,(%esp)
      } else if(c == 'c'){
 5d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d4:	e8 ec fc ff ff       	call   2c5 <write>
 5d9:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5dc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5e0:	e9 40 fe ff ff       	jmp    425 <printf+0x35>
 5e5:	66 90                	xchg   %ax,%ax
 5e7:	66 90                	xchg   %ax,%ax
 5e9:	66 90                	xchg   %ax,%ax
 5eb:	66 90                	xchg   %ax,%ax
 5ed:	66 90                	xchg   %ax,%ax
 5ef:	90                   	nop

000005f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f1:	a1 bc 07 00 00       	mov    0x7bc,%eax
{
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	53                   	push   %ebx
 5fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	39 c8                	cmp    %ecx,%eax
 603:	73 1d                	jae    622 <free+0x32>
 605:	8d 76 00             	lea    0x0(%esi),%esi
 608:	8b 10                	mov    (%eax),%edx
 60a:	39 d1                	cmp    %edx,%ecx
 60c:	72 1a                	jb     628 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 60e:	39 d0                	cmp    %edx,%eax
 610:	72 08                	jb     61a <free+0x2a>
 612:	39 c8                	cmp    %ecx,%eax
 614:	72 12                	jb     628 <free+0x38>
 616:	39 d1                	cmp    %edx,%ecx
 618:	72 0e                	jb     628 <free+0x38>
 61a:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 61c:	39 c8                	cmp    %ecx,%eax
 61e:	66 90                	xchg   %ax,%ax
 620:	72 e6                	jb     608 <free+0x18>
 622:	8b 10                	mov    (%eax),%edx
 624:	eb e8                	jmp    60e <free+0x1e>
 626:	66 90                	xchg   %ax,%ax
      break;
  if(bp + bp->s.size == p->s.ptr){
 628:	8b 71 04             	mov    0x4(%ecx),%esi
 62b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 62e:	39 d7                	cmp    %edx,%edi
 630:	74 19                	je     64b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 632:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 635:	8b 50 04             	mov    0x4(%eax),%edx
 638:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 63b:	39 ce                	cmp    %ecx,%esi
 63d:	74 23                	je     662 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 63f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 641:	a3 bc 07 00 00       	mov    %eax,0x7bc
}
 646:	5b                   	pop    %ebx
 647:	5e                   	pop    %esi
 648:	5f                   	pop    %edi
 649:	5d                   	pop    %ebp
 64a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 64b:	03 72 04             	add    0x4(%edx),%esi
 64e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 651:	8b 10                	mov    (%eax),%edx
 653:	8b 12                	mov    (%edx),%edx
 655:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 658:	8b 50 04             	mov    0x4(%eax),%edx
 65b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 65e:	39 ce                	cmp    %ecx,%esi
 660:	75 dd                	jne    63f <free+0x4f>
    p->s.size += bp->s.size;
 662:	03 51 04             	add    0x4(%ecx),%edx
 665:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 668:	8b 53 f8             	mov    -0x8(%ebx),%edx
 66b:	89 10                	mov    %edx,(%eax)
  freep = p;
 66d:	a3 bc 07 00 00       	mov    %eax,0x7bc
}
 672:	5b                   	pop    %ebx
 673:	5e                   	pop    %esi
 674:	5f                   	pop    %edi
 675:	5d                   	pop    %ebp
 676:	c3                   	ret    
 677:	89 f6                	mov    %esi,%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000680 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 689:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 68c:	8b 0d bc 07 00 00    	mov    0x7bc,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 692:	83 c3 07             	add    $0x7,%ebx
 695:	c1 eb 03             	shr    $0x3,%ebx
 698:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 69b:	85 c9                	test   %ecx,%ecx
 69d:	0f 84 9b 00 00 00    	je     73e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6a5:	8b 50 04             	mov    0x4(%eax),%edx
 6a8:	39 d3                	cmp    %edx,%ebx
 6aa:	76 27                	jbe    6d3 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6ac:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
  if(nu < 4096)
 6b3:	be 00 80 00 00       	mov    $0x8000,%esi
 6b8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6bb:	90                   	nop
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 6c0:	3b 05 bc 07 00 00    	cmp    0x7bc,%eax
 6c6:	74 30                	je     6f8 <malloc+0x78>
 6c8:	89 c1                	mov    %eax,%ecx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6ca:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6cc:	8b 50 04             	mov    0x4(%eax),%edx
 6cf:	39 d3                	cmp    %edx,%ebx
 6d1:	77 ed                	ja     6c0 <malloc+0x40>
      if(p->s.size == nunits)
 6d3:	39 d3                	cmp    %edx,%ebx
 6d5:	74 61                	je     738 <malloc+0xb8>
        p->s.size -= nunits;
 6d7:	29 da                	sub    %ebx,%edx
 6d9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6dc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6df:	89 58 04             	mov    %ebx,0x4(%eax)
      freep = prevp;
 6e2:	89 0d bc 07 00 00    	mov    %ecx,0x7bc
      return (void*)(p + 1);
 6e8:	83 c0 08             	add    $0x8,%eax
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6eb:	83 c4 2c             	add    $0x2c,%esp
 6ee:	5b                   	pop    %ebx
 6ef:	5e                   	pop    %esi
 6f0:	5f                   	pop    %edi
 6f1:	5d                   	pop    %ebp
 6f2:	c3                   	ret    
 6f3:	90                   	nop
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(nu < 4096)
 6f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fb:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 701:	bf 00 10 00 00       	mov    $0x1000,%edi
 706:	0f 43 fb             	cmovae %ebx,%edi
 709:	0f 42 c6             	cmovb  %esi,%eax
  p = sbrk(nu * sizeof(Header));
 70c:	89 04 24             	mov    %eax,(%esp)
 70f:	e8 19 fc ff ff       	call   32d <sbrk>
  if(p == (char*)-1)
 714:	83 f8 ff             	cmp    $0xffffffff,%eax
 717:	74 18                	je     731 <malloc+0xb1>
  hp->s.size = nu;
 719:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 71c:	83 c0 08             	add    $0x8,%eax
 71f:	89 04 24             	mov    %eax,(%esp)
 722:	e8 c9 fe ff ff       	call   5f0 <free>
  return freep;
 727:	8b 0d bc 07 00 00    	mov    0x7bc,%ecx
      if((p = morecore(nunits)) == 0)
 72d:	85 c9                	test   %ecx,%ecx
 72f:	75 99                	jne    6ca <malloc+0x4a>
    if(p->s.size >= nunits){
 731:	31 c0                	xor    %eax,%eax
 733:	eb b6                	jmp    6eb <malloc+0x6b>
 735:	8d 76 00             	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 738:	8b 10                	mov    (%eax),%edx
 73a:	89 11                	mov    %edx,(%ecx)
 73c:	eb a4                	jmp    6e2 <malloc+0x62>
    base.s.ptr = freep = prevp = &base;
 73e:	c7 05 bc 07 00 00 b4 	movl   $0x7b4,0x7bc
 745:	07 00 00 
    base.s.size = 0;
 748:	b9 b4 07 00 00       	mov    $0x7b4,%ecx
    base.s.ptr = freep = prevp = &base;
 74d:	c7 05 b4 07 00 00 b4 	movl   $0x7b4,0x7b4
 754:	07 00 00 
    base.s.size = 0;
 757:	c7 05 b8 07 00 00 00 	movl   $0x0,0x7b8
 75e:	00 00 00 
 761:	e9 3d ff ff ff       	jmp    6a3 <malloc+0x23>
