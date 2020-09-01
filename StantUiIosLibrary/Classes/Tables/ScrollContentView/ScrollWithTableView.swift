//
//  ScrollWithTableView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 12/08/20.
//

import UIKit

public class ScrollWithTableView: UIScrollView {
    public var contentView:           UIView?
    public var contentViewConstraint: NSLayoutConstraint?
    public var tableViewDelegate:     ScrollWithTableViewDelegate?
    
    public var contentViewHeight:     CGFloat = 0
    public var tableViewHeight:       CGFloat = 0
    
    public func addToContentView(_ view: UIView) {
        contentView?.addSubview(view)
    }
    
    public func configure(tableViewDelegate: ScrollWithTableViewDelegate) {
        self.updateLayout()
        
        contentView            = UIView()
        guard let contentView  = contentView else { return }
        self.tableViewDelegate = tableViewDelegate

        self.addSubview(contentView)
        contentView.anchor(top:      self.topAnchor,
                           leading:  self.leadingAnchor,
                           bottom:   self.bottomAnchor,
                           trailing: self.trailingAnchor)
        contentView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        contentViewConstraint           = contentView.heightAnchor.constraint(equalToConstant: self.contentSize.height)
        contentViewConstraint?.isActive = true
    }
    
    public func updateContentSize(view: UIView, verticalPadding: CGFloat) {
        var height: CGFloat = 0
        
        if view is UITableView {
            guard let tableViewDelegate = tableViewDelegate else { return }
            height                      = tableViewDelegate.updateTableViewHeight() - tableViewHeight
            tableViewHeight             = height
        } else {
            height = view.frame.height
        }

        contentViewHeight              += height + verticalPadding
        self.contentSize                = CGSize(width: self.frame.width, height: contentViewHeight)
        contentViewConstraint?.constant = contentViewHeight
        
        self.updateLayout()
    }
}

public protocol ScrollWithTableViewDelegate {
    func updateTableViewHeight() -> CGFloat
}
