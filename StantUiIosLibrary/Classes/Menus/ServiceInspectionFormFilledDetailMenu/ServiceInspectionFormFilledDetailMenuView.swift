//
//  ServiceInspectionFormFilledDetailMenuView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class ServiceInspectionFormFilledDetailMenuView: UIView {
    var inChargeStackView: InChargeStackView?
    var mainTabView:       CustomTabView?
    
    public func configureInChargeStackView(personInChargeNames:     [String],
                                           personInChargeRoles:     [String],
                                           personInChargePhotoUrls: [String]) {
        
        inChargeStackView           = InChargeStackView()
        guard let inChargeStackView = inChargeStackView else { return }

        self.addSubview(inChargeStackView)
        inChargeStackView.anchor(top:      self.topAnchor,
                                 leading:  self.leadingAnchor,
                                 trailing: self.trailingAnchor,
                                 size:     CGSize(width: self.frame.width, height: 82))
        
        inChargeStackView.configure(personNames:         personInChargeNames,
                                    personInChargeRoles: personInChargeRoles,
                                    photoUrls:           personInChargePhotoUrls)
    }
    
    public func configureFormTab(beginDate:       Date,
                                 endDate:         Date,
                                 quantiy:         Float,
                                 unitMeasurement: String,
                                 tests:           Int) {
        //TODO
    }
    
    public func configureTeamTab(personNames: [String],
                                 personRoles: [String] = [],
                                 photoUrls:   [String] = []) {
        //TODO
    }
    
    public func configureAttachmentTab() {
        //TODO
    }
}
