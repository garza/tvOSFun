//
//  LGViewControllerSwitch.swift
//  tvOSFun
//
//  Created by John Garza (UCTR) on 10/12/15.
//  Copyright © 2015 LehGarza. All rights reserved.
//

import UIKit

class LGViewControllerSwitch: UIViewController {
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

        // Anchor the top left of the focus guide.
        focusGuide.leftAnchor.constraintEqualToAnchor(topRightView.leftAnchor).active = true
        focusGuide.topAnchor.constraintEqualToAnchor(bottomCenterView.topAnchor).active = true
        
        // Anchor the width and height of the focus guide.
        focusGuide.widthAnchor.constraintEqualToAnchor(topRightView.widthAnchor).active = true
        focusGuide.heightAnchor.constraintEqualToAnchor(bottomCenterView.heightAnchor).active = true
    }

    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)
        
        guard let nextFocusedView = context.nextFocusedView else { return }
        
        switch nextFocusedView {
        case topRightView:
            focusGuide.preferredFocusedView = topLeftView
        case bottomCenterView:
            focusGuide.preferredFocusedView = topLeftView
        default:
            focusGuide.preferredFocusedView = nil
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.showFocusGuides()
    }
}
