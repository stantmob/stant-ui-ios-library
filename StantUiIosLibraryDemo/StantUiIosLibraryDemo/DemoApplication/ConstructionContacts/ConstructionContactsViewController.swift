//
//  ConstructionContactsViewControler.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 19/11/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import MessageUI
import StantUiIosLibrary

class ConstructionContactsViewController: UIViewController, ContactsTableViewShowPresenter, MFMailComposeViewControllerDelegate {
    let navigationBarHeight: CGFloat = 60
    let name                         = "Steve Jobs"
    let role                         = "Developer IOS"
    let contactPhoto                 = UIImage(named: "godfatherWashington") ?? UIImage()
    let contactEmail                 = "stant@stant.com.br"
    let contactPhone                 = "82999999999"
    
    var contactsSiteList = [ContactsInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        for i in 0...5 {
            
            contactsSiteList.append(ContactsInformation(name:  name + "\(i)",
                                                        role:  role,
                                                        photo: contactPhoto ,
                                                        mail:  (i > 2 ? contactEmail : ""),
                                                        phone: (i < 2 ? contactPhone : "")))
        }
        
        let contactsTableView = ContactsTableViewWithCollapseSearchBar(frame: CGRect(x: 0,
                                                                                     y: navigationBarHeight,
                                                                                     width: self.view.frame.width,
                                                                                     height: self.view.frame.height - navigationBarHeight))
        contactsTableView.presenterDelegate = self
        self.view.addSubview(contactsTableView)
        
        contactsTableView.anchor(top:      self.view.topAnchor,
                                 leading:  self.view.leadingAnchor,
                                 bottom:   self.view.bottomAnchor,
                                 trailing: self.view.trailingAnchor,
                                 padding:  UIEdgeInsets(top: navigationBarHeight,
                                 left:     0,
                                 bottom:   0,
                                 right:    0))
        
        contactsTableView.configureViewWith(contactsList: contactsSiteList,
                                            searchBarIcon: UIImage(named: "search") ?? UIImage(),
                                            searchBarPlaceholder: "Search",
                                            tableViewDelegate: self,
                                            emptyMessage: "No construction site to show on current screen. Please try again later.",
                                            callToMessage: "Call to",
                                            mailMessage: "Mail",
                                            supportWarningMessage: "Warning Message",
                                            makeCall: "Make call                  ",
                                            sendEmail: "Send Mail                 ",
                                            warningMessage: "Warning Message",
                                            guidance: "Guidance                   ",
                                            cancel: "Cancel")
    }
    
    func present(alert: UIViewController) {
        self.present(alert, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
         controller.dismiss(animated: true)
    }
}

extension ConstructionContactsViewController: ContactsTableViewDidSelectDelegate {
    func didClickOnTableViewCellWith(index: Int) {
        print("Clicked on cell \(index)")
    }
}
