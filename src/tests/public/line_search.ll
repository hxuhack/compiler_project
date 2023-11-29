declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
bb1:
  %r151 = add i32 0, 0
  %r152 = add i32 0, 0
  %r153 = add i32 0, 0
  %r154 = add i32 0, 0
  %r155 = add i32 0, 0
  %r156 = add i32 0, 0
  %r157 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r158 = add i32 0, 0
  %r159 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r160 = add i32 0, 0
  %r161 = add i32 0, 0
  br label %bb2

bb2:
  %r162 = phi i32 [ %r161, %bb1 ], [ %r184, %bb3 ]
  %r104 = icmp slt i32 %r162, 10
  br i1 %r104, label %bb3, label %bb4

bb3:
  %r183 = add i32 %r162, 1
  %r108 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r162
  store i32 %r183, i32* %r108
  %r184 = add i32 %r162, 1
  br label %bb2

bb4:
  %r163 = add i32 10, 0
  %r164 = call i32 @getint()
  %r165 = sub i32 %r163, 1
  %r166 = add i32 0, 0
  %r167 = add i32 %r165, %r166
  %r168 = sdiv i32 %r167, 2
  %r169 = add i32 0, 0
  %r170 = add i32 0, 0
  %r171 = add i32 0, 0
  br label %bb5

bb5:
  %r172 = phi i32 [ %r170, %bb4 ], [ %r180, %bb11 ]
  %r173 = phi i32 [ %r169, %bb4 ], [ %r178, %bb11 ]
  %r174 = phi i32 [ %r171, %bb4 ], [ %r179, %bb11 ]
  %r126 = icmp slt i32 %r172, 10
  br i1 %r126, label %bb8, label %bb7

bb8:
  %r128 = icmp eq i32 %r173, 0
  br i1 %r128, label %bb6, label %bb7

bb6:
  %r130 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r172
  %r177 = load i32, i32* %r130
  %r133 = icmp eq i32 %r177, %r164
  br i1 %r133, label %bb9, label %bb10

bb9:
  %r181 = add i32 1, 0
  %r182 = add i32 %r172, 0
  br label %bb11

bb10:
  br label %bb11

bb11:
  %r178 = phi i32 [ %r181, %bb9 ], [ %r173, %bb10 ]
  %r179 = phi i32 [ %r182, %bb9 ], [ %r174, %bb10 ]
  %r180 = add i32 %r172, 1
  br label %bb5

bb7:
  %r138 = icmp eq i32 %r173, 1
  br i1 %r138, label %bb12, label %bb13

bb12:
  call void @putint(i32 %r174)
  br label %bb14

bb13:
  %r176 = add i32 0, 0
  call void @putint(i32 %r176)
  br label %bb14

bb14:
  %r175 = add i32 10, 0
  call void @putch(i32 %r175)
  call void @_sysy_stoptime(i32 53)
  ret i32 0
}

