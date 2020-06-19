//
//  ListingPlacesTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Renato on 6/18/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ListingPlacesTests: XCTestCase {
    
    public var placesStatusEnum:     [PlaceStatusEnum] = [.noPlanning, .hasPlanning, .allApproved, .allFinalized]
    public var placeTitleList:       [String]          = ["Obra 1","Obra 2","Obra 3","Obra 4"]
    public var quantitySubPlaceList: [Int]             = [0, 1, 2, 3]
    public var percentageList:       [Float]           = [80, 32.5, 30, 110]
    public var hasSiffList:          [Bool]            = [true, false, false, true]
    
    let viewController                                 = ListingPlacesViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        let detailView = viewController.detailView
        
        XCTAssertNotNil(detailView)
        XCTAssertNotNil(detailView?.bar)
        XCTAssertNotNil(detailView?.locationView)
        XCTAssertNotNil(detailView?.locationImage)
        XCTAssertNotNil(detailView?.placeTitleLabel)
        XCTAssertNotNil(detailView?.subPlacesLabel)
        XCTAssertNotNil(detailView?.percentagePlacelabel)
        XCTAssertNotNil(detailView?.siffIconView)
        XCTAssertNotNil(detailView?.siffIconImage)
        XCTAssertNotNil(detailView?.leftTapView)
        XCTAssertNotNil(detailView?.rightTapView)
    }
    
    func testInBar() {
        viewController.loadViewIfNeeded()
        let bar = viewController.detailView?.bar
        
        XCTAssertNotNil(bar)
        XCTAssertEqual(bar?.placesStatusEnum, placesStatusEnum[0])
        
        XCTAssertNotNil(bar)
        XCTAssertEqual(bar?.placesStatusEnum, placesStatusEnum[1])
        
        XCTAssertNotNil(bar)
        XCTAssertEqual(bar?.placesStatusEnum, placesStatusEnum[2])
        
        XCTAssertNotNil(bar)
        XCTAssertEqual(bar?.placesStatusEnum, placesStatusEnum[3])
    }
}
