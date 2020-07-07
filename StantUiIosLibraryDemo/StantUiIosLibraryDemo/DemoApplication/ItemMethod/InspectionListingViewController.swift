//
//  InspectionListingViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 07/07/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class InspectionListingViewController: UIViewController {
    public var tableView: UITableView?
    
    public let statusList:   [VerifiedMethodStatusEnum] = [.approved, .approved, .approved, .approved]
    public let severityList: [Int]                      = [5, 3, 1, 0]
    public let createdAtList                            = [Date(), Date(), Date(), Date()]
    public let deadlineList                             = [Date(), Date(), Date(), Date()]
    public let descriptionList                          = (0...3).map{"My description \($0 + 1)"}
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
        tableView                              = UITableView()
        guard let tableView                    = tableView else { return }
        tableView.delegate                     = self
        tableView.dataSource                   = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle               = .none
        tableView.clipsToBounds                = false
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding:  UIEdgeInsets(top: 70, left: 22, bottom: 0, right: 15))
        
        tableView.register(ApprovedInspectionCell.self, forCellReuseIdentifier: ApprovedInspectionCell.identifier())
        tableView.register(ReprovedInspectionCell.self, forCellReuseIdentifier: ReprovedInspectionCell.identifier())
    }
}

extension InspectionListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ApprovedInspectionCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if statusList[indexPath.row] == .approved {
            let cell = tableView.dequeueReusableCell(withIdentifier: ApprovedInspectionCell.identifier(),
                                                     for:            indexPath) as! ApprovedInspectionCell
            
            cell.configure(delegate:        self,
                           descriptionText: descriptionList[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReprovedInspectionCell.identifier(),
                                                     for:            indexPath) as! ReprovedInspectionCell
            
            cell.configure(delegate:        self,
                           severity:        severityList[indexPath.row],
                           deadLine:        deadlineList[indexPath.row],
                           descriptionText: descriptionList[indexPath.row])
            return cell
        }
    }
}

extension InspectionListingViewController: InspectionCellButtonDelegate {
    func goToMethodEditScreen() {
        print("Edit screen")
    }
    
    func goToMethodDetailScreen() {
        print("Detail screen")
    }
    
    
}
