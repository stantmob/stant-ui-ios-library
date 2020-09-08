//
//  PhotoInputViewTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 08/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class PhotoInputViewTests: XCTestCase {
    let viewController      = CustomFieldsViewController()
    var photoUrls           = (1...10).map { _ in "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw" }
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        let photoInputView = viewController.photoInputView!
                
        XCTAssertNotNil(photoInputView)
        XCTAssertNotNil(photoInputView.titleLabel)
        XCTAssertNotNil(photoInputView.photoCounter)
        XCTAssertNotNil(photoInputView.galleryButton)
        XCTAssertNotNil(photoInputView.photoCollectionView)
    }
    
    //TODO
    func testRemovePhoto() {
        
    }
    
    //TODO
    func testClickOnPhoto() {
        
    }
}
