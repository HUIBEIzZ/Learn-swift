//
//  LoginVC.swift
//  loginDemo
//
//  Created by 猪猪贝 on 2022/2/18.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var errorlabel: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        /* guard写法*/
        guard segue.identifier == "success",
            let destination = segue.destination as? SuccessVC
        else {return}
        
        destination.text = "\(username.text ?? "") 登录成功"
            
    }
        
//        if segue.identifier == "success",
//           let destination = segue.destination as? SuccessVC { // as? 表示 尝试进行类型转换，destination表示一个VC，总体就是尝试将segue的VC转成别的
//            destination.text = "登录成功"
//        }
//    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard identifier == "success"
        else {return true}
        
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
        
        if um.count <= 6 {
            errorlabel.text = "请输入6位数以上用户名"
            return false
        }
        
        if pd.count <= 6 {
            errorlabel.text = "请输入6位数以上密码"
            return false
        }
        
        return true
    }
        
/* 第一种写法
    if identifier == "success" {
        if username.text == nil || username.text == "" {
            errorlabel.text = "请输入用户名"
            return false
        }

        if pwd.text == nil || pwd.text == "" {
            errorlabel.text = "请输入密码"
            return false
    }

    }
*/


/* 第二种写法
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
 */

        
}


