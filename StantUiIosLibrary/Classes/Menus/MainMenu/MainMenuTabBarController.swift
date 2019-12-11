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
    
    private var tabBarViewControllers = [UIViewController]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    public func set(tabBarObjects: [MenuTabBarDTO],
                    itemsTintColor: UIColor = .darkStant,
                    barTintColor: UIColor = .white,
                    unselectedItemsTintColor: UIColor = .darkGrayStant,
                    mainMenuTabBarDelegate: MainMenuTabBarDelegate) {
        self.tabBarViewControllers     = tabBarObjects.map { $0.controller }
        tabBar.tintColor               = itemsTintColor
        tabBar.barTintColor            = barTintColor
        tabBar.unselectedItemTintColor = unselectedItemsTintColor
        self.mainMenuTabBarDelegate    = mainMenuTabBarDelegate
        viewControllers                = self.tabBarViewControllers
    }
    
    public func updateTabBarObject(_ url: String, at index: Int) {
        let viewController = viewControllers![index]
        
        if url.isEmpty {
            let grayImage = UIColor.lightGray.image().roundedRectImageFromImage(cornerRadius: 12)
            viewController.tabBarItem.image         = grayImage.withRenderingMode(.alwaysOriginal)
            viewController.tabBarItem.selectedImage = grayImage.withRenderingMode(.alwaysOriginal)
            return
        }
        
        loadImageBy(url: url) { iconImage in
            let image = iconImage
            
            viewController.tabBarItem.image         = image.withRenderingMode(.alwaysOriginal)
            viewController.tabBarItem.selectedImage = image.withRenderingMode(.alwaysOriginal)
        }
    
    }
    
    private func loadImageBy(url: String, _ callbackBlock: @escaping (UIImage) -> Void) {
        UIImage.getRoundedImageToTabBarItem(url: url, callbackBlock)
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.mainMenuTabBarDelegate?.clickOnCellWith(index: tabBarController.selectedIndex,
                                                     tabBarController: tabBarController,
                                                     currentViewController: viewController)
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let selectingIndex     = viewControllers?.index(of: viewController) ?? 0
        let isSelectingSameTab = tabBarController.selectedIndex == selectingIndex
        
        if isSelectingSameTab && selectingIndex != 0 { return false }
        
        return true
    }
    
}

public protocol MainMenuTabBarDelegate: class {
    func clickOnCellWith(index: Int, tabBarController: UITabBarController, currentViewController: UIViewController)
    
    var tabBarSelectedIndex: Int { get set }
}
