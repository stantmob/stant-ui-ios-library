//
//  ServiceInspectionFormFilledCollapsedSearchBar.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

public class ServiceInspectionFormFilledCollapsedSearchBar : UIView {
    
    public var tableView:         ServiceInspectionForFilledTableView?
    public var searchView:        DefaultSearchBar?
    public var emptyMessageLabel: UILabel?
    
    weak var tableViewDelegate: ServiceInspectionFormFilledTableViewDidSelectDelegate?
    
    var searchBarIcon        = UIImage()
    var searchBarPlaceholder = String()
    var searchOnTableView    = String()
    var emptyMessage         = String()
    var currentSearch        = ""
    
    public var serviceInpsectionFormFilledList = [ServiceInpectionFormFilledDto]()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configureTableViewWith(serviceInpsectionFormFilledList: [ServiceInpectionFormFilledDto],
                                       searchBarIcon:                   UIImage,
                                       searchBarPlaceholder:            String,
                                       tableViewDelegate:               ServiceInspectionFormFilledTableViewDidSelectDelegate,
                                       emptyMessage:                    String){
        
        self.serviceInpsectionFormFilledList = serviceInpsectionFormFilledList
        self.searchBarIcon                   = searchBarIcon
        self.searchBarPlaceholder            = searchBarPlaceholder
        self.tableViewDelegate               = tableViewDelegate
        self.emptyMessage                    = emptyMessage
    }
}
