//
//  ConstructionViewDefaultSearchViewExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/06/19.
//

import UIKit

extension ConstructionTableViewWithCollapsedSearchBar: DefaultSearchViewDelegate {
    public func updateTableViewWith(search: String) {
        self.currentSearch  = search
        guard let tableView = tableView else { return }
        tableView.filteredConstructionSiteList = constructionSiteList.filter { (constructionSite: Construction) -> Bool in
            let title = constructionSite.title ?? ""
            return title.lowercased().contains(search.lowercased())
        }
        if search.isEmpty {
            tableView.filteredConstructionSiteList = constructionSiteList
        }
        
        tableView.reloadData()
        
        self.setEmptyMessageLabelVisibility()
    }
}
