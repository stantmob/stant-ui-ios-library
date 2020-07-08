//
//  ItemMethodDetailViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 7/7/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ItemMethodDetailViewController: UIViewController {
    public var cardsView: ItemMethodDetailCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
