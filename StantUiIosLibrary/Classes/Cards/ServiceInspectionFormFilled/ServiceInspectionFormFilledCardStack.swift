//
//  ServiceInspectionFormFilledCardStack.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 09/01/20.
//

import UIKit

public class ServiceInspectionFormFilledCardStack: UIStackView {
    public var plannedSiffCard:   ServiceInspectionFormFilledCard?
    public var executedSiffCard:  ServiceInspectionFormFilledCard?
    public var availableSiffCard: ServiceInspectionFormFilledCard?
    
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
                          measurementUnit:    String,
                          plannedMessage:     String,
                          executedMessage:    String,
                          availableMessage:   String) {
        
        self.alignment    = .fill
        self.distribution = .fillEqually
        self.axis         = .horizontal
        self.spacing      = 14
        
        plannedSiffCard = ServiceInspectionFormFilledCard(frame: CGRect(x:      0,
                                                                        y:      0,
                                                                        width:  cardWidth,
                                                                        height: cardHeight))
        
        executedSiffCard = ServiceInspectionFormFilledCard(frame: CGRect(x:      0,
                                                                         y:      0,
                                                                         width:  cardWidth,
                                                                         height: cardHeight))
        
        availableSiffCard = ServiceInspectionFormFilledCard(frame: CGRect(x:      0,
                                                                          y:      0,
                                                                          width:  cardWidth,
                                                                          height: cardHeight))
        
        guard let plannedSiffCard   = plannedSiffCard,
              let executedSiffCard  = executedSiffCard,
              let availableSiffCard = availableSiffCard else { return }
        
        self.setProgress(executedPercentage: executedPercentage,
                         quantity:           quantity,
                         measurementUnit:    measurementUnit,
                         plannedMessage:     plannedMessage,
                         executedMessage:    executedMessage,
                         availableMessage:   availableMessage)
        
        self.addArrangedSubview(plannedSiffCard)
        self.addArrangedSubview(executedSiffCard)
        self.addArrangedSubview(availableSiffCard)
        
    }
    
    //To set the shadow, implement the following function on the View Controller that contains the cardStack
//    override func viewDidLayoutSubviews() {
//        cardStack?.makeShadow()
//    }
    
    public func makeShadow() {
        plannedSiffCard?.layer.applySketchShadow(color: .darkGrayStant, alpha: 0.09, x: 0, y: 3, blur: 8, spread: 3)
        executedSiffCard?.layer.applySketchShadow(color: .darkGrayStant, alpha: 0.09, x: 0, y: 3, blur: 8, spread: 3)
        availableSiffCard?.layer.applySketchShadow(color: .darkGrayStant, alpha: 0.09, x: 0, y: 3, blur: 8, spread: 3)
    }
    
    public func setProgress(executedPercentage: Float,
                            quantity:           Float,
                            measurementUnit:    String,
                            plannedMessage:     String,
                            executedMessage:    String,
                            availableMessage:   String) {
        
        plannedSiffCard?.setLabels(executedPercentage: 1,
                                   quantity:           quantity,
                                   measurementUnit:    measurementUnit,
                                   message:            plannedMessage,
                                   type:               .planned)
        
        executedSiffCard?.setLabels(executedPercentage: executedPercentage,
                                    quantity:           executedPercentage * quantity,
                                    measurementUnit:    measurementUnit,
                                    message:            executedMessage,
                                    type:               .executed)
        
        availableSiffCard?.setLabels(executedPercentage: 1 - executedPercentage,
                                     quantity:           (1 - executedPercentage) * quantity,
                                     measurementUnit:    measurementUnit,
                                     message:            availableMessage,
                                     type:               .available)
    }
}
