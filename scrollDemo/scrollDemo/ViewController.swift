//
//  ViewController.swift
//  scrollDemo
//
//  Created by 猪猪贝 on 2022/2/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewWillLayoutSubviews() {
        scrollView.zoomScale = 1 // 在横竖屏缩放的时候，重置缩放系数
        scrollView.frame = view.bounds  // frame是以父视图为参考，bounds是以自己为参考
        imageView.frame = view.bounds
       
    }
    
    // 调用系统相册
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
}

// 让viewcontroller去代理scrollview进行操作
extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView  // 返回要缩放的视图
    }

}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true , completion: nil)
        imageView.image = info[.originalImage] as? UIImage
    }
}
