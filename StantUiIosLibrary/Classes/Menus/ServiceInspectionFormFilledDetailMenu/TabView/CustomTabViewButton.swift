//
//  CustomTabViewButton.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

class CustomTabViewButton: UIButton {
    var bottomBorder: UIView?
    
    override var tag: Int {
        didSet {
            let color = self.tag == 1 ? UIColor.orangeStant : UIColor.darkGrayStant
            let attrs: [NSAttributedString.Key: Any] = [.font:            UIFont.systemFont(ofSize: 12),
                                                        .foregroundColor: color]
            
            let text = NSAttributedString(string: self.titleLabel?.text ?? "", attributes: attrs)
            self.setAttributedTitle(text, for: .normal)
            
            bottomBorder?.isHidden = self.tag != 1
        }
    }
    
    func configure(title: String) {
        let attrs: [NSAttributedString.Key: Any] = [.font:            UIFont.systemFont(ofSize: 12),
                                                    .foregroundColor: UIColor.darkGrayStant]
        
        let text = NSAttributedString(string: title, attributes: attrs)
        self.setAttributedTitle(text, for: .normal)
        
        bottomBorder                 = UIView()
        guard let bottomBorder       = bottomBorder else { return }
        bottomBorder.backgroundColor = .orangeStant
        bottomBorder.isHidden        = true
        
        self.addSubview(bottomBorder)
        bottomBorder.anchor(leading:  self.leadingAnchor,
                            bottom:   self.bottomAnchor,
                            trailing: self.trailingAnchor,
                            size:     CGSize(width: self.frame.width, height: 2))
        
        self.addTarget(self, action: #selector(toggleSelection), for: .touchUpInside)
    }
    
    @objc func toggleSelection() {
        self.tag = self.tag == 0 ? 1 : 0
    }
}
