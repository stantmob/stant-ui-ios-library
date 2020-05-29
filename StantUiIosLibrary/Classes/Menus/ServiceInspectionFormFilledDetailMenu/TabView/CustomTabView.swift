//
//  CustomTabView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

class CustomTabView: UIView {
    var stackView:        UIStackView?
    var formButton:       CustomTabViewButton?
    var teamButton:       CustomTabViewButton?
    var attachmentButton: CustomTabViewButton?
    var delegate:         CustomTabViewDelegate?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configureStackView()
    }
    
    func configureStackView() {
        stackView              = UIStackView()
        guard let stackView    = stackView else { return }
        stackView.alignment    = .fill
        stackView.distribution = .fillEqually
        stackView.axis         = .horizontal
        
        self.addSubview(stackView)
        stackView.fillSuperView()
        
        configureFormButton()
        configureTeamButton()
        configureAttachmentButton()
    }
    
    func configureFormButton() {
        formButton            = CustomTabViewButton(frame: CGRect(x: 0, y: 0, width: 109, height: 38))
        guard let formButton  = formButton else { return }
        guard let stackView   = stackView else { return }
        
        formButton.configure(title: AppStrings.service_inspection_form_filled_details_form_title)
        formButton.toggleSelection()
        formButton.addTarget(self, action: #selector(goToFormTabView), for: .touchUpInside)
        stackView.addArrangedSubview(formButton)
        
    }
    
    @objc func goToFormTabView() {
        formButton?.tag       = 1
        teamButton?.tag       = 0
        attachmentButton?.tag = 0
        delegate?.goToFormTabView()
    }
    
    func configureTeamButton() {
        teamButton            = CustomTabViewButton(frame: CGRect(x: 0, y: 0, width: 109, height: 38))
        guard let teamButton  = teamButton else { return }
        guard let stackView   = stackView else { return }
        
        teamButton.configure(title: AppStrings.service_inspection_form_filled_details_team_title)
        teamButton.addTarget(self, action: #selector(goToTeamTabView), for: .touchUpInside)
        stackView.addArrangedSubview(teamButton)
    }
    
    @objc func goToTeamTabView() {
        formButton?.tag       = 0
        teamButton?.tag       = 1
        attachmentButton?.tag = 0
        delegate?.goToTeamTabView()
    }
    
    func configureAttachmentButton() {
        attachmentButton            = CustomTabViewButton(frame: CGRect(x: 0, y: 0, width: 109, height: 38))
        guard let attachmentButton  = attachmentButton else { return }
        guard let stackView         = stackView else { return }
        
        attachmentButton.configure(title: AppStrings.service_inspection_form_filled_details_attachments_title)
        attachmentButton.addTarget(self, action: #selector(goToAttachmentTabView), for: .touchUpInside)
        stackView.addArrangedSubview(attachmentButton)
    }
    
    @objc func goToAttachmentTabView() {
        formButton?.tag       = 0
        teamButton?.tag       = 0
        attachmentButton?.tag = 1
        delegate?.goToAttachmentTabView()
    }
}

protocol CustomTabViewDelegate {
    func goToFormTabView()
    func goToTeamTabView()
    func goToAttachmentTabView()
}
