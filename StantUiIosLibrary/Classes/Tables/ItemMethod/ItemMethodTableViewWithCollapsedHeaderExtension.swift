//
//  ItemMethodTableViewWithCollapsedHeaderExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 10/07/20.
//

import UIKit

//USE LIST!!!!
extension ItemMethodTableView: UITableViewDelegate, UITableViewDataSource {
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

extension ItemMethodTableView: ItemHeaderViewDelegate {
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
