//
//  RoundedImageViewController.swift
//  StantUiIosLibraryDemo
//
//  Created by Mac Mini Novo on 01/08/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit
import StantUiIosLibrary

class RoundedImageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        let roundedImage = RoundedImageView(frame: CGRect(x: 0,
                                                          y: 100,
                                                          width: self.view.frame.width,
                                                          height: 150))
        roundedImage.set(icon: nil,
                         iconURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P8RsPCO0qj21UeIfaVkRcsqguonI6bP4iLr3tWwS4qIS4MSquw",
                         iconDiameter: 150,
                         iconBorder: 5)
        self.view.addSubview(roundedImage)
    }
  
}

