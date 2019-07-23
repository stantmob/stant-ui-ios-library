//
//  MainMenuTabBarViewControllerMock.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 04/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class MainMenuTabBarControllerMock: MainMenuTabBarDelegate {
    
    fileprivate var selectedIndex = 0
    var tabBarSelectedIndex: Int {
        get {
            return selectedIndex
        }
        set {
            selectedIndex = newValue
        }
    }
    
    var selectedCellIndex = 0
    
    func clickOnCellWith(index: Int, tabBarController: UITabBarController, currentViewController: UIViewController) {
        selectedCellIndex = index
    }
}
