//
//  ViewController.swift
//  drawDemo
//
//  Created by 猪猪贝 on 2022/2/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var drawView: DrawView!
    
    @IBOutlet weak var verticalSlider: verticalSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDrawView))
        
        drawView.addGestureRecognizer(tap)
        
        verticalSlider.delegate = self
    }
    
    @objc func tapDrawView() {
        drawView.plus.toggle()
    }
    @IBAction func changeHorizontalSlider(_ sender: UISlider) {
        drawView.horizaontalScale = CGFloat(sender.value)
    }
    
    
}

extension ViewController:VerticalSliderDelegate {
    func verticalSliderDidchange(_ slider: verticalSlider) {
        drawView.verticalScale = slider.value
    }
}

