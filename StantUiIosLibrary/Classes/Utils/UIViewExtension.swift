//
//  UIViewExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/05/19.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path   = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask   = CAShapeLayer()
        mask.path  = path.cgPath
        layer.mask = mask
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach{addSubview($0)}
    }
    
    func removeSubviews(_ views: UIView...) {
        views.forEach{ $0.removeFromSuperview() }
    }
    
    func removeSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    public func removeAllConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor   = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset  = CGSize(width: 0, height: 3)
        self.layer.shadowRadius  = 15
        
        self.layer.shadowPath         = UIBezierPath(rect: bounds).cgPath
        self.layer.shouldRasterize    = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addBottomBorderWithColor(color: UIColor = UIColor.veryLightGrayStant, width: CGFloat = 1) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame           = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}

extension CALayer {
    func applySketchShadow(color: UIColor  = .black,
                           alpha: Float    = 0.5,
                           x: CGFloat      = 0,
                           y: CGFloat      = 2,
                           blur: CGFloat   = 4,
                           spread: CGFloat = 0) {
        shadowColor   = color.cgColor
        shadowOpacity = alpha
        shadowOffset  = CGSize(width: x, height: y)
        shadowRadius  = blur / 2.0
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx   = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
        masksToBounds = false
    }
}
