//
//  ServiceInspectionFormFilledCell.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

public class ServiceInspectionFormFilledCell: UITableViewCell {
    
    public static let cellHeight: CGFloat = 125
    
    public var color:                   UIColor?
    public var headerView:              ServiceInspectionFormFilledCellHeader?
    public var verifiedUnitLabel:       UILabel?
    public var progressBar:             ServiceInspectionFormFilledCellBar?
    public var performedPercentageView: UIView?
    public var quantityLabel:           UILabel?
    public var percentagePlannedView:   UIView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.removeSubviews()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    
        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        bounds      = bounds.inset(by: padding)
    }
    
    public func configureViewFor(serviceInspectionFormFilled: ServiceInspectionFormFilled) {
        self.removeSubviews()
        self.addMainViewWithShadow()
        self.configureHeaderView(status:  serviceInspectionFormFilled.status,
                                 beginAt: serviceInspectionFormFilled.beginAt,
                                 endAt:   serviceInspectionFormFilled.endAt)
        self.configureVerifiedUnitLabel(verifiedUnit: serviceInspectionFormFilled.verifiedUnit)
        self.configureProgressBar(totalUsedArea:     serviceInspectionFormFilled.totalUsedArea,
                                  performedQuantity: serviceInspectionFormFilled.performedQuantity)
        self.configurePerformedPercentageView(totalUsedArea:     serviceInspectionFormFilled.totalUsedArea,
                                              performedQuantity: serviceInspectionFormFilled.performedQuantity)
        self.configureQuantityLabel(totalUsedArea:   serviceInspectionFormFilled.totalUsedArea,
                                    unitMeasurement: serviceInspectionFormFilled.unitMeasurement)
        self.configurePercentagePlannedView(totalUsedArea: serviceInspectionFormFilled.totalUsedArea,
                                            plannedArea:   serviceInspectionFormFilled.plannedArea)
        
        self.selectionStyle = .none
    }
    
    fileprivate func configureHeaderView(status:  ServiceInspectionFormFilledStatusEnum,
                                         beginAt: String,
                                         endAt:   String) {
        headerView = ServiceInspectionFormFilledCellHeader()
        guard let headerView = headerView else { return }
        
        self.addSubview(headerView)
        
        headerView.anchor(top:      self.topAnchor,
                          trailing: self.trailingAnchor,
                          size:     CGSize(width:  self.frame.width + 6,
                                           height: 28))
        
        switch status {
                   case .late:
                       color = UIColor.redLightStant
                   case .finished:
                       color = UIColor.yellowSLighttant
                   case .progress:
                       color = UIColor.darkGrayStant
                   case .approved:
                       color = UIColor.greenStant
               }
        
        headerView.configure(status:  status,
                             beginAt: beginAt,
                             endAt:   endAt,
                             color:   color ?? UIColor())
        
    }
    
    fileprivate func configureVerifiedUnitLabel(verifiedUnit: String) {
        verifiedUnitLabel           = UILabel()
        guard let verifiedUnitLabel = verifiedUnitLabel else { return }
        verifiedUnitLabel.textColor = .darkStant
        verifiedUnitLabel.text      = verifiedUnit
        verifiedUnitLabel.font      = .systemFont(ofSize: 16)
        
        self.addSubview(verifiedUnitLabel)
        
        verifiedUnitLabel.anchor(top:     self.topAnchor,
                                 leading: self.leadingAnchor,
                                 padding: UIEdgeInsets(top:    38,
                                                       left:   14,
                                                       bottom: 0,
                                                       right:  0))
    }
    
    fileprivate func configureProgressBar(totalUsedArea:     Float,
                                          performedQuantity: Float) {
        progressBar                    = ServiceInspectionFormFilledCellBar()
        guard let progressBar          = progressBar else { return }
        progressBar.backgroundColor    = .veryLightGrayStant
        progressBar.layer.cornerRadius = 2.5
        
        self.addSubview(progressBar)
        
        progressBar.anchor(top:      verifiedUnitLabel?.bottomAnchor,
                           leading:  self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           padding:  UIEdgeInsets(top:    8,
                                                  left:   14,
                                                  bottom: 0,
                                                  right:  14),
                           size:     CGSize(width:  self.frame.width,
                                            height: 4))
        
        progressBar.configure(totalUsedArea:     totalUsedArea,
                              performedQuantity: performedQuantity,
                              color:             color ?? UIColor())
    }
    
    fileprivate func configurePerformedPercentageView(totalUsedArea: Float, performedQuantity: Float) {
        performedPercentageView                    = UIView()
        guard let performedPercentageView          = performedPercentageView else { return }
        performedPercentageView.backgroundColor    = color
        performedPercentageView.layer.cornerRadius = 3.0
        
        self.addSubview(performedPercentageView)
        
        performedPercentageView.anchor(top:     progressBar?.bottomAnchor,
                                       leading: self.leadingAnchor,
                                       padding: UIEdgeInsets(top:    6,
                                                             left:   14,
                                                             bottom: 0,
                                                             right:  0),
                                       size:    CGSize(width:  42,
                                                       height: 18))
        
        let percentageLabel           = UILabel()
        var percentage                = performedQuantity / totalUsedArea * 100
        percentage                    = percentage <= 100 ? percentage : 100
        percentageLabel.text          = "\(truncateFloat(value: percentage))%"
        percentageLabel.textColor     = .white
        percentageLabel.font          = .systemFont(ofSize: 12, weight: .bold)
        percentageLabel.textAlignment = .center
        
        performedPercentageView.addSubview(percentageLabel)
        
        percentageLabel.fillSuperView()
    }
    
    fileprivate func configureQuantityLabel(totalUsedArea: Float, unitMeasurement: String) {
        quantityLabel           = UILabel()
        guard let quantityLabel = quantityLabel else { return }
        quantityLabel.text      = "\(AppStrings.service_inspection_form_filled_details_out_of_label) \(totalUsedArea) \(unitMeasurement)"
        quantityLabel.textColor = .darkGrayStant
        quantityLabel.font      = .systemFont(ofSize: 12)

        self.addSubview(quantityLabel)
        
        quantityLabel.anchor(top:     progressBar?.bottomAnchor,
                             leading: performedPercentageView?.trailingAnchor,
                             padding: UIEdgeInsets(top:    7,
                                                   left:   3,
                                                   bottom: 0,
                                                   right:  0))
    }
    
    func truncateFloat(value: Float) -> String {
        return value.truncatingRemainder(dividingBy: 1) <= 0.1 ? String(format: "%.0f", value) : String(format: "%.1f", value)
    }
    
    func configurePercentagePlannedView(totalUsedArea: Float, plannedArea: Float) {
        percentagePlannedView                    = UIView()
        guard let percentagePlannedView          = percentagePlannedView else { return }
        percentagePlannedView.backgroundColor    = .lightGrayStant
        percentagePlannedView.layer.cornerRadius = 3.0
        
        self.addSubview(percentagePlannedView)
        
        percentagePlannedView.anchor(top:     performedPercentageView?.bottomAnchor,
                                     leading: self.leadingAnchor,
                                     bottom:  self.bottomAnchor,
                                     padding: UIEdgeInsets(top:    6,
                                                           left:   14,
                                                           bottom: 4,
                                                           right:  0),
                                     size:    CGSize(width:  120,
                                                     height: 18))
        
        let percentagePlannedLabel = UILabel()
        let percentagePlanned      = totalUsedArea / plannedArea * 100
        
        percentagePlannedLabel.text          = "\(truncateFloat(value: percentagePlanned))% \(AppStrings.service_inspection_form_filled_details_of_planned_label)"
        percentagePlannedLabel.textColor     = .darkGrayStant
        percentagePlannedLabel.textAlignment = .center
        percentagePlannedLabel.font          = .systemFont(ofSize: 12)
        
        percentagePlannedView.addSubview(percentagePlannedLabel)
        percentagePlannedLabel.fillSuperView()
    }
    
    fileprivate func addMainViewWithShadow() {
        self.layer.applySketchShadow(color:  .shadowStant,
                                     alpha:  0.09,
                                     x:      0,
                                     y:      3,
                                     blur:   8,
                                     spread: 3)
    }
}

