//
//  FormTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

class FormTabView: UIView {
    var collectionView: UICollectionView?
    var content:        [String] = []
    
    var titles = [AppStrings.service_inspection_form_filled_details_begin_label,
                  AppStrings.service_inspection_form_filled_details_deadline_label,
                  AppStrings.service_inspection_form_filled_details_quantity_label,
                  AppStrings.service_inspection_form_filled_details_tests_label]

    func configure(beginDate:       String,
                   endDate:         String,
                   quantiy:         String,
                   unitMeasurement: String,
                   tests:           String) {
        
        content = [beginDate, endDate, "\(quantiy) \(unitMeasurement)", tests]
        
        configureCollectionView()
    }
    
    func configureCollectionView() {
        let layout                     = UICollectionViewFlowLayout()
        layout.itemSize                = CGSize(width: 94, height: 35)
        layout.minimumInteritemSpacing = 66
        layout.minimumLineSpacing      = 26
            
        collectionView                 = UICollectionView(frame: frame, collectionViewLayout: layout)
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView:        UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FormTabCollectionViewCell.identifier(),
                                                      for:                 indexPath) as! FormTabCollectionViewCell

        cell.titleLabel?.text   = self.titles[indexPath.row]
        cell.contentLabel?.text = self.content[indexPath.row]

        return cell
    }
    
    func collectionView(_ collectionView:            UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath:     IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 2, height: self.frame.height / 2)
    }
    
    func collectionView(_ collectionView:                            UICollectionView,
                        layout collectionViewLayout:                 UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView:                       UICollectionView,
                        layout collectionViewLayout:            UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
