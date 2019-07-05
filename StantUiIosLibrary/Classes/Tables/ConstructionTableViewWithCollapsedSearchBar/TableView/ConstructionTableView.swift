//
//  ConstructionTableView.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 27/06/19.
//

import UIKit

public class ConstructionTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var previousScrollOffset: CGFloat  = 0
    
    public var filteredConstructionSiteList   = [Construction]()
    public var currentHeightConstant: CGFloat = DefaultSearchBar.searchViewHeight
    public let maxHeaderHeight: CGFloat       = DefaultSearchBar.searchViewHeight
    public let minHeaderHeight: CGFloat       = 0
    
    public var animationDelegate: ShowAndHideSearchTableViewDelegate?
    var selectCellDelegate: ConstructionTableViewDidSelectDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    public func configureTableViewWith(constructionList: [Construction],
                                       animationDelegate: ShowAndHideSearchTableViewDelegate,
                                       selectCellDelegate: ConstructionTableViewDidSelectDelegate?) {
        self.delegate        = self
        self.dataSource      = self
        self.separatorStyle  = .none
        
        self.animationDelegate            = animationDelegate
        self.selectCellDelegate           = selectCellDelegate
        self.filteredConstructionSiteList = constructionList
        self.register(ConstructionCard.self, forCellReuseIdentifier: ConstructionCard.IDENTIFIER)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredConstructionSiteList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ConstructionCard.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConstructionCard.IDENTIFIER, for: indexPath) as? ConstructionCard else {
            return UITableViewCell()
        }
        
        cell.configureViewFor(construction: filteredConstructionSiteList[indexPath.row])
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCellDelegate?.didClickOnTableViewCellWith(index: indexPath.row)
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

public protocol ShowAndHideSearchTableViewDelegate: class {
    func collapseSearchView()
    func expandSearchView()
}

public protocol ConstructionTableViewDidSelectDelegate: class {
    func didClickOnTableViewCellWith(index: Int)
}
