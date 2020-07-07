//
//  CellBadge.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public class CellBadge: UIView {
    public var statusView: UIView?
    public var titleLabel: UILabel?
    
    func configureBadge(color: UIColor, title: String, size: CGSize) {
        statusView                 = UIView()
        guard let statusTag       = statusView else { return }
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
        
        statusView?.addSubview(titleLabel)
        titleLabel.fillSuperView()
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

        fold.anchor(top:     statusView?.bottomAnchor,
                    leading: statusView?.leadingAnchor)
    }
}
