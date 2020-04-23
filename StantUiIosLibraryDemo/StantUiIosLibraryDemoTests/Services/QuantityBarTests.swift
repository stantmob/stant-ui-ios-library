//
//  QuantityBarTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 22/04/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class QuantityBarTests: XCTestCase {
    private var quantityBar: QuantityBar!
    
    var percentage:     Float   = 0
    let viewWidth:      CGFloat = 200
    let viewHeight:     CGFloat = 6
    let totalQuantity:  Float   = 200
    let doneQuantity:   Float   = 100
    let percentageList: [Float] = [0, 0.25, 0.5, 0.75, 1]
    let quantityList:   [CGFloat] = [0, 25, 50, 75, 100]
    
    override func setUp() {
        super.setUp()
        quantityBar = QuantityBar(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        self.configureQuantityBar()
    }
    
    fileprivate func configureQuantityBar() {
        quantityBar.configure(totalQuantity: totalQuantity, doneQuantity: doneQuantity)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGeneralView() {
        self.configureQuantityBar()
        
        XCTAssertTrue(quantityBar.mainBar?.isDescendant(of: quantityBar) ?? false)
        XCTAssertTrue(quantityBar.doneBar?.isDescendant(of: quantityBar) ?? false)
        XCTAssertTrue(quantityBar.toDoBar?.isDescendant(of: quantityBar) ?? false)
    }

    func testInitialState() {
        self.configureQuantityBar()

        XCTAssertEqual(quantityBar.frame.width, viewWidth)
    }

    func testQuantityBarDimensionsWhenSettingPercentage() {
        var expectedWidth:  CGFloat
        var toDoWidth:      CGFloat

        XCTAssertEqual(quantityBar.mainBar?.frame.height, viewHeight)

        for percentage in percentageList {
            self.percentage = percentage
            quantityBar.setPercentageToDo(percentage: percentage)

            expectedWidth  = CGFloat(self.percentage) * viewWidth * CGFloat(doneQuantity / totalQuantity)
            toDoWidth      = CGFloat((quantityBar.toDoBar?.selectedToDoBar?.frame.width)!)

            XCTAssertEqual(ceil(expectedWidth), ceil(toDoWidth))
        }
    }
    
    func testQuantityBarDimensionsWhenSettingQuantity() {
        var toDoWidth:      CGFloat

        XCTAssertEqual(quantityBar.mainBar?.frame.height, viewHeight)

        for quantity in quantityList {
            quantityBar.setQuantityToDo(quantity: Float(quantity))
            toDoWidth = CGFloat((quantityBar.toDoBar?.selectedToDoBar?.frame.width)!)

            XCTAssertEqual(ceil(quantity), ceil(toDoWidth))
        }
    }
}
