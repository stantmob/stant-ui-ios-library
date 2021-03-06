//
//  TeamTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class TeamTabView: UIView {
    public var tableView:   UITableView?
    public var seeMoreView: UIView?
    public var delegate:    TeamTabViewDelegate?
    
    public var personNames: [String] = []
    public var personRoles: [String] = []
    public var photoUrls:   [String] = []

    func configure(personNames: [String],
                   personRoles: [String] = [],
                   photoUrls:   [String] = []) {
        
        self.personNames = personNames
        self.personRoles = personRoles
        self.photoUrls   = photoUrls
        
        configureTableView()
        configureSeeMoreView()
    }
    
    func configureTableView() {
        tableView                              = UITableView()
        guard let tableView                    = tableView else { return }
        tableView.separatorStyle               = .none
        tableView.delegate                     = self
        tableView.dataSource                   = self
        tableView.showsVerticalScrollIndicator = false
        
        self.addSubview(tableView)
        tableView.anchor(top:      self.topAnchor,
                         leading:  self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         size:     CGSize(width: self.frame.width, height: 75))
        
        tableView.register(SelectionTableViewCell.self,
                           forCellReuseIdentifier: SelectionTableViewCell.identifier())
    }
    
    func configureSeeMoreView() {
        seeMoreView           = UIView()
        guard let seeMoreView = seeMoreView else { return }
        
        self.addSubview(seeMoreView)
        seeMoreView.anchor(top:      tableView?.bottomAnchor,
                           leading:  self.leadingAnchor,
                           bottom:   self.bottomAnchor,
                           trailing: self.trailingAnchor)
        
        let seeMoreLabel           = UILabel()
        seeMoreLabel.textAlignment = .center
        seeMoreLabel.textColor     = personNames.isEmpty ? .lightGrayStant : .darkGrayStant
        seeMoreLabel.font          = UIFont.systemFont(ofSize: 12, weight: .bold)
        seeMoreLabel.text          = LibraryStrings.see_more.uppercased()
        
        seeMoreView.addSubview(seeMoreLabel)
        seeMoreLabel.fillSuperView()
        
        if personNames.isEmpty { return }
        
        let tap = UITapGestureRecognizer(target: delegate, action: #selector(delegate?.showTeamScreen))
        seeMoreView.addGestureRecognizer(tap)
    }
}

extension TeamTabView: UITableViewDelegate, UITableViewDataSource {
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
                                 for:            indexPath) as! SelectionTableViewCell
        
        cell.configureViewWithIcons(title:    personNames[indexPath.row],
                                    subtitle: personRoles.isEmpty ? "" : personRoles[indexPath.row],
                                    imageUrl: photoUrls.isEmpty ? "" : photoUrls[indexPath.row])
            
        return cell
    }
}


@objc public protocol TeamTabViewDelegate {
    @objc func showTeamScreen()
}
