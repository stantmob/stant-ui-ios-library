//
//  ListingPlacesViewController..swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/11/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

public class ListingPlacesViewController: UIViewController {
    
    public var tableView:            UITableView?
    public var placesStatusEnum:     [PlaceStatusEnum] = [.noPlanning, .hasPlanning, .allApproved, .allFinalized]
    public var placeTitleList:       [String]          = ["Obra 1","Obra 2","Obra 3","Obra 4"]
    public var quantitySubPlaceList: [Int]             = [0, 1, 2, 3]
    public var percentageList:       [Float]           = [80, 32.5, 30, 110]
    public var hasSiffList:          [Bool]            = [true, false, false, true]
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor = .white
    }
    
    func configureTableView() {
        tableView                 = UITableView()
        guard let tableView       = tableView else { return }
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.isScrollEnabled = true
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle  = .none
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor)
        
        tableView.register(PlacesCell.self, forCellReuseIdentifier: PlacesCell.identifier())
    }
}

extension ListingPlacesViewController: UITableViewDataSource, UITableViewDelegate, PlaceCellDidSelectDelegate {
    public func goToSubPlaces(index: Int) {
        print("Has SubPlaces")
    }
    
    public func goToServiceInspectionFormFilledScreen() {
        print("Has Fisps")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesStatusEnum.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PlacesCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlacesCell.identifier(), for: indexPath) as? PlacesCell else { return UITableViewCell() }
        
        cell.configureViewFor(delegate:          self,
                              index:             indexPath.row,
                              status:            placesStatusEnum[indexPath.row],
                              placeTitle:        placeTitleList[indexPath.row],
                              quantitySubPlaces: quantitySubPlaceList[indexPath.row],
                              percentage:        percentageList[indexPath.row],
                              hasSiff:           hasSiffList[indexPath.row])
        
        return cell
    }
}
