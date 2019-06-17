//
//  UIColorExtension.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 22/05/19.
//

import UIKit

extension UIColor {
    
    @nonobjc public class var darkStant: UIColor {
        return UIColor(red: 60/255, green: 60/255, blue: 70/255, alpha: 1)
    }
    
    @nonobjc public class var veryLightGrayStant: UIColor {
        return UIColor(red: 233/255, green: 233/255, blue: 236/255, alpha: 1)
    }
    
    @nonobjc public class var lightGrayStant: UIColor {
        return UIColor(red: 245/255, green: 245/255, blue: 247/255, alpha: 1)
    }
    
    @nonobjc public class var darkGrayStant: UIColor {
        return UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1)
    }
    
    @nonobjc public class var orangeStant: UIColor {
        return UIColor(red: 255/255, green: 64/255, blue: 37/255, alpha: 1)
    }
    
    public func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

