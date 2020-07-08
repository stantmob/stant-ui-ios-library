//
//  InspectionCellHeader.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 08/07/20.
//

import UIKit

public class InspectionCellHeader: UIView {
    public var indicatorView:  UIView?
    public var createdAtView:  UIView?
    public var createdAtLabel: UILabel?
    
    public func configure(createdAt: String) {
        configureIndicatorView()
        configureCreatedAtView()
        configureCreatedAtLabel(createdAt: createdAt)
    }
    
    fileprivate func configureIndicatorView() {
        indicatorView                    = UIView()
        guard let indicatorView          = indicatorView else { return }
        indicatorView.backgroundColor    = .darkGrayStant
        indicatorView.layer.cornerRadius = 3
        
        self.addSubview(indicatorView)
        indicatorView.anchor(top:     self.topAnchor,
                             leading: self.leadingAnchor,
                             padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0),
                             size:    CGSize(width: 7, height: 12))
    }
    
    fileprivate func configureCreatedAtView() {
        createdAtView                    = UIView()
        guard let createdAtView          = createdAtView else { return }
        createdAtView.backgroundColor    = .lightGrayStant
        createdAtView.layer.cornerRadius = 3
        
        self.addSubview(createdAtView)
        createdAtView.anchor(top:     self.topAnchor,
                             leading: indicatorView?.trailingAnchor,
                             padding: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0),
                             size:    CGSize(width: 83, height: 20))
    }
    
    fileprivate func configureCreatedAtLabel(createdAt: String) {
        createdAtLabel               = UILabel()
        guard let createdAtLabel     = createdAtLabel else { return }
        createdAtLabel.textAlignment = .center
        createdAtLabel.textColor     = .darkGrayStant
        createdAtLabel.font          = .systemFont(ofSize: 12, weight: .bold)
        createdAtLabel.text          = createdAt
        
        createdAtView?.addSubview(createdAtLabel)
        createdAtLabel.fillSuperView()
    }
}
