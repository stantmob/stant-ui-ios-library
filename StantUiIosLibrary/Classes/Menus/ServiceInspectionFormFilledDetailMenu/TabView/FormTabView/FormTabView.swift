//
//  FormTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

class FormTabView: UIView {
    var collectionView: UICollectionView?
    var titles:         [String] = []
    var content:        [String] = []

    func configure(beginDate:       String,
                   endDate:         String,
                   quantiy:         String,
                   unitMeasurement: String,
                   tests:           String) {
        
        titles  = ["1", "2", "3", "4"]
        content = [beginDate, endDate, "\(quantiy) \(unitMeasurement)", tests]
        
        let layout                     = UICollectionViewFlowLayout()
        layout.itemSize                = CGSize(width: 94, height: 35)
        layout.minimumInteritemSpacing = 66
        layout.minimumLineSpacing      = 26
            
        collectionView           = UICollectionView(frame: frame, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.delegate  = self
        collectionView.backgroundColor = .white
        
        self.addSubview(collectionView)
        collectionView.fillSuperView()
        
        self.collectionView?.register(FormTabCollectionViewCell.self, forCellWithReuseIdentifier: FormTabCollectionViewCell.identifier())
    }
}

extension FormTabView: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FormTabCollectionViewCell.identifier(), for: indexPath as IndexPath) as! FormTabCollectionViewCell

        cell.titleLabel.text   = self.titles[indexPath.row]
        cell.contentLabel.text = self.content[indexPath.row]

        return cell
    }
}
