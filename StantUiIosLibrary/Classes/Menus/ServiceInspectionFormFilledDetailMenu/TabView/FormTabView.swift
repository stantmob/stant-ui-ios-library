//
//  FormTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

class FormTabView: UIView {
    let label = UILabel()

    func configure() {
        label.text          = "Form Tab"
        label.textColor     = .black
        label.textAlignment = .center
        
        self.addSubview(label)
        label.anchor(top:      self.topAnchor,
                     leading:  self.leadingAnchor,
                     bottom: self.bottomAnchor,
                     trailing: self.trailingAnchor)
    }
}
