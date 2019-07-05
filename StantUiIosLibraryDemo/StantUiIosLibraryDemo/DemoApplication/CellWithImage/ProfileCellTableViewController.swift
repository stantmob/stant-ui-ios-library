//
//  ProfileCellTableViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Alexandre Henrique on 7/3/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ProfileCellTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(InternPersonCell.self, forCellReuseIdentifier: InternPersonCell.IDENTIFIER)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: InternPersonCell.IDENTIFIER,
                                                 for: indexPath) as? InternPersonCell
        
        cell?.set(title: "Godfather Washington",
                  description: "The big bad godfather.",
                  icon: UIImage(named: "godfatherWashington"))
        
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
