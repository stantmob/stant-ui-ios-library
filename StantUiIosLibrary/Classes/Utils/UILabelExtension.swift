//
//  UILabelExtension.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 28/05/19.
//

import UIKit

extension UILabel {
    
    func configure(text: String, alignment: NSTextAlignment = .center, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        self.text          = text
        self.textAlignment = alignment
        self.font          = .systemFont(ofSize: size, weight: weight)
        self.textColor     = color
    }
    
}
