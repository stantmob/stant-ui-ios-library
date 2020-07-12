//
//  VerifiedMethodCellUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public struct VerifiedMethodDto { //TODO: it should be in inspections app
    public var status:          VerifiedMethodStatusEnum?
    public var observationText: String?
    public var isReinspection:  Bool?
    public var hasAttachment:   Bool?
    
    public init(status:          VerifiedMethodStatusEnum,
                observationText: String,
                isReinspection:  Bool,
                hasAttachment:   Bool) {
        
        self.status          = status
        self.observationText = observationText
        self.isReinspection  = isReinspection
        self.hasAttachment   = hasAttachment
    }
}

public enum VerifiedMethodStatusEnum {
    case notApplicable, approved, reproved, notInspected
    
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
