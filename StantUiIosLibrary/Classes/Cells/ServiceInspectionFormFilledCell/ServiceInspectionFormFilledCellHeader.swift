//
//  ServiceInspectionFormFilledCellHeader.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/4/20.
//

import UIKit

public class ServiceInspectionFormFilledCellHeader: UIView {
    public var statusBadge:   CellBadge?
    public var circleView:    UIView?
    public var dateView:      UIView?
    public var beginAtLabel:  UILabel?
    public var separatorView: UIView?
    public var endAtLabel:    UILabel?

    public func configure(status:  ServiceInspectionFormFilledCellTypeEnum,
                          beginAt: String,
                          endAt:   String,
                          color:   UIColor) {
        
        self.configureStatusBadge(status: status,
                                  color:  color)
        self.configureCircle()
        self.configureDateView(beginAt: beginAt,
                               endAt:   endAt)
    }
    
    fileprivate func configureStatusBadge(status: ServiceInspectionFormFilledCellTypeEnum, color: UIColor) {
        statusBadge           = CellBadge()
        guard let statusBadge = statusBadge else { return }

        self.addSubview(statusBadge)
        statusBadge.anchor(top:     self.topAnchor,
                           leading: self.leadingAnchor)
        
        statusBadge.configureBadge(color: color,
                                   title: status.stringValue().uppercased(),
                                   size:  CGSize(width:  112, height: 28))
    }
    
    fileprivate func configureCircle() {
        circleView                    = UIView()
        guard let circleView          = circleView else { return }
        circleView.backgroundColor    = .blueLightStant
        circleView.layer.cornerRadius = 4
        
        self.addSubview(circleView)
       
        circleView.anchor(top:     self.topAnchor,
                          leading: statusBadge?.titleLabel?.trailingAnchor,
                          padding: UIEdgeInsets(top:    11,
                                                left:   8,
                                                bottom: 0,
                                                right:  0),
                          size:     CGSize(width:  8,
                                           height: 8))
    }
    
    fileprivate func configureDateView(beginAt: String, endAt: String) {
        dateView                    = UIView()
        guard let dateView          = dateView else { return }
        dateView.backgroundColor    = .lightGrayStant
        dateView.layer.cornerRadius = 3
        
        self.addSubview(dateView)
        dateView.anchor(top:      self.topAnchor,
                        trailing: self.trailingAnchor,
                        padding:  UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 14),
                        size:     CGSize(width: 152, height: 22))
        
        configureDateLabels(beginAt: beginAt, endAt: endAt)
    }
    
    fileprivate func configureDateLabels(beginAt: String, endAt: String) {
        beginAtLabel           = UILabel()
        guard let beginAtLabel = beginAtLabel else { return }
        beginAtLabel.text      = beginAt
        beginAtLabel.textColor = .darkGrayStant
        beginAtLabel.font      = .systemFont(ofSize: 12)
        
        dateView?.addSubview(beginAtLabel)
        beginAtLabel.anchor(top:     dateView?.topAnchor,
                            leading: dateView?.leadingAnchor,
                            bottom:  dateView?.bottomAnchor,
                            padding: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0))
        
        separatorView                    = UIView()
        guard let separatorView          = separatorView else { return }
        separatorView.backgroundColor    = .darkGrayStant
        separatorView.layer.cornerRadius = 2
        
        dateView?.addSubview(separatorView)
        separatorView.anchor(top:     dateView?.topAnchor,
                             leading: beginAtLabel.trailingAnchor,
                             padding: UIEdgeInsets(top: 9, left: 4, bottom: 0, right: 0),
                             size:    CGSize(width: 4, height: 4))
        
        endAtLabel           = UILabel()
        guard let endAtLabel = endAtLabel else { return }
        endAtLabel.text      = endAt
        endAtLabel.textColor = .darkGrayStant
        endAtLabel.font      = .systemFont(ofSize: 12)
        
        dateView?.addSubview(endAtLabel)
        endAtLabel.anchor(top:      dateView?.topAnchor,
                          leading:  separatorView.trailingAnchor,
                          bottom:   dateView?.bottomAnchor,
                          padding:  UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0))
    }
}
