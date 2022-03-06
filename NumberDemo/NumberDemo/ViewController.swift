//
//  ViewController.swift
//  NumberDemo
//
//  Created by 猪猪贝 on 2022/2/17.
//

import UIKit

class ViewController: UIViewController {
    
    var intNumber = 0
    var doubleNumber = 0.0
    var step:Int = 1
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
       
    }
    
        
    @IBAction func clickbutton(_ sender: UIButton) {
        intNumber += step
        doubleNumber += Double(step)
        print("Int: \(intNumber)  Double: \(doubleNumber)")
        
        if intNumber >= 10 || intNumber <= 0 {
            step *= -1
        }
        
        
        updateUI()
        
        
    }
    
    
    
    func updateUI() {
        label.text = "Int:\(intNumber)\n Double: \(doubleNumber)"  //label为在整个class里的属性, \n为换行
       
        let title = step > 0 ?  "+\(step)" : "\(step)" //判断左是右否
        button.setTitle(title, for: .normal)
    }
    
}

