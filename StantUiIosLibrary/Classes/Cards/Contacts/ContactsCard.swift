//
//  ContactsCard.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 26/11/19.
//

import UIKit

public class ContactsCard: UITableViewCell {
    
    public static let cellHeight: CGFloat = 56
    
    public var mainView:          UIView?
    public var nameLabel:         UILabel?
    public var roleLabel:         UILabel?
    public var mailButton:        UIButton?
    public var phoneButton:       UIButton?
    public var presenterDelegate: ContactsTableViewShowPresenter?
    public var photoImageView:    RoundedImageView?
       
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
    
    public func configureViewFor(contact: ContactsInformation) {
        self.removeSubviews()
        
        self.backgroundColor = .clear
        
        self.addMainViewWithShadow()
        
        self.configureImageWith(url: contact.photo ?? String())
        
        self.configure(name:  contact.name ?? String(),
                       role:  contact.role ?? String(),
                       mail:  contact.mail ?? String(),
                       phone: contact.phone ?? String())
        
        self.set(mail:  contact.mail ?? "",
                 phone: contact.phone ?? "")
    }
    
    private func setButtonsActionsFor(mail: String, phone: String) {
        if !mail.isEmpty {
            mailButton?.addTarget(self, action: #selector(mailAction), for: .touchUpInside)
        }
        
        if !phone.isEmpty {
            phoneButton?.addTarget(self, action: #selector(phoneAction), for: .touchUpInside)
        }
    }
    
    @objc func mailAction(sender: UIButton) {
        let alert = UIAlertController(title: "Mail", message: "Send a mail button was clicked!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        if let present = presenterDelegate {
            present.present(alert: alert)
        }
    }

    @objc func phoneAction(sender: UIButton) {
        let alert = UIAlertController(title: "Phone", message: "Call a phone button was clicked!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        if let present = presenterDelegate {
            present.present(alert: alert)
        }
    }
    
    public func set(mail: String, phone: String) {
        mailButton = UIButton()
        mailButton?.setImage(UIImage(named: "mail"), for: .normal)
        
        phoneButton = UIButton()
        phoneButton?.setImage(UIImage(named: "call"), for: .normal)
        
        if mail.isEmpty {
            self.mailButton?.imageView?.set(color: .darkGrayStant)
            self.mailButton?.isEnabled = false
        }
        
        if phone.isEmpty {
            self.phoneButton?.imageView?.set(color: .darkGrayStant)
            self.phoneButton?.isEnabled = false
        }
        
        positionOptionalElements()
        setButtonsActionsFor(mail: mail, phone: phone)
    }
    
    private func positionOptionalElements() {
        if let callButton = self.phoneButton {
           self.addSubview(callButton)

           self.phoneButton?.anchor(top:      self.topAnchor,
                                    bottom:   self.bottomAnchor,
                                    trailing: self.trailingAnchor,
                                    padding:  UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 16),
                                    size:     CGSize(width: 20, height: 20))
        }

        if let mailButton = self.mailButton {
           self.addSubview(mailButton)

           self.mailButton?.anchor(top:      self.topAnchor,
                                   bottom:   self.bottomAnchor,
                                   trailing: self.phoneButton?.leadingAnchor,
                                   padding:  UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 16),
                                   size:     CGSize(width: 20, height: 20))
        }
    }
    
    fileprivate func addMainViewWithShadow() {
        mainView = UIView(frame: CGRect(x: 4, y: 2, width: self.frame.width, height: self.frame.height))
        
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
    
    fileprivate func configure(name: String, role: String, mail: String, phone: String) {
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 210, height: 19))
        roleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 210, height: 14))
        
        guard let nameLabel = nameLabel, let roleLabel = roleLabel else { return }
        
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
            
            self.setText(label:        roleLabel,
                         text:         role,
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

public protocol ContactsTableViewShowPresenter: class {
    func present(alert: UIAlertController)
}

public struct ContactsInformation {
    let name:     String?
    let role:     String?
    let photo:    String?
    let mail:     String?
    let phone:    String?
    
    public init(name:     String,
                role:     String,
                photo:    String,
                mail:     String,
                phone:    String) {
                
        self.name     = name
        self.role     = role
        self.photo    = photo
        self.mail     = mail
        self.phone    = phone
        
    }
}
