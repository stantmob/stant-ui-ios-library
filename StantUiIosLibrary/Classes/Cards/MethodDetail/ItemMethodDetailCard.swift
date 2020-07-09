//
//  ItemMethodDetailCard.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 7/7/20.
//

import UIKit

public class ItemMethodDetailCard: UIView {
    public var view: UIView?
    public var descriptionLabel: UILabel?
    public var detailDescriptionLabel: UILabel?
    public var upperSeparator: UIView?
    public var lowerSeparator: UIView?
    public var noApplicableView: UIView?
    public var noApplicableLabel: UILabel?
    public var noApllicableSwitch: UISwitch?
    public var approveButton: UIButton?
    public var repproveButton: UIButton?
    public var inspectionLabel: UILabel?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configure() {
        self.removeSubviews()
        addShadow()
        configureView()
        configureDescriptionLabel()
        configureDetailDescriptionLabel()
        configureUpperNoApplicableViewSeparator()
        configureNoApplicableView()
        configureNoApplicableLabel()
        configureNoApllicableSwitch()
        configureLowerNoApplicableViewSeparator()
        configureApprovedButton()
        configureRepprovedButton()
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
        descriptionLabel = UILabel()
        guard let descriptionLabel = descriptionLabel else { return }
        descriptionLabel.backgroundColor = .white
        descriptionLabel.textColor = .darkStant
        descriptionLabel.text = "Descrição"
        descriptionLabel.font = .systemFont(ofSize: 16)
        
        self.addSubview(descriptionLabel)
        
        descriptionLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0))
    }
    
    fileprivate func configureDetailDescriptionLabel() {
        detailDescriptionLabel = UILabel()
        guard let detailDescriptionLabel = detailDescriptionLabel else { return }
        detailDescriptionLabel.backgroundColor = .white
        detailDescriptionLabel.textColor = .darkGrayStant
        detailDescriptionLabel.text = "Observar a eliminação de qualquer foco de umidade de modo que a superfície apresente-se seca quando da execução da pintura"
        detailDescriptionLabel.font = .systemFont(ofSize: 11)
        detailDescriptionLabel.numberOfLines = 3
        
        self.addSubview(detailDescriptionLabel)
        
        detailDescriptionLabel.anchor(top: descriptionLabel?.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 16, bottom: 0, right: 16))
    }
    
    fileprivate func configureUpperNoApplicableViewSeparator() {
        upperSeparator = UIView()
        guard let  upperSeparator = upperSeparator else { return }
        upperSeparator.backgroundColor = .grayStant
        
        self.addSubview(upperSeparator)
        
        upperSeparator.anchor(top: detailDescriptionLabel?.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 1))
    }
    
    fileprivate func configureLowerNoApplicableViewSeparator() {
        lowerSeparator = UIView()
        guard let  lowerSeparator = lowerSeparator else { return }
        lowerSeparator.backgroundColor = .grayStant
        
        self.addSubview(lowerSeparator)
        
        lowerSeparator.anchor(top: noApplicableLabel?.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 13, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 1))
    }
    
    fileprivate func configureNoApplicableView() {
        noApplicableView = UIView()
        guard let noApplicableView = noApplicableView else { return }
        noApplicableView.backgroundColor = .backgroundStant
        
        self.addSubview(noApplicableView)
        
        noApplicableView.anchor(top: upperSeparator?.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, size: CGSize(width: self.frame.width, height: 48))
    }
    
    fileprivate func configureNoApplicableLabel() {
        noApplicableLabel = UILabel()
        guard let noApplicableLabel = noApplicableLabel else { return }
        noApplicableLabel.backgroundColor = .white
        noApplicableLabel.textColor = .darkStant
        noApplicableLabel.text = "Não Aplicável"
        noApplicableLabel.font = .systemFont(ofSize: 16)
        
        self.addSubview(noApplicableLabel)
        
        noApplicableLabel.anchor(top: noApplicableView?.topAnchor, leading: noApplicableView?.leadingAnchor, bottom: noApplicableView?.bottomAnchor, padding: UIEdgeInsets(top: 15, left: 16, bottom: 14, right: 0))
    }
    
    fileprivate func configureNoApllicableSwitch() {
        noApllicableSwitch = UISwitch()
        guard let noApllicableSwitch = noApllicableSwitch else { return }
        
        self.addSubview(noApllicableSwitch)
        
        noApllicableSwitch.anchor(top: noApplicableView?.topAnchor, bottom: noApplicableView?.bottomAnchor, trailing: noApplicableView?.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 0, bottom: 14, right: 16), size: CGSize(width: 51, height: 31))
    }
    
    fileprivate func configureApprovedButton() {
        approveButton = UIButton()
        guard let approveButton = approveButton else { return }
        approveButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        approveButton.backgroundColor = .greenStant
        approveButton.layer.cornerRadius = 3
        
        self.addSubview(approveButton)
        approveButton.anchor(top: noApplicableView?.bottomAnchor, leading: self.leadingAnchor, padding: UIEdgeInsets(top: 16, left: 34, bottom: 0 , right: 0), size: CGSize(width: 140, height: 50))
        
        approveButton.setTitle("APROVAR", for: .normal)
        approveButton.setTitleColor(.white, for: .normal)
    }
    
    fileprivate func configureRepprovedButton() {
        repproveButton = UIButton()
        guard let repproveButton = repproveButton else { return }
        repproveButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        repproveButton.backgroundColor = .redLightStant
        repproveButton.layer.cornerRadius = 3
        
        self.addSubview(repproveButton)
        repproveButton.anchor(top: noApplicableView?.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0 , right: 34), size: CGSize(width: 140, height: 50))
        
        repproveButton.setTitle("REPROVAR", for: .normal)
        repproveButton.setTitleColor(.white, for: .normal)
    }
    
    fileprivate func configureInspectionLabel() {
        inspectionLabel = UILabel()
        guard let inspectionLabel = inspectionLabel else { return }
        inspectionLabel.backgroundColor = .white
        inspectionLabel.font = .systemFont(ofSize: 12, weight: .bold)
        inspectionLabel.text = "Inspeções"
        inspectionLabel.textColor = .darkGrayStant
        inspectionLabel.textAlignment = .center
        
        self.addSubview(inspectionLabel)
        inspectionLabel.anchor(top: approveButton?.bottomAnchor, leading: self.leadingAnchor, bottom: view?.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 152, bottom: 8, right: 152))
    }
    
    fileprivate func addShadow() {
        self.layer.applySketchShadow(color:  .shadowStant,
                                     alpha:  0.09,
                                     x:      0,
                                     y:      3,
                                     blur:   8,
                                     spread: 0)
    }
    
    public func makeShadow() {
        self.layer.shadowPath    = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowRadius  = 4
        self.layer.shadowOffset  = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.1
    }
    
}
