//
//  ScrollableTableViewDialogCell.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 10/07/19.
//

import UIKit

public class ScrollableTableViewDialogCell: UITableViewCell {
    
    public static let cellHeight: CGFloat = 56
    
    public var mainView:      UIView?
    public var cellIcon:      UIImageView?
    public var cellTextLabel: UILabel?
    
    public var imageURL: String?
    public var title:    String?
    
    public let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.mainView         = nil
        self.cellIcon         = nil
        self.cellTextLabel    = nil
    }
    
    public func configureViewWith(title: String, imageURL: String? = "") {
        self.title    = title
        self.imageURL = imageURL ?? String()
        
        mainView   = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: ScrollableTableViewDialogCell.cellHeight))
        
        guard let mainView = mainView else { return }
        self.addSubview(mainView)
        
        mainView.fillSuperView()
        mainView.backgroundColor = .white
        
        self.addCellSubviews()
    }
    
    fileprivate func addCellSubviews() {
        guard let mainView = mainView else { return }
        
        cellIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height))
        guard let cellIcon = cellIcon else { return }
        
        if imageURL == "home" {
            mainView.addSubview(cellIcon)
            
            cellIcon.image = UIImage(named: "home")
            cellIcon.anchor(leading:  mainView.leadingAnchor,
                            padding:  UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0),
                            size:     CGSize(width: 30, height: 30))
        } else if imageURL != "" {
            mainView.addSubview(cellIcon)
            
            cellIcon.showRoundedImageWith(path: imageURL ?? String(), radius: 8, activityIndicator: activityIndicator)
            cellIcon.anchor(leading:  mainView.leadingAnchor,
                            padding:  UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0),
                            size:     CGSize(width: 40, height: 40))
        }
        
        cellTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height))
        guard let cellTextLabel = cellTextLabel else { return }
        mainView.addSubview(cellTextLabel)
        
        cellTextLabel.configure(text: title ?? "", alignment: .left, size: 16, weight: .regular, color: .darkStant)
        cellTextLabel.anchor(top:      mainView.topAnchor,
                             leading:  imageURL == "" ? mainView.leadingAnchor : cellIcon.trailingAnchor,
                             bottom:   mainView.bottomAnchor,
                             trailing: mainView.trailingAnchor,
                             padding:  UIEdgeInsets(top: 0, left: 10, bottom: 15, right: 58))
    }
    
}

public protocol ScrollableTableViewDialogCellDelegate: class {
    func clickOnCellWith(index: Int, title: String)
}
