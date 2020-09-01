//
//  ItemObservationCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

import UIKit

public class ItemObservationCell: UITableViewCell {
    public var mainView:         UIView?
    public var observationLabel: UILabel?
    
    public static let cellHeight: CGFloat = 46
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.removeSubviews()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        self.removeSubviews()
    }
    
    public func configure(observation: String) {
        configureMainView()
        configureObservationLabel(observation: observation)
    }
    
    func configureMainView() {
        mainView           = UIView()
        guard let mainView = mainView else { return }
        
        self.addSubview(mainView)
        mainView.anchor(top:      self.topAnchor,
                        leading:  self.leadingAnchor,
                        bottom:   self.bottomAnchor,
                        trailing: self.trailingAnchor,
                        padding:  UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 15))
        
        self.updateLayout()
    }
    
    func configureObservationLabel(observation: String) {
        observationLabel               = UILabel()
        guard let observationLabel     = observationLabel,
              let mainView             = mainView else { return }
        observationLabel.numberOfLines = 3
        observationLabel.textColor     = .darkGrayStant
        observationLabel.font          = .systemFont(ofSize: 12, weight: .regular)
        observationLabel.text          = observation
        
        mainView.addSubview(observationLabel)
        observationLabel.fillSuperView()
    }
}
