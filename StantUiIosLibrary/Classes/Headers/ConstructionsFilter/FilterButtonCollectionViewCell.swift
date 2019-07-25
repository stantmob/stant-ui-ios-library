//
//  FilterButtonCollectionViewCell.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/05/19.
//

import UIKit

public class FilterButtonCollectionViewCell: UICollectionViewCell {
    
    public static let IDENTIFIER = "FilterButtonCollectionViewCellIdentifier"
    
    public var mainButton: UIButton?
    public weak var cellDelegate: FilterCellDelegate?
    private var currentFilterButton: FilterButton?
    
    public func configureCell(button: FilterButton) {
        mainButton          = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 28))
        currentFilterButton = button
        
        guard let mainButton = mainButton else { return }
        mainButton.backgroundColor           = UIColor.lightGrayStant
        mainButton.layer.cornerRadius        = 3.0
        
        mainButton.setTitle(button.title ?? "", for: .normal)
        mainButton.setTitleColor(UIColor.darkGrayStant, for: .normal)
        mainButton.contentHorizontalAlignment = .center
        mainButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        
        guard let action = button.action else { return }
        mainButton.addTarget(button.target, action: action, for: .touchUpInside)
        
        self.addSubview(mainButton)
        mainButton.anchor(top: superview?.topAnchor,
                          leading: superview?.leadingAnchor,
                          bottom: superview?.bottomAnchor,
                          trailing: superview?.trailingAnchor,
                          padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                          size: CGSize(width: 90, height: 28))
    }
    
    public func changeButtonStyle() {
        guard let mainButton = mainButton else { return }
        
        if mainButton.backgroundColor == UIColor.lightGrayStant {
            mainButton.setTitleColor(UIColor.white, for: .normal)
            mainButton.backgroundColor = UIColor.orangeStant
            cellDelegate?.changeIconOfFixedUIView(amountToAdd: 1)
        } else {
            mainButton.setTitleColor(UIColor.darkGrayStant, for: .normal)
            mainButton.backgroundColor = UIColor.lightGrayStant
            cellDelegate?.changeIconOfFixedUIView(amountToAdd: -1) 
        }
        
    }
}

public protocol FilterCellDelegate: class {
    func changeIconOfFixedUIView(amountToAdd: Int)
}

