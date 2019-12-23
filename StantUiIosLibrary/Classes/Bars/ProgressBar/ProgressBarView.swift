//
//  ProgressBarView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 18/12/19.
//

import UIKit

public class ProgressBarView: UIView {
    public var progressBubble: ProgressBubble?
    public var progressView:   UIStackView?
    public var doneBar:        UIView?
    public var remainingBar:   UIView?
    
    public var percentage: Float            = 0
    public var positionIndicator: CGFloat   = 0
    public var message: String              = ""
    
    let barHeight: CGFloat = 6
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.progressBubble = nil
        self.progressView   = nil
    }
    
    public func configure(percentage: Float, message: String) {
        self.percentage = percentage
        self.message    = message
        
        self.configureProgressBubble(message: self.message)
        self.configureProgressView()
    }
    
    fileprivate func configureProgressBubble(message: String) {
        progressBubble = ProgressBubble(frame: self.frame)
        
        guard let progressBubble = progressBubble else { return }
        self.addSubview(progressBubble)
        progressBubble.configure(percentage:        percentage,
                                 positionIndicator: positionIndicator,
                                 message:           message)
        
        progressBubble.anchor(top:      self.topAnchor,
                              leading:  self.leadingAnchor,
                              bottom:   self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding:  UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        
        progressBubble.isHidden = true
    }
    
    fileprivate func configureProgressView() {
        progressView = UIStackView(frame: self.frame)
        
        guard let progressView = progressView else { return }
        progressView.axis      = .horizontal
        progressView.spacing   = 1
        
        self.addSubview(progressView)
        
        progressView.anchor(top:      progressBubble?.bottomAnchor,
                            leading:  self.leadingAnchor,
                            trailing: self.trailingAnchor,
                            size:     CGSize(width: self.frame.width, height: barHeight))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showProgress))
        progressView.addGestureRecognizer(tap)

        configureDoneBar()
        configureRemainingBar()
    }
    
    fileprivate func configureDoneBar() {
        doneBar = UIView()
        
        guard let doneBar      = doneBar else { return }
        guard let progressView = progressView else { return }
        
        doneBar.backgroundColor    = .blueLightStant
        doneBar.layer.cornerRadius = barHeight / 2
        doneBar.clipsToBounds      = true
        
        progressView.addArrangedSubview(doneBar)
        doneBar.anchor(top:     progressView.topAnchor,
                       leading: progressView.leadingAnchor,
                       bottom:  progressView.bottomAnchor,
                       size:    CGSize(width:  self.positionIndicator,
                                       height: progressView.frame.height))
    }
    
    fileprivate func configureRemainingBar() {
        remainingBar = UIView()
        
        guard let remainingBar = remainingBar else { return }
        guard let progressView = progressView else { return }
        
        remainingBar.backgroundColor    = .blueDarkStant
        remainingBar.layer.cornerRadius = barHeight / 2
        remainingBar.clipsToBounds      = true
        
        progressView.addArrangedSubview(remainingBar)
        remainingBar.anchor(top:      progressView.topAnchor,
                            bottom:   progressView.bottomAnchor,
                            trailing: progressView.trailingAnchor,
                            size:     CGSize(width:  progressView.frame.width - self.positionIndicator,
                                             height: progressView.frame.height))
    }
    
    public func setProgress(percentage: Float) {
        self.removeSubviews(progressBubble ?? UIView())
        self.removeSubviews(progressView ?? UIView())
        
        guard let progressView = progressView else { return }
        self.percentage        = percentage
        self.positionIndicator = CGFloat(percentage * Float(progressView.frame.width))
        self.configure(percentage: percentage, message: self.message)
    }
    
    @objc public func showProgress(){
        print("Bar was clicked!")
        progressBubble?.isHidden = false
    }
}
