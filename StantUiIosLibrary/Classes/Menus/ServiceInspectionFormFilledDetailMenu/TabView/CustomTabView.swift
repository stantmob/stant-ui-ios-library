//
//  CustomTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class CustomTabView: UIView {
    public var collectionView: UICollectionView?
    public var delegate:       CustomTabViewDelegate?
    
    public let cellTitles = [AppStrings.service_inspection_form_filled_details_form_title,
                             AppStrings.service_inspection_form_filled_details_team_title,
                             AppStrings.service_inspection_form_filled_details_attachments_title]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView                 = UICollectionView(frame:                .zero,
                                                          collectionViewLayout: UICollectionViewFlowLayout())
        guard let collectionView       = collectionView else { return }
        collectionView.backgroundColor = .white
        collectionView.delegate        = self
        collectionView.dataSource      = self
        
        collectionView.register(CustomTabViewCell.self, forCellWithReuseIdentifier: "cellID")
        
        self.addSubview(collectionView)
        collectionView.fillSuperView()
        collectionView.selectItem(at:             IndexPath(row: 0, section: 0),
                                  animated:       true,
                                  scrollPosition: .left)
    }
}

extension CustomTabView: UICollectionViewDelegate,
                         UICollectionViewDataSource,
                         UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView:               UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    public func collectionView(_ collectionView:        UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "cellID",
                                 for:                 indexPath) as! CustomTabViewCell
        
        cell.label?.text = cellTitles[indexPath.row]
        return cell
    }
    
    public func collectionView(_ collectionView:            UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath:     IndexPath) -> CGSize {
        
        return CGSize(width:  collectionView.frame.width / 3,
                      height: collectionView.frame.height)
    }
    
    public func collectionView(_ collectionView:                            UICollectionView,
                               layout collectionViewLayout:                 UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView:          UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            delegate?.goToFormTabView()
        } else if indexPath.row == 1 {
            delegate?.goToTeamTabView()
        } else {
            delegate?.goToAttachmentTabView()
        }
    }
}

public protocol CustomTabViewDelegate {
    func goToFormTabView()
    func goToTeamTabView()
    func goToAttachmentTabView()
}
