//
//  VerifiedMethodDetailViewTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Renato Vieira on 7/10/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class VerifiedMethodDetailViewTests: XCTestCase {
    
    let viewController = VerifiedMethodDetailViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        
        XCTAssertNotNil(viewController.verifiedMethodDetailView)
        
        guard let verifiedMethodDetailView = viewController.verifiedMethodDetailView else { return }
        
        var approveAction = verifiedMethodDetailView.approveButton?.actions(forTarget:       viewController,
                                                                            forControlEvent: .touchUpInside)
        var reproveAction = verifiedMethodDetailView.reproveButton?.actions(forTarget:       viewController,
                                                                             forControlEvent: .touchUpInside)
        
        XCTAssertEqual(approveAction?[0], "goToApproveVerifiedMethod")
        XCTAssertEqual(reproveAction?[0], "goToReproveVerifiedMethod")
        
        verifiedMethodDetailView.notApplicableSwitch?.isOn = true
        verifiedMethodDetailView.notApplicableSwitch?.sendActions(for: .valueChanged)
        
        approveAction = verifiedMethodDetailView.approveButton?.actions(forTarget:       verifiedMethodDetailView,
                                                                        forControlEvent: .touchUpInside)
        reproveAction = verifiedMethodDetailView.reproveButton?.actions(forTarget:       verifiedMethodDetailView,
                                                                         forControlEvent: .touchUpInside)
        
        XCTAssertEqual(approveAction?[0], "warningAction")
        XCTAssertEqual(reproveAction?[0], "warningAction")
    }
}
