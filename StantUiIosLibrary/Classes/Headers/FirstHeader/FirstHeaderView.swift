//
//  FirstHeaderView.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 29/05/19.
//

import UIKit

public class FirstHeaderView: UIView {

    public var dropdownMenu: UIView?
    public var dropdownLabel: UILabel?
    public var navigationItem: UIImageView?
    public var iconImageView: UIImageView?
    
    var dropdown: FirstHeaderDropdownButton?
    var rightNavigationItem: FirstHeaderRightBarButton?
    
    public static let headerHeight: CGFloat = 29
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.dropdownMenu   = nil
        self.dropdownLabel  = nil
        self.navigationItem = nil
        self.iconImageView  = nil
    }
    
    public func configure(dropdown: FirstHeaderDropdownButton, rightBarButton: FirstHeaderRightBarButton) {
        self.backgroundColor     = .white
        self.dropdown            = dropdown
        self.rightNavigationItem = rightBarButton
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let dropdownWidth = (self.frame.width * 2 ) / 3
        dropdownMenu      = UIView(frame: CGRect(x: 0, y: 0, width: dropdownWidth, height: 29))
        navigationItem    = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        guard let dropdownMenu = dropdownMenu, let navigationItem = navigationItem else { return }
        self.addSubviews(dropdownMenu, navigationItem)
        
        self.configureDropdownView()
        self.configureNavigationBarRightItem()
    }
    
    fileprivate func configureDropdownView() {
        let dropdownWidth = (self.frame.width * 2 ) / 3
        
        guard let dropdownMenu = dropdownMenu, let dropdown = dropdown else { return }
        dropdownMenu.layer.cornerRadius = 3.0
        dropdownMenu.backgroundColor    = .lightGrayStant
        
        let action      = dropdown.action ?? Selector.init(String())
        let dropdownTap = UITapGestureRecognizer(target: dropdown.target ?? UIViewController(), action: action)
        dropdownMenu.addGestureRecognizer(dropdownTap)
        
        dropdownMenu.anchor(top: self.topAnchor,
                            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                            size: CGSize(width: dropdownWidth, height: 29))
        dropdownMenu.anchorCenterX(anchorX: self.centerXAnchor)
        
        self.addDropdownInsets()
    }
    
    fileprivate func addDropdownInsets() {
        dropdownLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 236, height: 29))
        iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        guard let dropdownMenu = dropdownMenu, let dropdownLabel = dropdownLabel, let iconImageView = iconImageView else { return }
        dropdownMenu.addSubviews(dropdownLabel, iconImageView)

        self.configureDropdownLabel()
        self.configureDropdownIcon()
    }
    
    fileprivate func configureDropdownLabel() {
        guard let dropdownLabel = dropdownLabel, let dropdown = dropdown else { return }
        dropdownLabel.configure(text: dropdown.title ?? String(), size: 12, weight: .regular, color: .darkStant)
        dropdownLabel.fillSuperView()
    }
    
    fileprivate func configureDropdownIcon() {
        guard let iconImageView = self.iconImageView else { return }
        iconImageView.image = dropdown?.image ?? UIImage()
        
        guard let dropdownMenu = dropdownMenu else { return }
        iconImageView.anchor(trailing: dropdownMenu.trailingAnchor,
                             padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16),
                             size: CGSize(width: 23, height: 23))
        iconImageView.anchorCenterY(anchorY: dropdownMenu.centerYAnchor)
    }
    
    fileprivate func configureNavigationBarRightItem() {
        guard let navigationItem = navigationItem, let rightNavigationItem = rightNavigationItem else { return }
        navigationItem.image = rightNavigationItem.image ?? UIImage()
        
        let action                 = rightNavigationItem.action ?? Selector.init(String())
        let rightNavigationItemTap = UITapGestureRecognizer(target: rightNavigationItem.target ?? UIViewController(), action: action)
        
        navigationItem.isUserInteractionEnabled = true
        navigationItem.addGestureRecognizer(rightNavigationItemTap)
        
        navigationItem.anchor(trailing: self.trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 22),
                              size: CGSize(width: 24, height: 24))
        navigationItem.anchorCenterY(anchorY: self.centerYAnchor)
    }
    
    
    
}
