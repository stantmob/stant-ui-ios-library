//
//  ServiceInspectionFormFilledViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 3/25/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import Foundation
import StantUiIosLibrary

class ServiceInspectionFormFilledViewController: UIViewController {
    
    let navigationBarHeight: CGFloat = 60
    var serviceInspectionFormFilledList = [ServiceInpectionFormFilledDto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        let serviceInspectionFormFilledTableView = ServiceInspectionFormFilledTableViewWithCollapsedSearchBar(frame: CGRect(x:      0,
                                                                                                               y:      navigationBarHeight,
                                                                                                               width:  self.view.frame.width,
                                                                                                               height: self.view.frame.height - navigationBarHeight))
        self.view.addSubview(serviceInspectionFormFilledTableView)
        serviceInspectionFormFilledTableView.anchor(top:      self.view.topAnchor,
                                                    leading:  self.view.leadingAnchor,
                                                    bottom:   self.view.bottomAnchor,
                                                    trailing: self.view.trailingAnchor,
                                                    padding:  UIEdgeInsets(top: navigationBarHeight, left: 0, bottom: 0, right: 0))
        serviceInspectionFormFilledTableView.configureViewWith(serviceInpsectionFormFilledList: serviceInspectionFormFilledList,
                                                               searchBarIcon:                   UIImage(named: "search") ?? UIImage(),
                                                               searchBarPlaceholder:            "Search",
                                                               tableViewDelegate:               self,
                                                               emptyMessage:                    "NO FISPS")
    }
    
}

extension ServiceInspectionFormFilledViewController: ServiceInspectionFormFilledTableViewDidSelectDelegate {
    func didClickOnTableViewCellWith(index: Int) {
        print("Clicked on cell \(index)")
    }
    
    
}
