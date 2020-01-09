//
//  ContactsViewDefaultSearchViewExtension.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 29/11/19.
//

import UIKit

extension ContactsTableViewWithCollapseSearchBar: DefaultSearchViewDelegate {
    public func updateTableViewWith(search: String) {
        self.currentSearch  = search
        guard let tableView = tableView else { return }
        
        tableView.filteredConstructionSiteList = constructionSiteList.filter { (constructionSite: ContactsInformation) -> Bool in
            let title = constructionSite.name ?? ""
            return title.lowercased().contains(search.lowercased())
        }
        if search.isEmpty {
            tableView.filteredConstructionSiteList = constructionSiteList
        }
        
        tableView.reloadData()
        
        self.setEmptyMessageLabelVisibility()
    }
}
