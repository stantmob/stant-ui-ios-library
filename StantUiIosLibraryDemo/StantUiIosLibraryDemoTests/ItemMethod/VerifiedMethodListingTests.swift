//
//  VerifiedMethodListingTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 12/06/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class VerifiedMethodListingTests: XCTestCase {
    public let statusList: [VerifiedMethodStatusEnum] = [.notApplicable, .notInspected, .reproved, .approved,
                                                         .notApplicable, .notInspected, .reproved, .approved,
                                                         .notApplicable, .notInspected, .reproved, .approved]
    public let isReinspectionList: [Bool]             = (1...12).map { index in return index % 2 == 0 }
    public let hasAttachmentList:  [Bool]             = (1...12).map { index in return index % 3 == 0 }
    
    public let descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget risus in urna imperdiet sagittis ut vel quam. Fusce sagittis nec nibh ac pulvinar. Nunc aliquam lorem a mauris volutpat, ornare ultricies urna laoreet. Morbi vitae blandit velit. Nam eleifend nec tortor non convallis."
    
    let viewController = VerifiedMethodListingViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        
        XCTAssertNotNil(viewController.tableView)
        
        guard let tableView = viewController.tableView else { return }
        
        for index in statusList.indices {
            let cell = tableView.dequeueReusableCell(withIdentifier: VerifiedMethodCell.identifier(),
                                                     for:            IndexPath(row: index, section: 0)) as! VerifiedMethodCell
            
            XCTAssertNotNil(cell)
            
            cell.configure(status:          statusList[index],
                           order:           index + 1,
                           isReinspection:  isReinspectionList[index],
                           hasAttachment:   hasAttachmentList[index],
                           descriptionText: descriptionText)
            
            XCTAssertEqual(cell.statusBadge?.statusTag?.backgroundColor, statusList[index].colorValue())
            XCTAssertEqual(cell.reinspectedIndicator?.isHidden, !isReinspectionList[index])
            XCTAssertEqual(cell.attachmentIndicator?.isHidden, !hasAttachmentList[index])
        }
    }
}
