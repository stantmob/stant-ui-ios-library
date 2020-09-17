//
//  PhotoDetailCollectionView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 15/09/20.
//

import UIKit

public class PhotoDetailCollectionView: UIView {
    var collectionView: UICollectionView?
    var photoUrls:      [String] = []
    let photoDimension: CGFloat  = 56
    
    public func configure(photoUrls: [String]) {
        self.backgroundColor = .backgroundStant
        self.photoUrls       = photoUrls

        configureCollectionView()
    }
    
    func configureCollectionView() {
        let layout                                    = UICollectionViewFlowLayout()
        layout.scrollDirection                        = .horizontal
        collectionView                                = UICollectionView(frame: frame, collectionViewLayout: layout)
        guard let collectionView                      = collectionView else { return }
        collectionView.delegate                       = self
        collectionView.dataSource                     = self
        collectionView.backgroundColor                = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        self.addSubview(collectionView)
        collectionView.anchor(top:      self.topAnchor,
                              leading:  self.leadingAnchor,
                              bottom:   self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding:  UIEdgeInsets(top: 7, left: 6, bottom: 13, right: 6))
        
        collectionView.register(PhotoDetailCollectionViewCell.self,
                                forCellWithReuseIdentifier: PhotoDetailCollectionViewCell.identifier())
    }
    
    @objc func goToAddPhotoScreen() {
        print("Add photo screen")
    }
}

extension PhotoDetailCollectionView: UICollectionViewDataSource,
                                     UICollectionViewDelegate,
                                     UICollectionViewDelegateFlowLayout,
                                     PhotoDetailCollectionViewDelegate {
    
    public func showPhotoAtIndex(index: Int) {
        print("Show photo at index \(index)")
    }
    
    
    public func collectionView(_ collectionView:               UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return photoUrls.count
    }
    
    public func collectionView(_ collectionView:        UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView
                   .dequeueReusableCell(withReuseIdentifier: PhotoDetailCollectionViewCell.identifier(),
                                        for:                 indexPath) as! PhotoDetailCollectionViewCell

        cell.configure(path: self.photoUrls[indexPath.row])
        
        return cell
    }
    
    public func collectionView(_ collectionView:          UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        
        self.showPhotoAtIndex(index: indexPath.row)
    }
    
    public func collectionView(_ collectionView:            UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath:     IndexPath) -> CGSize {
        return CGSize(width: photoDimension, height: photoDimension + 7)
    }
    
    public func collectionView(_ collectionView:                            UICollectionView,
                               layout collectionViewLayout:                 UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView:                       UICollectionView,
                               layout collectionViewLayout:            UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
