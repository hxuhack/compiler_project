@a = global [ 10 x i32 ] zeroinitializer
@b = global i32 27
@c = global i32 1
define i32 @main( ) {
bb1:
  %r100 = alloca i32
  store i32 0, i32* %r100
  %r101 = alloca i32
  store i32 0, i32* %r101
  %r102 = alloca i32
  store i32 200, i32* %r102
  %r103 = alloca i32
  store i32 0, i32* %r103
  br label %bb2

bb2:
  %r104 = load i32, i32* %r100
  %r105 = icmp slt i32 %r104, 10
  br i1 %r105, label %bb3, label %bb4

bb3:
  %r106 = load i32, i32* %r100
  %r107 = getelementptr [10 x i32 ], [10 x i32 ]* @a, i32 0, i32 1
  store i32 %r106, i32* %r107
  %r108 = load i32, i32* %r100
  %r109 = add i32 %r108, 1
  store i32 %r109, i32* %r100
  br label %bb2

bb4:
  store i32 0, i32* %r100
  %r110 = load i32, i32* %r100
  %r111 = icmp slt i32 %r110, 10
  br i1 %r111, label %bb5, label %bb6

bb5:
  %r112 = load i32, i32* %r101
  %r113 = getelementptr [10 x i32 ], [10 x i32 ]* @a, i32 0, i32 0
  %r114 = load i32, i32* %r113
  %r115 = add i32 %r112, %r114
  store i32 %r115, i32* %r101
  %r116 = load i32, i32* %r100
  %r117 = mul i32 %r116, 2
  store i32 %r117, i32* %r100
  br label %bb7

bb6:
  br label %bb7

bb7:
  ret i32 0
}

