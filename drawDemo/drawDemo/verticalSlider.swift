//
//  verticalSlider.swift
//  drawDemo
//
//  Created by 猪猪贝 on 2022/2/24.
//

import UIKit
protocol VerticalSliderDelegate: AnyObject {
    func verticalSliderDidchange(_ slider: verticalSlider)
}

@IBDesignable class verticalSlider: UIView {
    
    weak var delegate: VerticalSliderDelegate?
    
    @IBInspectable var value: CGFloat = 0.5 {
        didSet { setNeedsLayout()}
    }
    
    private var thumb: UIView!
    private var minTrack: UIView!
    private var maxTrack: UIView!

    // 代码让frame初始化视图
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInite()
    }
    
    // stoeryboard初始化视图
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInite()
    }
    
    private func commonInite() {
        thumb = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        thumb.backgroundColor = .white
        thumb.layer.cornerRadius = thumb.bounds.height * 0.5
        thumb.layer.shadowOpacity = 0.2
        thumb.layer.shadowColor = UIColor.black.cgColor
        thumb.layer.shadowOffset = CGSize(width: 0, height: 3)
        thumb.layer.shadowRadius = 4
        
        addSubview(thumb)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panThumb))
        thumb.addGestureRecognizer(pan)
        
        minTrack = UIView(frame: CGRect(x: 13, y: 3, width: 4, height: 0))
        minTrack.layer.cornerRadius = 0.5
        minTrack.backgroundColor = tintColor
        insertSubview(minTrack, belowSubview: thumb)
        
        maxTrack = UIView(frame: CGRect(x: 13, y: 0, width: 4, height: 0))
        maxTrack.layer.cornerRadius = 0.5
        maxTrack.backgroundColor = .systemGray5
        insertSubview(maxTrack, belowSubview: thumb)
        
    }
    
    private var sliderLength: CGFloat {
        bounds.height - thumb.frame.height
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let value = min(max(value, 0),1)
        thumb.frame.origin.y = sliderLength * value
        minTrack.frame.size.height = thumb.frame.midY - minTrack.frame.minY
        maxTrack.frame.origin.y = minTrack.frame.maxY
        maxTrack.frame.size.height = bounds.height - maxTrack.frame.minY - minTrack.frame.minY
    
        
    }
    
    @objc private func panThumb(_ pan:UIPanGestureRecognizer) {
        //比较严谨的条件语句，考虑到所有情况
        switch pan.state {
        case .changed:
            var y = thumb.frame.minY + pan.translation(in: pan.view).y
            y = min( max( y, 0), sliderLength)
            value = y / sliderLength
            
            pan.setTranslation(.zero, in: pan.view) //每次滑动都重置距离
            
            delegate?.verticalSliderDidchange(self)
            
        default:
            break
        }
    }
}
