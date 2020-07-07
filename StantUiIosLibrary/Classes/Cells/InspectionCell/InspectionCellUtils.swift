//
//  InspectionCellUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public enum InspectionStatusEnum {
    case approved, reproved
    
    public func stringValue() -> String {
        switch self {
        case .reproved:
            return AppStrings.verified_method_details_approved_label
        case .approved:
            return AppStrings.verified_method_details_approved_label
        }
    }
    
    public func colorValue() -> UIColor {
        switch self {
        case .reproved:
            return .redLightStant
        case .approved:
            return .greenStant
        }
    }
}


@objc public protocol InspectionCellButtonDelegate {
    @objc func goToMethodEditScreen()
    @objc func goToMethodDetailScreen()
}
