//
//  SelectionViewController.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 05/05/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

public class SelectionViewController: UIViewController {
    public var headerView:        UIView?
    public var tableView:         UITableView?
    public var confirmButton:     UIButton?
    public var headerTitle:       String?
    public var selectionType:     SelectionType?
    public var confirmButtonText: String?
    public var iconsUrls:         [String] = []
    public var itemTitles:        [String] = []
    public var itemSubtitles:     [String] = []
    public var selectedItems:     [Int]    = []
    public var delegate:          SelectionViewDelegate?
    
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
    
    public func configure(delegate:          SelectionViewDelegate,
                          headerTitle:       String,
                          selectionType:     SelectionType,
                          confirmButtonText: String,
                          itemTitles:        [String],
                          itemSubtitles:     [String] = [],
                          iconsUrls:         [String] = []) {
        self.delegate          = delegate
        self.headerTitle       = headerTitle
        self.selectionType     = selectionType
        self.confirmButtonText = confirmButtonText
        self.itemTitles        = itemTitles
        self.itemSubtitles     = itemSubtitles
        self.iconsUrls         = iconsUrls
    }
    
    func configureHeaderView() {
        headerView           = UIView()
        guard let headerView = headerView else { return }
        
        setTitleLabel()
        setCloseButton()
        
        self.view.addSubview(headerView)
        headerView.anchor(top:      self.view.topAnchor,
                          leading:  self.view.leadingAnchor,
                          trailing: self.view.trailingAnchor,
                          padding:  UIEdgeInsets(top: 20 , left: 0, bottom: 0, right: 0),
                          size:     CGSize(width: self.view.frame.width, height: 56))
    }
    
    func setTitleLabel() {
        let titleLabel           = UILabel()
        guard let headerView     = headerView else { return }
        titleLabel.text          = headerTitle
        titleLabel.textAlignment = .center
        titleLabel.font          = .systemFont(ofSize: 16, weight: .bold)
        
        headerView.addSubview(titleLabel)
        titleLabel.anchor(top:     headerView.topAnchor,
                          leading: headerView.leadingAnchor)
        
        titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
    }
    
    func setCloseButton() {
        let closeButton                = UIButton()
        guard let headerView           = headerView else { return }
        closeButton.backgroundColor    = .lightGrayStant
        closeButton.layer.cornerRadius = 22
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        
        headerView.addSubview(closeButton)
        closeButton.anchor(top:      headerView.topAnchor,
                           trailing: headerView.trailingAnchor,
                           padding:  UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 16),
                           size:     CGSize(width: 44, height: 44))
        closeButton.addTarget(self, action: #selector(dimissScreen), for: .touchUpInside)
    }
    
    @objc func dimissScreen() {
        self.dismiss(animated: false, completion: nil)
    }
    
    func configureConfirmButton() {
        confirmButton                    = UIButton()
        guard let confirmButton          = confirmButton else { return }
        confirmButton.layer.cornerRadius = 3
        confirmButton.clipsToBounds      = true
        confirmButton.titleLabel?.font   = UIFont.boldSystemFont(ofSize: 14)
        confirmButton.backgroundColor    = .greenStant
        
        self.view.addSubview(confirmButton)
        confirmButton.setTitle(confirmButtonText?.uppercased(), for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        
        confirmButton.anchor(leading:  self.view.leadingAnchor,
                             bottom:   self.view.bottomAnchor,
                             trailing: self.view.trailingAnchor,
                             padding:  UIEdgeInsets(top: 2 , left: 16, bottom: 16, right: 16),
                             size:     CGSize(width: self.view.frame.width, height: 50))
        
        confirmButton.addTarget(self, action: #selector(returnSelectedItems), for: .touchUpInside)
    }
    
    func configureTableView() {
        tableView                          = UITableView()
        guard let tableView                = tableView else { return }
        tableView.delegate                 = self
        tableView.dataSource               = self
        tableView.separatorStyle           = .none
        tableView.isUserInteractionEnabled = true
        tableView.isScrollEnabled          = true
        tableView.allowsMultipleSelection  = selectionType == .multiple
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      headerView?.bottomAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   confirmButton?.topAnchor,
                         trailing: self.view.trailingAnchor)
        
        tableView.register(SelectionTableViewCell.self, forCellReuseIdentifier: SelectionTableViewCell.identifier())
    }
    
    @objc func returnSelectedItems() {
        self.dismiss(animated: true, completion: nil)
        delegate?.getSelectedItems(items: selectedItems)
        selectedItems = []
    }
}

extension SelectionViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTitles.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SelectionTableViewCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectionTableViewCell.identifier(), for: indexPath)
                         as? SelectionTableViewCell else { return UITableViewCell() }
    
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
            for index in selectedItems {
                let cell           = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! SelectionTableViewCell
                cell.accessoryType = .none
                tableView.deselectRow(at: IndexPath(row: index, section: 0), animated: false)
            }
            selectedItems = []
        }
        
        let cell           = tableView.cellForRow(at: indexPath) as! SelectionTableViewCell
        cell.accessoryType = .checkmark
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        selectedItems.append(indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell           = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! SelectionTableViewCell
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
