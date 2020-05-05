//
//  MainViewControllerActionsExtension.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 13/06/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

extension MainViewController {
    
    func open(viewController: UIViewController) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func openSyncDialogDemo() {
        syncDialogViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        let insideView = SyncDialogView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        insideView.set(image: UIImage(named: "sync") ?? UIImage(),
                       text: "Some text in dialog some text in dialog some text in dialog",
                       percentage: 50)
        
        let firstButton  = DialogButton(title: "Report", action: #selector(someSomethingInDialogButton), target: self, style: ButtonStyle.standard)
        let secondButton = DialogButton(title: "Cancel", action: #selector(dismissDialog), target: self, style: ButtonStyle.cancel)
        let thirdButton  = DialogButton(title: "Select", action: #selector(someSomethingInDialogButton), target: self, style: ButtonStyle.standard)
        syncDialogViewController.configureView(title: "Some title",
                                               mainView: insideView,
                                               buttons: [firstButton, secondButton, thirdButton])
        self.present(syncDialogViewController, animated: false, completion: nil)
    }
    
    func openBottomDialogWithScrollDemo() {
        let items = ["Home", "Item 01", "Item 02", "Item 03", "Item 04", "Item 05", "Item 06", "Item 07", "Item 08", "Item 09"]
        
        bottomDialogWithScrollViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        bottomDialogWithScrollViewController.cellDelegate           = self
        bottomDialogWithScrollViewController.configureView(items: items, selectedItemIndex: tableViewSelectedItem)
        
        self.present(bottomDialogWithScrollViewController, animated: false, completion: nil)
    }
    
    func openBottomDialogWithScrollAndIconsDemo() {
        let items = ["Home", "Item 01", "Item 02", "Item 03", "Item 04", "Item 05", "Item 06", "Item 07", "Item 08", "Item 09"]
        let icons = ["home",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw"]
        
        bottomDialogWithScrollViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        bottomDialogWithScrollViewController.cellDelegate           = self
        bottomDialogWithScrollViewController.configureView(items: items, icons: icons, selectedItemIndex: tableViewSelectedItem)
        
        self.present(bottomDialogWithScrollViewController, animated: false, completion: nil)
    }
    
    @objc func dismissDialog() {
        syncDialogViewController.dismiss(animated: true, completion: nil)
    }
    
    @objc func someSomethingInDialogButton() {
        print("Something")
    }
    
    func openMainMenuTabBarDemo() {
        let tabBar = MainMenuTabBarController()
        
        let firstVC  = UIViewController(),
        secondVC = UIViewController(),
        thirdVC  = UIViewController()
        
        firstVC.view.backgroundColor  = .yellow
        secondVC.view.backgroundColor = .orange
        thirdVC.view.backgroundColor  = .green
        
        let objects = [MenuTabBarDTO(controller: firstVC,
                                     title: "Obra",
                                     icon: nil,
                                     url: "https://comunidade.rockcontent.com/wp-content/uploads/2017/06/bancos-de-imagem-gratuitos.png"),
                       MenuTabBarDTO(controller: secondVC,
                                     title: "Ocorrências",
                                     icon: UIImage(named: "occurrences") ?? UIImage(),
                                     url: nil),
                       MenuTabBarDTO(controller: thirdVC,
                                     title: "Mais",
                                     icon: UIImage(named: "hamburgerMenu") ?? UIImage(),
                                     url: nil)]
        
        tabBar.set(tabBarObjects: objects, mainMenuTabBarDelegate: self)
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(tabBar, animated: true)
    }
    
    func openProgressBarWithToolTipDemo() {
        let progressBarWithToolTipViewController = ProgressBarWithToolTipViewController()
        self.navigationController?.pushViewController(progressBarWithToolTipViewController, animated: true)
    }
    
    func openServiceInspectionFormFilledCardDemo() {
        let serviceInspectionFormFilledCardViewController = ServiceInspectionFormFilledCardViewController()
        self.navigationController?.pushViewController(serviceInspectionFormFilledCardViewController, animated: true)
    }

    func openQuantityBarDemo() {
        let quantityBarViewController = QuantityBarViewController()
        self.navigationController?.pushViewController(quantityBarViewController, animated: true)
    }
    
    func openTeamScreenDemo() {
        var itemTitles:    [String] = []
        var itemSubtitles: [String] = []
        var iconsUrls:     [String] = []
        
        for i in 0...10 {
            itemTitles.append("Person \(i + 1)")
            itemSubtitles.append("Role \(i + 1)")
            iconsUrls.append("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw")
        }
        
        selectionViewController.modalPresentationStyle = .fullScreen
        
        selectionViewController.configure(headerTitle:       "Select Team",
                                          selectionType:     .multiple,
                                          confirmButtonText: "Confirm",
                                          itemTitles:        itemTitles,
                                          itemSubtitles:     itemSubtitles,
                                          iconsUrls:         iconsUrls)
        self.present(selectionViewController, animated: false, completion: nil)
    }
    
    func openResponsibleScreenDemo() {
        var itemTitles:    [String] = []
        var itemSubtitles: [String] = []
        var iconsUrls:     [String] = []
        
        for i in 0...9 {
            itemTitles.append("Person \(i + 1)")
            itemSubtitles.append("Role \(i + 1)")
            iconsUrls.append("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw")
        }
        
        selectionViewController.modalPresentationStyle = .fullScreen
        
        selectionViewController.configure(headerTitle:       "Select Responsible",
                                          selectionType:     .single,
                                          confirmButtonText: "Confirm",
                                          itemTitles:        itemTitles,
                                          itemSubtitles:     itemSubtitles,
                                          iconsUrls:         iconsUrls)
        self.present(selectionViewController, animated: false, completion: nil)
    }
}

extension MainViewController: MainMenuTabBarDelegate {
    var tabBarSelectedIndex: Int {
        get {
            return tabBarLastSelectedIndex
        }
        set {
           tabBarLastSelectedIndex = newValue
        }
    }
    
    func clickOnCellWith(index: Int, tabBarController: UITabBarController, currentViewController: UIViewController) {
        tabBarSelectedIndex = index
        print("did click on tab bar item \(tabBarSelectedIndex)")
    }
}

extension MainViewController: ScrollableTableViewDialogCellDelegate {
    func clickOnCellWith(index: Int, title: String) {
        print("Click on cell \(title)")
        self.tableViewSelectedItem = index
    }
}
