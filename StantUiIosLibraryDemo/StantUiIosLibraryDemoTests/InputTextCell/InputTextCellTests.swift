//
//  InputTextCellTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 31/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import UIKit
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class InputTextCellTests: XCTestCase {
    
    private var cell: TextInputTableViewCell!
    private var inputType: String!
    private var inputValue: String!
    
    private var typeLabel: UILabel!
    private var textField: UITextField!
    
    private let darkColor = UIColor(red: 60/255, green: 60/255, blue: 70/255, alpha: 1)
    
    override func setUp() {
        super.setUp()
        
        self.cell = TextInputTableViewCell(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: 200,
                                                        height: 200))
    }
    
    override func tearDown() {
        self.cell       = nil
        self.inputType  = nil
        self.typeLabel  = nil
        self.inputValue = nil
        self.textField  = nil
    }
    
    fileprivate func getCurrentValueForSubviews() {
        typeLabel = cell.viewWithTag(1) as? UILabel
        textField = cell.viewWithTag(2) as? UITextField
    }
    
    func testIfThereIsACellCreated() throws {
        XCTAssertNotNil(self.cell)
    }
    
    func testIfThereIsAInputType() throws {
        try given("A input type text") {
            self.inputType = "Input type"
        }

        try when("Set to the cell") {
            self.cell.set(inputType: self.inputType)
            self.getCurrentValueForSubviews()
        }
        
        try then("It should have a label with type and empty message on text field") {
            XCTAssertEqual(typeLabel.text, self.inputType)
            XCTAssertTrue(textField.text?.isEmpty ?? false)
        }
        
        try then("It should have set the correct attributes to the label") {
            XCTAssertEqual(typeLabel.font, .systemFont(ofSize: 12, weight: .regular))
            XCTAssertEqual(typeLabel.textColor, darkColor)
        }
        
        try then("It should have set the correct attributes to the text field") {
            XCTAssertEqual(textField.font, .systemFont(ofSize: 16, weight: .regular))
            XCTAssertEqual(textField.textColor, darkColor)
        }
    }
    
    func testIfThereIsAInputTypeAndAValueForTextField() throws {
        try given("A input type text and value") {
            self.inputType  = "Input type"
            self.inputValue = "Input value"
        }
        
        try when("Set to the cell") {
            self.cell.set(inputType: self.inputType, inicialInputValue: self.inputValue)
            self.getCurrentValueForSubviews()
        }
        
        try then("It should have a label with type and value on text field") {
            XCTAssertEqual(typeLabel.text, self.inputType)
            XCTAssertEqual(textField.text, self.inputValue)
        }
        
        try then(" It should have a clickable textfield") {
            XCTAssertTrue(textField.isUserInteractionEnabled)
        }
    }
    
    func testIfTextFieldIsNotClickable() throws {
        try given("A input type text and value") {
            self.inputType  = "Input type"
            self.inputValue = "Input value"
        }
        
        try when("Set to the cell") {
            self.cell.set(inputType: self.inputType, inicialInputValue: self.inputValue, editable: false)
            self.getCurrentValueForSubviews()
        }
        
        try then("It should have a label with type and value on text field") {
            XCTAssertEqual(typeLabel.text, self.inputType)
            XCTAssertEqual(textField.text, self.inputValue)
        }
        
        try then("It text field should not be clickable") {
            XCTAssertFalse(textField.isUserInteractionEnabled)
        }
    }

}
