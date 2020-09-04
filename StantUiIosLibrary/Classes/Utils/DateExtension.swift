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
        dateFormatter.dateFormat = LibraryStrings.date_format
        
        return dateFormatter.date(from: string)
    }
    
    public func toString(with format: String = LibraryStrings.date_format) -> String {
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
