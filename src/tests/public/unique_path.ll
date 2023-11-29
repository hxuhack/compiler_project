declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @uniquePaths( i32 %r100, i32 %r102 ) {
bb19:
  %r190 = add i32 0, 0
  %r191 = add i32 0, 0
  %r192 = add i32 0, 0
  %r193 = add i32 0, 0
  %r194 = add i32 0, 0
  %r108 = alloca [ 9 x i32 ]
  %r195 = add i32 0, 0
  %r196 = add i32 %r100, 0
  %r197 = add i32 0, 0
  %r198 = add i32 %r102, 0
  br label %bb1

bb1:
  %r105 = icmp eq i32 %r196, 1
  br i1 %r105, label %bb2, label %bb5

bb5:
  %r107 = icmp eq i32 %r198, 1
  br i1 %r107, label %bb2, label %bb3

bb2:
  ret i32 1
bb3:
  br label %bb4

bb4:
  %r199 = add i32 0, 0
  br label %bb6

bb6:
  %r200 = phi i32 [ %r199, %bb4 ], [ %r230, %bb7 ]
  %r116 = icmp slt i32 %r200, %r196
  br i1 %r116, label %bb7, label %bb8

bb7:
  %r227 = mul i32 %r200, 3
  %r228 = add i32 %r227, %r198
  %r229 = sub i32 %r228, 1
  %r123 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r229
  store i32 1, i32* %r123
  %r230 = add i32 %r200, 1
  br label %bb6

bb8:
  %r201 = add i32 0, 0
  br label %bb9

bb9:
  %r202 = phi i32 [ %r201, %bb8 ], [ %r226, %bb10 ]
  %r128 = icmp slt i32 %r202, %r198
  br i1 %r128, label %bb10, label %bb11

bb10:
  %r223 = sub i32 %r196, 1
  %r224 = mul i32 %r223, 3
  %r225 = add i32 %r224, %r202
  %r135 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r225
  store i32 1, i32* %r135
  %r226 = add i32 %r202, 1
  br label %bb9

bb11:
  %r203 = sub i32 %r196, 2
  br label %bb12

bb12:
  %r204 = phi i32 [ %r203, %bb11 ], [ %r210, %bb17 ]
  %r205 = sub i32 0, 1
  %r142 = icmp sgt i32 %r204, %r205
  br i1 %r142, label %bb13, label %bb14

bb13:
  %r207 = sub i32 %r198, 2
  br label %bb15

bb15:
  %r208 = phi i32 [ %r207, %bb13 ], [ %r222, %bb16 ]
  %r209 = sub i32 0, 1
  %r147 = icmp sgt i32 %r208, %r209
  br i1 %r147, label %bb16, label %bb17

bb16:
  %r211 = mul i32 %r204, 3
  %r212 = add i32 %r211, %r208
  %r213 = add i32 %r204, 1
  %r214 = mul i32 %r213, 3
  %r215 = add i32 %r214, %r208
  %r216 = mul i32 %r204, 3
  %r217 = add i32 %r216, %r208
  %r218 = add i32 %r217, 1
  %r163 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r215
  %r219 = load i32, i32* %r163
  %r166 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r218
  %r220 = load i32, i32* %r166
  %r221 = add i32 %r219, %r220
  %r170 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 %r212
  store i32 %r221, i32* %r170
  %r222 = sub i32 %r208, 1
  br label %bb15

bb17:
  %r210 = sub i32 %r204, 1
  br label %bb12

bb14:
  %r175 = getelementptr [9 x i32 ], [9 x i32 ]* %r108, i32 0, i32 0
  %r206 = load i32, i32* %r175
  ret i32 %r206
}

define i32 @main( ) {
bb18:
  call void @_sysy_starttime(i32 40)
  %r233 = add i32 0, 0
  %r234 = add i32 0, 0
  %r235 = add i32 3, 0
  %r236 = call i32 @uniquePaths(i32 %r235, i32 %r235)
  call void @_sysy_stoptime(i32 45)
  ret i32 %r236
}

