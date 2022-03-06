//
//  News.swift
//  JsonDemo
//
//  Created by 猪猪贝 on 2022/2/28.
//

import UIKit

class News: Codable {

    var title: String
    var content: String
    
    // 驼峰写法
    var readCount: Int {
        get {
            read_count
        }
        set {
            read_count = newValue
        }
    }
    
    private var read_count: Int
    
    var isBig: Bool {
        get { is_big ?? false} // 如果没有这个值就是false
        set { is_big = newValue}
    }
    private var is_big: Bool?
}

class NewList: Codable {
    
    var Page: Int
    var next: Bool
    var list: [News]
}

extension NewList {
    var displayText: String {
        list.map { $0.title }.joined(separator: "\n") }
}
