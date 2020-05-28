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
        let bundle = Bundle.init(identifier: "org.cocoapods.StantUiIosLibrary") ?? Bundle.main
        return NSLocalizedString(value, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}

