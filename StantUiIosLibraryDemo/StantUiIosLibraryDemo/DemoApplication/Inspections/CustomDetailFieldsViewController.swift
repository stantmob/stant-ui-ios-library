//
//  CustomDetailFieldsViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Leandro Martins on 15/09/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class CustomDetailFieldsViewController: UIViewController {
    var textView:     TextDetailCard?
    var severityView: SeverityDetailCard?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        configureTextView()
        configureSeverityDetailCard()
    }
    
    func configureTextView() {
        textView           = TextDetailCard()
        guard let textView = textView else { return }
        
        self.view.addSubview(textView)
        textView.anchor(top:      self.view.topAnchor,
                        leading:  self.view.leadingAnchor,
                        trailing: self.view.trailingAnchor,
                        padding:  UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0),
                        size:     CGSize(width: 0, height: 80))
        
        textView.configure(title: "Descrição", content: "Observar a eliminação de qualquer foco de umidade de modo que a superfície apresente-se seca quando da execução da pintura")
    }
    
    func configureSeverityDetailCard() {
        severityView           = SeverityDetailCard()
        guard let severityView = severityView else { return }
        
        self.view.addSubview(severityView)
        severityView.anchor(top:      textView?.bottomAnchor,
                            leading:  self.view.leadingAnchor,
                            trailing: self.view.trailingAnchor,
                            padding:  UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0),
                            size:     CGSize(width: 0, height: 80))
        
        severityView.configure(title: "Gravidade", severityLevel: "Média", severity: 3)
    }
}
