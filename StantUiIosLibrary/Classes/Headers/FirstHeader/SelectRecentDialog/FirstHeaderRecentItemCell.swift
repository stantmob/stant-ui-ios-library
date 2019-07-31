//
//  FirstHeaderRecentItemCell.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/05/19.
//

import UIKit

public class FirstHeaderRecentItemCell: UITableViewCell {
    
    public static let cellHeight: CGFloat = 56
    
    public var mainView: UIView?
    public var photoImageView: UIImageView?
    public var cellTextLabel: UILabel?
    
    public var item: FirstHeaderRecentItem?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.mainView       = nil
        self.photoImageView = nil
        self.cellTextLabel  = nil
    }
    
    public func configureViewFor(item: FirstHeaderRecentItem) {
        self.item = item
        mainView  = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: FirstHeaderRecentItemCell.cellHeight))

        guard let mainView = mainView else { return }
        self.addSubview(mainView)
        
        mainView.fillSuperView()
        mainView.backgroundColor = .white
        
        self.addCellSubviews()
    }
    
    fileprivate func addCellSubviews() {
        guard let mainView = mainView else { return }
        photoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        cellTextLabel  = UILabel(frame: CGRect(x: 0, y: 0, width: mainView.frame.width, height: 56))
        
        guard let photoImageView = photoImageView, let cellTextLabel = cellTextLabel else { return }
        mainView.addSubviews(photoImageView, cellTextLabel)
        
        if let image = item?.image {
            self.configureImageWith(image: image)
        } else {
            self.configureImageWith(url: item?.url ?? "")
        }
        
        self.configureCellWith(text: item?.title ?? String())
    }
    
    fileprivate func configureImageWith(image: UIImage) {
        guard let mainView = mainView, let photoImageView = photoImageView else { return }
        
        photoImageView.image = image
        photoImageView.anchor(top: mainView.topAnchor,
                              leading: mainView.leadingAnchor,
                              padding: UIEdgeInsets(top: 18, left: 26, bottom: 0, right: 0),
                              size: CGSize(width: 20, height: 20))
    }
    
    fileprivate func configureImageWith(url: String) {
        guard let mainView = mainView, let photoImageView = photoImageView else { return }
        
        photoImageView.showRoundedImageWith(path: url, radius: 8.0)
        photoImageView.anchor(top: mainView.topAnchor,
                              leading: mainView.leadingAnchor,
                              padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 0),
                              size: CGSize(width: 40, height: 40))
    }
    
    fileprivate func configureCellWith(text: String) {
        guard let mainView = mainView, let cellTextLabel = cellTextLabel else { return }
        
        cellTextLabel.configure(text: text, alignment: .left, size: 16, weight: .regular, color: .darkStant)
        cellTextLabel.anchor(top: mainView.topAnchor,
                             leading: mainView.leadingAnchor,
                             bottom: mainView.bottomAnchor,
                             trailing: mainView.trailingAnchor,
                             padding: UIEdgeInsets(top: 0, left: 66, bottom: 0, right: 50))        
    }
}

public protocol RecentItemCellDelegate: class {
    func clickOnCellWith(index: Int, title: String)
}
