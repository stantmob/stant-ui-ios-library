//
//  FormTabCollectionViewCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 28/05/20.
//

import UIKit

public class FormTabCollectionViewCell: UICollectionViewCell {
    var titleLabel:   UILabel?
    var contentLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleLabel()
        configureContentLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTitleLabel() {
        titleLabel           = UILabel()
        guard let titleLabel = titleLabel else { return }
        titleLabel.textColor = .darkGrayStant
        titleLabel.font      = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top:      self.topAnchor,
                          leading:  self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top: 13, left: 37, bottom: 0, right: 0))
        
    }
    
    func configureContentLabel() {
        contentLabel           = UILabel()
        guard let contentLabel = contentLabel else { return }
        contentLabel.textColor = .darkStant
        contentLabel.font      = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        self.addSubview(contentLabel)
        contentLabel.anchor(top:      titleLabel?.bottomAnchor,
                            leading:  self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            padding:  UIEdgeInsets(top: 2, left: 37, bottom: 0, right: 0))
    }
}
