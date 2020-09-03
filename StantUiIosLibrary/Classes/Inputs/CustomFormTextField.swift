//
//  CustomFormTextField.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 02/09/20.
//

import UIKit

public class CustomFormTextField: UITextField {
    public var placeholderLabel:   UILabel?
    public var requiredFieldLabel: UILabel?
    public var required:           Bool   = false
    public var currentText:        String = ""
    
    public func configureTextField(placeholder:  String,
                                   required:     Bool,
                                   keyboardType: UIKeyboardType = .default) {
        
        self.required              = required
        self.keyboardType          = keyboardType
        self.attributedPlaceholder = NSAttributedString(string:     placeholder,
                                                        attributes: [NSAttributedString.Key
                                                                    .foregroundColor: UIColor.darkGrayStant])

        self.addBorders(edges:     [.bottom],
                        thickness: 1,
                        color:     .darkGrayStant)
        
        if required { addRequiredFieldLabel() }
        
        addPlaceHolderLabel(placeholder: placeholder)
        self.addLeftPadding(width: 12)
        
        self.addTarget(self, action: #selector(togglePlaceholderLabel), for: .allEditingEvents)
        self.inputAccessoryView = setBar()
    }
    
    public func setBar() -> UIToolbar {
        let toolBar           = UIToolbar()
        toolBar.barStyle      = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor     = UIColor.black
        toolBar.sizeToFit()

        let cancelButton  = UIBarButtonItem(title:  LibraryStrings.cancel,
                                            style:  .plain,
                                            target: self,
                                            action: #selector(cancelEditing))
        let confirmButton = UIBarButtonItem(title:  LibraryStrings.confirm,
                                            style:  .plain,
                                            target: self,
                                            action: #selector(confirmEditing))
        let spaceButton   = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                            target:              nil,
                                            action:              nil)

        toolBar.setItems([cancelButton, spaceButton, confirmButton], animated: false)
        return toolBar
    }
    
    func addRequiredFieldLabel() {
        requiredFieldLabel           = UILabel()
        guard let requiredFieldLabel = requiredFieldLabel else { return }
        requiredFieldLabel.font      = .systemFont(ofSize: 12, weight: .light)
        requiredFieldLabel.textColor = .darkGrayStant
        requiredFieldLabel.text      = "    " + LibraryStrings.required_field
        
        self.addSubview(requiredFieldLabel)
        requiredFieldLabel.anchor(top:     self.bottomAnchor,
                                  leading: leadingAnchor,
                                  padding: UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0),
                                  size:    CGSize(width: self.frame.width, height: 14))
    }
    
    func addPlaceHolderLabel(placeholder: String) {
        placeholderLabel           = UILabel()
        guard let placeholderLabel = placeholderLabel else { return }
        placeholderLabel.font      = .systemFont(ofSize: 12, weight: .regular)
        placeholderLabel.textColor = .black
        placeholderLabel.text      = "    " + placeholder
        placeholderLabel.isHidden  = true
        
        self.addSubview(placeholderLabel)
        placeholderLabel.anchor(top:     self.topAnchor,
                                leading: leadingAnchor,
                                size:    CGSize(width: self.frame.width, height: 14))
    }
    
    public func setText(text: String) {
        self.text = text
        self.togglePlaceholderLabel()
    }
    
    @objc public func togglePlaceholderLabel() {
        placeholderLabel?.isHidden    = self.text == ""
        requiredFieldLabel?.textColor = .darkGrayStant
    }
    
    @objc func cancelEditing() {
        self.text = currentText
        self.endEditing(true)
    }
    
    @objc func confirmEditing() {
        currentText = self.text ?? ""
        self.endEditing(true)
    }
}
