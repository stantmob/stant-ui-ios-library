//
//  ViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 21/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class MainViewController: UIViewController {

    let syncDialogViewController = DialogViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addConstructionCardDemoButton()
        self.addConstructionsFiltersDemoButton()
        self.addSyncDialogDemoButton()
        self.addFirstHeaderDemoButton()
        self.addMainMenuTabBarDemoButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
    }
    
    fileprivate func addConstructionCardDemoButton() {
        self.view.addButton(title: "Construction Card Demo", action: #selector(goToConstructionCardDemo), orderOfButton: 1, target: self)
    }
    
    @objc func goToConstructionCardDemo() {
        self.open(viewController: ConstructionCardViewController())
    }
    
    fileprivate func addConstructionsFiltersDemoButton() {
        self.view.addButton(title: "Constructions Filter Demo", action: #selector(goToConstructionsFilterDemo), orderOfButton: 2, target: self)
    }
    
    @objc func goToConstructionsFilterDemo() {
        self.open(viewController: ConstructionsFilterViewController())
    }
    
    fileprivate func addSyncDialogDemoButton() {
        self.view.addButton(title: "Sync Dialog", action: #selector(goToSyncDialogDemo), orderOfButton: 3, target: self)
    }
    
    @objc func goToSyncDialogDemo() {
        self.openSyncDialogDemo()
    }

    fileprivate func addFirstHeaderDemoButton() {
        self.view.addButton(title: "First Header Demo", action: #selector(goToFirstHeaderDemo), orderOfButton: 4, target: self)
    }
    
    @objc func goToFirstHeaderDemo() {
        self.open(viewController: FirstHeaderViewController())
    }
    
    fileprivate func addMainMenuTabBarDemoButton() {
        self.view.addButton(title: "Main Menu Tab Bar", action: #selector(goToMainMenuTabBarDemo), orderOfButton: 5, target: self)
    }
    
    @objc func goToMainMenuTabBarDemo() {
        self.openMainMenuTabBarDemo()
    }

}
