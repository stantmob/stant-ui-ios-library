//
//  ServiceInspectionFormFilledDetailMenuViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 27/05/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ServiceInspectionFormFilledDetailMenuViewController: UIViewController {
    var detailView: ServiceInspectionFormFilledDetailMenuView?
    
    var personInChargeNames = ["Person 1", "Person 2", "Person 3"]
    var personNames         = (1...30).map { "Person \($0)" }
    var personRoles         = (1...30).map { "Role \($0)" }
    var photoUrls           = (1...30).map { _ in "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configureDetailView()
    }
    
    func configureDetailView() {
        detailView           = ServiceInspectionFormFilledDetailMenuView()
        guard let detailView = detailView else { return }
        
        self.view.addSubview(detailView)
        detailView.anchor(top:      self.view.topAnchor,
                          leading:  self.view.leadingAnchor,
                          trailing: self.view.trailingAnchor,
                          padding:  UIEdgeInsets(top: 100, left: 16, bottom: 0, right: 16),
                          size:     CGSize(width: self.view.frame.width, height: 281))
        
        detailView.configureInChargeStackView(personInChargeNames:     personInChargeNames,
                                              personInChargePhotoUrls: photoUrls)

        detailView.configureMainTabView()
        
        detailView.configureFormTab(beginDate:       "11/10/2010",
                                    endDate:         "10/10/2010",
                                    quantiy:         "200",
                                    unitMeasurement: "m²",
                                    tests:           "0")
        
        detailView.configureTeamTab(personNames: personNames,
                                    personRoles: personRoles,
                                    photoUrls:   photoUrls)
        
        detailView.configureAttachmentTab()
    }
}
