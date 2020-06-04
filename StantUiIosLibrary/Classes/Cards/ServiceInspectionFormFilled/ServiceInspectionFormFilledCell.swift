//
//  ServiceInspectionFormFilledCell.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

public class ServiceInspectionFormFilledCell: UITableViewCell {
    
    public static let cellHeight: CGFloat = 115
    
    public var mainView: UIView?
    public var statusLabel: UILabel?
    public var totalUsedAreaLabel: UILabel?
    public var unitMeasurementLabel: UILabel?
    public var verifiedUnitLabel: UILabel?
    public var beginAtLabel: UILabel?
    public var endAtlabel: UILabel?
    
    
    
    public func configureViewFor(serviceInspectionFormFilled: ServiceInpectionFormFilledDto) {
        self.removeSubviews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.removeSubviews()
    }
    
}

public struct ServiceInpectionFormFilledDto {
    
    let guid:              String
    let status:            ServiceInspectionFormFilledStatusEnum
    let performedQuantity: String
    let totalUsedArea:     Float
    let unitMeasurement:   String
    let verifiedUnit:      String
    let beginAt:           String
    let endAt:             String
    
    public init(guid:              String,
                status:            ServiceInspectionFormFilledStatusEnum,
                performedQuantity: String,
                totalUsedArea:     Float,
                unitMeasurement:   String,
                verifiedUnit:      String,
                beginAt:           String,
                endAt:             String) {
        self.guid              = guid
        self.status            = status
        self.performedQuantity = performedQuantity
        self.totalUsedArea     = totalUsedArea
        self.unitMeasurement   = unitMeasurement
        self.verifiedUnit      = verifiedUnit
        self.beginAt           = beginAt
        self.endAt             = endAt
    }
        
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
