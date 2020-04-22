//
//  QuantityBarViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 22/04/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class QuantityBarViewController: UIViewController {
    public var quantityBarView: QuantityBar?
    public var quantityButtons: QuantityButtons?
    
    public var donePercentage: Float = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        self.layoutQuantityView()
        self.layoutQuantityButtons()
    }
    
    
    func layoutQuantityView() {
        quantityBarView = QuantityBar()
        
        guard let quantityBarView = quantityBarView else { return }

        self.view.addSubview(quantityBarView)
        quantityBarView.anchor(top:      self.view.topAnchor,
                               leading:  self.view.leadingAnchor,
                               trailing: self.view.trailingAnchor,
                               padding:  UIEdgeInsets(top: 50, left: 16, bottom: 0, right: 16))
        
        quantityBarView.setNeedsLayout()
        quantityBarView.layoutIfNeeded()
        quantityBarView.configure(donePercentage: donePercentage)
    }
    
    func layoutQuantityButtons() {
        quantityButtons = QuantityButtons()
        
        guard let quantityButtons = quantityButtons else { return }

        self.view.addSubview(quantityButtons)
        quantityButtons.anchor(top:      quantityBarView?.bottomAnchor,
                               leading:  self.view.leadingAnchor,
                               trailing: self.view.trailingAnchor,
                               padding:  UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16))
        
        quantityButtons.setNeedsLayout()
        quantityButtons.layoutIfNeeded()
        quantityButtons.configure(donePercentage: donePercentage)
    }
}
