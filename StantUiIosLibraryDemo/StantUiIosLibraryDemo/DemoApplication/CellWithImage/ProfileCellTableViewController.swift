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
        self.tableView.allowsSelection = false
    }
    
    func getButtonsBy(index: Int) -> [UIButton] {
        let mailButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        callButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        mailButton.tag = index
        callButton.tag = index
        
        mailButton.addTarget(self, action: #selector(teste), for: .touchUpInside)
        callButton.addTarget(self, action: #selector(teste), for: .touchUpInside)
        
        return [mailButton, callButton]
    }
    
    @objc func teste(sender: UIButton) {
        print(sender.tag)
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
        
        let buttons = getButtonsBy(index: indexPath.row)
        
        cell?.set(title: "Godfather Washington",
                  description: "The big bad godfather.",
                  icon: UIImage(named: "godfatherWashington"))
        
        cell?.set(mailButton: buttons.first!,
                  mailImage: UIImage(named: "mail")!,
                  callButton: buttons.last!,
                  callImage: UIImage(named: "call")!)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return InternActionCell.HEIGHT
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 16))
    }
}
