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
    private var mailImage: UIImage!
    private var phoneImage: UIImage!
    private var mailButton: UIButton!
    private var phoneButton: UIButton!
    
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
        self.mailImage       = nil
        self.phoneImage      = nil
        self.titleLabel      = nil
        self.mailButton      = nil
        self.phoneButton     = nil
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
            let imageView = self.cell.viewWithTag(1) as? RoundedImageView
            XCTAssertEqual(imageView?.frame.size, self.imageSize)
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
            let imageView = self.cell.viewWithTag(1) as? RoundedImageView
            XCTAssertEqual(imageView?.frame.size, self.imageSize)
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
    
    func testIfItDoesSetMailAndCallImages() throws {
        try given("Generated mail and phone images") {
            self.mailImage  = UIImage(named: "mail")
            self.phoneImage = UIImage(named: "call")
        }
        
        try when("Set to the cell") {
            self.cell.set(mailImage: self.mailImage, callImage: self.phoneImage)
        }
        
        try then("It should contain the given images as subviews") {
            let imagesHashValues = self.cell.subviews.map { subview -> Int? in
                if subview is UIImageView {
                    let castedView = subview as? UIImageView
                    return castedView?.image.hashValue
                }
                return nil
            }
            
            XCTAssert(imagesHashValues.contains(self.mailImage.hashValue))
            XCTAssert(imagesHashValues.contains(self.phoneImage.hashValue))
        }
        
        try then("It should not contain any buttons set") {
            let amountOfButtons = self.cell.subviews.filter { $0 is UIButton }.count
            
            XCTAssert(amountOfButtons == 0)
        }
    }
    
    func testIfItDoesSetMailButton() throws {
        try given("A generated button and the needed setup") {
            self.mailImage  = UIImage(named: "mail")
            self.phoneImage = UIImage(named: "call")
            self.mailButton = UIButton()
        }
        
        try when("Set to the cell") {
            self.cell.set(mailButton: self.mailButton,
                          mailImage: self.mailImage,
                          callImage: self.phoneImage)
        }
        
        try then("It should contain the given button") {
            let buttons = self.cell.subviews.map { subview -> UIButton? in
                if subview is UIButton { return subview as? UIButton }
                return nil
            }
            
            XCTAssert(buttons.contains(self.mailButton))
        }
    }

    func testIfItDoesSetPhoneButton() throws {
        try given("A generated button and the needed setup") {
            self.mailImage   = UIImage(named: "mail")
            self.phoneImage  = UIImage(named: "call")
            self.phoneButton = UIButton()
        }
        
        try when("Set to the cell") {
            self.cell.set(mailImage: self.mailImage,
                          callButton: self.phoneButton,
                          callImage: self.phoneImage)
        }
        
        try then("It should contain the given button") {
            let buttons = self.cell.subviews.map { subview -> UIButton? in
                if subview is UIButton { return subview as? UIButton }
                return nil
            }
            
            XCTAssert(buttons.contains(self.phoneButton))
        }
    }

    func testIfItDoesSetButtonsAndImagesForMailAndPhone() throws {
        try given("Generated buttons and the needed setup") {
            self.mailImage   = UIImage(named: "mail")
            self.phoneImage  = UIImage(named: "call")
            self.phoneButton = UIButton()
            self.mailButton  = UIButton()
        }
        
        try when("Set to the cell") {
            self.cell.set(mailButton: self.mailButton,
                          mailImage: self.mailImage,
                          callButton: self.phoneButton,
                          callImage: self.phoneImage)
        }
        
        try then("It should contain the given button") {
            let buttons = self.cell.subviews.map { subview -> UIButton? in
                if subview is UIButton { return subview as? UIButton }
                return nil
            }
            
            XCTAssert(buttons.contains(self.phoneButton) && buttons.contains(self.mailButton))
        }
    }
}
