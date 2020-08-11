//
//  ServiceInspectionFormFilledCell.swift
//  Pods-StantUiIosLibraryDemo
//
//  Created by Renato Vieira on 6/3/20.
//

import UIKit

public class ServiceInspectionFormFilledCell: UITableViewCell {
    public var headerView:              ServiceInspectionFormFilledCellHeader?
    public var verifiedUnitLabel:       UILabel?
    public var progressBar:             SimpleProgressBar?
    public var performedPercentageView: UIView?
    public var quantityLabel:           UILabel?
    public var percentagePlannedView:   UIView?
    
    public static let cellHeight: CGFloat = 125
    
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
    
    public func configureViewFor(serviceInspectionFormFilledDto: ServiceInspectionFormFilledDto) {
        self.removeSubviews()
        self.addShadow()
        self.configureHeaderView(status:  serviceInspectionFormFilledDto.status,
                                 beginAt: serviceInspectionFormFilledDto.beginAt,
                                 endAt:   serviceInspectionFormFilledDto.endAt)
        self.configureVerifiedUnitLabel(verifiedUnit: serviceInspectionFormFilledDto.verifiedUnit)
        self.configureProgressBar(status:            serviceInspectionFormFilledDto.status,
                                  totalUsedArea:     serviceInspectionFormFilledDto.totalUsedArea,
                                  performedQuantity: serviceInspectionFormFilledDto.performedQuantity)
        self.configurePerformedPercentageView(status:            serviceInspectionFormFilledDto.status,
                                              totalUsedArea:     serviceInspectionFormFilledDto.totalUsedArea,
                                              performedQuantity: serviceInspectionFormFilledDto.performedQuantity)
        self.configureQuantityLabel(totalUsedArea:   serviceInspectionFormFilledDto.totalUsedArea,
                                    unitMeasurement: serviceInspectionFormFilledDto.unitMeasurement)
        self.configurePercentagePlannedView(totalUsedArea: serviceInspectionFormFilledDto.totalUsedArea,
                                            plannedArea:   serviceInspectionFormFilledDto.plannedArea)
        
        self.selectionStyle = .none
    }
    
    fileprivate func addShadow() {
        self.layer.applySketchShadow(color:  .shadowStant,
                                     alpha:  0.09,
                                     x:      0,
                                     y:      3,
                                     blur:   8,
                                     spread: 0)
    }
    
    fileprivate func configureHeaderView(status:  ServiceInspectionFormFilledCellTypeEnum,
                                         beginAt: String,
                                         endAt:   String) {
        headerView           = ServiceInspectionFormFilledCellHeader()
        guard let headerView = headerView else { return }
        
        self.addSubview(headerView)
        
        headerView.anchor(top:      self.topAnchor,
                          trailing: self.trailingAnchor,
                          size:     CGSize(width: self.frame.width + 6, height: 28))
        headerView.configure(status:  status,
                             beginAt: beginAt,
                             endAt:   endAt,
                             color:   status.colorValue())
        
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
                                 padding: UIEdgeInsets(top: 38, left: 14, bottom: 0, right: 0))
    }
    
    fileprivate func configureProgressBar(status:            ServiceInspectionFormFilledCellTypeEnum,
                                          totalUsedArea:     Float,
                                          performedQuantity: Float) {
        
        progressBar                    = SimpleProgressBar()
        guard let progressBar          = progressBar else { return }
        progressBar.backgroundColor    = .iceGrayStant
        
        self.addSubview(progressBar)
        progressBar.anchor(top:      verifiedUnitLabel?.bottomAnchor,
                           leading:  self.leadingAnchor,
                           trailing: self.trailingAnchor,
                           padding:  UIEdgeInsets(top: 11, left: 14, bottom: 0, right: 14),
                           size:     CGSize(width: 0, height: 4))
        
        progressBar.configure()
        progressBar.setPercentage(percentage:   CGFloat(performedQuantity / totalUsedArea),
                                  color:        status.colorValue())
    }
    
    fileprivate func configurePerformedPercentageView(status:            ServiceInspectionFormFilledCellTypeEnum,
                                                      totalUsedArea:     Float,
                                                      performedQuantity: Float) {
        performedPercentageView                    = UIView()
        guard let performedPercentageView          = performedPercentageView else { return }
        performedPercentageView.backgroundColor    = status.colorValue()
        performedPercentageView.layer.cornerRadius = 3.0
        
        self.addSubview(performedPercentageView)
        
        performedPercentageView.anchor(top:     progressBar?.bottomAnchor,
                                       leading: self.leadingAnchor,
                                       padding: UIEdgeInsets(top: 4, left: 14, bottom: 0, right: 0),
                                       size:    CGSize(width: 42, height: 18))
        
        let percentageLabel           = UILabel()
        var percentage                = performedQuantity / totalUsedArea * 100
        percentage                    = percentage <= 100 ? percentage : 100
        percentageLabel.text          = "\(percentage.cleanValue)%"
        percentageLabel.textColor     = .white
        percentageLabel.font          = .systemFont(ofSize: 12, weight: .bold)
        percentageLabel.textAlignment = .center
        
        performedPercentageView.addSubview(percentageLabel)
        
        percentageLabel.fillSuperView()
    }
    
    fileprivate func configureQuantityLabel(totalUsedArea: Float, unitMeasurement: String) {
        quantityLabel           = UILabel()
        guard let quantityLabel = quantityLabel else { return }
        quantityLabel.text      = "\(LibraryStrings.service_inspection_form_filled_details_out_of_label) \(totalUsedArea) \(unitMeasurement)"
        quantityLabel.textColor = .darkGrayStant
        quantityLabel.font      = .systemFont(ofSize: 12)

        self.addSubview(quantityLabel)
        
        quantityLabel.anchor(top:     progressBar?.bottomAnchor,
                             leading: performedPercentageView?.trailingAnchor,
                             padding: UIEdgeInsets(top: 5, left: 3, bottom: 0, right: 0))
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
                                     padding: UIEdgeInsets(top: 5, left: 14, bottom: 4, right: 0),
                                     size:    CGSize(width: 120,  height: 18))
        
        let percentagePlannedLabel = UILabel()
        let percentagePlanned      = totalUsedArea / plannedArea * 100
        
        percentagePlannedLabel.text          = "\(percentagePlanned.cleanValue)% \(LibraryStrings.service_inspection_form_filled_details_of_planned_label)"
        percentagePlannedLabel.textColor     = .darkGrayStant
        percentagePlannedLabel.textAlignment = .center
        percentagePlannedLabel.font          = .systemFont(ofSize: 12)
        
        percentagePlannedView.addSubview(percentagePlannedLabel)
        percentagePlannedLabel.fillSuperView()
    }
}
