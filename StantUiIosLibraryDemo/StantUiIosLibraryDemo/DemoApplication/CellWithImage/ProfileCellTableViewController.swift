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
    
    let validMailButtons  = [UIButton(), nil, nil, UIButton(), nil, UIButton()]
    let validPhoneButtons = [UIButton(), UIButton(), nil, UIButton(), UIButton(), nil]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(InternPersonCell.self, forCellReuseIdentifier: InternPersonCell.identifier())
        self.tableView.allowsSelection = false
    }
    
    private func setButtonsActionsFor(index: Int) {
        if let btn = self.validMailButtons[index] {
            btn.addTarget(self, action: #selector(mailAction), for: .touchUpInside)
        }
        if let btn = self.validPhoneButtons[index] {
            btn.addTarget(self, action: #selector(phoneAction), for: .touchUpInside)
        }
    }
    
    @objc func mailAction(sender: UIButton) {
        let alert = UIAlertController(title: "Mail", message: "Send a mail button was clicked!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func phoneAction(sender: UIButton) {
        let alert = UIAlertController(title: "Phone", message: "Call a phone button was clicked!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InternPersonCell.identifier(),
                                                 for: indexPath) as? InternPersonCell
        
        cell?.set(title: "Godfather Washington",
                  description: "The big bad godfather.",
                  icon: UIImage(named: "godfatherWashington"))
        
        self.setButtonsActionsFor(index: indexPath.row)
        
        cell?.set(mailButton: self.validMailButtons[indexPath.row],
                  mailImage: UIImage(named: "mailIcon")!,
                  callButton: self.validPhoneButtons[indexPath.row],
                  callImage: UIImage(named: "callIcon")!)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return InternActionCell.HEIGHT
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 16))
    }
}
