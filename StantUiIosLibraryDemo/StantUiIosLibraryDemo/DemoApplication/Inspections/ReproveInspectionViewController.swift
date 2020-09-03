//
//  ReproveInspectionViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 02/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class ReproveInspectionViewController: UIViewController {
    var defaultTextField:  CustomFormTextField?
    var numericTextField:  CustomFormTextField?
    var beginDatePicker:   CustomDatePicker?
    var endDatePicker:     CustomDatePicker?
    var severityTextField: CustomFormTextField?

    var selectSeverityIndex = 0
    let severityLevels      = ["Very Low", "Low", "Medium", "High", "Very High"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configureDefaultTextField()
        configureNumericTextField()
        configureBeginDatePicker()
        configureEndDatePicker()
        configureSeverityTextField()
    }
    
    func configureDefaultTextField() {
        defaultTextField           = CustomFormTextField()
        guard let defaultTextField = defaultTextField else { return }
        
        defaultTextField.configureTextField(placeholder: "My text field",
                                            required:    false)
        
        self.view.addSubview(defaultTextField)
        defaultTextField.anchor(top:      self.view.topAnchor,
                                leading:  self.view.leadingAnchor,
                                trailing: self.view.trailingAnchor,
                                padding:  UIEdgeInsets(top: 100, left:  10, bottom: 0, right: 10),
                                size:     CGSize(width: 0, height: 50))
    }
    
    func configureNumericTextField() {
        numericTextField           = CustomFormTextField()
        guard let numericTextField = numericTextField else { return }
        
        numericTextField.configureTextField(placeholder:  "My numeric field",
                                            required:      true,
                                            keyboardType:  .numberPad)
        
        self.view.addSubview(numericTextField)
        numericTextField.anchor(top:      defaultTextField?.bottomAnchor,
                                leading:  self.view.leadingAnchor,
                                trailing: self.view.trailingAnchor,
                                padding:  UIEdgeInsets(top: 20, left:  10, bottom: 0, right: 10),
                                size:     CGSize(width: 0, height: 50))
    }
    
    func configureBeginDatePicker() {
        beginDatePicker           = CustomDatePicker()
        guard let beginDatePicker = beginDatePicker else { return }
        
        self.view.addSubview(beginDatePicker)
        beginDatePicker.anchor(top:      numericTextField?.bottomAnchor,
                               leading:  self.view.leadingAnchor,
                               trailing: self.view.trailingAnchor,
                               padding:  UIEdgeInsets(top: 31, left: 10, bottom: 0, right: 10),
                               size:     CGSize(width: 0, height: 50))
        
        beginDatePicker.configureDatePicker(placeholder: "Begin",
                                            required:    false,
                                            delegate:    self)
    }
    
    func configureEndDatePicker() {
        endDatePicker           = CustomDatePicker()
        guard let endDatePicker = endDatePicker else { return }
        
        self.view.addSubview(endDatePicker)
        endDatePicker.anchor(top:      beginDatePicker?.bottomAnchor,
                             leading:  self.view.leadingAnchor,
                             trailing: self.view.trailingAnchor,
                             padding:  UIEdgeInsets(top: 31, left: 10, bottom: 0, right: 10),
                             size:     CGSize(width: 0, height: 50))
        
        endDatePicker.configureDatePicker(placeholder: "End",
                                          required:    true,
                                          delegate:    self)
        
        endDatePicker.setDateRestrictions(minimumDate: Date().addingTimeInterval(-86400), maximumDate: Date().addingTimeInterval(86400))
    }
    
    func configureSeverityTextField() {
        severityTextField           = CustomFormTextField()
        guard let severityTextField = severityTextField else { return }
        
        severityTextField.configureTextField(placeholder: "Severity",
                                             required:    false)
        
        severityTextField.setText(text: severityLevels[0])
        
        self.view.addSubview(severityTextField)
        severityTextField.anchor(top:      endDatePicker?.bottomAnchor,
                                 leading:  self.view.leadingAnchor,
                                 trailing: self.view.trailingAnchor,
                                 padding:  UIEdgeInsets(top: 31, left:  10, bottom: 0, right: 10),
                                 size:     CGSize(width: 0, height: 50))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(openSeverityDialog))
        severityTextField.addGestureRecognizer(tap)
    }
    
    @objc func openSeverityDialog() {
        var views = [UIView]()
        
        for i in 0...4 {
            let severityView = SeverityLevelView(frame: CGRect(x: 0, y: 0, width: 52, height: 8))
            severityView.configure(severity: i + 1)
            views.append(severityView)
        }
        
        let dialogViewController                    = RadioButtonBottomDialogWithScrollViewController()
        dialogViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        dialogViewController.cellDelegate           = self
        dialogViewController.configureView(items: severityLevels, leftViews: views, selectedItemIndex: selectSeverityIndex)
        
        self.present(dialogViewController, animated: false, completion: nil)
    }
}

extension ReproveInspectionViewController: ScrollableTableViewDialogCellDelegate {
    func clickOnCellWith(index: Int, title: String) {
        selectSeverityIndex = index
        severityTextField?.setText(text: title)
    }
}

extension ReproveInspectionViewController: CustomDatePickerDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard var text = textField.text else { return false }
        
        if string == "" {
            text = String(text.dropLast())
            
            if text.last == "/" {
                text = String(text.dropLast())
            }
            
            textField.text = text
            return false
        }
        
        if (text.count == 2 || text.count == 5){
            textField.text? += "/"
        }
        
        if textField.text?.count ?? 0 < 10 {
            textField.text! += string
        }
        
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let validDate  = Date().isValidDate(string: textField.text ?? "") != nil
        textField.text = validDate ? textField.text : ""
    }
}
