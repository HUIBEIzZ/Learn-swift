import UIKit

let stringArray: [String] = ["a", "b", "c"]

let firstString = stringArray.first
let fs2 = stringArray[0]

let lastS = stringArray.last
let lastS2 = stringArray[2]


// 计数
stringArray.count

// 创建空数组
var scores: [Double] = []
var scores1 = [Double]()

scores.isEmpty
scores.count

scores.append(20)
scores[0] = 30
scores.append(40)

scores.insert(90, at: 1)
scores.insert(100, at: 2)

// 数组后面加数组
scores += [1, 2]

// 移除最后一个数，返回的是移除的数
scores.remove(at: 5)
scores.removeLast()

scores
var dic1 = [String: String]()
for (i, score) in scores.enumerated() {
    print(i, score)
    dic1[String(score)] = String(i)
}
dic1

var highScores = [Double]()
for score in scores {
    if score >= 90 {
        highScores.append(score)
    }
}
highScores

// 总和
// 第一种写法
var sum = 0.0
for score in scores {
    sum += score
}
sum

// 第二种写法
sum = 0
for i in 0..<scores.count {
    sum += scores[i]
    }
sum

// 第三种
sum = 0
for (i, score) in scores.enumerated() {
    print("For loop i:" + String(i) )
    sum += score
}



//****************字典是无序的***********************//
var dic: [String: String] = [:] //空字典
dic["a"] = "a"
dic

dic["a"] = "A"
dic

dic["b"] = "B"
dic

dic["c"] = "C"
dic

dic["c"] = nil //移除
dic

let aValue = dic["a"]
// 若没有相关的key value
let cValue = dic["c"]
let cValue2 = dic["c"] ?? "C"
let cValue3 = dic["c", default: "C"]

for key in dic.keys {
    let value = dic[key]! // 表示强制取出，就不会显示optional
    print("Key: \(key), value: \(value)")
}

for (_, pair) in dic.enumerated() {
    print("Key: \(pair.key), value: \(pair.value)")
}
