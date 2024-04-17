declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @canJump( i32* %r100, i32 %r101 ) {
bb24:
  %r179 = add i32 0, 0
  %r180 = add i32 0, 0
  %r181 = add i32 0, 0
  %r110 = alloca [ 10 x i32 ]
  %r182 = add i32 0, 0
  %r183 = add i32 %r101, 0
  br label %bb1

bb1:
  %r104 = icmp eq i32 %r183, 1
  br i1 %r104, label %bb2, label %bb3

bb2:
  ret i32 1
bb3:
  br label %bb4

bb4:
  %r105 = getelementptr i32, i32* %r100, i32 0
  %r106 = load i32, i32* %r105
  %r108 = sub i32 %r183, 2
  %r109 = icmp sgt i32 %r106, %r108
  br i1 %r109, label %bb5, label %bb6

bb5:
  ret i32 1
bb6:
  br label %bb7

bb7:
  %r184 = add i32 0, 0
  br label %bb8

bb8:
  %r185 = phi i32 [ %r184, %bb7 ], [ %r196, %bb9 ]
  %r114 = sub i32 %r183, 1
  %r115 = icmp slt i32 %r185, %r114
  br i1 %r115, label %bb9, label %bb10

bb9:
  %r117 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 %r185
  store i32 0, i32* %r117
  %r196 = add i32 %r185, 1
  br label %bb8

bb10:
  %r186 = sub i32 %r183, 1
  %r124 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 %r186
  store i32 1, i32* %r124
  %r187 = sub i32 %r183, 2
  br label %bb11

bb11:
  %r188 = phi i32 [ %r187, %bb10 ], [ %r191, %bb19 ]
  %r128 = sub i32 0, 1
  %r129 = icmp sgt i32 %r188, %r128
  br i1 %r129, label %bb12, label %bb13

bb12:
  %r132 = getelementptr i32, i32* %r100, i32 %r188
  %r133 = load i32, i32* %r132
  %r135 = sub i32 %r183, 1
  %r137 = sub i32 %r135, %r188
  %r138 = icmp slt i32 %r133, %r137
  br i1 %r138, label %bb14, label %bb15

bb14:
  %r140 = getelementptr i32, i32* %r100, i32 %r188
  %r195 = load i32, i32* %r140
  br label %bb16

bb15:
  %r143 = sub i32 %r183, 1
  %r194 = sub i32 %r143, %r188
  br label %bb16

bb16:
  %r189 = phi i32 [ %r195, %bb14 ], [ %r194, %bb15 ]
  br label %bb17

bb17:
  %r190 = phi i32 [ %r189, %bb16 ], [ %r193, %bb22 ]
  %r147 = sub i32 0, 1
  %r148 = icmp sgt i32 %r190, %r147
  br i1 %r148, label %bb18, label %bb19

bb18:
  %r192 = add i32 %r188, %r190
  %r153 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 %r192
  %r154 = load i32, i32* %r153
  %r155 = icmp ne i32 %r154, 0
  br i1 %r155, label %bb20, label %bb21

bb20:
  %r157 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 %r188
  store i32 1, i32* %r157
  br label %bb22

bb21:
  br label %bb22

bb22:
  %r193 = sub i32 %r190, 1
  br label %bb17

bb19:
  %r191 = sub i32 %r188, 1
  br label %bb11

bb13:
  %r162 = getelementptr [10 x i32 ], [10 x i32 ]* %r110, i32 0, i32 0
  %r163 = load i32, i32* %r162
  ret i32 %r163
}

define i32 @main( ) {
bb23:
  call void @_sysy_starttime(i32 42)
  %r197 = add i32 0, 0
  %r165 = alloca [ 10 x i32 ]
  %r166 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 0
  store i32 3, i32* %r166
  %r167 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 1
  store i32 3, i32* %r167
  %r168 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 2
  store i32 9, i32* %r168
  %r169 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 3
  store i32 0, i32* %r169
  %r170 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 4
  store i32 0, i32* %r170
  %r171 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 5
  store i32 1, i32* %r171
  %r172 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 6
  store i32 1, i32* %r172
  %r173 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 7
  store i32 5, i32* %r173
  %r174 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 8
  store i32 7, i32* %r174
  %r175 = getelementptr [10 x i32 ], [10 x i32 ]* %r165, i32 0, i32 9
  store i32 8, i32* %r175
  %r198 = add i32 10, 0
  %r199 = call i32 @canJump(i32* %r165, i32 %r198)
  call void @_sysy_stoptime(i32 49)
  ret i32 %r199
}

