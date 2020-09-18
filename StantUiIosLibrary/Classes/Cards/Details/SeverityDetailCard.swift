//
//  SeverityDetailCard.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 15/09/20.
//

import UIKit

public class SeverityDetailCard: UIView {
    var titleLabel:         UILabel?
    var severityLevelLabel: UILabel?
    var severityLevelView:  SeverityLevelView?
    
    public func configure(title:         String,
                          severityLevel: String,
                          severity:      Int) {
        
        configureTitleLabel(title: title)
        configureSeverityLevelLabel(severityLevel: severityLevel)
        configureSeverityLevelView(severity: severity)
    }
    
    func configureTitleLabel(title: String) {
        titleLabel           = UILabel()
        guard let titleLabel = titleLabel else { return }
        
        titleLabel.configure(text:      title,
                             alignment: .left,
                             size:      16,
                             weight:    .regular,
                             color:     .darkStant)
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top:      self.topAnchor,
                          leading:  self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16))
    }
    
    func configureSeverityLevelLabel(severityLevel: String) {
        severityLevelLabel           = UILabel()
        guard let severityLevelLabel = severityLevelLabel else { return }
        
        severityLevelLabel.configure(text:      severityLevel,
                                     alignment: .left,
                                     size:      12,
                                     weight:    .regular,
                                     color:     .darkGrayStant)
        
        self.addSubview(severityLevelLabel)
        severityLevelLabel.anchor(top:     titleLabel?.bottomAnchor,
                                  leading: self.leadingAnchor,
                                  padding: UIEdgeInsets(top: 6, left: 16, bottom: 0, right: 0))
    }
    
    func configureSeverityLevelView(severity: Int) {
        severityLevelView           = SeverityLevelView()
        guard let severityLevelView = severityLevelView else { return }
        
        self.addSubview(severityLevelView)
        severityLevelView.anchor(top:      titleLabel?.bottomAnchor,
                                 leading:  severityLevelLabel?.trailingAnchor,
                                 padding:  UIEdgeInsets(top: 10, left: 6, bottom: 0, right: 0),
                                 size:     CGSize(width: 56, height: 8))
        
        severityLevelView.configure(severity: severity)
    }
}
