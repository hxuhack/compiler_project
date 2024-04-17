declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@ascii_0 = global i32 48
define i32 @my_getint( ) {
bb1:
  %r167 = add i32 0, 0
  %r169 = add i32 0, 0
  %r168 = add i32 0, 0
  br label %bb2

bb2:
  %r170 = phi i32 [ %r168, %bb1 ], [ %r176, %bb5 ]
  %r102 = icmp sgt i32 1, 0
  br i1 %r102, label %bb3, label %bb4

bb3:
  %r103 = call i32 @getch()
  %r104 = load i32, i32* @ascii_0
  %r176 = sub i32 %r103, %r104
  %r107 = icmp slt i32 %r176, 0
  br i1 %r107, label %bb5, label %bb8

bb8:
  %r109 = icmp sgt i32 %r176, 9
  br i1 %r109, label %bb5, label %bb6

bb5:
  br label %bb2

bb6:
  br label %bb4

bb4:
  %r171 = phi i32 [ %r170, %bb2 ], [ %r176, %bb6 ]
  %r172 = add i32 %r171, 0
  br label %bb9

bb9:
  %r173 = phi i32 [ %r172, %bb4 ], [ %r175, %bb14 ]
  %r111 = icmp sgt i32 1, 0
  br i1 %r111, label %bb10, label %bb11

bb10:
  %r112 = call i32 @getch()
  %r113 = load i32, i32* @ascii_0
  %r174 = sub i32 %r112, %r113
  %r116 = icmp sge i32 %r174, 0
  br i1 %r116, label %bb15, label %bb13

bb15:
  %r118 = icmp sle i32 %r174, 9
  br i1 %r118, label %bb12, label %bb13

bb12:
  %r120 = mul i32 %r173, 10
  %r175 = add i32 %r120, %r174
  br label %bb14

bb13:
  br label %bb11

bb14:
  br label %bb9

bb11:
  ret i32 %r173
}

define i32 @mod( i32 %r124, i32 %r126 ) {
bb31:
  %r177 = add i32 0, 0
  %r179 = add i32 %r124, 0
  %r178 = add i32 0, 0
  %r180 = add i32 %r126, 0
  br label %bb16

bb16:
  %r131 = sdiv i32 %r179, %r180
  %r133 = mul i32 %r131, %r180
  %r134 = sub i32 %r179, %r133
  ret i32 %r134
}

define void @my_putint( i32 %r135 ) {
bb32:
  %r181 = add i32 0, 0
  %r137 = alloca [ 16 x i32 ]
  %r182 = add i32 0, 0
  %r183 = add i32 %r135, 0
  br label %bb17

bb17:
  %r184 = add i32 0, 0
  br label %bb18

bb18:
  %r185 = phi i32 [ %r183, %bb17 ], [ %r189, %bb19 ]
  %r186 = phi i32 [ %r184, %bb17 ], [ %r190, %bb19 ]
  %r140 = icmp sgt i32 %r185, 0
  br i1 %r140, label %bb19, label %bb20

bb19:
  %r142 = call i32 @mod(i32 %r185, i32 10)
  %r143 = load i32, i32* @ascii_0
  %r144 = add i32 %r142, %r143
  %r146 = getelementptr [16 x i32 ], [16 x i32 ]* %r137, i32 0, i32 %r186
  store i32 %r144, i32* %r146
  %r189 = sdiv i32 %r185, 10
  %r190 = add i32 %r186, 1
  br label %bb18

bb20:
  br label %bb21

bb21:
  %r187 = phi i32 [ %r186, %bb20 ], [ %r188, %bb22 ]
  %r152 = icmp sgt i32 %r187, 0
  br i1 %r152, label %bb22, label %bb23

bb22:
  %r188 = sub i32 %r187, 1
  %r156 = getelementptr [16 x i32 ], [16 x i32 ]* %r137, i32 0, i32 %r188
  %r157 = load i32, i32* %r156
  call void @putch(i32 %r157)
  br label %bb21

bb23:
  ret void
}

define i32 @main( ) {
bb24:
  %r191 = add i32 0, 0
  call void @_sysy_starttime(i32 51)
  %r192 = add i32 0, 0
  %r193 = call i32 @my_getint()
  br label %bb25

bb25:
  %r194 = phi i32 [ %r193, %bb24 ], [ %r196, %bb26 ]
  %r161 = icmp sgt i32 %r194, 0
  br i1 %r161, label %bb26, label %bb27

bb26:
  %r195 = call i32 @my_getint()
  call void @my_putint(i32 %r195)
  call void @putch(i32 10)
  %r196 = sub i32 %r194, 1
  br label %bb25

bb27:
  call void @_sysy_stoptime(i32 58)
  ret i32 0
}

