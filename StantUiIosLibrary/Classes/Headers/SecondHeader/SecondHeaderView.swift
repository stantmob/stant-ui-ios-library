//
//  SecondHeaderView.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 01/08/19.
//

import UIKit

public class SecondHeaderView: UIView {
    public static let headerHeight: CGFloat = 52
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.removeSubviews()
    }
    
    public func configure(title:       String,
                          titleFont:   UIFont = .systemFont(ofSize: 18, weight: .bold),
                          subtitle:    String? = nil,
                          titleButton: SecondHeaderButton? = nil,
                          leftButton:  SecondHeaderButton? = nil,
                          rightButton: SecondHeaderButton? = nil) {
        self.backgroundColor = .white
        self.layer.applySketchShadow(color: .shadowStant, alpha: 0.07, x: 0, y: 5, blur: 8, spread: 0)
        
        self.addMainTitle(title, button: titleButton, hasSubtitle: subtitle != nil, tag: 1, font: titleFont)
        
        if let subtitle = subtitle { self.addSubtitle(subtitle, tag: 2) }
        if let button   = leftButton { self.add(button: button, alignment: .left, tag: 3) }
        if let button   = rightButton { self.add(button: button, alignment: .right, tag: 4) }
    }
    
    fileprivate func addMainTitle(_ title:     String,
                                  button:      SecondHeaderButton?,
                                  hasSubtitle: Bool,
                                  tag:         Int,
                                  font:        UIFont) {
        let titleButton = UIButton()
        titleButton.setImage(button?.icon, for: .normal)
        titleButton.setTitle(title, for: .normal)
        titleButton.setTitleColor(.darkStant, for: .normal)
        
        titleButton.titleLabel?.font         = font
        titleButton.isUserInteractionEnabled = button?.action != nil
        titleButton.semanticContentAttribute = .forceRightToLeft
        
        if let action = button?.action {
            titleButton.addTarget(button?.target, action: action, for: .touchUpInside)
        }
        
        self.addSubview(titleButton)
        
        titleButton.anchor(top:      self.topAnchor,
                           leading:  self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           padding:  UIEdgeInsets(top: 11, left: 0, bottom: 0, right: 0))
        titleButton.tag = tag
    }
    
    fileprivate func addSubtitle(_ subtitle: String, tag: Int) {
        let subtitleLabel = UILabel()
        subtitleLabel.configure(text:      subtitle,
                                alignment: .center,
                                size:      12,
                                weight:    .regular,
                                color:     .darkGrayStant)
        self.addSubview(subtitleLabel)
        subtitleLabel.anchor(top:      self.topAnchor,
                             leading:  self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             padding:  UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0))
        subtitleLabel.tag = tag
    }
    
    fileprivate func add(button: SecondHeaderButton, alignment: NSTextAlignment, tag: Int) {
        let buttonWithImage = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        buttonWithImage.setImage(button.icon, for: .normal)
        buttonWithImage.isUserInteractionEnabled = true
        buttonWithImage.addTarget(button.target, action: button.action, for: .touchUpInside)
        
        self.addSubview(buttonWithImage)
        buttonWithImage.anchor(size: CGSize(width: 36, height: 36))
        
        if alignment == .left {
        buttonWithImage.anchor(top:     self.topAnchor,
                               leading: self.leadingAnchor,
                               padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 0))
        } else {
            buttonWithImage.anchor(top:      self.topAnchor,
                                   trailing: self.trailingAnchor,
                                   padding:  UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 16))
        }
        buttonWithImage.tag = tag
    }
}
