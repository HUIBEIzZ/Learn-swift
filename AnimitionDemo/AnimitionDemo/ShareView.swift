//
//  ShareView.swift
//  AnimitionDemo
//
//  Created by 猪猪贝 on 2022/2/25.
//

import UIKit

class ShareView: UIView {
    
    private var logo: UIImageView!
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    private var wechatIcon: UIImageView!
    private var qqIcon: UIImageView!
    private var mailIcon: UIImageView!
    private var closeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 30
        vStack.alignment = .center
        addSubview(vStack)
        
        logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.tintColor = .green
        logo.image = UIImage(systemName:  "checkmark")
        vStack.addArrangedSubview(logo)
        
        addConstraint(
            NSLayoutConstraint(
                item: vStack,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: self,
                attribute: .centerY,
                multiplier: 0.5,
                constant: 0)
        )
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 120),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor)
        ])
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textColor = .white
        titleLabel.text = "发布成功"
        vStack.addArrangedSubview(titleLabel)
        
        subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = .systemFont(ofSize: 18)
        subtitleLabel.textColor = .white
        subtitleLabel.text = "快去分享给好友吧~"
        vStack.addArrangedSubview(subtitleLabel)
        
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.distribution = .equalSpacing
        addSubview(hStack)
        
        NSLayoutConstraint.activate([
            hStack.leftAnchor.constraint(equalTo:leftAnchor, constant: 60),
            hStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -60),
            hStack.topAnchor.constraint(equalTo: centerYAnchor, constant: 20)
        ])
        
        wechatIcon = createIcon("wechat")
        hStack.addArrangedSubview(wechatIcon)
        
        qqIcon = createIcon("QQ")
        hStack.addArrangedSubview(qqIcon)
        
        mailIcon = createIcon("Mail")
        hStack.addArrangedSubview(mailIcon)
        
        closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(clickCloseButton), for: .touchUpInside)
        addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            closeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("FATAL  ERROR")
        
    }
    
    func startAnimation() {
        transform = .init(scaleX: 0, y: 0)
        alpha = 0
        
        logo.alpha = 0
        titleLabel.alpha = 0
        subtitleLabel.alpha = 0
        
        let iconTransform = CGAffineTransform.init(translationX: 0, y: UIScreen.main.bounds.height)
        wechatIcon.transform = iconTransform
        qqIcon.transform = iconTransform
        mailIcon.transform = iconTransform
        
        let bgDuration = 0.3
        
        // 动画结束后的状态
        UIView.animate(withDuration: bgDuration) {
            self.transform = .identity
            self.alpha = 1
        }
        
        let alphaDuration = 0.3
        
        UIView.animate(withDuration: alphaDuration, delay: bgDuration) {
            self.logo.alpha = 1
        }
        
        UIView.animate(withDuration: alphaDuration, delay: bgDuration + 0.1) {
            self.titleLabel.alpha = 1
        }
        
        UIView.animate(withDuration: alphaDuration, delay: bgDuration + 0.2) {
            self.subtitleLabel.alpha = 1
        }
        
        let iconDuration = 0.5
        let damping: CGFloat = 0.7 //回弹系数
        let velocity:CGFloat = 0 //一开始的速度
        
        UIView.animate(
            withDuration: iconDuration,
            delay: bgDuration + 0.3,
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity
        ) {
            self.wechatIcon.transform = .identity
        }
        
        UIView.animate( 
            withDuration: iconDuration,
            delay: bgDuration + 0.4,
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity
        ) {
            self.qqIcon.transform = .identity
        }
        
        UIView.animate(
            withDuration: iconDuration,
            delay: bgDuration + 0.5,
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity
        ) {
            self.mailIcon.transform = .identity
        }
        
        UIView.animate(withDuration: 0.2, delay: bgDuration + 0.6) {
            self.closeButton.alpha = 1
        }
    }
     
    private func createIcon(_ name:String) -> UIImageView {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: name)
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.heightAnchor.constraint(equalTo: icon.widthAnchor)
        ])
        
        return icon
    }
    
    @objc private func clickCloseButton() {
        removeFromSuperview()
    }
}
