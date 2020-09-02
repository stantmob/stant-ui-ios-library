//
//  UITextFieldExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 02/09/20.
//

import UIKit

extension UITextField {
    func addLeftPadding(width: CGFloat) {
        let paddingView   = UIView(frame: CGRect(x:      0,
                                                 y:      0,
                                                 width:  width,
                                                 height: self.frame.size.height))
        self.leftView     = paddingView
        self.leftViewMode = .always
    }
}
