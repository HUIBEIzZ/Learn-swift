//
//  ProgressButton.swift
//  AnimitionDemo
//
//  Created by 猪猪贝 on 2022/2/26.
//

import UIKit

class ProgressButton: UIView {

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay()}
    }
    
    private var displayLink: CADisplayLink? //计时器，与屏幕的刷新频率同步
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentMode = .redraw
        isOpaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapButton))
        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        didMove()
    }
    
    override func didMoveToSuperview() {
        didMove()
    }
    
    private func didMove() {
        if superview == nil || window == nil {
            displayLink?.invalidate()  //不用计时器的时候要禁止调用，否则会内存泄露
            displayLink = nil
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        UIColor.orange.setStroke() //描边
        UIColor.black.withAlphaComponent(0.5).setFill() //填充
        
        let lineWidth: CGFloat = 10
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) * 0.5 - lineWidth * 0.5
        let progress = min(max( progress, 0), 1)
        let endAngle: CGFloat = -.pi * 0.5 + .pi * 2 * progress
        let arc = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: -.pi * 0.5,
            endAngle: endAngle,
            clockwise: true)
        
        arc.lineWidth = 10
        arc.stroke()
        
        let radius2 = radius - lineWidth * 0.5
        let circle = UIBezierPath(ovalIn:  CGRect(x: center.x - radius2,
                                                  y: center.y - radius2,
                                                  width: radius2 * 2,
                                                  height: radius2 * 2))
        
        circle.fill()
        
    }
    
    @objc private func tapButton() {
        if let link = displayLink {
            link.isPaused.toggle()
        } else {
            let link = CADisplayLink(target: self, selector: #selector(refreshDisplayLink))
            link.add(to: .main, forMode: .common)
            displayLink = link
        }
        if progress >= 1 {
            progress = 0
        }
    }
    
    @objc private func refreshDisplayLink() {
        progress += 0.005
        if progress >= 1 {
            displayLink?.isPaused = true
        }
    }
    
        
      

}
