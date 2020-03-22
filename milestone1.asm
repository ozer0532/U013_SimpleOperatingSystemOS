
milestone1:     file format binary
; original milestone 1 (not modified yet)
; call   0x3f4

Disassembly of section .data:

00000000 <.data>:
   0:	55                   	push   %bp
   1:	89 e5                	mov    %sp,%bp
   3:	57                   	push   %di
   4:	56                   	push   %si
   5:	4c                   	dec    %sp
   6:	4c                   	dec    %sp
   7:	31 c0                	xor    %ax,%ax
   9:	89 46 fa             	mov    %ax,-0x6(%bp)
   c:	4c                   	dec    %sp
   d:	4c                   	dec    %sp
   e:	b8 01 00             	mov    $0x1,%ax
  11:	89 46 f8             	mov    %ax,-0x8(%bp)
  14:	81 c4 00 fa          	add    $0xfa00,%sp
  18:	b8 00 02             	mov    $0x200,%ax
  1b:	50                   	push   %ax
  1c:	8d 9e f8 fd          	lea    -0x208(%bp),%bx
  20:	53                   	push   %bx
  21:	e8 95 01             	call   0x1b9
  24:	83 c4 04             	add    $0x4,%sp
  27:	b8 00 02             	mov    $0x200,%ax
  2a:	50                   	push   %ax
  2b:	8d 9e f8 fb          	lea    -0x408(%bp),%bx
  2f:	53                   	push   %bx
  30:	e8 86 01             	call   0x1b9
  33:	83 c4 04             	add    $0x4,%sp
  36:	31 c0                	xor    %ax,%ax
  38:	50                   	push   %ax        ; dx = 0
  39:	31 c0                	xor    %ax,%ax
  3b:	50                   	push   %ax        ; cx = 0
  3c:	bb 51 05             	mov    $0x551,%bx
  3f:	53                   	push   %bx        ; bx = 551 (string pos)
  40:	31 c0                	xor    %ax,%ax
  42:	50                   	push   %ax        ; ax = 0
  43:	b8 21 00             	mov    $0x21,%ax  
  46:	50                   	push   %ax        ; number = 21
  47:	e8 aa 03             	call   0x3f4      ; Call interrupt()
  4a:	83 c4 0a             	add    $0xa,%sp
  4d:	31 c0                	xor    %ax,%ax
  4f:	50                   	push   %ax        ; dx = 0
  50:	31 c0                	xor    %ax,%ax
  52:	50                   	push   %ax        ; cx = 0
  53:	bb 3d 05             	mov    $0x53d,%bx
  56:	53                   	push   %bx        ; bx = 53d (string pos)
  57:	31 c0                	xor    %ax,%ax
  59:	50                   	push   %ax        ; ax = 0
  5a:	b8 21 00             	mov    $0x21,%ax
  5d:	50                   	push   %ax        ; number = 21
  5e:	e8 93 03             	call   0x3f4      ; Call interrupt()
  61:	83 c4 0a             	add    $0xa,%sp
  64:	31 c0                	xor    %ax,%ax
  66:	50                   	push   %ax        ; dx = 0
  67:	31 c0                	xor    %ax,%ax
  69:	50                   	push   %ax        ; cx = 0;
  6a:	8d 9e f8 fd          	lea    -0x208(%bp),%bx
  6e:	53                   	push   %bx        ; bx = bp-208
  6f:	b8 01 00             	mov    $0x1,%ax
  72:	50                   	push   %ax        ; ax = 1 readStr
  73:	b8 21 00             	mov    $0x21,%ax
  76:	50                   	push   %ax        ; number = 21
  77:	e8 7a 03             	call   0x3f4      ; Call interrupt()
  7a:	83 c4 0a             	add    $0xa,%sp
  7d:	8d 9e f8 f9          	lea    -0x608(%bp),%bx
  81:	53                   	push   %bx
  82:	8d 9e f8 fd          	lea    -0x208(%bp),%bx
  86:	53                   	push   %bx
  87:	e8 5e 01             	call   0x1e8
  8a:	83 c4 04             	add    $0x4,%sp
  8d:	89 46 fa             	mov    %ax,-0x6(%bp)
  90:	8b 46 fa             	mov    -0x6(%bp),%ax
  93:	3d 01 00             	cmp    $0x1,%ax
  96:	75 47                	jne    0xdf
  98:	8d 9e f8 f9          	lea    -0x608(%bp),%bx
  9c:	53                   	push   %bx
  9d:	8d 9e f8 fb          	lea    -0x408(%bp),%bx
  a1:	53                   	push   %bx
  a2:	e8 d9 00             	call   0x17e
  a5:	83 c4 04             	add    $0x4,%sp
  a8:	8d 5e f8             	lea    -0x8(%bp),%bx
  ab:	53                   	push   %bx        ; dx = bp-8
  ac:	bb 35 05             	mov    $0x535,%bx
  af:	53                   	push   %bx        ; cx = 535
  b0:	8d 9e f8 fb          	lea    -0x408(%bp),%bx
  b4:	53                   	push   %bx        ; bx = bp-408
  b5:	b8 05 00             	mov    $0x5,%ax   ; CHANGE TO FF05 (b8 05 ff)
  b8:	50                   	push   %ax        ; ax = 5 writeFile
  b9:	b8 21 00             	mov    $0x21,%ax
  bc:	50                   	push   %ax        ; number = 21
  bd:	e8 34 03             	call   0x3f4      ; Call interrupt()
  c0:	83 c4 0a             	add    $0xa,%sp
  c3:	31 c0                	xor    %ax,%ax
  c5:	50                   	push   %ax
  c6:	31 c0                	xor    %ax,%ax
  c8:	50                   	push   %ax
  c9:	bb 1c 05             	mov    $0x51c,%bx
  cc:	53                   	push   %bx        ; bx = 51c
  cd:	31 c0                	xor    %ax,%ax
  cf:	50                   	push   %ax        ; ax = 0 printStr
  d0:	b8 21 00             	mov    $0x21,%ax
  d3:	50                   	push   %ax        ; number = 21
  d4:	e8 1d 03             	call   0x3f4      ; Call interrupt()
  d7:	83 c4 0a             	add    $0xa,%sp
  da:	eb fe                	jmp    0xda
  dc:	e9 95 00             	jmp    0x174
  df:	8b 46 fa             	mov    -0x6(%bp),%ax
  e2:	3d ff ff             	cmp    $0xffff,%ax
  e5:	75 19                	jne    0x100
  e7:	31 c0                	xor    %ax,%ax
  e9:	50                   	push   %ax        ; dx = 0
  ea:	31 c0                	xor    %ax,%ax
  ec:	50                   	push   %ax        ; cx = 0
  ed:	bb f7 04             	mov    $0x4f7,%bx
  f0:	53                   	push   %bx        ; bx = 4f7
  f1:	31 c0                	xor    %ax,%ax
  f3:	50                   	push   %ax        ; ax = 0 printStr
  f4:	b8 21 00             	mov    $0x21,%ax
  f7:	50                   	push   %ax        ; number = 21
  f8:	e8 f9 02             	call   0x3f4      ; Call interrupt()
  fb:	83 c4 0a             	add    $0xa,%sp
  fe:	eb 74                	jmp    0x174
 100:	8b 46 fa             	mov    -0x6(%bp),%ax
 103:	3d fe ff             	cmp    $0xfffe,%ax
 106:	75 19                	jne    0x121
 108:	31 c0                	xor    %ax,%ax
 10a:	50                   	push   %ax        ; dx = 0
 10b:	31 c0                	xor    %ax,%ax
 10d:	50                   	push   %ax        ; cx = 0
 10e:	bb d2 04             	mov    $0x4d2,%bx
 111:	53                   	push   %bx        ; bx = 4d2
 112:	31 c0                	xor    %ax,%ax
 114:	50                   	push   %ax        ; ax = 0 printStr
 115:	b8 21 00             	mov    $0x21,%ax
 118:	50                   	push   %ax        ; number = 21
 119:	e8 d8 02             	call   0x3f4      ; Call interrupt()
 11c:	83 c4 0a             	add    $0xa,%sp
 11f:	eb 53                	jmp    0x174
 121:	8a 46 fa             	mov    -0x6(%bp),%al
 124:	88 86 f8 f9          	mov    %al,-0x608(%bp)
 128:	30 c0                	xor    %al,%al
 12a:	88 86 f9 f9          	mov    %al,-0x607(%bp)
 12e:	31 c0                	xor    %ax,%ax
 130:	50                   	push   %ax        ; dx = 0
 131:	31 c0                	xor    %ax,%ax
 133:	50                   	push   %ax        ; cx = 0
 134:	bb ac 04             	mov    $0x4ac,%bx
 137:	53                   	push   %bx        ; bx = 4ac
 138:	31 c0                	xor    %ax,%ax
 13a:	50                   	push   %ax        ; ax = 0
 13b:	b8 21 00             	mov    $0x21,%ax
 13e:	50                   	push   %ax        ; number = 21
 13f:	e8 b2 02             	call   0x3f4      ; Call interrupt()
 142:	83 c4 0a             	add    $0xa,%sp
 145:	31 c0                	xor    %ax,%ax
 147:	50                   	push   %ax        ; dx = 0
 148:	31 c0                	xor    %ax,%ax
 14a:	50                   	push   %ax        ; cx = 0
 14b:	8d 9e f8 f9          	lea    -0x608(%bp),%bx
 14f:	53                   	push   %bx        ; bx = bp-608
 150:	31 c0                	xor    %ax,%ax
 152:	50                   	push   %ax        ; ax = 0
 153:	b8 21 00             	mov    $0x21,%ax
 156:	50                   	push   %ax        ; number = 21
 157:	e8 9a 02             	call   0x3f4      ; Call interrupt()
 15a:	83 c4 0a             	add    $0xa,%sp
 15d:	31 c0                	xor    %ax,%ax
 15f:	50                   	push   %ax        ; dx = 0
 160:	31 c0                	xor    %ax,%ax
 162:	50                   	push   %ax        ; cx = 0
 163:	bb a8 04             	mov    $0x4a8,%bx
 166:	53                   	push   %bx        ; bx = 4a8
 167:	31 c0                	xor    %ax,%ax
 169:	50                   	push   %ax        ; ax = 0
 16a:	b8 21 00             	mov    $0x21,%ax
 16d:	50                   	push   %ax        ; number = 21
 16e:	e8 83 02             	call   0x3f4      ; Call interrupt()
 171:	83 c4 0a             	add    $0xa,%sp
 174:	e9 d6 fe             	jmp    0x4d
 177:	8d 66 fc             	lea    -0x4(%bp),%sp
 17a:	5e                   	pop    %si
 17b:	5f                   	pop    %di
 17c:	5d                   	pop    %bp
 17d:	c3                   	ret    
 17e:	55                   	push   %bp
 17f:	89 e5                	mov    %sp,%bp
 181:	57                   	push   %di
 182:	56                   	push   %si
 183:	4c                   	dec    %sp
 184:	4c                   	dec    %sp
 185:	31 c0                	xor    %ax,%ax
 187:	89 46 fa             	mov    %ax,-0x6(%bp)
 18a:	8b 46 fa             	mov    -0x6(%bp),%ax
 18d:	03 46 06             	add    0x6(%bp),%ax
 190:	89 c3                	mov    %ax,%bx
 192:	8b 46 fa             	mov    -0x6(%bp),%ax
 195:	03 46 04             	add    0x4(%bp),%ax
 198:	89 c6                	mov    %ax,%si
 19a:	8a 07                	mov    (%bx),%al
 19c:	88 04                	mov    %al,(%si)
 19e:	8b 46 fa             	mov    -0x6(%bp),%ax
 1a1:	40                   	inc    %ax
 1a2:	89 46 fa             	mov    %ax,-0x6(%bp)
 1a5:	8b 46 fa             	mov    -0x6(%bp),%ax
 1a8:	03 46 06             	add    0x6(%bp),%ax
 1ab:	89 c3                	mov    %ax,%bx
 1ad:	8a 07                	mov    (%bx),%al
 1af:	84 c0                	test   %al,%al
 1b1:	75 d7                	jne    0x18a
 1b3:	44                   	inc    %sp
 1b4:	44                   	inc    %sp
 1b5:	5e                   	pop    %si
 1b6:	5f                   	pop    %di
 1b7:	5d                   	pop    %bp
 1b8:	c3                   	ret    
 1b9:	55                   	push   %bp
 1ba:	89 e5                	mov    %sp,%bp
 1bc:	57                   	push   %di
 1bd:	56                   	push   %si
 1be:	4c                   	dec    %sp
 1bf:	4c                   	dec    %sp
 1c0:	31 c0                	xor    %ax,%ax
 1c2:	89 46 fa             	mov    %ax,-0x6(%bp)
 1c5:	eb 13                	jmp    0x1da
 1c7:	8b 46 fa             	mov    -0x6(%bp),%ax
 1ca:	03 46 04             	add    0x4(%bp),%ax
 1cd:	89 c3                	mov    %ax,%bx
 1cf:	30 c0                	xor    %al,%al
 1d1:	88 07                	mov    %al,(%bx)
 1d3:	8b 46 fa             	mov    -0x6(%bp),%ax
 1d6:	40                   	inc    %ax
 1d7:	89 46 fa             	mov    %ax,-0x6(%bp)
 1da:	8b 46 fa             	mov    -0x6(%bp),%ax
 1dd:	3b 46 06             	cmp    0x6(%bp),%ax
 1e0:	7c e5                	jl     0x1c7
 1e2:	44                   	inc    %sp
 1e3:	44                   	inc    %sp
 1e4:	5e                   	pop    %si
 1e5:	5f                   	pop    %di
 1e6:	5d                   	pop    %bp
 1e7:	c3                   	ret    
 1e8:	55                   	push   %bp
 1e9:	89 e5                	mov    %sp,%bp
 1eb:	57                   	push   %di
 1ec:	56                   	push   %si
 1ed:	81 c4 fe fd          	add    $0xfdfe,%sp
 1f1:	bb 2b 04             	mov    $0x42b,%bx
 1f4:	89 9e fa fd          	mov    %bx,-0x206(%bp)
 1f8:	4c                   	dec    %sp
 1f9:	4c                   	dec    %sp
 1fa:	bb 18 04             	mov    $0x418,%bx
 1fd:	89 9e f8 fd          	mov    %bx,-0x208(%bp)
 201:	4c                   	dec    %sp
 202:	4c                   	dec    %sp
 203:	31 c0                	xor    %ax,%ax
 205:	89 86 f6 fd          	mov    %ax,-0x20a(%bp)
 209:	e9 d3 00             	jmp    0x2df
 20c:	83 c4 fc             	add    $0xfffc,%sp
 20f:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 213:	03 46 04             	add    0x4(%bp),%ax
 216:	89 c3                	mov    %ax,%bx
 218:	8a 07                	mov    (%bx),%al
 21a:	84 c0                	test   %al,%al
 21c:	75 0a                	jne    0x228
 21e:	b8 ff ff             	mov    $0xffff,%ax
 221:	8d 66 fc             	lea    -0x4(%bp),%sp
 224:	5e                   	pop    %si
 225:	5f                   	pop    %di
 226:	5d                   	pop    %bp
 227:	c3                   	ret    
 228:	ff b6 fa fd          	pushw  -0x206(%bp)
 22c:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 230:	03 46 04             	add    0x4(%bp),%ax
 233:	89 c3                	mov    %ax,%bx
 235:	8a 07                	mov    (%bx),%al
 237:	30 e4                	xor    %ah,%ah
 239:	50                   	push   %ax
 23a:	e8 77 01             	call   0x3b4
 23d:	83 c4 04             	add    $0x4,%sp
 240:	89 86 f4 fd          	mov    %ax,-0x20c(%bp)
 244:	ff b6 fa fd          	pushw  -0x206(%bp)
 248:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 24c:	d1 e0                	shl    %ax
 24e:	03 86 f8 fd          	add    -0x208(%bp),%ax
 252:	89 c3                	mov    %ax,%bx
 254:	8a 07                	mov    (%bx),%al
 256:	30 e4                	xor    %ah,%ah
 258:	50                   	push   %ax
 259:	e8 58 01             	call   0x3b4
 25c:	83 c4 04             	add    $0x4,%sp
 25f:	89 86 f2 fd          	mov    %ax,-0x20e(%bp)
 263:	8b 86 f4 fd          	mov    -0x20c(%bp),%ax
 267:	85 c0                	test   %ax,%ax
 269:	7c 08                	jl     0x273
 26b:	8b 86 f2 fd          	mov    -0x20e(%bp),%ax
 26f:	85 c0                	test   %ax,%ax
 271:	7d 16                	jge    0x289
 273:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 277:	03 46 04             	add    0x4(%bp),%ax
 27a:	89 c3                	mov    %ax,%bx
 27c:	8a 07                	mov    (%bx),%al
 27e:	30 e4                	xor    %ah,%ah
 280:	8d 66 fc             	lea    -0x4(%bp),%sp
 283:	5e                   	pop    %si
 284:	5f                   	pop    %di
 285:	5d                   	pop    %bp
 286:	c3                   	ret    
 287:	eb 4a                	jmp    0x2d3
 289:	8b 86 f4 fd          	mov    -0x20c(%bp),%ax
 28d:	03 86 f2 fd          	add    -0x20e(%bp),%ax
 291:	3d 7c 00             	cmp    $0x7c,%ax
 294:	7d 1e                	jge    0x2b4
 296:	8b 86 f4 fd          	mov    -0x20c(%bp),%ax
 29a:	03 86 f2 fd          	add    -0x20e(%bp),%ax
 29e:	03 86 fa fd          	add    -0x206(%bp),%ax
 2a2:	89 c3                	mov    %ax,%bx
 2a4:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 2a8:	89 ee                	mov    %bp,%si
 2aa:	01 c6                	add    %ax,%si
 2ac:	8a 07                	mov    (%bx),%al
 2ae:	88 84 fc fd          	mov    %al,-0x204(%si)
 2b2:	eb 1f                	jmp    0x2d3
 2b4:	8b 86 f4 fd          	mov    -0x20c(%bp),%ax
 2b8:	03 86 f2 fd          	add    -0x20e(%bp),%ax
 2bc:	05 84 ff             	add    $0xff84,%ax
 2bf:	03 86 fa fd          	add    -0x206(%bp),%ax
 2c3:	89 c3                	mov    %ax,%bx
 2c5:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 2c9:	89 ee                	mov    %bp,%si
 2cb:	01 c6                	add    %ax,%si
 2cd:	8a 07                	mov    (%bx),%al
 2cf:	88 84 fc fd          	mov    %al,-0x204(%si)
 2d3:	83 c4 04             	add    $0x4,%sp
 2d6:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 2da:	40                   	inc    %ax
 2db:	89 86 f6 fd          	mov    %ax,-0x20a(%bp)
 2df:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 2e3:	3d 08 00             	cmp    $0x8,%ax
 2e6:	7d 03                	jge    0x2eb
 2e8:	e9 21 ff             	jmp    0x20c
 2eb:	8b 86 f6 fd          	mov    -0x20a(%bp),%ax
 2ef:	03 46 04             	add    0x4(%bp),%ax
 2f2:	89 c3                	mov    %ax,%bx
 2f4:	8a 07                	mov    (%bx),%al
 2f6:	84 c0                	test   %al,%al
 2f8:	74 0a                	je     0x304
 2fa:	b8 fe ff             	mov    $0xfffe,%ax
 2fd:	8d 66 fc             	lea    -0x4(%bp),%sp
 300:	5e                   	pop    %si
 301:	5f                   	pop    %di
 302:	5d                   	pop    %bp
 303:	c3                   	ret    
 304:	8a 86 fc fd          	mov    -0x204(%bp),%al
 308:	30 c0                	xor    %al,%al
 30a:	84 c0                	test   %al,%al
 30c:	74 4f                	je     0x35d
 30e:	8b 5e 06             	mov    0x6(%bp),%bx
 311:	8a 86 fe fd          	mov    -0x202(%bp),%al
 315:	88 07                	mov    %al,(%bx)
 317:	8b 5e 06             	mov    0x6(%bp),%bx
 31a:	8a 86 fd fd          	mov    -0x203(%bp),%al
 31e:	88 47 01             	mov    %al,0x1(%bx)
 321:	8b 5e 06             	mov    0x6(%bp),%bx
 324:	8a 86 03 fe          	mov    -0x1fd(%bp),%al
 328:	88 47 02             	mov    %al,0x2(%bx)
 32b:	8b 5e 06             	mov    0x6(%bp),%bx
 32e:	8a 86 ff fd          	mov    -0x201(%bp),%al
 332:	88 47 03             	mov    %al,0x3(%bx)
 335:	8b 5e 06             	mov    0x6(%bp),%bx
 338:	8a 86 00 fe          	mov    -0x200(%bp),%al
 33c:	88 47 04             	mov    %al,0x4(%bx)
 33f:	8b 5e 06             	mov    0x6(%bp),%bx
 342:	8a 86 02 fe          	mov    -0x1fe(%bp),%al
 346:	88 47 05             	mov    %al,0x5(%bx)
 349:	8b 5e 06             	mov    0x6(%bp),%bx
 34c:	8a 86 01 fe          	mov    -0x1ff(%bp),%al
 350:	88 47 06             	mov    %al,0x6(%bx)
 353:	8b 5e 06             	mov    0x6(%bp),%bx
 356:	30 c0                	xor    %al,%al
 358:	88 47 07             	mov    %al,0x7(%bx)
 35b:	eb 4d                	jmp    0x3aa
 35d:	8b 5e 06             	mov    0x6(%bp),%bx
 360:	8a 86 fd fd          	mov    -0x203(%bp),%al
 364:	88 07                	mov    %al,(%bx)
 366:	8b 5e 06             	mov    0x6(%bp),%bx
 369:	8a 86 ff fd          	mov    -0x201(%bp),%al
 36d:	88 47 01             	mov    %al,0x1(%bx)
 370:	8b 5e 06             	mov    0x6(%bp),%bx
 373:	8a 86 01 fe          	mov    -0x1ff(%bp),%al
 377:	88 47 02             	mov    %al,0x2(%bx)
 37a:	8b 5e 06             	mov    0x6(%bp),%bx
 37d:	8a 86 fe fd          	mov    -0x202(%bp),%al
 381:	88 47 03             	mov    %al,0x3(%bx)
 384:	8b 5e 06             	mov    0x6(%bp),%bx
 387:	8a 86 00 fe          	mov    -0x200(%bp),%al
 38b:	88 47 04             	mov    %al,0x4(%bx)
 38e:	8b 5e 06             	mov    0x6(%bp),%bx
 391:	8a 86 03 fe          	mov    -0x1fd(%bp),%al
 395:	88 47 05             	mov    %al,0x5(%bx)
 398:	8b 5e 06             	mov    0x6(%bp),%bx
 39b:	8a 86 02 fe          	mov    -0x1fe(%bp),%al
 39f:	88 47 06             	mov    %al,0x6(%bx)
 3a2:	8b 5e 06             	mov    0x6(%bp),%bx
 3a5:	30 c0                	xor    %al,%al
 3a7:	88 47 07             	mov    %al,0x7(%bx)
 3aa:	b8 01 00             	mov    $0x1,%ax
 3ad:	8d 66 fc             	lea    -0x4(%bp),%sp
 3b0:	5e                   	pop    %si
 3b1:	5f                   	pop    %di
 3b2:	5d                   	pop    %bp
 3b3:	c3                   	ret    
 3b4:	55                   	push   %bp
 3b5:	89 e5                	mov    %sp,%bp
 3b7:	57                   	push   %di
 3b8:	56                   	push   %si
 3b9:	4c                   	dec    %sp
 3ba:	4c                   	dec    %sp
 3bb:	31 c0                	xor    %ax,%ax
 3bd:	89 46 fa             	mov    %ax,-0x6(%bp)
 3c0:	eb 20                	jmp    0x3e2
 3c2:	8b 46 fa             	mov    -0x6(%bp),%ax
 3c5:	03 46 06             	add    0x6(%bp),%ax
 3c8:	89 c3                	mov    %ax,%bx
 3ca:	8a 07                	mov    (%bx),%al
 3cc:	3a 46 04             	cmp    0x4(%bp),%al
 3cf:	75 09                	jne    0x3da
 3d1:	8b 46 fa             	mov    -0x6(%bp),%ax
 3d4:	44                   	inc    %sp
 3d5:	44                   	inc    %sp
 3d6:	5e                   	pop    %si
 3d7:	5f                   	pop    %di
 3d8:	5d                   	pop    %bp
 3d9:	c3                   	ret    
 3da:	8b 46 fa             	mov    -0x6(%bp),%ax
 3dd:	40                   	inc    %ax
 3de:	40                   	inc    %ax
 3df:	89 46 fa             	mov    %ax,-0x6(%bp)
 3e2:	8b 46 fa             	mov    -0x6(%bp),%ax
 3e5:	3d 7c 00             	cmp    $0x7c,%ax
 3e8:	7c d8                	jl     0x3c2
 3ea:	b8 ff ff             	mov    $0xffff,%ax
 3ed:	44                   	inc    %sp
 3ee:	44                   	inc    %sp
 3ef:	5e                   	pop    %si
 3f0:	5f                   	pop    %di
 3f1:	5d                   	pop    %bp
 3f2:	c3                   	ret    
 3f3:	00 55 89             	add    %dl,-0x77(%di)
 3f6:	e5 8b                	in     $0x8b,%ax
 3f8:	46                   	inc    %si
 3f9:	04 1e                	add    $0x1e,%al
 3fb:	8c cb                	mov    %cs,%bx
 3fd:	8e db                	mov    %bx,%ds
 3ff:	be 12 04             	mov    $0x412,%si
 402:	88 44 01             	mov    %al,0x1(%si)
 405:	1f                   	pop    %ds
 406:	8b 46 06             	mov    0x6(%bp),%ax
 409:	8b 5e 08             	mov    0x8(%bp),%bx
 40c:	8b 4e 0a             	mov    0xa(%bp),%cx
 40f:	8b 56 0c             	mov    0xc(%bp),%dx
 412:	cd 00                	int    $0x0
 414:	b4 00                	mov    $0x0,%ah
 416:	5d                   	pop    %bp
 417:	c3                   	ret    
 418:	4b                   	dec    %bx
 419:	08 61 08             	or     %ah,0x8(%bx,%di)
 41c:	4e                   	dec    %si
 41d:	08 32                	or     %dh,(%bp,%si)
 41f:	08 6d 08             	or     %ch,0x8(%di)
 422:	49                   	dec    %cx
 423:	08 6b 08             	or     %ch,0x8(%bp,%di)
 426:	41                   	inc    %cx
 427:	08 6e 08             	or     %ch,0x8(%bp)
 42a:	00 31                	add    %dh,(%bx,%di)
 42c:	08 43 08             	or     %al,0x8(%bp,%di)
 42f:	48                   	dec    %ax
 430:	08 49 08             	or     %cl,0x8(%bx,%di)
 433:	4b                   	dec    %bx
 434:	08 41 08             	or     %al,0x8(%bx,%di)
 437:	32 08                	xor    (%bx,%si),%cl
 439:	52                   	push   %dx
 43a:	08 4f 08             	or     %cl,0x8(%bx)
 43d:	33 08                	xor    (%bx,%si),%cx
 43f:	4e                   	dec    %si
 440:	08 34                	or     %dh,(%si)
 442:	08 44 08             	or     %al,0x8(%si)
 445:	4d                   	dec    %bp
 446:	08 55 08             	or     %dl,0x8(%di)
 449:	42                   	inc    %dx
 44a:	08 59 08             	or     %bl,0x8(%bx,%di)
 44d:	45                   	inc    %bp
 44e:	08 46 08             	or     %al,0x8(%bp)
 451:	47                   	inc    %di
 452:	08 4a 08             	or     %cl,0x8(%bp,%si)
 455:	4c                   	dec    %sp
 456:	08 50 08             	or     %dl,0x8(%bx,%si)
 459:	51                   	push   %cx
 45a:	08 53 08             	or     %dl,0x8(%bp,%di)
 45d:	54                   	push   %sp
 45e:	08 56 08             	or     %dl,0x8(%bp)
 461:	57                   	push   %di
 462:	08 58 08             	or     %bl,0x8(%bx,%si)
 465:	5a                   	pop    %dx
 466:	08 36 08 30          	or     %dh,0x3008
 46a:	08 35                	or     %dh,(%di)
 46c:	08 72 08             	or     %dh,0x8(%bp,%si)
 46f:	75 08                	jne    0x479
 471:	62 08                	bound  %cx,(%bx,%si)
 473:	79 08                	jns    0x47d
 475:	39 08                	cmp    %cx,(%bx,%si)
 477:	6d                   	insw   (%dx),%es:(%di)
 478:	08 61 08             	or     %ah,0x8(%bx,%di)
 47b:	69 08 38 08          	imul   $0x838,(%bx,%si),%cx
 47f:	68 08 6e             	push   $0x6e08
 482:	08 37                	or     %dh,(%bx)
 484:	08 64 08             	or     %ah,0x8(%si)
 487:	6b 08 6f             	imul   $0x6f,(%bx,%si),%cx
 48a:	08 63 08             	or     %ah,0x8(%bp,%di)
 48d:	7a 08                	jp     0x497
 48f:	78 08                	js     0x499
 491:	77 08                	ja     0x49b
 493:	76 08                	jbe    0x49d
 495:	74 08                	je     0x49f
 497:	73 08                	jae    0x4a1
 499:	71 08                	jno    0x4a3
 49b:	70 08                	jo     0x4a5
 49d:	6c                   	insb   (%dx),%es:(%di)
 49e:	08 6a 08             	or     %ch,0x8(%bp,%si)
 4a1:	67 08 66 08          	or     %ah,0x8(%esi)
 4a5:	65 08 00             	or     %al,%gs:(%bx,%si)
 4a8:	29 0d                	sub    %cx,(%di)
 4aa:	0a 00                	or     (%bx,%si),%al
 4ac:	49                   	dec    %cx
 4ad:	6e                   	outsb  %ds:(%si),(%dx)
 4ae:	76 61                	jbe    0x511
 4b0:	6c                   	insb   (%dx),%es:(%di)
 4b1:	69 64 20 61 63       	imul   $0x6361,0x20(%si),%sp
 4b6:	63 65 73             	arpl   %sp,0x73(%di)
 4b9:	73 20                	jae    0x4db
 4bb:	63 6f 64             	arpl   %bp,0x64(%bx)
 4be:	65 20 63 68          	and    %ah,%gs:0x68(%bp,%di)
 4c2:	61                   	popa   
 4c3:	72 61                	jb     0x526
 4c5:	63 74 65             	arpl   %si,0x65(%si)
 4c8:	72 20                	jb     0x4ea
 4ca:	66 6f                	outsl  %ds:(%si),(%dx)
 4cc:	75 6e                	jne    0x53c
 4ce:	64 20 28             	and    %ch,%fs:(%bx,%si)
 4d1:	00 49 6e             	add    %cl,0x6e(%bx,%di)
 4d4:	76 61                	jbe    0x537
 4d6:	6c                   	insb   (%dx),%es:(%di)
 4d7:	69 64 20 61 63       	imul   $0x6361,0x20(%si),%sp
 4dc:	63 65 73             	arpl   %sp,0x73(%di)
 4df:	73 20                	jae    0x501
 4e1:	63 6f 64             	arpl   %bp,0x64(%bx)
 4e4:	65 20 6c 65          	and    %ch,%gs:0x65(%si)
 4e8:	6e                   	outsb  %ds:(%si),(%dx)
 4e9:	67 74 68             	addr32 je 0x554
 4ec:	20 28                	and    %ch,(%bx,%si)
 4ee:	6e                   	outsb  %ds:(%si),(%dx)
 4ef:	20 3e 20 38          	and    %bh,0x3820
 4f3:	29 0d                	sub    %cx,(%di)
 4f5:	0a 00                	or     (%bx,%si),%al
 4f7:	49                   	dec    %cx
 4f8:	6e                   	outsb  %ds:(%si),(%dx)
 4f9:	76 61                	jbe    0x55c
 4fb:	6c                   	insb   (%dx),%es:(%di)
 4fc:	69 64 20 61 63       	imul   $0x6361,0x20(%si),%sp
 501:	63 65 73             	arpl   %sp,0x73(%di)
 504:	73 20                	jae    0x526
 506:	63 6f 64             	arpl   %bp,0x64(%bx)
 509:	65 20 6c 65          	and    %ch,%gs:0x65(%si)
 50d:	6e                   	outsb  %ds:(%si),(%dx)
 50e:	67 74 68             	addr32 je 0x579
 511:	20 28                	and    %ch,(%bx,%si)
 513:	6e                   	outsb  %ds:(%si),(%dx)
 514:	20 3c                	and    %bh,(%si)
 516:	20 38                	and    %bh,(%bx,%si)
 518:	29 0d                	sub    %cx,(%di)
 51a:	0a 00                	or     (%bx,%si),%al
 51c:	4b                   	dec    %bx
 51d:	65 79 20             	gs jns 0x540
 520:	77 72                	ja     0x594
 522:	69 74 74 65 6e       	imul   $0x6e65,0x74(%si),%si
 527:	20 74 6f             	and    %dh,0x6f(%si)
 52a:	20 6b 65             	and    %ch,0x65(%bp,%di)
 52d:	79 2e                	jns    0x55d
 52f:	74 78                	je     0x5a9
 531:	74 0d                	je     0x540
 533:	0a 00                	or     (%bx,%si),%al
 535:	6b 65 79 2e          	imul   $0x2e,0x79(%di),%sp
 539:	74 78                	je     0x5b3
 53b:	74 00                	je     0x53d
 53d:	49                   	dec    %cx
 53e:	6e                   	outsb  %ds:(%si),(%dx)
 53f:	70 75                	jo     0x5b6
 541:	74 20                	je     0x563
 543:	61                   	popa   
 544:	63 63 65             	arpl   %sp,0x65(%bp,%di)
 547:	73 73                	jae    0x5bc
 549:	20 63 6f             	and    %ah,0x6f(%bp,%di)
 54c:	64 65 3a 20          	fs cmp %gs:(%bx,%si),%ah
 550:	00 53 74             	add    %dl,0x74(%bp,%di)
 553:	61                   	popa   
 554:	72 74                	jb     0x5ca
 556:	69 6e 67 20 6b       	imul   $0x6b20,0x67(%bp),%bp
 55b:	65 79 20             	gs jns 0x57e
 55e:	67 65 6e             	outsb  %gs:(%esi),(%dx)
 561:	65 72 61             	gs jb  0x5c5
 564:	74 69                	je     0x5cf
 566:	6f                   	outsw  %ds:(%si),(%dx)
 567:	6e                   	outsb  %ds:(%si),(%dx)
 568:	20 70 72             	and    %dh,0x72(%bx,%si)
 56b:	6f                   	outsw  %ds:(%si),(%dx)
 56c:	63 65 64             	arpl   %sp,0x64(%di)
 56f:	75 72                	jne    0x5e3
 571:	65 0d 0a 00          	gs or  $0xa,%ax
 575:	00 00                	add    %al,(%bx,%si)
	...
