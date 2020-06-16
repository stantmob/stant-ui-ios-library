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
    
    public var tableView: UITableView?
    public var delegate: ListingPlacesViewDelegate?
    public var placesStatusEnum: [PlaceStatusEnum] = [.noPlanning, .hasPlanning, .allApproved, .allFinalized]
    public var placeTitleList: [String] = ["Obra 1","Obra 2","Obra 3","Obra 4"]
    public var quantitySubPlaceList: [Int] = [0, 1, 2, 3]
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor = .white
        
        configureTableView()
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
        
        tableView.register(ListingPlacesCell.self, forCellReuseIdentifier: ListingPlacesCell.identifier())
    }
    
}

public protocol ListingPlacesViewDelegate {
    func didClickOnTableViewCellWith(index: Int)
}

extension ListingPlacesViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesStatusEnum.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ListingPlacesCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListingPlacesCell.identifier(), for: indexPath) as? ListingPlacesCell else { return UITableViewCell() }
        
        cell.configureViewFor(status:            placesStatusEnum[indexPath.row],
                              placeTitle:        placeTitleList[indexPath.row],
                              quantitySubPlaces: quantitySubPlaceList[indexPath.row])
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
    }
}
