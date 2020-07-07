//
//  ApprovedVerifiedMethodHistoryCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public class ApprovedVerifiedMethodHistoryCell: UITableViewCell {
    public var statusBadge:      CellBadge?
    public var upperSeparator:   UIView?
    public var descriptionView:  UIView?
    public var lowerSeparator:   UIView?
    public var descriptionLabel: UILabel?
    public var editButton:       UIButton?
    public var detailButton:     UIButton?
    public var delegate:         VerifiedMethodHistoryDelegate?
    
    public static let cellHeight: CGFloat = 137
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.removeSubviews()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        self.removeSubviews()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        bounds      = bounds.inset(by: padding)
    }
    
    public func configure(descriptionText: String) {
        self.removeSubviews()
        addShadow()
        configureStatusBadge()
        configureDescriptionView(descriptionText: descriptionText)
        configureEditButton()
        configureDetailButton()
    }
    
    fileprivate func addShadow() {
        self.layer.applySketchShadow(color:  .shadowStant,
                                     alpha:  0.09,
                                     x:      0,
                                     y:      3,
                                     blur:   8,
                                     spread: 0)
    }
    
    fileprivate func configureStatusBadge() {
        statusBadge           = CellBadge()
        guard let statusBadge = statusBadge else { return }
        
        self.addSubview(statusBadge)
        statusBadge.anchor(top:      self.topAnchor,
                           trailing: self.trailingAnchor,
                           size:     CGSize(width: self.frame.width + 6, height: 28))
        
        statusBadge.configureBadge(color: VerifiedMethodStatusEnum.approved.colorValue(),
                                   title: VerifiedMethodStatusEnum.approved.stringValue().uppercased(),
                                   size:  CGSize(width: 112, height: 28))
    }
    
    fileprivate func configureDescriptionView(descriptionText: String) {
        descriptionView           = UIView()
        guard let descriptionView = descriptionView else { return }

        self.addSubview(descriptionView)
        descriptionView.anchor(top:      statusBadge?.bottomAnchor,
                               leading:  self.leadingAnchor,
                               trailing: self.trailingAnchor,
                               padding:  UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
                               size:     CGSize(width: self.frame.width, height: 46))
        
        configureDescriptionViewSeparators()
        configureDescriptionLabel(descriptionText: descriptionText)
    }
    
    fileprivate func configureDescriptionViewSeparators() {
        upperSeparator                 = UIView()
        lowerSeparator                 = UIView()
        guard let descriptionView      = descriptionView,
              let upperSeparator       = upperSeparator,
              let lowerSeparator       = lowerSeparator else { return }
        upperSeparator.backgroundColor = .lightGrayStant
        lowerSeparator.backgroundColor = .lightGrayStant
        
        descriptionView.addSubview(upperSeparator)
        upperSeparator.anchor(top:      descriptionView.topAnchor,
                              leading:  descriptionView.leadingAnchor,
                              trailing: descriptionView.trailingAnchor,
                              size:     CGSize(width: descriptionView.frame.width, height: 1))
        
        descriptionView.addSubview(lowerSeparator)
        lowerSeparator.anchor(leading:  descriptionView.leadingAnchor,
                              bottom:   descriptionView.bottomAnchor,
                              trailing: descriptionView.trailingAnchor,
                              size:     CGSize(width: descriptionView.frame.width, height: 1))
    }
    
    fileprivate func configureDescriptionLabel(descriptionText: String) {
        descriptionLabel               = UILabel()
        guard let descriptionLabel     = descriptionLabel,
              let descriptionView      = descriptionView else { return }
        descriptionLabel.textColor     = .darkGrayStant
        descriptionLabel.font          = .systemFont(ofSize: 12)
        descriptionLabel.text          = descriptionText
        descriptionLabel.numberOfLines = 2
        
        descriptionView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top:      descriptionView.topAnchor,
                                leading:  descriptionView.leadingAnchor,
                                trailing: descriptionView.trailingAnchor,
                                padding:  UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16))
    }
    
    fileprivate func configureEditButton(){
        editButton                       = UIButton()
        guard let editButton             = editButton else { return }
        editButton.titleLabel?.font      = .systemFont(ofSize: 12)

        self.addSubview(editButton)
        editButton.anchor(top:      descriptionView?.bottomAnchor,
                          bottom:   self.bottomAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 92),
                          size:     CGSize(width: 60, height: self.frame.width))
        
        editButton.setTitle(AppStrings.edit, for: .normal)
        editButton.addTarget(delegate, action: #selector(delegate?.goToMethodEditScreen), for: .touchUpInside)
    }
    
    fileprivate func configureDetailButton() {
        detailButton                       = UIButton()
        guard let detailButton             = detailButton else { return }
        detailButton.titleLabel?.font      = .systemFont(ofSize: 12)

        self.addSubview(detailButton)
        detailButton.anchor(top:      descriptionView?.bottomAnchor,
                            bottom:   self.bottomAnchor,
                            trailing: self.trailingAnchor,
                            padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16),
                            size:     CGSize(width: 60, height: self.frame.width))
        
        detailButton.setTitle(AppStrings.details, for: .normal)
        detailButton.addTarget(delegate, action: #selector(delegate?.goToMethodDetailScreen), for: .touchUpInside)
    }
}

@objc public protocol VerifiedMethodHistoryDelegate {
    @objc func goToMethodEditScreen()
    @objc func goToMethodDetailScreen()
}
