
@x = global i32 27
@y = global i32 0
@z = global i32 0
@a = global [ 666 x i32 ] zeroinitializer
@b = global [ 888 x i32 ] zeroinitializer
define i32 @main( ) {
bb1:
  %r100 = alloca i32
  %r102 = icmp slt i32 1, 2
  br i1 %r102, label %bb5, label %bb3

bb5:
  %r103 = mul i32 5, 3
  %r104 = mul i32 4, 4
  %r105 = icmp slt i32 %r103, %r104
  br i1 %r105, label %bb2, label %bb3

bb2:
  store i32 1, i32* %r100
  br label %bb4

bb3:
  store i32 0, i32* %r100
  br label %bb4

bb4:
  %r101 = load i32, i32* %r100
  store i32 %r101, i32* @x
  %r106 = getelementptr [666 x i32 ], [666 x i32 ]* @a, i32 0, i32 55
  store i32 195, i32* %r106
  %r107 = getelementptr [666 x i32 ], [666 x i32 ]* @a, i32 0, i32 55
  %r108 = load i32, i32* %r107
  %r109 = getelementptr [888 x i32 ], [888 x i32 ]* @b, i32 0, i32 102
  store i32 %r108, i32* %r109
  br label %bb6

bb6:
  %r110 = getelementptr [666 x i32 ], [666 x i32 ]* @a, i32 0, i32 55
  %r111 = load i32, i32* %r110
  %r112 = icmp sgt i32 %r111, 0
  br i1 %r112, label %bb7, label %bb8

bb7:
  %r113 = getelementptr [666 x i32 ], [666 x i32 ]* @a, i32 0, i32 55
  %r114 = load i32, i32* %r113
  %r115 = sdiv i32 %r114, 2
  %r116 = sub i32 %r115, 1
  %r117 = getelementptr [666 x i32 ], [666 x i32 ]* @a, i32 0, i32 55
  store i32 %r116, i32* %r117
  %r118 = load i32, i32* @x
  %r119 = mul i32 10, %r118
  %r120 = load i32, i32* @y
  %r121 = add i32 %r119, %r120
  store i32 %r121, i32* @y
  %r122 = load i32, i32* @y
  %r123 = add i32 1, %r122
  %r124 = load i32, i32* @z
  %r125 = add i32 %r123, %r124
  store i32 %r125, i32* @z
  %r126 = getelementptr [666 x i32 ], [666 x i32 ]* @a, i32 0, i32 55
  %r127 = load i32, i32* %r126
  %r128 = sdiv i32 %r127, 3
  store i32 %r128, i32* @x
  br label %bb6

bb8:
  ret i32 0
}

