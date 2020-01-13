//
//  ProgressBarWithToolTipTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Leandro Martins on 03/01/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ProgressBarWithToolTipTests: XCTestCase {

    private var progressBarView: ProgressBarWithToolTip!
    
    var percentage: Float = 0
    
    let viewWidth: CGFloat         = 300
    let viewHeight: CGFloat        = 87
    let progressBarHeight: CGFloat = 6
    let percentageList: [Float]    = [0, 0.155, 0.5, 0.84, 1]
    
    override func setUp() {
        super.setUp()
        progressBarView = ProgressBarWithToolTip(frame: CGRect(x: 0, y: 50, width: viewWidth, height: viewHeight))
        self.configureProgressView()
    }
    
    fileprivate func configureProgressView() {
        progressBarView.configure(percentage: percentage, message: "Executed")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGeneralView() {
        self.configureProgressView()
        
        XCTAssertTrue(progressBarView.progressToolTip?.isDescendant(of: progressBarView) ?? false)
        XCTAssertTrue(progressBarView.progressBar?.isDescendant(of: progressBarView) ?? false)
        XCTAssertTrue(progressBarView.doneBar?.isDescendant(of: progressBarView!.progressBar!) ?? false)
        XCTAssertTrue(progressBarView.remainingBar?.isDescendant(of: progressBarView!.progressBar!) ?? false)
        XCTAssertEqual(progressBarView.frame.width, viewWidth)
        XCTAssertEqual(progressBarView.frame.height, viewHeight)
    }
    
    func testInitialState() {
        self.configureProgressView()
        
        XCTAssertEqual(progressBarView.frame.width, viewWidth)
        XCTAssertTrue(progressBarView.progressToolTip?.isHidden ?? false)
    }
    
    func testProgressBarDimensions() {
        var expectedWidth:  CGFloat
        var doneWidth:      CGFloat
        var remainingWidth: CGFloat
        
        XCTAssertEqual(progressBarView.progressBar?.frame.height, progressBarHeight)
        
        for percentage in percentageList {
            self.percentage = percentage
            self.configureProgressView()
            
            expectedWidth  = CGFloat(self.percentage) * viewWidth
            doneWidth      = CGFloat((progressBarView.doneBar?.frame.size.width)!)
            remainingWidth = CGFloat((progressBarView.remainingBar?.frame.size.width)!)
            
            XCTAssertEqual(ceil(expectedWidth), ceil(doneWidth))
            XCTAssertEqual(doneWidth + remainingWidth + (expectedWidth == 300 ? 0 : 1), viewWidth) //plus 1 for the spacing between bars
        }
    }
    
    func testProgressToolTipPosition() {
        var expectedPosition: CGFloat
        var actualPosition:   CGFloat
        
        for percentage in percentageList {
            self.percentage = percentage
            self.configureProgressView()
            
            progressBarView.showProgress()
            XCTAssertFalse(progressBarView.progressToolTip?.isHidden ?? true)
            
            expectedPosition = CGFloat(percentage) * viewWidth - 5
            actualPosition   = progressBarView.progressToolTip?.indicatorView?.frame.minX ?? 0
            
            XCTAssertEqual(ceil(expectedPosition), ceil(actualPosition))
            
        }
    }
    
    func testShowProgressLabel() {
        for percentage in percentageList {
            self.percentage = percentage
            self.configureProgressView()
            progressBarView.showProgress()
            
            XCTAssertEqual(progressBarView.progressToolTip?.progressLabel?.text, "\((self.percentage * 100).cleanValue)% Executed")
        }
    }
}

extension Float {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) <= 0.00001 ? String(format: "%.0f", self) : String(format: "%.1f", self)
    }
}
