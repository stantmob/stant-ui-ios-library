//
//  Gesturizer.swift
//  StantUiIosLibrary
//
//  Created by Mac Mini Novo on 25/07/19.
//

import UIKit

public class Gesturizer {
    
    private let viewController: UIViewController
    private let backgroundView: UIView
    private var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    
    init(viewController: UIViewController,
         backgroundView: UIView) {
        self.viewController = viewController
        self.backgroundView = backgroundView
    }
    
    func swipeDownGesture(sender: UIGestureRecognizer) {
        
        let touchPoint = sender.location(in: self.viewController.view.window)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.backgroundView.alpha = 0.3
        })
        
        if sender.state == UIGestureRecognizer.State.began {
            self.initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizer.State.changed {
            self.backgroundView.alpha = 0
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.viewController.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.viewController.view.frame.size.width, height: self.viewController.view.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                
                self.viewController.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.viewController.view.frame = CGRect(x: 0, y: 0, width: self.viewController.view.frame.size.width, height: self.viewController.view.frame.size.height)
                })
            }
        }
    }
    
    func getSwipeDownGesture() -> (UIGestureRecognizer) -> () {
        return swipeDownGesture
    }
}

