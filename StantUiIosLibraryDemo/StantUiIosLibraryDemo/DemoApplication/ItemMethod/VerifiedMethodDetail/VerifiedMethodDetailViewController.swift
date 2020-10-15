//
//  VerifiedMethodDetailViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 7/7/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class VerifiedMethodDetailViewController: UIViewController {
    public var scrollView:               ScrollWithTableView?
    public var verifiedMethodDetailView: VerifiedMethodDetailView?
    public var tableView:                UITableView?
    
    public var groupedInspectionList                = [(key: String, value: [InspectionCellData])]()
    public var verifiedMethodDescription            = "Observar a eliminação de qualquer foco de umidade de modo que a superfície apresente-se seca quando da execução da pintura"
    public let severityList: [Int]                  = [5, 3, 1, 0, 4, 3, 2, 0, 3, 5]
    public let descriptionList                      = (0..<10).map{"My really long description \($0 + 1)!!! My really long description \($0 + 1)!!!"}
    public let statusList: [InspectionCellTypeEnum] = [.reproved, .approved, .reproved, .approved, .reproved,
                                                       .approved, .reproved, .approved, .reproved, .approved]
    public let createdAtList                        = ["06/01/2020", "25/01/2020", "25/01/2020", "07/01/2020", "18/01/2020",
                                                       "06/01/2020", "18/01/2020", "25/01/2020", "06/01/2020", "03/01/2020"]
    public let deadlineList                         = ["25/01/2020", "30/01/2020", "19/01/2020", "21/01/2020", "30/01/2020",
                                                       "28/01/2020", "03/01/2020", "31/01/2020", "16/01/2020", "01/01/2020"]
    
    let dateHeaderHeight:    CGFloat = 20
    let navigationBarHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupedInspectionList = populateInspectionList()
        
        configureScrollView()
        configureCardsView()
        configureTableView()
    }
    
    func populateInspectionList() -> [(key: String, value: [InspectionCellData])] {
        var inspectionList = [InspectionCellData]()
        for i in (0..<10) {
            let inpectionCellData = InspectionCellData(createdAt:       createdAtList[i],
                                                       status:          statusList[i],
                                                       severity:        severityList[i],
                                                       deadline:        deadlineList[i],
                                                       descriptionText: descriptionList[i])
            
            inspectionList.append(inpectionCellData)
        }
        
        return Dictionary(grouping: inspectionList, by: { $0.createdAt }).sorted(by: { $0.0 > $1.0 })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .backgroundStant
    }
    
    func configureScrollView() {
        scrollView                              = ScrollWithTableView()
        guard let scrollView                    = scrollView else { return }
        scrollView.contentSize                  = self.view.frame.size
        scrollView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(scrollView)
        scrollView.anchor(top:      self.view.topAnchor,
                          leading:  self.view.leadingAnchor,
                          bottom:   self.view.bottomAnchor,
                          trailing: self.view.trailingAnchor,
                          padding:  UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0))
        
        scrollView.configure(tableViewDelegate: self)
    }
    
    func configureCardsView() {
        verifiedMethodDetailView           = VerifiedMethodDetailView()
        guard let verifiedMethodDetailView = verifiedMethodDetailView,
              let scrollView               = scrollView else { return }
        
        scrollView.addToContentView(verifiedMethodDetailView)
        verifiedMethodDetailView.anchor(top:      scrollView.topAnchor,
                                        leading:  scrollView.leadingAnchor,
                                        trailing: scrollView.trailingAnchor,
                                        size:     CGSize(width: 0, height: 250))
        
        verifiedMethodDetailView.configure(delegate:                  self,
                                           verifiedMethodDescription: verifiedMethodDescription)
        
        scrollView.updateContentSize(view:            verifiedMethodDetailView,
                                     verticalPadding: 0)
    }
    
    func configureTableView() {
        tableView                 = UITableView(frame: CGRect(), style: .grouped)
        guard let tableView       = tableView,
              let scrollView      = scrollView else { return }
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.separatorStyle  = .none
        tableView.clipsToBounds   = false
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
       
        scrollView.addToContentView(tableView)
        tableView.anchor(top:      verifiedMethodDetailView?.bottomAnchor,
                         leading:  scrollView.leadingAnchor,
                         bottom:   scrollView.bottomAnchor,
                         trailing: scrollView.trailingAnchor,
                         padding:  UIEdgeInsets(top: 20, left: 22, bottom: 0, right: 15))
        
        tableView.register(ApprovedInspectionCell.self, forCellReuseIdentifier: ApprovedInspectionCell.identifier())
        tableView.register(ReprovedInspectionCell.self, forCellReuseIdentifier: ReprovedInspectionCell.identifier())
        
        scrollView.updateContentSize(view: tableView, verticalPadding: 20)
    }
}

struct InspectionCellData {
    var guid:            String                 = ""
    var createdAt:       String                 = ""
    var status:          InspectionCellTypeEnum = .approved
    var severity:        Int                    = 0
    var deadline:        String                 = ""
    var descriptionText: String                 = ""
}
