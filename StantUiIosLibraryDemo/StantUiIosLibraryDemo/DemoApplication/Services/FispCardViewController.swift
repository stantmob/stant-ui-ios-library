//
//  FispCardViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 08/01/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class FispCardViewController: UIViewController {
    public var cardsView:         FispCardStack?
    public var addProgressButton: UIButton?
    
    public var percentage: Float   = 0
    public var quantity: Float     = 1222.88
    public var cardHeight: CGFloat = 69
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        self.layoutCardsView()
        self.layoutAddProgressButton()
    }
    
    override func viewDidLayoutSubviews() {
        cardsView?.makeShadow()
    }
    
    func layoutCardsView() {
        cardsView = FispCardStack(frame: CGRect(x:      0,
                                                y:      0,
                                                width:  self.view.frame.width,
                                                height: cardHeight))
        
        guard let cardsView = cardsView else { return }
        self.view.addSubview(cardsView)
        
        cardsView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         trailing: self.view.trailingAnchor,
                         padding:  UIEdgeInsets(top: 100, left: 16, bottom: 0, right: 16),
                         size:     CGSize(width: self.view.frame.width, height: cardHeight))
        
        cardsView.configure(executedPercentage: self.percentage, quantity: self.quantity)
    }
    
    func layoutAddProgressButton() {
        addProgressButton = UIButton(frame: CGRect())
        
        guard let addProgressButton = addProgressButton else { return }
        addProgressButton.backgroundColor = .lightGray
        addProgressButton.setTitle("Add progress", for: .normal)
        addProgressButton.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
        addProgressButton.addTarget(self, action: #selector(addProgress), for: .touchUpInside)
        
        self.view.addSubview(addProgressButton)
        addProgressButton.anchor(top:      self.cardsView?.bottomAnchor,
                                 leading:  self.view.leadingAnchor,
                                 trailing: self.view.trailingAnchor,
                                 padding:  UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16))
    }
    
    @objc func addProgress() {
        self.percentage += 0.135
        
        if self.percentage >= 1 {
            self.percentage = 1
        }
        cardsView?.setProgress(executedPercentage: self.percentage, quantity: self.quantity)
    }
}
