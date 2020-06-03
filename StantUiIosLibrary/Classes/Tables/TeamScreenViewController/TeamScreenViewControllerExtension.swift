//
//  TeamScreenViewControllerExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 03/06/20.
//

import UIKit

extension TeamScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView:                   UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        return personNames.count
    }
    
    public func tableView(_ tableView:              UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return SelectionTableViewCell.cellHeight
    }
    
    public func tableView(_ tableView:            UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView
        .dequeueReusableCell(withIdentifier: SelectionTableViewCell.identifier(),
                             for:            indexPath)  as! SelectionTableViewCell
        
        cell.configureViewWithIcons(title:    personNames[indexPath.row],
                                    subtitle: personRoles.isEmpty ? "" : personRoles[indexPath.row],
                                    imageUrl: photoUrls[indexPath.row])

        return cell
    }
}
