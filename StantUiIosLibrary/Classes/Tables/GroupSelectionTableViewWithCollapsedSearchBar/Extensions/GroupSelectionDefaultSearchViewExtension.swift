//
//  GroupSelectionDefaultSearchViewExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 29/07/19.
//

import UIKit

extension GroupSelectionTableViewWithCollapsedSearchBar: DefaultSearchViewDelegate {
    public func updateTableViewWith(search: String) {
        self.currentSearch  = search
        guard let tableView = tableView else { return }
        
        tableView.filteredItemsList = itemsList.filter { (item: GroupedSelection) -> Bool in
            let title = item.sectionTitle ?? ""
            return title.lowercased().contains(search.lowercased())
        }
        if search.isEmpty {
            tableView.filteredItemsList = itemsList
        }
        
        tableView.reloadData()
        
        self.setEmptyMessageLabelVisibility()
    }
}

