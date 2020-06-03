//
//  ServiceInspectionFormFilledTableView.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

public class ServiceInspectionForFilledTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    
    
    
    
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }
    
}

public protocol ServiceInspectionFormFilledTableViewDidSelectDelegate: class {
    func didClickOnTableViewCellWith(index: Int)
}
