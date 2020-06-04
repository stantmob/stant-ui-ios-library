//
//  CustomTabViewCell.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 29/05/20.
//

import UIKit

public class CustomTabViewCell: UICollectionViewCell {
    public var label:        UILabel?
    public var bottomBorder: UIView?

    public override var isSelected: Bool {
        didSet {
            let color              = isSelected ? UIColor.orangeStant : UIColor.darkGrayStant
            label?.textColor       = color
            bottomBorder?.isHidden = !isSelected
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLabel()
        configureBottomBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        label               = UILabel()
        guard let label     = label else { return }
        label.textAlignment = .center
        label.textColor     = .darkGrayStant
        label.font          = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        self.addSubview(label)
        label.fillSuperView()
    }
    
    func configureBottomBorder() {
        bottomBorder                 = UIView()
        guard let bottomBorder       = bottomBorder else { return }
        bottomBorder.backgroundColor = .orangeStant
        bottomBorder.isHidden        = true
        
        self.addSubview(bottomBorder)
        bottomBorder.anchor(leading:  self.leadingAnchor,
                            bottom:   self.bottomAnchor,
                            trailing: self.trailingAnchor,
                            size:     CGSize(width: self.frame.width, height: 2))
    }
    
}
