//
//  ToDoBar.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 22/04/20.
//

import UIKit

public class ToDoBar: UIView {
    public var mainBar:         UIStackView?
    public var selectedToDoBar: UIView?
    public var remainingBar:    UIView?
    
    public var selectedToDoPercentage: Float   = 0
    public var positionIndicator:      CGFloat = 0
    public var quantity:               Float   = 0
    
    let barHeight: CGFloat = 6
    
    public func configure(quantity: Float, selectedToDoPercentage: Float) {
        self.selectedToDoPercentage = selectedToDoPercentage
        self.positionIndicator      = CGFloat(selectedToDoPercentage * Float(self.frame.width))
        self.quantity               = quantity
        
        self.configureMainBar()
        self.layoutIfNeeded()
    }
    
    override public func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    fileprivate func configureMainBar() {
        mainBar           = UIStackView()
        guard let mainBar = mainBar else { return }
        mainBar.axis      = .horizontal
        mainBar.spacing   = 0
        
        self.addSubview(mainBar)
        mainBar.anchor(top:      self.topAnchor,
                       leading:  self.leadingAnchor,
                       bottom:   self.bottomAnchor,
                       trailing: self.trailingAnchor)
        
        mainBar.updateLayout()
        
        configureSelectedToDoBar()
        configureRemainingBar()
    }

    func configureSelectedToDoBar() {
        selectedToDoBar                 = UIView()
        guard let selectedToDoBar       = selectedToDoBar else { return }
        guard let mainBar               = mainBar else { return }
        selectedToDoBar.backgroundColor = .blueStant
        
        mainBar.addArrangedSubview(selectedToDoBar)
        selectedToDoBar.anchor(top:     mainBar.topAnchor,
                               leading: mainBar.leadingAnchor,
                               bottom:  mainBar.bottomAnchor,
                               size:    CGSize(width:  self.positionIndicator == 0 ? 0.1 : self.positionIndicator,
                                               height: 0))
    }
    
    func configureRemainingBar() {
        remainingBar                 = UIView()
        guard let remainingBar       = remainingBar else { return }
        guard let mainBar            = mainBar else { return }
        remainingBar.backgroundColor = .blueDarkStant
        
        mainBar.addArrangedSubview(remainingBar)
        remainingBar.anchor(top:      mainBar.topAnchor,
                            bottom:   mainBar.bottomAnchor,
                            trailing: mainBar.trailingAnchor,
                            size:     CGSize(width:  mainBar.frame.width - self.positionIndicator,
                                             height: 0))
    }
}
