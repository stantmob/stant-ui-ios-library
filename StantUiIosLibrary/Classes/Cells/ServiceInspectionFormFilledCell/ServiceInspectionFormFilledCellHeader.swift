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
    public var beginDateLabel: UILabel?
    public var separatorView: UIView?
    public var endDateLabel: UILabel?
    
    public func configure(status: ServiceInspectionFormFilledStatusEnum, beginDate: String, endDate: String) {
        self.configureStatusTag(status: status)
    }
    
    fileprivate func configureStatusTag(status: ServiceInspectionFormFilledStatusEnum) {
        statusTag = UIView()
        guard let statusTag = statusTag else { return }
        statusTag.backgroundColor = .red
        
        self.addSubview(statusTag)
        statusTag.anchor(top: self.topAnchor, leading: self.leadingAnchor, padding: UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0) , size: CGSize(width: 112, height: 28))
    }
    
}
