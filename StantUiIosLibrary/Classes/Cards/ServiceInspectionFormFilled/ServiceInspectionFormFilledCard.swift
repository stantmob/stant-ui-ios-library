//
//  ServiceInspectionFormFilledCard.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 08/01/20.
//

import UIKit

public class ServiceInspectionFormFilledCard: UIView {
    public var percentageLabel: UILabel?
    public var messageLabel:    UILabel?
    public var quantityLabel:   UILabel?
    
    public var percentage:       Float  = 0
    public var quantity:         Float  = 0
    public var measurementUnit:  String = ""
    public var message:          String = ""
    public var type:             CardType?
    private var shadowLayer:     CAShapeLayer?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override public func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    public func configureLabels(percentage:      Float,
                                quantity:        Float,
                                measurementUnit: String,
                                message:         String,
                                type:            CardType) {
        self.percentage      = percentage
        self.quantity        = quantity
        self.measurementUnit = measurementUnit
        self.message         = message
        self.type            = type
        
        self.configurePercentageLabel()
        self.configureMessageLabel()
        self.configureQuantityLabel()
    }
    
    public func configurePercentageLabel() {
        percentageLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 0, height: 0))
        
        guard let percentageLabel = percentageLabel else { return }
        percentageLabel.layer.cornerRadius = 4
        percentageLabel.clipsToBounds      = true
        percentageLabel.attributedText     = NSMutableAttributedString().bold("\((self.percentage * 100).cleanValue)%")
        percentageLabel.textColor          = .white
        percentageLabel.textAlignment      = .center
        
        switch type {
        case .planned:
            percentageLabel.backgroundColor = .darkGrayStant
        case .executed:
            percentageLabel.backgroundColor = .blueLightStant
        default:
            percentageLabel.backgroundColor = .blueDarkStant
        }
        
        self.addSubview(percentageLabel)
        
        percentageLabel.anchor(top:     self.topAnchor,
                               padding: UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0),
                               size:    CGSize(width: 42, height: 19))
        
        percentageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    public func configureMessageLabel() {
        messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        guard let messageLabel = messageLabel else { return }
        messageLabel.text          = message
        messageLabel.textColor     = .darkGrayStant
        messageLabel.font          = UIFont.systemFont(ofSize: 14.0)
        messageLabel.textAlignment = .center
        
        self.addSubview(messageLabel)
        
        messageLabel.anchor(top:     self.topAnchor,
                            padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        
        messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    public func configureQuantityLabel() {
        quantityLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        guard let quantityLabel     = quantityLabel else { return }
        quantityLabel.text          = "\(String(format: "%.2f", quantity)) \(measurementUnit)"
        quantityLabel.textColor     = .black
        quantityLabel.font          = UIFont.systemFont(ofSize: 14.0)
        quantityLabel.textAlignment = .center
        
        self.addSubview(quantityLabel)
        
        quantityLabel.anchor(bottom:  self.bottomAnchor,
                            padding: UIEdgeInsets(top: 0, left: 0, bottom: 11, right: 0))
        
        quantityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    public func makeShadow() {
        self.layer.shadowPath    = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.1
    }
    
    public func setLabels(executedPercentage: Float,
                          quantity:           Float,
                          measurementUnit:    String,
                          message:            String,
                          type:               CardType) {
        self.backgroundColor = .white
        self.layoutIfNeeded()
        
        self.removeSubviews(self.percentageLabel ?? UILabel())
        self.removeSubviews(self.messageLabel ?? UILabel())
        self.removeSubviews(self.quantityLabel ?? UILabel())
        
        self.configureLabels(percentage:      executedPercentage,
                             quantity:        quantity,
                             measurementUnit: measurementUnit,
                             message:         message,
                             type:            type)
    }
}

public enum CardType {
    case planned
    case executed
    case available
}
