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
    
    //Place Planning
    public static let place_planning_sub_place_label  = localized("place_planning.sub_place_label")
    public static let place_planning_sub_places_label = localized("place_planning.sub_places_label")
    
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

