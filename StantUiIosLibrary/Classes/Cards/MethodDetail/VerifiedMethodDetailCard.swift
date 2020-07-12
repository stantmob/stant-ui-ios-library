//
//  VerifiedMethodDetailView.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 7/7/20.
//

import UIKit

public class VerifiedMethodDetailView: UIView {
    public var view:                       UIView?
    public var descriptionLabel:           UILabel?
    public var methodItemDescriptionLabel: UILabel?
    public var upperSeparator:             UIView?
    public var lowerSeparator:             UIView?
    public var notApplicableView:          UIView?
    public var notApplicableLabel:         UILabel?
    public var notApplicableSwitch:        UISwitch?
    public var approveButton:              UIButton?
    public var reproveButton:              UIButton?
    public var inspectionLabel:            UILabel?
    public var delegate:                   VerifiedMethodDetailViewDelegate?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configure(delegate:              VerifiedMethodDetailViewDelegate,
                          methodItemDescription: String) {
        self.delegate = delegate
        self.removeSubviews()
        addShadow()
        configureView()
        configureDescriptionLabel()
        configureMethodItemDescriptionLabel(methodItemDescription: methodItemDescription)
        configureUpperNotApplicableViewSeparator()
        configureNotApplicableView()
        configureNotApplicableLabel()
        configureNotApplicableSwitch()
        configureLowerNotApplicableViewSeparator()
        configureApprovedButton()
        configureReprovedButton()
        configureInspectionLabel()
    }
    
    fileprivate func configureView() {
        view                 = UIView()
        guard let view       = view else { return }
        view.backgroundColor = .white
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.addSubview(view)
        view.anchor(leading:  self.leadingAnchor,
                    trailing: self.trailingAnchor,
                    size:     CGSize(width:  360,
                                     height: 260))
    }
    
    fileprivate func configureDescriptionLabel() {
        descriptionLabel                 = UILabel()
        guard let descriptionLabel       = descriptionLabel else { return }
        descriptionLabel.backgroundColor = .white
        descriptionLabel.textColor       = .darkStant
        descriptionLabel.text            = AppStrings.verified_method_details_description_label
        descriptionLabel.font            = .systemFont(ofSize: 16)
        
        self.addSubview(descriptionLabel)
        descriptionLabel.anchor(top:     self.topAnchor,
                                leading: self.leadingAnchor,
                                padding: UIEdgeInsets(top:    16,
                                                      left:   16,
                                                      bottom: 0,
                                                      right:  0))
    }
    
    fileprivate func configureMethodItemDescriptionLabel(methodItemDescription: String) {
        methodItemDescriptionLabel                 = UILabel()
        guard let methodItemDescriptionLabel       = methodItemDescriptionLabel else { return }
        methodItemDescriptionLabel.backgroundColor = .white
        methodItemDescriptionLabel.textColor       = .darkGrayStant
        methodItemDescriptionLabel.text            = methodItemDescription
        methodItemDescriptionLabel.font            = .systemFont(ofSize: 11)
        methodItemDescriptionLabel.numberOfLines   = 0
        methodItemDescriptionLabel.lineBreakMode   = NSLineBreakMode.byWordWrapping
        methodItemDescriptionLabel.sizeToFit()
        
        self.addSubview(methodItemDescriptionLabel)
        methodItemDescriptionLabel.anchor(top:      descriptionLabel?.bottomAnchor,
                                          leading:  self.leadingAnchor,
                                          trailing: self.trailingAnchor,
                                          padding:  UIEdgeInsets(top:    5,
                                                                 left:   16,
                                                                 bottom: 0,
                                                                 right:  16))
    }
    
    fileprivate func configureUpperNotApplicableViewSeparator() {
        upperSeparator                 = UIView()
        guard let  upperSeparator      = upperSeparator else { return }
        upperSeparator.backgroundColor = .grayStant
        
        self.addSubview(upperSeparator)
        upperSeparator.anchor(top:      methodItemDescriptionLabel?.bottomAnchor,
                              leading:  self.leadingAnchor,
                              trailing: self.trailingAnchor,
                              padding:  UIEdgeInsets(top:    16,
                                                     left:   0,
                                                     bottom: 0,
                                                     right:  0),
                              size:     CGSize(width:  0,
                                               height: 1))
    }
    
