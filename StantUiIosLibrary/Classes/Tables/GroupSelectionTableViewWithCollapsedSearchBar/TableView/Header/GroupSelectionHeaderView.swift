//
//  GroupSelectionHeaderView.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/07/19.
//

import UIKit

public class GroupSelectionHeaderView: UIView {
    
    internal static let headerHeight: CGFloat = 47

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.removeSubviews()
    }
    
    public func configureHeaderView(title: String, firstDate: Date?, secondDate: Date?) {
        self.removeSubviews()
        self.backgroundColor = .clear
        self.addLabelWith(title: title)
        self.addDatesView(firstDate: firstDate, secondDate: secondDate)
    }
    
    fileprivate func addLabelWith(title: String) {
        let headerLabel = UILabel(frame: CGRect(x: 16,
                                                y: 12,
                                                width: self.frame.width - 176,
                                                height: 20))
        headerLabel.configure(text: title,
                              alignment: .left,
                              size: 16,
                              weight: .regular,
                              color: .blueDarkStant)
        self.addSubview(headerLabel)
        headerLabel.tag = 1
    }
    
    fileprivate func addDatesView(firstDate: Date?, secondDate: Date?) {
        let datesView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 143,
                                             height: 22))
        datesView.layer.cornerRadius = 3
        datesView.backgroundColor    = .lightGrayStant
    
        self.addSubview(datesView)
        datesView.anchor(top: self.topAnchor,
                         trailing: self.trailingAnchor,
                         padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 16),
                         size: CGSize(width: 143, height: 22))
       
        self.addDatesInformation(to: datesView, firstDate: firstDate, secondDate: secondDate)
    }
    
    fileprivate func addDatesInformation(to view: UIView, firstDate: Date?, secondDate: Date?) {
        self.addCircleDetailView(to: view)
        
        self.addLabelWith(dateInformation: firstDate, alignment: .left, to: view, withTag: 2)
        self.addLabelWith(dateInformation: secondDate, alignment: .right, to: view, withTag: 3)
    }
    
    fileprivate func addCircleDetailView(to view: UIView) {
        let centerDetail = UIView(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 4,
                                                height: 4))
        centerDetail.layer.cornerRadius = 2
        centerDetail.backgroundColor    = .darkGrayStant
        
        view.addSubview(centerDetail)
        
        centerDetail.anchor(size: CGSize(width: 4, height: 4))
        centerDetail.anchorCenterX(anchorX: view.centerXAnchor)
        centerDetail.anchorCenterY(anchorY: view.centerYAnchor)
    }
    
    fileprivate func addLabelWith(dateInformation: Date?, alignment: NSTextAlignment, to view: UIView, withTag tag: Int) {
        let dateLabel    = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 22))
        var dateAsString = ""
        
        if let date = dateInformation { dateAsString = date.toString() }
        
        dateLabel.configure(text: dateAsString,
                            alignment: alignment == NSTextAlignment.left ? .left : .right,
                            size: 11,
                            weight: .regular,
                            color: .darkGrayStant)
        view.addSubview(dateLabel)
        dateLabel.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: view.bottomAnchor,
                        trailing: view.trailingAnchor,
                        padding: UIEdgeInsets(top: 0,
                                              left: alignment == NSTextAlignment.left ? 2 : 0,
                                              bottom: 0,
                                              right: alignment == NSTextAlignment.right ? 2 : 0))
        dateLabel.tag = tag
    }

}