public struct ServiceInspectionFormFilled {
    let status:             ServiceInspectionFormFilledStatusEnum
    let performedQuantity:  Float
    let totalUsedArea:      Float
    let unitMeasurement:    String
    let verifiedUnit:       String
    let plannedArea:        Float
    let beginAt:            String
    let endAt:              String
    
    public init(status:            ServiceInspectionFormFilledStatusEnum,
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

public enum ServiceInspectionFormFilledStatusEnum: Int {
    case progress = 0, finished = 1, approved = 2, late = 3
    
    public func stringValue() -> String {
        switch self {
        case .progress:
            return AppStrings.service_inspection_form_filled_details_progress_label
        case .finished:
            return AppStrings.service_inspection_form_filled_details_finished_label
        case .approved:
            return AppStrings.service_inspection_form_filled_details_approved_label
        case .late:
            return AppStrings.service_inspection_form_filled_details_late_label
        default:
            return ""
        }
    }
    
    public static func convertFrom(string: String) -> ServiceInspectionFormFilledStatusEnum {
        switch string {
        case AppStrings.service_inspection_form_filled_details_progress_label:
            return .progress
        case AppStrings.service_inspection_form_filled_details_finished_label:
            return .finished
        case AppStrings.service_inspection_form_filled_details_approved_label:
            return .approved
        case AppStrings.service_inspection_form_filled_details_late_label:
            return .late
        default:
            return .progress
        }
    }
}
