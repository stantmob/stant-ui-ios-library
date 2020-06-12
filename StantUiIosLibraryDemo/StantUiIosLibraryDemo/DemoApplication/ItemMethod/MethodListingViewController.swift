//
//  MethodListingViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 12/06/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class MethodListingViewController: UIViewController {
    public var tableView: UITableView?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
        tableView                = UITableView()
        guard let tableView      = tableView else { return }
        tableView.delegate       = self
        tableView.dataSource     = self
        tableView.separatorStyle = .none
        tableView.clipsToBounds  = false
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding:  UIEdgeInsets(top: 100, left: 22, bottom: 0, right: 15))
        
        tableView.register(MethodCell.self, forCellReuseIdentifier: MethodCell.identifier())
    }
}

extension MethodListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MethodCell.identifier(), for: indexPath) as! MethodCell

        return cell
    }
}
