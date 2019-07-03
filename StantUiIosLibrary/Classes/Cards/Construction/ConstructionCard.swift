import UIKit

public class ConstructionCard: UITableViewCell {
    
    public static let IDENTIFIER = "ConstructionCardIdentifier"
    public static let cellHeight: CGFloat = 87
    
    var color: UIColor?
    var percentageValue: CGFloat?
    
    public var titleLabel: UILabel?
    public var subtitleLabel: UILabel?
    public var photoImageView: UIImageView?
    public var percentageBackgroundView: UIView?
    public var fullProgressBarView: UIView?
    public var progressBarView: UIView?
    public var percentageLabel: UILabel?
    public var progressWidth: CGFloat?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.titleLabel               = nil
        self.subtitleLabel            = nil
        self.photoImageView           = nil
        self.percentageBackgroundView = nil
        self.fullProgressBarView      = nil
        self.progressBarView          = nil
        self.percentageLabel          = nil
    }
    
    public func configureViewFor(construction: Construction) {
        self.removeSubviews()
        self.color           = construction.color
        self.percentageValue = construction.percentage

        self.configureImageWith(url: construction.imageUrl ?? String())
        self.configure(title: construction.title ?? String(), subtitle: construction.subtitle ?? String())
        self.configureProgressBarWith(color: construction.color ?? UIColor(), percentage: construction.percentage ?? CGFloat())
    }
    
    fileprivate func configure(title: String, subtitle: String) {
        titleLabel    = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 19))
        subtitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 14))
        
        guard let titleLabel = titleLabel, let subtitleLabel = subtitleLabel else { return }
        
        if #available(iOS 8.2, *) {
            self.setText(label: titleLabel, text: title, textSize: 16, textWeight: .regular, textColor: UIColor.darkStant,
                         topAnchor: 14, leftAnchor: 91, bottomAnchor: 54, rightAnchor: 12)
            self.setText(label: subtitleLabel, text: subtitle, textSize: 12, textWeight: .regular, textColor: UIColor.darkGrayStant,
                         topAnchor: 37, leftAnchor: 91, bottomAnchor: 36, rightAnchor: 12)
        }
    }
    
    fileprivate func setText(label: UILabel, text: String, textSize: CGFloat, textWeight: UIFont.Weight, textColor: UIColor,
                             topAnchor: CGFloat, leftAnchor: CGFloat, bottomAnchor: CGFloat, rightAnchor: CGFloat) {
        if #available(iOS 9.0, *) {
            label.text      = text
            label.font      = .systemFont(ofSize: textSize, weight: textWeight)
            label.textColor = textColor
            self.addSubview(label)
            label.anchor(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding: UIEdgeInsets(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor))
        }
        
    }
    
    fileprivate func configureImageWith(url: String) {
        photoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        
        guard let photoImageView = photoImageView else { return }
        photoImageView.showRounded(image: url)
        self.addSubview(photoImageView)
        if #available(iOS 9.0, *) {
            photoImageView.anchor(top: self.topAnchor,
                                  leading: self.leadingAnchor,
                                  padding: UIEdgeInsets(top: 9, left: 12, bottom: 0, right: 0),
                                  size: CGSize(width: 70, height: 70))
        }
    }
    
    fileprivate func configureProgressBarWith(color: UIColor, percentage: CGFloat) {
        fullProgressBarView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 4))

        guard let fullProgressBarView = fullProgressBarView else { return }
        fullProgressBarView.backgroundColor    = UIColor.lightGrayStant
        fullProgressBarView.layer.cornerRadius = 2.5
        self.addSubview(fullProgressBarView)
        if #available(iOS 9.0, *) {
            fullProgressBarView.anchor(top: self.topAnchor,
                                       leading: self.leadingAnchor,
                                       bottom: self.bottomAnchor,
                                       trailing: self.trailingAnchor,
                                       padding: UIEdgeInsets(top: 61, left: 91, bottom: 21, right: 53))
        }
    
        self.configurePercentageIndicator(color: color, percentage: percentage)
    }

    fileprivate func configurePercentageIndicator(color: UIColor, percentage: CGFloat) {
        percentageBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 18))
        
        guard let backgroundView = percentageBackgroundView else { return }
        backgroundView.layer.cornerRadius = 3
        backgroundView.backgroundColor    = color
        self.addSubview(backgroundView)
        
        if #available(iOS 9.0, *) {
            backgroundView.anchor(top: self.topAnchor,
                                  trailing: self.trailingAnchor,
                                  padding: UIEdgeInsets(top: 54, left: 0, bottom: 0, right: 12),
                                  size: CGSize(width: 36, height: 18))
            
            percentageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 36, height: 18))
            
            guard let percentageLabel = percentageLabel else { return }

            percentageLabel.text          = "\(Int(percentage))%"
            percentageLabel.font          = .systemFont(ofSize: 12, weight: .bold)
            percentageLabel.textColor     = UIColor.white
            percentageLabel.textAlignment = .center
            backgroundView.addSubview(percentageLabel)
            percentageLabel.fillSuperView()
        }
    }
    
    public override func layoutSubviews() {
        guard let fullProgressBarView = fullProgressBarView,
            let percentage = self.percentageValue,
            let color = self.color else { return }
    
        progressBarView  = UIView(frame: fullProgressBarView.frame)
        
        guard let progressBarView = progressBarView else { return }
        progressBarView.backgroundColor    = color
        progressBarView.layer.cornerRadius = 2.5
        fullProgressBarView.addSubview(progressBarView)

        progressWidth = (self.frame.width - 91 - 53)
        
        guard let currentProgressWidth = progressWidth else { return }
        if percentage <= 100 {
           self.progressWidth = currentProgressWidth * (percentage / 100)
        }
        
        if #available(iOS 9.0, *) {
            progressBarView.anchor(top: fullProgressBarView.topAnchor,
                                   leading: fullProgressBarView.leadingAnchor,
                                   bottom: fullProgressBarView.bottomAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                   size: CGSize(width: self.progressWidth ?? 0, height: 4))
        }
    }
    
}

public struct Construction {
    public let title: String?
    let subtitle: String?
    let imageUrl: String?
    let color: UIColor?
    let percentage: CGFloat?
    
    public init(title: String, subtitle: String, imageUrl: String, color: UIColor, percentage: CGFloat) {
        self.title      = title
        self.subtitle   = subtitle
        self.imageUrl   = imageUrl
        self.color      = color
        self.percentage = percentage
    }
}
