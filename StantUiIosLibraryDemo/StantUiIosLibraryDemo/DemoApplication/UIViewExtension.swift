//
//  UIViewExtension.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 13/06/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

extension UIView {
    func addButton(title: String, action: Selector, orderOfButton: CGFloat, target: UIViewController) {
        let button = UIButton(type: .system) as UIButton
        let distanceToTop: CGFloat = 50 * orderOfButton
        
        button.frame                      = CGRect(x: 0, y: distanceToTop, width: self.frame.width, height: 50)
        button.backgroundColor            = UIColor.lightGray
        button.tintColor                  = UIColor.black
        button.contentHorizontalAlignment = .center
        
        button.setTitle(title, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        self.addSubview(button)
    }
    
}
