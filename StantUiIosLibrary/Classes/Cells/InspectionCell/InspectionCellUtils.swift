//
//  InspectionCellUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public enum InspectionCellTypeEnum {
    case approved, reproved
    
    public func stringValue() -> String {
        switch self {
        case .reproved:
            return LibraryStrings.verified_method_status_reproved_label
        case .approved:
            return LibraryStrings.verified_method_status_approved_label
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
    
    public static func getStatusFromInt(value: Int) -> InspectionCellTypeEnum {
        switch value {
        case 1:
            return InspectionCellTypeEnum.reproved
        default:
            return InspectionCellTypeEnum.approved
        }
    }
}

@objc public protocol InspectionCellButtonDelegate {
    @objc func goToInspectionEditScreen()
    @objc func goToInspectionDetailScreen()
}
