//
//  CellWithImageTableViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Alexandre on 01/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class CellWithImageTableViewController: UITableViewController {
    
    private let data = [[("Synchronize", UIImage(named: "sync"))],
                        [("Go to home", UIImage(named: "home")),
                        ("Contacts", UIImage(named: "users")),
                        ("Support", UIImage(named: "call")),
                        ("Logout", UIImage(named: "logout"))]]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(InternActionCell.self, forCellReuseIdentifier: InternActionCell.identifier())
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: InternActionCell.identifier(),
                                                 for: indexPath) as? InternActionCell

        cell?.set(description: data[indexPath.section][indexPath.row].0,
                  icon:        data[indexPath.section][indexPath.row].1)

        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return InternActionCell.HEIGHT
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 16))
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell selected with section \(indexPath.section) at the \(indexPath.row) row")
    }
    
}
