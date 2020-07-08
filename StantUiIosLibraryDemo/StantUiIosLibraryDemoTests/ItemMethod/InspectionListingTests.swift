//
//  InspectionListingTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 08/07/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class InspectionListingTests: XCTestCase {
    public var groupedInspectionList                = [(key: String, value: [InspectionCellData])]()
    public let severityList: [Int]                  = [5, 3, 1, 0, 4, 3, 2, 0, 3, 5]
    public let descriptionList                      = (0..<10).map{"My description \($0 + 1)"}
    public let statusList:   [InspectionStatusEnum] = [.reproved, .approved, .reproved, .approved, .reproved,
                                                       .approved, .reproved, .approved, .reproved, .approved]
    public let createdAtList                        = ["06/01/2020", "25/01/2020", "25/01/2020", "07/01/2020", "18/01/2020",
                                                       "06/01/2020", "18/01/2020", "25/01/2020", "06/01/2020", "03/01/2020"]
    public let deadlineList                         = ["25/01/2020", "30/01/2020", "19/01/2020", "21/01/2020", "30/01/2020",
                                                       "28/01/2020", "03/01/2020", "31/01/2020", "16/01/2020", "01/01/2020"]
    
    let viewController = InspectionListingViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        
        XCTAssertNotNil(viewController.tableView)
        groupedInspectionList = viewController.populateInspectionList()
        guard let tableView   = viewController.tableView else { return }
        XCTAssertEqual(tableView.numberOfSections, 5)
        
        for (section, group) in groupedInspectionList.enumerated() {            
            for (row, inspectionCellData) in group.value.enumerated() {
                XCTAssertEqual(inspectionCellData.createdAt, group.key)
                
                if inspectionCellData.status == .approved {
                    let cell = tableView.dequeueReusableCell(withIdentifier: ApprovedInspectionCell.identifier(),
                                                             for:            IndexPath(row: row, section: section)) as? ApprovedInspectionCell
                    checkApprovedCell(cell: cell, inspectionCellData: inspectionCellData)
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: ReprovedInspectionCell.identifier(),
                                                             for:            IndexPath(row: row, section: section)) as? ReprovedInspectionCell
                    checkReprovedCell(cell: cell, inspectionCellData: inspectionCellData)
                }
            }
        }
    }
    
    func checkApprovedCell(cell: ApprovedInspectionCell?, inspectionCellData: InspectionCellData) {
        cell?.configure(delegate:        viewController,
                        descriptionText: inspectionCellData.descriptionText)
        XCTAssertEqual(cell?.subviews.count, 4)
        for subview in cell?.subviews ?? [] {
            XCTAssertNotNil(subview)
        }
    }

    func checkReprovedCell(cell: ReprovedInspectionCell?, inspectionCellData: InspectionCellData) {
        cell?.configure(delegate:        viewController,
                        severity:        inspectionCellData.severity,
                        deadline:        inspectionCellData.deadline,
                        descriptionText: inspectionCellData.descriptionText)
        XCTAssertEqual(cell?.subviews.count, 7)
        for subview in cell?.subviews ?? [] {
            XCTAssertNotNil(subview)
        }
    }
}
