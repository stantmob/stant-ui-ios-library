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
    var textView:        TextDetailCard?
    var severityView:    SeverityDetailCard?
    var photoDetailView: PhotoDetailView?
    
    let severityLevels = ["Very Low", "Low", "Medium", "High", "Very High"]
    let photoUrls      = (1...10).map { _ in UIImage.defaultImageUrl }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        configureTextView()
        configureSeverityDetailCard()
        configurePhotoDetailView()
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
        
        severityView.configure(title: "Gravidade", severityLevel: severityLevels[2 - 1], severity: 2)
    }
    
    func configurePhotoDetailView () {
        photoDetailView           = PhotoDetailView()
        guard let photoDetailView = photoDetailView else { return }
        
        self.view.addSubview(photoDetailView)
        photoDetailView.anchor(top:      severityView?.bottomAnchor,
                               leading:  self.view.leadingAnchor,
                               trailing: self.view.trailingAnchor,
                               padding:  UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0),
                               size:     CGSize(width: 0, height: 122))
        
        photoDetailView.configure(photoUrls: photoUrls, delegate: self)
    }
}

extension CustomDetailFieldsViewController: PhotoDetailCollectionViewDelegate {
    public func showPhotoAtIndex(index: Int) {
        print("Show photo at index \(index)")
    }
}
