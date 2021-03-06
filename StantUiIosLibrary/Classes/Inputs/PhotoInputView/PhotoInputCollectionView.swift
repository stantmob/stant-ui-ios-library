//
//  PhotoCollectionView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 08/09/20.
//

import UIKit

public class PhotoInputCollectionView: UIView {
    var addPhotoButton: UIButton?
    var collectionView: UICollectionView?
    var delegate:       PhotoInputCollectionViewDelegate?
    var photoUrls:      [String] = []
    let photoDimension: CGFloat  = 56
    
    public func configure(photoUrls: [String],
                          delegate:  PhotoInputCollectionViewDelegate) {
        
        self.backgroundColor = .backgroundStant
        self.photoUrls       = photoUrls
        self.delegate        = delegate
        
        configureAddPhotoButton()
        configureCollectionView()
    }
    
    func configureAddPhotoButton() {
        addPhotoButton           = UIButton()
        guard let addPhotoButton = addPhotoButton else { return }
        
        self.addSubview(addPhotoButton)
        addPhotoButton.anchor(top:     self.topAnchor,
                              leading: self.leadingAnchor,
                              padding: UIEdgeInsets(top: 13, left: 7, bottom: 0, right: 0),
                              size:    CGSize(width: 56, height: 56))
        
        addPhotoButton.backgroundColor      = .darkGrayStant
        addPhotoButton.layer.cornerRadius   = 28
        addPhotoButton.imageEdgeInsets      = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        addPhotoButton.imageView?.tintColor = UIColor.white
        
        addPhotoButton.addTarget(self, action: #selector(goToAddPhotoScreen), for: .touchUpInside)
        addPhotoButton.setImage(UIImage(named: "cameraIcon")?.withRenderingMode(.alwaysTemplate),
                                for: .normal)
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
                              leading:  addPhotoButton?.trailingAnchor,
                              bottom:   self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding:  UIEdgeInsets(top: 7, left: 7, bottom: 13, right: 7))
        
        collectionView.register(PhotoInputCollectionViewCell.self,
                                forCellWithReuseIdentifier: PhotoInputCollectionViewCell.identifier())
    }
    
    @objc func goToAddPhotoScreen() {
        print("Add photo screen")
    }
}

extension PhotoInputCollectionView: UICollectionViewDataSource,
                                    UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout  {
    
    public func collectionView(_ collectionView:               UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return photoUrls.count
    }
    
    public func collectionView(_ collectionView:        UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView
                   .dequeueReusableCell(withReuseIdentifier: PhotoInputCollectionViewCell.identifier(),
                                        for:                 indexPath) as! PhotoInputCollectionViewCell

        cell.configure(path:     self.photoUrls[indexPath.row],
                       index:    indexPath.row,
                       delegate: delegate!)
        
        return cell
    }
    
    public func collectionView(_ collectionView:          UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        
        print("Cell in index \(indexPath.row) selected")
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
