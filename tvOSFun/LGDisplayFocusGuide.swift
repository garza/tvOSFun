//
//  LGDisplayFocusGuide.swift
//  FoscusTest
//
//  @original source: http://www.captechconsulting.com/blogs/UILayoutGuide--Auto-Layouts-Invisible-Helpers
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
        
        // base case
        guard let verifiedSubLayers = self.layer.sublayers else { return }
        
        // if this is a lgfocusguidedisplaylayer, it's from a previous call to showFocusGuides(), remove
        for layer in verifiedSubLayers {
            if layer is LGFocusGuideDisplayLayer {
                layer.removeFromSuperlayer()
            }
        }
        
        for guide in self.layoutGuides {
            //we only want to show FocusGuides, not LayoutGuides
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
        self.lineDashPattern = [12, 12, 12, 12]
        self.fillColor = UIColor.clearColor().CGColor
    }
    
    // required for any subclass of CAShapeLayer
    // we will leave it unimplemented
    required init?(coder aDecodeer: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}