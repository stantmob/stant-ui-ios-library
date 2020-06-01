//
//  FormTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class FormTabView: UIView {
    public var collectionView: UICollectionView?
    public var contentList:        [String] = []
    
    var titles = [AppStrings.service_inspection_form_filled_details_begin_label,
                  AppStrings.service_inspection_form_filled_details_deadline_label,
                  AppStrings.service_inspection_form_filled_details_quantity_label,
                  AppStrings.service_inspection_form_filled_details_tests_label]

    func configure(beginDate:       String,
                   endDate:         String,
                   quantiy:         String,
                   unitMeasurement: String,
                   tests:           String) {
        
        contentList = [beginDate, endDate, "\(quantiy) \(unitMeasurement)", tests]
        
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView                 = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
        guard let collectionView       = collectionView else { return }
        collectionView.delegate        = self
        collectionView.dataSource      = self
        collectionView.backgroundColor = .white
        
        self.addSubview(collectionView)
        collectionView.fillSuperView()

        collectionView.register(FormTabCollectionViewCell.self,
                                forCellWithReuseIdentifier: FormTabCollectionViewCell.identifier())
    }
}

extension FormTabView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView:        UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FormTabCollectionViewCell.identifier(),
                                                      for:                 indexPath) as! FormTabCollectionViewCell

        cell.titleLabel?.text   = self.titles[indexPath.row]
        cell.contentLabel?.text = self.contentList[indexPath.row]

        return cell
    }
    
    public func collectionView(_ collectionView:            UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath:     IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 2, height: self.frame.height / 2)
    }
    
    public func collectionView(_ collectionView:                            UICollectionView,
                               layout collectionViewLayout:                 UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView:                       UICollectionView,
                               layout collectionViewLayout:            UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
