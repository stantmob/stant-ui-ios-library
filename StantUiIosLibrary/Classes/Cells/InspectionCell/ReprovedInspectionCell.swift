//
//  ReprovedInspectionCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public class ReprovedInspectionCell: UITableViewCell {
    public var statusBadge: CellBadge?
    public var delegate:    InspectionCellButtonDelegate?
    
    public static let cellHeight: CGFloat = 137
    
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
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0)
        bounds      = bounds.inset(by: padding)
    }
    
    public func configure(delegate:        InspectionCellButtonDelegate,
                          severity:        Int,
                          deadLine:        Date,
                          descriptionText: String) {
        self.delegate = delegate
        
    }
}
