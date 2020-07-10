//
//  ItemListingViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 12/06/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ItemListingViewController: UIViewController {
    public var itemMethodTableView: ItemMethodTableView?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
        itemMethodTableView = ItemMethodTableView()
        guard let tableView = itemMethodTableView else { return }
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding:  UIEdgeInsets(top: 70, left: 1, bottom: 0, right: 0))
        tableView.configure() //pass parameters
    }
}
