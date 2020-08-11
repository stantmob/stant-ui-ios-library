//
//  ServiceInspectionFormFilledCellUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

public struct ServiceInspectionFormFilledDto {
    let status:             ServiceInspectionFormFilledCellTypeEnum
    let performedQuantity:  Float
    let totalUsedArea:      Float
    let unitMeasurement:    String
    let verifiedUnit:       String
    let plannedArea:        Float
    let beginAt:            String
    let endAt:              String
    
    public init(status:            ServiceInspectionFormFilledCellTypeEnum,
                performedQuantity: Float,
                totalUsedArea:     Float,
                unitMeasurement:   String,
                verifiedUnit:      String,
                plannedArea:       Float,
                beginAt:           String,
                endAt:             String) {
        self.status            = status
        self.performedQuantity = performedQuantity
        self.totalUsedArea     = totalUsedArea
        self.unitMeasurement   = unitMeasurement
        self.verifiedUnit      = verifiedUnit
        self.plannedArea       = plannedArea
        self.beginAt           = beginAt
        self.endAt             = endAt
    }
}

public enum ServiceInspectionFormFilledCellTypeEnum: Int {
    case progress = 0, finished = 1, approved = 2, late = 3
    
    public func stringValue() -> String {
        switch self {
        case .progress:
            return LibraryStrings.service_inspection_form_filled_details_progress_label
        case .finished:
            return LibraryStrings.service_inspection_form_filled_details_finished_label
        case .approved:
            return LibraryStrings.service_inspection_form_filled_details_approved_label
        case .late:
            return LibraryStrings.service_inspection_form_filled_details_late_label
        }
    }
    
    public func colorValue() -> UIColor {
        switch self {
        case .progress:
            return UIColor.darkGrayStant
        case .finished:
            return UIColor.yellowLightStant
        case .approved:
            return UIColor.greenStant
        case .late:
            return UIColor.redLightStant
        }
    }
    
    public static func convertFrom(string: String) -> ServiceInspectionFormFilledCellTypeEnum {
        switch string {
        case LibraryStrings.service_inspection_form_filled_details_progress_label:
            return .progress
        case LibraryStrings.service_inspection_form_filled_details_finished_label:
            return .finished
        case LibraryStrings.service_inspection_form_filled_details_approved_label:
            return .approved
        case LibraryStrings.service_inspection_form_filled_details_late_label:
            return .late
        default:
            return .progress
        }
    }
}
