declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
bb1:
  %r121 = alloca i32
  %r119 = alloca i32
  %r117 = alloca i32
  %r115 = alloca i32
  %r113 = alloca i32
  %r109 = alloca i32
  call void @_sysy_starttime(i32 2)
  %r100 = alloca i32
  store i32 0, i32* %r100
  %r101 = alloca i32
  %r102 = alloca i32
  %r104 = icmp slt i32 1, 9
  br i1 %r104, label %bb5, label %bb3

bb5:
  %r105 = load i32, i32* %r100
  %r106 = icmp sgt i32 %r105, 0
  br i1 %r106, label %bb2, label %bb3

bb2:
  store i32 1, i32* %r102
  br label %bb4

bb3:
  store i32 0, i32* %r102
  br label %bb4

bb4:
  %r103 = load i32, i32* %r102
  store i32 %r103, i32* %r101
  br label %bb6

bb6:
  %r107 = load i32, i32* %r100
  %r108 = icmp slt i32 %r107, 1000000
  br i1 %r108, label %bb7, label %bb8

bb7:
  store i32 0, i32* %r109
  %r110 = load i32, i32* %r100
  %r111 = add i32 %r110, 1
  store i32 %r111, i32* %r100
  br label %bb6

bb8:
  %r112 = load i32, i32* %r101
  call void @putint(i32 %r112)
  call void @_sysy_stoptime(i32 10)
  ret i32 0
bb9:
  store i32 1, i32* %r113
  %r114 = load i32, i32* %r113
  ret i32 %r114
bb10:
  store i32 2, i32* %r115
  %r116 = load i32, i32* %r115
  ret i32 %r116
bb11:
  store i32 3, i32* %r117
  %r118 = load i32, i32* %r117
  ret i32 %r118
bb12:
  store i32 4, i32* %r119
  %r120 = load i32, i32* %r119
  ret i32 %r120
bb13:
  store i32 5, i32* %r121
  ret i32 0
}

