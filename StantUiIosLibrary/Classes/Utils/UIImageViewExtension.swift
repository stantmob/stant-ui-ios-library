//
//  UIImageViewExtension.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 22/05/19.
//

import UIKit

extension UIImageView {
    
    func showRounded(image: String, radius: CGFloat = 8) {
        self.layer.cornerRadius  = radius
        self.layer.masksToBounds = true
        
        self.show(image: image)
    }
    
    func show(image: String) {
        if let url = NSURL(string: image) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
    
}
