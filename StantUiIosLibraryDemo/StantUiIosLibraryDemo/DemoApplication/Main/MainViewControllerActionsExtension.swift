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
        let items = ["Item 01", "Item 02", "Item 03", "Item 04", "Item 05", "Item 06", "Item 07", "Item 08", "Item 09", "Item 10"]
        
        bottomDialogWithScrollViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        bottomDialogWithScrollViewController.cellDelegate           = self
        bottomDialogWithScrollViewController.configureView(items: items, selectedItemIndex: tableViewSelectedItem)
        
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
        
        firstVC.view.backgroundColor  = UIColor.yellow
        secondVC.view.backgroundColor = UIColor.orange
        thirdVC.view.backgroundColor  = UIColor.green
        
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