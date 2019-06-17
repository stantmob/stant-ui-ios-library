//
//  MenuTabBarDto.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 17/06/19.
//

import UIKit

public struct MenuTabBarDTO {
    unowned var controller: UIViewController
    
    public init(controller: UIViewController, title: String, icon: UIImage?, url: String?) {
        self.controller = controller
        
        controller.title = title
        
        if let icon = icon {
            controller.tabBarItem.image = icon
        }
        
        if let url = url {
            self.setRoundedImageToTabBarItem(url: url)
        }
        
    }
    
    fileprivate func setRoundedImageToTabBarItem(url: String) {
        var roundedImage = UIColor.lightGray.image()
        
        if let nsurl = NSURL(string: url) {
            if let data = NSData(contentsOf: nsurl as URL) {
                if let newImage = UIImage(data: data as Data) {
                    roundedImage = newImage.roundedRectImageFromImage(cornerRadius: 12)
                    controller.tabBarItem.image = roundedImage.withRenderingMode(.alwaysOriginal)
                } else {
                    roundedImage = roundedImage.roundedRectImageFromImage(cornerRadius: 12)
                    controller.tabBarItem.image = roundedImage.withRenderingMode(.alwaysTemplate)
                }
            } else {
                roundedImage = roundedImage.roundedRectImageFromImage(cornerRadius: 12)
                controller.tabBarItem.image = roundedImage.withRenderingMode(.alwaysTemplate)
            }
        }
    }
    
}
