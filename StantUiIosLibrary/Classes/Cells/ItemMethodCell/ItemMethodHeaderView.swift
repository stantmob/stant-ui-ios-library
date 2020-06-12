//
//  ItemMethodHeaderView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

import UIKit

public class ItemMethodHeaderView: UIView {
    var statusTag:                   UIView?
    var itemTitleLabel:              UILabel?
    var reprovedInspectionIndicator: UIView?
    var expandButton:                UIButton?
    var delegate:                    ItemMethodHeaderViewDelegate?
    
    public static let headerHeight: CGFloat = 50
    public var color:               UIColor = .greenStant
    public var isExpanded                   = false
    public var section                      = 0
    
    deinit {
        self.removeSubviews()
    }
    
    public func configure(delegate:          ItemMethodHeaderViewDelegate,
                          section:           Int,
                          status:            ItemMethodEnum,
                          hasReprovedMethod: Bool,
                          isExpanded:        Bool,
                          itemTitle:         String) {
        
        self.delegate        = delegate
        self.section         = section
        self.isExpanded      = isExpanded
        
        configureStatusTag(status: status)
        configureItemTitleLabel(itemTitle: itemTitle)
        configureReprovedInspectionIndicator(hasReprovedMethod: hasReprovedMethod)
        configureExpandButton()
    }
    
    fileprivate func configureStatusTag(status: ItemMethodEnum) {
        switch status {
        case .notInspected:
            color = .clear
        case .reproved:
            color = .redLightStant
        case .approved:
            color = .greenStant
        }
        
        statusTag                 = UIView()
        guard let statusTag       = statusTag else { return }
        statusTag.backgroundColor = color
        
        self.addSubview(statusTag)
        statusTag.anchor(top:     self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom:  self.bottomAnchor,
                         size:    CGSize(width: 6, height: self.frame.height))
    }
    
    fileprivate func configureItemTitleLabel(itemTitle: String) {
        itemTitleLabel           = UILabel()
        guard let itemTitleLabel = itemTitleLabel else { return }
        itemTitleLabel.textColor = .darkGrayStant
        itemTitleLabel.font      = .systemFont(ofSize: 16, weight: .regular)
        itemTitleLabel.text      = itemTitle
        
        self.addSubview(itemTitleLabel)
        itemTitleLabel.anchor(top:     self.topAnchor,
                              leading: self.leadingAnchor,
                              padding: UIEdgeInsets(top: 15, left: 16, bottom: 0, right: 0))
    }
    
    fileprivate func configureReprovedInspectionIndicator(hasReprovedMethod: Bool) {
        reprovedInspectionIndicator                    = UIView()
        guard let reprovedInspectionIndicator          = reprovedInspectionIndicator else { return }
        reprovedInspectionIndicator.layer.cornerRadius = 4
        reprovedInspectionIndicator.backgroundColor    = .redLightStant
        reprovedInspectionIndicator.isHidden           = !hasReprovedMethod
        
        self.addSubview(reprovedInspectionIndicator)
        reprovedInspectionIndicator.anchor(top:      self.topAnchor,
                                           trailing: self.trailingAnchor,
                                           padding:  UIEdgeInsets(top: 22, left: 0, bottom: 0, right: 43),
                                           size:     CGSize(width: 8, height: 8))
    }
    
    fileprivate func configureExpandButton() {
        expandButton           = UIButton()
        guard let expandButton = expandButton else { return }
        
        toggleButton()
        expandButton.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        
        self.addSubview(expandButton)
        expandButton.anchor(top:      self.topAnchor,
                            trailing: self.trailingAnchor,
                            padding:  UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 16),
                            size:     CGSize(width: 16, height: 14))
    }
    
    @objc func handleButtonClick() {
        isExpanded = !isExpanded
        delegate?.toggleCollapse(section: section)
        
        toggleButton()
    }
    
    func toggleButton() {
        if isExpanded {
            expandButton?.setImage(UIImage(named: "up"), for: .normal)
        } else {
            expandButton?.setImage(UIImage(named: "down"), for: .normal)
        }
    }
}

public enum ItemMethodEnum {
    case notInspected, reproved, approved 
}

public protocol ItemMethodHeaderViewDelegate {
    func toggleCollapse(section: Int)
}
