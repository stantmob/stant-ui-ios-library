//
//  ConstructionCardViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 22/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

class ConstructionCardViewController: UIViewController {
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white

        self.configureTableView()
    }
    
    fileprivate func configureTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: self.view.frame.height - 44), style: .plain)
        tableView?.delegate       = self
        tableView?.dataSource     = self
        tableView?.separatorStyle = .none
        
        let cell = UITableViewCell()
//        tableView?.register(cell, forCellReuseIdentifier: "")
    }
}

extension ConstructionCardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
}
