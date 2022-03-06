//
//  ViewController.swift
//  Reference
//
//  Created by 猪猪贝 on 2022/2/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func testWeak() {
        print(#function, "Begin")
        
        var strongNode: Node? = Node()  // 创建的是一个强引用的Node，在testWeak结束后会释放
        weak var weakNode = strongNode
        
        strongNode = nil // 如果是在还未执行完前设置成空值则等于强引用被释放
        print("Weak node is nil: \(weakNode == nil)")
        print(#function, "End")
    }
    
    
    // 循环引用的时候则不会被释放，要避免循环引用，放置内存泄漏。delegate通常用弱引用
    func testRetainCycle() {
        print(#function, "Begin")
        
        let node = Node()  //都是强引用
        node.value = 1
        
        let node2 = Node() //都是强引用
        node2.value = 2
        
        node.next = node2
        node2.next = node
        print(#function, "End")
    }
}

/* 没有强应用对象就会被释放，释放函数是deinit*/
class Node {
    var value: Int = 0
    var next: Node?
    
    deinit {
        print("Deinit: \(value)")
    }
}
