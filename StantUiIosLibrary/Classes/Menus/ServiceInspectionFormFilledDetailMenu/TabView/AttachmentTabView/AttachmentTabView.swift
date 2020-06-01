//
//  AttachmentTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class AttachmentTabView: UIView {
    public var collectionView: UICollectionView?
    public var seeMoreView:    UIView?
    public var photoUrls:      [String] = []
    
    let activityIndicator = UIActivityIndicatorView(style: .gray)

    func configure(photoUrls: [String] = []) {
        self.photoUrls = photoUrls
        
        configureCollectionView()
        configureSeeMoreView()
    }
    
    func configureCollectionView() {
        let layout                                    = UICollectionViewFlowLayout()
        layout.scrollDirection                        = .horizontal
        collectionView                                = UICollectionView(frame: frame, collectionViewLayout: layout)
        guard let collectionView                      = collectionView else { return }
        collectionView.delegate                       = self
        collectionView.dataSource                     = self
        collectionView.backgroundColor                = .white
        collectionView.showsHorizontalScrollIndicator = false
        
        self.addSubview(collectionView)
        collectionView.anchor(top:      self.topAnchor,
                              leading:  self.leadingAnchor,
                              trailing: self.trailingAnchor,
                              size:     CGSize(width: self.frame.width, height: 75))
        
        collectionView.register(AttachmentTabCollectionViewCell.self,
                                forCellWithReuseIdentifier: AttachmentTabCollectionViewCell.identifier())
    }
    
    func configureSeeMoreView() {
        seeMoreView           = UIView()
        guard let seeMoreView = seeMoreView else { return }
        
        self.addSubview(seeMoreView)
        seeMoreView.anchor(top:      collectionView?.bottomAnchor,
                           leading:  self.leadingAnchor,
                           bottom:   self.bottomAnchor,
                           trailing: self.trailingAnchor)
        
        let seeMoreLabel           = UILabel()
        seeMoreLabel.textAlignment = .center
        seeMoreLabel.textColor     = .darkGrayStant
        seeMoreLabel.font          = UIFont.systemFont(ofSize: 12, weight: .bold)
        seeMoreLabel.text          = AppStrings.see_more.uppercased()
        
        seeMoreView.addSubview(seeMoreLabel)
        seeMoreLabel.fillSuperView()
    }
}

extension AttachmentTabView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoUrls.count
    }
    
    public func collectionView(_ collectionView:        UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttachmentTabCollectionViewCell.identifier(),
                                                      for:                 indexPath) as! AttachmentTabCollectionViewCell

        cell.imageView?.showImageWith(path:              self.photoUrls[indexPath.row],
                                      activityIndicator: activityIndicator)

        return cell
    }
    
    public func collectionView(_ collectionView:            UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath:     IndexPath) -> CGSize {
        return CGSize(width: 69, height: 69)
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
