//
//  UIImageViewExtension.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 22/05/19.
//

import UIKit

extension UIImageView {
    
    func showRoundedImageWith(path imagePath: String, radius: CGFloat = 8, activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()) {
        self.layer.cornerRadius  = radius
        self.layer.masksToBounds = true
        
        self.showImageWith(path: imagePath, activityIndicator: activityIndicator)
    }
    
    func showImageWith(path imagePath: String, activityIndicator: UIActivityIndicatorView) {
        activityIndicator.startAnimating()
        DispatchQueue.global(qos: .background).async {
            let imageViewImage = self.getImageViewImage(imagePath)
            
            DispatchQueue.main.sync {
                self.image = imageViewImage
                activityIndicator.stopAnimating()
            }
        }
       
    }
    
    func set(color: UIColor) {
        let template   = self.image?.withRenderingMode(.alwaysTemplate)
        
        self.image     = template
        self.tintColor = color
    }
    
    fileprivate func getImageViewImage(_ imagePath: String) -> UIImage {
        let imageViewImage = UIColor.stantImagePlaceholder.image()
        
        if imagePath.isEmpty { return imageViewImage }
        guard let url = NSURL(string: imagePath) else { return imageViewImage}
        guard let data = NSData(contentsOf: url as URL) else { return imageViewImage}

        return UIImage(data: data as Data) ?? UIImage()
    }
    
    func addRoundedImage(icon: UIImage? = nil, iconURL: String? = nil, borderWidth: CGFloat = 5, diameter: CGFloat) {
        self.image               = UIColor.stantImagePlaceholder.image()
        self.layer.cornerRadius  = diameter / 2
        self.layer.masksToBounds = true

        let imageDiameter = diameter - (2 * borderWidth)
        let iconSize      = CGSize(width: imageDiameter, height: imageDiameter)
        let imageView     = UIImageView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: imageDiameter,
                                                      height: imageDiameter))
        self.addSubview(imageView)
        
        imageView.anchor(size: iconSize)
        imageView.anchorCenterX(anchorX: self.centerXAnchor)
        imageView.anchorCenterY(anchorY: self.centerYAnchor)
        
        imageView.layer.cornerRadius  = imageDiameter / 2
        imageView.layer.masksToBounds = true
        imageView.backgroundColor     = .white
        imageView.contentMode         = .scaleAspectFit

        if let unwrappedIcon = icon {
            imageView.image = unwrappedIcon
        } else if let unwrappedURL = iconURL {
            imageView.image = UIImage()
            loadImageBy(url: unwrappedURL) { iconImage in
                imageView.image = iconImage
            }
        }
    }
    
    private func loadImageBy(url: String, _ callbackBlock: @escaping (UIImage) -> Void) {
        UIImage.getFrom(url: url, callbackBlock)
    }
    
}
