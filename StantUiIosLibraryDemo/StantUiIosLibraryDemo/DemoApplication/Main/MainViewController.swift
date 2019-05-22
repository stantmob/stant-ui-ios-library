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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
    }
    
    fileprivate func addConstructionCardDemoButton() {
        let button = UIButton(type: .system) as UIButton
        
        button.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 50)
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Construction Card Demo", for: .normal)
        button.tintColor = UIColor.black
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(goToConstructionCardDemo), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func goToConstructionCardDemo() {
        let viewController = ConstructionCardViewController()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}

