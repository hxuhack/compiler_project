declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
bb1:
  %r159 = add i32 0, 0
  %r160 = add i32 0, 0
  %r161 = add i32 0, 0
  %r162 = add i32 0, 0
  %r163 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r164 = add i32 0, 0
  %r165 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r166 = add i32 0, 0
  %r167 = add i32 0, 0
  br label %bb2

bb2:
  %r168 = phi i32 [ %r167, %bb1 ], [ %r190, %bb3 ]
  %r104 = icmp slt i32 %r168, 10
  br i1 %r104, label %bb3, label %bb4

bb3:
  %r189 = add i32 %r168, 1
  %r108 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r168
  store i32 %r189, i32* %r108
  %r190 = add i32 %r168, 1
  br label %bb2

bb4:
  %r169 = add i32 10, 0
  %r170 = call i32 @getint()
  %r171 = sub i32 %r169, 1
  %r172 = add i32 0, 0
  %r173 = add i32 %r171, %r172
  %r174 = sdiv i32 %r173, 2
  br label %bb5

bb5:
  %r175 = phi i32 [ %r171, %bb4 ], [ %r185, %bb11 ]
  %r176 = phi i32 [ %r172, %bb4 ], [ %r186, %bb11 ]
  %r177 = phi i32 [ %r174, %bb4 ], [ %r183, %bb11 ]
  %r124 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r177
  %r178 = load i32, i32* %r124
  %r127 = icmp ne i32 %r178, %r170
  br i1 %r127, label %bb8, label %bb7

bb8:
  %r130 = icmp slt i32 %r176, %r175
  br i1 %r130, label %bb6, label %bb7

bb6:
  %r182 = add i32 %r175, %r176
  %r183 = sdiv i32 %r182, 2
  %r137 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r183
  %r184 = load i32, i32* %r137
  %r139 = icmp slt i32 %r170, %r184
  br i1 %r139, label %bb9, label %bb10

bb9:
  %r188 = sub i32 %r183, 1
  br label %bb11

bb10:
  %r187 = add i32 %r183, 1
  br label %bb11

bb11:
  %r185 = phi i32 [ %r188, %bb9 ], [ %r175, %bb10 ]
  %r186 = phi i32 [ %r176, %bb9 ], [ %r187, %bb10 ]
  br label %bb5

bb7:
  %r146 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r177
  %r179 = load i32, i32* %r146
  %r148 = icmp eq i32 %r170, %r179
  br i1 %r148, label %bb12, label %bb13

bb12:
  call void @putint(i32 %r170)
  br label %bb14

bb13:
  %r181 = add i32 0, 0
  call void @putint(i32 %r181)
  br label %bb14

bb14:
  %r180 = add i32 10, 0
  call void @putch(i32 %r180)
  call void @_sysy_stoptime(i32 49)
  ret i32 0
}

