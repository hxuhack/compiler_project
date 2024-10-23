declare i32 @getch( )
declare i32 @getint( )
declare void @putint( i32 )
declare void @putch( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@b = global [ 10 x i32 ] zeroinitializer
define void @foo( i32* %r100 ) {
bb1:
  %r101 = alloca i32
  store i32 0, i32* %r101
  br label %bb2

bb2:
  %r102 = load i32, i32* %r101
  %r103 = icmp slt i32 %r102, 10
  br i1 %r103, label %bb3, label %bb4

bb3:
  %r104 = call i32 @getint()
  %r105 = load i32, i32* %r101
  %r106 = getelementptr i32, i32* %r100, i32 %r105
  store i32 %r104, i32* %r106
  %r107 = load i32, i32* %r101
  %r108 = add i32 %r107, 1
  store i32 %r108, i32* %r101
  br label %bb2

bb4:
  ret void
}

define i32 @main( ) {
bb5:
  call void @_sysy_starttime(i32 13)
  %r109 = alloca i32
  store i32 0, i32* %r109
  %r110 = alloca i32
  store i32 0, i32* %r110
  call void @foo(i32* @b)
  br label %bb6

bb6:
  %r111 = load i32, i32* %r109
  %r112 = icmp slt i32 %r111, 10
  br i1 %r112, label %bb7, label %bb8

bb7:
  %r113 = load i32, i32* %r110
  %r114 = load i32, i32* %r109
  %r115 = getelementptr [10 x i32 ], [10 x i32 ]* @b, i32 0, i32 %r114
  %r116 = load i32, i32* %r115
  %r117 = add i32 %r113, %r116
  store i32 %r117, i32* %r110
  %r118 = load i32, i32* %r109
  %r119 = add i32 %r118, 1
  store i32 %r119, i32* %r109
  br label %bb6

bb8:
  call void @putarray(i32 10, i32* @b)
  %r120 = load i32, i32* %r110
  call void @putint(i32 %r120)
  call void @_sysy_stoptime(i32 24)
  ret i32 0
}

