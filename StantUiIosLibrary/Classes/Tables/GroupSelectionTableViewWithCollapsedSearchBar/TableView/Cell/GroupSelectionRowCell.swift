//
//  GroupSelectionRowCell.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/07/19.
//
import UIKit

public class GroupSelectionRowCell: UITableViewCell {
    
//    internal static let IDENTIFIER          = "GroupSelectionRowCellIdentifier"
    internal static let cellHeight: CGFloat = 60
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.removeSubviews()
    }
    
    public func configureCellWith(title: String, icon: UIImage, arrowImage: UIImage) {
        self.removeSubviews()
        self.backgroundColor = .clear
        
        let mainView = UIView(frame: CGRect(x: 0, y: 0,
                                            width: self.frame.width - 8,
                                            height: 56))
        
        mainView.backgroundColor = .white
        mainView.layer.applySketchShadow(color: .shadowStant, alpha: 0.09, x: 0, y: 3, blur: 8, spread: 3)
        
        self.addSubview(mainView)
        mainView.anchor(top: self.topAnchor,
                        leading: self.leadingAnchor,
                        bottom: self.bottomAnchor,
                        trailing: self.trailingAnchor,
                        padding: UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4))
        
        self.addCellInformation(to: mainView, image: icon, title: title, arrowImage: arrowImage)
    }
    
    fileprivate func addCellInformation(to view: UIView, image: UIImage, title: String, arrowImage: UIImage) {
        self.addImage(to: view, image: image)
        self.addLabel(to: view, title: title)
        self.addRightArrow(to: view, image: arrowImage)
    }
    
    fileprivate func addImage(to view: UIView, image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0,
                                                  width: 20, height: 20))
        imageView.image     = image
        imageView.image     = image.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .blueDarkStant
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         padding: UIEdgeInsets(top: 18, left: 21, bottom: 0, right: 0), size: CGSize(width: 20, height: 20))
    }
    
    fileprivate func addLabel(to view: UIView, title: String) {
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0,
                                              width: self.frame.width,
                                              height: 20))
        textLabel.configure(text: title, alignment: .left, size: 16, weight: .regular, color: .blueDarkStant)
        view.addSubview(textLabel)
        textLabel.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor,
                         padding: UIEdgeInsets(top: 18, left: 48, bottom: 18, right: 32))
        textLabel.tag = 1
    }
    
    fileprivate func addRightArrow(to view: UIView, image: UIImage) {
        let arrow = UIImageView(frame: CGRect(x: 0, y: 0,
                                              width: 16, height: 16))
        arrow.image     = image
        arrow.image     = image.withRenderingMode(.alwaysTemplate)
        arrow.tintColor = .darkGrayStant
        view.addSubview(arrow)
        arrow.anchor(top: view.topAnchor,
                     trailing: view.trailingAnchor,
                     padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 16), size: CGSize(width: 16, height: 16))
    }

}
