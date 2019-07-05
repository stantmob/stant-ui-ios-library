//
//  ConstructionViewShowAndHideSearchTableViewExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/06/19.
//

import UIKit

extension ConstructionTableViewWithCollapsedSearchBar: ShowAndHideSearchTableViewDelegate {
    public func collapseSearchView() {
        guard let searchView = searchView, let tableView = tableView else { return }
        self.removeAllConstraints()
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.transitionCrossDissolve], animations: {
            searchView.isHidden = true
            tableView.frame     = CGRect(x: tableView.frame.minX, y: 0, width: self.frame.width,
                                         height: self.frame.height)
        }, completion: { _ in
            tableView.anchor(top: self.topAnchor,
                             leading: self.leadingAnchor,
                             bottom: self.bottomAnchor,
                             trailing: self.trailingAnchor,
                             padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            searchView.anchor(top: self.topAnchor,
                              leading: self.leadingAnchor,
                              bottom: self.topAnchor,
                              trailing: self.trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6))
            tableView.currentHeightConstant = tableView.minHeaderHeight
        })
    }
    
    public func expandSearchView() {
        guard let searchView = searchView, let tableView = tableView else { return }
        self.removeAllConstraints()
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.transitionCrossDissolve], animations: {
            searchView.isHidden = false
            tableView.frame     = CGRect(x: tableView.frame.minX, y: DefaultSearchBar.searchViewHeight, width: self.frame.width,
                                         height: self.frame.height - DefaultSearchBar.searchViewHeight)
        }, completion: { _ in
            searchView.anchor(top: self.topAnchor,
                              leading: self.leadingAnchor,
                              bottom: self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding: UIEdgeInsets(top: 0,
                                                    left: 6,
                                                    bottom: self.frame.height - DefaultSearchBar.searchViewHeight,
                                                    right: 6))
            tableView.anchor(top: searchView.topAnchor,
                             leading: self.leadingAnchor,
                             bottom: self.bottomAnchor,
                             trailing: self.trailingAnchor,
                             padding: UIEdgeInsets(top: DefaultSearchBar.searchViewHeight, left: 0, bottom: 0, right: 0))
            tableView.currentHeightConstant = tableView.maxHeaderHeight
        })
    }
    
    
}
