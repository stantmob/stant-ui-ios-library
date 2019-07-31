//
//  GroupSelectionTableViewWithCollapsedSearchBar.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 29/07/19.
//

import UIKit

public class GroupSelectionTableViewWithCollapsedSearchBar: UIView {
    
    internal var tableView: GroupSelectionTableView?
    internal var searchView: DefaultSearchBar?
    private var emptyMessageLabel: UILabel?
    
    weak var tableViewDelegate: GroupSelectionTableViewDidSelectDelegate?
    
    var searchBarIcon        = UIImage()
    var searchBarPlaceholder = String()
    var searchOnTableView    = String()
    var emptyMessage         = String()
    public var itemsList     = [GroupedSelection]()
    
    var currentSearch = ""
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configureViewWith(items: [GroupedSelection],
                                  searchBarIcon: UIImage,
                                  searchBarPlaceholder: String,
                                  tableViewDelegate: GroupSelectionTableViewDidSelectDelegate,
                                  emptyMessage: String) {
        self.tableViewDelegate    = tableViewDelegate
        self.itemsList            = items
        self.searchBarIcon        = searchBarIcon
        self.searchBarPlaceholder = searchBarPlaceholder
        self.emptyMessage         = emptyMessage
        self.backgroundColor      = .backgroundStant
        
        self.configureEmptyMessageLabel()
        self.configureSearchView()
        self.configureTableView()
        self.anchorSearchAndTableView()
        self.setEmptyMessageLabelVisibility()
        self.addTags()
    }
    
    fileprivate func addTags() {
        tableView?.tag         = 1
        searchView?.tag        = 2
        emptyMessageLabel?.tag = 3
        searchView?.viewWithTag(1)?.tag = 4
    }
    
    fileprivate func configureSearchView() {
        searchView = DefaultSearchBar(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: self.frame.width,
                                                    height: DefaultSearchBar.searchViewHeight))
        guard let searchView = searchView else { return }
        self.addSubview(searchView)
        searchView.configureViewWith(delegate: self,
                                     image: searchBarIcon,
                                     placeholderText: searchBarPlaceholder)
    }
    
    
    fileprivate func configureTableView() {
        tableView = GroupSelectionTableView(frame: CGRect(x: 0,
                                                          y: DefaultSearchBar.searchViewHeight,
                                                          width: self.frame.width,
                                                          height: self.frame.height),
                                            style: .grouped)
        
        tableView?.register(ConstructionCard.self, forCellReuseIdentifier: ConstructionCard.identifier())
        tableView?.configureTableViewWith(itemsList: itemsList,
                                          animationDelegate: self,
                                          selectCellDelegate: tableViewDelegate)
        tableView?.backgroundColor = .clear
    
        if let tableView = tableView { self.addSubview(tableView) }
    }
    
    fileprivate func anchorSearchAndTableView() {
        guard let tableView = tableView, let searchView = searchView else { return }
        
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
                                    color: .darkStant)
        self.addSubview(emptyMessageLabel)
        emptyMessageLabel.numberOfLines = 0
    }
    
    public func updateItemsList(_ items: [GroupedSelection]) {
        self.itemsList = items
        self.tableView?.filteredItemsList = items
        
        self.updateTableViewWith(search: currentSearch)
        self.setEmptyMessageLabelVisibility()
    }
    
    func setEmptyMessageLabelVisibility() {
        let listIsNotEmpty = !(tableView?.filteredItemsList.isEmpty ?? false)
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

