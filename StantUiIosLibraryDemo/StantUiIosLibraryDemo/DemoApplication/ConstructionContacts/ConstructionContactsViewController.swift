//
//  ConstructionContactsViewControler.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 19/11/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ConstructionContactsViewController: UIViewController {
     let navigationBarHeight: CGFloat = 60
     let name                         = "Steve Jobs"
     let office                       = "Developer IOS "
     let cardUrl                      = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw"
     let iconSize: CGSize             = CGSize(width: 35, height: 35)
     let validMailButtons             = [UIButton(), nil, nil, UIButton(), nil, UIButton()]
     let validPhoneButtons            = [UIButton(), UIButton(), nil, UIButton(), UIButton(), nil]
    
     var constructionSiteList         = [ContactsInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        for i in 0...5 {
                        
            constructionSiteList.append(ContactsInformation(name: name + " \(i)", office: office, imageUrl: cardUrl, iconSize: iconSize, mailButton: self.validMailButtons[i], mailImage: UIImage(named: "mail") ?? UIImage(), callButton: self.validPhoneButtons[i], callImage: UIImage(named: "call") ?? UIImage()))
            
            self.setButtonsActionsFor(index: i)
        }
        
        let contactsTableView = ContactsTableViewWithCollapseSearchBar(frame: CGRect(x: 0, y: navigationBarHeight, width: self.view.frame.width, height: self.view.frame.height - navigationBarHeight))
        
        self.view.addSubview(contactsTableView)
        contactsTableView.anchor(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: navigationBarHeight, left: 0, bottom: 0, right: 0))
        
        contactsTableView.configureViewWith(constructionList: constructionSiteList, searchBarIcon: UIImage(named: "search") ?? UIImage(),
        searchBarPlaceholder: "Search",
        tableViewDelegate: self,
        emptyMessage: "No construction site to show on current screen. Please try again later.")
    }
}

extension ConstructionContactsViewController: ContactsTableViewDidSelectDelegate {
    func didClickOnTableViewCellWith(index: Int) {
        print("Clicked on cell \(index)")
    }
}



