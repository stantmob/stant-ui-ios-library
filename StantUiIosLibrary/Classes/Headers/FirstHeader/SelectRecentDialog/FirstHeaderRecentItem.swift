//
//  FirstHeaderRecentItem.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/05/19.
//

import UIKit

public struct FirstHeaderRecentItem {
    let title: String?
    let image: UIImage?
    let url: String?
    
    public init(title: String, image: UIImage?, url: String?) {
        self.title  = title
        self.image  = image
        self.url    = url
    }
}
