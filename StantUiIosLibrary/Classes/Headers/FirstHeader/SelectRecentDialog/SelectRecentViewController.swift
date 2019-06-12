//
//  SelectRecentViewController.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/05/19.
//
import UIKit

public class SelectRecentViewController: UIViewController {
    
    public weak var cellDelegate: RecentItemCellDelegate?
    
    var backgroundView: UIView?
    var mainView: UIView?
    public var tableView: UITableView?
    
    public var recentItems      = [FirstHeaderRecentItem]()
    var mainViewHeight: CGFloat = 374
    var selectedItemIndex       = 0
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.clear
    }
    
    deinit {
        self.backgroundView = nil
        self.mainView       = nil
        self.tableView      = nil
    }
    
    @objc func dismissViewController() {
        self.dismissScreen()
    }
    
    func dismissScreen() {
        self.dismiss(animated: false, completion: nil)
    }
    
    public func configureView(recentItems: [FirstHeaderRecentItem], selectedItemIndex: Int) {
        self.recentItems       = recentItems
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
        
        let tableViewHeight = 56 * recentItems.count
        
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
        
        if recentItems.count < 6 {
            mainViewHeight = CGFloat(38 + (56 * recentItems.count))
        }
    
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
        tableView.separatorStyle           = .singleLine
        tableView.isUserInteractionEnabled = true
        tableView.isScrollEnabled          = false
        tableView.allowsMultipleSelection  = false
        
        tableView.register(FirstHeaderRecentItemCell.self, forCellReuseIdentifier: FirstHeaderRecentItemCell.IDENTIFIER)
        
        tableView.anchor(top: mainView.topAnchor,
                         leading: mainView.leadingAnchor,
                         bottom: mainView.bottomAnchor,
                         trailing: mainView.trailingAnchor,
                         padding: UIEdgeInsets(top: 38, left: 0, bottom: 0, right: 0))
    }
    
}

extension SelectRecentViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentItems.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FirstHeaderRecentItemCell.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstHeaderRecentItemCell.IDENTIFIER) as? FirstHeaderRecentItemCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configureViewFor(item: recentItems[indexPath.row])
        
        if indexPath.row == selectedItemIndex {
            cell.accessoryType = .checkmark
        }
    
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismissScreen()
        for i in 0...(recentItems.count - 1) {
            guard let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) else { return }
            cell.accessoryType = .none
            tableView.deselectRow(at: IndexPath(row: i, section: 0), animated: false)
        }
        
        guard let cell = tableView.cellForRow(at: indexPath) as? FirstHeaderRecentItemCell else { return }
        cell.accessoryType = .checkmark
        cellDelegate?.clickOnCellWith(index: indexPath.row, title: cell.item?.title ?? "")
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = .none
    }
    
}

