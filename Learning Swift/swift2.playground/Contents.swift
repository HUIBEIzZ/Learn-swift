import UIKit

func join(_ string1: String, _ string2: String) -> String {
    string1 + string2
} // str1 外部参数名，string1 内部参数名

join("www", "bbb")


class Animal {
    
    func move() -> String {
        "移动"
    }
    
    func eat() -> String {
        "张嘴吃"
    }
    
}

class Bird: Animal {
    
    override func move() -> String {
        "飞行"
    }
    
    override func eat() -> String {
        super.eat() + "虫子"
    }
}

let animal = Animal.init()
animal.move()
animal.eat()

let bird = Bird.init()
bird.move()
bird.eat()



func isBird(_ animal: Animal) -> Bool {
    animal is Bird
}

func covertToBird(_ animal: Animal) -> Bool {
    if let _ = animal as? Bird {
        return true
    }
    return false
}


isBird(animal)
covertToBird(animal)

isBird(bird)
covertToBird(bird)

//协议, 无论什么类型，只要遵循这个协议就要有特定行为，即某些函数或属性
protocol Flyable {
    func fly() -> String
    func move() -> String
    func eat() -> String
}

extension Bird: Flyable {
    func fly() -> String {
        move()
    }
}

bird.fly()

class Airplane: Flyable {
    func move() -> String {
        ""
    }
    
    func eat() -> String {
        ""
    }
    
    func fly() -> String {
        "飞机飞行"
    }
}


let airplane = Airplane()
airplane.fly()


let flyable: Flyable = Bird()
flyable
flyable.fly()
flyable.move()
flyable.eat()
