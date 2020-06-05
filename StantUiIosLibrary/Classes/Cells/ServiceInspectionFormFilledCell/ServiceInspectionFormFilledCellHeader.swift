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
        statusTag.backgroundColor = .red
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        self.addSubview(statusTag)
        statusTag.anchor(top: self.topAnchor, trailing: self.trailingAnchor, size: CGSize(width: self.frame.width + 6, height: 28))
    }
    
}
