//
//  AppStrings.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 28/05/20.
//

import UIKit

class AppStrings {
    public static let form_title        = localized("form_title")
    public static let team_title        = localized("team_title")
    public static let attachments_title = localized("attachments_title")
    
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

