//
//  editVC.swift
//  tableDemo
//
//  Created by 猪猪贝 on 2022/2/20.
//

import UIKit

protocol EditVCDelegate: AnyObject {
    func edictVC(_ vc: EditVC, didSave text: String, index: Int?)
}

class EditVC: UIViewController {
    
    weak var delegate: EditVCDelegate?
    
    var index: Int?
    
    var text: String = ""
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SAVE", style: .done, target: self, action: #selector(clickSaveButton))
        
        textView.text = text
    }
   
        
    
    @objc func clickSaveButton() {
        let text = textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if text.isEmpty {
            let alert = UIAlertController(title: "Empty Text", message: "please enter text", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        } else {
            
            delegate?.edictVC(self, didSave: text, index: index)
            navigationController?.popViewController(animated: true)
        }
    }

}
