//
//  TestFirstHeaderViewController.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Livia Vasconcelos on 31/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

public class TestFirstHeaderViewController: UIViewController, RecentItemCellDelegate {
    
    var firstHeaderView: FirstHeaderView?
    var recentItemsViewController: SelectRecentViewController?
    var recentItems: [FirstHeaderRecentItem]?
    var indexSelected: Int?
    var headerImage: UIImage?
    var notificationImage: UIImage?
    
    public var notificationButtonPressed = false
    
    public func addHeader(title: String, headerImage: UIImage, notificationImage: UIImage) {
        self.headerImage       = headerImage
        self.notificationImage = notificationImage
        firstHeaderView        = FirstHeaderView(frame: CGRect(x: 0, y: 0,
                                                               width: 300,
                                                               height: FirstHeaderView.headerHeight))
        
        let dropdownButton       = FirstHeaderDropdownButton(title: title, action: #selector(openRecentItemsDialog), target: self, image: headerImage)
        let rightBarButton       = FirstHeaderRightBarButton(action: #selector(notificationClick), target: self, image: notificationImage)
        
        guard let header = firstHeaderView else { return }
        header.configure(dropdown: dropdownButton, rightBarButton: rightBarButton)
        self.view.addSubview(header)
    }
    
    @objc public func openRecentItemsDialog() {
        recentItemsViewController = SelectRecentViewController()
        
        guard let recentItemsViewController = recentItemsViewController,
            let recentItems = recentItems,
            let indexSelected = indexSelected else { return }
        recentItemsViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        recentItemsViewController.cellDelegate           = self
        recentItemsViewController.configureView(recentItems: recentItems, selectedItemIndex: indexSelected)
        
        self.present(recentItemsViewController, animated: false, completion: nil)
    }
    
    @objc public func notificationClick() {
        notificationButtonPressed = true
    }
    
    public func clickOnCellWith(index: Int, title: String) {
        self.indexSelected = index
        
        guard let header = self.firstHeaderView else { return }
        header.removeFromSuperview()
        self.addHeader(title: title, headerImage: self.headerImage ?? UIImage(),
                       notificationImage: self.notificationImage ?? UIImage())
    }
    
}


