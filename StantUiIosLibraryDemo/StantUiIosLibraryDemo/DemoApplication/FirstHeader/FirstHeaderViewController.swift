//
//  FirstHeaderViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 29/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class FirstHeaderViewController: UIViewController, RecentItemCellDelegate {
   
    var indexSelected             = 0
    var recentItemsViewController: SelectRecentViewController?
    var headerTitle               = String()
    
    var header: FirstHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerTitle = "Some title"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
        
        self.addHeaderView()
    }
    
    deinit {
        self.header                    = nil
        self.recentItemsViewController = nil
    }

    fileprivate func addHeaderView() {
        header = FirstHeaderView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: FirstHeaderView.headerHeight))
        
        let dropdownImage        = UIImage(named: "down") ?? UIImage()
        let notificaticationIcon = UIImage(named: "notifications") ?? UIImage()
        
        let dropdownButton       = FirstHeaderDropdownButton(title: headerTitle, action: #selector(openRecentItemsDialog), target: self, image: dropdownImage)
        let rightBarButton       = FirstHeaderRightBarButton(action: #selector(notificationClick), target: self, image: notificaticationIcon)
        
        guard let header = header else { return }
        header.configure(dropdown: dropdownButton, rightBarButton: rightBarButton)
        self.view.addSubview(header)
        header.anchor(top: self.view.safeAreaLayoutGuide.topAnchor,
                      leading: self.view.leadingAnchor,
                      trailing: self.view.trailingAnchor,
                      padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                      size: CGSize(width: 0, height: 29))

    }
    
    @objc func openRecentItemsDialog() {
        let standardConstructionSiteImage = UIImage(named: "home") ?? UIImage()
        let recentItems = [FirstHeaderRecentItem(title: "Construction Site List",
                                                 image: standardConstructionSiteImage, url: nil),
                           FirstHeaderRecentItem(title: "Construction Site 01",
                                                 image: nil, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw"),
                           FirstHeaderRecentItem(title: "Construction Site 02",
                                                 image:  nil, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw")]

        recentItemsViewController                        = SelectRecentViewController()

        guard let recentItemsViewController = recentItemsViewController else { return }
        recentItemsViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        recentItemsViewController.cellDelegate           = self
        recentItemsViewController.configureView(recentItems: recentItems, selectedItemIndex: indexSelected)

        self.present(recentItemsViewController, animated: false, completion: nil)
    }

    @objc public func notificationClick() {
        print("Notification click")
    }

    func clickOnCellWith(index: Int, title: String) {
        self.indexSelected = index
        self.headerTitle   = title
    
        guard let header = self.header else { return }
        header.removeFromSuperview()
        self.addHeaderView()
    }
    
}
