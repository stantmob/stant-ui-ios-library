//
//  SyncDialogView.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 28/05/19.
//

import UIKit

public class SyncDialogView: UIView {
    
    public var iconImageView: UIImageView?
    public var textDialogLabel: UILabel?
    public var fullProgressBarView: UIView?
    public var progressBarView: UIView?
    
    var percentageValue: CGFloat = 0
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    deinit {
        self.iconImageView       = nil
        self.textDialogLabel     = nil
        self.fullProgressBarView = nil
        self.progressBarView     = nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.lightGrayStant
    }
    
    public func set(image: UIImage, text: String, percentage: CGFloat = 0) {
        self.configureImageWith(image: image)
        self.addText(text)
        
        self.percentageValue = percentage
    }
    
    fileprivate func configureImageWith(image: UIImage) {
        iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        guard let iconImageView = iconImageView else { return }
        iconImageView.image = image
        self.addSubview(iconImageView)
        if #available(iOS 9.0, *) {
            iconImageView.anchor(top: self.topAnchor,
                                 padding: UIEdgeInsets(top: 14, left: 0, bottom: 0, right: 0),
                                 size: CGSize(width: 24, height: 24))
            iconImageView.anchorCenterX(anchorX: self.centerXAnchor)
        }
    }
    
    fileprivate func addText(_ text: String) {
        textDialogLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        
        guard let textDialogLabel = textDialogLabel else { return }
        textDialogLabel.configure(text: text, size: 16, weight: .regular, color: UIColor.darkStant)
        textDialogLabel.lineBreakMode      = .byWordWrapping
        textDialogLabel.numberOfLines      = 3
        textDialogLabel.minimumScaleFactor = 0.5
        self.addSubview(textDialogLabel)
        textDialogLabel.anchor(top: self.topAnchor,
                               leading: self.leadingAnchor,
                               bottom: self.bottomAnchor,
                               trailing: self.trailingAnchor,
                               padding: UIEdgeInsets(top: 46, left: 25, bottom: 28, right: 25))
    }

    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.addProgressBar()
    }
    
    fileprivate func addProgressBar() {
        fullProgressBarView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 5))
        
        guard let fullProgressBarView = fullProgressBarView else { return }
        fullProgressBarView.backgroundColor    = UIColor.veryLightGrayStant
        fullProgressBarView.layer.cornerRadius = 2.5
        self.addSubview(fullProgressBarView)
        
        if #available(iOS 9.0, *) {
            fullProgressBarView.anchor(leading: self.leadingAnchor,
                                       bottom: self.bottomAnchor,
                                       trailing: self.trailingAnchor,
                                       padding: UIEdgeInsets(top: 0, left: 59, bottom: 15, right: 59),
                                       size: CGSize(width: 0, height: 5))
        }
        
        self.insertProgressBarAcorddingToPercentage()
    }
    
    fileprivate func insertProgressBarAcorddingToPercentage() {
        guard let fullProgressBarView = fullProgressBarView else { return }
        
        progressBarView  = UIView(frame: fullProgressBarView.frame)
        
        guard let progressBarView = progressBarView else { return }
        progressBarView.backgroundColor    = UIColor.darkGrayStant
        progressBarView.layer.cornerRadius = 2.5
        fullProgressBarView.addSubview(progressBarView)
        
        var progressWidth = (self.frame.width - 118)
        
        if percentageValue <= 100 {
            progressWidth = progressWidth * (percentageValue / 100)
        }
        
        if #available(iOS 9.0, *) {
            progressBarView.anchor(top: fullProgressBarView.topAnchor,
                                   leading: fullProgressBarView.leadingAnchor,
                                   bottom: fullProgressBarView.bottomAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                   size: CGSize(width: progressWidth, height: 5))
        }
    }
    
}
