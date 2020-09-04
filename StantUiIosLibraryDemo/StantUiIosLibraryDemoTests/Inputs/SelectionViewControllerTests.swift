//
//  SelectionViewControllerTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 04/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class SelectionViewControllerTests: XCTestCase {
    var selectedItems           = [Int]()
    let selectionViewController = CheckMarkSelectionViewController()
    let itemTitles              = (1...3).map { "Person \($0)" }
    let itemSubtitles           = (1...3).map { "Role \($0)" }
    let iconsUrls               = (1...3).map { _ in "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw" }
    
    var tableView: UITableView?
    var cell1:     UITableViewCell?
    var cell2:     UITableViewCell?
    var cell3:     UITableViewCell?
    
    func setTableView() {
        tableView           = selectionViewController.tableView ?? UITableView()
        guard let tableView = tableView else { return }

        cell1 = selectionViewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        cell2 = selectionViewController.tableView(tableView, cellForRowAt: IndexPath(row: 1, section: 0))
        cell3 = selectionViewController.tableView(tableView, cellForRowAt: IndexPath(row: 2, section: 0))
    }
    
    func testMultipleSelection() {
        selectedItems = []
        
        selectionViewController.configure(delegate:          self,
                                          headerTitle:       "Select Team",
                                          selectionType:     .multiple,
                                          confirmButtonText: "Confirm",
                                          selectedItems:     selectedItems,
                                          itemTitles:        itemTitles,
                                          itemSubtitles:     itemSubtitles,
                                          iconsUrls:         iconsUrls)
        selectionViewController.loadViewIfNeeded()
        setTableView()
        
        guard let tableView = tableView else { return }
        
        XCTAssertNotNil(cell1)
        XCTAssertNotNil(cell2)
        XCTAssertNotNil(cell3)
        
        selectionViewController.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        selectionViewController.tableView(tableView, didSelectRowAt: IndexPath(row: 2, section: 0))
        selectionViewController.confirmButton?.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(selectedItems.count, 2)
        XCTAssertEqual(selectedItems.first, 0)
        XCTAssertEqual(selectedItems.last, 2)
    }
    
    func testSingleSelection() {
        selectedItems = []
        
        selectionViewController.configure(delegate:          self,
                                          headerTitle:       "Select Team",
                                          selectionType:     .single,
                                          confirmButtonText: "Confirm",
                                          selectedItems:     selectedItems,
                                          itemTitles:        itemTitles,
                                          itemSubtitles:     itemSubtitles,
                                          iconsUrls:         iconsUrls)
        selectionViewController.loadViewIfNeeded()
        setTableView()
        
        guard let tableView = tableView else { return }
        
        XCTAssertNotNil(cell1)
        XCTAssertNotNil(cell2)
        XCTAssertNotNil(cell3)
        
        selectionViewController.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        selectionViewController.tableView(tableView, didSelectRowAt: IndexPath(row: 2, section: 0))
        selectionViewController.confirmButton?.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(selectedItems.count, 1)
        XCTAssertEqual(selectedItems.first, 2)
        XCTAssertEqual(selectedItems.last, 2)
    }
}

extension SelectionViewControllerTests: SelectionViewDelegate {
    func getSelectedItems(items: [Int]) {
        self.selectedItems = returnSelectedItems(items)
    }
    
    func returnSelectedItems(_ items: [Int]) -> [Int] {
        return items
    }
}
