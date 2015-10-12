//
//  LGViewController.swift
//
//  Created by John David Garza on 9/27/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import UIKit

class LGViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet weak var topLeftView: LGCustomView!
    @IBOutlet weak var topRightView: LGCustomView!
    @IBOutlet weak var bottomCenterView: LGCustomView!
    private var focusGuide: UIFocusGuide!

    // MARK: UIViewController
    
    override func shouldUpdateFocusInContext(context: UIFocusUpdateContext) -> Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        focusGuide = UIFocusGuide()
        view.addLayoutGuide(focusGuide)
        
        focusGuide.leftAnchor.constraintEqualToAnchor(topLeftView.leftAnchor).active = true
        focusGuide.topAnchor.constraintEqualToAnchor(bottomCenterView.topAnchor).active = true
        
        focusGuide.widthAnchor.constraintEqualToAnchor(topRightView.widthAnchor).active = true
        focusGuide.heightAnchor.constraintEqualToAnchor(bottomCenterView.heightAnchor).active = true
    }
    
    // MARK: UIFocusEnvironment
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)
        

        self.view.layoutIfNeeded()
        
        coordinator.addCoordinatedAnimations({
            // let red = UIColor(red: 255, green: 0, blue: 0, alpha: 0.7)
            // let green = UIColor(red: 0, green: 255, blue: 0, alpha: 1.0)
            self.view.layoutIfNeeded()
            }, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.showFocusGuides()
    }
}
