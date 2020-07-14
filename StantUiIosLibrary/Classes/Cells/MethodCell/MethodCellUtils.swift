//
//  MethodCellUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public enum MethodCellTypeEnum: Int {
    case notApplicable = 0, reproved = 1, approved = 2, notInspected = 3
    
    public func stringValue() -> String {
        switch self {
        case .notInspected:
            return AppStrings.verified_method_status_not_inspected_label
        case .reproved:
            return AppStrings.verified_method_status_approved_label
        case .approved:
            return AppStrings.verified_method_status_approved_label
        case .notApplicable:
            return AppStrings.verified_method_status_not_applicable_label
        }
    }
    
    public static  func getStatusFromInt(value: Int) -> MethodCellTypeEnum {
        switch value {
        case 0:
            return MethodCellTypeEnum.notApplicable
        case 1:
            return MethodCellTypeEnum.reproved
        case 2:
            return MethodCellTypeEnum.approved
        default:
            return MethodCellTypeEnum.notInspected
        }
    }
    
    public func colorValue() -> UIColor {
        switch self {
        case .notInspected:
            return .darkGrayStant
        case .reproved:
            return .redLightStant
        case .approved:
            return .greenStant
        case .notApplicable:
            return .grayStant
        }
    }
}
