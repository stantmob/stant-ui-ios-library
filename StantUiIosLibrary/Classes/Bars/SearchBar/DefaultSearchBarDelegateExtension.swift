//
//  DefaultSearchBarDelegateExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/06/19.
//

import UIKit

extension DefaultSearchBar: UISearchBarDelegate {
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let cancelNotEmptySearch = didTapCancelButton && searchBar.text != ""
        checkCancelButtonVisibility(conditional: cancelNotEmptySearch, searchBar: searchBar)
        return true
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        checkCancelButtonVisibility(conditional: didTapCancelButton, searchBar: searchBar)
        didTapCancelButton = false
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchOnTableView  = searchText
        isSearchEnable     = true
        didTapCancelButton = false
        
        if searchText.isEmpty {
            searchBarCancelButtonClicked(searchBar)
            return
        }
        
        delegate?.updateTableViewWith(search: searchOnTableView)
        
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchOnTableView  = searchBar.text ?? ""
        didTapCancelButton = false
        
        enableCancelButtonAndHideKeyboardOf(searchBar: searchBar)
        delegate?.updateTableViewWith(search: searchOnTableView)
    }

    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        didTapCancelButton          = true
        isSearchEnable              = false
        searchBar.text              = ""
        searchOnTableView           = ""
        searchBar.showsCancelButton = isSearchEnable
        
        searchBar.perform(#selector(self.resignFirstResponder), with: nil, afterDelay: 0.1)
        delegate?.updateTableViewWith(search: "")
    }
    
    fileprivate func checkCancelButtonVisibility(conditional: Bool, searchBar: UISearchBar) {
        searchBar.showsCancelButton = !conditional
    }
    
    fileprivate func enableCancelButtonAndHideKeyboardOf(searchBar: UISearchBar) {
        self.endEditing(true)
        self.resignFirstResponder()
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.isEnabled = true
        }
    }
}
