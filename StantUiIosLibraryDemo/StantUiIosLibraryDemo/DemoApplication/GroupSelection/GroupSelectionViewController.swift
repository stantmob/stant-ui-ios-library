//
//  GroupSelectionViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 29/07/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class GroupSelectionViewController: UIViewController {
    
    let navigationBarHeight: CGFloat = 60
    let arrowIcon = UIImage(named: "right") ?? UIImage()
    let itemImage = UIImage(named: "archiveBox") ?? UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        let groupSelectionTableView = GroupSelectionTableViewWithCollapsedSearchBar(frame: CGRect(x: 0,
                                                                                                  y: navigationBarHeight,
                                                                                                  width: self.view.frame.width,
                                                                                                  height: self.view.frame.height - navigationBarHeight))
        
        self.view.addSubview(groupSelectionTableView)
        groupSelectionTableView.anchor(top: self.view.topAnchor,
                                       leading: self.view.leadingAnchor,
                                       bottom: self.view.bottomAnchor,
                                       trailing: self.view.trailingAnchor,
                                       padding: UIEdgeInsets(top: navigationBarHeight, left: 0, bottom: 0, right: 0))
        
        let items = [GroupedSelection(sectionTitle: "Group 01", firstDate: Date(), secondDate: Date(),
                                      itemsOfSection: [ItemSelection(itemTitle: "Item 01", itemImage: itemImage, arrowIcon: arrowIcon),
                                                       ItemSelection(itemTitle: "Item 02", itemImage: itemImage, arrowIcon: arrowIcon),
                                                       ItemSelection(itemTitle: "Item 03", itemImage: itemImage, arrowIcon: arrowIcon)]),
                     GroupedSelection(sectionTitle: "Group 02", firstDate: Date(), secondDate: Date(),
                                      itemsOfSection: [ItemSelection(itemTitle: "Item 01", itemImage: itemImage, arrowIcon: arrowIcon),
                                                       ItemSelection(itemTitle: "Item 02", itemImage: itemImage, arrowIcon: arrowIcon),
                                                       ItemSelection(itemTitle: "Item 03", itemImage: itemImage, arrowIcon: arrowIcon),
                                                       ItemSelection(itemTitle: "Item 04", itemImage: itemImage, arrowIcon: arrowIcon),
                                                       ItemSelection(itemTitle: "Item 05", itemImage: itemImage, arrowIcon: arrowIcon),
                                                       ItemSelection(itemTitle: "Item 06", itemImage: itemImage, arrowIcon: arrowIcon)])]
        
        groupSelectionTableView.configureViewWith(items: items,
                                                  searchBarIcon: UIImage(named: "search") ?? UIImage(),
                                                  searchBarPlaceholder: "Search",
                                                  tableViewDelegate: self,
                                                  emptyMessage: "No items to show")
    }
}

extension GroupSelectionViewController: GroupSelectionTableViewDidSelectDelegate {
    func didClickOnTableViewCellWith(indexPath: IndexPath) {
        print("Clicked on cell with section \(indexPath.section) and row \(indexPath.row)" )
    }
}

