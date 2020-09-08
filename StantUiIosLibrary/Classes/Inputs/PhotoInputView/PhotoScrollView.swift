//
//  PhotoScrollView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 08/09/20.
//

import UIKit

public class PhotoInputView: UIView {
    var titleLabel:     UILabel?
    var photoCounter:   UILabel?
    var galleryButton:  UIButton?
    var mainView:       UIView?
    var addPhotoButton: UIButton?
    var collectionView: UICollectionView?
    var photoUrls:      [String] = []
    
    public func configure(photoUrls: [String] = []) {
        self.photoUrls = photoUrls
        configureTitleLabel()
        configurePhotoCounter()
        configureGalleryButton()
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
        
        galleryButton.setImage(UIImage(named: "edit")?.withRenderingMode(.alwaysTemplate),
                               for: .normal)
        galleryButton.imageView?.tintColor = UIColor.darkGrayStant
    }
}

extension PhotoInputView: UICollectionViewDataSource,
                           UICollectionViewDelegate,
                           UICollectionViewDelegateFlowLayout  {
    
    public func collectionView(_ collectionView:               UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return photoUrls.count
    }
    
    public func collectionView(_ collectionView:        UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView
                   .dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier(),
                                        for:                 indexPath) as! PhotoCollectionViewCell

        cell.imageView?.showRoundedImageWith(path: self.photoUrls[indexPath.row])

        return cell
    }
    
    public func collectionView(_ collectionView:            UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath:     IndexPath) -> CGSize {
        return CGSize(width: 56, height: 56)
    }
    
    public func collectionView(_ collectionView:                            UICollectionView,
                               layout collectionViewLayout:                 UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView:                       UICollectionView,
                               layout collectionViewLayout:            UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
