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
  %r162 = add i32 0, 0
  %r163 = add i32 0, 0
  %r164 = add i32 0, 0
  %r165 = add i32 0, 0
  %r166 = add i32 %r101, 0
  br label %bb1

bb1:
  %r167 = add i32 0, 0
  br label %bb2

bb2:
  %r168 = phi i32 [ %r167, %bb1 ], [ %r176, %bb3 ]
  %r107 = getelementptr i32, i32* %r100, i32 %r168
  %r169 = load i32, i32* %r107
  %r109 = icmp sgt i32 %r166, %r169
  br i1 %r109, label %bb5, label %bb4

bb5:
  %r175 = load i32, i32* @N
  %r112 = icmp slt i32 %r168, %r175
  br i1 %r112, label %bb3, label %bb4

bb3:
  %r176 = add i32 %r168, 1
  br label %bb2

bb4:
  %r170 = load i32, i32* @N
  br label %bb6

bb6:
  %r171 = phi i32 [ %r170, %bb4 ], [ %r174, %bb7 ]
  %r118 = icmp sgt i32 %r171, %r168
  br i1 %r118, label %bb7, label %bb8

bb7:
  %r172 = sub i32 %r171, 1
  %r123 = getelementptr i32, i32* %r100, i32 %r172
  %r173 = load i32, i32* %r123
  %r126 = getelementptr i32, i32* %r100, i32 %r171
  store i32 %r173, i32* %r126
  %r129 = getelementptr i32, i32* %r100, i32 %r168
  store i32 %r166, i32* %r129
  %r174 = sub i32 %r171, 1
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
  %r179 = add i32 0, 0
  %r180 = add i32 0, 0
  %r181 = add i32 0, 0
  %r182 = call i32 @getint()
  %r183 = call i32 @insert(i32* %r132, i32 %r182)
  br label %bb10

bb10:
  %r184 = phi i32 [ %r181, %bb9 ], [ %r188, %bb11 ]
  %r185 = load i32, i32* @N
  %r150 = icmp slt i32 %r184, %r185
  br i1 %r150, label %bb11, label %bb12

bb11:
  %r152 = getelementptr [11 x i32 ], [11 x i32 ]* %r132, i32 0, i32 %r184
  %r186 = load i32, i32* %r152
  call void @putint(i32 %r186)
  %r187 = add i32 10, 0
  call void @putch(i32 %r187)
  %r188 = add i32 %r184, 1
  br label %bb10

bb12:
  call void @_sysy_stoptime(i32 54)
  ret i32 0
}

