//
//  ItemMethodListingTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 12/06/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

//TEST METHODS!!!!
class ItemListingTests: XCTestCase {
    public let statusList:            [ItemEnum]  = [.approved, .reproved, .notInspected,
                                                     .approved, .reproved, .notInspected,
                                                     .approved, .reproved, .notInspected,
                                                     .approved, .reproved, .notInspected,
                                                     .approved, .reproved, .notInspected]
    public let hasReprovedMethodList: [Bool]      = (1...15).map { index in return index % 2 == 0 }
    public var isExpandedList:        [Bool]      = (1...15).map { _ in false }
    
    public let observationText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget risus in urna imperdiet sagittis ut vel quam. Fusce sagittis nec nibh ac pulvinar. Nunc aliquam lorem a mauris volutpat, ornare ultricies urna laoreet. Morbi vitae blandit velit. Nam eleifend nec tortor non convallis."
    
    let viewController = ItemListingViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        
        XCTAssertNotNil(viewController.itemMethodTableView)
        
        guard let itemMethodTableView = viewController.itemMethodTableView else { return }
        
        for index in statusList.indices {
            let header = itemMethodTableView.tableView?.dequeueReusableHeaderFooterView(withIdentifier: ItemHeaderView.identifier())
                         as! ItemHeaderView
            
            header.configure(delegate:          itemMethodTableView,
                             section:           index,
                             status:            statusList[index],
                             hasReprovedMethod: !hasReprovedMethodList[index],
                             isExpanded:        isExpandedList[index],
                             itemTitle:         "Item \(index)")

            XCTAssertEqual(header.statusTag?.backgroundColor, statusList[index].colorValue())
            XCTAssertEqual(header.isExpanded, isExpandedList[index])
        }
    }
    
    func testClick() {
        viewController.loadViewIfNeeded()
        
        XCTAssertNotNil(viewController.itemMethodTableView)
        
        guard let itemMethodTableView = viewController.itemMethodTableView else { return }
        
        for index in statusList.indices {
            let header = itemMethodTableView.tableView?.dequeueReusableHeaderFooterView(withIdentifier: ItemHeaderView.identifier())
                         as! ItemHeaderView
            
            header.configure(delegate:          itemMethodTableView,
                             section:           index,
                             status:            statusList[index],
                             hasReprovedMethod: !hasReprovedMethodList[index],
                             isExpanded:        isExpandedList[index],
                             itemTitle:         "Item \(index)")
            
            XCTAssertEqual(itemMethodTableView.tableView?.numberOfRows(inSection: index), 0)
            itemMethodTableView.toggleCollapse(section: index)
            XCTAssertEqual(itemMethodTableView.tableView?.numberOfRows(inSection: index), 5)
            itemMethodTableView.toggleCollapse(section: index)
            XCTAssertEqual(itemMethodTableView.tableView?.numberOfRows(inSection: index), 0)
        }
    }
}
