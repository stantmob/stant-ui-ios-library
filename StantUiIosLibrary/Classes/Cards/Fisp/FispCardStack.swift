//
//  FispCardStack.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 09/01/20.
//

import UIKit

public class FispCardStack: UIStackView {
    public var plannedFispCard:   FispCard?
    public var executedFispCard:  FispCard?
    public var availableFispCard: FispCard?
    
    public var cardWidth:  CGFloat = 100
    public var cardHeight: CGFloat = 69
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(executedPercentage: Float, quantity: Float) {
        self.alignment    = .fill
        self.distribution = .fillEqually
        self.axis         = .horizontal
        self.spacing      = 14
        
        plannedFispCard = FispCard(frame: CGRect(x:      0,
                                                 y:      0,
                                                 width:  cardWidth,
                                                 height: cardHeight))
        
        executedFispCard = FispCard(frame: CGRect(x:      0,
                                                  y:      0,
                                                  width:  cardWidth,
                                                  height: cardHeight))
        
        availableFispCard = FispCard(frame: CGRect(x:      0,
                                                   y:      0,
                                                   width:  cardWidth,
                                                   height: cardHeight))
        
        guard let plannedFispCard = plannedFispCard, let executedFispCard = executedFispCard, let availableFispCard = availableFispCard else { return }
        
        plannedFispCard.configure(percentage: 1,
                                  quantity: quantity,
                                  message: "Planned",
                                  type: .planned)
        
        executedFispCard.configure(percentage: executedPercentage,
                                   quantity: executedPercentage * quantity,
                                   message: "Executed",
                                   type: .executed)
        
        availableFispCard.configure(percentage: 1 - executedPercentage,
                                    quantity: (1 - executedPercentage) * quantity,
                                    message: "Available",
                                    type: .available)
        
        self.addArrangedSubview(plannedFispCard)
        self.addArrangedSubview(executedFispCard)
        self.addArrangedSubview(availableFispCard)
        
    }
    
    public func makeShadow() {
        plannedFispCard?.makeShadow()
        executedFispCard?.makeShadow()
        availableFispCard?.makeShadow()
    }
    
    public func setProgress(executedPercentage: Float, quantity: Float) {
        plannedFispCard?.setLabels(executedPercentage: 1,
                                   quantity: quantity,
                                   message: "Planned",
                                   type: .planned)
        
        executedFispCard?.setLabels(executedPercentage: executedPercentage,
                                    quantity: executedPercentage * quantity,
                                    message: "Executed",
                                    type: .executed)
        
        availableFispCard?.setLabels(executedPercentage: 1 - executedPercentage,
                                     quantity: (1 - executedPercentage) * quantity,
                                     message: "Available",
                                     type: .available)
    }
}