    fileprivate func configureLowerNotApplicableViewSeparator() {
        lowerSeparator                 = UIView()
        guard let  lowerSeparator      = lowerSeparator else { return }
        lowerSeparator.backgroundColor = .grayStant
        
        self.addSubview(lowerSeparator)
        lowerSeparator.anchor(top:      notApplicableLabel?.bottomAnchor,
                              leading:  self.leadingAnchor,
                              trailing: self.trailingAnchor,
                              padding:  UIEdgeInsets(top:    13,
                                                    left:    0,
                                                    bottom:  0,
                                                    right:   0),
                              size: CGSize(width:  0,
                                           height: 1))
    }
    
    fileprivate func configureNotApplicableView() {
        notApplicableView                 = UIView()
        guard let notApplicableView       = notApplicableView else { return }
        notApplicableView.backgroundColor = .backgroundStant
        
        self.addSubview(notApplicableView)
        notApplicableView.anchor(top:      upperSeparator?.bottomAnchor,
                                 leading:  self.leadingAnchor,
                                 trailing: self.trailingAnchor,
                                 size:     CGSize(width: self.frame.width,
                                                  height: 48))
    }
    
    fileprivate func configureNotApplicableLabel() {
        notApplicableLabel                 = UILabel()
        guard let notApplicableLabel       = notApplicableLabel else { return }
        notApplicableLabel.backgroundColor = .white
        notApplicableLabel.textColor       = .darkStant
        notApplicableLabel.text            = AppStrings.verified_method_details_not_applicable_label
        notApplicableLabel.font            = .systemFont(ofSize: 16)
        
        self.addSubview(notApplicableLabel)
        notApplicableLabel.anchor(top:     notApplicableView?.topAnchor,
                                  leading: notApplicableView?.leadingAnchor,
                                  bottom:  notApplicableView?.bottomAnchor,
                                  padding: UIEdgeInsets(top:    15,
                                                        left:   16,
                                                        bottom: 14,
                                                        right:  0))
    }
    
