//
//  VerifiedMethodCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

import UIKit

public class VerifiedMethodCell: UITableViewCell {
    var statusView:           VerifiedMethodCellStatusView?
    var reinspectedIndicator: UIView?
    var attachmentIndicator:  UIImageView?
    var methodDescription:    UILabel?
    
    public static let cellHeight: CGFloat = 69
    public var color:             UIColor = .greenStant
    
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
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0)
        bounds      = bounds.inset(by: padding)
    }

    public func configure(status:          VerifiedMethodStatusEnum,
                          order:           Int,
                          isReinspection:  Bool,
                          hasAttachment:   Bool,
                          descriptionText: String) {
        
        configureHeaderView(status: status, order: order)
        configureReinspectedIndicator(isReinspection: isReinspection)
        configureAttachmentIndicator(hasAttachment: hasAttachment)
        configureMethodDescription(descriptionText: descriptionText)
    }
    
    fileprivate func configureHeaderView(status: VerifiedMethodStatusEnum, order: Int) {
        statusView           = VerifiedMethodCellStatusView()
        guard let statusView = statusView else { return }
        
        self.addSubview(statusView)
        statusView.anchor(top:      self.topAnchor,
                          trailing: self.trailingAnchor,
                          size:     CGSize(width: self.frame.width + 6, height: 28))
        
        switch status {
        case .notInspected:
            color = .darkGrayStant
        case .reproved:
            color = .redLightStant
        case .approved:
            color = .greenStant
        case .notApplicable:
            color = .grayStant
        }
        
        statusView.configureStatusTag(color: color, order: order)
    }
    
    fileprivate func configureReinspectedIndicator(isReinspection: Bool) {
        reinspectedIndicator                    = UIView()
        guard let reinspectedIndicator          = reinspectedIndicator else { return }
        reinspectedIndicator.layer.cornerRadius = 4
        reinspectedIndicator.backgroundColor    = .redLightStant
        reinspectedIndicator.isHidden           = !isReinspection
        
        self.addSubview(reinspectedIndicator)
        reinspectedIndicator.anchor(top:     statusView?.bottomAnchor,
                                    leading: self.leadingAnchor,
                                    padding: UIEdgeInsets(top: 7, left: 10, bottom: 0, right: 0),
                                    size:    CGSize(width: 8, height: 8))
    }
    
    fileprivate func configureAttachmentIndicator(hasAttachment: Bool) {
        attachmentIndicator           = UIImageView()
        guard let attachmentIndicator = attachmentIndicator else { return }
        attachmentIndicator.image     = UIImage(named: "clip")
        attachmentIndicator.isHidden  = !hasAttachment
        
        self.addSubview(attachmentIndicator)
        attachmentIndicator.anchor(top:     reinspectedIndicator?.bottomAnchor,
                                   leading: self.leadingAnchor,
                                   padding: UIEdgeInsets(top: 5, left: 7, bottom: 0, right: 0),
                                   size:    CGSize(width: 13, height: 13))
    }
    
    fileprivate func configureMethodDescription(descriptionText: String) {
        methodDescription               = UILabel()
        guard let methodDescription     = methodDescription else { return }
        methodDescription.numberOfLines = 3
        methodDescription.textColor     = .darkGrayStant
        methodDescription.font          = .systemFont(ofSize: 12, weight: .regular)
        methodDescription.text          = descriptionText
        
        self.addSubview(methodDescription)
        methodDescription.anchor(top:      self.topAnchor,
                                 leading:  self.leadingAnchor,
                                 bottom:   self.bottomAnchor,
                                 trailing: self.trailingAnchor,
                                 padding:  UIEdgeInsets(top: 6, left: 43, bottom: 6, right: 12))
    }
}

public enum VerifiedMethodStatusEnum {
    case notApplicable, approved, reproved, notInspected
}
