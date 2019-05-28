//
//  ViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 21/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addConstructionCardDemoButton()
        self.addConstructionsFiltersDemoButton()
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

