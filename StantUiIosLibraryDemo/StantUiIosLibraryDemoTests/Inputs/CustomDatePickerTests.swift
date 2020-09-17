//
//  CustomDatePickerTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 04/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class CustomDatePickerTests: XCTestCase {
    let viewController = CustomFieldsViewController()
    let dateString     = Date().toString()
    
    func testTextFields() {
        viewController.loadViewIfNeeded()
        
        let datePicker1 = viewController.beginDatePicker ?? CustomDatePicker()
        let datePicker2 = viewController.endDatePicker ?? CustomDatePicker()
                
        XCTAssertNotNil(datePicker1)
        XCTAssertNotNil(datePicker2)
        
        XCTAssertEqual(datePicker1.keyboardType, UIKeyboardType.numberPad)
        XCTAssertEqual(datePicker2.keyboardType, UIKeyboardType.numberPad)
        
        XCTAssertEqual(datePicker1.placeholderLabel?.isHidden, true)
        XCTAssertEqual(datePicker2.placeholderLabel?.isHidden, false)
        
        XCTAssertNil(datePicker1.requiredFieldLabel)
        XCTAssertNotNil(datePicker2.requiredFieldLabel)
    }
    
    func testDateInsertion() {
        viewController.loadViewIfNeeded()
        
        let datePicker1 = viewController.beginDatePicker ?? CustomDatePicker()
        let datePicker2 = viewController.endDatePicker ?? CustomDatePicker()
        
        datePicker2.setText(text: dateString)
        datePicker2.endEditing(true)
        
        XCTAssertEqual(datePicker1.placeholderLabel?.isHidden, true)
        XCTAssertEqual(datePicker1.text, "")
        XCTAssertEqual(datePicker2.placeholderLabel?.isHidden, false)
        XCTAssertEqual(datePicker2.text, dateString)
    }
    
    func testConfirmDateChange() {
        viewController.loadViewIfNeeded()
               
        let datePicker1 = viewController.beginDatePicker ?? CustomDatePicker()
        
        datePicker1.becomeFirstResponder()
        datePicker1.text = dateString
        datePicker1.confirmEditing()
        
        XCTAssertEqual(datePicker1.text, dateString)
    }
    
    func testCancelDateChange() {
        viewController.loadViewIfNeeded()
               
        let datePicker1 = viewController.beginDatePicker ?? CustomDatePicker()
        
        datePicker1.becomeFirstResponder()
        datePicker1.text = dateString
        datePicker1.cancelEditing()
        
        XCTAssertEqual(datePicker1.text, "")
    }
}
