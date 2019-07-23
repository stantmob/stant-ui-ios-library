//
//  MainMenyuTabBarViewController.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 17/06/19.
//
import UIKit

public class MainMenuTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    public static let tabBarHeight: CGFloat = 49
    
    public var mainMenuTabBarDelegate: MainMenuTabBarDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    public func set(tabBarObjects: [MenuTabBarDTO],
                    itemsTintColor: UIColor = UIColor.darkStant,
                    barTintColor: UIColor = UIColor.white,
                    unselectedItemsTintColor: UIColor = UIColor.darkGrayStant,
                    mainMenuTabBarDelegate: MainMenuTabBarDelegate) {
        
        tabBar.tintColor               = itemsTintColor
        tabBar.barTintColor            = barTintColor
        tabBar.unselectedItemTintColor = unselectedItemsTintColor
        self.mainMenuTabBarDelegate    = mainMenuTabBarDelegate
        viewControllers = tabBarObjects.map { $0.controller }
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.mainMenuTabBarDelegate?.clickOnCellWith(index: tabBarController.selectedIndex,
                                                tabBarController: tabBarController,
                                                currentViewController: viewController)
    }
    
}

public protocol MainMenuTabBarDelegate: class {
    func clickOnCellWith(index: Int, tabBarController: UITabBarController, currentViewController: UIViewController)
    
    var tabBarSelectedIndex: Int { get set }
}
