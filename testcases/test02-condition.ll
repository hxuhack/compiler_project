
define i32 @main( ) {
bb1:
  %r100 = alloca i32
  store i32 100, i32* %r100
  %r101 = alloca i32
  store i32 0, i32* %r101
  %r102 = alloca i32
  store i32 3000, i32* %r102
  %r103 = alloca i32
  store i32 3000, i32* %r103
  %r104 = load i32, i32* %r102
  %r105 = icmp sgt i32 %r104, 2000
  br i1 %r105, label %bb2, label %bb3

bb2:
  br label %bb5

bb5:
  %r106 = load i32, i32* %r102
  %r107 = icmp slt i32 %r106, 5000
  br i1 %r107, label %bb6, label %bb7

bb6:
  %r108 = load i32, i32* %r102
  %r109 = sub i32 %r108, 1
  store i32 %r109, i32* %r102
  %r110 = load i32, i32* %r101
  %r111 = load i32, i32* %r100
  %r112 = add i32 %r110, %r111
  store i32 %r112, i32* %r101
  br label %bb8

bb8:
  %r113 = load i32, i32* %r101
  %r114 = load i32, i32* %r102
  %r115 = icmp slt i32 %r113, %r114
  br i1 %r115, label %bb9, label %bb10

bb9:
  %r116 = load i32, i32* %r103
  %r117 = load i32, i32* %r101
  %r118 = add i32 %r116, %r117
  store i32 %r118, i32* %r103
  br label %bb8

bb10:
  br label %bb5

bb7:
  br label %bb4

bb3:
  br label %bb4

bb4:
  ret i32 0
}

