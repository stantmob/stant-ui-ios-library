//
//  FispCard.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 08/01/20.
//

import UIKit

public class FispCard: UIView {
    public var percentageLabel: UILabel?
    public var messageLabel:    UILabel?
    public var quanityLabel:    UILabel?
    
    public var percentage:   Float = 0
    public var message:      String   = ""
    public var quantity:     Float = 0
    private var shadowLayer: CAShapeLayer?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override public func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    public func configureLabels(percentage: Float, quantity: Float, message: String, type: CardType) {
        self.percentage = percentage
        self.message    = message
        self.quantity   = quantity
        
        self.configurePercentageLabel(type: type)
        self.configureMessageLabel(message: message)
        self.configureQuantityLabel(quantity: quantity)
    }
    
    public func configurePercentageLabel(type: CardType) {
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
    
    public func configureMessageLabel(message: String) {
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
    
    public func configureQuantityLabel(quantity: Float) {
        quanityLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        guard let quanityLabel = quanityLabel else { return }
        quanityLabel.text          = "\(String(format: "%.2f", quantity)) m²"
        quanityLabel.textColor     = .black
        quanityLabel.font          = UIFont.systemFont(ofSize: 14.0)
        quanityLabel.textAlignment = .center
        
        self.addSubview(quanityLabel)
        
        quanityLabel.anchor(bottom:  self.bottomAnchor,
                            padding: UIEdgeInsets(top: 0, left: 0, bottom: 11, right: 0))
        
        quanityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    public func makeShadow() {
        self.layer.shadowPath    = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.1
    }
    
    public func renewLabels(executedPercentage: Float, quantity: Float, message: String, type: CardType) {
        self.backgroundColor = .white
        self.layoutIfNeeded()
        
        self.removeSubviews(self.percentageLabel ?? UILabel())
        self.removeSubviews(self.messageLabel ?? UILabel())
        self.removeSubviews(self.quanityLabel ?? UILabel())
        
        self.configureLabels(percentage: executedPercentage,
                             quantity:   quantity,
                             message:    message,
                             type:       type)
    }
}

public enum CardType {
    case planned
    case executed
    case available
}
