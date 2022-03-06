//
//  SuccessVC.swift
//  loginDemo
//
//  Created by 猪猪贝 on 2022/2/18.
//

import UIKit

class SuccessVC: UIViewController {
    
    var text  = ""
    @IBOutlet weak var TextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextLabel.text = text
    
    }
    
    @IBAction func clickExitButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
