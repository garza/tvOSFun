//
//  MyImageView.swift
//  UIKitCatalog
//
//  Created by John David Garza on 9/30/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import UIKit

class LGCustomView: UIView {
    
    override func canBecomeFocused() -> Bool {
        return true
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {

        coordinator.addCoordinatedAnimations({ [unowned self] in
            let duration = UIView.inheritedAnimationDuration()
            if self.focused {
                let animation = CABasicAnimation(keyPath: "transform.rotation")
                animation.duration = 0.75*duration
                animation.repeatCount = 3
                animation.autoreverses = true
                animation.toValue = self.rads(5)
                self.layer.addAnimation(animation, forKey: "wiggle")
            }
            }, completion: nil)
    }

    func rads(degrees:Double) -> Double {
        return (degrees * M_PI)/180.0
    }
}