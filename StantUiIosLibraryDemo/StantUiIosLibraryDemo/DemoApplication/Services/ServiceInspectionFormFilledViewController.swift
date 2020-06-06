//
//  ServiceInspectionFormFilledViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 3/25/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import Foundation
import StantUiIosLibrary

class ServiceInspectionFormFilledViewController: UIViewController {
    
    let navigationBarHeight: CGFloat = 60
    
    let cardStatus                   = 2
    let cardPerformedQuantity        = 40.0
    let cardTotalUsedArea            = 156.2
    let cardUnitMeasurement          = "m²"
    let cardVerifiedUnit             = "Unidade Verificada"
    let cardPlannedArea              = 1000.0
    let cardBeginAt                  = "01/04/2019"
    let cardEndAt                    = "12/04/2019"
    
    
    var serviceInspectionFormFilledList = [ServiceInspectionFormFilled]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        
        for i in 0...3 {
            let siff = ServiceInspectionFormFilled(status:            ServiceInspectionFormFilledStatusEnum(rawValue: i)!,
                                                   performedQuantity: Float(cardPerformedQuantity) * Float(i + 1),
                                                   totalUsedArea:     Float(cardTotalUsedArea),
                                                   unitMeasurement:   cardUnitMeasurement,
                                                   verifiedUnit:      cardVerifiedUnit + "\(i)",
                                                   plannedArea:       Float(cardPlannedArea),
                                                   beginAt:           cardBeginAt,
                                                   endAt:             cardEndAt)
            serviceInspectionFormFilledList.append(siff)
        }
        
        let serviceInspectionFormFilledTableView = ServiceInspectionFormFilledTableViewWithCollapsedSearchBar(frame: CGRect(x:      0,
                                                                                                                            y:      navigationBarHeight,
                                                                                                                            width:  self.view.frame.width,
                                                                                                                            height: self.view.frame.height -                               navigationBarHeight))
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
                                                               tableViewDelegate:               self,
                                                               emptyMessage:                    "NO FISPS")
    }
    
}

extension ServiceInspectionFormFilledViewController: ServiceInspectionFormFilledTableViewDidSelectDelegate {
    func didClickOnTableViewCellWith(index: Int) {
        print("Clicked on cell \(index)")
    }
    
    
}
