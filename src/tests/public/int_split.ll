declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@N = global i32 0
@newline = global i32 0
define i32 @mod( i32 %r100, i32 %r102 ) {
bb10:
  %r143 = add i32 0, 0
  %r145 = add i32 %r100, 0
  %r144 = add i32 0, 0
  %r146 = add i32 %r102, 0
  br label %bb1

bb1:
  %r107 = sdiv i32 %r145, %r146
  %r109 = mul i32 %r107, %r146
  %r110 = sub i32 %r145, %r109
  ret i32 %r110
}

define i32 @split( i32 %r111, i32* %r113 ) {
bb11:
  %r147 = add i32 0, 0
  %r148 = add i32 0, 0
  %r149 = add i32 %r111, 0
  br label %bb2

bb2:
  %r115 = load i32, i32* @N
  %r150 = sub i32 %r115, 1
  br label %bb3

bb3:
  %r151 = phi i32 [ %r149, %bb2 ], [ %r153, %bb4 ]
  %r152 = phi i32 [ %r150, %bb2 ], [ %r154, %bb4 ]
  %r118 = sub i32 0, 1
  %r119 = icmp ne i32 %r152, %r118
  br i1 %r119, label %bb4, label %bb5

bb4:
  %r121 = call i32 @mod(i32 %r151, i32 10)
  %r123 = getelementptr i32, i32* %r113, i32 %r152
  store i32 %r121, i32* %r123
  %r153 = sdiv i32 %r151, 10
  %r154 = sub i32 %r152, 1
  br label %bb3

bb5:
  ret i32 0
}

define i32 @main( ) {
bb6:
  call void @_sysy_starttime(i32 26)
  store i32 4, i32* @N
  store i32 10, i32* @newline
  %r155 = add i32 0, 0
  %r156 = add i32 0, 0
  %r130 = alloca [ 4 x i32 ]
  %r158 = add i32 1478, 0
  %r159 = call i32 @split(i32 %r158, i32* %r130)
  %r157 = add i32 0, 0
  %r160 = add i32 0, 0
  br label %bb7

bb7:
  %r161 = phi i32 [ %r160, %bb6 ], [ %r163, %bb8 ]
  %r135 = icmp slt i32 %r161, 4
  br i1 %r135, label %bb8, label %bb9

bb8:
  %r137 = getelementptr [4 x i32 ], [4 x i32 ]* %r130, i32 0, i32 %r161
  %r162 = load i32, i32* %r137
  call void @putint(i32 %r162)
  %r140 = load i32, i32* @newline
  call void @putch(i32 %r140)
  %r163 = add i32 %r161, 1
  br label %bb7

bb9:
  call void @_sysy_stoptime(i32 42)
  ret i32 0
}

