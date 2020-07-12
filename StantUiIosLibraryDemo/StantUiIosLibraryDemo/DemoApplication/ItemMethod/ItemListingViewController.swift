//
//  ItemListingViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 12/06/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ItemListingViewController: UIViewController {
    public var itemMethodIndicatorsView: ItemMethodIndicatorsView?
    public var tableView:                UITableView?
    public var originalContentOffset:    CGPoint?
    
    public let itemStatusList:        [ItemStatusEnum] = [.approved, .reproved, .notFilled,
                                                          .approved, .reproved, .notFilled,
                                                          .approved, .reproved, .notFilled,
                                                          .approved, .reproved, .notFilled,
                                                          .approved, .reproved, .notFilled]
    public let hasReprovedMethodList: [Bool]     = (1...15).map { index in return index % 2 == 0 }
    public var isExpandedList:        [Bool]     = (1...15).map { _ in false }
    public let observationList:       [String]   = (1...15).map { index in return index % 2 == 0 ?
                                                                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit" : ""}
    
    public let verifiedMethodStatusList: [VerifiedMethodStatusEnum] = [.notApplicable, .notInspected, .reproved, .approved]
    public let isReinspectionList:       [Bool]                     = (1...4).map { index in return index % 2 == 0 }
    public let hasAttachmentList:        [Bool]                     = (1...4).map { index in return index % 3 == 0 }
    public let observationText                                      = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white

        configureItemMethodIndicatorsView()
        configureTableView()
    }
    
    func configureItemMethodIndicatorsView() {
        itemMethodIndicatorsView           = ItemMethodIndicatorsView()
        guard let itemMethodIndicatorsView = itemMethodIndicatorsView else { return }
        
        self.view.addSubview(itemMethodIndicatorsView)
        itemMethodIndicatorsView.anchor(top:      self.view.topAnchor,
                                        leading:  self.view.leadingAnchor,
                                        trailing: self.view.trailingAnchor,
                                        padding:  UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0),
                                        size:     CGSize(width: 0, height: 38))
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        itemMethodIndicatorsView.configure(approvedNumber: 3, reprovedNumber: 1, notFilledNumber: 5)
    }
    
    func configureTableView() {
        tableView                              = UITableView(frame: .zero, style: UITableView.Style.grouped)
        guard let tableView                    = tableView else { return }
        tableView.delegate                     = self
        tableView.dataSource                   = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor              = .white
        tableView.separatorStyle               = .none
        tableView.sectionFooterHeight          = 2
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      itemMethodIndicatorsView?.bottomAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor)
        
        tableView.register(ItemHeaderView.self, forHeaderFooterViewReuseIdentifier: ItemHeaderView.identifier())
        tableView.register(ItemObservationCell.self, forCellReuseIdentifier: ItemObservationCell.identifier())
        tableView.register(VerifiedMethodCell.self, forCellReuseIdentifier: VerifiedMethodCell.identifier())
    }
}

extension ItemListingViewController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return itemStatusList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ItemHeaderView.headerHeight
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ItemHeaderView.identifier())
                         as! ItemHeaderView
        
        headerView.configure(delegate:          self,
                             section:           section,
                             status:            itemStatusList[section],
                             hasReprovedMethod: hasReprovedMethodList[section],
                             isExpanded:        isExpandedList[section],
                             itemTitle:         "Item \(section + 1)")
        
        return headerView
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isExpandedList[section] ? 5 : 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return observationList[indexPath.section].isEmpty ? 0 : ItemObservationCell.cellHeight
        }
        return VerifiedMethodCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemObservationCell.identifier(),
                                                     for:            indexPath) as! ItemObservationCell
        
            cell.configure(observation: observationList[indexPath.section])
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: VerifiedMethodCell.identifier(),
                                                 for:            indexPath) as! VerifiedMethodCell
        
        cell.configure(status:          verifiedMethodStatusList[indexPath.row - 1],
                       order:           indexPath.row,
                       isReinspection:  isReinspectionList[indexPath.row - 1],
                       hasAttachment:   hasAttachmentList[indexPath.row - 1],
                       descriptionText: observationText)
        
        return cell
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        originalContentOffset = nil
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let overrideOffset = originalContentOffset, scrollView.contentOffset != overrideOffset {
            scrollView.setContentOffset(overrideOffset, animated: false)
        }
    }
}

extension ItemListingViewController: ItemHeaderViewDelegate {
    public func toggleCollapse(section: Int) {
        let indexList       = (0...4).map{IndexPath(row: $0, section: section)}
        guard let tableView = tableView else { return }
        
        if isExpandedList[section] {
            isExpandedList[section] = !isExpandedList[section]
            tableView.deleteRows(at: indexList, with: .fade)
        } else {
            isExpandedList[section] = !isExpandedList[section]
            tableView.insertRows(at: indexList, with: .fade)
        }
        
        if tableView.contentOffset != originalContentOffset {
            originalContentOffset = tableView.contentOffset
        }
    }
}
