import UIKit

public class ViewTeste: UIView {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    private func configureView() {
        // Here it comes general configurations
        self.backgroundColor = UIColor.blue
    }
    
    public func changeBackground() {
        // Here it comes custom configurations
        self.backgroundColor = UIColor.magenta
    }
    
}
