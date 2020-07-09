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

class ItemListingTests: XCTestCase {
    public let statusList: [ItemMethodEnum]  = [.approved, .reproved, .notInspected,
                                                .approved, .reproved, .notInspected,
                                                .approved, .reproved, .notInspected,
                                                .approved, .reproved, .notInspected,
                                                .approved, .reproved, .notInspected]
    public let hasReprovedMethodList: [Bool] = (1...15).map { index in return index % 2 == 0 }
    public var isExpandedList:        [Bool] = (1...15).map { _ in false }
    
    public let observationText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget risus in urna imperdiet sagittis ut vel quam. Fusce sagittis nec nibh ac pulvinar. Nunc aliquam lorem a mauris volutpat, ornare ultricies urna laoreet. Morbi vitae blandit velit. Nam eleifend nec tortor non convallis."
    
    let viewController = ItemListingViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        
        XCTAssertNotNil(viewController.tableView)
        
        guard let tableView = viewController.tableView else { return }
        
        for index in statusList.indices {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ItemHeaderView.identifier())
                         as! ItemHeaderView
            
            header.configure(delegate:          viewController,
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
        
        XCTAssertNotNil(viewController.tableView)
        
        guard let tableView = viewController.tableView else { return }
        
        for index in statusList.indices {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ItemHeaderView.identifier())
                         as! ItemHeaderView
            
            header.configure(delegate:          viewController,
                             section:           index,
                             status:            statusList[index],
                             hasReprovedMethod: !hasReprovedMethodList[index],
                             isExpanded:        isExpandedList[index],
                             itemTitle:         "Item \(index)")
            
            XCTAssertEqual(tableView.numberOfRows(inSection: index), 0)
            viewController.toggleCollapse(section: index)
            XCTAssertEqual(tableView.numberOfRows(inSection: index), 1)
            viewController.toggleCollapse(section: index)
            XCTAssertEqual(tableView.numberOfRows(inSection: index), 0)
        }
    }
}
