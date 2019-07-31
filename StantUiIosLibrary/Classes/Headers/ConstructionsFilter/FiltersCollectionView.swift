//
//  FiltersCollectionView.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/05/19.
//

import UIKit

public class FiltersCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public var buttons = [FilterButton]()
    
    weak var cellDelegate: FilterCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    fileprivate func commonInit() {
        self.delegate        = self
        self.dataSource      = self
        self.allowsSelection = true
        
        self.register(FilterButtonCollectionViewCell.self, forCellWithReuseIdentifier: FilterButtonCollectionViewCell.identifier())
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterButtonCollectionViewCell.identifier(), for: indexPath as IndexPath) as? FilterButtonCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let currentButton = buttons[indexPath.row]
        cell.configureCell(button: currentButton)
        cell.cellDelegate = cellDelegate
        
        return cell
    }
    
    public func set(buttons: [FilterButton]) {
        self.buttons = buttons
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(90), height: CGFloat(28))
    }
    
    public func set(cellDelegate: FilterCellDelegate) {
        self.cellDelegate = cellDelegate
    }
    
}



