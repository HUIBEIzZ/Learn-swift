import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let hello = "你好" // let表示该变量不可修改，即常量
        var h = "nihao" // var表示可变变量
        h = "nihaoya"

        let applecount = 1 // Int,Double 分别表示整数，小数
        let score = 2.0

        let isTrue: Bool = 1 != 0 // 布尔值

        let examScore: Double? = 96 // optional值，带个问号

        print(hello)
        print(h)
        print("applecount \(applecount) ")
        print("score \(score)")

        if isTrue {
            print("TRUE")
        } else {
            print("FALSE")
        }

        // 第一种写法
        if examScore == nil {
            print("NO SCORE")
        } else {
            print("exam_score \(examScore!)")  // 带问号的值需要用！进行取数，也称为解包
        }

        // 第二种写法，将examScore赋值，如果有值则打印对应的值
        if let realScore = examScore {
            print("real score \(realScore)")
        } else{
            print("NO SCORE")
        }
    }
        
    

}


