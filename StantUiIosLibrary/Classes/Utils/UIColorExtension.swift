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
    
    @nonobjc public class var iceGrayStant: UIColor {
        return UIColor(red: 233/255, green: 233/255, blue: 236/255, alpha: 1)
    }
    
    @nonobjc public class var lightGrayStant: UIColor {
        return UIColor(red: 245/255, green: 245/255, blue: 247/255, alpha: 1)
    }

    @nonobjc public class var darkGrayStant: UIColor {
        return UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1)
    }
    
    @nonobjc public class var iceGray: UIColor {
        return UIColor(red: 233/255, green: 233/255, blue: 236/255, alpha: 1)
    }
    
    @nonobjc public class var grayStant: UIColor {
        return UIColor(red: 206/255, green: 206/255, blue: 213/255, alpha: 1)
    }
    
    @nonobjc public class var orangeStant: UIColor {
        return UIColor(red: 255/255, green: 64/255, blue: 37/255, alpha: 1)
    }
    
    @nonobjc public class var backgroundStant: UIColor {
        return UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    @nonobjc public class var shadowStant: UIColor {
        return UIColor(red: 92/255, green: 135/255, blue: 175/255, alpha: 1)
    }
    
    @nonobjc public class var stantImagePlaceholder: UIColor {
        return UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
    }
    
    @nonobjc public class var errorColorStant: UIColor {
        return UIColor(red: 212/255, green: 29/255, blue: 0/255, alpha: 1)
    }
    
    @nonobjc public class var greenStant: UIColor {
        return UIColor(red: 128/255, green: 176/255, blue: 39/255, alpha: 1)
    }
    
    @nonobjc public class var blueStant: UIColor {
        return UIColor(red: 27/255, green: 116/255, blue: 157/255, alpha: 1)
    }
    
    @nonobjc public class var blueDarkStant: UIColor {
        return UIColor(red: 19/255, green: 84/255, blue: 114/255, alpha: 1)
    }
    
    @nonobjc public class var blueLightStant: UIColor {
        return UIColor(red: 63/255, green: 172/255, blue: 223/255, alpha: 1)
    }
    
    @nonobjc public class var yellowLightStant: UIColor {
        return UIColor(red: 255/255, green: 180/255, blue: 83/255, alpha: 1)
    }

    @nonobjc public class var yellowStant: UIColor {
        return UIColor(red: 236/255, green: 133/255, blue: 0/255, alpha: 1)
    }
    
    @nonobjc public class var redLightStant: UIColor {
        return UIColor(red: 212/255, green: 29/255, blue: 0/255, alpha: 1)
    }

    public func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

