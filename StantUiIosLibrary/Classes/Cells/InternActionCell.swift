//
//  InternActionCell.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Alexandre on 01/07/19.
//

import UIKit

public class InternActionCell: UITableViewCell {
    
    public static let IDENTIFIER      = "InternActionCellIdentifier"
    public static let HEIGHT: CGFloat = 56
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(description: String = String(),
                    icon: UIImage? = UIImage(),
                    iconSize: CGSize = CGSize(width: 20, height: 20)) {
        self.textLabel?.text  = description
        self.imageView?.image = icon?.reframeImageSize(iconSize)
    }

}
