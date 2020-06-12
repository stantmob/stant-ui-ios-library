//
//  ItemObservationCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

import UIKit

public class ItemObservationCell: UITableViewCell {
    var observationLabel: UILabel?
    
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
    
    public func configure(observation: String) {
        observationLabel               = UILabel()
        guard let observationLabel     = observationLabel else { return }
        observationLabel.numberOfLines = 3
        observationLabel.textColor     = .darkGrayStant
        observationLabel.font          = .systemFont(ofSize: 12, weight: .regular)
        observationLabel.text          = observation
        
        self.addSubview(observationLabel)
        observationLabel.fillSuperView()
    }
}
