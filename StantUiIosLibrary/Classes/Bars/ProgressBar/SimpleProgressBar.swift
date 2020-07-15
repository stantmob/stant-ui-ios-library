//
//  SimpleProgressBar.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 13/07/20.
//

import UIKit

public class SimpleProgressBar: UIView {
    public var backgroundView: UIView?
    public var barView:        UIView?
    
    public func configure() {
        backgroundView                 = UIView()
        guard let backgroundView       = backgroundView else { return }
        backgroundView.backgroundColor = .iceGrayStant
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        backgroundView.layer.cornerRadius = self.frame.height / 2

        self.addSubview(backgroundView)
        backgroundView.anchor(top:     self.topAnchor,
                              leading: self.leadingAnchor,
                              bottom:  self.bottomAnchor,
                              size:    CGSize(width: self.frame.width, height: 0))
    }
    
    public func setPercentage(percentage:   CGFloat,
                              color:        UIColor) {
        
        barView?.removeFromSuperview()
        
        let percentage           = percentage > 1 ? 1 : percentage
        barView                  = UIView()
        guard let backgroundView = backgroundView,
              let barView        = barView else { return }
        barView.backgroundColor  = color
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        barView.layer.cornerRadius = self.frame.height / 2
        
        backgroundView.addSubview(barView)
        barView.anchor(top:     backgroundView.topAnchor,
                       leading: backgroundView.leadingAnchor,
                       bottom:  backgroundView.bottomAnchor,
                       size:    CGSize(width:  backgroundView.frame.width * percentage, height: 0))
    }
}
