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
    var tableView: UITableView?
    
    let unitMeasurement              = "m²"
    let beginAt                      = "01/04/2019"
    let endAt                        = "12/04/2019"
    let plannedArea:         Float   = 1000.0
    let totalUsedArea:       Float   = 156.2
    let navigationBarHeight: CGFloat = 60
    
    let siffStatusList        = (0...3).map{ ServiceInspectionFormFilledCellTypeEnum(rawValue: $0)! }
    let performedQuantityList = (0...3).map{ Float(40) * Float($0 + 1) }
    let verifiedUnitList      = (0...3).map{ "Unidade Verificada \($0 + 1)" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView                = UITableView()
        guard let tableView      = tableView else { return }
        tableView.delegate       = self
        tableView.dataSource     = self
        tableView.separatorStyle = .none
        tableView.clipsToBounds  = false 
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding:  UIEdgeInsets(top: navigationBarHeight, left: 16, bottom: 0, right: 16))
        tableView.register(ServiceInspectionFormFilledCell.self,
                           forCellReuseIdentifier: ServiceInspectionFormFilledCell.identifier())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
    }
}

extension ServiceInspectionFormFilledListingViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return siffStatusList.count
        }
        
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return ServiceInspectionFormFilledCell.cellHeight
        }

        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ServiceInspectionFormFilledCell.identifier(),
                                                           for:            indexPath)
                as? ServiceInspectionFormFilledCell else { return UITableViewCell() }
            
            cell.configureViewFor(status:            siffStatusList[indexPath.row],
                                  beginAt:           beginAt,
                                  endAt:             endAt,
                                  verifiedUnit:      verifiedUnitList[indexPath.row],
                                  unitMeasurement:   unitMeasurement,
                                  totalUsedArea:     totalUsedArea,
                                  performedQuantity: performedQuantityList[indexPath.row],
                                  plannedArea:       plannedArea)
            
            return cell
        }
        
        public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.didClickOnTableViewCellWith(index: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    
    func didClickOnTableViewCellWith(index: Int) {
        print("Clicked on cell \(index)")
    }
}
