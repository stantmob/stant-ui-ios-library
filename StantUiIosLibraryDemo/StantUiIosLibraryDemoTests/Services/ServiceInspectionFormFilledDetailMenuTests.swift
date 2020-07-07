//
//  ServiceInspectionFormFilledDetailMenuTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 01/06/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ServiceInspectionFormFilledDetailMenuTests: XCTestCase {
    var personInChargeNames = ["Person 1", "Person 2", "Person 3"]
    var personNames         = (1...30).map { "Person \($0)" }
    var personRoles         = (1...30).map { "Role \($0)" }
    var photoUrls           = (1...30).map { _ in "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw" }
    let viewController      = ServiceInspectionFormFilledDetailMenuViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        let detailView = viewController.detailView
        
        XCTAssertNotNil(detailView)
        XCTAssertNotNil(detailView?.inChargeStackView)
        XCTAssertNotNil(detailView?.mainTabView)
        XCTAssertNotNil(detailView?.formTabView)
        XCTAssertNotNil(detailView?.teamTabView)
        XCTAssertNotNil(detailView?.attachmentTabView)
        
        XCTAssertFalse(detailView?.formTabView?.isHidden ?? true)
        XCTAssertTrue(detailView?.teamTabView?.isHidden ?? false)
        XCTAssertTrue(detailView?.attachmentTabView?.isHidden ?? false)
        
    }
    
    func testInChargeStackSubViews() {
        viewController.loadViewIfNeeded()
        let inChargeStackView = viewController.detailView?.inChargeStackView
        
        XCTAssertNotNil(inChargeStackView?.responsibleDetail)
        XCTAssertEqual(inChargeStackView?.responsibleDetail?.nameLabel?.text, personInChargeNames[0])
        
        XCTAssertNotNil(inChargeStackView?.finalizerDetail)
        XCTAssertEqual(inChargeStackView?.finalizerDetail?.nameLabel?.text, personInChargeNames[1])
        
        XCTAssertNotNil(inChargeStackView?.approverDetail)
        XCTAssertEqual(inChargeStackView?.approverDetail?.nameLabel?.text, personInChargeNames[2])
    }
    
    func testMainTabView() {
        viewController.loadViewIfNeeded()
        let mainTabView = viewController.detailView?.mainTabView
        
        XCTAssertNotNil(mainTabView)
        XCTAssertEqual(mainTabView?.cellTitles.count, 3)
    }
    
    func testFormTabSubViews() {
        viewController.loadViewIfNeeded()
        let formTabView = viewController.detailView?.formTabView
        
        XCTAssertNotNil(formTabView?.collectionView)
        XCTAssertEqual(formTabView?.contentList.count, 4)
    }
    
    func testTeamTabSubViews() {
        viewController.loadViewIfNeeded()
        let teamTabView = viewController.detailView?.teamTabView
        
        XCTAssertNotNil(teamTabView?.tableView)
        XCTAssertNotNil(teamTabView?.seeMoreView)
        XCTAssertEqual(teamTabView?.personNames, personNames)
        XCTAssertEqual(teamTabView?.personRoles, personRoles)
        XCTAssertEqual(teamTabView?.photoUrls, photoUrls)
    }
    
    func testAttachmentTabSubViews() {
        viewController.loadViewIfNeeded()
        let attachmentTabView = viewController.detailView?.attachmentTabView
        
        XCTAssertNotNil(attachmentTabView?.collectionView)
        XCTAssertNotNil(attachmentTabView?.seeMoreView)
        XCTAssertEqual(attachmentTabView?.photoUrls, photoUrls)
    }
    
    func testTabClick() {
        viewController.loadViewIfNeeded()
        let detailView  = viewController.detailView
        let mainTabView = viewController.detailView?.mainTabView
        
        mainTabView?.delegate?.goToTeamTabView()
        XCTAssertTrue(detailView?.formTabView?.isHidden ?? false)
        XCTAssertFalse(detailView?.teamTabView?.isHidden ?? true)
        XCTAssertTrue(detailView?.attachmentTabView?.isHidden ?? false)
        
        mainTabView?.delegate?.goToAttachmentTabView()
        XCTAssertTrue(detailView?.formTabView?.isHidden ?? false)
        XCTAssertTrue(detailView?.teamTabView?.isHidden ?? false)
        XCTAssertFalse(detailView?.attachmentTabView?.isHidden ?? true)
        
        mainTabView?.delegate?.goToFormTabView()
        XCTAssertFalse(detailView?.formTabView?.isHidden ?? true)
        XCTAssertTrue(detailView?.teamTabView?.isHidden ?? false)
        XCTAssertTrue(detailView?.attachmentTabView?.isHidden ?? false)
    }
}
