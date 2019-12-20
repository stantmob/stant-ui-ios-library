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

    let syncDialogViewController             = DialogViewController()
    let bottomDialogWithScrollViewController = BottomDialogWithScrollViewController()
    
    var tableViewSelectedItem = 0
    
    var tabBarLastSelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addConstructionCardDemoButton()
        self.addConstructionsFiltersDemoButton()
        self.addSyncDialogDemoButton()
        self.addFirstHeaderDemoButton()
        self.addMainMenuTabBarDemoButton()
        self.addBottomDialogWithScrollDemoButton()
        self.addCellWithImageDemoButton()
        self.addProfileCellDemoButton()
        self.addBottomDialogWithScrollDemoButton()
        self.addBottomDialogWithScrollAndIconsDemo()
        self.addGroupSelectionTableViewDemoButton()
        self.addTextInputTableViewCellDemoButton()
        self.addRoundedImageViewDemoButton()
        self.addSecondHeaderDemoButton()
        self.addProgressBarDemo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
    }
    
    fileprivate func addConstructionCardDemoButton() {
        self.view.addButton(title: "Construction Table View and Search Demo", action: #selector(goToConstructionCardDemo), orderOfButton: 1, target: self)
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
    
    fileprivate func addBottomDialogWithScrollDemoButton() {
        self.view.addButton(title: "Bottom Dialog With Scroll", action: #selector(goToBottomDialogWithScrollDemo), orderOfButton: 6, target: self)
    }
    
    @objc func goToBottomDialogWithScrollDemo() {
        self.openBottomDialogWithScrollDemo()
    }

    fileprivate func addCellWithImageDemoButton() {
        self.view.addButton(title: "Cell With Image", action: #selector(goToCellWithImageDemo), orderOfButton: 7, target: self)
    }

    @objc func goToCellWithImageDemo() {
        self.open(viewController: CellWithImageTableViewController())
    }

    fileprivate func addProfileCellDemoButton() {
        self.view.addButton(title: "Profile cell", action: #selector(goToProfileCellDemo), orderOfButton: 8, target: self)
    }

    @objc func goToProfileCellDemo() {
        self.open(viewController: ProfileCellTableViewController())
    }

    fileprivate func addGroupSelectionTableViewDemoButton() {
        self.view.addButton(title: "Group Selection Table View Demo", action: #selector(goToGroupSelectionDemo), orderOfButton: 9, target: self)
    }
    
    @objc func goToGroupSelectionDemo() {
        self.open(viewController: GroupSelectionViewController())
    }
    
    fileprivate func addTextInputTableViewCellDemoButton() {
        self.view.addButton(title: "Text Input Table View Cell Demo", action: #selector(goToTextInputTableViewCellDemo), orderOfButton: 10, target: self)
    }
    
    @objc func goToTextInputTableViewCellDemo() {
        self.open(viewController: InputTextCellTableViewController())
    }
    
    fileprivate func addRoundedImageViewDemoButton() {
        self.view.addButton(title: "Rounded Image View Demo", action: #selector(goToRoundedImageViewDemo), orderOfButton: 11, target: self)
    }
    
    @objc func goToRoundedImageViewDemo() {
        self.open(viewController: RoundedImageViewController())
    }
    
    fileprivate func addSecondHeaderDemoButton() {
        self.view.addButton(title: "Second Header Demo", action: #selector(goToSecondHeaderDemo), orderOfButton: 12, target: self)
    }
    
    @objc func goToSecondHeaderDemo() {
        self.open(viewController: SecondHeaderViewController())
    }
    
    fileprivate func addBottomDialogWithScrollAndIconsDemo() {
        self.view.addButton(title: "Bottom Dialog With Scroll and icons", action: #selector(goToBottomDialogWithScrollAndIconsDemo), orderOfButton: 13, target: self)
    }
    
    @objc func goToBottomDialogWithScrollAndIconsDemo() {
        self.openBottomDialogWithScrollAndIconsDemo()
    }
    
    fileprivate func addProgressBarDemo() {
        self.view.addButton(title: "Progress bar demo", action: #selector(goToProgressBarDemo), orderOfButton: 14, target: self)
    }
    
    @objc func goToProgressBarDemo() {
        self.openProgressBarDemo()
    }
    
}
