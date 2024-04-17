declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
bb1:
  %r152 = add i32 0, 0
  %r153 = add i32 0, 0
  %r154 = add i32 0, 0
  %r155 = add i32 0, 0
  %r156 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r157 = add i32 0, 0
  %r158 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r159 = add i32 0, 0
  %r160 = add i32 0, 0
  br label %bb2

bb2:
  %r161 = phi i32 [ %r160, %bb1 ], [ %r177, %bb3 ]
  %r104 = icmp slt i32 %r161, 10
  br i1 %r104, label %bb3, label %bb4

bb3:
  %r106 = add i32 %r161, 1
  %r108 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r161
  store i32 %r106, i32* %r108
  %r177 = add i32 %r161, 1
  br label %bb2

bb4:
  %r162 = add i32 10, 0
  %r163 = call i32 @getint()
  %r164 = sub i32 %r162, 1
  %r165 = add i32 0, 0
  %r121 = add i32 %r164, %r165
  %r166 = sdiv i32 %r121, 2
  br label %bb5

bb5:
  %r167 = phi i32 [ %r164, %bb4 ], [ %r173, %bb11 ]
  %r168 = phi i32 [ %r165, %bb4 ], [ %r174, %bb11 ]
  %r169 = phi i32 [ %r166, %bb4 ], [ %r172, %bb11 ]
  %r124 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r169
  %r125 = load i32, i32* %r124
  %r127 = icmp ne i32 %r125, %r163
  br i1 %r127, label %bb8, label %bb7

bb8:
  %r130 = icmp slt i32 %r168, %r167
  br i1 %r130, label %bb6, label %bb7

bb6:
  %r133 = add i32 %r167, %r168
  %r172 = sdiv i32 %r133, 2
  %r137 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r172
  %r138 = load i32, i32* %r137
  %r139 = icmp slt i32 %r163, %r138
  br i1 %r139, label %bb9, label %bb10

bb9:
  %r176 = sub i32 %r172, 1
  br label %bb11

bb10:
  %r175 = add i32 %r172, 1
  br label %bb11

bb11:
  %r173 = phi i32 [ %r176, %bb9 ], [ %r167, %bb10 ]
  %r174 = phi i32 [ %r168, %bb9 ], [ %r175, %bb10 ]
  br label %bb5

bb7:
  %r146 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r169
  %r147 = load i32, i32* %r146
  %r148 = icmp eq i32 %r163, %r147
  br i1 %r148, label %bb12, label %bb13

bb12:
  call void @putint(i32 %r163)
  br label %bb14

bb13:
  %r171 = add i32 0, 0
  call void @putint(i32 %r171)
  br label %bb14

bb14:
  %r170 = add i32 10, 0
  call void @putch(i32 %r170)
  call void @_sysy_stoptime(i32 49)
  ret i32 0
}

