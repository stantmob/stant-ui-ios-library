//
//  VerifiedMethodCellStatusView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

import UIKit

public class VerifiedMethodCellStatusView: UIView {
    public var statusTag:  UIView?
    public var orderLabel: UILabel?
    
    func configureStatusTag(color: UIColor, order: Int) {
        statusTag                 = UIView()
        guard let statusTag       = statusTag else { return }
        statusTag.backgroundColor = color
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        self.addSubview(statusTag)
        statusTag.anchor(top:     self.topAnchor,
                         leading: self.leadingAnchor,
                         size:    CGSize(width: 37, height: 28))
        
        configureOrderLabel(order: order)
        configureFold()
    }
    
    fileprivate func configureOrderLabel(order: Int) {
        orderLabel               = UILabel()
        guard let orderLabel     = orderLabel else { return }
        orderLabel.font          = .systemFont(ofSize: 12, weight: .bold)
        orderLabel.textAlignment = .center
        orderLabel.textColor     = .white
        orderLabel.text          = order.getStringWith(numberOfDigits: 2)
        
        statusTag?.addSubview(orderLabel)
        orderLabel.fillSuperView()
    }
    
    fileprivate func configureFold() {
        let width  = 6
        let height = 7
        let path   = CGMutablePath()

        path.move(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0))

        let shape       = CAShapeLayer()
        shape.path      = path
        shape.fillColor = UIColor.darkStant.cgColor

        let fold = UIView()

        fold.layer.insertSublayer(shape, at: 0)
        self.addSubview(fold)

        fold.anchor(top:     statusTag?.bottomAnchor,
                    leading: statusTag?.leadingAnchor)
    }
}
