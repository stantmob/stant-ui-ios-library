//
//  UIViewExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/05/19.
//

import UIKit

extension UIView {
    
    public static func identifier() -> String {
        return "\(String(describing: self.self))Identifier"
    }
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
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
    
    func addBottomBorderWithColor(color: UIColor = .iceGrayStant, width: CGFloat = 1) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame           = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
     public func addBorders(edges:     UIRectEdge,
                            thickness: CGFloat,
                            color:     UIColor,
                            padding:   UIEdgeInsets = .zero) {
        
        if edges.isEmpty { return }
        
        if edges.contains(.all) {
            self.layer.borderWidth = thickness
            self.layer.borderColor = color.cgColor
            return
        }
        
        if edges.contains(.top) {
            let borderView             = UIView()
            borderView.backgroundColor = color
            
            self.addSubview(borderView)
            borderView.anchor(top:      self.topAnchor,
                              leading:  self.leadingAnchor,
                              trailing: self.trailingAnchor,
                              padding:  padding,
                              size:     CGSize(width: 0, height: thickness))
        }
        
        if edges.contains(.left) {
            let borderView             = UIView()
            borderView.backgroundColor = color
            
            self.addSubview(borderView)
            borderView.anchor(top:      self.topAnchor,
                              leading:  self.leadingAnchor,
                              bottom:   self.bottomAnchor,
                              padding:  padding,
                              size:     CGSize(width: thickness, height: 0))
        }
        
        if edges.contains(.bottom) {
            let borderView             = UIView()
            borderView.backgroundColor = color
            
            self.addSubview(borderView)
            borderView.anchor(leading:  self.leadingAnchor,
                              bottom:   self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding:  padding,
                              size:     CGSize(width: 0, height: thickness))
        }
        
        if edges.contains(.right) {
            let borderView             = UIView()
            borderView.backgroundColor = color
            
            self.addSubview(borderView)
            borderView.anchor(top:      self.topAnchor,
                              bottom:   self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding:  padding,
                              size:     CGSize(width: thickness, height: 0))
        }
    }
}

extension CALayer {
    func applySketchShadow(color:  UIColor  = .black,
                           alpha:  Float    = 0.5,
                           x:      CGFloat  = 0,
                           y:      CGFloat  = 2,
                           blur:   CGFloat  = 4,
                           spread: CGFloat  = 0) {
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
