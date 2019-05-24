//
//  ConstructionCardViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 22/05/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ConstructionCardViewController: UIViewController {
    
    var tableView: UITableView?
    
    let navigationBarHeight: CGFloat = 44
    let cardTitle                    = "Some title"
    let cardSubtitle                 = "Some subtitle"
    let cardUrl                      = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw"
    let cardColor                    = UIColor.blue
    let cardPercentage: CGFloat      = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white

        self.configureTableView()
    }
    
    fileprivate func configureTableView() {
        tableView = UITableView(frame: CGRect(x: 0,
                                              y: navigationBarHeight,
                                              width: self.view.frame.width,
                                              height: self.view.frame.height - navigationBarHeight),
                                style: .plain)
        tableView?.delegate       = self
        tableView?.dataSource     = self
        
        tableView?.register(ConstructionCard.self, forCellReuseIdentifier: ConstructionCard.IDENTIFIER)
        
        if let tableView = tableView {
            self.view.addSubview(tableView)
        }
    }
}

extension ConstructionCardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ConstructionCard.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConstructionCard.IDENTIFIER) as? ConstructionCard else {
            return UITableViewCell()
        }
        
        let construction = Construction(title: cardTitle, subtitle: cardSubtitle, imageUrl: cardUrl, color: cardColor, percentage: cardPercentage )
        cell.configureViewFor(construction: construction)
        
        return cell
    }
    
}
