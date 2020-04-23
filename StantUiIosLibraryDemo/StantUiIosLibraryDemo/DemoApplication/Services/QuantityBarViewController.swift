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
    public var quantityBarView:  QuantityBar?
    public var buttonStackView:  UIStackView?
    public var oneThirdButton:   UIButton?
    public var halfButton:       UIButton?
    public var leftButton:       UIButton?
    public var quantityTextField: UITextField?
    
    public var doneQuantity:   Float = 100
    public var totalQuantity:  Float = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        self.layoutQuantityView()
        self.layoutButtonStackView()
        self.layoutQuantityTextField()
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
        quantityBarView.configure(totalQuantity: totalQuantity, doneQuantity: doneQuantity)
    }
    
    func layoutButtonStackView() {
        buttonStackView = UIStackView()
        
        guard let buttonStackView    = buttonStackView else { return }
        buttonStackView.axis         = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing      = 53
        
        self.view.addSubview(buttonStackView)
        buttonStackView.anchor(top:      quantityBarView?.bottomAnchor,
                               leading:  self.view.leadingAnchor,
                               trailing: self.view.trailingAnchor,
                               padding:  UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16))
        
        buttonStackView.setNeedsLayout()
        buttonStackView.layoutIfNeeded()
        
        layoutOneThirdButton()
        layoutHalfButton()
        layoutLeftButton()
    }
    
    func layoutOneThirdButton() {
        oneThirdButton                 = UIButton(frame: CGRect(x: 0, y: 0, width: 74, height: 34))
        guard let oneThirdButton       = oneThirdButton else { return }
        oneThirdButton.backgroundColor = .blueLightStant
        
        oneThirdButton.setTitle("1/3", for: .normal)
        oneThirdButton.setTitleColor(.white, for: .normal)
        oneThirdButton.addTarget(self, action: #selector(selectOneThird), for: .touchUpInside)
        buttonStackView?.addArrangedSubview(oneThirdButton)
    }
    
    func layoutHalfButton() {
        halfButton                 = UIButton(frame: CGRect(x: 0, y: 0, width: 74, height: 34))
        guard let halfButton       = halfButton else { return }
        halfButton.backgroundColor = .blueLightStant
        
        halfButton.setTitle("Half", for: .normal)
        halfButton.setTitleColor(.white, for: .normal)
        halfButton.addTarget(self, action: #selector(selectHalf), for: .touchUpInside)
        buttonStackView?.addArrangedSubview(halfButton)
    }
    
    func layoutLeftButton() {
        leftButton                 = UIButton(frame: CGRect(x: 0, y: 0, width: 74, height: 34))
        guard let leftButton       = leftButton else { return }
        leftButton.backgroundColor = .blueLightStant
        
        leftButton.setTitle("Left", for: .normal)
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.addTarget(self, action: #selector(selectLeft), for: .touchUpInside)
        buttonStackView?.addArrangedSubview(leftButton)
    }
    
    func layoutQuantityTextField() {
        quantityTextField                 = UITextField()
        guard let quantityTextField       = quantityTextField else { return }
        quantityTextField.textColor       = .black
        quantityTextField.placeholder     = "Remaining quantity: \(totalQuantity - doneQuantity)"
        quantityTextField.backgroundColor = UIColor.init(red:   220 / 255,
                                                         green: 220 / 255,
                                                         blue:  220 / 255,
                                                         alpha: 1)
        
        self.view.addSubview(quantityTextField)
        quantityTextField.anchor(top:      buttonStackView?.bottomAnchor,
                                 leading:  self.view.leadingAnchor,
                                 trailing: self.view.trailingAnchor,
                                 padding:  UIEdgeInsets(top:    20,
                                                        left:   16,
                                                        bottom: 0,
                                                        right:  16),
                                 size:     CGSize(width: 0, height: 50))
        quantityTextField.addTarget(self,
                                    action: #selector(textFieldDidChange(_:)),
                                    for:    UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            quantityBarView?.setQuantityToDo(quantity: 0)
        }
        
        if let value = Float(textField.text ?? "") {
            quantityBarView?.setQuantityToDo(quantity: value)
        }
    }
    
    @objc func selectOneThird() {
        quantityBarView?.setPercentageToDo(percentage: 1/3)
    }
    
    @objc func selectHalf() {
        quantityBarView?.setPercentageToDo(percentage: 0.5)
    }
    
    @objc func selectLeft() {
        quantityBarView?.setPercentageToDo(percentage: 1)
    }
    
}
