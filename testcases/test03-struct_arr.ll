
%Node = type { i32, i32 }
define i32 @main( ) {
bb1:
  %r100 = alloca [ 1000 x i32 ]
  %r101 = alloca [ 780 x i32 ]
  %r102 = alloca %Node
  %r103 = alloca %Node
  %r104 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r100, i32 0 , i32 120
  store i32 1, i32* %r104
  %r105 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r100, i32 0 , i32 120
  %r106 = load i32, i32* %r105
  %r107 = getelementptr [780 x i32 ], [780 x i32 ]* %r101, i32 0 , i32 0
  store i32 %r106, i32* %r107
  %r108 = getelementptr %Node, %Node* %r102, i32 0, i32 0
  store i32 1, i32* %r108
  %r109 = getelementptr %Node, %Node* %r102, i32 0, i32 1
  store i32 1, i32* %r109
  %r110 = getelementptr %Node, %Node* %r102, i32 0, i32 0
  %r111 = load i32, i32* %r110
  %r112 = getelementptr %Node, %Node* %r103, i32 0, i32 1
  store i32 %r111, i32* %r112
  %r113 = getelementptr %Node, %Node* %r102, i32 0, i32 1
  %r114 = load i32, i32* %r113
  %r115 = getelementptr %Node, %Node* %r103, i32 0, i32 0
  store i32 %r114, i32* %r115
  ret i32 0
}

