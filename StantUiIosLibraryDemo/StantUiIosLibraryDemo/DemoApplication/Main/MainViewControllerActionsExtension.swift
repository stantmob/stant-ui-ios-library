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
        
        tabBar.set(tabBarObjects: objects)
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(tabBar, animated: true)
    }
    
    
}
