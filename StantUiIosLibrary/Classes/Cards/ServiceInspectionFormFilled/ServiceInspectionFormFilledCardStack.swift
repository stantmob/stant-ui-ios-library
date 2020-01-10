//
//  ServiceInspectionFormFilledCardStack.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 09/01/20.
//

import UIKit

public class ServiceInspectionFormFilledCardStack: UIStackView {
    public var plannedFispCard:   ServiceInspectionFormFilledCard?
    public var executedFispCard:  ServiceInspectionFormFilledCard?
    public var availableFispCard: ServiceInspectionFormFilledCard?
    
    public var plannedMessage:   String?
    public var executedMessage:  String?
    public var availableMessage: String?
    
    public var cardWidth:  CGFloat = 100
    public var cardHeight: CGFloat = 69
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(executedPercentage: Float,
                          quantity:           Float,
                          plannedMessage:     String,
                          executedMessage:    String,
                          availableMessage:   String) {
        self.alignment    = .fill
        self.distribution = .fillEqually
        self.axis         = .horizontal
        self.spacing      = 14
        
        plannedFispCard = ServiceInspectionFormFilledCard(frame: CGRect(x:      0,
                                                                        y:      0,
                                                                        width:  cardWidth,
                                                                        height: cardHeight))
        
        executedFispCard = ServiceInspectionFormFilledCard(frame: CGRect(x:      0,
                                                                         y:      0,
                                                                         width:  cardWidth,
                                                                         height: cardHeight))
        
        availableFispCard = ServiceInspectionFormFilledCard(frame: CGRect(x:      0,
                                                                          y:      0,
                                                                          width:  cardWidth,
                                                                          height: cardHeight))
        
        guard let plannedFispCard = plannedFispCard, let executedFispCard = executedFispCard, let availableFispCard = availableFispCard else { return }
        
        self.setProgress(executedPercentage: executedPercentage,
                         quantity:           quantity,
                         plannedMessage:     plannedMessage,
                         executedMessage:    executedMessage,
                         availableMessage:   availableMessage)
        
        self.addArrangedSubview(plannedFispCard)
        self.addArrangedSubview(executedFispCard)
        self.addArrangedSubview(availableFispCard)
        
    }
    
    public func makeShadow() {
        plannedFispCard?.makeShadow()
        executedFispCard?.makeShadow()
        availableFispCard?.makeShadow()
    }
    
    public func setProgress(executedPercentage: Float,
                            quantity:           Float,
                            plannedMessage:     String,
                            executedMessage:    String,
                            availableMessage:   String) {
        plannedFispCard?.setLabels(executedPercentage: 1,
                                   quantity:           quantity,
                                   message:            plannedMessage,
                                   type:               .planned)
        
        executedFispCard?.setLabels(executedPercentage: executedPercentage,
                                    quantity:           executedPercentage * quantity,
                                    message:            executedMessage,
                                    type:               .executed)
        
        availableFispCard?.setLabels(executedPercentage: 1 - executedPercentage,
                                     quantity:           (1 - executedPercentage) * quantity,
                                     message:            availableMessage,
                                     type:               .available)
    }
}
