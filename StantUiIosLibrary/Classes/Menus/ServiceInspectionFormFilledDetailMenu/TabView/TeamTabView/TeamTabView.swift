//
//  TeamTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

class TeamTabView: UIView {
    let label = UILabel()

    func configure() {
        label.text          = "Team Tab"
        label.textColor     = .black
        label.textAlignment = .center
        
        self.addSubview(label)
        label.anchor(top:      self.topAnchor,
                     leading:  self.leadingAnchor,
                     bottom:   self.bottomAnchor,
                     trailing: self.trailingAnchor)
    }
}
