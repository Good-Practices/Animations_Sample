//
//  AnimationManager.swift
//  Animations
//
//  Created by Onur Cantay on 19/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import UIKit

open class AnimationManager {
    
    func shake(view: UIView, for duration: TimeInterval = 0.5, withTranslation translation: CGFloat = 10) {
//        property animators are realeased with iOS 10 and comes with a lot of features like stoping animation chaining animation etc
        let propertyAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.3) {
            view.transform = CGAffineTransform(translationX: translation, y: 0)
        }
        
        propertyAnimator.addAnimations({
//            if we want to set transform to its original point again its more efficient to provide trough the static value called '.identity'
//            view.transform = CGAffineTransform(translationX: 0, y: 0)
            view.transform = .identity
        }, delayFactor: 0.2)
//        as we know property animators needs be prepared and started so dont forget to call the start animation function
        propertyAnimator.startAnimation()
    }
    
    func fadeInOut(view: UIView, for duration: TimeInterval = 0.5, isFadeIn: Bool) {
/*        most of the time we provide the default curving parameters which shows to the function how the timing behaviour should be which is listed like
          .easeIn, .easeOut, .easeInOut etc
          but if we need to customize it we use control points to prevent spesific timing curves the point makes a parabolish graph for the timing and behaves like the customized curve
*/
        let controlPoint1: CGPoint = .init(x: 0.25, y: 0.5)
        let controlPoint2: CGPoint = .init(x: 0.75, y: 0.5)
        let propertyAnimator = UIViewPropertyAnimator(duration: duration, controlPoint1: controlPoint1, controlPoint2: controlPoint2) {
            view.alpha = isFadeIn ? 1 : 0
        }
        
        propertyAnimator.addCompletion { _ in
//            this is not the best way to reverse an animation there is a property called reversed but somehow wasnt able to triger it :/
            let finisherAnimator = UIViewPropertyAnimator(duration: duration, controlPoint1: controlPoint2, controlPoint2: controlPoint1) {
                view.alpha = !isFadeIn ? 1 : 0
            }
            finisherAnimator.startAnimation()
        }
        propertyAnimator.startAnimation()
    }
    
    func fadeIn(view: UIView, for duration: TimeInterval = 0.5) {
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: .curveEaseIn, animations: {
            view.alpha = 1
        }, completion: nil)
        
        //        let propertyAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn) {
        //            view.alpha = 1
        //        }
        //        propertyAnimator.startAnimation()
    }
    
    func animateConstraintByPriority(view: UIView, duration: TimeInterval = 0.5, firstPriorityConstraint: NSLayoutConstraint, secondPriorityConstraint: NSLayoutConstraint) {
        firstPriorityConstraint.priority = .defaultLow
        secondPriorityConstraint.priority = .defaultHigh
        let propertyAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            view.superview?.layoutIfNeeded()
        }
        propertyAnimator.startAnimation()
    }
    
    func resize(view: UIView, duration: TimeInterval = 5.0, scaleX: CGFloat, scaleY: CGFloat) {
        let propertyAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn) {
            view.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        }
        
        propertyAnimator.addAnimations({
            view.backgroundColor = UIColor(named: "flatAlizarin")
        }, delayFactor: 0.2)
        
        propertyAnimator.addCompletion { _ in
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [.repeat, .autoreverse], animations: {
                view.backgroundColor = UIColor(named: "flatOrange")
                view.transform = .identity
            }, completion: nil)
        }
        propertyAnimator.startAnimation()
    }
    
    func changeColor(view: UIView, duration: TimeInterval, firstColor: UIColor, secondColor: UIColor) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 1, options: .curveEaseIn, animations: {
            view.backgroundColor = firstColor
        }) { _ in
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 1, options: .curveEaseOut, animations: {
                view.backgroundColor = secondColor
            }, completion: nil)
        }
    }
    
}
