//
//  QuantityBar.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 22/04/20.
//

import UIKit

public class QuantityBar: UIView {
    public var mainBar: UIStackView?
    public var doneBar: UIView?
    public var toDoBar: ToDoBar?
    
    public var donePercentage:         Float   = 0
    public var selectedToDoPercentage: Float   = 0
    public var positionIndicator:      CGFloat = 0
    public var totalQuantity:          Float   = 0
    
    let barHeight: CGFloat = 6
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.mainBar = nil
    }
    
    public func configure(totalQuantity: Float, doneQuantity: Float) {
        self.totalQuantity     = totalQuantity
        self.donePercentage    = doneQuantity / totalQuantity
        self.positionIndicator = CGFloat(donePercentage * Float(self.frame.width + 1))
        
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
        mainBar.spacing   = self.positionIndicator == self.frame.width ? 0 : 1
        
        self.addSubview(mainBar)
        mainBar.anchor(top:      self.topAnchor,
                       leading:  self.leadingAnchor,
                       size:     CGSize(width: self.frame.width, height: self.barHeight))
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        configureDoneBar()
        configureToDoBar()
    }
    
    fileprivate func configureDoneBar() {
        doneBar                    = UIView()
        guard let doneBar          = doneBar else { return }
        guard let mainBar          = mainBar else { return }
        doneBar.backgroundColor    = .blueLightStant
        doneBar.layer.cornerRadius = self.barHeight / 2
        doneBar.clipsToBounds      = true
        
        mainBar.addArrangedSubview(doneBar)
        doneBar.anchor(top:     mainBar.topAnchor,
                       leading: mainBar.leadingAnchor,
                       size:    CGSize(width:  self.positionIndicator == 0 ? 0.1 : self.positionIndicator,
                                       height: 0))
    }
    
    fileprivate func configureToDoBar() {
        toDoBar                    = ToDoBar()
        guard let mainBar          = mainBar else { return }
        guard let toDoBar          = toDoBar else { return }
        toDoBar.layer.cornerRadius = self.barHeight / 2
        toDoBar.clipsToBounds      = true
        
        mainBar.addArrangedSubview(toDoBar)
        toDoBar.anchor(top:      mainBar.topAnchor,
                       trailing: mainBar.trailingAnchor,
                       size:     CGSize(width:  mainBar.frame.width - self.positionIndicator,
                                        height: barHeight))
        
        toDoBar.setNeedsLayout()
        toDoBar.layoutIfNeeded()
        
        toDoBar.configure(quantity:               totalQuantity * (1 - donePercentage),
                          selectedToDoPercentage: selectedToDoPercentage)
    }
    
    public func setPercentageToDo(percentage: Float) {
        selectedToDoPercentage = percentage
        toDoBar?.removeSubviews()
        toDoBar?.configure(quantity:               totalQuantity * (1 - donePercentage),
                           selectedToDoPercentage: percentage)
    }
    
    public func setQuantityToDo(quantity: Float) {
        var newPercentageToDo  = quantity / (totalQuantity * (1 - donePercentage))
        newPercentageToDo      = newPercentageToDo > 1 ? 1 : newPercentageToDo
        selectedToDoPercentage = newPercentageToDo
        
        toDoBar?.removeSubviews()
        toDoBar?.configure(quantity:               totalQuantity * (1 - donePercentage),
                           selectedToDoPercentage: newPercentageToDo)
    }
}
