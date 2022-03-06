//
//  ViewController.swift
//  JsonDemo
//
//  Created by 猪猪贝 on 2022/2/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = Bundle.main.url(forResource: "Newlist", withExtension: "json")
        else { fatalError("NO URL") }
        
        guard let data = try? Data(contentsOf: url)
        else { fatalError("NO DATA") }
        
        jsonToModel(data)
    }
    
    
    func jsonToDic(_ data: Data) {
        guard let dic = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        else { fatalError("NO DIC") }
        
        guard let page = dic["Page"] as? Int
        else {
            fatalError("NO PAGE")
        }
        
        print(page)
        
        
    }
    
    
    func jsonToModel(_ data:Data) {
        guard let list = try? JSONDecoder().decode(NewList.self, from: data)
        else { fatalError("NO JSON")}
        
        print("Page:", list.Page)
        print("Next:", list.next)
        print("List:", list.list)
        
        for news in list.list {
            print("Title:", news.title)
            print("Content:", news.content)
            print("read count:", news.readCount)
            print("Big new:", news.isBig)
        }
        
        guard let jsonData = try? JSONEncoder().encode(list)
        else {fatalError("NO JSON")
        }
        print(jsonData)
    }
}

