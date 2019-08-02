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
        
        let touchPoint          = sender.location(in: self.viewController.view.window)
        let currentGestureState = sender.state
        
        self.animateBackgroundVisibility()
        
        switch currentGestureState {
        case UIGestureRecognizer.State.began:
            self.setInitialPointTo(touchPoint)
            break
        case UIGestureRecognizer.State.changed:
            self.configureViewForSwipingGestureAccordingTo(touchPoint)
            break
        default:
            self.configureViewForCancelOrFinishSwipingAccordingTo(touchPoint)
        }
    }
    
    fileprivate func animateBackgroundVisibility() {
        UIView.animate(withDuration: 1.0, animations: {
            self.backgroundView.alpha = 0.3
        })
    }
    
    fileprivate func setInitialPointTo(_ touchPoint: CGPoint) {
         self.initialTouchPoint = touchPoint
    }
    
    fileprivate func configureViewForSwipingGestureAccordingTo(_ touchPoint: CGPoint) {
        self.backgroundView.alpha = 0
        let isScrollingDown       = touchPoint.y - initialTouchPoint.y > 0
        
        if isScrollingDown {
            self.viewController.view.frame = CGRect(x: 0,
                                                    y:touchPoint.y - initialTouchPoint.y,
                                                    width: self.viewController.view.frame.size.width,
                                                    height: self.viewController.view.frame.size.height)
        }
    }
    
    fileprivate func configureViewForCancelOrFinishSwipingAccordingTo(_ touchPoint: CGPoint) {
        let hasScrolledEnoughtToDismiss = touchPoint.y - initialTouchPoint.y > 100
        
        if hasScrolledEnoughtToDismiss {
            self.viewController.dismiss(animated: true, completion: nil)
            return
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.viewController.view.frame = CGRect(x: 0, y: 0, width: self.viewController.view.frame.size.width, height: self.viewController.view.frame.size.height)
        })
    }
    
    func getSwipeDownGesture() -> (UIGestureRecognizer) -> () {
        return swipeDownGesture
    }
}

