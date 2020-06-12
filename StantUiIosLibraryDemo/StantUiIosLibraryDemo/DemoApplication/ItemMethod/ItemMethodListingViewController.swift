//
//  ItemListingViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 12/06/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ItemMethodListingViewController: UIViewController {
    public var tableView: UITableView?
    
    public let statusList: [VerifiedMethodStatusEnum] = [.notApplicable, .notInspected, .reproved,
                                                         .notApplicable, .notInspected, .reproved,
                                                         .notApplicable, .notInspected, .reproved]
    public let hasReprovedMethodList: [Bool]          = (1...12).map { index in return index % 2 == 0 }
    
    public let descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget risus in urna imperdiet sagittis ut                             vel quam. Fusce sagittis nec nibh ac pulvinar. Nunc aliquam lorem a mauris volutpat, ornare ultricies                             urna laoreet. Morbi vitae blandit velit. Nam eleifend nec tortor non convallis."
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
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
                         padding:  UIEdgeInsets(top: 100, left: 22, bottom: 0, right: 15))
        
        tableView.register(ItemMethodCell.self, forCellReuseIdentifier: ItemMethodCell.identifier())
    }
}

extension ItemMethodListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItemMethodCell.cellHeight
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemMethodCell.identifier(),
                                                 for:            indexPath) as! ItemMethodCell
        
        cell.configure()
        
        return cell
    }
}
