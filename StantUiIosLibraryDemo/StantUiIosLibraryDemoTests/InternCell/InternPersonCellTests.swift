//
//  InternPersonCellTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Alexandre Henrique on 7/3/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class InternPersonCellTests: XCTestCase {

    private var cell: InternPersonCell!
    private var titleSize: CGFloat!
    private var imageSize: CGSize!
    private var titleLabel: String!
    private var profileImage: UIImage!
    private var cellDescription: String!
    private var descriptionSize: CGFloat!
    
    override func setUp() {
        self.cell = InternPersonCell(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: 200,
                                                   height: 200))
    }

    override func tearDown() {
        self.cell            = nil
        self.titleSize       = nil
        self.imageSize       = nil
        self.titleLabel      = nil
        self.profileImage    = nil
        self.cellDescription = nil
        self.descriptionSize = nil
    }
    
    func testIfThereIsACellCreated() throws {
        XCTAssertNotNil(self.cell)
    }

    func testIfThereIsADescription() throws {
        try given("A generated description") {
            self.cellDescription = "Some random description"
        }
        
        try when("Set to the cell") {
            self.cell.set(description: self.cellDescription)
        }
        
        try then("It should match the given description") {
            XCTAssertEqual(self.cell.descriptionLabel.text, self.cellDescription)
        }
    }
    
    func testIfThereIsATitle() throws {
        try given("A generated title") {
            self.titleLabel = "Some random description"
        }
        
        try when("Set to the cell") {
            self.cell.set(title: self.titleLabel)
        }
        
        try then("It should match the given description") {
            XCTAssertEqual(self.cell.titleLabel.text, self.titleLabel)
        }
    }
    
    func testIfItDoesResizeExistingImageByStandardSize() throws {
        try given("A generated image and default size") {
            self.imageSize    = CGSize(width: 35, height: 35)
            self.profileImage = UIImage(named: "godfatherWashington")
        }
        
        try when("Set to the cell") {
            self.cell.set(icon: self.profileImage, iconSize: self.imageSize)
        }
        
        try then("It should match the given size") {
            XCTAssertEqual(self.cell.imageView?.image?.size, self.imageSize)
        }
    }
    
    func testIfItDoesResizeExistingImageByCustomSize() throws {
        try given("A generated image and default size") {
            self.profileImage = UIImage(named: "godfatherWashington")
            self.imageSize    = CGSize(width: InternPersonCell.HEIGHT,
                                       height: InternPersonCell.HEIGHT)
        }
        
        try when("Set to the cell") {
            self.cell.set(icon: self.profileImage, iconSize: self.imageSize)
        }
        
        try then("It should match the given size") {
            XCTAssertEqual(self.cell.imageView?.image?.size, self.imageSize)
        }
    }
    
    func testIfItDoesSetTitleStandardSize() throws {
        try given("A generated standard font size") {
            self.titleSize = 16
        }
        
        try when("Call set with default values") {
            self.cell.set()
        }
        
        try then("It should match the given size") {
            XCTAssertEqual(self.cell.titleLabel.font.pointSize, self.titleSize)
        }
    }
    
    func testIfItDoesSetTitleCustomSize() throws {
        try given("A generated title font size") {
            self.titleSize = 20
        }
        
        try when("Set to the cell") {
            self.cell.set(titleSize: self.titleSize)
        }
        
        try then("It should match the given size") {
            XCTAssertEqual(self.cell.titleLabel.font.pointSize, self.titleSize)
        }
    }
    
    func testIfItDoesSetDescriptionStandardSize() throws {
        try given("A generated standard font size") {
            self.descriptionSize = 14
        }
        
        try when("Call set with default values") {
            self.cell.set()
        }
        
        try then("It should match the given size") {
            XCTAssertEqual(self.cell.descriptionLabel.font.pointSize, self.descriptionSize)
        }
    }
    
    func testIfItDoesSetDescriptionCustomSize() throws {
        try given("A generated description font size") {
            self.descriptionSize = 20
        }
        
        try when("Set to the cell") {
            self.cell.set(descriptionSize: self.descriptionSize)
        }
        
        try then("It should match the given size") {
            XCTAssertEqual(self.cell.descriptionLabel.font.pointSize, self.descriptionSize)
        }
    }

}
