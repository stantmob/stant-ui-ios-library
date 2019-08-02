//
//  RoundedImageViewTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 01/08/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class RoundedImageViewTests: XCTestCase {
    
    private var roundedImageView: RoundedImageView!
    private var imageSize: CGSize!
    private var image: UIImage!
    
    private var borderWidth = CGFloat()
    
    override func setUp() {
        self.roundedImageView = RoundedImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    }
    
    override func tearDown() {
        self.roundedImageView = nil
        self.imageSize        = nil
        self.image            = nil
    }
    
    func testIfThereIsAImageViewCreated() throws {
        XCTAssertNotNil(self.roundedImageView)
    }
    
    func testIfItShowsAImageWithCorrectSize() throws {
        try given("A generated image and default size") {
            self.imageSize   = CGSize(width: 35, height: 35)
            self.image       = UIImage(named: "godfatherWashington")
            self.borderWidth = 5
        }
        
        try when("Set to the image view") {
            self.roundedImageView.set(icon: self.image,
                                      iconDiameter: self.imageSize.height,
                                      iconBorder: self.borderWidth)
        }
        
        try then("It should match the given size") {
            let imageView = self.roundedImageView.subviews.first
            XCTAssertEqual(imageView?.frame.size, self.imageSize)
        }
        
        try then("It inside image should match the proportional size") {
            let image = (self.roundedImageView.subviews.first ?? UIView()).subviews.first
            XCTAssertEqual(image?.frame.size.height,
                           self.imageSize.height - (2 * self.borderWidth))
            XCTAssertEqual(image?.frame.size.width,
                           self.imageSize.width - (2 * self.borderWidth))
        }
    }
    
    func testIfItShowsTheCorrectImage() throws {
        try given("A generated image") {
            self.imageSize   = CGSize(width: 35, height: 35)
            self.image       = UIImage(named: "godfatherWashington")
            self.borderWidth = 5
        }
        
        try when("Set to the image view") {
            self.roundedImageView.set(icon: self.image,
                                      iconDiameter: self.imageSize.height,
                                      iconBorder: self.borderWidth)
        }
        
        try then("It image should be equal that given one") {
            let imageView  = (self.roundedImageView.subviews.first ?? UIView()).subviews.first as? UIImageView
            
            self.checkEqualityBetween(givenIcon: self.image, generatedIcon: imageView?.image ?? UIImage())
        }
        
        
    }
    
    fileprivate func checkEqualityBetween(givenIcon: UIImage, generatedIcon: UIImage) {
        let data1 = givenIcon.pngData() as? NSData
        let data2 = generatedIcon.pngData() as? NSData
        
        XCTAssertEqual(data1, data2)
    }
    
}
