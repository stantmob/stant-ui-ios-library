//
//  DateExtension.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 30/07/19.
//

import Foundation

extension Date {
    public func isValidDate(string: String) -> Date? {
        if string == "" { return nil }
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy" //AppStrings.date_format
        
        return dateFormatter.date(from: string)
    }

    
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
