//
//  ContactsTableView.swift
//  StantUiIosLibrary
//
//  Created by Renato Vieira on 28/11/19.
//

import Foundation

public class ContactsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var previousScrollOffset: CGFloat  = 0
    
    public var allConstructionSiteList        = [ContactsInformation]()
    public var filteredConstructionSiteList   = [ContactsInformation]()
    public var currentHeightConstant: CGFloat = DefaultSearchBar.searchViewHeight
    public let maxHeaderHeight: CGFloat       = DefaultSearchBar.searchViewHeight
    public let minHeaderHeight: CGFloat       = 0
    
    public var animationDelegate: ContactsAndHideSearchTableViewDelegate?
    var selectCellDelegate:       ContactsTableViewDidSelectDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    public func configureTableViewWith(constructionList:   [ContactsInformation],
                                       animationDelegate:  ContactsAndHideSearchTableViewDelegate,
                                       selectCellDelegate: ContactsTableViewDidSelectDelegate?) {
        self.delegate        = self
        self.dataSource      = self
        self.separatorStyle  = .none
        
        self.animationDelegate            = animationDelegate
        self.selectCellDelegate           = selectCellDelegate
        self.filteredConstructionSiteList = constructionList
        self.allConstructionSiteList      = constructionList
        self.register(ContactsCard.self, forCellReuseIdentifier: ContactsCard.identifier())
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return filteredConstructionSiteList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactsCard.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsCard.identifier(), for: indexPath) as? ContactsCard else {
            return UITableViewCell()
        }
        
        cell.configureViewFor(construction: filteredConstructionSiteList[indexPath.row])

        return cell
    }
    
     public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let clickedConstruction      = filteredConstructionSiteList[indexPath.row]
            let clickedConstructionIndex = allConstructionSiteList.firstIndex(where: {$0.name == clickedConstruction.name}) ?? indexPath.row
            
            selectCellDelegate?.didClickOnTableViewCellWith(index: clickedConstructionIndex)
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

public protocol ContactsAndHideSearchTableViewDelegate: class {
    func collapseSearchView()
    func expandSearchView()
}

public protocol ContactsTableViewDidSelectDelegate: class {
    func didClickOnTableViewCellWith(index: Int)
}

