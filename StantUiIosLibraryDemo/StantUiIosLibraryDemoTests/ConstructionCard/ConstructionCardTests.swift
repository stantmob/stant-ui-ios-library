//
//  ConstructionCardTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 21/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ConstructionCardTests: XCTestCase {

    private var tableViewCell: ConstructionCard!
    
    let title: String       = "Title for test"
    let subtitle: String    = "Subtitle"
    let imageUrl: String    = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw"
    let color: UIColor      = UIColor.blue
    var percentage: CGFloat = 78.5

    let cellWidth  = 300
    let cellHeight = 87

    override func setUp() {
        super.setUp()
        tableViewCell = ConstructionCard(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: cellWidth,
                                                       height: cellWidth))
        self.configureCell()
    }
    
    fileprivate func configureCell() {
        let construction = Construction(title: self.title, subtitle: self.subtitle, imageUrl: self.imageUrl, color: self.color, percentage: self.percentage)
        tableViewCell.configureViewFor(construction: construction)
        tableViewCell.layoutSubviews()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testGeneralCellView() {
        self.configureCell()
        
        XCTAssertTrue(tableViewCell.titleLabel?.isDescendant(of: tableViewCell) ?? false)
        XCTAssertTrue(tableViewCell.subtitleLabel?.isDescendant(of: tableViewCell) ?? false)
        XCTAssertTrue(tableViewCell.photoImageView?.isDescendant(of: tableViewCell) ?? false)
        XCTAssertTrue(tableViewCell.percentageBackgroundView?.isDescendant(of: tableViewCell) ?? false)
        XCTAssertTrue(tableViewCell.fullProgressBarView?.isDescendant(of: tableViewCell) ?? false)
        
        XCTAssertTrue(tableViewCell.progressBarView?.isDescendant(of: tableViewCell.fullProgressBarView!) ?? false)
        XCTAssertTrue(tableViewCell.percentageLabel?.isDescendant(of: tableViewCell.percentageBackgroundView!) ?? false)
        
        XCTAssertTrue(isSameImageRepresentation(tableViewCell.photoImageView!.image!, UIImage(data: try NSData(contentsOf: NSURL(string: imageUrl)! as URL) as Data)!))
    }
    
    func isSameImageRepresentation(_ image1: UIImage, _ image2: UIImage) -> Bool {
        let data1: NSData = image1.pngData()! as NSData
        let data2: NSData = image2.pngData()! as NSData

        return data1.isEqual(to: data2 as Data)
    }
    
    func testCheckTitleAndSubtitle() {
        self.configureCell()
        let darkColor = UIColor(red: 60/255, green: 60/255, blue: 70/255, alpha: 1)
        
        XCTAssertEqual(tableViewCell.titleLabel?.text, title)
        XCTAssertEqual(tableViewCell.titleLabel?.textColor, darkColor)
        XCTAssertEqual(tableViewCell.titleLabel?.font, .systemFont(ofSize: 16, weight: .regular))

        XCTAssertEqual(tableViewCell.subtitleLabel?.text, subtitle)
        XCTAssertEqual(tableViewCell.subtitleLabel?.textColor, UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1))
        XCTAssertEqual(tableViewCell.subtitleLabel?.font, .systemFont(ofSize: 12, weight: .regular))
    }
    
    func testCheckProgressBar() {
        self.configureCell()
        let progressBarWidth = getProgressWidthforBar()
        
        XCTAssertEqual(tableViewCell.fullProgressBarView?.backgroundColor, UIColor(red: 245/255, green: 245/255, blue: 247/255, alpha: 1))
        XCTAssertEqual(tableViewCell.progressWidth, progressBarWidth)
        XCTAssertEqual(tableViewCell.progressBarView?.backgroundColor, color)
        XCTAssertEqual(tableViewCell.percentageLabel?.text, "78%")
    }
    
    fileprivate func getProgressWidthforBar() -> CGFloat {
        let fullProgressBarWidth = (tableViewCell.frame.width) - 91.0 - 53.0
        let percentage           = self.percentage / 100
        let progressBarWidth     = fullProgressBarWidth * percentage
        
        return progressBarWidth
    }
    
    func testCheckWhenPassAPercentageBiggerThan100() {
        self.percentage = 230
        self.configureCell()
        let fullProgressBarWidth = (tableViewCell.frame.width) - 91.0 - 53.0
        
        XCTAssertEqual(tableViewCell.progressWidth, fullProgressBarWidth)
        XCTAssertEqual(tableViewCell.percentageLabel?.text, "230%")
    }
    

}
