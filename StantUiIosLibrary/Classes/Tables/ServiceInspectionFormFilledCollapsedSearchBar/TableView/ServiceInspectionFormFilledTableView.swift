//
//  ServiceInspectionFormFilledTableView.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

public class ServiceInspectionFormFilledTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var previousScrollOffset: CGFloat  = 0
    
    public var allServiceInspectionFormFilledList      = [ServiceInpectionFormFilled]()
    public var filteredServiceInspectionFormFilledList = [ServiceInpectionFormFilled]()
    public var currentHeightConstant: CGFloat          = DefaultSearchBar.searchViewHeight
    
    public let maxHeaderHeight: CGFloat                = DefaultSearchBar.searchViewHeight
    public let minHeaderHeight: CGFloat                = 0
    
    public var animationDelegate: ServiceInspectionFormFilledAndHideSearchTableViewDelegate?
    var selectCellDelegate:       ServiceInspectionFormFilledTableViewDidSelectDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    public func configureTableViewWith(serviceInspectionFormFilledList: [ServiceInpectionFormFilled],
                                       animationDelegate:               ServiceInspectionFormFilledAndHideSearchTableViewDelegate,
                                       selectCellDelegate:              ServiceInspectionFormFilledTableViewDidSelectDelegate?) {
        self.delegate        = self
        self.dataSource      = self
        self.separatorStyle  = .none
        
        self.animationDelegate                       = animationDelegate
        self.selectCellDelegate                      = selectCellDelegate
        self.filteredServiceInspectionFormFilledList = serviceInspectionFormFilledList
        self.allServiceInspectionFormFilledList      = serviceInspectionFormFilledList
        self.register(ServiceInspectionFormFilledCell.self, forCellReuseIdentifier: ServiceInspectionFormFilledCell.identifier())
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredServiceInspectionFormFilledList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ServiceInspectionFormFilledCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ServiceInspectionFormFilledCell.identifier(), for: indexPath) as? ServiceInspectionFormFilledCell else { return UITableViewCell() }
        
        cell.configureViewFor(serviceInspectionFormFilled: filteredServiceInspectionFormFilledList[indexPath.row])
        
        return cell
    }
}

public protocol ServiceInspectionFormFilledAndHideSearchTableViewDelegate: class {
    func collapseSearchView()
    func expandSearchView()
}

public protocol ServiceInspectionFormFilledTableViewDidSelectDelegate: class {
    func didClickOnTableViewCellWith(index: Int)
}
