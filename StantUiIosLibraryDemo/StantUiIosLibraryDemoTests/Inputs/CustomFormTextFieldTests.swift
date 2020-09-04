//
//  CustomFormTextFieldTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 04/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class CustomFormTextFieldTests: XCTestCase {
    let viewController = CustomFieldsViewController()
    let newText        = "New Text"
    
    func testTextFields() {
        viewController.loadViewIfNeeded()
        
        let textField1 = viewController.defaultTextField ?? CustomFormTextField()
        let textField2 = viewController.numericTextField ?? CustomFormTextField()
                
        XCTAssertNotNil(textField1)
        XCTAssertNotNil(textField2)
        
        XCTAssertEqual(textField1.keyboardType, UIKeyboardType.default)
        XCTAssertEqual(textField2.keyboardType, UIKeyboardType.numberPad)
        
        XCTAssertEqual(textField1.placeholderLabel?.isHidden, true)
        XCTAssertEqual(textField2.placeholderLabel?.isHidden, true)
        
        XCTAssertNil(textField1.requiredFieldLabel)
        XCTAssertNotNil(textField2.requiredFieldLabel)
    }
    
    func testTextInsertion() {
        viewController.loadViewIfNeeded()
        
        let textField1 = viewController.defaultTextField ?? CustomFormTextField()
        let textField2 = viewController.numericTextField ?? CustomFormTextField()
        
        textField1.setText(text: newText)
        textField1.endEditing(true)
        
        XCTAssertEqual(textField1.placeholderLabel?.isHidden, false)
        XCTAssertEqual(textField2.placeholderLabel?.isHidden, true)
    }
    
    func testConfirmTextChange() {
        viewController.loadViewIfNeeded()
               
        let textField1 = viewController.defaultTextField ?? CustomFormTextField()
        
        textField1.becomeFirstResponder()
        textField1.text = newText
        textField1.confirmEditing()
        
        XCTAssertEqual(textField1.text, newText)
    }
    
    func testCancelTextChange() {
        viewController.loadViewIfNeeded()
               
        let textField1 = viewController.defaultTextField ?? CustomFormTextField()
        
        textField1.becomeFirstResponder()
        textField1.text = newText
        textField1.cancelEditing()
        
        XCTAssertEqual(textField1.text, "")
    }
}
