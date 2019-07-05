//
//  UIImageExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 17/06/19.
//

import UIKit

extension UIImage {
    public func roundedRectImageFromImage(cornerRadius: CGFloat) -> UIImage {
        let diameter = 2.00 * cornerRadius
        UIGraphicsBeginImageContextWithOptions(CGSize(width: diameter, height: diameter), false, 0.0)

        let outsiteDiameter = 1.90 * cornerRadius
        let outsiteOffset   = 0.07 * cornerRadius
        let outsideBounds   = CGRect(origin: CGPoint(x: outsiteOffset, y: outsiteOffset),
                                     size: CGSize(width: outsiteDiameter, height: outsiteDiameter))
        let outsideCircle   = UIBezierPath(roundedRect: outsideBounds, cornerRadius: cornerRadius)
        outsideCircle.stroke(with: CGBlendMode.color, alpha: 0.15)
        outsideCircle.lineWidth = 0.2
        outsideCircle.stroke()
        
        let insideDiameter  = 1.60 * cornerRadius
        let insideOffset    = 0.23 * cornerRadius
        let insideBounds    = CGRect(origin: CGPoint(x: insideOffset, y: insideOffset),
                                     size: CGSize(width: insideDiameter, height: insideDiameter))
        let insideCircle    = UIBezierPath(roundedRect: insideBounds, cornerRadius: cornerRadius)
    
        outsideCircle.addClip()
        insideCircle.addClip()
        self.draw(in: insideBounds)
        
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return finalImage ?? UIImage()
    }
    
    public func reframeImageSize(_ size: CGSize = CGSize(width: 20, height: 20)) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale);
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    public func roundedReframedWith(size: CGSize) -> UIImage? {
        return self.reframeImageSize(size)
            .roundedRectImageFromImage(cornerRadius: size.height/2)
    }
    
}

