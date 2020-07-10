//
//  ItemMethodTableView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 10/07/20.
//

import UIKit

public class ItemMethodTableView: UIView {
    public var itemMethodIndicatorsView: ItemMethodIndicatorsView?
    public var tableView:                UITableView?
    public var originalContentOffset:    CGPoint?
    
    public let itemStatusList:        [ItemEnum] = [.approved, .reproved, .notInspected,
                                                    .approved, .reproved, .notInspected,
                                                    .approved, .reproved, .notInspected,
                                                    .approved, .reproved, .notInspected,
                                                    .approved, .reproved, .notInspected]
    public let hasReprovedMethodList: [Bool]     = (1...15).map { index in return index % 2 == 0 }
    public var isExpandedList:        [Bool]     = (1...15).map { _ in false }
    public let observationList:       [String]   = (1...15).map { index in return index % 2 == 0 ?
                                                                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit" : ""}
    
    public let verifiedMethodStatusList: [VerifiedMethodStatusEnum] = [.notApplicable, .notFilled, .reproved, .approved]
    public let isReinspectionList:       [Bool]                     = (1...4).map { index in return index % 2 == 0 }
    public let hasAttachmentList:        [Bool]                     = (1...4).map { index in return index % 3 == 0 }
    public let observationText                                      = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    
    //pass parameters
    public func configure() {
        configureItemMethodIndicatorsView() //pass parameters
        configureTableView() //pass parameters
    }
    
    fileprivate func configureItemMethodIndicatorsView() {
        itemMethodIndicatorsView           = ItemMethodIndicatorsView()
        guard let itemMethodIndicatorsView = itemMethodIndicatorsView else { return }
        
        self.addSubview(itemMethodIndicatorsView)
        itemMethodIndicatorsView.anchor(top:      self.topAnchor,
                                        leading:  self.leadingAnchor,
                                        trailing: self.trailingAnchor,
                                        size:     CGSize(width: 0, height: 38))
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        itemMethodIndicatorsView.configure(approvedNumber: 3, reprovedNumber: 1, notFilledNumber: 5) //pass parameters
    }
    
    fileprivate func configureTableView() {
        tableView                              = UITableView(frame: .zero, style: UITableView.Style.grouped)
        guard let tableView                    = tableView else { return }
        tableView.delegate                     = self
        tableView.dataSource                   = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor              = .white
        tableView.separatorStyle               = .none
        tableView.sectionFooterHeight          = 2
        
        self.addSubview(tableView)
        tableView.anchor(top:      itemMethodIndicatorsView?.bottomAnchor,
                         leading:  self.leadingAnchor,
                         bottom:   self.bottomAnchor,
                         trailing: self.trailingAnchor)
        
        tableView.register(ItemHeaderView.self, forHeaderFooterViewReuseIdentifier: ItemHeaderView.identifier())
        tableView.register(ItemObservationCell.self, forCellReuseIdentifier: ItemObservationCell.identifier())
        tableView.register(VerifiedMethodCell.self, forCellReuseIdentifier: VerifiedMethodCell.identifier())
    }
}
