//
//  VerifiedMethodCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/06/20.
//

import UIKit

public class VerifiedMethodCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        
    }
}

public enum MethodStatusEnum: Int {
    case notApplicable = 3, approved = 2, reproved = 1, notInspected = 0
}
