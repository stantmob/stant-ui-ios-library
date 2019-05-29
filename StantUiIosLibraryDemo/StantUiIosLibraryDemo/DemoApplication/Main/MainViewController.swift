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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
    }
    
    fileprivate func addConstructionCardDemoButton() {
        self.addButton(title: "Construction Card Demo", action: #selector(goToConstructionCardDemo), orderOfButton: 1)
    }
    
    @objc func goToConstructionCardDemo() {
        let viewController = ConstructionCardViewController()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    fileprivate func addConstructionsFiltersDemoButton() {
        self.addButton(title: "Constructions Filter Demo", action: #selector(goToConstructionsFilterDemo), orderOfButton: 2)
    }
    
    @objc func goToConstructionsFilterDemo() {
        let viewController = ConstructionsFilterViewController()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    fileprivate func addSyncDialogDemoButton() {
        self.addButton(title: "Sync Dialog", action: #selector(openSyncDialogDemo), orderOfButton: 3)
    }
    
    @objc func openSyncDialogDemo() {
        syncDialogViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        let insideView   = SyncDialogView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
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
    
    fileprivate func addButton(title: String, action: Selector, orderOfButton: CGFloat) {
        let button = UIButton(type: .system) as UIButton
        let distanceToTop: CGFloat = 50 * orderOfButton
        
        button.frame                      = CGRect(x: 0, y: distanceToTop, width: self.view.frame.width, height: 50)
        button.backgroundColor            = UIColor.lightGray
        button.tintColor                  = UIColor.black
        button.contentHorizontalAlignment = .center
        
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        
        self.view.addSubview(button)
    }

}

