//
//  ServiceInspectionFormFilledCell.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

public class ServiceInspectionFormFilledCell: UITableViewCell {
    
    public static let cellHeight: CGFloat = 115
    
    public var headerView: ServiceInspectionFormFilledCellHeader?
    //public var statusLabel: UILabel?
    //public var totalUsedAreaLabel: UILabel?
    //public var unitMeasurementLabel: UILabel?
    public var verifiedUnitLabel: UILabel?
    //public var beginAtLabel: UILabel?
    //public var endAtlabel: UILabel?
    //public var areaUsed: UILabel?
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.removeSubviews()
    }
    
    public func configureViewFor(serviceInspectionFormFilled: ServiceInspectionFormFilled) {
        self.removeSubviews()
        self.configureHeaderView(status: serviceInspectionFormFilled.status, beginAt: serviceInspectionFormFilled.beginAt, endAt: serviceInspectionFormFilled.endAt)
        self.configureVerifiedUnitLabel(verifiedUnit: serviceInspectionFormFilled.verifiedUnit)
    }
    
    fileprivate func configureHeaderView(status: ServiceInspectionFormFilledStatusEnum, beginAt: String, endAt: String) {
        headerView = ServiceInspectionFormFilledCellHeader()
        guard let headerView = headerView else { return }
        self.addSubview(headerView)
        headerView.anchor(top: self.topAnchor, trailing: self.trailingAnchor, size: CGSize(width: self.frame.width + 6, height: 28))
        
        headerView.configure(status: status, beginAt: beginAt, endAt: endAt)
        
    }
    
    fileprivate func configureVerifiedUnitLabel(verifiedUnit: String) {
        verifiedUnitLabel           = UILabel()
        guard let verifiedUnitLabel = verifiedUnitLabel else { return }
        verifiedUnitLabel.textColor = .darkStant
        verifiedUnitLabel.text      = verifiedUnit
        verifiedUnitLabel.font      = .systemFont(ofSize: 16)
        
        self.addSubview(verifiedUnitLabel)
        verifiedUnitLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, padding: UIEdgeInsets(top: 38, left: 14, bottom: 0, right: 0))
    }
    
//    fileprivate func setText(label:        UILabel,
//                             text:         String,
//                             textSize:     CGFloat,
//                             textWeight:   UIFont.Weight,
//                             textColor:    UIColor,
//                             topAnchor:    CGFloat,
//                             leftAnchor:   CGFloat,
//                             bottomAnchor: CGFloat,
//                             rightAnchor:  CGFloat) {
//        guard let mainView = mainView else { return }
//
//        if #available(iOS 9.0, *) {
//                   label.text      = text
//                   label.font      = .systemFont(ofSize: textSize, weight: textWeight)
//                   label.textColor = textColor
//                   mainView.addSubview(label)
//                   label.anchor(top:      mainView.topAnchor,
//                                leading:  mainView.leadingAnchor,
//                                bottom:   mainView.bottomAnchor,
//                                trailing: mainView.trailingAnchor,
//                                padding:  UIEdgeInsets(top:    topAnchor,
//                                                       left:   leftAnchor,
//                                                       bottom: bottomAnchor,
//                                                       right:  rightAnchor))
//        }
//
//    }
}

public struct ServiceInspectionFormFilled {
    
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
