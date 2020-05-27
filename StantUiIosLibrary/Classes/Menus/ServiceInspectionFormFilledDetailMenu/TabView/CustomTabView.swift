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
    
    init(formTitle:       String,
         teamTitle:       String,
         attachmentTitle: String) {
        
        super.init(frame: .zero)
        configureStackView(formTitle:       formTitle,
                           teamTitle:       teamTitle,
                           attachmentTitle: attachmentTitle)
    }
    
    func configureStackView(formTitle:       String,
                            teamTitle:       String,
                            attachmentTitle: String) {
        
        stackView              = UIStackView()
        guard let stackView    = stackView else { return }
        stackView.alignment    = .fill
        stackView.distribution = .fillEqually
        stackView.axis         = .horizontal
        
        self.addSubview(stackView)
        stackView.fillSuperView()
        
        configureFormButton(title: formTitle)
        configureTeamButton(title: teamTitle)
        configureAttachmentButton(title: attachmentTitle)
    }
    
    func configureFormButton(title: String) {
        formButton            = CustomTabViewButton(frame: CGRect(x: 0, y: 0, width: 109, height: 38))
        guard let formButton  = formButton else { return }
        guard let stackView   = stackView else { return }
        
        formButton.configure(title: title)
        formButton.select()
        formButton.addTarget(self, action: #selector(goToFormTabView), for: .touchUpInside)
        stackView.addArrangedSubview(formButton)
        
    }
    
    @objc func goToFormTabView() {
        formButton?.select()
        teamButton?.deselect()
        attachmentButton?.deselect()
        delegate?.goToFormTabView()
    }
    
    func configureTeamButton(title: String) {
        teamButton            = CustomTabViewButton(frame: CGRect(x: 0, y: 0, width: 109, height: 38))
        guard let teamButton  = teamButton else { return }
        guard let stackView   = stackView else { return }
        
        teamButton.configure(title: title)
        teamButton.deselect()
        teamButton.addTarget(self, action: #selector(goToTeamTabView), for: .touchUpInside)
        stackView.addArrangedSubview(teamButton)
    }
    
    @objc func goToTeamTabView() {
        formButton?.deselect()
        teamButton?.select()
        attachmentButton?.deselect()
        delegate?.goToTeamTabView()
    }
    
    func configureAttachmentButton(title: String) {
        attachmentButton            = CustomTabViewButton(frame: CGRect(x: 0, y: 0, width: 109, height: 38))
        guard let attachmentButton  = attachmentButton else { return }
        guard let stackView         = stackView else { return }
        
        attachmentButton.configure(title: title)
        attachmentButton.deselect()
        attachmentButton.addTarget(self, action: #selector(goToAttachmentTabView), for: .touchUpInside)
        stackView.addArrangedSubview(attachmentButton)
    }
    
    @objc func goToAttachmentTabView() {
        formButton?.deselect()
        teamButton?.deselect()
        attachmentButton?.select()
        delegate?.goToAttachmentTabView()
    }
}

protocol CustomTabViewDelegate {
    func goToFormTabView()
    func goToTeamTabView()
    func goToAttachmentTabView()
}
