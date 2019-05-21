import UIKit

extension UIViewController {
    
    class func fromNib<T: UIViewController>() -> T? {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as? T
    }
    
}

