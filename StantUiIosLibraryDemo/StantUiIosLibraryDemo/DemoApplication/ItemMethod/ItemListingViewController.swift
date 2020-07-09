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
    public var tableView:             UITableView?
    public var originalContentOffset: CGPoint?
    
    public let statusList: [ItemMethodEnum]  = [.approved, .reproved, .notInspected,
                                                .approved, .reproved, .notInspected,
                                                .approved, .reproved, .notInspected,
                                                .approved, .reproved, .notInspected,
                                                .approved, .reproved, .notInspected]
    public let hasReprovedMethodList: [Bool] = (1...15).map { index in return index % 2 == 0 }
    public var isExpandedList:        [Bool] = (1...15).map { _ in false }
    
    public let observationText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget risus in urna imperdiet sagittis ut vel quam. Fusce sagittis nec nibh ac pulvinar. Nunc aliquam lorem a mauris volutpat, ornare ultricies urna laoreet. Morbi vitae blandit velit. Nam eleifend nec tortor non convallis."
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        configureTableView()
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
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding:  UIEdgeInsets(top: 70, left: 1, bottom: 0, right: 0))
        
        tableView.register(ItemHeaderView.self, forHeaderFooterViewReuseIdentifier: ItemHeaderView.identifier())
        tableView.register(ItemObservationCell.self, forCellReuseIdentifier: ItemObservationCell.identifier())
    }
}

extension ItemListingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return statusList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ItemHeaderView.headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ItemHeaderView.identifier())
                         as! ItemHeaderView
        
        headerView.configure(delegate:          self,
                             section:           section,
                             status:            statusList[section],
                             hasReprovedMethod: hasReprovedMethodList[section],
                             isExpanded:        isExpandedList[section],
                             itemTitle:         "Item \(section + 1)")
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isExpandedList[section] ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItemObservationCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemObservationCell.identifier(),
                                                 for:            indexPath) as! ItemObservationCell
        
        cell.configure(observation: observationText)
        
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        originalContentOffset = nil
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let overrideOffset = originalContentOffset, scrollView.contentOffset != overrideOffset {
            scrollView.setContentOffset(overrideOffset, animated: false)
        }
    }
}

extension ItemListingViewController: ItemMethodHeaderViewDelegate {
    func toggleCollapse(section: Int) {
        guard let tableView = tableView else { return }
        
        if isExpandedList[section] {
            isExpandedList[section] = !isExpandedList[section]
            tableView.deleteRows(at: [IndexPath(row: 0, section: section)], with: .fade)
        } else {
            isExpandedList[section] = !isExpandedList[section]
            tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .fade)
        }
        
        if tableView.contentOffset != originalContentOffset {
            originalContentOffset = tableView.contentOffset
        }
    }
}