    fileprivate func configureNotApplicableSwitch() {
        notApplicableSwitch           = UISwitch()
        guard let notApplicableSwitch = notApplicableSwitch else { return }
        
        self.addSubview(notApplicableSwitch)
        notApplicableSwitch.anchor(top:      notApplicableView?.topAnchor,
                                   bottom:   notApplicableView?.bottomAnchor,
                                   trailing: notApplicableView?.trailingAnchor,
                                   padding:  UIEdgeInsets(top:    8,
                                                          left:   0,
                                                          bottom: 8,
                                                          right:  16),
                                   size:     CGSize(width:  51,
                                                    height: 31))
        
        notApplicableSwitch.addTarget(self, action: #selector(toggleButtons), for: UIControl.Event.valueChanged)
    }
    
    fileprivate func configureApprovedButton() {
        approveButton                    = UIButton()
        guard let approveButton          = approveButton else { return }
        approveButton.titleLabel?.font   = .systemFont(ofSize: 12, weight: .bold)
        approveButton.backgroundColor    = .greenStant
        approveButton.layer.cornerRadius = 3
        
        self.addSubview(approveButton)
        approveButton.anchor(top:     notApplicableView?.bottomAnchor,
                             leading: self.leadingAnchor,
                             padding: UIEdgeInsets(top:    16,
                                                   left:   34,
                                                   bottom: 0 ,
                                                   right:  0),
                             size:    CGSize(width:  140,
                                             height: 50))
        
        approveButton.addTarget(delegate, action: #selector(delegate?.goToAddApproveInspectionData), for: .touchUpInside)
        approveButton.setTitle(AppStrings.verified_method_details_approved_title_button.uppercased(), for: .normal)
        approveButton.setTitleColor(.white, for: .normal)
        
        makeShadow(button: approveButton)
    }
    
    fileprivate func configureReprovedButton() {
        reproveButton                    = UIButton()
        guard let reproveButton          = reproveButton else { return }
        reproveButton.titleLabel?.font   = .systemFont(ofSize: 12, weight: .bold)
        reproveButton.backgroundColor    = .redLightStant
        reproveButton.layer.cornerRadius = 3
        
        self.addSubview(reproveButton)
        reproveButton.anchor(top:      notApplicableView?.bottomAnchor,
                             trailing: self.trailingAnchor,
                             padding:  UIEdgeInsets(top:    16,
                                                    left:   0,
                                                    bottom: 0 ,
                                                    right:  34),
                             size:     CGSize(width:  140,
                                              height: 50))
        
        reproveButton.addTarget(delegate, action: #selector(delegate?.goToAddReproveInspectionData), for: .touchUpInside)
        reproveButton.setTitle(AppStrings.verified_method_details_reproved_title_button.uppercased(), for: .normal)
        reproveButton.setTitleColor(.white, for: .normal)
        
        makeShadow(button: reproveButton)
    }
    
    fileprivate func configureInspectionLabel() {
        inspectionLabel                 = UILabel()
        guard let inspectionLabel       = inspectionLabel else { return }
        inspectionLabel.backgroundColor = .white
        inspectionLabel.font            = .systemFont(ofSize: 12, weight: .bold)
        inspectionLabel.text            = AppStrings.verified_method_details_inspections_label
        inspectionLabel.textColor       = .darkGrayStant
        inspectionLabel.textAlignment   = .center
        
        self.addSubview(inspectionLabel)
        inspectionLabel.anchor(top:      approveButton?.bottomAnchor,
                               leading:  self.leadingAnchor,
                               bottom:   view?.bottomAnchor,
                               trailing: self.trailingAnchor,
                               padding:  UIEdgeInsets(top:    15,
                                                      left:   152,
                                                      bottom: 8,
                                                      right:  152))
    }
    
    @objc public func toggleButtons() {
        guard let approveButton = approveButton, let reproveButton = reproveButton  else { return}
        
        if (!notApplicableSwitch!.isOn) {
            approveButton.removeTarget(self, action: #selector(warningAction), for: .touchUpInside)
            approveButton.addTarget(delegate, action: #selector(delegate?.goToAddApproveInspectionData), for: .touchUpInside)
            approveButton.backgroundColor = .greenStant
            reproveButton.removeTarget(self, action: #selector(warningAction), for: .touchUpInside)
            reproveButton.addTarget(delegate, action: #selector(delegate?.goToAddReproveInspectionData), for: .touchUpInside)
            reproveButton.backgroundColor = .redLightStant
        } else {
            approveButton.removeTarget(delegate, action: #selector(delegate?.goToAddApproveInspectionData), for: .touchUpInside)
            approveButton.addTarget(self, action: #selector(warningAction), for: .touchUpInside)
            approveButton.backgroundColor = .darkGrayStant
            reproveButton.removeTarget(delegate, action: #selector(delegate?.goToAddReproveInspectionData), for: .touchUpInside)
            reproveButton.addTarget(self, action: #selector(warningAction), for: .touchUpInside)
            reproveButton.backgroundColor = .darkGrayStant
        }
    }
    
    @objc func warningAction() {
        let alert = UIAlertController(title:          AppStrings.verified_method_details_warning_title_action,
                                      message:        AppStrings.verified_method_details_warning_message_action,
                                      preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title:   AppStrings.verified_method_details_warning_button_ok ,
                                          style:   .default,
                                          handler: nil))
            
            if let present = delegate {
                   present.present(alert: alert)
            }
    }

    fileprivate func addShadow() {
        self.layer.applySketchShadow(color:  .shadowStant,
                                     alpha:  0.09,
                                     x:      0,
                                     y:      3,
                                     blur:   8,
                                     spread: 0)
    }
    
    public func makeShadow(button: UIButton) {
        button.layer.shadowPath    = UIBezierPath(rect: button.bounds).cgPath
        button.layer.shadowRadius  = 4
        button.layer.shadowOffset  = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 0.1
    }
}

@objc public protocol VerifiedMethodDetailViewDelegate {
    @objc func goToAddApproveInspectionData()
    @objc func goToAddReproveInspectionData()
    @objc func present(alert: UIAlertController)
}
