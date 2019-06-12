//
//  DropdownButton.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 29/05/19.
//

import UIKit

public struct FirstHeaderDropdownButton {
    let title: String?
    let action: Selector?
    unowned var target: UIViewController?
    let image: UIImage?
    
    public init(title: String, action: Selector, target: UIViewController, image: UIImage) {
        self.title  = title
        self.action = action
        self.target = target
        self.image  = image
    }
}
