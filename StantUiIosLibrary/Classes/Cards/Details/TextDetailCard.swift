//
//  TextDetailCard.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 15/09/20.
//

import UIKit

public class TextDetailCard: UIView {
    var titleLabel:   UILabel?
    var contentLabel: UILabel?
    
    public func configure(title: String, content: String) {
        configureTitleLabel(title: title)
        configureContentLabel(content: content)
    }
    
    func configureTitleLabel(title: String) {
        titleLabel           = UILabel()
        guard let titleLabel = titleLabel else { return }
        
        titleLabel.configure(text:      title,
                             alignment: .left,
                             size:      16,
                             weight:    .regular,
                             color:     .darkStant)
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top:      self.topAnchor,
                          leading:  self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16))
    }
    
    func configureContentLabel(content: String) {
        contentLabel               = UILabel()
        guard let contentLabel     = contentLabel else { return }
        contentLabel.numberOfLines = 2
        
        contentLabel.configure(text:      content,
                               alignment: .left,
                               size:      12,
                               weight:    .regular,
                               color:     .darkGrayStant)
        
        self.addSubview(contentLabel)
        contentLabel.anchor(top:      titleLabel?.bottomAnchor,
                            leading:  self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            padding:  UIEdgeInsets(top: 6, left: 16, bottom: 0, right: 15))
    }
}
