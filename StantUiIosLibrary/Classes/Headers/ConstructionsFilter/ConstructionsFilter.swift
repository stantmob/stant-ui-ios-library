import UIKit

public class ConstructionsFilter: UIView, FilterCellDelegate {
    
    public static let headerHeight: CGFloat = 38
    public var collectionView: FiltersCollectionView?
    
    var title: String?
    var icon: UIImage?
    var buttons = [FilterButton]()

    var selectedFiltersQuantity = 0
    
    public var fixedFilterUiView: UIView?
    public var filterIconImageView: UIImageView?
    public var filterQuantityUiView: UIView?
    public var filterQuantityLabel: UILabel?
    public var filterTitleLabel: UILabel?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    deinit {
        self.fixedFilterUiView    = nil
        self.filterIconImageView  = nil
        self.filterQuantityUiView = nil
        self.filterQuantityLabel  = nil
        self.filterTitleLabel     = nil
    }
    
    public func configureViewWith(fixedTitle: String, icon: UIImage, buttons: [FilterButton]) {
        self.title   = fixedTitle
        self.icon    = icon
        self.buttons = buttons
        
        self.addFilterFixedUiView()
        self.configureCollectionView()
        
        self.backgroundColor = UIColor.white
        self.addBottomBorderWithColor()
    }
    
    public func changeButton(title: String, index: Int) {
        let cell = collectionView?.cellForItem(at: IndexPath(row: index, section: 0)) as? FilterButtonCollectionViewCell
        cell?.mainButton?.setTitle(title, for: .normal)
    }
    
    public func changeButtonBackground(index: Int) {
        let cell = collectionView?.cellForItem(at: IndexPath(row: index, section: 0)) as? FilterButtonCollectionViewCell
        cell?.changeButtonStyle()
    }
    
    fileprivate func addFilterFixedUiView() {
        fixedFilterUiView = UIView.init(frame: CGRect(x: 0, y: 0, width: 80, height: 28))
        
        guard let fixedFilterUiView = fixedFilterUiView else { return }
        
        fixedFilterUiView.layer.cornerRadius = 3.0
        fixedFilterUiView.backgroundColor    = UIColor.lightGrayStant
        self.addSubview(fixedFilterUiView)
        fixedFilterUiView.anchor(top: self.topAnchor,
                                 leading: self.leadingAnchor,
                                 padding: UIEdgeInsets(top: 5, left: 16, bottom: 0, right: 0),
                                 size: CGSize(width: 80, height: 28))
        self.changeIconOfFixedUIView(amountToAdd: 0)
        
        filterTitleLabel  = UILabel.init(frame: CGRect(x: 0, y: 0, width: 60, height: 14))
        guard let filterTitleLabel = filterTitleLabel else { return }
        filterTitleLabel.text          = self.title ?? ""
        filterTitleLabel.textAlignment = .center
        filterTitleLabel.font          = .systemFont(ofSize: 12, weight: .bold)
        filterTitleLabel.textColor     = UIColor.darkGrayStant
        fixedFilterUiView.addSubview(filterTitleLabel)
        filterTitleLabel.anchor(leading: fixedFilterUiView.leadingAnchor,
                                trailing: fixedFilterUiView.trailingAnchor,
                                padding: UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0),
                                size: CGSize(width: 0, height: 14))
        filterTitleLabel.anchorCenterY(anchorY: fixedFilterUiView.centerYAnchor)
    }
    
    public func changeIconOfFixedUIView(amountToAdd: Int) {
        guard let fixedFilterUiView = fixedFilterUiView else { return }

        filterIconImageView?.removeFromSuperview()
        filterQuantityUiView?.removeFromSuperview()
        selectedFiltersQuantity += amountToAdd
        
        if selectedFiltersQuantity > 0 {
            filterQuantityUiView = UIView.init(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
            filterQuantityLabel  = UILabel.init(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
            
            guard let filterQuantityUiView = filterQuantityUiView, let filterQuantityLabel = filterQuantityLabel else { return }
            filterQuantityUiView.backgroundColor    = UIColor.darkGrayStant
            filterQuantityUiView.layer.cornerRadius = 3.0
            fixedFilterUiView.addSubview(filterQuantityUiView)
            filterQuantityUiView.anchorCenterY(anchorY: fixedFilterUiView.centerYAnchor)
            filterQuantityUiView.anchor(leading: fixedFilterUiView.leadingAnchor,
                                        padding: UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0),
                                        size: CGSize(width: 18, height: 18))
            
            filterQuantityLabel.text          = String(self.selectedFiltersQuantity)
            filterQuantityLabel.textAlignment = .center
            filterQuantityLabel.font          = .systemFont(ofSize: 12, weight: .bold)
            filterQuantityLabel.textColor     = UIColor.white
            filterQuantityUiView.addSubview(filterQuantityLabel)
            filterQuantityLabel.fillSuperView()
            filterQuantityLabel.anchorCenterY(anchorY: filterQuantityUiView.centerYAnchor)
        } else {
            guard let icon = self.icon else { return }
            filterIconImageView = UIImageView(image: icon)
            
            guard let filterIconImageView = filterIconImageView else { return }
            filterIconImageView.tintColor = UIColor.darkGrayStant
            fixedFilterUiView.addSubview(filterIconImageView)
            filterIconImageView.anchorCenterY(anchorY: fixedFilterUiView.centerYAnchor)
            filterIconImageView.anchor(leading: fixedFilterUiView.leadingAnchor,
                                       padding: UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0),
                                       size: CGSize(width: 18, height: 18))
        }
    }
    
    fileprivate func configureCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize                = CGSize(width: 90, height: 28)
        collectionViewLayout.minimumInteritemSpacing = 10.0
        collectionViewLayout.minimumLineSpacing      = 10.0
        collectionViewLayout.scrollDirection         = .horizontal
        
        collectionView = FiltersCollectionView.init(frame: CGRect(x: 0,
                                                                  y: 0,
                                                                  width: self.frame.width,
                                                                  height: 28), collectionViewLayout:collectionViewLayout)
        
        guard let collectionView = collectionView else { return }
        collectionView.backgroundColor = UIColor.white
        collectionView.set(buttons: buttons)
        collectionView.set(cellDelegate: self)
        self.addSubview(collectionView)
        collectionView.anchor(top: self.topAnchor,
                              leading: self.leadingAnchor,
                              bottom: self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding: UIEdgeInsets(top: 5, left: 106, bottom: 5, right: 0))
    }
    
}

