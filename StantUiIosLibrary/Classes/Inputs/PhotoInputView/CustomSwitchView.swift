//
//  CustomSwitchView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 09/09/20.
//

import UIKit

public class CustomSwitchView: UIView {
    public var switchTitleLabel: UILabel?
    public var customSwitch:     UISwitch?
    public var defaultValue:     Bool = false
    
    public func configure(switchLabel: String, defaultValue: Bool = false) {
        self.defaultValue    = defaultValue
        self.backgroundColor = .backgroundStant
        
        self.addBorders(edges:     [.top, .bottom],
                        thickness: 1,
                        color:     .grayStant)
        
        configureSwitchTitleLabel(switchLabel: switchLabel)
        configureCustomSwitch()
    }
    
    func configureSwitchTitleLabel(switchLabel: String) {
        switchTitleLabel           = UILabel()
        guard let switchTitleLabel = switchTitleLabel else { return }
        switchTitleLabel.font      = .systemFont(ofSize: 16, weight: .regular)
        switchTitleLabel.text      = switchLabel
        
        self.addSubview(switchTitleLabel)
        switchTitleLabel.anchor(leading: self.leadingAnchor,
                                padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0))
        switchTitleLabel.anchorCenterY(anchorY: self.centerYAnchor)
    }
    
    func configureCustomSwitch() {
        customSwitch           = UISwitch()
        guard let customSwitch = customSwitch else { return }
        
        customSwitch.setOn(defaultValue, animated: true)
        
        self.addSubview(customSwitch)
        customSwitch.anchor(trailing: self.trailingAnchor,
                            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16))
        customSwitch.anchorCenterY(anchorY: self.centerYAnchor)
    }
}
