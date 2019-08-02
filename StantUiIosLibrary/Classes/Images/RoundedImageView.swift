//
//  RoundedImageView.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 01/08/19.
//
import UIKit

public class RoundedImageView: UIView {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.removeSubviews()
    }
 
    public func set(icon: UIImage?   = nil,
                    iconURL: String? = nil,
                    iconDiameter: CGFloat,
                    iconBorder: CGFloat) {
        self.backgroundColor = .clear
        
        let backgroundSize = CGSize(width: iconDiameter, height: iconDiameter)
        let backgroundView = UIImageView(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: iconDiameter,
                                                       height: iconDiameter))
        self.addSubview(backgroundView)
        backgroundView.anchor(size: backgroundSize)
        backgroundView.anchorCenterX(anchorX: self.centerXAnchor)
        backgroundView.anchorCenterY(anchorY: self.centerYAnchor)
        backgroundView.addRoundedImage(icon: icon,
                                       iconURL: iconURL,
                                       borderWidth: iconBorder,
                                       diameter: iconDiameter)
    }
    
}
