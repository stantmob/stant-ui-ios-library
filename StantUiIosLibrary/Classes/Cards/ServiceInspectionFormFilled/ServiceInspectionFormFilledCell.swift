//
//  ServiceInspectionFormFilledCell.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

public struct ServiceInpectionFormFilledDto {
    
    let guid:              String
    let status:            String
    let performedQuantity: String
    let totalUsedArea:     Float
    let unitMeasurement:   String
    let verifiedUnit:      String
    let beginAt:           String
    let endAt:             String
}

public enum ServiceInspectionFormFilledStatusEnum: Int {
    case progress = 0, finished = 1, approved = 2, late = 3
    
    public func stringValue() -> String {
        switch self {
        case .progress:
            return "Em Progresso"
        case .finished:
            return "Finalizado"
        case .approved:
            return "Aprovado"
        case .late:
            return "Atrasada"
        default:
            return ""
        }
    }
    
    public static func convertFrom(string: String) -> ServiceInspectionFormFilledStatusEnum {
        switch string {
        case "Em Progresso":
            return .progress
        case "Finalizado":
            return .finished
        case "Aprovado":
            return .approved
        case "Atrasada":
            return .late
        default:
            return .progress
        }
    }
}
