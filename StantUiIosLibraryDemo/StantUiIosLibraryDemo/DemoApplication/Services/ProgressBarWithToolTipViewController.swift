//
//  ProgressBarWithToolTipViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 18/12/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ProgressBarWithToolTipViewController: UIViewController {
    public var mainView:          UIStackView?
    public var progressBarView:   ProgressBarWithToolTipView?
    public var addProgressButton: UIButton?
    
    public var percentage: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        mainView = UIStackView(frame: CGRect(x:      0,
                                             y:      100,
                                             width:  self.view.frame.width,
                                             height: 50))
        
        guard let mainView = mainView else { return }
        mainView.axis      = .vertical
        mainView.spacing   = 10
        mainView.alignment = .center
        
        self.view.addSubview(mainView)
        self.layoutProgressView()
        self.layoutAddProgressButton()
    }
    
    func layoutProgressView() {
        progressBarView = ProgressBarWithToolTipView(frame: CGRect(x:      0,
                                                        y:      0,
                                                        width:  self.mainView?.frame.width ?? 0,
                                                        height: self.mainView?.frame.height ?? 0))
        
        guard let progressBarView = progressBarView else { return }

        self.mainView?.addArrangedSubview(progressBarView)
        progressBarView.anchor(top:      self.mainView?.topAnchor,
                               leading:  self.mainView?.leadingAnchor,
                               trailing: self.mainView?.trailingAnchor,
                               padding:  UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        progressBarView.configure(percentage: percentage, message: "Executed")
    }
    
    func layoutAddProgressButton() {
        addProgressButton = UIButton(frame: CGRect(x:      0,
                                                   y:      0,
                                                   width:  self.view.frame.width,
                                                   height: self.view.frame.height))
        
        guard let addProgressButton = addProgressButton else { return }
        addProgressButton.backgroundColor = .lightGray
        addProgressButton.setTitle("Add progress", for: .normal)
        addProgressButton.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
        addProgressButton.addTarget(self, action: #selector(addProgress), for: .touchUpInside)
        
        self.mainView?.addArrangedSubview(addProgressButton)
    }
    
    @objc func addProgress() {
        percentage += 0.135
        
        if percentage >= 1 {
            percentage = 1
        }
        progressBarView?.setProgress(percentage: percentage)    
    }
}
