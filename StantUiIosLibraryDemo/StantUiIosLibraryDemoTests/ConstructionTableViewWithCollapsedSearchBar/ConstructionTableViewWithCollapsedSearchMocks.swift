//
//  ConstructionTableViewWithCollapsedSearchMocks.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Mac Mini Novo on 02/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class TestTableViewWithSearchViewController: UIViewController, ConstructionTableViewDidSelectDelegate {
    var didClickOnCell = false
    
    func didClickOnTableViewCellWith(index: Int) {
        didClickOnCell = true
    }
}

class TestTableViewWithSearchScrollViewBehaviourMock: ShowAndHideSearchTableViewDelegate {
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

