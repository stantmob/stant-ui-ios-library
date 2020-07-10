//
//  VerifiedMethodDetailViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 7/7/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class VerifiedMethodDetailViewController: UIViewController {
    public var verifiedMethodDetailView: VerifiedMethodDetailView?
    public var methodItemDescription: String = "Observar a eliminação de qualquer foco de umidade de modo que a superfície apresente-se seca quando da execução da pintura"
    
    let navigationBarHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layoutCardsView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
    }
    
    func layoutCardsView() {
        verifiedMethodDetailView = VerifiedMethodDetailView(frame: CGRect(x:      0,
                                                                          y:      navigationBarHeight,
                                                                          width:  self.view.frame.width,
                                                                          height: self.view.frame.height - navigationBarHeight))
        
        guard let verifiedMethodDetailView = verifiedMethodDetailView else { return }
        
        self.view.addSubview(verifiedMethodDetailView)
        
        verifiedMethodDetailView.configure(delegate:              self,
                                           methodItemDescription: methodItemDescription)
    }
}

extension VerifiedMethodDetailViewController: ItemMethodButtonDelegate {
    func goToAddApproveInspectionData() {
        print("Approved")
    }
    
    func goToAddReproveInspectionData() {
        print("Reproved")
    }
    
    func present(alert: UIAlertController) {
        self.present(alert, animated: true)
    }
}
