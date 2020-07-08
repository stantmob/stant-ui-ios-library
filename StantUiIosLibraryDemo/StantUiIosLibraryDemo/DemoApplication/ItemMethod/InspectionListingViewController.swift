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
    
    public var groupedInspectionList                = [(key: String, value: [InspectionCellData])]()
    public let severityList: [Int]                  = [5, 3, 1, 0, 4, 3, 2, 0, 3, 5]
    public let descriptionList                      = (0..<10).map{"My description \($0 + 1)"}
    public let statusList:   [InspectionStatusEnum] = [.reproved, .approved, .reproved, .approved, .reproved,
                                                       .approved, .reproved, .approved, .reproved, .approved]
    public let createdAtList                        = ["06/01/2020", "25/01/2020", "25/01/2020", "07/01/2020", "18/01/2020",
                                                       "06/01/2020", "18/01/2020", "25/01/2020", "06/01/2020", "03/01/2020"]
    public let deadlineList                         = ["25/01/2020", "30/01/2020", "19/01/2020", "21/01/2020", "30/01/2020",
                                                       "28/01/2020", "03/01/2020", "31/01/2020", "16/01/2020", "01/01/2020"]
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        groupedInspectionList     = populateInspectionList()
        configureTableView()
    }
    
    func populateInspectionList() -> [(key: String, value: [InspectionCellData])] {
        var inspectionList = [InspectionCellData]()
        for i in (0..<10) {
            let inpectionCellData = InspectionCellData(createdAt:       createdAtList[i],
                                                       status:          statusList[i],
                                                       severity:        severityList[i],
                                                       deadline:        deadlineList[i],
                                                       descriptionText: descriptionList[i])
            
            inspectionList.append(inpectionCellData)
        }
        
        return Dictionary(grouping: inspectionList, by: { $0.createdAt }).sorted(by: { $0.0 > $1.0 })
    }
    
    func configureTableView() {
        tableView                 = UITableView(frame: CGRect(), style: .grouped)
        guard let tableView       = tableView else { return }
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.separatorStyle  = .none
        tableView.clipsToBounds   = false
        tableView.backgroundColor = .white
        
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedInspectionList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedInspectionList[section].value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return groupedInspectionList[indexPath.section].value[indexPath.row].status == .approved
               ? ApprovedInspectionCell.cellHeight : ReprovedInspectionCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView          = InspectionCellHeader()
        let inspectionCreatedAt = groupedInspectionList[section].key
        
        headerView.configure(createdAt: inspectionCreatedAt)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inspectionCellData = groupedInspectionList[indexPath.section].value[indexPath.row]
        
        if inspectionCellData.status == .approved {
            let cell = tableView.dequeueReusableCell(withIdentifier: ApprovedInspectionCell.identifier(),
                                                     for:            indexPath) as! ApprovedInspectionCell
            
            cell.configure(delegate:        self,
                           descriptionText: inspectionCellData.descriptionText)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReprovedInspectionCell.identifier(),
                                                     for:            indexPath) as! ReprovedInspectionCell
            
            cell.configure(delegate:        self,
                           severity:        inspectionCellData.severity,
                           deadline:        inspectionCellData.deadline,
                           descriptionText: inspectionCellData.descriptionText)
            return cell
        }
    }
}

extension InspectionListingViewController: InspectionCellButtonDelegate {
    func goToInspectionEditScreen() {
        print("Edit screen")
    }
    
    func goToInspectionDetailScreen() {
        print("Detail screen")
    }
}

struct InspectionCellData {
    var createdAt:       String               = ""
    var status:          InspectionStatusEnum = .approved
    var severity:        Int                  = 0
    var deadline:        String               = ""
    var descriptionText: String               = ""
}
