import UIKit

public class ConstructionCard: UITableViewCell {
    
    public static let IDENTIFIER = "ConstructionCardIdentifier"
    
    public static let cellHeight: CGFloat = 87
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureView(title: String, subtitle: String, imageUrl: String, color: UIColor, percentage: Int) {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: ConstructionCard.cellHeight))
        
        self.addSubview(mainView)
        
        mainView.fillSuperView()
        mainView.backgroundColor = UIColor.white
        
        self.configure(title: title, subtitle: subtitle)
        self.configureImageWith(url: imageUrl)
        self.configureProgressBarWith(color: color, percentage: percentage)
    }
    
    fileprivate func configure(title: String, subtitle: String) {
        
    }
    
    fileprivate func configureImageWith(url: String) {
//        let imageView = UIImageView(frame: CGRect()
    }
    
    fileprivate func configureProgressBarWith(color: UIColor, percentage: Int) {
        
    }
    
}
