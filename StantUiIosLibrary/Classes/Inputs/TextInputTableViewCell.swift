//
//  TextInputTableViewCell.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 31/07/19.
//

import UIKit

public class TextInputTableViewCell: UITableViewCell {
    
    public static let HEIGHT: CGFloat = 56
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(inputType: String, inicialInputValue: String = "", editable: Bool = true) {
        self.removeSubviews()
        self.backgroundColor = .clear
        
        let mainView = UIView(frame: CGRect(x: 16,
                                            y: 0,
                                            width: self.frame.width - 32,
                                            height: TextInputTableViewCell.HEIGHT))
        
        mainView.addBottomBorderWithColor(color: .darkGrayStant, width: 1)
        
        self.addSubview(mainView)
        mainView.anchor(top: self.topAnchor,
                        leading: self.leadingAnchor,
                        bottom: self.bottomAnchor,
                        trailing: self.trailingAnchor,
                        padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        
        self.addLabelFor(inputType: inputType, into: mainView)
        self.addTextFieldFor(inicialInputValue: inicialInputValue, into: mainView, editable: editable)
    }
    
    fileprivate func addLabelFor(inputType: String, into view: UIView) {
        let typeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 14))
        typeLabel.configure(text: inputType,
                            alignment: .left,
                            size: 12,
                            weight: .regular,
                            color: .darkStant)
        
        view.addSubview(typeLabel)
        typeLabel.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor,
                         padding: UIEdgeInsets(top: 9, left: 12, bottom: 33, right: 12))
        typeLabel.tag = 1
    }
    
    fileprivate func addTextFieldFor(inicialInputValue: String?, into view: UIView, editable: Bool) {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 19))
        textField.text                     = inicialInputValue ?? ""
        textField.textAlignment            = .left
        textField.font                     = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor                = .darkStant
        textField.borderStyle              = .none
        textField.isUserInteractionEnabled = editable
        
        view.addSubview(textField)
        textField.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor,
                         padding: UIEdgeInsets(top: 25, left: 12, bottom: 12, right: 12))
        textField.tag = 2
    }
    
}
