//
//  FirstHeaderTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Livia Vasconcelos on 31/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class FirstHeaderTests: XCTestCase {
    
    private var testVC: TestFirstHeaderViewController!
    
    private let dropdownImage                 = UIImage(named: "dropDown")!
    private let notificaticationIcon          = UIImage(named: "notifications")!
    private let standardConstructionSiteImage = UIImage(named: "home")!
    
    private let darkColor = UIColor(red: 60/255, green: 60/255, blue: 70/255, alpha: 1)
    
    private let headerTitle     = "Title"
    private let firstItemTitle  = "Item List"
    private let secondItemTitle = "Item 01"
    private let urlImage        = UIImage.defaultImageUrl
    
    override func setUp() {
        super.setUp()
        self.addHeaderView()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    fileprivate func addHeaderView() {
        testVC =  TestFirstHeaderViewController()
        testVC.addHeader(title: headerTitle, headerImage: dropdownImage, notificationImage: notificaticationIcon)
        testVC.firstHeaderView?.layoutSubviews()
        self.configureItems()
    }
    
    fileprivate func configureItems() {
        testVC.recentItems = [FirstHeaderRecentItem(title: firstItemTitle,
                                                 image: standardConstructionSiteImage, url: nil),
                              FirstHeaderRecentItem(title: secondItemTitle,
                                                 image: nil, url: urlImage)]
    }
    
    func testHeaderView() {
        let firstHeaderView = testVC.firstHeaderView ?? UIView()
        let dropdownLabel   = testVC.firstHeaderView?.dropdownLabel ?? UILabel()
        let iconImageView   = testVC.firstHeaderView?.iconImageView ?? UIImageView()
        let navigationItem  = testVC.firstHeaderView?.navigationItem ?? UIImageView()
        
        XCTAssertTrue(dropdownLabel.isDescendant(of: firstHeaderView))
        XCTAssertTrue(iconImageView.isDescendant(of: firstHeaderView))
        
        XCTAssertEqual(dropdownLabel.text, headerTitle)
        XCTAssertEqual(dropdownLabel.textColor, darkColor)
        XCTAssertEqual(dropdownLabel.font, .systemFont(ofSize: 12, weight: .regular))

        XCTAssertTrue(self.isSameImageRepresentation(iconImageView.image ?? UIImage(), dropdownImage))
        XCTAssertTrue(self.isSameImageRepresentation(navigationItem.image ?? UIImage(), notificaticationIcon))
    }
    
    fileprivate func isSameImageRepresentation(_ image1: UIImage, _ image2: UIImage) -> Bool {
        let data1: NSData = image1.pngData()! as NSData
        let data2: NSData = image2.pngData()! as NSData
        
        return data1.isEqual(to: data2 as Data)
    }
    
    func testRecentItemDialog() {
        testVC.indexSelected = 0
        testVC.openRecentItemsDialog()
        
        let recentItemsVC = testVC.recentItemsViewController ?? SelectRecentViewController()
        let dialog        = recentItemsVC.view ?? UIView()
        let tableView     = recentItemsVC.tableView ?? UITableView()
    
        XCTAssertTrue(tableView.isDescendant(of: dialog))
        XCTAssertEqual(recentItemsVC.recentItems.count, 2)
    }
    
    func testCheckCellInformation() {
        let tableViewCell = FirstHeaderRecentItemCell(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        tableViewCell.configureViewFor(item: FirstHeaderRecentItem(title: firstItemTitle,
                                                                   image: standardConstructionSiteImage, url: nil))
        
        let textLabel = tableViewCell.cellTextLabel ?? UILabel()
        let icon      = tableViewCell.photoImageView ?? UIImageView()
        
        XCTAssertTrue(textLabel.isDescendant(of: tableViewCell))
        XCTAssertTrue(icon.isDescendant(of: tableViewCell))
        
        XCTAssertTrue(isSameImageRepresentation(icon.image ?? UIImage(), standardConstructionSiteImage))
        
        XCTAssertEqual(textLabel.text, firstItemTitle)
        XCTAssertEqual(textLabel.textColor, darkColor)
        XCTAssertEqual(textLabel.font, .systemFont(ofSize: 16, weight: .regular))
    }
    
    func testClickOnCellAndBehaviourOnMainScreen() {
        testVC.clickOnCellWith(index: 1, title: secondItemTitle)
        testVC.firstHeaderView?.layoutSubviews()
        let dropdownLabel = testVC.firstHeaderView?.dropdownLabel ?? UILabel()
        
        XCTAssertEqual(dropdownLabel.text, secondItemTitle)
        XCTAssertEqual(dropdownLabel.textColor, darkColor)
        XCTAssertEqual(dropdownLabel.font, .systemFont(ofSize: 12, weight: .regular))
    }
    
    
}
