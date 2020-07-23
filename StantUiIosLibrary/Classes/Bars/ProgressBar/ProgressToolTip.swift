//
//  ProgressToolTip.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 23/12/19.
//

import UIKit

public class ProgressToolTip: UIView {
    public var progressLabel: UILabel?
    public var indicatorView: UIImageView?
    
    public var percentage:          Float   = 0
    public var progressLabelHeight: CGFloat = 18
    public var progressLabelWidth:  CGFloat = 103
    public var message:             String  = ""
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configure(percentage: Float, positionIndicator: CGFloat, message: String) {
        self.message    = message
        self.percentage = percentage
        var leftPadding: CGFloat = 0
        
        if positionIndicator <= self.progressLabelWidth / 2 {
            leftPadding = -5
        } else if(self.progressLabelWidth / 2)...(self.frame.width - self.progressLabelWidth / 2) ~= positionIndicator {
            leftPadding = positionIndicator - self.progressLabelWidth / 2
        } else {
            leftPadding = self.frame.width - self.progressLabelWidth + 5
        }
        
        self.configureProgressLabel(leftPadding: leftPadding, message: self.message)
        self.configureIndicatorView(leftPadding: positionIndicator)
    }
    
    fileprivate func configureProgressLabel(leftPadding: CGFloat, message: String) {
        progressLabel           = UILabel(frame: self.frame)
        guard let progressLabel = progressLabel else { return }
        let attributedText      = NSMutableAttributedString().bold("\((self.percentage * 100).cleanValue)%").normal(" \(message)")
        
        progressLabel.attributedText     = attributedText
        progressLabel.backgroundColor    = .blueLightStant
        progressLabel.layer.cornerRadius = self.progressLabelHeight / 6
        progressLabel.clipsToBounds      = true
        progressLabel.textAlignment      = .center
        progressLabel.textColor          = .white
        
        self.addSubview(progressLabel)
        
        progressLabel.anchor(leading: self.leadingAnchor,
                             bottom:  self.bottomAnchor,
                             padding: UIEdgeInsets(top: 0, left: leftPadding, bottom: 7.5, right: 0),
                             size:    CGSize(width: self.progressLabelWidth, height: self.progressLabelHeight))
    }
    
    fileprivate func configureIndicatorView(leftPadding: CGFloat) {
        indicatorView           = UIImageView(frame: self.frame)
        guard let indicatorView = indicatorView else { return }
        indicatorView.image     = UIImage(named: "progressIndicator")
        
        self.addSubview(indicatorView)
        
        indicatorView.anchor(top:     progressLabel?.bottomAnchor,
                             leading: self.leadingAnchor,
                             padding: UIEdgeInsets(top: 0, left: leftPadding - 5, bottom: 3.5, right: 0),
                             size:    CGSize(width: 10, height: 5))
    }
}
