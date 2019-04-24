//
//  TransformViewController.swift
//  Motion Shadows Demo
//
//  Created by Michael Nachbaur on 2019-04-23.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var identity = CATransform3DIdentity
        identity.m34 = -1 / 500.0
        
        let minimumTransform = CATransform3DRotate(identity, (315 * .pi) / 180.0, 1.0, 0.0, 0.0)
        let maximumTransform = CATransform3DRotate(identity, (45 * .pi) / 180.0, 1.0, 0.0, 0.0)
        
        contentView.layer.transform = identity
        let effect = UIInterpolatingMotionEffect(
            keyPath: "layer.transform",
            type: .tiltAlongVerticalAxis)
        effect.minimumRelativeValue = minimumTransform
        effect.maximumRelativeValue = maximumTransform
        
        contentView.addMotionEffect(effect)
    }
}
