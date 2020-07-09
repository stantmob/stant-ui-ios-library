//
//  ServiceInspectionFormFilledListingViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 3/25/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import Foundation
import StantUiIosLibrary

class ServiceInspectionFormFilledListingViewController: UIViewController {
    var serviceInspectionFormFilledTableView: ServiceInspectionFormFilledTableViewWithCollapsedSearchBar?
    
    let cardStatus                   = 2
    let cardPerformedQuantity        = 40.0
    let cardTotalUsedArea            = 156.2
    let cardUnitMeasurement          = "m²"
    let cardVerifiedUnit             = "Unidade Verificada"
    let cardPlannedArea              = 1000.0
    let cardBeginAt                  = "01/04/2019"
    let cardEndAt                    = "12/04/2019"
    let navigationBarHeight: CGFloat = 60
    
    var serviceInspectionFormFilledList = [ServiceInspectionFormFilledDto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...3 {
            let siff = ServiceInspectionFormFilledDto(status:            ServiceInspectionFormFilledStatusEnum(rawValue: i)!,
                                                      performedQuantity: Float(cardPerformedQuantity) * Float(i + 1),
                                                      totalUsedArea:     Float(cardTotalUsedArea),
                                                      unitMeasurement:   cardUnitMeasurement,
                                                      verifiedUnit:      cardVerifiedUnit + "\(i)",
                                                      plannedArea:       Float(cardPlannedArea),
                                                      beginAt:           cardBeginAt,
                                                      endAt:             cardEndAt)
            serviceInspectionFormFilledList.append(siff)
        }
        
        serviceInspectionFormFilledTableView = ServiceInspectionFormFilledTableViewWithCollapsedSearchBar(frame: CGRect(x:      0,
                                                                                                                        y:      navigationBarHeight,
                                                                                                                        width:  self.view.frame.width,
                                                                                                                        height: self.view.frame.height - navigationBarHeight))
        guard let serviceInspectionFormFilledTableView = serviceInspectionFormFilledTableView else { return }
        self.view.addSubview(serviceInspectionFormFilledTableView)
        serviceInspectionFormFilledTableView.anchor(top:      self.view.topAnchor,
                                                    leading:  self.view.leadingAnchor,
                                                    bottom:   self.view.bottomAnchor,
                                                    trailing: self.view.trailingAnchor,
                                                    padding:  UIEdgeInsets(top:    navigationBarHeight,
                                                                           left:   0,
                                                                           bottom: 0,
                                                                           right:  0))
        serviceInspectionFormFilledTableView.configureViewWith(serviceInpsectionFormFilledList: serviceInspectionFormFilledList,
                                                               searchBarIcon:                   UIImage(named: "search") ?? UIImage(),
                                                               searchBarPlaceholder:            "Search",
                                                               tableViewDelegate:               self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
    }
}

extension ServiceInspectionFormFilledListingViewController: ServiceInspectionFormFilledTableViewDidSelectDelegate {
    func didClickOnTableViewCellWith(index: Int) {
        print("Clicked on cell \(index)")
    }
}
