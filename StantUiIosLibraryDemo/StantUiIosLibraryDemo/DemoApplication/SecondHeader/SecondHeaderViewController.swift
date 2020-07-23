//
//  SecondHeaderViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 01/08/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class SecondHeaderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .lightGrayStant
        
        self.addHeaderView()
        self.addHeaderViewWithoutAction()
    }
    
    fileprivate func addHeaderView() {
        let secondHeader = SecondHeaderView(frame: CGRect(x: 0,
                                                          y: 100,
                                                          width: self.view.frame.width,
                                                          height: SecondHeaderView.headerHeight))
        self.view.addSubview(secondHeader)
        
        secondHeader.configure(title: "Header With Action",
                               subtitle: "Subtitle",
                               titleButton: SecondHeaderButton(action: #selector(clickOnTitleButton),
                                                               target: self,
                                                               icon: UIImage(named: "dropDown") ?? UIImage()),
                               leftButton: SecondHeaderButton(action: #selector(dismissViewController),
                                                              target: self,
                                                              icon: UIImage(named: "back") ?? UIImage()),
                               rightButton: SecondHeaderButton(action: #selector(clickOnRightButton),
                                                               target: self,
                                                               icon: UIImage(named: "plusIcon") ?? UIImage()))
      
    }
    
    fileprivate func addHeaderViewWithoutAction() {
        let secondHeader = SecondHeaderView(frame: CGRect(x: 0,
                                                          y: 200,
                                                          width: self.view.frame.width,
                                                          height: SecondHeaderView.headerHeight))
        self.view.addSubview(secondHeader)
        
        secondHeader.configure(title: "Header Without Action",
                               subtitle: nil,
                               titleButton: nil,
                               leftButton: nil,
                               rightButton: nil)
        
    }
    
    @objc func clickOnTitleButton() {
        print("Click on title button")
    }
    
    @objc func dismissViewController() {
        print("Click on left button")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func clickOnRightButton() {
        print("Click on right button")
    }
    
}

