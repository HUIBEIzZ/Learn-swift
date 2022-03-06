//
//  tableVC.swift
//  tableDemo
//
//  Created by 猪猪贝 on 2022/2/20.
//

import UIKit

class tableVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var list: [String] = ["apple", "banana", "orange", "watermelon"]
    
   
    @IBAction func clickbarButton(_ sender: UIBarButtonItem) {
        goToEdit(index: nil)
    }
    
    
    
//    var list1: [String] = ["red", "yellow", "orange", "green"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func goToEdit(index: Int?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)  // 选择storyboard
        let vc = storyboard.instantiateViewController(withIdentifier: "item") as! EditVC // 创建storyboard，并强制转换成editVC
        vc.delegate = self
        
        if let index = index {
            vc.index = index
            vc.text = list[index]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
  
    @IBAction func clickReorderButtom(_ sender: UIBarButtonItem) {
        tableView.isEditing.toggle()
    }
    
}

// section组，默认情况下只有一组；cellForRowAt表示某一组某一行要用什么样的cell去显示
extension tableVC: UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        4
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        section == 0 ? 1 : 5  //section=0的时候显示1行，其他情况下5行
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
//        cell.detailTextLabel?.text = list1[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let text = list.remove(at: sourceIndexPath.row)
        list.insert(text, at: destinationIndexPath.row)
    }
}

extension tableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        goToEdit(index: indexPath.row)
    }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Delete", handler: { _, _, completion in
                
                self.list.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
                
            })
        ])
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
}


extension tableVC: EditVCDelegate {
    func edictVC(_ vc: EditVC, didSave text: String, index: Int?) {
        if let index = index {
            
            list[index] = text
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        } else {
            
            list.insert(text, at: 0)
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
    }
}
