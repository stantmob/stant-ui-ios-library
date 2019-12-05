//
//  GroupSelectionTableViewWithCollapsedSearchBarTests.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 31/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest
import StantUiIosLibrary
import UIKit
@testable import StantUiIosLibraryDemo

class GroupSelectionTableViewWithCollapsedSearchBarTests: XCTestCase {
    
    var mainView: GroupSelectionTableViewWithCollapsedSearchBar!
    var itemsList = [GroupedSelection]()
    
    let viewController  = TestGroupSelectionTableViewWithSearchViewController()
    let searchIcon      = UIImage(named: "search") ?? UIImage()
    let arrowIcon       = UIImage(named: "right") ?? UIImage()
    let itemImage       = UIImage(named: "archiveBox") ?? UIImage()
    let emptyMessage    = "Nothing to show."
    let placeholderText = "Search"
    
    var tableView: GroupSelectionTableView?
    var searchView: DefaultSearchBar?
    var emptyMessageLabel: UILabel?
    
    override func setUp() {
        super.setUp()
    
        itemsList.append(GroupedSelection(sectionTitle: "Group 01", firstDate: createADate("2016/10/08 03:00"), secondDate: createADate("2030/12/11 03:00"),
                                      itemsOfSection: [ItemSelection(itemTitle: "Item 01", itemImage: itemImage, arrowIcon: arrowIcon),
                                                       ItemSelection(itemTitle: "Item 02", itemImage: itemImage, arrowIcon: arrowIcon)]))
        itemsList.append(GroupedSelection(sectionTitle: "Group 02", firstDate: Date(), secondDate: Date(),
                                      itemsOfSection: [ItemSelection(itemTitle: "Item 03", itemImage: itemImage, arrowIcon: arrowIcon)]))
    
        mainView = GroupSelectionTableViewWithCollapsedSearchBar(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        mainView.configureViewWith(items: itemsList,
                                   searchBarIcon: searchIcon,
                                   searchBarPlaceholder: placeholderText,
                                   tableViewDelegate: viewController,
                                   emptyMessage: emptyMessage)
        
        tableView         = mainView.viewWithTag(1) as? GroupSelectionTableView
        searchView        = mainView.viewWithTag(2) as? DefaultSearchBar
        emptyMessageLabel = mainView.viewWithTag(3) as? UILabel
    }
    
    fileprivate func createADate(_ date: String) -> Date {
        let formatter        = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        return formatter.date(from: date) ?? Date()
    }
    
    func testMainViewElements() {
        XCTAssertTrue(tableView?.isDescendant(of: mainView) ?? false)
        XCTAssertTrue(searchView?.isDescendant(of: mainView) ?? false)
        XCTAssertTrue(emptyMessageLabel?.isDescendant(of: mainView) ?? false)
        XCTAssertTrue(emptyMessageLabel?.isHidden ?? false)
    }

    func testCheckTableViewBehaviour() {
        let groupedItems = tableView?.filteredItemsList ?? [GroupedSelection]()
        
        XCTAssertEqual(groupedItems.count, 2)
        self.checkHeaderInformation()
        self.checkCellInformation()
    }
    
    fileprivate func checkHeaderInformation() {
        let firstHeader           = tableView?.tableView(tableView ?? UITableView(), viewForHeaderInSection: 0)
        let headerTitleLabel      = firstHeader?.viewWithTag(1) as? UILabel
        let headerFirstDateLabel  = firstHeader?.viewWithTag(2) as? UILabel
        let headerSecondDateLabel = firstHeader?.viewWithTag(3) as? UILabel
        let blueDarkColor         = UIColor(red: 19/255, green: 84/255, blue: 114/255, alpha: 1)
        let darkGrayColor         = UIColor(red: 133/255, green: 133/255, blue: 150/255, alpha: 1)
        
        XCTAssertEqual(headerTitleLabel?.text, "Group 01")
        XCTAssertEqual(headerTitleLabel?.textColor, blueDarkColor)
        XCTAssertEqual(headerTitleLabel?.font, .systemFont(ofSize: 16, weight: .regular))
        
        XCTAssertEqual(headerFirstDateLabel?.text, "08/10/2016")
        XCTAssertEqual(headerFirstDateLabel?.textColor, darkGrayColor)
        XCTAssertEqual(headerFirstDateLabel?.font, .systemFont(ofSize: 11, weight: .regular))
        
        XCTAssertEqual(headerSecondDateLabel?.text, "11/12/2030")
        XCTAssertEqual(headerSecondDateLabel?.textColor, darkGrayColor)
        XCTAssertEqual(headerSecondDateLabel?.font, .systemFont(ofSize: 11, weight: .regular))
    }
    
    fileprivate func checkCellInformation() {
        let firstCell      = tableView?.tableView(tableView ?? UITableView(), cellForRowAt: IndexPath(row: 0, section: 0))
        let firstCellTitle = firstCell?.viewWithTag(1) as? UILabel
        let blueDarkColor  = UIColor(red: 19/255, green: 84/255, blue: 114/255, alpha: 1)
        
        XCTAssertEqual(firstCellTitle?.text, "Item 01")
        XCTAssertEqual(firstCellTitle?.textColor, blueDarkColor)
        XCTAssertEqual(firstCellTitle?.font, .systemFont(ofSize: 16, weight: .regular))
    }

    func testCheckBehaviourOnClickOnCell() {
        tableView?.tableView(tableView ?? UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))

        XCTAssertTrue(viewController.didClickOnCell)
    }

