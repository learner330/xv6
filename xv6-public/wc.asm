
_wc：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	31 ff                	xor    %edi,%edi
   6:	56                   	push   %esi
   7:	31 f6                	xor    %esi,%esi
   9:	53                   	push   %ebx
   a:	83 ec 3c             	sub    $0x3c,%esp
   d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  14:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  1b:	90                   	nop
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	8b 45 08             	mov    0x8(%ebp),%eax
  23:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 00 09 00 	movl   $0x900,0x4(%esp)
  32:	00 
  33:	89 04 24             	mov    %eax,(%esp)
  36:	e8 a2 03 00 00       	call   3dd <read>
  3b:	83 f8 00             	cmp    $0x0,%eax
  3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  41:	7e 4f                	jle    92 <wc+0x92>
  43:	31 db                	xor    %ebx,%ebx
  45:	eb 0b                	jmp    52 <wc+0x52>
  47:	90                   	nop
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  48:	31 ff                	xor    %edi,%edi
    for(i=0; i<n; i++){
  4a:	83 c3 01             	add    $0x1,%ebx
  4d:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  50:	7e 38                	jle    8a <wc+0x8a>
      if(buf[i] == '\n')
  52:	0f be 83 00 09 00 00 	movsbl 0x900(%ebx),%eax
        l++;
  59:	31 d2                	xor    %edx,%edx
      if(strchr(" \r\t\n\v", buf[i]))
  5b:	c7 04 24 86 08 00 00 	movl   $0x886,(%esp)
        l++;
  62:	3c 0a                	cmp    $0xa,%al
  64:	0f 94 c2             	sete   %dl
  67:	01 d6                	add    %edx,%esi
      if(strchr(" \r\t\n\v", buf[i]))
  69:	89 44 24 04          	mov    %eax,0x4(%esp)
  6d:	e8 ee 01 00 00       	call   260 <strchr>
  72:	85 c0                	test   %eax,%eax
  74:	75 d2                	jne    48 <wc+0x48>
        inword = 0;
      else if(!inword){
  76:	85 ff                	test   %edi,%edi
  78:	75 d0                	jne    4a <wc+0x4a>
        w++;
  7a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    for(i=0; i<n; i++){
  7e:	83 c3 01             	add    $0x1,%ebx
  81:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
        w++;
  84:	66 bf 01 00          	mov    $0x1,%di
    for(i=0; i<n; i++){
  88:	7f c8                	jg     52 <wc+0x52>
  8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  8d:	01 45 dc             	add    %eax,-0x24(%ebp)
  90:	eb 8e                	jmp    20 <wc+0x20>
        inword = 1;
      }
    }
  }
  if(n < 0){
  92:	75 35                	jne    c9 <wc+0xc9>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  94:	8b 45 0c             	mov    0xc(%ebp),%eax
  97:	89 74 24 08          	mov    %esi,0x8(%esp)
  9b:	c7 44 24 04 9c 08 00 	movl   $0x89c,0x4(%esp)
  a2:	00 
  a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  aa:	89 44 24 14          	mov    %eax,0x14(%esp)
  ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
  b1:	89 44 24 10          	mov    %eax,0x10(%esp)
  b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  b8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  bc:	e8 4f 04 00 00       	call   510 <printf>
}
  c1:	83 c4 3c             	add    $0x3c,%esp
  c4:	5b                   	pop    %ebx
  c5:	5e                   	pop    %esi
  c6:	5f                   	pop    %edi
  c7:	5d                   	pop    %ebp
  c8:	c3                   	ret    
    printf(1, "wc: read error\n");
  c9:	c7 44 24 04 8c 08 00 	movl   $0x88c,0x4(%esp)
  d0:	00 
  d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d8:	e8 33 04 00 00       	call   510 <printf>
    exit();
  dd:	e8 e3 02 00 00       	call   3c5 <exit>
  e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000f0 <main>:

int
main(int argc, char *argv[])
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	83 e4 f0             	and    $0xfffffff0,%esp
  f6:	57                   	push   %edi
  f7:	56                   	push   %esi
  f8:	53                   	push   %ebx
  f9:	83 ec 24             	sub    $0x24,%esp
  fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  int fd, i;

  if(argc <= 1){
  ff:	83 ff 01             	cmp    $0x1,%edi
 102:	7e 74                	jle    178 <main+0x88>
    wc(0, "");
    exit();
 104:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 107:	be 01 00 00 00       	mov    $0x1,%esi
 10c:	83 c3 04             	add    $0x4,%ebx
 10f:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
 110:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 117:	00 
 118:	8b 03                	mov    (%ebx),%eax
 11a:	89 04 24             	mov    %eax,(%esp)
 11d:	e8 e3 02 00 00       	call   405 <open>
 122:	85 c0                	test   %eax,%eax
 124:	78 32                	js     158 <main+0x68>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 126:	8b 13                	mov    (%ebx),%edx
  for(i = 1; i < argc; i++){
 128:	83 c6 01             	add    $0x1,%esi
 12b:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
 12e:	89 04 24             	mov    %eax,(%esp)
 131:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 135:	89 54 24 04          	mov    %edx,0x4(%esp)
 139:	e8 c2 fe ff ff       	call   0 <wc>
    close(fd);
 13e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 142:	89 04 24             	mov    %eax,(%esp)
 145:	e8 a3 02 00 00       	call   3ed <close>
  for(i = 1; i < argc; i++){
 14a:	39 f7                	cmp    %esi,%edi
 14c:	7f c2                	jg     110 <main+0x20>
  }
  exit();
 14e:	e8 72 02 00 00       	call   3c5 <exit>
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "wc: cannot open %s\n", argv[i]);
 158:	8b 03                	mov    (%ebx),%eax
 15a:	c7 44 24 04 a9 08 00 	movl   $0x8a9,0x4(%esp)
 161:	00 
 162:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 169:	89 44 24 08          	mov    %eax,0x8(%esp)
 16d:	e8 9e 03 00 00       	call   510 <printf>
      exit();
 172:	e8 4e 02 00 00       	call   3c5 <exit>
 177:	90                   	nop
    wc(0, "");
 178:	c7 44 24 04 9b 08 00 	movl   $0x89b,0x4(%esp)
 17f:	00 
 180:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 187:	e8 74 fe ff ff       	call   0 <wc>
    exit();
 18c:	e8 34 02 00 00       	call   3c5 <exit>
 191:	66 90                	xchg   %ax,%ax
 193:	66 90                	xchg   %ax,%ax
 195:	66 90                	xchg   %ax,%ax
 197:	66 90                	xchg   %ax,%ax
 199:	66 90                	xchg   %ax,%ax
 19b:	66 90                	xchg   %ax,%ax
 19d:	66 90                	xchg   %ax,%ax
 19f:	90                   	nop

000001a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1a0:	55                   	push   %ebp
 1a1:	31 d2                	xor    %edx,%edx
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
 1a8:	53                   	push   %ebx
 1a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1b7:	83 c2 01             	add    $0x1,%edx
 1ba:	84 c9                	test   %cl,%cl
 1bc:	75 f2                	jne    1b0 <strcpy+0x10>
    ;
  return os;
}
 1be:	5b                   	pop    %ebx
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	eb 0d                	jmp    1d0 <strcmp>
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop

000001d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1da:	0f b6 01             	movzbl (%ecx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	75 14                	jne    1f5 <strcmp+0x25>
 1e1:	eb 25                	jmp    208 <strcmp+0x38>
 1e3:	90                   	nop
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 1e8:	83 c1 01             	add    $0x1,%ecx
 1eb:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ee:	0f b6 01             	movzbl (%ecx),%eax
 1f1:	84 c0                	test   %al,%al
 1f3:	74 13                	je     208 <strcmp+0x38>
 1f5:	0f b6 1a             	movzbl (%edx),%ebx
 1f8:	38 d8                	cmp    %bl,%al
 1fa:	74 ec                	je     1e8 <strcmp+0x18>
 1fc:	0f b6 db             	movzbl %bl,%ebx
 1ff:	0f b6 c0             	movzbl %al,%eax
 202:	29 d8                	sub    %ebx,%eax
  return (uchar)*p - (uchar)*q;
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	90                   	nop
  while(*p && *p == *q)
 208:	0f b6 1a             	movzbl (%edx),%ebx
 20b:	31 c0                	xor    %eax,%eax
 20d:	0f b6 db             	movzbl %bl,%ebx
 210:	29 d8                	sub    %ebx,%eax
}
 212:	5b                   	pop    %ebx
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    
 215:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 221:	31 d2                	xor    %edx,%edx
{
 223:	89 e5                	mov    %esp,%ebp
  for(n = 0; s[n]; n++)
 225:	31 c0                	xor    %eax,%eax
{
 227:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(n = 0; s[n]; n++)
 22a:	80 39 00             	cmpb   $0x0,(%ecx)
 22d:	74 0c                	je     23b <strlen+0x1b>
 22f:	90                   	nop
 230:	83 c2 01             	add    $0x1,%edx
 233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 237:	89 d0                	mov    %edx,%eax
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
 246:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	89 d0                	mov    %edx,%eax
 254:	5f                   	pop    %edi
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 11                	jne    282 <strchr+0x22>
 271:	eb 15                	jmp    288 <strchr+0x28>
 273:	90                   	nop
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 278:	83 c0 01             	add    $0x1,%eax
 27b:	0f b6 10             	movzbl (%eax),%edx
 27e:	84 d2                	test   %dl,%dl
 280:	74 06                	je     288 <strchr+0x28>
    if(*s == c)
 282:	38 ca                	cmp    %cl,%dl
 284:	75 f2                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    
  for(; *s; s++)
 288:	31 c0                	xor    %eax,%eax
}
 28a:	5d                   	pop    %ebp
 28b:	90                   	nop
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 290:	c3                   	ret    
 291:	eb 0d                	jmp    2a0 <atoi>
 293:	90                   	nop
 294:	90                   	nop
 295:	90                   	nop
 296:	90                   	nop
 297:	90                   	nop
 298:	90                   	nop
 299:	90                   	nop
 29a:	90                   	nop
 29b:	90                   	nop
 29c:	90                   	nop
 29d:	90                   	nop
 29e:	90                   	nop
 29f:	90                   	nop

000002a0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2a0:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a1:	31 c0                	xor    %eax,%eax
{
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2a8:	53                   	push   %ebx
  while('0' <= *s && *s <= '9')
 2a9:	0f b6 11             	movzbl (%ecx),%edx
 2ac:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2af:	80 fb 09             	cmp    $0x9,%bl
 2b2:	77 1c                	ja     2d0 <atoi+0x30>
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 2b8:	0f be d2             	movsbl %dl,%edx
 2bb:	83 c1 01             	add    $0x1,%ecx
 2be:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2c1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2c5:	0f b6 11             	movzbl (%ecx),%edx
 2c8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2cb:	80 fb 09             	cmp    $0x9,%bl
 2ce:	76 e8                	jbe    2b8 <atoi+0x18>
  return n;
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	53                   	push   %ebx
 2e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ee:	85 db                	test   %ebx,%ebx
 2f0:	7e 14                	jle    306 <memmove+0x26>
memmove(void *vdst, const void *vsrc, int n)
 2f2:	31 d2                	xor    %edx,%edx
 2f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2ff:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 302:	39 da                	cmp    %ebx,%edx
 304:	75 f2                	jne    2f8 <memmove+0x18>
  return vdst;
}
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <stat>:
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 316:	8b 45 08             	mov    0x8(%ebp),%eax
{
 319:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 31c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(fd < 0)
 31f:	be ff ff ff ff       	mov    $0xffffffff,%esi
  fd = open(n, O_RDONLY);
 324:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 32b:	00 
 32c:	89 04 24             	mov    %eax,(%esp)
 32f:	e8 d1 00 00 00       	call   405 <open>
  if(fd < 0)
 334:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 336:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 338:	78 19                	js     353 <stat+0x43>
  r = fstat(fd, st);
 33a:	8b 45 0c             	mov    0xc(%ebp),%eax
 33d:	89 1c 24             	mov    %ebx,(%esp)
 340:	89 44 24 04          	mov    %eax,0x4(%esp)
 344:	e8 d4 00 00 00       	call   41d <fstat>
  close(fd);
 349:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 34c:	89 c6                	mov    %eax,%esi
  close(fd);
 34e:	e8 9a 00 00 00       	call   3ed <close>
}
 353:	89 f0                	mov    %esi,%eax
 355:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 358:	8b 75 fc             	mov    -0x4(%ebp),%esi
 35b:	89 ec                	mov    %ebp,%esp
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    
 35f:	90                   	nop

00000360 <gets>:
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	31 f6                	xor    %esi,%esi
 367:	53                   	push   %ebx
 368:	83 ec 2c             	sub    $0x2c,%esp
 36b:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 36e:	eb 06                	jmp    376 <gets+0x16>
    if(c == '\n' || c == '\r')
 370:	3c 0a                	cmp    $0xa,%al
 372:	74 39                	je     3ad <gets+0x4d>
 374:	89 de                	mov    %ebx,%esi
  for(i=0; i+1 < max; ){
 376:	8d 5e 01             	lea    0x1(%esi),%ebx
 379:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 37c:	7d 31                	jge    3af <gets+0x4f>
    cc = read(0, &c, 1);
 37e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 381:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 388:	00 
 389:	89 44 24 04          	mov    %eax,0x4(%esp)
 38d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 394:	e8 44 00 00 00       	call   3dd <read>
    if(cc < 1)
 399:	85 c0                	test   %eax,%eax
 39b:	7e 12                	jle    3af <gets+0x4f>
    buf[i++] = c;
 39d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a1:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 3a5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a9:	3c 0d                	cmp    $0xd,%al
 3ab:	75 c3                	jne    370 <gets+0x10>
 3ad:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 3af:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
}
 3b3:	89 f8                	mov    %edi,%eax
 3b5:	83 c4 2c             	add    $0x2c,%esp
 3b8:	5b                   	pop    %ebx
 3b9:	5e                   	pop    %esi
 3ba:	5f                   	pop    %edi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    

000003bd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3bd:	b8 01 00 00 00       	mov    $0x1,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <exit>:
SYSCALL(exit)
 3c5:	b8 02 00 00 00       	mov    $0x2,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <wait>:
SYSCALL(wait)
 3cd:	b8 03 00 00 00       	mov    $0x3,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <pipe>:
SYSCALL(pipe)
 3d5:	b8 04 00 00 00       	mov    $0x4,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <read>:
SYSCALL(read)
 3dd:	b8 05 00 00 00       	mov    $0x5,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <write>:
SYSCALL(write)
 3e5:	b8 10 00 00 00       	mov    $0x10,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <close>:
SYSCALL(close)
 3ed:	b8 15 00 00 00       	mov    $0x15,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <kill>:
SYSCALL(kill)
 3f5:	b8 06 00 00 00       	mov    $0x6,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <exec>:
SYSCALL(exec)
 3fd:	b8 07 00 00 00       	mov    $0x7,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <open>:
SYSCALL(open)
 405:	b8 0f 00 00 00       	mov    $0xf,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <mknod>:
SYSCALL(mknod)
 40d:	b8 11 00 00 00       	mov    $0x11,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <unlink>:
SYSCALL(unlink)
 415:	b8 12 00 00 00       	mov    $0x12,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <fstat>:
SYSCALL(fstat)
 41d:	b8 08 00 00 00       	mov    $0x8,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <link>:
SYSCALL(link)
 425:	b8 13 00 00 00       	mov    $0x13,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <mkdir>:
SYSCALL(mkdir)
 42d:	b8 14 00 00 00       	mov    $0x14,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <chdir>:
SYSCALL(chdir)
 435:	b8 09 00 00 00       	mov    $0x9,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <dup>:
SYSCALL(dup)
 43d:	b8 0a 00 00 00       	mov    $0xa,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <getpid>:
SYSCALL(getpid)
 445:	b8 0b 00 00 00       	mov    $0xb,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <sbrk>:
SYSCALL(sbrk)
 44d:	b8 0c 00 00 00       	mov    $0xc,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <sleep>:
SYSCALL(sleep)
 455:	b8 0d 00 00 00       	mov    $0xd,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <uptime>:
SYSCALL(uptime)
 45d:	b8 0e 00 00 00       	mov    $0xe,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <date>:
 465:	b8 16 00 00 00       	mov    $0x16,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    
 46d:	66 90                	xchg   %ax,%ax
 46f:	90                   	nop

00000470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	89 cf                	mov    %ecx,%edi
 476:	56                   	push   %esi
 477:	89 c6                	mov    %eax,%esi
 479:	53                   	push   %ebx
 47a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 47d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 480:	85 c9                	test   %ecx,%ecx
 482:	74 04                	je     488 <printint+0x18>
 484:	85 d2                	test   %edx,%edx
 486:	78 70                	js     4f8 <printint+0x88>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 488:	89 d0                	mov    %edx,%eax
 48a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 491:	31 c9                	xor    %ecx,%ecx
 493:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 496:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 498:	31 d2                	xor    %edx,%edx
 49a:	f7 f7                	div    %edi
 49c:	0f b6 92 c4 08 00 00 	movzbl 0x8c4(%edx),%edx
 4a3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 4a6:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 4a9:	85 c0                	test   %eax,%eax
 4ab:	75 eb                	jne    498 <printint+0x28>
  if(neg)
 4ad:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4b0:	85 c0                	test   %eax,%eax
 4b2:	74 08                	je     4bc <printint+0x4c>
    buf[i++] = '-';
 4b4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 4b9:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 4bc:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4bf:	01 fb                	add    %edi,%ebx
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c8:	0f b6 03             	movzbl (%ebx),%eax
 4cb:	83 ef 01             	sub    $0x1,%edi
 4ce:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4d8:	00 
 4d9:	89 34 24             	mov    %esi,(%esp)
  while(--i >= 0)
 4dc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4df:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e6:	e8 fa fe ff ff       	call   3e5 <write>
  while(--i >= 0)
 4eb:	83 ff ff             	cmp    $0xffffffff,%edi
 4ee:	75 d8                	jne    4c8 <printint+0x58>
    putc(fd, buf[i]);
}
 4f0:	83 c4 4c             	add    $0x4c,%esp
 4f3:	5b                   	pop    %ebx
 4f4:	5e                   	pop    %esi
 4f5:	5f                   	pop    %edi
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    
    x = -xx;
 4f8:	89 d0                	mov    %edx,%eax
 4fa:	f7 d8                	neg    %eax
 4fc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 503:	eb 8c                	jmp    491 <printint+0x21>
 505:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 519:	8b 45 0c             	mov    0xc(%ebp),%eax
 51c:	0f b6 10             	movzbl (%eax),%edx
 51f:	84 d2                	test   %dl,%dl
 521:	0f 84 c9 00 00 00    	je     5f0 <printf+0xe0>
  ap = (uint*)(void*)&fmt + 1;
 527:	8d 4d 10             	lea    0x10(%ebp),%ecx
 52a:	31 ff                	xor    %edi,%edi
 52c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 52f:	31 db                	xor    %ebx,%ebx
  write(fd, &c, 1);
 531:	8d 75 e7             	lea    -0x19(%ebp),%esi
 534:	eb 1e                	jmp    554 <printf+0x44>
 536:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 538:	83 fa 25             	cmp    $0x25,%edx
 53b:	0f 85 b7 00 00 00    	jne    5f8 <printf+0xe8>
 541:	66 bf 25 00          	mov    $0x25,%di
  for(i = 0; fmt[i]; i++){
 545:	83 c3 01             	add    $0x1,%ebx
 548:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 54c:	84 d2                	test   %dl,%dl
 54e:	0f 84 9c 00 00 00    	je     5f0 <printf+0xe0>
    if(state == 0){
 554:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 556:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 559:	74 dd                	je     538 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 55b:	83 ff 25             	cmp    $0x25,%edi
 55e:	75 e5                	jne    545 <printf+0x35>
      if(c == 'd'){
 560:	83 fa 64             	cmp    $0x64,%edx
 563:	0f 84 47 01 00 00    	je     6b0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 569:	83 fa 70             	cmp    $0x70,%edx
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 570:	0f 84 aa 00 00 00    	je     620 <printf+0x110>
 576:	83 fa 78             	cmp    $0x78,%edx
 579:	0f 84 a1 00 00 00    	je     620 <printf+0x110>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 57f:	83 fa 73             	cmp    $0x73,%edx
 582:	0f 84 c0 00 00 00    	je     648 <printf+0x138>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 588:	83 fa 63             	cmp    $0x63,%edx
 58b:	90                   	nop
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 590:	0f 84 42 01 00 00    	je     6d8 <printf+0x1c8>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 596:	83 fa 25             	cmp    $0x25,%edx
 599:	0f 84 01 01 00 00    	je     6a0 <printf+0x190>
  write(fd, &c, 1);
 59f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5a2:	89 55 cc             	mov    %edx,-0x34(%ebp)
 5a5:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5a9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b0:	00 
 5b1:	89 74 24 04          	mov    %esi,0x4(%esp)
 5b5:	89 0c 24             	mov    %ecx,(%esp)
 5b8:	e8 28 fe ff ff       	call   3e5 <write>
 5bd:	8b 55 cc             	mov    -0x34(%ebp),%edx
 5c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 5c6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5c9:	31 ff                	xor    %edi,%edi
 5cb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d2:	00 
 5d3:	89 74 24 04          	mov    %esi,0x4(%esp)
 5d7:	89 04 24             	mov    %eax,(%esp)
 5da:	e8 06 fe ff ff       	call   3e5 <write>
 5df:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(i = 0; fmt[i]; i++){
 5e2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 5e6:	84 d2                	test   %dl,%dl
 5e8:	0f 85 66 ff ff ff    	jne    554 <printf+0x44>
 5ee:	66 90                	xchg   %ax,%ax
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f0:	83 c4 3c             	add    $0x3c,%esp
 5f3:	5b                   	pop    %ebx
 5f4:	5e                   	pop    %esi
 5f5:	5f                   	pop    %edi
 5f6:	5d                   	pop    %ebp
 5f7:	c3                   	ret    
  write(fd, &c, 1);
 5f8:	8b 45 08             	mov    0x8(%ebp),%eax
      if(c == '%'){
 5fb:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 605:	00 
 606:	89 74 24 04          	mov    %esi,0x4(%esp)
 60a:	89 04 24             	mov    %eax,(%esp)
 60d:	e8 d3 fd ff ff       	call   3e5 <write>
 612:	8b 45 0c             	mov    0xc(%ebp),%eax
 615:	e9 2b ff ff ff       	jmp    545 <printf+0x35>
 61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 620:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 623:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 628:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 62a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 631:	8b 10                	mov    (%eax),%edx
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	e8 35 fe ff ff       	call   470 <printint>
 63b:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 63e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 642:	e9 fe fe ff ff       	jmp    545 <printf+0x35>
 647:	90                   	nop
        s = (char*)*ap;
 648:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        if(s == 0)
 64b:	b9 bd 08 00 00       	mov    $0x8bd,%ecx
        s = (char*)*ap;
 650:	8b 3a                	mov    (%edx),%edi
        ap++;
 652:	83 c2 04             	add    $0x4,%edx
 655:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 658:	85 ff                	test   %edi,%edi
 65a:	0f 44 f9             	cmove  %ecx,%edi
        while(*s != 0){
 65d:	0f b6 17             	movzbl (%edi),%edx
 660:	84 d2                	test   %dl,%dl
 662:	74 33                	je     697 <printf+0x187>
 664:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 667:	8b 5d 08             	mov    0x8(%ebp),%ebx
 66a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          s++;
 670:	83 c7 01             	add    $0x1,%edi
        while(*s != 0){
 673:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 676:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 67d:	00 
 67e:	89 74 24 04          	mov    %esi,0x4(%esp)
 682:	89 1c 24             	mov    %ebx,(%esp)
 685:	e8 5b fd ff ff       	call   3e5 <write>
        while(*s != 0){
 68a:	0f b6 17             	movzbl (%edi),%edx
 68d:	84 d2                	test   %dl,%dl
 68f:	75 df                	jne    670 <printf+0x160>
 691:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 694:	8b 45 0c             	mov    0xc(%ebp),%eax
  write(fd, &c, 1);
 697:	31 ff                	xor    %edi,%edi
 699:	e9 a7 fe ff ff       	jmp    545 <printf+0x35>
 69e:	66 90                	xchg   %ax,%ax
      } else if(c == '%'){
 6a0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6a4:	e9 1a ff ff ff       	jmp    5c3 <printf+0xb3>
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 6b8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 6bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6c2:	8b 10                	mov    (%eax),%edx
 6c4:	8b 45 08             	mov    0x8(%ebp),%eax
 6c7:	e8 a4 fd ff ff       	call   470 <printint>
 6cc:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 6cf:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6d3:	e9 6d fe ff ff       	jmp    545 <printf+0x35>
      } else if(c == 'c'){
 6d8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
 6db:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6dd:	8b 4d 08             	mov    0x8(%ebp),%ecx
      } else if(c == 'c'){
 6e0:	8b 02                	mov    (%edx),%eax
  write(fd, &c, 1);
 6e2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6e9:	00 
 6ea:	89 74 24 04          	mov    %esi,0x4(%esp)
 6ee:	89 0c 24             	mov    %ecx,(%esp)
      } else if(c == 'c'){
 6f1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6f4:	e8 ec fc ff ff       	call   3e5 <write>
 6f9:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 6fc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 700:	e9 40 fe ff ff       	jmp    545 <printf+0x35>
 705:	66 90                	xchg   %ax,%ax
 707:	66 90                	xchg   %ax,%ax
 709:	66 90                	xchg   %ax,%ax
 70b:	66 90                	xchg   %ax,%ax
 70d:	66 90                	xchg   %ax,%ax
 70f:	90                   	nop

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 e8 08 00 00       	mov    0x8e8,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 71e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	39 c8                	cmp    %ecx,%eax
 723:	73 1d                	jae    742 <free+0x32>
 725:	8d 76 00             	lea    0x0(%esi),%esi
 728:	8b 10                	mov    (%eax),%edx
 72a:	39 d1                	cmp    %edx,%ecx
 72c:	72 1a                	jb     748 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72e:	39 d0                	cmp    %edx,%eax
 730:	72 08                	jb     73a <free+0x2a>
 732:	39 c8                	cmp    %ecx,%eax
 734:	72 12                	jb     748 <free+0x38>
 736:	39 d1                	cmp    %edx,%ecx
 738:	72 0e                	jb     748 <free+0x38>
 73a:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73c:	39 c8                	cmp    %ecx,%eax
 73e:	66 90                	xchg   %ax,%ax
 740:	72 e6                	jb     728 <free+0x18>
 742:	8b 10                	mov    (%eax),%edx
 744:	eb e8                	jmp    72e <free+0x1e>
 746:	66 90                	xchg   %ax,%ax
      break;
  if(bp + bp->s.size == p->s.ptr){
 748:	8b 71 04             	mov    0x4(%ecx),%esi
 74b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 74e:	39 d7                	cmp    %edx,%edi
 750:	74 19                	je     76b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 752:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 755:	8b 50 04             	mov    0x4(%eax),%edx
 758:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 75b:	39 ce                	cmp    %ecx,%esi
 75d:	74 23                	je     782 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 75f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 761:	a3 e8 08 00 00       	mov    %eax,0x8e8
}
 766:	5b                   	pop    %ebx
 767:	5e                   	pop    %esi
 768:	5f                   	pop    %edi
 769:	5d                   	pop    %ebp
 76a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 76b:	03 72 04             	add    0x4(%edx),%esi
 76e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 771:	8b 10                	mov    (%eax),%edx
 773:	8b 12                	mov    (%edx),%edx
 775:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 778:	8b 50 04             	mov    0x4(%eax),%edx
 77b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 77e:	39 ce                	cmp    %ecx,%esi
 780:	75 dd                	jne    75f <free+0x4f>
    p->s.size += bp->s.size;
 782:	03 51 04             	add    0x4(%ecx),%edx
 785:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 788:	8b 53 f8             	mov    -0x8(%ebx),%edx
 78b:	89 10                	mov    %edx,(%eax)
  freep = p;
 78d:	a3 e8 08 00 00       	mov    %eax,0x8e8
}
 792:	5b                   	pop    %ebx
 793:	5e                   	pop    %esi
 794:	5f                   	pop    %edi
 795:	5d                   	pop    %ebp
 796:	c3                   	ret    
 797:	89 f6                	mov    %esi,%esi
 799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 7ac:	8b 0d e8 08 00 00    	mov    0x8e8,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	83 c3 07             	add    $0x7,%ebx
 7b5:	c1 eb 03             	shr    $0x3,%ebx
 7b8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7bb:	85 c9                	test   %ecx,%ecx
 7bd:	0f 84 9b 00 00 00    	je     85e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7c5:	8b 50 04             	mov    0x4(%eax),%edx
 7c8:	39 d3                	cmp    %edx,%ebx
 7ca:	76 27                	jbe    7f3 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 7cc:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
  if(nu < 4096)
 7d3:	be 00 80 00 00       	mov    $0x8000,%esi
 7d8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7db:	90                   	nop
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 7e0:	3b 05 e8 08 00 00    	cmp    0x8e8,%eax
 7e6:	74 30                	je     818 <malloc+0x78>
 7e8:	89 c1                	mov    %eax,%ecx
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ea:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7ec:	8b 50 04             	mov    0x4(%eax),%edx
 7ef:	39 d3                	cmp    %edx,%ebx
 7f1:	77 ed                	ja     7e0 <malloc+0x40>
      if(p->s.size == nunits)
 7f3:	39 d3                	cmp    %edx,%ebx
 7f5:	74 61                	je     858 <malloc+0xb8>
        p->s.size -= nunits;
 7f7:	29 da                	sub    %ebx,%edx
 7f9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7fc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7ff:	89 58 04             	mov    %ebx,0x4(%eax)
      freep = prevp;
 802:	89 0d e8 08 00 00    	mov    %ecx,0x8e8
      return (void*)(p + 1);
 808:	83 c0 08             	add    $0x8,%eax
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 80b:	83 c4 2c             	add    $0x2c,%esp
 80e:	5b                   	pop    %ebx
 80f:	5e                   	pop    %esi
 810:	5f                   	pop    %edi
 811:	5d                   	pop    %ebp
 812:	c3                   	ret    
 813:	90                   	nop
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(nu < 4096)
 818:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 81b:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 821:	bf 00 10 00 00       	mov    $0x1000,%edi
 826:	0f 43 fb             	cmovae %ebx,%edi
 829:	0f 42 c6             	cmovb  %esi,%eax
  p = sbrk(nu * sizeof(Header));
 82c:	89 04 24             	mov    %eax,(%esp)
 82f:	e8 19 fc ff ff       	call   44d <sbrk>
  if(p == (char*)-1)
 834:	83 f8 ff             	cmp    $0xffffffff,%eax
 837:	74 18                	je     851 <malloc+0xb1>
  hp->s.size = nu;
 839:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 83c:	83 c0 08             	add    $0x8,%eax
 83f:	89 04 24             	mov    %eax,(%esp)
 842:	e8 c9 fe ff ff       	call   710 <free>
  return freep;
 847:	8b 0d e8 08 00 00    	mov    0x8e8,%ecx
      if((p = morecore(nunits)) == 0)
 84d:	85 c9                	test   %ecx,%ecx
 84f:	75 99                	jne    7ea <malloc+0x4a>
    if(p->s.size >= nunits){
 851:	31 c0                	xor    %eax,%eax
 853:	eb b6                	jmp    80b <malloc+0x6b>
 855:	8d 76 00             	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 858:	8b 10                	mov    (%eax),%edx
 85a:	89 11                	mov    %edx,(%ecx)
 85c:	eb a4                	jmp    802 <malloc+0x62>
    base.s.ptr = freep = prevp = &base;
 85e:	c7 05 e8 08 00 00 e0 	movl   $0x8e0,0x8e8
 865:	08 00 00 
    base.s.size = 0;
 868:	b9 e0 08 00 00       	mov    $0x8e0,%ecx
    base.s.ptr = freep = prevp = &base;
 86d:	c7 05 e0 08 00 00 e0 	movl   $0x8e0,0x8e0
 874:	08 00 00 
    base.s.size = 0;
 877:	c7 05 e4 08 00 00 00 	movl   $0x0,0x8e4
 87e:	00 00 00 
 881:	e9 3d ff ff ff       	jmp    7c3 <malloc+0x23>
