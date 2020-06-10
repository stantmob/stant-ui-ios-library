//
//  ServiceInspectionFormFilledTableViewWithCollapsedSearchBar.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/4/20.
//

import Foundation

import UIKit

public class ServiceInspectionFormFilledTableViewWithCollapsedSearchBar : UIView {
    
    public var tableView:         ServiceInspectionFormFilledTableView?
    public var searchView:        DefaultSearchBar?
    public var emptyMessageLabel: UILabel?
    
    weak var tableViewDelegate: ServiceInspectionFormFilledTableViewDidSelectDelegate?
    
    var searchBarIcon        = UIImage()
    var searchBarPlaceholder = String()
    var searchOnTableView    = String()
    var currentSearch        = ""
    
    public var serviceInspectionFormFilledList = [ServiceInspectionFormFilled]()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configureViewWith(serviceInpsectionFormFilledList: [ServiceInspectionFormFilled],
                                  searchBarIcon:                   UIImage,
                                  searchBarPlaceholder:            String,
                                  tableViewDelegate:               ServiceInspectionFormFilledTableViewDidSelectDelegate){
        self.serviceInspectionFormFilledList = serviceInpsectionFormFilledList
        self.searchBarIcon                   = searchBarIcon
        self.searchBarPlaceholder            = searchBarPlaceholder
        self.tableViewDelegate               = tableViewDelegate
        self.backgroundColor                 = .backgroundStant
        
        self.configureSearchView()
        self.configureTableView()
        self.anchorSearchAndTableView()
        //self.setEmptyMessageLabelVisibility()
    }
    
    fileprivate func configureSearchView() {
        searchView = DefaultSearchBar(frame: CGRect(x:      0,
                                                    y:      0,
                                                    width:  self.frame.width,
                                                    height: DefaultSearchBar.searchViewHeight))
        guard let searchView = searchView else { return }
        self.addSubview(searchView)
        searchView.configureViewWith(delegate:        self,
                                     image:           searchBarIcon,
                                     placeholderText: searchBarPlaceholder)
    }
    
    fileprivate func configureTableView() {
        tableView = ServiceInspectionFormFilledTableView(frame:  CGRect(x: 0,
                                                         y:      DefaultSearchBar.searchViewHeight,
                                                         width:  self.frame.width,
                                                         height: self.frame.height))
        
        tableView?.register(ServiceInspectionFormFilledCell.self, forCellReuseIdentifier: ServiceInspectionFormFilledCell.identifier())
        tableView?.configureTableViewWith(serviceInspectionFormFilledList: serviceInspectionFormFilledList,
                                          animationDelegate: self,
                                          selectCellDelegate: tableViewDelegate)
        tableView?.backgroundColor = .clear
        tableView?.clipsToBounds   = false 
        if let tableView = tableView { self.addSubview(tableView) }
    }
    
    fileprivate func anchorSearchAndTableView() {
        guard let tableView = tableView, let searchView = searchView else { return }
        
        searchView.anchor(top:      self.topAnchor,
                          leading:  self.leadingAnchor,
                          bottom:   self.bottomAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top:    0,
                                                 left:   6,
                                                 bottom: self.frame.height - DefaultSearchBar.searchViewHeight,
                                                 right:  0))
        tableView.anchor(top:      searchView.topAnchor,
                         leading:  self.leadingAnchor,
                         bottom:   self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding:  UIEdgeInsets(top:    DefaultSearchBar.searchViewHeight,
                                                left:   14,
                                                bottom: 0,
                                                right:  8))
    }
}
