//
//  ServiceInspectionFormFilledViewDefaultSearchViewExtension.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

extension ServiceInspectionFormFilledTableViewWithCollapsedSearchBar: DefaultSearchViewDelegate {
    public func updateTableViewWith(search: String) {
        self.currentSearch  = search
        
        guard let tableView = tableView else { return }
        tableView.filteredServiceInspectionFormFilledList = serviceInspectionFormFilledList.filter { (serviceInspectionFormFilled: ServiceInspectionFormFilled) -> Bool in
            let verifiedUnit = serviceInspectionFormFilled.verifiedUnit ?? ""
            return verifiedUnit.lowercased().contains(search.lowercased())
        }
        if search.isEmpty {
            tableView.filteredServiceInspectionFormFilledList = serviceInspectionFormFilledList
        }
        
        tableView.reloadData()
        
        self.setEmptyMessageLabelVisibility()
    }
}
