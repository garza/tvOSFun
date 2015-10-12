//
//  LGDisplayFocusGuide.swift
//  FoscusTest
//
//  Created by John David Garza on 10/11/15.
//  Copyright © 2015 John David Garza. All rights reserved.
//

import UIKit

extension UIView {
    func showFocusGuides() {
        // recursion, show all the focus guides!
        for sub in subviews {
            sub.showFocusGuides()
        }
        
        // zero case
        guard let verifiedSubLayers = self.layer.sublayers else { return }
        
        for layer in verifiedSubLayers {
            if layer is LGFocusGuideDisplayLayer {
                layer.removeFromSuperlayer()
            }
        }
        
        for guide in self.layoutGuides {
            if guide is UIFocusGuide {
                let l = LGFocusGuideDisplayLayer(guide: guide as! UIFocusGuide)
                self.layer.addSublayer(l)
            }
        }
    }
}

class LGFocusGuideDisplayLayer: CAShapeLayer {
    init(guide:UIFocusGuide) {
        super.init()
        
        self.path = UIBezierPath(rect: guide.layoutFrame).CGPath
        self.strokeColor = UIColor.redColor().CGColor
        self.lineWidth = 0.5
        self.lineDashPattern = [2, 2, 2, 2]
        self.fillColor = UIColor.clearColor().CGColor
        
        //animate
        let dashAnimation = CABasicAnimation(keyPath: "dashAnimation")
        dashAnimation.duration = 0.75
        dashAnimation.repeatCount = Float.infinity
        dashAnimation.fromValue = 0
        dashAnimation.toValue = 3
        self.addAnimation(dashAnimation, forKey: "dashAnimation")
    }
    
    // required for any subclass of CAShapeLayer
    // we will leave it unimplemented
    required init?(coder aDecodeer: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}