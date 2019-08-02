//
//  SecondHeaderViewControllerMock.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 02/08/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class SecondHeaderViewControllerMock: UIViewController {
    var didClickOnTitle       = false
    var didClickOnLeftButton  = false
    var didClickOnRightButton = false
    
    @objc func clickOnTitle() {
        didClickOnTitle       = true
        didClickOnLeftButton  = false
        didClickOnRightButton = false
    }
    
    @objc func clickOnLeftButton() {
        didClickOnLeftButton  = true
        didClickOnTitle       = false
        didClickOnRightButton = false
    }
    
    @objc func clickOnRightButton() {
        didClickOnRightButton = true
        didClickOnTitle       = false
        didClickOnLeftButton  = false
    }
}
