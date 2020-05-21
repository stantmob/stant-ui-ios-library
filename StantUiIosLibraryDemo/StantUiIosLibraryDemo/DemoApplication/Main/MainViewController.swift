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
    let selectionViewController              = SelectionViewController()
    let scrollView                           = UIScrollView()
    
    var tableViewSelectedItem   = 0
    var tabBarLastSelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = self.view.frame
        self.view.addSubview(scrollView)
        
        self.addConstructionCardDemoButton()
        self.addConstructionsFiltersDemoButton()
        self.addSyncDialogDemoButton()
        self.addMainMenuTabBarDemoButton()
        self.addCellWithImageDemoButton()
        self.addProfileCellDemoButton()
        self.addGroupSelectionTableViewDemoButton()
        self.addTextInputTableViewCellDemoButton()
        self.addRoundedImageViewDemoButton()
        self.addFirstHeaderDemoButton()
        self.addSecondHeaderDemoButton()
        self.addBottomDialogWithScrollDemoButton()
        self.addBottomDialogWithScrollAndIconsDemo()
        self.addConstructionsContactsDemoTableView()
        self.addProgressBarWithToolTipDemo()
        self.addServiceInspectionFormFilledCardDemo()
        self.addQuantityBarDemo()
        self.addTeamScreenDemo()
        self.addResponsibleScreenDemo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: CGFloat(self.scrollView.subviews.count * 50))
    }
    
    fileprivate func addConstructionCardDemoButton() {
        self.scrollView.addButton(title:  "Construction Table View and Search Demo",
                                  action: #selector(goToConstructionCardDemo),
                                  target: self)
    }
    
    @objc func goToConstructionCardDemo() {
        self.open(viewController: ConstructionCardViewController())
    }
    
    fileprivate func addConstructionsFiltersDemoButton() {
        self.scrollView.addButton(title:  "Constructions Filter Demo",
                                  action: #selector(goToConstructionsFilterDemo),
                                  target: self)
    }
    
    @objc func goToConstructionsFilterDemo() {
        self.open(viewController: ConstructionsFilterViewController())
    }
    
    fileprivate func addSyncDialogDemoButton() {
        self.scrollView.addButton(title:  "Sync Dialog",
                                  action: #selector(goToSyncDialogDemo),
                                  target: self)
    }
    
    @objc func goToSyncDialogDemo() {
        self.openSyncDialogDemo()
    }

    fileprivate func addFirstHeaderDemoButton() {
        self.scrollView.addButton(title:  "First Header Demo",
                                  action: #selector(goToFirstHeaderDemo),
                                  target: self)
    }
    
    @objc func goToFirstHeaderDemo() {
        self.open(viewController: FirstHeaderViewController())
    }
    
    fileprivate func addMainMenuTabBarDemoButton() {
        self.scrollView.addButton(title:  "Main Menu Tab Bar",
                                  action: #selector(goToMainMenuTabBarDemo),
                                  target: self)
    }
    
    @objc func goToMainMenuTabBarDemo() {
        self.openMainMenuTabBarDemo()
    }
    
    fileprivate func addBottomDialogWithScrollDemoButton() {
        self.scrollView.addButton(title:  "Bottom Dialog With Scroll",
                                  action: #selector(goToBottomDialogWithScrollDemo),
                                  target: self)
    }
    
    @objc func goToBottomDialogWithScrollDemo() {
        self.openBottomDialogWithScrollDemo()
    }

    fileprivate func addCellWithImageDemoButton() {
        self.scrollView.addButton(title:  "Cell With Image",
                                  action: #selector(goToCellWithImageDemo),
                                  target: self)
    }

    @objc func goToCellWithImageDemo() {
        self.open(viewController: CellWithImageTableViewController())
    }

    fileprivate func addProfileCellDemoButton() {
        self.scrollView.addButton(title:  "Profile cell",
                                  action: #selector(goToProfileCellDemo),
                                  target: self)
    }

    @objc func goToProfileCellDemo() {
        self.open(viewController: ProfileCellTableViewController())
    }

    fileprivate func addGroupSelectionTableViewDemoButton() {
        self.scrollView.addButton(title:  "Group Selection Table View Demo",
                                  action: #selector(goToGroupSelectionDemo),
                                  target: self)
    }
    
    @objc func goToGroupSelectionDemo() {
        self.open(viewController: GroupSelectionViewController())
    }
    
    fileprivate func addTextInputTableViewCellDemoButton() {
        self.scrollView.addButton(title:  "Text Input Table View Cell Demo",
                                  action: #selector(goToTextInputTableViewCellDemo),
                                  target: self)
    }
    
    @objc func goToTextInputTableViewCellDemo() {
        self.open(viewController: InputTextCellTableViewController())
    }
    
    fileprivate func addRoundedImageViewDemoButton() {
        self.scrollView.addButton(title:  "Rounded Image View Demo",
                                  action: #selector(goToRoundedImageViewDemo),
                                  target: self)
    }
    
    @objc func goToRoundedImageViewDemo() {
        self.open(viewController: RoundedImageViewController())
    }
    
    fileprivate func addSecondHeaderDemoButton() {
        self.scrollView.addButton(title:  "Second Header Demo",
                                  action: #selector(goToSecondHeaderDemo),
                                  target: self)
    }
    
    @objc func goToSecondHeaderDemo() {
        self.open(viewController: SecondHeaderViewController())
    }
    
    fileprivate func addBottomDialogWithScrollAndIconsDemo() {
        self.scrollView.addButton(title:  "Bottom Dialog With Scroll and icons",
                                  action: #selector(goToBottomDialogWithScrollAndIconsDemo),
                                  target: self)
    }
    
    @objc func goToBottomDialogWithScrollAndIconsDemo() {
        self.openBottomDialogWithScrollAndIconsDemo()
    }
    
    fileprivate func addProgressBarWithToolTipDemo() {
        self.scrollView.addButton(title:  "Progress bar with tooltip demo",
                                  action: #selector(goToProgressBarWithToolTipDemo),
                                  target: self)
    }
    
    @objc func goToProgressBarWithToolTipDemo() {
        self.openProgressBarWithToolTipDemo()
    }
    
    fileprivate func addServiceInspectionFormFilledCardDemo() {
        self.scrollView.addButton(title:  "Siff card demo",
                                  action: #selector(goToServiceInspectionFormFilledCardDemo),
                                  target: self)
    }

    @objc func goToServiceInspectionFormFilledCardDemo() {
        self.openServiceInspectionFormFilledCardDemo()
    }

    fileprivate func addConstructionsContactsDemoTableView() {
        self.scrollView.addButton(title:  "Contruction Contacts Table View",
                                  action: #selector(gotToConstructionsContactsDemo),
                                  target: self)
    }

    @objc func gotToConstructionsContactsDemo() {
        self.open(viewController: ConstructionContactsViewController())
    }

    fileprivate func addQuantityBarDemo() {
        self.scrollView.addButton(title:  "Quantity bar demo",
                                  action: #selector(goToQuantityBarDemo),
                                  target: self)
    }
    
    @objc func goToQuantityBarDemo() {
        self.openQuantityBarDemo()
    }
    
    fileprivate func addTeamScreenDemo() {
        self.scrollView.addButton(title:  "Team screen demo",
                                  action: #selector(goToTeamScreenDemo),
                                  target: self)
    }
    
    @objc func goToTeamScreenDemo() {
        self.openTeamScreenDemo()
    }
    
    fileprivate func addResponsibleScreenDemo() {
        self.scrollView.addButton(title:  "Responsible screen demo",
                                  action: #selector(goToResponsibleScreenDemo),
                                  target: self)
    }
    
    @objc func goToResponsibleScreenDemo() {
        self.openResponsibleScreenDemo()
    }
}
