//
//  MultiLineTextViewTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 08/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class MultiLineTextViewTests: XCTestCase {
    let viewController = CustomFieldsViewController()
    let longText       = String((0..<20).map{_ in "x"})
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        let textView = viewController.textView!
                
        XCTAssertNotNil(textView)
        XCTAssertEqual(textView.textView?.text, "")
        XCTAssertEqual(textView.characterCounter?.text, "0/20")
    }
    
    func testAddText() {
        viewController.loadViewIfNeeded()
        let textView = viewController.textView!
        
        textView.textView?.text = longText
        textView.textView(textView.textView ?? UITextView(),
                          shouldChangeTextIn: NSRange(longText) ?? NSRange(),
                          replacementText:    "")
        
        XCTAssertEqual(textView.textView?.text, longText)
        XCTAssertEqual(textView.characterCounter?.text, "\(longText.count)/20")
    }
}
