//
//  RadioButtonSelectionViewController.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 03/09/20.
//

import UIKit

public class RadioButtonSelectionViewController: CheckMarkSelectionViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor = .white

        configureHeaderView()
        configureConfirmButton()
        configureTableView()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        self.view.removeSubviews()
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTitles.count
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SelectionTableViewCell.cellHeight
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectionTableViewCell.identifier(), for: indexPath)
                         as? SelectionTableViewCell else { return UITableViewCell() }
    
        let radioButton = CustomRadioButton()
        radioButton.configure(size: CGSize(width: 20, height: 20), color: .blueDarkStant)
        radioButton.innerView?.isHidden = !selectedItems.contains(indexPath.row)
            
        cell.accessoryView = radioButton
        
        if !iconsUrls.isEmpty {
            cell.configureViewWithIcons(title:    itemTitles[indexPath.row],
                                        subtitle: itemSubtitles.isEmpty ? "" : itemSubtitles[indexPath.row],
                                        imageUrl: iconsUrls[indexPath.row])
        } else {
            cell.configureSimpleView(title:    itemTitles[indexPath.row],
                                     subtitle: itemSubtitles.isEmpty ? "" : itemSubtitles[indexPath.row])
        }

        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectionType == .single {
            selectedItems = []
        } else if selectedItems.contains(indexPath.row) {
            selectedItems   = selectedItems.filter{ $0 != indexPath.row }
            guard let cell  = tableView.cellForRow(at: indexPath) as? SelectionTableViewCell else { return }
            let radioButton = cell.accessoryView as? CustomRadioButton
            
            radioButton?.deselect()
            return
        }
        
        let cell        = tableView.cellForRow(at: indexPath) as? SelectionTableViewCell
        let radioButton = cell?.accessoryView as? CustomRadioButton
        
        radioButton?.select()
        selectedItems.append(indexPath.row)
    }
    
    public override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedItems   = selectedItems.filter{ $0 != indexPath.row }
        guard let cell  = tableView.cellForRow(at: indexPath) as? SelectionTableViewCell else { return }
        let radioButton = cell.accessoryView as? CustomRadioButton
        
        radioButton?.deselect()
    }
}
