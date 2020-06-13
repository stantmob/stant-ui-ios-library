//
//  ListingPlacesCell.swift
//  StantUiIosLibrary
//
//  Created by Renato Vieira on 6/11/20.
//

import UIKit

public class ListingPlacesCell: UITableViewCell {
    
    public static let cellHeight: CGFloat = 56
    
    public var bar: UIView?
    public var locationImageView: UIView?
    public var locationImage: UIImageView?
    public var placeTitleLabel: UILabel?
    public var subPlacesLabel: UILabel?
    public var percentagePlacelabel: UILabel?
    
    
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
    
    public func configureViewFor() {
        self.removeSubviews()
        
        configureBar()
        addMainViewWithShadow()
        configureLocationImageView()
        configurePlaceTitleLabel()
        configureSubPlacesLabel()
        configurePercentagePlaceLabel()
        
        self.selectionStyle = .none
    }
    
    fileprivate func configureBar() {
        bar = UIView()
        guard let bar = bar else { return }
        bar.backgroundColor = .red
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.addSubview(bar)
        
        bar.anchor(top:     self.topAnchor,
                   leading: self.leadingAnchor,
                   bottom:  self.bottomAnchor,
                   size:    CGSize(width: 4,
                                   height: self.frame.height))
    }
    
    fileprivate func configureLocationImageView() {
        locationImageView = UIView()
        guard let locationImageView = locationImageView else { return }
        locationImageView.backgroundColor = .white
        
        self.addSubview(locationImageView)
        
        locationImageView.anchor(top: self.topAnchor,
                                 leading: bar?.trailingAnchor,
                                 bottom: self.bottomAnchor,
                                 padding: UIEdgeInsets(top: 16,
                                                       left: 21,
                                                       bottom: 16,
                                                       right: 0),
                                 size: CGSize(width: 21,
                                              height: 22))
        
        locationImage = UIImageView()
        guard let locationImage = locationImage else { return }
        locationImage.image = UIImage(named: "location")
        locationImage.layer.cornerRadius = 3
        locationImage.image = locationImage.image?.withRenderingMode(.alwaysTemplate)
        locationImage.tintColor = .blueDarkStant
        
        self.addSubview(locationImage)
        locationImage.anchor(top: locationImageView.topAnchor, leading: locationImageView.leadingAnchor, bottom: locationImageView.bottomAnchor, trailing: locationImageView.trailingAnchor, size: CGSize(width: 21, height: 22))
        
    }
    
    fileprivate func configurePlaceTitleLabel() {
        placeTitleLabel = UILabel()
        guard let placeTitleLabel = placeTitleLabel else { return }
        placeTitleLabel.textColor = .blueDarkStant
        placeTitleLabel.text = "Obra 1"
        placeTitleLabel.font = .systemFont(ofSize: 16)
        
        self.addSubview(placeTitleLabel)
        
        placeTitleLabel.anchor(top: self.topAnchor,
                               leading: locationImageView?.trailingAnchor,
                               bottom: self.bottomAnchor,
                               padding: UIEdgeInsets(top: 5,
                                                     left: 7,
                                                     bottom: 18,
                                                     right: 0),
                               size: CGSize(width: 49,
                                            height: 19))
    }
    
    fileprivate func configureSubPlacesLabel() {
        subPlacesLabel = UILabel()
        guard let subPlacesLabel = subPlacesLabel else { return }
        subPlacesLabel.textColor = .darkGrayStant
        subPlacesLabel.text = "3 Sublocais"
        subPlacesLabel.font = .systemFont(ofSize: 12)
        
        self.addSubview(subPlacesLabel)
        
        subPlacesLabel.anchor(top: placeTitleLabel?.bottomAnchor,
                              leading: locationImageView?.trailingAnchor,
                              bottom: self.bottomAnchor,
                              padding: UIEdgeInsets(top: 18,
                                                    left: 8,
                                                    bottom: 12,
                                                    right: 0),
                              size: CGSize(width: 80,
                                           height: 10))
    }
    
    fileprivate func configurePercentagePlaceLabel() {
        percentagePlacelabel = UILabel()
        guard let percentagePlacelabel = percentagePlacelabel else { return }
        percentagePlacelabel.textColor = .darkGrayStant
        percentagePlacelabel.text = "100%"
        percentagePlacelabel.font = .systemFont(ofSize: 16)
        
        self.addSubview(percentagePlacelabel)
        
        percentagePlacelabel.anchor(top: self.topAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 19, left: 0, bottom: 18, right: 30), size: CGSize(width: 50, height: 19))
        
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

public struct PlanningPLaces {
    
    public let placeTitle: String
    public let subPlaces:  String
    public let percentagePlace: Float
    
    public init(placeTitle: String,
                subPlaces:  String,
                percentage: Float) {
        self.placeTitle = placeTitle
        self.subPlaces  = subPlaces
        self.percentagePlace = percentage
    }
}
