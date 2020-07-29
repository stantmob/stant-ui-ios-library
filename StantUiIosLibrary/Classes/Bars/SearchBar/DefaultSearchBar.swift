
//
//  DefaultSearchBar.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/06/19.
//

import UIKit

public class DefaultSearchBar: UIView {
    
    public static let searchViewHeight: CGFloat = 58
    
    private var searchBar: UISearchBar?
    var searchOnTableView = String()
    weak var delegate: DefaultSearchViewDelegate?
    
    var isSearchEnable     = true
    var didTapCancelButton = false

    public func configureViewWith(delegate: DefaultSearchViewDelegate, image: UIImage, placeholderText: String) {
        self.backgroundColor = .clear
        self.delegate        = delegate
        self.anchor(size: CGSize(width: 0, height: DefaultSearchBar.searchViewHeight))
        
        searchBar      = UISearchBar()
        searchBar?.tag = 1
        guard let searchBar = searchBar else { return }
        self.addSubview(searchBar)
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        searchBar.anchor(top:      self.topAnchor,
                         leading:  self.leadingAnchor,
                         bottom:   self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding:  UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6))
        
        searchBar.delegate        = self
        searchBar.barTintColor    = .white
        searchBar.placeholder     = placeholderText
        searchBar.backgroundImage = UIImage()
        
        let searchTextField = searchBar.subviews[0].subviews.last as? UITextField ?? UITextField()
        let imageView       = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
        imageView.image     = image.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkGrayStant
        
        searchTextField.leftView           = imageView
        searchTextField.layer.borderWidth  = 2.0
        searchTextField.layer.borderColor  = UIColor.iceGrayStant.cgColor
        searchTextField.layer.cornerRadius = 4
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.systemFont(ofSize: 16)
    }
}

public protocol DefaultSearchViewDelegate: class {
    func updateTableViewWith(search: String)
}

