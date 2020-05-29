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
        
        self.addSubview(seeMoreView)
        seeMoreView.anchor(leading:  self.leadingAnchor,
                           bottom:   self.bottomAnchor,
                           trailing: self.trailingAnchor,
                           size:     CGSize(width: self.frame.width, height: 52))
        
        let seeMoreLabel           = UILabel()
        seeMoreLabel.textAlignment = .center
        seeMoreLabel.textColor     = .darkGrayStant
        seeMoreLabel.font          = UIFont.systemFont(ofSize: 12, weight: .bold)
        seeMoreLabel.text          = AppStrings.see_more.uppercased()
        
        seeMoreView.addSubview(seeMoreLabel)
        seeMoreLabel.fillSuperView()
    }
    
    func configureTableView() {
        tableView            = UITableView()
        guard let tableView  = tableView else { return }
        tableView.separatorStyle = .none
        tableView.delegate   = self
        tableView.dataSource = self
        
        self.addSubview(tableView)
        tableView.anchor(top:      self.topAnchor,
                         leading:  self.leadingAnchor,
                         bottom:   seeMoreView?.topAnchor,
                         trailing: self.trailingAnchor)
        
        tableView.register(PersonTableViewCell.self,
                           forCellReuseIdentifier: PersonTableViewCell.identifier())
    }
}

extension TeamTabView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personNames.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PersonTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier(),
                                                 for:            indexPath) as! PersonTableViewCell
        
        cell.configureViewWithIcons(title:    personNames[indexPath.row],
                                    subtitle: personRoles.isEmpty ? "" : personRoles[indexPath.row],
                                    imageUrl: photoUrls.isEmpty ? "" : photoUrls[indexPath.row])
            
        return cell
    }
    
    
}
