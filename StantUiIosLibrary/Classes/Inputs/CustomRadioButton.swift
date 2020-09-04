//
//  CustomRadioButton.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 03/09/20.
//

import UIKit

public class CustomRadioButton: UIView {
    public var buttonView: UIView?
    public var innerView:  UIView?
    
    public func configure(size: CGSize, color: UIColor) {
        self.frame                    = CGRect(x: 0, y: 0, width: size.width, height : size.height)
        buttonView                    = UIView(frame: frame)
        guard let buttonView          = buttonView else { return }
        buttonView.layer.cornerRadius = frame.width / 2
        buttonView.backgroundColor    = .white
        buttonView.layer.borderColor  = color.cgColor
        buttonView.layer.borderWidth  = 2
        self.addSubview(buttonView)
        
        configureInnerView(dimension: size.width / 2, color: color)
    }
    
    
    fileprivate func configureInnerView(dimension: CGFloat, color: UIColor) {
        innerView                    = UIView()
        guard let innerView          = innerView,
              let buttonView         = buttonView else { return }
        innerView.layer.cornerRadius = dimension / 2
        innerView.backgroundColor    = color
        innerView.isHidden           = true
        
        innerView.anchor(size: CGSize(width: dimension, height: dimension))
        buttonView.addSubview(innerView)
        
        innerView.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor).isActive = true
        innerView.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
    }
    
    public func select() {
        innerView?.isHidden = false
    }
    
    public func deselect() {
        innerView?.isHidden = true
    }
}

