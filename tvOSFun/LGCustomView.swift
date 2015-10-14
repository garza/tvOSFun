//
//  MyImageView.swift
//  UIKitCatalog
//
//  Created by John David Garza on 9/30/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import UIKit

class LGCustomView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }

    func setupView() {
        self.layer.shadowOffset = CGSizeMake(0, 10)
        self.layer.shadowOpacity = 0
        self.layer.shadowRadius = 15
        self.layer.shadowColor = UIColor.blackColor().CGColor
    }
    
    override func canBecomeFocused() -> Bool {
        return true
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        
        coordinator.addCoordinatedAnimations({ [unowned self] in
            let duration = UIView.inheritedAnimationDuration()
            if self.focused {
                let animation = CABasicAnimation(keyPath: "transform.rotation")
                animation.duration = 0.5*duration
                animation.repeatCount = 2
                animation.autoreverses = true
                animation.toValue = self.rads(1)
                self.layer.addAnimation(animation, forKey: "wiggle")
                
                let shadowAnimation = CABasicAnimation(keyPath: "shadowOpacity")
                shadowAnimation.fromValue = 0
                shadowAnimation.toValue = 0.6
                shadowAnimation.duration = duration
                self.layer.addAnimation(shadowAnimation, forKey: "shadow")
                self.layer.shadowOpacity = 0.6
            } else {
                self.layer.shadowOpacity = 0
            }
            }, completion: nil)
    }

    func rads(degrees:Double) -> Double {
        return (degrees * M_PI)/180.0
    }
}
