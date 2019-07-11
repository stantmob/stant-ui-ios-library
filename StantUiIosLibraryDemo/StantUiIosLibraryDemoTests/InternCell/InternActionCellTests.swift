//
//  InternActionCellTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Alexandre on 01/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class CellWithImageTests: XCTestCase {
    
    private var cell: InternActionCell!
    private var textDescription: String!
    private var cellIcon: UIImage!
    private var imageSize: CGSize!
    private var imageColor: UIColor!

    override func setUp() {
        super.setUp()
        
        self.cell = InternActionCell(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: 200,
                                                   height: 200))
    }

    override func tearDown() {
        self.cell            = nil
        self.cellIcon        = nil
        self.imageSize       = nil
        self.imageColor      = nil
        self.textDescription = nil
        
    }
    
    func testIfThereIsACellCreated() throws {
        XCTAssertNotNil(self.cell)
    }
    
    func testIfThereIsADescription() throws {
        try given("A generated description") {
            self.textDescription = "Some random description"
        }
        
        try when("Set to the cell") {
            self.cell.set(description: self.textDescription)
        }
        
        try then("It should match the given description") {
            XCTAssertEqual(self.cell.textLabel?.text, self.textDescription)
        }
    }
    
    func testIfItThereIsAnImage() throws {
        try given("A generated image") {
            self.cellIcon = UIImage(named: "sync")?.reframeImageSize()
        }
        
        try when("Set to the cell") {
            self.cell.set(icon: self.cellIcon)
        }
        
        try then("It should match the given image") {
            XCTAssertEqual(self.cell.imageView?.image?.pngData(), self.cellIcon.pngData())
        }
    }
    
    func testIfItChangesTheColorOfTheImage() throws {
        try given("A generated image and a generated color") {
            self.cellIcon   = UIImage(named: "sync")
            self.imageColor = .yellow
        }
        
        try when("Set to the cell") {
            self.cell.set(icon: self.cellIcon, iconColor: self.imageColor)
        }
        
        try then("It should have changed the color") {
            XCTAssertEqual(self.cell.imageView?.tintColor, self.imageColor)
        }
    }
    
    func testIfItDoesResizeExistingImageByStandardSize() throws {
        try given("A generated image and a given size") {
            self.cellIcon  = UIImage(named: "sync")?.reframeImageSize()
            self.imageSize = CGSize(width: 20, height: 20)
        }
        
        try when("Set to the cell (to get resized inside set method") {
            self.cell.set(icon: self.cellIcon)
        }
        
        try then("It should match the given size") {
            XCTAssertEqual(self.cell.imageView?.image?.size, self.imageSize)
        }
    }
    
    func testIfItDoesResizeExistingImageByCustomSize() throws {
        try given("A generated image and a given size") {
            self.cellIcon  = UIImage(named: "sync")
            self.imageSize = CGSize(width: InternActionCell.HEIGHT,
                                    height: InternActionCell.HEIGHT)
        }
        
        try when("Set to the cell (to get resized inside set method") {
            self.cell.set(icon: self.cellIcon, iconSize: self.imageSize)
        }
        
        try then("It should match the given size") {
            XCTAssertEqual(self.cell.imageView?.image?.size, self.imageSize)
        }
    }

}
