//
//  PhotoDetailStackView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 27/05/20.
//

import UIKit

public class InChargeStackView: UIView {
    var stackView:         UIStackView?
    var responsibleDetail: PhotoDetailView?
    var finalizerDetail:   PhotoDetailView?
    var approverDetail:    PhotoDetailView?
    
    func configure(personNames:         [String],
                   photoUrls:           [String]) {
        
        stackView              = UIStackView()
        guard let stackView    = stackView else { return }
        stackView.alignment    = .fill
        stackView.distribution = .fillEqually
        stackView.axis         = .horizontal
        stackView.spacing      = 14
        
        self.addSubview(stackView)
        stackView.fillSuperView()
        
        configureResponsibleDetail(personName:         personNames[0],
                                   photoUrl:           photoUrls[0])
        
        configureFinalizerDetail(personName:         personNames[1],
                                 photoUrl:           photoUrls[1])
        
        configureApproverDetail(personName:         personNames[2],
                                photoUrl:           photoUrls[2])
    }
    
    func configureResponsibleDetail(personName:         String,
                                    photoUrl:           String) {
        
        responsibleDetail = PhotoDetailView(frame:              CGRect(x: 0, y: 0, width: 100, height: 82),
                                            personName:         personName,
                                            personInChargeRole: AppStrings.service_inspection_form_filled_details_responsible,
                                            photoUrl:           photoUrl)
        
        guard let stackView         = stackView else { return }
        guard let responsibleDetail = responsibleDetail else { return }
        stackView.addArrangedSubview(responsibleDetail)
    }
    
    func configureFinalizerDetail(personName:         String,
                                  photoUrl:           String) {
        
        finalizerDetail = PhotoDetailView(frame:              CGRect(x: 0, y: 0, width: 100, height: 82),
                                          personName:         personName,
                                          personInChargeRole: AppStrings.service_inspection_form_filled_details_finalizer,
                                          photoUrl:           photoUrl)
        
        guard let stackView       = stackView else { return }
        guard let finalizerDetail = finalizerDetail else { return }
        stackView.addArrangedSubview(finalizerDetail)
    }
    
    func configureApproverDetail(personName:         String,
                                 photoUrl:           String) {
        
        approverDetail = PhotoDetailView(frame:              CGRect(x: 0, y: 0, width: 100, height: 82),
                                         personName:         personName,
                                         personInChargeRole: AppStrings.service_inspection_form_filled_details_approver,
                                         photoUrl:           photoUrl)
        
        guard let stackView      = stackView else { return }
        guard let approverDetail = approverDetail else { return }
        stackView.addArrangedSubview(approverDetail)
    }
}
