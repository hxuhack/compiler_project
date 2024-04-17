declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @uniquePaths( i32 %r100, i32 %r102 ) {
bb19:
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r185 = add i32 0, 0
  %r186 = add i32 0, 0
  %r187 = add i32 0, 0
  %r108 = alloca [ 9 x i32 ]
  %r188 = add i32 0, 0
  %r190 = add i32 %r100, 0
  %r189 = add i32 0, 0
  %r191 = add i32 %r102, 0
  br label %bb1

bb1:
  %r105 = icmp eq i32 %r190, 1
  br i1 %r105, label %bb2, label %bb5

bb5:
  %r107 = icmp eq i32 %r191, 1
  br i1 %r107, label %bb2, label %bb3

bb2:
  ret i32 1
bb3:
  br label %bb4

bb4:
  %r192 = add i32 0, 0
  br label %bb6

bb6:
  %r193 = phi i32 [ %r192, %bb4 ], [ %r208, %bb7 ]
  %r116 = icmp slt i32 %r193, %r190
  br i1 %r116, label %bb7, label %bb8

bb7:
  %r118 = mul i32 %r193, 3
  %r120 = add i32 %r118, %r191
  %r207 = sub i32 %r120, 1
  %r123 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r207
  store i32 1, i32* %r123
  %r208 = add i32 %r193, 1
  br label %bb6

bb8:
  %r194 = add i32 0, 0
  br label %bb9

bb9:
  %r195 = phi i32 [ %r194, %bb8 ], [ %r206, %bb10 ]
  %r128 = icmp slt i32 %r195, %r191
  br i1 %r128, label %bb10, label %bb11

bb10:
  %r130 = sub i32 %r190, 1
  %r131 = mul i32 %r130, 3
  %r205 = add i32 %r131, %r195
  %r135 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r205
  store i32 1, i32* %r135
  %r206 = add i32 %r195, 1
  br label %bb9

bb11:
  %r196 = sub i32 %r190, 2
  br label %bb12

bb12:
  %r197 = phi i32 [ %r196, %bb11 ], [ %r200, %bb17 ]
  %r141 = sub i32 0, 1
  %r142 = icmp sgt i32 %r197, %r141
  br i1 %r142, label %bb13, label %bb14

bb13:
  %r198 = sub i32 %r191, 2
  br label %bb15

bb15:
  %r199 = phi i32 [ %r198, %bb13 ], [ %r204, %bb16 ]
  %r146 = sub i32 0, 1
  %r147 = icmp sgt i32 %r199, %r146
  br i1 %r147, label %bb16, label %bb17

bb16:
  %r149 = mul i32 %r197, 3
  %r201 = add i32 %r149, %r199
  %r153 = add i32 %r197, 1
  %r154 = mul i32 %r153, 3
  %r202 = add i32 %r154, %r199
  %r158 = mul i32 %r197, 3
  %r160 = add i32 %r158, %r199
  %r203 = add i32 %r160, 1
  %r163 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r202
  %r164 = load i32, i32* %r163
  %r166 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r203
  %r167 = load i32, i32* %r166
  %r168 = add i32 %r164, %r167
  %r170 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r201
  store i32 %r168, i32* %r170
  %r204 = sub i32 %r199, 1
  br label %bb15

bb17:
  %r200 = sub i32 %r197, 1
  br label %bb12

bb14:
  %r175 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 0
  %r176 = load i32, i32* %r175
  ret i32 %r176
}

define i32 @main( ) {
bb18:
  call void @_sysy_starttime(i32 40)
  %r209 = add i32 0, 0
  %r210 = add i32 0, 0
  %r211 = add i32 3, 0
  %r212 = call i32 @uniquePaths(i32 %r211, i32 %r211)
  call void @_sysy_stoptime(i32 45)
  ret i32 %r212
}

