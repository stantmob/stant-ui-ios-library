//
//  ItemMethodHeaderView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

import UIKit

public class ItemHeaderView: UITableViewHeaderFooterView {
    public var statusTag:                   UIView?
    public var itemTitleLabel:              UILabel?
    public var reprovedInspectionIndicator: UIView?
    public var expandImageView:             UIImageView?
    public var delegate:                    ItemHeaderViewDelegate?
    
    public static let headerHeight: CGFloat = 50
    public var isExpanded                   = false
    public var section                      = 0
    
    deinit {
        self.removeSubviews()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        statusTag?.removeFromSuperview()
        itemTitleLabel?.removeFromSuperview()
        reprovedInspectionIndicator?.removeFromSuperview()
        expandImageView?.removeFromSuperview()
    }
    
    public func configure(delegate:          ItemHeaderViewDelegate,
                          section:           Int,
                          status:            ItemCellTypeEnum,
                          hasReprovedMethod: Bool,
                          isExpanded:        Bool,
                          itemTitle:         String) {
        
        self.delegate   = delegate
        self.section    = section
        self.isExpanded = isExpanded
        
        configureStatusTag(status: status)
        configureItemTitleLabel(itemTitle: itemTitle)
        configureReprovedInspectionIndicator(hasReprovedMethod: hasReprovedMethod)
        configureExpandButton()
        self.addBorders(edges: [.bottom], thickness: 1, color: .lightGrayStant)
    }
    
    fileprivate func configureStatusTag(status: ItemCellTypeEnum) {
        statusTag                 = UIView()
        guard let statusTag       = statusTag else { return }
        statusTag.backgroundColor = status.colorValue()
        
        self.addSubview(statusTag)
        statusTag.anchor(top:     self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom:  self.bottomAnchor,
                         size:    CGSize(width: 6, height: 0))
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
        expandImageView           = UIImageView()
        guard let expandImageView = expandImageView else { return }
    
        toggleButton()
        
        self.addSubview(expandImageView)
        expandImageView.anchor(top:      self.topAnchor,
                               trailing: self.trailingAnchor,
                               padding:  UIEdgeInsets(top: 19, left: 0, bottom: 0, right: 16),
                               size:     CGSize(width: 16, height: 14))
        
        let tapView             = UIView()
        let tap                 = UITapGestureRecognizer(target: self, action: #selector(handleButtonClick))
        tapView.backgroundColor = .clear
        
        self.addSubview(tapView)
        tapView.anchor(top:      self.topAnchor,
                       trailing: self.trailingAnchor,
                       padding:  UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 9),
                       size:     CGSize(width: 30, height: 30))
        
        tapView.addGestureRecognizer(tap)
    }
    
    @objc func handleButtonClick() {
        isExpanded = !isExpanded
        delegate?.toggleCollapse(section: section)
        
        toggleButton()
    }
    
    func toggleButton() {
        if isExpanded {
            expandImageView?.image = UIImage(named: "collapseUp")
        } else {
            expandImageView?.image = UIImage(named: "collapseDown")
        }
    }
}
