//
//  ConstructionCardViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 22/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ConstructionCardViewController: UIViewController {
    
    let navigationBarHeight: CGFloat = 60
    let cardTitle                    = "Some title"
    let cardSubtitle                 = "Some subtitle"
    let cardUrl                      = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw"
    let cardColor                    = UIColor.blue
    let cardPercentage: CGFloat      = 50
    
    var constructionSiteList         = [Construction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white

        constructionSiteList.append(Construction(title: "Construction site without image", subtitle: cardSubtitle, imageUrl: "", color: cardColor, percentage: 10))
        for i in 1...24 {
            constructionSiteList.append(Construction(title: "\(i)", subtitle: cardSubtitle, imageUrl: cardUrl, color: cardColor, percentage: cardPercentage))
        }
        
        let constructionTableView = ConstructionTableViewWithCollapsedSearchBar(frame: CGRect(x: 0,
                                                                                              y: navigationBarHeight,
                                                                                              width: self.view.frame.width,
                                                                                              height: self.view.frame.height - navigationBarHeight))
        self.view.addSubview(constructionTableView)
        constructionTableView.anchor(top: self.view.topAnchor,
                                     leading: self.view.leadingAnchor,
                                     bottom: self.view.bottomAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: navigationBarHeight, left: 0, bottom: 0, right: 0))
        constructionTableView.configureViewWith(constructionList: constructionSiteList,
                                                searchBarIcon: UIImage(named: "search") ?? UIImage(),
                                                searchBarPlaceholder: "Search",
                                                tableViewDelegate: self,
                                                emptyMessage: "No construction site to show on current screen. Please try again later.")
    }
}

extension ConstructionCardViewController: ConstructionTableViewDidSelectDelegate {
    func didClickOnTableViewCellWith(index: Int) {
        print("Clicked on cell \(index)")
    }
    
    
}
