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
        let tableView = viewController.tableView
        
        for index in placeTitleList.indices {
            let cell = tableView?.dequeueReusableCell(withIdentifier: PlacesCell.identifier(),
                                                      for:            IndexPath(row: index, section: 0)) as! PlacesCell
            
            cell.configureViewFor(delegate:          self,
                                  index:             index,
                                  status:            placesStatusEnum[index],
                                  placeTitle:        placeTitleList[index],
                                  quantitySubPlaces: quantitySubPlaceList[index],
                                  percentage:        percentageList[index],
                                  hasSiff:           hasSiffList[index])
            
            XCTAssertNotNil(tableView)
            XCTAssertNotNil(cell.bar)
            XCTAssertNotNil(cell.locationView)
            XCTAssertNotNil(cell.locationImage)
            XCTAssertNotNil(cell.placeTitleLabel)
            
            if quantitySubPlaceList[index] == 0 {
                XCTAssertNil(cell.subPlacesLabel)
            } else {
                XCTAssertNotNil(cell.subPlacesLabel)
            }
            
            XCTAssertNotNil(cell.percentagePlacelabel)
            XCTAssertNotNil(cell.siffIconView)
            XCTAssertNotNil(cell.siffIconImage)
            
            if quantitySubPlaceList[index] == 0 {
                XCTAssertNil(cell.leftTapView)
            } else {
                XCTAssertNotNil(cell.leftTapView)
            }
            
            if hasSiffList[index] {
                XCTAssertNotNil(cell.rightTapView)
            } else {
                XCTAssertNil(cell.rightTapView)
            }
        }
    }
}

extension ListingPlacesTests: PlaceCellDidSelectDelegate {
    func goToSubPlaces(index: Int) {
        print("Places screen")
    }
    
    func goToServiceInspectionFormFilledScreen() {
         print("Siff screen")
    }
}
