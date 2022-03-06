import UIKit
import Foundation

// 闭包

let printClosure: () -> () = { () -> Void in
    print("Closure")
}

printClosure()

let plus: (Int, Int) -> Int = { (x:Int, y: Int ) -> Int in
   x + y
}
// 简写
let plus1: (Int, Int) -> Int = { $0 + $1 }

plus(1, 2)
plus1(1, 2)

func calculate(x: Int, y:Int, formula: (Int, Int) -> Int) -> Int {
    formula(x, y)
}

calculate(x: 8, y: 2, formula: plus1)

calculate(x: 2, y: 2, formula: plus1)
calculate(x: 2, y: 2, formula: +)
calculate(x: 2, y: 2, formula: -)
calculate(x: 2, y: 2, formula: *)
calculate(x: 2, y: 2, formula: /)

calculate(x: 1, y: 2) { x, y in
    x + y
}

calculate(x: 1, y: 2) {
    $0 + $1
}

// 如果函数最后一个是闭包，可以省略 formula 参数名
