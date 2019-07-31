//
//  MainMenuTabBarTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 17/06/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class MainMenuTabBarTests: XCTestCase {
    
    private var tabBarViewController: MainMenuTabBarController?
    
    private let firstVC        = UIViewController()
    private let secondVC       = UIViewController()
    private let thirdVC        = UIViewController()
    private var tabBarElements = [MenuTabBarDTO]()
    private let tabBarDelegate = MainMenuTabBarControllerMock()

    private let firstTitle  = "Title01"
    private let secondTitle = "Title02"
    private let thirdTitle  = "Title03"
    
    private let firstUrl   = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdDuogJgtggIE17gf4kOGyXX4ayj2g9bXj1P2lFQuhVu1FXe2odWKfPA"
    private let secondIcon = UIImage(named: "occurrences") ?? UIImage()
    private let thirdIcon  = UIImage(named: "hamburgerMenu") ?? UIImage()

    let darkColor     = UIColor(red: 60/255, green: 60/255, blue: 70/255, alpha: 1)
    let darkGrayColor = UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1)
    
    override func setUp() {
        super.setUp()
        
        tabBarViewController = MainMenuTabBarController()
        
        firstVC.view.backgroundColor  = .yellow
        secondVC.view.backgroundColor = .orange
        thirdVC.view.backgroundColor  = .green
    }
    
    fileprivate func setTabViewElements(url: String = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdDuogJgtggIE17gf4kOGyXX4ayj2g9bXj1P2lFQuhVu1FXe2odWKfPA") {
        tabBarElements = [MenuTabBarDTO(controller: firstVC,
                                        title: firstTitle,
                                        icon: nil,
                                        url: firstUrl),
                          MenuTabBarDTO(controller: secondVC,
                                        title: secondTitle,
                                        icon: secondIcon,
                                        url: nil),
                          MenuTabBarDTO(controller: thirdVC,
                                        title: thirdTitle,
                                        icon: thirdIcon,
                                        url: nil)]
        
        guard let tabBarViewController = tabBarViewController else { return }
        tabBarViewController.set(tabBarObjects: tabBarElements, mainMenuTabBarDelegate: tabBarDelegate)
    }
    
    func testCheckTabBarElements() {
        self.setTabViewElements()
        
        self.checkTabBarTexts()
        self.checkTabBarImages()
    }
    
    fileprivate func checkTabBarTexts() {
        XCTAssertEqual(tabBarViewController?.viewControllers?[0].tabBarItem.title ?? "", firstTitle)
        XCTAssertEqual(tabBarViewController?.viewControllers?[1].tabBarItem.title ?? "", secondTitle)
        XCTAssertEqual(tabBarViewController?.viewControllers?[2].tabBarItem.title ?? "", thirdTitle)

    }
    
    fileprivate func checkTabBarImages() {
        let firstImage = generateImage(url: firstUrl)
        self.checkEqualityBetween(icon: firstImage, tabBarElementImage: tabBarViewController?.viewControllers?[0].tabBarItem.image ?? UIImage())
        self.checkEqualityBetween(icon: secondIcon, tabBarElementImage: tabBarViewController?.viewControllers?[1].tabBarItem.image ?? UIImage())
        self.checkEqualityBetween(icon: thirdIcon, tabBarElementImage: tabBarViewController?.viewControllers?[2].tabBarItem.image ?? UIImage())
    }
    
    func testClickInDifferentTabBarElement() {
        self.setTabViewElements()
        
        XCTAssertEqual(tabBarViewController?.selectedIndex, 0)
        XCTAssertEqual(tabBarDelegate.selectedCellIndex, 0)
        XCTAssertEqual(tabBarViewController?.selectedViewController?.view.backgroundColor, .yellow)

        self.clickOnSecondElement()
        self.clickOnThirdElement()
    }
    
    fileprivate func clickOnSecondElement() {
        tabBarViewController?.selectedIndex = 1
        guard let viewControllers = tabBarViewController?.viewControllers else { return }
        tabBarViewController?.tabBarController(tabBarViewController ?? UITabBarController(),
                                               didSelect: viewControllers[1])
        
        XCTAssertEqual(tabBarDelegate.selectedCellIndex, 1)
        XCTAssertEqual(tabBarViewController?.selectedViewController?.view.backgroundColor, .orange)
    }
    
    fileprivate func clickOnThirdElement() {
        tabBarViewController?.selectedIndex = 2
        guard let viewControllers = tabBarViewController?.viewControllers else { return }
        tabBarViewController?.tabBarController(tabBarViewController ?? UITabBarController(),
                                               didSelect: viewControllers[2])
        
        XCTAssertEqual(tabBarDelegate.selectedCellIndex, 2)
        XCTAssertEqual(tabBarViewController?.selectedViewController?.view.backgroundColor, .green)
    }
    
    func testSendInvalidUrlToIcon() {
        self.setTabViewElements(url: "https://some-wrong-url")
        let grayImage     = UIColor.lightGray.image()
        let expectedImage = grayImage.roundedRectImageFromImage(cornerRadius: 12)
        
        self.checkEqualityBetween(icon: expectedImage, tabBarElementImage: tabBarViewController?.viewControllers?[0].tabBarItem.image ?? UIImage())
    }
    
    fileprivate func checkEqualityBetween(icon: UIImage, tabBarElementImage: UIImage) {
        let data1: NSData = icon.pngData()! as NSData
        let data2: NSData = tabBarElementImage.pngData()! as NSData
        
        XCTAssertTrue(data1.isEqual(to: data2 as Data))
    }
    
    fileprivate func generateImage(url: String) -> UIImage {
        let roundedImage = UIColor.lightGray.image()
        if let nsurl = NSURL(string: url) {
            if let data = NSData(contentsOf: nsurl as URL) {
                if let newImage = UIImage(data: data as Data) {
                    return newImage.roundedRectImageFromImage(cornerRadius: 12)
                } else {
                    return roundedImage.roundedRectImageFromImage(cornerRadius: 12)
                }
            } else {
                return roundedImage.roundedRectImageFromImage(cornerRadius: 12)
            }
        }
        
        return UIImage()
    }
}
