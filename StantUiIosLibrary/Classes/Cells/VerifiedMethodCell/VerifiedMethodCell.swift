//
//  VerifiedMethodCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

import UIKit

public class VerifiedMethodCell: UITableViewCell {
    public var statusBadge:          CellBadge?
    public var reinspectedIndicator: UIView?
    public var attachmentIndicator:  UIImageView?
    public var methodDescription:    UILabel?
    
    public static let cellHeight: CGFloat = 69
    
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

        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0)
        bounds      = bounds.inset(by: padding)
    }

    public func configure(status:          VerifiedMethodStatusEnum,
                          order:           Int,
                          isReinspection:  Bool,
                          hasAttachment:   Bool,
                          descriptionText: String) {
        
        configureStatusBadge(status: status, order: order)
        configureReinspectedIndicator(isReinspection: isReinspection)
        configureAttachmentIndicator(hasAttachment: hasAttachment)
        configureMethodDescription(descriptionText: descriptionText)
    }
    
    fileprivate func configureStatusBadge(status: VerifiedMethodStatusEnum, order: Int) {
        statusBadge           = CellBadge()
        guard let statusBadge = statusBadge else { return }
        
        self.addSubview(statusBadge)
        statusBadge.anchor(top:      self.topAnchor,
                           trailing: self.trailingAnchor,
                           size:     CGSize(width: self.frame.width + 6, height: 28))
        
        statusBadge.configureBadge(color: status.colorValue(),
                                   title: order.getStringWith(numberOfDigits: 2),
                                   size:  CGSize(width: 37, height: 28))
    }
    
    fileprivate func configureReinspectedIndicator(isReinspection: Bool) {
        reinspectedIndicator                    = UIView()
        guard let reinspectedIndicator          = reinspectedIndicator else { return }
        reinspectedIndicator.layer.cornerRadius = 4
        reinspectedIndicator.backgroundColor    = .redLightStant
        reinspectedIndicator.isHidden           = !isReinspection
        
        self.addSubview(reinspectedIndicator)
        reinspectedIndicator.anchor(top:     statusBadge?.bottomAnchor,
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
    
    public func stringValue() -> String {
        switch self {
        case .notInspected:
            return AppStrings.verified_method_details_not_inspected_label
        case .reproved:
            return AppStrings.verified_method_details_approved_label
        case .approved:
            return AppStrings.verified_method_details_approved_label
        case .notApplicable:
            return AppStrings.verified_method_details_not_applicable_label
        }
    }
    
    public func colorValue() -> UIColor {
        switch self {
        case .notInspected:
            return .darkGrayStant
        case .reproved:
            return .redLightStant
        case .approved:
            return .greenStant
        case .notApplicable:
            return .grayStant
        }
    }
}
