//
//  DateExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/07/19.
//

import Foundation

extension Date {
    func toString(with format: String = "dd/MM/yyyy") -> String {
        let dateFormatter        = DateFormatter()
        let timeZone             = TimeZone(identifier: "America/Sao_Paulo")!
        let locale               = Locale(identifier: "pt_BR")
        dateFormatter.timeZone   = timeZone
        dateFormatter.locale     = locale
        dateFormatter.dateFormat = format
        dateFormatter.timeZone   = TimeZone(identifier: "GMT")
        
        return dateFormatter.string(from: self)
    }
}
