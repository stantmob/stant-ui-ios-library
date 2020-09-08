//
//  PhotoCollectionViewCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 08/09/20.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var imageView:      UIImageView?
    var closeButton:    UIButton?
    var delegate:       PhotoCollectionViewDelegate?
    var index:          Int      = 0
    let photoDimension: CGFloat  = 56
    
    func configure(path:     String,
                   index:    Int,
                   delegate: PhotoCollectionViewDelegate) {
        
        self.index    = index
        self.delegate = delegate
        
        configureImageView(path: path)
        configureCloseButton()
    }
    
    func configureImageView(path: String) {
        imageView           = UIImageView()
        guard let imageView = imageView else { return }
        
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         padding: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0),
                         size:    CGSize(width: photoDimension, height: photoDimension))
        
        imageView.showRoundedImageWith(path:   path,
                                       radius: photoDimension / 2)
    }
    
    func configureCloseButton() {
        closeButton           = UIButton()
        guard let closeButton = closeButton else { return }
        
        self.addSubview(closeButton)
        closeButton.anchor(leading: self.leadingAnchor,
                           bottom:  self.bottomAnchor,
                           padding: UIEdgeInsets(top: 0, left: 43, bottom: 42, right: 0),
                           size:    CGSize(width: 20, height: 20))
        
        closeButton.backgroundColor      = .iceGrayStant
        closeButton.layer.cornerRadius   = 10
        closeButton.imageEdgeInsets      = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        closeButton.imageView?.tintColor = UIColor.black
        
        closeButton.addTarget(self, action: #selector(removePhoto), for: .touchUpInside)
        closeButton.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysTemplate),
                                for: .normal)
    }
    
    @objc func removePhoto() {
        delegate?.removePhotoAtIndex(index: index)
    }
}

public protocol PhotoCollectionViewDelegate {
    func removePhotoAtIndex(index: Int)
}
