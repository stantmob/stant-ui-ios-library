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
        
//        for index in statusList.indices {
//            let cell = tableView.dequeueReusableCell(withIdentifier: VerifiedMethodCell.identifier(),
//                                                     for:            IndexPath(row: index, section: 0)) as! VerifiedMethodCell
//
//            XCTAssertNotNil(cell)
//
//            cell.configure(status:          statusList[index],
//                           order:           index + 1,
//                           isReinspection:  isReinspectionList[index],
//                           hasAttachment:   hasAttachmentList[index],
//                           descriptionText: descriptionText)
//
//            XCTAssertEqual(cell.statusBadge?.statusView?.backgroundColor, statusList[index].colorValue())
//            XCTAssertEqual(cell.reinspectedIndicator?.isHidden, !isReinspectionList[index])
//            XCTAssertEqual(cell.attachmentIndicator?.isHidden, !hasAttachmentList[index])
//        }
    }

}
