//
//  UIDatePickerExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 03/09/20.
//

import Foundation

extension UIDatePicker {
    public func isValidDate(string: String) -> Date? {
        if string == "" { return nil }
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = LibraryStrings.date_format
        
        let date = dateFormatter.date(from: string)
        
        if let date = date, let minimumDate = self.minimumDate {
            if date < minimumDate { return nil }
        }
        
        if let date = date, let maximumDate = self.maximumDate {
            if date > maximumDate { return nil }
        }
        
        return date
    }
}
