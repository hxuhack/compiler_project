declare i32 @getch( )
declare i32 @getint( )
declare void @putint( i32 )
declare void @putch( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
bb1:
  %r116 = alloca i32
  %r114 = alloca i32
  %r112 = alloca i32
  %r110 = alloca i32
  %r108 = alloca i32
  %r104 = alloca i32
  call void @_sysy_starttime(i32 2)
  %r100 = alloca i32
  store i32 0, i32* %r100
  %r101 = alloca i32
  store i32 1, i32* %r101
  br label %bb2

bb2:
  %r102 = load i32, i32* %r100
  %r103 = icmp slt i32 %r102, 1000000
  br i1 %r103, label %bb3, label %bb4

bb3:
  store i32 0, i32* %r104
  %r105 = load i32, i32* %r100
  %r106 = add i32 %r105, 1
  store i32 %r106, i32* %r100
  br label %bb2

bb4:
  %r107 = load i32, i32* %r101
  call void @putint(i32 %r107)
  call void @_sysy_stoptime(i32 10)
  ret i32 0
bb5:
  store i32 1, i32* %r108
  %r109 = load i32, i32* %r108
  ret i32 %r109
bb6:
  store i32 2, i32* %r110
  %r111 = load i32, i32* %r110
  ret i32 %r111
bb7:
  store i32 3, i32* %r112
  %r113 = load i32, i32* %r112
  ret i32 %r113
bb8:
  store i32 4, i32* %r114
  %r115 = load i32, i32* %r114
  ret i32 %r115
bb9:
  store i32 5, i32* %r116
  ret i32 0
}

