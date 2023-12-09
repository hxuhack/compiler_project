%Node = type { i32, i32 }
@a = global %Node zeroinitializer
@b = global [ 10 x %Node ] zeroinitializer
define i32 @main( ) {
bb1:
  %r100 = alloca %Node
  %r101 = alloca [ 2 x %Node ]
  %r102 = alloca i32
  %r103 = getelementptr %Node, %Node* %r100, i32 0, i32 0
  store i32 1, i32* %r103
  %r104 = getelementptr %Node, %Node* %r100, i32 0, i32 1
  store i32 223, i32* %r104
  %r105 = load i32, i32* %r102
  %r106 = getelementptr [2 x %Node ], [2 x %Node ]* %r101, i32 0, i32 1
  %r107 = getelementptr %Node, %Node* %r106, i32 0, i32 1
  store i32 %r105, i32* %r107
  %r108 = getelementptr %Node, %Node* @a, i32 0, i32 1
  store i32 1, i32* %r108
  %r109 = load i32, i32* %r102
  %r110 = getelementptr [10 x %Node ], [10 x %Node ]* @b, i32 0, i32 1
  %r111 = getelementptr %Node, %Node* %r110, i32 0, i32 1
  store i32 %r109, i32* %r111
  ret i32 0
}

