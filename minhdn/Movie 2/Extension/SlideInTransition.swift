//
//  SlideInTransition.swift
//  Movie 2
//
//  Created by MinhDev on 7/21/21.
//

import UIKit

class SlideInTransition: NSObject,UIViewControllerAnimatedTransitioning {
    var ispresenting = true
    let dimmingView = UIView()
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toviewcontroller = transitionContext.viewController(forKey: .to),
            let fromviewcontroller = transitionContext.viewController(forKey: .from) else {return}
        let containerView = transitionContext.containerView
        let finalWith = toviewcontroller.view.bounds.width * 0.8
        let finnalHeight = toviewcontroller.view.bounds.height
        if ispresenting{
//            add dimmingView
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
//            add  menu view controller to container
            containerView.addSubview(toviewcontroller.view)
            toviewcontroller.view.frame = CGRect(x: -finalWith, y: 0, width: finalWith, height: finnalHeight)
        }
//        animated on screen
        let tranform = {
            self.dimmingView.alpha = 0.5
            toviewcontroller.view.transform = CGAffineTransform(translationX: finalWith, y: 0)
        }
//        animate back off screen
        let indentity = {
            self.dimmingView.alpha = 0.0
            fromviewcontroller.view.transform = .identity
        }
//        Animation of the  transition
        let Duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: Duration, animations: {
            self.ispresenting ? tranform() :indentity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }
    

}
