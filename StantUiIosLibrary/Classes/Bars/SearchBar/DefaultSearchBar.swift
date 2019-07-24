
//
//  DefaultSearchBar.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/06/19.
//

import UIKit

public class DefaultSearchBar: UIView {
    
    public static let searchViewHeight: CGFloat = 58
    
    public var searchBar: UISearchBar?
    var searchOnTableView = String()
    weak var delegate: DefaultSearchViewDelegate?
    
    var isSearchEnable     = true
    var didTapCancelButton = false
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configureViewWith(delegate: DefaultSearchViewDelegate, image: UIImage, placeholderText: String) {
        self.backgroundColor = UIColor.clear
        self.delegate        = delegate
        
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0,
                                              width: self.frame.width - 12,
                                              height: self.frame.height))
        
        guard let searchBar = searchBar else { return }
        self.addSubview(searchBar)
        
        searchBar.delegate        = self
        searchBar.barTintColor    = UIColor.white
        searchBar.placeholder     = placeholderText
        searchBar.backgroundImage = UIImage()
        
        let searchTextField = searchBar.subviews[0].subviews.last as? UITextField ?? UITextField()
        let imageView       = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
        imageView.image     = image.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.darkGrayStant
        
        searchTextField.leftView           = imageView
        searchTextField.layer.borderWidth  = 2.0
        searchTextField.layer.borderColor  = UIColor.veryLightGrayStant.cgColor
        searchTextField.layer.cornerRadius = 4
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.systemFont(ofSize: 16)
    }
    
}

public protocol DefaultSearchViewDelegate: class {
    func updateTableViewWith(search: String)
}

