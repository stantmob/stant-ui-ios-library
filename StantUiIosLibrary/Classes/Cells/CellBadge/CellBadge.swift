//
//  CellBadge.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public class CellBadge: UIView {
    public var statusTag:  UIView?
    public var titleLabel: UILabel?
    public var foldView:   UIView?
    
    func configureBadge(color: UIColor, title: String, size: CGSize) {
        statusTag                 = UIView()
        guard let statusTag       = statusTag else { return }
        statusTag.backgroundColor = color
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        self.addSubview(statusTag)
        statusTag.anchor(top:     self.topAnchor,
                         leading: self.leadingAnchor,
                         size:    size)
        
        configureTitleLabel(title: title)
        configureFold()
    }
    
    fileprivate func configureTitleLabel(title: String) {
        titleLabel               = UILabel()
        guard let titleLabel     = titleLabel else { return }
        titleLabel.font          = .systemFont(ofSize: 12, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor     = .white
        titleLabel.text          = title
        
        statusTag?.addSubview(titleLabel)
        titleLabel.fillSuperView()
    }
    
    fileprivate func configureFold() {
        let width:  CGFloat = 6
        let height: CGFloat = 7
        let path            = makeTriangle(width: width, height: height)
        let shape           = CAShapeLayer()
        foldView            = UIView()
        guard let foldView  = foldView else { return }
    
        self.addSubview(foldView)
        foldView.anchor(top:     statusTag?.bottomAnchor,
                        leading: statusTag?.leadingAnchor,
                        size:    CGSize(width: width, height: height))
        
        shape.path      = path
        shape.fillColor = UIColor.darkStant.cgColor

        foldView.layer.insertSublayer(shape, at: 0)
    }
    
    fileprivate func makeTriangle(width: CGFloat, height: CGFloat) -> CGMutablePath {
        let path  = CGMutablePath()
        
        path.move(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0))
        
        return path
    }
}
