//
//  GroupSelectionTableViewWithCollapsedSearchBarMocks.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 31/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class TestGroupSelectionTableViewWithSearchViewController: UIViewController, GroupSelectionTableViewDidSelectDelegate {
    var didClickOnCell = false
    
    func didClickOnTableViewCellWith(indexPath: IndexPath) {
        didClickOnCell = true
    }
}

class TestGroupSelectionTableViewWithSearchScrollViewBehaviourMock: GroupSelectionShowAndHideSearchTableViewDelegate {
    var didCollapsed = false
    var didExpanded  = false
    
    func collapseSearchView() {
        didCollapsed = true
        didExpanded  = false
    }
    
    func expandSearchView() {
        didExpanded  = true
        didCollapsed = false
    }
}
