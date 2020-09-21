//
//  InspectionDescriptionView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 08/07/20.
//

import UIKit

public class InspectionDescriptionView: UIView {
    public var descriptionLabel: UILabel?
    
    func configure(descriptionText: String) {
        configureDescriptionLabel(descriptionText: descriptionText)
        self.addBorders(edges: [.top, .bottom], thickness: 1, color: .lightGrayStant)
    }
    
    fileprivate func configureDescriptionLabel(descriptionText: String) {
        descriptionLabel               = UILabel()
        guard let descriptionLabel     = descriptionLabel else { return }
        descriptionLabel.textColor     = .darkGrayStant
        descriptionLabel.font          = .systemFont(ofSize: 12)
        descriptionLabel.text          = descriptionText
        descriptionLabel.numberOfLines = 2
        
        self.addSubview(descriptionLabel)
        descriptionLabel.anchor(top:      self.topAnchor,
                                leading:  self.leadingAnchor,
                                bottom:   self.bottomAnchor,
                                trailing: self.trailingAnchor,
                                padding:  UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
}
