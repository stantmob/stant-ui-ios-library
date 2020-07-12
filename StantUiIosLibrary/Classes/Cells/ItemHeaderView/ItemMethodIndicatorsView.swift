//
//  ItemMethodIndicatorsView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 10/07/20.
//

import UIKit

public class ItemMethodIndicatorsView: UIView {
    public var approvedIndicatorView:  UIView?
    public var approvedLabel:          UILabel?
    public var reprovedIndicatorView:  UIView?
    public var reprovedLabel:          UILabel?
    public var notFilledIndicatorView: UIView?
    public var notFilledLabel:         UILabel?
    public var separatorView:          UIView?
    
    public func configure(approvedNumber: Int, reprovedNumber: Int, notFilledNumber: Int) {
        configureApprovedIndicatorView()
        configureApprovedLabel(approvedNumber: approvedNumber)
        configureReprovedIndicatorView()
        configureReprovedLabel(reprovedNumber: reprovedNumber)
        configureNotFilledIndicatorView()
        configureNotFilledLabel(notFilledNumber: notFilledNumber)
        self.addBorders(edges: [.bottom], thickness: 1, color: .lightGrayStant)
    }
    
    fileprivate func configureApprovedIndicatorView() {
        approvedIndicatorView                    = UIView()
        guard let approvedIndicatorView          = approvedIndicatorView else { return }
        approvedIndicatorView.backgroundColor    = .greenStant
        approvedIndicatorView.layer.cornerRadius = 4
        
        self.addSubview(approvedIndicatorView)
        approvedIndicatorView.anchor(top:     self.topAnchor,
                                     leading: self.leadingAnchor,
                                     padding: UIEdgeInsets(top: 15, left: 0.05 * self.frame.width, bottom: 0, right: 0),
                                     size:    CGSize(width: 8, height: 8))
        approvedIndicatorView.addBorders(edges: [.all], thickness: 1, color: .veryLightGrayStant)
    }
    
    fileprivate func configureApprovedLabel(approvedNumber: Int) {
        let text                = approvedNumber != 1 ?
                                  AppStrings.item_status_approved_label_plural :
                                  AppStrings.item_status_approved_label_plural
        
        approvedLabel           = UILabel()
        guard let approvedLabel = approvedLabel else { return }
        approvedLabel.textColor = .darkGrayStant
        approvedLabel.font      = .systemFont(ofSize: 12)
        approvedLabel.text      = "\(approvedNumber) - \(text)"
        
        self.addSubview(approvedLabel)
        approvedLabel.anchor(top:     self.topAnchor,
                             leading: approvedIndicatorView?.trailingAnchor,
                             padding: UIEdgeInsets(top: 12, left: 7, bottom: 0, right: 0))
    }
    
    fileprivate func configureReprovedIndicatorView() {
        reprovedIndicatorView                    = UIView()
        guard let reprovedIndicatorView          = reprovedIndicatorView else { return }
        reprovedIndicatorView.backgroundColor    = .redLightStant
        reprovedIndicatorView.layer.cornerRadius = 4
        
        self.addSubview(reprovedIndicatorView)
        reprovedIndicatorView.anchor(top:     self.topAnchor,
                                     leading: self.leadingAnchor,
                                     padding: UIEdgeInsets(top: 15, left: 0.4 * self.frame.width, bottom: 0, right: 0),
                                     size:    CGSize(width: 8, height: 8))
        reprovedIndicatorView.addBorders(edges: [.all], thickness: 1, color: .veryLightGrayStant)
    }
    
    fileprivate func configureReprovedLabel(reprovedNumber: Int) {
        let text                = reprovedNumber != 1 ?
                                  AppStrings.item_status_reproved_label_plural :
                                  AppStrings.item_status_reproved_label
        
        reprovedLabel           = UILabel()
        guard let reprovedLabel = reprovedLabel else { return }
        reprovedLabel.textColor = .darkGrayStant
        reprovedLabel.font      = .systemFont(ofSize: 12)
        reprovedLabel.text      = "\(reprovedNumber) - \(text)"
        
        self.addSubview(reprovedLabel)
        reprovedLabel.anchor(top:     self.topAnchor,
                             leading: reprovedIndicatorView?.trailingAnchor,
                             padding: UIEdgeInsets(top: 12, left: 7, bottom: 0, right: 0))
    }
    
    fileprivate func configureNotFilledIndicatorView() {
        notFilledIndicatorView                    = UIView()
        guard let notFilledIndicatorView          = notFilledIndicatorView else { return }
        notFilledIndicatorView.backgroundColor    = .white
        notFilledIndicatorView.layer.cornerRadius = 4
        
        self.addSubview(notFilledIndicatorView)
        notFilledIndicatorView.anchor(top:     self.topAnchor,
                                      leading: self.leadingAnchor,
                                      padding: UIEdgeInsets(top: 15, left: 0.73 * self.frame.width, bottom: 0, right: 0),
                                      size:    CGSize(width: 8, height: 8))
        notFilledIndicatorView.addBorders(edges: [.all], thickness: 1, color: .veryLightGrayStant)
    }
    
    fileprivate func configureNotFilledLabel(notFilledNumber: Int) {
        let text                 = notFilledNumber != 1 ?
                                   AppStrings.item_status_not_filled_label_plural :
                                   AppStrings.item_status_not_filled_label
        
        notFilledLabel           = UILabel()
        guard let notFilledLabel = notFilledLabel else { return }
        notFilledLabel.textColor = .darkGrayStant
        notFilledLabel.font      = .systemFont(ofSize: 12)
        notFilledLabel.text      = "\(notFilledNumber) - \(text)"
        
        self.addSubview(notFilledLabel)
        notFilledLabel.anchor(top:     self.topAnchor,
                              leading: notFilledIndicatorView?.trailingAnchor,
                              padding: UIEdgeInsets(top: 12, left: 7, bottom: 0, right: 0))
    }
}
