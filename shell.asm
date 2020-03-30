
src/shell.o:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	a3 86 01             	mov    %ax,0x186
   3:	00 2a                	add    %ch,(%bp,%si)
   5:	1c 01                	sbb    $0x1,%al
   7:	00 00                	add    %al,(%bx,%si)
   9:	87 0a                	xchg   %cx,(%bp,%si)
   b:	00 00                	add    %al,(%bx,%si)
   d:	ad                   	lods   %ds:(%si),%ax
   e:	00 00                	add    %al,(%bx,%si)
  10:	00 55 55             	add    %dl,0x55(%di)
  13:	55                   	push   %bp
  14:	55                   	push   %bp
  15:	00 00                	add    %al,(%bx,%si)
  17:	00 82 ed 09          	add    %al,0x9ed(%bp,%si)
  1b:	9a 00 0e 00 06       	lcall  $0x600,$0xe00
  20:	00 80 80 20          	add    %al,0x2080(%bx,%si)
  24:	05 14 00             	add    $0x14,%ax
  27:	80 80 18 03 20       	addb   $0x20,0x318(%bx,%si)
  2c:	00 80 80 70          	add    %al,0x7080(%bx,%si)
  30:	09 25                	or     %sp,(%di)
  32:	00 80 80 7e          	add    %al,0x7e80(%bx,%si)
  36:	08 38                	or     %bh,(%bx,%si)
  38:	00 80 00 3e          	add    %al,0x3e00(%bx,%si)
  3c:	00 80 80 9f          	add    %al,-0x6080(%bx,%si)
  40:	09 43 00             	or     %ax,0x0(%bp,%di)
  43:	80 80 a0 04 4b       	addb   $0x4b,0x4a0(%bx,%si)
  48:	00 80 80 be          	add    %al,-0x4180(%bx,%si)
  4c:	09 52 00             	or     %dx,0x0(%bp,%si)
  4f:	80 80 ad 05 60       	addb   $0x60,0x5ad(%bx,%si)
  54:	00 4f 00             	add    %cl,0x0(%bx)
  57:	6b 00 80             	imul   $0xff80,(%bx,%si),%ax
  5a:	80 e9 04             	sub    $0x4,%cl
  5d:	7a 00                	jp     0x5f
  5f:	80 80 db 07 8e       	addb   $0x8e,0x7db(%bx,%si)
  64:	00 80 80 37          	add    %al,0x3780(%bx,%si)
  68:	03 99 00 80          	add    -0x8000(%bx,%di),%bx
  6c:	80 54 05 73          	adcb   $0x73,0x5(%si)
  70:	68 65 6c             	push   $0x6c65
  73:	6c                   	insb   (%dx),%es:(%di)
  74:	00 5f 73             	add    %bl,0x73(%bx)
  77:	74 72                	je     0xeb
  79:	69 6e 67 4c 65       	imul   $0x654c,0x67(%bp),%bp
  7e:	6e                   	outsb  %ds:(%si),(%dx)
  7f:	67 74 68             	addr32 je 0xea
  82:	00 5f 70             	add    %bl,0x70(%bx)
  85:	72 69                	jb     0xf0
  87:	6e                   	outsb  %ds:(%si),(%dx)
  88:	74 53                	je     0xdd
  8a:	68 65 6c             	push   $0x6c65
  8d:	6c                   	insb   (%dx),%es:(%di)
  8e:	00 5f 64             	add    %bl,0x64(%bx)
  91:	69 76 00 5f 70       	imul   $0x705f,0x0(%bp),%si
  96:	72 69                	jb     0x101
  98:	6e                   	outsb  %ds:(%si),(%dx)
  99:	74 53                	je     0xee
  9b:	68 65 6c             	push   $0x6c65
  9e:	6c                   	insb   (%dx),%es:(%di)
  9f:	49                   	dec    %cx
  a0:	6e                   	outsb  %ds:(%si),(%dx)
  a1:	74 65                	je     0x108
  a3:	67 65 72 00          	addr32 gs jb 0xa7
  a7:	5f                   	pop    %di
  a8:	6d                   	insw   (%dx),%es:(%di)
  a9:	61                   	popa   
  aa:	69 6e 00 5f 6d       	imul   $0x6d5f,0x0(%bp),%bp
  af:	6f                   	outsw  %ds:(%si),(%dx)
  b0:	64 00 5f 73          	add    %bl,%fs:0x73(%bx)
  b4:	74 72                	je     0x128
  b6:	63 70 79             	arpl   %si,0x79(%bx,%si)
  b9:	00 5f 63             	add    %bl,0x63(%bx)
  bc:	6c                   	insb   (%dx),%es:(%di)
  bd:	65 61                	gs popa 
  bf:	72 00                	jb     0xc1
  c1:	5f                   	pop    %di
  c2:	67 65 74 50          	addr32 gs je 0x116
  c6:	61                   	popa   
  c7:	74 68                	je     0x131
  c9:	49                   	dec    %cx
  ca:	6e                   	outsb  %ds:(%si),(%dx)
  cb:	64 65 78 00          	fs gs js 0xcf
  cf:	5f                   	pop    %di
  d0:	69 6e 74 65 72       	imul   $0x7265,0x74(%bp),%bp
  d5:	72 75                	jb     0x14c
  d7:	70 74                	jo     0x14d
  d9:	00 5f 63             	add    %bl,0x63(%bx)
  dc:	68 61 72             	push   $0x7261
  df:	41                   	inc    %cx
  e0:	72 72                	jb     0x154
  e2:	61                   	popa   
  e3:	79 43                	jns    0x128
  e5:	6f                   	outsw  %ds:(%si),(%dx)
  e6:	70 79                	jo     0x161
  e8:	00 5f 6c             	add    %bl,0x6c(%bx)
  eb:	69 73 74 46 6f       	imul   $0x6f46,0x74(%bp,%di),%si
  f0:	6c                   	insb   (%dx),%es:(%di)
  f1:	64 65 72 43          	fs gs jb 0x138
  f5:	6f                   	outsw  %ds:(%si),(%dx)
  f6:	6e                   	outsb  %ds:(%si),(%dx)
  f7:	74 65                	je     0x15e
  f9:	6e                   	outsb  %ds:(%si),(%dx)
  fa:	74 73                	je     0x16f
  fc:	00 5f 70             	add    %bl,0x70(%bx)
  ff:	72 69                	jb     0x16a
 101:	6e                   	outsb  %ds:(%si),(%dx)
 102:	74 50                	je     0x154
 104:	61                   	popa   
 105:	74 68                	je     0x16f
 107:	00 5f 69             	add    %bl,0x69(%bx)
 10a:	73 53                	jae    0x15f
 10c:	74 72                	je     0x180
 10e:	69 6e 67 53 74       	imul   $0x7453,0x67(%bp),%bp
 113:	61                   	popa   
 114:	72 74                	jb     0x18a
 116:	73 57                	jae    0x16f
 118:	69 74 68 00 20       	imul   $0x2000,0x68(%si),%si
 11d:	40                   	inc    %ax
 11e:	55                   	push   %bp
 11f:	89 e5                	mov    %sp,%bp
 121:	57                   	push   %di
 122:	56                   	push   %si
 123:	81 c4 75 fd          	add    $0xfd75,%sp
 127:	b0 ff                	mov    $0xff,%al
 129:	88 86 71 fd          	mov    %al,-0x28f(%bp)
 12d:	83 c4 fc             	add    $0xfffc,%sp
 130:	30 c0                	xor    %al,%al
 132:	88 86 6d fd          	mov    %al,-0x293(%bp)
 136:	4c                   	dec    %sp
 137:	b0 ff                	mov    $0xff,%al
 139:	88 86 6c fd          	mov    %al,-0x294(%bp)
 13d:	4c                   	dec    %sp
 13e:	4c                   	dec    %sp
 13f:	31 c0                	xor    %ax,%ax
 141:	89 86 6a fd          	mov    %ax,-0x296(%bp)
 145:	4c                   	dec    %sp
 146:	4c                   	dec    %sp
 147:	b8 ff ff             	mov    $0xffff,%ax
 14a:	89 86 68 fd          	mov    %ax,-0x298(%bp)
 14e:	4c                   	dec    %sp
 14f:	4c                   	dec    %sp
 150:	31 c0                	xor    %ax,%ax
 152:	89 86 66 fd          	mov    %ax,-0x29a(%bp)
 156:	83 c4 fc             	add    $0xfffc,%sp
 159:	b8 01 00             	mov    $0x1,%ax
 15c:	89 86 7c 62          	mov    %ax,0x627c(%bp)
 160:	fd                   	std    
 161:	83 c4 f6             	add    $0xfff6,%sp
 164:	b8 00 02             	mov    $0x200,%ax
 167:	50                   	push   %ax
 168:	8d 9e 72 fd          	lea    -0x28e(%bp),%bx
 16c:	53                   	push   %bx
 16d:	e8 6d 09             	call   0xadd
 170:	83 c4 04             	add    $0x4,%sp
 173:	8a 86 6d fd          	mov    -0x293(%bp),%al
 177:	84 c0                	test   %al,%al
 179:	75 0c                	jne    0x187
 17b:	8a 86 71 fd          	mov    -0x28f(%bp),%al
 17f:	30 e4                	xor    %ah,%ah
 181:	50                   	push   %ax
 182:	e8 d1 02             	call   0x456
 185:	44                   	inc    %sp
 186:	44                   	inc    %sp
 187:	31 c0                	xor    %ax,%ax
 189:	50                   	push   %ax
 18a:	31 c0                	xor    %ax,%ax
 18c:	50                   	push   %ax
 18d:	8d 9e 7c ff          	lea    -0x84(%bp),%bx
 191:	53                   	push   %bx
 192:	b8 01 00             	mov    $0x1,%ax
 195:	50                   	push   %ax
 196:	b8 21 00             	mov    $0x21,%ax
 199:	50                   	push   %ax
 19a:	e8 02 e0             	call   0xe19f
 19d:	09 40 83             	or     %ax,-0x7d(%bx,%si)
 1a0:	c4 0a                	les    (%bp,%si),%cx
 1a2:	8a 86 7c ff          	mov    -0x84(%bp),%al
 1a6:	84 c0                	test   %al,%al
 1a8:	74 03                	je     0x1ad
 1aa:	e9 c3 00             	jmp    0x270
 1ad:	8a 86 7d ff          	mov    -0x83(%bp),%al
 1b1:	84 c0                	test   %al,%al
 1b3:	75 03                	jne    0x1b8
 1b5:	e9 b8 00             	jmp    0x270
 1b8:	8a 86 7d ff          	mov    -0x83(%bp),%al
 1bc:	3c 48                	cmp    $0x48,%al
 1be:	75 16                	jne    0x1d6
 1c0:	8b 86 6a fd          	mov    -0x296(%bp),%ax
 1c4:	48                   	dec    %ax
 1c5:	3b 86 68 fd          	cmp    -0x298(%bp),%ax
 1c9:	7e 09                	jle    0x1d4
 1cb:	8b 86 68 fd          	mov    -0x298(%bp),%ax
 1cf:	40                   	inc    %ax
 1d0:	89 86 68 fd          	mov    %ax,-0x298(%bp)
 1d4:	eb 1a                	jmp    0x1f0
 1d6:	8a 86 7d ff          	mov    -0x83(%bp),%al
 1da:	3c 50                	cmp    $0x50,%al
 1dc:	75 12                	jne    0x1f0
 1de:	8b 40 86             	mov    -0x7a(%bx,%si),%ax
 1e1:	68 fd 3d             	push   $0x3dfd
 1e4:	ff                   	(bad)  
 1e5:	ff                   	(bad)  
 1e6:	7e 09                	jle    0x1f1
 1e8:	8b 86 68 fd          	mov    -0x298(%bp),%ax
 1ec:	48                   	dec    %ax
 1ed:	89 86 68 fd          	mov    %ax,-0x298(%bp)
 1f1:	8b 86 68 fd          	mov    -0x298(%bp),%ax
 1f5:	3d ff ff             	cmp    $0xffff,%ax
 1f8:	74 5f                	je     0x259
 1fa:	8b 86 68 fd          	mov    -0x298(%bp),%ax
 1fe:	b9 80 00             	mov    $0x80,%cx
 201:	f7 e9                	imul   %cx
 203:	b9 80 00             	mov    $0x80,%cx
 206:	f7 e9                	imul   %cx
 208:	89 eb                	mov    %bp,%bx
 20a:	01 c3                	add    %ax,%bx
 20c:	81 c3 72 fd          	add    $0xfd72,%bx
 210:	53                   	push   %bx
 211:	e8 26 02             	call   0x43a
 214:	44                   	inc    %sp
 215:	44                   	inc    %sp
 216:	8b 86 68 fd          	mov    -0x298(%bp),%ax
 21a:	b9 80 00             	mov    $0x80,%cx
 21d:	f7 e9                	imul   %cx
 21f:	b9 40 80             	mov    $0x8040,%cx
 222:	00 f7                	add    %dh,%bh
 224:	e9 89 eb             	jmp    0xedb0
 227:	01 c3                	add    %ax,%bx
 229:	81 c3 72 fd          	add    $0xfd72,%bx
 22d:	53                   	push   %bx
 22e:	8d 9e 7f ff          	lea    -0x81(%bp),%bx
 232:	53                   	push   %bx
 233:	e8 8d 03             	call   0x5c3
 236:	83 c4 04             	add    $0x4,%sp
 239:	b0 b0                	mov    $0xb0,%al
 23b:	88 86 7c ff          	mov    %al,-0x84(%bp)
 23f:	b0 b0                	mov    $0xb0,%al
 241:	88 86 7d ff          	mov    %al,-0x83(%bp)
 245:	b8 7e 00             	mov    $0x7e,%ax
 248:	50                   	push   %ax
 249:	8d 9e 7f ff          	lea    -0x81(%bp),%bx
 24d:	53                   	push   %bx
 24e:	e8 f2 03             	call   0x643
 251:	83 c4 04             	add    $0x4,%sp
 254:	88 86 7e ff          	mov    %al,-0x82(%bp)
 258:	eb 0f                	jmp    0x269
 25a:	b8 80 00             	mov    $0x80,%ax
 25d:	50                   	push   %ax
 25e:	8d 9e 7c 56          	lea    0x567c(%bp),%bx
 262:	ff 53 e8             	call   *-0x18(%bp,%di)
 265:	7b 08                	jnp    0x26f
 267:	83 c4 04             	add    $0x4,%sp
 26a:	b0 01                	mov    $0x1,%al
 26c:	88 86 6d fd          	mov    %al,-0x293(%bp)
 270:	e9 bd 01             	jmp    0x430
 273:	b8 03 00             	mov    $0x3,%ax
 276:	50                   	push   %ax
 277:	bb 83 96             	mov    $0x9683,%bx
 27a:	00 70 53             	add    %dh,0x53(%bx,%si)
 27d:	8d 9e 7c ff          	lea    -0x84(%bp),%bx
 281:	53                   	push   %bx
 282:	e8 f5 03             	call   0x67a
 285:	83 c4 06             	add    $0x6,%sp
 288:	84 c0                	test   %al,%al
 28a:	74 35                	je     0x2c1
 28c:	8d 9e 7f ff          	lea    -0x81(%bp),%bx
 290:	53                   	push   %bx
 291:	8a 86 71 fd          	mov    -0x28f(%bp),%al
 295:	30 e4                	xor    %ah,%ah
 297:	50                   	push   %ax
 298:	e8 38 04             	call   0x6d3
 29b:	83 c4 04             	add    $0x4,%sp
 29e:	89 86 66 fd          	mov    %ax,-0x29a(%bp)
 2a2:	8b 86 66 fd          	mov    -0x29a(%bp),%ax
 2a6:	3d ff ff             	cmp    $0xffff,%ax
 2a9:	75 0b                	jne    0x2b6
 2ab:	bb 83 7a             	mov    $0x7a83,%bx
 2ae:	00 58 53             	add    %bl,0x53(%bx,%si)
 2b1:	e8 8c 01             	call   0x440
 2b4:	44                   	inc    %sp
 2b5:	44                   	inc    %sp
 2b6:	eb 08                	jmp    0x2c0
 2b8:	8a 86 66 fd          	mov    -0x29a(%bp),%al
 2bc:	88 86 71 fd          	mov    %al,-0x28f(%bp)
 2c0:	e9 e4 00             	jmp    0x3a7
 2c3:	b8 07 00             	mov    $0x7,%ax
 2c6:	50                   	push   %ax
 2c7:	bb 83 72             	mov    $0x7283,%bx
 2ca:	00 55 53             	add    %dl,0x53(%di)
 2cd:	8d 9e 7c ff          	lea    -0x84(%bp),%bx
 2d1:	53                   	push   %bx
 2d2:	e8 a9 03             	call   0x67e
 2d5:	83 c4 06             	add    $0x6,%sp
 2d8:	84 c0                	test   %al,%al
 2da:	74 54                	je     0x330
 2dc:	b8 06 00             	mov    $0x6,%ax
 2df:	50                   	push   %ax
 2e0:	bb 83 6b             	mov    $0x6b83,%bx
 2e3:	00 6e 53             	add    %ch,0x53(%bp)
 2e6:	8d 5e 83             	lea    -0x7d(%bp),%bx
 2e9:	53                   	push   %bx
 2ea:	e8 93 03             	call   0x680
 2ed:	83 c4 06             	add    $0x6,%sp
 2f0:	84 c0                	test   %al,%al
 2f2:	74 33                	je     0x327
 2f4:	8d 5e 89             	lea    -0x77(%bp),%bx
 2f7:	53                   	push   %bx
 2f8:	8a 86 71 fd          	mov    -0x28f(%bp),%al
 2fc:	30 e4                	xor    %ah,%ah
 2fe:	50                   	push   %ax
 2ff:	e8 d7 03             	call   0x6d9
 302:	83 c4 04             	add    $0x4,%sp
 305:	89 86 66 fd          	mov    %ax,-0x29a(%bp)
 309:	8b 86 66 fd          	mov    -0x29a(%bp),%ax
 30d:	3d ff ff             	cmp    $0xffff,%ax
 310:	75 0b                	jne    0x31d
 312:	bb 83 4f             	mov    $0x4f83,%bx
 315:	00 53 53             	add    %dl,0x53(%bp,%di)
 318:	e8 2b 01             	call   0x446
 31b:	44                   	inc    %sp
 31c:	44                   	inc    %sp
 31d:	eb 08                	jmp    0x327
 31f:	8a 86 66 fd          	mov    -0x29a(%bp),%al
 323:	88 86 6c fd          	mov    %al,-0x294(%bp)
 327:	eb 09                	jmp    0x332
 329:	bb 83 2b             	mov    $0x2b83,%bx
 32c:	00 6f 53             	add    %ch,0x53(%bx)
 32f:	e8 16 01             	call   0x448
 332:	44                   	inc    %sp
 333:	44                   	inc    %sp
 334:	eb 79                	jmp    0x3af
 336:	8a 86 7c ff          	mov    -0x84(%bp),%al
 33a:	3c 2e                	cmp    $0x2e,%al
 33c:	75 38                	jne    0x376
 33e:	8a 86 7d ff          	mov    -0x83(%bp),%al
 342:	3c 2f                	cmp    $0x2f,%al
 344:	75 30                	jne    0x376
 346:	8d 9e 62 fd          	lea    -0x29e(%bp),%bx
 34a:	53                   	push   %bx
 34b:	b8 00 30             	mov    $0x3000,%ax
 34e:	50                   	push   %ax
 34f:	8d 9e 7e ff          	lea    -0x82(%bp),%bx
 353:	53                   	push   %bx
 354:	b8 06 ff             	mov    $0xff06,%ax
 357:	50                   	push   %ax
 358:	b8 21 00             	mov    $0x21,%ax
 35b:	50                   	push   %ax
 35c:	e8 e0 09             	call   0xd3f
 35f:	4d                   	dec    %bp
 360:	83 c4 0a             	add    $0xa,%sp
 363:	8b 86 62 fd          	mov    -0x29e(%bp),%ax
 367:	3d ff ff             	cmp    $0xffff,%ax
 36a:	75 09                	jne    0x375
 36c:	bb 83 1c             	mov    $0x1c83,%bx
 36f:	00 6a 53             	add    %ch,0x53(%bp,%si)
 372:	e8 d6 00             	call   0x44b
 375:	44                   	inc    %sp
 376:	44                   	inc    %sp
 377:	eb 39                	jmp    0x3b2
 379:	8d 9e 62 fd          	lea    -0x29e(%bp),%bx
 37d:	53                   	push   %bx
 37e:	b8 00 30             	mov    $0x3000,%ax
 381:	50                   	push   %ax
 382:	8d 9e 7c ff          	lea    -0x84(%bp),%bx
 386:	53                   	push   %bx
 387:	8a 86 6c fd          	mov    -0x294(%bp),%al
 38b:	30 e4                	xor    %ah,%ah
 38d:	b9 00 01             	mov    $0x100,%cx
 390:	f7 e9                	imul   %cx
 392:	05 06 00             	add    $0x6,%ax
 395:	50                   	push   %ax
 396:	b8 21 00             	mov    $0x21,%ax
 399:	50                   	push   %ax
 39a:	e8 e0 09             	call   0xd7d
 39d:	4d                   	dec    %bp
 39e:	83 c4 0a             	add    $0xa,%sp
 3a1:	8b 86 62 fd          	mov    -0x29e(%bp),%ax
 3a5:	3d ff ff             	cmp    $0xffff,%ax
 3a8:	75 09                	jne    0x3b3
 3aa:	bb 83 0a             	mov    $0xa83,%bx
 3ad:	00 40 53             	add    %al,0x53(%bx,%si)
 3b0:	e8 9b 00             	call   0x44e
 3b3:	44                   	inc    %sp
 3b4:	44                   	inc    %sp
 3b5:	b8 02 00             	mov    $0x2,%ax
 3b8:	89 86 5e fd          	mov    %ax,-0x2a2(%bp)
 3bc:	eb 3e                	jmp    0x3fc
 3be:	8b 86 5e fd          	mov    -0x2a2(%bp),%ax
 3c2:	b9 80 00             	mov    $0x80,%cx
 3c5:	f7 e9                	imul   %cx
 3c7:	b9 80 00             	mov    $0x80,%cx
 3ca:	f7 e9                	imul   %cx
 3cc:	89 eb                	mov    %bp,%bx
 3ce:	01 c3                	add    %ax,%bx
 3d0:	81 c3 72 fd          	add    $0xfd72,%bx
 3d4:	53                   	push   %bx
 3d5:	8b 86 5e fd          	mov    -0x2a2(%bp),%ax
 3d9:	40                   	inc    %ax
 3da:	b9 80 00             	mov    $0x80,%cx
 3dd:	f7 e9                	imul   %cx
 3df:	b9 80 00             	mov    $0x80,%cx
 3e2:	f7 e9                	imul   %cx
 3e4:	89 eb                	mov    %bp,%bx
 3e6:	01 c3                	add    %ax,%bx
 3e8:	81 c3 72 fd          	add    $0xfd72,%bx
 3ec:	53                   	push   %bx
 3ed:	e8 e6 40             	call   0x44d6
 3f0:	01 83 c4 04          	add    %ax,0x4c4(%bp,%di)
 3f4:	8b 86 5e fd          	mov    -0x2a2(%bp),%ax
 3f8:	48                   	dec    %ax
 3f9:	89 86 5e fd          	mov    %ax,-0x2a2(%bp)
 3fd:	8b 86 5e fd          	mov    -0x2a2(%bp),%ax
 401:	85 c0                	test   %ax,%ax
 403:	7d ba                	jge    0x3bf
 405:	8b 86 6a fd          	mov    -0x296(%bp),%ax
 409:	3d 04 00             	cmp    $0x4,%ax
 40c:	7d 09                	jge    0x417
 40e:	8b 86 6a fd          	mov    -0x296(%bp),%ax
 412:	40                   	inc    %ax
 413:	89 86 6a fd          	mov    %ax,-0x296(%bp)
 417:	8d 9e 7c ff          	lea    -0x84(%bp),%bx
 41b:	53                   	push   %bx
 41c:	8d 9e 72 fd          	lea    -0x28e(%bp),%bx
 420:	53                   	push   %bx
 421:	e8 b3 01             	call   0x5d7
 424:	83 c4 04             	add    $0x4,%sp
 427:	30 c0                	xor    %al,%al
 429:	88 86 6d fd          	mov    %al,-0x293(%bp)
 42d:	b8 ff ff             	mov    $0xffff,%ax
 430:	75 89                	jne    0x3bb
 432:	86 68 fd             	xchg   %ch,-0x3(%bx,%si)
 435:	b8 80 00             	mov    $0x80,%ax
 438:	50                   	push   %ax
 439:	8d 9e 7c ff          	lea    -0x84(%bp),%bx
 43d:	53                   	push   %bx
 43e:	e8 b5 06             	call   0xaf6
 441:	83 c4 04             	add    $0x4,%sp
 444:	e9 45 fd             	jmp    0x18c
 447:	31 c0                	xor    %ax,%ax
 449:	8d 66 fc             	lea    -0x4(%bp),%sp
 44c:	5e                   	pop    %si
 44d:	5f                   	pop    %di
 44e:	5d                   	pop    %bp
 44f:	c3                   	ret    
 450:	55                   	push   %bp
 451:	89 e5                	mov    %sp,%bp
 453:	57                   	push   %di
 454:	56                   	push   %si
 455:	31 c0                	xor    %ax,%ax
 457:	50                   	push   %ax
 458:	31 c0                	xor    %ax,%ax
 45a:	50                   	push   %ax
 45b:	ff 76 04             	pushw  0x4(%bp)
 45e:	31 c0                	xor    %ax,%ax
 460:	50                   	push   %ax
 461:	b8 21 00             	mov    $0x21,%ax
 464:	50                   	push   %ax
 465:	e8 e0 09             	call   0xe48
 468:	57                   	push   %di
 469:	83 c4 0a             	add    $0xa,%sp
 46c:	5e                   	pop    %si
 46d:	5f                   	pop    %di
 46e:	5d                   	pop    %bp
 46f:	c3                   	ret    
 470:	55                   	push   %bp
 471:	89 e5                	mov    %sp,%bp
 473:	57                   	push   %di
 474:	56                   	push   %si
 475:	81 c4 d6 f9          	add    $0xf9d6,%sp
 479:	31 c0                	xor    %ax,%ax
 47b:	89 86 d2 f9          	mov    %ax,-0x62e(%bp)
 47f:	bb 83 07             	mov    $0x783,%bx
 482:	00 70 53             	add    %dh,0x53(%bx,%si)
 485:	e8 cb ff             	call   0x453
 488:	44                   	inc    %sp
 489:	44                   	inc    %sp
 48a:	8a 46 04             	mov    0x4(%bp),%al
 48d:	30 e4                	xor    %ah,%ah
 48f:	89 86 d8 f9          	mov    %ax,-0x628(%bp)
 493:	8b 86 d8 f9          	mov    -0x628(%bp),%ax
 497:	3d ff 00             	cmp    $0xff,%ax
 49a:	75 03                	jne    0x49f
 49c:	e9 2c 01             	jmp    0x5cb
 49f:	31 c0                	xor    %ax,%ax
 4a1:	50                   	push   %ax
 4a2:	b8 01 01             	mov    $0x101,%ax
 4a5:	50                   	push   %ax
 4a6:	8d 9e fc fb          	lea    -0x404(%bp),%bx
 4aa:	53                   	push   %bx
 4ab:	b8 02 00             	mov    $0x2,%ax
 4ae:	50                   	push   %ax
 4af:	b8 21 00             	mov    $0x21,%ax
 4b2:	50                   	push   %ax
 4b3:	e8 e0 09             	call   0xe96
 4b6:	58                   	pop    %ax
 4b7:	83 c4 0a             	add    $0xa,%sp
 4ba:	31 c0                	xor    %ax,%ax
 4bc:	50                   	push   %ax
 4bd:	b8 02 01             	mov    $0x102,%ax
 4c0:	50                   	push   %ax
 4c1:	8d 9e fc fd          	lea    -0x204(%bp),%bx
 4c5:	53                   	push   %bx
 4c6:	b8 02 00             	mov    $0x2,%ax
 4c9:	50                   	push   %ax
 4ca:	b8 21 00             	mov    $0x21,%ax
 4cd:	50                   	push   %ax
 4ce:	e8 e0 09             	call   0xeb1
 4d1:	40                   	inc    %ax
 4d2:	83 c4 0a             	add    $0xa,%sp
 4d5:	31 c0                	xor    %ax,%ax
 4d7:	89 86 d6 f9          	mov    %ax,-0x62a(%bp)
 4db:	eb 2f                	jmp    0x50c
 4dd:	8b 86 d6 f9          	mov    -0x62a(%bp),%ax
 4e1:	89 eb                	mov    %bp,%bx
 4e3:	01 c3                	add    %ax,%bx
 4e5:	8a 86 d8 f9          	mov    -0x628(%bp),%al
 4e9:	88 87 db f9          	mov    %al,-0x625(%bx)
 4ed:	8b 86 d6 f9          	mov    -0x62a(%bp),%ax
 4f1:	40                   	inc    %ax
 4f2:	89 86 d6 f9          	mov    %ax,-0x62a(%bp)
 4f6:	8b 86 d8 f9          	mov    -0x628(%bp),%ax
 4fa:	b1 04                	mov    $0x4,%cl
 4fc:	d3 e0                	shl    %cl,%ax
 4fe:	89 eb                	mov    %bp,%bx
 500:	01 c3                	add    %ax,%bx
 502:	8a 87 fc fb          	mov    -0x404(%bx),%al
 506:	30 e4                	xor    %ah,%ah
 508:	89 86 d8 f9          	mov    %ax,-0x628(%bp)
 50c:	8b 86 d8 f9          	mov    -0x628(%bp),%ax
 510:	3d ff 40             	cmp    $0x40ff,%ax
 513:	00 75 c8             	add    %dh,-0x38(%di)
 516:	e9 92 00             	jmp    0x5ab
 519:	8b 86 d6 f9          	mov    -0x62a(%bp),%ax
 51d:	48                   	dec    %ax
 51e:	89 86 d6 f9          	mov    %ax,-0x62a(%bp)
 522:	31 c0                	xor    %ax,%ax
 524:	89 86 d4 f9          	mov    %ax,-0x62c(%bp)
 528:	eb 3e                	jmp    0x568
 52a:	8b 86 d6 f9          	mov    -0x62a(%bp),%ax
 52e:	89 eb                	mov    %bp,%bx
 530:	01 c3                	add    %ax,%bx
 532:	8a 87 db f9          	mov    -0x625(%bx),%al
 536:	30 e4                	xor    %ah,%ah
 538:	b1 04                	mov    $0x4,%cl
 53a:	d3 e0                	shl    %cl,%ax
 53c:	40                   	inc    %ax
 53d:	40                   	inc    %ax
 53e:	03 86 d4 f9          	add    -0x62c(%bp),%ax
 542:	89 eb                	mov    %bp,%bx
 544:	01 c3                	add    %ax,%bx
 546:	8b 86 d2 f9          	mov    -0x62e(%bp),%ax
 54a:	89 ee                	mov    %bp,%si
 54c:	01 c6                	add    %ax,%si
 54e:	8a 87 fc fb          	mov    -0x404(%bx),%al
 552:	88 40 84             	mov    %al,-0x7c(%bx,%si)
 555:	fb                   	sti    
 556:	f9                   	stc    
 557:	8b 86 d4 f9          	mov    -0x62c(%bp),%ax
 55b:	40                   	inc    %ax
 55c:	89 86 d4 f9          	mov    %ax,-0x62c(%bp)
 560:	8b 86 d2 f9          	mov    -0x62e(%bp),%ax
 564:	40                   	inc    %ax
 565:	89 86 d2 f9          	mov    %ax,-0x62e(%bp)
 569:	8b 86 d6 f9          	mov    -0x62a(%bp),%ax
 56d:	89 eb                	mov    %bp,%bx
 56f:	01 c3                	add    %ax,%bx
 571:	8a 87 db f9          	mov    -0x625(%bx),%al
 575:	30 e4                	xor    %ah,%ah
 577:	b1 04                	mov    $0x4,%cl
 579:	d3 e0                	shl    %cl,%ax
 57b:	40                   	inc    %ax
 57c:	40                   	inc    %ax
 57d:	03 86 d4 f9          	add    -0x62c(%bp),%ax
 581:	89 eb                	mov    %bp,%bx
 583:	01 c3                	add    %ax,%bx
 585:	8a 87 fc fb          	mov    -0x404(%bx),%al
 589:	84 c0                	test   %al,%al
 58b:	75 9e                	jne    0x52b
 58d:	8b 86 d6 f9          	mov    -0x62a(%bp),%ax
 591:	85 c0                	test   %ax,%ax
 593:	74 7c                	je     0x611
 595:	17                   	pop    %ss
 596:	8b 86 d2 f9          	mov    -0x62e(%bp),%ax
 59a:	89 eb                	mov    %bp,%bx
 59c:	01 c3                	add    %ax,%bx
 59e:	b0 2f                	mov    $0x2f,%al
 5a0:	88 87 fb f9          	mov    %al,-0x605(%bx)
 5a4:	8b 86 d2 f9          	mov    -0x62e(%bp),%ax
 5a8:	40                   	inc    %ax
 5a9:	89 86 d2 f9          	mov    %ax,-0x62e(%bp)
 5ad:	8b 86 d6 f9          	mov    -0x62a(%bp),%ax
 5b1:	85 c0                	test   %ax,%ax
 5b3:	74 03                	je     0x5b8
 5b5:	e9 63 ff             	jmp    0x51b
 5b8:	8b 86 d2 f9          	mov    -0x62e(%bp),%ax
 5bc:	89 eb                	mov    %bp,%bx
 5be:	01 c3                	add    %ax,%bx
 5c0:	30 c0                	xor    %al,%al
 5c2:	88 87 fb f9          	mov    %al,-0x605(%bx)
 5c6:	8d 9e fb f9          	lea    -0x605(%bp),%bx
 5ca:	53                   	push   %bx
 5cb:	e8 8a fe             	call   0x458
 5ce:	44                   	inc    %sp
 5cf:	44                   	inc    %sp
 5d0:	bb 83 04             	mov    $0x483,%bx
 5d3:	00 40 53             	add    %al,0x53(%bx,%si)
 5d6:	e8 81 fe             	call   0x45a
 5d9:	44                   	inc    %sp
 5da:	44                   	inc    %sp
 5db:	8d 66 fc             	lea    -0x4(%bp),%sp
 5de:	5e                   	pop    %si
 5df:	5f                   	pop    %di
 5e0:	5d                   	pop    %bp
 5e1:	c3                   	ret    
 5e2:	55                   	push   %bp
 5e3:	89 e5                	mov    %sp,%bp
 5e5:	57                   	push   %di
 5e6:	56                   	push   %si
 5e7:	4c                   	dec    %sp
 5e8:	4c                   	dec    %sp
 5e9:	31 c0                	xor    %ax,%ax
 5eb:	89 46 fa             	mov    %ax,-0x6(%bp)
 5ee:	eb 1b                	jmp    0x60b
 5f0:	8b 46 fa             	mov    -0x6(%bp),%ax
 5f3:	03 46 06             	add    0x6(%bp),%ax
 5f6:	89 c3                	mov    %ax,%bx
 5f8:	8b 46 fa             	mov    -0x6(%bp),%ax
 5fb:	03 46 04             	add    0x4(%bp),%ax
 5fe:	89 c6                	mov    %ax,%si
 600:	8a 07                	mov    (%bx),%al
 602:	88 04                	mov    %al,(%si)
 604:	8b 46 fa             	mov    -0x6(%bp),%ax
 607:	40                   	inc    %ax
 608:	89 46 fa             	mov    %ax,-0x6(%bp)
 60b:	8b 46 fa             	mov    -0x6(%bp),%ax
 60e:	03 46 06             	add    0x6(%bp),%ax
 611:	89 c3                	mov    %ax,%bx
 613:	8a 07                	mov    (%bx),%al
 615:	40                   	inc    %ax
 616:	84 c0                	test   %al,%al
 618:	75 d7                	jne    0x5f1
 61a:	8b 46 fa             	mov    -0x6(%bp),%ax
 61d:	03 46 04             	add    0x4(%bp),%ax
 620:	89 c3                	mov    %ax,%bx
 622:	30 c0                	xor    %al,%al
 624:	88 07                	mov    %al,(%bx)
 626:	44                   	inc    %sp
 627:	44                   	inc    %sp
 628:	5e                   	pop    %si
 629:	5f                   	pop    %di
 62a:	5d                   	pop    %bp
 62b:	c3                   	ret    
 62c:	55                   	push   %bp
 62d:	89 e5                	mov    %sp,%bp
 62f:	57                   	push   %di
 630:	56                   	push   %si
 631:	4c                   	dec    %sp
 632:	4c                   	dec    %sp
 633:	31 c0                	xor    %ax,%ax
 635:	89 46 fa             	mov    %ax,-0x6(%bp)
 638:	eb 1b                	jmp    0x655
 63a:	8b 46 fa             	mov    -0x6(%bp),%ax
 63d:	03 46 06             	add    0x6(%bp),%ax
 640:	89 c3                	mov    %ax,%bx
 642:	8b 46 fa             	mov    -0x6(%bp),%ax
 645:	03 46 04             	add    0x4(%bp),%ax
 648:	89 c6                	mov    %ax,%si
 64a:	8a 07                	mov    (%bx),%al
 64c:	88 04                	mov    %al,(%si)
 64e:	8b 46 fa             	mov    -0x6(%bp),%ax
 651:	40                   	inc    %ax
 652:	89 46 fa             	mov    %ax,-0x6(%bp)
 655:	8b 40 46             	mov    0x46(%bx,%si),%ax
 658:	fa                   	cli    
 659:	3b 46 08             	cmp    0x8(%bp),%ax
 65c:	7c dd                	jl     0x63b
 65e:	44                   	inc    %sp
 65f:	44                   	inc    %sp
 660:	5e                   	pop    %si
 661:	5f                   	pop    %di
 662:	5d                   	pop    %bp
 663:	c3                   	ret    
 664:	55                   	push   %bp
 665:	89 e5                	mov    %sp,%bp
 667:	57                   	push   %di
 668:	56                   	push   %si
 669:	4c                   	dec    %sp
 66a:	4c                   	dec    %sp
 66b:	31 c0                	xor    %ax,%ax
 66d:	89 46 fa             	mov    %ax,-0x6(%bp)
 670:	eb 07                	jmp    0x679
 672:	8b 46 fa             	mov    -0x6(%bp),%ax
 675:	40                   	inc    %ax
 676:	89 46 fa             	mov    %ax,-0x6(%bp)
 679:	8b 46 fa             	mov    -0x6(%bp),%ax
 67c:	03 46 04             	add    0x4(%bp),%ax
 67f:	89 c3                	mov    %ax,%bx
 681:	8a 07                	mov    (%bx),%al
 683:	84 c0                	test   %al,%al
 685:	74 08                	je     0x68f
 687:	8b 46 fa             	mov    -0x6(%bp),%ax
 68a:	3b 46 06             	cmp    0x6(%bp),%ax
 68d:	7c e3                	jl     0x672
 68f:	8b 46 fa             	mov    -0x6(%bp),%ax
 692:	44                   	inc    %sp
 693:	44                   	inc    %sp
 694:	5e                   	pop    %si
 695:	5f                   	pop    %di
 696:	5d                   	pop    %bp
 697:	40                   	inc    %ax
 698:	c3                   	ret    
 699:	55                   	push   %bp
 69a:	89 e5                	mov    %sp,%bp
 69c:	57                   	push   %di
 69d:	56                   	push   %si
 69e:	4c                   	dec    %sp
 69f:	4c                   	dec    %sp
 6a0:	31 c0                	xor    %ax,%ax
 6a2:	89 46 fa             	mov    %ax,-0x6(%bp)
 6a5:	eb 3b                	jmp    0x6e2
 6a7:	8b 46 fa             	mov    -0x6(%bp),%ax
 6aa:	03 46 06             	add    0x6(%bp),%ax
 6ad:	89 c3                	mov    %ax,%bx
 6af:	8a 07                	mov    (%bx),%al
 6b1:	84 c0                	test   %al,%al
 6b3:	75 08                	jne    0x6bd
 6b5:	b0 01                	mov    $0x1,%al
 6b7:	44                   	inc    %sp
 6b8:	44                   	inc    %sp
 6b9:	5e                   	pop    %si
 6ba:	5f                   	pop    %di
 6bb:	5d                   	pop    %bp
 6bc:	c3                   	ret    
 6bd:	8b 46 fa             	mov    -0x6(%bp),%ax
 6c0:	03 46 06             	add    0x6(%bp),%ax
 6c3:	89 c3                	mov    %ax,%bx
 6c5:	8b 46 fa             	mov    -0x6(%bp),%ax
 6c8:	03 46 04             	add    0x4(%bp),%ax
 6cb:	89 c6                	mov    %ax,%si
 6cd:	8a 04                	mov    (%si),%al
 6cf:	3a 07                	cmp    (%bx),%al
 6d1:	74 08                	je     0x6db
 6d3:	30 c0                	xor    %al,%al
 6d5:	44                   	inc    %sp
 6d6:	44                   	inc    %sp
 6d7:	5e                   	pop    %si
 6d8:	40                   	inc    %ax
 6d9:	5f                   	pop    %di
 6da:	5d                   	pop    %bp
 6db:	c3                   	ret    
 6dc:	8b 46 fa             	mov    -0x6(%bp),%ax
 6df:	40                   	inc    %ax
 6e0:	89 46 fa             	mov    %ax,-0x6(%bp)
 6e3:	8b 46 fa             	mov    -0x6(%bp),%ax
 6e6:	3b 46 08             	cmp    0x8(%bp),%ax
 6e9:	7c bd                	jl     0x6a8
 6eb:	b0 01                	mov    $0x1,%al
 6ed:	44                   	inc    %sp
 6ee:	44                   	inc    %sp
 6ef:	5e                   	pop    %si
 6f0:	5f                   	pop    %di
 6f1:	5d                   	pop    %bp
 6f2:	c3                   	ret    
 6f3:	55                   	push   %bp
 6f4:	89 e5                	mov    %sp,%bp
 6f6:	57                   	push   %di
 6f7:	56                   	push   %si
 6f8:	81 c4 fa fb          	add    $0xfbfa,%sp
 6fc:	b0 10                	mov    $0x10,%al
 6fe:	88 46 fb             	mov    %al,-0x5(%bp)
 701:	b0 40                	mov    $0x40,%al
 703:	88 46 fa             	mov    %al,-0x6(%bp)
 706:	30 c0                	xor    %al,%al
 708:	88 86 f9 fb          	mov    %al,-0x407(%bp)
 70c:	8a 46 04             	mov    0x4(%bp),%al
 70f:	88 86 f8 fb          	mov    %al,-0x408(%bp)
 713:	30 c0                	xor    %al,%al
 715:	88 86 f7 fb          	mov    %al,-0x409(%bp)
 719:	5b                   	pop    %bx
 71a:	30 c0                	xor    %al,%al
 71c:	88 86 f6 fb          	mov    %al,-0x40a(%bp)
 720:	31 c0                	xor    %ax,%ax
 722:	50                   	push   %ax
 723:	b8 01 01             	mov    $0x101,%ax
 726:	50                   	push   %ax
 727:	8d 9e fa fb          	lea    -0x406(%bp),%bx
 72b:	53                   	push   %bx
 72c:	b8 02 00             	mov    $0x2,%ax
 72f:	50                   	push   %ax
 730:	b8 21 00             	mov    $0x21,%ax
 733:	50                   	push   %ax
 734:	e8 e0 09             	call   0x1117
 737:	58                   	pop    %ax
 738:	83 c4 0a             	add    $0xa,%sp
 73b:	31 c0                	xor    %ax,%ax
 73d:	50                   	push   %ax
 73e:	b8 02 01             	mov    $0x102,%ax
 741:	50                   	push   %ax
 742:	8d 9e fa fd          	lea    -0x206(%bp),%bx
 746:	53                   	push   %bx
 747:	b8 02 00             	mov    $0x2,%ax
 74a:	50                   	push   %ax
 74b:	b8 21 00             	mov    $0x21,%ax
 74e:	50                   	push   %ax
 74f:	e8 e0 09             	call   0x1132
 752:	40                   	inc    %ax
 753:	83 c4 0a             	add    $0xa,%sp
 756:	8b 5e 06             	mov    0x6(%bp),%bx
 759:	8a 07                	mov    (%bx),%al
 75b:	3c 2f                	cmp    $0x2f,%al
 75d:	75 11                	jne    0x770
 75f:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 763:	40                   	inc    %ax
 764:	88 86 f7 fb          	mov    %al,-0x409(%bp)
 768:	b0 ff                	mov    $0xff,%al
 76a:	88 86 f8 fb          	mov    %al,-0x408(%bp)
 76e:	eb 21                	jmp    0x791
 770:	8b 5e 06             	mov    0x6(%bp),%bx
 773:	8a 07                	mov    (%bx),%al
 775:	3c 2e                	cmp    $0x2e,%al
 777:	75 18                	jne    0x791
 779:	8b 5e 06             	mov    0x6(%bp),%bx
 77c:	8a 47 01             	mov    0x1(%bx),%al
 77f:	3c 2f                	cmp    $0x2f,%al
 781:	75 0e                	jne    0x791
 783:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 787:	30 e4                	xor    %ah,%ah
 789:	40                   	inc    %ax
 78a:	40                   	inc    %ax
 78b:	88 86 f7 fb          	mov    %al,-0x409(%bp)
 78f:	eb 00                	jmp    0x791
 791:	e9 6f 40             	jmp    0x4803
 794:	01 8a 86 f7          	add    %cx,-0x87a(%bp,%si)
 798:	fb                   	sti    
 799:	30 e4                	xor    %ah,%ah
 79b:	03 46 06             	add    0x6(%bp),%ax
 79e:	89 c3                	mov    %ax,%bx
 7a0:	8a 07                	mov    (%bx),%al
 7a2:	3c 2f                	cmp    $0x2f,%al
 7a4:	75 24                	jne    0x7ca
 7a6:	8a 86 f6 fb          	mov    -0x40a(%bp),%al
 7aa:	84 c0                	test   %al,%al
 7ac:	75 0a                	jne    0x7b8
 7ae:	b8 ff ff             	mov    $0xffff,%ax
 7b1:	8d 66 fc             	lea    -0x4(%bp),%sp
 7b4:	5e                   	pop    %si
 7b5:	5f                   	pop    %di
 7b6:	5d                   	pop    %bp
 7b7:	c3                   	ret    
 7b8:	30 c0                	xor    %al,%al
 7ba:	88 86 f6 fb          	mov    %al,-0x40a(%bp)
 7be:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 7c2:	40                   	inc    %ax
 7c3:	88 86 f7 fb          	mov    %al,-0x409(%bp)
 7c7:	e9 3a 01             	jmp    0x904
 7ca:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 7ce:	30 e4                	xor    %ah,%ah
 7d0:	03 46 06             	add    0x6(%bp),%ax
 7d3:	89 40 c3             	mov    %ax,-0x3d(%bx,%si)
 7d6:	8a 07                	mov    (%bx),%al
 7d8:	3c 2e                	cmp    $0x2e,%al
 7da:	75 5d                	jne    0x839
 7dc:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 7e0:	30 e4                	xor    %ah,%ah
 7e2:	40                   	inc    %ax
 7e3:	03 46 06             	add    0x6(%bp),%ax
 7e6:	89 c3                	mov    %ax,%bx
 7e8:	8a 07                	mov    (%bx),%al
 7ea:	3c 2e                	cmp    $0x2e,%al
 7ec:	75 4b                	jne    0x839
 7ee:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 7f2:	30 e4                	xor    %ah,%ah
 7f4:	40                   	inc    %ax
 7f5:	40                   	inc    %ax
 7f6:	03 46 06             	add    0x6(%bp),%ax
 7f9:	89 c3                	mov    %ax,%bx
 7fb:	8a 07                	mov    (%bx),%al
 7fd:	3c 2f                	cmp    $0x2f,%al
 7ff:	75 38                	jne    0x839
 801:	8a 86 f8 fb          	mov    -0x408(%bp),%al
 805:	3c ff                	cmp    $0xff,%al
 807:	75 0a                	jne    0x813
 809:	b8 ff ff             	mov    $0xffff,%ax
 80c:	8d 66 fc             	lea    -0x4(%bp),%sp
 80f:	5e                   	pop    %si
 810:	5f                   	pop    %di
 811:	5d                   	pop    %bp
 812:	c3                   	ret    
 813:	8a 86 40 f8          	mov    -0x7c0(%bp),%al
 817:	fb                   	sti    
 818:	30 e4                	xor    %ah,%ah
 81a:	b1 04                	mov    $0x4,%cl
 81c:	d3 e0                	shl    %cl,%ax
 81e:	89 eb                	mov    %bp,%bx
 820:	01 c3                	add    %ax,%bx
 822:	8a 87 fa fb          	mov    -0x406(%bx),%al
 826:	88 86 f8 fb          	mov    %al,-0x408(%bp)
 82a:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 82e:	30 e4                	xor    %ah,%ah
 830:	05 03 00             	add    $0x3,%ax
 833:	88 86 f7 fb          	mov    %al,-0x409(%bp)
 837:	e9 cc 00             	jmp    0x906
 83a:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 83e:	30 e4                	xor    %ah,%ah
 840:	b1 04                	mov    $0x4,%cl
 842:	d3 e0                	shl    %cl,%ax
 844:	89 eb                	mov    %bp,%bx
 846:	01 c3                	add    %ax,%bx
 848:	8a 86 f8 fb          	mov    -0x408(%bp),%al
 84c:	3a 87 fa fb          	cmp    -0x406(%bx),%al
 850:	74 0c                	je     0x85e
 852:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 856:	40                   	inc    %ax
 857:	40                   	inc    %ax
 858:	88 86 f9 fb          	mov    %al,-0x407(%bp)
 85c:	e9 95 00             	jmp    0x8f4
 85f:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 863:	30 e4                	xor    %ah,%ah
 865:	b1 04                	mov    $0x4,%cl
 867:	d3 e0                	shl    %cl,%ax
 869:	40                   	inc    %ax
 86a:	40                   	inc    %ax
 86b:	89 eb                	mov    %bp,%bx
 86d:	01 c3                	add    %ax,%bx
 86f:	8a 87 fa fb          	mov    -0x406(%bx),%al
 873:	84 c0                	test   %al,%al
 875:	75 0b                	jne    0x882
 877:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 87b:	40                   	inc    %ax
 87c:	88 86 f9 fb          	mov    %al,-0x407(%bp)
 880:	eb 72                	jmp    0x8f4
 882:	b8 0e 00             	mov    $0xe,%ax
 885:	50                   	push   %ax
 886:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 88a:	30 e4                	xor    %ah,%ah
 88c:	b1 04                	mov    $0x4,%cl
 88e:	d3 e0                	shl    %cl,%ax
 890:	89 eb                	mov    %bp,%bx
 892:	01 c3                	add    %ax,%bx
 894:	81 c3 fc 40          	add    $0x40fc,%bx
 898:	fb                   	sti    
 899:	53                   	push   %bx
 89a:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 89e:	30 e4                	xor    %ah,%ah
 8a0:	03 46 06             	add    0x6(%bp),%ax
 8a3:	50                   	push   %ax
 8a4:	e8 fb fd             	call   0x6a2
 8a7:	83 c4 06             	add    $0x6,%sp
 8aa:	84 c0                	test   %al,%al
 8ac:	74 3e                	je     0x8ec
 8ae:	b8 0e 00             	mov    $0xe,%ax
 8b1:	50                   	push   %ax
 8b2:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 8b6:	30 e4                	xor    %ah,%ah
 8b8:	b1 04                	mov    $0x4,%cl
 8ba:	d3 e0                	shl    %cl,%ax
 8bc:	89 eb                	mov    %bp,%bx
 8be:	01 c3                	add    %ax,%bx
 8c0:	81 c3 fc fb          	add    $0xfbfc,%bx
 8c4:	53                   	push   %bx
 8c5:	e8 a6 fd             	call   0x66e
 8c8:	83 c4 04             	add    $0x4,%sp
 8cb:	02 86 f7 fb          	add    -0x409(%bp),%al
 8cf:	80 d4 00             	adc    $0x0,%ah
 8d2:	88 86 f7 fb          	mov    %al,-0x409(%bp)
 8d6:	b0 01                	mov    $0x1,%al
 8d8:	40                   	inc    %ax
 8d9:	88 86 f6 fb          	mov    %al,-0x40a(%bp)
 8dd:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 8e1:	88 86 f8 fb          	mov    %al,-0x408(%bp)
 8e5:	30 c0                	xor    %al,%al
 8e7:	88 86 f9 fb          	mov    %al,-0x407(%bp)
 8eb:	eb 09                	jmp    0x8f6
 8ed:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 8f1:	40                   	inc    %ax
 8f2:	88 86 f9 fb          	mov    %al,-0x407(%bp)
 8f6:	8a 86 f9 fb          	mov    -0x407(%bp),%al
 8fa:	3a 46 fa             	cmp    -0x6(%bp),%al
 8fd:	72 0a                	jb     0x909
 8ff:	b8 ff ff             	mov    $0xffff,%ax
 902:	8d 66 fc             	lea    -0x4(%bp),%sp
 905:	5e                   	pop    %si
 906:	5f                   	pop    %di
 907:	5d                   	pop    %bp
 908:	c3                   	ret    
 909:	8a 86 f7 fb          	mov    -0x409(%bp),%al
 90d:	30 e4                	xor    %ah,%ah
 90f:	03 46 06             	add    0x6(%bp),%ax
 912:	89 c3                	mov    %ax,%bx
 914:	8a 07                	mov    (%bx),%al
 916:	84 c0                	test   %al,%al
 918:	74 75                	je     0x98f
 91a:	03 e9                	add    %cx,%bp
 91c:	7d fe                	jge    0x91c
 91e:	8a 86 f8 fb          	mov    -0x408(%bp),%al
 922:	30 e4                	xor    %ah,%ah
 924:	8d 66 fc             	lea    -0x4(%bp),%sp
 927:	5e                   	pop    %si
 928:	5f                   	pop    %di
 929:	5d                   	pop    %bp
 92a:	c3                   	ret    
 92b:	55                   	push   %bp
 92c:	89 e5                	mov    %sp,%bp
 92e:	57                   	push   %di
 92f:	56                   	push   %si
 930:	81 c4 fe fb          	add    $0xfbfe,%sp
 934:	30 c0                	xor    %al,%al
 936:	88 86 fa fb          	mov    %al,-0x406(%bp)
 93a:	31 c0                	xor    %ax,%ax
 93c:	50                   	push   %ax
 93d:	b8 01 01             	mov    $0x101,%ax
 940:	50                   	push   %ax
 941:	8d 9e fc fb          	lea    -0x404(%bp),%bx
 945:	53                   	push   %bx
 946:	b8 02 00             	mov    $0x2,%ax
 949:	50                   	push   %ax
 94a:	b8 21 00             	mov    $0x21,%ax
 94d:	50                   	push   %ax
 94e:	e8 e0 09             	call   0x1331
 951:	58                   	pop    %ax
 952:	83 c4 0a             	add    $0xa,%sp
 955:	31 c0                	xor    %ax,%ax
 957:	50                   	push   %ax
 958:	b8 02 01             	mov    $0x102,%ax
 95b:	50                   	push   %ax
 95c:	8d 9e fc fd          	lea    -0x204(%bp),%bx
 960:	53                   	push   %bx
 961:	b8 02 00             	mov    $0x2,%ax
 964:	50                   	push   %ax
 965:	b8 21 00             	mov    $0x21,%ax
 968:	50                   	push   %ax
 969:	e8 e0 09             	call   0x134c
 96c:	40                   	inc    %ax
 96d:	83 c4 0a             	add    $0xa,%sp
 970:	30 c0                	xor    %al,%al
 972:	88 86 fb fb          	mov    %al,-0x405(%bp)
 976:	eb 3a                	jmp    0x9b2
 978:	8a 86 fb fb          	mov    -0x405(%bp),%al
 97c:	30 e4                	xor    %ah,%ah
 97e:	b1 04                	mov    $0x4,%cl
 980:	d3 e0                	shl    %cl,%ax
 982:	89 eb                	mov    %bp,%bx
 984:	01 c3                	add    %ax,%bx
 986:	8a 87 fc fb          	mov    -0x404(%bx),%al
 98a:	3a 46 04             	cmp    0x4(%bp),%al
 98d:	75 1a                	jne    0x9a9
 98f:	8a 86 fa fb          	mov    -0x406(%bp),%al
 993:	30 e4                	xor    %ah,%ah
 995:	03 46 06             	add    0x6(%bp),%ax
 998:	89 c3                	mov    %ax,%bx
 99a:	8a 86 fb fb          	mov    -0x405(%bp),%al
 99e:	88 07                	mov    %al,(%bx)
 9a0:	8a 86 fa fb          	mov    -0x406(%bp),%al
 9a4:	40                   	inc    %ax
 9a5:	88 86 fa fb          	mov    %al,-0x406(%bp)
 9a9:	8a 86 fb fb          	mov    -0x405(%bp),%al
 9ad:	40                   	inc    %ax
 9ae:	40                   	inc    %ax
 9af:	88 86 fb fb          	mov    %al,-0x405(%bp)
 9b3:	8a 86 fb fb          	mov    -0x405(%bp),%al
 9b7:	3c 40                	cmp    $0x40,%al
 9b9:	72 be                	jb     0x979
 9bb:	8a 86 fa fb          	mov    -0x406(%bp),%al
 9bf:	30 e4                	xor    %ah,%ah
 9c1:	03 46 06             	add    0x6(%bp),%ax
 9c4:	89 c3                	mov    %ax,%bx
 9c6:	b0 ff                	mov    $0xff,%al
 9c8:	88 07                	mov    %al,(%bx)
 9ca:	8d 66 fc             	lea    -0x4(%bp),%sp
 9cd:	5e                   	pop    %si
 9ce:	5f                   	pop    %di
 9cf:	5d                   	pop    %bp
 9d0:	c3                   	ret    
 9d1:	55                   	push   %bp
 9d2:	89 e5                	mov    %sp,%bp
 9d4:	57                   	push   %di
 9d5:	56                   	push   %si
 9d6:	4c                   	dec    %sp
 9d7:	4c                   	dec    %sp
 9d8:	8b 46 04             	mov    0x4(%bp),%ax
 9db:	89 46 fa             	mov    %ax,-0x6(%bp)
 9de:	83 c4 fc             	add    $0xfffc,%sp
 9e1:	b8 01 00             	mov    $0x1,%ax
 9e4:	89 46 f6             	mov    %ax,-0xa(%bp)
 9e7:	83 c4 fa             	add    $0xfffa,%sp
 9ea:	30 c0                	xor    %al,%al
 9ec:	88 46 49             	mov    %al,0x49(%bp)
 9ef:	f0 8b 46 04          	lock mov 0x4(%bp),%ax
 9f3:	85 c0                	test   %ax,%ax
 9f5:	75 10                	jne    0xa07
 9f7:	bb 83 02             	mov    $0x283,%bx
 9fa:	00 40 53             	add    %al,0x53(%bx,%si)
 9fd:	e8 6e fa             	call   0x46e
 a00:	44                   	inc    %sp
 a01:	44                   	inc    %sp
 a02:	83 c4 0c             	add    $0xc,%sp
 a05:	5e                   	pop    %si
 a06:	5f                   	pop    %di
 a07:	5d                   	pop    %bp
 a08:	c3                   	ret    
 a09:	8b 46 fa             	mov    -0x6(%bp),%ax
 a0c:	85 c0                	test   %ax,%ax
 a0e:	7d 0d                	jge    0xa1d
 a10:	b0 01                	mov    $0x1,%al
 a12:	88 46 f0             	mov    %al,-0x10(%bp)
 a15:	31 c0                	xor    %ax,%ax
 a17:	2b 46 fa             	sub    -0x6(%bp),%ax
 a1a:	89 46 fa             	mov    %ax,-0x6(%bp)
 a1d:	eb 17                	jmp    0xa36
 a1f:	b8 0a 00             	mov    $0xa,%ax
 a22:	50                   	push   %ax
 a23:	ff 76 fa             	pushw  -0x6(%bp)
 a26:	e8 9d 00             	call   0xac6
 a29:	83 c4 04             	add    $0x4,%sp
 a2c:	89 46 fa             	mov    %ax,-0x6(%bp)
 a2f:	8b 46 f6             	mov    -0xa(%bp),%ax
 a32:	40                   	inc    %ax
 a33:	89 46 f6             	mov    %ax,-0xa(%bp)
 a36:	8b 46 fa             	mov    -0x6(%bp),%ax
 a39:	3d 0a 00             	cmp    $0xa,%ax
 a3c:	40                   	inc    %ax
 a3d:	7f e1                	jg     0xa20
 a3f:	8b 46 04             	mov    0x4(%bp),%ax
 a42:	89 46 fa             	mov    %ax,-0x6(%bp)
 a45:	8a 46 f0             	mov    -0x10(%bp),%al
 a48:	84 c0                	test   %al,%al
 a4a:	74 08                	je     0xa54
 a4c:	31 c0                	xor    %ax,%ax
 a4e:	2b 46 fa             	sub    -0x6(%bp),%ax
 a51:	89 46 fa             	mov    %ax,-0x6(%bp)
 a54:	8b 46 f6             	mov    -0xa(%bp),%ax
 a57:	48                   	dec    %ax
 a58:	89 46 f8             	mov    %ax,-0x8(%bp)
 a5b:	eb 37                	jmp    0xa94
 a5d:	b8 0a 00             	mov    $0xa,%ax
 a60:	50                   	push   %ax
 a61:	ff 76 fa             	pushw  -0x6(%bp)
 a64:	e8 8f 00             	call   0xaf6
 a67:	83 c4 04             	add    $0x4,%sp
 a6a:	05 30 00             	add    $0x30,%ax
 a6d:	50                   	push   %ax
 a6e:	8b 46 f8             	mov    -0x8(%bp),%ax
 a71:	89 eb                	mov    %bp,%bx
 a73:	01 c3                	add    %ax,%bx
 a75:	8b 46 ee             	mov    -0x12(%bp),%ax
 a78:	88 47 f1             	mov    %al,-0xf(%bx)
 a7b:	44                   	inc    %sp
 a7c:	44                   	inc    %sp
 a7d:	72 b8                	jb     0xa37
 a7f:	0a 00                	or     (%bx,%si),%al
 a81:	50                   	push   %ax
 a82:	ff 76 fa             	pushw  -0x6(%bp)
 a85:	e8 40 00             	call   0xac8
 a88:	83 c4 04             	add    $0x4,%sp
 a8b:	89 46 fa             	mov    %ax,-0x6(%bp)
 a8e:	8b 46 f8             	mov    -0x8(%bp),%ax
 a91:	48                   	dec    %ax
 a92:	89 46 f8             	mov    %ax,-0x8(%bp)
 a95:	8b 46 f8             	mov    -0x8(%bp),%ax
 a98:	85 c0                	test   %ax,%ax
 a9a:	7d c2                	jge    0xa5e
 a9c:	8b 46 f6             	mov    -0xa(%bp),%ax
 a9f:	89 eb                	mov    %bp,%bx
 aa1:	01 c3                	add    %ax,%bx
 aa3:	30 c0                	xor    %al,%al
 aa5:	88 47 f1             	mov    %al,-0xf(%bx)
 aa8:	8a 46 f0             	mov    -0x10(%bp),%al
 aab:	84 c0                	test   %al,%al
 aad:	74 09                	je     0xab8
 aaf:	bb 83 00             	mov    $0x83,%bx
 ab2:	00 40 53             	add    %al,0x53(%bx,%si)
 ab5:	e8 ba f9             	call   0x472
 ab8:	44                   	inc    %sp
 ab9:	44                   	inc    %sp
 aba:	8d 5e f1             	lea    -0xf(%bp),%bx
 abd:	53                   	push   %bx
 abe:	e8 b1 f9             	call   0x472
 ac1:	44                   	inc    %sp
 ac2:	44                   	inc    %sp
 ac3:	83 c4 0c             	add    $0xc,%sp
 ac6:	5e                   	pop    %si
 ac7:	5f                   	pop    %di
 ac8:	5d                   	pop    %bp
 ac9:	c3                   	ret    
 aca:	55                   	push   %bp
 acb:	89 e5                	mov    %sp,%bp
 acd:	57                   	push   %di
 ace:	56                   	push   %si
 acf:	4c                   	dec    %sp
 ad0:	4c                   	dec    %sp
 ad1:	31 c0                	xor    %ax,%ax
 ad3:	89 46 fa             	mov    %ax,-0x6(%bp)
 ad6:	eb 10                	jmp    0xae8
 ad8:	8b 46 04             	mov    0x4(%bp),%ax
 adb:	2b 46 06             	sub    0x6(%bp),%ax
 ade:	89 46 04             	mov    %ax,0x4(%bp)
 ae1:	8b 46 fa             	mov    -0x6(%bp),%ax
 ae4:	40                   	inc    %ax
 ae5:	89 46 fa             	mov    %ax,-0x6(%bp)
 ae8:	8b 46 04             	mov    0x4(%bp),%ax
 aeb:	3b 46 06             	cmp    0x6(%bp),%ax
 aee:	7d e8                	jge    0xad8
 af0:	8b 46 fa             	mov    -0x6(%bp),%ax
 af3:	44                   	inc    %sp
 af4:	40                   	inc    %ax
 af5:	44                   	inc    %sp
 af6:	5e                   	pop    %si
 af7:	5f                   	pop    %di
 af8:	5d                   	pop    %bp
 af9:	c3                   	ret    
 afa:	55                   	push   %bp
 afb:	89 e5                	mov    %sp,%bp
 afd:	57                   	push   %di
 afe:	56                   	push   %si
 aff:	eb 09                	jmp    0xb0a
 b01:	8b 46 04             	mov    0x4(%bp),%ax
 b04:	2b 46 06             	sub    0x6(%bp),%ax
 b07:	89 46 04             	mov    %ax,0x4(%bp)
 b0a:	8b 46 04             	mov    0x4(%bp),%ax
 b0d:	3b 46 06             	cmp    0x6(%bp),%ax
 b10:	7d ef                	jge    0xb01
 b12:	8b 46 04             	mov    0x4(%bp),%ax
 b15:	5e                   	pop    %si
 b16:	5f                   	pop    %di
 b17:	5d                   	pop    %bp
 b18:	c3                   	ret    
 b19:	55                   	push   %bp
 b1a:	89 e5                	mov    %sp,%bp
 b1c:	57                   	push   %di
 b1d:	56                   	push   %si
 b1e:	4c                   	dec    %sp
 b1f:	4c                   	dec    %sp
 b20:	31 c0                	xor    %ax,%ax
 b22:	89 46 fa             	mov    %ax,-0x6(%bp)
 b25:	eb 13                	jmp    0xb3a
 b27:	8b 46 fa             	mov    -0x6(%bp),%ax
 b2a:	03 46 04             	add    0x4(%bp),%ax
 b2d:	89 c3                	mov    %ax,%bx
 b2f:	30 c0                	xor    %al,%al
 b31:	88 07                	mov    %al,(%bx)
 b33:	8b 46 53             	mov    0x53(%bp),%ax
 b36:	fa                   	cli    
 b37:	40                   	inc    %ax
 b38:	89 46 fa             	mov    %ax,-0x6(%bp)
 b3b:	8b 46 fa             	mov    -0x6(%bp),%ax
 b3e:	3b 46 06             	cmp    0x6(%bp),%ax
 b41:	7c e5                	jl     0xb28
 b43:	44                   	inc    %sp
 b44:	44                   	inc    %sp
 b45:	5e                   	pop    %si
 b46:	5f                   	pop    %di
 b47:	5d                   	pop    %bp
 b48:	c3                   	ret    
 b49:	23 40 2d             	and    0x2d(%bx,%si),%ax
 b4c:	00 30                	add    %dh,(%bx,%si)
 b4e:	00 24                	add    %ah,(%si)
 b50:	20 00                	and    %al,(%bx,%si)
 b52:	7e 2f                	jle    0xb83
 b54:	00 49 6e             	add    %cl,0x6e(%bx,%di)
 b57:	76 61                	jbe    0xbba
 b59:	6c                   	insb   (%dx),%es:(%di)
 b5a:	69 64 20 63 6f       	imul   $0x6f63,0x20(%si),%sp
 b5f:	6d                   	insw   (%dx),%es:(%di)
 b60:	6d                   	insw   (%dx),%es:(%di)
 b61:	61                   	popa   
 b62:	6e                   	outsb  %ds:(%si),(%dx)
 b63:	64 0a 0d             	or     %fs:(%di),%cl
 b66:	00 4e 6f             	add    %cl,0x6f(%bp)
 b69:	20 73 75             	and    %dh,0x75(%bp,%di)
 b6c:	63 68 20             	arpl   %bp,0x20(%bx,%si)
 b6f:	66 69 6c 65 0a 0d 00 	imul   $0x55000d0a,0x65(%si),%ebp
 b76:	55 
 b77:	73 61                	jae    0xbda
 b79:	67 65 3a 20          	cmp    %gs:(%eax),%ah
 b7d:	65 78 70             	gs js  0xbf0
 b80:	6f                   	outsw  %ds:(%si),(%dx)
 b81:	72 74                	jb     0xbf7
 b83:	20 24                	and    %ah,(%si)
 b85:	50                   	push   %ax
 b86:	41                   	inc    %cx
 b87:	54                   	push   %sp
 b88:	48                   	dec    %ax
 b89:	20 3c                	and    %bh,(%si)
 b8b:	40                   	inc    %ax
 b8c:	66 6f                	outsl  %ds:(%si),(%dx)
 b8e:	6c                   	insb   (%dx),%es:(%di)
 b8f:	64 65 72 20          	fs gs jb 0xbb3
 b93:	70 61                	jo     0xbf6
 b95:	74 68                	je     0xbff
 b97:	3e 0a 0d             	or     %ds:(%di),%cl
 b9a:	00 4e 6f             	add    %cl,0x6f(%bp)
 b9d:	20 73 75             	and    %dh,0x75(%bp,%di)
 ba0:	63 68 20             	arpl   %bp,0x20(%bx,%si)
 ba3:	66 69 6c 65 20 6f 72 	imul   $0x20726f20,0x65(%si),%ebp
 baa:	20 
 bab:	64 69 72 65 63 74    	imul   $0x7463,%fs:0x65(%bp,%si),%si
 bb1:	6f                   	outsw  %ds:(%si),(%dx)
 bb2:	72 79                	jb     0xc2d
 bb4:	0a 0d                	or     (%di),%cl
 bb6:	00 24                	add    %ah,(%si)
 bb8:	50                   	push   %ax
 bb9:	41                   	inc    %cx
 bba:	54                   	push   %sp
 bbb:	48                   	dec    %ax
 bbc:	20 00                	and    %al,(%bx,%si)
 bbe:	65 78 70             	gs js  0xc31
 bc1:	6f                   	outsw  %ds:(%si),(%dx)
 bc2:	72 74                	jb     0xc38
 bc4:	20 00                	and    %al,(%bx,%si)
 bc6:	4e                   	dec    %si
 bc7:	6f                   	outsw  %ds:(%si),(%dx)
 bc8:	20 73 75             	and    %dh,0x75(%bp,%di)
 bcb:	63 5a 68             	arpl   %bx,0x68(%bp,%si)
 bce:	20 66 69             	and    %ah,0x69(%bp)
 bd1:	6c                   	insb   (%dx),%es:(%di)
 bd2:	65 20 6f 72          	and    %ch,%gs:0x72(%bx)
 bd6:	20 64 69             	and    %ah,0x69(%si)
 bd9:	72 65                	jb     0xc40
 bdb:	63 74 6f             	arpl   %si,0x6f(%si)
 bde:	72 79                	jb     0xc59
 be0:	0a 0d                	or     (%di),%cl
 be2:	00 63 64             	add    %ah,0x64(%bp,%di)
 be5:	20 00                	and    %al,(%bx,%si)
	...
