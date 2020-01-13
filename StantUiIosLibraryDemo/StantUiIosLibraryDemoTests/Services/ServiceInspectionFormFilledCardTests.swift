//
//  ServiceInspectionFormFilledCardTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 09/01/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ServiceInspectionFormFilledCardTests: XCTestCase {
    
    private var cardsView: ServiceInspectionFormFilledCardStack!
    
    let percentageList: [Float]    = [0, 0.155, 0.5, 0.84, 1]
    var percentage:     Float      = 0
    var quantity:       Float      = 1200
    var viewHeight:     CGFloat    = 69
    var viewWidth:      CGFloat    = 300
    
    public var plannedMessage:   String = "Planned"
    public var executedMessage:  String = "Executed"
    public var availableMessage: String = "Available"
    
    override func setUp() {
        super.setUp()
        
        cardsView = ServiceInspectionFormFilledCardStack(frame: CGRect(x:      0,
                                                                       y:      0,
                                                                       width:  viewWidth,
                                                                       height: viewHeight))
        
        self.configureCardsView()
    }
    
    fileprivate func configureCardsView() {
        cardsView.configure(executedPercentage: self.percentage,
                            quantity:           self.quantity,
                            plannedMessage:     self.plannedMessage,
                            executedMessage:    self.executedMessage,
                            availableMessage:   self.availableMessage)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGeneralView() {
        self.configureCardsView()
        
        XCTAssertTrue(cardsView.plannedFispCard?.isDescendant(of: cardsView) ?? false)
        XCTAssertTrue(cardsView.executedFispCard?.isDescendant(of: cardsView) ?? false)
        XCTAssertTrue(cardsView.availableFispCard?.isDescendant(of: cardsView) ?? false)
        
        XCTAssertEqual(cardsView.frame.width, viewWidth)
        XCTAssertEqual(cardsView.frame.height, viewHeight)
        
        XCTAssertEqual(cardsView.plannedFispCard?.frame.width, cardsView.executedFispCard?.frame.width)
        XCTAssertEqual(cardsView.executedFispCard?.frame.width, cardsView.availableFispCard?.frame.width)
        
        XCTAssertEqual(cardsView.plannedFispCard?.frame.height, cardsView.executedFispCard?.frame.height)
        XCTAssertEqual(cardsView.executedFispCard?.frame.height, cardsView.availableFispCard?.frame.height)
    }
    
    func testPercentageLabelBackground() {
        XCTAssertEqual(cardsView.plannedFispCard?.percentageLabel?.backgroundColor, .darkGrayStant)
        XCTAssertEqual(cardsView.executedFispCard?.percentageLabel?.backgroundColor, .blueLightStant)
        XCTAssertEqual(cardsView.availableFispCard?.percentageLabel?.backgroundColor, .blueDarkStant)
    }
    
    func testPercentageLabelContent() {
        for percentage in percentageList {
            self.percentage = percentage
            self.configureCardsView()
            
            XCTAssertEqual(cardsView.plannedFispCard?.percentageLabel?.text, "\(100)%")
            XCTAssertEqual(cardsView.executedFispCard?.percentageLabel?.text, "\((self.percentage * 100).cleanValue)%")
            XCTAssertEqual(cardsView.availableFispCard?.percentageLabel?.text, "\(((1 - self.percentage) * 100).cleanValue)%")
        }
    }
    
    func testMessageLabel() {
        self.configureCardsView()
        
        XCTAssertEqual(cardsView.plannedFispCard?.messageLabel?.text, self.plannedMessage)
        XCTAssertEqual(cardsView.executedFispCard?.messageLabel?.text, self.executedMessage)
        XCTAssertEqual(cardsView.availableFispCard?.messageLabel?.text, self.availableMessage)
    }

    func testQuantityLabel() {
        self.configureCardsView()
        
        for percentage in percentageList {
            self.percentage = percentage
            self.configureCardsView()
            
            XCTAssertEqual(cardsView.plannedFispCard?.quanityLabel?.text, "\(String(format: "%.2f", quantity)) m²")
            XCTAssertEqual(cardsView.executedFispCard?.quanityLabel?.text, "\(String(format: "%.2f", quantity * percentage)) m²")
            XCTAssertEqual(cardsView.availableFispCard?.quanityLabel?.text, "\(String(format: "%.2f", quantity * (1 - percentage))) m²")
        }
    }
}

