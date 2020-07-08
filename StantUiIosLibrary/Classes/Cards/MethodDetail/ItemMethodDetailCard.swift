//
//  ItemMethodDetailCard.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 7/7/20.
//

import UIKit

public class ItemMethodDetailCard: UIView {
    public var view: UIView?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override public func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    public func configure() {
        configureView()
    }
    
    fileprivate func configureView() {
        view           = UIView()
        guard let view = view else { return }
        view.backgroundColor = .red
        
        self.addSubview(view)
        
        view.anchor(top:      self.topAnchor,
                    leading:  self.leadingAnchor,
                    bottom:   self.bottomAnchor,
                    trailing: self.trailingAnchor,
                    size:     CGSize(width:  360,
                                     height: 237))
    }
}
