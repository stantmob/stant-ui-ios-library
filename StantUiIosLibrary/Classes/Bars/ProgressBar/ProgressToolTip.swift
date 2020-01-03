//
//  ProgressToolTip.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 23/12/19.
//

import UIKit

public class ProgressToolTip: UIView {
    public var progressLabel: UILabel?
    public var indicatorView: UIImageView?
    
    public var percentage: Float            = 0
    public var progressLabelHeight: CGFloat = 18
    public var progressLabelWidth: CGFloat  = 130
    public var message: String              = ""
    
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
        
        if positionIndicator <= progressLabelWidth / 2 {
            leftPadding = -5
        }
        else if(positionIndicator > progressLabelWidth / 2 && positionIndicator < self.frame.width - progressLabelWidth / 2) {
            leftPadding = positionIndicator - progressLabelWidth / 2 + 5
        } else {
            leftPadding = self.frame.width - progressLabelWidth + 5
        }
        
        self.configureProgressLabel(leftPadding: leftPadding, message: self.message)
        self.configureIndicatorView(leftPadding: positionIndicator)
    }
    
    fileprivate func configureProgressLabel(leftPadding: CGFloat, message: String) {
        progressLabel = UILabel(frame: self.frame)
        guard let progressLabel = progressLabel else { return }
        progressLabel.text               = "\((self.percentage * 100).cleanValue)% \(message)"
        progressLabel.backgroundColor    = .blueLightStant
        progressLabel.layer.cornerRadius = progressLabelHeight / 6
        progressLabel.clipsToBounds      = true
        progressLabel.textAlignment      = .center
        progressLabel.textColor          = .white
        progressLabel.font               = UIFont.boldSystemFont(ofSize: 12.0)
        
        self.addSubview(progressLabel)
        
        progressLabel.anchor(leading: self.leadingAnchor,
                             bottom:  self.bottomAnchor,
                             padding: UIEdgeInsets(top: 0, left: leftPadding, bottom: 7.5, right: 0),
                             size:    CGSize(width: progressLabelWidth, height: progressLabelHeight))
    }
    
    fileprivate func configureIndicatorView(leftPadding: CGFloat) {
        indicatorView = UIImageView(frame: self.frame)
        guard let indicatorView = indicatorView else { return }
        indicatorView.image = UIImage(named: "progressIndicator")
        
        self.addSubview(indicatorView)
        
        indicatorView.anchor(top:     progressLabel?.bottomAnchor,
                             leading: self.leadingAnchor,
                             padding: UIEdgeInsets(top: 0, left: leftPadding - 5, bottom: 3.5, right: 0),
                             size:    CGSize(width: 10, height: 5))
    }
}

extension Float {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) <= 0.00001 ? String(format: "%.0f", self) : String(format: "%.2f", self)
    }
}
