//
//  RadioButtonBottomDialogWithScrollViewController.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 03/09/20.
//

import UIKit

public class RadioButtonBottomDialogWithScrollViewController: CheckMarkBottomDialogWithScrollViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScrollableTableViewDialogCell.cellHeight
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScrollableTableViewDialogCell.identifier())
                         as? ScrollableTableViewDialogCell else { return UITableViewCell() }
        
        let radioButton = CustomRadioButton()
        radioButton.configure(size: CGSize(width: 20, height: 20), color: .blueDarkStant)
        radioButton.innerView?.isHidden = indexPath.row != selectedItemIndex
            
        cell.accessoryView = radioButton
        
        if !icons.isEmpty {
            cell.configureViewWith(title: items[indexPath.row], imageURL: icons[indexPath.row])
        } else if !leftViews.isEmpty {
            cell.configureViewWith(title: items[indexPath.row], leftImage: leftViews[indexPath.row].asImage())
        } else {
            cell.configureViewWith(title: items[indexPath.row])
        }
        
        if indexPath.row == selectedItemIndex {
            radioButton.select()
        }
    
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.backgroundView?.alpha = 0
        
        guard let cell  = tableView.cellForRow(at: indexPath) else { return }
        let radioButton = cell.accessoryView as? CustomRadioButton
        
        radioButton?.deselect()
        
        UIView.animate(withDuration: 0.2) {
            self.dismiss(animated: true, completion: nil)
            self.selectTableViewCellAt(indexPath: indexPath)
        }
    }
    
    public override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell  = tableView.cellForRow(at: indexPath) else { return }
        let radioButton = cell.accessoryView as? CustomRadioButton
        radioButton?.deselect()
    }
}
