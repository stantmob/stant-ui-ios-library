//
//  CustomDatePickerExtension.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 02/09/20.
//

import UIKit

public protocol CustomDatePickerDelegate: UITextFieldDelegate {
    func textField(_ textField:                    UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string:       String) -> Bool
    func textFieldDidEndEditing(_ textField: UITextField)
}

extension CustomDatePicker {
    @objc func pickDateByText() {
        guard let text = self.text else { return }
        self.inputView = nil
        currentText    = text
        self.becomeFirstResponder()
    }
    
    @objc func showDatePicker() {
        datePicker.datePickerMode = .date
        self.inputView            = datePicker
        currentText               = self.text ?? ""
        self.becomeFirstResponder()
    }
    
    @objc func confirmDatePicker(){
        if let datePicker = self.inputView as? UIDatePicker {
            let formatter        = DateFormatter()
            formatter.dateFormat = LibraryStrings.date_format
            self.text            = formatter.string(from: datePicker.date)
            
            self.endEditing(true)
            self.togglePlaceholderLabel()
            return
        }
        
        guard let text = self.text else { return }
        
        let validDate    = datePicker.isValidDate(string: text) != nil
        self.text        = validDate ? text : (required ? datePicker.date.toString() : "")
        self.currentText = text
        datePicker.date  = datePicker.isValidDate(string: text) ?? Date()
        
        self.endEditing(true)
        self.togglePlaceholderLabel()
    }
    
    @objc func cancelDatePicker() {
        self.text       = currentText
        datePicker.date = datePicker.isValidDate(string: self.text ?? "") ?? Date()
        self.endEditing(true)
    }
    
    public override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
         if action == #selector(UIResponderStandardEditActions.paste(_:)) {
             return false
         }
        
         return super.canPerformAction(action, withSender: sender)
    }
}
