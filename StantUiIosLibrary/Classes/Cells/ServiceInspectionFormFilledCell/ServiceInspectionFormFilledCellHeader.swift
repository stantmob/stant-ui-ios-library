//
//  ServiceInspectionFormFilledCellHeader.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato on 6/4/20.
//

import UIKit

public class ServiceInspectionFormFilledCellHeader: UIView {
    
    public var statusTag: UIView?
    public var circleView: UIView?
    public var dateView: UIView?
    public var beginAtLabel: UILabel?
    public var separatorView: UIView?
    public var endAtLabel: UILabel?
    
    public func configure(status: ServiceInspectionFormFilledStatusEnum, beginAt: String, endAt: String) {
        self.configureStatusTag(status: status)
    }
    
    fileprivate func configureStatusTag(status: ServiceInspectionFormFilledStatusEnum) {
        statusTag = UIView()
        guard let statusTag = statusTag else { return }
        
        let color: UIColor?
        switch status {
            case .late:
                color = UIColor.red
            case .finished:
                color = UIColor.yellow
            case .progress:
                color = UIColor.darkGray
            case .approved:
                color = UIColor.greenStant
        }
        
        statusTag.backgroundColor = color
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        self.addSubview(statusTag)
        statusTag.anchor(top: self.topAnchor, leading: self.leadingAnchor, size: CGSize(width: 112, height: 28))
        
        configureFold()
    }
    
    fileprivate func configureFold() {
        let width  = 6
        let height = 7
        let path   = CGMutablePath()
        
        path.move(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0))
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.darkStant.cgColor
        
        let fold = UIView()
        fold.layer.insertSublayer(shape, at: 0)
        
        self.addSubview(fold)
        fold.anchor(top:     statusTag?.bottomAnchor,
                    leading: statusTag?.leadingAnchor)
    }
}
