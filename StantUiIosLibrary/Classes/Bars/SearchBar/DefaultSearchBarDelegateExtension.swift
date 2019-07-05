//
//  DefaultSearchBarDelegateExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/06/19.
//

import UIKit

extension DefaultSearchBar: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchOnTableView = searchText
        if searchText.isEmpty {
            searchBar.perform(#selector(self.resignFirstResponder), with: nil, afterDelay: 0.1)
        }
        delegate?.updateTableViewWith(search: searchText)
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        delegate?.updateTableViewWith(search: searchOnTableView)
        self.searchBar?.endEditing(true)
    }
    
}
