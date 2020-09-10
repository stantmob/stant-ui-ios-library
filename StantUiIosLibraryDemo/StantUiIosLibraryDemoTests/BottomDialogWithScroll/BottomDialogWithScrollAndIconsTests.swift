//
//  BottomDialogWithScrollAndIconsTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 16/12/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class BottomDialogWithScrollAndIconsTests: XCTestCase {

    let viewController = BottomDialogTestViewController()
    let items          = ["Home", "Item 01", "Item 02", "Item 03", "Item 04", "Item 05",
                          "Item 06", "Item 07", "Item 08", "Item 09"]
    
    let icons = ["home",
                 UIImage.defaultImageUrl,
                 UIImage.defaultImageUrl,
                 UIImage.defaultImageUrl,
                 UIImage.defaultImageUrl,
                 UIImage.defaultImageUrl,
                 UIImage.defaultImageUrl,
                 UIImage.defaultImageUrl,
                 UIImage.defaultImageUrl,
                 UIImage.defaultImageUrl]
    
    override func setUp() {
        super.setUp()
        self.showBottomDialog()
    }
    
    fileprivate func showBottomDialog() {
        viewController.bottomDialog.cellDelegate = viewController
        viewController.bottomDialog.configureView(items: items, icons: icons, selectedItemIndex: viewController.selectedItemIndex)
        viewController.present(viewController.bottomDialog, animated: false, completion: nil)
    }
    
    func testDialogInformation() {
        let firstCell  = viewController.bottomDialog.tableView(viewController.bottomDialog.tableView ?? UITableView(),
                                                               cellForRowAt: IndexPath(row: 0, section: 0)) as? ScrollableTableViewDialogCell
        let secondCell = viewController.bottomDialog.tableView(viewController.bottomDialog.tableView ?? UITableView(),
                                                               cellForRowAt: IndexPath(row: 1, section: 0)) as? ScrollableTableViewDialogCell
        
        XCTAssertEqual(viewController.bottomDialog.tableView?.numberOfRows(inSection: 0), 10)
        XCTAssertEqual(firstCell?.cellTextLabel?.text, "Home")
        XCTAssertEqual(firstCell?.cellIcon?.image, UIImage(named: "home"))
        XCTAssertEqual(firstCell?.accessoryType, UITableViewCell.AccessoryType.checkmark)
        XCTAssertEqual(secondCell?.accessoryType, UITableViewCell.AccessoryType.none)
    }
    
    func testClickInCell() {
        viewController.bottomDialog.tableView(viewController.bottomDialog.tableView ?? UITableView(),
                                              didSelectRowAt: IndexPath(row: 1, section: 0))
        
        XCTAssertTrue(viewController.didClickOnCell)
        self.checkTableViewInformationAfterSelection()
    }
    
    fileprivate func checkTableViewInformationAfterSelection() {
        self.showBottomDialog()
        
        let firstCell  = viewController.bottomDialog.tableView(viewController.bottomDialog.tableView ?? UITableView(),
                                                               cellForRowAt: IndexPath(row: 0, section: 0)) as? ScrollableTableViewDialogCell
        let secondCell = viewController.bottomDialog.tableView(viewController.bottomDialog.tableView ?? UITableView(),
                                                               cellForRowAt: IndexPath(row: 1, section: 0)) as? ScrollableTableViewDialogCell
        
        XCTAssertEqual(firstCell?.accessoryType, UITableViewCell.AccessoryType.none)
        XCTAssertEqual(secondCell?.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }

}
