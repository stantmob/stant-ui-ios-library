//
//  BottomDialogWithScrollAndLeftViewsTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 04/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class BottomDialogWithScrollAndLeftViewsTests: XCTestCase {
    let viewController = BottomDialogTestViewController()
    let items          = ["Item 01", "Item 02", "Item 03", "Item 04", "Item 05"]
    let leftView       = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 10))
    
    override func setUp() {
        super.setUp()
        self.showBottomDialog()
    }
    
    fileprivate func showBottomDialog() {
        let leftViews                            = (1...5).map{_ in leftView}
        viewController.bottomDialog.cellDelegate = viewController
        
        viewController.bottomDialog.configureView(items:             items,
                                                  leftViews:         leftViews,
                                                  selectedItemIndex: viewController.selectedItemIndex)
        viewController.present(viewController.bottomDialog, animated: false, completion: nil)
    }
    
    func testDialogInformation() {
        let firstCell  = viewController.bottomDialog.tableView(viewController.bottomDialog.tableView ?? UITableView(),
                                                               cellForRowAt: IndexPath(row: 0, section: 0)) as? ScrollableTableViewDialogCell
        let secondCell = viewController.bottomDialog.tableView(viewController.bottomDialog.tableView ?? UITableView(),
                                                               cellForRowAt: IndexPath(row: 1, section: 0)) as? ScrollableTableViewDialogCell
        
        XCTAssertEqual(viewController.bottomDialog.tableView?.numberOfRows(inSection: 0), 5)
        XCTAssertEqual(firstCell?.cellIcon?.image?.size, CGSize(width: 50, height: 10))
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
