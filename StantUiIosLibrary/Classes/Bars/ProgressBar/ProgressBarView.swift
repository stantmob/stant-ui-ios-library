//
//  ProgressBarView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 18/12/19.
//

import UIKit

public class ProgressBarView: UIView {
    public var progressView: UIStackView?
    public var doneBar:      UIView?
    public var remainingBar: UIView?
    
    public var percentage: Float          = 0
    public var positionIndicator: CGFloat = 0
    
    let barHeight: CGFloat = 6
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.progressView = nil
    }
    
    public func configure(percentage: Float) {
        self.percentage = percentage
        
        progressView = UIStackView(frame: self.frame)
        
        guard let progressView = progressView else { return }
        progressView.axis    = .horizontal
        progressView.spacing = 1
        
        self.addSubview(progressView)
        self.configureProgressView()
    }
    
    fileprivate func configureProgressView() {
        guard let progressView = progressView else { return }
        
        progressView.anchor(leading:  self.leadingAnchor,
                            bottom:   self.bottomAnchor,
                            trailing: self.trailingAnchor,
                            size:     CGSize(width: self.frame.width, height: barHeight))
        self.setProgress(percentage: percentage)
    }
    
    fileprivate func configureDoneBar() {
        doneBar = UIView()
        
        guard let doneBar      = doneBar else { return }
        guard let progressView = progressView else { return }
        
        doneBar.backgroundColor    = .blueLightStant
        doneBar.layer.cornerRadius = barHeight / 2
        doneBar.clipsToBounds      = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showProgress))
        doneBar.addGestureRecognizer(tap)
        
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showProgress))
        remainingBar.addGestureRecognizer(tap)
        
        progressView.addArrangedSubview(remainingBar)
        remainingBar.anchor(top:      progressView.topAnchor,
                            bottom:   progressView.bottomAnchor,
                            trailing: progressView.trailingAnchor,
                            size:     CGSize(width:  progressView.frame.width - self.positionIndicator,
                                             height: progressView.frame.height))
    }
    
    public func setProgress(percentage: Float) {
        guard let progressView = progressView else { return }
        self.percentage        = percentage
        self.positionIndicator = CGFloat(percentage * Float(progressView.frame.width))
        
        progressView.removeSubviews()
        configureDoneBar()
        configureRemainingBar()
    }
    
    @objc public func showProgress(){
        print("Bar was clicked!")
    }
}
