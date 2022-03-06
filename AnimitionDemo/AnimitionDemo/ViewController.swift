//
//  ViewController.swift
//  AnimitionDemo
//
//  Created by 猪猪贝 on 2022/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    private var frameLabel: UILabel!
    private var centerLabel: UILabel!
    private var transformLabel: UILabel!
    private var constraintLabel: UILabel!
    private var leftConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frameLabel = createLabel(y: 100, text: "Frame")
        centerLabel = createLabel(y: frameLabel.frame.maxY + 20, text: "Center")
        transformLabel = createLabel(y: centerLabel.frame.maxY + 20, text: "Transform")
        
        constraintLabel = createLabel(y: 0, text: "Constraint")
        constraintLabel.translatesAutoresizingMaskIntoConstraints = false  // 该属性为False 约束才会有作用
        
        leftConstraint = constraintLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
        
        
        NSLayoutConstraint.activate([
            leftConstraint,
            constraintLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            constraintLabel.topAnchor.constraint(equalTo: transformLabel.bottomAnchor, constant: 20),
            constraintLabel.widthAnchor.constraint(equalToConstant: 100),
            constraintLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        view.layoutIfNeeded()
        
        let control = UISwitch()
        control.frame.origin = CGPoint(x: (view.bounds.width - control.frame.width) * 0.5,
                                       y: constraintLabel.frame.maxY + 20)
        control.addTarget(self, action: #selector(changeControl(_:)), for: .valueChanged)
        view.addSubview(control)
        
        let shareButton = UIButton(frame: CGRect(x: (view.bounds.width - 100) * 0.5, y: control.frame.maxY + 20, width: 100, height: 50))
        shareButton.backgroundColor = .blue
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.setTitle("Share", for: .normal)
        shareButton.addTarget(self, action: #selector(clickShareButton), for: .touchUpInside)
        view.addSubview(shareButton)
        
        addProgressButton()
       
    }

    private func createLabel(y: CGFloat, text: String) -> UILabel {
        
        let label = UILabel(frame: CGRect(x: 0, y: y, width: 100, height: 100))
        label.backgroundColor = .systemGray3
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.text = text
        view.addSubview(label)
        return label
    }
    
    private func addProgressButton() {
        var origin = CGPoint(x: 0, y: view.bounds.height - 200)
        if let position = UserDefaults.standard.array(forKey: "ProgressButtonOrigin") as? [CGFloat]{
            origin.x = position[0]
            origin.y = position[1]
        }
        let button = ProgressButton(frame: CGRect(x: origin.x, y: origin.y, width: 100, height: 100))
//        button.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        view.addSubview(button)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panProgressButton(_:)))
        button.addGestureRecognizer(pan)
    }
    
    @objc func  changeControl(_ control:UISwitch) {
        if control.isOn {
            
            let viewWidth =  self.view.bounds.width
            self.leftConstraint.constant = viewWidth -  self.constraintLabel.frame.width
            
            UIView.animate(withDuration: 0.5) {
               
                self.frameLabel.frame.origin.x = viewWidth -  self.frameLabel.frame.width
                self.centerLabel.center.x = viewWidth -  self.centerLabel.frame.width * 0.5
                self.transformLabel.transform = .init(translationX: viewWidth -  self.transformLabel.frame.width, y: 0)
                self.view.layoutIfNeeded()
            }
           
        } else {
            
            self.leftConstraint.constant = 0
            
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.8, //回弹阻力，数值越小回弹效果越明显
                initialSpringVelocity: 0
            ) {
                self.frameLabel.frame.origin.x = 0
                self.centerLabel.center.x = self.centerLabel.frame.width * 0.5
                self.transformLabel.transform = .identity
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    @objc private func clickShareButton() {
        
        let shareView = ShareView(frame: view.bounds)
        view.addSubview(shareView)
        shareView.startAnimation()
    }
    
    @objc private func panProgressButton(_ pan: UIPanGestureRecognizer) {
        guard let button = pan.view else {return}
        
        switch pan.state {
        case .changed:
            let translation = pan.translation(in: button)
            button.frame.origin.x = min( max(button.frame.minX + translation.x, 0), view.bounds.width - button.frame.width)
            button.frame.origin.y = min( max(button.frame.minY + translation.y, view.safeAreaInsets.top), view.bounds.height - view.safeAreaInsets.bottom -  button.frame.height)
        
            pan.setTranslation(.zero, in: button) //滑动手势每次运行完后要重置滑动的距离
        
        case .ended:
            var x: CGFloat = 0
            if button.frame.midX > view.bounds.midX {
                x = view.bounds.width - button.frame.width
            }
            UIView.animate(withDuration: 0.2) {
                button.frame.origin.x = x
            }
            
            let origin = [button.frame.minX, button.frame.minY]
            UserDefaults.standard.set(origin, forKey: "ProgressButtonOrigin")
        default:
            break
        }
        
        
    }
}

