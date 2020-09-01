//
//  SeverityLevelView.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public class SeverityLevelView: UIView {
    func configure(severity: Int) {
        for i in (0...4) {
            let color: UIColor = severity >= (i + 1) ? getColor(severityLevel: severity) : .darkGrayStant
            configureView(index: i, color: color)
        }
    }
    
    func configureView(index: Int, color: UIColor) {
        let view                 = UIView()
        view.backgroundColor     = color
        view.layer.cornerRadius  = 3.5
        let leftPadding: CGFloat = CGFloat(index * 11)
            
        self.addSubview(view)
        view.anchor(top:     self.topAnchor,
                    leading: self.leadingAnchor,
                    padding: UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0),
                    size:    CGSize(width: 7, height: 7))
    }
    
    func getColor(severityLevel: Int) -> UIColor {
        switch severityLevel {
        case 1:
            return .greenStant
        case 2:
            return .yellowLightStant
        case 3:
            return .yellowLightStant
        case 4:
            return .yellowStant
        default:
            return .redLightStant
        }
    }
}
