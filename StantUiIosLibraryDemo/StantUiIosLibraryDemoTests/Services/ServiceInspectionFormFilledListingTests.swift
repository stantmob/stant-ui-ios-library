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
    
    var serviceInspectionFormFilledList = [ServiceInspectionFormFilled]()
    
    let cardStatus            = 2
    let cardPerformedQuantity = 40.0
    let cardTotalUsedArea     = 156.2
    let cardUnitMeasurement   = "m²"
    let cardVerifiedUnit      = "Unidade Verificada"
    let cardPlannedArea       = 1000.0
    let cardBeginAt           = "01/04/2019"
    let cardEndAt             = "12/04/2019"
    let viewController        = ServiceInspectionFormFilledListingViewController()
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        let serviceInspectionFormFilledTableView = viewController.serviceInspectionFormFilledTableView
        
        for i in 0...3 {
            let siff = ServiceInspectionFormFilled(status:            ServiceInspectionFormFilledStatusEnum(rawValue: i)!,
                                                   performedQuantity: Float(cardPerformedQuantity) * Float(i + 1),
                                                   totalUsedArea:     Float(cardTotalUsedArea),
                                                   unitMeasurement:   cardUnitMeasurement,
                                                   verifiedUnit:      cardVerifiedUnit + "\(i)",
                                                   plannedArea:       Float(cardPlannedArea),
                                                   beginAt:           cardBeginAt,
                                                   endAt:             cardEndAt)
            serviceInspectionFormFilledList.append(siff)
        }
        
        serviceInspectionFormFilledTableView?.configureViewWith(serviceInpsectionFormFilledList: serviceInspectionFormFilledList,
                                                                searchBarIcon:                   UIImage(named: "search") ?? UIImage(),
                                                                searchBarPlaceholder:            "Search",
                                                                tableViewDelegate:               self)
        
        for index in serviceInspectionFormFilledList.indices {
            let cell = serviceInspectionFormFilledTableView?.tableView?.dequeueReusableCell(withIdentifier: ServiceInspectionFormFilledCell.identifier(),
                                                                                            for:            IndexPath(row: index, section: 0)) as! ServiceInspectionFormFilledCell
            
            cell.configureViewFor(serviceInspectionFormFilled: serviceInspectionFormFilledList[index])
        
            XCTAssertNotNil(cell.headerView)
            XCTAssertNotNil(cell.verifiedUnitLabel)
            XCTAssertNotNil(cell.progressBar)
            XCTAssertNotNil(cell.performedPercentageView)
            XCTAssertNotNil(cell.quantityLabel)
            XCTAssertNotNil(cell.percentagePlannedView)
        }
    }
}

extension ServiceInspectionFormFilledListingTests: ServiceInspectionFormFilledTableViewDidSelectDelegate {
    func didClickOnTableViewCellWith(index: Int) {
        print("Clicked on cell \(index)")
    }
}


