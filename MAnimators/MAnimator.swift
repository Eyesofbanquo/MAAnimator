//
//  MAnimator.swift
//  MAnimators
//
//  Created by Markim Shaw on 8/19/16.
//  Copyright © 2016 Markim Shaw. All rights reserved.
//

import Foundation
import UIKit

enum MAnimatorStyle {
    case None
    case Rotate
    case Shrink
    case Expand
}

protocol MAnimatorDelegate {
    var animatorStyle:MAnimatorStyle { get set }
}

extension UIView {
    
}

extension UIViewController: UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var animatorStyle:MAnimatorStyle {
        get {
            return self.animatorStyle
        }
        
        set (value) {
            self.animatorStyle = value
        }
    }
    
    var animatorDuration:NSTimeInterval {
        get {
            return self.animatorDuration
        }
        
        set (value) {
            self.animatorDuration = value
        }
    }
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return self.animatorDuration
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var context:UIViewControllerContextTransitioning?
        
        context = transitionContext
        let containerView = transitionContext.containerView()
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!        
        
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        containerView?.addSubview(toViewController.view)
        containerView?.addSubview(fromViewController.view)
    }
    
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //self.presenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //self.presenting = false
        return self
    }

}