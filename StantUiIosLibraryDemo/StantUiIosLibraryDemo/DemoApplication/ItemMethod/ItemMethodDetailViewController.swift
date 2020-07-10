//
//  ItemMethodDetailViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 7/7/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ItemMethodDetailViewController: UIViewController {
    public var cardsView: ItemMethodDetailCard?
    public var methodItemDescription: String = "Observar a eliminação de qualquer foco de umindade de modo que a superfície apresente-se seca quando da execução da pintura"
    
    let navigationBarHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        self.layoutCardsView()
    }
    
    func layoutCardsView() {
        cardsView = ItemMethodDetailCard(frame: CGRect(x: 0, y: navigationBarHeight, width: self.view.frame.width, height: self.view.frame.height - navigationBarHeight))
        
        guard let cardsView = cardsView else { return }
        self.view.addSubview(cardsView)
        cardsView.configure(delegate: self, methodItemDescription: methodItemDescription)
    }
}

extension ItemMethodDetailViewController: ItemMethodButtonDelegate {
    func goToAddApproveInspectionData() {
        print("Approved")
    }
    
    func goToAddRepproveInspectionData() {
        print("Repproved")
    }
}
