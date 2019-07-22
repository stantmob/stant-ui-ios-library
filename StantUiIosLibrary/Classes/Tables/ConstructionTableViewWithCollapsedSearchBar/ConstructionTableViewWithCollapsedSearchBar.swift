//
//  ConstructionTableViewWithCollapsedSearchBar.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/06/19.
//

import UIKit

public class ConstructionTableViewWithCollapsedSearchBar: UIView {
    
    public var tableView: ConstructionTableView?
    public var searchView: DefaultSearchBar?
    public var emptyMessageLabel: UILabel?
    
    var tableViewDelegate: ConstructionTableViewDidSelectDelegate?
    
    var searchBarIcon        = UIImage()
    var searchBarPlaceholder = String()
    var searchOnTableView    = String()
    var emptyMessage         = String()
    public var constructionSiteList = [Construction]()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configureViewWith(constructionList: [Construction],
                                  searchBarIcon: UIImage,
                                  searchBarPlaceholder: String,
                                  tableViewDelegate: ConstructionTableViewDidSelectDelegate,
                                  emptyMessage: String) {
        self.tableViewDelegate    = tableViewDelegate
        self.constructionSiteList = constructionList
        self.searchBarIcon        = searchBarIcon
        self.searchBarPlaceholder = searchBarPlaceholder
        self.emptyMessage         = emptyMessage
        self.backgroundColor      = UIColor.backgroundStant
        
        self.configureSearchView()
        self.configureTableView()
        self.configureEmptyMessageLabel()
    }
    
    fileprivate func configureSearchView() {
        searchView = DefaultSearchBar(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: self.frame.width,
                                                    height: DefaultSearchBar.searchViewHeight))
        guard let searchView = searchView else { return }
        self.addSubview(searchView)
        searchView.anchor(top: self.topAnchor,
                          leading: self.leadingAnchor,
                          bottom: self.bottomAnchor,
                          trailing: self.trailingAnchor,
                          padding: UIEdgeInsets(top: 0,
                                                left: 6,
                                                bottom: self.frame.height - DefaultSearchBar.searchViewHeight,
                                                right: 6))
        
        searchView.configureViewWith(delegate: self,
                                     image: searchBarIcon,
                                     placeholderText: searchBarPlaceholder)
    }
        
    
    fileprivate func configureTableView() {
        tableView = ConstructionTableView(frame: CGRect(x: 0,
                                                        y: DefaultSearchBar.searchViewHeight,
                                                        width: self.frame.width,
                                                        height: self.frame.height))
        
        tableView?.register(ConstructionCard.self, forCellReuseIdentifier: ConstructionCard.IDENTIFIER)
        tableView?.configureTableViewWith(constructionList: constructionSiteList,
                                          animationDelegate: self,
                                          selectCellDelegate: tableViewDelegate)
        tableView?.backgroundColor = UIColor.clear
        
        if let tableView = tableView, let searchView = searchView {
            self.addSubview(tableView)
            tableView.anchor(top: searchView.topAnchor,
                             leading: self.leadingAnchor,
                             bottom: self.bottomAnchor,
                             trailing: self.trailingAnchor,
                             padding: UIEdgeInsets(top: DefaultSearchBar.searchViewHeight, left: 0, bottom: 0, right: 0))
        }

    }
    
    fileprivate func configureEmptyMessageLabel() {
        emptyMessageLabel?.removeFromSuperview()
        emptyMessageLabel = UILabel(frame: CGRect(x: 0,
                                                  y: DefaultSearchBar.searchViewHeight,
                                                  width: self.frame.width,
                                                  height: self.frame.height))
        
        guard let emptyMessageLabel = emptyMessageLabel else { return }
        emptyMessageLabel.configure(text: emptyMessage,
                                    alignment: .left,
                                    size: 16,
                                    weight: .regular,
                                    color: UIColor.darkStant)
        self.addSubview(emptyMessageLabel)
        emptyMessageLabel.numberOfLines = 0
        self.setEmptyMessageLabelVisibility()
    }
    
    public func updateConstructionSiteList(_ constructionSites: [Construction]) {
        self.constructionSiteList                    = constructionSites
        self.tableView?.filteredConstructionSiteList = constructionSites

        self.tableView?.reloadData()
        self.setEmptyMessageLabelVisibility()
    }

    func setEmptyMessageLabelVisibility() {
        let listIsNotEmpty = !(tableView?.filteredConstructionSiteList.isEmpty ?? false)
        if listIsNotEmpty {
            emptyMessageLabel?.isHidden = true
            return
        }
        
        guard let emptyMessageLabel = emptyMessageLabel, let tableView = tableView else { return }
        emptyMessageLabel.anchor(top:      tableView.topAnchor,
                                 leading:  self.leadingAnchor,
                                 trailing: self.trailingAnchor,
                                 padding:  UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                                 size:     CGSize(width: 0, height: 50))
        emptyMessageLabel.isHidden = false
    }
}
