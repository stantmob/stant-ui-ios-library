//
//  ServiceInspectionFormFilledDetailMenuView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class ServiceInspectionFormFilledDetailMenuView: UIView {
    var inChargeStackView: InChargeStackView?
    var mainTabView:       CustomTabView?
    var formTabView:       FormTabView?
    var teamTabView:       TeamTabView?
    var attachmentTabView: AttachmentTabView?
    
    public func configureInChargeStackView(personInChargeNames:     [String],
                                           personInChargeRoles:     [String],
                                           personInChargePhotoUrls: [String]) {
        
        inChargeStackView           = InChargeStackView()
        guard let inChargeStackView = inChargeStackView else { return }

        self.addSubview(inChargeStackView)
        inChargeStackView.anchor(top:      self.topAnchor,
                                 leading:  self.leadingAnchor,
                                 trailing: self.trailingAnchor,
                                 size:     CGSize(width: self.frame.width, height: 82))
        
        inChargeStackView.configure(personNames:         personInChargeNames,
                                    personInChargeRoles: personInChargeRoles,
                                    photoUrls:           personInChargePhotoUrls)
    }
    
    public func configureMainTabView() {
        mainTabView           = CustomTabView(formTitle:       AppStrings.service_inspection_form_filled_details_form_title,
                                              teamTitle:       AppStrings.service_inspection_form_filled_details_team_title,
                                              attachmentTitle: AppStrings.service_inspection_form_filled_details_attachments_title)
        guard let mainTabView = mainTabView else { return }
        mainTabView.delegate  = self
        
        self.addSubview(mainTabView)
        mainTabView.anchor(top:      inChargeStackView?.bottomAnchor,
                           leading:  self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           padding:  UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
                           size:     CGSize(width: self.frame.width, height: 38))
    }
    
    public func configureFormTab(beginDate:       String,
                                 endDate:         String,
                                 quantiy:         String,
                                 unitMeasurement: String,
                                 tests:           String) {
       
        formTabView           = FormTabView()
        guard let formTabView = formTabView else { return }
        formTabView.isHidden  = false
        
        self.addSubview(formTabView)
        formTabView.anchor(top:      mainTabView?.bottomAnchor,
                           leading:  self.leadingAnchor,
                           bottom:   self.bottomAnchor,
                           trailing: self.trailingAnchor,
                           padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        formTabView.configure(beginDate:       beginDate,
                              endDate:         endDate,
                              quantiy:         quantiy,
                              unitMeasurement: unitMeasurement,
                              tests:           tests)
    }
    
    public func configureTeamTab(personNames: [String],
                                 personRoles: [String] = [],
                                 photoUrls:   [String] = []) {
       
        teamTabView           = TeamTabView()
        guard let teamTabView = teamTabView else { return }
        teamTabView.isHidden  = true
        
        self.addSubview(teamTabView)
        teamTabView.anchor(top:      mainTabView?.bottomAnchor,
                           leading:  self.leadingAnchor,
                           bottom:   self.bottomAnchor,
                           trailing: self.trailingAnchor,
                           padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        teamTabView.configure()
    }
    
    public func configureAttachmentTab() {
        attachmentTabView           = AttachmentTabView()
        guard let attachmentTabView = attachmentTabView else { return }
        attachmentTabView.isHidden  = true
        
        self.addSubview(attachmentTabView)
        attachmentTabView.anchor(top:      mainTabView?.bottomAnchor,
                                 leading:  self.leadingAnchor,
                                 bottom:   self.bottomAnchor,
                                 trailing: self.trailingAnchor,
                                 padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        attachmentTabView.configure()
    }
}

extension ServiceInspectionFormFilledDetailMenuView: CustomTabViewDelegate {
    func goToFormTabView() {
        setVisibilty(view: formTabView)
    }
    
    func goToTeamTabView() {
        setVisibilty(view: teamTabView)
    }
    
    func goToAttachmentTabView() {
        setVisibilty(view: attachmentTabView)
    }
    
    func setVisibilty(view: UIView?) {
        formTabView?.isHidden       = view != formTabView
        teamTabView?.isHidden       = view != teamTabView
        attachmentTabView?.isHidden = view != attachmentTabView
    }
}
