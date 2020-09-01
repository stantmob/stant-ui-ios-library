//
//  TeamScreenViewController.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 03/06/20.
//

import UIKit

public class TeamScreenViewController: UIViewController {
    public var navigationView: SecondHeaderView?
    public var tableView:      UITableView?
    public var photoUrls:      [String] = []
    public var personNames:    [String] = []
    public var personRoles:    [String] = []

    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor = .white

        configureHeaderView()
        configureTableView()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        self.view.removeSubviews()
    }
    
    public func configure(personNames: [String],
                          personRoles: [String] = [],
                          photoUrls:   [String] = []) {
        self.personNames = personNames
        self.personRoles = personRoles
        self.photoUrls   = photoUrls
    }
    
    func configureHeaderView() {
        navigationView = SecondHeaderView(frame: CGRect(x:      0,
                                                        y:      0,
                                                        width:  self.view.frame.width,
                                                        height: SecondHeaderView.headerHeight))
        
        let backButton = SecondHeaderButton(action: #selector(dimissScreen),
                                            target: self,
                                            icon:   UIImage(named: "back") ?? UIImage())

        guard let navigationView = navigationView else { return }
        
        navigationView.configure(title:      LibraryStrings.service_inspection_form_filled_details_team_title,
                                 titleFont:  .systemFont(ofSize: 14, weight: .medium),
                                 leftButton: backButton)
        
        self.view.addSubview(navigationView)
        navigationView.anchor(top:      self.view.topAnchor,
                              leading:  self.view.leadingAnchor,
                              trailing: self.view.trailingAnchor,
                              padding:  UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0),
                              size:     CGSize(width: 0, height: SecondHeaderView.headerHeight))
    }
    
    @objc func dimissScreen() {
        self.dismiss(animated: false, completion: nil)
    }
    
    func configureTableView() {
        tableView                          = UITableView()
        guard let tableView                = tableView else { return }
        tableView.delegate                 = self
        tableView.dataSource               = self
        tableView.separatorStyle           = .none
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      navigationView?.bottomAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor)
        
        tableView.register(SelectionTableViewCell.self,
                           forCellReuseIdentifier: SelectionTableViewCell.identifier())
    }
}
