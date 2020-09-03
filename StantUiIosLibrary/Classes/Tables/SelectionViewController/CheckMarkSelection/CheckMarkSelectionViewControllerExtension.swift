//
//  CheckMarkSelectionViewControllerExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 21/05/20.
//

extension CheckMarkSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTitles.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SelectionTableViewCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectionTableViewCell.identifier(), for: indexPath)
                         as? SelectionTableViewCell else { return UITableViewCell() }
    
        cell.accessoryType = selectedItems.contains(indexPath.row) ? .checkmark : .none
        
        if !iconsUrls.isEmpty {
            cell.configureViewWithIcons(title:    itemTitles[indexPath.row],
                                        subtitle: itemSubtitles.isEmpty ? "" : itemSubtitles[indexPath.row],
                                        imageUrl: iconsUrls[indexPath.row])
        } else {
            cell.configureView(title:    itemTitles[indexPath.row],
                               subtitle: itemSubtitles.isEmpty ? "" : itemSubtitles[indexPath.row])
        }

        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectionType == .single {
            selectedItems = []
        } else if selectedItems.contains(indexPath.row) {
            selectedItems      = selectedItems.filter{ $0 != indexPath.row }
            guard let cell     = tableView.cellForRow(at: indexPath) as? SelectionTableViewCell else { return }
            cell.accessoryType = .none
            return
        }
        
        let cell            = tableView.cellForRow(at: indexPath) as? SelectionTableViewCell
        cell?.accessoryType = .checkmark
        selectedItems.append(indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedItems      = selectedItems.filter{ $0 != indexPath.row }
        guard let cell     = tableView.cellForRow(at: indexPath) as? SelectionTableViewCell else { return }
        cell.accessoryType = .none
    }
}

public enum SelectionType {
    case single
    case multiple
}

public protocol SelectionViewDelegate {
    func getSelectedItems(items: [Int])
}
