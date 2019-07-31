//
//  ConstructionsFilterViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 24/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ConstructionsFilterViewController: UIViewController {
    
    var filter: ConstructionsFilter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        filter = ConstructionsFilter.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: ConstructionsFilter.headerHeight))
        
        let filterIcon = UIImage(named: "filter")
        guard let filter = filter, let icon = filterIcon else { return }
        
        let buttons = [FilterButton(title: "Button 01", action: #selector(printButton01), target: self),
                       FilterButton(title: "Button 02", action: #selector(printButton02), target: self),
                       FilterButton(title: "Button 03", action: #selector(printButton03), target: self)]
        
        filter.configureViewWith(fixedTitle: "Filters", icon: icon, buttons: buttons)
        self.view.addSubview(filter)
        filter.anchor(top: self.view.topAnchor,
                      leading: self.view.leadingAnchor,
                      trailing: self.view.trailingAnchor,
                      padding: UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0),
                      size: CGSize(width: 0, height: 38))

    }
    
    @objc public func printButton01() {
        print("Button 01")
    }
    
    @objc public func printButton02() {
        print("Button 02")
    }
    
    @objc public func printButton03() {
        print("Button 03")
    }
}
