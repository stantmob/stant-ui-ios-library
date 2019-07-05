//
//  MainMenyuTabBarViewController.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 17/06/19.
//
import UIKit

public class MainMenuTabBarController: UITabBarController {
    
    public func set(tabBarObjects: [MenuTabBarDTO],
                    itemsTintColor: UIColor = UIColor.darkStant,
                    barTintColor: UIColor = UIColor.white,
                    unselectedItemsTintColor: UIColor = UIColor.darkGrayStant) {
        
        tabBar.tintColor               = itemsTintColor
        tabBar.barTintColor            = barTintColor
        tabBar.unselectedItemTintColor = unselectedItemsTintColor
        
        viewControllers = tabBarObjects.map { $0.controller }
    }
    
}
