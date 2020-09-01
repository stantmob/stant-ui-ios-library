//
//  ServiceInspectionFormFilledCellUtils.swift
//  StantUiIosLibrary
//
//  Created by Leandro Martins on 07/07/20.
//

import UIKit

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
    
    public static func getStatusFromInt(value: Int) -> ServiceInspectionFormFilledCellTypeEnum {
        switch value {
        case 0:
            return ServiceInspectionFormFilledCellTypeEnum.progress
        case 1:
            return ServiceInspectionFormFilledCellTypeEnum.finished
        case 2:
            return ServiceInspectionFormFilledCellTypeEnum.approved
        default:
            return ServiceInspectionFormFilledCellTypeEnum.late
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
