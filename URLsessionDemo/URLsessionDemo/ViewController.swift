//
//  ViewController.swift
//  URLsessionDemo
//
//  Created by 猪猪贝 on 2022/3/2.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    private var label: UILabel!
    private var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.backgroundColor = .systemGray5
        vStack.axis = .vertical
        view.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor),
            vStack.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
        
        label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        vStack.addArrangedSubview(label)
        
        button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(button.tintColor, for: .normal)
        button.setTitle("SEND", for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        vStack.addArrangedSubview(button)
    }
    
    @objc func clickButton() {
    
        
        // alamofire
        let url = "https://raw.githubusercontent.com/HUIBEIzZ/Learn-IOS/main/Newlist.json"
        AF.request(url).responseData { response in
            switch response.result {
            case let .success(data):
                if let list = try? JSONDecoder().decode(NewList.self, from: data) {
                    self.updateText(list.displayText)
                } else {
                    self.updateText("NO LIST")
                }
               
            case let .failure(error):
                self.updateText(error.localizedDescription)
            }
            
        }
// 原生库
//        let url = URL(string: "https://raw.githubusercontent.com/HUIBEIzZ/Learn-IOS/main/Newlist.json")!
//        let request = URLRequest(url: url)
//
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if let error = error {
//                self.updateText(error.localizedDescription)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse,response.statusCode >= 200,response.statusCode < 300
//            else {
//                self.updateText("Invalid response")
//                return
//            }
//
//            guard let data = data else {
//                self.updateText("No data")
//                return
//            }
//
//            guard let list = try? JSONDecoder().decode(NewList.self, from: data) else {
//                self.updateText("No list")
//                return
//            }
//            self.updateText(list.displayText)
//
//        }
//
//        task.resume()
    }
    
    private func updateText(_ text:String) {
        self.label.text = text
        // 切换到主线程执行代码
//        DispatchQueue.main.async {
//            self.label.text = text
//        }
    }

}

