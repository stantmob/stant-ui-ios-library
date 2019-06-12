//
//  DialogButton.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 28/05/19.
//

import UIKit

public struct DialogButton {
    let title: String?
    let action: Selector?
    unowned var target: UIViewController
    let style: ButtonStyle?
    
    public init(title: String, action: Selector, target: UIViewController, style: ButtonStyle) {
        self.title  = title
        self.action = action
        self.target = target
        self.style  = style
    }
}

public enum ButtonStyle: String {
    case cancel, standard
}
