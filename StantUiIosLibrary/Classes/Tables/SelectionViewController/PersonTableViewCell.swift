//
//  PersonTableViewCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 05/05/20.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    var cellIcon:      UIImageView?
    var titleLabel:    UILabel?
    var subtitleLabel: UILabel?
    
    public static let cellHeight:   CGFloat = 56
    public static let cellIconSize: CGFloat = 40
    public var leftPadding:         CGFloat = 0
    public let activityIndicator            = UIActivityIndicatorView(style: .gray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        cellIcon?.removeFromSuperview()
        titleLabel?.removeFromSuperview()
        subtitleLabel?.removeFromSuperview()
    }
    
    deinit {
        cellIcon      = nil
        titleLabel    = nil
        subtitleLabel = nil
    }
    
    func configureView(title: String, subtitle: String) {
        configureTitleLabel(title:       title,
                            topPadding:  (subtitle.isEmpty ? 10 : 0),
                            leftPadding: leftPadding)
        
        configureSubtitleLabel(subtitle:    subtitle,
                               leftPadding: leftPadding)
    }
    
    func configureViewWithIcons(title: String, subtitle: String, imageUrl: String) {
        configureCellIcon(imageUrl: imageUrl)
        
        configureTitleLabel(title:       title,
                            topPadding:  (subtitle.isEmpty ? 10 : 0),
                            leftPadding: leftPadding)
        
        configureSubtitleLabel(subtitle:    subtitle,
                               leftPadding: leftPadding)
    }
    
    func configureCellIcon(imageUrl: String) {
        cellIcon           = UIImageView()
        guard let cellIcon = cellIcon else { return }
        leftPadding        = PersonTableViewCell.cellIconSize + 14
        
        self.addSubview(cellIcon)
        cellIcon.anchor(top:     self.topAnchor,
                        leading: self.leadingAnchor,
                        padding: UIEdgeInsets(top: 11, left: 16, bottom: 0, right: 0),
                        size:    CGSize(width:  PersonTableViewCell.cellIconSize,
                                        height: PersonTableViewCell.cellIconSize))
        
        cellIcon.showRoundedImageWith(path:              imageUrl,
                                      radius:            PersonTableViewCell.cellIconSize / 2,
                                      activityIndicator: activityIndicator)
        cellIcon.layer.borderWidth = 2
        cellIcon.layer.borderColor = UIColor.lightGrayStant.cgColor
    }
    
    func configureTitleLabel(title: String, topPadding: CGFloat, leftPadding: CGFloat) {
        titleLabel           = UILabel()
        guard let titleLabel = titleLabel else { return }
        self.addSubviews(titleLabel)
        
        titleLabel.configure(text:      title,
                             alignment: .left,
                             size:      16,
                             weight:    .regular,
                             color:     .darkStant)
        
        titleLabel.anchor(top:      self.topAnchor,
                          leading:  self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top: 11 + topPadding, left: leftPadding + 14, bottom: 0, right: 50))
    }
    
    func configureSubtitleLabel(subtitle: String, leftPadding: CGFloat) {
        if subtitle.isEmpty { return }
        
        subtitleLabel           = UILabel()
        guard let subtitleLabel = subtitleLabel else { return }
        self.addSubviews(subtitleLabel)
        
        subtitleLabel.configure(text:      subtitle,
                                alignment: .left,
                                size:      12,
                                weight:    .light,
                                color:     .darkStant)
        
        subtitleLabel.anchor(top:      titleLabel?.bottomAnchor,
                             leading:  self.leadingAnchor,
                             trailing: self.trailingAnchor,
                             padding:  UIEdgeInsets(top: 0, left: leftPadding + 14, bottom: 0, right: 50))
    }
}