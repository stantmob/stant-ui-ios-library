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

    private var progressBarView: ProgressBarWithToolTipView!
    
    var percentage: CGFloat = 0
    
    let viewWidth: CGFloat  = 300
    let viewHeight: CGFloat = 87
    
    override func setUp() {
        super.setUp()
        progressBarView = ProgressBarWithToolTipView(frame: CGRect(x: 0, y: 50, width: viewWidth, height: viewHeight))
        progressBarView.configure(percentage: 0, message: "Executed")
        
        self.configureProgressView()
    }
    
    fileprivate func configureProgressView() {
        progressBarView.configure(percentage: 0, message: "Executed")
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
    }
    
    func testInitialState() {
        self.configureProgressView()
        
        XCTAssertEqual(progressBarView.doneBar?.frame.width, 0)
        XCTAssertEqual(progressBarView.remainingBar?.frame.width, viewWidth)
    }
    
}
