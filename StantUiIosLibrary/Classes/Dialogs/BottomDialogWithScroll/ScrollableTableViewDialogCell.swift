//
//  ScrollableTableViewDialogCell.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 10/07/19.
//

import UIKit

public class ScrollableTableViewDialogCell: UITableViewCell {
    
    public static let cellHeight: CGFloat = 56
    
    public var mainView: UIView?
    public var cellTextLabel: UILabel?
    
    public var title: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.mainView      = nil
        self.cellTextLabel = nil
    }
    
    public func configureViewWith(title: String) {
        self.title = title
        mainView   = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: ScrollableTableViewDialogCell.cellHeight))
        
        guard let mainView = mainView else { return }
        self.addSubview(mainView)
        
        mainView.fillSuperView()
        mainView.backgroundColor = .white
        
        self.addCellSubviews()
    }
    
    fileprivate func addCellSubviews() {
        guard let mainView = mainView else { return }
        cellTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: mainView.frame.width, height: 56))
        
        guard let cellTextLabel = cellTextLabel else { return }
        mainView.addSubviews(cellTextLabel)
        
        cellTextLabel.configure(text: title ?? "", alignment: .left, size: 16, weight: .regular, color: .darkStant)
        cellTextLabel.anchor(top: mainView.topAnchor,
                             leading: mainView.leadingAnchor,
                             bottom: mainView.bottomAnchor,
                             trailing: mainView.trailingAnchor,
                             padding: UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 58))
    }
    
}

public protocol ScrollableTableViewDialogCellDelegate: class {
    func clickOnCellWith(index: Int, title: String)
}
