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
        tableView.filteredServiceInspectionFormFilledDtoList = serviceInspectionFormFilledList.filter { (serviceInspectionFormFilled: ServiceInspectionFormFilledDto) -> Bool in
            let verifiedUnit = serviceInspectionFormFilled.verifiedUnit
            return verifiedUnit.lowercased().contains(search.lowercased())
        }
        if search.isEmpty {
            tableView.filteredServiceInspectionFormFilledDtoList = serviceInspectionFormFilledList
        }
        
        tableView.reloadData()
    }
}
