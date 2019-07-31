//
//  ItemSelection.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 31/07/19.
//

import UIKit

public struct ItemSelection {
    let itemTitle: String?
    let itemImage: UIImage?
    let arrowIcon: UIImage?
    
    public init(itemTitle: String, itemImage: UIImage, arrowIcon: UIImage) {
        self.itemTitle = itemTitle
        self.itemImage = itemImage
        self.arrowIcon = arrowIcon
    }
}
