import UIKit

public class ConstructionCard: UITableViewCell {
    
    public static let IDENTIFIER = "ConstructionCardIdentifier"
    public static let cellHeight: CGFloat = 87
    
    var mainView: UIView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureView(title: String, subtitle: String, imageUrl: String, color: UIColor, percentage: Int) {
        mainView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: ConstructionCard.cellHeight))
        
        guard let mainView = mainView else { return }
        
        self.addSubview(mainView)
        
        mainView.fillSuperView()
        mainView.backgroundColor = UIColor.magenta
        
        self.configureImageWith(url: imageUrl)
        self.configure(title: title, subtitle: subtitle)
        self.configureProgressBarWith(color: color, percentage: percentage)
    }
    
    fileprivate func configure(title: String, subtitle: String) {
        let titleLabel    = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 19))
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 14))
        
        self.setText(label: titleLabel, text: title, textSize: 16, textWeight: .regular, textColor: UIColor.dark,
                     topAnchor: 14, leftAnchor: 91, bottomAnchor: 54, rightAnchor: 12)
        self.setText(label: subtitleLabel, text: subtitle, textSize: 12, textWeight: .regular, textColor: UIColor.darkGray,
                     topAnchor: 37, leftAnchor: 91, bottomAnchor: 36, rightAnchor: 12)
        
    }
    
    fileprivate func setText(label: UILabel, text: String, textSize: CGFloat, textWeight: UIFont.Weight, textColor: UIColor,
                             topAnchor: CGFloat, leftAnchor: CGFloat, bottomAnchor: CGFloat, rightAnchor: CGFloat) {
        guard let mainView = mainView else { return }
        
        label.text      = text
        label.font      = .systemFont(ofSize: textSize, weight: textWeight)
        label.textColor = textColor
        mainView.addSubview(label)
        label.anchor(top: mainView.topAnchor,
                     leading: mainView.leadingAnchor,
                     bottom: mainView.bottomAnchor,
                     trailing: mainView.trailingAnchor,
                     padding: UIEdgeInsets(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor))
    }
    
    fileprivate func configureImageWith(url: String) {
        let photoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        
        guard let mainView = mainView else { return }
        photoImageView.showRounded(image: url)
        mainView.addSubview(photoImageView)
        photoImageView.anchor(top: mainView.topAnchor,
                              leading: mainView.leadingAnchor,
                              bottom: nil,
                              trailing: nil,
                              padding: UIEdgeInsets(top: 9, left: 12, bottom: 0, right: 0),
                              size: CGSize(width: 70, height: 70))
    }
    
    fileprivate func configureProgressBarWith(color: UIColor, percentage: Int) {
        let fullProgressBarView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 4))
        
        guard let mainView = mainView else { return }
        fullProgressBarView.backgroundColor    = UIColor.lightGray
        fullProgressBarView.layer.cornerRadius = 2.5
        mainView.addSubview(fullProgressBarView)
        fullProgressBarView.anchor(top: mainView.topAnchor,
                                   leading: mainView.leadingAnchor,
                                   bottom: mainView.bottomAnchor,
                                   trailing: mainView.trailingAnchor,
                                   padding: UIEdgeInsets(top: 61, left: 91, bottom: 21, right: 53))
        
        let progressBarView  = UIView(frame: fullProgressBarView.frame)
            
        progressBarView.backgroundColor    = color
        progressBarView.layer.cornerRadius = 2.5
        fullProgressBarView.addSubview(progressBarView)
        
        let rightAnchor: CGFloat = (self.frame.width - 53.0 - 91.0) / 2
    
        progressBarView.anchor(top: fullProgressBarView.topAnchor,
                               leading: fullProgressBarView.leadingAnchor,
                               bottom: fullProgressBarView.bottomAnchor,
                               trailing: fullProgressBarView.trailingAnchor,
                               padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightAnchor))
        
    }
    
}
