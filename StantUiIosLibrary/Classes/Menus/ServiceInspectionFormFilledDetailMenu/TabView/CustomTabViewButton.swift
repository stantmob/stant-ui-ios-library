//
//  CustomTabViewButton.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

class CustomTabViewButton: UIButton {
    var bottomBorder: UIView?
    
    func configure(title: String) {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.darkGrayStant]
        let text                                 = NSAttributedString(string: title, attributes: attrs)
        
        self.setAttributedTitle(text, for: .normal)
        
        bottomBorder                 = UIView()
        guard let bottomBorder       = bottomBorder else { return }
        bottomBorder.backgroundColor = .orangeStant
        
        self.addSubview(bottomBorder)
        bottomBorder.anchor(leading:  self.leadingAnchor,
                            bottom:   self.bottomAnchor,
                            trailing: self.trailingAnchor,
                            size:     CGSize(width: self.frame.width, height: 2))
    }
    
    func select() {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.orangeStant]
        let text                                 = NSAttributedString(string: self.titleLabel?.text ?? "", attributes: attrs)

        self.setAttributedTitle(text, for: .normal)
        bottomBorder?.isHidden = false
    }
    
    func deselect() {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.darkGrayStant]
        let text                                 = NSAttributedString(string: self.titleLabel?.text ?? "", attributes: attrs)
        

        self.setAttributedTitle(text, for: .normal)
        bottomBorder?.isHidden = true
    }
}
