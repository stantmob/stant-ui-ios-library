//
//  ProfileWithImageCell.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Alexandre Henrique on 7/3/19.
//

import UIKit

public class InternPersonCell: UITableViewCell {
    
    public static let IDENTIFIER      = "InternPersonCellIdentifier"
    public static let HEIGHT: CGFloat = 56
    
    public let titleLabel       = UILabel(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: 210,
                                                        height: 19))
    public let descriptionLabel = UILabel(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: 210,
                                                        height: 14))
    
    private let mailImage       = UIImageView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: 20,
                                                            height: 20))
    private let callImage       = UIImageView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: 20,
                                                            height: 20))
    
    private weak var mailButton: UIButton?
    private weak var callButton: UIButton?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(title: String = String(),
                    description: String = String(),
                    icon: UIImage? = UIImage(),
                    iconSize: CGSize = CGSize(width: 35, height: 35),
                    titleSize: CGFloat = 16,
                    descriptionSize: CGFloat = 14) {
        
        self.subviews.forEach { view in
            if view is UIButton { view.removeFromSuperview() }
        }
        
        self.removeSubviews(self.titleLabel, self.descriptionLabel)
        
        let roundedAndFormattedImage = icon?.roundedReframedWith(size: iconSize)
        self.imageView?.image        = roundedAndFormattedImage
        
        positionElements()
        
        self.titleLabel.configure(text: title,
                                  size: titleSize,
                                  weight: .regular,
                                  color: .darkStant)
        
        self.descriptionLabel.configure(text: description,
                                        size: descriptionSize,
                                        weight: .regular,
                                        color: .darkGrayStant)
    }
    
    public func set(mailButton: UIButton? = nil,
                    mailImage: UIImage,
                    callButton: UIButton? = nil,
                    callImage: UIImage) {
        
        self.mailImage.image = mailImage
        self.callImage.image = callImage
        
        self.mailButton = mailButton
        self.callButton = callButton
        
        positionOptionalElements()
        styleButtonImages()
    }
    
    private func styleButtonImages() {
        if self.mailButton == nil {
            self.mailImage.set(color: .darkGrayStant)
        }
        
        if self.callButton == nil {
            self.callImage.set(color: .darkGrayStant)
        }
    }
    
    private func positionOptionalElements() {
        self.addSubviews(mailImage, callImage)
        
        self.callImage.anchor(top: self.topAnchor,
                              bottom: self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding: UIEdgeInsets(top: 18,
                                                    left: 0,
                                                    bottom: 18,
                                                    right: 16),
                              size: CGSize(width: 20, height: 20))
        self.mailImage.anchor(top: self.topAnchor,
                              bottom: self.bottomAnchor,
                              trailing: self.callImage.leadingAnchor,
                              padding: UIEdgeInsets(top: 18,
                                                    left: 0,
                                                    bottom: 18,
                                                    right: 16),
                              size: CGSize(width: 20, height: 20))

        if let callButton = self.callButton {
            self.addSubview(callButton)
            
            self.callButton?.anchor(top: self.topAnchor,
                                    bottom: self.bottomAnchor,
                                    trailing: self.trailingAnchor,
                                    padding: UIEdgeInsets(top: 18,
                                                          left: 0,
                                                          bottom: 18,
                                                          right: 16),
                                    size: CGSize(width: 20, height: 20))
        }
        
        if let mailButton = self.mailButton {
            self.addSubview(mailButton)
            
            self.mailButton?.anchor(top: self.topAnchor,
                                    bottom: self.bottomAnchor,
                                    trailing: self.callImage.leadingAnchor,
                                    padding: UIEdgeInsets(top: 18,
                                                          left: 0,
                                                          bottom: 18,
                                                          right: 16),
                                    size: CGSize(width: 20, height: 20))
        }
        
    }
    
    private func positionElements() {
        self.addSubviews(titleLabel, descriptionLabel)
        
        self.titleLabel.anchor(top: self.topAnchor,
                               leading: self.imageView?.trailingAnchor,
                               padding: UIEdgeInsets(top: 11,
                                                     left: 14,
                                                     bottom: 0,
                                                     right: 0))
        
        self.descriptionLabel.anchor(top: self.titleLabel.bottomAnchor,
                                     leading: self.imageView?.trailingAnchor,
                                     padding: UIEdgeInsets(top: 2,
                                                           left: 14,
                                                           bottom: 0,
                                                           right: 0))
    }
    
}
