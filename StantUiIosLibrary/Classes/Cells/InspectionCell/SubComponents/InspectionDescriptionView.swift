//
//  InspectionDescriptionView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 08/07/20.
//

import UIKit

public class InspectionDescriptionView: UIView {
    public var upperSeparator:   UIView?
    public var lowerSeparator:   UIView?
    public var descriptionLabel: UILabel?
    
    func configure(descriptionText: String) {
        configureUpperDescriptionViewSeparator()
        configureLowerDescriptionViewSeparator()
        configureDescriptionLabel(descriptionText: descriptionText)
    }
    
    fileprivate func configureUpperDescriptionViewSeparator() {
        upperSeparator                 = UIView()
        guard let upperSeparator       = upperSeparator else { return }
        upperSeparator.backgroundColor = .lightGrayStant
        
        self.addSubview(upperSeparator)
        upperSeparator.anchor(top:      self.topAnchor,
                              leading:  self.superview?.leadingAnchor,
                              trailing: self.superview?.trailingAnchor,
                              size:     CGSize(width: 0, height: 1))
    }
    
    fileprivate func configureLowerDescriptionViewSeparator() {
        lowerSeparator                 = UIView()
        guard let lowerSeparator       = lowerSeparator else { return }
        lowerSeparator.backgroundColor = .lightGrayStant

        self.addSubview(lowerSeparator)
        lowerSeparator.anchor(leading:  self.superview?.leadingAnchor,
                              bottom:   self.bottomAnchor,
                              trailing: self.superview?.trailingAnchor,
                              size:     CGSize(width: 0, height: 1))
    }
    
    fileprivate func configureDescriptionLabel(descriptionText: String) {
        descriptionLabel               = UILabel()
        guard let descriptionLabel     = descriptionLabel else { return }
        descriptionLabel.textColor     = .darkGrayStant
        descriptionLabel.font          = .systemFont(ofSize: 12)
        descriptionLabel.text          = descriptionText
        descriptionLabel.numberOfLines = 2
        
        self.addSubview(descriptionLabel)
        descriptionLabel.fillSuperView()
    }
}
