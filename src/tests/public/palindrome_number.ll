declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @mod( i32 %r100, i32 %r102 ) {
bb14:
  %r148 = add i32 0, 0
  %r149 = add i32 %r100, 0
  %r150 = add i32 0, 0
  %r151 = add i32 %r102, 0
  br label %bb1

bb1:
  %r152 = sdiv i32 %r149, %r151
  %r153 = mul i32 %r152, %r151
  %r154 = sub i32 %r149, %r153
  ret i32 %r154
}

define i32 @palindrome( i32 %r111 ) {
bb15:
  %r158 = add i32 0, 0
  %r159 = add i32 0, 0
  %r113 = alloca [ 4 x i32 ]
  %r160 = add i32 0, 0
  %r161 = add i32 %r111, 0
  br label %bb2

bb2:
  %r162 = add i32 0, 0
  br label %bb3

bb3:
  %r163 = phi i32 [ %r161, %bb2 ], [ %r173, %bb4 ]
  %r164 = phi i32 [ %r162, %bb2 ], [ %r174, %bb4 ]
  %r117 = icmp slt i32 %r164, 4
  br i1 %r117, label %bb4, label %bb5

bb4:
  %r172 = call i32 @mod(i32 %r163, i32 10)
  %r121 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 %r164
  store i32 %r172, i32* %r121
  %r173 = sdiv i32 %r163, 10
  %r174 = add i32 %r164, 1
  br label %bb3

bb5:
  %r126 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 0
  %r165 = load i32, i32* %r126
  %r128 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 3
  %r166 = load i32, i32* %r128
  %r130 = icmp eq i32 %r165, %r166
  br i1 %r130, label %bb9, label %bb7

bb9:
  %r131 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 1
  %r169 = load i32, i32* %r131
  %r133 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 2
  %r170 = load i32, i32* %r133
  %r135 = icmp eq i32 %r169, %r170
  br i1 %r135, label %bb6, label %bb7

bb6:
  %r171 = add i32 1, 0
  br label %bb8

bb7:
  %r168 = add i32 0, 0
  br label %bb8

bb8:
  %r167 = phi i32 [ %r171, %bb6 ], [ %r168, %bb7 ]
  ret i32 %r167
}

define i32 @main( ) {
bb10:
  call void @_sysy_starttime(i32 30)
  %r177 = add i32 0, 0
  %r178 = add i32 1221, 0
  %r179 = add i32 0, 0
  %r180 = call i32 @palindrome(i32 %r178)
  %r142 = icmp eq i32 %r180, 1
  br i1 %r142, label %bb11, label %bb12

bb11:
  call void @putint(i32 %r178)
  br label %bb13

bb12:
  %r182 = add i32 0, 0
  call void @putint(i32 %r182)
  br label %bb13

bb13:
  %r181 = add i32 10, 0
  call void @putch(i32 %r181)
  call void @_sysy_stoptime(i32 47)
  ret i32 0
}

