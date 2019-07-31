//
//  GroupSelectionTableView.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 29/07/19.
//

import UIKit

public class GroupSelectionTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var previousScrollOffset: CGFloat  = 0
    
    public var filteredItemsList              = [GroupedSelection]()
    public var currentHeightConstant: CGFloat = DefaultSearchBar.searchViewHeight
    public let maxHeaderHeight: CGFloat       = DefaultSearchBar.searchViewHeight
    public let minHeaderHeight: CGFloat       = 0
    
    public var animationDelegate: GroupSelectionShowAndHideSearchTableViewDelegate?
    var selectCellDelegate: GroupSelectionTableViewDidSelectDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    public func configureTableViewWith(itemsList: [GroupedSelection],
                                       animationDelegate: GroupSelectionShowAndHideSearchTableViewDelegate,
                                       selectCellDelegate: GroupSelectionTableViewDidSelectDelegate?) {
        self.delegate        = self
        self.dataSource      = self
        self.separatorStyle  = .none
        
        self.animationDelegate  = animationDelegate
        self.selectCellDelegate = selectCellDelegate
        self.filteredItemsList  = itemsList
        self.register(GroupSelectionRowCell.self, forCellReuseIdentifier: GroupSelectionRowCell.identifier() )
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return filteredItemsList.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItemsList[section].itemsOfSection?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupSelectionRowCell.identifier(), for: indexPath) as? GroupSelectionRowCell else {
            return UITableViewCell()
        }
        if let itemsOfSection = filteredItemsList[indexPath.section].itemsOfSection {
            cell.configureCellWith(title: itemsOfSection[indexPath.row].itemTitle ?? "",
                                   icon: itemsOfSection[indexPath.row].itemImage ?? UIImage(),
                                   arrowImage: itemsOfSection[indexPath.row].arrowIcon ?? UIImage())
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: GroupSelectionHeaderView = GroupSelectionHeaderView(frame: CGRect(x: 0,
                                                                                          y: 0,
                                                                                          width: self.frame.width,
                                                                                          height: GroupSelectionHeaderView.headerHeight))
        
        headerView.configureHeaderView(title: filteredItemsList[section].sectionTitle ?? "",
                                       firstDate: filteredItemsList[section].firstDate,
                                       secondDate: filteredItemsList[section].secondDate)
        return headerView
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GroupSelectionRowCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return GroupSelectionHeaderView.headerHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCellDelegate?.didClickOnTableViewCellWith(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.checkScrollDirectionAndAnimateView(scrollView)
    }
    
    func checkScrollDirectionAndAnimateView(_ scrollView: UIScrollView) {
        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
        
        let absoluteTop: CGFloat    = 0
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height
        
        let isScrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp   = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom
        
        if canAnimateHeader(scrollView) {
            if isScrollingDown {
                animationDelegate?.collapseSearchView()
            } else if isScrollingUp {
                animationDelegate?.expandSearchView()
            }
            
            self.previousScrollOffset = scrollView.contentOffset.y
        }
    }
    
    func canAnimateHeader(_ scrollView: UIScrollView) -> Bool {
        let scrollViewMaxHeight = scrollView.frame.height + currentHeightConstant - minHeaderHeight
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    
    func setScrollPosition(_ position: CGFloat) {
        self.contentOffset = CGPoint(x: self.contentOffset.x, y: position)
    }
    
}

public protocol GroupSelectionShowAndHideSearchTableViewDelegate: class {
    func collapseSearchView()
    func expandSearchView()
}

public protocol GroupSelectionTableViewDidSelectDelegate: class {
    func didClickOnTableViewCellWith(indexPath: IndexPath)
}

