//
//  MultiLineTextView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 04/09/20.
//

import UIKit

public class MultiLineTextView: UIView {
    public var titleLabel:       UILabel?
    public var textView:         UITextView?
    public var characterCounter: UILabel?
    
    public var currentCharQuantity = 0
    public var maxCharQuantity     = 1
    public var currentText         = ""
    
    public func configureTextView(title: String, maxCharQuantity: Int) {
        self.maxCharQuantity = maxCharQuantity
        
        addTitleLabel(title: title)
        addTextView(maxCharQuantity: maxCharQuantity)
        addCharacterCounter()
    }
    
    func addTitleLabel(title: String) {
        titleLabel           = UILabel()
        guard let titleLabel = titleLabel else { return }
        titleLabel.font      = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.text      = "    " + title

        self.addSubview(titleLabel)
        titleLabel.anchor(top:      self.topAnchor,
                          leading:  self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          padding:  UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0),
                          size:     CGSize(width: 0, height: 14))
    }
    
    func addTextView(maxCharQuantity: Int) {
        textView                                    = UITextView()
        guard let textView                          = textView else { return }
        textView.delegate                           = self
        textView.backgroundColor                    = .backgroundStant
        textView.textContainer.maximumNumberOfLines = 5
        textView.textContainer.lineBreakMode        = .byWordWrapping
        textView.inputAccessoryView                 = setBar()
        
        self.addSubview(textView)
        textView.anchor(top:      titleLabel?.bottomAnchor,
                        leading:  self.leadingAnchor,
                        bottom:   self.bottomAnchor,
                        trailing: self.trailingAnchor,
                        padding:  UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0))
        
        let border             = UIView()
        border.backgroundColor = .darkGrayStant
        
        self.addSubview(border)
        border.anchor(top:      textView.bottomAnchor,
                      leading:  textView.leadingAnchor,
                      trailing: textView.trailingAnchor,
                      size:     CGSize(width: 0, height: 1))
    }
    
    func setBar() -> UIToolbar {
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
    
    func addCharacterCounter() {
        characterCounter           = UILabel()
        guard let characterCounter = characterCounter else { return }
        characterCounter.font      = .systemFont(ofSize: 14, weight: .regular)
        characterCounter.textColor = .darkGrayStant
        characterCounter.text      = "\(currentCharQuantity)/\(maxCharQuantity)"
        
        self.addSubview(characterCounter)
        characterCounter.anchor(top:      textView?.bottomAnchor,
                                trailing: self.trailingAnchor,
                                padding:  UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 12))
    }
    
    @objc public func cancelEditing() {
        self.textView?.text         = currentText
        self.currentCharQuantity    = currentText.count
        self.characterCounter?.text = "\(currentCharQuantity)/\(maxCharQuantity)"
        self.endEditing(true)
    }
    
    @objc public func confirmEditing() {
        currentText = self.textView?.text ?? ""
        self.endEditing(true)
    }
}

extension MultiLineTextView: UITextViewDelegate {
    public func textView(_ textView:               UITextView,
                         shouldChangeTextIn range: NSRange,
                         replacementText text:     String) -> Bool {
        
        let existingLines    = textView.text.components(separatedBy: CharacterSet.newlines)
        let newLines         = text.components(separatedBy: CharacterSet.newlines)
        let linesAfterChange = existingLines.count + newLines.count - 1
        
        if(text == "\n") {
            return linesAfterChange <= textView.textContainer.maximumNumberOfLines
        }

        let newText              = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars        = newText.count
        
        if self.currentCharQuantity != numberOfChars && numberOfChars <= self.maxCharQuantity{
            self.currentCharQuantity    = numberOfChars
            self.characterCounter?.text = "\(currentCharQuantity)/\(maxCharQuantity)"
        }
        
        return numberOfChars <= self.maxCharQuantity
    }
}
