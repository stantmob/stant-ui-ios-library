//
//  SecondHeaderTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 02/08/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class SecondHeaderTests: XCTestCase {
    
    private var secondHeaderView: SecondHeaderView!
    private var mockViewController: SecondHeaderViewControllerMock!
    
    private var title: String!
    private var subtitle: String!
    private var titleButton: SecondHeaderButton!
    private var leftButton: SecondHeaderButton!
    private var rightButton: SecondHeaderButton!

    
    private let darkColor     = UIColor(red: 60/255, green: 60/255, blue: 70/255, alpha: 1)
    private let darkGrayColor = UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1)
    
    override func setUp() {
        self.secondHeaderView   = SecondHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: SecondHeaderView.headerHeight))
        self.mockViewController = SecondHeaderViewControllerMock()
    }
    
    override func tearDown() {
        self.secondHeaderView = nil
        self.titleButton      = nil
        self.leftButton       = nil
        self.rightButton      = nil
    }
    
    func testIfThereIsAImageViewCreated() throws {
        XCTAssertNotNil(self.secondHeaderView)
    }

    func testIfItShowsOnlyTitle() throws {
        try given("Only a generated title") {
            self.title = "Title"
        }

        try when("Set the title") {
            self.secondHeaderView.configure(title: self.title)
        }

        try then("It should match the given title") {
            let titleButton = secondHeaderView.viewWithTag(1) as? UIButton
            XCTAssertEqual(titleButton?.titleLabel?.text, self.title)
            XCTAssertEqual(titleButton?.titleLabel?.font, .systemFont(ofSize: 18, weight: .bold))
            XCTAssertEqual(titleButton?.titleLabel?.textColor, darkColor)
            XCTAssertFalse(titleButton?.isUserInteractionEnabled ?? true)
        }

        try then("It should have only title button as subviews") {
            XCTAssertEqual(secondHeaderView.subviews.count, 1)
        }
    }
    
    func testIfItShowsTitleAndSubtitle() throws {
        try given("A generated title and subtitle") {
            self.title    = "Title"
            self.subtitle = "Subtitle"
        }
        
        try when("Set the title and subtitle") {
            self.secondHeaderView.configure(title: self.title, subtitle: self.subtitle)
        }
        
        try then("It should match the given subtitle") {
            let subtitleLabel = secondHeaderView.viewWithTag(2) as? UILabel
            XCTAssertEqual(subtitleLabel?.text, self.subtitle)
            XCTAssertEqual(subtitleLabel?.font, .systemFont(ofSize: 12, weight: .regular))
            XCTAssertEqual(subtitleLabel?.textColor, darkGrayColor)
        }
        
        try then("It should have title and subtitle as subviews") {
            XCTAssertEqual(secondHeaderView.subviews.count, 2)
        }
    }
    
    func testIfTitleHasAnAction() throws {
        try given("Only a generated title with action") {
            self.title       = "Title"
            self.titleButton = SecondHeaderButton(action: #selector(mockViewController.clickOnTitle),
                                                        target: mockViewController,
                                                        icon: UIImage())
        }
        
        try when("Set the title and button") {
            self.secondHeaderView.configure(title: self.title, titleButton: self.titleButton)
        }
        
        try then("It title button should be clickable") {
            let titleButton = secondHeaderView.viewWithTag(1) as? UIButton
            
            XCTAssertTrue(titleButton?.isUserInteractionEnabled ?? false)
        }
        
        try then("It title button should call correct action when clicked") {
            let titleButton = secondHeaderView.viewWithTag(1) as? UIButton
            titleButton?.sendActions(for: .touchUpInside)
            
            XCTAssertTrue(mockViewController.didClickOnTitle)
        }
    }
    
    func testIfItShowsTitleAndOneButton() throws {
        try given("A generated title and one button") {
            self.title      = "Title"
            self.leftButton = SecondHeaderButton(action: #selector(mockViewController.clickOnLeftButton),
                                                 target: mockViewController,
                                                 icon: UIImage())
        }

        try when("Set the title and one button") {
            self.secondHeaderView.configure(title: self.title, leftButton: self.leftButton)
        }

        try then("It left button should call correct action when clicked") {
            let leftButton = secondHeaderView.viewWithTag(3) as? UIButton
            leftButton?.sendActions(for: .touchUpInside)
            
            XCTAssertTrue(mockViewController.didClickOnLeftButton)
        }

        try then("It should have title and one button as subviews") {
            XCTAssertEqual(secondHeaderView.subviews.count, 2)
        }
    }
    
    func testIfItShowsTitleAndTwoButtons() throws {
        try given("A generated title and two buttons") {
            self.title       = "Title"
            self.leftButton  = SecondHeaderButton(action: #selector(mockViewController.clickOnLeftButton),
                                                  target: mockViewController,
                                                  icon: UIImage())
            self.rightButton = SecondHeaderButton(action: #selector(mockViewController.clickOnRightButton),
                                                  target: mockViewController,
                                                  icon: UIImage())
        }
        
        try when("Set the title and two buttons") {
            self.secondHeaderView.configure(title: self.title, leftButton: self.leftButton, rightButton: self.rightButton)
        }
        
        try then("It should have title and two buttons as subviews") {
            XCTAssertEqual(secondHeaderView.subviews.count, 3)
        }
        
        try then("It left button should call correct action when clicked") {
            let leftButton = secondHeaderView.viewWithTag(3) as? UIButton
            leftButton?.sendActions(for: .touchUpInside)
            
            XCTAssertTrue(mockViewController.didClickOnLeftButton)
        }
        
        try then("It right button should call correct action when clicked") {
            let rightButton = secondHeaderView.viewWithTag(4) as? UIButton
            rightButton?.sendActions(for: .touchUpInside)
            
            XCTAssertTrue(mockViewController.didClickOnRightButton)
        }
    }
}
