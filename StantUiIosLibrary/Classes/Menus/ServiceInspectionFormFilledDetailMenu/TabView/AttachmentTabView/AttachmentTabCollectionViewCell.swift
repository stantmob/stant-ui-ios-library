//
//  AttachmentTabCollectionViewCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 31/05/20.
//

import UIKit

public class AttachmentTabCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        imageView           = UIImageView()
        guard let imageView = imageView else { return }
        
        self.addSubview(imageView)
        imageView.fillSuperView()
    }
}
