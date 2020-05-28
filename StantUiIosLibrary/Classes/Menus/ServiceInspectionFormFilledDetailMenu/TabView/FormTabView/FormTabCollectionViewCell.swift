//
//  FormTabCollectionViewCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 28/05/20.
//

import UIKit

class FormTabCollectionViewCell: UICollectionViewCell {
    let titleLabel   = UILabel()
    let contentLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
