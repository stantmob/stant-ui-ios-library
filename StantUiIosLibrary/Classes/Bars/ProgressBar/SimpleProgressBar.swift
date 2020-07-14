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
    
    public func configure(percentage:   CGFloat,
                          barColor:     UIColor,
                          cornerRadius: CGFloat = 2.5) {
        
        configureBackgroundView(cornerRadius: cornerRadius)
        configureBarView(percentage:   percentage,
                         color:        barColor,
                         cornerRadius: cornerRadius)
    }
    
    fileprivate func configureBackgroundView(cornerRadius: CGFloat) {
        backgroundView                    = UIView()
        guard let backgroundView          = backgroundView else { return }
        backgroundView.backgroundColor    = .iceGrayStant
        backgroundView.layer.cornerRadius = cornerRadius

        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        self.addSubview(backgroundView)
        backgroundView.anchor(top:     self.topAnchor,
                              leading: self.leadingAnchor,
                              size:    CGSize(width: self.frame.width, height: self.frame.height))
    }
    
    fileprivate func configureBarView(percentage:   CGFloat,
                                      color:        UIColor,
                                      cornerRadius: CGFloat) {
        barView                    = UIView()
        guard let backgroundView   = backgroundView,
              let barView          = barView else { return }
        barView.backgroundColor    = color
        barView.layer.cornerRadius = cornerRadius
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        backgroundView.addSubview(barView)
        barView.anchor(top:     backgroundView.topAnchor,
                       leading: backgroundView.leadingAnchor,
                       bottom:  backgroundView.bottomAnchor,
                       size:    CGSize(width:  backgroundView.frame.width * percentage, height: 0))
    }

}
