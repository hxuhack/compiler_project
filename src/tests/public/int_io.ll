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
  %r169 = add i32 0, 0
  %r170 = add i32 0, 0
  %r171 = add i32 0, 0
  br label %bb2

bb2:
  %r172 = phi i32 [ %r171, %bb1 ], [ %r183, %bb5 ]
  %r102 = icmp sgt i32 1, 0
  br i1 %r102, label %bb3, label %bb4

bb3:
  %r181 = call i32 @getch()
  %r182 = load i32, i32* @ascii_0
  %r183 = sub i32 %r181, %r182
  %r107 = icmp slt i32 %r183, 0
  br i1 %r107, label %bb5, label %bb8

bb8:
  %r109 = icmp sgt i32 %r183, 9
  br i1 %r109, label %bb5, label %bb6

bb5:
  br label %bb2

bb6:
  br label %bb4

bb4:
  %r173 = phi i32 [ %r172, %bb2 ], [ %r183, %bb6 ]
  %r174 = add i32 %r173, 0
  br label %bb9

bb9:
  %r175 = phi i32 [ %r174, %bb4 ], [ %r180, %bb14 ]
  %r111 = icmp sgt i32 1, 0
  br i1 %r111, label %bb10, label %bb11

bb10:
  %r176 = call i32 @getch()
  %r177 = load i32, i32* @ascii_0
  %r178 = sub i32 %r176, %r177
  %r116 = icmp sge i32 %r178, 0
  br i1 %r116, label %bb15, label %bb13

bb15:
  %r118 = icmp sle i32 %r178, 9
  br i1 %r118, label %bb12, label %bb13

bb12:
  %r179 = mul i32 %r175, 10
  %r180 = add i32 %r179, %r178
  br label %bb14

bb13:
  br label %bb11

bb14:
  br label %bb9

bb11:
  ret i32 %r175
}

define i32 @mod( i32 %r124, i32 %r126 ) {
bb31:
  %r186 = add i32 0, 0
  %r187 = add i32 %r124, 0
  %r188 = add i32 0, 0
  %r189 = add i32 %r126, 0
  br label %bb16

bb16:
  %r190 = sdiv i32 %r187, %r189
  %r191 = mul i32 %r190, %r189
  %r192 = sub i32 %r187, %r191
  ret i32 %r192
}

define void @my_putint( i32 %r135 ) {
bb32:
  %r195 = add i32 0, 0
  %r137 = alloca [ 16 x i32 ]
  %r196 = add i32 0, 0
  %r197 = add i32 %r135, 0
  br label %bb17

bb17:
  %r198 = add i32 0, 0
  br label %bb18

bb18:
  %r199 = phi i32 [ %r197, %bb17 ], [ %r207, %bb19 ]
  %r200 = phi i32 [ %r198, %bb17 ], [ %r208, %bb19 ]
  %r140 = icmp sgt i32 %r199, 0
  br i1 %r140, label %bb19, label %bb20

bb19:
  %r204 = call i32 @mod(i32 %r199, i32 10)
  %r205 = load i32, i32* @ascii_0
  %r206 = add i32 %r204, %r205
  %r146 = getelementptr [16 x i32 ], [16 x i32 ]* %r137, i32 0, i32 %r200
  store i32 %r206, i32* %r146
  %r207 = sdiv i32 %r199, 10
  %r208 = add i32 %r200, 1
  br label %bb18

bb20:
  br label %bb21

bb21:
  %r201 = phi i32 [ %r200, %bb20 ], [ %r202, %bb22 ]
  %r152 = icmp sgt i32 %r201, 0
  br i1 %r152, label %bb22, label %bb23

bb22:
  %r202 = sub i32 %r201, 1
  %r156 = getelementptr [16 x i32 ], [16 x i32 ]* %r137, i32 0, i32 %r202
  %r203 = load i32, i32* %r156
  call void @putch(i32 %r203)
  br label %bb21

bb23:
  ret void
}

define i32 @main( ) {
bb24:
  %r211 = add i32 0, 0
  call void @_sysy_starttime(i32 51)
  %r212 = add i32 0, 0
  %r213 = call i32 @my_getint()
  br label %bb25

bb25:
  %r214 = phi i32 [ %r213, %bb24 ], [ %r216, %bb26 ]
  %r161 = icmp sgt i32 %r214, 0
  br i1 %r161, label %bb26, label %bb27

bb26:
  %r215 = call i32 @my_getint()
  call void @my_putint(i32 %r215)
  call void @putch(i32 10)
  %r216 = sub i32 %r214, 1
  br label %bb25

bb27:
  call void @_sysy_stoptime(i32 58)
  ret i32 0
}

