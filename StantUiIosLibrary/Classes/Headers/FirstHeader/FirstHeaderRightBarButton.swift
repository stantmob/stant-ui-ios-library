//
//  RightBarButton.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 29/05/19.
//

import UIKit

public struct FirstHeaderRightBarButton {
    let action: Selector?
    unowned var target: UIViewController
    let image: UIImage?
    
    public init(action: Selector, target: UIViewController, image: UIImage) {
        self.action = action
        self.target = target
        self.image  = image
    }
}

