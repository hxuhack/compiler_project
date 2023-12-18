
%Node = type { i32, i32 }
@a = global %Node zeroinitializer
@b = global %Node zeroinitializer
@c = global [ 300 x %Node ] zeroinitializer
define i32 @main( ) {
bb1:
  %r100 = alloca [ 500 x %Node ]
  %r101 = alloca i32
  %r102 = sdiv i32 100, 10
  %r103 = add i32 %r102, 20
  %r104 = sub i32 %r103, 3
  store i32 %r104, i32* %r101
  %r105 = getelementptr [300 x %Node ], [300 x %Node ]* @c, i32 0, i32 0
  %r106 = getelementptr %Node, %Node* %r105, i32 0, i32 1
  store i32 200, i32* %r106
  %r107 = getelementptr [500 x %Node ], [500 x %Node ]* %r100, i32 0, i32 20
  %r108 = getelementptr %Node, %Node* %r107, i32 0, i32 0
  store i32 1, i32* %r108
  %r109 = getelementptr %Node, %Node* @a, i32 0, i32 1
  store i32 1, i32* %r109
  %r110 = getelementptr %Node, %Node* @a, i32 0, i32 1
  %r111 = load i32, i32* %r110
  %r112 = getelementptr %Node, %Node* @b, i32 0, i32 0
  store i32 %r111, i32* %r112
  br label %bb2

bb2:
  %r113 = load i32, i32* %r101
  %r114 = icmp sgt i32 %r113, 0
  br i1 %r114, label %bb3, label %bb4

bb3:
  %r115 = load i32, i32* %r101
  %r116 = sub i32 %r115, 1
  store i32 %r116, i32* %r101
  %r117 = getelementptr [300 x %Node ], [300 x %Node ]* @c, i32 0, i32 20
  %r118 = getelementptr %Node, %Node* %r117, i32 0, i32 0
  %r119 = load i32, i32* %r118
  %r120 = add i32 1, %r119
  %r121 = getelementptr [300 x %Node ], [300 x %Node ]* @c, i32 0, i32 20
  %r122 = getelementptr %Node, %Node* %r121, i32 0, i32 0
  store i32 %r120, i32* %r122
  %r123 = getelementptr [500 x %Node ], [500 x %Node ]* %r100, i32 0, i32 20
  %r124 = getelementptr %Node, %Node* %r123, i32 0, i32 0
  %r125 = load i32, i32* %r124
  %r126 = getelementptr [300 x %Node ], [300 x %Node ]* @c, i32 0, i32 20
  %r127 = getelementptr %Node, %Node* %r126, i32 0, i32 0
  %r128 = load i32, i32* %r127
  %r129 = add i32 %r125, %r128
  %r130 = load i32, i32* %r101
  %r131 = add i32 %r129, %r130
  %r132 = getelementptr [500 x %Node ], [500 x %Node ]* %r100, i32 0, i32 10
  %r133 = getelementptr %Node, %Node* %r132, i32 0, i32 1
  store i32 %r131, i32* %r133
  br label %bb2

bb4:
  ret i32 0
}

