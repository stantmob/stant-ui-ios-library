//
//  ServiceInspectionFormFilledCellBar.swift
//  StantUiIosLibrary
//
//  Created by Renato Vieira on 6/5/20.
//

import UIKit

public class ServiceInspectionFormFilledCellBar: UIView {
    var progressView: UIView?
    
    public func configure(totalUsedArea: Float, performedQuantity: Float, color: UIColor) {
        let percentage: CGFloat = CGFloat(performedQuantity / totalUsedArea)
        progressView            = UIView()
        guard let progressView  = progressView else { return }
        progressView.backgroundColor    = color
        progressView.layer.cornerRadius = 2.5
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.addSubview(progressView)
        progressView.anchor(top:     self.topAnchor,
                            leading: self.leadingAnchor,
                            bottom:  self.bottomAnchor,
                            size:    CGSize(width:  self.frame.width * percentage ,
                                            height: self.frame.height))
        
    }
    
}
