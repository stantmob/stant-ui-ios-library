//
//  PhotoDetailViewTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 17/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class PhotoDetailViewTests: XCTestCase {
    let viewController = CustomDetailFieldsViewController()
    var photoUrls      = (1...10).map { _ in UIImage.defaultImageUrl }
    
    func testInitialState() {
        viewController.loadViewIfNeeded()
        let photoDetailView = viewController.photoDetailView!
                
        XCTAssertNotNil(photoDetailView)
        XCTAssertNotNil(photoDetailView.titleLabel)
        XCTAssertNotNil(photoDetailView.photoCounter)
        XCTAssertNotNil(photoDetailView.galleryButton)
        XCTAssertNotNil(photoDetailView.photoCollectionView)
    }
    
    //TODO
    func testClickOnPhoto() {
        
    }
}
