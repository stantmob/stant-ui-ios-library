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
            let image = self.getRoundedImageToTabBarItem(url: url)
            controller.tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
        }
        
    }
    
    fileprivate func getRoundedImageToTabBarItem(url: String) -> UIImage {
        let roundedImage = UIColor.lightGray.image().roundedRectImageFromImage(cornerRadius: 12)
        
        guard let nsurl    = NSURL(string: url)               else { return roundedImage }
        guard let data     = NSData(contentsOf: nsurl as URL) else { return roundedImage }
        guard let newImage = UIImage(data: data as Data)      else { return roundedImage }
        
        return newImage.roundedRectImageFromImage(cornerRadius: 12)
    }
    
}
