//
//  ContactsCard.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 26/11/19.
//

import UIKit

public class ContactsCard: UITableViewCell {
    
    public static let cellHeight: CGFloat = 56
    
    public var mainView:       UIView?
    public var nameLabel:      UILabel?
    public var officeLabel:    UILabel?
    public var photoImageView: RoundedImageView?
    
    //private let mailImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    //private let callImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    private weak var mailButton: UIButton?
    private weak var callButton: UIButton?
       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
       
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    deinit {
        self.removeSubviews()
        photoImageView = nil
    }
    
    public func configureViewFor(construction: ContactsInformation) {
        self.removeSubviews()
        
        self.backgroundColor = .clear
        
        self.addMainViewWithShadow()
        
        self.configureImageWith(url: construction.photo ?? String())
        
        self.configure(name:   construction.name ?? String(),
                       office: construction.office ?? String())
        
//        self.set(mailButton: construction.mail ?? UIButton(), callButton: <#UIButton?#>);,
//                 //mailImage:  construction.mailImage ?? UIImage(),
//                 callButton: construction.phone)
//                 //callImage:  construction.callImage ?? UIImage())
    }
    
//    private func set(mailButton: UIButton?,
//                     //mailImage:  UIImage,
//                     callButton: UIButton?) {
//                     //callImage:  UIImage) {
//
//        //self.mailImage.image = mailImage
//        //self.callImage.image = callImage
//
//        self.mailButton = mailButton
//        self.callButton = callButton
//
//        self.mailButton?.setImage(UIImage(named: "mail"), for: .normal)
//        self.callButton?.setImage(UIImage(named: "call"), for: .normal)
//
//        positionOptionalElements()
//        styleButtonImages()
//    }

    private func styleButtonImages() {
        if self.mailButton == nil {
            //self.mailImage.set(color: .darkGrayStant)
            self.mailButton?.isEnabled = false
        }

        if self.callButton == nil {
            //self.callImage.set(color: .darkGrayStant)
            self.callButton?.isEnabled = false
        }
    }

    private func positionOptionalElements() {
//        self.addSubviews(mailImage, callImage)
//
//        self.callImage.anchor(top:      self.topAnchor,
//                              bottom:   self.bottomAnchor,
//                              trailing: self.trailingAnchor,
//                              padding:  UIEdgeInsets(top:   18, left:   0, bottom: 18,right: 16),
//                              size:     CGSize(width: 20, height: 20))
//
//        self.mailImage.anchor(top:      self.topAnchor,
//                              bottom:   self.bottomAnchor,
//                              trailing: self.callImage.leadingAnchor,
//                              padding:  UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 16),
//                              size:     CGSize(width: 20, height: 20))

        if let callButton = self.callButton {
            self.addSubview(callButton)

            self.callButton?.anchor(top:      self.topAnchor,
                                    bottom:   self.bottomAnchor,
                                    trailing: self.trailingAnchor,
                                    padding:  UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 16),
                                    size:     CGSize(width: 20, height: 20))
        }

        if let mailButton = self.mailButton {
            self.addSubview(mailButton)

            self.mailButton?.anchor(top:      self.topAnchor,
                                    bottom:   self.bottomAnchor,
                                    trailing: self.callButton?.leadingAnchor,
                                    padding:  UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 16),
                                    size:     CGSize(width: 20, height: 20))
        }
    }
    
    fileprivate func addMainViewWithShadow() {
        mainView = UIView(frame: CGRect(x: 4, y: 2, width: self.frame.width - 8, height: self.frame.height - 4))
        
        guard let mainView = mainView else { return }
        self.addSubview(mainView)
        
        mainView.backgroundColor = .white
        
        mainView.anchor(top:      self.topAnchor,
                        leading:  self.leadingAnchor,
                        bottom:   self.bottomAnchor,
                        trailing: self.trailingAnchor,
                        padding:  UIEdgeInsets(top: 2 , left: 4, bottom: 2, right: 4))
        
        mainView.layer.applySketchShadow(color: .lightGray, alpha: 0.2, x: 16, y: 1, blur: 0, spread: 0)
    }
    
    fileprivate func configure(name: String, office: String) {
        nameLabel   = UILabel(frame: CGRect(x: 68, y: 11, width: 210, height: 19))
        officeLabel = UILabel(frame: CGRect(x: 68, y: 32, width: 210, height: 14))
        
        guard let nameLabel = nameLabel, let officeLabel = officeLabel else { return }
        
        if #available(iOS 8.2, *) {
            self.setText(label:        nameLabel,
                         text:         name,
                         textSize:     16,
                         textWeight:   .regular,
                         textColor:    .darkStant,
                         topAnchor:    5,
                         leftAnchor:   68,
                         bottomAnchor: 26,
                         rightAnchor:  82)
            
            self.setText(label:        officeLabel,
                         text:         office,
                         textSize:     12,
                         textWeight:   .regular,
                         textColor:    .darkGrayStant,
                         topAnchor:    28,
                         leftAnchor:   68,
                         bottomAnchor: 9,
                         rightAnchor:  82)
        }
    }
    
    fileprivate func setText(label:        UILabel,
                             text:         String,
                             textSize:     CGFloat,
                             textWeight:   UIFont.Weight,
                             textColor:    UIColor,
                             topAnchor:    CGFloat,
                             leftAnchor:   CGFloat,
                             bottomAnchor: CGFloat,
                             rightAnchor:  CGFloat) {
        
        guard let mainView = mainView else { return }
        
        if #available(iOS 9.0, *) {
            label.text      = text
            label.font      = .systemFont(ofSize: textSize, weight: textWeight)
            label.textColor = textColor
            
            mainView.addSubview(label)
            label.anchor(top:      mainView.topAnchor,
                         leading:  mainView.leadingAnchor,
                         bottom:   mainView.bottomAnchor,
                         trailing: mainView.trailingAnchor,
                         padding:  UIEdgeInsets(top:    topAnchor,
                                                left:   leftAnchor,
                                                bottom: bottomAnchor,
                                                right:  rightAnchor))
        }
        
    }
    
    fileprivate func configureImageWith(url: String) {
        photoImageView = RoundedImageView(frame: CGRect(x:      19,
                                                        y:      173,
                                                        width:  35,
                                                        height: 35))

        guard let photoImageView = photoImageView else { return }
    
        self.addSubview(photoImageView)
        if #available(iOS 9.0, *) {
            photoImageView.anchor(top:     self.topAnchor,
                                  leading: self.leadingAnchor,
                                  padding: UIEdgeInsets(top: 15, left: 23, bottom: 0, right: 306),
                                  size:    CGSize(width: 20, height: 20))
        }
        photoImageView.set(iconURL: url, iconDiameter: 40, iconBorder: 2)
        photoImageView.tag = 1
    }
}

public struct ContactsInformation {
    let name:     String?
    let office:   String?
    let photo:    String?
    //var iconSize: CGSize?
    //let mail:     String?
    //let phone:    String?
    
    public init(name:     String,
                office:   String,
                photo:    String) {
                //iconSize: CGSize,
                //mail:     String,
                //phone:    String)
                
        self.name     = name
        self.office   = office
        self.photo    = photo
        //self.iconSize = iconSize
        //self.mail     = mail
        //self.phone    = phone
        
    }
}
