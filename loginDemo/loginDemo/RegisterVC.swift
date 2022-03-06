//
//  RegisterVC.swift
//  loginDemo
//
//  Created by 猪猪贝 on 2022/2/18.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var errorlabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "success",
           let destination = segue.destination as? SuccessVC { // as? 表示 尝试进行类型转换，destination表示一个VC，总体就是尝试将segue的VC转成别的
            destination.text = "\(username.text ?? "") 注册成功"
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "success" {
            
            let um = username.text ?? ""  // 如果？？前面的值为nil 则用？？后面的值取代
            let pd = pwd.text ?? ""
            
            if um.isEmpty {
                errorlabel.text = "请输入用户名"
                return false
            }
            if pd.isEmpty {
                errorlabel.text = "请输入密码"
                return false
            }
            
            errorlabel.text = nil
        }
        
        return true
    }
    
    @IBAction func clickLoginButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}
