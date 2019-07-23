//
//  BottomDialogWithScrollViewController.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 10/07/19.
//

import UIKit

public class BottomDialogWithScrollViewController: UIViewController {
    
    public weak var cellDelegate: ScrollableTableViewDialogCellDelegate?
    
    private var backgroundView: UIView?
    private var mainView: UIView?
    public var tableView: UITableView?
    
    private var items                   = [String]()
    private var mainViewHeight: CGFloat = 374
    private var selectedItemIndex       = 0
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.clear
    }
    
    deinit {
        self.view.removeSubviews()
    }
    
    @objc func dismissViewController() {
        guard let backgroundView = backgroundView else { return }
        UIView.animate(withDuration: 0.2) {
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0)
        }
        self.dismissScreen()
    }
    
    func dismissScreen() {
        self.dismiss(animated: false, completion: nil)
    }
    
    public func configureView(items: [String], selectedItemIndex: Int) {
        self.view.removeSubviews()
        self.items             = items
        self.selectedItemIndex = selectedItemIndex
        
        self.addSubviews()
    }
    
    fileprivate func addSubviews() {
        backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        mainView       = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        guard let backgroundView = backgroundView, let mainView = mainView else { return }
        self.view.addSubviews(backgroundView, mainView)
        
        self.configureBackgroundView()
        self.configureMainView()
    }
    
    fileprivate func configureBackgroundView() {
        guard let backgroundView = backgroundView else { return }
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        backgroundView.addGestureRecognizer(tap)
        
        let tableViewHeight = (self.view.frame.height * 0.6) - 38
        
        backgroundView.anchor(top: self.view.topAnchor,
                              leading: self.view.leadingAnchor,
                              bottom: self.view.bottomAnchor,
                              trailing: self.view.trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(tableViewHeight), right: 0))
    }
    
    fileprivate func configureMainView() {
        guard let mainView = mainView else { return }
        mainView.backgroundColor = UIColor.white
        mainView.roundCorners(corners: [.topLeft, .topRight], radius: 5.0)
        
        mainViewHeight = (self.view.frame.height * 0.6)
        
        mainView.anchor(leading: self.view.leadingAnchor,
                        bottom: self.view.bottomAnchor,
                        trailing: self.view.trailingAnchor,
                        padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                        size: CGSize(width: 0, height: mainViewHeight))
        self.addSubviewsInsideDialog()
    }
    
    fileprivate func addSubviewsInsideDialog() {
        guard let mainView = mainView else { return }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 6))
        
        tableView = UITableView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: mainView.frame.width,
                                              height: mainViewHeight - 38),
                                style: .plain)
        
        guard let tableView = tableView else { return }
        mainView.addSubviews(view, tableView)
        
        self.adjustDetailViewOnTop(view: view)
        self.configureTableView()
    }
    
    fileprivate func adjustDetailViewOnTop(view: UIView) {
        guard let mainView = mainView else { return }
        view.layer.cornerRadius = 3.5
        view.backgroundColor    = UIColor.lightGrayStant
        
        view.anchor(top: mainView.topAnchor,
                    padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0),
                    size: CGSize(width: 120, height: 6))
        view.anchorCenterX(anchorX: mainView.centerXAnchor)
    }
    
    fileprivate func configureTableView() {
        guard let mainView = mainView, let tableView = tableView else { return }
        
        tableView.delegate                 = self
        tableView.dataSource               = self
        tableView.separatorStyle           = .none
        tableView.isUserInteractionEnabled = true
        tableView.isScrollEnabled          = true
        tableView.allowsMultipleSelection  = false
        
        tableView.register(ScrollableTableViewDialogCell.self, forCellReuseIdentifier: ScrollableTableViewDialogCell.IDENTIFIER)
        
        tableView.anchor(top: mainView.topAnchor,
                         leading: mainView.leadingAnchor,
                         bottom: mainView.bottomAnchor,
                         trailing: mainView.trailingAnchor,
                         padding: UIEdgeInsets(top: 38, left: 0, bottom: 0, right: 0))
    }
    
}

extension BottomDialogWithScrollViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScrollableTableViewDialogCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScrollableTableViewDialogCell.IDENTIFIER) as? ScrollableTableViewDialogCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configureViewWith(title: items[indexPath.row])
        
        if indexPath.row == selectedItemIndex {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismissScreen()

        if selectedItemIndex != indexPath.row {
            selectTableViewCellAt(indexPath: indexPath)
        }
    }
    
    fileprivate func selectTableViewCellAt(indexPath: IndexPath) {
        let cell = tableView(tableView ?? UITableView(), cellForRowAt: indexPath) as? ScrollableTableViewDialogCell
        cell?.accessoryType = .checkmark
        
        cellDelegate?.clickOnCellWith(index: indexPath.row, title: cell?.cellTextLabel?.text ?? "")
        
        for(index, _) in items.enumerated() {
            let cell = tableView(tableView ?? UITableView(), cellForRowAt: IndexPath(row: index, section: 0))
            cell.accessoryType = .none
            tableView?.deselectRow(at: IndexPath(row: index, section: 0), animated: false)
        }
        
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .none
    }
    
}
