
_picviewer:     file format elf32-i386


Disassembly of section .text:

00000000 <compressPic>:

PICNODE pic;
int isRun = 1;

// 压缩图片
void compressPic(int width, int height) {
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	81 ec 88 00 00 00    	sub    $0x88,%esp
    int x0, y0, x1, x2, y1, y2;
    float fx1, fx2, fy1, fy2;
    int x, y, index;
    RGBQUAD* data;

    w0 = pic.width;
       9:	a1 64 c8 00 00       	mov    0xc864,%eax
       e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    h0 = pic.height;
      11:	a1 68 c8 00 00       	mov    0xc868,%eax
      16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    w1 = width;
      19:	8b 45 08             	mov    0x8(%ebp),%eax
      1c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    h1 = height;
      1f:	8b 45 0c             	mov    0xc(%ebp),%eax
      22:	89 45 dc             	mov    %eax,-0x24(%ebp)

    fw = w0 * 1.0 / w1;
      25:	db 45 e8             	fildl  -0x18(%ebp)
      28:	db 45 e0             	fildl  -0x20(%ebp)
      2b:	de f9                	fdivrp %st,%st(1)
      2d:	d9 5d d8             	fstps  -0x28(%ebp)
    fh = h0 * 1.0 / h1;
      30:	db 45 e4             	fildl  -0x1c(%ebp)
      33:	db 45 dc             	fildl  -0x24(%ebp)
      36:	de f9                	fdivrp %st,%st(1)
      38:	d9 5d d4             	fstps  -0x2c(%ebp)

    index = 0;
      3b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    data = (RGBQUAD*)malloc(w1*h1*sizeof(RGBQUAD));
      42:	8b 45 e0             	mov    -0x20(%ebp),%eax
      45:	0f af 45 dc          	imul   -0x24(%ebp),%eax
      49:	c1 e0 02             	shl    $0x2,%eax
      4c:	83 ec 0c             	sub    $0xc,%esp
      4f:	50                   	push   %eax
      50:	e8 26 28 00 00       	call   287b <malloc>
      55:	83 c4 10             	add    $0x10,%esp
      58:	89 45 d0             	mov    %eax,-0x30(%ebp)
    memset(data, 0, (uint)w1*h1*sizeof(RGBQUAD));
      5b:	8b 55 e0             	mov    -0x20(%ebp),%edx
      5e:	8b 45 dc             	mov    -0x24(%ebp),%eax
      61:	0f af c2             	imul   %edx,%eax
      64:	c1 e0 02             	shl    $0x2,%eax
      67:	83 ec 04             	sub    $0x4,%esp
      6a:	50                   	push   %eax
      6b:	6a 00                	push   $0x0
      6d:	ff 75 d0             	pushl  -0x30(%ebp)
      70:	e8 ab 21 00 00       	call   2220 <memset>
      75:	83 c4 10             	add    $0x10,%esp
    for (y = 0; y < h1; ++y) {
      78:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      7f:	e9 c7 02 00 00       	jmp    34b <compressPic+0x34b>
        y0 = y*fh;
      84:	db 45 f0             	fildl  -0x10(%ebp)
      87:	d8 4d d4             	fmuls  -0x2c(%ebp)
      8a:	d9 7d 86             	fnstcw -0x7a(%ebp)
      8d:	0f b7 45 86          	movzwl -0x7a(%ebp),%eax
      91:	80 cc 0c             	or     $0xc,%ah
      94:	66 89 45 84          	mov    %ax,-0x7c(%ebp)
      98:	d9 6d 84             	fldcw  -0x7c(%ebp)
      9b:	db 5d cc             	fistpl -0x34(%ebp)
      9e:	d9 6d 86             	fldcw  -0x7a(%ebp)
        y1 = (int)y0;
      a1:	8b 45 cc             	mov    -0x34(%ebp),%eax
      a4:	89 45 c8             	mov    %eax,-0x38(%ebp)
        y2 = (y1 == h0-1) ? y1 : y1 + 1;
      a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      aa:	83 e8 01             	sub    $0x1,%eax
      ad:	39 45 c8             	cmp    %eax,-0x38(%ebp)
      b0:	74 08                	je     ba <compressPic+0xba>
      b2:	8b 45 c8             	mov    -0x38(%ebp),%eax
      b5:	83 c0 01             	add    $0x1,%eax
      b8:	eb 03                	jmp    bd <compressPic+0xbd>
      ba:	8b 45 c8             	mov    -0x38(%ebp),%eax
      bd:	89 45 c4             	mov    %eax,-0x3c(%ebp)

        fy1 = y1-y0;
      c0:	8b 45 c8             	mov    -0x38(%ebp),%eax
      c3:	2b 45 cc             	sub    -0x34(%ebp),%eax
      c6:	89 45 80             	mov    %eax,-0x80(%ebp)
      c9:	db 45 80             	fildl  -0x80(%ebp)
      cc:	d9 5d c0             	fstps  -0x40(%ebp)
        fy2 = 1.0f-fy1;
      cf:	d9 e8                	fld1   
      d1:	d8 65 c0             	fsubs  -0x40(%ebp)
      d4:	d9 5d bc             	fstps  -0x44(%ebp)

        for (x = 0; x < w1; ++x) {
      d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      de:	e9 58 02 00 00       	jmp    33b <compressPic+0x33b>
            x0 = x*fw;
      e3:	db 45 f4             	fildl  -0xc(%ebp)
      e6:	d8 4d d8             	fmuls  -0x28(%ebp)
      e9:	d9 6d 84             	fldcw  -0x7c(%ebp)
      ec:	db 5d b8             	fistpl -0x48(%ebp)
      ef:	d9 6d 86             	fldcw  -0x7a(%ebp)
            x1 = (int)x0;
      f2:	8b 45 b8             	mov    -0x48(%ebp),%eax
      f5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            x2 = (x1 == w0-1) ? x1 : x1 + 1;
      f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
      fb:	83 e8 01             	sub    $0x1,%eax
      fe:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
     101:	74 08                	je     10b <compressPic+0x10b>
     103:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     106:	83 c0 01             	add    $0x1,%eax
     109:	eb 03                	jmp    10e <compressPic+0x10e>
     10b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     10e:	89 45 b0             	mov    %eax,-0x50(%ebp)

            fx1 = y1-y0;
     111:	8b 45 c8             	mov    -0x38(%ebp),%eax
     114:	2b 45 cc             	sub    -0x34(%ebp),%eax
     117:	89 45 80             	mov    %eax,-0x80(%ebp)
     11a:	db 45 80             	fildl  -0x80(%ebp)
     11d:	d9 5d ac             	fstps  -0x54(%ebp)
            fx2 = 1.0f-fx1;
     120:	d9 e8                	fld1   
     122:	d8 65 ac             	fsubs  -0x54(%ebp)
     125:	d9 5d a8             	fstps  -0x58(%ebp)

            float s1 = fx1*fy1;
     128:	d9 45 ac             	flds   -0x54(%ebp)
     12b:	d8 4d c0             	fmuls  -0x40(%ebp)
     12e:	d9 5d a4             	fstps  -0x5c(%ebp)
            float s2 = fx2*fy1;
     131:	d9 45 a8             	flds   -0x58(%ebp)
     134:	d8 4d c0             	fmuls  -0x40(%ebp)
     137:	d9 5d a0             	fstps  -0x60(%ebp)
            float s3 = fx2*fy2;
     13a:	d9 45 a8             	flds   -0x58(%ebp)
     13d:	d8 4d bc             	fmuls  -0x44(%ebp)
     140:	d9 5d 9c             	fstps  -0x64(%ebp)
            float s4 = fx1*fy2;
     143:	d9 45 ac             	flds   -0x54(%ebp)
     146:	d8 4d bc             	fmuls  -0x44(%ebp)
     149:	d9 5d 98             	fstps  -0x68(%ebp)

            RGBQUAD p1, p2, p3, p4;
            p1 = pic.data[x1+y1*w0];
     14c:	8b 15 60 c8 00 00    	mov    0xc860,%edx
     152:	8b 45 c8             	mov    -0x38(%ebp),%eax
     155:	0f af 45 e8          	imul   -0x18(%ebp),%eax
     159:	89 c1                	mov    %eax,%ecx
     15b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     15e:	01 c8                	add    %ecx,%eax
     160:	c1 e0 02             	shl    $0x2,%eax
     163:	01 d0                	add    %edx,%eax
     165:	8b 00                	mov    (%eax),%eax
     167:	89 45 94             	mov    %eax,-0x6c(%ebp)
            p2 = pic.data[x2+y1*w0];
     16a:	8b 15 60 c8 00 00    	mov    0xc860,%edx
     170:	8b 45 c8             	mov    -0x38(%ebp),%eax
     173:	0f af 45 e8          	imul   -0x18(%ebp),%eax
     177:	89 c1                	mov    %eax,%ecx
     179:	8b 45 b0             	mov    -0x50(%ebp),%eax
     17c:	01 c8                	add    %ecx,%eax
     17e:	c1 e0 02             	shl    $0x2,%eax
     181:	01 d0                	add    %edx,%eax
     183:	8b 00                	mov    (%eax),%eax
     185:	89 45 90             	mov    %eax,-0x70(%ebp)
            p3 = pic.data[x1+y2*w0];
     188:	8b 15 60 c8 00 00    	mov    0xc860,%edx
     18e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     191:	0f af 45 e8          	imul   -0x18(%ebp),%eax
     195:	89 c1                	mov    %eax,%ecx
     197:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     19a:	01 c8                	add    %ecx,%eax
     19c:	c1 e0 02             	shl    $0x2,%eax
     19f:	01 d0                	add    %edx,%eax
     1a1:	8b 00                	mov    (%eax),%eax
     1a3:	89 45 8c             	mov    %eax,-0x74(%ebp)
            p4 = pic.data[x2+y2*w0];
     1a6:	8b 15 60 c8 00 00    	mov    0xc860,%edx
     1ac:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     1af:	0f af 45 e8          	imul   -0x18(%ebp),%eax
     1b3:	89 c1                	mov    %eax,%ecx
     1b5:	8b 45 b0             	mov    -0x50(%ebp),%eax
     1b8:	01 c8                	add    %ecx,%eax
     1ba:	c1 e0 02             	shl    $0x2,%eax
     1bd:	01 d0                	add    %edx,%eax
     1bf:	8b 00                	mov    (%eax),%eax
     1c1:	89 45 88             	mov    %eax,-0x78(%ebp)

            data[index].rgbRed = (BYTE)(p1.rgbRed*s3 + p2.rgbRed*s4 + p3.rgbRed*s2 + p4.rgbRed*s1);
     1c4:	0f b6 45 96          	movzbl -0x6a(%ebp),%eax
     1c8:	0f b6 c0             	movzbl %al,%eax
     1cb:	89 45 80             	mov    %eax,-0x80(%ebp)
     1ce:	db 45 80             	fildl  -0x80(%ebp)
     1d1:	d8 4d 9c             	fmuls  -0x64(%ebp)
     1d4:	0f b6 45 92          	movzbl -0x6e(%ebp),%eax
     1d8:	0f b6 c0             	movzbl %al,%eax
     1db:	89 45 80             	mov    %eax,-0x80(%ebp)
     1de:	db 45 80             	fildl  -0x80(%ebp)
     1e1:	d8 4d 98             	fmuls  -0x68(%ebp)
     1e4:	de c1                	faddp  %st,%st(1)
     1e6:	0f b6 45 8e          	movzbl -0x72(%ebp),%eax
     1ea:	0f b6 c0             	movzbl %al,%eax
     1ed:	89 45 80             	mov    %eax,-0x80(%ebp)
     1f0:	db 45 80             	fildl  -0x80(%ebp)
     1f3:	d8 4d a0             	fmuls  -0x60(%ebp)
     1f6:	de c1                	faddp  %st,%st(1)
     1f8:	0f b6 45 8a          	movzbl -0x76(%ebp),%eax
     1fc:	0f b6 c0             	movzbl %al,%eax
     1ff:	89 45 80             	mov    %eax,-0x80(%ebp)
     202:	db 45 80             	fildl  -0x80(%ebp)
     205:	d8 4d a4             	fmuls  -0x5c(%ebp)
     208:	de c1                	faddp  %st,%st(1)
     20a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     20d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     214:	8b 45 d0             	mov    -0x30(%ebp),%eax
     217:	01 d0                	add    %edx,%eax
     219:	d9 6d 84             	fldcw  -0x7c(%ebp)
     21c:	df 5d 80             	fistps -0x80(%ebp)
     21f:	d9 6d 86             	fldcw  -0x7a(%ebp)
     222:	0f b6 55 80          	movzbl -0x80(%ebp),%edx
     226:	88 50 02             	mov    %dl,0x2(%eax)
            data[index].rgbGreen = (BYTE)(p1.rgbGreen*s3 + p2.rgbGreen*s4 + p3.rgbGreen*s2 + p4.rgbGreen*s1);
     229:	0f b6 45 95          	movzbl -0x6b(%ebp),%eax
     22d:	0f b6 c0             	movzbl %al,%eax
     230:	89 45 80             	mov    %eax,-0x80(%ebp)
     233:	db 45 80             	fildl  -0x80(%ebp)
     236:	d8 4d 9c             	fmuls  -0x64(%ebp)
     239:	0f b6 45 91          	movzbl -0x6f(%ebp),%eax
     23d:	0f b6 c0             	movzbl %al,%eax
     240:	89 45 80             	mov    %eax,-0x80(%ebp)
     243:	db 45 80             	fildl  -0x80(%ebp)
     246:	d8 4d 98             	fmuls  -0x68(%ebp)
     249:	de c1                	faddp  %st,%st(1)
     24b:	0f b6 45 8d          	movzbl -0x73(%ebp),%eax
     24f:	0f b6 c0             	movzbl %al,%eax
     252:	89 45 80             	mov    %eax,-0x80(%ebp)
     255:	db 45 80             	fildl  -0x80(%ebp)
     258:	d8 4d a0             	fmuls  -0x60(%ebp)
     25b:	de c1                	faddp  %st,%st(1)
     25d:	0f b6 45 89          	movzbl -0x77(%ebp),%eax
     261:	0f b6 c0             	movzbl %al,%eax
     264:	89 45 80             	mov    %eax,-0x80(%ebp)
     267:	db 45 80             	fildl  -0x80(%ebp)
     26a:	d8 4d a4             	fmuls  -0x5c(%ebp)
     26d:	de c1                	faddp  %st,%st(1)
     26f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     272:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     279:	8b 45 d0             	mov    -0x30(%ebp),%eax
     27c:	01 d0                	add    %edx,%eax
     27e:	d9 6d 84             	fldcw  -0x7c(%ebp)
     281:	df 5d 80             	fistps -0x80(%ebp)
     284:	d9 6d 86             	fldcw  -0x7a(%ebp)
     287:	0f b6 55 80          	movzbl -0x80(%ebp),%edx
     28b:	88 50 01             	mov    %dl,0x1(%eax)
            data[index].rgbBlue = (BYTE)(p1.rgbBlue*s3 + p2.rgbBlue*s4 + p3.rgbBlue*s2 + p4.rgbBlue*s1);
     28e:	0f b6 45 94          	movzbl -0x6c(%ebp),%eax
     292:	0f b6 c0             	movzbl %al,%eax
     295:	89 45 80             	mov    %eax,-0x80(%ebp)
     298:	db 45 80             	fildl  -0x80(%ebp)
     29b:	d8 4d 9c             	fmuls  -0x64(%ebp)
     29e:	0f b6 45 90          	movzbl -0x70(%ebp),%eax
     2a2:	0f b6 c0             	movzbl %al,%eax
     2a5:	89 45 80             	mov    %eax,-0x80(%ebp)
     2a8:	db 45 80             	fildl  -0x80(%ebp)
     2ab:	d8 4d 98             	fmuls  -0x68(%ebp)
     2ae:	de c1                	faddp  %st,%st(1)
     2b0:	0f b6 45 8c          	movzbl -0x74(%ebp),%eax
     2b4:	0f b6 c0             	movzbl %al,%eax
     2b7:	89 45 80             	mov    %eax,-0x80(%ebp)
     2ba:	db 45 80             	fildl  -0x80(%ebp)
     2bd:	d8 4d a0             	fmuls  -0x60(%ebp)
     2c0:	de c1                	faddp  %st,%st(1)
     2c2:	0f b6 45 88          	movzbl -0x78(%ebp),%eax
     2c6:	0f b6 c0             	movzbl %al,%eax
     2c9:	89 45 80             	mov    %eax,-0x80(%ebp)
     2cc:	db 45 80             	fildl  -0x80(%ebp)
     2cf:	d8 4d a4             	fmuls  -0x5c(%ebp)
     2d2:	de c1                	faddp  %st,%st(1)
     2d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     2d7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     2de:	8b 45 d0             	mov    -0x30(%ebp),%eax
     2e1:	01 d0                	add    %edx,%eax
     2e3:	d9 6d 84             	fldcw  -0x7c(%ebp)
     2e6:	df 5d 80             	fistps -0x80(%ebp)
     2e9:	d9 6d 86             	fldcw  -0x7a(%ebp)
     2ec:	0f b6 55 80          	movzbl -0x80(%ebp),%edx
     2f0:	88 10                	mov    %dl,(%eax)

            data[index].rgbRed = p1.rgbRed;
     2f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     2f5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     2fc:	8b 45 d0             	mov    -0x30(%ebp),%eax
     2ff:	01 c2                	add    %eax,%edx
     301:	0f b6 45 96          	movzbl -0x6a(%ebp),%eax
     305:	88 42 02             	mov    %al,0x2(%edx)
            data[index].rgbGreen = p1.rgbGreen;
     308:	8b 45 ec             	mov    -0x14(%ebp),%eax
     30b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     312:	8b 45 d0             	mov    -0x30(%ebp),%eax
     315:	01 c2                	add    %eax,%edx
     317:	0f b6 45 95          	movzbl -0x6b(%ebp),%eax
     31b:	88 42 01             	mov    %al,0x1(%edx)
            data[index].rgbBlue = p1.rgbBlue;
     31e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     321:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     328:	8b 45 d0             	mov    -0x30(%ebp),%eax
     32b:	01 c2                	add    %eax,%edx
     32d:	0f b6 45 94          	movzbl -0x6c(%ebp),%eax
     331:	88 02                	mov    %al,(%edx)

            ++index;
     333:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        for (x = 0; x < w1; ++x) {
     337:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     33b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     33e:	3b 45 e0             	cmp    -0x20(%ebp),%eax
     341:	0f 8c 9c fd ff ff    	jl     e3 <compressPic+0xe3>
    for (y = 0; y < h1; ++y) {
     347:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     34b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     34e:	3b 45 dc             	cmp    -0x24(%ebp),%eax
     351:	0f 8c 2d fd ff ff    	jl     84 <compressPic+0x84>
        }
    }

    freepic(&pic);
     357:	83 ec 0c             	sub    $0xc,%esp
     35a:	68 60 c8 00 00       	push   $0xc860
     35f:	e8 1e 16 00 00       	call   1982 <freepic>
     364:	83 c4 10             	add    $0x10,%esp
    pic.data = data;
     367:	8b 45 d0             	mov    -0x30(%ebp),%eax
     36a:	a3 60 c8 00 00       	mov    %eax,0xc860
    pic.width = width;
     36f:	8b 45 08             	mov    0x8(%ebp),%eax
     372:	a3 64 c8 00 00       	mov    %eax,0xc864
    pic.height = height;
     377:	8b 45 0c             	mov    0xc(%ebp),%eax
     37a:	a3 68 c8 00 00       	mov    %eax,0xc868
}
     37f:	90                   	nop
     380:	c9                   	leave  
     381:	c3                   	ret    

00000382 <modifyPic>:

void modifyPic(Context context) {
     382:	55                   	push   %ebp
     383:	89 e5                	mov    %esp,%ebp
     385:	83 ec 38             	sub    $0x38,%esp
    int c_width, c_height;
    int pic_width, pic_height;

    c_width = context.width;
     388:	8b 45 0c             	mov    0xc(%ebp),%eax
     38b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    c_height = context.height;
     38e:	8b 45 10             	mov    0x10(%ebp),%eax
     391:	89 45 e8             	mov    %eax,-0x18(%ebp)
    pic_width = pic.width;
     394:	a1 64 c8 00 00       	mov    0xc864,%eax
     399:	89 45 f4             	mov    %eax,-0xc(%ebp)
    pic_height = pic.height;
     39c:	a1 68 c8 00 00       	mov    0xc868,%eax
     3a1:	89 45 f0             	mov    %eax,-0x10(%ebp)

    if (pic_width < c_width && pic_height < c_height) {
     3a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3a7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     3aa:	7d 0c                	jge    3b8 <modifyPic+0x36>
     3ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
     3af:	3b 45 e8             	cmp    -0x18(%ebp),%eax
     3b2:	0f 8c aa 00 00 00    	jl     462 <modifyPic+0xe0>
        return;
    }

    float scale_p, scale_c;
    scale_p = pic_width * 1.0 / pic_height;
     3b8:	db 45 f4             	fildl  -0xc(%ebp)
     3bb:	db 45 f0             	fildl  -0x10(%ebp)
     3be:	de f9                	fdivrp %st,%st(1)
     3c0:	d9 5d e4             	fstps  -0x1c(%ebp)
    scale_c = c_width * 1.0 / c_height;
     3c3:	db 45 ec             	fildl  -0x14(%ebp)
     3c6:	db 45 e8             	fildl  -0x18(%ebp)
     3c9:	de f9                	fdivrp %st,%st(1)
     3cb:	d9 5d e0             	fstps  -0x20(%ebp)

    if (scale_p <= scale_c) {
     3ce:	d9 45 e4             	flds   -0x1c(%ebp)
     3d1:	d9 45 e0             	flds   -0x20(%ebp)
     3d4:	df f1                	fcomip %st(1),%st
     3d6:	dd d8                	fstp   %st(0)
     3d8:	72 31                	jb     40b <modifyPic+0x89>
        pic_width = scale_p * (c_height-10);
     3da:	8b 45 e8             	mov    -0x18(%ebp),%eax
     3dd:	83 e8 0a             	sub    $0xa,%eax
     3e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     3e3:	db 45 d0             	fildl  -0x30(%ebp)
     3e6:	d8 4d e4             	fmuls  -0x1c(%ebp)
     3e9:	d9 7d d6             	fnstcw -0x2a(%ebp)
     3ec:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
     3f0:	80 cc 0c             	or     $0xc,%ah
     3f3:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
     3f7:	d9 6d d4             	fldcw  -0x2c(%ebp)
     3fa:	db 5d f4             	fistpl -0xc(%ebp)
     3fd:	d9 6d d6             	fldcw  -0x2a(%ebp)
        pic_height = c_height-10;
     400:	8b 45 e8             	mov    -0x18(%ebp),%eax
     403:	83 e8 0a             	sub    $0xa,%eax
     406:	89 45 f0             	mov    %eax,-0x10(%ebp)
     409:	eb 2f                	jmp    43a <modifyPic+0xb8>
    } else {
        pic_height = (c_width-5) / scale_p;
     40b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     40e:	83 e8 05             	sub    $0x5,%eax
     411:	89 45 d0             	mov    %eax,-0x30(%ebp)
     414:	db 45 d0             	fildl  -0x30(%ebp)
     417:	d8 75 e4             	fdivs  -0x1c(%ebp)
     41a:	d9 7d d6             	fnstcw -0x2a(%ebp)
     41d:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
     421:	80 cc 0c             	or     $0xc,%ah
     424:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
     428:	d9 6d d4             	fldcw  -0x2c(%ebp)
     42b:	db 5d f0             	fistpl -0x10(%ebp)
     42e:	d9 6d d6             	fldcw  -0x2a(%ebp)
        pic_width = c_width-5;
     431:	8b 45 ec             	mov    -0x14(%ebp),%eax
     434:	83 e8 05             	sub    $0x5,%eax
     437:	89 45 f4             	mov    %eax,-0xc(%ebp)
    }
    printf(0, "modifyPic: pic_width: %d, pic_height: %d\n", pic_width, pic_height);
     43a:	ff 75 f0             	pushl  -0x10(%ebp)
     43d:	ff 75 f4             	pushl  -0xc(%ebp)
     440:	68 20 89 00 00       	push   $0x8920
     445:	6a 00                	push   $0x0
     447:	e8 5b 21 00 00       	call   25a7 <printf>
     44c:	83 c4 10             	add    $0x10,%esp

    compressPic(pic_width, pic_height);
     44f:	83 ec 08             	sub    $0x8,%esp
     452:	ff 75 f0             	pushl  -0x10(%ebp)
     455:	ff 75 f4             	pushl  -0xc(%ebp)
     458:	e8 a3 fb ff ff       	call   0 <compressPic>
     45d:	83 c4 10             	add    $0x10,%esp
     460:	eb 01                	jmp    463 <modifyPic+0xe1>
        return;
     462:	90                   	nop
}
     463:	c9                   	leave  
     464:	c3                   	ret    

00000465 <drawPicViewerWnd>:

// 绘制窗口
void drawPicViewerWnd(Context context) {
     465:	55                   	push   %ebp
     466:	89 e5                	mov    %esp,%ebp
     468:	83 ec 18             	sub    $0x18,%esp
    int width, height;

    width = context.width;
     46b:	8b 45 0c             	mov    0xc(%ebp),%eax
     46e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    height = context.height;
     471:	8b 45 10             	mov    0x10(%ebp),%eax
     474:	89 45 f0             	mov    %eax,-0x10(%ebp)

    fill_rect(context, 0, 0, width, height, 0xFFFF);
     477:	8b 55 f0             	mov    -0x10(%ebp),%edx
     47a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47d:	68 ff ff 00 00       	push   $0xffff
     482:	52                   	push   %edx
     483:	50                   	push   %eax
     484:	6a 00                	push   $0x0
     486:	6a 00                	push   $0x0
     488:	ff 75 10             	pushl  0x10(%ebp)
     48b:	ff 75 0c             	pushl  0xc(%ebp)
     48e:	ff 75 08             	pushl  0x8(%ebp)
     491:	e8 c5 05 00 00       	call   a5b <fill_rect>
     496:	83 c4 20             	add    $0x20,%esp

    draw_line(context, 0, 0, width-1, 0, BORDERLINE_COLOR);
     499:	8b 45 f4             	mov    -0xc(%ebp),%eax
     49c:	83 e8 01             	sub    $0x1,%eax
     49f:	6a 00                	push   $0x0
     4a1:	6a 00                	push   $0x0
     4a3:	50                   	push   %eax
     4a4:	6a 00                	push   $0x0
     4a6:	6a 00                	push   $0x0
     4a8:	ff 75 10             	pushl  0x10(%ebp)
     4ab:	ff 75 0c             	pushl  0xc(%ebp)
     4ae:	ff 75 08             	pushl  0x8(%ebp)
     4b1:	e8 7a 0c 00 00       	call   1130 <draw_line>
     4b6:	83 c4 20             	add    $0x20,%esp
    draw_line(context, width-1, 0, width-1, height-1, BORDERLINE_COLOR);
     4b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4bc:	8d 48 ff             	lea    -0x1(%eax),%ecx
     4bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c2:	8d 50 ff             	lea    -0x1(%eax),%edx
     4c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c8:	83 e8 01             	sub    $0x1,%eax
     4cb:	6a 00                	push   $0x0
     4cd:	51                   	push   %ecx
     4ce:	52                   	push   %edx
     4cf:	6a 00                	push   $0x0
     4d1:	50                   	push   %eax
     4d2:	ff 75 10             	pushl  0x10(%ebp)
     4d5:	ff 75 0c             	pushl  0xc(%ebp)
     4d8:	ff 75 08             	pushl  0x8(%ebp)
     4db:	e8 50 0c 00 00       	call   1130 <draw_line>
     4e0:	83 c4 20             	add    $0x20,%esp
    draw_line(context, 0, height-1, width-1, height-1, BORDERLINE_COLOR);
     4e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4e6:	8d 48 ff             	lea    -0x1(%eax),%ecx
     4e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ec:	8d 50 ff             	lea    -0x1(%eax),%edx
     4ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4f2:	83 e8 01             	sub    $0x1,%eax
     4f5:	6a 00                	push   $0x0
     4f7:	51                   	push   %ecx
     4f8:	52                   	push   %edx
     4f9:	50                   	push   %eax
     4fa:	6a 00                	push   $0x0
     4fc:	ff 75 10             	pushl  0x10(%ebp)
     4ff:	ff 75 0c             	pushl  0xc(%ebp)
     502:	ff 75 08             	pushl  0x8(%ebp)
     505:	e8 26 0c 00 00       	call   1130 <draw_line>
     50a:	83 c4 20             	add    $0x20,%esp
    draw_line(context, 0, height-1, 0, 0, BORDERLINE_COLOR);
     50d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     510:	83 e8 01             	sub    $0x1,%eax
     513:	6a 00                	push   $0x0
     515:	6a 00                	push   $0x0
     517:	6a 00                	push   $0x0
     519:	50                   	push   %eax
     51a:	6a 00                	push   $0x0
     51c:	ff 75 10             	pushl  0x10(%ebp)
     51f:	ff 75 0c             	pushl  0xc(%ebp)
     522:	ff 75 08             	pushl  0x8(%ebp)
     525:	e8 06 0c 00 00       	call   1130 <draw_line>
     52a:	83 c4 20             	add    $0x20,%esp

    fill_rect(context, 1, 1, width-2, TOPBAR_HEIGHT, TOPBAR_COLOR);
     52d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     530:	83 e8 02             	sub    $0x2,%eax
     533:	68 cb 5a 00 00       	push   $0x5acb
     538:	6a 14                	push   $0x14
     53a:	50                   	push   %eax
     53b:	6a 01                	push   $0x1
     53d:	6a 01                	push   $0x1
     53f:	ff 75 10             	pushl  0x10(%ebp)
     542:	ff 75 0c             	pushl  0xc(%ebp)
     545:	ff 75 08             	pushl  0x8(%ebp)
     548:	e8 0e 05 00 00       	call   a5b <fill_rect>
     54d:	83 c4 20             	add    $0x20,%esp
    puts_str(context, "PictureViewer", 0, WINDOW_WIDTH/2 - 53, 3);
     550:	83 ec 04             	sub    $0x4,%esp
     553:	6a 03                	push   $0x3
     555:	68 c5 00 00 00       	push   $0xc5
     55a:	6a 00                	push   $0x0
     55c:	68 4a 89 00 00       	push   $0x894a
     561:	ff 75 10             	pushl  0x10(%ebp)
     564:	ff 75 0c             	pushl  0xc(%ebp)
     567:	ff 75 08             	pushl  0x8(%ebp)
     56a:	e8 4e 0a 00 00       	call   fbd <puts_str>
     56f:	83 c4 20             	add    $0x20,%esp

    draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     572:	83 ec 0c             	sub    $0xc,%esp
     575:	6a 01                	push   $0x1
     577:	68 20 c3 00 00       	push   $0xc320
     57c:	ff 75 10             	pushl  0x10(%ebp)
     57f:	ff 75 0c             	pushl  0xc(%ebp)
     582:	ff 75 08             	pushl  0x8(%ebp)
     585:	e8 70 0e 00 00       	call   13fa <draw_iconlist>
     58a:	83 c4 20             	add    $0x20,%esp
}
     58d:	90                   	nop
     58e:	c9                   	leave  
     58f:	c3                   	ret    

00000590 <drawPicViewerContent>:

void drawPicViewerContent(Context context, char* fileName) {
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	83 ec 18             	sub    $0x18,%esp
    int c_width, c_height;
    int pic_width, pic_height;

    c_width = context.width;
     596:	8b 45 0c             	mov    0xc(%ebp),%eax
     599:	89 45 f4             	mov    %eax,-0xc(%ebp)
    c_height = context.height;
     59c:	8b 45 10             	mov    0x10(%ebp),%eax
     59f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    pic_width = pic.width;
     5a2:	a1 64 c8 00 00       	mov    0xc864,%eax
     5a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    pic_height = pic.height;
     5aa:	a1 68 c8 00 00       	mov    0xc868,%eax
     5af:	89 45 e8             	mov    %eax,-0x18(%ebp)

    printf(0, "drawPicViewerContent: pic_width: %d, pic_height: %d\n", pic_width, pic_height);
     5b2:	ff 75 e8             	pushl  -0x18(%ebp)
     5b5:	ff 75 ec             	pushl  -0x14(%ebp)
     5b8:	68 58 89 00 00       	push   $0x8958
     5bd:	6a 00                	push   $0x0
     5bf:	e8 e3 1f 00 00       	call   25a7 <printf>
     5c4:	83 c4 10             	add    $0x10,%esp
    draw_picture(context, pic, (c_width-pic_width) >> 1, TOPBAR_HEIGHT + ((c_height-pic_height) >> 1));
     5c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5ca:	2b 45 e8             	sub    -0x18(%ebp),%eax
     5cd:	d1 f8                	sar    %eax
     5cf:	8d 50 14             	lea    0x14(%eax),%edx
     5d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5d5:	2b 45 ec             	sub    -0x14(%ebp),%eax
     5d8:	d1 f8                	sar    %eax
     5da:	52                   	push   %edx
     5db:	50                   	push   %eax
     5dc:	ff 35 68 c8 00 00    	pushl  0xc868
     5e2:	ff 35 64 c8 00 00    	pushl  0xc864
     5e8:	ff 35 60 c8 00 00    	pushl  0xc860
     5ee:	ff 75 10             	pushl  0x10(%ebp)
     5f1:	ff 75 0c             	pushl  0xc(%ebp)
     5f4:	ff 75 08             	pushl  0x8(%ebp)
     5f7:	e8 72 0a 00 00       	call   106e <draw_picture>
     5fc:	83 c4 20             	add    $0x20,%esp
}
     5ff:	90                   	nop
     600:	c9                   	leave  
     601:	c3                   	ret    

00000602 <h_closeWnd>:

void h_closeWnd(Point p) {
     602:	55                   	push   %ebp
     603:	89 e5                	mov    %esp,%ebp
    isRun = 0;
     605:	c7 05 58 c3 00 00 00 	movl   $0x0,0xc358
     60c:	00 00 00 
}
     60f:	90                   	nop
     610:	5d                   	pop    %ebp
     611:	c3                   	ret    

00000612 <addWndEvent>:

void addWndEvent(ClickableManager *cm) {
     612:	55                   	push   %ebp
     613:	89 e5                	mov    %esp,%ebp
     615:	57                   	push   %edi
     616:	56                   	push   %esi
     617:	53                   	push   %ebx
     618:	83 ec 2c             	sub    $0x2c,%esp
    int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
     61b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)

	for (i = 0; i < n; i++) {
     622:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     629:	eb 72                	jmp    69d <addWndEvent+0x8b>
		createClickable(cm,
     62b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     62e:	8b 1c 85 54 c3 00 00 	mov    0xc354(,%eax,4),%ebx
     635:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     638:	6b c0 34             	imul   $0x34,%eax,%eax
     63b:	05 50 c3 00 00       	add    $0xc350,%eax
     640:	8b 38                	mov    (%eax),%edi
     642:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     645:	6b c0 34             	imul   $0x34,%eax,%eax
     648:	05 4c c3 00 00       	add    $0xc34c,%eax
     64d:	8b 30                	mov    (%eax),%esi
     64f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     652:	6b c0 34             	imul   $0x34,%eax,%eax
     655:	05 44 c3 00 00       	add    $0xc344,%eax
     65a:	8b 08                	mov    (%eax),%ecx
     65c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     65f:	6b c0 34             	imul   $0x34,%eax,%eax
     662:	05 40 c3 00 00       	add    $0xc340,%eax
     667:	8b 10                	mov    (%eax),%edx
     669:	8d 45 d0             	lea    -0x30(%ebp),%eax
     66c:	83 ec 0c             	sub    $0xc,%esp
     66f:	57                   	push   %edi
     670:	56                   	push   %esi
     671:	51                   	push   %ecx
     672:	52                   	push   %edx
     673:	50                   	push   %eax
     674:	e8 49 15 00 00       	call   1bc2 <initRect>
     679:	83 c4 1c             	add    $0x1c,%esp
     67c:	83 ec 04             	sub    $0x4,%esp
     67f:	53                   	push   %ebx
     680:	6a 02                	push   $0x2
     682:	ff 75 dc             	pushl  -0x24(%ebp)
     685:	ff 75 d8             	pushl  -0x28(%ebp)
     688:	ff 75 d4             	pushl  -0x2c(%ebp)
     68b:	ff 75 d0             	pushl  -0x30(%ebp)
     68e:	ff 75 08             	pushl  0x8(%ebp)
     691:	e8 0e 16 00 00       	call   1ca4 <createClickable>
     696:	83 c4 20             	add    $0x20,%esp
	for (i = 0; i < n; i++) {
     699:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     69d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6a0:	3b 45 e0             	cmp    -0x20(%ebp),%eax
     6a3:	7c 86                	jl     62b <addWndEvent+0x19>
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
     6a5:	90                   	nop
     6a6:	90                   	nop
     6a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6aa:	5b                   	pop    %ebx
     6ab:	5e                   	pop    %esi
     6ac:	5f                   	pop    %edi
     6ad:	5d                   	pop    %ebp
     6ae:	c3                   	ret    

000006af <main>:

int main(int argc, char *argv[]) {
     6af:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     6b3:	83 e4 f0             	and    $0xfffffff0,%esp
     6b6:	ff 71 fc             	pushl  -0x4(%ecx)
     6b9:	55                   	push   %ebp
     6ba:	89 e5                	mov    %esp,%ebp
     6bc:	57                   	push   %edi
     6bd:	56                   	push   %esi
     6be:	53                   	push   %ebx
     6bf:	51                   	push   %ecx
     6c0:	81 ec 98 00 00 00    	sub    $0x98,%esp
     6c6:	89 cb                	mov    %ecx,%ebx
    ClickableManager cm;
    int winid;
    struct Msg msg;
    Point p;

    winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
     6c8:	83 ec 04             	sub    $0x4,%esp
     6cb:	68 36 01 00 00       	push   $0x136
     6d0:	68 f4 01 00 00       	push   $0x1f4
     6d5:	8d 45 c8             	lea    -0x38(%ebp),%eax
     6d8:	50                   	push   %eax
     6d9:	e8 98 02 00 00       	call   976 <init_context>
     6de:	83 c4 10             	add    $0x10,%esp
     6e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    cm = initClickManager(context);
     6e4:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
     6ea:	ff 75 d0             	pushl  -0x30(%ebp)
     6ed:	ff 75 cc             	pushl  -0x34(%ebp)
     6f0:	ff 75 c8             	pushl  -0x38(%ebp)
     6f3:	50                   	push   %eax
     6f4:	e8 5d 15 00 00       	call   1c56 <initClickManager>
     6f9:	83 c4 0c             	add    $0xc,%esp
     6fc:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
     702:	89 45 b4             	mov    %eax,-0x4c(%ebp)
     705:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
     70b:	89 45 b8             	mov    %eax,-0x48(%ebp)
     70e:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
     714:	89 45 bc             	mov    %eax,-0x44(%ebp)
     717:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
     71d:	89 45 c0             	mov    %eax,-0x40(%ebp)
     720:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
     726:	89 45 c4             	mov    %eax,-0x3c(%ebp)

    loadBitmap(&pic, argv[1]);
     729:	8b 43 04             	mov    0x4(%ebx),%eax
     72c:	83 c0 04             	add    $0x4,%eax
     72f:	8b 00                	mov    (%eax),%eax
     731:	83 ec 08             	sub    $0x8,%esp
     734:	50                   	push   %eax
     735:	68 60 c8 00 00       	push   $0xc860
     73a:	e8 21 0d 00 00       	call   1460 <loadBitmap>
     73f:	83 c4 10             	add    $0x10,%esp
    load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
     742:	83 ec 08             	sub    $0x8,%esp
     745:	6a 01                	push   $0x1
     747:	68 20 c3 00 00       	push   $0xc320
     74c:	e8 62 0c 00 00       	call   13b3 <load_iconlist>
     751:	83 c4 10             	add    $0x10,%esp

    modifyPic(context);
     754:	83 ec 04             	sub    $0x4,%esp
     757:	ff 75 d0             	pushl  -0x30(%ebp)
     75a:	ff 75 cc             	pushl  -0x34(%ebp)
     75d:	ff 75 c8             	pushl  -0x38(%ebp)
     760:	e8 1d fc ff ff       	call   382 <modifyPic>
     765:	83 c4 10             	add    $0x10,%esp
    deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
     768:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     76b:	83 ec 0c             	sub    $0xc,%esp
     76e:	68 58 02 00 00       	push   $0x258
     773:	68 20 03 00 00       	push   $0x320
     778:	6a 00                	push   $0x0
     77a:	6a 00                	push   $0x0
     77c:	50                   	push   %eax
     77d:	e8 40 14 00 00       	call   1bc2 <initRect>
     782:	83 c4 1c             	add    $0x1c,%esp
     785:	83 ec 0c             	sub    $0xc,%esp
     788:	ff 75 e0             	pushl  -0x20(%ebp)
     78b:	ff 75 dc             	pushl  -0x24(%ebp)
     78e:	ff 75 d8             	pushl  -0x28(%ebp)
     791:	ff 75 d4             	pushl  -0x2c(%ebp)
     794:	8d 45 b4             	lea    -0x4c(%ebp),%eax
     797:	50                   	push   %eax
     798:	e8 f2 15 00 00       	call   1d8f <deleteClickable>
     79d:	83 c4 20             	add    $0x20,%esp
    addWndEvent(&cm);
     7a0:	83 ec 0c             	sub    $0xc,%esp
     7a3:	8d 45 b4             	lea    -0x4c(%ebp),%eax
     7a6:	50                   	push   %eax
     7a7:	e8 66 fe ff ff       	call   612 <addWndEvent>
     7ac:	83 c4 10             	add    $0x10,%esp

    while (isRun) {
     7af:	e9 9e 01 00 00       	jmp    952 <main+0x2a3>
        getMsg(&msg);
     7b4:	83 ec 0c             	sub    $0xc,%esp
     7b7:	8d 45 98             	lea    -0x68(%ebp),%eax
     7ba:	50                   	push   %eax
     7bb:	e8 9b 1c 00 00       	call   245b <getMsg>
     7c0:	83 c4 10             	add    $0x10,%esp
        switch (msg.msg_type) {
     7c3:	8b 45 98             	mov    -0x68(%ebp),%eax
     7c6:	83 f8 08             	cmp    $0x8,%eax
     7c9:	0f 87 82 01 00 00    	ja     951 <main+0x2a2>
     7cf:	8b 04 85 90 89 00 00 	mov    0x8990(,%eax,4),%eax
     7d6:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
     7d8:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
     7db:	8b 55 a0             	mov    -0x60(%ebp),%edx
     7de:	8d 45 90             	lea    -0x70(%ebp),%eax
     7e1:	83 ec 04             	sub    $0x4,%esp
     7e4:	51                   	push   %ecx
     7e5:	52                   	push   %edx
     7e6:	50                   	push   %eax
     7e7:	e8 af 13 00 00       	call   1b9b <initPoint>
     7ec:	83 c4 0c             	add    $0xc,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
     7ef:	8b 45 b8             	mov    -0x48(%ebp),%eax
     7f2:	83 ec 04             	sub    $0x4,%esp
     7f5:	ff 75 94             	pushl  -0x6c(%ebp)
     7f8:	ff 75 90             	pushl  -0x70(%ebp)
     7fb:	50                   	push   %eax
     7fc:	e8 62 16 00 00       	call   1e63 <executeHandler>
     801:	83 c4 10             	add    $0x10,%esp
     804:	85 c0                	test   %eax,%eax
     806:	0f 84 46 01 00 00    	je     952 <main+0x2a3>
				updateWindow(winid, context.addr, msg.msg_detail);
     80c:	8b 55 9c             	mov    -0x64(%ebp),%edx
     80f:	8b 45 c8             	mov    -0x38(%ebp),%eax
     812:	83 ec 04             	sub    $0x4,%esp
     815:	52                   	push   %edx
     816:	50                   	push   %eax
     817:	ff 75 e4             	pushl  -0x1c(%ebp)
     81a:	e8 54 1c 00 00       	call   2473 <updateWindow>
     81f:	83 c4 10             	add    $0x10,%esp
			}
			break;
     822:	e9 2b 01 00 00       	jmp    952 <main+0x2a3>
		case MSG_UPDATE:
			drawPicViewerWnd(context);
     827:	83 ec 04             	sub    $0x4,%esp
     82a:	ff 75 d0             	pushl  -0x30(%ebp)
     82d:	ff 75 cc             	pushl  -0x34(%ebp)
     830:	ff 75 c8             	pushl  -0x38(%ebp)
     833:	e8 2d fc ff ff       	call   465 <drawPicViewerWnd>
     838:	83 c4 10             	add    $0x10,%esp
			drawPicViewerContent(context, argv[1]);
     83b:	8b 43 04             	mov    0x4(%ebx),%eax
     83e:	83 c0 04             	add    $0x4,%eax
     841:	8b 00                	mov    (%eax),%eax
     843:	50                   	push   %eax
     844:	ff 75 d0             	pushl  -0x30(%ebp)
     847:	ff 75 cc             	pushl  -0x34(%ebp)
     84a:	ff 75 c8             	pushl  -0x38(%ebp)
     84d:	e8 3e fd ff ff       	call   590 <drawPicViewerContent>
     852:	83 c4 10             	add    $0x10,%esp
			updateWindow(winid, context.addr, msg.msg_detail);
     855:	8b 55 9c             	mov    -0x64(%ebp),%edx
     858:	8b 45 c8             	mov    -0x38(%ebp),%eax
     85b:	83 ec 04             	sub    $0x4,%esp
     85e:	52                   	push   %edx
     85f:	50                   	push   %eax
     860:	ff 75 e4             	pushl  -0x1c(%ebp)
     863:	e8 0b 1c 00 00       	call   2473 <updateWindow>
     868:	83 c4 10             	add    $0x10,%esp
			break;
     86b:	e9 e2 00 00 00       	jmp    952 <main+0x2a3>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
     870:	8b 7d ac             	mov    -0x54(%ebp),%edi
     873:	8b 75 a8             	mov    -0x58(%ebp),%esi
     876:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
     879:	8b 55 a0             	mov    -0x60(%ebp),%edx
     87c:	8b 45 c8             	mov    -0x38(%ebp),%eax
     87f:	83 ec 08             	sub    $0x8,%esp
     882:	57                   	push   %edi
     883:	56                   	push   %esi
     884:	51                   	push   %ecx
     885:	52                   	push   %edx
     886:	50                   	push   %eax
     887:	ff 75 e4             	pushl  -0x1c(%ebp)
     88a:	e8 ec 1b 00 00       	call   247b <updatePartialWindow>
     88f:	83 c4 20             	add    $0x20,%esp
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
     892:	e9 bb 00 00 00       	jmp    952 <main+0x2a3>
		case MSG_LPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
     897:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
     89a:	8b 55 a0             	mov    -0x60(%ebp),%edx
     89d:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
     8a3:	83 ec 04             	sub    $0x4,%esp
     8a6:	51                   	push   %ecx
     8a7:	52                   	push   %edx
     8a8:	50                   	push   %eax
     8a9:	e8 ed 12 00 00       	call   1b9b <initPoint>
     8ae:	83 c4 0c             	add    $0xc,%esp
     8b1:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
     8b7:	8b 95 64 ff ff ff    	mov    -0x9c(%ebp),%edx
     8bd:	89 45 90             	mov    %eax,-0x70(%ebp)
     8c0:	89 55 94             	mov    %edx,-0x6c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
     8c3:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     8c6:	83 ec 04             	sub    $0x4,%esp
     8c9:	ff 75 94             	pushl  -0x6c(%ebp)
     8cc:	ff 75 90             	pushl  -0x70(%ebp)
     8cf:	50                   	push   %eax
     8d0:	e8 8e 15 00 00       	call   1e63 <executeHandler>
     8d5:	83 c4 10             	add    $0x10,%esp
     8d8:	85 c0                	test   %eax,%eax
     8da:	74 76                	je     952 <main+0x2a3>

				updateWindow(winid, context.addr, msg.msg_detail);
     8dc:	8b 55 9c             	mov    -0x64(%ebp),%edx
     8df:	8b 45 c8             	mov    -0x38(%ebp),%eax
     8e2:	83 ec 04             	sub    $0x4,%esp
     8e5:	52                   	push   %edx
     8e6:	50                   	push   %eax
     8e7:	ff 75 e4             	pushl  -0x1c(%ebp)
     8ea:	e8 84 1b 00 00       	call   2473 <updateWindow>
     8ef:	83 c4 10             	add    $0x10,%esp
			}
			break;
     8f2:	eb 5e                	jmp    952 <main+0x2a3>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
     8f4:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
     8f7:	8b 55 a0             	mov    -0x60(%ebp),%edx
     8fa:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
     900:	83 ec 04             	sub    $0x4,%esp
     903:	51                   	push   %ecx
     904:	52                   	push   %edx
     905:	50                   	push   %eax
     906:	e8 90 12 00 00       	call   1b9b <initPoint>
     90b:	83 c4 0c             	add    $0xc,%esp
     90e:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
     914:	8b 95 64 ff ff ff    	mov    -0x9c(%ebp),%edx
     91a:	89 45 90             	mov    %eax,-0x70(%ebp)
     91d:	89 55 94             	mov    %edx,-0x6c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
     920:	8b 45 bc             	mov    -0x44(%ebp),%eax
     923:	83 ec 04             	sub    $0x4,%esp
     926:	ff 75 94             	pushl  -0x6c(%ebp)
     929:	ff 75 90             	pushl  -0x70(%ebp)
     92c:	50                   	push   %eax
     92d:	e8 31 15 00 00       	call   1e63 <executeHandler>
     932:	83 c4 10             	add    $0x10,%esp
     935:	85 c0                	test   %eax,%eax
     937:	74 19                	je     952 <main+0x2a3>
				updateWindow(winid, context.addr, msg.msg_detail);
     939:	8b 55 9c             	mov    -0x64(%ebp),%edx
     93c:	8b 45 c8             	mov    -0x38(%ebp),%eax
     93f:	83 ec 04             	sub    $0x4,%esp
     942:	52                   	push   %edx
     943:	50                   	push   %eax
     944:	ff 75 e4             	pushl  -0x1c(%ebp)
     947:	e8 27 1b 00 00       	call   2473 <updateWindow>
     94c:	83 c4 10             	add    $0x10,%esp
			}
			break;
     94f:	eb 01                	jmp    952 <main+0x2a3>
		default:
			break;
     951:	90                   	nop
    while (isRun) {
     952:	a1 58 c3 00 00       	mov    0xc358,%eax
     957:	85 c0                	test   %eax,%eax
     959:	0f 85 55 fe ff ff    	jne    7b4 <main+0x105>
		}
    }
    free_context(&context, winid);
     95f:	83 ec 08             	sub    $0x8,%esp
     962:	ff 75 e4             	pushl  -0x1c(%ebp)
     965:	8d 45 c8             	lea    -0x38(%ebp),%eax
     968:	50                   	push   %eax
     969:	e8 7a 00 00 00       	call   9e8 <free_context>
     96e:	83 c4 10             	add    $0x10,%esp
    exit();
     971:	e8 45 1a 00 00       	call   23bb <exit>

00000976 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
     976:	55                   	push   %ebp
     977:	89 e5                	mov    %esp,%ebp
     979:	83 ec 08             	sub    $0x8,%esp
    context_ptr->width = width;
     97c:	8b 45 08             	mov    0x8(%ebp),%eax
     97f:	8b 55 0c             	mov    0xc(%ebp),%edx
     982:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
     985:	8b 45 08             	mov    0x8(%ebp),%eax
     988:	8b 55 10             	mov    0x10(%ebp),%edx
     98b:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
     98e:	8b 55 0c             	mov    0xc(%ebp),%edx
     991:	8b 45 10             	mov    0x10(%ebp),%eax
     994:	0f af c2             	imul   %edx,%eax
     997:	01 c0                	add    %eax,%eax
     999:	83 ec 0c             	sub    $0xc,%esp
     99c:	50                   	push   %eax
     99d:	e8 d9 1e 00 00       	call   287b <malloc>
     9a2:	83 c4 10             	add    $0x10,%esp
     9a5:	8b 55 08             	mov    0x8(%ebp),%edx
     9a8:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
     9aa:	8b 55 0c             	mov    0xc(%ebp),%edx
     9ad:	8b 45 10             	mov    0x10(%ebp),%eax
     9b0:	0f af c2             	imul   %edx,%eax
     9b3:	8d 14 00             	lea    (%eax,%eax,1),%edx
     9b6:	8b 45 08             	mov    0x8(%ebp),%eax
     9b9:	8b 00                	mov    (%eax),%eax
     9bb:	83 ec 04             	sub    $0x4,%esp
     9be:	52                   	push   %edx
     9bf:	6a 00                	push   $0x0
     9c1:	50                   	push   %eax
     9c2:	e8 59 18 00 00       	call   2220 <memset>
     9c7:	83 c4 10             	add    $0x10,%esp
    initializeASCII();
     9ca:	e8 79 01 00 00       	call   b48 <initializeASCII>
    initializeGBK();
     9cf:	e8 fc 02 00 00       	call   cd0 <initializeGBK>
    return createWindow(0, 0, width, height);
     9d4:	ff 75 10             	pushl  0x10(%ebp)
     9d7:	ff 75 0c             	pushl  0xc(%ebp)
     9da:	6a 00                	push   $0x0
     9dc:	6a 00                	push   $0x0
     9de:	e8 80 1a 00 00       	call   2463 <createWindow>
     9e3:	83 c4 10             	add    $0x10,%esp
}
     9e6:	c9                   	leave  
     9e7:	c3                   	ret    

000009e8 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
     9e8:	55                   	push   %ebp
     9e9:	89 e5                	mov    %esp,%ebp
     9eb:	83 ec 08             	sub    $0x8,%esp
    free(context_ptr->addr);
     9ee:	8b 45 08             	mov    0x8(%ebp),%eax
     9f1:	8b 00                	mov    (%eax),%eax
     9f3:	83 ec 0c             	sub    $0xc,%esp
     9f6:	50                   	push   %eax
     9f7:	e8 3d 1d 00 00       	call   2739 <free>
     9fc:	83 c4 10             	add    $0x10,%esp
    freeASCII();
     9ff:	e8 b2 02 00 00       	call   cb6 <freeASCII>
    freeGBK();
     a04:	e8 68 03 00 00       	call   d71 <freeGBK>
    destroyWindow(winid);
     a09:	83 ec 0c             	sub    $0xc,%esp
     a0c:	ff 75 0c             	pushl  0xc(%ebp)
     a0f:	e8 57 1a 00 00       	call   246b <destroyWindow>
     a14:	83 c4 10             	add    $0x10,%esp
}
     a17:	90                   	nop
     a18:	c9                   	leave  
     a19:	c3                   	ret    

00000a1a <draw_point>:
*             then do nothing!
*/

void
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
     a1a:	55                   	push   %ebp
     a1b:	89 e5                	mov    %esp,%ebp
     a1d:	83 ec 04             	sub    $0x4,%esp
     a20:	8b 45 1c             	mov    0x1c(%ebp),%eax
     a23:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width)
     a27:	8b 45 0c             	mov    0xc(%ebp),%eax
     a2a:	39 45 14             	cmp    %eax,0x14(%ebp)
     a2d:	73 26                	jae    a55 <draw_point+0x3b>
    return;
  if(y >= c.height)
     a2f:	8b 45 10             	mov    0x10(%ebp),%eax
     a32:	39 45 18             	cmp    %eax,0x18(%ebp)
     a35:	73 21                	jae    a58 <draw_point+0x3e>
    return;
  c.addr[y*c.width+x] = color;
     a37:	8b 55 08             	mov    0x8(%ebp),%edx
     a3a:	8b 45 0c             	mov    0xc(%ebp),%eax
     a3d:	0f af 45 18          	imul   0x18(%ebp),%eax
     a41:	89 c1                	mov    %eax,%ecx
     a43:	8b 45 14             	mov    0x14(%ebp),%eax
     a46:	01 c8                	add    %ecx,%eax
     a48:	01 c0                	add    %eax,%eax
     a4a:	01 c2                	add    %eax,%edx
     a4c:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
     a50:	66 89 02             	mov    %ax,(%edx)
     a53:	eb 04                	jmp    a59 <draw_point+0x3f>
    return;
     a55:	90                   	nop
     a56:	eb 01                	jmp    a59 <draw_point+0x3f>
    return;
     a58:	90                   	nop
}
     a59:	c9                   	leave  
     a5a:	c3                   	ret    

00000a5b <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
     a5b:	55                   	push   %ebp
     a5c:	89 e5                	mov    %esp,%ebp
     a5e:	83 ec 14             	sub    $0x14,%esp
     a61:	8b 45 24             	mov    0x24(%ebp),%eax
     a64:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
     a68:	8b 55 14             	mov    0x14(%ebp),%edx
     a6b:	8b 45 1c             	mov    0x1c(%ebp),%eax
     a6e:	01 d0                	add    %edx,%eax
     a70:	8b 55 0c             	mov    0xc(%ebp),%edx
     a73:	39 d0                	cmp    %edx,%eax
     a75:	0f 47 c2             	cmova  %edx,%eax
     a78:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height;
     a7b:	8b 55 18             	mov    0x18(%ebp),%edx
     a7e:	8b 45 20             	mov    0x20(%ebp),%eax
     a81:	01 d0                	add    %edx,%eax
     a83:	8b 55 10             	mov    0x10(%ebp),%edx
     a86:	39 d0                	cmp    %edx,%eax
     a88:	0f 47 c2             	cmova  %edx,%eax
     a8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
     a8e:	8b 45 18             	mov    0x18(%ebp),%eax
     a91:	89 45 f8             	mov    %eax,-0x8(%ebp)
     a94:	eb 36                	jmp    acc <fill_rect+0x71>
	{
		for (x = bx; x < mx; x++)
     a96:	8b 45 14             	mov    0x14(%ebp),%eax
     a99:	89 45 fc             	mov    %eax,-0x4(%ebp)
     a9c:	eb 22                	jmp    ac0 <fill_rect+0x65>
		{
			draw_point(c, x, y, color);
     a9e:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
     aa2:	8b 55 f8             	mov    -0x8(%ebp),%edx
     aa5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     aa8:	51                   	push   %ecx
     aa9:	52                   	push   %edx
     aaa:	50                   	push   %eax
     aab:	ff 75 10             	pushl  0x10(%ebp)
     aae:	ff 75 0c             	pushl  0xc(%ebp)
     ab1:	ff 75 08             	pushl  0x8(%ebp)
     ab4:	e8 61 ff ff ff       	call   a1a <draw_point>
     ab9:	83 c4 18             	add    $0x18,%esp
		for (x = bx; x < mx; x++)
     abc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     ac0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ac3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     ac6:	7c d6                	jl     a9e <fill_rect+0x43>
	for (y = by; y < my; y++)
     ac8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
     acc:	8b 45 f8             	mov    -0x8(%ebp),%eax
     acf:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     ad2:	7c c2                	jl     a96 <fill_rect+0x3b>
		}
	}
}
     ad4:	90                   	nop
     ad5:	90                   	nop
     ad6:	c9                   	leave  
     ad7:	c3                   	ret    

00000ad8 <printBinary>:

void printBinary(char c)
{
     ad8:	55                   	push   %ebp
     ad9:	89 e5                	mov    %esp,%ebp
     adb:	83 ec 28             	sub    $0x28,%esp
     ade:	8b 45 08             	mov    0x8(%ebp),%eax
     ae1:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
     ae4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     aeb:	eb 40                	jmp    b2d <printBinary+0x55>
	{
		if(((c << i) & 0x80) != 0)
     aed:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
     af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     af4:	89 c1                	mov    %eax,%ecx
     af6:	d3 e2                	shl    %cl,%edx
     af8:	89 d0                	mov    %edx,%eax
     afa:	25 80 00 00 00       	and    $0x80,%eax
     aff:	85 c0                	test   %eax,%eax
     b01:	74 14                	je     b17 <printBinary+0x3f>
		{
			printf(0, "1");
     b03:	83 ec 08             	sub    $0x8,%esp
     b06:	68 b4 89 00 00       	push   $0x89b4
     b0b:	6a 00                	push   $0x0
     b0d:	e8 95 1a 00 00       	call   25a7 <printf>
     b12:	83 c4 10             	add    $0x10,%esp
     b15:	eb 12                	jmp    b29 <printBinary+0x51>
		}
		else
		{
			printf(0, "0");
     b17:	83 ec 08             	sub    $0x8,%esp
     b1a:	68 b6 89 00 00       	push   $0x89b6
     b1f:	6a 00                	push   $0x0
     b21:	e8 81 1a 00 00       	call   25a7 <printf>
     b26:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < 8; i++)
     b29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     b2d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
     b31:	7e ba                	jle    aed <printBinary+0x15>
		}
	}

	printf(0, "\n");
     b33:	83 ec 08             	sub    $0x8,%esp
     b36:	68 b8 89 00 00       	push   $0x89b8
     b3b:	6a 00                	push   $0x0
     b3d:	e8 65 1a 00 00       	call   25a7 <printf>
     b42:	83 c4 10             	add    $0x10,%esp
}
     b45:	90                   	nop
     b46:	c9                   	leave  
     b47:	c3                   	ret    

00000b48 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
     b48:	55                   	push   %ebp
     b49:	89 e5                	mov    %esp,%ebp
     b4b:	53                   	push   %ebx
     b4c:	83 ec 24             	sub    $0x24,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
     b4f:	83 ec 08             	sub    $0x8,%esp
     b52:	68 ba 89 00 00       	push   $0x89ba
     b57:	6a 00                	push   $0x0
     b59:	e8 49 1a 00 00       	call   25a7 <printf>
     b5e:	83 c4 10             	add    $0x10,%esp
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
     b61:	83 ec 08             	sub    $0x8,%esp
     b64:	6a 00                	push   $0x0
     b66:	68 cd 89 00 00       	push   $0x89cd
     b6b:	e8 8b 18 00 00       	call   23fb <open>
     b70:	83 c4 10             	add    $0x10,%esp
     b73:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b76:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     b7a:	79 1c                	jns    b98 <initializeASCII+0x50>
	  printf(0,"cannot open %s\n", HANKAKU);
     b7c:	83 ec 04             	sub    $0x4,%esp
     b7f:	68 cd 89 00 00       	push   $0x89cd
     b84:	68 d9 89 00 00       	push   $0x89d9
     b89:	6a 00                	push   $0x0
     b8b:	e8 17 1a 00 00       	call   25a7 <printf>
     b90:	83 c4 10             	add    $0x10,%esp
	  return;
     b93:	e9 19 01 00 00       	jmp    cb1 <initializeASCII+0x169>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
     b98:	83 ec 0c             	sub    $0xc,%esp
     b9b:	68 00 10 00 00       	push   $0x1000
     ba0:	e8 d6 1c 00 00       	call   287b <malloc>
     ba5:	83 c4 10             	add    $0x10,%esp
     ba8:	a3 80 ca 00 00       	mov    %eax,0xca80
	for (i = 0; i < ASCII_NUM; i++)
     bad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     bb4:	eb 12                	jmp    bc8 <initializeASCII+0x80>
	{
		hankaku[i] = 0;
     bb6:	8b 15 80 ca 00 00    	mov    0xca80,%edx
     bbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bbf:	01 d0                	add    %edx,%eax
     bc1:	c6 00 00             	movb   $0x0,(%eax)
	for (i = 0; i < ASCII_NUM; i++)
     bc4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     bc8:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
     bcf:	7e e5                	jle    bb6 <initializeASCII+0x6e>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
     bd1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
     bd8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
     bdf:	e9 88 00 00 00       	jmp    c6c <initializeASCII+0x124>
	{
		for (i = 0; i < n; i++){
     be4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     beb:	eb 77                	jmp    c64 <initializeASCII+0x11c>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
     bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bf0:	05 80 c8 00 00       	add    $0xc880,%eax
     bf5:	0f b6 00             	movzbl (%eax),%eax
     bf8:	3c 2a                	cmp    $0x2a,%al
     bfa:	74 0f                	je     c0b <initializeASCII+0xc3>
     bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bff:	05 80 c8 00 00       	add    $0xc880,%eax
     c04:	0f b6 00             	movzbl (%eax),%eax
     c07:	3c 2e                	cmp    $0x2e,%al
     c09:	75 55                	jne    c60 <initializeASCII+0x118>
			{
				if (buf[i] == '*')
     c0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c0e:	05 80 c8 00 00       	add    $0xc880,%eax
     c13:	0f b6 00             	movzbl (%eax),%eax
     c16:	3c 2a                	cmp    $0x2a,%al
     c18:	75 31                	jne    c4b <initializeASCII+0x103>
				{
					hankaku[y] |= (0x80 >> x);
     c1a:	8b 15 80 ca 00 00    	mov    0xca80,%edx
     c20:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c23:	01 d0                	add    %edx,%eax
     c25:	0f b6 00             	movzbl (%eax),%eax
     c28:	89 c3                	mov    %eax,%ebx
     c2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c2d:	ba 80 00 00 00       	mov    $0x80,%edx
     c32:	89 c1                	mov    %eax,%ecx
     c34:	d3 fa                	sar    %cl,%edx
     c36:	89 d0                	mov    %edx,%eax
     c38:	09 c3                	or     %eax,%ebx
     c3a:	89 d9                	mov    %ebx,%ecx
     c3c:	8b 15 80 ca 00 00    	mov    0xca80,%edx
     c42:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c45:	01 d0                	add    %edx,%eax
     c47:	89 ca                	mov    %ecx,%edx
     c49:	88 10                	mov    %dl,(%eax)
				}
				x ++;
     c4b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
     c4f:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
     c53:	7e 0b                	jle    c60 <initializeASCII+0x118>
				{
					x = 0;
     c55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
     c5c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		for (i = 0; i < n; i++){
     c60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c64:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c67:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
     c6a:	7c 81                	jl     bed <initializeASCII+0xa5>
	while((n = read(fd, buf, sizeof(buf))) > 0)
     c6c:	83 ec 04             	sub    $0x4,%esp
     c6f:	68 00 02 00 00       	push   $0x200
     c74:	68 80 c8 00 00       	push   $0xc880
     c79:	ff 75 e8             	pushl  -0x18(%ebp)
     c7c:	e8 52 17 00 00       	call   23d3 <read>
     c81:	83 c4 10             	add    $0x10,%esp
     c84:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     c87:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     c8b:	0f 8f 53 ff ff ff    	jg     be4 <initializeASCII+0x9c>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
     c91:	83 ec 08             	sub    $0x8,%esp
     c94:	68 e9 89 00 00       	push   $0x89e9
     c99:	6a 00                	push   $0x0
     c9b:	e8 07 19 00 00       	call   25a7 <printf>
     ca0:	83 c4 10             	add    $0x10,%esp
	close(fd);
     ca3:	83 ec 0c             	sub    $0xc,%esp
     ca6:	ff 75 e8             	pushl  -0x18(%ebp)
     ca9:	e8 35 17 00 00       	call   23e3 <close>
     cae:	83 c4 10             	add    $0x10,%esp
}
     cb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cb4:	c9                   	leave  
     cb5:	c3                   	ret    

00000cb6 <freeASCII>:

void freeASCII(){
     cb6:	55                   	push   %ebp
     cb7:	89 e5                	mov    %esp,%ebp
     cb9:	83 ec 08             	sub    $0x8,%esp
	free(hankaku);
     cbc:	a1 80 ca 00 00       	mov    0xca80,%eax
     cc1:	83 ec 0c             	sub    $0xc,%esp
     cc4:	50                   	push   %eax
     cc5:	e8 6f 1a 00 00       	call   2739 <free>
     cca:	83 c4 10             	add    $0x10,%esp
}
     ccd:	90                   	nop
     cce:	c9                   	leave  
     ccf:	c3                   	ret    

00000cd0 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	83 ec 18             	sub    $0x18,%esp
	int fd;
	printf(0,"initialzing gbk\n");
     cd6:	83 ec 08             	sub    $0x8,%esp
     cd9:	68 06 8a 00 00       	push   $0x8a06
     cde:	6a 00                	push   $0x0
     ce0:	e8 c2 18 00 00       	call   25a7 <printf>
     ce5:	83 c4 10             	add    $0x10,%esp
	if((fd = open(HZK16, 0)) < 0){
     ce8:	83 ec 08             	sub    $0x8,%esp
     ceb:	6a 00                	push   $0x0
     ced:	68 17 8a 00 00       	push   $0x8a17
     cf2:	e8 04 17 00 00       	call   23fb <open>
     cf7:	83 c4 10             	add    $0x10,%esp
     cfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
     cfd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d01:	79 19                	jns    d1c <initializeGBK+0x4c>
		printf(0,"cannot open %s\n", HZK16);
     d03:	83 ec 04             	sub    $0x4,%esp
     d06:	68 17 8a 00 00       	push   $0x8a17
     d0b:	68 d9 89 00 00       	push   $0x89d9
     d10:	6a 00                	push   $0x0
     d12:	e8 90 18 00 00       	call   25a7 <printf>
     d17:	83 c4 10             	add    $0x10,%esp
		return;
     d1a:	eb 53                	jmp    d6f <initializeGBK+0x9f>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
     d1c:	83 ec 0c             	sub    $0xc,%esp
     d1f:	68 78 69 00 00       	push   $0x6978
     d24:	e8 52 1b 00 00       	call   287b <malloc>
     d29:	83 c4 10             	add    $0x10,%esp
     d2c:	a3 84 ca 00 00       	mov    %eax,0xca84
	fontFile.size = read(fd, fontFile.buf, 27000);
     d31:	a1 84 ca 00 00       	mov    0xca84,%eax
     d36:	83 ec 04             	sub    $0x4,%esp
     d39:	68 78 69 00 00       	push   $0x6978
     d3e:	50                   	push   %eax
     d3f:	ff 75 f4             	pushl  -0xc(%ebp)
     d42:	e8 8c 16 00 00       	call   23d3 <read>
     d47:	83 c4 10             	add    $0x10,%esp
     d4a:	a3 88 ca 00 00       	mov    %eax,0xca88
	printf(0,"initialzing gbk complete!\n");
     d4f:	83 ec 08             	sub    $0x8,%esp
     d52:	68 21 8a 00 00       	push   $0x8a21
     d57:	6a 00                	push   $0x0
     d59:	e8 49 18 00 00       	call   25a7 <printf>
     d5e:	83 c4 10             	add    $0x10,%esp
	close(fd);
     d61:	83 ec 0c             	sub    $0xc,%esp
     d64:	ff 75 f4             	pushl  -0xc(%ebp)
     d67:	e8 77 16 00 00       	call   23e3 <close>
     d6c:	83 c4 10             	add    $0x10,%esp
}
     d6f:	c9                   	leave  
     d70:	c3                   	ret    

00000d71 <freeGBK>:

void freeGBK(){
     d71:	55                   	push   %ebp
     d72:	89 e5                	mov    %esp,%ebp
     d74:	83 ec 08             	sub    $0x8,%esp
	free(fontFile.buf);
     d77:	a1 84 ca 00 00       	mov    0xca84,%eax
     d7c:	83 ec 0c             	sub    $0xc,%esp
     d7f:	50                   	push   %eax
     d80:	e8 b4 19 00 00       	call   2739 <free>
     d85:	83 c4 10             	add    $0x10,%esp
}
     d88:	90                   	nop
     d89:	c9                   	leave  
     d8a:	c3                   	ret    

00000d8b <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
     d8b:	55                   	push   %ebp
     d8c:	89 e5                	mov    %esp,%ebp
     d8e:	53                   	push   %ebx
     d8f:	83 ec 18             	sub    $0x18,%esp
     d92:	8b 55 14             	mov    0x14(%ebp),%edx
     d95:	8b 45 18             	mov    0x18(%ebp),%eax
     d98:	88 55 e8             	mov    %dl,-0x18(%ebp)
     d9b:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
     d9f:	8b 45 20             	mov    0x20(%ebp),%eax
     da2:	89 45 f4             	mov    %eax,-0xc(%ebp)
     da5:	eb 6b                	jmp    e12 <put_ascii+0x87>
		for(tmpX = 0; tmpX < 8; tmpX++) {
     da7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
     dae:	eb 58                	jmp    e08 <put_ascii+0x7d>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
     db0:	8b 15 80 ca 00 00    	mov    0xca80,%edx
     db6:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
     dba:	c1 e0 04             	shl    $0x4,%eax
     dbd:	89 c1                	mov    %eax,%ecx
     dbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc2:	2b 45 20             	sub    0x20(%ebp),%eax
     dc5:	01 c8                	add    %ecx,%eax
     dc7:	01 d0                	add    %edx,%eax
     dc9:	0f b6 00             	movzbl (%eax),%eax
     dcc:	0f b6 d0             	movzbl %al,%edx
     dcf:	8b 45 f8             	mov    -0x8(%ebp),%eax
     dd2:	89 c1                	mov    %eax,%ecx
     dd4:	d3 e2                	shl    %cl,%edx
     dd6:	89 d0                	mov    %edx,%eax
     dd8:	25 80 00 00 00       	and    $0x80,%eax
     ddd:	85 c0                	test   %eax,%eax
     ddf:	74 23                	je     e04 <put_ascii+0x79>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
     de1:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
     de5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     de8:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
     deb:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     dee:	01 d9                	add    %ebx,%ecx
     df0:	52                   	push   %edx
     df1:	50                   	push   %eax
     df2:	51                   	push   %ecx
     df3:	ff 75 10             	pushl  0x10(%ebp)
     df6:	ff 75 0c             	pushl  0xc(%ebp)
     df9:	ff 75 08             	pushl  0x8(%ebp)
     dfc:	e8 19 fc ff ff       	call   a1a <draw_point>
     e01:	83 c4 18             	add    $0x18,%esp
		for(tmpX = 0; tmpX < 8; tmpX++) {
     e04:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
     e08:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
     e0c:	7e a2                	jle    db0 <put_ascii+0x25>
	for(tmpY = y; tmpY < y + 16; tmpY++) {
     e0e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     e12:	8b 45 20             	mov    0x20(%ebp),%eax
     e15:	83 c0 0f             	add    $0xf,%eax
     e18:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     e1b:	7e 8a                	jle    da7 <put_ascii+0x1c>
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
     e1d:	90                   	nop
     e1e:	90                   	nop
     e1f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e22:	c9                   	leave  
     e23:	c3                   	ret    

00000e24 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
     e24:	55                   	push   %ebp
     e25:	89 e5                	mov    %esp,%ebp
     e27:	53                   	push   %ebx
     e28:	83 ec 18             	sub    $0x18,%esp
     e2b:	8b 55 14             	mov    0x14(%ebp),%edx
     e2e:	8b 45 18             	mov    0x18(%ebp),%eax
     e31:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
     e35:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
     e39:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
     e3d:	0f b6 c0             	movzbl %al,%eax
     e40:	3d a0 00 00 00       	cmp    $0xa0,%eax
     e45:	0f 8e 1b 01 00 00    	jle    f66 <put_gbk+0x142>
     e4b:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
     e4f:	66 c1 f8 08          	sar    $0x8,%ax
     e53:	98                   	cwtl   
     e54:	0f b6 c0             	movzbl %al,%eax
     e57:	3d a0 00 00 00       	cmp    $0xa0,%eax
     e5c:	0f 8e 04 01 00 00    	jle    f66 <put_gbk+0x142>
		hzk16Base = fontFile.buf;
     e62:	a1 84 ca 00 00       	mov    0xca84,%eax
     e67:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
     e6a:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
     e6e:	0f b6 c0             	movzbl %al,%eax
     e71:	2d a1 00 00 00       	sub    $0xa1,%eax
     e76:	6b d0 5e             	imul   $0x5e,%eax,%edx
     e79:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
     e7d:	66 c1 f8 08          	sar    $0x8,%ax
     e81:	98                   	cwtl   
     e82:	0f b6 c0             	movzbl %al,%eax
     e85:	2d a1 00 00 00       	sub    $0xa1,%eax
     e8a:	01 d0                	add    %edx,%eax
     e8c:	c1 e0 05             	shl    $0x5,%eax
     e8f:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
     e92:	8b 45 20             	mov    0x20(%ebp),%eax
     e95:	89 45 f4             	mov    %eax,-0xc(%ebp)
     e98:	e9 b8 00 00 00       	jmp    f55 <put_gbk+0x131>
			for(tmpX = 0; tmpX < 8; tmpX++) {
     e9d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
     ea4:	eb 47                	jmp    eed <put_gbk+0xc9>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
     ea6:	8b 55 ec             	mov    -0x14(%ebp),%edx
     ea9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     eac:	01 d0                	add    %edx,%eax
     eae:	0f b6 00             	movzbl (%eax),%eax
     eb1:	0f b6 d0             	movzbl %al,%edx
     eb4:	8b 45 f8             	mov    -0x8(%ebp),%eax
     eb7:	89 c1                	mov    %eax,%ecx
     eb9:	d3 e2                	shl    %cl,%edx
     ebb:	89 d0                	mov    %edx,%eax
     ebd:	25 80 00 00 00       	and    $0x80,%eax
     ec2:	85 c0                	test   %eax,%eax
     ec4:	74 23                	je     ee9 <put_gbk+0xc5>
					draw_point(c, x + tmpX, tmpY, colorNum);
     ec6:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
     eca:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ecd:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
     ed0:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     ed3:	01 d9                	add    %ebx,%ecx
     ed5:	52                   	push   %edx
     ed6:	50                   	push   %eax
     ed7:	51                   	push   %ecx
     ed8:	ff 75 10             	pushl  0x10(%ebp)
     edb:	ff 75 0c             	pushl  0xc(%ebp)
     ede:	ff 75 08             	pushl  0x8(%ebp)
     ee1:	e8 34 fb ff ff       	call   a1a <draw_point>
     ee6:	83 c4 18             	add    $0x18,%esp
			for(tmpX = 0; tmpX < 8; tmpX++) {
     ee9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
     eed:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
     ef1:	7e b3                	jle    ea6 <put_gbk+0x82>
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
     ef3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
     ef7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
     efe:	eb 47                	jmp    f47 <put_gbk+0x123>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
     f00:	8b 55 ec             	mov    -0x14(%ebp),%edx
     f03:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f06:	01 d0                	add    %edx,%eax
     f08:	0f b6 00             	movzbl (%eax),%eax
     f0b:	0f b6 d0             	movzbl %al,%edx
     f0e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f11:	89 c1                	mov    %eax,%ecx
     f13:	d3 e2                	shl    %cl,%edx
     f15:	89 d0                	mov    %edx,%eax
     f17:	25 80 00 00 00       	and    $0x80,%eax
     f1c:	85 c0                	test   %eax,%eax
     f1e:	74 23                	je     f43 <put_gbk+0x11f>
					draw_point(c, x + tmpX, tmpY, colorNum);
     f20:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
     f24:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f27:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
     f2a:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     f2d:	01 d9                	add    %ebx,%ecx
     f2f:	52                   	push   %edx
     f30:	50                   	push   %eax
     f31:	51                   	push   %ecx
     f32:	ff 75 10             	pushl  0x10(%ebp)
     f35:	ff 75 0c             	pushl  0xc(%ebp)
     f38:	ff 75 08             	pushl  0x8(%ebp)
     f3b:	e8 da fa ff ff       	call   a1a <draw_point>
     f40:	83 c4 18             	add    $0x18,%esp
			for(tmpX = 0; tmpX < 8; tmpX++) {
     f43:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
     f47:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
     f4b:	7e b3                	jle    f00 <put_gbk+0xdc>
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
     f4d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
		for(tmpY = y; tmpY < 16 + y; tmpY++) {
     f51:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f55:	8b 45 20             	mov    0x20(%ebp),%eax
     f58:	83 c0 0f             	add    $0xf,%eax
     f5b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     f5e:	0f 8e 39 ff ff ff    	jle    e9d <put_gbk+0x79>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
     f64:	eb 51                	jmp    fb7 <put_gbk+0x193>
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
     f66:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
     f6a:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
     f6e:	0f b6 c0             	movzbl %al,%eax
     f71:	ff 75 20             	pushl  0x20(%ebp)
     f74:	ff 75 1c             	pushl  0x1c(%ebp)
     f77:	52                   	push   %edx
     f78:	50                   	push   %eax
     f79:	ff 75 10             	pushl  0x10(%ebp)
     f7c:	ff 75 0c             	pushl  0xc(%ebp)
     f7f:	ff 75 08             	pushl  0x8(%ebp)
     f82:	e8 04 fe ff ff       	call   d8b <put_ascii>
     f87:	83 c4 1c             	add    $0x1c,%esp
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
     f8a:	8b 45 1c             	mov    0x1c(%ebp),%eax
     f8d:	8d 48 08             	lea    0x8(%eax),%ecx
     f90:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
     f94:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
     f98:	66 c1 f8 08          	sar    $0x8,%ax
     f9c:	0f b6 c0             	movzbl %al,%eax
     f9f:	ff 75 20             	pushl  0x20(%ebp)
     fa2:	51                   	push   %ecx
     fa3:	52                   	push   %edx
     fa4:	50                   	push   %eax
     fa5:	ff 75 10             	pushl  0x10(%ebp)
     fa8:	ff 75 0c             	pushl  0xc(%ebp)
     fab:	ff 75 08             	pushl  0x8(%ebp)
     fae:	e8 d8 fd ff ff       	call   d8b <put_ascii>
     fb3:	83 c4 1c             	add    $0x1c,%esp
	}
}
     fb6:	90                   	nop
     fb7:	90                   	nop
     fb8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     fbb:	c9                   	leave  
     fbc:	c3                   	ret    

00000fbd <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
     fbd:	55                   	push   %ebp
     fbe:	89 e5                	mov    %esp,%ebp
     fc0:	83 ec 28             	sub    $0x28,%esp
     fc3:	8b 45 18             	mov    0x18(%ebp),%eax
     fc6:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
     fca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
     fd1:	83 ec 0c             	sub    $0xc,%esp
     fd4:	ff 75 14             	pushl  0x14(%ebp)
     fd7:	e8 1d 12 00 00       	call   21f9 <strlen>
     fdc:	83 c4 10             	add    $0x10,%esp
     fdf:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
     fe2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fe9:	8b 45 1c             	mov    0x1c(%ebp),%eax
     fec:	89 45 f0             	mov    %eax,-0x10(%ebp)
     fef:	eb 36                	jmp    1027 <puts_str+0x6a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
     ff1:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
     ff5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     ff8:	8b 45 14             	mov    0x14(%ebp),%eax
     ffb:	01 c8                	add    %ecx,%eax
     ffd:	0f b6 00             	movzbl (%eax),%eax
    1000:	0f b6 c0             	movzbl %al,%eax
    1003:	83 ec 04             	sub    $0x4,%esp
    1006:	ff 75 20             	pushl  0x20(%ebp)
    1009:	ff 75 f0             	pushl  -0x10(%ebp)
    100c:	52                   	push   %edx
    100d:	50                   	push   %eax
    100e:	ff 75 10             	pushl  0x10(%ebp)
    1011:	ff 75 0c             	pushl  0xc(%ebp)
    1014:	ff 75 08             	pushl  0x8(%ebp)
    1017:	e8 6f fd ff ff       	call   d8b <put_ascii>
    101c:	83 c4 20             	add    $0x20,%esp
			xTmp += 8;
    101f:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    1023:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    1027:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102a:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    102d:	77 c2                	ja     ff1 <puts_str+0x34>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    102f:	90                   	nop
    1030:	90                   	nop
    1031:	c9                   	leave  
    1032:	c3                   	ret    

00001033 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    1033:	55                   	push   %ebp
    1034:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    1036:	8b 45 10             	mov    0x10(%ebp),%eax
    1039:	8d 50 07             	lea    0x7(%eax),%edx
    103c:	85 c0                	test   %eax,%eax
    103e:	0f 48 c2             	cmovs  %edx,%eax
    1041:	c1 f8 03             	sar    $0x3,%eax
    1044:	89 c1                	mov    %eax,%ecx
    1046:	8b 45 0c             	mov    0xc(%ebp),%eax
    1049:	8d 50 03             	lea    0x3(%eax),%edx
    104c:	85 c0                	test   %eax,%eax
    104e:	0f 48 c2             	cmovs  %edx,%eax
    1051:	c1 f8 02             	sar    $0x2,%eax
    1054:	c1 e0 05             	shl    $0x5,%eax
    1057:	01 c1                	add    %eax,%ecx
    1059:	8b 45 08             	mov    0x8(%ebp),%eax
    105c:	8d 50 07             	lea    0x7(%eax),%edx
    105f:	85 c0                	test   %eax,%eax
    1061:	0f 48 c2             	cmovs  %edx,%eax
    1064:	c1 f8 03             	sar    $0x3,%eax
    1067:	c1 e0 0b             	shl    $0xb,%eax
    106a:	01 c8                	add    %ecx,%eax
}
    106c:	5d                   	pop    %ebp
    106d:	c3                   	ret    

0000106e <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    106e:	55                   	push   %ebp
    106f:	89 e5                	mov    %esp,%ebp
    1071:	53                   	push   %ebx
    1072:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    1075:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    107c:	e9 9c 00 00 00       	jmp    111d <draw_picture+0xaf>
	{
		for (j = 0; j < pic.width; j++)
    1081:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1088:	e9 80 00 00 00       	jmp    110d <draw_picture+0x9f>
		{
			rgb = pic.data[i*pic.width+j];
    108d:	8b 55 14             	mov    0x14(%ebp),%edx
    1090:	8b 45 18             	mov    0x18(%ebp),%eax
    1093:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    1097:	89 c1                	mov    %eax,%ecx
    1099:	8b 45 f4             	mov    -0xc(%ebp),%eax
    109c:	01 c8                	add    %ecx,%eax
    109e:	c1 e0 02             	shl    $0x2,%eax
    10a1:	01 d0                	add    %edx,%eax
    10a3:	8b 00                	mov    (%eax),%eax
    10a5:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    10a8:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    10ac:	3c 01                	cmp    $0x1,%al
    10ae:	74 58                	je     1108 <draw_picture+0x9a>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    10b0:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    10b4:	0f b6 c8             	movzbl %al,%ecx
    10b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    10bb:	0f b6 d0             	movzbl %al,%edx
    10be:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    10c2:	0f b6 c0             	movzbl %al,%eax
    10c5:	51                   	push   %ecx
    10c6:	52                   	push   %edx
    10c7:	50                   	push   %eax
    10c8:	e8 66 ff ff ff       	call   1033 <_RGB16BIT565>
    10cd:	83 c4 0c             	add    $0xc,%esp
    10d0:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    10d4:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
    10d8:	8b 55 1c             	mov    0x1c(%ebp),%edx
    10db:	83 ea 01             	sub    $0x1,%edx
    10de:	89 d1                	mov    %edx,%ecx
    10e0:	2b 4d f8             	sub    -0x8(%ebp),%ecx
    10e3:	8b 55 24             	mov    0x24(%ebp),%edx
    10e6:	01 ca                	add    %ecx,%edx
    10e8:	89 d1                	mov    %edx,%ecx
    10ea:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    10ed:	8b 55 20             	mov    0x20(%ebp),%edx
    10f0:	01 da                	add    %ebx,%edx
    10f2:	50                   	push   %eax
    10f3:	51                   	push   %ecx
    10f4:	52                   	push   %edx
    10f5:	ff 75 10             	pushl  0x10(%ebp)
    10f8:	ff 75 0c             	pushl  0xc(%ebp)
    10fb:	ff 75 08             	pushl  0x8(%ebp)
    10fe:	e8 17 f9 ff ff       	call   a1a <draw_point>
    1103:	83 c4 18             	add    $0x18,%esp
    1106:	eb 01                	jmp    1109 <draw_picture+0x9b>
			if (rgb.rgbReserved == 1) continue;
    1108:	90                   	nop
		for (j = 0; j < pic.width; j++)
    1109:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    110d:	8b 45 18             	mov    0x18(%ebp),%eax
    1110:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1113:	0f 8c 74 ff ff ff    	jl     108d <draw_picture+0x1f>
	for (i = 0; i < pic.height; i++)
    1119:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    111d:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1120:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    1123:	0f 8c 58 ff ff ff    	jl     1081 <draw_picture+0x13>
		}
	}
}
    1129:	90                   	nop
    112a:	90                   	nop
    112b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    112e:	c9                   	leave  
    112f:	c3                   	ret    

00001130 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	83 ec 24             	sub    $0x24,%esp
    1136:	8b 45 24             	mov    0x24(%ebp),%eax
    1139:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    113d:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1140:	2b 45 14             	sub    0x14(%ebp),%eax
    1143:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    1146:	8b 45 20             	mov    0x20(%ebp),%eax
    1149:	2b 45 18             	sub    0x18(%ebp),%eax
    114c:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    114f:	8b 45 14             	mov    0x14(%ebp),%eax
    1152:	c1 e0 0a             	shl    $0xa,%eax
    1155:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    1158:	8b 45 18             	mov    0x18(%ebp),%eax
    115b:	c1 e0 0a             	shl    $0xa,%eax
    115e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    1161:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1164:	c1 f8 1f             	sar    $0x1f,%eax
    1167:	31 45 fc             	xor    %eax,-0x4(%ebp)
    116a:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    116d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1170:	c1 f8 1f             	sar    $0x1f,%eax
    1173:	31 45 f8             	xor    %eax,-0x8(%ebp)
    1176:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    1179:	8b 45 fc             	mov    -0x4(%ebp),%eax
    117c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    117f:	7c 4f                	jl     11d0 <draw_line+0xa0>
		len = dx + 1;
    1181:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1184:	83 c0 01             	add    $0x1,%eax
    1187:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    118a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    118d:	3b 45 14             	cmp    0x14(%ebp),%eax
    1190:	7e 07                	jle    1199 <draw_line+0x69>
    1192:	b8 00 04 00 00       	mov    $0x400,%eax
    1197:	eb 05                	jmp    119e <draw_line+0x6e>
    1199:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    119e:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    11a1:	8b 45 20             	mov    0x20(%ebp),%eax
    11a4:	3b 45 18             	cmp    0x18(%ebp),%eax
    11a7:	7c 12                	jl     11bb <draw_line+0x8b>
    11a9:	8b 45 20             	mov    0x20(%ebp),%eax
    11ac:	2b 45 18             	sub    0x18(%ebp),%eax
    11af:	83 c0 01             	add    $0x1,%eax
    11b2:	c1 e0 0a             	shl    $0xa,%eax
    11b5:	99                   	cltd   
    11b6:	f7 7d ec             	idivl  -0x14(%ebp)
    11b9:	eb 10                	jmp    11cb <draw_line+0x9b>
    11bb:	8b 45 20             	mov    0x20(%ebp),%eax
    11be:	2b 45 18             	sub    0x18(%ebp),%eax
    11c1:	83 e8 01             	sub    $0x1,%eax
    11c4:	c1 e0 0a             	shl    $0xa,%eax
    11c7:	99                   	cltd   
    11c8:	f7 7d ec             	idivl  -0x14(%ebp)
    11cb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    11ce:	eb 4d                	jmp    121d <draw_line+0xed>
	}
	else {
		len = dy + 1;
    11d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    11d3:	83 c0 01             	add    $0x1,%eax
    11d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    11d9:	8b 45 20             	mov    0x20(%ebp),%eax
    11dc:	3b 45 18             	cmp    0x18(%ebp),%eax
    11df:	7e 07                	jle    11e8 <draw_line+0xb8>
    11e1:	b8 00 04 00 00       	mov    $0x400,%eax
    11e6:	eb 05                	jmp    11ed <draw_line+0xbd>
    11e8:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    11ed:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    11f0:	8b 45 1c             	mov    0x1c(%ebp),%eax
    11f3:	3b 45 14             	cmp    0x14(%ebp),%eax
    11f6:	7c 12                	jl     120a <draw_line+0xda>
    11f8:	8b 45 1c             	mov    0x1c(%ebp),%eax
    11fb:	2b 45 14             	sub    0x14(%ebp),%eax
    11fe:	83 c0 01             	add    $0x1,%eax
    1201:	c1 e0 0a             	shl    $0xa,%eax
    1204:	99                   	cltd   
    1205:	f7 7d ec             	idivl  -0x14(%ebp)
    1208:	eb 10                	jmp    121a <draw_line+0xea>
    120a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    120d:	2b 45 14             	sub    0x14(%ebp),%eax
    1210:	83 e8 01             	sub    $0x1,%eax
    1213:	c1 e0 0a             	shl    $0xa,%eax
    1216:	99                   	cltd   
    1217:	f7 7d ec             	idivl  -0x14(%ebp)
    121a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    121d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1224:	eb 36                	jmp    125c <draw_line+0x12c>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    1226:	0f b7 45 dc          	movzwl -0x24(%ebp),%eax
    122a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    122d:	c1 fa 0a             	sar    $0xa,%edx
    1230:	89 d1                	mov    %edx,%ecx
    1232:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1235:	c1 fa 0a             	sar    $0xa,%edx
    1238:	50                   	push   %eax
    1239:	51                   	push   %ecx
    123a:	52                   	push   %edx
    123b:	ff 75 10             	pushl  0x10(%ebp)
    123e:	ff 75 0c             	pushl  0xc(%ebp)
    1241:	ff 75 08             	pushl  0x8(%ebp)
    1244:	e8 d1 f7 ff ff       	call   a1a <draw_point>
    1249:	83 c4 18             	add    $0x18,%esp
		y += dy;
    124c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    124f:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    1252:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1255:	01 45 f4             	add    %eax,-0xc(%ebp)
	for(i = 0; i < len; i++) {
    1258:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    125c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    125f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1262:	7c c2                	jl     1226 <draw_line+0xf6>
	}
}
    1264:	90                   	nop
    1265:	90                   	nop
    1266:	c9                   	leave  
    1267:	c3                   	ret    

00001268 <draw_window>:

void
draw_window(Context c, char *title)
{
    1268:	55                   	push   %ebp
    1269:	89 e5                	mov    %esp,%ebp
    126b:	83 ec 18             	sub    $0x18,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    126e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1271:	83 e8 01             	sub    $0x1,%eax
    1274:	6a 00                	push   $0x0
    1276:	6a 00                	push   $0x0
    1278:	50                   	push   %eax
    1279:	6a 00                	push   $0x0
    127b:	6a 00                	push   $0x0
    127d:	ff 75 10             	pushl  0x10(%ebp)
    1280:	ff 75 0c             	pushl  0xc(%ebp)
    1283:	ff 75 08             	pushl  0x8(%ebp)
    1286:	e8 a5 fe ff ff       	call   1130 <draw_line>
    128b:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    128e:	8b 45 10             	mov    0x10(%ebp),%eax
    1291:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1294:	8b 45 0c             	mov    0xc(%ebp),%eax
    1297:	8d 50 ff             	lea    -0x1(%eax),%edx
    129a:	8b 45 0c             	mov    0xc(%ebp),%eax
    129d:	83 e8 01             	sub    $0x1,%eax
    12a0:	6a 00                	push   $0x0
    12a2:	51                   	push   %ecx
    12a3:	52                   	push   %edx
    12a4:	6a 00                	push   $0x0
    12a6:	50                   	push   %eax
    12a7:	ff 75 10             	pushl  0x10(%ebp)
    12aa:	ff 75 0c             	pushl  0xc(%ebp)
    12ad:	ff 75 08             	pushl  0x8(%ebp)
    12b0:	e8 7b fe ff ff       	call   1130 <draw_line>
    12b5:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    12b8:	8b 45 10             	mov    0x10(%ebp),%eax
    12bb:	8d 48 ff             	lea    -0x1(%eax),%ecx
    12be:	8b 45 10             	mov    0x10(%ebp),%eax
    12c1:	8d 50 ff             	lea    -0x1(%eax),%edx
    12c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c7:	83 e8 01             	sub    $0x1,%eax
    12ca:	6a 00                	push   $0x0
    12cc:	51                   	push   %ecx
    12cd:	6a 00                	push   $0x0
    12cf:	52                   	push   %edx
    12d0:	50                   	push   %eax
    12d1:	ff 75 10             	pushl  0x10(%ebp)
    12d4:	ff 75 0c             	pushl  0xc(%ebp)
    12d7:	ff 75 08             	pushl  0x8(%ebp)
    12da:	e8 51 fe ff ff       	call   1130 <draw_line>
    12df:	83 c4 20             	add    $0x20,%esp
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    12e2:	8b 45 10             	mov    0x10(%ebp),%eax
    12e5:	83 e8 01             	sub    $0x1,%eax
    12e8:	6a 00                	push   $0x0
    12ea:	6a 00                	push   $0x0
    12ec:	6a 00                	push   $0x0
    12ee:	50                   	push   %eax
    12ef:	6a 00                	push   $0x0
    12f1:	ff 75 10             	pushl  0x10(%ebp)
    12f4:	ff 75 0c             	pushl  0xc(%ebp)
    12f7:	ff 75 08             	pushl  0x8(%ebp)
    12fa:	e8 31 fe ff ff       	call   1130 <draw_line>
    12ff:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    1302:	8b 45 0c             	mov    0xc(%ebp),%eax
    1305:	83 e8 02             	sub    $0x2,%eax
    1308:	68 cb 5a 00 00       	push   $0x5acb
    130d:	6a 14                	push   $0x14
    130f:	50                   	push   %eax
    1310:	6a 01                	push   $0x1
    1312:	6a 01                	push   $0x1
    1314:	ff 75 10             	pushl  0x10(%ebp)
    1317:	ff 75 0c             	pushl  0xc(%ebp)
    131a:	ff 75 08             	pushl  0x8(%ebp)
    131d:	e8 39 f7 ff ff       	call   a5b <fill_rect>
    1322:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    1325:	8b 45 0c             	mov    0xc(%ebp),%eax
    1328:	83 e8 02             	sub    $0x2,%eax
    132b:	89 c2                	mov    %eax,%edx
    132d:	8b 45 10             	mov    0x10(%ebp),%eax
    1330:	83 e8 15             	sub    $0x15,%eax
    1333:	68 cb 5a 00 00       	push   $0x5acb
    1338:	6a 14                	push   $0x14
    133a:	52                   	push   %edx
    133b:	50                   	push   %eax
    133c:	6a 01                	push   $0x1
    133e:	ff 75 10             	pushl  0x10(%ebp)
    1341:	ff 75 0c             	pushl  0xc(%ebp)
    1344:	ff 75 08             	pushl  0x8(%ebp)
    1347:	e8 0f f7 ff ff       	call   a5b <fill_rect>
    134c:	83 c4 20             	add    $0x20,%esp

  loadBitmap(&pic, "close.bmp");
    134f:	83 ec 08             	sub    $0x8,%esp
    1352:	68 3c 8a 00 00       	push   $0x8a3c
    1357:	8d 45 ec             	lea    -0x14(%ebp),%eax
    135a:	50                   	push   %eax
    135b:	e8 00 01 00 00       	call   1460 <loadBitmap>
    1360:	83 c4 10             	add    $0x10,%esp
  draw_picture(c, pic, 3, 3);
    1363:	6a 03                	push   $0x3
    1365:	6a 03                	push   $0x3
    1367:	ff 75 f4             	pushl  -0xc(%ebp)
    136a:	ff 75 f0             	pushl  -0x10(%ebp)
    136d:	ff 75 ec             	pushl  -0x14(%ebp)
    1370:	ff 75 10             	pushl  0x10(%ebp)
    1373:	ff 75 0c             	pushl  0xc(%ebp)
    1376:	ff 75 08             	pushl  0x8(%ebp)
    1379:	e8 f0 fc ff ff       	call   106e <draw_picture>
    137e:	83 c4 20             	add    $0x20,%esp
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    1381:	83 ec 04             	sub    $0x4,%esp
    1384:	6a 02                	push   $0x2
    1386:	6a 19                	push   $0x19
    1388:	68 ff ff 00 00       	push   $0xffff
    138d:	ff 75 14             	pushl  0x14(%ebp)
    1390:	ff 75 10             	pushl  0x10(%ebp)
    1393:	ff 75 0c             	pushl  0xc(%ebp)
    1396:	ff 75 08             	pushl  0x8(%ebp)
    1399:	e8 1f fc ff ff       	call   fbd <puts_str>
    139e:	83 c4 20             	add    $0x20,%esp
  freepic(&pic);
    13a1:	83 ec 0c             	sub    $0xc,%esp
    13a4:	8d 45 ec             	lea    -0x14(%ebp),%eax
    13a7:	50                   	push   %eax
    13a8:	e8 d5 05 00 00       	call   1982 <freepic>
    13ad:	83 c4 10             	add    $0x10,%esp
}
    13b0:	90                   	nop
    13b1:	c9                   	leave  
    13b2:	c3                   	ret    

000013b3 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    13b3:	55                   	push   %ebp
    13b4:	89 e5                	mov    %esp,%ebp
    13b6:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < len; i++)
    13b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    13c0:	eb 2c                	jmp    13ee <load_iconlist+0x3b>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    13c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13c5:	6b d0 34             	imul   $0x34,%eax,%edx
    13c8:	8b 45 08             	mov    0x8(%ebp),%eax
    13cb:	01 d0                	add    %edx,%eax
    13cd:	89 c2                	mov    %eax,%edx
    13cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13d2:	6b c8 34             	imul   $0x34,%eax,%ecx
    13d5:	8b 45 08             	mov    0x8(%ebp),%eax
    13d8:	01 c8                	add    %ecx,%eax
    13da:	83 c0 28             	add    $0x28,%eax
    13dd:	83 ec 08             	sub    $0x8,%esp
    13e0:	52                   	push   %edx
    13e1:	50                   	push   %eax
    13e2:	e8 79 00 00 00       	call   1460 <loadBitmap>
    13e7:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < len; i++)
    13ea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    13ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13f1:	3b 45 0c             	cmp    0xc(%ebp),%eax
    13f4:	7c cc                	jl     13c2 <load_iconlist+0xf>
	}
}
    13f6:	90                   	nop
    13f7:	90                   	nop
    13f8:	c9                   	leave  
    13f9:	c3                   	ret    

000013fa <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    13fa:	55                   	push   %ebp
    13fb:	89 e5                	mov    %esp,%ebp
    13fd:	53                   	push   %ebx
    13fe:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; i < len; i++)
    1401:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1408:	eb 47                	jmp    1451 <draw_iconlist+0x57>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    140a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    140d:	6b d0 34             	imul   $0x34,%eax,%edx
    1410:	8b 45 14             	mov    0x14(%ebp),%eax
    1413:	01 d0                	add    %edx,%eax
    1415:	8b 48 24             	mov    0x24(%eax),%ecx
    1418:	8b 45 f8             	mov    -0x8(%ebp),%eax
    141b:	6b d0 34             	imul   $0x34,%eax,%edx
    141e:	8b 45 14             	mov    0x14(%ebp),%eax
    1421:	01 d0                	add    %edx,%eax
    1423:	8b 50 20             	mov    0x20(%eax),%edx
    1426:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1429:	6b d8 34             	imul   $0x34,%eax,%ebx
    142c:	8b 45 14             	mov    0x14(%ebp),%eax
    142f:	01 d8                	add    %ebx,%eax
    1431:	51                   	push   %ecx
    1432:	52                   	push   %edx
    1433:	ff 70 30             	pushl  0x30(%eax)
    1436:	ff 70 2c             	pushl  0x2c(%eax)
    1439:	ff 70 28             	pushl  0x28(%eax)
    143c:	ff 75 10             	pushl  0x10(%ebp)
    143f:	ff 75 0c             	pushl  0xc(%ebp)
    1442:	ff 75 08             	pushl  0x8(%ebp)
    1445:	e8 24 fc ff ff       	call   106e <draw_picture>
    144a:	83 c4 20             	add    $0x20,%esp
    for (i = 0; i < len; i++)
    144d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1451:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1454:	3b 45 18             	cmp    0x18(%ebp),%eax
    1457:	7c b1                	jl     140a <draw_iconlist+0x10>
    }
}
    1459:	90                   	nop
    145a:	90                   	nop
    145b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    145e:	c9                   	leave  
    145f:	c3                   	ret    

00001460 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	81 ec 88 00 00 00    	sub    $0x88,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    1469:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    1470:	83 ec 08             	sub    $0x8,%esp
    1473:	6a 00                	push   $0x0
    1475:	ff 75 0c             	pushl  0xc(%ebp)
    1478:	e8 7e 0f 00 00       	call   23fb <open>
    147d:	83 c4 10             	add    $0x10,%esp
    1480:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1483:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1487:	79 1a                	jns    14a3 <loadBitmap+0x43>
		printf(0, "cannot open %s\n", pic_name);
    1489:	83 ec 04             	sub    $0x4,%esp
    148c:	ff 75 0c             	pushl  0xc(%ebp)
    148f:	68 48 8a 00 00       	push   $0x8a48
    1494:	6a 00                	push   $0x0
    1496:	e8 0c 11 00 00       	call   25a7 <printf>
    149b:	83 c4 10             	add    $0x10,%esp
		return;
    149e:	e9 ca 02 00 00       	jmp    176d <loadBitmap+0x30d>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    14a3:	83 ec 04             	sub    $0x4,%esp
    14a6:	ff 75 0c             	pushl  0xc(%ebp)
    14a9:	68 58 8a 00 00       	push   $0x8a58
    14ae:	6a 00                	push   $0x0
    14b0:	e8 f2 10 00 00       	call   25a7 <printf>
    14b5:	83 c4 10             	add    $0x10,%esp
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    14b8:	83 ec 0c             	sub    $0xc,%esp
    14bb:	6a 0e                	push   $0xe
    14bd:	e8 b9 13 00 00       	call   287b <malloc>
    14c2:	83 c4 10             	add    $0x10,%esp
    14c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    14c8:	83 ec 04             	sub    $0x4,%esp
    14cb:	6a 0e                	push   $0xe
    14cd:	ff 75 e4             	pushl  -0x1c(%ebp)
    14d0:	ff 75 e8             	pushl  -0x18(%ebp)
    14d3:	e8 fb 0e 00 00       	call   23d3 <read>
    14d8:	83 c4 10             	add    $0x10,%esp
    14db:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    14de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    14e4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    14e7:	0f b7 00             	movzwl (%eax),%eax
    14ea:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    14ee:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    14f2:	66 3d 42 4d          	cmp    $0x4d42,%ax
    14f6:	74 17                	je     150f <loadBitmap+0xaf>
		printf(0, "file is not .bmp file!");
    14f8:	83 ec 08             	sub    $0x8,%esp
    14fb:	68 6c 8a 00 00       	push   $0x8a6c
    1500:	6a 00                	push   $0x0
    1502:	e8 a0 10 00 00       	call   25a7 <printf>
    1507:	83 c4 10             	add    $0x10,%esp
		return;
    150a:	e9 5e 02 00 00       	jmp    176d <loadBitmap+0x30d>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    150f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1512:	83 c0 02             	add    $0x2,%eax
    1515:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    1518:	8b 45 d8             	mov    -0x28(%ebp),%eax
    151b:	8b 00                	mov    (%eax),%eax
    151d:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    1520:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1523:	83 c0 06             	add    $0x6,%eax
    1526:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    1529:	8b 45 dc             	mov    -0x24(%ebp),%eax
    152c:	0f b7 00             	movzwl (%eax),%eax
    152f:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    1533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1536:	83 c0 08             	add    $0x8,%eax
    1539:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    153c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    153f:	0f b7 00             	movzwl (%eax),%eax
    1542:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    1546:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1549:	83 c0 0a             	add    $0xa,%eax
    154c:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    154f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1552:	8b 00                	mov    (%eax),%eax
    1554:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    1557:	83 ec 04             	sub    $0x4,%esp
    155a:	6a 28                	push   $0x28
    155c:	8d 45 84             	lea    -0x7c(%ebp),%eax
    155f:	50                   	push   %eax
    1560:	ff 75 e8             	pushl  -0x18(%ebp)
    1563:	e8 6b 0e 00 00       	call   23d3 <read>
    1568:	83 c4 10             	add    $0x10,%esp
	width = bitInfoHead.biWidth;
    156b:	8b 45 88             	mov    -0x78(%ebp),%eax
    156e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    1571:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1574:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    1577:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    157a:	0f af 45 d0          	imul   -0x30(%ebp),%eax
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    157e:	c1 e0 02             	shl    $0x2,%eax
    1581:	83 ec 0c             	sub    $0xc,%esp
    1584:	50                   	push   %eax
    1585:	ff 75 d0             	pushl  -0x30(%ebp)
    1588:	ff 75 d4             	pushl  -0x2c(%ebp)
    158b:	68 84 8a 00 00       	push   $0x8a84
    1590:	6a 00                	push   $0x0
    1592:	e8 10 10 00 00       	call   25a7 <printf>
    1597:	83 c4 20             	add    $0x20,%esp
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    159a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    159e:	75 12                	jne    15b2 <loadBitmap+0x152>
		printf(0, "0");
    15a0:	83 ec 08             	sub    $0x8,%esp
    15a3:	68 a9 8a 00 00       	push   $0x8aa9
    15a8:	6a 00                	push   $0x0
    15aa:	e8 f8 0f 00 00       	call   25a7 <printf>
    15af:	83 c4 10             	add    $0x10,%esp
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    15b2:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    15b6:	0f b7 c0             	movzwl %ax,%eax
    15b9:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    15bd:	83 c0 1f             	add    $0x1f,%eax
    15c0:	8d 50 1f             	lea    0x1f(%eax),%edx
    15c3:	85 c0                	test   %eax,%eax
    15c5:	0f 48 c2             	cmovs  %edx,%eax
    15c8:	c1 f8 05             	sar    $0x5,%eax
    15cb:	c1 e0 02             	shl    $0x2,%eax
    15ce:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    15d1:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15d4:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    15d8:	83 ec 0c             	sub    $0xc,%esp
    15db:	50                   	push   %eax
    15dc:	e8 9a 12 00 00       	call   287b <malloc>
    15e1:	83 c4 10             	add    $0x10,%esp
    15e4:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    15e7:	8b 55 d0             	mov    -0x30(%ebp),%edx
    15ea:	8b 45 cc             	mov    -0x34(%ebp),%eax
    15ed:	0f af c2             	imul   %edx,%eax
    15f0:	83 ec 04             	sub    $0x4,%esp
    15f3:	50                   	push   %eax
    15f4:	6a 00                	push   $0x0
    15f6:	ff 75 c8             	pushl  -0x38(%ebp)
    15f9:	e8 22 0c 00 00       	call   2220 <memset>
    15fe:	83 c4 10             	add    $0x10,%esp
	long nData = height * l_width;
    1601:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1604:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    1608:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    160b:	83 ec 04             	sub    $0x4,%esp
    160e:	ff 75 c4             	pushl  -0x3c(%ebp)
    1611:	ff 75 c8             	pushl  -0x38(%ebp)
    1614:	ff 75 e8             	pushl  -0x18(%ebp)
    1617:	e8 b7 0d 00 00       	call   23d3 <read>
    161c:	83 c4 10             	add    $0x10,%esp

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    161f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1622:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    1626:	c1 e0 02             	shl    $0x2,%eax
    1629:	83 ec 0c             	sub    $0xc,%esp
    162c:	50                   	push   %eax
    162d:	e8 49 12 00 00       	call   287b <malloc>
    1632:	83 c4 10             	add    $0x10,%esp
    1635:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    1638:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    163b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    163e:	0f af c2             	imul   %edx,%eax
    1641:	c1 e0 02             	shl    $0x2,%eax
    1644:	83 ec 04             	sub    $0x4,%esp
    1647:	50                   	push   %eax
    1648:	6a 00                	push   $0x0
    164a:	ff 75 c0             	pushl  -0x40(%ebp)
    164d:	e8 ce 0b 00 00       	call   2220 <memset>
    1652:	83 c4 10             	add    $0x10,%esp
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    1655:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    1659:	66 83 f8 17          	cmp    $0x17,%ax
    165d:	77 17                	ja     1676 <loadBitmap+0x216>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    165f:	83 ec 08             	sub    $0x8,%esp
    1662:	68 ac 8a 00 00       	push   $0x8aac
    1667:	6a 00                	push   $0x0
    1669:	e8 39 0f 00 00       	call   25a7 <printf>
    166e:	83 c4 10             	add    $0x10,%esp
		return;
    1671:	e9 f7 00 00 00       	jmp    176d <loadBitmap+0x30d>
	} else	//位图为24位真彩色
	{
		index = 0;
    1676:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    167d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1684:	e9 94 00 00 00       	jmp    171d <loadBitmap+0x2bd>
			for (j = 0; j < width; j++) {
    1689:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1690:	eb 7b                	jmp    170d <loadBitmap+0x2ad>
				k = i * l_width + j * 3;
    1692:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1695:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    1699:	89 c1                	mov    %eax,%ecx
    169b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    169e:	89 d0                	mov    %edx,%eax
    16a0:	01 c0                	add    %eax,%eax
    16a2:	01 d0                	add    %edx,%eax
    16a4:	01 c8                	add    %ecx,%eax
    16a6:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    16a9:	8b 45 bc             	mov    -0x44(%ebp),%eax
    16ac:	8d 50 02             	lea    0x2(%eax),%edx
    16af:	8b 45 c8             	mov    -0x38(%ebp),%eax
    16b2:	01 d0                	add    %edx,%eax
    16b4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    16b7:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
    16be:	8b 55 c0             	mov    -0x40(%ebp),%edx
    16c1:	01 ca                	add    %ecx,%edx
    16c3:	0f b6 00             	movzbl (%eax),%eax
    16c6:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    16c9:	8b 45 bc             	mov    -0x44(%ebp),%eax
    16cc:	8d 50 01             	lea    0x1(%eax),%edx
    16cf:	8b 45 c8             	mov    -0x38(%ebp),%eax
    16d2:	01 d0                	add    %edx,%eax
    16d4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    16d7:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
    16de:	8b 55 c0             	mov    -0x40(%ebp),%edx
    16e1:	01 ca                	add    %ecx,%edx
    16e3:	0f b6 00             	movzbl (%eax),%eax
    16e6:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    16e9:	8b 55 bc             	mov    -0x44(%ebp),%edx
    16ec:	8b 45 c8             	mov    -0x38(%ebp),%eax
    16ef:	01 d0                	add    %edx,%eax
    16f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    16f4:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
    16fb:	8b 55 c0             	mov    -0x40(%ebp),%edx
    16fe:	01 ca                	add    %ecx,%edx
    1700:	0f b6 00             	movzbl (%eax),%eax
    1703:	88 02                	mov    %al,(%edx)
				index++;
    1705:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
			for (j = 0; j < width; j++) {
    1709:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    170d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1710:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    1713:	0f 8c 79 ff ff ff    	jl     1692 <loadBitmap+0x232>
		for (i = 0; i < height; i++)
    1719:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    171d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1720:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    1723:	0f 8c 60 ff ff ff    	jl     1689 <loadBitmap+0x229>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    1729:	83 ec 0c             	sub    $0xc,%esp
    172c:	ff 75 e8             	pushl  -0x18(%ebp)
    172f:	e8 af 0c 00 00       	call   23e3 <close>
    1734:	83 c4 10             	add    $0x10,%esp

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    1737:	8b 45 08             	mov    0x8(%ebp),%eax
    173a:	8b 55 c0             	mov    -0x40(%ebp),%edx
    173d:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    173f:	8b 45 08             	mov    0x8(%ebp),%eax
    1742:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1745:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    1748:	8b 45 08             	mov    0x8(%ebp),%eax
    174b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    174e:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    1751:	83 ec 0c             	sub    $0xc,%esp
    1754:	ff 75 c8             	pushl  -0x38(%ebp)
    1757:	e8 dd 0f 00 00       	call   2739 <free>
    175c:	83 c4 10             	add    $0x10,%esp
	free(BmpFileHeader);
    175f:	83 ec 0c             	sub    $0xc,%esp
    1762:	ff 75 e4             	pushl  -0x1c(%ebp)
    1765:	e8 cf 0f 00 00       	call   2739 <free>
    176a:	83 c4 10             	add    $0x10,%esp
	//printf("\n");
}
    176d:	c9                   	leave  
    176e:	c3                   	ret    

0000176f <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    176f:	55                   	push   %ebp
    1770:	89 e5                	mov    %esp,%ebp
    1772:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图文件头:\n");
    1775:	83 ec 08             	sub    $0x8,%esp
    1778:	68 cc 8a 00 00       	push   $0x8acc
    177d:	6a 00                	push   $0x0
    177f:	e8 23 0e 00 00       	call   25a7 <printf>
    1784:	83 c4 10             	add    $0x10,%esp
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    1787:	8b 45 08             	mov    0x8(%ebp),%eax
    178a:	0f b7 00             	movzwl (%eax),%eax
    178d:	0f b7 c0             	movzwl %ax,%eax
    1790:	83 ec 04             	sub    $0x4,%esp
    1793:	50                   	push   %eax
    1794:	68 de 8a 00 00       	push   $0x8ade
    1799:	6a 00                	push   $0x0
    179b:	e8 07 0e 00 00       	call   25a7 <printf>
    17a0:	83 c4 10             	add    $0x10,%esp
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    17a3:	8b 45 08             	mov    0x8(%ebp),%eax
    17a6:	8b 40 04             	mov    0x4(%eax),%eax
    17a9:	83 ec 04             	sub    $0x4,%esp
    17ac:	50                   	push   %eax
    17ad:	68 fc 8a 00 00       	push   $0x8afc
    17b2:	6a 00                	push   $0x0
    17b4:	e8 ee 0d 00 00       	call   25a7 <printf>
    17b9:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    17bc:	8b 45 08             	mov    0x8(%ebp),%eax
    17bf:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    17c3:	0f b7 c0             	movzwl %ax,%eax
    17c6:	83 ec 04             	sub    $0x4,%esp
    17c9:	50                   	push   %eax
    17ca:	68 0d 8b 00 00       	push   $0x8b0d
    17cf:	6a 00                	push   $0x0
    17d1:	e8 d1 0d 00 00       	call   25a7 <printf>
    17d6:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    17d9:	8b 45 08             	mov    0x8(%ebp),%eax
    17dc:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    17e0:	0f b7 c0             	movzwl %ax,%eax
    17e3:	83 ec 04             	sub    $0x4,%esp
    17e6:	50                   	push   %eax
    17e7:	68 0d 8b 00 00       	push   $0x8b0d
    17ec:	6a 00                	push   $0x0
    17ee:	e8 b4 0d 00 00       	call   25a7 <printf>
    17f3:	83 c4 10             	add    $0x10,%esp
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    17f6:	8b 45 08             	mov    0x8(%ebp),%eax
    17f9:	8b 40 0c             	mov    0xc(%eax),%eax
    17fc:	83 ec 04             	sub    $0x4,%esp
    17ff:	50                   	push   %eax
    1800:	68 1c 8b 00 00       	push   $0x8b1c
    1805:	6a 00                	push   $0x0
    1807:	e8 9b 0d 00 00       	call   25a7 <printf>
    180c:	83 c4 10             	add    $0x10,%esp
}
    180f:	90                   	nop
    1810:	c9                   	leave  
    1811:	c3                   	ret    

00001812 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    1812:	55                   	push   %ebp
    1813:	89 e5                	mov    %esp,%ebp
    1815:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图信息头:\n");
    1818:	83 ec 08             	sub    $0x8,%esp
    181b:	68 45 8b 00 00       	push   $0x8b45
    1820:	6a 00                	push   $0x0
    1822:	e8 80 0d 00 00       	call   25a7 <printf>
    1827:	83 c4 10             	add    $0x10,%esp
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    182a:	8b 45 08             	mov    0x8(%ebp),%eax
    182d:	8b 00                	mov    (%eax),%eax
    182f:	83 ec 04             	sub    $0x4,%esp
    1832:	50                   	push   %eax
    1833:	68 57 8b 00 00       	push   $0x8b57
    1838:	6a 00                	push   $0x0
    183a:	e8 68 0d 00 00       	call   25a7 <printf>
    183f:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    1842:	8b 45 08             	mov    0x8(%ebp),%eax
    1845:	8b 40 04             	mov    0x4(%eax),%eax
    1848:	83 ec 04             	sub    $0x4,%esp
    184b:	50                   	push   %eax
    184c:	68 6e 8b 00 00       	push   $0x8b6e
    1851:	6a 00                	push   $0x0
    1853:	e8 4f 0d 00 00       	call   25a7 <printf>
    1858:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    185b:	8b 45 08             	mov    0x8(%ebp),%eax
    185e:	8b 40 08             	mov    0x8(%eax),%eax
    1861:	83 ec 04             	sub    $0x4,%esp
    1864:	50                   	push   %eax
    1865:	68 7c 8b 00 00       	push   $0x8b7c
    186a:	6a 00                	push   $0x0
    186c:	e8 36 0d 00 00       	call   25a7 <printf>
    1871:	83 c4 10             	add    $0x10,%esp
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    1874:	8b 45 08             	mov    0x8(%ebp),%eax
    1877:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    187b:	0f b7 c0             	movzwl %ax,%eax
    187e:	83 ec 04             	sub    $0x4,%esp
    1881:	50                   	push   %eax
    1882:	68 8a 8b 00 00       	push   $0x8b8a
    1887:	6a 00                	push   $0x0
    1889:	e8 19 0d 00 00       	call   25a7 <printf>
    188e:	83 c4 10             	add    $0x10,%esp
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    1891:	8b 45 08             	mov    0x8(%ebp),%eax
    1894:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    1898:	0f b7 c0             	movzwl %ax,%eax
    189b:	83 ec 04             	sub    $0x4,%esp
    189e:	50                   	push   %eax
    189f:	68 a0 8b 00 00       	push   $0x8ba0
    18a4:	6a 00                	push   $0x0
    18a6:	e8 fc 0c 00 00       	call   25a7 <printf>
    18ab:	83 c4 10             	add    $0x10,%esp
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    18ae:	8b 45 08             	mov    0x8(%ebp),%eax
    18b1:	8b 40 10             	mov    0x10(%eax),%eax
    18b4:	83 ec 04             	sub    $0x4,%esp
    18b7:	50                   	push   %eax
    18b8:	68 c1 8b 00 00       	push   $0x8bc1
    18bd:	6a 00                	push   $0x0
    18bf:	e8 e3 0c 00 00       	call   25a7 <printf>
    18c4:	83 c4 10             	add    $0x10,%esp
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    18c7:	8b 45 08             	mov    0x8(%ebp),%eax
    18ca:	8b 40 14             	mov    0x14(%eax),%eax
    18cd:	83 ec 04             	sub    $0x4,%esp
    18d0:	50                   	push   %eax
    18d1:	68 d4 8b 00 00       	push   $0x8bd4
    18d6:	6a 00                	push   $0x0
    18d8:	e8 ca 0c 00 00       	call   25a7 <printf>
    18dd:	83 c4 10             	add    $0x10,%esp
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    18e0:	8b 45 08             	mov    0x8(%ebp),%eax
    18e3:	8b 40 18             	mov    0x18(%eax),%eax
    18e6:	83 ec 04             	sub    $0x4,%esp
    18e9:	50                   	push   %eax
    18ea:	68 08 8c 00 00       	push   $0x8c08
    18ef:	6a 00                	push   $0x0
    18f1:	e8 b1 0c 00 00       	call   25a7 <printf>
    18f6:	83 c4 10             	add    $0x10,%esp
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    18f9:	8b 45 08             	mov    0x8(%ebp),%eax
    18fc:	8b 40 1c             	mov    0x1c(%eax),%eax
    18ff:	83 ec 04             	sub    $0x4,%esp
    1902:	50                   	push   %eax
    1903:	68 1d 8c 00 00       	push   $0x8c1d
    1908:	6a 00                	push   $0x0
    190a:	e8 98 0c 00 00       	call   25a7 <printf>
    190f:	83 c4 10             	add    $0x10,%esp
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    1912:	8b 45 08             	mov    0x8(%ebp),%eax
    1915:	8b 40 20             	mov    0x20(%eax),%eax
    1918:	83 ec 04             	sub    $0x4,%esp
    191b:	50                   	push   %eax
    191c:	68 32 8c 00 00       	push   $0x8c32
    1921:	6a 00                	push   $0x0
    1923:	e8 7f 0c 00 00       	call   25a7 <printf>
    1928:	83 c4 10             	add    $0x10,%esp
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    192b:	8b 45 08             	mov    0x8(%ebp),%eax
    192e:	8b 40 24             	mov    0x24(%eax),%eax
    1931:	83 ec 04             	sub    $0x4,%esp
    1934:	50                   	push   %eax
    1935:	68 49 8c 00 00       	push   $0x8c49
    193a:	6a 00                	push   $0x0
    193c:	e8 66 0c 00 00       	call   25a7 <printf>
    1941:	83 c4 10             	add    $0x10,%esp
}
    1944:	90                   	nop
    1945:	c9                   	leave  
    1946:	c3                   	ret    

00001947 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    1947:	55                   	push   %ebp
    1948:	89 e5                	mov    %esp,%ebp
    194a:	83 ec 08             	sub    $0x8,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    194d:	8b 45 08             	mov    0x8(%ebp),%eax
    1950:	0f b6 00             	movzbl (%eax),%eax
    1953:	0f b6 c8             	movzbl %al,%ecx
    1956:	8b 45 08             	mov    0x8(%ebp),%eax
    1959:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    195d:	0f b6 d0             	movzbl %al,%edx
    1960:	8b 45 08             	mov    0x8(%ebp),%eax
    1963:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    1967:	0f b6 c0             	movzbl %al,%eax
    196a:	83 ec 0c             	sub    $0xc,%esp
    196d:	51                   	push   %ecx
    196e:	52                   	push   %edx
    196f:	50                   	push   %eax
    1970:	68 5d 8c 00 00       	push   $0x8c5d
    1975:	6a 00                	push   $0x0
    1977:	e8 2b 0c 00 00       	call   25a7 <printf>
    197c:	83 c4 20             	add    $0x20,%esp
}
    197f:	90                   	nop
    1980:	c9                   	leave  
    1981:	c3                   	ret    

00001982 <freepic>:

void freepic(PICNODE *pic) {
    1982:	55                   	push   %ebp
    1983:	89 e5                	mov    %esp,%ebp
    1985:	83 ec 08             	sub    $0x8,%esp
	free(pic->data);
    1988:	8b 45 08             	mov    0x8(%ebp),%eax
    198b:	8b 00                	mov    (%eax),%eax
    198d:	83 ec 0c             	sub    $0xc,%esp
    1990:	50                   	push   %eax
    1991:	e8 a3 0d 00 00       	call   2739 <free>
    1996:	83 c4 10             	add    $0x10,%esp
}
    1999:	90                   	nop
    199a:	c9                   	leave  
    199b:	c3                   	ret    

0000199c <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    199c:	55                   	push   %ebp
    199d:	89 e5                	mov    %esp,%ebp
    199f:	83 ec 68             	sub    $0x68,%esp
	int W = 15;
    19a2:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    19a9:	8d 45 dc             	lea    -0x24(%ebp),%eax
    19ac:	83 ec 0c             	sub    $0xc,%esp
    19af:	ff 75 ec             	pushl  -0x14(%ebp)
    19b2:	ff 75 ec             	pushl  -0x14(%ebp)
    19b5:	6a 00                	push   $0x0
    19b7:	6a 00                	push   $0x0
    19b9:	50                   	push   %eax
    19ba:	e8 03 02 00 00       	call   1bc2 <initRect>
    19bf:	83 c4 1c             	add    $0x1c,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    19c2:	8b 45 08             	mov    0x8(%ebp),%eax
    19c5:	8b 40 04             	mov    0x4(%eax),%eax
    19c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
    19cb:	89 c2                	mov    %eax,%edx
    19cd:	8d 45 cc             	lea    -0x34(%ebp),%eax
    19d0:	83 ec 0c             	sub    $0xc,%esp
    19d3:	ff 75 ec             	pushl  -0x14(%ebp)
    19d6:	ff 75 ec             	pushl  -0x14(%ebp)
    19d9:	6a 00                	push   $0x0
    19db:	52                   	push   %edx
    19dc:	50                   	push   %eax
    19dd:	e8 e0 01 00 00       	call   1bc2 <initRect>
    19e2:	83 c4 1c             	add    $0x1c,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    19e5:	8b 45 08             	mov    0x8(%ebp),%eax
    19e8:	8b 40 08             	mov    0x8(%eax),%eax
    19eb:	2b 45 ec             	sub    -0x14(%ebp),%eax
    19ee:	89 c1                	mov    %eax,%ecx
    19f0:	8b 45 08             	mov    0x8(%ebp),%eax
    19f3:	8b 40 04             	mov    0x4(%eax),%eax
    19f6:	2b 45 ec             	sub    -0x14(%ebp),%eax
    19f9:	89 c2                	mov    %eax,%edx
    19fb:	8d 45 bc             	lea    -0x44(%ebp),%eax
    19fe:	83 ec 0c             	sub    $0xc,%esp
    1a01:	ff 75 ec             	pushl  -0x14(%ebp)
    1a04:	ff 75 ec             	pushl  -0x14(%ebp)
    1a07:	51                   	push   %ecx
    1a08:	52                   	push   %edx
    1a09:	50                   	push   %eax
    1a0a:	e8 b3 01 00 00       	call   1bc2 <initRect>
    1a0f:	83 c4 1c             	add    $0x1c,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    1a12:	8b 45 08             	mov    0x8(%ebp),%eax
    1a15:	8b 40 08             	mov    0x8(%eax),%eax
    1a18:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1a1b:	89 c2                	mov    %eax,%edx
    1a1d:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1a20:	83 ec 0c             	sub    $0xc,%esp
    1a23:	ff 75 ec             	pushl  -0x14(%ebp)
    1a26:	ff 75 ec             	pushl  -0x14(%ebp)
    1a29:	52                   	push   %edx
    1a2a:	6a 00                	push   $0x0
    1a2c:	50                   	push   %eax
    1a2d:	e8 90 01 00 00       	call   1bc2 <initRect>
    1a32:	83 c4 1c             	add    $0x1c,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    1a35:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1a3c:	e9 47 01 00 00       	jmp    1b88 <set_icon_alpha+0x1ec>
		for (j = 0; j < pic->height; j++) {
    1a41:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1a48:	e9 28 01 00 00       	jmp    1b75 <set_icon_alpha+0x1d9>
			p = initPoint(i, j);
    1a4d:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    1a50:	83 ec 04             	sub    $0x4,%esp
    1a53:	ff 75 f0             	pushl  -0x10(%ebp)
    1a56:	ff 75 f4             	pushl  -0xc(%ebp)
    1a59:	50                   	push   %eax
    1a5a:	e8 3c 01 00 00       	call   1b9b <initPoint>
    1a5f:	83 c4 0c             	add    $0xc,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    1a62:	83 ec 08             	sub    $0x8,%esp
    1a65:	ff 75 e8             	pushl  -0x18(%ebp)
    1a68:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a6b:	ff 75 e0             	pushl  -0x20(%ebp)
    1a6e:	ff 75 dc             	pushl  -0x24(%ebp)
    1a71:	ff 75 a8             	pushl  -0x58(%ebp)
    1a74:	ff 75 a4             	pushl  -0x5c(%ebp)
    1a77:	e8 97 01 00 00       	call   1c13 <isIn>
    1a7c:	83 c4 20             	add    $0x20,%esp
    1a7f:	85 c0                	test   %eax,%eax
    1a81:	75 67                	jne    1aea <set_icon_alpha+0x14e>
    1a83:	83 ec 08             	sub    $0x8,%esp
    1a86:	ff 75 d8             	pushl  -0x28(%ebp)
    1a89:	ff 75 d4             	pushl  -0x2c(%ebp)
    1a8c:	ff 75 d0             	pushl  -0x30(%ebp)
    1a8f:	ff 75 cc             	pushl  -0x34(%ebp)
    1a92:	ff 75 a8             	pushl  -0x58(%ebp)
    1a95:	ff 75 a4             	pushl  -0x5c(%ebp)
    1a98:	e8 76 01 00 00       	call   1c13 <isIn>
    1a9d:	83 c4 20             	add    $0x20,%esp
    1aa0:	85 c0                	test   %eax,%eax
    1aa2:	75 46                	jne    1aea <set_icon_alpha+0x14e>
    1aa4:	83 ec 08             	sub    $0x8,%esp
    1aa7:	ff 75 c8             	pushl  -0x38(%ebp)
    1aaa:	ff 75 c4             	pushl  -0x3c(%ebp)
    1aad:	ff 75 c0             	pushl  -0x40(%ebp)
    1ab0:	ff 75 bc             	pushl  -0x44(%ebp)
    1ab3:	ff 75 a8             	pushl  -0x58(%ebp)
    1ab6:	ff 75 a4             	pushl  -0x5c(%ebp)
    1ab9:	e8 55 01 00 00       	call   1c13 <isIn>
    1abe:	83 c4 20             	add    $0x20,%esp
    1ac1:	85 c0                	test   %eax,%eax
    1ac3:	75 25                	jne    1aea <set_icon_alpha+0x14e>
    1ac5:	83 ec 08             	sub    $0x8,%esp
    1ac8:	ff 75 b8             	pushl  -0x48(%ebp)
    1acb:	ff 75 b4             	pushl  -0x4c(%ebp)
    1ace:	ff 75 b0             	pushl  -0x50(%ebp)
    1ad1:	ff 75 ac             	pushl  -0x54(%ebp)
    1ad4:	ff 75 a8             	pushl  -0x58(%ebp)
    1ad7:	ff 75 a4             	pushl  -0x5c(%ebp)
    1ada:	e8 34 01 00 00       	call   1c13 <isIn>
    1adf:	83 c4 20             	add    $0x20,%esp
    1ae2:	85 c0                	test   %eax,%eax
    1ae4:	0f 84 87 00 00 00    	je     1b71 <set_icon_alpha+0x1d5>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    1aea:	8b 45 08             	mov    0x8(%ebp),%eax
    1aed:	8b 10                	mov    (%eax),%edx
    1aef:	8b 45 08             	mov    0x8(%ebp),%eax
    1af2:	8b 40 04             	mov    0x4(%eax),%eax
    1af5:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    1af9:	89 c1                	mov    %eax,%ecx
    1afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1afe:	01 c8                	add    %ecx,%eax
    1b00:	c1 e0 02             	shl    $0x2,%eax
    1b03:	01 d0                	add    %edx,%eax
    1b05:	0f b6 00             	movzbl (%eax),%eax
    1b08:	3c ff                	cmp    $0xff,%al
    1b0a:	75 65                	jne    1b71 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    1b0c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0f:	8b 10                	mov    (%eax),%edx
    1b11:	8b 45 08             	mov    0x8(%ebp),%eax
    1b14:	8b 40 04             	mov    0x4(%eax),%eax
    1b17:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    1b1b:	89 c1                	mov    %eax,%ecx
    1b1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b20:	01 c8                	add    %ecx,%eax
    1b22:	c1 e0 02             	shl    $0x2,%eax
    1b25:	01 d0                	add    %edx,%eax
    1b27:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    1b2b:	3c ff                	cmp    $0xff,%al
    1b2d:	75 42                	jne    1b71 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    1b2f:	8b 45 08             	mov    0x8(%ebp),%eax
    1b32:	8b 10                	mov    (%eax),%edx
    1b34:	8b 45 08             	mov    0x8(%ebp),%eax
    1b37:	8b 40 04             	mov    0x4(%eax),%eax
    1b3a:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    1b3e:	89 c1                	mov    %eax,%ecx
    1b40:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b43:	01 c8                	add    %ecx,%eax
    1b45:	c1 e0 02             	shl    $0x2,%eax
    1b48:	01 d0                	add    %edx,%eax
    1b4a:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    1b4e:	3c ff                	cmp    $0xff,%al
    1b50:	75 1f                	jne    1b71 <set_icon_alpha+0x1d5>
					pic->data[j * pic->width + i].rgbReserved = 1;
    1b52:	8b 45 08             	mov    0x8(%ebp),%eax
    1b55:	8b 10                	mov    (%eax),%edx
    1b57:	8b 45 08             	mov    0x8(%ebp),%eax
    1b5a:	8b 40 04             	mov    0x4(%eax),%eax
    1b5d:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    1b61:	89 c1                	mov    %eax,%ecx
    1b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b66:	01 c8                	add    %ecx,%eax
    1b68:	c1 e0 02             	shl    $0x2,%eax
    1b6b:	01 d0                	add    %edx,%eax
    1b6d:	c6 40 03 01          	movb   $0x1,0x3(%eax)
		for (j = 0; j < pic->height; j++) {
    1b71:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1b75:	8b 45 08             	mov    0x8(%ebp),%eax
    1b78:	8b 40 08             	mov    0x8(%eax),%eax
    1b7b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    1b7e:	0f 8c c9 fe ff ff    	jl     1a4d <set_icon_alpha+0xb1>
	for (i = 0; i < pic->width; i++) {
    1b84:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1b88:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8b:	8b 40 04             	mov    0x4(%eax),%eax
    1b8e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1b91:	0f 8c aa fe ff ff    	jl     1a41 <set_icon_alpha+0xa5>
				}
			}
		}
	}
}
    1b97:	90                   	nop
    1b98:	90                   	nop
    1b99:	c9                   	leave  
    1b9a:	c3                   	ret    

00001b9b <initPoint>:
#include "finder.h"

int isSearching;
int renaming;
Point initPoint(int x, int y)
{
    1b9b:	55                   	push   %ebp
    1b9c:	89 e5                	mov    %esp,%ebp
    1b9e:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    1ba1:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ba4:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    1ba7:	8b 45 10             	mov    0x10(%ebp),%eax
    1baa:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    1bad:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1bb0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1bb3:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1bb6:	89 01                	mov    %eax,(%ecx)
    1bb8:	89 51 04             	mov    %edx,0x4(%ecx)
}
    1bbb:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbe:	c9                   	leave  
    1bbf:	c2 04 00             	ret    $0x4

00001bc2 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    1bc2:	55                   	push   %ebp
    1bc3:	89 e5                	mov    %esp,%ebp
    1bc5:	83 ec 18             	sub    $0x18,%esp
	Rect r;
	r.start = initPoint(x, y);
    1bc8:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1bcb:	ff 75 10             	pushl  0x10(%ebp)
    1bce:	ff 75 0c             	pushl  0xc(%ebp)
    1bd1:	50                   	push   %eax
    1bd2:	e8 c4 ff ff ff       	call   1b9b <initPoint>
    1bd7:	83 c4 08             	add    $0x8,%esp
    1bda:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1bdd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1be0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1be3:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    1be6:	8b 45 14             	mov    0x14(%ebp),%eax
    1be9:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    1bec:	8b 45 18             	mov    0x18(%ebp),%eax
    1bef:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    1bf2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1bf8:	89 10                	mov    %edx,(%eax)
    1bfa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bfd:	89 50 04             	mov    %edx,0x4(%eax)
    1c00:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1c03:	89 50 08             	mov    %edx,0x8(%eax)
    1c06:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1c09:	89 50 0c             	mov    %edx,0xc(%eax)
}
    1c0c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0f:	c9                   	leave  
    1c10:	c2 04 00             	ret    $0x4

00001c13 <isIn>:

int isIn(Point p, Rect r)
{
    1c13:	55                   	push   %ebp
    1c14:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    1c16:	8b 55 08             	mov    0x8(%ebp),%edx
    1c19:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    1c1c:	39 c2                	cmp    %eax,%edx
    1c1e:	7c 2f                	jl     1c4f <isIn+0x3c>
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    1c20:	8b 45 08             	mov    0x8(%ebp),%eax
    1c23:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1c26:	8b 55 18             	mov    0x18(%ebp),%edx
    1c29:	01 ca                	add    %ecx,%edx
    1c2b:	39 d0                	cmp    %edx,%eax
    1c2d:	7d 20                	jge    1c4f <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    1c2f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c32:	8b 45 14             	mov    0x14(%ebp),%eax
    1c35:	39 c2                	cmp    %eax,%edx
    1c37:	7c 16                	jl     1c4f <isIn+0x3c>
    1c39:	8b 45 0c             	mov    0xc(%ebp),%eax
    1c3c:	8b 4d 14             	mov    0x14(%ebp),%ecx
    1c3f:	8b 55 1c             	mov    0x1c(%ebp),%edx
    1c42:	01 ca                	add    %ecx,%edx
    1c44:	39 d0                	cmp    %edx,%eax
    1c46:	7d 07                	jge    1c4f <isIn+0x3c>
    1c48:	b8 01 00 00 00       	mov    $0x1,%eax
    1c4d:	eb 05                	jmp    1c54 <isIn+0x41>
    1c4f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1c54:	5d                   	pop    %ebp
    1c55:	c3                   	ret    

00001c56 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    1c56:	55                   	push   %ebp
    1c57:	89 e5                	mov    %esp,%ebp
    1c59:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    1c5c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    1c63:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    1c6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    1c71:	8b 45 10             	mov    0x10(%ebp),%eax
    1c74:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    1c77:	8b 45 14             	mov    0x14(%ebp),%eax
    1c7a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    1c7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c80:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1c83:	89 10                	mov    %edx,(%eax)
    1c85:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1c88:	89 50 04             	mov    %edx,0x4(%eax)
    1c8b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c8e:	89 50 08             	mov    %edx,0x8(%eax)
    1c91:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1c94:	89 50 0c             	mov    %edx,0xc(%eax)
    1c97:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1c9a:	89 50 10             	mov    %edx,0x10(%eax)
}
    1c9d:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca0:	c9                   	leave  
    1ca1:	c2 04 00             	ret    $0x4

00001ca4 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    1ca4:	55                   	push   %ebp
    1ca5:	89 e5                	mov    %esp,%ebp
    1ca7:	83 ec 08             	sub    $0x8,%esp
	switch (MsgType)
    1caa:	83 7d 1c 04          	cmpl   $0x4,0x1c(%ebp)
    1cae:	74 14                	je     1cc4 <createClickable+0x20>
    1cb0:	83 7d 1c 04          	cmpl   $0x4,0x1c(%ebp)
    1cb4:	7f 74                	jg     1d2a <createClickable+0x86>
    1cb6:	83 7d 1c 02          	cmpl   $0x2,0x1c(%ebp)
    1cba:	74 2b                	je     1ce7 <createClickable+0x43>
    1cbc:	83 7d 1c 03          	cmpl   $0x3,0x1c(%ebp)
    1cc0:	74 45                	je     1d07 <createClickable+0x63>
    1cc2:	eb 66                	jmp    1d2a <createClickable+0x86>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    1cc4:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc7:	83 c0 04             	add    $0x4,%eax
    1cca:	83 ec 08             	sub    $0x8,%esp
    1ccd:	ff 75 20             	pushl  0x20(%ebp)
    1cd0:	ff 75 18             	pushl  0x18(%ebp)
    1cd3:	ff 75 14             	pushl  0x14(%ebp)
    1cd6:	ff 75 10             	pushl  0x10(%ebp)
    1cd9:	ff 75 0c             	pushl  0xc(%ebp)
    1cdc:	50                   	push   %eax
    1cdd:	e8 5e 00 00 00       	call   1d40 <addClickable>
    1ce2:	83 c4 20             	add    $0x20,%esp
	        break;
    1ce5:	eb 56                	jmp    1d3d <createClickable+0x99>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    1ce7:	8b 45 08             	mov    0x8(%ebp),%eax
    1cea:	83 ec 08             	sub    $0x8,%esp
    1ced:	ff 75 20             	pushl  0x20(%ebp)
    1cf0:	ff 75 18             	pushl  0x18(%ebp)
    1cf3:	ff 75 14             	pushl  0x14(%ebp)
    1cf6:	ff 75 10             	pushl  0x10(%ebp)
    1cf9:	ff 75 0c             	pushl  0xc(%ebp)
    1cfc:	50                   	push   %eax
    1cfd:	e8 3e 00 00 00       	call   1d40 <addClickable>
    1d02:	83 c4 20             	add    $0x20,%esp
	    	break;
    1d05:	eb 36                	jmp    1d3d <createClickable+0x99>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    1d07:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0a:	83 c0 08             	add    $0x8,%eax
    1d0d:	83 ec 08             	sub    $0x8,%esp
    1d10:	ff 75 20             	pushl  0x20(%ebp)
    1d13:	ff 75 18             	pushl  0x18(%ebp)
    1d16:	ff 75 14             	pushl  0x14(%ebp)
    1d19:	ff 75 10             	pushl  0x10(%ebp)
    1d1c:	ff 75 0c             	pushl  0xc(%ebp)
    1d1f:	50                   	push   %eax
    1d20:	e8 1b 00 00 00       	call   1d40 <addClickable>
    1d25:	83 c4 20             	add    $0x20,%esp
	    	break;
    1d28:	eb 13                	jmp    1d3d <createClickable+0x99>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    1d2a:	83 ec 08             	sub    $0x8,%esp
    1d2d:	68 6c 8c 00 00       	push   $0x8c6c
    1d32:	6a 00                	push   $0x0
    1d34:	e8 6e 08 00 00       	call   25a7 <printf>
    1d39:	83 c4 10             	add    $0x10,%esp
	    	break;
    1d3c:	90                   	nop
	}
}
    1d3d:	90                   	nop
    1d3e:	c9                   	leave  
    1d3f:	c3                   	ret    

00001d40 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    1d40:	55                   	push   %ebp
    1d41:	89 e5                	mov    %esp,%ebp
    1d43:	83 ec 18             	sub    $0x18,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    1d46:	83 ec 0c             	sub    $0xc,%esp
    1d49:	6a 18                	push   $0x18
    1d4b:	e8 2b 0b 00 00       	call   287b <malloc>
    1d50:	83 c4 10             	add    $0x10,%esp
    1d53:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    1d56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d59:	8b 55 0c             	mov    0xc(%ebp),%edx
    1d5c:	89 10                	mov    %edx,(%eax)
    1d5e:	8b 55 10             	mov    0x10(%ebp),%edx
    1d61:	89 50 04             	mov    %edx,0x4(%eax)
    1d64:	8b 55 14             	mov    0x14(%ebp),%edx
    1d67:	89 50 08             	mov    %edx,0x8(%eax)
    1d6a:	8b 55 18             	mov    0x18(%ebp),%edx
    1d6d:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    1d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d73:	8b 55 1c             	mov    0x1c(%ebp),%edx
    1d76:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    1d79:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7c:	8b 10                	mov    (%eax),%edx
    1d7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d81:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    1d84:	8b 45 08             	mov    0x8(%ebp),%eax
    1d87:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1d8a:	89 10                	mov    %edx,(%eax)
}
    1d8c:	90                   	nop
    1d8d:	c9                   	leave  
    1d8e:	c3                   	ret    

00001d8f <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    1d8f:	55                   	push   %ebp
    1d90:	89 e5                	mov    %esp,%ebp
    1d92:	83 ec 18             	sub    $0x18,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    1d95:	8b 45 08             	mov    0x8(%ebp),%eax
    1d98:	8b 00                	mov    (%eax),%eax
    1d9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1d9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1da0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    1da3:	e9 ad 00 00 00       	jmp    1e55 <deleteClickable+0xc6>
	{
		if (isIn(cur->area.start, region))
    1da8:	ff 75 18             	pushl  0x18(%ebp)
    1dab:	ff 75 14             	pushl  0x14(%ebp)
    1dae:	ff 75 10             	pushl  0x10(%ebp)
    1db1:	ff 75 0c             	pushl  0xc(%ebp)
    1db4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1db7:	ff 70 04             	pushl  0x4(%eax)
    1dba:	ff 30                	pushl  (%eax)
    1dbc:	e8 52 fe ff ff       	call   1c13 <isIn>
    1dc1:	83 c4 18             	add    $0x18,%esp
    1dc4:	85 c0                	test   %eax,%eax
    1dc6:	74 66                	je     1e2e <deleteClickable+0x9f>
		{
			//如果当前指针指向头部
			if (cur == *head)
    1dc8:	8b 45 08             	mov    0x8(%ebp),%eax
    1dcb:	8b 00                	mov    (%eax),%eax
    1dcd:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    1dd0:	75 31                	jne    1e03 <deleteClickable+0x74>
			{
				//删除头节点
				temp = *head;
    1dd2:	8b 45 08             	mov    0x8(%ebp),%eax
    1dd5:	8b 00                	mov    (%eax),%eax
    1dd7:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    1dda:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ddd:	8b 50 14             	mov    0x14(%eax),%edx
    1de0:	8b 45 08             	mov    0x8(%ebp),%eax
    1de3:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    1de5:	8b 45 08             	mov    0x8(%ebp),%eax
    1de8:	8b 00                	mov    (%eax),%eax
    1dea:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1ded:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1df0:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    1df3:	83 ec 0c             	sub    $0xc,%esp
    1df6:	ff 75 ec             	pushl  -0x14(%ebp)
    1df9:	e8 3b 09 00 00       	call   2739 <free>
    1dfe:	83 c4 10             	add    $0x10,%esp
    1e01:	eb 52                	jmp    1e55 <deleteClickable+0xc6>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    1e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e06:	8b 50 14             	mov    0x14(%eax),%edx
    1e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e0c:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    1e0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e12:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    1e15:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e18:	8b 40 14             	mov    0x14(%eax),%eax
    1e1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    1e1e:	83 ec 0c             	sub    $0xc,%esp
    1e21:	ff 75 ec             	pushl  -0x14(%ebp)
    1e24:	e8 10 09 00 00       	call   2739 <free>
    1e29:	83 c4 10             	add    $0x10,%esp
    1e2c:	eb 27                	jmp    1e55 <deleteClickable+0xc6>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    1e2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1e31:	8b 00                	mov    (%eax),%eax
    1e33:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    1e36:	75 0b                	jne    1e43 <deleteClickable+0xb4>
			{
				cur = cur->next;
    1e38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e3b:	8b 40 14             	mov    0x14(%eax),%eax
    1e3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1e41:	eb 12                	jmp    1e55 <deleteClickable+0xc6>
			}
			else
			{
				cur = cur->next;
    1e43:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e46:	8b 40 14             	mov    0x14(%eax),%eax
    1e49:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    1e4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e4f:	8b 40 14             	mov    0x14(%eax),%eax
    1e52:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    1e55:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e59:	0f 85 49 ff ff ff    	jne    1da8 <deleteClickable+0x19>
			}
		}
	}
}
    1e5f:	90                   	nop
    1e60:	90                   	nop
    1e61:	c9                   	leave  
    1e62:	c3                   	ret    

00001e63 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    1e63:	55                   	push   %ebp
    1e64:	89 e5                	mov    %esp,%ebp
    1e66:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    1e69:	8b 45 08             	mov    0x8(%ebp),%eax
    1e6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    1e6f:	eb 58                	jmp    1ec9 <executeHandler+0x66>
	{
		if (isIn(click, cur->area))
    1e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e74:	ff 70 0c             	pushl  0xc(%eax)
    1e77:	ff 70 08             	pushl  0x8(%eax)
    1e7a:	ff 70 04             	pushl  0x4(%eax)
    1e7d:	ff 30                	pushl  (%eax)
    1e7f:	ff 75 10             	pushl  0x10(%ebp)
    1e82:	ff 75 0c             	pushl  0xc(%ebp)
    1e85:	e8 89 fd ff ff       	call   1c13 <isIn>
    1e8a:	83 c4 18             	add    $0x18,%esp
    1e8d:	85 c0                	test   %eax,%eax
    1e8f:	74 2f                	je     1ec0 <executeHandler+0x5d>
		{
			renaming = 0;
    1e91:	c7 05 90 ca 00 00 00 	movl   $0x0,0xca90
    1e98:	00 00 00 
			isSearching = 0;
    1e9b:	c7 05 8c ca 00 00 00 	movl   $0x0,0xca8c
    1ea2:	00 00 00 
			cur->handler(click);
    1ea5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ea8:	8b 40 10             	mov    0x10(%eax),%eax
    1eab:	83 ec 08             	sub    $0x8,%esp
    1eae:	ff 75 10             	pushl  0x10(%ebp)
    1eb1:	ff 75 0c             	pushl  0xc(%ebp)
    1eb4:	ff d0                	call   *%eax
    1eb6:	83 c4 10             	add    $0x10,%esp
			return 1;
    1eb9:	b8 01 00 00 00       	mov    $0x1,%eax
    1ebe:	eb 4b                	jmp    1f0b <executeHandler+0xa8>
		}
		cur = cur->next;
    1ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ec3:	8b 40 14             	mov    0x14(%eax),%eax
    1ec6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    1ec9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ecd:	75 a2                	jne    1e71 <executeHandler+0xe>
	}
	isSearching = 0;
    1ecf:	c7 05 8c ca 00 00 00 	movl   $0x0,0xca8c
    1ed6:	00 00 00 
	if (renaming == 1){
    1ed9:	a1 90 ca 00 00       	mov    0xca90,%eax
    1ede:	83 f8 01             	cmp    $0x1,%eax
    1ee1:	75 11                	jne    1ef4 <executeHandler+0x91>
		renaming = 0;
    1ee3:	c7 05 90 ca 00 00 00 	movl   $0x0,0xca90
    1eea:	00 00 00 
		return 1;
    1eed:	b8 01 00 00 00       	mov    $0x1,%eax
    1ef2:	eb 17                	jmp    1f0b <executeHandler+0xa8>
	}
	printf(0, "execute: none!\n");
    1ef4:	83 ec 08             	sub    $0x8,%esp
    1ef7:	68 9a 8c 00 00       	push   $0x8c9a
    1efc:	6a 00                	push   $0x0
    1efe:	e8 a4 06 00 00       	call   25a7 <printf>
    1f03:	83 c4 10             	add    $0x10,%esp
	return 0;
    1f06:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1f0b:	c9                   	leave  
    1f0c:	c3                   	ret    

00001f0d <printClickable>:

void printClickable(Clickable *c)
{
    1f0d:	55                   	push   %ebp
    1f0e:	89 e5                	mov    %esp,%ebp
    1f10:	53                   	push   %ebx
    1f11:	83 ec 04             	sub    $0x4,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    1f14:	8b 45 08             	mov    0x8(%ebp),%eax
    1f17:	8b 58 0c             	mov    0xc(%eax),%ebx
    1f1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1f1d:	8b 48 08             	mov    0x8(%eax),%ecx
    1f20:	8b 45 08             	mov    0x8(%ebp),%eax
    1f23:	8b 50 04             	mov    0x4(%eax),%edx
    1f26:	8b 45 08             	mov    0x8(%ebp),%eax
    1f29:	8b 00                	mov    (%eax),%eax
    1f2b:	83 ec 08             	sub    $0x8,%esp
    1f2e:	53                   	push   %ebx
    1f2f:	51                   	push   %ecx
    1f30:	52                   	push   %edx
    1f31:	50                   	push   %eax
    1f32:	68 aa 8c 00 00       	push   $0x8caa
    1f37:	6a 00                	push   $0x0
    1f39:	e8 69 06 00 00       	call   25a7 <printf>
    1f3e:	83 c4 20             	add    $0x20,%esp
}
    1f41:	90                   	nop
    1f42:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1f45:	c9                   	leave  
    1f46:	c3                   	ret    

00001f47 <printClickableList>:

void printClickableList(Clickable *head)
{
    1f47:	55                   	push   %ebp
    1f48:	89 e5                	mov    %esp,%ebp
    1f4a:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    1f4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1f50:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    1f53:	83 ec 08             	sub    $0x8,%esp
    1f56:	68 bc 8c 00 00       	push   $0x8cbc
    1f5b:	6a 00                	push   $0x0
    1f5d:	e8 45 06 00 00       	call   25a7 <printf>
    1f62:	83 c4 10             	add    $0x10,%esp
	while(cur != 0)
    1f65:	eb 17                	jmp    1f7e <printClickableList+0x37>
	{
		printClickable(cur);
    1f67:	83 ec 0c             	sub    $0xc,%esp
    1f6a:	ff 75 f4             	pushl  -0xc(%ebp)
    1f6d:	e8 9b ff ff ff       	call   1f0d <printClickable>
    1f72:	83 c4 10             	add    $0x10,%esp
		cur = cur->next;
    1f75:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f78:	8b 40 14             	mov    0x14(%eax),%eax
    1f7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(cur != 0)
    1f7e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1f82:	75 e3                	jne    1f67 <printClickableList+0x20>
	}
	printf(0, "\n");
    1f84:	83 ec 08             	sub    $0x8,%esp
    1f87:	68 cd 8c 00 00       	push   $0x8ccd
    1f8c:	6a 00                	push   $0x0
    1f8e:	e8 14 06 00 00       	call   25a7 <printf>
    1f93:	83 c4 10             	add    $0x10,%esp
}
    1f96:	90                   	nop
    1f97:	c9                   	leave  
    1f98:	c3                   	ret    

00001f99 <testHanler>:

void testHanler(struct Point p)
{
    1f99:	55                   	push   %ebp
    1f9a:	89 e5                	mov    %esp,%ebp
    1f9c:	83 ec 08             	sub    $0x8,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    1f9f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1fa2:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa5:	52                   	push   %edx
    1fa6:	50                   	push   %eax
    1fa7:	68 cf 8c 00 00       	push   $0x8ccf
    1fac:	6a 00                	push   $0x0
    1fae:	e8 f4 05 00 00       	call   25a7 <printf>
    1fb3:	83 c4 10             	add    $0x10,%esp
}
    1fb6:	90                   	nop
    1fb7:	c9                   	leave  
    1fb8:	c3                   	ret    

00001fb9 <testClickable>:
void testClickable(struct Context c)
{
    1fb9:	55                   	push   %ebp
    1fba:	89 e5                	mov    %esp,%ebp
    1fbc:	83 ec 78             	sub    $0x78,%esp
	ClickableManager cm = initClickManager(c);
    1fbf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1fc2:	ff 75 10             	pushl  0x10(%ebp)
    1fc5:	ff 75 0c             	pushl  0xc(%ebp)
    1fc8:	ff 75 08             	pushl  0x8(%ebp)
    1fcb:	50                   	push   %eax
    1fcc:	e8 85 fc ff ff       	call   1c56 <initClickManager>
    1fd1:	83 c4 0c             	add    $0xc,%esp

	Rect r1 = initRect(5,5,20,20);
    1fd4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    1fd7:	83 ec 04             	sub    $0x4,%esp
    1fda:	6a 14                	push   $0x14
    1fdc:	6a 14                	push   $0x14
    1fde:	6a 05                	push   $0x5
    1fe0:	6a 05                	push   $0x5
    1fe2:	50                   	push   %eax
    1fe3:	e8 da fb ff ff       	call   1bc2 <initRect>
    1fe8:	83 c4 14             	add    $0x14,%esp
	Rect r2 = initRect(20,20,20,20);
    1feb:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    1fee:	83 ec 04             	sub    $0x4,%esp
    1ff1:	6a 14                	push   $0x14
    1ff3:	6a 14                	push   $0x14
    1ff5:	6a 14                	push   $0x14
    1ff7:	6a 14                	push   $0x14
    1ff9:	50                   	push   %eax
    1ffa:	e8 c3 fb ff ff       	call   1bc2 <initRect>
    1fff:	83 c4 14             	add    $0x14,%esp
	Rect r3 = initRect(50,50,15,15);
    2002:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    2005:	83 ec 04             	sub    $0x4,%esp
    2008:	6a 0f                	push   $0xf
    200a:	6a 0f                	push   $0xf
    200c:	6a 32                	push   $0x32
    200e:	6a 32                	push   $0x32
    2010:	50                   	push   %eax
    2011:	e8 ac fb ff ff       	call   1bc2 <initRect>
    2016:	83 c4 14             	add    $0x14,%esp
	Rect r4 = initRect(0,0,30,30);
    2019:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    201c:	83 ec 04             	sub    $0x4,%esp
    201f:	6a 1e                	push   $0x1e
    2021:	6a 1e                	push   $0x1e
    2023:	6a 00                	push   $0x0
    2025:	6a 00                	push   $0x0
    2027:	50                   	push   %eax
    2028:	e8 95 fb ff ff       	call   1bc2 <initRect>
    202d:	83 c4 14             	add    $0x14,%esp
	Point p1 = initPoint(23, 23);
    2030:	8d 45 9c             	lea    -0x64(%ebp),%eax
    2033:	83 ec 04             	sub    $0x4,%esp
    2036:	6a 17                	push   $0x17
    2038:	6a 17                	push   $0x17
    203a:	50                   	push   %eax
    203b:	e8 5b fb ff ff       	call   1b9b <initPoint>
    2040:	83 c4 0c             	add    $0xc,%esp
	Point p2 = initPoint(70, 70);
    2043:	8d 45 94             	lea    -0x6c(%ebp),%eax
    2046:	83 ec 04             	sub    $0x4,%esp
    2049:	6a 46                	push   $0x46
    204b:	6a 46                	push   $0x46
    204d:	50                   	push   %eax
    204e:	e8 48 fb ff ff       	call   1b9b <initPoint>
    2053:	83 c4 0c             	add    $0xc,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    2056:	83 ec 04             	sub    $0x4,%esp
    2059:	68 99 1f 00 00       	push   $0x1f99
    205e:	6a 02                	push   $0x2
    2060:	ff 75 e0             	pushl  -0x20(%ebp)
    2063:	ff 75 dc             	pushl  -0x24(%ebp)
    2066:	ff 75 d8             	pushl  -0x28(%ebp)
    2069:	ff 75 d4             	pushl  -0x2c(%ebp)
    206c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    206f:	50                   	push   %eax
    2070:	e8 2f fc ff ff       	call   1ca4 <createClickable>
    2075:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    2078:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    207b:	83 ec 04             	sub    $0x4,%esp
    207e:	50                   	push   %eax
    207f:	68 e3 8c 00 00       	push   $0x8ce3
    2084:	6a 00                	push   $0x0
    2086:	e8 1c 05 00 00       	call   25a7 <printf>
    208b:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    208e:	83 ec 04             	sub    $0x4,%esp
    2091:	68 99 1f 00 00       	push   $0x1f99
    2096:	6a 02                	push   $0x2
    2098:	ff 75 d0             	pushl  -0x30(%ebp)
    209b:	ff 75 cc             	pushl  -0x34(%ebp)
    209e:	ff 75 c8             	pushl  -0x38(%ebp)
    20a1:	ff 75 c4             	pushl  -0x3c(%ebp)
    20a4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    20a7:	50                   	push   %eax
    20a8:	e8 f7 fb ff ff       	call   1ca4 <createClickable>
    20ad:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    20b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    20b3:	83 ec 04             	sub    $0x4,%esp
    20b6:	50                   	push   %eax
    20b7:	68 e3 8c 00 00       	push   $0x8ce3
    20bc:	6a 00                	push   $0x0
    20be:	e8 e4 04 00 00       	call   25a7 <printf>
    20c3:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    20c6:	83 ec 04             	sub    $0x4,%esp
    20c9:	68 99 1f 00 00       	push   $0x1f99
    20ce:	6a 02                	push   $0x2
    20d0:	ff 75 c0             	pushl  -0x40(%ebp)
    20d3:	ff 75 bc             	pushl  -0x44(%ebp)
    20d6:	ff 75 b8             	pushl  -0x48(%ebp)
    20d9:	ff 75 b4             	pushl  -0x4c(%ebp)
    20dc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    20df:	50                   	push   %eax
    20e0:	e8 bf fb ff ff       	call   1ca4 <createClickable>
    20e5:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    20e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    20eb:	83 ec 04             	sub    $0x4,%esp
    20ee:	50                   	push   %eax
    20ef:	68 e3 8c 00 00       	push   $0x8ce3
    20f4:	6a 00                	push   $0x0
    20f6:	e8 ac 04 00 00       	call   25a7 <printf>
    20fb:	83 c4 10             	add    $0x10,%esp
	printClickableList(cm.left_click);
    20fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2101:	83 ec 0c             	sub    $0xc,%esp
    2104:	50                   	push   %eax
    2105:	e8 3d fe ff ff       	call   1f47 <printClickableList>
    210a:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p1);
    210d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2110:	83 ec 04             	sub    $0x4,%esp
    2113:	ff 75 a0             	pushl  -0x60(%ebp)
    2116:	ff 75 9c             	pushl  -0x64(%ebp)
    2119:	50                   	push   %eax
    211a:	e8 44 fd ff ff       	call   1e63 <executeHandler>
    211f:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p2);
    2122:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2125:	83 ec 04             	sub    $0x4,%esp
    2128:	ff 75 98             	pushl  -0x68(%ebp)
    212b:	ff 75 94             	pushl  -0x6c(%ebp)
    212e:	50                   	push   %eax
    212f:	e8 2f fd ff ff       	call   1e63 <executeHandler>
    2134:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, r4);
    2137:	83 ec 0c             	sub    $0xc,%esp
    213a:	ff 75 b0             	pushl  -0x50(%ebp)
    213d:	ff 75 ac             	pushl  -0x54(%ebp)
    2140:	ff 75 a8             	pushl  -0x58(%ebp)
    2143:	ff 75 a4             	pushl  -0x5c(%ebp)
    2146:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2149:	50                   	push   %eax
    214a:	e8 40 fc ff ff       	call   1d8f <deleteClickable>
    214f:	83 c4 20             	add    $0x20,%esp
	printClickableList(cm.left_click);
    2152:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2155:	83 ec 0c             	sub    $0xc,%esp
    2158:	50                   	push   %eax
    2159:	e8 e9 fd ff ff       	call   1f47 <printClickableList>
    215e:	83 c4 10             	add    $0x10,%esp
}
    2161:	90                   	nop
    2162:	c9                   	leave  
    2163:	c3                   	ret    

00002164 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    2164:	55                   	push   %ebp
    2165:	89 e5                	mov    %esp,%ebp
    2167:	57                   	push   %edi
    2168:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    2169:	8b 4d 08             	mov    0x8(%ebp),%ecx
    216c:	8b 55 10             	mov    0x10(%ebp),%edx
    216f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2172:	89 cb                	mov    %ecx,%ebx
    2174:	89 df                	mov    %ebx,%edi
    2176:	89 d1                	mov    %edx,%ecx
    2178:	fc                   	cld    
    2179:	f3 aa                	rep stos %al,%es:(%edi)
    217b:	89 ca                	mov    %ecx,%edx
    217d:	89 fb                	mov    %edi,%ebx
    217f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    2182:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    2185:	90                   	nop
    2186:	5b                   	pop    %ebx
    2187:	5f                   	pop    %edi
    2188:	5d                   	pop    %ebp
    2189:	c3                   	ret    

0000218a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    218a:	55                   	push   %ebp
    218b:	89 e5                	mov    %esp,%ebp
    218d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    2190:	8b 45 08             	mov    0x8(%ebp),%eax
    2193:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    2196:	90                   	nop
    2197:	8b 55 0c             	mov    0xc(%ebp),%edx
    219a:	8d 42 01             	lea    0x1(%edx),%eax
    219d:	89 45 0c             	mov    %eax,0xc(%ebp)
    21a0:	8b 45 08             	mov    0x8(%ebp),%eax
    21a3:	8d 48 01             	lea    0x1(%eax),%ecx
    21a6:	89 4d 08             	mov    %ecx,0x8(%ebp)
    21a9:	0f b6 12             	movzbl (%edx),%edx
    21ac:	88 10                	mov    %dl,(%eax)
    21ae:	0f b6 00             	movzbl (%eax),%eax
    21b1:	84 c0                	test   %al,%al
    21b3:	75 e2                	jne    2197 <strcpy+0xd>
    ;
  return os;
    21b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    21b8:	c9                   	leave  
    21b9:	c3                   	ret    

000021ba <strcmp>:

int
strcmp(const char *p, const char *q)
{
    21ba:	55                   	push   %ebp
    21bb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    21bd:	eb 08                	jmp    21c7 <strcmp+0xd>
    p++, q++;
    21bf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    21c3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
    21c7:	8b 45 08             	mov    0x8(%ebp),%eax
    21ca:	0f b6 00             	movzbl (%eax),%eax
    21cd:	84 c0                	test   %al,%al
    21cf:	74 10                	je     21e1 <strcmp+0x27>
    21d1:	8b 45 08             	mov    0x8(%ebp),%eax
    21d4:	0f b6 10             	movzbl (%eax),%edx
    21d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    21da:	0f b6 00             	movzbl (%eax),%eax
    21dd:	38 c2                	cmp    %al,%dl
    21df:	74 de                	je     21bf <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
    21e1:	8b 45 08             	mov    0x8(%ebp),%eax
    21e4:	0f b6 00             	movzbl (%eax),%eax
    21e7:	0f b6 d0             	movzbl %al,%edx
    21ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    21ed:	0f b6 00             	movzbl (%eax),%eax
    21f0:	0f b6 c8             	movzbl %al,%ecx
    21f3:	89 d0                	mov    %edx,%eax
    21f5:	29 c8                	sub    %ecx,%eax
}
    21f7:	5d                   	pop    %ebp
    21f8:	c3                   	ret    

000021f9 <strlen>:

uint
strlen(char *s)
{
    21f9:	55                   	push   %ebp
    21fa:	89 e5                	mov    %esp,%ebp
    21fc:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    21ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    2206:	eb 04                	jmp    220c <strlen+0x13>
    2208:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    220c:	8b 55 fc             	mov    -0x4(%ebp),%edx
    220f:	8b 45 08             	mov    0x8(%ebp),%eax
    2212:	01 d0                	add    %edx,%eax
    2214:	0f b6 00             	movzbl (%eax),%eax
    2217:	84 c0                	test   %al,%al
    2219:	75 ed                	jne    2208 <strlen+0xf>
    ;
  return n;
    221b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    221e:	c9                   	leave  
    221f:	c3                   	ret    

00002220 <memset>:

void*
memset(void *dst, int c, uint n)
{
    2220:	55                   	push   %ebp
    2221:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    2223:	8b 45 10             	mov    0x10(%ebp),%eax
    2226:	50                   	push   %eax
    2227:	ff 75 0c             	pushl  0xc(%ebp)
    222a:	ff 75 08             	pushl  0x8(%ebp)
    222d:	e8 32 ff ff ff       	call   2164 <stosb>
    2232:	83 c4 0c             	add    $0xc,%esp
  return dst;
    2235:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2238:	c9                   	leave  
    2239:	c3                   	ret    

0000223a <strchr>:

char*
strchr(const char *s, char c)
{
    223a:	55                   	push   %ebp
    223b:	89 e5                	mov    %esp,%ebp
    223d:	83 ec 04             	sub    $0x4,%esp
    2240:	8b 45 0c             	mov    0xc(%ebp),%eax
    2243:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    2246:	eb 14                	jmp    225c <strchr+0x22>
    if(*s == c)
    2248:	8b 45 08             	mov    0x8(%ebp),%eax
    224b:	0f b6 00             	movzbl (%eax),%eax
    224e:	38 45 fc             	cmp    %al,-0x4(%ebp)
    2251:	75 05                	jne    2258 <strchr+0x1e>
      return (char*)s;
    2253:	8b 45 08             	mov    0x8(%ebp),%eax
    2256:	eb 13                	jmp    226b <strchr+0x31>
  for(; *s; s++)
    2258:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    225c:	8b 45 08             	mov    0x8(%ebp),%eax
    225f:	0f b6 00             	movzbl (%eax),%eax
    2262:	84 c0                	test   %al,%al
    2264:	75 e2                	jne    2248 <strchr+0xe>
  return 0;
    2266:	b8 00 00 00 00       	mov    $0x0,%eax
}
    226b:	c9                   	leave  
    226c:	c3                   	ret    

0000226d <gets>:

char*
gets(char *buf, int max)
{
    226d:	55                   	push   %ebp
    226e:	89 e5                	mov    %esp,%ebp
    2270:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    2273:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    227a:	eb 42                	jmp    22be <gets+0x51>
    cc = read(0, &c, 1);
    227c:	83 ec 04             	sub    $0x4,%esp
    227f:	6a 01                	push   $0x1
    2281:	8d 45 ef             	lea    -0x11(%ebp),%eax
    2284:	50                   	push   %eax
    2285:	6a 00                	push   $0x0
    2287:	e8 47 01 00 00       	call   23d3 <read>
    228c:	83 c4 10             	add    $0x10,%esp
    228f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    2292:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2296:	7e 33                	jle    22cb <gets+0x5e>
      break;
    buf[i++] = c;
    2298:	8b 45 f4             	mov    -0xc(%ebp),%eax
    229b:	8d 50 01             	lea    0x1(%eax),%edx
    229e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    22a1:	89 c2                	mov    %eax,%edx
    22a3:	8b 45 08             	mov    0x8(%ebp),%eax
    22a6:	01 c2                	add    %eax,%edx
    22a8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    22ac:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    22ae:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    22b2:	3c 0a                	cmp    $0xa,%al
    22b4:	74 16                	je     22cc <gets+0x5f>
    22b6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    22ba:	3c 0d                	cmp    $0xd,%al
    22bc:	74 0e                	je     22cc <gets+0x5f>
  for(i=0; i+1 < max; ){
    22be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22c1:	83 c0 01             	add    $0x1,%eax
    22c4:	39 45 0c             	cmp    %eax,0xc(%ebp)
    22c7:	7f b3                	jg     227c <gets+0xf>
    22c9:	eb 01                	jmp    22cc <gets+0x5f>
      break;
    22cb:	90                   	nop
      break;
  }
  buf[i] = '\0';
    22cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    22cf:	8b 45 08             	mov    0x8(%ebp),%eax
    22d2:	01 d0                	add    %edx,%eax
    22d4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    22d7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    22da:	c9                   	leave  
    22db:	c3                   	ret    

000022dc <stat>:

int
stat(char *n, struct stat *st)
{
    22dc:	55                   	push   %ebp
    22dd:	89 e5                	mov    %esp,%ebp
    22df:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    22e2:	83 ec 08             	sub    $0x8,%esp
    22e5:	6a 00                	push   $0x0
    22e7:	ff 75 08             	pushl  0x8(%ebp)
    22ea:	e8 0c 01 00 00       	call   23fb <open>
    22ef:	83 c4 10             	add    $0x10,%esp
    22f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    22f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    22f9:	79 07                	jns    2302 <stat+0x26>
    return -1;
    22fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2300:	eb 25                	jmp    2327 <stat+0x4b>
  r = fstat(fd, st);
    2302:	83 ec 08             	sub    $0x8,%esp
    2305:	ff 75 0c             	pushl  0xc(%ebp)
    2308:	ff 75 f4             	pushl  -0xc(%ebp)
    230b:	e8 03 01 00 00       	call   2413 <fstat>
    2310:	83 c4 10             	add    $0x10,%esp
    2313:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    2316:	83 ec 0c             	sub    $0xc,%esp
    2319:	ff 75 f4             	pushl  -0xc(%ebp)
    231c:	e8 c2 00 00 00       	call   23e3 <close>
    2321:	83 c4 10             	add    $0x10,%esp
  return r;
    2324:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2327:	c9                   	leave  
    2328:	c3                   	ret    

00002329 <atoi>:

int
atoi(const char *s)
{
    2329:	55                   	push   %ebp
    232a:	89 e5                	mov    %esp,%ebp
    232c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    232f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    2336:	eb 25                	jmp    235d <atoi+0x34>
    n = n*10 + *s++ - '0';
    2338:	8b 55 fc             	mov    -0x4(%ebp),%edx
    233b:	89 d0                	mov    %edx,%eax
    233d:	c1 e0 02             	shl    $0x2,%eax
    2340:	01 d0                	add    %edx,%eax
    2342:	01 c0                	add    %eax,%eax
    2344:	89 c1                	mov    %eax,%ecx
    2346:	8b 45 08             	mov    0x8(%ebp),%eax
    2349:	8d 50 01             	lea    0x1(%eax),%edx
    234c:	89 55 08             	mov    %edx,0x8(%ebp)
    234f:	0f b6 00             	movzbl (%eax),%eax
    2352:	0f be c0             	movsbl %al,%eax
    2355:	01 c8                	add    %ecx,%eax
    2357:	83 e8 30             	sub    $0x30,%eax
    235a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    235d:	8b 45 08             	mov    0x8(%ebp),%eax
    2360:	0f b6 00             	movzbl (%eax),%eax
    2363:	3c 2f                	cmp    $0x2f,%al
    2365:	7e 0a                	jle    2371 <atoi+0x48>
    2367:	8b 45 08             	mov    0x8(%ebp),%eax
    236a:	0f b6 00             	movzbl (%eax),%eax
    236d:	3c 39                	cmp    $0x39,%al
    236f:	7e c7                	jle    2338 <atoi+0xf>
  return n;
    2371:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2374:	c9                   	leave  
    2375:	c3                   	ret    

00002376 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    2376:	55                   	push   %ebp
    2377:	89 e5                	mov    %esp,%ebp
    2379:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    237c:	8b 45 08             	mov    0x8(%ebp),%eax
    237f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    2382:	8b 45 0c             	mov    0xc(%ebp),%eax
    2385:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    2388:	eb 17                	jmp    23a1 <memmove+0x2b>
    *dst++ = *src++;
    238a:	8b 55 f8             	mov    -0x8(%ebp),%edx
    238d:	8d 42 01             	lea    0x1(%edx),%eax
    2390:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2393:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2396:	8d 48 01             	lea    0x1(%eax),%ecx
    2399:	89 4d fc             	mov    %ecx,-0x4(%ebp)
    239c:	0f b6 12             	movzbl (%edx),%edx
    239f:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
    23a1:	8b 45 10             	mov    0x10(%ebp),%eax
    23a4:	8d 50 ff             	lea    -0x1(%eax),%edx
    23a7:	89 55 10             	mov    %edx,0x10(%ebp)
    23aa:	85 c0                	test   %eax,%eax
    23ac:	7f dc                	jg     238a <memmove+0x14>
  return vdst;
    23ae:	8b 45 08             	mov    0x8(%ebp),%eax
}
    23b1:	c9                   	leave  
    23b2:	c3                   	ret    

000023b3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    23b3:	b8 01 00 00 00       	mov    $0x1,%eax
    23b8:	cd 40                	int    $0x40
    23ba:	c3                   	ret    

000023bb <exit>:
SYSCALL(exit)
    23bb:	b8 02 00 00 00       	mov    $0x2,%eax
    23c0:	cd 40                	int    $0x40
    23c2:	c3                   	ret    

000023c3 <wait>:
SYSCALL(wait)
    23c3:	b8 03 00 00 00       	mov    $0x3,%eax
    23c8:	cd 40                	int    $0x40
    23ca:	c3                   	ret    

000023cb <pipe>:
SYSCALL(pipe)
    23cb:	b8 04 00 00 00       	mov    $0x4,%eax
    23d0:	cd 40                	int    $0x40
    23d2:	c3                   	ret    

000023d3 <read>:
SYSCALL(read)
    23d3:	b8 05 00 00 00       	mov    $0x5,%eax
    23d8:	cd 40                	int    $0x40
    23da:	c3                   	ret    

000023db <write>:
SYSCALL(write)
    23db:	b8 10 00 00 00       	mov    $0x10,%eax
    23e0:	cd 40                	int    $0x40
    23e2:	c3                   	ret    

000023e3 <close>:
SYSCALL(close)
    23e3:	b8 15 00 00 00       	mov    $0x15,%eax
    23e8:	cd 40                	int    $0x40
    23ea:	c3                   	ret    

000023eb <kill>:
SYSCALL(kill)
    23eb:	b8 06 00 00 00       	mov    $0x6,%eax
    23f0:	cd 40                	int    $0x40
    23f2:	c3                   	ret    

000023f3 <exec>:
SYSCALL(exec)
    23f3:	b8 07 00 00 00       	mov    $0x7,%eax
    23f8:	cd 40                	int    $0x40
    23fa:	c3                   	ret    

000023fb <open>:
SYSCALL(open)
    23fb:	b8 0f 00 00 00       	mov    $0xf,%eax
    2400:	cd 40                	int    $0x40
    2402:	c3                   	ret    

00002403 <mknod>:
SYSCALL(mknod)
    2403:	b8 11 00 00 00       	mov    $0x11,%eax
    2408:	cd 40                	int    $0x40
    240a:	c3                   	ret    

0000240b <unlink>:
SYSCALL(unlink)
    240b:	b8 12 00 00 00       	mov    $0x12,%eax
    2410:	cd 40                	int    $0x40
    2412:	c3                   	ret    

00002413 <fstat>:
SYSCALL(fstat)
    2413:	b8 08 00 00 00       	mov    $0x8,%eax
    2418:	cd 40                	int    $0x40
    241a:	c3                   	ret    

0000241b <link>:
SYSCALL(link)
    241b:	b8 13 00 00 00       	mov    $0x13,%eax
    2420:	cd 40                	int    $0x40
    2422:	c3                   	ret    

00002423 <mkdir>:
SYSCALL(mkdir)
    2423:	b8 14 00 00 00       	mov    $0x14,%eax
    2428:	cd 40                	int    $0x40
    242a:	c3                   	ret    

0000242b <chdir>:
SYSCALL(chdir)
    242b:	b8 09 00 00 00       	mov    $0x9,%eax
    2430:	cd 40                	int    $0x40
    2432:	c3                   	ret    

00002433 <dup>:
SYSCALL(dup)
    2433:	b8 0a 00 00 00       	mov    $0xa,%eax
    2438:	cd 40                	int    $0x40
    243a:	c3                   	ret    

0000243b <getpid>:
SYSCALL(getpid)
    243b:	b8 0b 00 00 00       	mov    $0xb,%eax
    2440:	cd 40                	int    $0x40
    2442:	c3                   	ret    

00002443 <sbrk>:
SYSCALL(sbrk)
    2443:	b8 0c 00 00 00       	mov    $0xc,%eax
    2448:	cd 40                	int    $0x40
    244a:	c3                   	ret    

0000244b <sleep>:
SYSCALL(sleep)
    244b:	b8 0d 00 00 00       	mov    $0xd,%eax
    2450:	cd 40                	int    $0x40
    2452:	c3                   	ret    

00002453 <uptime>:
SYSCALL(uptime)
    2453:	b8 0e 00 00 00       	mov    $0xe,%eax
    2458:	cd 40                	int    $0x40
    245a:	c3                   	ret    

0000245b <getMsg>:
SYSCALL(getMsg)
    245b:	b8 16 00 00 00       	mov    $0x16,%eax
    2460:	cd 40                	int    $0x40
    2462:	c3                   	ret    

00002463 <createWindow>:
SYSCALL(createWindow)
    2463:	b8 17 00 00 00       	mov    $0x17,%eax
    2468:	cd 40                	int    $0x40
    246a:	c3                   	ret    

0000246b <destroyWindow>:
SYSCALL(destroyWindow)
    246b:	b8 18 00 00 00       	mov    $0x18,%eax
    2470:	cd 40                	int    $0x40
    2472:	c3                   	ret    

00002473 <updateWindow>:
SYSCALL(updateWindow)
    2473:	b8 19 00 00 00       	mov    $0x19,%eax
    2478:	cd 40                	int    $0x40
    247a:	c3                   	ret    

0000247b <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    247b:	b8 1a 00 00 00       	mov    $0x1a,%eax
    2480:	cd 40                	int    $0x40
    2482:	c3                   	ret    

00002483 <kwrite>:
SYSCALL(kwrite)
    2483:	b8 1c 00 00 00       	mov    $0x1c,%eax
    2488:	cd 40                	int    $0x40
    248a:	c3                   	ret    

0000248b <setSampleRate>:
SYSCALL(setSampleRate)
    248b:	b8 1b 00 00 00       	mov    $0x1b,%eax
    2490:	cd 40                	int    $0x40
    2492:	c3                   	ret    

00002493 <pause>:
SYSCALL(pause)
    2493:	b8 1d 00 00 00       	mov    $0x1d,%eax
    2498:	cd 40                	int    $0x40
    249a:	c3                   	ret    

0000249b <wavdecode>:
SYSCALL(wavdecode)
    249b:	b8 1e 00 00 00       	mov    $0x1e,%eax
    24a0:	cd 40                	int    $0x40
    24a2:	c3                   	ret    

000024a3 <beginDecode>:
SYSCALL(beginDecode)
    24a3:	b8 1f 00 00 00       	mov    $0x1f,%eax
    24a8:	cd 40                	int    $0x40
    24aa:	c3                   	ret    

000024ab <waitForDecode>:
SYSCALL(waitForDecode)
    24ab:	b8 20 00 00 00       	mov    $0x20,%eax
    24b0:	cd 40                	int    $0x40
    24b2:	c3                   	ret    

000024b3 <endDecode>:
SYSCALL(endDecode)
    24b3:	b8 21 00 00 00       	mov    $0x21,%eax
    24b8:	cd 40                	int    $0x40
    24ba:	c3                   	ret    

000024bb <getCoreBuf>:
SYSCALL(getCoreBuf)
    24bb:	b8 22 00 00 00       	mov    $0x22,%eax
    24c0:	cd 40                	int    $0x40
    24c2:	c3                   	ret    

000024c3 <halt>:
SYSCALL(halt)
    24c3:	b8 23 00 00 00       	mov    $0x23,%eax
    24c8:	cd 40                	int    $0x40
    24ca:	c3                   	ret    

000024cb <reboot>:
SYSCALL(reboot)
    24cb:	b8 24 00 00 00       	mov    $0x24,%eax
    24d0:	cd 40                	int    $0x40
    24d2:	c3                   	ret    

000024d3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    24d3:	55                   	push   %ebp
    24d4:	89 e5                	mov    %esp,%ebp
    24d6:	83 ec 18             	sub    $0x18,%esp
    24d9:	8b 45 0c             	mov    0xc(%ebp),%eax
    24dc:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    24df:	83 ec 04             	sub    $0x4,%esp
    24e2:	6a 01                	push   $0x1
    24e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
    24e7:	50                   	push   %eax
    24e8:	ff 75 08             	pushl  0x8(%ebp)
    24eb:	e8 eb fe ff ff       	call   23db <write>
    24f0:	83 c4 10             	add    $0x10,%esp
}
    24f3:	90                   	nop
    24f4:	c9                   	leave  
    24f5:	c3                   	ret    

000024f6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    24f6:	55                   	push   %ebp
    24f7:	89 e5                	mov    %esp,%ebp
    24f9:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    24fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2503:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2507:	74 17                	je     2520 <printint+0x2a>
    2509:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    250d:	79 11                	jns    2520 <printint+0x2a>
    neg = 1;
    250f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2516:	8b 45 0c             	mov    0xc(%ebp),%eax
    2519:	f7 d8                	neg    %eax
    251b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    251e:	eb 06                	jmp    2526 <printint+0x30>
  } else {
    x = xx;
    2520:	8b 45 0c             	mov    0xc(%ebp),%eax
    2523:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2526:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    252d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    2530:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2533:	ba 00 00 00 00       	mov    $0x0,%edx
    2538:	f7 f1                	div    %ecx
    253a:	89 d1                	mov    %edx,%ecx
    253c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    253f:	8d 50 01             	lea    0x1(%eax),%edx
    2542:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2545:	0f b6 91 5c c3 00 00 	movzbl 0xc35c(%ecx),%edx
    254c:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
    2550:	8b 4d 10             	mov    0x10(%ebp),%ecx
    2553:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2556:	ba 00 00 00 00       	mov    $0x0,%edx
    255b:	f7 f1                	div    %ecx
    255d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2560:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2564:	75 c7                	jne    252d <printint+0x37>
  if(neg)
    2566:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    256a:	74 2d                	je     2599 <printint+0xa3>
    buf[i++] = '-';
    256c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    256f:	8d 50 01             	lea    0x1(%eax),%edx
    2572:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2575:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    257a:	eb 1d                	jmp    2599 <printint+0xa3>
    putc(fd, buf[i]);
    257c:	8d 55 dc             	lea    -0x24(%ebp),%edx
    257f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2582:	01 d0                	add    %edx,%eax
    2584:	0f b6 00             	movzbl (%eax),%eax
    2587:	0f be c0             	movsbl %al,%eax
    258a:	83 ec 08             	sub    $0x8,%esp
    258d:	50                   	push   %eax
    258e:	ff 75 08             	pushl  0x8(%ebp)
    2591:	e8 3d ff ff ff       	call   24d3 <putc>
    2596:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
    2599:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    259d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    25a1:	79 d9                	jns    257c <printint+0x86>
}
    25a3:	90                   	nop
    25a4:	90                   	nop
    25a5:	c9                   	leave  
    25a6:	c3                   	ret    

000025a7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    25a7:	55                   	push   %ebp
    25a8:	89 e5                	mov    %esp,%ebp
    25aa:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    25ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    25b4:	8d 45 0c             	lea    0xc(%ebp),%eax
    25b7:	83 c0 04             	add    $0x4,%eax
    25ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    25bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    25c4:	e9 59 01 00 00       	jmp    2722 <printf+0x17b>
    c = fmt[i] & 0xff;
    25c9:	8b 55 0c             	mov    0xc(%ebp),%edx
    25cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    25cf:	01 d0                	add    %edx,%eax
    25d1:	0f b6 00             	movzbl (%eax),%eax
    25d4:	0f be c0             	movsbl %al,%eax
    25d7:	25 ff 00 00 00       	and    $0xff,%eax
    25dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    25df:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    25e3:	75 2c                	jne    2611 <printf+0x6a>
      if(c == '%'){
    25e5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    25e9:	75 0c                	jne    25f7 <printf+0x50>
        state = '%';
    25eb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    25f2:	e9 27 01 00 00       	jmp    271e <printf+0x177>
      } else {
        putc(fd, c);
    25f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    25fa:	0f be c0             	movsbl %al,%eax
    25fd:	83 ec 08             	sub    $0x8,%esp
    2600:	50                   	push   %eax
    2601:	ff 75 08             	pushl  0x8(%ebp)
    2604:	e8 ca fe ff ff       	call   24d3 <putc>
    2609:	83 c4 10             	add    $0x10,%esp
    260c:	e9 0d 01 00 00       	jmp    271e <printf+0x177>
      }
    } else if(state == '%'){
    2611:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2615:	0f 85 03 01 00 00    	jne    271e <printf+0x177>
      if(c == 'd'){
    261b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    261f:	75 1e                	jne    263f <printf+0x98>
        printint(fd, *ap, 10, 1);
    2621:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2624:	8b 00                	mov    (%eax),%eax
    2626:	6a 01                	push   $0x1
    2628:	6a 0a                	push   $0xa
    262a:	50                   	push   %eax
    262b:	ff 75 08             	pushl  0x8(%ebp)
    262e:	e8 c3 fe ff ff       	call   24f6 <printint>
    2633:	83 c4 10             	add    $0x10,%esp
        ap++;
    2636:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    263a:	e9 d8 00 00 00       	jmp    2717 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    263f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2643:	74 06                	je     264b <printf+0xa4>
    2645:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2649:	75 1e                	jne    2669 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    264b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    264e:	8b 00                	mov    (%eax),%eax
    2650:	6a 00                	push   $0x0
    2652:	6a 10                	push   $0x10
    2654:	50                   	push   %eax
    2655:	ff 75 08             	pushl  0x8(%ebp)
    2658:	e8 99 fe ff ff       	call   24f6 <printint>
    265d:	83 c4 10             	add    $0x10,%esp
        ap++;
    2660:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2664:	e9 ae 00 00 00       	jmp    2717 <printf+0x170>
      } else if(c == 's'){
    2669:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    266d:	75 43                	jne    26b2 <printf+0x10b>
        s = (char*)*ap;
    266f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2672:	8b 00                	mov    (%eax),%eax
    2674:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2677:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    267b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    267f:	75 25                	jne    26a6 <printf+0xff>
          s = "(null)";
    2681:	c7 45 f4 f3 8c 00 00 	movl   $0x8cf3,-0xc(%ebp)
        while(*s != 0){
    2688:	eb 1c                	jmp    26a6 <printf+0xff>
          putc(fd, *s);
    268a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    268d:	0f b6 00             	movzbl (%eax),%eax
    2690:	0f be c0             	movsbl %al,%eax
    2693:	83 ec 08             	sub    $0x8,%esp
    2696:	50                   	push   %eax
    2697:	ff 75 08             	pushl  0x8(%ebp)
    269a:	e8 34 fe ff ff       	call   24d3 <putc>
    269f:	83 c4 10             	add    $0x10,%esp
          s++;
    26a2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
    26a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26a9:	0f b6 00             	movzbl (%eax),%eax
    26ac:	84 c0                	test   %al,%al
    26ae:	75 da                	jne    268a <printf+0xe3>
    26b0:	eb 65                	jmp    2717 <printf+0x170>
        }
      } else if(c == 'c'){
    26b2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    26b6:	75 1d                	jne    26d5 <printf+0x12e>
        putc(fd, *ap);
    26b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26bb:	8b 00                	mov    (%eax),%eax
    26bd:	0f be c0             	movsbl %al,%eax
    26c0:	83 ec 08             	sub    $0x8,%esp
    26c3:	50                   	push   %eax
    26c4:	ff 75 08             	pushl  0x8(%ebp)
    26c7:	e8 07 fe ff ff       	call   24d3 <putc>
    26cc:	83 c4 10             	add    $0x10,%esp
        ap++;
    26cf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    26d3:	eb 42                	jmp    2717 <printf+0x170>
      } else if(c == '%'){
    26d5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    26d9:	75 17                	jne    26f2 <printf+0x14b>
        putc(fd, c);
    26db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    26de:	0f be c0             	movsbl %al,%eax
    26e1:	83 ec 08             	sub    $0x8,%esp
    26e4:	50                   	push   %eax
    26e5:	ff 75 08             	pushl  0x8(%ebp)
    26e8:	e8 e6 fd ff ff       	call   24d3 <putc>
    26ed:	83 c4 10             	add    $0x10,%esp
    26f0:	eb 25                	jmp    2717 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    26f2:	83 ec 08             	sub    $0x8,%esp
    26f5:	6a 25                	push   $0x25
    26f7:	ff 75 08             	pushl  0x8(%ebp)
    26fa:	e8 d4 fd ff ff       	call   24d3 <putc>
    26ff:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    2702:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2705:	0f be c0             	movsbl %al,%eax
    2708:	83 ec 08             	sub    $0x8,%esp
    270b:	50                   	push   %eax
    270c:	ff 75 08             	pushl  0x8(%ebp)
    270f:	e8 bf fd ff ff       	call   24d3 <putc>
    2714:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    2717:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
    271e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2722:	8b 55 0c             	mov    0xc(%ebp),%edx
    2725:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2728:	01 d0                	add    %edx,%eax
    272a:	0f b6 00             	movzbl (%eax),%eax
    272d:	84 c0                	test   %al,%al
    272f:	0f 85 94 fe ff ff    	jne    25c9 <printf+0x22>
    }
  }
}
    2735:	90                   	nop
    2736:	90                   	nop
    2737:	c9                   	leave  
    2738:	c3                   	ret    

00002739 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    2739:	55                   	push   %ebp
    273a:	89 e5                	mov    %esp,%ebp
    273c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    273f:	8b 45 08             	mov    0x8(%ebp),%eax
    2742:	83 e8 08             	sub    $0x8,%eax
    2745:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2748:	a1 9c ca 00 00       	mov    0xca9c,%eax
    274d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2750:	eb 24                	jmp    2776 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2752:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2755:	8b 00                	mov    (%eax),%eax
    2757:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    275a:	72 12                	jb     276e <free+0x35>
    275c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    275f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    2762:	77 24                	ja     2788 <free+0x4f>
    2764:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2767:	8b 00                	mov    (%eax),%eax
    2769:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    276c:	72 1a                	jb     2788 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    276e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2771:	8b 00                	mov    (%eax),%eax
    2773:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2776:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2779:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    277c:	76 d4                	jbe    2752 <free+0x19>
    277e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2781:	8b 00                	mov    (%eax),%eax
    2783:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    2786:	73 ca                	jae    2752 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
    2788:	8b 45 f8             	mov    -0x8(%ebp),%eax
    278b:	8b 40 04             	mov    0x4(%eax),%eax
    278e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    2795:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2798:	01 c2                	add    %eax,%edx
    279a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    279d:	8b 00                	mov    (%eax),%eax
    279f:	39 c2                	cmp    %eax,%edx
    27a1:	75 24                	jne    27c7 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    27a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27a6:	8b 50 04             	mov    0x4(%eax),%edx
    27a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27ac:	8b 00                	mov    (%eax),%eax
    27ae:	8b 40 04             	mov    0x4(%eax),%eax
    27b1:	01 c2                	add    %eax,%edx
    27b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27b6:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    27b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27bc:	8b 00                	mov    (%eax),%eax
    27be:	8b 10                	mov    (%eax),%edx
    27c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27c3:	89 10                	mov    %edx,(%eax)
    27c5:	eb 0a                	jmp    27d1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    27c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27ca:	8b 10                	mov    (%eax),%edx
    27cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27cf:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    27d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27d4:	8b 40 04             	mov    0x4(%eax),%eax
    27d7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    27de:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27e1:	01 d0                	add    %edx,%eax
    27e3:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    27e6:	75 20                	jne    2808 <free+0xcf>
    p->s.size += bp->s.size;
    27e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27eb:	8b 50 04             	mov    0x4(%eax),%edx
    27ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27f1:	8b 40 04             	mov    0x4(%eax),%eax
    27f4:	01 c2                	add    %eax,%edx
    27f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27f9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    27fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27ff:	8b 10                	mov    (%eax),%edx
    2801:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2804:	89 10                	mov    %edx,(%eax)
    2806:	eb 08                	jmp    2810 <free+0xd7>
  } else
    p->s.ptr = bp;
    2808:	8b 45 fc             	mov    -0x4(%ebp),%eax
    280b:	8b 55 f8             	mov    -0x8(%ebp),%edx
    280e:	89 10                	mov    %edx,(%eax)
  freep = p;
    2810:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2813:	a3 9c ca 00 00       	mov    %eax,0xca9c
}
    2818:	90                   	nop
    2819:	c9                   	leave  
    281a:	c3                   	ret    

0000281b <morecore>:

static Header*
morecore(uint nu)
{
    281b:	55                   	push   %ebp
    281c:	89 e5                	mov    %esp,%ebp
    281e:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    2821:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    2828:	77 07                	ja     2831 <morecore+0x16>
    nu = 4096;
    282a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    2831:	8b 45 08             	mov    0x8(%ebp),%eax
    2834:	c1 e0 03             	shl    $0x3,%eax
    2837:	83 ec 0c             	sub    $0xc,%esp
    283a:	50                   	push   %eax
    283b:	e8 03 fc ff ff       	call   2443 <sbrk>
    2840:	83 c4 10             	add    $0x10,%esp
    2843:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    2846:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    284a:	75 07                	jne    2853 <morecore+0x38>
    return 0;
    284c:	b8 00 00 00 00       	mov    $0x0,%eax
    2851:	eb 26                	jmp    2879 <morecore+0x5e>
  hp = (Header*)p;
    2853:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2856:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    2859:	8b 45 f0             	mov    -0x10(%ebp),%eax
    285c:	8b 55 08             	mov    0x8(%ebp),%edx
    285f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    2862:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2865:	83 c0 08             	add    $0x8,%eax
    2868:	83 ec 0c             	sub    $0xc,%esp
    286b:	50                   	push   %eax
    286c:	e8 c8 fe ff ff       	call   2739 <free>
    2871:	83 c4 10             	add    $0x10,%esp
  return freep;
    2874:	a1 9c ca 00 00       	mov    0xca9c,%eax
}
    2879:	c9                   	leave  
    287a:	c3                   	ret    

0000287b <malloc>:

void*
malloc(uint nbytes)
{
    287b:	55                   	push   %ebp
    287c:	89 e5                	mov    %esp,%ebp
    287e:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2881:	8b 45 08             	mov    0x8(%ebp),%eax
    2884:	83 c0 07             	add    $0x7,%eax
    2887:	c1 e8 03             	shr    $0x3,%eax
    288a:	83 c0 01             	add    $0x1,%eax
    288d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    2890:	a1 9c ca 00 00       	mov    0xca9c,%eax
    2895:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2898:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    289c:	75 23                	jne    28c1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    289e:	c7 45 f0 94 ca 00 00 	movl   $0xca94,-0x10(%ebp)
    28a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28a8:	a3 9c ca 00 00       	mov    %eax,0xca9c
    28ad:	a1 9c ca 00 00       	mov    0xca9c,%eax
    28b2:	a3 94 ca 00 00       	mov    %eax,0xca94
    base.s.size = 0;
    28b7:	c7 05 98 ca 00 00 00 	movl   $0x0,0xca98
    28be:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    28c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28c4:	8b 00                	mov    (%eax),%eax
    28c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    28c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28cc:	8b 40 04             	mov    0x4(%eax),%eax
    28cf:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    28d2:	77 4d                	ja     2921 <malloc+0xa6>
      if(p->s.size == nunits)
    28d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28d7:	8b 40 04             	mov    0x4(%eax),%eax
    28da:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    28dd:	75 0c                	jne    28eb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    28df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28e2:	8b 10                	mov    (%eax),%edx
    28e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28e7:	89 10                	mov    %edx,(%eax)
    28e9:	eb 26                	jmp    2911 <malloc+0x96>
      else {
        p->s.size -= nunits;
    28eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28ee:	8b 40 04             	mov    0x4(%eax),%eax
    28f1:	2b 45 ec             	sub    -0x14(%ebp),%eax
    28f4:	89 c2                	mov    %eax,%edx
    28f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28f9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    28fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28ff:	8b 40 04             	mov    0x4(%eax),%eax
    2902:	c1 e0 03             	shl    $0x3,%eax
    2905:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    2908:	8b 45 f4             	mov    -0xc(%ebp),%eax
    290b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    290e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    2911:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2914:	a3 9c ca 00 00       	mov    %eax,0xca9c
      return (void*)(p + 1);
    2919:	8b 45 f4             	mov    -0xc(%ebp),%eax
    291c:	83 c0 08             	add    $0x8,%eax
    291f:	eb 3b                	jmp    295c <malloc+0xe1>
    }
    if(p == freep)
    2921:	a1 9c ca 00 00       	mov    0xca9c,%eax
    2926:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2929:	75 1e                	jne    2949 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    292b:	83 ec 0c             	sub    $0xc,%esp
    292e:	ff 75 ec             	pushl  -0x14(%ebp)
    2931:	e8 e5 fe ff ff       	call   281b <morecore>
    2936:	83 c4 10             	add    $0x10,%esp
    2939:	89 45 f4             	mov    %eax,-0xc(%ebp)
    293c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2940:	75 07                	jne    2949 <malloc+0xce>
        return 0;
    2942:	b8 00 00 00 00       	mov    $0x0,%eax
    2947:	eb 13                	jmp    295c <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2949:	8b 45 f4             	mov    -0xc(%ebp),%eax
    294c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    294f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2952:	8b 00                	mov    (%eax),%eax
    2954:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    2957:	e9 6d ff ff ff       	jmp    28c9 <malloc+0x4e>
  }
}
    295c:	c9                   	leave  
    295d:	c3                   	ret    

0000295e <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    295e:	55                   	push   %ebp
    295f:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    2961:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2965:	79 07                	jns    296e <abs+0x10>
		return x * -1;
    2967:	8b 45 08             	mov    0x8(%ebp),%eax
    296a:	f7 d8                	neg    %eax
    296c:	eb 03                	jmp    2971 <abs+0x13>
	else
		return x;
    296e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2971:	5d                   	pop    %ebp
    2972:	c3                   	ret    

00002973 <sin>:
double sin(double x)  
{  
    2973:	55                   	push   %ebp
    2974:	89 e5                	mov    %esp,%ebp
    2976:	83 ec 40             	sub    $0x40,%esp
    2979:	8b 45 08             	mov    0x8(%ebp),%eax
    297c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    297f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2982:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    2985:	dd 45 c8             	fldl   -0x38(%ebp)
    2988:	dd 5d f8             	fstpl  -0x8(%ebp)
    298b:	d9 e8                	fld1   
    298d:	dd 5d f0             	fstpl  -0x10(%ebp)
    2990:	dd 45 c8             	fldl   -0x38(%ebp)
    2993:	dd 5d e8             	fstpl  -0x18(%ebp)
    2996:	dd 45 c8             	fldl   -0x38(%ebp)
    2999:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    299c:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    29a3:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    29aa:	eb 4f                	jmp    29fb <sin+0x88>
	{  
		n = n+1;  
    29ac:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    29b0:	db 45 dc             	fildl  -0x24(%ebp)
    29b3:	dc 4d f0             	fmull  -0x10(%ebp)
    29b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    29b9:	83 c0 01             	add    $0x1,%eax
    29bc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    29bf:	db 45 c4             	fildl  -0x3c(%ebp)
    29c2:	de c9                	fmulp  %st,%st(1)
    29c4:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    29c7:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    29cb:	dd 45 c8             	fldl   -0x38(%ebp)
    29ce:	d8 c8                	fmul   %st(0),%st
    29d0:	dd 45 e8             	fldl   -0x18(%ebp)
    29d3:	de c9                	fmulp  %st,%st(1)
    29d5:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    29d8:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    29db:	dd 45 e8             	fldl   -0x18(%ebp)
    29de:	dc 75 f0             	fdivl  -0x10(%ebp)
    29e1:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    29e4:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    29e8:	7e 08                	jle    29f2 <sin+0x7f>
    29ea:	dd 45 f8             	fldl   -0x8(%ebp)
    29ed:	dc 45 e0             	faddl  -0x20(%ebp)
    29f0:	eb 06                	jmp    29f8 <sin+0x85>
    29f2:	dd 45 f8             	fldl   -0x8(%ebp)
    29f5:	dc 65 e0             	fsubl  -0x20(%ebp)
    29f8:	dd 5d f8             	fstpl  -0x8(%ebp)
	while(Precious>1e-6)  
    29fb:	dd 05 00 8d 00 00    	fldl   0x8d00
    2a01:	dd 45 e0             	fldl   -0x20(%ebp)
    2a04:	df f1                	fcomip %st(1),%st
    2a06:	dd d8                	fstp   %st(0)
    2a08:	77 a2                	ja     29ac <sin+0x39>
	}  
	return Result;  
    2a0a:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    2a0d:	c9                   	leave  
    2a0e:	c3                   	ret    

00002a0f <cos>:
double cos(double x)  
{  
    2a0f:	55                   	push   %ebp
    2a10:	89 e5                	mov    %esp,%ebp
    2a12:	83 ec 08             	sub    $0x8,%esp
    2a15:	8b 45 08             	mov    0x8(%ebp),%eax
    2a18:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2a1b:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a1e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    2a21:	dd 05 08 8d 00 00    	fldl   0x8d08
    2a27:	dc 65 f8             	fsubl  -0x8(%ebp)
    2a2a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2a2e:	dd 1c 24             	fstpl  (%esp)
    2a31:	e8 3d ff ff ff       	call   2973 <sin>
    2a36:	83 c4 08             	add    $0x8,%esp
}  
    2a39:	c9                   	leave  
    2a3a:	c3                   	ret    

00002a3b <tan>:
double tan(double x)  
{  
    2a3b:	55                   	push   %ebp
    2a3c:	89 e5                	mov    %esp,%ebp
    2a3e:	83 ec 10             	sub    $0x10,%esp
    2a41:	8b 45 08             	mov    0x8(%ebp),%eax
    2a44:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2a47:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a4a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    2a4d:	ff 75 fc             	pushl  -0x4(%ebp)
    2a50:	ff 75 f8             	pushl  -0x8(%ebp)
    2a53:	e8 1b ff ff ff       	call   2973 <sin>
    2a58:	83 c4 08             	add    $0x8,%esp
    2a5b:	dd 5d f0             	fstpl  -0x10(%ebp)
    2a5e:	ff 75 fc             	pushl  -0x4(%ebp)
    2a61:	ff 75 f8             	pushl  -0x8(%ebp)
    2a64:	e8 a6 ff ff ff       	call   2a0f <cos>
    2a69:	83 c4 08             	add    $0x8,%esp
    2a6c:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    2a6f:	c9                   	leave  
    2a70:	c3                   	ret    

00002a71 <pow>:

double pow(double x, double y)
{
    2a71:	55                   	push   %ebp
    2a72:	89 e5                	mov    %esp,%ebp
    2a74:	83 ec 38             	sub    $0x38,%esp
    2a77:	8b 45 08             	mov    0x8(%ebp),%eax
    2a7a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2a7d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2a83:	8b 45 10             	mov    0x10(%ebp),%eax
    2a86:	89 45 d8             	mov    %eax,-0x28(%ebp)
    2a89:	8b 45 14             	mov    0x14(%ebp),%eax
    2a8c:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    2a8f:	dd 45 e0             	fldl   -0x20(%ebp)
    2a92:	d9 ee                	fldz   
    2a94:	df e9                	fucomip %st(1),%st
    2a96:	dd d8                	fstp   %st(0)
    2a98:	7a 28                	jp     2ac2 <pow+0x51>
    2a9a:	dd 45 e0             	fldl   -0x20(%ebp)
    2a9d:	d9 ee                	fldz   
    2a9f:	df e9                	fucomip %st(1),%st
    2aa1:	dd d8                	fstp   %st(0)
    2aa3:	75 1d                	jne    2ac2 <pow+0x51>
    2aa5:	dd 45 d8             	fldl   -0x28(%ebp)
    2aa8:	d9 ee                	fldz   
    2aaa:	df e9                	fucomip %st(1),%st
    2aac:	dd d8                	fstp   %st(0)
    2aae:	7a 0b                	jp     2abb <pow+0x4a>
    2ab0:	dd 45 d8             	fldl   -0x28(%ebp)
    2ab3:	d9 ee                	fldz   
    2ab5:	df f1                	fcomip %st(1),%st
    2ab7:	dd d8                	fstp   %st(0)
    2ab9:	74 07                	je     2ac2 <pow+0x51>
    2abb:	d9 ee                	fldz   
    2abd:	e9 36 01 00 00       	jmp    2bf8 <pow+0x187>
	else if(x==0 && y==0) return 1;
    2ac2:	dd 45 e0             	fldl   -0x20(%ebp)
    2ac5:	d9 ee                	fldz   
    2ac7:	df e9                	fucomip %st(1),%st
    2ac9:	dd d8                	fstp   %st(0)
    2acb:	7a 28                	jp     2af5 <pow+0x84>
    2acd:	dd 45 e0             	fldl   -0x20(%ebp)
    2ad0:	d9 ee                	fldz   
    2ad2:	df e9                	fucomip %st(1),%st
    2ad4:	dd d8                	fstp   %st(0)
    2ad6:	75 1d                	jne    2af5 <pow+0x84>
    2ad8:	dd 45 d8             	fldl   -0x28(%ebp)
    2adb:	d9 ee                	fldz   
    2add:	df e9                	fucomip %st(1),%st
    2adf:	dd d8                	fstp   %st(0)
    2ae1:	7a 12                	jp     2af5 <pow+0x84>
    2ae3:	dd 45 d8             	fldl   -0x28(%ebp)
    2ae6:	d9 ee                	fldz   
    2ae8:	df e9                	fucomip %st(1),%st
    2aea:	dd d8                	fstp   %st(0)
    2aec:	75 07                	jne    2af5 <pow+0x84>
    2aee:	d9 e8                	fld1   
    2af0:	e9 03 01 00 00       	jmp    2bf8 <pow+0x187>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    2af5:	dd 45 d8             	fldl   -0x28(%ebp)
    2af8:	d9 ee                	fldz   
    2afa:	df f1                	fcomip %st(1),%st
    2afc:	dd d8                	fstp   %st(0)
    2afe:	76 23                	jbe    2b23 <pow+0xb2>
    2b00:	dd 45 d8             	fldl   -0x28(%ebp)
    2b03:	d9 e0                	fchs   
    2b05:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2b09:	dd 1c 24             	fstpl  (%esp)
    2b0c:	ff 75 e4             	pushl  -0x1c(%ebp)
    2b0f:	ff 75 e0             	pushl  -0x20(%ebp)
    2b12:	e8 5a ff ff ff       	call   2a71 <pow>
    2b17:	83 c4 10             	add    $0x10,%esp
    2b1a:	d9 e8                	fld1   
    2b1c:	de f1                	fdivp  %st,%st(1)
    2b1e:	e9 d5 00 00 00       	jmp    2bf8 <pow+0x187>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    2b23:	dd 45 e0             	fldl   -0x20(%ebp)
    2b26:	d9 ee                	fldz   
    2b28:	df f1                	fcomip %st(1),%st
    2b2a:	dd d8                	fstp   %st(0)
    2b2c:	76 3b                	jbe    2b69 <pow+0xf8>
    2b2e:	dd 45 d8             	fldl   -0x28(%ebp)
    2b31:	d9 7d d6             	fnstcw -0x2a(%ebp)
    2b34:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    2b38:	80 cc 0c             	or     $0xc,%ah
    2b3b:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    2b3f:	d9 6d d4             	fldcw  -0x2c(%ebp)
    2b42:	db 5d d0             	fistpl -0x30(%ebp)
    2b45:	d9 6d d6             	fldcw  -0x2a(%ebp)
    2b48:	db 45 d0             	fildl  -0x30(%ebp)
    2b4b:	dd 45 d8             	fldl   -0x28(%ebp)
    2b4e:	de e1                	fsubp  %st,%st(1)
    2b50:	d9 ee                	fldz   
    2b52:	df e9                	fucomip %st(1),%st
    2b54:	7a 0a                	jp     2b60 <pow+0xef>
    2b56:	d9 ee                	fldz   
    2b58:	df f1                	fcomip %st(1),%st
    2b5a:	dd d8                	fstp   %st(0)
    2b5c:	74 0b                	je     2b69 <pow+0xf8>
    2b5e:	eb 02                	jmp    2b62 <pow+0xf1>
    2b60:	dd d8                	fstp   %st(0)
    2b62:	d9 ee                	fldz   
    2b64:	e9 8f 00 00 00       	jmp    2bf8 <pow+0x187>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    2b69:	dd 45 e0             	fldl   -0x20(%ebp)
    2b6c:	d9 ee                	fldz   
    2b6e:	df f1                	fcomip %st(1),%st
    2b70:	dd d8                	fstp   %st(0)
    2b72:	76 5e                	jbe    2bd2 <pow+0x161>
    2b74:	dd 45 d8             	fldl   -0x28(%ebp)
    2b77:	d9 7d d6             	fnstcw -0x2a(%ebp)
    2b7a:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    2b7e:	80 cc 0c             	or     $0xc,%ah
    2b81:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    2b85:	d9 6d d4             	fldcw  -0x2c(%ebp)
    2b88:	db 5d d0             	fistpl -0x30(%ebp)
    2b8b:	d9 6d d6             	fldcw  -0x2a(%ebp)
    2b8e:	db 45 d0             	fildl  -0x30(%ebp)
    2b91:	dd 45 d8             	fldl   -0x28(%ebp)
    2b94:	de e1                	fsubp  %st,%st(1)
    2b96:	d9 ee                	fldz   
    2b98:	df e9                	fucomip %st(1),%st
    2b9a:	7a 34                	jp     2bd0 <pow+0x15f>
    2b9c:	d9 ee                	fldz   
    2b9e:	df e9                	fucomip %st(1),%st
    2ba0:	dd d8                	fstp   %st(0)
    2ba2:	75 2e                	jne    2bd2 <pow+0x161>
	{
		double powint=1;
    2ba4:	d9 e8                	fld1   
    2ba6:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    2ba9:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    2bb0:	eb 0d                	jmp    2bbf <pow+0x14e>
    2bb2:	dd 45 f0             	fldl   -0x10(%ebp)
    2bb5:	dc 4d e0             	fmull  -0x20(%ebp)
    2bb8:	dd 5d f0             	fstpl  -0x10(%ebp)
    2bbb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    2bbf:	db 45 ec             	fildl  -0x14(%ebp)
    2bc2:	dd 45 d8             	fldl   -0x28(%ebp)
    2bc5:	df f1                	fcomip %st(1),%st
    2bc7:	dd d8                	fstp   %st(0)
    2bc9:	73 e7                	jae    2bb2 <pow+0x141>
		return powint;
    2bcb:	dd 45 f0             	fldl   -0x10(%ebp)
    2bce:	eb 28                	jmp    2bf8 <pow+0x187>
    2bd0:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    2bd2:	83 ec 08             	sub    $0x8,%esp
    2bd5:	ff 75 e4             	pushl  -0x1c(%ebp)
    2bd8:	ff 75 e0             	pushl  -0x20(%ebp)
    2bdb:	e8 49 00 00 00       	call   2c29 <ln>
    2be0:	83 c4 10             	add    $0x10,%esp
    2be3:	dc 4d d8             	fmull  -0x28(%ebp)
    2be6:	83 ec 08             	sub    $0x8,%esp
    2be9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2bed:	dd 1c 24             	fstpl  (%esp)
    2bf0:	e8 27 02 00 00       	call   2e1c <exp>
    2bf5:	83 c4 10             	add    $0x10,%esp
}
    2bf8:	c9                   	leave  
    2bf9:	c3                   	ret    

00002bfa <sqrt>:
// 求根
double sqrt(double x)
{
    2bfa:	55                   	push   %ebp
    2bfb:	89 e5                	mov    %esp,%ebp
    2bfd:	83 ec 18             	sub    $0x18,%esp
    2c00:	8b 45 08             	mov    0x8(%ebp),%eax
    2c03:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2c06:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c09:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    2c0c:	dd 05 10 8d 00 00    	fldl   0x8d10
    2c12:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2c16:	dd 1c 24             	fstpl  (%esp)
    2c19:	ff 75 f4             	pushl  -0xc(%ebp)
    2c1c:	ff 75 f0             	pushl  -0x10(%ebp)
    2c1f:	e8 4d fe ff ff       	call   2a71 <pow>
    2c24:	83 c4 10             	add    $0x10,%esp
}
    2c27:	c9                   	leave  
    2c28:	c3                   	ret    

00002c29 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    2c29:	55                   	push   %ebp
    2c2a:	89 e5                	mov    %esp,%ebp
    2c2c:	83 ec 78             	sub    $0x78,%esp
    2c2f:	8b 45 08             	mov    0x8(%ebp),%eax
    2c32:	89 45 90             	mov    %eax,-0x70(%ebp)
    2c35:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c38:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    2c3b:	dd 45 90             	fldl   -0x70(%ebp)
    2c3e:	d9 e8                	fld1   
    2c40:	de e9                	fsubrp %st,%st(1)
    2c42:	dd 5d c0             	fstpl  -0x40(%ebp)
    2c45:	d9 ee                	fldz   
    2c47:	dd 5d f0             	fstpl  -0x10(%ebp)
    2c4a:	d9 ee                	fldz   
    2c4c:	dd 5d b8             	fstpl  -0x48(%ebp)
    2c4f:	d9 ee                	fldz   
    2c51:	dd 5d b0             	fstpl  -0x50(%ebp)
    2c54:	d9 ee                	fldz   
    2c56:	dd 5d e8             	fstpl  -0x18(%ebp)
    2c59:	d9 e8                	fld1   
    2c5b:	dd 5d e0             	fstpl  -0x20(%ebp)
    2c5e:	d9 e8                	fld1   
    2c60:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    2c63:	dd 45 90             	fldl   -0x70(%ebp)
    2c66:	d9 e8                	fld1   
    2c68:	df e9                	fucomip %st(1),%st
    2c6a:	dd d8                	fstp   %st(0)
    2c6c:	7a 12                	jp     2c80 <ln+0x57>
    2c6e:	dd 45 90             	fldl   -0x70(%ebp)
    2c71:	d9 e8                	fld1   
    2c73:	df e9                	fucomip %st(1),%st
    2c75:	dd d8                	fstp   %st(0)
    2c77:	75 07                	jne    2c80 <ln+0x57>
    2c79:	d9 ee                	fldz   
    2c7b:	e9 9a 01 00 00       	jmp    2e1a <ln+0x1f1>
	else if(x>2) return -ln(1/x);
    2c80:	dd 05 18 8d 00 00    	fldl   0x8d18
    2c86:	dd 45 90             	fldl   -0x70(%ebp)
    2c89:	df f1                	fcomip %st(1),%st
    2c8b:	dd d8                	fstp   %st(0)
    2c8d:	76 1e                	jbe    2cad <ln+0x84>
    2c8f:	d9 e8                	fld1   
    2c91:	dc 75 90             	fdivl  -0x70(%ebp)
    2c94:	83 ec 08             	sub    $0x8,%esp
    2c97:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2c9b:	dd 1c 24             	fstpl  (%esp)
    2c9e:	e8 86 ff ff ff       	call   2c29 <ln>
    2ca3:	83 c4 10             	add    $0x10,%esp
    2ca6:	d9 e0                	fchs   
    2ca8:	e9 6d 01 00 00       	jmp    2e1a <ln+0x1f1>
	else if(x<.1)
    2cad:	dd 45 90             	fldl   -0x70(%ebp)
    2cb0:	dd 05 20 8d 00 00    	fldl   0x8d20
    2cb6:	df f1                	fcomip %st(1),%st
    2cb8:	dd d8                	fstp   %st(0)
    2cba:	76 61                	jbe    2d1d <ln+0xf4>
	{
		double n=-1;
    2cbc:	d9 e8                	fld1   
    2cbe:	d9 e0                	fchs   
    2cc0:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    2cc3:	dd 45 c8             	fldl   -0x38(%ebp)
    2cc6:	dd 05 28 8d 00 00    	fldl   0x8d28
    2ccc:	de e9                	fsubrp %st,%st(1)
    2cce:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    2cd1:	83 ec 08             	sub    $0x8,%esp
    2cd4:	ff 75 cc             	pushl  -0x34(%ebp)
    2cd7:	ff 75 c8             	pushl  -0x38(%ebp)
    2cda:	e8 3d 01 00 00       	call   2e1c <exp>
    2cdf:	83 c4 10             	add    $0x10,%esp
    2ce2:	dd 45 90             	fldl   -0x70(%ebp)
    2ce5:	de f1                	fdivp  %st,%st(1)
    2ce7:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    2cea:	dd 05 18 8d 00 00    	fldl   0x8d18
    2cf0:	dd 45 a0             	fldl   -0x60(%ebp)
    2cf3:	df f1                	fcomip %st(1),%st
    2cf5:	dd d8                	fstp   %st(0)
    2cf7:	77 ca                	ja     2cc3 <ln+0x9a>
    2cf9:	dd 45 a0             	fldl   -0x60(%ebp)
    2cfc:	d9 e8                	fld1   
    2cfe:	df f1                	fcomip %st(1),%st
    2d00:	dd d8                	fstp   %st(0)
    2d02:	77 bf                	ja     2cc3 <ln+0x9a>
		return ln(a)+n;
    2d04:	83 ec 08             	sub    $0x8,%esp
    2d07:	ff 75 a4             	pushl  -0x5c(%ebp)
    2d0a:	ff 75 a0             	pushl  -0x60(%ebp)
    2d0d:	e8 17 ff ff ff       	call   2c29 <ln>
    2d12:	83 c4 10             	add    $0x10,%esp
    2d15:	dc 45 c8             	faddl  -0x38(%ebp)
    2d18:	e9 fd 00 00 00       	jmp    2e1a <ln+0x1f1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    2d1d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    2d24:	d9 e8                	fld1   
    2d26:	dd 5d d8             	fstpl  -0x28(%ebp)
    2d29:	e9 bb 00 00 00       	jmp    2de9 <ln+0x1c0>
	{
		ln_tmp=ln_px;
    2d2e:	dd 45 e8             	fldl   -0x18(%ebp)
    2d31:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    2d34:	dd 45 d8             	fldl   -0x28(%ebp)
    2d37:	dc 4d c0             	fmull  -0x40(%ebp)
    2d3a:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    2d3d:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    2d41:	75 0d                	jne    2d50 <ln+0x127>
    2d43:	db 45 d4             	fildl  -0x2c(%ebp)
    2d46:	dd 45 d8             	fldl   -0x28(%ebp)
    2d49:	de f1                	fdivp  %st,%st(1)
    2d4b:	dd 5d d8             	fstpl  -0x28(%ebp)
    2d4e:	eb 13                	jmp    2d63 <ln+0x13a>
		else tmp=tmp/-l;
    2d50:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2d53:	f7 d8                	neg    %eax
    2d55:	89 45 8c             	mov    %eax,-0x74(%ebp)
    2d58:	db 45 8c             	fildl  -0x74(%ebp)
    2d5b:	dd 45 d8             	fldl   -0x28(%ebp)
    2d5e:	de f1                	fdivp  %st,%st(1)
    2d60:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    2d63:	dd 45 f0             	fldl   -0x10(%ebp)
    2d66:	dc 45 d8             	faddl  -0x28(%ebp)
    2d69:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    2d6c:	dd 45 d8             	fldl   -0x28(%ebp)
    2d6f:	d9 e0                	fchs   
    2d71:	dc 4d c0             	fmull  -0x40(%ebp)
    2d74:	db 45 d4             	fildl  -0x2c(%ebp)
    2d77:	de c9                	fmulp  %st,%st(1)
    2d79:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2d7c:	83 c0 01             	add    $0x1,%eax
    2d7f:	89 45 8c             	mov    %eax,-0x74(%ebp)
    2d82:	db 45 8c             	fildl  -0x74(%ebp)
    2d85:	de f9                	fdivrp %st,%st(1)
    2d87:	dd 45 f0             	fldl   -0x10(%ebp)
    2d8a:	de c1                	faddp  %st,%st(1)
    2d8c:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    2d8f:	dd 45 d8             	fldl   -0x28(%ebp)
    2d92:	dc 4d c0             	fmull  -0x40(%ebp)
    2d95:	dc 4d c0             	fmull  -0x40(%ebp)
    2d98:	db 45 d4             	fildl  -0x2c(%ebp)
    2d9b:	de c9                	fmulp  %st,%st(1)
    2d9d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2da0:	83 c0 02             	add    $0x2,%eax
    2da3:	89 45 8c             	mov    %eax,-0x74(%ebp)
    2da6:	db 45 8c             	fildl  -0x74(%ebp)
    2da9:	de f9                	fdivrp %st,%st(1)
    2dab:	dd 45 b8             	fldl   -0x48(%ebp)
    2dae:	de c1                	faddp  %st,%st(1)
    2db0:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    2db3:	dd 45 b0             	fldl   -0x50(%ebp)
    2db6:	dc 65 b8             	fsubl  -0x48(%ebp)
    2db9:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    2dbc:	dd 45 a8             	fldl   -0x58(%ebp)
    2dbf:	d9 c0                	fld    %st(0)
    2dc1:	de c9                	fmulp  %st,%st(1)
    2dc3:	dd 45 b8             	fldl   -0x48(%ebp)
    2dc6:	d8 c0                	fadd   %st(0),%st
    2dc8:	dd 45 b0             	fldl   -0x50(%ebp)
    2dcb:	de e1                	fsubp  %st,%st(1)
    2dcd:	dc 45 f0             	faddl  -0x10(%ebp)
    2dd0:	de f9                	fdivrp %st,%st(1)
    2dd2:	dd 45 b0             	fldl   -0x50(%ebp)
    2dd5:	de e1                	fsubp  %st,%st(1)
    2dd7:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    2dda:	db 45 d4             	fildl  -0x2c(%ebp)
    2ddd:	dd 45 d8             	fldl   -0x28(%ebp)
    2de0:	de c9                	fmulp  %st,%st(1)
    2de2:	dd 5d d8             	fstpl  -0x28(%ebp)
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    2de5:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    2de9:	dd 45 e8             	fldl   -0x18(%ebp)
    2dec:	dc 65 e0             	fsubl  -0x20(%ebp)
    2def:	dd 05 30 8d 00 00    	fldl   0x8d30
    2df5:	d9 c9                	fxch   %st(1)
    2df7:	df f1                	fcomip %st(1),%st
    2df9:	dd d8                	fstp   %st(0)
    2dfb:	0f 87 2d ff ff ff    	ja     2d2e <ln+0x105>
    2e01:	dd 45 e8             	fldl   -0x18(%ebp)
    2e04:	dc 65 e0             	fsubl  -0x20(%ebp)
    2e07:	dd 05 38 8d 00 00    	fldl   0x8d38
    2e0d:	df f1                	fcomip %st(1),%st
    2e0f:	dd d8                	fstp   %st(0)
    2e11:	0f 87 17 ff ff ff    	ja     2d2e <ln+0x105>
	}
	return ln_px;
    2e17:	dd 45 e8             	fldl   -0x18(%ebp)
}
    2e1a:	c9                   	leave  
    2e1b:	c3                   	ret    

00002e1c <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    2e1c:	55                   	push   %ebp
    2e1d:	89 e5                	mov    %esp,%ebp
    2e1f:	83 ec 68             	sub    $0x68,%esp
    2e22:	8b 45 08             	mov    0x8(%ebp),%eax
    2e25:	89 45 a0             	mov    %eax,-0x60(%ebp)
    2e28:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e2b:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    2e2e:	dd 45 a0             	fldl   -0x60(%ebp)
    2e31:	dd 5d c0             	fstpl  -0x40(%ebp)
    2e34:	d9 ee                	fldz   
    2e36:	dd 5d f0             	fstpl  -0x10(%ebp)
    2e39:	d9 ee                	fldz   
    2e3b:	dd 5d b8             	fstpl  -0x48(%ebp)
    2e3e:	d9 ee                	fldz   
    2e40:	dd 5d b0             	fstpl  -0x50(%ebp)
    2e43:	d9 ee                	fldz   
    2e45:	dd 5d e8             	fstpl  -0x18(%ebp)
    2e48:	d9 e8                	fld1   
    2e4a:	dd 5d e0             	fstpl  -0x20(%ebp)
    2e4d:	d9 e8                	fld1   
    2e4f:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    2e52:	dd 45 a0             	fldl   -0x60(%ebp)
    2e55:	d9 ee                	fldz   
    2e57:	df e9                	fucomip %st(1),%st
    2e59:	dd d8                	fstp   %st(0)
    2e5b:	7a 12                	jp     2e6f <exp+0x53>
    2e5d:	dd 45 a0             	fldl   -0x60(%ebp)
    2e60:	d9 ee                	fldz   
    2e62:	df e9                	fucomip %st(1),%st
    2e64:	dd d8                	fstp   %st(0)
    2e66:	75 07                	jne    2e6f <exp+0x53>
    2e68:	d9 e8                	fld1   
    2e6a:	e9 13 01 00 00       	jmp    2f82 <exp+0x166>
	if(x<0) return 1/exp(-x); 
    2e6f:	dd 45 a0             	fldl   -0x60(%ebp)
    2e72:	d9 ee                	fldz   
    2e74:	df f1                	fcomip %st(1),%st
    2e76:	dd d8                	fstp   %st(0)
    2e78:	76 20                	jbe    2e9a <exp+0x7e>
    2e7a:	dd 45 a0             	fldl   -0x60(%ebp)
    2e7d:	d9 e0                	fchs   
    2e7f:	83 ec 08             	sub    $0x8,%esp
    2e82:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    2e86:	dd 1c 24             	fstpl  (%esp)
    2e89:	e8 8e ff ff ff       	call   2e1c <exp>
    2e8e:	83 c4 10             	add    $0x10,%esp
    2e91:	d9 e8                	fld1   
    2e93:	de f1                	fdivp  %st,%st(1)
    2e95:	e9 e8 00 00 00       	jmp    2f82 <exp+0x166>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    2e9a:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    2ea1:	d9 e8                	fld1   
    2ea3:	dd 5d d0             	fstpl  -0x30(%ebp)
    2ea6:	e9 97 00 00 00       	jmp    2f42 <exp+0x126>
	{
		ex_tmp=ex_px;
    2eab:	dd 45 e8             	fldl   -0x18(%ebp)
    2eae:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    2eb1:	dd 45 d0             	fldl   -0x30(%ebp)
    2eb4:	dc 4d c0             	fmull  -0x40(%ebp)
    2eb7:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    2eba:	db 45 cc             	fildl  -0x34(%ebp)
    2ebd:	dd 45 d0             	fldl   -0x30(%ebp)
    2ec0:	de f1                	fdivp  %st,%st(1)
    2ec2:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    2ec5:	dd 45 f0             	fldl   -0x10(%ebp)
    2ec8:	dc 45 d0             	faddl  -0x30(%ebp)
    2ecb:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    2ece:	dd 45 d0             	fldl   -0x30(%ebp)
    2ed1:	dc 4d c0             	fmull  -0x40(%ebp)
    2ed4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2ed7:	83 c0 01             	add    $0x1,%eax
    2eda:	89 45 9c             	mov    %eax,-0x64(%ebp)
    2edd:	db 45 9c             	fildl  -0x64(%ebp)
    2ee0:	de f9                	fdivrp %st,%st(1)
    2ee2:	dd 45 f0             	fldl   -0x10(%ebp)
    2ee5:	de c1                	faddp  %st,%st(1)
    2ee7:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    2eea:	dd 45 d0             	fldl   -0x30(%ebp)
    2eed:	dc 4d c0             	fmull  -0x40(%ebp)
    2ef0:	dc 4d c0             	fmull  -0x40(%ebp)
    2ef3:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2ef6:	83 c0 01             	add    $0x1,%eax
    2ef9:	89 45 9c             	mov    %eax,-0x64(%ebp)
    2efc:	db 45 9c             	fildl  -0x64(%ebp)
    2eff:	de f9                	fdivrp %st,%st(1)
    2f01:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2f04:	83 c0 02             	add    $0x2,%eax
    2f07:	89 45 9c             	mov    %eax,-0x64(%ebp)
    2f0a:	db 45 9c             	fildl  -0x64(%ebp)
    2f0d:	de f9                	fdivrp %st,%st(1)
    2f0f:	dd 45 b8             	fldl   -0x48(%ebp)
    2f12:	de c1                	faddp  %st,%st(1)
    2f14:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    2f17:	dd 45 b0             	fldl   -0x50(%ebp)
    2f1a:	dc 65 b8             	fsubl  -0x48(%ebp)
    2f1d:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    2f20:	dd 45 d8             	fldl   -0x28(%ebp)
    2f23:	d9 c0                	fld    %st(0)
    2f25:	de c9                	fmulp  %st,%st(1)
    2f27:	dd 45 b8             	fldl   -0x48(%ebp)
    2f2a:	d8 c0                	fadd   %st(0),%st
    2f2c:	dd 45 b0             	fldl   -0x50(%ebp)
    2f2f:	de e1                	fsubp  %st,%st(1)
    2f31:	dc 45 f0             	faddl  -0x10(%ebp)
    2f34:	de f9                	fdivrp %st,%st(1)
    2f36:	dd 45 b0             	fldl   -0x50(%ebp)
    2f39:	de e1                	fsubp  %st,%st(1)
    2f3b:	dd 5d e8             	fstpl  -0x18(%ebp)
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    2f3e:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    2f42:	dd 45 e8             	fldl   -0x18(%ebp)
    2f45:	dc 65 e0             	fsubl  -0x20(%ebp)
    2f48:	dd 05 40 8d 00 00    	fldl   0x8d40
    2f4e:	d9 c9                	fxch   %st(1)
    2f50:	df f1                	fcomip %st(1),%st
    2f52:	dd d8                	fstp   %st(0)
    2f54:	77 12                	ja     2f68 <exp+0x14c>
    2f56:	dd 45 e8             	fldl   -0x18(%ebp)
    2f59:	dc 65 e0             	fsubl  -0x20(%ebp)
    2f5c:	dd 05 48 8d 00 00    	fldl   0x8d48
    2f62:	df f1                	fcomip %st(1),%st
    2f64:	dd d8                	fstp   %st(0)
    2f66:	76 13                	jbe    2f7b <exp+0x15f>
    2f68:	dd 05 40 8d 00 00    	fldl   0x8d40
    2f6e:	dd 45 d8             	fldl   -0x28(%ebp)
    2f71:	df f1                	fcomip %st(1),%st
    2f73:	dd d8                	fstp   %st(0)
    2f75:	0f 87 30 ff ff ff    	ja     2eab <exp+0x8f>
	}
	return ex_px+1;
    2f7b:	dd 45 e8             	fldl   -0x18(%ebp)
    2f7e:	d9 e8                	fld1   
    2f80:	de c1                	faddp  %st,%st(1)
    2f82:	c9                   	leave  
    2f83:	c3                   	ret    

00002f84 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    2f84:	55                   	push   %ebp
    2f85:	89 e5                	mov    %esp,%ebp
    2f87:	83 ec 68             	sub    $0x68,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    2f8a:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    2f8e:	83 ec 08             	sub    $0x8,%esp
    2f91:	ff 75 08             	pushl  0x8(%ebp)
    2f94:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    2f97:	50                   	push   %eax
    2f98:	e8 ed f1 ff ff       	call   218a <strcpy>
    2f9d:	83 c4 10             	add    $0x10,%esp
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    2fa0:	83 ec 08             	sub    $0x8,%esp
    2fa3:	6a 02                	push   $0x2
    2fa5:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    2fa8:	50                   	push   %eax
    2fa9:	e8 4d f4 ff ff       	call   23fb <open>
    2fae:	83 c4 10             	add    $0x10,%esp
    2fb1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2fb4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    2fb8:	75 16                	jne    2fd0 <OpenTableFile+0x4c>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    2fba:	83 ec 04             	sub    $0x4,%esp
    2fbd:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    2fc0:	50                   	push   %eax
    2fc1:	68 7c 8d 00 00       	push   $0x8d7c
    2fc6:	6a 00                	push   $0x0
    2fc8:	e8 da f5 ff ff       	call   25a7 <printf>
    2fcd:	83 c4 10             	add    $0x10,%esp
    }
    return f;
    2fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    2fd3:	c9                   	leave  
    2fd4:	c3                   	ret    

00002fd5 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    2fd5:	55                   	push   %ebp
    2fd6:	89 e5                	mov    %esp,%ebp
    2fd8:	57                   	push   %edi
    2fd9:	56                   	push   %esi
    2fda:	53                   	push   %ebx
    2fdb:	83 ec 1c             	sub    $0x1c,%esp
	layer *info = fr_ps->header;
    2fde:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe1:	8b 00                	mov    (%eax),%eax
    2fe3:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    2fe6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2fe9:	8b 78 14             	mov    0x14(%eax),%edi
    2fec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2fef:	8b 70 10             	mov    0x10(%eax),%esi
    2ff2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ff5:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    2ff8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ffb:	8b 40 08             	mov    0x8(%eax),%eax
	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    2ffe:	85 c0                	test   %eax,%eax
    3000:	0f 94 c0             	sete   %al
    3003:	0f b6 c8             	movzbl %al,%ecx
    3006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3009:	8b 50 04             	mov    0x4(%eax),%edx
    300c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    300f:	8b 00                	mov    (%eax),%eax
    3011:	57                   	push   %edi
    3012:	56                   	push   %esi
    3013:	53                   	push   %ebx
    3014:	51                   	push   %ecx
    3015:	52                   	push   %edx
    3016:	50                   	push   %eax
    3017:	68 9c 8d 00 00       	push   $0x8d9c
    301c:	6a 00                	push   $0x0
    301e:	e8 84 f5 ff ff       	call   25a7 <printf>
    3023:	83 c4 20             	add    $0x20,%esp
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    3026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3029:	8b 78 2c             	mov    0x2c(%eax),%edi
    302c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    302f:	8b 70 28             	mov    0x28(%eax),%esi
    3032:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3035:	8b 58 24             	mov    0x24(%eax),%ebx
    3038:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    303b:	8b 48 20             	mov    0x20(%eax),%ecx
    303e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3041:	8b 50 1c             	mov    0x1c(%eax),%edx
    3044:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3047:	8b 40 18             	mov    0x18(%eax),%eax
    304a:	57                   	push   %edi
    304b:	56                   	push   %esi
    304c:	53                   	push   %ebx
    304d:	51                   	push   %ecx
    304e:	52                   	push   %edx
    304f:	50                   	push   %eax
    3050:	68 dc 8d 00 00       	push   $0x8ddc
    3055:	6a 00                	push   $0x0
    3057:	e8 4b f5 ff ff       	call   25a7 <printf>
    305c:	83 c4 20             	add    $0x20,%esp
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    305f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3062:	8b 40 1c             	mov    0x1c(%eax),%eax
	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    3065:	8b 0c 85 80 c4 00 00 	mov    0xc480(,%eax,4),%ecx
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    306c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    306f:	8b 40 10             	mov    0x10(%eax),%eax
	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    3072:	dd 04 c5 60 c4 00 00 	fldl   0xc460(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    3079:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    307c:	8b 40 04             	mov    0x4(%eax),%eax
    307f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3082:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3085:	8b 58 0c             	mov    0xc(%eax),%ebx
	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    3088:	89 d0                	mov    %edx,%eax
    308a:	c1 e0 04             	shl    $0x4,%eax
    308d:	29 d0                	sub    %edx,%eax
    308f:	01 d8                	add    %ebx,%eax
    3091:	8b 14 85 a0 c3 00 00 	mov    0xc3a0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    3098:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    309b:	8b 40 04             	mov    0x4(%eax),%eax
    309e:	83 e8 01             	sub    $0x1,%eax
	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    30a1:	8b 04 85 80 c3 00 00 	mov    0xc380(,%eax,4),%eax
    30a8:	83 ec 04             	sub    $0x4,%esp
    30ab:	51                   	push   %ecx
    30ac:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    30b0:	dd 1c 24             	fstpl  (%esp)
    30b3:	52                   	push   %edx
    30b4:	50                   	push   %eax
    30b5:	68 04 8e 00 00       	push   $0x8e04
    30ba:	6a 00                	push   $0x0
    30bc:	e8 e6 f4 ff ff       	call   25a7 <printf>
    30c1:	83 c4 20             	add    $0x20,%esp

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    30c4:	8b 45 08             	mov    0x8(%ebp),%eax
    30c7:	8b 48 08             	mov    0x8(%eax),%ecx
    30ca:	8b 45 08             	mov    0x8(%ebp),%eax
    30cd:	8b 50 0c             	mov    0xc(%eax),%edx
    30d0:	8b 45 08             	mov    0x8(%ebp),%eax
    30d3:	8b 40 10             	mov    0x10(%eax),%eax
    30d6:	83 ec 0c             	sub    $0xc,%esp
    30d9:	51                   	push   %ecx
    30da:	52                   	push   %edx
    30db:	50                   	push   %eax
    30dc:	68 33 8e 00 00       	push   $0x8e33
    30e1:	6a 00                	push   $0x0
    30e3:	e8 bf f4 ff ff       	call   25a7 <printf>
    30e8:	83 c4 20             	add    $0x20,%esp
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    30eb:	90                   	nop
    30ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    30ef:	5b                   	pop    %ebx
    30f0:	5e                   	pop    %esi
    30f1:	5f                   	pop    %edi
    30f2:	5d                   	pop    %ebp
    30f3:	c3                   	ret    

000030f4 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    30f4:	55                   	push   %ebp
    30f5:	89 e5                	mov    %esp,%ebp
    30f7:	83 ec 18             	sub    $0x18,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    30fa:	83 ec 0c             	sub    $0xc,%esp
    30fd:	ff 75 08             	pushl  0x8(%ebp)
    3100:	e8 76 f7 ff ff       	call   287b <malloc>
    3105:	83 c4 10             	add    $0x10,%esp
    3108:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    310b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    310f:	74 15                	je     3126 <mem_alloc+0x32>
		memset(ptr, 0, block);
    3111:	83 ec 04             	sub    $0x4,%esp
    3114:	ff 75 08             	pushl  0x8(%ebp)
    3117:	6a 00                	push   $0x0
    3119:	ff 75 f4             	pushl  -0xc(%ebp)
    311c:	e8 ff f0 ff ff       	call   2220 <memset>
    3121:	83 c4 10             	add    $0x10,%esp
    3124:	eb 1a                	jmp    3140 <mem_alloc+0x4c>
	else{
		printf(0, "Unable to allocate %s\n", item);
    3126:	83 ec 04             	sub    $0x4,%esp
    3129:	ff 75 0c             	pushl  0xc(%ebp)
    312c:	68 4d 8e 00 00       	push   $0x8e4d
    3131:	6a 00                	push   $0x0
    3133:	e8 6f f4 ff ff       	call   25a7 <printf>
    3138:	83 c4 10             	add    $0x10,%esp
		exit();
    313b:	e8 7b f2 ff ff       	call   23bb <exit>
	}
	return ptr;
    3140:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3143:	c9                   	leave  
    3144:	c3                   	ret    

00003145 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    3145:	55                   	push   %ebp
    3146:	89 e5                	mov    %esp,%ebp
    3148:	83 ec 08             	sub    $0x8,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    314b:	8b 45 0c             	mov    0xc(%ebp),%eax
    314e:	83 ec 08             	sub    $0x8,%esp
    3151:	68 64 8e 00 00       	push   $0x8e64
    3156:	50                   	push   %eax
    3157:	e8 98 ff ff ff       	call   30f4 <mem_alloc>
    315c:	83 c4 10             	add    $0x10,%esp
    315f:	8b 55 08             	mov    0x8(%ebp),%edx
    3162:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    3165:	8b 45 08             	mov    0x8(%ebp),%eax
    3168:	8b 55 0c             	mov    0xc(%ebp),%edx
    316b:	89 50 08             	mov    %edx,0x8(%eax)
}
    316e:	90                   	nop
    316f:	c9                   	leave  
    3170:	c3                   	ret    

00003171 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    3171:	55                   	push   %ebp
    3172:	89 e5                	mov    %esp,%ebp
    3174:	83 ec 08             	sub    $0x8,%esp
	free(bs->buf);
    3177:	8b 45 08             	mov    0x8(%ebp),%eax
    317a:	8b 40 04             	mov    0x4(%eax),%eax
    317d:	83 ec 0c             	sub    $0xc,%esp
    3180:	50                   	push   %eax
    3181:	e8 b3 f5 ff ff       	call   2739 <free>
    3186:	83 c4 10             	add    $0x10,%esp
}
    3189:	90                   	nop
    318a:	c9                   	leave  
    318b:	c3                   	ret    

0000318c <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    318c:	55                   	push   %ebp
    318d:	89 e5                	mov    %esp,%ebp
    318f:	83 ec 08             	sub    $0x8,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    3192:	83 ec 08             	sub    $0x8,%esp
    3195:	6a 02                	push   $0x2
    3197:	ff 75 0c             	pushl  0xc(%ebp)
    319a:	e8 5c f2 ff ff       	call   23fb <open>
    319f:	83 c4 10             	add    $0x10,%esp
    31a2:	8b 55 08             	mov    0x8(%ebp),%edx
    31a5:	89 02                	mov    %eax,(%edx)
    31a7:	8b 45 08             	mov    0x8(%ebp),%eax
    31aa:	8b 00                	mov    (%eax),%eax
    31ac:	83 f8 ff             	cmp    $0xffffffff,%eax
    31af:	75 1a                	jne    31cb <open_bit_stream_r+0x3f>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    31b1:	83 ec 04             	sub    $0x4,%esp
    31b4:	ff 75 0c             	pushl  0xc(%ebp)
    31b7:	68 6b 8e 00 00       	push   $0x8e6b
    31bc:	6a 00                	push   $0x0
    31be:	e8 e4 f3 ff ff       	call   25a7 <printf>
    31c3:	83 c4 10             	add    $0x10,%esp
		exit();
    31c6:	e8 f0 f1 ff ff       	call   23bb <exit>
	}

	bs->format = BINARY;
    31cb:	8b 45 08             	mov    0x8(%ebp),%eax
    31ce:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    31d2:	83 ec 08             	sub    $0x8,%esp
    31d5:	ff 75 10             	pushl  0x10(%ebp)
    31d8:	ff 75 08             	pushl  0x8(%ebp)
    31db:	e8 65 ff ff ff       	call   3145 <alloc_buffer>
    31e0:	83 c4 10             	add    $0x10,%esp
	bs->buf_byte_idx=0;
    31e3:	8b 45 08             	mov    0x8(%ebp),%eax
    31e6:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    31ed:	8b 45 08             	mov    0x8(%ebp),%eax
    31f0:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    31f7:	8b 45 08             	mov    0x8(%ebp),%eax
    31fa:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    3201:	8b 45 08             	mov    0x8(%ebp),%eax
    3204:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    320b:	8b 45 08             	mov    0x8(%ebp),%eax
    320e:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    3215:	8b 45 08             	mov    0x8(%ebp),%eax
    3218:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    321f:	90                   	nop
    3220:	c9                   	leave  
    3221:	c3                   	ret    

00003222 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    3222:	55                   	push   %ebp
    3223:	89 e5                	mov    %esp,%ebp
    3225:	83 ec 08             	sub    $0x8,%esp
	close(bs->pt);
    3228:	8b 45 08             	mov    0x8(%ebp),%eax
    322b:	8b 00                	mov    (%eax),%eax
    322d:	83 ec 0c             	sub    $0xc,%esp
    3230:	50                   	push   %eax
    3231:	e8 ad f1 ff ff       	call   23e3 <close>
    3236:	83 c4 10             	add    $0x10,%esp
	desalloc_buffer(bs);
    3239:	83 ec 0c             	sub    $0xc,%esp
    323c:	ff 75 08             	pushl  0x8(%ebp)
    323f:	e8 2d ff ff ff       	call   3171 <desalloc_buffer>
    3244:	83 c4 10             	add    $0x10,%esp
}
    3247:	90                   	nop
    3248:	c9                   	leave  
    3249:	c3                   	ret    

0000324a <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    324a:	55                   	push   %ebp
    324b:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    324d:	8b 45 08             	mov    0x8(%ebp),%eax
    3250:	8b 40 20             	mov    0x20(%eax),%eax
}
    3253:	5d                   	pop    %ebp
    3254:	c3                   	ret    

00003255 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    3255:	55                   	push   %ebp
    3256:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    3258:	8b 45 08             	mov    0x8(%ebp),%eax
    325b:	8b 40 0c             	mov    0xc(%eax),%eax
}
    325e:	5d                   	pop    %ebp
    325f:	c3                   	ret    

00003260 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    3260:	55                   	push   %ebp
    3261:	89 e5                	mov    %esp,%ebp
    3263:	56                   	push   %esi
    3264:	53                   	push   %ebx
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    3265:	8b 45 08             	mov    0x8(%ebp),%eax
    3268:	8b 40 08             	mov    0x8(%eax),%eax
    326b:	8d 50 fe             	lea    -0x2(%eax),%edx
    326e:	8b 45 08             	mov    0x8(%ebp),%eax
    3271:	8b 40 10             	mov    0x10(%eax),%eax
    3274:	89 d3                	mov    %edx,%ebx
    3276:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    3278:	eb 30                	jmp    32aa <refill_buffer+0x4a>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    327a:	8b 45 08             	mov    0x8(%ebp),%eax
    327d:	8b 50 04             	mov    0x4(%eax),%edx
    3280:	89 d8                	mov    %ebx,%eax
    3282:	8d 58 ff             	lea    -0x1(%eax),%ebx
    3285:	01 c2                	add    %eax,%edx
    3287:	8b 45 08             	mov    0x8(%ebp),%eax
    328a:	8b 00                	mov    (%eax),%eax
    328c:	83 ec 04             	sub    $0x4,%esp
    328f:	6a 01                	push   $0x1
    3291:	52                   	push   %edx
    3292:	50                   	push   %eax
    3293:	e8 3b f1 ff ff       	call   23d3 <read>
    3298:	83 c4 10             	add    $0x10,%esp
    329b:	89 c6                	mov    %eax,%esi
		if (!n)
    329d:	85 f6                	test   %esi,%esi
    329f:	75 09                	jne    32aa <refill_buffer+0x4a>
		bs->eob= i+1;
    32a1:	8d 53 01             	lea    0x1(%ebx),%edx
    32a4:	8b 45 08             	mov    0x8(%ebp),%eax
    32a7:	89 50 1c             	mov    %edx,0x1c(%eax)
	while ((i>=0) && (!bs->eob)) {
    32aa:	85 db                	test   %ebx,%ebx
    32ac:	78 0a                	js     32b8 <refill_buffer+0x58>
    32ae:	8b 45 08             	mov    0x8(%ebp),%eax
    32b1:	8b 40 1c             	mov    0x1c(%eax),%eax
    32b4:	85 c0                	test   %eax,%eax
    32b6:	74 c2                	je     327a <refill_buffer+0x1a>
	}
}
    32b8:	90                   	nop
    32b9:	8d 65 f8             	lea    -0x8(%ebp),%esp
    32bc:	5b                   	pop    %ebx
    32bd:	5e                   	pop    %esi
    32be:	5d                   	pop    %ebp
    32bf:	c3                   	ret    

000032c0 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    32c0:	55                   	push   %ebp
    32c1:	89 e5                	mov    %esp,%ebp
    32c3:	57                   	push   %edi
    32c4:	56                   	push   %esi
    32c5:	53                   	push   %ebx
    32c6:	83 ec 1c             	sub    $0x1c,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    32c9:	8b 45 08             	mov    0x8(%ebp),%eax
    32cc:	8b 40 0c             	mov    0xc(%eax),%eax
    32cf:	8d 50 01             	lea    0x1(%eax),%edx
    32d2:	8b 45 08             	mov    0x8(%ebp),%eax
    32d5:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    32d8:	8b 45 08             	mov    0x8(%ebp),%eax
    32db:	8b 40 14             	mov    0x14(%eax),%eax
    32de:	85 c0                	test   %eax,%eax
    32e0:	0f 85 a4 00 00 00    	jne    338a <get1bit+0xca>
        bs->buf_bit_idx = 8;
    32e6:	8b 45 08             	mov    0x8(%ebp),%eax
    32e9:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    32f0:	8b 45 08             	mov    0x8(%ebp),%eax
    32f3:	8b 40 10             	mov    0x10(%eax),%eax
    32f6:	8d 50 ff             	lea    -0x1(%eax),%edx
    32f9:	8b 45 08             	mov    0x8(%ebp),%eax
    32fc:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    32ff:	8b 45 08             	mov    0x8(%ebp),%eax
    3302:	8b 40 10             	mov    0x10(%eax),%eax
    3305:	83 f8 03             	cmp    $0x3,%eax
    3308:	7e 10                	jle    331a <get1bit+0x5a>
    330a:	8b 45 08             	mov    0x8(%ebp),%eax
    330d:	8b 50 10             	mov    0x10(%eax),%edx
    3310:	8b 45 08             	mov    0x8(%ebp),%eax
    3313:	8b 40 1c             	mov    0x1c(%eax),%eax
    3316:	39 c2                	cmp    %eax,%edx
    3318:	7d 70                	jge    338a <get1bit+0xca>
             if (bs->eob)
    331a:	8b 45 08             	mov    0x8(%ebp),%eax
    331d:	8b 40 1c             	mov    0x1c(%eax),%eax
    3320:	85 c0                	test   %eax,%eax
    3322:	74 0c                	je     3330 <get1bit+0x70>
                bs->eobs = TRUE;
    3324:	8b 45 08             	mov    0x8(%ebp),%eax
    3327:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    332e:	eb 5a                	jmp    338a <get1bit+0xca>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    3330:	8b 45 08             	mov    0x8(%ebp),%eax
    3333:	8b 58 10             	mov    0x10(%eax),%ebx
    3336:	eb 31                	jmp    3369 <get1bit+0xa9>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    3338:	8b 45 08             	mov    0x8(%ebp),%eax
    333b:	8b 40 04             	mov    0x4(%eax),%eax
    333e:	89 da                	mov    %ebx,%edx
    3340:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    3343:	8b 45 08             	mov    0x8(%ebp),%eax
    3346:	8b 70 04             	mov    0x4(%eax),%esi
    3349:	8b 45 08             	mov    0x8(%ebp),%eax
    334c:	8b 40 08             	mov    0x8(%eax),%eax
    334f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3352:	8b 45 08             	mov    0x8(%ebp),%eax
    3355:	8b 78 10             	mov    0x10(%eax),%edi
    3358:	89 d0                	mov    %edx,%eax
    335a:	29 f8                	sub    %edi,%eax
    335c:	01 d8                	add    %ebx,%eax
    335e:	8d 14 06             	lea    (%esi,%eax,1),%edx
    3361:	0f b6 01             	movzbl (%ecx),%eax
    3364:	88 02                	mov    %al,(%edx)
                for (i=bs->buf_byte_idx; i>=0;i--)
    3366:	83 eb 01             	sub    $0x1,%ebx
    3369:	85 db                	test   %ebx,%ebx
    336b:	79 cb                	jns    3338 <get1bit+0x78>
                refill_buffer(bs);
    336d:	83 ec 0c             	sub    $0xc,%esp
    3370:	ff 75 08             	pushl  0x8(%ebp)
    3373:	e8 e8 fe ff ff       	call   3260 <refill_buffer>
    3378:	83 c4 10             	add    $0x10,%esp
                bs->buf_byte_idx = bs->buf_size-1;
    337b:	8b 45 08             	mov    0x8(%ebp),%eax
    337e:	8b 40 08             	mov    0x8(%eax),%eax
    3381:	8d 50 ff             	lea    -0x1(%eax),%edx
    3384:	8b 45 08             	mov    0x8(%ebp),%eax
    3387:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    338a:	8b 45 08             	mov    0x8(%ebp),%eax
    338d:	8b 50 04             	mov    0x4(%eax),%edx
    3390:	8b 45 08             	mov    0x8(%ebp),%eax
    3393:	8b 40 10             	mov    0x10(%eax),%eax
    3396:	01 d0                	add    %edx,%eax
    3398:	0f b6 00             	movzbl (%eax),%eax
    339b:	0f b6 d0             	movzbl %al,%edx
    339e:	8b 45 08             	mov    0x8(%ebp),%eax
    33a1:	8b 40 14             	mov    0x14(%eax),%eax
    33a4:	83 e8 01             	sub    $0x1,%eax
    33a7:	8b 04 85 a0 c4 00 00 	mov    0xc4a0(,%eax,4),%eax
    33ae:	21 d0                	and    %edx,%eax
    33b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    33b3:	8b 45 08             	mov    0x8(%ebp),%eax
    33b6:	8b 40 14             	mov    0x14(%eax),%eax
    33b9:	83 e8 01             	sub    $0x1,%eax
    33bc:	89 c1                	mov    %eax,%ecx
    33be:	d3 6d e4             	shrl   %cl,-0x1c(%ebp)
   bs->buf_bit_idx--;
    33c1:	8b 45 08             	mov    0x8(%ebp),%eax
    33c4:	8b 40 14             	mov    0x14(%eax),%eax
    33c7:	8d 50 ff             	lea    -0x1(%eax),%edx
    33ca:	8b 45 08             	mov    0x8(%ebp),%eax
    33cd:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    33d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    33d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    33d6:	5b                   	pop    %ebx
    33d7:	5e                   	pop    %esi
    33d8:	5f                   	pop    %edi
    33d9:	5d                   	pop    %ebp
    33da:	c3                   	ret    

000033db <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    33db:	55                   	push   %ebp
    33dc:	89 e5                	mov    %esp,%ebp
    33de:	57                   	push   %edi
    33df:	56                   	push   %esi
    33e0:	53                   	push   %ebx
    33e1:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    33e4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    33eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    33ee:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    33f2:	7e 14                	jle    3408 <getbits+0x2d>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    33f4:	83 ec 04             	sub    $0x4,%esp
    33f7:	6a 20                	push   $0x20
    33f9:	68 84 8e 00 00       	push   $0x8e84
    33fe:	6a 00                	push   $0x0
    3400:	e8 a2 f1 ff ff       	call   25a7 <printf>
    3405:	83 c4 10             	add    $0x10,%esp

	bs->totbit += N;
    3408:	8b 45 08             	mov    0x8(%ebp),%eax
    340b:	8b 50 0c             	mov    0xc(%eax),%edx
    340e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3411:	01 c2                	add    %eax,%edx
    3413:	8b 45 08             	mov    0x8(%ebp),%eax
    3416:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    3419:	e9 13 01 00 00       	jmp    3531 <getbits+0x156>
		if (!bs->buf_bit_idx) {
    341e:	8b 45 08             	mov    0x8(%ebp),%eax
    3421:	8b 40 14             	mov    0x14(%eax),%eax
    3424:	85 c0                	test   %eax,%eax
    3426:	0f 85 a8 00 00 00    	jne    34d4 <getbits+0xf9>
			bs->buf_bit_idx = 8;
    342c:	8b 45 08             	mov    0x8(%ebp),%eax
    342f:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    3436:	8b 45 08             	mov    0x8(%ebp),%eax
    3439:	8b 40 10             	mov    0x10(%eax),%eax
    343c:	8d 50 ff             	lea    -0x1(%eax),%edx
    343f:	8b 45 08             	mov    0x8(%ebp),%eax
    3442:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    3445:	8b 45 08             	mov    0x8(%ebp),%eax
    3448:	8b 40 10             	mov    0x10(%eax),%eax
    344b:	83 f8 03             	cmp    $0x3,%eax
    344e:	7e 10                	jle    3460 <getbits+0x85>
    3450:	8b 45 08             	mov    0x8(%ebp),%eax
    3453:	8b 50 10             	mov    0x10(%eax),%edx
    3456:	8b 45 08             	mov    0x8(%ebp),%eax
    3459:	8b 40 1c             	mov    0x1c(%eax),%eax
    345c:	39 c2                	cmp    %eax,%edx
    345e:	7d 74                	jge    34d4 <getbits+0xf9>
				if (bs->eob)
    3460:	8b 45 08             	mov    0x8(%ebp),%eax
    3463:	8b 40 1c             	mov    0x1c(%eax),%eax
    3466:	85 c0                	test   %eax,%eax
    3468:	74 0c                	je     3476 <getbits+0x9b>
					bs->eobs = TRUE;
    346a:	8b 45 08             	mov    0x8(%ebp),%eax
    346d:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    3474:	eb 5e                	jmp    34d4 <getbits+0xf9>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    3476:	8b 45 08             	mov    0x8(%ebp),%eax
    3479:	8b 70 10             	mov    0x10(%eax),%esi
    347c:	eb 35                	jmp    34b3 <getbits+0xd8>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    347e:	8b 45 08             	mov    0x8(%ebp),%eax
    3481:	8b 40 04             	mov    0x4(%eax),%eax
    3484:	89 f2                	mov    %esi,%edx
    3486:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    3489:	8b 45 08             	mov    0x8(%ebp),%eax
    348c:	8b 78 04             	mov    0x4(%eax),%edi
    348f:	8b 45 08             	mov    0x8(%ebp),%eax
    3492:	8b 40 08             	mov    0x8(%eax),%eax
    3495:	8d 50 ff             	lea    -0x1(%eax),%edx
    3498:	8b 45 08             	mov    0x8(%ebp),%eax
    349b:	8b 40 10             	mov    0x10(%eax),%eax
    349e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    34a1:	89 d0                	mov    %edx,%eax
    34a3:	2b 45 d4             	sub    -0x2c(%ebp),%eax
    34a6:	01 f0                	add    %esi,%eax
    34a8:	8d 14 07             	lea    (%edi,%eax,1),%edx
    34ab:	0f b6 01             	movzbl (%ecx),%eax
    34ae:	88 02                	mov    %al,(%edx)
					for (i=bs->buf_byte_idx; i>=0;i--)
    34b0:	83 ee 01             	sub    $0x1,%esi
    34b3:	85 f6                	test   %esi,%esi
    34b5:	79 c7                	jns    347e <getbits+0xa3>
						refill_buffer(bs);
    34b7:	83 ec 0c             	sub    $0xc,%esp
    34ba:	ff 75 08             	pushl  0x8(%ebp)
    34bd:	e8 9e fd ff ff       	call   3260 <refill_buffer>
    34c2:	83 c4 10             	add    $0x10,%esp
					bs->buf_byte_idx = bs->buf_size-1;
    34c5:	8b 45 08             	mov    0x8(%ebp),%eax
    34c8:	8b 40 08             	mov    0x8(%eax),%eax
    34cb:	8d 50 ff             	lea    -0x1(%eax),%edx
    34ce:	8b 45 08             	mov    0x8(%ebp),%eax
    34d1:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    34d4:	8b 45 08             	mov    0x8(%ebp),%eax
    34d7:	8b 40 14             	mov    0x14(%eax),%eax
    34da:	39 c3                	cmp    %eax,%ebx
    34dc:	0f 4e c3             	cmovle %ebx,%eax
    34df:	89 c7                	mov    %eax,%edi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    34e1:	8b 45 08             	mov    0x8(%ebp),%eax
    34e4:	8b 50 04             	mov    0x4(%eax),%edx
    34e7:	8b 45 08             	mov    0x8(%ebp),%eax
    34ea:	8b 40 10             	mov    0x10(%eax),%eax
    34ed:	01 d0                	add    %edx,%eax
    34ef:	0f b6 00             	movzbl (%eax),%eax
    34f2:	0f b6 d0             	movzbl %al,%edx
    34f5:	8b 45 08             	mov    0x8(%ebp),%eax
    34f8:	8b 40 14             	mov    0x14(%eax),%eax
    34fb:	8b 04 85 c0 c4 00 00 	mov    0xc4c0(,%eax,4),%eax
    3502:	89 d6                	mov    %edx,%esi
    3504:	21 c6                	and    %eax,%esi
		tmp = tmp >> (bs->buf_bit_idx-k);
    3506:	8b 45 08             	mov    0x8(%ebp),%eax
    3509:	8b 40 14             	mov    0x14(%eax),%eax
    350c:	29 f8                	sub    %edi,%eax
    350e:	89 c1                	mov    %eax,%ecx
    3510:	d3 fe                	sar    %cl,%esi
		val |= tmp << (j-k);
    3512:	89 d8                	mov    %ebx,%eax
    3514:	29 f8                	sub    %edi,%eax
    3516:	89 c1                	mov    %eax,%ecx
    3518:	d3 e6                	shl    %cl,%esi
    351a:	89 f0                	mov    %esi,%eax
    351c:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    351f:	8b 45 08             	mov    0x8(%ebp),%eax
    3522:	8b 40 14             	mov    0x14(%eax),%eax
    3525:	29 f8                	sub    %edi,%eax
    3527:	89 c2                	mov    %eax,%edx
    3529:	8b 45 08             	mov    0x8(%ebp),%eax
    352c:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    352f:	29 fb                	sub    %edi,%ebx
	while (j > 0) {
    3531:	85 db                	test   %ebx,%ebx
    3533:	0f 8f e5 fe ff ff    	jg     341e <getbits+0x43>
	}
	return val;
    3539:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    353c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    353f:	5b                   	pop    %ebx
    3540:	5e                   	pop    %esi
    3541:	5f                   	pop    %edi
    3542:	5d                   	pop    %ebp
    3543:	c3                   	ret    

00003544 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    3544:	55                   	push   %ebp
    3545:	89 e5                	mov    %esp,%ebp
    3547:	83 ec 28             	sub    $0x28,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    354a:	db 45 10             	fildl  0x10(%ebp)
    354d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    3551:	dd 1c 24             	fstpl  (%esp)
    3554:	dd 05 f0 8e 00 00    	fldl   0x8ef0
    355a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    355e:	dd 1c 24             	fstpl  (%esp)
    3561:	e8 0b f5 ff ff       	call   2a71 <pow>
    3566:	83 c4 10             	add    $0x10,%esp
    3569:	d9 7d e6             	fnstcw -0x1a(%ebp)
    356c:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    3570:	80 cc 0c             	or     $0xc,%ah
    3573:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    3577:	d9 6d e4             	fldcw  -0x1c(%ebp)
    357a:	db 5d e0             	fistpl -0x20(%ebp)
    357d:	d9 6d e6             	fldcw  -0x1a(%ebp)
    3580:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3583:	83 e8 01             	sub    $0x1,%eax
    3586:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    3589:	83 ec 0c             	sub    $0xc,%esp
    358c:	ff 75 08             	pushl  0x8(%ebp)
    358f:	e8 c1 fc ff ff       	call   3255 <sstell>
    3594:	83 c4 10             	add    $0x10,%esp
    3597:	83 e0 07             	and    $0x7,%eax
    359a:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    359d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    35a1:	74 17                	je     35ba <seek_sync+0x76>
		getbits(bs, (int)(ALIGNING-aligning));
    35a3:	b8 08 00 00 00       	mov    $0x8,%eax
    35a8:	2b 45 ec             	sub    -0x14(%ebp),%eax
    35ab:	83 ec 08             	sub    $0x8,%esp
    35ae:	50                   	push   %eax
    35af:	ff 75 08             	pushl  0x8(%ebp)
    35b2:	e8 24 fe ff ff       	call   33db <getbits>
    35b7:	83 c4 10             	add    $0x10,%esp

	val = getbits(bs, N);
    35ba:	83 ec 08             	sub    $0x8,%esp
    35bd:	ff 75 10             	pushl  0x10(%ebp)
    35c0:	ff 75 08             	pushl  0x8(%ebp)
    35c3:	e8 13 fe ff ff       	call   33db <getbits>
    35c8:	83 c4 10             	add    $0x10,%esp
    35cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    35ce:	eb 17                	jmp    35e7 <seek_sync+0xa3>
		val <<= ALIGNING;
    35d0:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    35d4:	83 ec 08             	sub    $0x8,%esp
    35d7:	6a 08                	push   $0x8
    35d9:	ff 75 08             	pushl  0x8(%ebp)
    35dc:	e8 fa fd ff ff       	call   33db <getbits>
    35e1:	83 c4 10             	add    $0x10,%esp
    35e4:	09 45 f4             	or     %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    35e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35ea:	23 45 f4             	and    -0xc(%ebp),%eax
    35ed:	39 45 0c             	cmp    %eax,0xc(%ebp)
    35f0:	74 12                	je     3604 <seek_sync+0xc0>
    35f2:	83 ec 0c             	sub    $0xc,%esp
    35f5:	ff 75 08             	pushl  0x8(%ebp)
    35f8:	e8 4d fc ff ff       	call   324a <end_bs>
    35fd:	83 c4 10             	add    $0x10,%esp
    3600:	85 c0                	test   %eax,%eax
    3602:	74 cc                	je     35d0 <seek_sync+0x8c>
	}

	if (end_bs(bs))
    3604:	83 ec 0c             	sub    $0xc,%esp
    3607:	ff 75 08             	pushl  0x8(%ebp)
    360a:	e8 3b fc ff ff       	call   324a <end_bs>
    360f:	83 c4 10             	add    $0x10,%esp
    3612:	85 c0                	test   %eax,%eax
    3614:	74 07                	je     361d <seek_sync+0xd9>
		return(0);
    3616:	b8 00 00 00 00       	mov    $0x0,%eax
    361b:	eb 05                	jmp    3622 <seek_sync+0xde>
	else
		return(1);
    361d:	b8 01 00 00 00       	mov    $0x1,%eax
}
    3622:	c9                   	leave  
    3623:	c3                   	ret    

00003624 <js_bound>:

int js_bound(int lay, int m_ext)
{
    3624:	55                   	push   %ebp
    3625:	89 e5                	mov    %esp,%ebp
    3627:	83 ec 08             	sub    $0x8,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    362a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    362e:	7e 12                	jle    3642 <js_bound+0x1e>
    3630:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    3634:	7f 0c                	jg     3642 <js_bound+0x1e>
    3636:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    363a:	78 06                	js     3642 <js_bound+0x1e>
    363c:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    3640:	7e 1a                	jle    365c <js_bound+0x38>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    3642:	ff 75 0c             	pushl  0xc(%ebp)
    3645:	ff 75 08             	pushl  0x8(%ebp)
    3648:	68 b8 8e 00 00       	push   $0x8eb8
    364d:	6a 00                	push   $0x0
    364f:	e8 53 ef ff ff       	call   25a7 <printf>
    3654:	83 c4 10             	add    $0x10,%esp
        exit();
    3657:	e8 5f ed ff ff       	call   23bb <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    365c:	8b 45 08             	mov    0x8(%ebp),%eax
    365f:	83 e8 01             	sub    $0x1,%eax
    3662:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3669:	8b 45 0c             	mov    0xc(%ebp),%eax
    366c:	01 d0                	add    %edx,%eax
    366e:	8b 04 85 00 c5 00 00 	mov    0xc500(,%eax,4),%eax
}
    3675:	c9                   	leave  
    3676:	c3                   	ret    

00003677 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    3677:	55                   	push   %ebp
    3678:	89 e5                	mov    %esp,%ebp
    367a:	83 ec 18             	sub    $0x18,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    367d:	8b 45 08             	mov    0x8(%ebp),%eax
    3680:	8b 00                	mov    (%eax),%eax
    3682:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    3685:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3688:	8b 50 1c             	mov    0x1c(%eax),%edx
    368b:	8b 45 08             	mov    0x8(%ebp),%eax
    368e:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    3691:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3694:	8b 40 1c             	mov    0x1c(%eax),%eax
    3697:	83 f8 03             	cmp    $0x3,%eax
    369a:	75 07                	jne    36a3 <hdr_to_frps+0x2c>
    369c:	ba 01 00 00 00       	mov    $0x1,%edx
    36a1:	eb 05                	jmp    36a8 <hdr_to_frps+0x31>
    36a3:	ba 02 00 00 00       	mov    $0x2,%edx
    36a8:	8b 45 08             	mov    0x8(%ebp),%eax
    36ab:	89 50 08             	mov    %edx,0x8(%eax)
	fr_ps->sblimit = SBLIMIT;
    36ae:	8b 45 08             	mov    0x8(%ebp),%eax
    36b1:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    36b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36bb:	8b 40 1c             	mov    0x1c(%eax),%eax
    36be:	83 f8 01             	cmp    $0x1,%eax
    36c1:	75 21                	jne    36e4 <hdr_to_frps+0x6d>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    36c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36c6:	8b 50 20             	mov    0x20(%eax),%edx
    36c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36cc:	8b 40 04             	mov    0x4(%eax),%eax
    36cf:	83 ec 08             	sub    $0x8,%esp
    36d2:	52                   	push   %edx
    36d3:	50                   	push   %eax
    36d4:	e8 4b ff ff ff       	call   3624 <js_bound>
    36d9:	83 c4 10             	add    $0x10,%esp
    36dc:	8b 55 08             	mov    0x8(%ebp),%edx
    36df:	89 42 0c             	mov    %eax,0xc(%edx)
	else
		fr_ps->jsbound = fr_ps->sblimit;
}
    36e2:	eb 0c                	jmp    36f0 <hdr_to_frps+0x79>
		fr_ps->jsbound = fr_ps->sblimit;
    36e4:	8b 45 08             	mov    0x8(%ebp),%eax
    36e7:	8b 50 10             	mov    0x10(%eax),%edx
    36ea:	8b 45 08             	mov    0x8(%ebp),%eax
    36ed:	89 50 0c             	mov    %edx,0xc(%eax)
}
    36f0:	90                   	nop
    36f1:	c9                   	leave  
    36f2:	c3                   	ret    

000036f3 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    36f3:	55                   	push   %ebp
    36f4:	89 e5                	mov    %esp,%ebp
    36f6:	83 ec 08             	sub    $0x8,%esp
	if (N != 8) {
    36f9:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    36fd:	74 17                	je     3716 <hputbuf+0x23>
		printf(0,"Not Supported yet!!\n");
    36ff:	83 ec 08             	sub    $0x8,%esp
    3702:	68 db 8e 00 00       	push   $0x8edb
    3707:	6a 00                	push   $0x0
    3709:	e8 99 ee ff ff       	call   25a7 <printf>
    370e:	83 c4 10             	add    $0x10,%esp
		exit();
    3711:	e8 a5 ec ff ff       	call   23bb <exit>
	}
	getCoreBuf(1, val);
    3716:	83 ec 08             	sub    $0x8,%esp
    3719:	ff 75 08             	pushl  0x8(%ebp)
    371c:	6a 01                	push   $0x1
    371e:	e8 98 ed ff ff       	call   24bb <getCoreBuf>
    3723:	83 c4 10             	add    $0x10,%esp
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    3726:	90                   	nop
    3727:	c9                   	leave  
    3728:	c3                   	ret    

00003729 <hsstell>:

unsigned long hsstell()
{
    3729:	55                   	push   %ebp
    372a:	89 e5                	mov    %esp,%ebp
    372c:	83 ec 08             	sub    $0x8,%esp
	return getCoreBuf(2, 0);
    372f:	83 ec 08             	sub    $0x8,%esp
    3732:	6a 00                	push   $0x0
    3734:	6a 02                	push   $0x2
    3736:	e8 80 ed ff ff       	call   24bb <getCoreBuf>
    373b:	83 c4 10             	add    $0x10,%esp
//	return(totbit);
}
    373e:	c9                   	leave  
    373f:	c3                   	ret    

00003740 <hgetbits>:

unsigned long hgetbits(int N)
{
    3740:	55                   	push   %ebp
    3741:	89 e5                	mov    %esp,%ebp
    3743:	83 ec 08             	sub    $0x8,%esp

	return getCoreBuf(3, N);
    3746:	83 ec 08             	sub    $0x8,%esp
    3749:	ff 75 08             	pushl  0x8(%ebp)
    374c:	6a 03                	push   $0x3
    374e:	e8 68 ed ff ff       	call   24bb <getCoreBuf>
    3753:	83 c4 10             	add    $0x10,%esp
}
    3756:	c9                   	leave  
    3757:	c3                   	ret    

00003758 <hget1bit>:


unsigned int hget1bit()
{
    3758:	55                   	push   %ebp
    3759:	89 e5                	mov    %esp,%ebp
    375b:	83 ec 08             	sub    $0x8,%esp
	return(hgetbits(1));
    375e:	83 ec 0c             	sub    $0xc,%esp
    3761:	6a 01                	push   $0x1
    3763:	e8 d8 ff ff ff       	call   3740 <hgetbits>
    3768:	83 c4 10             	add    $0x10,%esp
}
    376b:	c9                   	leave  
    376c:	c3                   	ret    

0000376d <rewindNbits>:


void rewindNbits(int N)
{
    376d:	55                   	push   %ebp
    376e:	89 e5                	mov    %esp,%ebp
    3770:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(4, N);
    3773:	83 ec 08             	sub    $0x8,%esp
    3776:	ff 75 08             	pushl  0x8(%ebp)
    3779:	6a 04                	push   $0x4
    377b:	e8 3b ed ff ff       	call   24bb <getCoreBuf>
    3780:	83 c4 10             	add    $0x10,%esp
}
    3783:	90                   	nop
    3784:	c9                   	leave  
    3785:	c3                   	ret    

00003786 <rewindNbytes>:


void rewindNbytes(int N)
{
    3786:	55                   	push   %ebp
    3787:	89 e5                	mov    %esp,%ebp
    3789:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(5, N);
    378c:	83 ec 08             	sub    $0x8,%esp
    378f:	ff 75 08             	pushl  0x8(%ebp)
    3792:	6a 05                	push   $0x5
    3794:	e8 22 ed ff ff       	call   24bb <getCoreBuf>
    3799:	83 c4 10             	add    $0x10,%esp
}
    379c:	90                   	nop
    379d:	c9                   	leave  
    379e:	c3                   	ret    

0000379f <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    379f:	55                   	push   %ebp
    37a0:	89 e5                	mov    %esp,%ebp
    37a2:	57                   	push   %edi
    37a3:	56                   	push   %esi
    37a4:	53                   	push   %ebx
    37a5:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    37ab:	66 c7 45 e6 02 01    	movw   $0x102,-0x1a(%ebp)
    37b1:	66 c7 45 e8 00 00    	movw   $0x0,-0x18(%ebp)
    37b7:	66 c7 45 ea 02 01    	movw   $0x102,-0x16(%ebp)
    37bd:	66 c7 45 ec 00 10    	movw   $0x1000,-0x14(%ebp)
    37c3:	66 c7 45 ee 02 01    	movw   $0x102,-0x12(%ebp)
    37c9:	66 c7 45 f0 00 01    	movw   $0x100,-0x10(%ebp)
    37cf:	66 c7 45 f2 00 11    	movw   $0x1100,-0xe(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    37d5:	66 c7 45 c4 02 01    	movw   $0x102,-0x3c(%ebp)
    37db:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
    37e1:	66 c7 45 c8 04 01    	movw   $0x104,-0x38(%ebp)
    37e7:	66 c7 45 ca 02 01    	movw   $0x102,-0x36(%ebp)
    37ed:	66 c7 45 cc 00 10    	movw   $0x1000,-0x34(%ebp)
    37f3:	66 c7 45 ce 00 01    	movw   $0x100,-0x32(%ebp)
    37f9:	66 c7 45 d0 02 01    	movw   $0x102,-0x30(%ebp)
    37ff:	66 c7 45 d2 00 11    	movw   $0x1100,-0x2e(%ebp)
    3805:	66 c7 45 d4 04 01    	movw   $0x104,-0x2c(%ebp)
    380b:	66 c7 45 d6 02 01    	movw   $0x102,-0x2a(%ebp)
    3811:	66 c7 45 d8 00 20    	movw   $0x2000,-0x28(%ebp)
    3817:	66 c7 45 da 00 21    	movw   $0x2100,-0x26(%ebp)
    381d:	66 c7 45 dc 02 01    	movw   $0x102,-0x24(%ebp)
    3823:	66 c7 45 de 00 12    	movw   $0x1200,-0x22(%ebp)
    3829:	66 c7 45 e0 02 01    	movw   $0x102,-0x20(%ebp)
    382f:	66 c7 45 e2 00 02    	movw   $0x200,-0x1e(%ebp)
    3835:	66 c7 45 e4 00 22    	movw   $0x2200,-0x1c(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    383b:	66 c7 45 a2 04 01    	movw   $0x104,-0x5e(%ebp)
    3841:	66 c7 45 a4 02 01    	movw   $0x102,-0x5c(%ebp)
    3847:	66 c7 45 a6 00 00    	movw   $0x0,-0x5a(%ebp)
    384d:	66 c7 45 a8 00 01    	movw   $0x100,-0x58(%ebp)
    3853:	66 c7 45 aa 02 01    	movw   $0x102,-0x56(%ebp)
    3859:	66 c7 45 ac 00 11    	movw   $0x1100,-0x54(%ebp)
    385f:	66 c7 45 ae 02 01    	movw   $0x102,-0x52(%ebp)
    3865:	66 c7 45 b0 00 10    	movw   $0x1000,-0x50(%ebp)
    386b:	66 c7 45 b2 04 01    	movw   $0x104,-0x4e(%ebp)
    3871:	66 c7 45 b4 02 01    	movw   $0x102,-0x4c(%ebp)
    3877:	66 c7 45 b6 00 20    	movw   $0x2000,-0x4a(%ebp)
    387d:	66 c7 45 b8 00 21    	movw   $0x2100,-0x48(%ebp)
    3883:	66 c7 45 ba 02 01    	movw   $0x102,-0x46(%ebp)
    3889:	66 c7 45 bc 00 12    	movw   $0x1200,-0x44(%ebp)
    388f:	66 c7 45 be 02 01    	movw   $0x102,-0x42(%ebp)
    3895:	66 c7 45 c0 00 02    	movw   $0x200,-0x40(%ebp)
    389b:	66 c7 45 c2 00 22    	movw   $0x2200,-0x3e(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    38a1:	66 c7 85 64 ff ff ff 	movw   $0x102,-0x9c(%ebp)
    38a8:	02 01 
    38aa:	66 c7 85 66 ff ff ff 	movw   $0x0,-0x9a(%ebp)
    38b1:	00 00 
    38b3:	66 c7 85 68 ff ff ff 	movw   $0x104,-0x98(%ebp)
    38ba:	04 01 
    38bc:	66 c7 85 6a ff ff ff 	movw   $0x102,-0x96(%ebp)
    38c3:	02 01 
    38c5:	66 c7 85 6c ff ff ff 	movw   $0x1000,-0x94(%ebp)
    38cc:	00 10 
    38ce:	66 c7 85 6e ff ff ff 	movw   $0x100,-0x92(%ebp)
    38d5:	00 01 
    38d7:	66 c7 85 70 ff ff ff 	movw   $0x102,-0x90(%ebp)
    38de:	02 01 
    38e0:	66 c7 85 72 ff ff ff 	movw   $0x1100,-0x8e(%ebp)
    38e7:	00 11 
    38e9:	66 c7 85 74 ff ff ff 	movw   $0x108,-0x8c(%ebp)
    38f0:	08 01 
    38f2:	66 c7 85 76 ff ff ff 	movw   $0x104,-0x8a(%ebp)
    38f9:	04 01 
    38fb:	66 c7 85 78 ff ff ff 	movw   $0x102,-0x88(%ebp)
    3902:	02 01 
    3904:	66 c7 85 7a ff ff ff 	movw   $0x2000,-0x86(%ebp)
    390b:	00 20 
    390d:	66 c7 85 7c ff ff ff 	movw   $0x200,-0x84(%ebp)
    3914:	00 02 
    3916:	66 c7 85 7e ff ff ff 	movw   $0x102,-0x82(%ebp)
    391d:	02 01 
    391f:	66 c7 45 80 00 21    	movw   $0x2100,-0x80(%ebp)
    3925:	66 c7 45 82 00 12    	movw   $0x1200,-0x7e(%ebp)
    392b:	66 c7 45 84 08 01    	movw   $0x108,-0x7c(%ebp)
    3931:	66 c7 45 86 04 01    	movw   $0x104,-0x7a(%ebp)
    3937:	66 c7 45 88 02 01    	movw   $0x102,-0x78(%ebp)
    393d:	66 c7 45 8a 00 22    	movw   $0x2200,-0x76(%ebp)
    3943:	66 c7 45 8c 00 30    	movw   $0x3000,-0x74(%ebp)
    3949:	66 c7 45 8e 02 01    	movw   $0x102,-0x72(%ebp)
    394f:	66 c7 45 90 00 03    	movw   $0x300,-0x70(%ebp)
    3955:	66 c7 45 92 00 13    	movw   $0x1300,-0x6e(%ebp)
    395b:	66 c7 45 94 02 01    	movw   $0x102,-0x6c(%ebp)
    3961:	66 c7 45 96 00 31    	movw   $0x3100,-0x6a(%ebp)
    3967:	66 c7 45 98 02 01    	movw   $0x102,-0x68(%ebp)
    396d:	66 c7 45 9a 00 32    	movw   $0x3200,-0x66(%ebp)
    3973:	66 c7 45 9c 02 01    	movw   $0x102,-0x64(%ebp)
    3979:	66 c7 45 9e 00 23    	movw   $0x2300,-0x62(%ebp)
    397f:	66 c7 45 a0 00 33    	movw   $0x3300,-0x60(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    3985:	66 c7 85 26 ff ff ff 	movw   $0x106,-0xda(%ebp)
    398c:	06 01 
    398e:	66 c7 85 28 ff ff ff 	movw   $0x104,-0xd8(%ebp)
    3995:	04 01 
    3997:	66 c7 85 2a ff ff ff 	movw   $0x102,-0xd6(%ebp)
    399e:	02 01 
    39a0:	66 c7 85 2c ff ff ff 	movw   $0x0,-0xd4(%ebp)
    39a7:	00 00 
    39a9:	66 c7 85 2e ff ff ff 	movw   $0x1000,-0xd2(%ebp)
    39b0:	00 10 
    39b2:	66 c7 85 30 ff ff ff 	movw   $0x1100,-0xd0(%ebp)
    39b9:	00 11 
    39bb:	66 c7 85 32 ff ff ff 	movw   $0x106,-0xce(%ebp)
    39c2:	06 01 
    39c4:	66 c7 85 34 ff ff ff 	movw   $0x102,-0xcc(%ebp)
    39cb:	02 01 
    39cd:	66 c7 85 36 ff ff ff 	movw   $0x100,-0xca(%ebp)
    39d4:	00 01 
    39d6:	66 c7 85 38 ff ff ff 	movw   $0x102,-0xc8(%ebp)
    39dd:	02 01 
    39df:	66 c7 85 3a ff ff ff 	movw   $0x2000,-0xc6(%ebp)
    39e6:	00 20 
    39e8:	66 c7 85 3c ff ff ff 	movw   $0x2100,-0xc4(%ebp)
    39ef:	00 21 
    39f1:	66 c7 85 3e ff ff ff 	movw   $0x106,-0xc2(%ebp)
    39f8:	06 01 
    39fa:	66 c7 85 40 ff ff ff 	movw   $0x102,-0xc0(%ebp)
    3a01:	02 01 
    3a03:	66 c7 85 42 ff ff ff 	movw   $0x1200,-0xbe(%ebp)
    3a0a:	00 12 
    3a0c:	66 c7 85 44 ff ff ff 	movw   $0x102,-0xbc(%ebp)
    3a13:	02 01 
    3a15:	66 c7 85 46 ff ff ff 	movw   $0x200,-0xba(%ebp)
    3a1c:	00 02 
    3a1e:	66 c7 85 48 ff ff ff 	movw   $0x2200,-0xb8(%ebp)
    3a25:	00 22 
    3a27:	66 c7 85 4a ff ff ff 	movw   $0x104,-0xb6(%ebp)
    3a2e:	04 01 
    3a30:	66 c7 85 4c ff ff ff 	movw   $0x102,-0xb4(%ebp)
    3a37:	02 01 
    3a39:	66 c7 85 4e ff ff ff 	movw   $0x3100,-0xb2(%ebp)
    3a40:	00 31 
    3a42:	66 c7 85 50 ff ff ff 	movw   $0x1300,-0xb0(%ebp)
    3a49:	00 13 
    3a4b:	66 c7 85 52 ff ff ff 	movw   $0x104,-0xae(%ebp)
    3a52:	04 01 
    3a54:	66 c7 85 54 ff ff ff 	movw   $0x102,-0xac(%ebp)
    3a5b:	02 01 
    3a5d:	66 c7 85 56 ff ff ff 	movw   $0x3000,-0xaa(%ebp)
    3a64:	00 30 
    3a66:	66 c7 85 58 ff ff ff 	movw   $0x3200,-0xa8(%ebp)
    3a6d:	00 32 
    3a6f:	66 c7 85 5a ff ff ff 	movw   $0x102,-0xa6(%ebp)
    3a76:	02 01 
    3a78:	66 c7 85 5c ff ff ff 	movw   $0x2300,-0xa4(%ebp)
    3a7f:	00 23 
    3a81:	66 c7 85 5e ff ff ff 	movw   $0x102,-0xa2(%ebp)
    3a88:	02 01 
    3a8a:	66 c7 85 60 ff ff ff 	movw   $0x300,-0xa0(%ebp)
    3a91:	00 03 
    3a93:	66 c7 85 62 ff ff ff 	movw   $0x3300,-0x9e(%ebp)
    3a9a:	00 33 

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    3a9c:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    3aa2:	ba 00 8f 00 00       	mov    $0x8f00,%edx
    3aa7:	b9 23 00 00 00       	mov    $0x23,%ecx
    3aac:	89 c7                	mov    %eax,%edi
    3aae:	89 d6                	mov    %edx,%esi
    3ab0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    3ab2:	89 f2                	mov    %esi,%edx
    3ab4:	89 f8                	mov    %edi,%eax
    3ab6:	0f b7 0a             	movzwl (%edx),%ecx
    3ab9:	66 89 08             	mov    %cx,(%eax)

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    3abc:	8d 95 0a fe ff ff    	lea    -0x1f6(%ebp),%edx
    3ac2:	b8 a0 8f 00 00       	mov    $0x8fa0,%eax
    3ac7:	b9 8e 00 00 00       	mov    $0x8e,%ecx
    3acc:	8b 18                	mov    (%eax),%ebx
    3ace:	89 1a                	mov    %ebx,(%edx)
    3ad0:	8b 5c 08 fc          	mov    -0x4(%eax,%ecx,1),%ebx
    3ad4:	89 5c 0a fc          	mov    %ebx,-0x4(%edx,%ecx,1)
    3ad8:	8d 5a 04             	lea    0x4(%edx),%ebx
    3adb:	83 e3 fc             	and    $0xfffffffc,%ebx
    3ade:	29 da                	sub    %ebx,%edx
    3ae0:	29 d0                	sub    %edx,%eax
    3ae2:	01 d1                	add    %edx,%ecx
    3ae4:	83 e1 fc             	and    $0xfffffffc,%ecx
    3ae7:	c1 e9 02             	shr    $0x2,%ecx
    3aea:	89 ca                	mov    %ecx,%edx
    3aec:	89 df                	mov    %ebx,%edi
    3aee:	89 c6                	mov    %eax,%esi
    3af0:	89 d1                	mov    %edx,%ecx
    3af2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    3af4:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    3afa:	ba 40 90 00 00       	mov    $0x9040,%edx
    3aff:	b9 23 00 00 00       	mov    $0x23,%ecx
    3b04:	89 c7                	mov    %eax,%edi
    3b06:	89 d6                	mov    %edx,%esi
    3b08:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    3b0a:	89 f2                	mov    %esi,%edx
    3b0c:	89 f8                	mov    %edi,%eax
    3b0e:	0f b7 0a             	movzwl (%edx),%ecx
    3b11:	66 89 08             	mov    %cx,(%eax)

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    3b14:	8d 95 7e fc ff ff    	lea    -0x382(%ebp),%edx
    3b1a:	b8 e0 90 00 00       	mov    $0x90e0,%eax
    3b1f:	b9 fe 00 00 00       	mov    $0xfe,%ecx
    3b24:	8b 18                	mov    (%eax),%ebx
    3b26:	89 1a                	mov    %ebx,(%edx)
    3b28:	8b 5c 08 fc          	mov    -0x4(%eax,%ecx,1),%ebx
    3b2c:	89 5c 0a fc          	mov    %ebx,-0x4(%edx,%ecx,1)
    3b30:	8d 5a 04             	lea    0x4(%edx),%ebx
    3b33:	83 e3 fc             	and    $0xfffffffc,%ebx
    3b36:	29 da                	sub    %ebx,%edx
    3b38:	29 d0                	sub    %edx,%eax
    3b3a:	01 d1                	add    %edx,%ecx
    3b3c:	83 e1 fc             	and    $0xfffffffc,%ecx
    3b3f:	c1 e9 02             	shr    $0x2,%ecx
    3b42:	89 ca                	mov    %ecx,%edx
    3b44:	89 df                	mov    %ebx,%edi
    3b46:	89 c6                	mov    %eax,%esi
    3b48:	89 d1                	mov    %edx,%ecx
    3b4a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    3b4c:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    3b52:	ba e0 91 00 00       	mov    $0x91e0,%edx
    3b57:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    3b5c:	89 c7                	mov    %eax,%edi
    3b5e:	89 d6                	mov    %edx,%esi
    3b60:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    3b62:	89 f2                	mov    %esi,%edx
    3b64:	89 f8                	mov    %edi,%eax
    3b66:	0f b7 0a             	movzwl (%edx),%ecx
    3b69:	66 89 08             	mov    %cx,(%eax)

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    3b6c:	8d 95 82 fa ff ff    	lea    -0x57e(%ebp),%edx
    3b72:	b8 e0 92 00 00       	mov    $0x92e0,%eax
    3b77:	b9 fe 00 00 00       	mov    $0xfe,%ecx
    3b7c:	8b 18                	mov    (%eax),%ebx
    3b7e:	89 1a                	mov    %ebx,(%edx)
    3b80:	8b 5c 08 fc          	mov    -0x4(%eax,%ecx,1),%ebx
    3b84:	89 5c 0a fc          	mov    %ebx,-0x4(%edx,%ecx,1)
    3b88:	8d 5a 04             	lea    0x4(%edx),%ebx
    3b8b:	83 e3 fc             	and    $0xfffffffc,%ebx
    3b8e:	29 da                	sub    %ebx,%edx
    3b90:	29 d0                	sub    %edx,%eax
    3b92:	01 d1                	add    %edx,%ecx
    3b94:	83 e1 fc             	and    $0xfffffffc,%ecx
    3b97:	c1 e9 02             	shr    $0x2,%ecx
    3b9a:	89 ca                	mov    %ecx,%edx
    3b9c:	89 df                	mov    %ebx,%edi
    3b9e:	89 c6                	mov    %eax,%esi
    3ba0:	89 d1                	mov    %edx,%ecx
    3ba2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    3ba4:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    3baa:	ba e0 93 00 00       	mov    $0x93e0,%edx
    3baf:	b9 ff 00 00 00       	mov    $0xff,%ecx
    3bb4:	89 c7                	mov    %eax,%edi
    3bb6:	89 d6                	mov    %edx,%esi
    3bb8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    3bba:	89 f2                	mov    %esi,%edx
    3bbc:	89 f8                	mov    %edi,%eax
    3bbe:	0f b7 0a             	movzwl (%edx),%ecx
    3bc1:	66 89 08             	mov    %cx,(%eax)

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    3bc4:	8d 95 86 f2 ff ff    	lea    -0xd7a(%ebp),%edx
    3bca:	b8 e0 97 00 00       	mov    $0x97e0,%eax
    3bcf:	b9 fe 03 00 00       	mov    $0x3fe,%ecx
    3bd4:	8b 18                	mov    (%eax),%ebx
    3bd6:	89 1a                	mov    %ebx,(%edx)
    3bd8:	8b 5c 08 fc          	mov    -0x4(%eax,%ecx,1),%ebx
    3bdc:	89 5c 0a fc          	mov    %ebx,-0x4(%edx,%ecx,1)
    3be0:	8d 5a 04             	lea    0x4(%edx),%ebx
    3be3:	83 e3 fc             	and    $0xfffffffc,%ebx
    3be6:	29 da                	sub    %ebx,%edx
    3be8:	29 d0                	sub    %edx,%eax
    3bea:	01 d1                	add    %edx,%ecx
    3bec:	83 e1 fc             	and    $0xfffffffc,%ecx
    3bef:	89 ca                	mov    %ecx,%edx
    3bf1:	c1 ea 02             	shr    $0x2,%edx
    3bf4:	89 df                	mov    %ebx,%edi
    3bf6:	89 c6                	mov    %eax,%esi
    3bf8:	89 d1                	mov    %edx,%ecx
    3bfa:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    3bfc:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    3c02:	ba e0 9b 00 00       	mov    $0x9be0,%edx
    3c07:	b9 ff 00 00 00       	mov    $0xff,%ecx
    3c0c:	89 c7                	mov    %eax,%edi
    3c0e:	89 d6                	mov    %edx,%esi
    3c10:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    3c12:	89 f2                	mov    %esi,%edx
    3c14:	89 f8                	mov    %edi,%eax
    3c16:	0f b7 0a             	movzwl (%edx),%ecx
    3c19:	66 89 08             	mov    %cx,(%eax)

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    3c1c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    3c22:	bb e0 9f 00 00       	mov    $0x9fe0,%ebx
    3c27:	ba 00 01 00 00       	mov    $0x100,%edx
    3c2c:	89 c7                	mov    %eax,%edi
    3c2e:	89 de                	mov    %ebx,%esi
    3c30:	89 d1                	mov    %edx,%ecx
    3c32:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    3c34:	66 c7 85 4a ea ff ff 	movw   $0x102,-0x15b6(%ebp)
    3c3b:	02 01 
    3c3d:	66 c7 85 4c ea ff ff 	movw   $0x0,-0x15b4(%ebp)
    3c44:	00 00 
    3c46:	66 c7 85 4e ea ff ff 	movw   $0x108,-0x15b2(%ebp)
    3c4d:	08 01 
    3c4f:	66 c7 85 50 ea ff ff 	movw   $0x104,-0x15b0(%ebp)
    3c56:	04 01 
    3c58:	66 c7 85 52 ea ff ff 	movw   $0x102,-0x15ae(%ebp)
    3c5f:	02 01 
    3c61:	66 c7 85 54 ea ff ff 	movw   $0x800,-0x15ac(%ebp)
    3c68:	00 08 
    3c6a:	66 c7 85 56 ea ff ff 	movw   $0x400,-0x15aa(%ebp)
    3c71:	00 04 
    3c73:	66 c7 85 58 ea ff ff 	movw   $0x102,-0x15a8(%ebp)
    3c7a:	02 01 
    3c7c:	66 c7 85 5a ea ff ff 	movw   $0x100,-0x15a6(%ebp)
    3c83:	00 01 
    3c85:	66 c7 85 5c ea ff ff 	movw   $0x200,-0x15a4(%ebp)
    3c8c:	00 02 
    3c8e:	66 c7 85 5e ea ff ff 	movw   $0x108,-0x15a2(%ebp)
    3c95:	08 01 
    3c97:	66 c7 85 60 ea ff ff 	movw   $0x104,-0x15a0(%ebp)
    3c9e:	04 01 
    3ca0:	66 c7 85 62 ea ff ff 	movw   $0x102,-0x159e(%ebp)
    3ca7:	02 01 
    3ca9:	66 c7 85 64 ea ff ff 	movw   $0xc00,-0x159c(%ebp)
    3cb0:	00 0c 
    3cb2:	66 c7 85 66 ea ff ff 	movw   $0xa00,-0x159a(%ebp)
    3cb9:	00 0a 
    3cbb:	66 c7 85 68 ea ff ff 	movw   $0x102,-0x1598(%ebp)
    3cc2:	02 01 
    3cc4:	66 c7 85 6a ea ff ff 	movw   $0x300,-0x1596(%ebp)
    3ccb:	00 03 
    3ccd:	66 c7 85 6c ea ff ff 	movw   $0x600,-0x1594(%ebp)
    3cd4:	00 06 
    3cd6:	66 c7 85 6e ea ff ff 	movw   $0x106,-0x1592(%ebp)
    3cdd:	06 01 
    3cdf:	66 c7 85 70 ea ff ff 	movw   $0x102,-0x1590(%ebp)
    3ce6:	02 01 
    3ce8:	66 c7 85 72 ea ff ff 	movw   $0x900,-0x158e(%ebp)
    3cef:	00 09 
    3cf1:	66 c7 85 74 ea ff ff 	movw   $0x102,-0x158c(%ebp)
    3cf8:	02 01 
    3cfa:	66 c7 85 76 ea ff ff 	movw   $0x500,-0x158a(%ebp)
    3d01:	00 05 
    3d03:	66 c7 85 78 ea ff ff 	movw   $0x700,-0x1588(%ebp)
    3d0a:	00 07 
    3d0c:	66 c7 85 7a ea ff ff 	movw   $0x104,-0x1586(%ebp)
    3d13:	04 01 
    3d15:	66 c7 85 7c ea ff ff 	movw   $0x102,-0x1584(%ebp)
    3d1c:	02 01 
    3d1e:	66 c7 85 7e ea ff ff 	movw   $0xe00,-0x1582(%ebp)
    3d25:	00 0e 
    3d27:	66 c7 85 80 ea ff ff 	movw   $0xd00,-0x1580(%ebp)
    3d2e:	00 0d 
    3d30:	66 c7 85 82 ea ff ff 	movw   $0x102,-0x157e(%ebp)
    3d37:	02 01 
    3d39:	66 c7 85 84 ea ff ff 	movw   $0xf00,-0x157c(%ebp)
    3d40:	00 0f 
    3d42:	66 c7 85 86 ea ff ff 	movw   $0xb00,-0x157a(%ebp)
    3d49:	00 0b 

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    3d4b:	66 c7 85 0c ea ff ff 	movw   $0x110,-0x15f4(%ebp)
    3d52:	10 01 
    3d54:	66 c7 85 0e ea ff ff 	movw   $0x108,-0x15f2(%ebp)
    3d5b:	08 01 
    3d5d:	66 c7 85 10 ea ff ff 	movw   $0x104,-0x15f0(%ebp)
    3d64:	04 01 
    3d66:	66 c7 85 12 ea ff ff 	movw   $0x102,-0x15ee(%ebp)
    3d6d:	02 01 
    3d6f:	66 c7 85 14 ea ff ff 	movw   $0x0,-0x15ec(%ebp)
    3d76:	00 00 
    3d78:	66 c7 85 16 ea ff ff 	movw   $0x100,-0x15ea(%ebp)
    3d7f:	00 01 
    3d81:	66 c7 85 18 ea ff ff 	movw   $0x102,-0x15e8(%ebp)
    3d88:	02 01 
    3d8a:	66 c7 85 1a ea ff ff 	movw   $0x200,-0x15e6(%ebp)
    3d91:	00 02 
    3d93:	66 c7 85 1c ea ff ff 	movw   $0x300,-0x15e4(%ebp)
    3d9a:	00 03 
    3d9c:	66 c7 85 1e ea ff ff 	movw   $0x104,-0x15e2(%ebp)
    3da3:	04 01 
    3da5:	66 c7 85 20 ea ff ff 	movw   $0x102,-0x15e0(%ebp)
    3dac:	02 01 
    3dae:	66 c7 85 22 ea ff ff 	movw   $0x400,-0x15de(%ebp)
    3db5:	00 04 
    3db7:	66 c7 85 24 ea ff ff 	movw   $0x500,-0x15dc(%ebp)
    3dbe:	00 05 
    3dc0:	66 c7 85 26 ea ff ff 	movw   $0x102,-0x15da(%ebp)
    3dc7:	02 01 
    3dc9:	66 c7 85 28 ea ff ff 	movw   $0x600,-0x15d8(%ebp)
    3dd0:	00 06 
    3dd2:	66 c7 85 2a ea ff ff 	movw   $0x700,-0x15d6(%ebp)
    3dd9:	00 07 
    3ddb:	66 c7 85 2c ea ff ff 	movw   $0x108,-0x15d4(%ebp)
    3de2:	08 01 
    3de4:	66 c7 85 2e ea ff ff 	movw   $0x104,-0x15d2(%ebp)
    3deb:	04 01 
    3ded:	66 c7 85 30 ea ff ff 	movw   $0x102,-0x15d0(%ebp)
    3df4:	02 01 
    3df6:	66 c7 85 32 ea ff ff 	movw   $0x800,-0x15ce(%ebp)
    3dfd:	00 08 
    3dff:	66 c7 85 34 ea ff ff 	movw   $0x900,-0x15cc(%ebp)
    3e06:	00 09 
    3e08:	66 c7 85 36 ea ff ff 	movw   $0x102,-0x15ca(%ebp)
    3e0f:	02 01 
    3e11:	66 c7 85 38 ea ff ff 	movw   $0xa00,-0x15c8(%ebp)
    3e18:	00 0a 
    3e1a:	66 c7 85 3a ea ff ff 	movw   $0xb00,-0x15c6(%ebp)
    3e21:	00 0b 
    3e23:	66 c7 85 3c ea ff ff 	movw   $0x104,-0x15c4(%ebp)
    3e2a:	04 01 
    3e2c:	66 c7 85 3e ea ff ff 	movw   $0x102,-0x15c2(%ebp)
    3e33:	02 01 
    3e35:	66 c7 85 40 ea ff ff 	movw   $0xc00,-0x15c0(%ebp)
    3e3c:	00 0c 
    3e3e:	66 c7 85 42 ea ff ff 	movw   $0xd00,-0x15be(%ebp)
    3e45:	00 0d 
    3e47:	66 c7 85 44 ea ff ff 	movw   $0x102,-0x15bc(%ebp)
    3e4e:	02 01 
    3e50:	66 c7 85 46 ea ff ff 	movw   $0xe00,-0x15ba(%ebp)
    3e57:	00 0e 
    3e59:	66 c7 85 48 ea ff ff 	movw   $0xf00,-0x15b8(%ebp)
    3e60:	00 0f 
	
	struct huffcodetab ht[HTN] = {
    3e62:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    3e69:	30 00 
    3e6b:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    3e72:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    3e79:	00 00 00 
    3e7c:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    3e83:	00 00 00 
    3e86:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    3e8d:	00 00 00 
    3e90:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    3e97:	00 00 00 
    3e9a:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    3ea1:	ff ff ff 
    3ea4:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    3eab:	00 00 00 
    3eae:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    3eb5:	00 00 00 
    3eb8:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    3ebf:	00 00 00 
    3ec2:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    3ec9:	00 00 00 
    3ecc:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    3ed3:	31 00 
    3ed5:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    3edc:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    3ee3:	00 00 00 
    3ee6:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    3eed:	00 00 00 
    3ef0:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    3ef7:	00 00 00 
    3efa:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    3f01:	00 00 00 
    3f04:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    3f0b:	ff ff ff 
    3f0e:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    3f15:	00 00 00 
    3f18:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    3f1f:	00 00 00 
    3f22:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3f25:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    3f2b:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    3f32:	00 00 00 
    3f35:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    3f3c:	32 00 
    3f3e:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    3f45:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    3f4c:	00 00 00 
    3f4f:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    3f56:	00 00 00 
    3f59:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    3f60:	00 00 00 
    3f63:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    3f6a:	00 00 00 
    3f6d:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    3f74:	ff ff ff 
    3f77:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    3f7e:	00 00 00 
    3f81:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    3f88:	00 00 00 
    3f8b:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    3f8e:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    3f94:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    3f9b:	00 00 00 
    3f9e:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    3fa5:	33 00 
    3fa7:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    3fae:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    3fb5:	00 00 00 
    3fb8:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    3fbf:	00 00 00 
    3fc2:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    3fc9:	00 00 00 
    3fcc:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    3fd3:	00 00 00 
    3fd6:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    3fdd:	ff ff ff 
    3fe0:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    3fe7:	00 00 00 
    3fea:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    3ff1:	00 00 00 
    3ff4:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    3ff7:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    3ffd:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    4004:	00 00 00 
    4007:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    400e:	34 00 
    4010:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    4017:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    401e:	00 00 00 
    4021:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    4028:	00 00 00 
    402b:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    4032:	00 00 00 
    4035:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    403c:	00 00 00 
    403f:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    4046:	ff ff ff 
    4049:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    4050:	00 00 00 
    4053:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    405a:	00 00 00 
    405d:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    4064:	00 00 00 
    4067:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    406e:	00 00 00 
    4071:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    4078:	35 00 
    407a:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    4081:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    4088:	00 00 00 
    408b:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    4092:	00 00 00 
    4095:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    409c:	00 00 00 
    409f:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    40a6:	00 00 00 
    40a9:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    40b0:	ff ff ff 
    40b3:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    40ba:	00 00 00 
    40bd:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    40c4:	00 00 00 
    40c7:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    40cd:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    40d3:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    40da:	00 00 00 
    40dd:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    40e4:	36 00 
    40e6:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    40ed:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    40f4:	00 00 00 
    40f7:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    40fe:	00 00 00 
    4101:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    4108:	00 00 00 
    410b:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    4112:	00 00 00 
    4115:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    411c:	ff ff ff 
    411f:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    4126:	00 00 00 
    4129:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    4130:	00 00 00 
    4133:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    4139:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    413f:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    4146:	00 00 00 
    4149:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    4150:	37 00 
    4152:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    4159:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    4160:	00 00 00 
    4163:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    416a:	00 00 00 
    416d:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    4174:	00 00 00 
    4177:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    417e:	00 00 00 
    4181:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    4188:	ff ff ff 
    418b:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    4192:	00 00 00 
    4195:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    419c:	00 00 00 
    419f:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    41a5:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    41ab:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    41b2:	00 00 00 
    41b5:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    41bc:	38 00 
    41be:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    41c5:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    41cc:	00 00 00 
    41cf:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    41d6:	00 00 00 
    41d9:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    41e0:	00 00 00 
    41e3:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    41ea:	00 00 00 
    41ed:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    41f4:	ff ff ff 
    41f7:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    41fe:	00 00 00 
    4201:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    4208:	00 00 00 
    420b:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    4211:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    4217:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    421e:	00 00 00 
    4221:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    4228:	39 00 
    422a:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    4231:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    4238:	00 00 00 
    423b:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    4242:	00 00 00 
    4245:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    424c:	00 00 00 
    424f:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    4256:	00 00 00 
    4259:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    4260:	ff ff ff 
    4263:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    426a:	00 00 00 
    426d:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    4274:	00 00 00 
    4277:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    427d:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    4283:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    428a:	00 00 00 
    428d:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    4294:	31 30 
    4296:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    429d:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    42a4:	00 00 00 
    42a7:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    42ae:	00 00 00 
    42b1:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    42b8:	00 00 00 
    42bb:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    42c2:	00 00 00 
    42c5:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    42cc:	ff ff ff 
    42cf:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    42d6:	00 00 00 
    42d9:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    42e0:	00 00 00 
    42e3:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    42e9:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    42ef:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    42f6:	00 00 00 
    42f9:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    4300:	31 31 
    4302:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    4309:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    4310:	00 00 00 
    4313:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    431a:	00 00 00 
    431d:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    4324:	00 00 00 
    4327:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    432e:	00 00 00 
    4331:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    4338:	ff ff ff 
    433b:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    4342:	00 00 00 
    4345:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    434c:	00 00 00 
    434f:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    4355:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    435b:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    4362:	00 00 00 
    4365:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    436c:	31 32 
    436e:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    4375:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    437c:	00 00 00 
    437f:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    4386:	00 00 00 
    4389:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    4390:	00 00 00 
    4393:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    439a:	00 00 00 
    439d:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    43a4:	ff ff ff 
    43a7:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    43ae:	00 00 00 
    43b1:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    43b8:	00 00 00 
    43bb:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    43c1:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    43c7:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    43ce:	00 00 00 
    43d1:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    43d8:	31 33 
    43da:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    43e1:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    43e8:	00 00 00 
    43eb:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    43f2:	00 00 00 
    43f5:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    43fc:	00 00 00 
    43ff:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    4406:	00 00 00 
    4409:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    4410:	ff ff ff 
    4413:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    441a:	00 00 00 
    441d:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    4424:	00 00 00 
    4427:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    442d:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    4433:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    443a:	01 00 00 
    443d:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    4444:	31 34 
    4446:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    444d:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    4454:	00 00 00 
    4457:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    445e:	00 00 00 
    4461:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    4468:	00 00 00 
    446b:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    4472:	00 00 00 
    4475:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    447c:	ff ff ff 
    447f:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    4486:	00 00 00 
    4489:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    4490:	00 00 00 
    4493:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    449a:	00 00 00 
    449d:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    44a4:	00 00 00 
    44a7:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    44ae:	31 35 
    44b0:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    44b7:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    44be:	00 00 00 
    44c1:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    44c8:	00 00 00 
    44cb:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    44d2:	00 00 00 
    44d5:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    44dc:	00 00 00 
    44df:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    44e6:	ff ff ff 
    44e9:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    44f0:	00 00 00 
    44f3:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    44fa:	00 00 00 
    44fd:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    4503:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    4509:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    4510:	01 00 00 
    4513:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    451a:	31 36 
    451c:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    4523:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    452a:	00 00 00 
    452d:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    4534:	00 00 00 
    4537:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    453e:	00 00 00 
    4541:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    4548:	00 00 00 
    454b:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    4552:	ff ff ff 
    4555:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    455c:	00 00 00 
    455f:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    4566:	00 00 00 
    4569:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    456f:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    4575:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    457c:	01 00 00 
    457f:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    4586:	31 37 
    4588:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    458f:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    4596:	00 00 00 
    4599:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    45a0:	00 00 00 
    45a3:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    45aa:	00 00 00 
    45ad:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    45b4:	00 00 00 
    45b7:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    45be:	00 00 00 
    45c1:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    45c8:	00 00 00 
    45cb:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    45d2:	00 00 00 
    45d5:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    45db:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    45e1:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    45e8:	01 00 00 
    45eb:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    45f2:	31 38 
    45f4:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    45fb:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    4602:	00 00 00 
    4605:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    460c:	00 00 00 
    460f:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    4616:	00 00 00 
    4619:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    4620:	00 00 00 
    4623:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    462a:	00 00 00 
    462d:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    4634:	00 00 00 
    4637:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    463e:	00 00 00 
    4641:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    4647:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    464d:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    4654:	01 00 00 
    4657:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    465e:	31 39 
    4660:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    4667:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    466e:	00 00 00 
    4671:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    4678:	00 00 00 
    467b:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    4682:	00 00 00 
    4685:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    468c:	00 00 00 
    468f:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    4696:	00 00 00 
    4699:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    46a0:	00 00 00 
    46a3:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    46aa:	00 00 00 
    46ad:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    46b3:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    46b9:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    46c0:	01 00 00 
    46c3:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    46ca:	32 30 
    46cc:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    46d3:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    46da:	00 00 00 
    46dd:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    46e4:	00 00 00 
    46e7:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    46ee:	00 00 00 
    46f1:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    46f8:	00 00 00 
    46fb:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    4702:	00 00 00 
    4705:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    470c:	00 00 00 
    470f:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    4716:	00 00 00 
    4719:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    471f:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    4725:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    472c:	01 00 00 
    472f:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    4736:	32 31 
    4738:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    473f:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    4746:	00 00 00 
    4749:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    4750:	00 00 00 
    4753:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    475a:	00 00 00 
    475d:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    4764:	00 00 00 
    4767:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    476e:	00 00 00 
    4771:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    4778:	00 00 00 
    477b:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    4782:	00 00 00 
    4785:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    478b:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    4791:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    4798:	01 00 00 
    479b:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    47a2:	32 32 
    47a4:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    47ab:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    47b2:	00 00 00 
    47b5:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    47bc:	00 00 00 
    47bf:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    47c6:	00 00 00 
    47c9:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    47d0:	03 00 00 
    47d3:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    47da:	00 00 00 
    47dd:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    47e4:	00 00 00 
    47e7:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    47ee:	00 00 00 
    47f1:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    47f7:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    47fd:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    4804:	01 00 00 
    4807:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    480e:	32 33 
    4810:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    4817:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    481e:	00 00 00 
    4821:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    4828:	00 00 00 
    482b:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    4832:	00 00 00 
    4835:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    483c:	1f 00 00 
    483f:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    4846:	00 00 00 
    4849:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    4850:	00 00 00 
    4853:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    485a:	00 00 00 
    485d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    4863:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    4869:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    4870:	01 00 00 
    4873:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    487a:	32 34 
    487c:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    4883:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    488a:	00 00 00 
    488d:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    4894:	00 00 00 
    4897:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    489e:	00 00 00 
    48a1:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    48a8:	00 00 00 
    48ab:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    48b2:	ff ff ff 
    48b5:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    48bc:	00 00 00 
    48bf:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    48c6:	00 00 00 
    48c9:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    48cf:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    48d5:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    48dc:	02 00 00 
    48df:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    48e6:	32 35 
    48e8:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    48ef:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    48f6:	00 00 00 
    48f9:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    4900:	00 00 00 
    4903:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    490a:	00 00 00 
    490d:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    4914:	00 00 00 
    4917:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    491e:	00 00 00 
    4921:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    4928:	00 00 00 
    492b:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    4932:	00 00 00 
    4935:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    493b:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    4941:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    4948:	02 00 00 
    494b:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    4952:	32 36 
    4954:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    495b:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    4962:	00 00 00 
    4965:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    496c:	00 00 00 
    496f:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    4976:	00 00 00 
    4979:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    4980:	00 00 00 
    4983:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    498a:	00 00 00 
    498d:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    4994:	00 00 00 
    4997:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    499e:	00 00 00 
    49a1:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    49a7:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    49ad:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    49b4:	02 00 00 
    49b7:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    49be:	32 37 
    49c0:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    49c7:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    49ce:	00 00 00 
    49d1:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    49d8:	00 00 00 
    49db:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    49e2:	00 00 00 
    49e5:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    49ec:	00 00 00 
    49ef:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    49f6:	00 00 00 
    49f9:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    4a00:	00 00 00 
    4a03:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    4a0a:	00 00 00 
    4a0d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    4a13:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    4a19:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    4a20:	02 00 00 
    4a23:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    4a2a:	32 38 
    4a2c:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    4a33:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    4a3a:	00 00 00 
    4a3d:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    4a44:	00 00 00 
    4a47:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    4a4e:	00 00 00 
    4a51:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    4a58:	00 00 00 
    4a5b:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    4a62:	00 00 00 
    4a65:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    4a6c:	00 00 00 
    4a6f:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    4a76:	00 00 00 
    4a79:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    4a7f:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    4a85:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    4a8c:	02 00 00 
    4a8f:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    4a96:	32 39 
    4a98:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    4a9f:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    4aa6:	00 00 00 
    4aa9:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    4ab0:	00 00 00 
    4ab3:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    4aba:	00 00 00 
    4abd:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    4ac4:	01 00 00 
    4ac7:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    4ace:	00 00 00 
    4ad1:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    4ad8:	00 00 00 
    4adb:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    4ae2:	00 00 00 
    4ae5:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    4aeb:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    4af1:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    4af8:	02 00 00 
    4afb:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    4b02:	33 30 
    4b04:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    4b0b:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    4b12:	00 00 00 
    4b15:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    4b1c:	00 00 00 
    4b1f:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    4b26:	00 00 00 
    4b29:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    4b30:	07 00 00 
    4b33:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    4b3a:	00 00 00 
    4b3d:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    4b44:	00 00 00 
    4b47:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    4b4e:	00 00 00 
    4b51:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    4b57:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    4b5d:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    4b64:	02 00 00 
    4b67:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    4b6e:	33 31 
    4b70:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    4b77:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    4b7e:	00 00 00 
    4b81:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    4b88:	00 00 00 
    4b8b:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    4b92:	00 00 00 
    4b95:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    4b9c:	1f 00 00 
    4b9f:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    4ba6:	00 00 00 
    4ba9:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    4bb0:	00 00 00 
    4bb3:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    4bba:	00 00 00 
    4bbd:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    4bc3:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    4bc9:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    4bd0:	02 00 00 
    4bd3:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    4bda:	33 32 
    4bdc:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    4be3:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    4bea:	00 00 00 
    4bed:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    4bf4:	00 00 00 
    4bf7:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    4bfe:	00 00 00 
    4c01:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    4c08:	00 00 00 
    4c0b:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    4c12:	ff ff ff 
    4c15:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    4c1c:	00 00 00 
    4c1f:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    4c26:	00 00 00 
    4c29:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    4c2f:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    4c35:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    4c3c:	00 00 00 
    4c3f:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    4c46:	33 33 
    4c48:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    4c4f:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    4c56:	00 00 00 
    4c59:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    4c60:	00 00 00 
    4c63:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    4c6a:	00 00 00 
    4c6d:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    4c74:	00 00 00 
    4c77:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    4c7e:	ff ff ff 
    4c81:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    4c88:	00 00 00 
    4c8b:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    4c92:	00 00 00 
    4c95:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    4c9b:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    4ca1:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    4ca8:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    4cab:	90                   	nop
    4cac:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    4cb2:	5b                   	pop    %ebx
    4cb3:	5e                   	pop    %esi
    4cb4:	5f                   	pop    %edi
    4cb5:	5d                   	pop    %ebp
    4cb6:	c3                   	ret    

00004cb7 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    4cb7:	55                   	push   %ebp
    4cb8:	89 e5                	mov    %esp,%ebp
    4cba:	83 ec 18             	sub    $0x18,%esp
  HUFFBITS level;
  int point = 0;
    4cbd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    4cc4:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    4ccb:	a1 30 c5 00 00       	mov    0xc530,%eax
    4cd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    4cd3:	8b 45 08             	mov    0x8(%ebp),%eax
    4cd6:	8b 40 20             	mov    0x20(%eax),%eax
    4cd9:	85 c0                	test   %eax,%eax
    4cdb:	75 0a                	jne    4ce7 <huffman_decoder+0x30>
    4cdd:	b8 02 00 00 00       	mov    $0x2,%eax
    4ce2:	e9 1a 03 00 00       	jmp    5001 <huffman_decoder+0x34a>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    4ce7:	8b 45 08             	mov    0x8(%ebp),%eax
    4cea:	8b 40 24             	mov    0x24(%eax),%eax
    4ced:	85 c0                	test   %eax,%eax
    4cef:	75 1d                	jne    4d0e <huffman_decoder+0x57>
  {  *x = *y = 0;
    4cf1:	8b 45 10             	mov    0x10(%ebp),%eax
    4cf4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    4cfa:	8b 45 10             	mov    0x10(%ebp),%eax
    4cfd:	8b 10                	mov    (%eax),%edx
    4cff:	8b 45 0c             	mov    0xc(%ebp),%eax
    4d02:	89 10                	mov    %edx,(%eax)
     return 0;
    4d04:	b8 00 00 00 00       	mov    $0x0,%eax
    4d09:	e9 f3 02 00 00       	jmp    5001 <huffman_decoder+0x34a>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    4d0e:	8b 45 08             	mov    0x8(%ebp),%eax
    4d11:	8b 50 20             	mov    0x20(%eax),%edx
    4d14:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d17:	01 c0                	add    %eax,%eax
    4d19:	01 d0                	add    %edx,%eax
    4d1b:	0f b6 00             	movzbl (%eax),%eax
    4d1e:	84 c0                	test   %al,%al
    4d20:	75 46                	jne    4d68 <huffman_decoder+0xb1>
      *x = h->val[point][1] >> 4;
    4d22:	8b 45 08             	mov    0x8(%ebp),%eax
    4d25:	8b 50 20             	mov    0x20(%eax),%edx
    4d28:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d2b:	01 c0                	add    %eax,%eax
    4d2d:	01 d0                	add    %edx,%eax
    4d2f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4d33:	c0 e8 04             	shr    $0x4,%al
    4d36:	0f b6 d0             	movzbl %al,%edx
    4d39:	8b 45 0c             	mov    0xc(%ebp),%eax
    4d3c:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    4d3e:	8b 45 08             	mov    0x8(%ebp),%eax
    4d41:	8b 50 20             	mov    0x20(%eax),%edx
    4d44:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d47:	01 c0                	add    %eax,%eax
    4d49:	01 d0                	add    %edx,%eax
    4d4b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4d4f:	0f b6 c0             	movzbl %al,%eax
    4d52:	83 e0 0f             	and    $0xf,%eax
    4d55:	89 c2                	mov    %eax,%edx
    4d57:	8b 45 10             	mov    0x10(%ebp),%eax
    4d5a:	89 10                	mov    %edx,(%eax)

      error = 0;
    4d5c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    4d63:	e9 ae 00 00 00       	jmp    4e16 <huffman_decoder+0x15f>
    } 
    if (hget1bit()) {
    4d68:	e8 eb e9 ff ff       	call   3758 <hget1bit>
    4d6d:	85 c0                	test   %eax,%eax
    4d6f:	74 5d                	je     4dce <huffman_decoder+0x117>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    4d71:	eb 17                	jmp    4d8a <huffman_decoder+0xd3>
    4d73:	8b 45 08             	mov    0x8(%ebp),%eax
    4d76:	8b 50 20             	mov    0x20(%eax),%edx
    4d79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d7c:	01 c0                	add    %eax,%eax
    4d7e:	01 d0                	add    %edx,%eax
    4d80:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4d84:	0f b6 c0             	movzbl %al,%eax
    4d87:	01 45 f0             	add    %eax,-0x10(%ebp)
    4d8a:	8b 45 08             	mov    0x8(%ebp),%eax
    4d8d:	8b 50 20             	mov    0x20(%eax),%edx
    4d90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d93:	01 c0                	add    %eax,%eax
    4d95:	01 d0                	add    %edx,%eax
    4d97:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4d9b:	3c f9                	cmp    $0xf9,%al
    4d9d:	77 d4                	ja     4d73 <huffman_decoder+0xbc>
      point += h->val[point][1];
    4d9f:	8b 45 08             	mov    0x8(%ebp),%eax
    4da2:	8b 50 20             	mov    0x20(%eax),%edx
    4da5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4da8:	01 c0                	add    %eax,%eax
    4daa:	01 d0                	add    %edx,%eax
    4dac:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4db0:	0f b6 c0             	movzbl %al,%eax
    4db3:	01 45 f0             	add    %eax,-0x10(%ebp)
    4db6:	eb 40                	jmp    4df8 <huffman_decoder+0x141>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    4db8:	8b 45 08             	mov    0x8(%ebp),%eax
    4dbb:	8b 50 20             	mov    0x20(%eax),%edx
    4dbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4dc1:	01 c0                	add    %eax,%eax
    4dc3:	01 d0                	add    %edx,%eax
    4dc5:	0f b6 00             	movzbl (%eax),%eax
    4dc8:	0f b6 c0             	movzbl %al,%eax
    4dcb:	01 45 f0             	add    %eax,-0x10(%ebp)
    4dce:	8b 45 08             	mov    0x8(%ebp),%eax
    4dd1:	8b 50 20             	mov    0x20(%eax),%edx
    4dd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4dd7:	01 c0                	add    %eax,%eax
    4dd9:	01 d0                	add    %edx,%eax
    4ddb:	0f b6 00             	movzbl (%eax),%eax
    4dde:	3c f9                	cmp    $0xf9,%al
    4de0:	77 d6                	ja     4db8 <huffman_decoder+0x101>
      point += h->val[point][0];
    4de2:	8b 45 08             	mov    0x8(%ebp),%eax
    4de5:	8b 50 20             	mov    0x20(%eax),%edx
    4de8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4deb:	01 c0                	add    %eax,%eax
    4ded:	01 d0                	add    %edx,%eax
    4def:	0f b6 00             	movzbl (%eax),%eax
    4df2:	0f b6 c0             	movzbl %al,%eax
    4df5:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    4df8:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    4dfb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4dff:	0f 85 09 ff ff ff    	jne    4d0e <huffman_decoder+0x57>
    4e05:	8b 15 c4 ca 00 00    	mov    0xcac4,%edx
    4e0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4e0e:	39 c2                	cmp    %eax,%edx
    4e10:	0f 87 f8 fe ff ff    	ja     4d0e <huffman_decoder+0x57>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    4e16:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4e1a:	74 24                	je     4e40 <huffman_decoder+0x189>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    4e1c:	8b 45 08             	mov    0x8(%ebp),%eax
    4e1f:	8b 40 04             	mov    0x4(%eax),%eax
    4e22:	83 e8 01             	sub    $0x1,%eax
    4e25:	01 c0                	add    %eax,%eax
    4e27:	89 c2                	mov    %eax,%edx
    4e29:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e2c:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    4e2e:	8b 45 08             	mov    0x8(%ebp),%eax
    4e31:	8b 40 08             	mov    0x8(%eax),%eax
    4e34:	83 e8 01             	sub    $0x1,%eax
    4e37:	01 c0                	add    %eax,%eax
    4e39:	89 c2                	mov    %eax,%edx
    4e3b:	8b 45 10             	mov    0x10(%ebp),%eax
    4e3e:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    4e40:	8b 45 08             	mov    0x8(%ebp),%eax
    4e43:	0f b6 00             	movzbl (%eax),%eax
    4e46:	3c 33                	cmp    $0x33,%al
    4e48:	0f 85 ef 00 00 00    	jne    4f3d <huffman_decoder+0x286>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    4e4e:	8b 45 08             	mov    0x8(%ebp),%eax
    4e51:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4e55:	3c 32                	cmp    $0x32,%al
    4e57:	74 0f                	je     4e68 <huffman_decoder+0x1b1>
    4e59:	8b 45 08             	mov    0x8(%ebp),%eax
    4e5c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4e60:	3c 33                	cmp    $0x33,%al
    4e62:	0f 85 d5 00 00 00    	jne    4f3d <huffman_decoder+0x286>
     *v = (*y>>3) & 1;
    4e68:	8b 45 10             	mov    0x10(%ebp),%eax
    4e6b:	8b 00                	mov    (%eax),%eax
    4e6d:	c1 f8 03             	sar    $0x3,%eax
    4e70:	83 e0 01             	and    $0x1,%eax
    4e73:	89 c2                	mov    %eax,%edx
    4e75:	8b 45 14             	mov    0x14(%ebp),%eax
    4e78:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    4e7a:	8b 45 10             	mov    0x10(%ebp),%eax
    4e7d:	8b 00                	mov    (%eax),%eax
    4e7f:	c1 f8 02             	sar    $0x2,%eax
    4e82:	83 e0 01             	and    $0x1,%eax
    4e85:	89 c2                	mov    %eax,%edx
    4e87:	8b 45 18             	mov    0x18(%ebp),%eax
    4e8a:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    4e8c:	8b 45 10             	mov    0x10(%ebp),%eax
    4e8f:	8b 00                	mov    (%eax),%eax
    4e91:	d1 f8                	sar    %eax
    4e93:	83 e0 01             	and    $0x1,%eax
    4e96:	89 c2                	mov    %eax,%edx
    4e98:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e9b:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    4e9d:	8b 45 10             	mov    0x10(%ebp),%eax
    4ea0:	8b 00                	mov    (%eax),%eax
    4ea2:	83 e0 01             	and    $0x1,%eax
    4ea5:	89 c2                	mov    %eax,%edx
    4ea7:	8b 45 10             	mov    0x10(%ebp),%eax
    4eaa:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    4eac:	8b 45 14             	mov    0x14(%ebp),%eax
    4eaf:	8b 00                	mov    (%eax),%eax
    4eb1:	85 c0                	test   %eax,%eax
    4eb3:	74 18                	je     4ecd <huffman_decoder+0x216>
        if (hget1bit() == 1) *v = -*v;
    4eb5:	e8 9e e8 ff ff       	call   3758 <hget1bit>
    4eba:	83 f8 01             	cmp    $0x1,%eax
    4ebd:	75 0e                	jne    4ecd <huffman_decoder+0x216>
    4ebf:	8b 45 14             	mov    0x14(%ebp),%eax
    4ec2:	8b 00                	mov    (%eax),%eax
    4ec4:	f7 d8                	neg    %eax
    4ec6:	89 c2                	mov    %eax,%edx
    4ec8:	8b 45 14             	mov    0x14(%ebp),%eax
    4ecb:	89 10                	mov    %edx,(%eax)
     if (*w)
    4ecd:	8b 45 18             	mov    0x18(%ebp),%eax
    4ed0:	8b 00                	mov    (%eax),%eax
    4ed2:	85 c0                	test   %eax,%eax
    4ed4:	74 18                	je     4eee <huffman_decoder+0x237>
        if (hget1bit() == 1) *w = -*w;
    4ed6:	e8 7d e8 ff ff       	call   3758 <hget1bit>
    4edb:	83 f8 01             	cmp    $0x1,%eax
    4ede:	75 0e                	jne    4eee <huffman_decoder+0x237>
    4ee0:	8b 45 18             	mov    0x18(%ebp),%eax
    4ee3:	8b 00                	mov    (%eax),%eax
    4ee5:	f7 d8                	neg    %eax
    4ee7:	89 c2                	mov    %eax,%edx
    4ee9:	8b 45 18             	mov    0x18(%ebp),%eax
    4eec:	89 10                	mov    %edx,(%eax)
     if (*x)
    4eee:	8b 45 0c             	mov    0xc(%ebp),%eax
    4ef1:	8b 00                	mov    (%eax),%eax
    4ef3:	85 c0                	test   %eax,%eax
    4ef5:	74 18                	je     4f0f <huffman_decoder+0x258>
        if (hget1bit() == 1) *x = -*x;
    4ef7:	e8 5c e8 ff ff       	call   3758 <hget1bit>
    4efc:	83 f8 01             	cmp    $0x1,%eax
    4eff:	75 0e                	jne    4f0f <huffman_decoder+0x258>
    4f01:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f04:	8b 00                	mov    (%eax),%eax
    4f06:	f7 d8                	neg    %eax
    4f08:	89 c2                	mov    %eax,%edx
    4f0a:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f0d:	89 10                	mov    %edx,(%eax)
     if (*y)
    4f0f:	8b 45 10             	mov    0x10(%ebp),%eax
    4f12:	8b 00                	mov    (%eax),%eax
    4f14:	85 c0                	test   %eax,%eax
    4f16:	0f 84 e1 00 00 00    	je     4ffd <huffman_decoder+0x346>
        if (hget1bit() == 1) *y = -*y;
    4f1c:	e8 37 e8 ff ff       	call   3758 <hget1bit>
    4f21:	83 f8 01             	cmp    $0x1,%eax
    4f24:	0f 85 d3 00 00 00    	jne    4ffd <huffman_decoder+0x346>
    4f2a:	8b 45 10             	mov    0x10(%ebp),%eax
    4f2d:	8b 00                	mov    (%eax),%eax
    4f2f:	f7 d8                	neg    %eax
    4f31:	89 c2                	mov    %eax,%edx
    4f33:	8b 45 10             	mov    0x10(%ebp),%eax
    4f36:	89 10                	mov    %edx,(%eax)
     if (*y)
    4f38:	e9 c0 00 00 00       	jmp    4ffd <huffman_decoder+0x346>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    4f3d:	8b 45 08             	mov    0x8(%ebp),%eax
    4f40:	8b 40 0c             	mov    0xc(%eax),%eax
    4f43:	85 c0                	test   %eax,%eax
    4f45:	74 34                	je     4f7b <huffman_decoder+0x2c4>
       if ((h->xlen-1) == *x) 
    4f47:	8b 45 08             	mov    0x8(%ebp),%eax
    4f4a:	8b 40 04             	mov    0x4(%eax),%eax
    4f4d:	8d 50 ff             	lea    -0x1(%eax),%edx
    4f50:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f53:	8b 00                	mov    (%eax),%eax
    4f55:	39 c2                	cmp    %eax,%edx
    4f57:	75 22                	jne    4f7b <huffman_decoder+0x2c4>
         *x += hgetbits(h->linbits);
    4f59:	8b 45 08             	mov    0x8(%ebp),%eax
    4f5c:	8b 40 0c             	mov    0xc(%eax),%eax
    4f5f:	83 ec 0c             	sub    $0xc,%esp
    4f62:	50                   	push   %eax
    4f63:	e8 d8 e7 ff ff       	call   3740 <hgetbits>
    4f68:	83 c4 10             	add    $0x10,%esp
    4f6b:	89 c2                	mov    %eax,%edx
    4f6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f70:	8b 00                	mov    (%eax),%eax
    4f72:	01 d0                	add    %edx,%eax
    4f74:	89 c2                	mov    %eax,%edx
    4f76:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f79:	89 10                	mov    %edx,(%eax)
     if (*x)
    4f7b:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f7e:	8b 00                	mov    (%eax),%eax
    4f80:	85 c0                	test   %eax,%eax
    4f82:	74 18                	je     4f9c <huffman_decoder+0x2e5>
        if (hget1bit() == 1) *x = -*x;
    4f84:	e8 cf e7 ff ff       	call   3758 <hget1bit>
    4f89:	83 f8 01             	cmp    $0x1,%eax
    4f8c:	75 0e                	jne    4f9c <huffman_decoder+0x2e5>
    4f8e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f91:	8b 00                	mov    (%eax),%eax
    4f93:	f7 d8                	neg    %eax
    4f95:	89 c2                	mov    %eax,%edx
    4f97:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f9a:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    4f9c:	8b 45 08             	mov    0x8(%ebp),%eax
    4f9f:	8b 40 0c             	mov    0xc(%eax),%eax
    4fa2:	85 c0                	test   %eax,%eax
    4fa4:	74 34                	je     4fda <huffman_decoder+0x323>
       if ((h->ylen-1) == *y)
    4fa6:	8b 45 08             	mov    0x8(%ebp),%eax
    4fa9:	8b 40 08             	mov    0x8(%eax),%eax
    4fac:	8d 50 ff             	lea    -0x1(%eax),%edx
    4faf:	8b 45 10             	mov    0x10(%ebp),%eax
    4fb2:	8b 00                	mov    (%eax),%eax
    4fb4:	39 c2                	cmp    %eax,%edx
    4fb6:	75 22                	jne    4fda <huffman_decoder+0x323>
         *y += hgetbits(h->linbits);
    4fb8:	8b 45 08             	mov    0x8(%ebp),%eax
    4fbb:	8b 40 0c             	mov    0xc(%eax),%eax
    4fbe:	83 ec 0c             	sub    $0xc,%esp
    4fc1:	50                   	push   %eax
    4fc2:	e8 79 e7 ff ff       	call   3740 <hgetbits>
    4fc7:	83 c4 10             	add    $0x10,%esp
    4fca:	89 c2                	mov    %eax,%edx
    4fcc:	8b 45 10             	mov    0x10(%ebp),%eax
    4fcf:	8b 00                	mov    (%eax),%eax
    4fd1:	01 d0                	add    %edx,%eax
    4fd3:	89 c2                	mov    %eax,%edx
    4fd5:	8b 45 10             	mov    0x10(%ebp),%eax
    4fd8:	89 10                	mov    %edx,(%eax)
     if (*y)
    4fda:	8b 45 10             	mov    0x10(%ebp),%eax
    4fdd:	8b 00                	mov    (%eax),%eax
    4fdf:	85 c0                	test   %eax,%eax
    4fe1:	74 1b                	je     4ffe <huffman_decoder+0x347>
        if (hget1bit() == 1) *y = -*y;
    4fe3:	e8 70 e7 ff ff       	call   3758 <hget1bit>
    4fe8:	83 f8 01             	cmp    $0x1,%eax
    4feb:	75 11                	jne    4ffe <huffman_decoder+0x347>
    4fed:	8b 45 10             	mov    0x10(%ebp),%eax
    4ff0:	8b 00                	mov    (%eax),%eax
    4ff2:	f7 d8                	neg    %eax
    4ff4:	89 c2                	mov    %eax,%edx
    4ff6:	8b 45 10             	mov    0x10(%ebp),%eax
    4ff9:	89 10                	mov    %edx,(%eax)
    4ffb:	eb 01                	jmp    4ffe <huffman_decoder+0x347>
     if (*y)
    4ffd:	90                   	nop
     }
	  
  return error;  
    4ffe:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    5001:	c9                   	leave  
    5002:	c3                   	ret    

00005003 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    5003:	55                   	push   %ebp
    5004:	89 e5                	mov    %esp,%ebp
    5006:	83 ec 18             	sub    $0x18,%esp
    layer *hdr = fr_ps->header;
    5009:	8b 45 0c             	mov    0xc(%ebp),%eax
    500c:	8b 00                	mov    (%eax),%eax
    500e:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    5011:	83 ec 0c             	sub    $0xc,%esp
    5014:	ff 75 08             	pushl  0x8(%ebp)
    5017:	e8 a4 e2 ff ff       	call   32c0 <get1bit>
    501c:	83 c4 10             	add    $0x10,%esp
    501f:	89 c2                	mov    %eax,%edx
    5021:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5024:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    5026:	83 ec 08             	sub    $0x8,%esp
    5029:	6a 02                	push   $0x2
    502b:	ff 75 08             	pushl  0x8(%ebp)
    502e:	e8 a8 e3 ff ff       	call   33db <getbits>
    5033:	83 c4 10             	add    $0x10,%esp
    5036:	89 c2                	mov    %eax,%edx
    5038:	b8 04 00 00 00       	mov    $0x4,%eax
    503d:	29 d0                	sub    %edx,%eax
    503f:	89 c2                	mov    %eax,%edx
    5041:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5044:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    5047:	83 ec 0c             	sub    $0xc,%esp
    504a:	ff 75 08             	pushl  0x8(%ebp)
    504d:	e8 6e e2 ff ff       	call   32c0 <get1bit>
    5052:	83 c4 10             	add    $0x10,%esp
    5055:	85 c0                	test   %eax,%eax
    5057:	0f 94 c0             	sete   %al
    505a:	0f b6 d0             	movzbl %al,%edx
    505d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5060:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    5063:	83 ec 08             	sub    $0x8,%esp
    5066:	6a 04                	push   $0x4
    5068:	ff 75 08             	pushl  0x8(%ebp)
    506b:	e8 6b e3 ff ff       	call   33db <getbits>
    5070:	83 c4 10             	add    $0x10,%esp
    5073:	89 c2                	mov    %eax,%edx
    5075:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5078:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    507b:	83 ec 08             	sub    $0x8,%esp
    507e:	6a 02                	push   $0x2
    5080:	ff 75 08             	pushl  0x8(%ebp)
    5083:	e8 53 e3 ff ff       	call   33db <getbits>
    5088:	83 c4 10             	add    $0x10,%esp
    508b:	89 c2                	mov    %eax,%edx
    508d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5090:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    5093:	83 ec 0c             	sub    $0xc,%esp
    5096:	ff 75 08             	pushl  0x8(%ebp)
    5099:	e8 22 e2 ff ff       	call   32c0 <get1bit>
    509e:	83 c4 10             	add    $0x10,%esp
    50a1:	89 c2                	mov    %eax,%edx
    50a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50a6:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    50a9:	83 ec 0c             	sub    $0xc,%esp
    50ac:	ff 75 08             	pushl  0x8(%ebp)
    50af:	e8 0c e2 ff ff       	call   32c0 <get1bit>
    50b4:	83 c4 10             	add    $0x10,%esp
    50b7:	89 c2                	mov    %eax,%edx
    50b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50bc:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    50bf:	83 ec 08             	sub    $0x8,%esp
    50c2:	6a 02                	push   $0x2
    50c4:	ff 75 08             	pushl  0x8(%ebp)
    50c7:	e8 0f e3 ff ff       	call   33db <getbits>
    50cc:	83 c4 10             	add    $0x10,%esp
    50cf:	89 c2                	mov    %eax,%edx
    50d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50d4:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    50d7:	83 ec 08             	sub    $0x8,%esp
    50da:	6a 02                	push   $0x2
    50dc:	ff 75 08             	pushl  0x8(%ebp)
    50df:	e8 f7 e2 ff ff       	call   33db <getbits>
    50e4:	83 c4 10             	add    $0x10,%esp
    50e7:	89 c2                	mov    %eax,%edx
    50e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50ec:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    50ef:	83 ec 0c             	sub    $0xc,%esp
    50f2:	ff 75 08             	pushl  0x8(%ebp)
    50f5:	e8 c6 e1 ff ff       	call   32c0 <get1bit>
    50fa:	83 c4 10             	add    $0x10,%esp
    50fd:	89 c2                	mov    %eax,%edx
    50ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5102:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    5105:	83 ec 0c             	sub    $0xc,%esp
    5108:	ff 75 08             	pushl  0x8(%ebp)
    510b:	e8 b0 e1 ff ff       	call   32c0 <get1bit>
    5110:	83 c4 10             	add    $0x10,%esp
    5113:	89 c2                	mov    %eax,%edx
    5115:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5118:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    511b:	83 ec 08             	sub    $0x8,%esp
    511e:	6a 02                	push   $0x2
    5120:	ff 75 08             	pushl  0x8(%ebp)
    5123:	e8 b3 e2 ff ff       	call   33db <getbits>
    5128:	83 c4 10             	add    $0x10,%esp
    512b:	89 c2                	mov    %eax,%edx
    512d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5130:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    5133:	90                   	nop
    5134:	c9                   	leave  
    5135:	c3                   	ret    

00005136 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    5136:	55                   	push   %ebp
    5137:	89 e5                	mov    %esp,%ebp
    5139:	56                   	push   %esi
    513a:	53                   	push   %ebx
    513b:	83 ec 10             	sub    $0x10,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    513e:	8b 45 10             	mov    0x10(%ebp),%eax
    5141:	8b 40 08             	mov    0x8(%eax),%eax
    5144:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    5147:	83 ec 08             	sub    $0x8,%esp
    514a:	6a 09                	push   $0x9
    514c:	ff 75 08             	pushl  0x8(%ebp)
    514f:	e8 87 e2 ff ff       	call   33db <getbits>
    5154:	83 c4 10             	add    $0x10,%esp
    5157:	8b 55 0c             	mov    0xc(%ebp),%edx
    515a:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    515c:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    5160:	75 18                	jne    517a <III_get_side_info+0x44>
		si->private_bits = getbits(bs,5);
    5162:	83 ec 08             	sub    $0x8,%esp
    5165:	6a 05                	push   $0x5
    5167:	ff 75 08             	pushl  0x8(%ebp)
    516a:	e8 6c e2 ff ff       	call   33db <getbits>
    516f:	83 c4 10             	add    $0x10,%esp
    5172:	8b 55 0c             	mov    0xc(%ebp),%edx
    5175:	89 42 04             	mov    %eax,0x4(%edx)
    5178:	eb 16                	jmp    5190 <III_get_side_info+0x5a>
	else
		si->private_bits = getbits(bs,3);
    517a:	83 ec 08             	sub    $0x8,%esp
    517d:	6a 03                	push   $0x3
    517f:	ff 75 08             	pushl  0x8(%ebp)
    5182:	e8 54 e2 ff ff       	call   33db <getbits>
    5187:	83 c4 10             	add    $0x10,%esp
    518a:	8b 55 0c             	mov    0xc(%ebp),%edx
    518d:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    5190:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5197:	eb 40                	jmp    51d9 <III_get_side_info+0xa3>
		for (i=0; i<4; i++)
    5199:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    51a0:	eb 2d                	jmp    51cf <III_get_side_info+0x99>
			si->ch[ch].scfsi[i] = get1bit(bs);
    51a2:	83 ec 0c             	sub    $0xc,%esp
    51a5:	ff 75 08             	pushl  0x8(%ebp)
    51a8:	e8 13 e1 ff ff       	call   32c0 <get1bit>
    51ad:	83 c4 10             	add    $0x10,%esp
    51b0:	89 c2                	mov    %eax,%edx
    51b2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    51b5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    51b8:	89 d8                	mov    %ebx,%eax
    51ba:	c1 e0 02             	shl    $0x2,%eax
    51bd:	01 d8                	add    %ebx,%eax
    51bf:	c1 e0 03             	shl    $0x3,%eax
    51c2:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    51c5:	01 d8                	add    %ebx,%eax
    51c7:	89 54 81 08          	mov    %edx,0x8(%ecx,%eax,4)
		for (i=0; i<4; i++)
    51cb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    51cf:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    51d3:	7e cd                	jle    51a2 <III_get_side_info+0x6c>
	for (ch=0; ch<stereo; ch++)
    51d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    51d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51dc:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    51df:	7c b8                	jl     5199 <III_get_side_info+0x63>

	for (gr=0; gr<2; gr++) {
    51e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    51e8:	e9 b6 05 00 00       	jmp    57a3 <III_get_side_info+0x66d>
		for (ch=0; ch<stereo; ch++) {
    51ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    51f4:	e9 9a 05 00 00       	jmp    5793 <III_get_side_info+0x65d>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    51f9:	83 ec 08             	sub    $0x8,%esp
    51fc:	6a 0c                	push   $0xc
    51fe:	ff 75 08             	pushl  0x8(%ebp)
    5201:	e8 d5 e1 ff ff       	call   33db <getbits>
    5206:	83 c4 10             	add    $0x10,%esp
    5209:	89 c1                	mov    %eax,%ecx
    520b:	8b 75 0c             	mov    0xc(%ebp),%esi
    520e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5211:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    5214:	89 c2                	mov    %eax,%edx
    5216:	c1 e2 03             	shl    $0x3,%edx
    5219:	01 c2                	add    %eax,%edx
    521b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5222:	89 c2                	mov    %eax,%edx
    5224:	89 d8                	mov    %ebx,%eax
    5226:	c1 e0 02             	shl    $0x2,%eax
    5229:	01 d8                	add    %ebx,%eax
    522b:	c1 e0 05             	shl    $0x5,%eax
    522e:	01 d0                	add    %edx,%eax
    5230:	01 f0                	add    %esi,%eax
    5232:	83 c0 18             	add    $0x18,%eax
    5235:	89 08                	mov    %ecx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    5237:	83 ec 08             	sub    $0x8,%esp
    523a:	6a 09                	push   $0x9
    523c:	ff 75 08             	pushl  0x8(%ebp)
    523f:	e8 97 e1 ff ff       	call   33db <getbits>
    5244:	83 c4 10             	add    $0x10,%esp
    5247:	89 c1                	mov    %eax,%ecx
    5249:	8b 75 0c             	mov    0xc(%ebp),%esi
    524c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    524f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    5252:	89 c2                	mov    %eax,%edx
    5254:	c1 e2 03             	shl    $0x3,%edx
    5257:	01 c2                	add    %eax,%edx
    5259:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5260:	89 c2                	mov    %eax,%edx
    5262:	89 d8                	mov    %ebx,%eax
    5264:	c1 e0 02             	shl    $0x2,%eax
    5267:	01 d8                	add    %ebx,%eax
    5269:	c1 e0 05             	shl    $0x5,%eax
    526c:	01 d0                	add    %edx,%eax
    526e:	01 f0                	add    %esi,%eax
    5270:	83 c0 1c             	add    $0x1c,%eax
    5273:	89 08                	mov    %ecx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    5275:	83 ec 08             	sub    $0x8,%esp
    5278:	6a 08                	push   $0x8
    527a:	ff 75 08             	pushl  0x8(%ebp)
    527d:	e8 59 e1 ff ff       	call   33db <getbits>
    5282:	83 c4 10             	add    $0x10,%esp
    5285:	89 c1                	mov    %eax,%ecx
    5287:	8b 75 0c             	mov    0xc(%ebp),%esi
    528a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    528d:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    5290:	89 c2                	mov    %eax,%edx
    5292:	c1 e2 03             	shl    $0x3,%edx
    5295:	01 c2                	add    %eax,%edx
    5297:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    529e:	89 c2                	mov    %eax,%edx
    52a0:	89 d8                	mov    %ebx,%eax
    52a2:	c1 e0 02             	shl    $0x2,%eax
    52a5:	01 d8                	add    %ebx,%eax
    52a7:	c1 e0 05             	shl    $0x5,%eax
    52aa:	01 d0                	add    %edx,%eax
    52ac:	01 f0                	add    %esi,%eax
    52ae:	83 c0 20             	add    $0x20,%eax
    52b1:	89 08                	mov    %ecx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    52b3:	83 ec 08             	sub    $0x8,%esp
    52b6:	6a 04                	push   $0x4
    52b8:	ff 75 08             	pushl  0x8(%ebp)
    52bb:	e8 1b e1 ff ff       	call   33db <getbits>
    52c0:	83 c4 10             	add    $0x10,%esp
    52c3:	89 c1                	mov    %eax,%ecx
    52c5:	8b 75 0c             	mov    0xc(%ebp),%esi
    52c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    52cb:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    52ce:	89 c2                	mov    %eax,%edx
    52d0:	c1 e2 03             	shl    $0x3,%edx
    52d3:	01 c2                	add    %eax,%edx
    52d5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    52dc:	89 c2                	mov    %eax,%edx
    52de:	89 d8                	mov    %ebx,%eax
    52e0:	c1 e0 02             	shl    $0x2,%eax
    52e3:	01 d8                	add    %ebx,%eax
    52e5:	c1 e0 05             	shl    $0x5,%eax
    52e8:	01 d0                	add    %edx,%eax
    52ea:	01 f0                	add    %esi,%eax
    52ec:	83 c0 24             	add    $0x24,%eax
    52ef:	89 08                	mov    %ecx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    52f1:	83 ec 0c             	sub    $0xc,%esp
    52f4:	ff 75 08             	pushl  0x8(%ebp)
    52f7:	e8 c4 df ff ff       	call   32c0 <get1bit>
    52fc:	83 c4 10             	add    $0x10,%esp
    52ff:	89 c1                	mov    %eax,%ecx
    5301:	8b 75 0c             	mov    0xc(%ebp),%esi
    5304:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5307:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    530a:	89 c2                	mov    %eax,%edx
    530c:	c1 e2 03             	shl    $0x3,%edx
    530f:	01 c2                	add    %eax,%edx
    5311:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5318:	89 c2                	mov    %eax,%edx
    531a:	89 d8                	mov    %ebx,%eax
    531c:	c1 e0 02             	shl    $0x2,%eax
    531f:	01 d8                	add    %ebx,%eax
    5321:	c1 e0 05             	shl    $0x5,%eax
    5324:	01 d0                	add    %edx,%eax
    5326:	01 f0                	add    %esi,%eax
    5328:	83 c0 28             	add    $0x28,%eax
    532b:	89 08                	mov    %ecx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    532d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5330:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5333:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5336:	89 c2                	mov    %eax,%edx
    5338:	c1 e2 03             	shl    $0x3,%edx
    533b:	01 c2                	add    %eax,%edx
    533d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5344:	89 c2                	mov    %eax,%edx
    5346:	89 c8                	mov    %ecx,%eax
    5348:	c1 e0 02             	shl    $0x2,%eax
    534b:	01 c8                	add    %ecx,%eax
    534d:	c1 e0 05             	shl    $0x5,%eax
    5350:	01 d0                	add    %edx,%eax
    5352:	01 d8                	add    %ebx,%eax
    5354:	83 c0 28             	add    $0x28,%eax
    5357:	8b 00                	mov    (%eax),%eax
    5359:	85 c0                	test   %eax,%eax
    535b:	0f 84 7c 02 00 00    	je     55dd <III_get_side_info+0x4a7>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    5361:	83 ec 08             	sub    $0x8,%esp
    5364:	6a 02                	push   $0x2
    5366:	ff 75 08             	pushl  0x8(%ebp)
    5369:	e8 6d e0 ff ff       	call   33db <getbits>
    536e:	83 c4 10             	add    $0x10,%esp
    5371:	89 c1                	mov    %eax,%ecx
    5373:	8b 75 0c             	mov    0xc(%ebp),%esi
    5376:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5379:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    537c:	89 c2                	mov    %eax,%edx
    537e:	c1 e2 03             	shl    $0x3,%edx
    5381:	01 c2                	add    %eax,%edx
    5383:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    538a:	89 c2                	mov    %eax,%edx
    538c:	89 d8                	mov    %ebx,%eax
    538e:	c1 e0 02             	shl    $0x2,%eax
    5391:	01 d8                	add    %ebx,%eax
    5393:	c1 e0 05             	shl    $0x5,%eax
    5396:	01 d0                	add    %edx,%eax
    5398:	01 f0                	add    %esi,%eax
    539a:	83 c0 2c             	add    $0x2c,%eax
    539d:	89 08                	mov    %ecx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    539f:	83 ec 0c             	sub    $0xc,%esp
    53a2:	ff 75 08             	pushl  0x8(%ebp)
    53a5:	e8 16 df ff ff       	call   32c0 <get1bit>
    53aa:	83 c4 10             	add    $0x10,%esp
    53ad:	89 c1                	mov    %eax,%ecx
    53af:	8b 75 0c             	mov    0xc(%ebp),%esi
    53b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    53b5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    53b8:	89 c2                	mov    %eax,%edx
    53ba:	c1 e2 03             	shl    $0x3,%edx
    53bd:	01 c2                	add    %eax,%edx
    53bf:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    53c6:	89 c2                	mov    %eax,%edx
    53c8:	89 d8                	mov    %ebx,%eax
    53ca:	c1 e0 02             	shl    $0x2,%eax
    53cd:	01 d8                	add    %ebx,%eax
    53cf:	c1 e0 05             	shl    $0x5,%eax
    53d2:	01 d0                	add    %edx,%eax
    53d4:	01 f0                	add    %esi,%eax
    53d6:	83 c0 30             	add    $0x30,%eax
    53d9:	89 08                	mov    %ecx,(%eax)
				for (i=0; i<2; i++)
    53db:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    53e2:	eb 43                	jmp    5427 <III_get_side_info+0x2f1>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    53e4:	83 ec 08             	sub    $0x8,%esp
    53e7:	6a 05                	push   $0x5
    53e9:	ff 75 08             	pushl  0x8(%ebp)
    53ec:	e8 ea df ff ff       	call   33db <getbits>
    53f1:	83 c4 10             	add    $0x10,%esp
    53f4:	89 c1                	mov    %eax,%ecx
    53f6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    53f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    53fc:	8b 75 f4             	mov    -0xc(%ebp),%esi
    53ff:	89 c2                	mov    %eax,%edx
    5401:	c1 e2 03             	shl    $0x3,%edx
    5404:	01 c2                	add    %eax,%edx
    5406:	8d 04 12             	lea    (%edx,%edx,1),%eax
    5409:	89 c2                	mov    %eax,%edx
    540b:	89 f0                	mov    %esi,%eax
    540d:	c1 e0 02             	shl    $0x2,%eax
    5410:	01 f0                	add    %esi,%eax
    5412:	c1 e0 03             	shl    $0x3,%eax
    5415:	01 c2                	add    %eax,%edx
    5417:	8b 45 ec             	mov    -0x14(%ebp),%eax
    541a:	01 d0                	add    %edx,%eax
    541c:	83 c0 08             	add    $0x8,%eax
    541f:	89 4c 83 14          	mov    %ecx,0x14(%ebx,%eax,4)
				for (i=0; i<2; i++)
    5423:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5427:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    542b:	7e b7                	jle    53e4 <III_get_side_info+0x2ae>
				for (i=0; i<3; i++)
    542d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5434:	eb 43                	jmp    5479 <III_get_side_info+0x343>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    5436:	83 ec 08             	sub    $0x8,%esp
    5439:	6a 03                	push   $0x3
    543b:	ff 75 08             	pushl  0x8(%ebp)
    543e:	e8 98 df ff ff       	call   33db <getbits>
    5443:	83 c4 10             	add    $0x10,%esp
    5446:	89 c1                	mov    %eax,%ecx
    5448:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    544b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    544e:	8b 75 f4             	mov    -0xc(%ebp),%esi
    5451:	89 c2                	mov    %eax,%edx
    5453:	c1 e2 03             	shl    $0x3,%edx
    5456:	01 c2                	add    %eax,%edx
    5458:	8d 04 12             	lea    (%edx,%edx,1),%eax
    545b:	89 c2                	mov    %eax,%edx
    545d:	89 f0                	mov    %esi,%eax
    545f:	c1 e0 02             	shl    $0x2,%eax
    5462:	01 f0                	add    %esi,%eax
    5464:	c1 e0 03             	shl    $0x3,%eax
    5467:	01 c2                	add    %eax,%edx
    5469:	8b 45 ec             	mov    -0x14(%ebp),%eax
    546c:	01 d0                	add    %edx,%eax
    546e:	83 c0 0c             	add    $0xc,%eax
    5471:	89 4c 83 10          	mov    %ecx,0x10(%ebx,%eax,4)
				for (i=0; i<3; i++)
    5475:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5479:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    547d:	7e b7                	jle    5436 <III_get_side_info+0x300>

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    547f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5482:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5485:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5488:	89 c2                	mov    %eax,%edx
    548a:	c1 e2 03             	shl    $0x3,%edx
    548d:	01 c2                	add    %eax,%edx
    548f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5496:	89 c2                	mov    %eax,%edx
    5498:	89 c8                	mov    %ecx,%eax
    549a:	c1 e0 02             	shl    $0x2,%eax
    549d:	01 c8                	add    %ecx,%eax
    549f:	c1 e0 05             	shl    $0x5,%eax
    54a2:	01 d0                	add    %edx,%eax
    54a4:	01 d8                	add    %ebx,%eax
    54a6:	83 c0 2c             	add    $0x2c,%eax
    54a9:	8b 00                	mov    (%eax),%eax
    54ab:	85 c0                	test   %eax,%eax
    54ad:	75 05                	jne    54b4 <III_get_side_info+0x37e>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    54af:	e8 07 cf ff ff       	call   23bb <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    54b4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    54b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54ba:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    54bd:	89 c2                	mov    %eax,%edx
    54bf:	c1 e2 03             	shl    $0x3,%edx
    54c2:	01 c2                	add    %eax,%edx
    54c4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    54cb:	89 c2                	mov    %eax,%edx
    54cd:	89 c8                	mov    %ecx,%eax
    54cf:	c1 e0 02             	shl    $0x2,%eax
    54d2:	01 c8                	add    %ecx,%eax
    54d4:	c1 e0 05             	shl    $0x5,%eax
    54d7:	01 d0                	add    %edx,%eax
    54d9:	01 d8                	add    %ebx,%eax
    54db:	83 c0 2c             	add    $0x2c,%eax
    54de:	8b 00                	mov    (%eax),%eax
    54e0:	83 f8 02             	cmp    $0x2,%eax
    54e3:	75 62                	jne    5547 <III_get_side_info+0x411>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    54e5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    54e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54eb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    54ee:	89 c2                	mov    %eax,%edx
    54f0:	c1 e2 03             	shl    $0x3,%edx
    54f3:	01 c2                	add    %eax,%edx
    54f5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    54fc:	89 c2                	mov    %eax,%edx
    54fe:	89 c8                	mov    %ecx,%eax
    5500:	c1 e0 02             	shl    $0x2,%eax
    5503:	01 c8                	add    %ecx,%eax
    5505:	c1 e0 05             	shl    $0x5,%eax
    5508:	01 d0                	add    %edx,%eax
    550a:	01 d8                	add    %ebx,%eax
    550c:	83 c0 30             	add    $0x30,%eax
    550f:	8b 00                	mov    (%eax),%eax
    5511:	85 c0                	test   %eax,%eax
    5513:	75 32                	jne    5547 <III_get_side_info+0x411>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    5515:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5518:	8b 45 f0             	mov    -0x10(%ebp),%eax
    551b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    551e:	89 c2                	mov    %eax,%edx
    5520:	c1 e2 03             	shl    $0x3,%edx
    5523:	01 c2                	add    %eax,%edx
    5525:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    552c:	89 c2                	mov    %eax,%edx
    552e:	89 c8                	mov    %ecx,%eax
    5530:	c1 e0 02             	shl    $0x2,%eax
    5533:	01 c8                	add    %ecx,%eax
    5535:	c1 e0 05             	shl    $0x5,%eax
    5538:	01 d0                	add    %edx,%eax
    553a:	01 d8                	add    %ebx,%eax
    553c:	83 c0 4c             	add    $0x4c,%eax
    553f:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    5545:	eb 30                	jmp    5577 <III_get_side_info+0x441>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    5547:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    554a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    554d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5550:	89 c2                	mov    %eax,%edx
    5552:	c1 e2 03             	shl    $0x3,%edx
    5555:	01 c2                	add    %eax,%edx
    5557:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    555e:	89 c2                	mov    %eax,%edx
    5560:	89 c8                	mov    %ecx,%eax
    5562:	c1 e0 02             	shl    $0x2,%eax
    5565:	01 c8                	add    %ecx,%eax
    5567:	c1 e0 05             	shl    $0x5,%eax
    556a:	01 d0                	add    %edx,%eax
    556c:	01 d8                	add    %ebx,%eax
    556e:	83 c0 4c             	add    $0x4c,%eax
    5571:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    5577:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    557a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    557d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5580:	89 c2                	mov    %eax,%edx
    5582:	c1 e2 03             	shl    $0x3,%edx
    5585:	01 c2                	add    %eax,%edx
    5587:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    558e:	89 c2                	mov    %eax,%edx
    5590:	89 c8                	mov    %ecx,%eax
    5592:	c1 e0 02             	shl    $0x2,%eax
    5595:	01 c8                	add    %ecx,%eax
    5597:	c1 e0 05             	shl    $0x5,%eax
    559a:	01 d0                	add    %edx,%eax
    559c:	01 d8                	add    %ebx,%eax
    559e:	83 c0 4c             	add    $0x4c,%eax
    55a1:	8b 00                	mov    (%eax),%eax
    55a3:	ba 14 00 00 00       	mov    $0x14,%edx
    55a8:	89 d3                	mov    %edx,%ebx
    55aa:	29 c3                	sub    %eax,%ebx
    55ac:	8b 75 0c             	mov    0xc(%ebp),%esi
    55af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55b2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    55b5:	89 c2                	mov    %eax,%edx
    55b7:	c1 e2 03             	shl    $0x3,%edx
    55ba:	01 c2                	add    %eax,%edx
    55bc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    55c3:	89 c2                	mov    %eax,%edx
    55c5:	89 c8                	mov    %ecx,%eax
    55c7:	c1 e0 02             	shl    $0x2,%eax
    55ca:	01 c8                	add    %ecx,%eax
    55cc:	c1 e0 05             	shl    $0x5,%eax
    55cf:	01 d0                	add    %edx,%eax
    55d1:	01 f0                	add    %esi,%eax
    55d3:	83 c0 50             	add    $0x50,%eax
    55d6:	89 18                	mov    %ebx,(%eax)
    55d8:	e9 fe 00 00 00       	jmp    56db <III_get_side_info+0x5a5>
			}
			else {
				for (i=0; i<3; i++)
    55dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    55e4:	eb 43                	jmp    5629 <III_get_side_info+0x4f3>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    55e6:	83 ec 08             	sub    $0x8,%esp
    55e9:	6a 05                	push   $0x5
    55eb:	ff 75 08             	pushl  0x8(%ebp)
    55ee:	e8 e8 dd ff ff       	call   33db <getbits>
    55f3:	83 c4 10             	add    $0x10,%esp
    55f6:	89 c1                	mov    %eax,%ecx
    55f8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    55fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55fe:	8b 75 f4             	mov    -0xc(%ebp),%esi
    5601:	89 c2                	mov    %eax,%edx
    5603:	c1 e2 03             	shl    $0x3,%edx
    5606:	01 c2                	add    %eax,%edx
    5608:	8d 04 12             	lea    (%edx,%edx,1),%eax
    560b:	89 c2                	mov    %eax,%edx
    560d:	89 f0                	mov    %esi,%eax
    560f:	c1 e0 02             	shl    $0x2,%eax
    5612:	01 f0                	add    %esi,%eax
    5614:	c1 e0 03             	shl    $0x3,%eax
    5617:	01 c2                	add    %eax,%edx
    5619:	8b 45 ec             	mov    -0x14(%ebp),%eax
    561c:	01 d0                	add    %edx,%eax
    561e:	83 c0 08             	add    $0x8,%eax
    5621:	89 4c 83 14          	mov    %ecx,0x14(%ebx,%eax,4)
				for (i=0; i<3; i++)
    5625:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5629:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    562d:	7e b7                	jle    55e6 <III_get_side_info+0x4b0>
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    562f:	83 ec 08             	sub    $0x8,%esp
    5632:	6a 04                	push   $0x4
    5634:	ff 75 08             	pushl  0x8(%ebp)
    5637:	e8 9f dd ff ff       	call   33db <getbits>
    563c:	83 c4 10             	add    $0x10,%esp
    563f:	89 c1                	mov    %eax,%ecx
    5641:	8b 75 0c             	mov    0xc(%ebp),%esi
    5644:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5647:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    564a:	89 c2                	mov    %eax,%edx
    564c:	c1 e2 03             	shl    $0x3,%edx
    564f:	01 c2                	add    %eax,%edx
    5651:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5658:	89 c2                	mov    %eax,%edx
    565a:	89 d8                	mov    %ebx,%eax
    565c:	c1 e0 02             	shl    $0x2,%eax
    565f:	01 d8                	add    %ebx,%eax
    5661:	c1 e0 05             	shl    $0x5,%eax
    5664:	01 d0                	add    %edx,%eax
    5666:	01 f0                	add    %esi,%eax
    5668:	83 c0 4c             	add    $0x4c,%eax
    566b:	89 08                	mov    %ecx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    566d:	83 ec 08             	sub    $0x8,%esp
    5670:	6a 03                	push   $0x3
    5672:	ff 75 08             	pushl  0x8(%ebp)
    5675:	e8 61 dd ff ff       	call   33db <getbits>
    567a:	83 c4 10             	add    $0x10,%esp
    567d:	89 c1                	mov    %eax,%ecx
    567f:	8b 75 0c             	mov    0xc(%ebp),%esi
    5682:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5685:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    5688:	89 c2                	mov    %eax,%edx
    568a:	c1 e2 03             	shl    $0x3,%edx
    568d:	01 c2                	add    %eax,%edx
    568f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5696:	89 c2                	mov    %eax,%edx
    5698:	89 d8                	mov    %ebx,%eax
    569a:	c1 e0 02             	shl    $0x2,%eax
    569d:	01 d8                	add    %ebx,%eax
    569f:	c1 e0 05             	shl    $0x5,%eax
    56a2:	01 d0                	add    %edx,%eax
    56a4:	01 f0                	add    %esi,%eax
    56a6:	83 c0 50             	add    $0x50,%eax
    56a9:	89 08                	mov    %ecx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    56ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    56ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    56b1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    56b4:	89 c2                	mov    %eax,%edx
    56b6:	c1 e2 03             	shl    $0x3,%edx
    56b9:	01 c2                	add    %eax,%edx
    56bb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    56c2:	89 c2                	mov    %eax,%edx
    56c4:	89 c8                	mov    %ecx,%eax
    56c6:	c1 e0 02             	shl    $0x2,%eax
    56c9:	01 c8                	add    %ecx,%eax
    56cb:	c1 e0 05             	shl    $0x5,%eax
    56ce:	01 d0                	add    %edx,%eax
    56d0:	01 d8                	add    %ebx,%eax
    56d2:	83 c0 2c             	add    $0x2c,%eax
    56d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    56db:	83 ec 0c             	sub    $0xc,%esp
    56de:	ff 75 08             	pushl  0x8(%ebp)
    56e1:	e8 da db ff ff       	call   32c0 <get1bit>
    56e6:	83 c4 10             	add    $0x10,%esp
    56e9:	89 c1                	mov    %eax,%ecx
    56eb:	8b 75 0c             	mov    0xc(%ebp),%esi
    56ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    56f1:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    56f4:	89 c2                	mov    %eax,%edx
    56f6:	c1 e2 03             	shl    $0x3,%edx
    56f9:	01 c2                	add    %eax,%edx
    56fb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5702:	89 c2                	mov    %eax,%edx
    5704:	89 d8                	mov    %ebx,%eax
    5706:	c1 e0 02             	shl    $0x2,%eax
    5709:	01 d8                	add    %ebx,%eax
    570b:	c1 e0 05             	shl    $0x5,%eax
    570e:	01 d0                	add    %edx,%eax
    5710:	01 f0                	add    %esi,%eax
    5712:	83 c0 54             	add    $0x54,%eax
    5715:	89 08                	mov    %ecx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    5717:	83 ec 0c             	sub    $0xc,%esp
    571a:	ff 75 08             	pushl  0x8(%ebp)
    571d:	e8 9e db ff ff       	call   32c0 <get1bit>
    5722:	83 c4 10             	add    $0x10,%esp
    5725:	89 c1                	mov    %eax,%ecx
    5727:	8b 75 0c             	mov    0xc(%ebp),%esi
    572a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    572d:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    5730:	89 c2                	mov    %eax,%edx
    5732:	c1 e2 03             	shl    $0x3,%edx
    5735:	01 c2                	add    %eax,%edx
    5737:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    573e:	89 c2                	mov    %eax,%edx
    5740:	89 d8                	mov    %ebx,%eax
    5742:	c1 e0 02             	shl    $0x2,%eax
    5745:	01 d8                	add    %ebx,%eax
    5747:	c1 e0 05             	shl    $0x5,%eax
    574a:	01 d0                	add    %edx,%eax
    574c:	01 f0                	add    %esi,%eax
    574e:	83 c0 58             	add    $0x58,%eax
    5751:	89 08                	mov    %ecx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    5753:	83 ec 0c             	sub    $0xc,%esp
    5756:	ff 75 08             	pushl  0x8(%ebp)
    5759:	e8 62 db ff ff       	call   32c0 <get1bit>
    575e:	83 c4 10             	add    $0x10,%esp
    5761:	89 c1                	mov    %eax,%ecx
    5763:	8b 75 0c             	mov    0xc(%ebp),%esi
    5766:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5769:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    576c:	89 c2                	mov    %eax,%edx
    576e:	c1 e2 03             	shl    $0x3,%edx
    5771:	01 c2                	add    %eax,%edx
    5773:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    577a:	89 c2                	mov    %eax,%edx
    577c:	89 d8                	mov    %ebx,%eax
    577e:	c1 e0 02             	shl    $0x2,%eax
    5781:	01 d8                	add    %ebx,%eax
    5783:	c1 e0 05             	shl    $0x5,%eax
    5786:	01 d0                	add    %edx,%eax
    5788:	01 f0                	add    %esi,%eax
    578a:	83 c0 5c             	add    $0x5c,%eax
    578d:	89 08                	mov    %ecx,(%eax)
		for (ch=0; ch<stereo; ch++) {
    578f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5793:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5796:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    5799:	0f 8c 5a fa ff ff    	jl     51f9 <III_get_side_info+0xc3>
	for (gr=0; gr<2; gr++) {
    579f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    57a3:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    57a7:	0f 8e 40 fa ff ff    	jle    51ed <III_get_side_info+0xb7>
         }
	}
}
    57ad:	90                   	nop
    57ae:	90                   	nop
    57af:	8d 65 f8             	lea    -0x8(%ebp),%esp
    57b2:	5b                   	pop    %ebx
    57b3:	5e                   	pop    %esi
    57b4:	5d                   	pop    %ebp
    57b5:	c3                   	ret    

000057b6 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    57b6:	55                   	push   %ebp
    57b7:	89 e5                	mov    %esp,%ebp
    57b9:	56                   	push   %esi
    57ba:	53                   	push   %ebx
    57bb:	83 ec 10             	sub    $0x10,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    57be:	8b 45 10             	mov    0x10(%ebp),%eax
    57c1:	89 c2                	mov    %eax,%edx
    57c3:	c1 e2 03             	shl    $0x3,%edx
    57c6:	01 c2                	add    %eax,%edx
    57c8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    57cf:	89 c2                	mov    %eax,%edx
    57d1:	8b 4d 14             	mov    0x14(%ebp),%ecx
    57d4:	89 c8                	mov    %ecx,%eax
    57d6:	c1 e0 02             	shl    $0x2,%eax
    57d9:	01 c8                	add    %ecx,%eax
    57db:	c1 e0 05             	shl    $0x5,%eax
    57de:	01 d0                	add    %edx,%eax
    57e0:	8d 50 10             	lea    0x10(%eax),%edx
    57e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    57e6:	01 d0                	add    %edx,%eax
    57e8:	83 c0 08             	add    $0x8,%eax
    57eb:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    57ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    57f1:	8b 40 10             	mov    0x10(%eax),%eax
    57f4:	85 c0                	test   %eax,%eax
    57f6:	0f 84 5b 02 00 00    	je     5a57 <III_get_scale_factors+0x2a1>
    57fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    57ff:	8b 40 14             	mov    0x14(%eax),%eax
    5802:	83 f8 02             	cmp    $0x2,%eax
    5805:	0f 85 4c 02 00 00    	jne    5a57 <III_get_scale_factors+0x2a1>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    580b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    580e:	8b 40 18             	mov    0x18(%eax),%eax
    5811:	85 c0                	test   %eax,%eax
    5813:	0f 84 56 01 00 00    	je     596f <III_get_scale_factors+0x1b9>
			for (sfb = 0; sfb < 8; sfb++)
    5819:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5820:	eb 30                	jmp    5852 <III_get_scale_factors+0x9c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    5822:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5825:	8b 40 0c             	mov    0xc(%eax),%eax
				(*scalefac)[ch].l[sfb] = hgetbits(
    5828:	8b 04 85 60 c5 00 00 	mov    0xc560(,%eax,4),%eax
    582f:	83 ec 0c             	sub    $0xc,%esp
    5832:	50                   	push   %eax
    5833:	e8 08 df ff ff       	call   3740 <hgetbits>
    5838:	83 c4 10             	add    $0x10,%esp
    583b:	89 c1                	mov    %eax,%ecx
    583d:	8b 45 08             	mov    0x8(%ebp),%eax
    5840:	8b 55 14             	mov    0x14(%ebp),%edx
    5843:	6b da 3e             	imul   $0x3e,%edx,%ebx
    5846:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5849:	01 da                	add    %ebx,%edx
    584b:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
			for (sfb = 0; sfb < 8; sfb++)
    584e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5852:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    5856:	7e ca                	jle    5822 <III_get_scale_factors+0x6c>
			for (sfb = 3; sfb < 6; sfb++)
    5858:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    585f:	eb 57                	jmp    58b8 <III_get_scale_factors+0x102>
				for (window=0; window<3; window++)
    5861:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5868:	eb 44                	jmp    58ae <III_get_scale_factors+0xf8>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    586a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    586d:	8b 40 0c             	mov    0xc(%eax),%eax
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    5870:	8b 04 85 60 c5 00 00 	mov    0xc560(,%eax,4),%eax
    5877:	83 ec 0c             	sub    $0xc,%esp
    587a:	50                   	push   %eax
    587b:	e8 c0 de ff ff       	call   3740 <hgetbits>
    5880:	83 c4 10             	add    $0x10,%esp
    5883:	89 c6                	mov    %eax,%esi
    5885:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5888:	8b 55 ec             	mov    -0x14(%ebp),%edx
    588b:	8b 5d 14             	mov    0x14(%ebp),%ebx
    588e:	89 d0                	mov    %edx,%eax
    5890:	01 c0                	add    %eax,%eax
    5892:	01 d0                	add    %edx,%eax
    5894:	c1 e0 02             	shl    $0x2,%eax
    5897:	01 d0                	add    %edx,%eax
    5899:	6b d3 3e             	imul   $0x3e,%ebx,%edx
    589c:	01 c2                	add    %eax,%edx
    589e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58a1:	01 d0                	add    %edx,%eax
    58a3:	83 c0 14             	add    $0x14,%eax
    58a6:	89 74 81 0c          	mov    %esi,0xc(%ecx,%eax,4)
				for (window=0; window<3; window++)
    58aa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    58ae:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    58b2:	7e b6                	jle    586a <III_get_scale_factors+0xb4>
			for (sfb = 3; sfb < 6; sfb++)
    58b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    58b8:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    58bc:	7e a3                	jle    5861 <III_get_scale_factors+0xab>
			for (sfb = 6; sfb < 12; sfb++)
    58be:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    58c5:	eb 5a                	jmp    5921 <III_get_scale_factors+0x16b>
				for (window=0; window<3; window++)
    58c7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    58ce:	eb 47                	jmp    5917 <III_get_scale_factors+0x161>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    58d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58d3:	8b 40 0c             	mov    0xc(%eax),%eax
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    58d6:	83 c0 10             	add    $0x10,%eax
    58d9:	8b 04 85 60 c5 00 00 	mov    0xc560(,%eax,4),%eax
    58e0:	83 ec 0c             	sub    $0xc,%esp
    58e3:	50                   	push   %eax
    58e4:	e8 57 de ff ff       	call   3740 <hgetbits>
    58e9:	83 c4 10             	add    $0x10,%esp
    58ec:	89 c6                	mov    %eax,%esi
    58ee:	8b 4d 08             	mov    0x8(%ebp),%ecx
    58f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    58f4:	8b 5d 14             	mov    0x14(%ebp),%ebx
    58f7:	89 d0                	mov    %edx,%eax
    58f9:	01 c0                	add    %eax,%eax
    58fb:	01 d0                	add    %edx,%eax
    58fd:	c1 e0 02             	shl    $0x2,%eax
    5900:	01 d0                	add    %edx,%eax
    5902:	6b d3 3e             	imul   $0x3e,%ebx,%edx
    5905:	01 c2                	add    %eax,%edx
    5907:	8b 45 f4             	mov    -0xc(%ebp),%eax
    590a:	01 d0                	add    %edx,%eax
    590c:	83 c0 14             	add    $0x14,%eax
    590f:	89 74 81 0c          	mov    %esi,0xc(%ecx,%eax,4)
				for (window=0; window<3; window++)
    5913:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5917:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    591b:	7e b3                	jle    58d0 <III_get_scale_factors+0x11a>
			for (sfb = 6; sfb < 12; sfb++)
    591d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5921:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    5925:	7e a0                	jle    58c7 <III_get_scale_factors+0x111>
			for (sfb=12,window=0; window<3; window++)
    5927:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    592e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5935:	eb 2d                	jmp    5964 <III_get_scale_factors+0x1ae>
				(*scalefac)[ch].s[window][sfb] = 0;
    5937:	8b 4d 08             	mov    0x8(%ebp),%ecx
    593a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    593d:	8b 5d 14             	mov    0x14(%ebp),%ebx
    5940:	89 d0                	mov    %edx,%eax
    5942:	01 c0                	add    %eax,%eax
    5944:	01 d0                	add    %edx,%eax
    5946:	c1 e0 02             	shl    $0x2,%eax
    5949:	01 d0                	add    %edx,%eax
    594b:	6b d3 3e             	imul   $0x3e,%ebx,%edx
    594e:	01 c2                	add    %eax,%edx
    5950:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5953:	01 d0                	add    %edx,%eax
    5955:	83 c0 14             	add    $0x14,%eax
    5958:	c7 44 81 0c 00 00 00 	movl   $0x0,0xc(%ecx,%eax,4)
    595f:	00 
			for (sfb=12,window=0; window<3; window++)
    5960:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5964:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5968:	7e cd                	jle    5937 <III_get_scale_factors+0x181>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    596a:	e9 9d 01 00 00       	jmp    5b0c <III_get_scale_factors+0x356>
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    596f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5976:	e9 8a 00 00 00       	jmp    5a05 <III_get_scale_factors+0x24f>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    597b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    597e:	83 c0 04             	add    $0x4,%eax
    5981:	8b 04 85 44 c5 00 00 	mov    0xc544(,%eax,4),%eax
    5988:	89 45 f4             	mov    %eax,-0xc(%ebp)
    598b:	eb 5f                	jmp    59ec <III_get_scale_factors+0x236>
					for (window=0; window<3; window++)
    598d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5994:	eb 4c                	jmp    59e2 <III_get_scale_factors+0x22c>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    5996:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5999:	8b 50 0c             	mov    0xc(%eax),%edx
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    599c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    599f:	c1 e0 04             	shl    $0x4,%eax
    59a2:	01 d0                	add    %edx,%eax
    59a4:	8b 04 85 60 c5 00 00 	mov    0xc560(,%eax,4),%eax
    59ab:	83 ec 0c             	sub    $0xc,%esp
    59ae:	50                   	push   %eax
    59af:	e8 8c dd ff ff       	call   3740 <hgetbits>
    59b4:	83 c4 10             	add    $0x10,%esp
    59b7:	89 c6                	mov    %eax,%esi
    59b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    59bc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    59bf:	8b 5d 14             	mov    0x14(%ebp),%ebx
    59c2:	89 d0                	mov    %edx,%eax
    59c4:	01 c0                	add    %eax,%eax
    59c6:	01 d0                	add    %edx,%eax
    59c8:	c1 e0 02             	shl    $0x2,%eax
    59cb:	01 d0                	add    %edx,%eax
    59cd:	6b d3 3e             	imul   $0x3e,%ebx,%edx
    59d0:	01 c2                	add    %eax,%edx
    59d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    59d5:	01 d0                	add    %edx,%eax
    59d7:	83 c0 14             	add    $0x14,%eax
    59da:	89 74 81 0c          	mov    %esi,0xc(%ecx,%eax,4)
					for (window=0; window<3; window++)
    59de:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    59e2:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    59e6:	7e ae                	jle    5996 <III_get_scale_factors+0x1e0>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    59e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    59ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    59ef:	83 c0 01             	add    $0x1,%eax
    59f2:	83 c0 04             	add    $0x4,%eax
    59f5:	8b 04 85 44 c5 00 00 	mov    0xc544(,%eax,4),%eax
    59fc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    59ff:	7c 8c                	jl     598d <III_get_scale_factors+0x1d7>
			for (i=0; i<2; i++)
    5a01:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5a05:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    5a09:	0f 8e 6c ff ff ff    	jle    597b <III_get_scale_factors+0x1c5>
				for (sfb=12,window=0; window<3; window++)
    5a0f:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    5a16:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5a1d:	eb 2d                	jmp    5a4c <III_get_scale_factors+0x296>
					(*scalefac)[ch].s[window][sfb] = 0;
    5a1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5a22:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a25:	8b 5d 14             	mov    0x14(%ebp),%ebx
    5a28:	89 d0                	mov    %edx,%eax
    5a2a:	01 c0                	add    %eax,%eax
    5a2c:	01 d0                	add    %edx,%eax
    5a2e:	c1 e0 02             	shl    $0x2,%eax
    5a31:	01 d0                	add    %edx,%eax
    5a33:	6b d3 3e             	imul   $0x3e,%ebx,%edx
    5a36:	01 c2                	add    %eax,%edx
    5a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a3b:	01 d0                	add    %edx,%eax
    5a3d:	83 c0 14             	add    $0x14,%eax
    5a40:	c7 44 81 0c 00 00 00 	movl   $0x0,0xc(%ecx,%eax,4)
    5a47:	00 
				for (sfb=12,window=0; window<3; window++)
    5a48:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5a4c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5a50:	7e cd                	jle    5a1f <III_get_scale_factors+0x269>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    5a52:	e9 b5 00 00 00       	jmp    5b0c <III_get_scale_factors+0x356>
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    5a57:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5a5e:	e9 87 00 00 00       	jmp    5aea <III_get_scale_factors+0x334>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    5a63:	8b 55 0c             	mov    0xc(%ebp),%edx
    5a66:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5a69:	89 c8                	mov    %ecx,%eax
    5a6b:	c1 e0 02             	shl    $0x2,%eax
    5a6e:	01 c8                	add    %ecx,%eax
    5a70:	c1 e0 03             	shl    $0x3,%eax
    5a73:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    5a76:	01 c8                	add    %ecx,%eax
    5a78:	8b 44 82 08          	mov    0x8(%edx,%eax,4),%eax
    5a7c:	85 c0                	test   %eax,%eax
    5a7e:	74 06                	je     5a86 <III_get_scale_factors+0x2d0>
    5a80:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    5a84:	75 60                	jne    5ae6 <III_get_scale_factors+0x330>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    5a86:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5a89:	8b 04 85 40 c5 00 00 	mov    0xc540(,%eax,4),%eax
    5a90:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5a93:	eb 3f                	jmp    5ad4 <III_get_scale_factors+0x31e>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    5a95:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    5a99:	0f 9f c0             	setg   %al
    5a9c:	0f b6 d0             	movzbl %al,%edx
    5a9f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5aa2:	8b 40 0c             	mov    0xc(%eax),%eax
					(*scalefac)[ch].l[sfb] = hgetbits(
    5aa5:	c1 e2 04             	shl    $0x4,%edx
    5aa8:	01 d0                	add    %edx,%eax
    5aaa:	8b 04 85 60 c5 00 00 	mov    0xc560(,%eax,4),%eax
    5ab1:	83 ec 0c             	sub    $0xc,%esp
    5ab4:	50                   	push   %eax
    5ab5:	e8 86 dc ff ff       	call   3740 <hgetbits>
    5aba:	83 c4 10             	add    $0x10,%esp
    5abd:	89 c1                	mov    %eax,%ecx
    5abf:	8b 45 08             	mov    0x8(%ebp),%eax
    5ac2:	8b 55 14             	mov    0x14(%ebp),%edx
    5ac5:	6b da 3e             	imul   $0x3e,%edx,%ebx
    5ac8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5acb:	01 da                	add    %ebx,%edx
    5acd:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    5ad0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ad7:	83 c0 01             	add    $0x1,%eax
    5ada:	8b 04 85 40 c5 00 00 	mov    0xc540(,%eax,4),%eax
    5ae1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5ae4:	7c af                	jl     5a95 <III_get_scale_factors+0x2df>
		for (i=0; i<4; i++) {
    5ae6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5aea:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    5aee:	0f 8e 6f ff ff ff    	jle    5a63 <III_get_scale_factors+0x2ad>
		}
		(*scalefac)[ch].l[22] = 0;
    5af4:	8b 55 08             	mov    0x8(%ebp),%edx
    5af7:	8b 45 14             	mov    0x14(%ebp),%eax
    5afa:	69 c0 f8 00 00 00    	imul   $0xf8,%eax,%eax
    5b00:	01 d0                	add    %edx,%eax
    5b02:	83 c0 58             	add    $0x58,%eax
    5b05:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    5b0b:	90                   	nop
    5b0c:	90                   	nop
    5b0d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    5b10:	5b                   	pop    %ebx
    5b11:	5e                   	pop    %esi
    5b12:	5d                   	pop    %ebp
    5b13:	c3                   	ret    

00005b14 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    5b14:	55                   	push   %ebp
    5b15:	89 e5                	mov    %esp,%ebp
    5b17:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    5b1a:	a1 00 d0 00 00       	mov    0xd000,%eax
    5b1f:	85 c0                	test   %eax,%eax
    5b21:	75 11                	jne    5b34 <initialize_huffman+0x20>
	read_decoder_table();
    5b23:	e8 77 dc ff ff       	call   379f <read_decoder_table>
	huffman_initialized = TRUE;
    5b28:	c7 05 00 d0 00 00 01 	movl   $0x1,0xd000
    5b2f:	00 00 00 
    5b32:	eb 01                	jmp    5b35 <initialize_huffman+0x21>
	if (huffman_initialized) return;
    5b34:	90                   	nop
}
    5b35:	c9                   	leave  
    5b36:	c3                   	ret    

00005b37 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    5b37:	55                   	push   %ebp
    5b38:	89 e5                	mov    %esp,%ebp
    5b3a:	57                   	push   %edi
    5b3b:	56                   	push   %esi
    5b3c:	53                   	push   %ebx
    5b3d:	83 ec 2c             	sub    $0x2c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    5b40:	e8 cf ff ff ff       	call   5b14 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    5b45:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5b48:	8b 45 14             	mov    0x14(%ebp),%eax
    5b4b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5b4e:	89 c2                	mov    %eax,%edx
    5b50:	c1 e2 03             	shl    $0x3,%edx
    5b53:	01 c2                	add    %eax,%edx
    5b55:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5b5c:	89 c2                	mov    %eax,%edx
    5b5e:	89 c8                	mov    %ecx,%eax
    5b60:	c1 e0 02             	shl    $0x2,%eax
    5b63:	01 c8                	add    %ecx,%eax
    5b65:	c1 e0 05             	shl    $0x5,%eax
    5b68:	01 d0                	add    %edx,%eax
    5b6a:	01 d8                	add    %ebx,%eax
    5b6c:	83 c0 28             	add    $0x28,%eax
    5b6f:	8b 00                	mov    (%eax),%eax
    5b71:	85 c0                	test   %eax,%eax
    5b73:	74 44                	je     5bb9 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    5b75:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5b78:	8b 45 14             	mov    0x14(%ebp),%eax
    5b7b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5b7e:	89 c2                	mov    %eax,%edx
    5b80:	c1 e2 03             	shl    $0x3,%edx
    5b83:	01 c2                	add    %eax,%edx
    5b85:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5b8c:	89 c2                	mov    %eax,%edx
    5b8e:	89 c8                	mov    %ecx,%eax
    5b90:	c1 e0 02             	shl    $0x2,%eax
    5b93:	01 c8                	add    %ecx,%eax
    5b95:	c1 e0 05             	shl    $0x5,%eax
    5b98:	01 d0                	add    %edx,%eax
    5b9a:	01 d8                	add    %ebx,%eax
    5b9c:	83 c0 2c             	add    $0x2c,%eax
    5b9f:	8b 00                	mov    (%eax),%eax
   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    5ba1:	83 f8 02             	cmp    $0x2,%eax
    5ba4:	75 13                	jne    5bb9 <III_hufman_decode+0x82>

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    5ba6:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    5bad:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    5bb4:	e9 cc 00 00 00       	jmp    5c85 <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5bb9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    5bbc:	8b 00                	mov    (%eax),%eax
    5bbe:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    5bc1:	8b 75 0c             	mov    0xc(%ebp),%esi
    5bc4:	8b 45 14             	mov    0x14(%ebp),%eax
    5bc7:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5bca:	89 c2                	mov    %eax,%edx
    5bcc:	c1 e2 03             	shl    $0x3,%edx
    5bcf:	01 c2                	add    %eax,%edx
    5bd1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5bd8:	89 c2                	mov    %eax,%edx
    5bda:	89 d8                	mov    %ebx,%eax
    5bdc:	c1 e0 02             	shl    $0x2,%eax
    5bdf:	01 d8                	add    %ebx,%eax
    5be1:	c1 e0 05             	shl    $0x5,%eax
    5be4:	01 d0                	add    %edx,%eax
    5be6:	01 f0                	add    %esi,%eax
    5be8:	83 c0 4c             	add    $0x4c,%eax
    5beb:	8b 00                	mov    (%eax),%eax
    5bed:	8d 50 01             	lea    0x1(%eax),%edx
      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5bf0:	89 c8                	mov    %ecx,%eax
    5bf2:	c1 e0 03             	shl    $0x3,%eax
    5bf5:	01 c8                	add    %ecx,%eax
    5bf7:	c1 e0 02             	shl    $0x2,%eax
    5bfa:	01 c8                	add    %ecx,%eax
    5bfc:	01 d0                	add    %edx,%eax
    5bfe:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    5c05:	89 45 dc             	mov    %eax,-0x24(%ebp)
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5c08:	8b 45 1c             	mov    0x1c(%ebp),%eax
    5c0b:	8b 00                	mov    (%eax),%eax
    5c0d:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    5c10:	8b 75 0c             	mov    0xc(%ebp),%esi
    5c13:	8b 45 14             	mov    0x14(%ebp),%eax
    5c16:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5c19:	89 c2                	mov    %eax,%edx
    5c1b:	c1 e2 03             	shl    $0x3,%edx
    5c1e:	01 c2                	add    %eax,%edx
    5c20:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5c27:	89 c2                	mov    %eax,%edx
    5c29:	89 d8                	mov    %ebx,%eax
    5c2b:	c1 e0 02             	shl    $0x2,%eax
    5c2e:	01 d8                	add    %ebx,%eax
    5c30:	c1 e0 05             	shl    $0x5,%eax
    5c33:	01 d0                	add    %edx,%eax
    5c35:	01 f0                	add    %esi,%eax
    5c37:	83 c0 4c             	add    $0x4c,%eax
    5c3a:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    5c3c:	8b 7d 0c             	mov    0xc(%ebp),%edi
    5c3f:	8b 45 14             	mov    0x14(%ebp),%eax
    5c42:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5c45:	89 c2                	mov    %eax,%edx
    5c47:	c1 e2 03             	shl    $0x3,%edx
    5c4a:	01 c2                	add    %eax,%edx
    5c4c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5c53:	89 c2                	mov    %eax,%edx
    5c55:	89 d8                	mov    %ebx,%eax
    5c57:	c1 e0 02             	shl    $0x2,%eax
    5c5a:	01 d8                	add    %ebx,%eax
    5c5c:	c1 e0 05             	shl    $0x5,%eax
    5c5f:	01 d0                	add    %edx,%eax
    5c61:	01 f8                	add    %edi,%eax
    5c63:	83 c0 50             	add    $0x50,%eax
    5c66:	8b 00                	mov    (%eax),%eax
                              .l[(*si).ch[ch].gr[gr].region0_count +
    5c68:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    5c6a:	8d 50 02             	lea    0x2(%eax),%edx
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5c6d:	89 c8                	mov    %ecx,%eax
    5c6f:	c1 e0 03             	shl    $0x3,%eax
    5c72:	01 c8                	add    %ecx,%eax
    5c74:	c1 e0 02             	shl    $0x2,%eax
    5c77:	01 c8                	add    %ecx,%eax
    5c79:	01 d0                	add    %edx,%eax
    5c7b:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    5c82:	89 45 d8             	mov    %eax,-0x28(%ebp)
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    5c85:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5c8c:	e9 ab 01 00 00       	jmp    5e3c <III_hufman_decode+0x305>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    5c91:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c94:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    5c97:	7d 43                	jge    5cdc <III_hufman_decode+0x1a5>
    5c99:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5c9c:	8b 45 14             	mov    0x14(%ebp),%eax
    5c9f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5ca2:	89 c2                	mov    %eax,%edx
    5ca4:	c1 e2 03             	shl    $0x3,%edx
    5ca7:	01 c2                	add    %eax,%edx
    5ca9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5cb0:	89 c2                	mov    %eax,%edx
    5cb2:	89 c8                	mov    %ecx,%eax
    5cb4:	c1 e0 02             	shl    $0x2,%eax
    5cb7:	01 c8                	add    %ecx,%eax
    5cb9:	c1 e0 05             	shl    $0x5,%eax
    5cbc:	01 d0                	add    %edx,%eax
    5cbe:	01 d8                	add    %ebx,%eax
    5cc0:	83 c0 34             	add    $0x34,%eax
    5cc3:	8b 10                	mov    (%eax),%edx
    5cc5:	89 d0                	mov    %edx,%eax
    5cc7:	c1 e0 02             	shl    $0x2,%eax
    5cca:	01 d0                	add    %edx,%eax
    5ccc:	c1 e0 03             	shl    $0x3,%eax
    5ccf:	05 a0 ca 00 00       	add    $0xcaa0,%eax
    5cd4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5cd7:	e9 86 00 00 00       	jmp    5d62 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    5cdc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5cdf:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5ce2:	7d 40                	jge    5d24 <III_hufman_decode+0x1ed>
    5ce4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5ce7:	8b 45 14             	mov    0x14(%ebp),%eax
    5cea:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5ced:	89 c2                	mov    %eax,%edx
    5cef:	c1 e2 03             	shl    $0x3,%edx
    5cf2:	01 c2                	add    %eax,%edx
    5cf4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5cfb:	89 c2                	mov    %eax,%edx
    5cfd:	89 c8                	mov    %ecx,%eax
    5cff:	c1 e0 02             	shl    $0x2,%eax
    5d02:	01 c8                	add    %ecx,%eax
    5d04:	c1 e0 05             	shl    $0x5,%eax
    5d07:	01 d0                	add    %edx,%eax
    5d09:	01 d8                	add    %ebx,%eax
    5d0b:	83 c0 38             	add    $0x38,%eax
    5d0e:	8b 10                	mov    (%eax),%edx
    5d10:	89 d0                	mov    %edx,%eax
    5d12:	c1 e0 02             	shl    $0x2,%eax
    5d15:	01 d0                	add    %edx,%eax
    5d17:	c1 e0 03             	shl    $0x3,%eax
    5d1a:	05 a0 ca 00 00       	add    $0xcaa0,%eax
    5d1f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5d22:	eb 3e                	jmp    5d62 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    5d24:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5d27:	8b 45 14             	mov    0x14(%ebp),%eax
    5d2a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5d2d:	89 c2                	mov    %eax,%edx
    5d2f:	c1 e2 03             	shl    $0x3,%edx
    5d32:	01 c2                	add    %eax,%edx
    5d34:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5d3b:	89 c2                	mov    %eax,%edx
    5d3d:	89 c8                	mov    %ecx,%eax
    5d3f:	c1 e0 02             	shl    $0x2,%eax
    5d42:	01 c8                	add    %ecx,%eax
    5d44:	c1 e0 05             	shl    $0x5,%eax
    5d47:	01 d0                	add    %edx,%eax
    5d49:	01 d8                	add    %ebx,%eax
    5d4b:	83 c0 3c             	add    $0x3c,%eax
    5d4e:	8b 10                	mov    (%eax),%edx
    5d50:	89 d0                	mov    %edx,%eax
    5d52:	c1 e0 02             	shl    $0x2,%eax
    5d55:	01 d0                	add    %edx,%eax
    5d57:	c1 e0 03             	shl    $0x3,%eax
    5d5a:	05 a0 ca 00 00       	add    $0xcaa0,%eax
    5d5f:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    5d62:	83 ec 0c             	sub    $0xc,%esp
    5d65:	8d 45 c8             	lea    -0x38(%ebp),%eax
    5d68:	50                   	push   %eax
    5d69:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5d6c:	50                   	push   %eax
    5d6d:	8d 45 d0             	lea    -0x30(%ebp),%eax
    5d70:	50                   	push   %eax
    5d71:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    5d74:	50                   	push   %eax
    5d75:	ff 75 e0             	pushl  -0x20(%ebp)
    5d78:	e8 3a ef ff ff       	call   4cb7 <huffman_decoder>
    5d7d:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = x;
    5d80:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5d83:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5d88:	89 c8                	mov    %ecx,%eax
    5d8a:	f7 ea                	imul   %edx
    5d8c:	89 d0                	mov    %edx,%eax
    5d8e:	c1 f8 02             	sar    $0x2,%eax
    5d91:	c1 f9 1f             	sar    $0x1f,%ecx
    5d94:	89 ca                	mov    %ecx,%edx
    5d96:	29 d0                	sub    %edx,%eax
    5d98:	89 c2                	mov    %eax,%edx
    5d9a:	89 d0                	mov    %edx,%eax
    5d9c:	c1 e0 03             	shl    $0x3,%eax
    5d9f:	01 d0                	add    %edx,%eax
    5da1:	c1 e0 03             	shl    $0x3,%eax
    5da4:	89 c2                	mov    %eax,%edx
    5da6:	8b 45 08             	mov    0x8(%ebp),%eax
    5da9:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    5dac:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5daf:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5db4:	89 c8                	mov    %ecx,%eax
    5db6:	f7 ea                	imul   %edx
    5db8:	89 d0                	mov    %edx,%eax
    5dba:	c1 f8 02             	sar    $0x2,%eax
    5dbd:	89 ce                	mov    %ecx,%esi
    5dbf:	c1 fe 1f             	sar    $0x1f,%esi
    5dc2:	29 f0                	sub    %esi,%eax
    5dc4:	89 c2                	mov    %eax,%edx
    5dc6:	89 d0                	mov    %edx,%eax
    5dc8:	c1 e0 03             	shl    $0x3,%eax
    5dcb:	01 d0                	add    %edx,%eax
    5dcd:	01 c0                	add    %eax,%eax
    5dcf:	29 c1                	sub    %eax,%ecx
    5dd1:	89 ca                	mov    %ecx,%edx
    5dd3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5dd6:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    5dd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5ddc:	8d 48 01             	lea    0x1(%eax),%ecx
    5ddf:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5de4:	89 c8                	mov    %ecx,%eax
    5de6:	f7 ea                	imul   %edx
    5de8:	89 d0                	mov    %edx,%eax
    5dea:	c1 f8 02             	sar    $0x2,%eax
    5ded:	c1 f9 1f             	sar    $0x1f,%ecx
    5df0:	89 ca                	mov    %ecx,%edx
    5df2:	29 d0                	sub    %edx,%eax
    5df4:	89 c2                	mov    %eax,%edx
    5df6:	89 d0                	mov    %edx,%eax
    5df8:	c1 e0 03             	shl    $0x3,%eax
    5dfb:	01 d0                	add    %edx,%eax
    5dfd:	c1 e0 03             	shl    $0x3,%eax
    5e00:	89 c2                	mov    %eax,%edx
    5e02:	8b 45 08             	mov    0x8(%ebp),%eax
    5e05:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    5e08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e0b:	8d 48 01             	lea    0x1(%eax),%ecx
    5e0e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5e13:	89 c8                	mov    %ecx,%eax
    5e15:	f7 ea                	imul   %edx
    5e17:	89 d0                	mov    %edx,%eax
    5e19:	c1 f8 02             	sar    $0x2,%eax
    5e1c:	89 ce                	mov    %ecx,%esi
    5e1e:	c1 fe 1f             	sar    $0x1f,%esi
    5e21:	29 f0                	sub    %esi,%eax
    5e23:	89 c2                	mov    %eax,%edx
    5e25:	89 d0                	mov    %edx,%eax
    5e27:	c1 e0 03             	shl    $0x3,%eax
    5e2a:	01 d0                	add    %edx,%eax
    5e2c:	01 c0                	add    %eax,%eax
    5e2e:	29 c1                	sub    %eax,%ecx
    5e30:	89 ca                	mov    %ecx,%edx
    5e32:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5e35:	89 04 93             	mov    %eax,(%ebx,%edx,4)
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    5e38:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    5e3c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e3f:	8b 45 14             	mov    0x14(%ebp),%eax
    5e42:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5e45:	89 c2                	mov    %eax,%edx
    5e47:	c1 e2 03             	shl    $0x3,%edx
    5e4a:	01 c2                	add    %eax,%edx
    5e4c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e53:	89 c2                	mov    %eax,%edx
    5e55:	89 c8                	mov    %ecx,%eax
    5e57:	c1 e0 02             	shl    $0x2,%eax
    5e5a:	01 c8                	add    %ecx,%eax
    5e5c:	c1 e0 05             	shl    $0x5,%eax
    5e5f:	01 d0                	add    %edx,%eax
    5e61:	01 d8                	add    %ebx,%eax
    5e63:	83 c0 1c             	add    $0x1c,%eax
    5e66:	8b 00                	mov    (%eax),%eax
    5e68:	8d 14 00             	lea    (%eax,%eax,1),%edx
    5e6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e6e:	39 c2                	cmp    %eax,%edx
    5e70:	0f 87 1b fe ff ff    	ja     5c91 <III_hufman_decode+0x15a>
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    5e76:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e79:	8b 45 14             	mov    0x14(%ebp),%eax
    5e7c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5e7f:	89 c2                	mov    %eax,%edx
    5e81:	c1 e2 03             	shl    $0x3,%edx
    5e84:	01 c2                	add    %eax,%edx
    5e86:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e8d:	89 c2                	mov    %eax,%edx
    5e8f:	89 c8                	mov    %ecx,%eax
    5e91:	c1 e0 02             	shl    $0x2,%eax
    5e94:	01 c8                	add    %ecx,%eax
    5e96:	c1 e0 05             	shl    $0x5,%eax
    5e99:	01 d0                	add    %edx,%eax
    5e9b:	01 d8                	add    %ebx,%eax
    5e9d:	83 c0 5c             	add    $0x5c,%eax
    5ea0:	8b 00                	mov    (%eax),%eax
    5ea2:	8d 50 20             	lea    0x20(%eax),%edx
    5ea5:	89 d0                	mov    %edx,%eax
    5ea7:	c1 e0 02             	shl    $0x2,%eax
    5eaa:	01 d0                	add    %edx,%eax
    5eac:	c1 e0 03             	shl    $0x3,%eax
    5eaf:	05 a0 ca 00 00       	add    $0xcaa0,%eax
    5eb4:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    5eb7:	e9 98 01 00 00       	jmp    6054 <III_hufman_decode+0x51d>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    5ebc:	83 ec 0c             	sub    $0xc,%esp
    5ebf:	8d 45 c8             	lea    -0x38(%ebp),%eax
    5ec2:	50                   	push   %eax
    5ec3:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5ec6:	50                   	push   %eax
    5ec7:	8d 45 d0             	lea    -0x30(%ebp),%eax
    5eca:	50                   	push   %eax
    5ecb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    5ece:	50                   	push   %eax
    5ecf:	ff 75 e0             	pushl  -0x20(%ebp)
    5ed2:	e8 e0 ed ff ff       	call   4cb7 <huffman_decoder>
    5ed7:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = v;
    5eda:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5edd:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5ee2:	89 c8                	mov    %ecx,%eax
    5ee4:	f7 ea                	imul   %edx
    5ee6:	89 d0                	mov    %edx,%eax
    5ee8:	c1 f8 02             	sar    $0x2,%eax
    5eeb:	c1 f9 1f             	sar    $0x1f,%ecx
    5eee:	89 ca                	mov    %ecx,%edx
    5ef0:	29 d0                	sub    %edx,%eax
    5ef2:	89 c2                	mov    %eax,%edx
    5ef4:	89 d0                	mov    %edx,%eax
    5ef6:	c1 e0 03             	shl    $0x3,%eax
    5ef9:	01 d0                	add    %edx,%eax
    5efb:	c1 e0 03             	shl    $0x3,%eax
    5efe:	89 c2                	mov    %eax,%edx
    5f00:	8b 45 08             	mov    0x8(%ebp),%eax
    5f03:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    5f06:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5f09:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5f0e:	89 c8                	mov    %ecx,%eax
    5f10:	f7 ea                	imul   %edx
    5f12:	89 d0                	mov    %edx,%eax
    5f14:	c1 f8 02             	sar    $0x2,%eax
    5f17:	89 ce                	mov    %ecx,%esi
    5f19:	c1 fe 1f             	sar    $0x1f,%esi
    5f1c:	29 f0                	sub    %esi,%eax
    5f1e:	89 c2                	mov    %eax,%edx
    5f20:	89 d0                	mov    %edx,%eax
    5f22:	c1 e0 03             	shl    $0x3,%eax
    5f25:	01 d0                	add    %edx,%eax
    5f27:	01 c0                	add    %eax,%eax
    5f29:	29 c1                	sub    %eax,%ecx
    5f2b:	89 ca                	mov    %ecx,%edx
    5f2d:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5f30:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    5f33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5f36:	8d 48 01             	lea    0x1(%eax),%ecx
    5f39:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5f3e:	89 c8                	mov    %ecx,%eax
    5f40:	f7 ea                	imul   %edx
    5f42:	89 d0                	mov    %edx,%eax
    5f44:	c1 f8 02             	sar    $0x2,%eax
    5f47:	c1 f9 1f             	sar    $0x1f,%ecx
    5f4a:	89 ca                	mov    %ecx,%edx
    5f4c:	29 d0                	sub    %edx,%eax
    5f4e:	89 c2                	mov    %eax,%edx
    5f50:	89 d0                	mov    %edx,%eax
    5f52:	c1 e0 03             	shl    $0x3,%eax
    5f55:	01 d0                	add    %edx,%eax
    5f57:	c1 e0 03             	shl    $0x3,%eax
    5f5a:	89 c2                	mov    %eax,%edx
    5f5c:	8b 45 08             	mov    0x8(%ebp),%eax
    5f5f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    5f62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5f65:	8d 48 01             	lea    0x1(%eax),%ecx
    5f68:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5f6d:	89 c8                	mov    %ecx,%eax
    5f6f:	f7 ea                	imul   %edx
    5f71:	89 d0                	mov    %edx,%eax
    5f73:	c1 f8 02             	sar    $0x2,%eax
    5f76:	89 ce                	mov    %ecx,%esi
    5f78:	c1 fe 1f             	sar    $0x1f,%esi
    5f7b:	29 f0                	sub    %esi,%eax
    5f7d:	89 c2                	mov    %eax,%edx
    5f7f:	89 d0                	mov    %edx,%eax
    5f81:	c1 e0 03             	shl    $0x3,%eax
    5f84:	01 d0                	add    %edx,%eax
    5f86:	01 c0                	add    %eax,%eax
    5f88:	29 c1                	sub    %eax,%ecx
    5f8a:	89 ca                	mov    %ecx,%edx
    5f8c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5f8f:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    5f92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5f95:	8d 48 02             	lea    0x2(%eax),%ecx
    5f98:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5f9d:	89 c8                	mov    %ecx,%eax
    5f9f:	f7 ea                	imul   %edx
    5fa1:	89 d0                	mov    %edx,%eax
    5fa3:	c1 f8 02             	sar    $0x2,%eax
    5fa6:	c1 f9 1f             	sar    $0x1f,%ecx
    5fa9:	89 ca                	mov    %ecx,%edx
    5fab:	29 d0                	sub    %edx,%eax
    5fad:	89 c2                	mov    %eax,%edx
    5faf:	89 d0                	mov    %edx,%eax
    5fb1:	c1 e0 03             	shl    $0x3,%eax
    5fb4:	01 d0                	add    %edx,%eax
    5fb6:	c1 e0 03             	shl    $0x3,%eax
    5fb9:	89 c2                	mov    %eax,%edx
    5fbb:	8b 45 08             	mov    0x8(%ebp),%eax
    5fbe:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    5fc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5fc4:	8d 48 02             	lea    0x2(%eax),%ecx
    5fc7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5fcc:	89 c8                	mov    %ecx,%eax
    5fce:	f7 ea                	imul   %edx
    5fd0:	89 d0                	mov    %edx,%eax
    5fd2:	c1 f8 02             	sar    $0x2,%eax
    5fd5:	89 ce                	mov    %ecx,%esi
    5fd7:	c1 fe 1f             	sar    $0x1f,%esi
    5fda:	29 f0                	sub    %esi,%eax
    5fdc:	89 c2                	mov    %eax,%edx
    5fde:	89 d0                	mov    %edx,%eax
    5fe0:	c1 e0 03             	shl    $0x3,%eax
    5fe3:	01 d0                	add    %edx,%eax
    5fe5:	01 c0                	add    %eax,%eax
    5fe7:	29 c1                	sub    %eax,%ecx
    5fe9:	89 ca                	mov    %ecx,%edx
    5feb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5fee:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    5ff1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5ff4:	8d 48 03             	lea    0x3(%eax),%ecx
    5ff7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5ffc:	89 c8                	mov    %ecx,%eax
    5ffe:	f7 ea                	imul   %edx
    6000:	89 d0                	mov    %edx,%eax
    6002:	c1 f8 02             	sar    $0x2,%eax
    6005:	c1 f9 1f             	sar    $0x1f,%ecx
    6008:	89 ca                	mov    %ecx,%edx
    600a:	29 d0                	sub    %edx,%eax
    600c:	89 c2                	mov    %eax,%edx
    600e:	89 d0                	mov    %edx,%eax
    6010:	c1 e0 03             	shl    $0x3,%eax
    6013:	01 d0                	add    %edx,%eax
    6015:	c1 e0 03             	shl    $0x3,%eax
    6018:	89 c2                	mov    %eax,%edx
    601a:	8b 45 08             	mov    0x8(%ebp),%eax
    601d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6020:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6023:	8d 48 03             	lea    0x3(%eax),%ecx
    6026:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    602b:	89 c8                	mov    %ecx,%eax
    602d:	f7 ea                	imul   %edx
    602f:	89 d0                	mov    %edx,%eax
    6031:	c1 f8 02             	sar    $0x2,%eax
    6034:	89 ce                	mov    %ecx,%esi
    6036:	c1 fe 1f             	sar    $0x1f,%esi
    6039:	29 f0                	sub    %esi,%eax
    603b:	89 c2                	mov    %eax,%edx
    603d:	89 d0                	mov    %edx,%eax
    603f:	c1 e0 03             	shl    $0x3,%eax
    6042:	01 d0                	add    %edx,%eax
    6044:	01 c0                	add    %eax,%eax
    6046:	29 c1                	sub    %eax,%ecx
    6048:	89 ca                	mov    %ecx,%edx
    604a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    604d:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    6050:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    6054:	e8 d0 d6 ff ff       	call   3729 <hsstell>
    6059:	89 c1                	mov    %eax,%ecx
    605b:	8b 75 0c             	mov    0xc(%ebp),%esi
    605e:	8b 45 14             	mov    0x14(%ebp),%eax
    6061:	8b 5d 10             	mov    0x10(%ebp),%ebx
    6064:	89 c2                	mov    %eax,%edx
    6066:	c1 e2 03             	shl    $0x3,%edx
    6069:	01 c2                	add    %eax,%edx
    606b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6072:	89 c2                	mov    %eax,%edx
    6074:	89 d8                	mov    %ebx,%eax
    6076:	c1 e0 02             	shl    $0x2,%eax
    6079:	01 d8                	add    %ebx,%eax
    607b:	c1 e0 05             	shl    $0x5,%eax
    607e:	01 d0                	add    %edx,%eax
    6080:	01 f0                	add    %esi,%eax
    6082:	83 c0 18             	add    $0x18,%eax
    6085:	8b 10                	mov    (%eax),%edx
    6087:	8b 45 18             	mov    0x18(%ebp),%eax
    608a:	01 d0                	add    %edx,%eax
    608c:	39 c1                	cmp    %eax,%ecx
    608e:	73 0d                	jae    609d <III_hufman_decode+0x566>
    6090:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    6097:	0f 8e 1f fe ff ff    	jle    5ebc <III_hufman_decode+0x385>
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    609d:	e8 87 d6 ff ff       	call   3729 <hsstell>
    60a2:	89 c1                	mov    %eax,%ecx
    60a4:	8b 75 0c             	mov    0xc(%ebp),%esi
    60a7:	8b 45 14             	mov    0x14(%ebp),%eax
    60aa:	8b 5d 10             	mov    0x10(%ebp),%ebx
    60ad:	89 c2                	mov    %eax,%edx
    60af:	c1 e2 03             	shl    $0x3,%edx
    60b2:	01 c2                	add    %eax,%edx
    60b4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    60bb:	89 c2                	mov    %eax,%edx
    60bd:	89 d8                	mov    %ebx,%eax
    60bf:	c1 e0 02             	shl    $0x2,%eax
    60c2:	01 d8                	add    %ebx,%eax
    60c4:	c1 e0 05             	shl    $0x5,%eax
    60c7:	01 d0                	add    %edx,%eax
    60c9:	01 f0                	add    %esi,%eax
    60cb:	83 c0 18             	add    $0x18,%eax
    60ce:	8b 10                	mov    (%eax),%edx
    60d0:	8b 45 18             	mov    0x18(%ebp),%eax
    60d3:	01 d0                	add    %edx,%eax
    60d5:	39 c1                	cmp    %eax,%ecx
    60d7:	76 4c                	jbe    6125 <III_hufman_decode+0x5ee>
   {  i -=4;
    60d9:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    60dd:	e8 47 d6 ff ff       	call   3729 <hsstell>
    60e2:	8b 55 18             	mov    0x18(%ebp),%edx
    60e5:	29 d0                	sub    %edx,%eax
    60e7:	89 c3                	mov    %eax,%ebx
    60e9:	8b 75 0c             	mov    0xc(%ebp),%esi
    60ec:	8b 45 14             	mov    0x14(%ebp),%eax
    60ef:	8b 4d 10             	mov    0x10(%ebp),%ecx
    60f2:	89 c2                	mov    %eax,%edx
    60f4:	c1 e2 03             	shl    $0x3,%edx
    60f7:	01 c2                	add    %eax,%edx
    60f9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6100:	89 c2                	mov    %eax,%edx
    6102:	89 c8                	mov    %ecx,%eax
    6104:	c1 e0 02             	shl    $0x2,%eax
    6107:	01 c8                	add    %ecx,%eax
    6109:	c1 e0 05             	shl    $0x5,%eax
    610c:	01 d0                	add    %edx,%eax
    610e:	01 f0                	add    %esi,%eax
    6110:	83 c0 18             	add    $0x18,%eax
    6113:	8b 10                	mov    (%eax),%edx
    6115:	89 d8                	mov    %ebx,%eax
    6117:	29 d0                	sub    %edx,%eax
    6119:	83 ec 0c             	sub    $0xc,%esp
    611c:	50                   	push   %eax
    611d:	e8 4b d6 ff ff       	call   376d <rewindNbits>
    6122:	83 c4 10             	add    $0x10,%esp
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    6125:	e8 ff d5 ff ff       	call   3729 <hsstell>
    612a:	89 c1                	mov    %eax,%ecx
    612c:	8b 75 0c             	mov    0xc(%ebp),%esi
    612f:	8b 45 14             	mov    0x14(%ebp),%eax
    6132:	8b 5d 10             	mov    0x10(%ebp),%ebx
    6135:	89 c2                	mov    %eax,%edx
    6137:	c1 e2 03             	shl    $0x3,%edx
    613a:	01 c2                	add    %eax,%edx
    613c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6143:	89 c2                	mov    %eax,%edx
    6145:	89 d8                	mov    %ebx,%eax
    6147:	c1 e0 02             	shl    $0x2,%eax
    614a:	01 d8                	add    %ebx,%eax
    614c:	c1 e0 05             	shl    $0x5,%eax
    614f:	01 d0                	add    %edx,%eax
    6151:	01 f0                	add    %esi,%eax
    6153:	83 c0 18             	add    $0x18,%eax
    6156:	8b 10                	mov    (%eax),%edx
    6158:	8b 45 18             	mov    0x18(%ebp),%eax
    615b:	01 d0                	add    %edx,%eax
    615d:	39 c1                	cmp    %eax,%ecx
    615f:	0f 83 a9 00 00 00    	jae    620e <III_hufman_decode+0x6d7>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    6165:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6168:	8b 45 14             	mov    0x14(%ebp),%eax
    616b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    616e:	89 c2                	mov    %eax,%edx
    6170:	c1 e2 03             	shl    $0x3,%edx
    6173:	01 c2                	add    %eax,%edx
    6175:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    617c:	89 c2                	mov    %eax,%edx
    617e:	89 c8                	mov    %ecx,%eax
    6180:	c1 e0 02             	shl    $0x2,%eax
    6183:	01 c8                	add    %ecx,%eax
    6185:	c1 e0 05             	shl    $0x5,%eax
    6188:	01 d0                	add    %edx,%eax
    618a:	01 d8                	add    %ebx,%eax
    618c:	83 c0 18             	add    $0x18,%eax
    618f:	8b 10                	mov    (%eax),%edx
    6191:	8b 45 18             	mov    0x18(%ebp),%eax
    6194:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6197:	e8 8d d5 ff ff       	call   3729 <hsstell>
    619c:	89 c2                	mov    %eax,%edx
    619e:	89 d8                	mov    %ebx,%eax
    61a0:	29 d0                	sub    %edx,%eax
    61a2:	83 ec 0c             	sub    $0xc,%esp
    61a5:	50                   	push   %eax
    61a6:	e8 95 d5 ff ff       	call   3740 <hgetbits>
    61ab:	83 c4 10             	add    $0x10,%esp

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    61ae:	eb 5e                	jmp    620e <III_hufman_decode+0x6d7>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    61b0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    61b3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    61b8:	89 c8                	mov    %ecx,%eax
    61ba:	f7 ea                	imul   %edx
    61bc:	89 d0                	mov    %edx,%eax
    61be:	c1 f8 02             	sar    $0x2,%eax
    61c1:	c1 f9 1f             	sar    $0x1f,%ecx
    61c4:	89 ca                	mov    %ecx,%edx
    61c6:	29 d0                	sub    %edx,%eax
    61c8:	89 c2                	mov    %eax,%edx
    61ca:	89 d0                	mov    %edx,%eax
    61cc:	c1 e0 03             	shl    $0x3,%eax
    61cf:	01 d0                	add    %edx,%eax
    61d1:	c1 e0 03             	shl    $0x3,%eax
    61d4:	89 c2                	mov    %eax,%edx
    61d6:	8b 45 08             	mov    0x8(%ebp),%eax
    61d9:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    61dc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    61df:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    61e4:	89 c8                	mov    %ecx,%eax
    61e6:	f7 ea                	imul   %edx
    61e8:	89 d0                	mov    %edx,%eax
    61ea:	c1 f8 02             	sar    $0x2,%eax
    61ed:	89 ce                	mov    %ecx,%esi
    61ef:	c1 fe 1f             	sar    $0x1f,%esi
    61f2:	29 f0                	sub    %esi,%eax
    61f4:	89 c2                	mov    %eax,%edx
    61f6:	89 d0                	mov    %edx,%eax
    61f8:	c1 e0 03             	shl    $0x3,%eax
    61fb:	01 d0                	add    %edx,%eax
    61fd:	01 c0                	add    %eax,%eax
    61ff:	29 c1                	sub    %eax,%ecx
    6201:	89 ca                	mov    %ecx,%edx
    6203:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   for (; i<SSLIMIT*SBLIMIT; i++)
    620a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    620e:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    6215:	7e 99                	jle    61b0 <III_hufman_decode+0x679>
}
    6217:	90                   	nop
    6218:	90                   	nop
    6219:	8d 65 f4             	lea    -0xc(%ebp),%esp
    621c:	5b                   	pop    %ebx
    621d:	5e                   	pop    %esi
    621e:	5f                   	pop    %edi
    621f:	5d                   	pop    %ebp
    6220:	c3                   	ret    

00006221 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    6221:	55                   	push   %ebp
    6222:	89 e5                	mov    %esp,%ebp
    6224:	53                   	push   %ebx
    6225:	83 ec 34             	sub    $0x34,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    6228:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    622f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    6232:	8b 00                	mov    (%eax),%eax
    6234:	8b 40 10             	mov    0x10(%eax),%eax
    6237:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    623a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    6241:	8b 45 14             	mov    0x14(%ebp),%eax
    6244:	8b 40 10             	mov    0x10(%eax),%eax
    6247:	85 c0                	test   %eax,%eax
    6249:	74 5f                	je     62aa <III_dequantize_sample+0x89>
    624b:	8b 45 14             	mov    0x14(%ebp),%eax
    624e:	8b 40 14             	mov    0x14(%eax),%eax
    6251:	83 f8 02             	cmp    $0x2,%eax
    6254:	75 54                	jne    62aa <III_dequantize_sample+0x89>
		if (gr_info->mixed_block_flag)
    6256:	8b 45 14             	mov    0x14(%ebp),%eax
    6259:	8b 40 18             	mov    0x18(%eax),%eax
    625c:	85 c0                	test   %eax,%eax
    625e:	74 15                	je     6275 <III_dequantize_sample+0x54>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    6260:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6263:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6269:	05 e4 c5 00 00       	add    $0xc5e4,%eax
    626e:	8b 00                	mov    (%eax),%eax
    6270:	89 45 e8             	mov    %eax,-0x18(%ebp)
		if (gr_info->mixed_block_flag)
    6273:	eb 48                	jmp    62bd <III_dequantize_sample+0x9c>
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    6275:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6278:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    627e:	05 40 c6 00 00       	add    $0xc640,%eax
    6283:	8b 10                	mov    (%eax),%edx
    6285:	89 d0                	mov    %edx,%eax
    6287:	01 c0                	add    %eax,%eax
    6289:	01 d0                	add    %edx,%eax
    628b:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    628e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6291:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6297:	05 40 c6 00 00       	add    $0xc640,%eax
    629c:	8b 00                	mov    (%eax),%eax
    629e:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    62a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
		if (gr_info->mixed_block_flag)
    62a8:	eb 13                	jmp    62bd <III_dequantize_sample+0x9c>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    62aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
    62ad:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    62b3:	05 e4 c5 00 00       	add    $0xc5e4,%eax
    62b8:	8b 00                	mov    (%eax),%eax
    62ba:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    62bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    62c4:	e9 44 06 00 00       	jmp    690d <III_dequantize_sample+0x6ec>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    62c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    62d0:	e9 2a 06 00 00       	jmp    68ff <III_dequantize_sample+0x6de>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    62d5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    62d8:	89 d0                	mov    %edx,%eax
    62da:	c1 e0 03             	shl    $0x3,%eax
    62dd:	01 d0                	add    %edx,%eax
    62df:	01 c0                	add    %eax,%eax
    62e1:	89 c2                	mov    %eax,%edx
    62e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62e6:	01 d0                	add    %edx,%eax
    62e8:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    62eb:	0f 85 9b 02 00 00    	jne    658c <III_dequantize_sample+0x36b>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    62f1:	8b 45 14             	mov    0x14(%ebp),%eax
    62f4:	8b 40 10             	mov    0x10(%eax),%eax
    62f7:	85 c0                	test   %eax,%eax
    62f9:	0f 84 68 02 00 00    	je     6567 <III_dequantize_sample+0x346>
    62ff:	8b 45 14             	mov    0x14(%ebp),%eax
    6302:	8b 40 14             	mov    0x14(%eax),%eax
    6305:	83 f8 02             	cmp    $0x2,%eax
    6308:	0f 85 59 02 00 00    	jne    6567 <III_dequantize_sample+0x346>
					if (gr_info->mixed_block_flag) {
    630e:	8b 45 14             	mov    0x14(%ebp),%eax
    6311:	8b 40 18             	mov    0x18(%eax),%eax
    6314:	85 c0                	test   %eax,%eax
    6316:	0f 84 ae 01 00 00    	je     64ca <III_dequantize_sample+0x2a9>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    631c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    631f:	89 d0                	mov    %edx,%eax
    6321:	c1 e0 03             	shl    $0x3,%eax
    6324:	01 d0                	add    %edx,%eax
    6326:	01 c0                	add    %eax,%eax
    6328:	89 c2                	mov    %eax,%edx
    632a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    632d:	01 c2                	add    %eax,%edx
    632f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6332:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6338:	05 00 c6 00 00       	add    $0xc600,%eax
    633d:	8b 00                	mov    (%eax),%eax
    633f:	39 c2                	cmp    %eax,%edx
    6341:	0f 85 92 00 00 00    	jne    63d9 <III_dequantize_sample+0x1b8>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    6347:	8b 45 dc             	mov    -0x24(%ebp),%eax
    634a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6350:	05 4c c6 00 00       	add    $0xc64c,%eax
    6355:	8b 10                	mov    (%eax),%edx
    6357:	89 d0                	mov    %edx,%eax
    6359:	01 c0                	add    %eax,%eax
    635b:	01 d0                	add    %edx,%eax
    635d:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    6360:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6367:	8b 45 ec             	mov    -0x14(%ebp),%eax
    636a:	8d 48 01             	lea    0x1(%eax),%ecx
    636d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6370:	89 d0                	mov    %edx,%eax
    6372:	c1 e0 03             	shl    $0x3,%eax
    6375:	01 d0                	add    %edx,%eax
    6377:	c1 e0 02             	shl    $0x2,%eax
    637a:	01 d0                	add    %edx,%eax
    637c:	01 c8                	add    %ecx,%eax
    637e:	83 c0 14             	add    $0x14,%eax
    6381:	8b 0c 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    6388:	8b 55 dc             	mov    -0x24(%ebp),%edx
    638b:	89 d0                	mov    %edx,%eax
    638d:	c1 e0 03             	shl    $0x3,%eax
    6390:	01 d0                	add    %edx,%eax
    6392:	c1 e0 02             	shl    $0x2,%eax
    6395:	01 d0                	add    %edx,%eax
    6397:	8b 55 ec             	mov    -0x14(%ebp),%edx
    639a:	01 d0                	add    %edx,%eax
    639c:	83 c0 14             	add    $0x14,%eax
    639f:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    63a6:	89 c8                	mov    %ecx,%eax
    63a8:	29 d0                	sub    %edx,%eax
    63aa:	89 45 e0             	mov    %eax,-0x20(%ebp)
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    63ad:	8b 55 dc             	mov    -0x24(%ebp),%edx
    63b0:	89 d0                	mov    %edx,%eax
    63b2:	c1 e0 03             	shl    $0x3,%eax
    63b5:	01 d0                	add    %edx,%eax
    63b7:	c1 e0 02             	shl    $0x2,%eax
    63ba:	01 d0                	add    %edx,%eax
    63bc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    63bf:	01 d0                	add    %edx,%eax
    63c1:	83 c0 14             	add    $0x14,%eax
    63c4:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    63cb:	89 d0                	mov    %edx,%eax
    63cd:	01 c0                	add    %eax,%eax
    63cf:	01 d0                	add    %edx,%eax
    63d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
					if (gr_info->mixed_block_flag) {
    63d4:	e9 b3 01 00 00       	jmp    658c <III_dequantize_sample+0x36b>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    63d9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    63dc:	89 d0                	mov    %edx,%eax
    63de:	c1 e0 03             	shl    $0x3,%eax
    63e1:	01 d0                	add    %edx,%eax
    63e3:	01 c0                	add    %eax,%eax
    63e5:	89 c2                	mov    %eax,%edx
    63e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    63ea:	01 c2                	add    %eax,%edx
    63ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
    63ef:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    63f5:	05 00 c6 00 00       	add    $0xc600,%eax
    63fa:	8b 00                	mov    (%eax),%eax
    63fc:	39 c2                	cmp    %eax,%edx
    63fe:	7d 2a                	jge    642a <III_dequantize_sample+0x209>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    6400:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6404:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6407:	8d 48 01             	lea    0x1(%eax),%ecx
    640a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    640d:	89 d0                	mov    %edx,%eax
    640f:	c1 e0 03             	shl    $0x3,%eax
    6412:	01 d0                	add    %edx,%eax
    6414:	c1 e0 02             	shl    $0x2,%eax
    6417:	01 d0                	add    %edx,%eax
    6419:	01 c8                	add    %ecx,%eax
    641b:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    6422:	89 45 e8             	mov    %eax,-0x18(%ebp)
					if (gr_info->mixed_block_flag) {
    6425:	e9 62 01 00 00       	jmp    658c <III_dequantize_sample+0x36b>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    642a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    642e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6431:	8d 48 01             	lea    0x1(%eax),%ecx
    6434:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6437:	89 d0                	mov    %edx,%eax
    6439:	c1 e0 03             	shl    $0x3,%eax
    643c:	01 d0                	add    %edx,%eax
    643e:	c1 e0 02             	shl    $0x2,%eax
    6441:	01 d0                	add    %edx,%eax
    6443:	01 c8                	add    %ecx,%eax
    6445:	83 c0 14             	add    $0x14,%eax
    6448:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    644f:	89 d0                	mov    %edx,%eax
    6451:	01 c0                	add    %eax,%eax
    6453:	01 d0                	add    %edx,%eax
    6455:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6458:	8b 45 ec             	mov    -0x14(%ebp),%eax
    645b:	8d 48 01             	lea    0x1(%eax),%ecx
    645e:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6461:	89 d0                	mov    %edx,%eax
    6463:	c1 e0 03             	shl    $0x3,%eax
    6466:	01 d0                	add    %edx,%eax
    6468:	c1 e0 02             	shl    $0x2,%eax
    646b:	01 d0                	add    %edx,%eax
    646d:	01 c8                	add    %ecx,%eax
    646f:	83 c0 14             	add    $0x14,%eax
    6472:	8b 0c 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    6479:	8b 55 dc             	mov    -0x24(%ebp),%edx
    647c:	89 d0                	mov    %edx,%eax
    647e:	c1 e0 03             	shl    $0x3,%eax
    6481:	01 d0                	add    %edx,%eax
    6483:	c1 e0 02             	shl    $0x2,%eax
    6486:	01 d0                	add    %edx,%eax
    6488:	8b 55 ec             	mov    -0x14(%ebp),%edx
    648b:	01 d0                	add    %edx,%eax
    648d:	83 c0 14             	add    $0x14,%eax
    6490:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6497:	89 c8                	mov    %ecx,%eax
    6499:	29 d0                	sub    %edx,%eax
    649b:	89 45 e0             	mov    %eax,-0x20(%ebp)
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    649e:	8b 55 dc             	mov    -0x24(%ebp),%edx
    64a1:	89 d0                	mov    %edx,%eax
    64a3:	c1 e0 03             	shl    $0x3,%eax
    64a6:	01 d0                	add    %edx,%eax
    64a8:	c1 e0 02             	shl    $0x2,%eax
    64ab:	01 d0                	add    %edx,%eax
    64ad:	8b 55 ec             	mov    -0x14(%ebp),%edx
    64b0:	01 d0                	add    %edx,%eax
    64b2:	83 c0 14             	add    $0x14,%eax
    64b5:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    64bc:	89 d0                	mov    %edx,%eax
    64be:	01 c0                	add    %eax,%eax
    64c0:	01 d0                	add    %edx,%eax
    64c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
					if (gr_info->mixed_block_flag) {
    64c5:	e9 c2 00 00 00       	jmp    658c <III_dequantize_sample+0x36b>
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    64ca:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    64ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
    64d1:	8d 48 01             	lea    0x1(%eax),%ecx
    64d4:	8b 55 dc             	mov    -0x24(%ebp),%edx
    64d7:	89 d0                	mov    %edx,%eax
    64d9:	c1 e0 03             	shl    $0x3,%eax
    64dc:	01 d0                	add    %edx,%eax
    64de:	c1 e0 02             	shl    $0x2,%eax
    64e1:	01 d0                	add    %edx,%eax
    64e3:	01 c8                	add    %ecx,%eax
    64e5:	83 c0 14             	add    $0x14,%eax
    64e8:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    64ef:	89 d0                	mov    %edx,%eax
    64f1:	01 c0                	add    %eax,%eax
    64f3:	01 d0                	add    %edx,%eax
    64f5:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    64f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    64fb:	8d 48 01             	lea    0x1(%eax),%ecx
    64fe:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6501:	89 d0                	mov    %edx,%eax
    6503:	c1 e0 03             	shl    $0x3,%eax
    6506:	01 d0                	add    %edx,%eax
    6508:	c1 e0 02             	shl    $0x2,%eax
    650b:	01 d0                	add    %edx,%eax
    650d:	01 c8                	add    %ecx,%eax
    650f:	83 c0 14             	add    $0x14,%eax
    6512:	8b 0c 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    6519:	8b 55 dc             	mov    -0x24(%ebp),%edx
    651c:	89 d0                	mov    %edx,%eax
    651e:	c1 e0 03             	shl    $0x3,%eax
    6521:	01 d0                	add    %edx,%eax
    6523:	c1 e0 02             	shl    $0x2,%eax
    6526:	01 d0                	add    %edx,%eax
    6528:	8b 55 ec             	mov    -0x14(%ebp),%edx
    652b:	01 d0                	add    %edx,%eax
    652d:	83 c0 14             	add    $0x14,%eax
    6530:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    6537:	89 c8                	mov    %ecx,%eax
    6539:	29 d0                	sub    %edx,%eax
    653b:	89 45 e0             	mov    %eax,-0x20(%ebp)
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    653e:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6541:	89 d0                	mov    %edx,%eax
    6543:	c1 e0 03             	shl    $0x3,%eax
    6546:	01 d0                	add    %edx,%eax
    6548:	c1 e0 02             	shl    $0x2,%eax
    654b:	01 d0                	add    %edx,%eax
    654d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6550:	01 d0                	add    %edx,%eax
    6552:	83 c0 14             	add    $0x14,%eax
    6555:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    655c:	89 d0                	mov    %edx,%eax
    655e:	01 c0                	add    %eax,%eax
    6560:	01 d0                	add    %edx,%eax
    6562:	89 45 e4             	mov    %eax,-0x1c(%ebp)
					if (gr_info->mixed_block_flag) {
    6565:	eb 25                	jmp    658c <III_dequantize_sample+0x36b>
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    6567:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    656b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    656e:	8d 48 01             	lea    0x1(%eax),%ecx
    6571:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6574:	89 d0                	mov    %edx,%eax
    6576:	c1 e0 03             	shl    $0x3,%eax
    6579:	01 d0                	add    %edx,%eax
    657b:	c1 e0 02             	shl    $0x2,%eax
    657e:	01 d0                	add    %edx,%eax
    6580:	01 c8                	add    %ecx,%eax
    6582:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    6589:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    658c:	8b 45 14             	mov    0x14(%ebp),%eax
    658f:	8b 40 08             	mov    0x8(%eax),%eax
    6592:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6595:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    659c:	df 6d d0             	fildll -0x30(%ebp)
    659f:	dd 05 10 b4 00 00    	fldl   0xb410
    65a5:	de e9                	fsubrp %st,%st(1)
    65a7:	dd 05 18 b4 00 00    	fldl   0xb418
    65ad:	de c9                	fmulp  %st,%st(1)
    65af:	8b 55 f0             	mov    -0x10(%ebp),%edx
    65b2:	89 d0                	mov    %edx,%eax
    65b4:	c1 e0 03             	shl    $0x3,%eax
    65b7:	01 d0                	add    %edx,%eax
    65b9:	c1 e0 04             	shl    $0x4,%eax
    65bc:	89 c2                	mov    %eax,%edx
    65be:	8b 45 0c             	mov    0xc(%ebp),%eax
    65c1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    65c4:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    65c8:	dd 1c 24             	fstpl  (%esp)
    65cb:	dd 05 20 b4 00 00    	fldl   0xb420
    65d1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    65d5:	dd 1c 24             	fstpl  (%esp)
    65d8:	e8 94 c4 ff ff       	call   2a71 <pow>
    65dd:	83 c4 10             	add    $0x10,%esp
    65e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    65e3:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    65e6:	8b 45 14             	mov    0x14(%ebp),%eax
    65e9:	8b 40 10             	mov    0x10(%eax),%eax
    65ec:	85 c0                	test   %eax,%eax
    65ee:	0f 84 85 01 00 00    	je     6779 <III_dequantize_sample+0x558>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    65f4:	8b 45 14             	mov    0x14(%ebp),%eax
    65f7:	8b 40 14             	mov    0x14(%eax),%eax
			if (gr_info->window_switching_flag && (
    65fa:	83 f8 02             	cmp    $0x2,%eax
    65fd:	75 0a                	jne    6609 <III_dequantize_sample+0x3e8>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    65ff:	8b 45 14             	mov    0x14(%ebp),%eax
    6602:	8b 40 18             	mov    0x18(%eax),%eax
    6605:	85 c0                	test   %eax,%eax
    6607:	74 27                	je     6630 <III_dequantize_sample+0x40f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    6609:	8b 45 14             	mov    0x14(%ebp),%eax
    660c:	8b 40 14             	mov    0x14(%eax),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    660f:	83 f8 02             	cmp    $0x2,%eax
    6612:	0f 85 61 01 00 00    	jne    6779 <III_dequantize_sample+0x558>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    6618:	8b 45 14             	mov    0x14(%ebp),%eax
    661b:	8b 40 18             	mov    0x18(%eax),%eax
    661e:	85 c0                	test   %eax,%eax
    6620:	0f 84 53 01 00 00    	je     6779 <III_dequantize_sample+0x558>
    6626:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    662a:	0f 8e 49 01 00 00    	jle    6779 <III_dequantize_sample+0x558>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    6630:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6633:	89 d0                	mov    %edx,%eax
    6635:	c1 e0 03             	shl    $0x3,%eax
    6638:	01 d0                	add    %edx,%eax
    663a:	01 c0                	add    %eax,%eax
    663c:	89 c2                	mov    %eax,%edx
    663e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6641:	01 d0                	add    %edx,%eax
    6643:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    6646:	99                   	cltd   
    6647:	f7 7d e0             	idivl  -0x20(%ebp)
    664a:	89 c2                	mov    %eax,%edx
    664c:	8b 45 14             	mov    0x14(%ebp),%eax
    664f:	83 c2 08             	add    $0x8,%edx
    6652:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    6656:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6659:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    6660:	df 6d d0             	fildll -0x30(%ebp)
    6663:	dd 05 28 b4 00 00    	fldl   0xb428
    6669:	de c9                	fmulp  %st,%st(1)
    666b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    666f:	dd 1c 24             	fstpl  (%esp)
    6672:	dd 05 20 b4 00 00    	fldl   0xb420
    6678:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    667c:	dd 1c 24             	fstpl  (%esp)
    667f:	e8 ed c3 ff ff       	call   2a71 <pow>
    6684:	83 c4 10             	add    $0x10,%esp
    6687:	8b 55 f0             	mov    -0x10(%ebp),%edx
    668a:	89 d0                	mov    %edx,%eax
    668c:	c1 e0 03             	shl    $0x3,%eax
    668f:	01 d0                	add    %edx,%eax
    6691:	c1 e0 04             	shl    $0x4,%eax
    6694:	89 c2                	mov    %eax,%edx
    6696:	8b 45 0c             	mov    0xc(%ebp),%eax
    6699:	01 c2                	add    %eax,%edx
    669b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    669e:	dd 04 c2             	fldl   (%edx,%eax,8)
    66a1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    66a4:	89 d0                	mov    %edx,%eax
    66a6:	c1 e0 03             	shl    $0x3,%eax
    66a9:	01 d0                	add    %edx,%eax
    66ab:	c1 e0 04             	shl    $0x4,%eax
    66ae:	89 c2                	mov    %eax,%edx
    66b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    66b3:	01 c2                	add    %eax,%edx
    66b5:	de c9                	fmulp  %st,%st(1)
    66b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    66ba:	dd 1c c2             	fstpl  (%edx,%eax,8)
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    66bd:	8b 45 14             	mov    0x14(%ebp),%eax
    66c0:	8b 40 40             	mov    0x40(%eax),%eax
    66c3:	89 45 d0             	mov    %eax,-0x30(%ebp)
    66c6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    66cd:	df 6d d0             	fildll -0x30(%ebp)
    66d0:	d9 e8                	fld1   
    66d2:	de c1                	faddp  %st,%st(1)
    66d4:	dd 05 30 b4 00 00    	fldl   0xb430
    66da:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    66dc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    66df:	89 d0                	mov    %edx,%eax
    66e1:	c1 e0 03             	shl    $0x3,%eax
    66e4:	01 d0                	add    %edx,%eax
    66e6:	01 c0                	add    %eax,%eax
    66e8:	89 c2                	mov    %eax,%edx
    66ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    66ed:	01 d0                	add    %edx,%eax
    66ef:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    66f2:	99                   	cltd   
    66f3:	f7 7d e0             	idivl  -0x20(%ebp)
    66f6:	89 c1                	mov    %eax,%ecx
    66f8:	8b 55 10             	mov    0x10(%ebp),%edx
    66fb:	8b 5d 18             	mov    0x18(%ebp),%ebx
    66fe:	89 c8                	mov    %ecx,%eax
    6700:	01 c0                	add    %eax,%eax
    6702:	01 c8                	add    %ecx,%eax
    6704:	c1 e0 02             	shl    $0x2,%eax
    6707:	01 c8                	add    %ecx,%eax
    6709:	6b cb 3e             	imul   $0x3e,%ebx,%ecx
    670c:	01 c1                	add    %eax,%ecx
    670e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6711:	01 c8                	add    %ecx,%eax
    6713:	83 c0 14             	add    $0x14,%eax
    6716:	8b 44 82 0c          	mov    0xc(%edx,%eax,4),%eax
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    671a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    671d:	db 45 d0             	fildl  -0x30(%ebp)
    6720:	de c9                	fmulp  %st,%st(1)
    6722:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    6726:	dd 1c 24             	fstpl  (%esp)
    6729:	dd 05 20 b4 00 00    	fldl   0xb420
    672f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    6733:	dd 1c 24             	fstpl  (%esp)
    6736:	e8 36 c3 ff ff       	call   2a71 <pow>
    673b:	83 c4 10             	add    $0x10,%esp
    673e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6741:	89 d0                	mov    %edx,%eax
    6743:	c1 e0 03             	shl    $0x3,%eax
    6746:	01 d0                	add    %edx,%eax
    6748:	c1 e0 04             	shl    $0x4,%eax
    674b:	89 c2                	mov    %eax,%edx
    674d:	8b 45 0c             	mov    0xc(%ebp),%eax
    6750:	01 c2                	add    %eax,%edx
    6752:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6755:	dd 04 c2             	fldl   (%edx,%eax,8)
    6758:	8b 55 f0             	mov    -0x10(%ebp),%edx
    675b:	89 d0                	mov    %edx,%eax
    675d:	c1 e0 03             	shl    $0x3,%eax
    6760:	01 d0                	add    %edx,%eax
    6762:	c1 e0 04             	shl    $0x4,%eax
    6765:	89 c2                	mov    %eax,%edx
    6767:	8b 45 0c             	mov    0xc(%ebp),%eax
    676a:	01 c2                	add    %eax,%edx
    676c:	de c9                	fmulp  %st,%st(1)
    676e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6771:	dd 1c c2             	fstpl  (%edx,%eax,8)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    6774:	e9 a8 00 00 00       	jmp    6821 <III_dequantize_sample+0x600>
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    6779:	8b 45 14             	mov    0x14(%ebp),%eax
    677c:	8b 40 40             	mov    0x40(%eax),%eax
    677f:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6782:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    6789:	df 6d d0             	fildll -0x30(%ebp)
    678c:	d9 e8                	fld1   
    678e:	de c1                	faddp  %st,%st(1)
    6790:	dd 05 30 b4 00 00    	fldl   0xb430
    6796:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    6798:	8b 45 10             	mov    0x10(%ebp),%eax
    679b:	8b 55 18             	mov    0x18(%ebp),%edx
    679e:	6b ca 3e             	imul   $0x3e,%edx,%ecx
    67a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    67a4:	01 ca                	add    %ecx,%edx
    67a6:	8b 04 90             	mov    (%eax,%edx,4),%eax
    67a9:	89 c1                	mov    %eax,%ecx
								+ gr_info->preflag * pretab[cb]));
    67ab:	8b 45 14             	mov    0x14(%ebp),%eax
    67ae:	8b 50 3c             	mov    0x3c(%eax),%edx
    67b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    67b4:	8b 04 85 a0 c7 00 00 	mov    0xc7a0(,%eax,4),%eax
    67bb:	0f af c2             	imul   %edx,%eax
    67be:	01 c8                	add    %ecx,%eax
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    67c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    67c3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    67ca:	df 6d d0             	fildll -0x30(%ebp)
    67cd:	de c9                	fmulp  %st,%st(1)
    67cf:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    67d3:	dd 1c 24             	fstpl  (%esp)
    67d6:	dd 05 20 b4 00 00    	fldl   0xb420
    67dc:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    67e0:	dd 1c 24             	fstpl  (%esp)
    67e3:	e8 89 c2 ff ff       	call   2a71 <pow>
    67e8:	83 c4 10             	add    $0x10,%esp
    67eb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    67ee:	89 d0                	mov    %edx,%eax
    67f0:	c1 e0 03             	shl    $0x3,%eax
    67f3:	01 d0                	add    %edx,%eax
    67f5:	c1 e0 04             	shl    $0x4,%eax
    67f8:	89 c2                	mov    %eax,%edx
    67fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    67fd:	01 c2                	add    %eax,%edx
    67ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6802:	dd 04 c2             	fldl   (%edx,%eax,8)
    6805:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6808:	89 d0                	mov    %edx,%eax
    680a:	c1 e0 03             	shl    $0x3,%eax
    680d:	01 d0                	add    %edx,%eax
    680f:	c1 e0 04             	shl    $0x4,%eax
    6812:	89 c2                	mov    %eax,%edx
    6814:	8b 45 0c             	mov    0xc(%ebp),%eax
    6817:	01 c2                	add    %eax,%edx
    6819:	de c9                	fmulp  %st,%st(1)
    681b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    681e:	dd 1c c2             	fstpl  (%edx,%eax,8)
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    6821:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6824:	89 d0                	mov    %edx,%eax
    6826:	c1 e0 03             	shl    $0x3,%eax
    6829:	01 d0                	add    %edx,%eax
    682b:	c1 e0 03             	shl    $0x3,%eax
    682e:	89 c2                	mov    %eax,%edx
    6830:	8b 45 08             	mov    0x8(%ebp),%eax
    6833:	01 c2                	add    %eax,%edx
    6835:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6838:	8b 04 82             	mov    (%edx,%eax,4),%eax
    683b:	c1 e8 1f             	shr    $0x1f,%eax
    683e:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    6841:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6844:	89 d0                	mov    %edx,%eax
    6846:	c1 e0 03             	shl    $0x3,%eax
    6849:	01 d0                	add    %edx,%eax
    684b:	c1 e0 03             	shl    $0x3,%eax
    684e:	89 c2                	mov    %eax,%edx
    6850:	8b 45 08             	mov    0x8(%ebp),%eax
    6853:	01 c2                	add    %eax,%edx
    6855:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6858:	8b 04 82             	mov    (%edx,%eax,4),%eax
    685b:	83 ec 0c             	sub    $0xc,%esp
    685e:	50                   	push   %eax
    685f:	e8 fa c0 ff ff       	call   295e <abs>
    6864:	83 c4 10             	add    $0x10,%esp
    6867:	89 45 d0             	mov    %eax,-0x30(%ebp)
    686a:	db 45 d0             	fildl  -0x30(%ebp)
    686d:	dd 05 38 b4 00 00    	fldl   0xb438
    6873:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    6877:	dd 1c 24             	fstpl  (%esp)
    687a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    687e:	dd 1c 24             	fstpl  (%esp)
    6881:	e8 eb c1 ff ff       	call   2a71 <pow>
    6886:	83 c4 10             	add    $0x10,%esp
    6889:	8b 55 f0             	mov    -0x10(%ebp),%edx
    688c:	89 d0                	mov    %edx,%eax
    688e:	c1 e0 03             	shl    $0x3,%eax
    6891:	01 d0                	add    %edx,%eax
    6893:	c1 e0 04             	shl    $0x4,%eax
    6896:	89 c2                	mov    %eax,%edx
    6898:	8b 45 0c             	mov    0xc(%ebp),%eax
    689b:	01 c2                	add    %eax,%edx
    689d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68a0:	dd 04 c2             	fldl   (%edx,%eax,8)
    68a3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    68a6:	89 d0                	mov    %edx,%eax
    68a8:	c1 e0 03             	shl    $0x3,%eax
    68ab:	01 d0                	add    %edx,%eax
    68ad:	c1 e0 04             	shl    $0x4,%eax
    68b0:	89 c2                	mov    %eax,%edx
    68b2:	8b 45 0c             	mov    0xc(%ebp),%eax
    68b5:	01 c2                	add    %eax,%edx
    68b7:	de c9                	fmulp  %st,%st(1)
    68b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68bc:	dd 1c c2             	fstpl  (%edx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    68bf:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    68c3:	74 36                	je     68fb <III_dequantize_sample+0x6da>
    68c5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    68c8:	89 d0                	mov    %edx,%eax
    68ca:	c1 e0 03             	shl    $0x3,%eax
    68cd:	01 d0                	add    %edx,%eax
    68cf:	c1 e0 04             	shl    $0x4,%eax
    68d2:	89 c2                	mov    %eax,%edx
    68d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    68d7:	01 c2                	add    %eax,%edx
    68d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68dc:	dd 04 c2             	fldl   (%edx,%eax,8)
    68df:	8b 55 f0             	mov    -0x10(%ebp),%edx
    68e2:	89 d0                	mov    %edx,%eax
    68e4:	c1 e0 03             	shl    $0x3,%eax
    68e7:	01 d0                	add    %edx,%eax
    68e9:	c1 e0 04             	shl    $0x4,%eax
    68ec:	89 c2                	mov    %eax,%edx
    68ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    68f1:	01 c2                	add    %eax,%edx
    68f3:	d9 e0                	fchs   
    68f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68f8:	dd 1c c2             	fstpl  (%edx,%eax,8)
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    68fb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    68ff:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    6903:	0f 8e cc f9 ff ff    	jle    62d5 <III_dequantize_sample+0xb4>
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    6909:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    690d:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    6911:	0f 8e b2 f9 ff ff    	jle    62c9 <III_dequantize_sample+0xa8>
		}
	}
}
    6917:	90                   	nop
    6918:	90                   	nop
    6919:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    691c:	c9                   	leave  
    691d:	c3                   	ret    

0000691e <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    691e:	55                   	push   %ebp
    691f:	89 e5                	mov    %esp,%ebp
    6921:	57                   	push   %edi
    6922:	56                   	push   %esi
    6923:	53                   	push   %ebx
    6924:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    6927:	8b 45 14             	mov    0x14(%ebp),%eax
    692a:	8b 00                	mov    (%eax),%eax
    692c:	8b 40 10             	mov    0x10(%eax),%eax
    692f:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    6932:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6939:	eb 33                	jmp    696e <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    693b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6942:	eb 20                	jmp    6964 <III_reorder+0x46>
         ro[sb][ss] = 0;
    6944:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6947:	89 d0                	mov    %edx,%eax
    6949:	c1 e0 03             	shl    $0x3,%eax
    694c:	01 d0                	add    %edx,%eax
    694e:	c1 e0 04             	shl    $0x4,%eax
    6951:	89 c2                	mov    %eax,%edx
    6953:	8b 45 0c             	mov    0xc(%ebp),%eax
    6956:	01 c2                	add    %eax,%edx
    6958:	8b 45 dc             	mov    -0x24(%ebp),%eax
    695b:	d9 ee                	fldz   
    695d:	dd 1c c2             	fstpl  (%edx,%eax,8)
      for(ss=0;ss<SSLIMIT;ss++)
    6960:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    6964:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    6968:	7e da                	jle    6944 <III_reorder+0x26>
   for(sb=0;sb<SBLIMIT;sb++)
    696a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    696e:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    6972:	7e c7                	jle    693b <III_reorder+0x1d>

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    6974:	8b 45 10             	mov    0x10(%ebp),%eax
    6977:	8b 40 10             	mov    0x10(%eax),%eax
    697a:	85 c0                	test   %eax,%eax
    697c:	0f 84 b8 03 00 00    	je     6d3a <III_reorder+0x41c>
    6982:	8b 45 10             	mov    0x10(%ebp),%eax
    6985:	8b 40 14             	mov    0x14(%eax),%eax
    6988:	83 f8 02             	cmp    $0x2,%eax
    698b:	0f 85 a9 03 00 00    	jne    6d3a <III_reorder+0x41c>
      if (gr_info->mixed_block_flag) {
    6991:	8b 45 10             	mov    0x10(%ebp),%eax
    6994:	8b 40 18             	mov    0x18(%eax),%eax
    6997:	85 c0                	test   %eax,%eax
    6999:	0f 84 04 02 00 00    	je     6ba3 <III_reorder+0x285>
         for (sb=0 ; sb < 2 ; sb++)
    699f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    69a6:	eb 4c                	jmp    69f4 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    69a8:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    69af:	eb 39                	jmp    69ea <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    69b1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    69b4:	89 d0                	mov    %edx,%eax
    69b6:	c1 e0 03             	shl    $0x3,%eax
    69b9:	01 d0                	add    %edx,%eax
    69bb:	c1 e0 04             	shl    $0x4,%eax
    69be:	89 c2                	mov    %eax,%edx
    69c0:	8b 45 08             	mov    0x8(%ebp),%eax
    69c3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    69c6:	8b 55 e0             	mov    -0x20(%ebp),%edx
    69c9:	89 d0                	mov    %edx,%eax
    69cb:	c1 e0 03             	shl    $0x3,%eax
    69ce:	01 d0                	add    %edx,%eax
    69d0:	c1 e0 04             	shl    $0x4,%eax
    69d3:	89 c2                	mov    %eax,%edx
    69d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    69d8:	01 c2                	add    %eax,%edx
    69da:	8b 45 dc             	mov    -0x24(%ebp),%eax
    69dd:	dd 04 c1             	fldl   (%ecx,%eax,8)
    69e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    69e3:	dd 1c c2             	fstpl  (%edx,%eax,8)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    69e6:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    69ea:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    69ee:	7e c1                	jle    69b1 <III_reorder+0x93>
         for (sb=0 ; sb < 2 ; sb++)
    69f0:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    69f4:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    69f8:	7e ae                	jle    69a8 <III_reorder+0x8a>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    69fa:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    6a01:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6a04:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6a0a:	05 48 c6 00 00       	add    $0xc648,%eax
    6a0f:	8b 00                	mov    (%eax),%eax
    6a11:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    6a14:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6a17:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6a1d:	05 4c c6 00 00       	add    $0xc64c,%eax
    6a22:	8b 00                	mov    (%eax),%eax
    6a24:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6a27:	89 45 e4             	mov    %eax,-0x1c(%ebp)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    6a2a:	e9 65 01 00 00       	jmp    6b94 <III_reorder+0x276>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6a2f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    6a36:	e9 03 01 00 00       	jmp    6b3e <III_reorder+0x220>
                  for(freq=0;freq<sfb_lines;freq++) {
    6a3b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    6a42:	e9 e7 00 00 00       	jmp    6b2e <III_reorder+0x210>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    6a47:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6a4a:	89 d0                	mov    %edx,%eax
    6a4c:	01 c0                	add    %eax,%eax
    6a4e:	01 c2                	add    %eax,%edx
    6a50:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6a53:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    6a57:	01 c2                	add    %eax,%edx
    6a59:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6a5c:	01 d0                	add    %edx,%eax
    6a5e:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    6a61:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6a64:	89 d0                	mov    %edx,%eax
    6a66:	01 c0                	add    %eax,%eax
    6a68:	01 c2                	add    %eax,%edx
    6a6a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6a6d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    6a70:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    6a73:	89 d0                	mov    %edx,%eax
    6a75:	01 c0                	add    %eax,%eax
    6a77:	01 d0                	add    %edx,%eax
    6a79:	01 c8                	add    %ecx,%eax
    6a7b:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    6a7e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    6a81:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6a86:	89 c8                	mov    %ecx,%eax
    6a88:	f7 ea                	imul   %edx
    6a8a:	89 d0                	mov    %edx,%eax
    6a8c:	c1 f8 02             	sar    $0x2,%eax
    6a8f:	c1 f9 1f             	sar    $0x1f,%ecx
    6a92:	89 ca                	mov    %ecx,%edx
    6a94:	29 d0                	sub    %edx,%eax
    6a96:	89 c2                	mov    %eax,%edx
    6a98:	89 d0                	mov    %edx,%eax
    6a9a:	c1 e0 03             	shl    $0x3,%eax
    6a9d:	01 d0                	add    %edx,%eax
    6a9f:	c1 e0 04             	shl    $0x4,%eax
    6aa2:	89 c2                	mov    %eax,%edx
    6aa4:	8b 45 08             	mov    0x8(%ebp),%eax
    6aa7:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    6aaa:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6aad:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6ab2:	89 d8                	mov    %ebx,%eax
    6ab4:	f7 ea                	imul   %edx
    6ab6:	89 d0                	mov    %edx,%eax
    6ab8:	c1 f8 02             	sar    $0x2,%eax
    6abb:	89 da                	mov    %ebx,%edx
    6abd:	c1 fa 1f             	sar    $0x1f,%edx
    6ac0:	29 d0                	sub    %edx,%eax
    6ac2:	89 c1                	mov    %eax,%ecx
    6ac4:	89 c8                	mov    %ecx,%eax
    6ac6:	c1 e0 03             	shl    $0x3,%eax
    6ac9:	01 c8                	add    %ecx,%eax
    6acb:	01 c0                	add    %eax,%eax
    6acd:	29 c3                	sub    %eax,%ebx
    6acf:	89 d9                	mov    %ebx,%ecx
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6ad1:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    6ad4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6ad9:	89 d8                	mov    %ebx,%eax
    6adb:	f7 ea                	imul   %edx
    6add:	89 d0                	mov    %edx,%eax
    6adf:	c1 f8 02             	sar    $0x2,%eax
    6ae2:	c1 fb 1f             	sar    $0x1f,%ebx
    6ae5:	89 da                	mov    %ebx,%edx
    6ae7:	29 d0                	sub    %edx,%eax
    6ae9:	89 c2                	mov    %eax,%edx
    6aeb:	89 d0                	mov    %edx,%eax
    6aed:	c1 e0 03             	shl    $0x3,%eax
    6af0:	01 d0                	add    %edx,%eax
    6af2:	c1 e0 04             	shl    $0x4,%eax
    6af5:	89 c2                	mov    %eax,%edx
    6af7:	8b 45 0c             	mov    0xc(%ebp),%eax
    6afa:	8d 34 02             	lea    (%edx,%eax,1),%esi
    6afd:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    6b00:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6b05:	89 d8                	mov    %ebx,%eax
    6b07:	f7 ea                	imul   %edx
    6b09:	89 d0                	mov    %edx,%eax
    6b0b:	c1 f8 02             	sar    $0x2,%eax
    6b0e:	89 da                	mov    %ebx,%edx
    6b10:	c1 fa 1f             	sar    $0x1f,%edx
    6b13:	29 d0                	sub    %edx,%eax
    6b15:	89 c2                	mov    %eax,%edx
    6b17:	89 d0                	mov    %edx,%eax
    6b19:	c1 e0 03             	shl    $0x3,%eax
    6b1c:	01 d0                	add    %edx,%eax
    6b1e:	01 c0                	add    %eax,%eax
    6b20:	29 c3                	sub    %eax,%ebx
    6b22:	89 da                	mov    %ebx,%edx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    6b24:	dd 04 cf             	fldl   (%edi,%ecx,8)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6b27:	dd 1c d6             	fstpl  (%esi,%edx,8)
                  for(freq=0;freq<sfb_lines;freq++) {
    6b2a:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    6b2e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6b31:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    6b34:	0f 8c 0d ff ff ff    	jl     6a47 <III_reorder+0x129>
               for(window=0; window<3; window++)
    6b3a:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    6b3e:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    6b42:	0f 8e f3 fe ff ff    	jle    6a3b <III_reorder+0x11d>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    6b48:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6b4c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6b4f:	89 d0                	mov    %edx,%eax
    6b51:	c1 e0 03             	shl    $0x3,%eax
    6b54:	01 d0                	add    %edx,%eax
    6b56:	c1 e0 02             	shl    $0x2,%eax
    6b59:	01 d0                	add    %edx,%eax
    6b5b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6b5e:	01 d0                	add    %edx,%eax
    6b60:	83 c0 14             	add    $0x14,%eax
    6b63:	8b 04 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%eax
    6b6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    6b6d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6b70:	8d 48 01             	lea    0x1(%eax),%ecx
    6b73:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6b76:	89 d0                	mov    %edx,%eax
    6b78:	c1 e0 03             	shl    $0x3,%eax
    6b7b:	01 d0                	add    %edx,%eax
    6b7d:	c1 e0 02             	shl    $0x2,%eax
    6b80:	01 d0                	add    %edx,%eax
    6b82:	01 c8                	add    %ecx,%eax
    6b84:	83 c0 14             	add    $0x14,%eax
    6b87:	8b 04 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%eax
    6b8e:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6b91:	89 45 e4             	mov    %eax,-0x1c(%ebp)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    6b94:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    6b98:	0f 8e 91 fe ff ff    	jle    6a2f <III_reorder+0x111>
      if (gr_info->mixed_block_flag) {
    6b9e:	e9 f3 01 00 00       	jmp    6d96 <III_reorder+0x478>
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    6ba3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6baa:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    6bb1:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6bb4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6bba:	05 40 c6 00 00       	add    $0xc640,%eax
    6bbf:	8b 00                	mov    (%eax),%eax
    6bc1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    6bc4:	e9 65 01 00 00       	jmp    6d2e <III_reorder+0x410>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6bc9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    6bd0:	e9 03 01 00 00       	jmp    6cd8 <III_reorder+0x3ba>
                  for(freq=0;freq<sfb_lines;freq++) {
    6bd5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    6bdc:	e9 e7 00 00 00       	jmp    6cc8 <III_reorder+0x3aa>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    6be1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6be4:	89 d0                	mov    %edx,%eax
    6be6:	01 c0                	add    %eax,%eax
    6be8:	01 c2                	add    %eax,%edx
    6bea:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6bed:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    6bf1:	01 c2                	add    %eax,%edx
    6bf3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6bf6:	01 d0                	add    %edx,%eax
    6bf8:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    6bfb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6bfe:	89 d0                	mov    %edx,%eax
    6c00:	01 c0                	add    %eax,%eax
    6c02:	01 c2                	add    %eax,%edx
    6c04:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6c07:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    6c0a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    6c0d:	89 d0                	mov    %edx,%eax
    6c0f:	01 c0                	add    %eax,%eax
    6c11:	01 d0                	add    %edx,%eax
    6c13:	01 c8                	add    %ecx,%eax
    6c15:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    6c18:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    6c1b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6c20:	89 c8                	mov    %ecx,%eax
    6c22:	f7 ea                	imul   %edx
    6c24:	89 d0                	mov    %edx,%eax
    6c26:	c1 f8 02             	sar    $0x2,%eax
    6c29:	c1 f9 1f             	sar    $0x1f,%ecx
    6c2c:	89 ca                	mov    %ecx,%edx
    6c2e:	29 d0                	sub    %edx,%eax
    6c30:	89 c2                	mov    %eax,%edx
    6c32:	89 d0                	mov    %edx,%eax
    6c34:	c1 e0 03             	shl    $0x3,%eax
    6c37:	01 d0                	add    %edx,%eax
    6c39:	c1 e0 04             	shl    $0x4,%eax
    6c3c:	89 c2                	mov    %eax,%edx
    6c3e:	8b 45 08             	mov    0x8(%ebp),%eax
    6c41:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    6c44:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6c47:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6c4c:	89 d8                	mov    %ebx,%eax
    6c4e:	f7 ea                	imul   %edx
    6c50:	89 d0                	mov    %edx,%eax
    6c52:	c1 f8 02             	sar    $0x2,%eax
    6c55:	89 da                	mov    %ebx,%edx
    6c57:	c1 fa 1f             	sar    $0x1f,%edx
    6c5a:	29 d0                	sub    %edx,%eax
    6c5c:	89 c1                	mov    %eax,%ecx
    6c5e:	89 c8                	mov    %ecx,%eax
    6c60:	c1 e0 03             	shl    $0x3,%eax
    6c63:	01 c8                	add    %ecx,%eax
    6c65:	01 c0                	add    %eax,%eax
    6c67:	29 c3                	sub    %eax,%ebx
    6c69:	89 d9                	mov    %ebx,%ecx
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6c6b:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    6c6e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6c73:	89 d8                	mov    %ebx,%eax
    6c75:	f7 ea                	imul   %edx
    6c77:	89 d0                	mov    %edx,%eax
    6c79:	c1 f8 02             	sar    $0x2,%eax
    6c7c:	c1 fb 1f             	sar    $0x1f,%ebx
    6c7f:	89 da                	mov    %ebx,%edx
    6c81:	29 d0                	sub    %edx,%eax
    6c83:	89 c2                	mov    %eax,%edx
    6c85:	89 d0                	mov    %edx,%eax
    6c87:	c1 e0 03             	shl    $0x3,%eax
    6c8a:	01 d0                	add    %edx,%eax
    6c8c:	c1 e0 04             	shl    $0x4,%eax
    6c8f:	89 c2                	mov    %eax,%edx
    6c91:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c94:	8d 34 02             	lea    (%edx,%eax,1),%esi
    6c97:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    6c9a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6c9f:	89 d8                	mov    %ebx,%eax
    6ca1:	f7 ea                	imul   %edx
    6ca3:	89 d0                	mov    %edx,%eax
    6ca5:	c1 f8 02             	sar    $0x2,%eax
    6ca8:	89 da                	mov    %ebx,%edx
    6caa:	c1 fa 1f             	sar    $0x1f,%edx
    6cad:	29 d0                	sub    %edx,%eax
    6caf:	89 c2                	mov    %eax,%edx
    6cb1:	89 d0                	mov    %edx,%eax
    6cb3:	c1 e0 03             	shl    $0x3,%eax
    6cb6:	01 d0                	add    %edx,%eax
    6cb8:	01 c0                	add    %eax,%eax
    6cba:	29 c3                	sub    %eax,%ebx
    6cbc:	89 da                	mov    %ebx,%edx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    6cbe:	dd 04 cf             	fldl   (%edi,%ecx,8)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6cc1:	dd 1c d6             	fstpl  (%esi,%edx,8)
                  for(freq=0;freq<sfb_lines;freq++) {
    6cc4:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    6cc8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6ccb:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    6cce:	0f 8c 0d ff ff ff    	jl     6be1 <III_reorder+0x2c3>
               for(window=0; window<3; window++)
    6cd4:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    6cd8:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    6cdc:	0f 8e f3 fe ff ff    	jle    6bd5 <III_reorder+0x2b7>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    6ce2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6ce6:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6ce9:	89 d0                	mov    %edx,%eax
    6ceb:	c1 e0 03             	shl    $0x3,%eax
    6cee:	01 d0                	add    %edx,%eax
    6cf0:	c1 e0 02             	shl    $0x2,%eax
    6cf3:	01 d0                	add    %edx,%eax
    6cf5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6cf8:	01 d0                	add    %edx,%eax
    6cfa:	83 c0 14             	add    $0x14,%eax
    6cfd:	8b 04 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%eax
    6d04:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    6d07:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6d0a:	8d 48 01             	lea    0x1(%eax),%ecx
    6d0d:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6d10:	89 d0                	mov    %edx,%eax
    6d12:	c1 e0 03             	shl    $0x3,%eax
    6d15:	01 d0                	add    %edx,%eax
    6d17:	c1 e0 02             	shl    $0x2,%eax
    6d1a:	01 d0                	add    %edx,%eax
    6d1c:	01 c8                	add    %ecx,%eax
    6d1e:	83 c0 14             	add    $0x14,%eax
    6d21:	8b 04 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%eax
    6d28:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6d2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    6d2e:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    6d32:	0f 8e 91 fe ff ff    	jle    6bc9 <III_reorder+0x2ab>
      if (gr_info->mixed_block_flag) {
    6d38:	eb 5c                	jmp    6d96 <III_reorder+0x478>
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    6d3a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6d41:	eb 4c                	jmp    6d8f <III_reorder+0x471>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    6d43:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6d4a:	eb 39                	jmp    6d85 <III_reorder+0x467>
            ro[sb][ss] = xr[sb][ss];
    6d4c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6d4f:	89 d0                	mov    %edx,%eax
    6d51:	c1 e0 03             	shl    $0x3,%eax
    6d54:	01 d0                	add    %edx,%eax
    6d56:	c1 e0 04             	shl    $0x4,%eax
    6d59:	89 c2                	mov    %eax,%edx
    6d5b:	8b 45 08             	mov    0x8(%ebp),%eax
    6d5e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    6d61:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6d64:	89 d0                	mov    %edx,%eax
    6d66:	c1 e0 03             	shl    $0x3,%eax
    6d69:	01 d0                	add    %edx,%eax
    6d6b:	c1 e0 04             	shl    $0x4,%eax
    6d6e:	89 c2                	mov    %eax,%edx
    6d70:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d73:	01 c2                	add    %eax,%edx
    6d75:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6d78:	dd 04 c1             	fldl   (%ecx,%eax,8)
    6d7b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6d7e:	dd 1c c2             	fstpl  (%edx,%eax,8)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    6d81:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    6d85:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    6d89:	7e c1                	jle    6d4c <III_reorder+0x42e>
      for (sb=0 ; sb < SBLIMIT ; sb++)
    6d8b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    6d8f:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    6d93:	7e ae                	jle    6d43 <III_reorder+0x425>
   }
}
    6d95:	90                   	nop
    6d96:	90                   	nop
    6d97:	83 c4 34             	add    $0x34,%esp
    6d9a:	5b                   	pop    %ebx
    6d9b:	5e                   	pop    %esi
    6d9c:	5f                   	pop    %edi
    6d9d:	5d                   	pop    %ebp
    6d9e:	c3                   	ret    

00006d9f <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    6d9f:	55                   	push   %ebp
    6da0:	89 e5                	mov    %esp,%ebp
    6da2:	57                   	push   %edi
    6da3:	56                   	push   %esi
    6da4:	53                   	push   %ebx
    6da5:	81 ec 5c 1b 00 00    	sub    $0x1b5c,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    6dab:	8b 45 18             	mov    0x18(%ebp),%eax
    6dae:	8b 00                	mov    (%eax),%eax
    6db0:	8b 40 10             	mov    0x10(%eax),%eax
    6db3:	89 45 b8             	mov    %eax,-0x48(%ebp)
   int stereo = fr_ps->stereo;
    6db6:	8b 45 18             	mov    0x18(%ebp),%eax
    6db9:	8b 40 08             	mov    0x8(%eax),%eax
    6dbc:	89 45 b4             	mov    %eax,-0x4c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6dbf:	8b 45 18             	mov    0x18(%ebp),%eax
    6dc2:	8b 00                	mov    (%eax),%eax
    6dc4:	8b 40 1c             	mov    0x1c(%eax),%eax
    6dc7:	83 f8 01             	cmp    $0x1,%eax
    6dca:	75 16                	jne    6de2 <III_stereo+0x43>
                   (fr_ps->header->mode_ext & 0x2);
    6dcc:	8b 45 18             	mov    0x18(%ebp),%eax
    6dcf:	8b 00                	mov    (%eax),%eax
    6dd1:	8b 40 20             	mov    0x20(%eax),%eax
    6dd4:	83 e0 02             	and    $0x2,%eax
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6dd7:	85 c0                	test   %eax,%eax
    6dd9:	74 07                	je     6de2 <III_stereo+0x43>
    6ddb:	b8 01 00 00 00       	mov    $0x1,%eax
    6de0:	eb 05                	jmp    6de7 <III_stereo+0x48>
    6de2:	b8 00 00 00 00       	mov    $0x0,%eax
    6de7:	89 45 b0             	mov    %eax,-0x50(%ebp)
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6dea:	8b 45 18             	mov    0x18(%ebp),%eax
    6ded:	8b 00                	mov    (%eax),%eax
    6def:	8b 40 1c             	mov    0x1c(%eax),%eax
    6df2:	83 f8 01             	cmp    $0x1,%eax
    6df5:	75 16                	jne    6e0d <III_stereo+0x6e>
                  (fr_ps->header->mode_ext & 0x1);
    6df7:	8b 45 18             	mov    0x18(%ebp),%eax
    6dfa:	8b 00                	mov    (%eax),%eax
    6dfc:	8b 40 20             	mov    0x20(%eax),%eax
    6dff:	83 e0 01             	and    $0x1,%eax
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6e02:	85 c0                	test   %eax,%eax
    6e04:	74 07                	je     6e0d <III_stereo+0x6e>
    6e06:	b8 01 00 00 00       	mov    $0x1,%eax
    6e0b:	eb 05                	jmp    6e12 <III_stereo+0x73>
    6e0d:	b8 00 00 00 00       	mov    $0x0,%eax
    6e12:	89 45 ac             	mov    %eax,-0x54(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    6e15:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6e1c:	eb 12                	jmp    6e30 <III_stereo+0x91>
      is_pos[i] = 7;
    6e1e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6e21:	c7 84 85 ac f6 ff ff 	movl   $0x7,-0x954(%ebp,%eax,4)
    6e28:	07 00 00 00 
   for ( i=0; i<576; i++ )
    6e2c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    6e30:	81 7d e0 3f 02 00 00 	cmpl   $0x23f,-0x20(%ebp)
    6e37:	7e e5                	jle    6e1e <III_stereo+0x7f>

   if ((stereo == 2) && i_stereo )
    6e39:	83 7d b4 02          	cmpl   $0x2,-0x4c(%ebp)
    6e3d:	0f 85 3c 0a 00 00    	jne    787f <III_stereo+0xae0>
    6e43:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
    6e47:	0f 84 32 0a 00 00    	je     787f <III_stereo+0xae0>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    6e4d:	8b 45 14             	mov    0x14(%ebp),%eax
    6e50:	8b 40 10             	mov    0x10(%eax),%eax
    6e53:	85 c0                	test   %eax,%eax
    6e55:	0f 84 29 08 00 00    	je     7684 <III_stereo+0x8e5>
    6e5b:	8b 45 14             	mov    0x14(%ebp),%eax
    6e5e:	8b 40 14             	mov    0x14(%eax),%eax
    6e61:	83 f8 02             	cmp    $0x2,%eax
    6e64:	0f 85 1a 08 00 00    	jne    7684 <III_stereo+0x8e5>
      {  if( gr_info->mixed_block_flag )
    6e6a:	8b 45 14             	mov    0x14(%ebp),%eax
    6e6d:	8b 40 18             	mov    0x18(%eax),%eax
    6e70:	85 c0                	test   %eax,%eax
    6e72:	0f 84 e1 04 00 00    	je     7359 <III_stereo+0x5ba>
         {  int max_sfb = 0;
    6e78:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)

            for ( j=0; j<3; j++ )
    6e7f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6e86:	e9 22 03 00 00       	jmp    71ad <III_stereo+0x40e>
            {  int sfbcnt;
               sfbcnt = 2;
    6e8b:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    6e92:	c7 45 e4 0c 00 00 00 	movl   $0xc,-0x1c(%ebp)
    6e99:	e9 15 01 00 00       	jmp    6fb3 <III_stereo+0x214>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    6e9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6ea1:	8d 48 01             	lea    0x1(%eax),%ecx
    6ea4:	8b 55 b8             	mov    -0x48(%ebp),%edx
    6ea7:	89 d0                	mov    %edx,%eax
    6ea9:	c1 e0 03             	shl    $0x3,%eax
    6eac:	01 d0                	add    %edx,%eax
    6eae:	c1 e0 02             	shl    $0x2,%eax
    6eb1:	01 d0                	add    %edx,%eax
    6eb3:	01 c8                	add    %ecx,%eax
    6eb5:	83 c0 14             	add    $0x14,%eax
    6eb8:	8b 0c 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%ecx
    6ebf:	8b 55 b8             	mov    -0x48(%ebp),%edx
    6ec2:	89 d0                	mov    %edx,%eax
    6ec4:	c1 e0 03             	shl    $0x3,%eax
    6ec7:	01 d0                	add    %edx,%eax
    6ec9:	c1 e0 02             	shl    $0x2,%eax
    6ecc:	01 d0                	add    %edx,%eax
    6ece:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    6ed1:	01 d0                	add    %edx,%eax
    6ed3:	83 c0 14             	add    $0x14,%eax
    6ed6:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    6edd:	89 c8                	mov    %ecx,%eax
    6edf:	29 d0                	sub    %edx,%eax
    6ee1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    6ee4:	8b 55 b8             	mov    -0x48(%ebp),%edx
    6ee7:	89 d0                	mov    %edx,%eax
    6ee9:	c1 e0 03             	shl    $0x3,%eax
    6eec:	01 d0                	add    %edx,%eax
    6eee:	c1 e0 02             	shl    $0x2,%eax
    6ef1:	01 d0                	add    %edx,%eax
    6ef3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    6ef6:	01 d0                	add    %edx,%eax
    6ef8:	83 c0 14             	add    $0x14,%eax
    6efb:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    6f02:	89 d0                	mov    %edx,%eax
    6f04:	01 c0                	add    %eax,%eax
    6f06:	01 c2                	add    %eax,%edx
    6f08:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6f0b:	83 c0 01             	add    $0x1,%eax
    6f0e:	0f af 45 c4          	imul   -0x3c(%ebp),%eax
    6f12:	01 d0                	add    %edx,%eax
    6f14:	83 e8 01             	sub    $0x1,%eax
    6f17:	89 45 e0             	mov    %eax,-0x20(%ebp)
                  while ( lines > 0 )
    6f1a:	e9 86 00 00 00       	jmp    6fa5 <III_stereo+0x206>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    6f1f:	8b 45 08             	mov    0x8(%ebp),%eax
    6f22:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    6f28:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    6f2b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6f30:	89 c8                	mov    %ecx,%eax
    6f32:	f7 ea                	imul   %edx
    6f34:	89 d0                	mov    %edx,%eax
    6f36:	c1 f8 02             	sar    $0x2,%eax
    6f39:	c1 f9 1f             	sar    $0x1f,%ecx
    6f3c:	89 ca                	mov    %ecx,%edx
    6f3e:	29 d0                	sub    %edx,%eax
    6f40:	89 c6                	mov    %eax,%esi
    6f42:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    6f45:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6f4a:	89 c8                	mov    %ecx,%eax
    6f4c:	f7 ea                	imul   %edx
    6f4e:	89 d0                	mov    %edx,%eax
    6f50:	c1 f8 02             	sar    $0x2,%eax
    6f53:	89 cf                	mov    %ecx,%edi
    6f55:	c1 ff 1f             	sar    $0x1f,%edi
    6f58:	29 f8                	sub    %edi,%eax
    6f5a:	89 c2                	mov    %eax,%edx
    6f5c:	89 d0                	mov    %edx,%eax
    6f5e:	c1 e0 03             	shl    $0x3,%eax
    6f61:	01 d0                	add    %edx,%eax
    6f63:	01 c0                	add    %eax,%eax
    6f65:	29 c1                	sub    %eax,%ecx
    6f67:	89 ca                	mov    %ecx,%edx
    6f69:	89 f0                	mov    %esi,%eax
    6f6b:	c1 e0 03             	shl    $0x3,%eax
    6f6e:	01 f0                	add    %esi,%eax
    6f70:	01 c0                	add    %eax,%eax
    6f72:	01 d0                	add    %edx,%eax
    6f74:	dd 04 c3             	fldl   (%ebx,%eax,8)
    6f77:	d9 ee                	fldz   
    6f79:	df e9                	fucomip %st(1),%st
    6f7b:	7a 0a                	jp     6f87 <III_stereo+0x1e8>
    6f7d:	d9 ee                	fldz   
    6f7f:	df f1                	fcomip %st(1),%st
    6f81:	dd d8                	fstp   %st(0)
    6f83:	74 18                	je     6f9d <III_stereo+0x1fe>
    6f85:	eb 02                	jmp    6f89 <III_stereo+0x1ea>
    6f87:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    6f89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6f8c:	89 45 c8             	mov    %eax,-0x38(%ebp)
                        sfb = -10;
    6f8f:	c7 45 e4 f6 ff ff ff 	movl   $0xfffffff6,-0x1c(%ebp)
                        lines = -10;
    6f96:	c7 45 c4 f6 ff ff ff 	movl   $0xfffffff6,-0x3c(%ebp)
                     }
                     lines--;
    6f9d:	83 6d c4 01          	subl   $0x1,-0x3c(%ebp)
                     i--;
    6fa1:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
                  while ( lines > 0 )
    6fa5:	83 7d c4 00          	cmpl   $0x0,-0x3c(%ebp)
    6fa9:	0f 8f 70 ff ff ff    	jg     6f1f <III_stereo+0x180>
               for( sfb=12; sfb >=3; sfb-- )
    6faf:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
    6fb3:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    6fb7:	0f 8f e1 fe ff ff    	jg     6e9e <III_stereo+0xff>
                  }
               }
               sfb = sfbcnt + 1;
    6fbd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    6fc0:	83 c0 01             	add    $0x1,%eax
    6fc3:	89 45 e4             	mov    %eax,-0x1c(%ebp)

               if ( sfb > max_sfb )
    6fc6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6fc9:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    6fcc:	0f 8e 05 01 00 00    	jle    70d7 <III_stereo+0x338>
                  max_sfb = sfb;
    6fd2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6fd5:	89 45 cc             	mov    %eax,-0x34(%ebp)

               while( sfb<12 )
    6fd8:	e9 fa 00 00 00       	jmp    70d7 <III_stereo+0x338>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    6fdd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6fe0:	8d 48 01             	lea    0x1(%eax),%ecx
    6fe3:	8b 55 b8             	mov    -0x48(%ebp),%edx
    6fe6:	89 d0                	mov    %edx,%eax
    6fe8:	c1 e0 03             	shl    $0x3,%eax
    6feb:	01 d0                	add    %edx,%eax
    6fed:	c1 e0 02             	shl    $0x2,%eax
    6ff0:	01 d0                	add    %edx,%eax
    6ff2:	01 c8                	add    %ecx,%eax
    6ff4:	83 c0 14             	add    $0x14,%eax
    6ff7:	8b 0c 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%ecx
    6ffe:	8b 55 b8             	mov    -0x48(%ebp),%edx
    7001:	89 d0                	mov    %edx,%eax
    7003:	c1 e0 03             	shl    $0x3,%eax
    7006:	01 d0                	add    %edx,%eax
    7008:	c1 e0 02             	shl    $0x2,%eax
    700b:	01 d0                	add    %edx,%eax
    700d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7010:	01 d0                	add    %edx,%eax
    7012:	83 c0 14             	add    $0x14,%eax
    7015:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    701c:	89 c8                	mov    %ecx,%eax
    701e:	29 d0                	sub    %edx,%eax
    7020:	89 45 d8             	mov    %eax,-0x28(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    7023:	8b 55 b8             	mov    -0x48(%ebp),%edx
    7026:	89 d0                	mov    %edx,%eax
    7028:	c1 e0 03             	shl    $0x3,%eax
    702b:	01 d0                	add    %edx,%eax
    702d:	c1 e0 02             	shl    $0x2,%eax
    7030:	01 d0                	add    %edx,%eax
    7032:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7035:	01 d0                	add    %edx,%eax
    7037:	83 c0 14             	add    $0x14,%eax
    703a:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    7041:	89 d0                	mov    %edx,%eax
    7043:	01 c0                	add    %eax,%eax
    7045:	01 c2                	add    %eax,%edx
    7047:	8b 45 dc             	mov    -0x24(%ebp),%eax
    704a:	0f af 45 d8          	imul   -0x28(%ebp),%eax
    704e:	01 d0                	add    %edx,%eax
    7050:	89 45 e0             	mov    %eax,-0x20(%ebp)
                  for ( ; sb > 0; sb--)
    7053:	eb 78                	jmp    70cd <III_stereo+0x32e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    7055:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7058:	8b 55 dc             	mov    -0x24(%ebp),%edx
    705b:	89 d0                	mov    %edx,%eax
    705d:	01 c0                	add    %eax,%eax
    705f:	01 d0                	add    %edx,%eax
    7061:	c1 e0 02             	shl    $0x2,%eax
    7064:	01 d0                	add    %edx,%eax
    7066:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7069:	01 d0                	add    %edx,%eax
    706b:	83 c0 52             	add    $0x52,%eax
    706e:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    7072:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7075:	89 94 85 ac f6 ff ff 	mov    %edx,-0x954(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    707c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    707f:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    7086:	83 f8 07             	cmp    $0x7,%eax
    7089:	74 3a                	je     70c5 <III_stereo+0x326>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    708b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    708e:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    7095:	89 85 a4 e4 ff ff    	mov    %eax,-0x1b5c(%ebp)
    709b:	db 85 a4 e4 ff ff    	fildl  -0x1b5c(%ebp)
    70a1:	dd 05 40 b4 00 00    	fldl   0xb440
    70a7:	de c9                	fmulp  %st,%st(1)
    70a9:	83 ec 08             	sub    $0x8,%esp
    70ac:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    70b0:	dd 1c 24             	fstpl  (%esp)
    70b3:	e8 83 b9 ff ff       	call   2a3b <tan>
    70b8:	83 c4 10             	add    $0x10,%esp
    70bb:	8b 45 e0             	mov    -0x20(%ebp),%eax
    70be:	dd 9c c5 a8 e4 ff ff 	fstpl  -0x1b58(%ebp,%eax,8)
                     i++;
    70c5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
                  for ( ; sb > 0; sb--)
    70c9:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
    70cd:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    70d1:	7f 82                	jg     7055 <III_stereo+0x2b6>
                  }
                  sfb++;
    70d3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
               while( sfb<12 )
    70d7:	83 7d e4 0b          	cmpl   $0xb,-0x1c(%ebp)
    70db:	0f 8e fc fe ff ff    	jle    6fdd <III_stereo+0x23e>
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    70e1:	8b 45 b8             	mov    -0x48(%ebp),%eax
    70e4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    70ea:	05 68 c6 00 00       	add    $0xc668,%eax
    70ef:	8b 00                	mov    (%eax),%eax
    70f1:	8b 55 b8             	mov    -0x48(%ebp),%edx
    70f4:	69 d2 94 00 00 00    	imul   $0x94,%edx,%edx
    70fa:	81 c2 64 c6 00 00    	add    $0xc664,%edx
    7100:	8b 12                	mov    (%edx),%edx
    7102:	29 d0                	sub    %edx,%eax
    7104:	89 45 d8             	mov    %eax,-0x28(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    7107:	8b 45 b8             	mov    -0x48(%ebp),%eax
    710a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7110:	05 64 c6 00 00       	add    $0xc664,%eax
    7115:	8b 10                	mov    (%eax),%edx
    7117:	89 d0                	mov    %edx,%eax
    7119:	01 c0                	add    %eax,%eax
    711b:	01 c2                	add    %eax,%edx
    711d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7120:	0f af 45 d8          	imul   -0x28(%ebp),%eax
    7124:	01 d0                	add    %edx,%eax
    7126:	89 45 e4             	mov    %eax,-0x1c(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    7129:	8b 45 b8             	mov    -0x48(%ebp),%eax
    712c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7132:	05 6c c6 00 00       	add    $0xc66c,%eax
    7137:	8b 00                	mov    (%eax),%eax
    7139:	8b 55 b8             	mov    -0x48(%ebp),%edx
    713c:	69 d2 94 00 00 00    	imul   $0x94,%edx,%edx
    7142:	81 c2 68 c6 00 00    	add    $0xc668,%edx
    7148:	8b 12                	mov    (%edx),%edx
    714a:	29 d0                	sub    %edx,%eax
    714c:	89 45 d8             	mov    %eax,-0x28(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    714f:	8b 45 b8             	mov    -0x48(%ebp),%eax
    7152:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7158:	05 68 c6 00 00       	add    $0xc668,%eax
    715d:	8b 10                	mov    (%eax),%edx
    715f:	89 d0                	mov    %edx,%eax
    7161:	01 c0                	add    %eax,%eax
    7163:	01 c2                	add    %eax,%edx
    7165:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7168:	0f af 45 d8          	imul   -0x28(%ebp),%eax
    716c:	01 d0                	add    %edx,%eax
    716e:	89 45 e0             	mov    %eax,-0x20(%ebp)
               for ( ; sb > 0; sb-- )
    7171:	eb 30                	jmp    71a3 <III_stereo+0x404>
               {  is_pos[i] = is_pos[sfb];
    7173:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7176:	8b 94 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%edx
    717d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7180:	89 94 85 ac f6 ff ff 	mov    %edx,-0x954(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    7187:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    718a:	dd 84 c5 a8 e4 ff ff 	fldl   -0x1b58(%ebp,%eax,8)
    7191:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7194:	dd 9c c5 a8 e4 ff ff 	fstpl  -0x1b58(%ebp,%eax,8)
                  i++;
    719b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
               for ( ; sb > 0; sb-- )
    719f:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
    71a3:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    71a7:	7f ca                	jg     7173 <III_stereo+0x3d4>
            for ( j=0; j<3; j++ )
    71a9:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    71ad:	83 7d dc 02          	cmpl   $0x2,-0x24(%ebp)
    71b1:	0f 8e d4 fc ff ff    	jle    6e8b <III_stereo+0xec>
               }
             }
             if ( max_sfb <= 3 )
    71b7:	83 7d cc 03          	cmpl   $0x3,-0x34(%ebp)
    71bb:	0f 8f bd 06 00 00    	jg     787e <III_stereo+0xadf>
             {  i = 2;
    71c1:	c7 45 e0 02 00 00 00 	movl   $0x2,-0x20(%ebp)
                ss = 17;
    71c8:	c7 45 d4 11 00 00 00 	movl   $0x11,-0x2c(%ebp)
                sb = -1;
    71cf:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
                while ( i >= 0 )
    71d6:	eb 63                	jmp    723b <III_stereo+0x49c>
                {  if ( xr[1][i][ss] != 0.0 )
    71d8:	8b 45 08             	mov    0x8(%ebp),%eax
    71db:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    71e1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    71e4:	89 d0                	mov    %edx,%eax
    71e6:	c1 e0 03             	shl    $0x3,%eax
    71e9:	01 d0                	add    %edx,%eax
    71eb:	01 c0                	add    %eax,%eax
    71ed:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    71f0:	01 d0                	add    %edx,%eax
    71f2:	dd 04 c1             	fldl   (%ecx,%eax,8)
    71f5:	d9 ee                	fldz   
    71f7:	df e9                	fucomip %st(1),%st
    71f9:	7a 0a                	jp     7205 <III_stereo+0x466>
    71fb:	d9 ee                	fldz   
    71fd:	df f1                	fcomip %st(1),%st
    71ff:	dd d8                	fstp   %st(0)
    7201:	74 23                	je     7226 <III_stereo+0x487>
    7203:	eb 02                	jmp    7207 <III_stereo+0x468>
    7205:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    7207:	8b 55 e0             	mov    -0x20(%ebp),%edx
    720a:	89 d0                	mov    %edx,%eax
    720c:	c1 e0 03             	shl    $0x3,%eax
    720f:	01 d0                	add    %edx,%eax
    7211:	01 c0                	add    %eax,%eax
    7213:	89 c2                	mov    %eax,%edx
    7215:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7218:	01 d0                	add    %edx,%eax
    721a:	89 45 d8             	mov    %eax,-0x28(%ebp)
                      i = -1;
    721d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
    7224:	eb 15                	jmp    723b <III_stereo+0x49c>
                   } else
                   {  ss--;
    7226:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                      if ( ss < 0 )
    722a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    722e:	79 0b                	jns    723b <III_stereo+0x49c>
                      {  i--;
    7230:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
                         ss = 17;
    7234:	c7 45 d4 11 00 00 00 	movl   $0x11,-0x2c(%ebp)
                while ( i >= 0 )
    723b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    723f:	79 97                	jns    71d8 <III_stereo+0x439>
                      }
                   }
                }
                i = 0;
    7241:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    7248:	eb 04                	jmp    724e <III_stereo+0x4af>
                   i++;
    724a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    724e:	8b 55 b8             	mov    -0x48(%ebp),%edx
    7251:	89 d0                	mov    %edx,%eax
    7253:	c1 e0 03             	shl    $0x3,%eax
    7256:	01 d0                	add    %edx,%eax
    7258:	c1 e0 02             	shl    $0x2,%eax
    725b:	01 d0                	add    %edx,%eax
    725d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7260:	01 d0                	add    %edx,%eax
    7262:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    7269:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    726c:	7d dc                	jge    724a <III_stereo+0x4ab>
                sfb = i;
    726e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7271:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                i = sfBandIndex[sfreq].l[i];
    7274:	8b 55 b8             	mov    -0x48(%ebp),%edx
    7277:	89 d0                	mov    %edx,%eax
    7279:	c1 e0 03             	shl    $0x3,%eax
    727c:	01 d0                	add    %edx,%eax
    727e:	c1 e0 02             	shl    $0x2,%eax
    7281:	01 d0                	add    %edx,%eax
    7283:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7286:	01 d0                	add    %edx,%eax
    7288:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    728f:	89 45 e0             	mov    %eax,-0x20(%ebp)
                for ( ; sfb<8; sfb++ )
    7292:	e9 b3 00 00 00       	jmp    734a <III_stereo+0x5ab>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    7297:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    729a:	8d 48 01             	lea    0x1(%eax),%ecx
    729d:	8b 55 b8             	mov    -0x48(%ebp),%edx
    72a0:	89 d0                	mov    %edx,%eax
    72a2:	c1 e0 03             	shl    $0x3,%eax
    72a5:	01 d0                	add    %edx,%eax
    72a7:	c1 e0 02             	shl    $0x2,%eax
    72aa:	01 d0                	add    %edx,%eax
    72ac:	01 c8                	add    %ecx,%eax
    72ae:	8b 0c 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%ecx
    72b5:	8b 55 b8             	mov    -0x48(%ebp),%edx
    72b8:	89 d0                	mov    %edx,%eax
    72ba:	c1 e0 03             	shl    $0x3,%eax
    72bd:	01 d0                	add    %edx,%eax
    72bf:	c1 e0 02             	shl    $0x2,%eax
    72c2:	01 d0                	add    %edx,%eax
    72c4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    72c7:	01 d0                	add    %edx,%eax
    72c9:	8b 14 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%edx
    72d0:	89 c8                	mov    %ecx,%eax
    72d2:	29 d0                	sub    %edx,%eax
    72d4:	89 45 d8             	mov    %eax,-0x28(%ebp)
                   for ( ; sb > 0; sb--)
    72d7:	eb 67                	jmp    7340 <III_stereo+0x5a1>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    72d9:	8b 45 10             	mov    0x10(%ebp),%eax
    72dc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    72df:	83 c2 3e             	add    $0x3e,%edx
    72e2:	8b 14 90             	mov    (%eax,%edx,4),%edx
    72e5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    72e8:	89 94 85 ac f6 ff ff 	mov    %edx,-0x954(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    72ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
    72f2:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    72f9:	83 f8 07             	cmp    $0x7,%eax
    72fc:	74 3a                	je     7338 <III_stereo+0x599>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    72fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7301:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    7308:	89 85 a4 e4 ff ff    	mov    %eax,-0x1b5c(%ebp)
    730e:	db 85 a4 e4 ff ff    	fildl  -0x1b5c(%ebp)
    7314:	dd 05 40 b4 00 00    	fldl   0xb440
    731a:	de c9                	fmulp  %st,%st(1)
    731c:	83 ec 08             	sub    $0x8,%esp
    731f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7323:	dd 1c 24             	fstpl  (%esp)
    7326:	e8 10 b7 ff ff       	call   2a3b <tan>
    732b:	83 c4 10             	add    $0x10,%esp
    732e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7331:	dd 9c c5 a8 e4 ff ff 	fstpl  -0x1b58(%ebp,%eax,8)
                      i++;
    7338:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
                   for ( ; sb > 0; sb--)
    733c:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
    7340:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    7344:	7f 93                	jg     72d9 <III_stereo+0x53a>
                for ( ; sfb<8; sfb++ )
    7346:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    734a:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
    734e:	0f 8e 43 ff ff ff    	jle    7297 <III_stereo+0x4f8>
      {  if( gr_info->mixed_block_flag )
    7354:	e9 25 05 00 00       	jmp    787e <III_stereo+0xadf>
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    7359:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    7360:	e9 10 03 00 00       	jmp    7675 <III_stereo+0x8d6>
            {  int sfbcnt;
               sfbcnt = -1;
    7365:	c7 45 c0 ff ff ff ff 	movl   $0xffffffff,-0x40(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    736c:	c7 45 e4 0c 00 00 00 	movl   $0xc,-0x1c(%ebp)
    7373:	e9 15 01 00 00       	jmp    748d <III_stereo+0x6ee>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    7378:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    737b:	8d 48 01             	lea    0x1(%eax),%ecx
    737e:	8b 55 b8             	mov    -0x48(%ebp),%edx
    7381:	89 d0                	mov    %edx,%eax
    7383:	c1 e0 03             	shl    $0x3,%eax
    7386:	01 d0                	add    %edx,%eax
    7388:	c1 e0 02             	shl    $0x2,%eax
    738b:	01 d0                	add    %edx,%eax
    738d:	01 c8                	add    %ecx,%eax
    738f:	83 c0 14             	add    $0x14,%eax
    7392:	8b 0c 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%ecx
    7399:	8b 55 b8             	mov    -0x48(%ebp),%edx
    739c:	89 d0                	mov    %edx,%eax
    739e:	c1 e0 03             	shl    $0x3,%eax
    73a1:	01 d0                	add    %edx,%eax
    73a3:	c1 e0 02             	shl    $0x2,%eax
    73a6:	01 d0                	add    %edx,%eax
    73a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    73ab:	01 d0                	add    %edx,%eax
    73ad:	83 c0 14             	add    $0x14,%eax
    73b0:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    73b7:	89 c8                	mov    %ecx,%eax
    73b9:	29 d0                	sub    %edx,%eax
    73bb:	89 45 bc             	mov    %eax,-0x44(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    73be:	8b 55 b8             	mov    -0x48(%ebp),%edx
    73c1:	89 d0                	mov    %edx,%eax
    73c3:	c1 e0 03             	shl    $0x3,%eax
    73c6:	01 d0                	add    %edx,%eax
    73c8:	c1 e0 02             	shl    $0x2,%eax
    73cb:	01 d0                	add    %edx,%eax
    73cd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    73d0:	01 d0                	add    %edx,%eax
    73d2:	83 c0 14             	add    $0x14,%eax
    73d5:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    73dc:	89 d0                	mov    %edx,%eax
    73de:	01 c0                	add    %eax,%eax
    73e0:	01 c2                	add    %eax,%edx
    73e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    73e5:	83 c0 01             	add    $0x1,%eax
    73e8:	0f af 45 bc          	imul   -0x44(%ebp),%eax
    73ec:	01 d0                	add    %edx,%eax
    73ee:	83 e8 01             	sub    $0x1,%eax
    73f1:	89 45 e0             	mov    %eax,-0x20(%ebp)
                  while ( lines > 0 )
    73f4:	e9 86 00 00 00       	jmp    747f <III_stereo+0x6e0>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    73f9:	8b 45 08             	mov    0x8(%ebp),%eax
    73fc:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    7402:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    7405:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    740a:	89 c8                	mov    %ecx,%eax
    740c:	f7 ea                	imul   %edx
    740e:	89 d0                	mov    %edx,%eax
    7410:	c1 f8 02             	sar    $0x2,%eax
    7413:	c1 f9 1f             	sar    $0x1f,%ecx
    7416:	89 ca                	mov    %ecx,%edx
    7418:	29 d0                	sub    %edx,%eax
    741a:	89 c6                	mov    %eax,%esi
    741c:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    741f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7424:	89 c8                	mov    %ecx,%eax
    7426:	f7 ea                	imul   %edx
    7428:	89 d0                	mov    %edx,%eax
    742a:	c1 f8 02             	sar    $0x2,%eax
    742d:	89 cf                	mov    %ecx,%edi
    742f:	c1 ff 1f             	sar    $0x1f,%edi
    7432:	29 f8                	sub    %edi,%eax
    7434:	89 c2                	mov    %eax,%edx
    7436:	89 d0                	mov    %edx,%eax
    7438:	c1 e0 03             	shl    $0x3,%eax
    743b:	01 d0                	add    %edx,%eax
    743d:	01 c0                	add    %eax,%eax
    743f:	29 c1                	sub    %eax,%ecx
    7441:	89 ca                	mov    %ecx,%edx
    7443:	89 f0                	mov    %esi,%eax
    7445:	c1 e0 03             	shl    $0x3,%eax
    7448:	01 f0                	add    %esi,%eax
    744a:	01 c0                	add    %eax,%eax
    744c:	01 d0                	add    %edx,%eax
    744e:	dd 04 c3             	fldl   (%ebx,%eax,8)
    7451:	d9 ee                	fldz   
    7453:	df e9                	fucomip %st(1),%st
    7455:	7a 0a                	jp     7461 <III_stereo+0x6c2>
    7457:	d9 ee                	fldz   
    7459:	df f1                	fcomip %st(1),%st
    745b:	dd d8                	fstp   %st(0)
    745d:	74 18                	je     7477 <III_stereo+0x6d8>
    745f:	eb 02                	jmp    7463 <III_stereo+0x6c4>
    7461:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    7463:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7466:	89 45 c0             	mov    %eax,-0x40(%ebp)
                        sfb = -10;
    7469:	c7 45 e4 f6 ff ff ff 	movl   $0xfffffff6,-0x1c(%ebp)
                        lines = -10;
    7470:	c7 45 bc f6 ff ff ff 	movl   $0xfffffff6,-0x44(%ebp)
                     }
                     lines--;
    7477:	83 6d bc 01          	subl   $0x1,-0x44(%ebp)
                     i--;
    747b:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
                  while ( lines > 0 )
    747f:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    7483:	0f 8f 70 ff ff ff    	jg     73f9 <III_stereo+0x65a>
               for( sfb=12; sfb >=0; sfb-- )
    7489:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
    748d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    7491:	0f 89 e1 fe ff ff    	jns    7378 <III_stereo+0x5d9>
                  }
               }
               sfb = sfbcnt + 1;
    7497:	8b 45 c0             	mov    -0x40(%ebp),%eax
    749a:	83 c0 01             	add    $0x1,%eax
    749d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
               while( sfb<12 )
    74a0:	e9 fa 00 00 00       	jmp    759f <III_stereo+0x800>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    74a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    74a8:	8d 48 01             	lea    0x1(%eax),%ecx
    74ab:	8b 55 b8             	mov    -0x48(%ebp),%edx
    74ae:	89 d0                	mov    %edx,%eax
    74b0:	c1 e0 03             	shl    $0x3,%eax
    74b3:	01 d0                	add    %edx,%eax
    74b5:	c1 e0 02             	shl    $0x2,%eax
    74b8:	01 d0                	add    %edx,%eax
    74ba:	01 c8                	add    %ecx,%eax
    74bc:	83 c0 14             	add    $0x14,%eax
    74bf:	8b 0c 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%ecx
    74c6:	8b 55 b8             	mov    -0x48(%ebp),%edx
    74c9:	89 d0                	mov    %edx,%eax
    74cb:	c1 e0 03             	shl    $0x3,%eax
    74ce:	01 d0                	add    %edx,%eax
    74d0:	c1 e0 02             	shl    $0x2,%eax
    74d3:	01 d0                	add    %edx,%eax
    74d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    74d8:	01 d0                	add    %edx,%eax
    74da:	83 c0 14             	add    $0x14,%eax
    74dd:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    74e4:	89 c8                	mov    %ecx,%eax
    74e6:	29 d0                	sub    %edx,%eax
    74e8:	89 45 d8             	mov    %eax,-0x28(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    74eb:	8b 55 b8             	mov    -0x48(%ebp),%edx
    74ee:	89 d0                	mov    %edx,%eax
    74f0:	c1 e0 03             	shl    $0x3,%eax
    74f3:	01 d0                	add    %edx,%eax
    74f5:	c1 e0 02             	shl    $0x2,%eax
    74f8:	01 d0                	add    %edx,%eax
    74fa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    74fd:	01 d0                	add    %edx,%eax
    74ff:	83 c0 14             	add    $0x14,%eax
    7502:	8b 14 85 ec c5 00 00 	mov    0xc5ec(,%eax,4),%edx
    7509:	89 d0                	mov    %edx,%eax
    750b:	01 c0                	add    %eax,%eax
    750d:	01 c2                	add    %eax,%edx
    750f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7512:	0f af 45 d8          	imul   -0x28(%ebp),%eax
    7516:	01 d0                	add    %edx,%eax
    7518:	89 45 e0             	mov    %eax,-0x20(%ebp)
                  for ( ; sb > 0; sb--)
    751b:	eb 78                	jmp    7595 <III_stereo+0x7f6>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    751d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7520:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7523:	89 d0                	mov    %edx,%eax
    7525:	01 c0                	add    %eax,%eax
    7527:	01 d0                	add    %edx,%eax
    7529:	c1 e0 02             	shl    $0x2,%eax
    752c:	01 d0                	add    %edx,%eax
    752e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7531:	01 d0                	add    %edx,%eax
    7533:	83 c0 52             	add    $0x52,%eax
    7536:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    753a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    753d:	89 94 85 ac f6 ff ff 	mov    %edx,-0x954(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    7544:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7547:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    754e:	83 f8 07             	cmp    $0x7,%eax
    7551:	74 3a                	je     758d <III_stereo+0x7ee>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    7553:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7556:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    755d:	89 85 a4 e4 ff ff    	mov    %eax,-0x1b5c(%ebp)
    7563:	db 85 a4 e4 ff ff    	fildl  -0x1b5c(%ebp)
    7569:	dd 05 40 b4 00 00    	fldl   0xb440
    756f:	de c9                	fmulp  %st,%st(1)
    7571:	83 ec 08             	sub    $0x8,%esp
    7574:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7578:	dd 1c 24             	fstpl  (%esp)
    757b:	e8 bb b4 ff ff       	call   2a3b <tan>
    7580:	83 c4 10             	add    $0x10,%esp
    7583:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7586:	dd 9c c5 a8 e4 ff ff 	fstpl  -0x1b58(%ebp,%eax,8)
                     i++;
    758d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
                  for ( ; sb > 0; sb--)
    7591:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
    7595:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    7599:	7f 82                	jg     751d <III_stereo+0x77e>
                  }
                  sfb++;
    759b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
               while( sfb<12 )
    759f:	83 7d e4 0b          	cmpl   $0xb,-0x1c(%ebp)
    75a3:	0f 8e fc fe ff ff    	jle    74a5 <III_stereo+0x706>
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    75a9:	8b 45 b8             	mov    -0x48(%ebp),%eax
    75ac:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    75b2:	05 68 c6 00 00       	add    $0xc668,%eax
    75b7:	8b 00                	mov    (%eax),%eax
    75b9:	8b 55 b8             	mov    -0x48(%ebp),%edx
    75bc:	69 d2 94 00 00 00    	imul   $0x94,%edx,%edx
    75c2:	81 c2 64 c6 00 00    	add    $0xc664,%edx
    75c8:	8b 12                	mov    (%edx),%edx
    75ca:	29 d0                	sub    %edx,%eax
    75cc:	89 45 d8             	mov    %eax,-0x28(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    75cf:	8b 45 b8             	mov    -0x48(%ebp),%eax
    75d2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    75d8:	05 64 c6 00 00       	add    $0xc664,%eax
    75dd:	8b 10                	mov    (%eax),%edx
    75df:	89 d0                	mov    %edx,%eax
    75e1:	01 c0                	add    %eax,%eax
    75e3:	01 c2                	add    %eax,%edx
    75e5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    75e8:	0f af 45 d8          	imul   -0x28(%ebp),%eax
    75ec:	01 d0                	add    %edx,%eax
    75ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    75f1:	8b 45 b8             	mov    -0x48(%ebp),%eax
    75f4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    75fa:	05 6c c6 00 00       	add    $0xc66c,%eax
    75ff:	8b 00                	mov    (%eax),%eax
    7601:	8b 55 b8             	mov    -0x48(%ebp),%edx
    7604:	69 d2 94 00 00 00    	imul   $0x94,%edx,%edx
    760a:	81 c2 68 c6 00 00    	add    $0xc668,%edx
    7610:	8b 12                	mov    (%edx),%edx
    7612:	29 d0                	sub    %edx,%eax
    7614:	89 45 d8             	mov    %eax,-0x28(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    7617:	8b 45 b8             	mov    -0x48(%ebp),%eax
    761a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7620:	05 68 c6 00 00       	add    $0xc668,%eax
    7625:	8b 10                	mov    (%eax),%edx
    7627:	89 d0                	mov    %edx,%eax
    7629:	01 c0                	add    %eax,%eax
    762b:	01 c2                	add    %eax,%edx
    762d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7630:	0f af 45 d8          	imul   -0x28(%ebp),%eax
    7634:	01 d0                	add    %edx,%eax
    7636:	89 45 e0             	mov    %eax,-0x20(%ebp)
               for ( ; sb > 0; sb-- )
    7639:	eb 30                	jmp    766b <III_stereo+0x8cc>
               {  is_pos[i] = is_pos[sfb];
    763b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    763e:	8b 94 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%edx
    7645:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7648:	89 94 85 ac f6 ff ff 	mov    %edx,-0x954(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    764f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7652:	dd 84 c5 a8 e4 ff ff 	fldl   -0x1b58(%ebp,%eax,8)
    7659:	8b 45 e0             	mov    -0x20(%ebp),%eax
    765c:	dd 9c c5 a8 e4 ff ff 	fstpl  -0x1b58(%ebp,%eax,8)
                  i++;
    7663:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
               for ( ; sb > 0; sb-- )
    7667:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
    766b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    766f:	7f ca                	jg     763b <III_stereo+0x89c>
         {  for ( j=0; j<3; j++ )
    7671:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    7675:	83 7d dc 02          	cmpl   $0x2,-0x24(%ebp)
    7679:	0f 8e e6 fc ff ff    	jle    7365 <III_stereo+0x5c6>
      {  if( gr_info->mixed_block_flag )
    767f:	e9 fa 01 00 00       	jmp    787e <III_stereo+0xadf>
               }
            }
         }
      } else
      {  i = 31;
    7684:	c7 45 e0 1f 00 00 00 	movl   $0x1f,-0x20(%ebp)
         ss = 17;
    768b:	c7 45 d4 11 00 00 00 	movl   $0x11,-0x2c(%ebp)
         sb = 0;
    7692:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
         while ( i >= 0 )
    7699:	eb 63                	jmp    76fe <III_stereo+0x95f>
         {  if ( xr[1][i][ss] != 0.0 )
    769b:	8b 45 08             	mov    0x8(%ebp),%eax
    769e:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    76a4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    76a7:	89 d0                	mov    %edx,%eax
    76a9:	c1 e0 03             	shl    $0x3,%eax
    76ac:	01 d0                	add    %edx,%eax
    76ae:	01 c0                	add    %eax,%eax
    76b0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    76b3:	01 d0                	add    %edx,%eax
    76b5:	dd 04 c1             	fldl   (%ecx,%eax,8)
    76b8:	d9 ee                	fldz   
    76ba:	df e9                	fucomip %st(1),%st
    76bc:	7a 0a                	jp     76c8 <III_stereo+0x929>
    76be:	d9 ee                	fldz   
    76c0:	df f1                	fcomip %st(1),%st
    76c2:	dd d8                	fstp   %st(0)
    76c4:	74 23                	je     76e9 <III_stereo+0x94a>
    76c6:	eb 02                	jmp    76ca <III_stereo+0x92b>
    76c8:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    76ca:	8b 55 e0             	mov    -0x20(%ebp),%edx
    76cd:	89 d0                	mov    %edx,%eax
    76cf:	c1 e0 03             	shl    $0x3,%eax
    76d2:	01 d0                	add    %edx,%eax
    76d4:	01 c0                	add    %eax,%eax
    76d6:	89 c2                	mov    %eax,%edx
    76d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    76db:	01 d0                	add    %edx,%eax
    76dd:	89 45 d8             	mov    %eax,-0x28(%ebp)
               i = -1;
    76e0:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
    76e7:	eb 15                	jmp    76fe <III_stereo+0x95f>
            } else
            {  ss--;
    76e9:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
               if ( ss < 0 )
    76ed:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    76f1:	79 0b                	jns    76fe <III_stereo+0x95f>
               {  i--;
    76f3:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
                  ss = 17;
    76f7:	c7 45 d4 11 00 00 00 	movl   $0x11,-0x2c(%ebp)
         while ( i >= 0 )
    76fe:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    7702:	79 97                	jns    769b <III_stereo+0x8fc>
               }
            }
         }
         i = 0;
    7704:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    770b:	eb 04                	jmp    7711 <III_stereo+0x972>
            i++;
    770d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    7711:	8b 55 b8             	mov    -0x48(%ebp),%edx
    7714:	89 d0                	mov    %edx,%eax
    7716:	c1 e0 03             	shl    $0x3,%eax
    7719:	01 d0                	add    %edx,%eax
    771b:	c1 e0 02             	shl    $0x2,%eax
    771e:	01 d0                	add    %edx,%eax
    7720:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7723:	01 d0                	add    %edx,%eax
    7725:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    772c:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    772f:	7d dc                	jge    770d <III_stereo+0x96e>
         sfb = i;
    7731:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
         i = sfBandIndex[sfreq].l[i];
    7737:	8b 55 b8             	mov    -0x48(%ebp),%edx
    773a:	89 d0                	mov    %edx,%eax
    773c:	c1 e0 03             	shl    $0x3,%eax
    773f:	01 d0                	add    %edx,%eax
    7741:	c1 e0 02             	shl    $0x2,%eax
    7744:	01 d0                	add    %edx,%eax
    7746:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7749:	01 d0                	add    %edx,%eax
    774b:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    7752:	89 45 e0             	mov    %eax,-0x20(%ebp)
         for ( ; sfb<21; sfb++ )
    7755:	e9 b3 00 00 00       	jmp    780d <III_stereo+0xa6e>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    775a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    775d:	8d 48 01             	lea    0x1(%eax),%ecx
    7760:	8b 55 b8             	mov    -0x48(%ebp),%edx
    7763:	89 d0                	mov    %edx,%eax
    7765:	c1 e0 03             	shl    $0x3,%eax
    7768:	01 d0                	add    %edx,%eax
    776a:	c1 e0 02             	shl    $0x2,%eax
    776d:	01 d0                	add    %edx,%eax
    776f:	01 c8                	add    %ecx,%eax
    7771:	8b 0c 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%ecx
    7778:	8b 55 b8             	mov    -0x48(%ebp),%edx
    777b:	89 d0                	mov    %edx,%eax
    777d:	c1 e0 03             	shl    $0x3,%eax
    7780:	01 d0                	add    %edx,%eax
    7782:	c1 e0 02             	shl    $0x2,%eax
    7785:	01 d0                	add    %edx,%eax
    7787:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    778a:	01 d0                	add    %edx,%eax
    778c:	8b 14 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%edx
    7793:	89 c8                	mov    %ecx,%eax
    7795:	29 d0                	sub    %edx,%eax
    7797:	89 45 d8             	mov    %eax,-0x28(%ebp)
            for ( ; sb > 0; sb--)
    779a:	eb 67                	jmp    7803 <III_stereo+0xa64>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    779c:	8b 45 10             	mov    0x10(%ebp),%eax
    779f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    77a2:	83 c2 3e             	add    $0x3e,%edx
    77a5:	8b 14 90             	mov    (%eax,%edx,4),%edx
    77a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    77ab:	89 94 85 ac f6 ff ff 	mov    %edx,-0x954(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    77b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    77b5:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    77bc:	83 f8 07             	cmp    $0x7,%eax
    77bf:	74 3a                	je     77fb <III_stereo+0xa5c>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    77c1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    77c4:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    77cb:	89 85 a4 e4 ff ff    	mov    %eax,-0x1b5c(%ebp)
    77d1:	db 85 a4 e4 ff ff    	fildl  -0x1b5c(%ebp)
    77d7:	dd 05 40 b4 00 00    	fldl   0xb440
    77dd:	de c9                	fmulp  %st,%st(1)
    77df:	83 ec 08             	sub    $0x8,%esp
    77e2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    77e6:	dd 1c 24             	fstpl  (%esp)
    77e9:	e8 4d b2 ff ff       	call   2a3b <tan>
    77ee:	83 c4 10             	add    $0x10,%esp
    77f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    77f4:	dd 9c c5 a8 e4 ff ff 	fstpl  -0x1b58(%ebp,%eax,8)
               i++;
    77fb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            for ( ; sb > 0; sb--)
    77ff:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
    7803:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    7807:	7f 93                	jg     779c <III_stereo+0x9fd>
         for ( ; sfb<21; sfb++ )
    7809:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    780d:	83 7d e4 14          	cmpl   $0x14,-0x1c(%ebp)
    7811:	0f 8e 43 ff ff ff    	jle    775a <III_stereo+0x9bb>
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    7817:	8b 45 b8             	mov    -0x48(%ebp),%eax
    781a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7820:	05 30 c6 00 00       	add    $0xc630,%eax
    7825:	8b 00                	mov    (%eax),%eax
    7827:	89 45 e4             	mov    %eax,-0x1c(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    782a:	8b 45 b8             	mov    -0x48(%ebp),%eax
    782d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7833:	05 34 c6 00 00       	add    $0xc634,%eax
    7838:	8b 10                	mov    (%eax),%edx
    783a:	b8 40 02 00 00       	mov    $0x240,%eax
    783f:	29 d0                	sub    %edx,%eax
    7841:	89 45 d8             	mov    %eax,-0x28(%ebp)
    7844:	eb 30                	jmp    7876 <III_stereo+0xad7>
         {  is_pos[i] = is_pos[sfb];
    7846:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7849:	8b 94 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%edx
    7850:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7853:	89 94 85 ac f6 ff ff 	mov    %edx,-0x954(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    785a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    785d:	dd 84 c5 a8 e4 ff ff 	fldl   -0x1b58(%ebp,%eax,8)
    7864:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7867:	dd 9c c5 a8 e4 ff ff 	fstpl  -0x1b58(%ebp,%eax,8)
            i++;
    786e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    7872:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
    7876:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    787a:	7f ca                	jg     7846 <III_stereo+0xaa7>
    787c:	eb 01                	jmp    787f <III_stereo+0xae0>
      {  if( gr_info->mixed_block_flag )
    787e:	90                   	nop
         }
      }
   }

   for(ch=0;ch<2;ch++)
    787f:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    7886:	eb 55                	jmp    78dd <III_stereo+0xb3e>
      for(sb=0;sb<SBLIMIT;sb++)
    7888:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    788f:	eb 42                	jmp    78d3 <III_stereo+0xb34>
         for(ss=0;ss<SSLIMIT;ss++)
    7891:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    7898:	eb 2f                	jmp    78c9 <III_stereo+0xb2a>
            lr[ch][sb][ss] = 0;
    789a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    789d:	89 d0                	mov    %edx,%eax
    789f:	c1 e0 03             	shl    $0x3,%eax
    78a2:	01 d0                	add    %edx,%eax
    78a4:	c1 e0 09             	shl    $0x9,%eax
    78a7:	89 c2                	mov    %eax,%edx
    78a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    78ac:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    78af:	8b 55 d8             	mov    -0x28(%ebp),%edx
    78b2:	89 d0                	mov    %edx,%eax
    78b4:	c1 e0 03             	shl    $0x3,%eax
    78b7:	01 d0                	add    %edx,%eax
    78b9:	01 c0                	add    %eax,%eax
    78bb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    78be:	01 d0                	add    %edx,%eax
    78c0:	d9 ee                	fldz   
    78c2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         for(ss=0;ss<SSLIMIT;ss++)
    78c5:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    78c9:	83 7d d4 11          	cmpl   $0x11,-0x2c(%ebp)
    78cd:	7e cb                	jle    789a <III_stereo+0xafb>
      for(sb=0;sb<SBLIMIT;sb++)
    78cf:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    78d3:	83 7d d8 1f          	cmpl   $0x1f,-0x28(%ebp)
    78d7:	7e b8                	jle    7891 <III_stereo+0xaf2>
   for(ch=0;ch<2;ch++)
    78d9:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
    78dd:	83 7d d0 01          	cmpl   $0x1,-0x30(%ebp)
    78e1:	7e a5                	jle    7888 <III_stereo+0xae9>

   if (stereo==2)
    78e3:	83 7d b4 02          	cmpl   $0x2,-0x4c(%ebp)
    78e7:	0f 85 3b 02 00 00    	jne    7b28 <III_stereo+0xd89>
      for(sb=0;sb<SBLIMIT;sb++)
    78ed:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    78f4:	e9 23 02 00 00       	jmp    7b1c <III_stereo+0xd7d>
         for(ss=0;ss<SSLIMIT;ss++) {
    78f9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    7900:	e9 09 02 00 00       	jmp    7b0e <III_stereo+0xd6f>
            i = (sb*18)+ss;
    7905:	8b 55 d8             	mov    -0x28(%ebp),%edx
    7908:	89 d0                	mov    %edx,%eax
    790a:	c1 e0 03             	shl    $0x3,%eax
    790d:	01 d0                	add    %edx,%eax
    790f:	01 c0                	add    %eax,%eax
    7911:	89 c2                	mov    %eax,%edx
    7913:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7916:	01 d0                	add    %edx,%eax
    7918:	89 45 e0             	mov    %eax,-0x20(%ebp)
            if ( is_pos[i] == 7 ) {
    791b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    791e:	8b 84 85 ac f6 ff ff 	mov    -0x954(%ebp,%eax,4),%eax
    7925:	83 f8 07             	cmp    $0x7,%eax
    7928:	0f 85 2c 01 00 00    	jne    7a5a <III_stereo+0xcbb>
               if ( ms_stereo ) {
    792e:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
    7932:	0f 84 b5 00 00 00    	je     79ed <III_stereo+0xc4e>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    7938:	8b 55 08             	mov    0x8(%ebp),%edx
    793b:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    793e:	89 c8                	mov    %ecx,%eax
    7940:	c1 e0 03             	shl    $0x3,%eax
    7943:	01 c8                	add    %ecx,%eax
    7945:	01 c0                	add    %eax,%eax
    7947:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    794a:	01 c8                	add    %ecx,%eax
    794c:	dd 04 c2             	fldl   (%edx,%eax,8)
    794f:	8b 45 08             	mov    0x8(%ebp),%eax
    7952:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7958:	8b 55 d8             	mov    -0x28(%ebp),%edx
    795b:	89 d0                	mov    %edx,%eax
    795d:	c1 e0 03             	shl    $0x3,%eax
    7960:	01 d0                	add    %edx,%eax
    7962:	01 c0                	add    %eax,%eax
    7964:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    7967:	01 d0                	add    %edx,%eax
    7969:	dd 04 c1             	fldl   (%ecx,%eax,8)
    796c:	de c1                	faddp  %st,%st(1)
    796e:	dd 05 48 b4 00 00    	fldl   0xb448
    7974:	de f9                	fdivrp %st,%st(1)
    7976:	8b 55 0c             	mov    0xc(%ebp),%edx
    7979:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    797c:	89 c8                	mov    %ecx,%eax
    797e:	c1 e0 03             	shl    $0x3,%eax
    7981:	01 c8                	add    %ecx,%eax
    7983:	01 c0                	add    %eax,%eax
    7985:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    7988:	01 c8                	add    %ecx,%eax
    798a:	dd 1c c2             	fstpl  (%edx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    798d:	8b 55 08             	mov    0x8(%ebp),%edx
    7990:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    7993:	89 c8                	mov    %ecx,%eax
    7995:	c1 e0 03             	shl    $0x3,%eax
    7998:	01 c8                	add    %ecx,%eax
    799a:	01 c0                	add    %eax,%eax
    799c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    799f:	01 c8                	add    %ecx,%eax
    79a1:	dd 04 c2             	fldl   (%edx,%eax,8)
    79a4:	8b 45 08             	mov    0x8(%ebp),%eax
    79a7:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    79ad:	8b 55 d8             	mov    -0x28(%ebp),%edx
    79b0:	89 d0                	mov    %edx,%eax
    79b2:	c1 e0 03             	shl    $0x3,%eax
    79b5:	01 d0                	add    %edx,%eax
    79b7:	01 c0                	add    %eax,%eax
    79b9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    79bc:	01 d0                	add    %edx,%eax
    79be:	dd 04 c1             	fldl   (%ecx,%eax,8)
    79c1:	de e9                	fsubrp %st,%st(1)
    79c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    79c6:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    79cc:	dd 05 48 b4 00 00    	fldl   0xb448
    79d2:	de f9                	fdivrp %st,%st(1)
    79d4:	8b 55 d8             	mov    -0x28(%ebp),%edx
    79d7:	89 d0                	mov    %edx,%eax
    79d9:	c1 e0 03             	shl    $0x3,%eax
    79dc:	01 d0                	add    %edx,%eax
    79de:	01 c0                	add    %eax,%eax
    79e0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    79e3:	01 d0                	add    %edx,%eax
    79e5:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    79e8:	e9 1d 01 00 00       	jmp    7b0a <III_stereo+0xd6b>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    79ed:	8b 55 08             	mov    0x8(%ebp),%edx
    79f0:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    79f3:	89 c8                	mov    %ecx,%eax
    79f5:	c1 e0 03             	shl    $0x3,%eax
    79f8:	01 c8                	add    %ecx,%eax
    79fa:	01 c0                	add    %eax,%eax
    79fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    79ff:	01 c8                	add    %ecx,%eax
    7a01:	dd 04 c2             	fldl   (%edx,%eax,8)
    7a04:	8b 55 0c             	mov    0xc(%ebp),%edx
    7a07:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    7a0a:	89 c8                	mov    %ecx,%eax
    7a0c:	c1 e0 03             	shl    $0x3,%eax
    7a0f:	01 c8                	add    %ecx,%eax
    7a11:	01 c0                	add    %eax,%eax
    7a13:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    7a16:	01 c8                	add    %ecx,%eax
    7a18:	dd 1c c2             	fstpl  (%edx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    7a1b:	8b 45 08             	mov    0x8(%ebp),%eax
    7a1e:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    7a24:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a27:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7a2d:	8b 55 d8             	mov    -0x28(%ebp),%edx
    7a30:	89 d0                	mov    %edx,%eax
    7a32:	c1 e0 03             	shl    $0x3,%eax
    7a35:	01 d0                	add    %edx,%eax
    7a37:	01 c0                	add    %eax,%eax
    7a39:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    7a3c:	01 d0                	add    %edx,%eax
    7a3e:	dd 04 c3             	fldl   (%ebx,%eax,8)
    7a41:	8b 55 d8             	mov    -0x28(%ebp),%edx
    7a44:	89 d0                	mov    %edx,%eax
    7a46:	c1 e0 03             	shl    $0x3,%eax
    7a49:	01 d0                	add    %edx,%eax
    7a4b:	01 c0                	add    %eax,%eax
    7a4d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    7a50:	01 d0                	add    %edx,%eax
    7a52:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    7a55:	e9 b0 00 00 00       	jmp    7b0a <III_stereo+0xd6b>
               }
            }
            else if (i_stereo ) {
    7a5a:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
    7a5e:	0f 84 94 00 00 00    	je     7af8 <III_stereo+0xd59>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    7a64:	8b 55 08             	mov    0x8(%ebp),%edx
    7a67:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    7a6a:	89 c8                	mov    %ecx,%eax
    7a6c:	c1 e0 03             	shl    $0x3,%eax
    7a6f:	01 c8                	add    %ecx,%eax
    7a71:	01 c0                	add    %eax,%eax
    7a73:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    7a76:	01 c8                	add    %ecx,%eax
    7a78:	dd 04 c2             	fldl   (%edx,%eax,8)
    7a7b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7a7e:	dd 84 c5 a8 e4 ff ff 	fldl   -0x1b58(%ebp,%eax,8)
    7a85:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7a88:	dd 84 c5 a8 e4 ff ff 	fldl   -0x1b58(%ebp,%eax,8)
    7a8f:	d9 e8                	fld1   
    7a91:	de c1                	faddp  %st,%st(1)
    7a93:	de f9                	fdivrp %st,%st(1)
    7a95:	de c9                	fmulp  %st,%st(1)
    7a97:	8b 55 0c             	mov    0xc(%ebp),%edx
    7a9a:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    7a9d:	89 c8                	mov    %ecx,%eax
    7a9f:	c1 e0 03             	shl    $0x3,%eax
    7aa2:	01 c8                	add    %ecx,%eax
    7aa4:	01 c0                	add    %eax,%eax
    7aa6:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    7aa9:	01 c8                	add    %ecx,%eax
    7aab:	dd 1c c2             	fstpl  (%edx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    7aae:	8b 55 08             	mov    0x8(%ebp),%edx
    7ab1:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    7ab4:	89 c8                	mov    %ecx,%eax
    7ab6:	c1 e0 03             	shl    $0x3,%eax
    7ab9:	01 c8                	add    %ecx,%eax
    7abb:	01 c0                	add    %eax,%eax
    7abd:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    7ac0:	01 c8                	add    %ecx,%eax
    7ac2:	dd 04 c2             	fldl   (%edx,%eax,8)
    7ac5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7ac8:	dd 84 c5 a8 e4 ff ff 	fldl   -0x1b58(%ebp,%eax,8)
    7acf:	d9 e8                	fld1   
    7ad1:	de c1                	faddp  %st,%st(1)
    7ad3:	d9 e8                	fld1   
    7ad5:	de f1                	fdivp  %st,%st(1)
    7ad7:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ada:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7ae0:	de c9                	fmulp  %st,%st(1)
    7ae2:	8b 55 d8             	mov    -0x28(%ebp),%edx
    7ae5:	89 d0                	mov    %edx,%eax
    7ae7:	c1 e0 03             	shl    $0x3,%eax
    7aea:	01 d0                	add    %edx,%eax
    7aec:	01 c0                	add    %eax,%eax
    7aee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    7af1:	01 d0                	add    %edx,%eax
    7af3:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    7af6:	eb 12                	jmp    7b0a <III_stereo+0xd6b>
            }
            else {
               printf(0,"Error in streo processing\n");
    7af8:	83 ec 08             	sub    $0x8,%esp
    7afb:	68 e0 a3 00 00       	push   $0xa3e0
    7b00:	6a 00                	push   $0x0
    7b02:	e8 a0 aa ff ff       	call   25a7 <printf>
    7b07:	83 c4 10             	add    $0x10,%esp
         for(ss=0;ss<SSLIMIT;ss++) {
    7b0a:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    7b0e:	83 7d d4 11          	cmpl   $0x11,-0x2c(%ebp)
    7b12:	0f 8e ed fd ff ff    	jle    7905 <III_stereo+0xb66>
      for(sb=0;sb<SBLIMIT;sb++)
    7b18:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    7b1c:	83 7d d8 1f          	cmpl   $0x1f,-0x28(%ebp)
    7b20:	0f 8e d3 fd ff ff    	jle    78f9 <III_stereo+0xb5a>
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    7b26:	eb 54                	jmp    7b7c <III_stereo+0xddd>
      for(sb=0;sb<SBLIMIT;sb++)
    7b28:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    7b2f:	eb 45                	jmp    7b76 <III_stereo+0xdd7>
         for(ss=0;ss<SSLIMIT;ss++)
    7b31:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    7b38:	eb 32                	jmp    7b6c <III_stereo+0xdcd>
            lr[0][sb][ss] = xr[0][sb][ss];
    7b3a:	8b 55 08             	mov    0x8(%ebp),%edx
    7b3d:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    7b40:	89 c8                	mov    %ecx,%eax
    7b42:	c1 e0 03             	shl    $0x3,%eax
    7b45:	01 c8                	add    %ecx,%eax
    7b47:	01 c0                	add    %eax,%eax
    7b49:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    7b4c:	01 c8                	add    %ecx,%eax
    7b4e:	dd 04 c2             	fldl   (%edx,%eax,8)
    7b51:	8b 55 0c             	mov    0xc(%ebp),%edx
    7b54:	8b 4d d8             	mov    -0x28(%ebp),%ecx
    7b57:	89 c8                	mov    %ecx,%eax
    7b59:	c1 e0 03             	shl    $0x3,%eax
    7b5c:	01 c8                	add    %ecx,%eax
    7b5e:	01 c0                	add    %eax,%eax
    7b60:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    7b63:	01 c8                	add    %ecx,%eax
    7b65:	dd 1c c2             	fstpl  (%edx,%eax,8)
         for(ss=0;ss<SSLIMIT;ss++)
    7b68:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    7b6c:	83 7d d4 11          	cmpl   $0x11,-0x2c(%ebp)
    7b70:	7e c8                	jle    7b3a <III_stereo+0xd9b>
      for(sb=0;sb<SBLIMIT;sb++)
    7b72:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    7b76:	83 7d d8 1f          	cmpl   $0x1f,-0x28(%ebp)
    7b7a:	7e b5                	jle    7b31 <III_stereo+0xd92>
}
    7b7c:	90                   	nop
    7b7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    7b80:	5b                   	pop    %ebx
    7b81:	5e                   	pop    %esi
    7b82:	5f                   	pop    %edi
    7b83:	5d                   	pop    %ebp
    7b84:	c3                   	ret    

00007b85 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    7b85:	55                   	push   %ebp
    7b86:	89 e5                	mov    %esp,%ebp
    7b88:	83 ec 38             	sub    $0x38,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    7b8b:	a1 40 c8 00 00       	mov    0xc840,%eax
    7b90:	85 c0                	test   %eax,%eax
    7b92:	74 72                	je     7c06 <III_antialias+0x81>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    7b94:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7b9b:	eb 59                	jmp    7bf6 <III_antialias+0x71>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    7b9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7ba0:	dd 04 c5 00 c8 00 00 	fldl   0xc800(,%eax,8)
    7ba7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7baa:	dd 04 c5 00 c8 00 00 	fldl   0xc800(,%eax,8)
    7bb1:	de c9                	fmulp  %st,%st(1)
    7bb3:	d9 e8                	fld1   
    7bb5:	de c1                	faddp  %st,%st(1)
    7bb7:	83 ec 08             	sub    $0x8,%esp
    7bba:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7bbe:	dd 1c 24             	fstpl  (%esp)
    7bc1:	e8 34 b0 ff ff       	call   2bfa <sqrt>
    7bc6:	83 c4 10             	add    $0x10,%esp
    7bc9:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    7bcc:	d9 e8                	fld1   
    7bce:	dc 75 e0             	fdivl  -0x20(%ebp)
    7bd1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7bd4:	dd 1c c5 20 d0 00 00 	fstpl  0xd020(,%eax,8)
         ca[i] = Ci[i]/sq;
    7bdb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7bde:	dd 04 c5 00 c8 00 00 	fldl   0xc800(,%eax,8)
    7be5:	dc 75 e0             	fdivl  -0x20(%ebp)
    7be8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7beb:	dd 1c c5 60 d0 00 00 	fstpl  0xd060(,%eax,8)
      for (i=0;i<8;i++) {
    7bf2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7bf6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    7bfa:	7e a1                	jle    7b9d <III_antialias+0x18>
      }
      init = 0;
    7bfc:	c7 05 40 c8 00 00 00 	movl   $0x0,0xc840
    7c03:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    7c06:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7c0d:	eb 4c                	jmp    7c5b <III_antialias+0xd6>
       for(ss=0;ss<SSLIMIT;ss++)
    7c0f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7c16:	eb 39                	jmp    7c51 <III_antialias+0xcc>
          hybridIn[sb][ss] = xr[sb][ss];
    7c18:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c1b:	89 d0                	mov    %edx,%eax
    7c1d:	c1 e0 03             	shl    $0x3,%eax
    7c20:	01 d0                	add    %edx,%eax
    7c22:	c1 e0 04             	shl    $0x4,%eax
    7c25:	89 c2                	mov    %eax,%edx
    7c27:	8b 45 08             	mov    0x8(%ebp),%eax
    7c2a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7c2d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c30:	89 d0                	mov    %edx,%eax
    7c32:	c1 e0 03             	shl    $0x3,%eax
    7c35:	01 d0                	add    %edx,%eax
    7c37:	c1 e0 04             	shl    $0x4,%eax
    7c3a:	89 c2                	mov    %eax,%edx
    7c3c:	8b 45 0c             	mov    0xc(%ebp),%eax
    7c3f:	01 c2                	add    %eax,%edx
    7c41:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c44:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c4a:	dd 1c c2             	fstpl  (%edx,%eax,8)
       for(ss=0;ss<SSLIMIT;ss++)
    7c4d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7c51:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7c55:	7e c1                	jle    7c18 <III_antialias+0x93>
    for(sb=0;sb<SBLIMIT;sb++)
    7c57:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7c5b:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    7c5f:	7e ae                	jle    7c0f <III_antialias+0x8a>

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    7c61:	8b 45 10             	mov    0x10(%ebp),%eax
    7c64:	8b 40 10             	mov    0x10(%eax),%eax
    7c67:	85 c0                	test   %eax,%eax
    7c69:	74 19                	je     7c84 <III_antialias+0xff>
    7c6b:	8b 45 10             	mov    0x10(%ebp),%eax
    7c6e:	8b 40 14             	mov    0x14(%eax),%eax
    7c71:	83 f8 02             	cmp    $0x2,%eax
    7c74:	75 0e                	jne    7c84 <III_antialias+0xff>
       !gr_info->mixed_block_flag ) return;
    7c76:	8b 45 10             	mov    0x10(%ebp),%eax
    7c79:	8b 40 18             	mov    0x18(%eax),%eax
   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    7c7c:	85 c0                	test   %eax,%eax
    7c7e:	0f 84 1d 01 00 00    	je     7da1 <III_antialias+0x21c>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    7c84:	8b 45 10             	mov    0x10(%ebp),%eax
    7c87:	8b 40 10             	mov    0x10(%eax),%eax
    7c8a:	85 c0                	test   %eax,%eax
    7c8c:	74 1e                	je     7cac <III_antialias+0x127>
    7c8e:	8b 45 10             	mov    0x10(%ebp),%eax
    7c91:	8b 40 18             	mov    0x18(%eax),%eax
    7c94:	85 c0                	test   %eax,%eax
    7c96:	74 14                	je     7cac <III_antialias+0x127>
     (gr_info->block_type == 2))
    7c98:	8b 45 10             	mov    0x10(%ebp),%eax
    7c9b:	8b 40 14             	mov    0x14(%eax),%eax
   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    7c9e:	83 f8 02             	cmp    $0x2,%eax
    7ca1:	75 09                	jne    7cac <III_antialias+0x127>
      sblim = 1;
    7ca3:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    7caa:	eb 07                	jmp    7cb3 <III_antialias+0x12e>
   else
      sblim = SBLIMIT-1;
    7cac:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    7cb3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7cba:	e9 d4 00 00 00       	jmp    7d93 <III_antialias+0x20e>
      for(ss=0;ss<8;ss++) {
    7cbf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7cc6:	e9 ba 00 00 00       	jmp    7d85 <III_antialias+0x200>
         bu = xr[sb][17-ss];
    7ccb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7cce:	89 d0                	mov    %edx,%eax
    7cd0:	c1 e0 03             	shl    $0x3,%eax
    7cd3:	01 d0                	add    %edx,%eax
    7cd5:	c1 e0 04             	shl    $0x4,%eax
    7cd8:	89 c2                	mov    %eax,%edx
    7cda:	8b 45 08             	mov    0x8(%ebp),%eax
    7cdd:	01 c2                	add    %eax,%edx
    7cdf:	b8 11 00 00 00       	mov    $0x11,%eax
    7ce4:	2b 45 f4             	sub    -0xc(%ebp),%eax
    7ce7:	dd 04 c2             	fldl   (%edx,%eax,8)
    7cea:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    7ced:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7cf0:	8d 50 01             	lea    0x1(%eax),%edx
    7cf3:	89 d0                	mov    %edx,%eax
    7cf5:	c1 e0 03             	shl    $0x3,%eax
    7cf8:	01 d0                	add    %edx,%eax
    7cfa:	c1 e0 04             	shl    $0x4,%eax
    7cfd:	89 c2                	mov    %eax,%edx
    7cff:	8b 45 08             	mov    0x8(%ebp),%eax
    7d02:	01 c2                	add    %eax,%edx
    7d04:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d07:	dd 04 c2             	fldl   (%edx,%eax,8)
    7d0a:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    7d0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d10:	dd 04 c5 20 d0 00 00 	fldl   0xd020(,%eax,8)
    7d17:	dc 4d d8             	fmull  -0x28(%ebp)
    7d1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d1d:	dd 04 c5 60 d0 00 00 	fldl   0xd060(,%eax,8)
    7d24:	dc 4d d0             	fmull  -0x30(%ebp)
    7d27:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d2a:	89 d0                	mov    %edx,%eax
    7d2c:	c1 e0 03             	shl    $0x3,%eax
    7d2f:	01 d0                	add    %edx,%eax
    7d31:	c1 e0 04             	shl    $0x4,%eax
    7d34:	89 c2                	mov    %eax,%edx
    7d36:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d39:	01 c2                	add    %eax,%edx
    7d3b:	b8 11 00 00 00       	mov    $0x11,%eax
    7d40:	2b 45 f4             	sub    -0xc(%ebp),%eax
    7d43:	de e9                	fsubrp %st,%st(1)
    7d45:	dd 1c c2             	fstpl  (%edx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    7d48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d4b:	dd 04 c5 20 d0 00 00 	fldl   0xd020(,%eax,8)
    7d52:	dc 4d d0             	fmull  -0x30(%ebp)
    7d55:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d58:	dd 04 c5 60 d0 00 00 	fldl   0xd060(,%eax,8)
    7d5f:	dc 4d d8             	fmull  -0x28(%ebp)
    7d62:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d65:	8d 50 01             	lea    0x1(%eax),%edx
    7d68:	89 d0                	mov    %edx,%eax
    7d6a:	c1 e0 03             	shl    $0x3,%eax
    7d6d:	01 d0                	add    %edx,%eax
    7d6f:	c1 e0 04             	shl    $0x4,%eax
    7d72:	89 c2                	mov    %eax,%edx
    7d74:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d77:	01 c2                	add    %eax,%edx
    7d79:	de c1                	faddp  %st,%st(1)
    7d7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d7e:	dd 1c c2             	fstpl  (%edx,%eax,8)
      for(ss=0;ss<8;ss++) {
    7d81:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7d85:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7d89:	0f 8e 3c ff ff ff    	jle    7ccb <III_antialias+0x146>
   for(sb=0;sb<sblim;sb++)
    7d8f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7d93:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d96:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    7d99:	0f 8c 20 ff ff ff    	jl     7cbf <III_antialias+0x13a>
    7d9f:	eb 01                	jmp    7da2 <III_antialias+0x21d>
       !gr_info->mixed_block_flag ) return;
    7da1:	90                   	nop
         }
}
    7da2:	c9                   	leave  
    7da3:	c3                   	ret    

00007da4 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    7da4:	55                   	push   %ebp
    7da5:	89 e5                	mov    %esp,%ebp
    7da7:	53                   	push   %ebx
    7da8:	81 ec 94 00 00 00    	sub    $0x94,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    7dae:	a1 a0 d0 00 00       	mov    0xd0a0,%eax
    7db3:	85 c0                	test   %eax,%eax
    7db5:	0f 85 9f 02 00 00    	jne    805a <inv_mdct+0x2b6>

    /* type 0 */
      for(i=0;i<36;i++)
    7dbb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7dc2:	eb 33                	jmp    7df7 <inv_mdct+0x53>
         win[0][i] = sin( PI/36 *(i+0.5) );
    7dc4:	db 45 f4             	fildl  -0xc(%ebp)
    7dc7:	dd 05 50 b4 00 00    	fldl   0xb450
    7dcd:	de c1                	faddp  %st,%st(1)
    7dcf:	dd 05 58 b4 00 00    	fldl   0xb458
    7dd5:	de c9                	fmulp  %st,%st(1)
    7dd7:	83 ec 08             	sub    $0x8,%esp
    7dda:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7dde:	dd 1c 24             	fstpl  (%esp)
    7de1:	e8 8d ab ff ff       	call   2973 <sin>
    7de6:	83 c4 10             	add    $0x10,%esp
    7de9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7dec:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=0;i<36;i++)
    7df3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7df7:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7dfb:	7e c7                	jle    7dc4 <inv_mdct+0x20>

    /* type 1*/
      for(i=0;i<18;i++)
    7dfd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7e04:	eb 36                	jmp    7e3c <inv_mdct+0x98>
         win[1][i] = sin( PI/36 *(i+0.5) );
    7e06:	db 45 f4             	fildl  -0xc(%ebp)
    7e09:	dd 05 50 b4 00 00    	fldl   0xb450
    7e0f:	de c1                	faddp  %st,%st(1)
    7e11:	dd 05 58 b4 00 00    	fldl   0xb458
    7e17:	de c9                	fmulp  %st,%st(1)
    7e19:	83 ec 08             	sub    $0x8,%esp
    7e1c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7e20:	dd 1c 24             	fstpl  (%esp)
    7e23:	e8 4b ab ff ff       	call   2973 <sin>
    7e28:	83 c4 10             	add    $0x10,%esp
    7e2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e2e:	83 c0 24             	add    $0x24,%eax
    7e31:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=0;i<18;i++)
    7e38:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e3c:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7e40:	7e c4                	jle    7e06 <inv_mdct+0x62>
      for(i=18;i<24;i++)
    7e42:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    7e49:	eb 13                	jmp    7e5e <inv_mdct+0xba>
         win[1][i] = 1.0;
    7e4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e4e:	83 c0 24             	add    $0x24,%eax
    7e51:	d9 e8                	fld1   
    7e53:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=18;i<24;i++)
    7e5a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e5e:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    7e62:	7e e7                	jle    7e4b <inv_mdct+0xa7>
      for(i=24;i<30;i++)
    7e64:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    7e6b:	eb 3e                	jmp    7eab <inv_mdct+0x107>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    7e6d:	db 45 f4             	fildl  -0xc(%ebp)
    7e70:	dd 05 50 b4 00 00    	fldl   0xb450
    7e76:	de c1                	faddp  %st,%st(1)
    7e78:	dd 05 60 b4 00 00    	fldl   0xb460
    7e7e:	de e9                	fsubrp %st,%st(1)
    7e80:	dd 05 40 b4 00 00    	fldl   0xb440
    7e86:	de c9                	fmulp  %st,%st(1)
    7e88:	83 ec 08             	sub    $0x8,%esp
    7e8b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7e8f:	dd 1c 24             	fstpl  (%esp)
    7e92:	e8 dc aa ff ff       	call   2973 <sin>
    7e97:	83 c4 10             	add    $0x10,%esp
    7e9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e9d:	83 c0 24             	add    $0x24,%eax
    7ea0:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=24;i<30;i++)
    7ea7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7eab:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    7eaf:	7e bc                	jle    7e6d <inv_mdct+0xc9>
      for(i=30;i<36;i++)
    7eb1:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    7eb8:	eb 13                	jmp    7ecd <inv_mdct+0x129>
         win[1][i] = 0.0;
    7eba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ebd:	83 c0 24             	add    $0x24,%eax
    7ec0:	d9 ee                	fldz   
    7ec2:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=30;i<36;i++)
    7ec9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7ecd:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7ed1:	7e e7                	jle    7eba <inv_mdct+0x116>

    /* type 3*/
      for(i=0;i<6;i++)
    7ed3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7eda:	eb 13                	jmp    7eef <inv_mdct+0x14b>
         win[3][i] = 0.0;
    7edc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7edf:	83 c0 6c             	add    $0x6c,%eax
    7ee2:	d9 ee                	fldz   
    7ee4:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=0;i<6;i++)
    7eeb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7eef:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    7ef3:	7e e7                	jle    7edc <inv_mdct+0x138>
      for(i=6;i<12;i++)
    7ef5:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7efc:	eb 3e                	jmp    7f3c <inv_mdct+0x198>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    7efe:	db 45 f4             	fildl  -0xc(%ebp)
    7f01:	dd 05 50 b4 00 00    	fldl   0xb450
    7f07:	de c1                	faddp  %st,%st(1)
    7f09:	dd 05 68 b4 00 00    	fldl   0xb468
    7f0f:	de e9                	fsubrp %st,%st(1)
    7f11:	dd 05 40 b4 00 00    	fldl   0xb440
    7f17:	de c9                	fmulp  %st,%st(1)
    7f19:	83 ec 08             	sub    $0x8,%esp
    7f1c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7f20:	dd 1c 24             	fstpl  (%esp)
    7f23:	e8 4b aa ff ff       	call   2973 <sin>
    7f28:	83 c4 10             	add    $0x10,%esp
    7f2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f2e:	83 c0 6c             	add    $0x6c,%eax
    7f31:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=6;i<12;i++)
    7f38:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f3c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7f40:	7e bc                	jle    7efe <inv_mdct+0x15a>
      for(i=12;i<18;i++)
    7f42:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7f49:	eb 13                	jmp    7f5e <inv_mdct+0x1ba>
         win[3][i] =1.0;
    7f4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f4e:	83 c0 6c             	add    $0x6c,%eax
    7f51:	d9 e8                	fld1   
    7f53:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=12;i<18;i++)
    7f5a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f5e:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7f62:	7e e7                	jle    7f4b <inv_mdct+0x1a7>
      for(i=18;i<36;i++)
    7f64:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    7f6b:	eb 36                	jmp    7fa3 <inv_mdct+0x1ff>
         win[3][i] = sin( PI/36*(i+0.5) );
    7f6d:	db 45 f4             	fildl  -0xc(%ebp)
    7f70:	dd 05 50 b4 00 00    	fldl   0xb450
    7f76:	de c1                	faddp  %st,%st(1)
    7f78:	dd 05 58 b4 00 00    	fldl   0xb458
    7f7e:	de c9                	fmulp  %st,%st(1)
    7f80:	83 ec 08             	sub    $0x8,%esp
    7f83:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7f87:	dd 1c 24             	fstpl  (%esp)
    7f8a:	e8 e4 a9 ff ff       	call   2973 <sin>
    7f8f:	83 c4 10             	add    $0x10,%esp
    7f92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f95:	83 c0 6c             	add    $0x6c,%eax
    7f98:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=18;i<36;i++)
    7f9f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7fa3:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7fa7:	7e c4                	jle    7f6d <inv_mdct+0x1c9>

    /* type 2*/
      for(i=0;i<12;i++)
    7fa9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7fb0:	eb 36                	jmp    7fe8 <inv_mdct+0x244>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    7fb2:	db 45 f4             	fildl  -0xc(%ebp)
    7fb5:	dd 05 50 b4 00 00    	fldl   0xb450
    7fbb:	de c1                	faddp  %st,%st(1)
    7fbd:	dd 05 40 b4 00 00    	fldl   0xb440
    7fc3:	de c9                	fmulp  %st,%st(1)
    7fc5:	83 ec 08             	sub    $0x8,%esp
    7fc8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7fcc:	dd 1c 24             	fstpl  (%esp)
    7fcf:	e8 9f a9 ff ff       	call   2973 <sin>
    7fd4:	83 c4 10             	add    $0x10,%esp
    7fd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fda:	83 c0 48             	add    $0x48,%eax
    7fdd:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=0;i<12;i++)
    7fe4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7fe8:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7fec:	7e c4                	jle    7fb2 <inv_mdct+0x20e>
      for(i=12;i<36;i++)
    7fee:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7ff5:	eb 13                	jmp    800a <inv_mdct+0x266>
         win[2][i] = 0.0 ;
    7ff7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ffa:	83 c0 48             	add    $0x48,%eax
    7ffd:	d9 ee                	fldz   
    7fff:	dd 1c c5 c0 d0 00 00 	fstpl  0xd0c0(,%eax,8)
      for(i=12;i<36;i++)
    8006:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    800a:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    800e:	7e e7                	jle    7ff7 <inv_mdct+0x253>

      for (i=0; i<4*36; i++)
    8010:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8017:	eb 2b                	jmp    8044 <inv_mdct+0x2a0>
         COS[i] = cos(PI/(2*36) * i);
    8019:	db 45 f4             	fildl  -0xc(%ebp)
    801c:	dd 05 70 b4 00 00    	fldl   0xb470
    8022:	de c9                	fmulp  %st,%st(1)
    8024:	83 ec 08             	sub    $0x8,%esp
    8027:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    802b:	dd 1c 24             	fstpl  (%esp)
    802e:	e8 dc a9 ff ff       	call   2a0f <cos>
    8033:	83 c4 10             	add    $0x10,%esp
    8036:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8039:	dd 1c c5 40 d5 00 00 	fstpl  0xd540(,%eax,8)
      for (i=0; i<4*36; i++)
    8040:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8044:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    804b:	7e cc                	jle    8019 <inv_mdct+0x275>

      init++;
    804d:	a1 a0 d0 00 00       	mov    0xd0a0,%eax
    8052:	83 c0 01             	add    $0x1,%eax
    8055:	a3 a0 d0 00 00       	mov    %eax,0xd0a0
    }

    for(i=0;i<36;i++)
    805a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8061:	eb 17                	jmp    807a <inv_mdct+0x2d6>
       out[i]=0;
    8063:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8066:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    806d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8070:	01 d0                	add    %edx,%eax
    8072:	d9 ee                	fldz   
    8074:	dd 18                	fstpl  (%eax)
    for(i=0;i<36;i++)
    8076:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    807a:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    807e:	7e e3                	jle    8063 <inv_mdct+0x2bf>

    if(block_type == 2){
    8080:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    8084:	0f 85 8e 01 00 00    	jne    8218 <inv_mdct+0x474>
       N=12;
    808a:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    8091:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8098:	e9 6c 01 00 00       	jmp    8209 <inv_mdct+0x465>
          for(p= 0;p<N;p++){
    809d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    80a4:	e9 e9 00 00 00       	jmp    8192 <inv_mdct+0x3ee>
             sum = 0.0;
    80a9:	d9 ee                	fldz   
    80ab:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    80ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    80b5:	e9 99 00 00 00       	jmp    8153 <inv_mdct+0x3af>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    80ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
    80bd:	89 d0                	mov    %edx,%eax
    80bf:	01 c0                	add    %eax,%eax
    80c1:	01 c2                	add    %eax,%edx
    80c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    80c6:	01 d0                	add    %edx,%eax
    80c8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    80cf:	8b 45 08             	mov    0x8(%ebp),%eax
    80d2:	01 d0                	add    %edx,%eax
    80d4:	dd 00                	fldl   (%eax)
    80d6:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
    80dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    80df:	01 c0                	add    %eax,%eax
    80e1:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    80e7:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    80ed:	dd 05 78 b4 00 00    	fldl   0xb478
    80f3:	de f1                	fdivp  %st,%st(1)
    80f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    80f8:	01 c0                	add    %eax,%eax
    80fa:	8d 50 01             	lea    0x1(%eax),%edx
    80fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8100:	89 c1                	mov    %eax,%ecx
    8102:	c1 e9 1f             	shr    $0x1f,%ecx
    8105:	01 c8                	add    %ecx,%eax
    8107:	d1 f8                	sar    %eax
    8109:	01 d0                	add    %edx,%eax
    810b:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    8111:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    8117:	de c9                	fmulp  %st,%st(1)
    8119:	8b 45 f0             	mov    -0x10(%ebp),%eax
    811c:	01 c0                	add    %eax,%eax
    811e:	83 c0 01             	add    $0x1,%eax
    8121:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    8127:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    812d:	de c9                	fmulp  %st,%st(1)
    812f:	83 ec 08             	sub    $0x8,%esp
    8132:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8136:	dd 1c 24             	fstpl  (%esp)
    8139:	e8 d1 a8 ff ff       	call   2a0f <cos>
    813e:	83 c4 10             	add    $0x10,%esp
    8141:	dc 8d 70 ff ff ff    	fmull  -0x90(%ebp)
    8147:	dd 45 e0             	fldl   -0x20(%ebp)
    814a:	de c1                	faddp  %st,%st(1)
    814c:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    814f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8153:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8156:	89 c2                	mov    %eax,%edx
    8158:	c1 ea 1f             	shr    $0x1f,%edx
    815b:	01 d0                	add    %edx,%eax
    815d:	d1 f8                	sar    %eax
    815f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    8162:	0f 8c 52 ff ff ff    	jl     80ba <inv_mdct+0x316>
             tmp[p] = sum * win[block_type][p] ;
    8168:	8b 55 10             	mov    0x10(%ebp),%edx
    816b:	89 d0                	mov    %edx,%eax
    816d:	c1 e0 03             	shl    $0x3,%eax
    8170:	01 d0                	add    %edx,%eax
    8172:	c1 e0 02             	shl    $0x2,%eax
    8175:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8178:	01 d0                	add    %edx,%eax
    817a:	dd 04 c5 c0 d0 00 00 	fldl   0xd0c0(,%eax,8)
    8181:	dc 4d e0             	fmull  -0x20(%ebp)
    8184:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8187:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
          for(p= 0;p<N;p++){
    818e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8192:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8195:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8198:	0f 8c 0b ff ff ff    	jl     80a9 <inv_mdct+0x305>
          }
          for(p=0;p<N;p++)
    819e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    81a5:	eb 56                	jmp    81fd <inv_mdct+0x459>
             out[6*i+p+6] += tmp[p];
    81a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    81aa:	89 d0                	mov    %edx,%eax
    81ac:	01 c0                	add    %eax,%eax
    81ae:	01 d0                	add    %edx,%eax
    81b0:	01 c0                	add    %eax,%eax
    81b2:	89 c2                	mov    %eax,%edx
    81b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81b7:	01 d0                	add    %edx,%eax
    81b9:	83 c0 06             	add    $0x6,%eax
    81bc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    81c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    81c6:	01 d0                	add    %edx,%eax
    81c8:	dd 00                	fldl   (%eax)
    81ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81cd:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    81d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    81d7:	89 d0                	mov    %edx,%eax
    81d9:	01 c0                	add    %eax,%eax
    81db:	01 d0                	add    %edx,%eax
    81dd:	01 c0                	add    %eax,%eax
    81df:	89 c2                	mov    %eax,%edx
    81e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81e4:	01 d0                	add    %edx,%eax
    81e6:	83 c0 06             	add    $0x6,%eax
    81e9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    81f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    81f3:	01 d0                	add    %edx,%eax
    81f5:	de c1                	faddp  %st,%st(1)
    81f7:	dd 18                	fstpl  (%eax)
          for(p=0;p<N;p++)
    81f9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    81fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8200:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8203:	7c a2                	jl     81a7 <inv_mdct+0x403>
       for(i=0;i<3;i++){
    8205:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8209:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    820d:	0f 8e 8a fe ff ff    	jle    809d <inv_mdct+0x2f9>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    8213:	e9 dd 00 00 00       	jmp    82f5 <inv_mdct+0x551>
      N=36;
    8218:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    821f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8226:	e9 be 00 00 00       	jmp    82e9 <inv_mdct+0x545>
         sum = 0.0;
    822b:	d9 ee                	fldz   
    822d:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    8230:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8237:	eb 6e                	jmp    82a7 <inv_mdct+0x503>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    8239:	8b 45 f0             	mov    -0x10(%ebp),%eax
    823c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8243:	8b 45 08             	mov    0x8(%ebp),%eax
    8246:	01 d0                	add    %edx,%eax
    8248:	dd 00                	fldl   (%eax)
    824a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    824d:	01 c0                	add    %eax,%eax
    824f:	8d 50 01             	lea    0x1(%eax),%edx
    8252:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8255:	89 c1                	mov    %eax,%ecx
    8257:	c1 e9 1f             	shr    $0x1f,%ecx
    825a:	01 c8                	add    %ecx,%eax
    825c:	d1 f8                	sar    %eax
    825e:	01 c2                	add    %eax,%edx
    8260:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8263:	01 c0                	add    %eax,%eax
    8265:	83 c0 01             	add    $0x1,%eax
    8268:	89 d1                	mov    %edx,%ecx
    826a:	0f af c8             	imul   %eax,%ecx
    826d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8272:	89 c8                	mov    %ecx,%eax
    8274:	f7 ea                	imul   %edx
    8276:	89 d0                	mov    %edx,%eax
    8278:	c1 f8 05             	sar    $0x5,%eax
    827b:	89 cb                	mov    %ecx,%ebx
    827d:	c1 fb 1f             	sar    $0x1f,%ebx
    8280:	29 d8                	sub    %ebx,%eax
    8282:	89 c2                	mov    %eax,%edx
    8284:	89 d0                	mov    %edx,%eax
    8286:	c1 e0 03             	shl    $0x3,%eax
    8289:	01 d0                	add    %edx,%eax
    828b:	c1 e0 04             	shl    $0x4,%eax
    828e:	29 c1                	sub    %eax,%ecx
    8290:	89 ca                	mov    %ecx,%edx
    8292:	dd 04 d5 40 d5 00 00 	fldl   0xd540(,%edx,8)
    8299:	de c9                	fmulp  %st,%st(1)
    829b:	dd 45 e0             	fldl   -0x20(%ebp)
    829e:	de c1                	faddp  %st,%st(1)
    82a0:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    82a3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    82a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    82aa:	89 c2                	mov    %eax,%edx
    82ac:	c1 ea 1f             	shr    $0x1f,%edx
    82af:	01 d0                	add    %edx,%eax
    82b1:	d1 f8                	sar    %eax
    82b3:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    82b6:	7c 81                	jl     8239 <inv_mdct+0x495>
         out[p] = sum * win[block_type][p];
    82b8:	8b 55 10             	mov    0x10(%ebp),%edx
    82bb:	89 d0                	mov    %edx,%eax
    82bd:	c1 e0 03             	shl    $0x3,%eax
    82c0:	01 d0                	add    %edx,%eax
    82c2:	c1 e0 02             	shl    $0x2,%eax
    82c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    82c8:	01 d0                	add    %edx,%eax
    82ca:	dd 04 c5 c0 d0 00 00 	fldl   0xd0c0(,%eax,8)
    82d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82d4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    82db:	8b 45 0c             	mov    0xc(%ebp),%eax
    82de:	01 d0                	add    %edx,%eax
    82e0:	dc 4d e0             	fmull  -0x20(%ebp)
    82e3:	dd 18                	fstpl  (%eax)
      for(p= 0;p<N;p++){
    82e5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    82e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82ec:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    82ef:	0f 8c 36 ff ff ff    	jl     822b <inv_mdct+0x487>
}
    82f5:	90                   	nop
    82f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    82f9:	c9                   	leave  
    82fa:	c3                   	ret    

000082fb <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    82fb:	55                   	push   %ebp
    82fc:	89 e5                	mov    %esp,%ebp
    82fe:	81 ec 48 01 00 00    	sub    $0x148,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    8304:	a1 44 c8 00 00       	mov    0xc844,%eax
    8309:	85 c0                	test   %eax,%eax
    830b:	74 6f                	je     837c <III_hybrid+0x81>
      int i,j,k;

      for(i=0;i<2;i++)
    830d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8314:	eb 56                	jmp    836c <III_hybrid+0x71>
         for(j=0;j<SBLIMIT;j++)
    8316:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    831d:	eb 43                	jmp    8362 <III_hybrid+0x67>
            for(k=0;k<SSLIMIT;k++)
    831f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8326:	eb 30                	jmp    8358 <III_hybrid+0x5d>
               prevblck[i][j][k]=0.0;
    8328:	8b 45 ec             	mov    -0x14(%ebp),%eax
    832b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    832e:	89 c2                	mov    %eax,%edx
    8330:	c1 e2 03             	shl    $0x3,%edx
    8333:	01 c2                	add    %eax,%edx
    8335:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8338:	89 c2                	mov    %eax,%edx
    833a:	89 c8                	mov    %ecx,%eax
    833c:	c1 e0 03             	shl    $0x3,%eax
    833f:	01 c8                	add    %ecx,%eax
    8341:	c1 e0 06             	shl    $0x6,%eax
    8344:	01 c2                	add    %eax,%edx
    8346:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8349:	01 d0                	add    %edx,%eax
    834b:	d9 ee                	fldz   
    834d:	dd 1c c5 c0 d9 00 00 	fstpl  0xd9c0(,%eax,8)
            for(k=0;k<SSLIMIT;k++)
    8354:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    8358:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    835c:	7e ca                	jle    8328 <III_hybrid+0x2d>
         for(j=0;j<SBLIMIT;j++)
    835e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8362:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    8366:	7e b7                	jle    831f <III_hybrid+0x24>
      for(i=0;i<2;i++)
    8368:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    836c:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8370:	7e a4                	jle    8316 <III_hybrid+0x1b>
      init = 0;
    8372:	c7 05 44 c8 00 00 00 	movl   $0x0,0xc844
    8379:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    837c:	8b 45 18             	mov    0x18(%ebp),%eax
    837f:	8b 40 10             	mov    0x10(%eax),%eax
          (sb < 2)) ? 0 : gr_info->block_type;
    8382:	85 c0                	test   %eax,%eax
    8384:	74 10                	je     8396 <III_hybrid+0x9b>
   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    8386:	8b 45 18             	mov    0x18(%ebp),%eax
    8389:	8b 40 18             	mov    0x18(%eax),%eax
    838c:	85 c0                	test   %eax,%eax
    838e:	74 06                	je     8396 <III_hybrid+0x9b>
    8390:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    8394:	7e 08                	jle    839e <III_hybrid+0xa3>
          (sb < 2)) ? 0 : gr_info->block_type;
    8396:	8b 45 18             	mov    0x18(%ebp),%eax
    8399:	8b 40 14             	mov    0x14(%eax),%eax
    839c:	eb 05                	jmp    83a3 <III_hybrid+0xa8>
    839e:	b8 00 00 00 00       	mov    $0x0,%eax
   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    83a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)

   inv_mdct( fsIn, rawout, bt);
    83a6:	83 ec 04             	sub    $0x4,%esp
    83a9:	ff 75 e4             	pushl  -0x1c(%ebp)
    83ac:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    83b2:	50                   	push   %eax
    83b3:	ff 75 08             	pushl  0x8(%ebp)
    83b6:	e8 e9 f9 ff ff       	call   7da4 <inv_mdct>
    83bb:	83 c4 10             	add    $0x10,%esp

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    83be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    83c5:	e9 82 00 00 00       	jmp    844c <III_hybrid+0x151>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    83ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83cd:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    83d4:	8b 45 10             	mov    0x10(%ebp),%eax
    83d7:	8b 4d 14             	mov    0x14(%ebp),%ecx
    83da:	89 c2                	mov    %eax,%edx
    83dc:	c1 e2 03             	shl    $0x3,%edx
    83df:	01 c2                	add    %eax,%edx
    83e1:	8d 04 12             	lea    (%edx,%edx,1),%eax
    83e4:	89 c2                	mov    %eax,%edx
    83e6:	89 c8                	mov    %ecx,%eax
    83e8:	c1 e0 03             	shl    $0x3,%eax
    83eb:	01 c8                	add    %ecx,%eax
    83ed:	c1 e0 06             	shl    $0x6,%eax
    83f0:	01 c2                	add    %eax,%edx
    83f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83f5:	01 d0                	add    %edx,%eax
    83f7:	dd 04 c5 c0 d9 00 00 	fldl   0xd9c0(,%eax,8)
    83fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8401:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8408:	8b 45 0c             	mov    0xc(%ebp),%eax
    840b:	01 d0                	add    %edx,%eax
    840d:	de c1                	faddp  %st,%st(1)
    840f:	dd 18                	fstpl  (%eax)
      prevblck[ch][sb][ss] = rawout[ss+18];
    8411:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8414:	83 c0 12             	add    $0x12,%eax
    8417:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    841e:	8b 45 10             	mov    0x10(%ebp),%eax
    8421:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8424:	89 c2                	mov    %eax,%edx
    8426:	c1 e2 03             	shl    $0x3,%edx
    8429:	01 c2                	add    %eax,%edx
    842b:	8d 04 12             	lea    (%edx,%edx,1),%eax
    842e:	89 c2                	mov    %eax,%edx
    8430:	89 c8                	mov    %ecx,%eax
    8432:	c1 e0 03             	shl    $0x3,%eax
    8435:	01 c8                	add    %ecx,%eax
    8437:	c1 e0 06             	shl    $0x6,%eax
    843a:	01 c2                	add    %eax,%edx
    843c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    843f:	01 d0                	add    %edx,%eax
    8441:	dd 1c c5 c0 d9 00 00 	fstpl  0xd9c0(,%eax,8)
   for(ss=0; ss<SSLIMIT; ss++) {
    8448:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    844c:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8450:	0f 8e 74 ff ff ff    	jle    83ca <III_hybrid+0xcf>
   }
}
    8456:	90                   	nop
    8457:	90                   	nop
    8458:	c9                   	leave  
    8459:	c3                   	ret    

0000845a <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    845a:	55                   	push   %ebp
    845b:	89 e5                	mov    %esp,%ebp
    845d:	56                   	push   %esi
    845e:	53                   	push   %ebx
    845f:	83 ec 10             	sub    $0x10,%esp
	register int i,k;

	for (i=0; i<64; i++)
    8462:	be 00 00 00 00       	mov    $0x0,%esi
    8467:	e9 19 01 00 00       	jmp    8585 <create_syn_filter+0x12b>
		for (k=0; k<32; k++) {
    846c:	bb 00 00 00 00       	mov    $0x0,%ebx
    8471:	e9 03 01 00 00       	jmp    8579 <create_syn_filter+0x11f>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    8476:	89 75 f0             	mov    %esi,-0x10(%ebp)
    8479:	db 45 f0             	fildl  -0x10(%ebp)
    847c:	dd 05 80 b4 00 00    	fldl   0xb480
    8482:	de c9                	fmulp  %st,%st(1)
    8484:	dd 05 88 b4 00 00    	fldl   0xb488
    848a:	de c1                	faddp  %st,%st(1)
    848c:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    848f:	83 c0 01             	add    $0x1,%eax
    8492:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8495:	db 45 f0             	fildl  -0x10(%ebp)
    8498:	de c9                	fmulp  %st,%st(1)
    849a:	83 ec 08             	sub    $0x8,%esp
    849d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    84a1:	dd 1c 24             	fstpl  (%esp)
    84a4:	e8 66 a5 ff ff       	call   2a0f <cos>
    84a9:	83 c4 10             	add    $0x10,%esp
    84ac:	89 f0                	mov    %esi,%eax
    84ae:	c1 e0 08             	shl    $0x8,%eax
    84b1:	89 c2                	mov    %eax,%edx
    84b3:	8b 45 08             	mov    0x8(%ebp),%eax
    84b6:	01 d0                	add    %edx,%eax
    84b8:	dd 05 90 b4 00 00    	fldl   0xb490
    84be:	de c9                	fmulp  %st,%st(1)
    84c0:	dd 1c d8             	fstpl  (%eax,%ebx,8)
    84c3:	d9 ee                	fldz   
    84c5:	dd 04 d8             	fldl   (%eax,%ebx,8)
    84c8:	df f1                	fcomip %st(1),%st
    84ca:	dd d8                	fstp   %st(0)
    84cc:	72 42                	jb     8510 <create_syn_filter+0xb6>
				filter[i][k] = (int)(filter[i][k]+0.5);
    84ce:	89 f0                	mov    %esi,%eax
    84d0:	c1 e0 08             	shl    $0x8,%eax
    84d3:	89 c2                	mov    %eax,%edx
    84d5:	8b 45 08             	mov    0x8(%ebp),%eax
    84d8:	01 d0                	add    %edx,%eax
    84da:	dd 04 d8             	fldl   (%eax,%ebx,8)
    84dd:	dd 05 50 b4 00 00    	fldl   0xb450
    84e3:	de c1                	faddp  %st,%st(1)
    84e5:	d9 7d f6             	fnstcw -0xa(%ebp)
    84e8:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    84ec:	80 cc 0c             	or     $0xc,%ah
    84ef:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    84f3:	d9 6d f4             	fldcw  -0xc(%ebp)
    84f6:	db 5d f0             	fistpl -0x10(%ebp)
    84f9:	d9 6d f6             	fldcw  -0xa(%ebp)
    84fc:	89 f0                	mov    %esi,%eax
    84fe:	c1 e0 08             	shl    $0x8,%eax
    8501:	89 c2                	mov    %eax,%edx
    8503:	8b 45 08             	mov    0x8(%ebp),%eax
    8506:	01 d0                	add    %edx,%eax
    8508:	db 45 f0             	fildl  -0x10(%ebp)
    850b:	dd 1c d8             	fstpl  (%eax,%ebx,8)
    850e:	eb 40                	jmp    8550 <create_syn_filter+0xf6>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    8510:	89 f0                	mov    %esi,%eax
    8512:	c1 e0 08             	shl    $0x8,%eax
    8515:	89 c2                	mov    %eax,%edx
    8517:	8b 45 08             	mov    0x8(%ebp),%eax
    851a:	01 d0                	add    %edx,%eax
    851c:	dd 04 d8             	fldl   (%eax,%ebx,8)
    851f:	dd 05 50 b4 00 00    	fldl   0xb450
    8525:	de e9                	fsubrp %st,%st(1)
    8527:	d9 7d f6             	fnstcw -0xa(%ebp)
    852a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    852e:	80 cc 0c             	or     $0xc,%ah
    8531:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
    8535:	d9 6d f4             	fldcw  -0xc(%ebp)
    8538:	db 5d f0             	fistpl -0x10(%ebp)
    853b:	d9 6d f6             	fldcw  -0xa(%ebp)
    853e:	89 f0                	mov    %esi,%eax
    8540:	c1 e0 08             	shl    $0x8,%eax
    8543:	89 c2                	mov    %eax,%edx
    8545:	8b 45 08             	mov    0x8(%ebp),%eax
    8548:	01 d0                	add    %edx,%eax
    854a:	db 45 f0             	fildl  -0x10(%ebp)
    854d:	dd 1c d8             	fstpl  (%eax,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    8550:	89 f0                	mov    %esi,%eax
    8552:	c1 e0 08             	shl    $0x8,%eax
    8555:	89 c2                	mov    %eax,%edx
    8557:	8b 45 08             	mov    0x8(%ebp),%eax
    855a:	01 d0                	add    %edx,%eax
    855c:	dd 04 d8             	fldl   (%eax,%ebx,8)
    855f:	89 f0                	mov    %esi,%eax
    8561:	c1 e0 08             	shl    $0x8,%eax
    8564:	89 c2                	mov    %eax,%edx
    8566:	8b 45 08             	mov    0x8(%ebp),%eax
    8569:	01 d0                	add    %edx,%eax
    856b:	dd 05 98 b4 00 00    	fldl   0xb498
    8571:	de c9                	fmulp  %st,%st(1)
    8573:	dd 1c d8             	fstpl  (%eax,%ebx,8)
		for (k=0; k<32; k++) {
    8576:	83 c3 01             	add    $0x1,%ebx
    8579:	83 fb 1f             	cmp    $0x1f,%ebx
    857c:	0f 8e f4 fe ff ff    	jle    8476 <create_syn_filter+0x1c>
	for (i=0; i<64; i++)
    8582:	83 c6 01             	add    $0x1,%esi
    8585:	83 fe 3f             	cmp    $0x3f,%esi
    8588:	0f 8e de fe ff ff    	jle    846c <create_syn_filter+0x12>
		}
}
    858e:	90                   	nop
    858f:	90                   	nop
    8590:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8593:	5b                   	pop    %ebx
    8594:	5e                   	pop    %esi
    8595:	5d                   	pop    %ebp
    8596:	c3                   	ret    

00008597 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    8597:	55                   	push   %ebp
    8598:	89 e5                	mov    %esp,%ebp
    859a:	57                   	push   %edi
    859b:	56                   	push   %esi
    859c:	53                   	push   %ebx
    859d:	81 ec 04 10 00 00    	sub    $0x1004,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    85a3:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    85a9:	bb 00 a4 00 00       	mov    $0xa400,%ebx
    85ae:	ba 00 04 00 00       	mov    $0x400,%edx
    85b3:	89 c7                	mov    %eax,%edi
    85b5:	89 de                	mov    %ebx,%esi
    85b7:	89 d1                	mov    %edx,%ecx
    85b9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    85bb:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    85c1:	89 45 08             	mov    %eax,0x8(%ebp)
}
    85c4:	90                   	nop
    85c5:	81 c4 04 10 00 00    	add    $0x1004,%esp
    85cb:	5b                   	pop    %ebx
    85cc:	5e                   	pop    %esi
    85cd:	5f                   	pop    %edi
    85ce:	5d                   	pop    %ebp
    85cf:	c3                   	ret    

000085d0 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    85d0:	55                   	push   %ebp
    85d1:	89 e5                	mov    %esp,%ebp
    85d3:	57                   	push   %edi
    85d4:	56                   	push   %esi
    85d5:	53                   	push   %ebx
    85d6:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    85d9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    85e0:	a1 48 c8 00 00       	mov    0xc848,%eax
    85e5:	85 c0                	test   %eax,%eax
    85e7:	74 7a                	je     8663 <SubBandSynthesis+0x93>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    85e9:	83 ec 08             	sub    $0x8,%esp
    85ec:	68 00 b4 00 00       	push   $0xb400
    85f1:	68 00 40 00 00       	push   $0x4000
    85f6:	e8 f9 aa ff ff       	call   30f4 <mem_alloc>
    85fb:	83 c4 10             	add    $0x10,%esp
    85fe:	a3 c0 fd 00 00       	mov    %eax,0xfdc0
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    8603:	83 ec 08             	sub    $0x8,%esp
    8606:	68 03 b4 00 00       	push   $0xb403
    860b:	68 00 40 00 00       	push   $0x4000
    8610:	e8 df aa ff ff       	call   30f4 <mem_alloc>
    8615:	83 c4 10             	add    $0x10,%esp
    8618:	a3 c4 fd 00 00       	mov    %eax,0xfdc4
		create_syn_filter(*filter);
    861d:	a1 c4 fd 00 00       	mov    0xfdc4,%eax
    8622:	83 ec 0c             	sub    $0xc,%esp
    8625:	50                   	push   %eax
    8626:	e8 2f fe ff ff       	call   845a <create_syn_filter>
    862b:	83 c4 10             	add    $0x10,%esp
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    862e:	83 ec 08             	sub    $0x8,%esp
    8631:	68 06 b4 00 00       	push   $0xb406
    8636:	68 00 10 00 00       	push   $0x1000
    863b:	e8 b4 aa ff ff       	call   30f4 <mem_alloc>
    8640:	83 c4 10             	add    $0x10,%esp
    8643:	a3 c8 fd 00 00       	mov    %eax,0xfdc8
		read_syn_window(window);
    8648:	a1 c8 fd 00 00       	mov    0xfdc8,%eax
    864d:	83 ec 0c             	sub    $0xc,%esp
    8650:	50                   	push   %eax
    8651:	e8 41 ff ff ff       	call   8597 <read_syn_window>
    8656:	83 c4 10             	add    $0x10,%esp
		init = 0;
    8659:	c7 05 48 c8 00 00 00 	movl   $0x0,0xc848
    8660:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    8663:	8b 45 0c             	mov    0xc(%ebp),%eax
    8666:	8b 04 85 4c c8 00 00 	mov    0xc84c(,%eax,4),%eax
    866d:	83 e8 40             	sub    $0x40,%eax
    8670:	25 ff 03 00 00       	and    $0x3ff,%eax
    8675:	89 c2                	mov    %eax,%edx
    8677:	8b 45 0c             	mov    0xc(%ebp),%eax
    867a:	89 14 85 4c c8 00 00 	mov    %edx,0xc84c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    8681:	8b 15 c0 fd 00 00    	mov    0xfdc0,%edx
    8687:	8b 45 0c             	mov    0xc(%ebp),%eax
    868a:	8b 0c 85 4c c8 00 00 	mov    0xc84c(,%eax,4),%ecx
    8691:	8b 45 0c             	mov    0xc(%ebp),%eax
    8694:	c1 e0 0a             	shl    $0xa,%eax
    8697:	01 c8                	add    %ecx,%eax
    8699:	c1 e0 03             	shl    $0x3,%eax
    869c:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    869f:	bb 00 00 00 00       	mov    $0x0,%ebx
    86a4:	eb 40                	jmp    86e6 <SubBandSynthesis+0x116>
		sum = 0;
    86a6:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    86a8:	be 00 00 00 00       	mov    $0x0,%esi
    86ad:	eb 26                	jmp    86d5 <SubBandSynthesis+0x105>
			sum += bandPtr[k] * (*filter)[i][k];
    86af:	89 f0                	mov    %esi,%eax
    86b1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    86b8:	8b 45 08             	mov    0x8(%ebp),%eax
    86bb:	01 d0                	add    %edx,%eax
    86bd:	dd 00                	fldl   (%eax)
    86bf:	a1 c4 fd 00 00       	mov    0xfdc4,%eax
    86c4:	89 da                	mov    %ebx,%edx
    86c6:	c1 e2 05             	shl    $0x5,%edx
    86c9:	01 f2                	add    %esi,%edx
    86cb:	dd 04 d0             	fldl   (%eax,%edx,8)
    86ce:	de c9                	fmulp  %st,%st(1)
    86d0:	de c1                	faddp  %st,%st(1)
		for (k=0; k<32; k++)
    86d2:	83 c6 01             	add    $0x1,%esi
    86d5:	83 fe 1f             	cmp    $0x1f,%esi
    86d8:	7e d5                	jle    86af <SubBandSynthesis+0xdf>
		bufOffsetPtr[i] = sum;
    86da:	89 d8                	mov    %ebx,%eax
    86dc:	c1 e0 03             	shl    $0x3,%eax
    86df:	01 f8                	add    %edi,%eax
    86e1:	dd 18                	fstpl  (%eax)
	for (i=0; i<64; i++) {
    86e3:	83 c3 01             	add    $0x1,%ebx
    86e6:	83 fb 3f             	cmp    $0x3f,%ebx
    86e9:	7e bb                	jle    86a6 <SubBandSynthesis+0xd6>
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    86eb:	bf 00 00 00 00       	mov    $0x0,%edi
    86f0:	e9 c8 00 00 00       	jmp    87bd <SubBandSynthesis+0x1ed>
		sum = 0;
    86f5:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    86f7:	bb 00 00 00 00       	mov    $0x0,%ebx
    86fc:	eb 4c                	jmp    874a <SubBandSynthesis+0x17a>
			k = j + (i<<5);
    86fe:	89 d8                	mov    %ebx,%eax
    8700:	c1 e0 05             	shl    $0x5,%eax
    8703:	8d 34 07             	lea    (%edi,%eax,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    8706:	a1 c8 fd 00 00       	mov    0xfdc8,%eax
    870b:	89 f2                	mov    %esi,%edx
    870d:	c1 e2 03             	shl    $0x3,%edx
    8710:	01 d0                	add    %edx,%eax
    8712:	dd 00                	fldl   (%eax)
    8714:	a1 c0 fd 00 00       	mov    0xfdc0,%eax
    8719:	8d 53 01             	lea    0x1(%ebx),%edx
    871c:	d1 fa                	sar    %edx
    871e:	c1 e2 06             	shl    $0x6,%edx
    8721:	8d 0c 16             	lea    (%esi,%edx,1),%ecx
												bufOffset[channel]) & 0x3ff];
    8724:	8b 55 0c             	mov    0xc(%ebp),%edx
    8727:	8b 14 95 4c c8 00 00 	mov    0xc84c(,%edx,4),%edx
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    872e:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    8730:	89 d1                	mov    %edx,%ecx
    8732:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    8738:	8b 55 0c             	mov    0xc(%ebp),%edx
    873b:	c1 e2 0a             	shl    $0xa,%edx
    873e:	01 ca                	add    %ecx,%edx
    8740:	dd 04 d0             	fldl   (%eax,%edx,8)
    8743:	de c9                	fmulp  %st,%st(1)
    8745:	de c1                	faddp  %st,%st(1)
		for (i=0; i<16; i++) {
    8747:	83 c3 01             	add    $0x1,%ebx
    874a:	83 fb 0f             	cmp    $0xf,%ebx
    874d:	7e af                	jle    86fe <SubBandSynthesis+0x12e>
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    874f:	dd 05 a0 b4 00 00    	fldl   0xb4a0
    8755:	de c9                	fmulp  %st,%st(1)
    8757:	d9 7d d6             	fnstcw -0x2a(%ebp)
    875a:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    875e:	80 cc 0c             	or     $0xc,%ah
    8761:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    8765:	d9 6d d4             	fldcw  -0x2c(%ebp)
    8768:	db 5d e0             	fistpl -0x20(%ebp)
    876b:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    876e:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    8775:	7e 15                	jle    878c <SubBandSynthesis+0x1bc>
    8777:	89 f8                	mov    %edi,%eax
    8779:	8d 14 00             	lea    (%eax,%eax,1),%edx
    877c:	8b 45 10             	mov    0x10(%ebp),%eax
    877f:	01 d0                	add    %edx,%eax
    8781:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    8786:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    878a:	eb 2e                	jmp    87ba <SubBandSynthesis+0x1ea>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    878c:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    8793:	7d 15                	jge    87aa <SubBandSynthesis+0x1da>
    8795:	89 f8                	mov    %edi,%eax
    8797:	8d 14 00             	lea    (%eax,%eax,1),%edx
    879a:	8b 45 10             	mov    0x10(%ebp),%eax
    879d:	01 d0                	add    %edx,%eax
    879f:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    87a4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    87a8:	eb 10                	jmp    87ba <SubBandSynthesis+0x1ea>
			else                           samples[j] = foo;
    87aa:	89 f8                	mov    %edi,%eax
    87ac:	8d 14 00             	lea    (%eax,%eax,1),%edx
    87af:	8b 45 10             	mov    0x10(%ebp),%eax
    87b2:	01 d0                	add    %edx,%eax
    87b4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    87b7:	66 89 10             	mov    %dx,(%eax)
	for (j=0; j<32; j++) {
    87ba:	83 c7 01             	add    $0x1,%edi
    87bd:	83 ff 1f             	cmp    $0x1f,%edi
    87c0:	0f 8e 2f ff ff ff    	jle    86f5 <SubBandSynthesis+0x125>
		}
	}
    return(clip);
    87c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    87c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    87cc:	5b                   	pop    %ebx
    87cd:	5e                   	pop    %esi
    87ce:	5f                   	pop    %edi
    87cf:	5d                   	pop    %ebp
    87d0:	c3                   	ret    

000087d1 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    87d1:	55                   	push   %ebp
    87d2:	89 e5                	mov    %esp,%ebp
    87d4:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    87d7:	8b 45 10             	mov    0x10(%ebp),%eax
    87da:	8b 40 08             	mov    0x8(%eax),%eax
    87dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    87e0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    87e7:	eb 75                	jmp    885e <out_fifo+0x8d>
    87e9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    87f0:	eb 62                	jmp    8854 <out_fifo+0x83>
            (*psampFrames)++;
    87f2:	8b 45 14             	mov    0x14(%ebp),%eax
    87f5:	8b 00                	mov    (%eax),%eax
    87f7:	8d 50 01             	lea    0x1(%eax),%edx
    87fa:	8b 45 14             	mov    0x14(%ebp),%eax
    87fd:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    87ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8806:	eb 40                	jmp    8848 <out_fifo+0x77>
                if (!(k%1600) && k) {
    8808:	8b 0d cc fd 00 00    	mov    0xfdcc,%ecx
    880e:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    8813:	89 c8                	mov    %ecx,%eax
    8815:	f7 ea                	imul   %edx
    8817:	89 d0                	mov    %edx,%eax
    8819:	c1 f8 09             	sar    $0x9,%eax
    881c:	89 ca                	mov    %ecx,%edx
    881e:	c1 fa 1f             	sar    $0x1f,%edx
    8821:	29 d0                	sub    %edx,%eax
    8823:	69 d0 40 06 00 00    	imul   $0x640,%eax,%edx
    8829:	89 c8                	mov    %ecx,%eax
    882b:	29 d0                	sub    %edx,%eax
    882d:	85 c0                	test   %eax,%eax
    882f:	75 13                	jne    8844 <out_fifo+0x73>
    8831:	a1 cc fd 00 00       	mov    0xfdcc,%eax
    8836:	85 c0                	test   %eax,%eax
    8838:	74 0a                	je     8844 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    883a:	c7 05 cc fd 00 00 00 	movl   $0x0,0xfdcc
    8841:	00 00 00 
            for (l=0;l<stereo;l++) {
    8844:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8848:	8b 45 f4             	mov    -0xc(%ebp),%eax
    884b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    884e:	7c b8                	jl     8808 <out_fifo+0x37>
        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    8850:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    8854:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    8858:	7e 98                	jle    87f2 <out_fifo+0x21>
    885a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    885e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    8861:	3b 45 0c             	cmp    0xc(%ebp),%eax
    8864:	7c 83                	jl     87e9 <out_fifo+0x18>
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    8866:	90                   	nop
    8867:	90                   	nop
    8868:	c9                   	leave  
    8869:	c3                   	ret    

0000886a <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    886a:	55                   	push   %ebp
    886b:	89 e5                	mov    %esp,%ebp
    886d:	83 ec 08             	sub    $0x8,%esp
    *old_crc = getbits(bs, 16);
    8870:	83 ec 08             	sub    $0x8,%esp
    8873:	6a 10                	push   $0x10
    8875:	ff 75 08             	pushl  0x8(%ebp)
    8878:	e8 5e ab ff ff       	call   33db <getbits>
    887d:	83 c4 10             	add    $0x10,%esp
    8880:	8b 55 0c             	mov    0xc(%ebp),%edx
    8883:	89 02                	mov    %eax,(%edx)
}
    8885:	90                   	nop
    8886:	c9                   	leave  
    8887:	c3                   	ret    

00008888 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    8888:	55                   	push   %ebp
    8889:	89 e5                	mov    %esp,%ebp
    888b:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    888e:	8b 45 08             	mov    0x8(%ebp),%eax
    8891:	8b 40 0c             	mov    0xc(%eax),%eax
    8894:	83 c0 1e             	add    $0x1e,%eax
    8897:	8b 14 85 a0 c3 00 00 	mov    0xc3a0(,%eax,4),%edx
    889e:	89 d0                	mov    %edx,%eax
    88a0:	c1 e0 03             	shl    $0x3,%eax
    88a3:	01 d0                	add    %edx,%eax
    88a5:	c1 e0 04             	shl    $0x4,%eax
    88a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
    88ab:	db 45 e8             	fildl  -0x18(%ebp)
    88ae:	8b 45 08             	mov    0x8(%ebp),%eax
    88b1:	8b 40 10             	mov    0x10(%eax),%eax
    88b4:	dd 04 c5 60 c4 00 00 	fldl   0xc460(,%eax,8)
    88bb:	de f9                	fdivrp %st,%st(1)
	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    88bd:	d9 7d ee             	fnstcw -0x12(%ebp)
    88c0:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
    88c4:	80 cc 0c             	or     $0xc,%ah
    88c7:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    88cb:	d9 6d ec             	fldcw  -0x14(%ebp)
    88ce:	db 5d fc             	fistpl -0x4(%ebp)
    88d1:	d9 6d ee             	fldcw  -0x12(%ebp)
	if (fr_ps.header->padding) nSlots++;
    88d4:	8b 45 08             	mov    0x8(%ebp),%eax
    88d7:	8b 40 14             	mov    0x14(%eax),%eax
    88da:	85 c0                	test   %eax,%eax
    88dc:	74 04                	je     88e2 <main_data_slots+0x5a>
    88de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    88e2:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    88e6:	8b 45 08             	mov    0x8(%ebp),%eax
    88e9:	8b 40 08             	mov    0x8(%eax),%eax
    88ec:	85 c0                	test   %eax,%eax
    88ee:	74 04                	je     88f4 <main_data_slots+0x6c>
		nSlots -= 2;
    88f0:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    88f4:	8b 45 10             	mov    0x10(%ebp),%eax
    88f7:	83 f8 01             	cmp    $0x1,%eax
    88fa:	75 06                	jne    8902 <main_data_slots+0x7a>
		nSlots -= 17;
    88fc:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    8900:	eb 04                	jmp    8906 <main_data_slots+0x7e>
	else
		nSlots -=32;
    8902:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    8906:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    8909:	c9                   	leave  
    890a:	c3                   	ret    
