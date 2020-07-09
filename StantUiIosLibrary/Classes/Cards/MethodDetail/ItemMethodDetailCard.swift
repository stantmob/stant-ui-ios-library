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
    public var separatorView: UIView?
    public var noApplicableView: UIView?
    public var noApplicableLabel: UILabel?
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configure() {
        configureView()
        configureDescriptionLabel()
        configureDetailDescriptionLabel()
        configureSeparatorView()
        configureNoApplicableView()
        configureNoApplicableLabel()
    }
    
    fileprivate func configureView() {
        view                 = UIView()
        guard let view       = view else { return }
        view.backgroundColor = .yellowLightStant
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.addSubview(view)
        
        view.anchor(leading:  self.leadingAnchor,
                    trailing: self.trailingAnchor,
                    size:     CGSize(width:  360,
                                     height: 237))
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
        detailDescriptionLabel.textColor = .darkGray
        detailDescriptionLabel.text = "Observar a eliminação de qualquer foco de umidade de modo que a superfície apresente-se seca quando da execução da pintura"
        detailDescriptionLabel.font = .systemFont(ofSize: 11)
        detailDescriptionLabel.numberOfLines = 3
        
        self.addSubview(detailDescriptionLabel)
        
        detailDescriptionLabel.anchor(top: descriptionLabel?.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 16, bottom: 0, right: 16))
    }
    
    fileprivate func configureSeparatorView() {
        separatorView = UIView()
        guard let separatorView = separatorView else { return }
        separatorView.backgroundColor = .gray
        
        self.addSubview(separatorView)
        
        separatorView.anchor(top: detailDescriptionLabel?.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0), size: CGSize(width: self.frame.width, height: 0.5))
    }
    
    fileprivate func configureNoApplicableView() {
        noApplicableView = UIView()
        guard let noApplicableView = noApplicableView else { return }
        noApplicableView.backgroundColor = .backgroundStant
        
        self.addSubview(noApplicableView)
        
        noApplicableView.anchor(top: separatorView?.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, size: CGSize(width: self.frame.width, height: 48))
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
}
