//
//  ProgressBarWithToolTip.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 18/12/19.
//

import UIKit

public class ProgressBarWithToolTip: UIView {
    public var progressToolTip: ProgressToolTip?
    public var progressBar:     UIStackView?
    public var doneBar:         UIView?
    public var remainingBar:    UIView?
    
    public var percentage: Float          = 0
    public var positionIndicator: CGFloat = 0
    public var message: String            = ""
    
    let barHeight: CGFloat = 6
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.progressToolTip = nil
        self.progressBar     = nil
    }
    
    public func configure(percentage: Float, message: String) {
        self.percentage        = percentage
        self.message           = message
        self.positionIndicator = CGFloat(percentage * Float(self.frame.width))
        
        self.configureProgressToolTip()
        self.configureProgressBar()
        self.layoutIfNeeded()
    }
    
    override public func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    fileprivate func configureProgressToolTip() {
        progressToolTip           = ProgressToolTip(frame: self.frame)
        guard let progressToolTip = progressToolTip else { return }
        
        self.addSubview(progressToolTip)
        progressToolTip.configure(percentage:        self.percentage,
                                  positionIndicator: self.positionIndicator,
                                  message:           self.message)
        
        progressToolTip.anchor(top:      self.topAnchor,
                               leading:  self.leadingAnchor,
                               bottom:   self.bottomAnchor,
                               trailing: self.trailingAnchor,
                               padding:  UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        
        progressToolTip.isHidden = true
    }
    
    fileprivate func configureProgressBar() {
        progressBar           = UIStackView()
        guard let progressBar = progressBar else { return }
        progressBar.axis      = .horizontal
        progressBar.spacing   = self.positionIndicator == self.frame.width ? 0 : 1
        
        self.addSubview(progressBar)
        progressBar.anchor(top:      progressToolTip?.bottomAnchor,
                           leading:  self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           size:     CGSize(width: 0, height: self.barHeight))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showProgress))
        progressBar.addGestureRecognizer(tap)
        
        configureDoneBar()
        configureRemainingBar()
    }
    
    fileprivate func configureDoneBar() {
        doneBar                    = UIView()
        guard let doneBar          = doneBar,
              let progressBar      = progressBar else { return }
        doneBar.backgroundColor    = .blueLightStant
        doneBar.layer.cornerRadius = self.barHeight / 2
        doneBar.clipsToBounds      = true
        
        progressBar.addArrangedSubview(doneBar)
        doneBar.anchor(top:     progressBar.topAnchor,
                       leading: progressBar.leadingAnchor,
                       bottom:  progressBar.bottomAnchor,
                       size:    CGSize(width:  self.positionIndicator == 0 ? 0.1 : self.positionIndicator,
                                       height: 0))
    }
    
    fileprivate func configureRemainingBar() {
        remainingBar                    = UIView()
        guard let remainingBar          = remainingBar,
              let progressBar           = progressBar else { return }
        remainingBar.backgroundColor    = .blueDarkStant
        remainingBar.layer.cornerRadius = self.barHeight / 2
        remainingBar.clipsToBounds      = true
        
        progressBar.addArrangedSubview(remainingBar)
        remainingBar.anchor(top:      progressBar.topAnchor,
                            bottom:   progressBar.bottomAnchor,
                            trailing: progressBar.trailingAnchor,
                            size:     CGSize(width:  progressBar.frame.width - self.positionIndicator,
                                             height: 0))
    }
    
    //This function is only used on Demo
    public func setProgress(percentage: Float) {
        self.removeSubviews(progressToolTip ?? UIView())
        self.removeSubviews(progressBar ?? UIView())
        self.configure(percentage: percentage, message: self.message)
    }
    
    @objc public func showProgress(){
        print("Bar was clicked!")
        progressToolTip?.isHidden = !progressToolTip!.isHidden
    }
}
