//
//  AppStrings.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 28/05/20.
//

import UIKit

class AppStrings {
    //General
    public static let see_more = localized("see_more")
    
    //Service Inspection Form Filled Details
    public static let service_inspection_form_filled_details_responsible = localized("service_inspection_form_filled_details.responsible")
    public static let service_inspection_form_filled_details_finalizer   = localized("service_inspection_form_filled_details.finalizer")
    public static let service_inspection_form_filled_details_approver    = localized("service_inspection_form_filled_details.approver")
    
    public static let service_inspection_form_filled_details_form_title        = localized("service_inspection_form_filled_details.form_title")
    public static let service_inspection_form_filled_details_team_title        = localized("service_inspection_form_filled_details.team_title")
    public static let service_inspection_form_filled_details_attachments_title = localized("service_inspection_form_filled_details.attachments_title")

    public static let service_inspection_form_filled_details_begin_label    = localized("service_inspection_form_filled_details.begin_label")
    public static let service_inspection_form_filled_details_deadline_label = localized("service_inspection_form_filled_details.deadline_label")
    public static let service_inspection_form_filled_details_quantity_label = localized("service_inspection_form_filled_details.quantity_label")
    public static let service_inspection_form_filled_details_tests_label    = localized("service_inspection_form_filled_details.tests_label")
    
    public static let service_inspection_form_filled_details_progress_label   = localized("service_inspection_form_filled_details.progress_label")
    public static let service_inspection_form_filled_details_finished_label   = localized("service_inspection_form_filled_details.finished_label")
    public static let service_inspection_form_filled_details_approved_label   = localized("service_inspection_form_filled_details.approved_label")
    public static let service_inspection_form_filled_details_late_label       = localized("service_inspection_form_filled_details.late_label")
    public static let service_inspection_form_filled_details_of_planned_label = localized("service_inspection_form_filled_details.of_planned_label")
    public static let service_inspection_form_filled_details_out_of_label     = localized("service_inspection_form_filled_details.out_of_label")
    
    //Verified Method Details
    public static let verified_method_details_description_label      = localized("verified_method_details.description_label")
    public static let verified_method_details_not_applicable_label   = localized("verified_method_details.not_applicable_label")
    public static let verified_method_details_inspections_label      = localized("verified_method_details.inspections_label")
    public static let verified_method_details_approved_title_button  = localized("verified_method_details.approved_title_button")
    public static let verified_method_details_reproved_title_button  = localized("verified_method_details.reproved_title_button")
    public static let verified_method_details_warning_title_action   = localized("verified_method_details.warning_title_action")
    public static let verified_method_details_warning_message_action = localized("verified_method_details.warning_message_action")
    public static let verified_method_details_warning_button_ok      = localized("verified_method_details.warning_button_ok")
    

    
    public static func localized(_ value: String) -> String {
        let currentLanguage = Locale.current
        let bundle          = Bundle.init(identifier: "org.cocoapods.StantUiIosLibrary") ?? Bundle.main
        
        if currentLanguage.languageCode == "pt" {
            return NSLocalizedString(value, tableName: "Localizable-pt", bundle: bundle, comment: "")
        } else {
            return NSLocalizedString(value, tableName: "Localizable-en", bundle: bundle, comment: "")
        }
    }
}

