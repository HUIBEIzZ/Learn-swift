import UIKit

/*
value type 值类型 （struct, no herit）
Reference type 引用类型 (class, yes herit)
 
diff: 传值的时候会不会复制
 */

struct MyStruct {
    var name: String
}

let myValue = MyStruct(name: "Apple")

var myValue2 = myValue // 独立的两个变量
myValue2.name = "Banana"

class MyClass {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
}

let myObj = MyClass(name: "Apple")

let myObj2 = myObj
myObj2.name = "Banana"

myObj.name
myObj2.name

func UpdateObj(_ object:MyClass) {
    object.name = "Orange"
}

UpdateObj(myObj)
myObj.name
myObj2.name

let myObj3 = MyClass(name: myObj.name!)
myObj3.name

myObj === myObj2
myObj === myObj3


