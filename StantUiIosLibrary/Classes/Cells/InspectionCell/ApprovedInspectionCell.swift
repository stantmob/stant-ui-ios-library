//
//  ApprovedInspectionCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public class ApprovedInspectionCell: UITableViewCell {
    public var statusBadge:      CellBadge?
    public var descriptionView:  InspectionDescriptionView?
    public var editButton:       UIButton?
    public var detailButton:     UIButton?
    public var delegate:         InspectionCellButtonDelegate?
    
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

        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        bounds      = bounds.inset(by: padding)
    }
    
    public func configure(delegate:        InspectionCellButtonDelegate,
                          descriptionText: String) {
        self.delegate = delegate
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
        
        statusBadge.configureBadge(color: InspectionCellTypeEnum.approved.colorValue(),
                                   title: InspectionCellTypeEnum.approved.stringValue().uppercased(),
                                   size:  CGSize(width: 112, height: 28))
    }
    
    fileprivate func configureDescriptionView(descriptionText: String) {
        descriptionView           = InspectionDescriptionView()
        guard let descriptionView = descriptionView else { return }

        self.addSubview(descriptionView)
        descriptionView.anchor(top:      statusBadge?.bottomAnchor,
                               leading:  self.leadingAnchor,
                               trailing: self.trailingAnchor,
                               padding:  UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
                               size:     CGSize(width: 0, height: 46))
        
        descriptionView.configure(descriptionText: descriptionText)
    }
    
    fileprivate func configureEditButton(){
        editButton                  = UIButton()
        guard let editButton        = editButton else { return }
        editButton.titleLabel?.font = .systemFont(ofSize: 12)

        self.addSubview(editButton)
        editButton.anchor(top:      descriptionView?.bottomAnchor,
                          bottom:   self.bottomAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 92),
                          size:     CGSize(width: 60, height: 0))
        
        editButton.setTitle(LibraryStrings.edit, for: .normal)
        editButton.setTitleColor(.darkText, for: .normal)
        editButton.addTarget(delegate, action: #selector(delegate?.goToInspectionEditScreen), for: .touchUpInside)
    }
    
    fileprivate func configureDetailButton() {
        detailButton                  = UIButton()
        guard let detailButton        = detailButton else { return }
        detailButton.titleLabel?.font = .systemFont(ofSize: 12)

        self.addSubview(detailButton)
        detailButton.anchor(top:      descriptionView?.bottomAnchor,
                            bottom:   self.bottomAnchor,
                            trailing: self.trailingAnchor,
                            padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16),
                            size:     CGSize(width: 60, height: 0))
        
        detailButton.setTitle(LibraryStrings.details, for: .normal)
        detailButton.setTitleColor(.darkText, for: .normal)
        detailButton.addTarget(delegate, action: #selector(delegate?.goToInspectionDetailScreen), for: .touchUpInside)
    }
}
