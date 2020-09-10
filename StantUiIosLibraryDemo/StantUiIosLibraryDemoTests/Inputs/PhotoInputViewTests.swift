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
    var photoUrls           = (1...10).map { _ in UIImage.defaultImageUrl }
    
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
