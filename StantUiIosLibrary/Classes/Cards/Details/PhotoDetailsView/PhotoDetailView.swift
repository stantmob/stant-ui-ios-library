//
//  PhotoDetailView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 15/09/20.
//

import UIKit

public class PhotoDetailView: UIView {
    public var titleLabel:          UILabel?
    public var photoCounter:        UILabel?
    public var galleryButton:       UIButton?
    public var photoCollectionView: PhotoDetailCollectionView?
    public var delegate:            PhotoDetailCollectionViewDelegate?
    public var photoUrls:           [String] = []
    
    public func configure(photoUrls: [String], delegate: PhotoDetailCollectionViewDelegate) {
        self.photoUrls = photoUrls
        self.delegate  = delegate
        
        configureTitleLabel()
        configurePhotoCounter()
        configureGalleryButton()
        configurePhotoDetailCollectionView()
    }
    
    func configureTitleLabel() {
        titleLabel           = UILabel()
        guard let titleLabel = titleLabel else { return }
        titleLabel.textColor = .darkGrayStant
        titleLabel.font      = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.text      = LibraryStrings.photos
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top:     self.topAnchor,
                          leading: self.leadingAnchor,
                          padding: UIEdgeInsets(top: 2, left: 16, bottom: 0, right: 0))
    }
    
    func configurePhotoCounter() {
        photoCounter           = UILabel()
        guard let photoCounter = photoCounter else { return }
        photoCounter.textColor = .darkGrayStant
        photoCounter.font      = .systemFont(ofSize: 12, weight: .regular)
        photoCounter.text      = photoUrls.count.getStringWith(numberOfDigits: 2)
        
        self.addSubview(photoCounter)
        photoCounter.anchor(top:      self.topAnchor,
                            trailing: self.trailingAnchor,
                            padding:  UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 36))
    }
    
    func configureGalleryButton() {
        galleryButton           = UIButton()
        guard let galleryButton = galleryButton else { return }

        self.addSubview(galleryButton)
        galleryButton.anchor(top:      self.topAnchor,
                             trailing: self.trailingAnchor,
                             padding:  UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 16),
                             size:     CGSize(width: 14, height: 14))
        
        galleryButton.setImage(UIImage(named: "cameraIcon")?.withRenderingMode(.alwaysTemplate),
                               for: .normal)
        galleryButton.imageView?.tintColor = UIColor.darkGrayStant
    }
    
    func configurePhotoDetailCollectionView() {
        photoCollectionView           = PhotoDetailCollectionView()
        guard let photoCollectionView = photoCollectionView else { return }
        
        self.addSubview(photoCollectionView)
        photoCollectionView.anchor(top:      galleryButton?.bottomAnchor,
                                   leading:  self.leadingAnchor,
                                   trailing: self.trailingAnchor,
                                   padding:  UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
                                   size:     CGSize(width: 0, height: 82))
        
        photoCollectionView.configure(photoUrls: photoUrls,
                                      delegate:  delegate!)
    }
}
