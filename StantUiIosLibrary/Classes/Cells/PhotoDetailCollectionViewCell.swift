//
//  PhotoDetailCollectionViewCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 15/09/20.
//

import UIKit

class PhotoDetailCollectionViewCell: UICollectionViewCell {
    var imageView:      UIImageView?
    let photoDimension: CGFloat  = 56
    
    func configure(path: String) {
        imageView           = UIImageView()
        guard let imageView = imageView else { return }
        
        self.addSubview(imageView)
        imageView.anchor(top:     self.topAnchor,
                         leading: self.leadingAnchor,
                         padding: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0),
                         size:    CGSize(width: photoDimension, height: photoDimension))
        
        imageView.showRoundedImageWith(path:   path,
                                       radius: photoDimension / 2)
    }
}

public protocol PhotoDetailCollectionViewDelegate {
    func showPhotoAtIndex(index: Int)
}
