//
//  ContactsTableViewWithCollapseSearchBar.swift
//  StantUiIosLibrary
//
//  Created by Renato Vieira on 27/06/19.
//

import UIKit

public class ContactsTableViewWithCollapseSearchBar: UIView {

    public var tableView:         ContactsTableView?
    public var searchView:        DefaultSearchBar?
    public var emptyMessageLabel: UILabel?
    public var presenterDelegate: UIViewController?
    weak var tableViewDelegate:   ContactsTableViewDidSelectDelegate?
    
    var searchBarIcon           = UIImage()
    var searchBarPlaceholder    = String()
    var searchOnTableView       = String()
    var emptyMessage            = String()
    public var contactsSiteList = [ContactsInformation]()
    
    var currentSearch = ""
    
    required public init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
    }
       
    public override init(frame: CGRect) {
           super.init(frame: frame)
    }
    
    public func configureViewWith(contactsList:          [ContactsInformation],
                                  searchBarIcon:         UIImage,
                                  searchBarPlaceholder:  String,
                                  tableViewDelegate:     ContactsTableViewDidSelectDelegate,
                                  emptyMessage:          String,
                                  callToMessage:         String,
                                  mailMessage:           String,
                                  supportWarningMessage: String,
                                  makeCall:              String,
                                  sendMail:              String,
                                  warningMessage:        String,
                                  guidance:              String,
                                  cancel:                String) {
        
        self.tableViewDelegate    = tableViewDelegate
        self.contactsSiteList     = contactsList
        self.searchBarIcon        = searchBarIcon
        self.searchBarPlaceholder = searchBarPlaceholder
        self.emptyMessage         = emptyMessage
        self.backgroundColor      = .backgroundStant
        
        self.configureEmptyMessageLabel()
        self.configureSearchView()
        self.configureTableView(callToMessage:         callToMessage,
                                mailMessage:           mailMessage,
                                supportWarningMessage: supportWarningMessage,
                                makeCall:              makeCall,
                                sendMail:              sendMail,
                                warningMessage:        warningMessage,
                                guidance:              guidance,
                                cancel:                cancel)
        self.setEmptyMessageLabelVisibility()
    }
    
    fileprivate func configureSearchView() {
        searchView = DefaultSearchBar()
        
        guard let searchView = searchView else { return }

        self.addSubview(searchView)
        searchView.anchor(top:      self.topAnchor,
                          leading:  self.leadingAnchor,
                          trailing: self.trailingAnchor)

        searchView.configureViewWith(delegate:        self,
                                     image:           searchBarIcon,
                                     placeholderText: searchBarPlaceholder)
    }
    
    fileprivate func configureTableView(callToMessage:         String,
                                        mailMessage:           String,
                                        supportWarningMessage: String,
                                        makeCall:              String,
                                        sendMail:              String,
                                        warningMessage:        String,
                                        guidance:              String,
                                        cancel:                String){
        tableView = ContactsTableView(frame: CGRect(x:      0,
                                                    y:      DefaultSearchBar.searchViewHeight,
                                                    width:  self.frame.width,
                                                    height: self.frame.height))
        
        tableView?.register(ContactsCard.self, forCellReuseIdentifier: ContactsCard.identifier())
        
        tableView?.configureTableViewWith(contactsList:          contactsSiteList,
                                          animationDelegate:     self,
                                          selectCellDelegate:    tableViewDelegate,
                                          callToMessage:         callToMessage,
                                          mailMessage:           mailMessage,
                                          supportWarningMessage: supportWarningMessage,
                                          makeCall:              makeCall,
                                          sendMail:              sendMail,
                                          warningMessage:        warningMessage,
                                          guidance:              guidance,
                                          cancel:                cancel)
        tableView?.backgroundColor   = .clear
        tableView?.presenterDelegate = presenterDelegate

        if let tableView = tableView {
            self.addSubview(tableView)
        }
        
        tableView?.anchor(top:      searchView?.topAnchor,
                          leading:  self.leadingAnchor,
                          bottom:   self.bottomAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top: DefaultSearchBar.searchViewHeight, left: 0, bottom: 0, right: 0))
    }
    
    fileprivate func configureEmptyMessageLabel() {
        emptyMessageLabel?.removeFromSuperview()
        emptyMessageLabel = UILabel(frame: CGRect(x:      0,
                                                  y:      DefaultSearchBar.searchViewHeight,
                                                  width:  self.frame.width,
                                                  height: self.frame.height))
        
        guard let emptyMessageLabel = emptyMessageLabel else { return }
        emptyMessageLabel.configure(text:      emptyMessage,
                                    alignment: .left,
                                    size:      16,
                                    weight:    .regular,
                                    color:     .darkStant)
        self.addSubview(emptyMessageLabel)
        emptyMessageLabel.numberOfLines = 0
    }
    
    public func updateContactsList(_ contacts: [ContactsInformation]) {
        self.contactsSiteList                = contacts
        self.tableView?.filteredContactsList = contacts

        self.updateTableViewWith(search: currentSearch)
        self.setEmptyMessageLabelVisibility()
    }
    
    func setEmptyMessageLabelVisibility() {
        let listIsNotEmpty = !(tableView?.filteredContactsList.isEmpty ?? false)

        if listIsNotEmpty {
            emptyMessageLabel?.isHidden = true
            return
        }
        
        guard let emptyMessageLabel = emptyMessageLabel, let tableView = tableView else { return }
        emptyMessageLabel.anchor(top:      tableView.topAnchor,
                                 leading:  self.leadingAnchor,
                                 trailing: self.trailingAnchor,
                                 padding:  UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                                 size:     CGSize(width: 0, height: 50))
        emptyMessageLabel.isHidden = false
    }
}
