//
//  CustomFieldsViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 02/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class CustomFieldsViewController: UIViewController {
    var mainView:          UIScrollView?
    var contentView:       UIView?
    var defaultTextField:  CustomFormTextField?
    var numericTextField:  CustomFormTextField?
    var beginDatePicker:   CustomDatePicker?
    var endDatePicker:     CustomDatePicker?
    var severityTextField: CustomFormTextField?
    var textView:          MultiLineTextView?
    var photoInputView:    PhotoInputView?
    var switchView:        CustomSwitchView?
    
    var selectSeverityIndex = 0
    let severityLevels      = ["Very Low", "Low", "Medium", "High", "Very High"]
    var photoUrls           = (1...10).map { _ in UIImage.defaultImageUrl }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configureMainView()
        configureDefaultTextField()
        configureNumericTextField()
        configureBeginDatePicker()
        configureEndDatePicker()
        configureSeverityTextField()
        configureTextView()
        configurePhotoScrollView()
        configureSwitchView()
    }
    
    func configureMainView() {
        mainView                              = UIScrollView()
        guard let mainView                    = mainView else { return }
        mainView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(mainView)
        mainView.anchor(top:      self.view.topAnchor,
                        leading:  self.view.leadingAnchor,
                        bottom:   self.view.bottomAnchor,
                        trailing: self.view.trailingAnchor)
        
        self.view.updateLayout()
        
        contentView           = UIView()
        guard let contentView = contentView else { return }
        
        mainView.addSubview(contentView)
        contentView.anchor(top:      mainView.topAnchor,
                           leading:  mainView.leadingAnchor,
                           bottom:   mainView.bottomAnchor,
                           trailing: mainView.trailingAnchor)
        
        contentView.widthAnchor.constraint(equalToConstant: mainView.frame.width).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 900).isActive                 = true
    }
    
    func configureDefaultTextField() {
        defaultTextField           = CustomFormTextField()
        guard let defaultTextField = defaultTextField,
              let contentView      = contentView else { return }
        
        contentView.addSubview(defaultTextField)
        defaultTextField.anchor(top:      contentView.topAnchor,
                                leading:  contentView.leadingAnchor,
                                trailing: contentView.trailingAnchor,
                                padding:  UIEdgeInsets(top: 20, left:  10, bottom: 0, right: 10),
                                size:     CGSize(width: 0, height: 50))
        
        defaultTextField.configureTextField(placeholder: "My text field",
                                            required:    false)
    }
    
    func configureNumericTextField() {
        numericTextField           = CustomFormTextField()
        guard let numericTextField = numericTextField,
              let contentView      = contentView else { return }
        
        contentView.addSubview(numericTextField)
        numericTextField.anchor(top:      defaultTextField?.bottomAnchor,
                                leading:  contentView.leadingAnchor,
                                trailing: contentView.trailingAnchor,
                                padding:  UIEdgeInsets(top: 20, left:  10, bottom: 0, right: 10),
                                size:     CGSize(width: 0, height: 50))
        
        numericTextField.configureTextField(placeholder:  "My numeric field",
                                            required:      true,
                                            keyboardType:  .numberPad)
    }
    
    func configureBeginDatePicker() {
        beginDatePicker           = CustomDatePicker()
        guard let beginDatePicker = beginDatePicker,
              let contentView     = contentView else { return }
        
        contentView.addSubview(beginDatePicker)
        beginDatePicker.anchor(top:      numericTextField?.bottomAnchor,
                               leading:  contentView.leadingAnchor,
                               trailing: contentView.trailingAnchor,
                               padding:  UIEdgeInsets(top: 31, left: 10, bottom: 0, right: 10),
                               size:     CGSize(width: 0, height: 50))
        
        beginDatePicker.configureDatePicker(placeholder: "Begin",
                                            required:    false,
                                            delegate:    self)
    }
    
    func configureEndDatePicker() {
        endDatePicker           = CustomDatePicker()
        guard let endDatePicker = endDatePicker,
              let contentView   = contentView else { return }
        
        contentView.addSubview(endDatePicker)
        endDatePicker.anchor(top:      beginDatePicker?.bottomAnchor,
                             leading:  contentView.leadingAnchor,
                             trailing: contentView.trailingAnchor,
                             padding:  UIEdgeInsets(top: 31, left: 10, bottom: 0, right: 10),
                             size:     CGSize(width: 0, height: 50))
        
        endDatePicker.configureDatePicker(placeholder: "End",
                                          required:    true,
                                          delegate:    self)
        
        endDatePicker.setDateRestrictions(minimumDate: Date().addingTimeInterval(-86400), maximumDate: Date().addingTimeInterval(86400))
    }
    
    func configureSeverityTextField() {
        severityTextField           = CustomFormTextField()
        guard let severityTextField = severityTextField,
              let contentView       = contentView else { return }
        
        contentView.addSubview(severityTextField)
        severityTextField.anchor(top:      endDatePicker?.bottomAnchor,
                                 leading:  contentView.leadingAnchor,
                                 trailing: contentView.trailingAnchor,
                                 padding:  UIEdgeInsets(top: 31, left:  10, bottom: 0, right: 10),
                                 size:     CGSize(width: 0, height: 50))
        
        severityTextField.configureTextField(placeholder: "Severity",
                                             required:    false)
        severityTextField.setText(text: severityLevels[0])
        
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
        
        dialogViewController.configureView(items:             severityLevels,
                                           leftViews:         views,
                                           selectedItemIndex: selectSeverityIndex)
        self.present(dialogViewController, animated: false, completion: nil)
    }
    
    func configureTextView() {
        textView              = MultiLineTextView(frame: CGRect())
        guard let textView    = textView,
              let contentView = contentView else { return }
        
        contentView.addSubview(textView)
        textView.anchor(top:      severityTextField?.bottomAnchor,
                        leading:  contentView.leadingAnchor,
                        trailing: contentView.trailingAnchor,
                        padding:  UIEdgeInsets(top: 31, left: 10, bottom: 0, right: 10),
                        size:     CGSize(width: 0, height: 100))
        
        textView.configureTextView(title:           "Observation",
                                   maxCharQuantity: 20 )
    }
    
    func configurePhotoScrollView() {
        photoInputView           = PhotoInputView()
        guard let photoInputView = photoInputView,
              let contentView    = contentView else { return }
        
        contentView.addSubview(photoInputView)
        photoInputView.anchor(top:      textView?.bottomAnchor,
                              leading:  contentView.leadingAnchor,
                              trailing: contentView.trailingAnchor,
                              padding:  UIEdgeInsets(top: 31, left: 0, bottom: 0, right: 0),
                              size:     CGSize(width: 0, height: 122))
        
        photoInputView.configure(photoUrls:                    photoUrls,
                                 photoCollectionViewDelegate:  self)
    }
    
    func configureSwitchView() {
        switchView            = CustomSwitchView()
        guard let switchView  = switchView,
              let contentView = contentView else { return }
        
        contentView.addSubview(switchView)
        switchView.anchor(top:      photoInputView?.bottomAnchor,
                          leading:  contentView.leadingAnchor,
                          trailing: contentView.trailingAnchor,
                          padding:  UIEdgeInsets(top: 31, left: 0, bottom: 0, right: 0),
                          size:     CGSize(width: 0, height: 50))
        
        switchView.configure(switchLabel: "My switch")
    }
}

extension CustomFieldsViewController: ScrollableTableViewDialogCellDelegate {
    func clickOnCellWith(index: Int, title: String) {
        selectSeverityIndex = index
        severityTextField?.setText(text: title)
    }
}

extension CustomFieldsViewController: CustomDatePickerDelegate {
    func textField(_ textField:                    UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string:       String) -> Bool {
        
        guard var text = textField.text else { return false }
        
        if string == "" {
            text = String(text.dropLast())
            
            if text.last == "/" { text = String(text.dropLast()) }
            
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

extension CustomFieldsViewController: PhotoInputCollectionViewDelegate {
    public func removePhotoAtIndex(index: Int) {
        print("Removing photo at index \(index)")
    }
}
