declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@N = global i32 0
define i32 @insert( i32* %r100, i32 %r101 ) {
bb13:
  %r158 = add i32 0, 0
  %r159 = add i32 0, 0
  %r160 = add i32 0, 0
  %r161 = add i32 0, 0
  %r162 = add i32 %r101, 0
  br label %bb1

bb1:
  %r163 = add i32 0, 0
  br label %bb2

bb2:
  %r164 = phi i32 [ %r163, %bb1 ], [ %r169, %bb3 ]
  %r107 = getelementptr i32, i32* %r100, i32 %r164
  %r108 = load i32, i32* %r107
  %r109 = icmp sgt i32 %r162, %r108
  br i1 %r109, label %bb5, label %bb4

bb5:
  %r111 = load i32, i32* @N
  %r112 = icmp slt i32 %r164, %r111
  br i1 %r112, label %bb3, label %bb4

bb3:
  %r169 = add i32 %r164, 1
  br label %bb2

bb4:
  %r165 = load i32, i32* @N
  br label %bb6

bb6:
  %r166 = phi i32 [ %r165, %bb4 ], [ %r168, %bb7 ]
  %r118 = icmp sgt i32 %r166, %r164
  br i1 %r118, label %bb7, label %bb8

bb7:
  %r167 = sub i32 %r166, 1
  %r123 = getelementptr i32, i32* %r100, i32 %r167
  %r124 = load i32, i32* %r123
  %r126 = getelementptr i32, i32* %r100, i32 %r166
  store i32 %r124, i32* %r126
  %r129 = getelementptr i32, i32* %r100, i32 %r164
  store i32 %r162, i32* %r129
  %r168 = sub i32 %r166, 1
  br label %bb6

bb8:
  ret i32 0
}

define i32 @main( ) {
bb9:
  call void @_sysy_starttime(i32 27)
  store i32 10, i32* @N
  %r132 = alloca [ 11 x i32 ]
  %r133 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 0
  store i32 1, i32* %r133
  %r134 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 1
  store i32 3, i32* %r134
  %r135 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 2
  store i32 4, i32* %r135
  %r136 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 3
  store i32 7, i32* %r136
  %r137 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 4
  store i32 8, i32* %r137
  %r138 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 5
  store i32 11, i32* %r138
  %r139 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 6
  store i32 13, i32* %r139
  %r140 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 7
  store i32 18, i32* %r140
  %r141 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 8
  store i32 56, i32* %r141
  %r142 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 9
  store i32 78, i32* %r142
  %r170 = add i32 0, 0
  %r171 = add i32 0, 0
  %r172 = add i32 0, 0
  %r173 = call i32 @getint()
  %r174 = call i32 @insert(i32* %r132, i32 %r173)
  br label %bb10

bb10:
  %r175 = phi i32 [ %r172, %bb9 ], [ %r178, %bb11 ]
  %r149 = load i32, i32* @N
  %r150 = icmp slt i32 %r175, %r149
  br i1 %r150, label %bb11, label %bb12

bb11:
  %r152 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 %r175
  %r176 = load i32, i32* %r152
  call void @putint(i32 %r176)
  %r177 = add i32 10, 0
  call void @putch(i32 %r177)
  %r178 = add i32 %r175, 1
  br label %bb10

bb12:
  call void @_sysy_stoptime(i32 54)
  ret i32 0
}