    func testCheckSearchElements() {
        let searchBar = searchView?.viewWithTag(4) as? UISearchBar
        
        XCTAssertTrue(searchBar?.isDescendant(of: searchView ?? DefaultSearchBar()) ?? false)
        XCTAssertEqual(searchBar?.barTintColor, .white)
        XCTAssertEqual(searchBar?.placeholder, placeholderText)
    }

    func testTableViewAfterSearch() {
        let searchBar = searchView?.viewWithTag(4) as? UISearchBar
        searchView?.searchBar(searchBar ?? UISearchBar(), textDidChange: "02")
        let groupedItems = tableView?.filteredItemsList ?? [GroupedSelection]()
        
        XCTAssertEqual(groupedItems.count, 2)
    }

    func testTypeAnInvalidSearch() {
        let searchBar = searchView?.viewWithTag(4) as? UISearchBar
        searchView?.searchBar(searchBar ?? UISearchBar(), textDidChange: "invalid search")
        let groupedItems = tableView?.filteredItemsList ?? [GroupedSelection]()
        
        XCTAssertEqual(groupedItems.count, 0)
        XCTAssertFalse(emptyMessageLabel?.isHidden ?? true)
        XCTAssertEqual(emptyMessageLabel?.text, emptyMessage)
    }

    func testScrollAndCollapsedMethodIsCalled() {
        let scrollBehaviourMock = TestGroupSelectionTableViewWithSearchScrollViewBehaviourMock()
        simulateScrollOnTableViewWithDirectionTo(firstYPosition: 100, secondYPosition: nil, withDelegate: scrollBehaviourMock)

        XCTAssertTrue(scrollBehaviourMock.didCollapsed)
        XCTAssertFalse(scrollBehaviourMock.didExpanded)
    }

    func testScrollAndExpandMethodIsCalled() {
        let scrollBehaviourMock = TestGroupSelectionTableViewWithSearchScrollViewBehaviourMock()
        simulateScrollOnTableViewWithDirectionTo(firstYPosition: 100, secondYPosition: -200, withDelegate: scrollBehaviourMock)

        XCTAssertTrue(scrollBehaviourMock.didExpanded)
        XCTAssertFalse(scrollBehaviourMock.didCollapsed)
    }

    fileprivate func simulateScrollOnTableViewWithDirectionTo(firstYPosition: CGFloat, secondYPosition: CGFloat?,
                                                              withDelegate delegate: GroupSelectionShowAndHideSearchTableViewDelegate) {
        tableView?.animationDelegate = delegate
        scrollTableViewTo(firstYPosition)

        if let secondYPosition = secondYPosition {
            scrollTableViewTo(secondYPosition)
        }
    }

    fileprivate func scrollTableViewTo(_ y: CGFloat) {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 10, width: 200, height: 30))
        scrollView.contentSize   = CGSize(width: scrollView.frame.width, height: 1000)
        scrollView.contentOffset = CGPoint(x: 0, y: y)
        tableView?.scrollViewDidScroll(scrollView)
    }
    
}

