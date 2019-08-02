//
//  InputTextCellTableViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 31/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class InputTextCellTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle           = .none
        self.tableView.isUserInteractionEnabled = true
        self.tableView.register(TextInputTableViewCell.self, forCellReuseIdentifier: TextInputTableViewCell.identifier())
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextInputTableViewCell.identifier(),
                                                 for: indexPath) as? TextInputTableViewCell
        cell?.selectionStyle = .none
        cell?.set(inputType: "Input type", inicialInputValue: "Input Value", editable: true)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 22))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TextInputTableViewCell.HEIGHT
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

