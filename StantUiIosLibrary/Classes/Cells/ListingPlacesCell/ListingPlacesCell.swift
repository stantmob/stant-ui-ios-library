//
//  ListingPlacesCell.swift
//  StantUiIosLibrary
//
//  Created by Renato Vieira on 6/11/20.
//

import UIKit

public class ListingPlacesCell: UITableViewCell {
    
    public static let cellHeight:    CGFloat = 56
    
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

        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 4)
        bounds      = bounds.inset(by: padding)
    }
    
    public func configureViewFor(status: PlaceStatusEnum, placeTitle: String, quantitySubPlaces: Int) {
        self.removeSubviews()
        
        configureBar(status: status)
        configureLocationImageView()
        //configurePlaceSubPlaceAnchor(placeTitle: placeTitle, quantitySubPlaces: quantitySubPlaces, hasSubPlaces: hasSubPlaces)
        configurePlaceTitleLabel(placeTitle: placeTitle, quantitySubPlaces: quantitySubPlaces)
        configureSubPlacesLabel(quantitySubPlaces: quantitySubPlaces)
        configurePercentagePlaceLabel()
        configureListingPlacesIcon()
        configureGestureRecognizerLeftView()
        configureGestureRecognizerRightView()
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
    
//    fileprivate func configurePlaceSubPlaceAnchor(placeTitle: String, quantitySubPlaces: Int) {
//
//        if quantitySubPlaces == 0{
//            configurePlaceTitleLabel(placeTitle: placeTitle, quantitySubPlaces: quantitySubPlaces)
//        } else {
//            configurePlaceTitleLabel(placeTitle: placeTitle, quantitySubPlaces: quantitySubPlaces)
//            configureSubPlacesLabel(quantitySubPlaces: quantitySubPlaces)
//        }
//    }
    
    fileprivate func configurePlaceTitleLabel(placeTitle: String, quantitySubPlaces: Int) {
        placeTitleLabel           = UILabel()
        guard let placeTitleLabel = placeTitleLabel else { return }
        placeTitleLabel.textColor = .blueDarkStant
        placeTitleLabel.text      = placeTitle
        placeTitleLabel.font      = .systemFont(ofSize: 16)

        self.addSubview(placeTitleLabel)
        
        if quantitySubPlaces == 0 {
            placeTitleLabel.anchor(top:     self.topAnchor,
                                   leading: locationImageView?.trailingAnchor,
                                   bottom:  self.bottomAnchor,
                                   padding: UIEdgeInsets(top:    5,
                                                         left:   7,
                                                         bottom: 5,
                                                         right:  0))
        } else {
            placeTitleLabel.anchor(top:     self.topAnchor,
                                   leading: locationImageView?.trailingAnchor,
                                   bottom:  self.bottomAnchor,
                                   padding: UIEdgeInsets(top:    5,
                                                         left:   7,
                                                         bottom: 18,
                                                         right:  0))
        }
    }

    fileprivate func configureSubPlacesLabel(quantitySubPlaces: Int) {
        if quantitySubPlaces == 0 { return }
        
        subPlacesLabel           = UILabel()
        guard let subPlacesLabel = subPlacesLabel else { return }
        subPlacesLabel.textColor = .darkGrayStant
        subPlacesLabel.font      = .systemFont(ofSize: 12)
        
        if quantitySubPlaces == 1 {
            subPlacesLabel.text = "\(quantitySubPlaces) Sublocal"
        } else {
            subPlacesLabel.text = "\(quantitySubPlaces) Sublocais"
        }

        self.addSubview(subPlacesLabel)
        subPlacesLabel.anchor(leading: locationImageView?.trailingAnchor,
                              bottom: self.bottomAnchor,
                              padding: UIEdgeInsets(top:    0,
                                                    left:   8,
                                                    bottom: 10,
                                                    right:  0))
    }
    
    fileprivate func configurePercentagePlaceLabel() {
        percentagePlacelabel           = UILabel()
        guard let percentagePlacelabel = percentagePlacelabel else { return }
        percentagePlacelabel.textColor = .darkGrayStant
        percentagePlacelabel.text      = "100%"
        percentagePlacelabel.font      = .systemFont(ofSize: 16)
        
        self.addSubview(percentagePlacelabel)
        percentagePlacelabel.anchor(top:      self.topAnchor,
                                    bottom:   self.bottomAnchor,
                                    trailing: self.trailingAnchor,
                                    padding:  UIEdgeInsets(top:    19,
                                                           left:   0,
                                                           bottom: 18,
                                                           right:  35),
                                    size:     CGSize(width:  50,
                                                     height: 19))
    }
    
    fileprivate func configureListingPlacesIcon() {
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
                                                   right:  2),
                            size:     CGSize(width:  34,
                                             height: 34))
        
        fispIconImage = UIImageView()
        guard let imageFispIcon = fispIconImage else { return }
        imageFispIcon.image     = UIImage(named: "archivePlanning")
        imageFispIcon.image     = imageFispIcon.image?.withRenderingMode(.alwaysTemplate)
        imageFispIcon.tintColor = .blueLightStant
        
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
    
    fileprivate func configureGestureRecognizerLeftView() {
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
        print("Have Subplaces")
    }
       
    
    fileprivate func configureGestureRecognizerRightView() {
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
        print("Have Fips")
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


