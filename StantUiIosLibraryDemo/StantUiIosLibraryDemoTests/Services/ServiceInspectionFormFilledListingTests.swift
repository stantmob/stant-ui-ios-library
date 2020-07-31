//
//  ServiceInspectionFormFilledListingTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Renato on 7/2/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ServiceInspectionFormFilledListingTests: XCTestCase {
    let unitMeasurement = "m²"
    let beginAt         = "01/04/2019"
    let endAt           = "12/04/2019"
    
    let planningQuantity:         Float   = 1000.0
    let approvedMethodPercentage: Float   = 0.6
    let navigationBarHeight:      CGFloat = 60
    
    let siffStatusList        = (0...3).map{ ServiceInspectionFormFilledCellTypeEnum(rawValue: $0)! }
    let performedQuantityList = (0...3).map{ Float(40) * Float($0 + 1) }
    let verifiedUnitList      = (0...3).map{ "Unidade Verificada \($0 + 1)" }
    
    let viewController        = ServiceInspectionFormFilledListingViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        
        guard let tableView = viewController.tableView else { return }
        
        for index in siffStatusList.indices {
            let cell = tableView.dequeueReusableCell(withIdentifier: ServiceInspectionFormFilledCell.identifier(),
                                                     for:            IndexPath(row: index, section: 0)) as!
                                                     ServiceInspectionFormFilledCell
            
            cell.configureViewFor(status:                   siffStatusList[index],
                                  beginAt:                  beginAt,
                                  endAt:                    endAt,
                                  verifiedUnit:             verifiedUnitList[index],
                                  unitMeasurement:          unitMeasurement,
                                  performedQuantity:        performedQuantityList[index],
                                  approvedMethodPercentage: approvedMethodPercentage,
                                  planningQuantity:         planningQuantity)
        
            XCTAssertNotNil(cell.headerView)
            XCTAssertNotNil(cell.verifiedUnitLabel)
            XCTAssertNotNil(cell.progressBar)
            XCTAssertNotNil(cell.performedPercentageView)
            XCTAssertNotNil(cell.quantityLabel)
            XCTAssertNotNil(cell.percentagePlannedView)
        }
    }
}

