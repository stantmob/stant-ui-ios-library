//
//  CustomDatePicker.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 02/09/20.
//

import UIKit

public class CustomDatePicker: FormCustomTextField {
    let datePicker = UIDatePicker()
    
    public func configureDatePicker(placeholder: String,
                                    required:    Bool,
                                    delegate:    CustomDatePickerDelegate) {
        
        self.delegate     = delegate
        self.keyboardType = .numberPad
        
        super.configureTextField(placeholder:  placeholder,
                                 required:     required,
                                 keyboardType: .numberPad)
        
        self.inputAccessoryView = setBar()
        addCalendarRightView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(pickDateByText))
        self.addGestureRecognizer(tap)
    }
    
    public override func setBar() -> UIToolbar {
        let toolBar             = UIToolbar()
        toolBar.barStyle        = UIBarStyle.default
        toolBar.isTranslucent   = true
        toolBar.tintColor       = UIColor.black
        self.inputAccessoryView = nil
        toolBar.sizeToFit()

        let cancelButton  = UIBarButtonItem(title:  LibraryStrings.cancel,
                                            style:  .plain,
                                            target: self,
                                            action: #selector(cancelDatePicker))
        let confirmButton = UIBarButtonItem(title:  LibraryStrings.confirm,
                                            style:  .plain,
                                            target: self,
                                            action: #selector(confirmDatePicker))
        let spaceButton   = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                            target:              nil,
                                            action:              nil)

        toolBar.setItems([cancelButton, spaceButton, confirmButton], animated: false)
        return toolBar
    }
    
    public func addCalendarRightView() {
        let calendarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        calendarButton.setImage(UIImage(named: "calendarIcon"), for: .normal)
        
        calendarButton.addTarget(self,
                                 action: #selector(showDatePicker),
                                 for:    .touchUpInside)
        
        self.rightView                                                       = calendarButton
        self.rightViewMode                                                   = .always
        self.rightView?.widthAnchor.constraint(equalToConstant: 38).isActive = true
    }
    
    public func setDateRestrictions(defaultValue: Date  = Date(),
                                    minimumDate:  Date? = nil,
                                    maximumDate:  Date? = nil) {
        
        let formatter        = DateFormatter()
        formatter.dateFormat = LibraryStrings.date_format
        self.text            = formatter.string(from: datePicker.date)
        datePicker.date      = defaultValue
        
        if let minimumDate = minimumDate {
            datePicker.minimumDate = minimumDate
        }
        
        if let maximumDate = maximumDate {
            datePicker.maximumDate = maximumDate
        }
    }
}
