//
//  PhotoDetailView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class PhotoDetailView: UIView {
    public var photoImageView: UIImageView?
    public var nameLabel:      UILabel?
    public var roleLabel:      UILabel?
    
    public let activityIndicator  = UIActivityIndicatorView(style: .gray)
    static let photoSize: CGFloat = 40
    
    convenience init(frame:              CGRect,
                     personName:         String,
                     personInChargeRole: String,
                     photoUrl:           String) {
        self.init(frame: frame)
        
        configurePhotoImageView(photoUrl: photoUrl)
        configureNameLabel(personName: personName)
        configureRoleLabel(personInChargeRole: personInChargeRole)
    }
    
    func configurePhotoImageView(photoUrl: String) {
        photoImageView           = UIImageView()
        guard let photoImageView = photoImageView else { return }
        
        self.addSubview(photoImageView)
        photoImageView.anchor(top:     self.topAnchor,
                              padding: UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0),
                              size:    CGSize(width: PhotoDetailView.photoSize, height: PhotoDetailView.photoSize))
        
        photoImageView.anchorCenterX(anchorX: self.centerXAnchor)
        photoImageView.showRoundedImageWith(path:              photoUrl,
                                            radius:            PhotoDetailView.photoSize / 2,
                                            activityIndicator: activityIndicator)
        
        photoImageView.layer.borderWidth = 2
        photoImageView.layer.borderColor = UIColor.lightGrayStant.cgColor
    }
    
    func configureNameLabel(personName: String) {
        nameLabel           = UILabel()
        guard let nameLabel = nameLabel else { return }
        nameLabel.textColor = .darkStant
        nameLabel.font      = UIFont.systemFont(ofSize: 12)
        nameLabel.text      = personName
        
        self.addSubview(nameLabel)
        nameLabel.anchor(top:     photoImageView?.bottomAnchor,
                         padding: UIEdgeInsets(top: 7, left: 0, bottom: 0, right: 0))
        nameLabel.anchorCenterX(anchorX: self.centerXAnchor)
    }
    
    func configureRoleLabel(personInChargeRole: String) {
        roleLabel           = UILabel()
        guard let roleLabel = roleLabel else { return }
        roleLabel.textColor = .darkGrayStant
        roleLabel.font      = UIFont.systemFont(ofSize: 10)
        roleLabel.text      = personInChargeRole
        
        self.addSubview(roleLabel)
        roleLabel.anchor(top:     nameLabel?.bottomAnchor,
                         padding: UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0))
        roleLabel.anchorCenterX(anchorX: self.centerXAnchor)
    }
}
