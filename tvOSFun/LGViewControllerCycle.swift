//
//  LGViewController.swift
//
//  Created by John David Garza on 9/27/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import UIKit

class LGViewControllerCycle: UIViewController {
    // MARK: Properties

    @IBOutlet weak var leftView: LGCustomView!
    
    @IBOutlet weak var centerView: LGCustomView!
    
    @IBOutlet weak var rightView: LGCustomView!

    private var lFocusGuide: UIFocusGuide!
    private var rFocusGuide: UIFocusGuide!

    // MARK: UIViewController
    
    override func shouldUpdateFocusInContext(context: UIFocusUpdateContext) -> Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lFocusGuide = UIFocusGuide()
        view.addLayoutGuide(lFocusGuide)

        lFocusGuide.widthAnchor.constraintEqualToConstant(80.0).active = true
        lFocusGuide.heightAnchor.constraintEqualToConstant(80.0).active = true

        
        lFocusGuide.topAnchor.constraintEqualToAnchor(leftView.topAnchor).active = true
        lFocusGuide.rightAnchor.constraintEqualToAnchor(leftView.leftAnchor).active = true
        
        rFocusGuide = UIFocusGuide()
        view.addLayoutGuide(rFocusGuide)
        rFocusGuide.widthAnchor.constraintEqualToConstant(80.0).active = true
        rFocusGuide.heightAnchor.constraintEqualToConstant(80.0).active = true
        rFocusGuide.topAnchor.constraintEqualToAnchor(rightView.topAnchor).active = true
        rFocusGuide.leftAnchor.constraintEqualToAnchor(rightView.rightAnchor).active = true
    }
    
    // MARK: UIFocusEnvironment
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)
        
        guard let nextFocusedView = context.nextFocusedView else { return }
        
        switch nextFocusedView {
        case leftView:
            lFocusGuide.preferredFocusedView = rightView
        default:
            lFocusGuide.preferredFocusedView = nil
            //rFocusGuide.preferredFocusedView = nil
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.showFocusGuides()
    }
}
