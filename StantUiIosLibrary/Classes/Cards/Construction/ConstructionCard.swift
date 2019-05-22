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
        
        self.configure(title: title, subtitle: subtitle)
        self.configureImageWith(url: imageUrl)
        self.configureProgressBarWith(color: color, percentage: percentage)
    }
    
    fileprivate func configure(title: String, subtitle: String) {
        
    }
    
    fileprivate func configureImageWith(url: String) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        
        guard let mainView = mainView else { return }
        imageView.showRounded(image: url)
        mainView.addSubview(imageView)
        imageView.anchor(top: mainView.topAnchor,
                         leading: mainView.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 11, left: 16, bottom: 0, right: 0),
                         size: CGSize(width: 70, height: 70))
    }
    
    fileprivate func configureProgressBarWith(color: UIColor, percentage: Int) {
        
    }
    
}
