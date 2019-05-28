//
//  FilterButton.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 27/05/19.
//

import UIKit

public struct FilterButton {
    let title: String?
    let action: Selector?
    let target: UIViewController?
    
    public init(title: String, action: Selector, target: UIViewController) {
        self.title  = title
        self.action = action
        self.target = target
    }
}
