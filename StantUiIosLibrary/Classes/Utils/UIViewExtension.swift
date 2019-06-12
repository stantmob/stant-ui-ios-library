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
}
