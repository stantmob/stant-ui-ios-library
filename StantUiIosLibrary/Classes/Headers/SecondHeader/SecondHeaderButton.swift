//
//  SecondHeaderButton.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 01/08/19.
//

import UIKit

public struct SecondHeaderButton {
    let action: Selector
    unowned var target: UIViewController
    weak var icon: UIImage?
    
    public init(action: Selector, target: UIViewController, icon: UIImage) {
        self.action = action
        self.target = target
        self.icon   = icon
    }
}
