
hello:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	55                   	push   %bp
   1:	89 e5                	mov    %sp,%bp
   3:	57                   	push   %di
   4:	56                   	push   %si
   5:	31 c0                	xor    %ax,%ax
   7:	50                   	push   %ax
   8:	31 c0                	xor    %ax,%ax
   a:	50                   	push   %ax
   b:	bb 54 00             	mov    $0x54,%bx
   e:	53                   	push   %bx
   f:	31 c0                	xor    %ax,%ax
  11:	50                   	push   %ax
  12:	b8 21 00             	mov    $0x21,%ax
  15:	50                   	push   %ax
  16:	e8 0f 00             	call   0x28
  19:	83 c4 0a             	add    $0xa,%sp
  1c:	e8 2d 00             	call   0x4c
  1f:	31 c0                	xor    %ax,%ax
  21:	5e                   	pop    %si
  22:	5f                   	pop    %di
  23:	5d                   	pop    %bp
  24:	c3                   	ret    
  25:	00 00                	add    %al,(%bx,%si)
  27:	00 55 89             	add    %dl,-0x77(%di)
  2a:	e5 8b                	in     $0x8b,%ax
  2c:	46                   	inc    %si
  2d:	04 1e                	add    $0x1e,%al
  2f:	8c cb                	mov    %cs,%bx
  31:	8e db                	mov    %bx,%ds
  33:	be 46 00             	mov    $0x46,%si
  36:	88 44 01             	mov    %al,0x1(%si)
  39:	1f                   	pop    %ds
  3a:	8b 46 06             	mov    0x6(%bp),%ax
  3d:	8b 5e 08             	mov    0x8(%bp),%bx
  40:	8b 4e 0a             	mov    0xa(%bp),%cx
  43:	8b 56 0c             	mov    0xc(%bp),%dx
  46:	cd 00                	int    $0x0
  48:	b4 00                	mov    $0x0,%ah
  4a:	5d                   	pop    %bp
  4b:	c3                   	ret    
  4c:	89 ec                	mov    %bp,%sp
  4e:	5d                   	pop    %bp
  4f:	59                   	pop    %cx
  50:	cb                   	lret   
  51:	00 00                	add    %al,(%bx,%si)
  53:	00 48 65             	add    %cl,0x65(%bx,%si)
  56:	6c                   	insb   (%dx),%es:(%di)
  57:	6c                   	insb   (%dx),%es:(%di)
  58:	6f                   	outsw  %ds:(%si),(%dx)
  59:	20 57 6f             	and    %dl,0x6f(%bx)
  5c:	72 6c                	jb     0xca
  5e:	64 0d 0a 00          	fs or  $0xa,%ax
	...

hello:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	55                   	push   %bp
   1:	89 e5                	mov    %sp,%bp
   3:	57                   	push   %di
   4:	56                   	push   %si
   5:	31 c0                	xor    %ax,%ax
   7:	50                   	push   %ax
   8:	31 c0                	xor    %ax,%ax
   a:	50                   	push   %ax
   b:	bb 50 00             	mov    $0x50,%bx
   e:	53                   	push   %bx
   f:	31 c0                	xor    %ax,%ax
  11:	50                   	push   %ax
  12:	b8 21 00             	mov    $0x21,%ax
  15:	50                   	push   %ax
  16:	e8 0f 00             	call   0x28
  19:	83 c4 0a             	add    $0xa,%sp
  1c:	e8 2d 00             	call   0x4c
  1f:	31 c0                	xor    %ax,%ax
  21:	5e                   	pop    %si
  22:	5f                   	pop    %di
  23:	5d                   	pop    %bp
  24:	c3                   	ret    
  25:	00 00                	add    %al,(%bx,%si)
  27:	00 55 89             	add    %dl,-0x77(%di)
  2a:	e5 8b                	in     $0x8b,%ax
  2c:	46                   	inc    %si
  2d:	04 1e                	add    $0x1e,%al
  2f:	8c cb                	mov    %cs,%bx
  31:	8e db                	mov    %bx,%ds
  33:	be 46 00             	mov    $0x46,%si
  36:	88 44 01             	mov    %al,0x1(%si)
  39:	1f                   	pop    %ds
  3a:	8b 46 06             	mov    0x6(%bp),%ax
  3d:	8b 5e 08             	mov    0x8(%bp),%bx
  40:	8b 4e 0a             	mov    0xa(%bp),%cx
  43:	8b 56 0c             	mov    0xc(%bp),%dx
  46:	cd 00                	int    $0x0
  48:	b4 00                	mov    $0x0,%ah
  4a:	5d                   	pop    %bp
  4b:	c3                   	ret    
  4c:	89 ec                	mov    %bp,%sp
  4e:	5d                   	pop    %bp
  4f:	cb                   	lret   
  50:	48                   	dec    %ax
  51:	65 6c                	gs insb (%dx),%es:(%di)
  53:	6c                   	insb   (%dx),%es:(%di)
  54:	6f                   	outsw  %ds:(%si),(%dx)
  55:	20 57 6f             	and    %dl,0x6f(%bx)
  58:	72 6c                	jb     0xc6
  5a:	64 0d 0a 00          	fs or  $0xa,%ax
	...
