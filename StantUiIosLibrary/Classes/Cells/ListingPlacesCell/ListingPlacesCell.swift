//
//  ListingPlacesCell.swift
//  StantUiIosLibrary
//
//  Created by Renato Vieira on 6/11/20.
//

import UIKit

public class ListingPlacesCell: UITableViewCell {
    
    public static let cellHeight:    CGFloat = 56
    public var delegate:             ListingPlacesCellDidSelectDelegate?
    public var bar:                  UIView?
    public var locationImageView:    UIView?
    public var locationImage:        UIImageView?
    public var placeTitleLabel:      UILabel?
    public var subPlacesLabel:       UILabel?
    public var percentagePlacelabel: UILabel?
    public var fispIconView:         UIView?
    public var fispIconImage:        UIImageView?
    public var leftTapView:          UIView?
    public var rightTapView:         UIView?
    
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

        let padding = UIEdgeInsets(top:    0,
                                   left:   0,
                                   bottom: 2,
                                   right:  4)
        bounds      = bounds.inset(by: padding)
    }
    
    public func configureViewFor(delegate: ListingPlacesCellDidSelectDelegate, status: PlaceStatusEnum, placeTitle: String, quantitySubPlaces: Int, percentage: Float, hasFips: Bool) {
        self.removeSubviews()
        self.delegate = delegate
        
        configureBar(status: status)
        configureLocationImageView()
        configurePlaceTitleLabel(placeTitle: placeTitle, quantitySubPlaces: quantitySubPlaces)
        configureSubPlacesLabel(quantitySubPlaces: quantitySubPlaces)
        configurePercentagePlaceLabel(percentage: percentage)
        configureListingPlacesIcon(hasFisps: hasFips)
        configureGestureRecognizerLeftView(quantitySubPlaces: quantitySubPlaces)
        addMainViewWithShadow()
        
        self.selectionStyle = .none
    }
    
    fileprivate func configureBar(status: PlaceStatusEnum) {
        bar                 = UIView()
        guard let bar       = bar else { return }
        bar.backgroundColor = status.colorValue()
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.addSubview(bar)
        bar.anchor(top:     self.topAnchor,
                   leading: self.leadingAnchor,
                   bottom:  self.bottomAnchor,
                   size:    CGSize(width: 4, height: self.frame.height))
    }
    
    fileprivate func configureLocationImageView() {
        locationImageView                 = UIView()
        guard let locationImageView       = locationImageView else { return }
        locationImageView.backgroundColor = .white
        
        self.addSubview(locationImageView)
        locationImageView.anchor(top:     self.topAnchor,
                                 leading: bar?.trailingAnchor,
                                 bottom:  self.bottomAnchor,
                                 padding: UIEdgeInsets(top:    16,
                                                       left:   21,
                                                       bottom: 16,
                                                       right:  0),
                                 size:    CGSize(width:  21,
                                                 height: 22))
        
        locationImage                    = UIImageView()
        guard let locationImage          = locationImage else { return }
        locationImage.image              = UIImage(named: "location")
        locationImage.layer.cornerRadius = 3
        locationImage.image              = locationImage.image?.withRenderingMode(.alwaysTemplate)
        locationImage.tintColor          = .blueDarkStant
        
        self.addSubview(locationImage)
        locationImage.anchor(top:      locationImageView.topAnchor,
                             leading:  locationImageView.leadingAnchor,
                             bottom:   locationImageView.bottomAnchor,
                             trailing: locationImageView.trailingAnchor,
                             size:     CGSize(width:  21,
                                              height: 22))
        
    }
    
    fileprivate func configurePlaceTitleLabel(placeTitle: String, quantitySubPlaces: Int) {
        placeTitleLabel           = UILabel()
        guard let placeTitleLabel = placeTitleLabel else { return }
        placeTitleLabel.textColor = .blueDarkStant
        placeTitleLabel.text      = placeTitle
        placeTitleLabel.font      = .systemFont(ofSize: 16)

        self.addSubview(placeTitleLabel)
        let bottomPadding: CGFloat = quantitySubPlaces == 0 ? 5 : 18
        placeTitleLabel.anchor(top:     self.topAnchor,
                               leading: locationImageView?.trailingAnchor,
                               bottom:  self.bottomAnchor,
                               padding: UIEdgeInsets(top:    5,
                                                     left:   7,
                                                     bottom: bottomPadding,
                                                     right:  0))
    }

    fileprivate func configureSubPlacesLabel(quantitySubPlaces: Int) {
        if quantitySubPlaces == 0 { return }
        
        subPlacesLabel           = UILabel()
        guard let subPlacesLabel = subPlacesLabel else { return }
        subPlacesLabel.textColor = .darkGrayStant
        subPlacesLabel.font      = .systemFont(ofSize: 12)
        
        let subPlaceText    = quantitySubPlaces == 1 ? "\(quantitySubPlaces) \(AppStrings.place_planning_sub_place_label)" :
                              "\(quantitySubPlaces) \(AppStrings.place_planning_sub_places_label)"
        subPlacesLabel.text = subPlaceText
        
        self.addSubview(subPlacesLabel)
        subPlacesLabel.anchor(leading: locationImageView?.trailingAnchor,
                              bottom: self.bottomAnchor,
                              padding: UIEdgeInsets(top:    0,
                                                    left:   8,
                                                    bottom: 10,
                                                    right:  0))
    }
    
    func truncateFloat(value: Float) -> String {
        return value.truncatingRemainder(dividingBy: 1) <= 0.1 ? String(format: "%.0f", value) : String(format: "%.1f", value)
    }
    
    fileprivate func configurePercentagePlaceLabel(percentage: Float) {
        percentagePlacelabel           = UILabel()
        let percentage                 = percentage <= 100 ? percentage : 100
        guard let percentagePlacelabel = percentagePlacelabel else { return }
        percentagePlacelabel.textColor = .darkGrayStant
        percentagePlacelabel.text      = "\(truncateFloat(value: percentage))%"
        percentagePlacelabel.font      = .systemFont(ofSize: 16)
        
        self.addSubview(percentagePlacelabel)
        percentagePlacelabel.anchor(top:      self.topAnchor,
                                    bottom:   self.bottomAnchor,
                                    trailing: self.trailingAnchor,
                                    padding:  UIEdgeInsets(top:    19,
                                                           left:   0,
                                                           bottom: 18,
                                                           right:  50))
    }
    
    fileprivate func configureListingPlacesIcon(hasFisps: Bool) {
        fispIconView                    = UIView()
        guard let fispIconView          = fispIconView else { return }
        fispIconView.backgroundColor    = .iceGray
        fispIconView.layer.cornerRadius = 17
        
        self.addSubview(fispIconView)
        fispIconView.anchor(top:      self.topAnchor,
                            trailing: self.trailingAnchor,
                            padding:  UIEdgeInsets(top:    10,
                                                   left:   0,
                                                   bottom: 12,
                                                   right:  8),
                            size:     CGSize(width:  34,
                                             height: 34))
        
        fispIconImage = UIImageView()
        guard let imageFispIcon = fispIconImage else { return }
        imageFispIcon.image     = UIImage(named: "archivePlanning")
        imageFispIcon.image     = imageFispIcon.image?.withRenderingMode(.alwaysTemplate)
        
        if hasFisps {
            imageFispIcon.tintColor = .blueLightStant
            configureGestureRecognizerRightView(hasFisps: hasFisps)
        } else {
            imageFispIcon.tintColor = .grayStant
        }
        
        self.addSubview(imageFispIcon)
        imageFispIcon.anchor(top:      fispIconView.topAnchor,
                             leading:  fispIconView.leadingAnchor,
                             bottom:   fispIconView.bottomAnchor,
                             trailing: fispIconView.trailingAnchor,
                             padding:  UIEdgeInsets(top:    8,
                                                    left:   8,
                                                    bottom: 8,
                                                    right:  8))
    }
    
    fileprivate func configureGestureRecognizerLeftView(quantitySubPlaces: Int) {
        if quantitySubPlaces == 0 { return }
        
        leftTapView                 = UIView()
        guard let leftTapView       = leftTapView else { return }
        leftTapView.backgroundColor = .clear
        
        self.addSubview(leftTapView)
        leftTapView.anchor(top:  self.topAnchor,
                        leading: self.leadingAnchor,
                        bottom:  self.bottomAnchor,
                        size:    CGSize(width:  self.frame.width * 0.7,
                                        height: ListingPlacesCell.cellHeight))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(goToSubPlaces))
        leftTapView.addGestureRecognizer(tap)
    }
    
    @objc func goToSubPlaces() {
        delegate?.goToSubPlaces()
    }
       
    fileprivate func configureGestureRecognizerRightView(hasFisps: Bool) {
        rightTapView                 = UIView()
        guard let rightTapView       = rightTapView else { return }
        rightTapView.backgroundColor = .clear
        
        self.addSubview(rightTapView)
        rightTapView.anchor(top:      self.topAnchor,
                            bottom:   self.bottomAnchor,
                            trailing: self.trailingAnchor,
                            size:     CGSize(width:  self.frame.width * 0.3,
                                             height: ListingPlacesCell.cellHeight))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(goToServiceInspectionFormFilledScreen))
        rightTapView.addGestureRecognizer(tap)
    }
    
    @objc func goToServiceInspectionFormFilledScreen() {
        delegate?.goToServiceInspectionFormFilledScreen()
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

public protocol ListingPlacesCellDidSelectDelegate {
    func goToSubPlaces()
    func goToServiceInspectionFormFilledScreen()
}

public enum PlaceStatusEnum {
    case noPlanning, hasPlanning, allApproved, allFinalized
    
    public func colorValue() -> UIColor {
        switch self {
            case .noPlanning:
                return .clear
            case .hasPlanning:
                return .darkGrayStant
            case .allApproved:
                return .greenStant
            case .allFinalized:
                return .orangeStant
        }
    }
}
