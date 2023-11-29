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
  %r145 = add i32 0, 0
  %r146 = add i32 %r100, 0
  %r147 = add i32 0, 0
  %r148 = add i32 %r102, 0
  br label %bb1

bb1:
  %r149 = sdiv i32 %r146, %r148
  %r150 = mul i32 %r149, %r148
  %r151 = sub i32 %r146, %r150
  ret i32 %r151
}

define i32 @split( i32 %r111, i32* %r113 ) {
bb11:
  %r154 = add i32 0, 0
  %r155 = add i32 0, 0
  %r156 = add i32 %r111, 0
  br label %bb2

bb2:
  %r157 = load i32, i32* @N
  %r158 = sub i32 %r157, 1
  br label %bb3

bb3:
  %r159 = phi i32 [ %r156, %bb2 ], [ %r163, %bb4 ]
  %r160 = phi i32 [ %r158, %bb2 ], [ %r164, %bb4 ]
  %r161 = sub i32 0, 1
  %r119 = icmp ne i32 %r160, %r161
  br i1 %r119, label %bb4, label %bb5

bb4:
  %r162 = call i32 @mod(i32 %r159, i32 10)
  %r123 = getelementptr i32, i32* %r113, i32 %r160
  store i32 %r162, i32* %r123
  %r163 = sdiv i32 %r159, 10
  %r164 = sub i32 %r160, 1
  br label %bb3

bb5:
  ret i32 0
}

define i32 @main( ) {
bb6:
  call void @_sysy_starttime(i32 26)
  store i32 4, i32* @N
  store i32 10, i32* @newline
  %r168 = add i32 0, 0
  %r169 = add i32 0, 0
  %r130 = alloca [ 4 x i32 ]
  %r170 = add i32 1478, 0
  %r171 = call i32 @split(i32 %r170, i32* %r130)
  %r172 = add i32 0, 0
  %r173 = add i32 0, 0
  br label %bb7

bb7:
  %r174 = phi i32 [ %r173, %bb6 ], [ %r177, %bb8 ]
  %r135 = icmp slt i32 %r174, 4
  br i1 %r135, label %bb8, label %bb9

bb8:
  %r137 = getelementptr [4 x i32 ], [4 x i32 ]* %r130, i32 0, i32 %r174
  %r175 = load i32, i32* %r137
  call void @putint(i32 %r175)
  %r176 = load i32, i32* @newline
  call void @putch(i32 %r176)
  %r177 = add i32 %r174, 1
  br label %bb7

bb9:
  call void @_sysy_stoptime(i32 42)
  ret i32 0
}

