//
//  PhotoDetailStackView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class InChargeStackView: UIView {
    public var stackView:         UIStackView?
    public var responsibleDetail: InChargePersonDetailView?
    public var finalizerDetail:   InChargePersonDetailView?
    public var approverDetail:    InChargePersonDetailView?
    
    func configure(personNames: [String], photoUrls: [String]) {
        stackView              = UIStackView()
        guard let stackView    = stackView else { return }
        stackView.alignment    = .fill
        stackView.distribution = .fillEqually
        stackView.axis         = .horizontal
        stackView.spacing      = 14
        
        self.addSubview(stackView)
        stackView.fillSuperView()
        
        configureResponsibleDetail(personName: personNames[0], photoUrl: photoUrls[0])
        configureFinalizerDetail(personName: personNames[1], photoUrl: photoUrls[1])
        configureApproverDetail(personName: personNames[2], photoUrl: photoUrls[2])
    }
    
    func configureResponsibleDetail(personName: String, photoUrl: String) {
        responsibleDetail = InChargePersonDetailView(frame:              CGRect(x: 0, y: 0, width: 100, height: 82),
                                                     personName:         personName,
                                                     personInChargeRole: LibraryStrings.service_inspection_form_filled_details_responsible,
                                                     photoUrl:           photoUrl)
        
        guard let stackView         = stackView,
              let responsibleDetail = responsibleDetail else { return }
        
        stackView.addArrangedSubview(responsibleDetail)
    }
    
    func configureFinalizerDetail(personName: String, photoUrl: String) {
        finalizerDetail = InChargePersonDetailView(frame:              CGRect(x: 0, y: 0, width: 100, height: 82),
                                                   personName:         personName,
                                                   personInChargeRole: LibraryStrings.service_inspection_form_filled_details_finalizer,
                                                   photoUrl:           photoUrl)
        
        guard let stackView       = stackView,
              let finalizerDetail = finalizerDetail else { return }
        
        stackView.addArrangedSubview(finalizerDetail)
    }
    
    func configureApproverDetail(personName: String, photoUrl: String) {
        approverDetail = InChargePersonDetailView(frame:              CGRect(x: 0, y: 0, width: 100, height: 82),
                                                  personName:         personName,
                                                  personInChargeRole: LibraryStrings.service_inspection_form_filled_details_approver,
                                                  photoUrl:           photoUrl)
        
        guard let stackView      = stackView,
              let approverDetail = approverDetail else { return }
        
        stackView.addArrangedSubview(approverDetail)
    }
}
