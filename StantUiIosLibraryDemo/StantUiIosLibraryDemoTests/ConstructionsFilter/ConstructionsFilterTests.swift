//
//  ConstructionsFilterTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 24/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ConstructionsFilterTests: XCTestCase {
    
    private var testVC: TestFilterUiViewController?
    
    var fixedFilterTitle     =  ""
    var filterIconImageView  = UIImageView()
    var fixedUiView          = UIView()
    var filterQuantityUiView = UIView()
    var filterQuantityLabel  = UILabel()
    
    private let filtersTitle = "Filters"
    
    override func setUp() {
        super.setUp()
        
        testVC = TestFilterUiViewController()

        guard let testVC = testVC else { return }
        testVC.filters = ConstructionsFilter.init(frame: CGRect(x: 0, y: 0, width: 300, height: ConstructionsFilter.headerHeight))
    
        let filterIcon = UIImage(named: "filter")
        guard let filter = testVC.filters, let icon = filterIcon else { return }
        
        let buttons = [FilterButton(title: "Button 01", action: #selector(testVC.actionButton01), target: testVC),
                       FilterButton(title: "Button 02", action: #selector(testVC.actionButton02), target: testVC),
                       FilterButton(title: "Button 03", action: #selector(testVC.actionButton03), target: testVC)]
        
        filter.configureViewWith(fixedTitle: filtersTitle, icon: icon, buttons: buttons)
        
        self.updateViews()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFixedViewInformation() {
        XCTAssertEqual(fixedFilterTitle, filtersTitle)
        XCTAssertTrue(filterIconImageView.isDescendant(of: fixedUiView))
        XCTAssertFalse(filterQuantityUiView.isDescendant(of: fixedUiView))
        XCTAssertFalse(filterQuantityLabel.isDescendant(of: fixedUiView))
    }
   
    func testCollectionViewInformation() {
        guard let testVC = testVC else { return }
        let collectionView = testVC.filters?.collectionView ?? FiltersCollectionView()
    
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0) , 3)
        
        self.clickToSelectCellOf(collectionView: collectionView, position: 0)
        XCTAssertTrue(testVC.firstButtonCalled)
        XCTAssertFalse(testVC.secondButtonCalled)
        XCTAssertFalse(testVC.thirdButtonCalled)
        XCTAssertEqual(filterQuantityLabel.text, "1")
        
        self.clickToSelectCellOf(collectionView: collectionView, position: 1)
        XCTAssertTrue(testVC.firstButtonCalled)
        XCTAssertTrue(testVC.secondButtonCalled)
        XCTAssertFalse(testVC.thirdButtonCalled)
        XCTAssertEqual(filterQuantityLabel.text, "2")
    }
    
    func testSelectAndDeselectButtons() {
        guard let testVC = testVC else { return }
        let collectionView = testVC.filters?.collectionView ?? FiltersCollectionView()
    
        self.clickToSelectAndDeselectCells(collectionView: collectionView, positions: [0, 1])
        XCTAssertTrue(filterIconImageView.isDescendant(of: fixedUiView))
        XCTAssertFalse(filterQuantityUiView.isDescendant(of: fixedUiView))
        XCTAssertFalse(filterQuantityLabel.isDescendant(of: fixedUiView))
    }

    fileprivate func clickToSelectCellOf(collectionView: FiltersCollectionView, position: Int) {
        let collectionViewCell = collectionView.collectionView(collectionView, cellForItemAt: IndexPath(item: position, section: 0)) as! FilterButtonCollectionViewCell
        
        collectionViewCell.mainButton?.sendActions(for: .touchUpInside)
        self.updateViews()
        
        XCTAssertEqual(collectionViewCell.mainButton?.backgroundColor, UIColor(red: 255/255, green: 64/255, blue: 37/255, alpha: 1))
        XCTAssertEqual(collectionViewCell.mainButton?.titleColor(for: .normal), UIColor.white)
        XCTAssertFalse(filterIconImageView.isDescendant(of: fixedUiView))
        XCTAssertTrue(filterQuantityUiView.isDescendant(of: fixedUiView))
        XCTAssertTrue(filterQuantityLabel.isDescendant(of: fixedUiView))
    }

    fileprivate func clickToSelectAndDeselectCells(collectionView: FiltersCollectionView, positions: [Int]) {
        let firstCollectionViewCell = collectionView.collectionView(collectionView, cellForItemAt: IndexPath(item: positions[0], section: 0)) as! FilterButtonCollectionViewCell
        let secondCollectionViewCell = collectionView.collectionView(collectionView, cellForItemAt: IndexPath(item: positions[1], section: 0)) as! FilterButtonCollectionViewCell
        
        firstCollectionViewCell.mainButton?.sendActions(for: .touchUpInside)
        secondCollectionViewCell.mainButton?.sendActions(for: .touchUpInside)
        firstCollectionViewCell.mainButton?.sendActions(for: .touchUpInside)
        secondCollectionViewCell.mainButton?.sendActions(for: .touchUpInside)

        self.updateViews()
        XCTAssertEqual(firstCollectionViewCell.mainButton?.backgroundColor, UIColor(red: 245/255, green: 245/255, blue: 247/255, alpha: 1))
        XCTAssertEqual(firstCollectionViewCell.mainButton?.titleColor(for: .normal), UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1))
        XCTAssertEqual(secondCollectionViewCell.mainButton?.backgroundColor, UIColor(red: 245/255, green: 245/255, blue: 247/255, alpha: 1))
        XCTAssertEqual(secondCollectionViewCell.mainButton?.titleColor(for: .normal), UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1))
    }
    
    fileprivate func updateViews() {
        guard let testVC = testVC else { return }
        fixedFilterTitle     = testVC.filters?.filterTitleLabel?.text ?? ""
        filterIconImageView  = testVC.filters?.filterIconImageView ?? UIImageView()
        fixedUiView          = testVC.filters?.fixedFilterUiView ?? UIView()
        filterQuantityUiView = testVC.filters?.filterQuantityUiView ?? UIView()
        filterQuantityLabel  = testVC.filters?.filterQuantityLabel ?? UILabel()
    }
    
}

class TestFilterUiViewController: UIViewController {
    public var firstButtonCalled  = false
    public var secondButtonCalled = false
    public var thirdButtonCalled  = false
    
    public var filters: ConstructionsFilter?
    
    @objc func actionButton01() {
        firstButtonCalled = true
    }
    
    @objc func actionButton02() {
        secondButtonCalled = true
    }
    
    @objc func actionButton03() {
        thirdButtonCalled = true
    }
    
}
