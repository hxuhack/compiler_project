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
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  %r103 = alloca i32
  store i32 %r102, i32* %r103
  br label %bb1

bb1:
  %r104 = load i32, i32* %r101
  %r105 = load i32, i32* %r101
  %r106 = load i32, i32* %r103
  %r107 = sdiv i32 %r105, %r106
  %r108 = load i32, i32* %r103
  %r109 = mul i32 %r107, %r108
  %r110 = sub i32 %r104, %r109
  ret i32 %r110
}

define i32 @split( i32 %r111, i32* %r113 ) {
bb11:
  %r114 = alloca i32
  %r112 = alloca i32
  store i32 %r111, i32* %r112
  br label %bb2

bb2:
  %r115 = load i32, i32* @N
  %r116 = sub i32 %r115, 1
  store i32 %r116, i32* %r114
  br label %bb3

bb3:
  %r117 = load i32, i32* %r114
  %r118 = sub i32 0, 1
  %r119 = icmp ne i32 %r117, %r118
  br i1 %r119, label %bb4, label %bb5

bb4:
  %r120 = load i32, i32* %r112
  %r121 = call i32 @mod(i32 %r120, i32 10)
  %r122 = load i32, i32* %r114
  %r123 = getelementptr i32, i32* %r113, i32 %r122
  store i32 %r121, i32* %r123
  %r124 = load i32, i32* %r112
  %r125 = sdiv i32 %r124, 10
  store i32 %r125, i32* %r112
  %r126 = load i32, i32* %r114
  %r127 = sub i32 %r126, 1
  store i32 %r127, i32* %r114
  br label %bb3

bb5:
  ret i32 0
}

define i32 @main( ) {
bb6:
  store i32 4, i32* @N
  store i32 10, i32* @newline
  %r128 = alloca i32
  %r129 = alloca i32
  %r130 = alloca [ 4 x i32 ]
  store i32 1478, i32* %r129
  %r131 = load i32, i32* %r129
  %r132 = call i32 @split(i32 %r131, i32* %r130)
  store i32 %r132, i32* %r129
  %r133 = alloca i32
  store i32 0, i32* %r128
  br label %bb7

bb7:
  %r134 = load i32, i32* %r128
  %r135 = icmp slt i32 %r134, 4
  br i1 %r135, label %bb8, label %bb9

bb8:
  %r136 = load i32, i32* %r128
  %r137 = getelementptr [4 x i32 ], [4 x i32 ]* %r130, i32 0, i32 %r136
  %r138 = load i32, i32* %r137
  store i32 %r138, i32* %r133
  %r139 = load i32, i32* %r133
  call void @putint(i32 %r139)
  %r140 = load i32, i32* @newline
  call void @putch(i32 %r140)
  %r141 = load i32, i32* %r128
  %r142 = add i32 %r141, 1
  store i32 %r142, i32* %r128
  br label %bb7

bb9:
  ret i32 0
}

