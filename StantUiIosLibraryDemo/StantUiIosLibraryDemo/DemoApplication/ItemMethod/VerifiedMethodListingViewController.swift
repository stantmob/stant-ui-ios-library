//
//  VerifiedMethodListingViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 12/06/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class VerifiedMethodListingViewController: UIViewController {
    public var tableView: UITableView?
    
    public let statusList: [VerifiedMethodStatusEnum] = [.notApplicable, .notInspected, .reproved, .approved,
                                                         .notApplicable, .notInspected, .reproved, .approved,
                                                         .notApplicable, .notInspected, .reproved, .approved]
    public let isReinspectionList: [Bool]             = (1...12).map { index in return index % 2 == 0 }
    public let hasAttachmentList:  [Bool]             = (1...12).map { index in return index % 3 == 0 }
    
    public let descriptionText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the                                                            industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and                                                         scrambled it to make a type specimen book."
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
        tableView                = UITableView()
        guard let tableView      = tableView else { return }
        tableView.delegate       = self
        tableView.dataSource     = self
        tableView.separatorStyle = .none
        tableView.clipsToBounds  = false
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding:  UIEdgeInsets(top: 100, left: 22, bottom: 0, right: 15))
        
        tableView.register(VerifiedMethodCell.self, forCellReuseIdentifier: VerifiedMethodCell.identifier())
    }
}

extension VerifiedMethodListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return VerifiedMethodCell.cellHeight
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VerifiedMethodCell.identifier(), for: indexPath) as! VerifiedMethodCell
        
        cell.configure(status:          statusList[indexPath.row],
                       order:           indexPath.row + 1,
                       isReinspection:  isReinspectionList[indexPath.row],
                       hasAttachment:   hasAttachmentList[indexPath.row],
                       descriptionText: descriptionText)
        
        return cell
    }
}
