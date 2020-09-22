//
//  VerifiedMethodDetailViewControllerExtension.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 12/08/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

extension VerifiedMethodDetailViewController: VerifiedMethodDetailViewDelegate {
    func addApprovedInspectionData() {
        // Only for Demo purposes
        let alert = UIAlertController(title:   "Approve button clicked!",
                                      message: "Method Approved", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.presentAlert(alert: alert)
    }
    
    func addReprovedInspectionData() {
        // Only for Demo purposes
        let alert = UIAlertController(title:   "Reprove button clicked!",
                                      message: "Method Reproved", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.presentAlert(alert: alert)
    }
    
    func setNotApplicable() {
        tableView?.isHidden         = true
        scrollView?.isScrollEnabled = false
    }
    
    func setApplicable() {
        tableView?.isHidden         = false
        scrollView?.isScrollEnabled = true
    }
    
    func presentAlert(alert: UIAlertController) {
        self.present(alert, animated: true)
    }
}

extension VerifiedMethodDetailViewController: InspectionCellButtonDelegate {
    func goToInspectionEditScreen() {
        // Only for Demo purposes
        let alert = UIAlertController(title:   "Edit button clicked!",
                                      message: "Going to Edit screen", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.presentAlert(alert: alert)
    }
    
    func goToInspectionDetailScreen() {
        // Only for Demo purposes
        let alert = UIAlertController(title:   "Detail Button clicked!",
                                      message: "Going to Detail screen", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.presentAlert(alert: alert)
    }
}

extension VerifiedMethodDetailViewController: UITableViewDelegate, UITableViewDataSource {
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
        return dateHeaderHeight
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
                           descriptionText: inspectionCellData.descriptionText,
                           allowEditing:    true)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReprovedInspectionCell.identifier(),
                                                     for:            indexPath) as! ReprovedInspectionCell
            
            cell.configure(delegate:        self,
                           severity:        inspectionCellData.severity,
                           deadline:        inspectionCellData.deadline,
                           descriptionText: inspectionCellData.descriptionText,
                           allowEditing:    true)
            
            return cell
        }
    }
}

extension VerifiedMethodDetailViewController: ScrollWithTableViewDelegate {
    func updateTableViewHeight() -> CGFloat {
        var height: CGFloat = 0
        
        for group in groupedInspectionList {
            let approvedInspections = group.value.filter{ $0.status == .approved }.count
            let reprovedInspections = group.value.count - approvedInspections
            let incrementHeight     = dateHeaderHeight
                                      + ApprovedInspectionCell.cellHeight * CGFloat(approvedInspections)
                                      + ReprovedInspectionCell.cellHeight * CGFloat(reprovedInspections)
                                      + 10 * CGFloat(group.value.count)
            
            height += incrementHeight
        }
        
        return height
    }
}
