declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
bb1:
  %r142 = add i32 0, 0
  %r143 = add i32 0, 0
  %r144 = add i32 0, 0
  %r145 = add i32 0, 0
  %r146 = add i32 0, 0
  %r147 = add i32 0, 0
  %r148 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r149 = add i32 0, 0
  %r150 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r151 = add i32 0, 0
  %r152 = add i32 0, 0
  br label %bb2

bb2:
  %r153 = phi i32 [ %r152, %bb1 ], [ %r172, %bb3 ]
  %r104 = icmp slt i32 %r153, 10
  br i1 %r104, label %bb3, label %bb4

bb3:
  %r106 = add i32 %r153, 1
  %r108 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r153
  store i32 %r106, i32* %r108
  %r172 = add i32 %r153, 1
  br label %bb2

bb4:
  %r154 = add i32 10, 0
  %r155 = call i32 @getint()
  %r156 = sub i32 %r154, 1
  %r157 = add i32 0, 0
  %r121 = add i32 %r156, %r157
  %r158 = sdiv i32 %r121, 2
  %r159 = add i32 0, 0
  %r160 = add i32 0, 0
  %r161 = add i32 0, 0
  br label %bb5

bb5:
  %r162 = phi i32 [ %r160, %bb4 ], [ %r169, %bb11 ]
  %r163 = phi i32 [ %r159, %bb4 ], [ %r167, %bb11 ]
  %r164 = phi i32 [ %r161, %bb4 ], [ %r168, %bb11 ]
  %r126 = icmp slt i32 %r162, 10
  br i1 %r126, label %bb8, label %bb7

bb8:
  %r128 = icmp eq i32 %r163, 0
  br i1 %r128, label %bb6, label %bb7

bb6:
  %r130 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r162
  %r131 = load i32, i32* %r130
  %r133 = icmp eq i32 %r131, %r155
  br i1 %r133, label %bb9, label %bb10

bb9:
  %r170 = add i32 1, 0
  %r171 = add i32 %r162, 0
  br label %bb11

bb10:
  br label %bb11

bb11:
  %r167 = phi i32 [ %r170, %bb9 ], [ %r163, %bb10 ]
  %r168 = phi i32 [ %r171, %bb9 ], [ %r164, %bb10 ]
  %r169 = add i32 %r162, 1
  br label %bb5

bb7:
  %r138 = icmp eq i32 %r163, 1
  br i1 %r138, label %bb12, label %bb13

bb12:
  call void @putint(i32 %r164)
  br label %bb14

bb13:
  %r166 = add i32 0, 0
  call void @putint(i32 %r166)
  br label %bb14

bb14:
  %r165 = add i32 10, 0
  call void @putch(i32 %r165)
  call void @_sysy_stoptime(i32 53)
  ret i32 0
}

