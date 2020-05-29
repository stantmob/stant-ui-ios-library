//
//  TeamTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

class TeamTabView: UIView {
    var tableView:   UITableView?
    var seeMoreView: UIView?
    
    var personNames: [String] = []
    var personRoles: [String] = []
    var photoUrls:   [String] = []

    func configure(personNames: [String],
                   personRoles: [String] = [],
                   photoUrls:   [String] = []) {
        
        self.personNames = personNames
        self.personRoles = personRoles
        self.photoUrls   = photoUrls
        
        configureSeeMoreView()
        configureTableView()
    }
    
    func configureSeeMoreView() {
        seeMoreView           = UIView()
        guard let seeMoreView = seeMoreView else { return }
        seeMoreView.backgroundColor = .red
        
        self.addSubview(seeMoreView)
        seeMoreView.anchor(leading: self.leadingAnchor,
                           bottom: self.bottomAnchor,
                           trailing: self.trailingAnchor,
                           size: CGSize(width: self.frame.width, height: 52))
    }
    
    func configureTableView() {
        tableView            = UITableView()
        guard let tableView  = tableView else { return }
        tableView.backgroundColor = .blue
        tableView.delegate   = self
        tableView.dataSource = self
        
        self.addSubview(tableView)
        tableView.anchor(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom: seeMoreView?.topAnchor,
                         trailing: self.trailingAnchor)
        
        tableView.register(TeamTabTableViewCell.self,
                           forCellReuseIdentifier: TeamTabTableViewCell.identifier())
    }
}

extension TeamTabView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTabTableViewCell.identifier(),
                                                 for:            indexPath) as! TeamTabTableViewCell
        
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
