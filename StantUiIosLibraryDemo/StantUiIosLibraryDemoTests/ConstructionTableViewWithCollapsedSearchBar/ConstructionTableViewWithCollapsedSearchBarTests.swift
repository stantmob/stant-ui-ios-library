//
//  ConstructionTableViewWithCollapsedSearchBarTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 01/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
@testable import StantUiIosLibraryDemo

class ConstructionTableViewWithCollapsedSearchBarTests: XCTestCase {
    
    var mainView: ConstructionTableViewWithCollapsedSearchBar?
    var constructionList = [Construction]()
    
    let viewController  = TestTableViewWithSearchViewController()
    let searchIcon      = UIImage(named: "search") ?? UIImage()
    let emptyMessage    = "Nothing to show."
    let placeholderText = "Search"
    
    override func setUp() {
        super.setUp()
        
        for i in 1...20 {
            constructionList.append(Construction(title: "Title \(i)",
                                                 subtitle: "Subtitle",
                                                 imageUrl: "",
                                                 color: UIColor.yellow,
                                                 percentage: CGFloat(i*2)))
        }
        
        mainView = ConstructionTableViewWithCollapsedSearchBar(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        guard let mainView = mainView else { return }
        mainView.configureViewWith(constructionList: constructionList,
                                   searchBarIcon: searchIcon,
                                   searchBarPlaceholder: placeholderText,
                                   tableViewDelegate: viewController,
                                   emptyMessage: emptyMessage)
    }
    
    func testMainViewElements() {
        guard let mainView = mainView else { return }
        
        XCTAssertTrue(mainView.tableView?.isDescendant(of: mainView) ?? false)
        XCTAssertTrue(mainView.searchView?.isDescendant(of: mainView) ?? false)
        XCTAssertTrue(mainView.emptyMessageLabel?.isDescendant(of: mainView) ?? false)
        XCTAssertTrue(mainView.emptyMessageLabel?.isHidden ?? false)
    }
    
    func testCheckTableViewBehaviour() {
        guard let mainView = mainView else { return }
        
        XCTAssertEqual(mainView.tableView?.filteredConstructionSiteList.count, 20)
        XCTAssertEqual(mainView.tableView?.filteredConstructionSiteList.first?.title, "Title 1")
    }
    
    func testCheckBehaviourOnClickOnCell() {
        guard let mainView = mainView else { return }
        mainView.tableView?.tableView(mainView.tableView ?? UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(viewController.didClickOnCell)
    }
    
    func testCheckSearchElements() {
        guard let mainView = mainView else { return }
        
        XCTAssertTrue(mainView.searchView?.searchBar?.isDescendant(of: mainView.searchView ?? UIView()) ?? false)
        XCTAssertEqual(mainView.searchView?.searchBar?.barTintColor, UIColor.white)
        XCTAssertEqual(mainView.searchView?.searchBar?.placeholder, placeholderText)
    }
    
    func testTableViewAfterSearch() {
        guard let mainView = mainView else { return }
        mainView.searchView?.searchBar(mainView.searchView?.searchBar ?? UISearchBar(),
                                       textDidChange: "2")
        
        XCTAssertEqual(mainView.tableView?.filteredConstructionSiteList.count, 3)
        XCTAssertEqual(mainView.tableView?.filteredConstructionSiteList.first?.title, "Title 2")
        self.checkEraseSearch()
    }
    
    fileprivate func checkEraseSearch() {
        guard let mainView = mainView else { return }
        mainView.searchView?.searchBar(mainView.searchView?.searchBar ?? UISearchBar(),
                                       textDidChange: "")
        
        XCTAssertEqual(mainView.tableView?.filteredConstructionSiteList.count, 20)
        XCTAssertEqual(mainView.tableView?.filteredConstructionSiteList.first?.title, "Title 1")
        XCTAssertTrue(mainView.emptyMessageLabel?.isHidden ?? false)
    }
    
    func testTypeAnInvalidSearch() {
        guard let mainView = mainView else { return }
        mainView.searchView?.searchBar(mainView.searchView?.searchBar ?? UISearchBar(),
                                       textDidChange: "2837383")
        
        XCTAssertEqual(mainView.tableView?.filteredConstructionSiteList.count, 0)
        XCTAssertFalse(mainView.emptyMessageLabel?.isHidden ?? true)
        XCTAssertEqual(mainView.emptyMessageLabel?.text, emptyMessage)
        
        self.checkEraseSearch()
    }
    
    func testScrollAndCollapsedMethodIsCalled() {
        let scrollBehaviourMock = TestTableViewWithSearchScrollViewBehaviourMock()
        simulateScrollOnTableViewWithDirectionTo(firstYPosition: 100, secondYPosition: nil, withDelegate: scrollBehaviourMock)
        
        XCTAssertTrue(scrollBehaviourMock.didCollapsed)
        XCTAssertFalse(scrollBehaviourMock.didExpanded)
    }
    
    func testScrollAndExpandMethodIsCalled() {
        let scrollBehaviourMock = TestTableViewWithSearchScrollViewBehaviourMock()
        simulateScrollOnTableViewWithDirectionTo(firstYPosition: 100, secondYPosition: -200, withDelegate: scrollBehaviourMock)
        
        XCTAssertTrue(scrollBehaviourMock.didExpanded)
        XCTAssertFalse(scrollBehaviourMock.didCollapsed)
    }
    
    fileprivate func simulateScrollOnTableViewWithDirectionTo(firstYPosition: CGFloat, secondYPosition: CGFloat?,
                                                              withDelegate delegate: ShowAndHideSearchTableViewDelegate) {
        guard let mainView = mainView else { return }
        mainView.tableView?.animationDelegate = delegate
        scrollTableViewTo(firstYPosition)
        
        if let secondYPosition = secondYPosition {
            scrollTableViewTo(secondYPosition)
        }
    }
    
    fileprivate func scrollTableViewTo(_ y: CGFloat) {
        guard let mainView = mainView else { return }
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 10, width: 200, height: 30))
        scrollView.contentSize   = CGSize(width: scrollView.frame.width, height: 1000)
        scrollView.contentOffset = CGPoint(x: 0, y: y)
        mainView.tableView?.scrollViewDidScroll(scrollView)
    }
    
}
