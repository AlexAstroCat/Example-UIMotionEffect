//
//  ShadowPathViewController.swift
//  Motion Shadows Demo
//
//  Created by Michael Nachbaur on 2019-04-23.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

import UIKit

class ShadowPathViewController: UIViewController {

    @IBOutlet var contentView: UIView!

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateMotionEffects()
    }
    
    func updateMotionEffects() {
        for effect in contentView.motionEffects {
            contentView.removeMotionEffect(effect)
        }
        
        let size = contentView.bounds.size
        let minimumPath = UIBezierPath()
        minimumPath.move(to: CGPoint(x: size.width * 0.33,
                                     y: size.height * 0.66))
        minimumPath.addLine(to: CGPoint(x: size.width * 0.66,
                                        y: size.height * 0.66))
        minimumPath.addLine(to: CGPoint(x: size.width * 1.15,
                                        y: size.height * 1.15))
        minimumPath.addLine(to: CGPoint(x: size.width * -0.15,
                                        y: size.height * 1.15))
        minimumPath.close()
        
        let maximumPath = UIBezierPath(rect: CGRect(origin: .zero, size: size))
        
        let effect = UIInterpolatingMotionEffect(
            keyPath: "layer.shadowPath",
            type: .tiltAlongVerticalAxis)
        effect.minimumRelativeValue = minimumPath.cgPath
        effect.maximumRelativeValue = maximumPath.cgPath
        
        contentView.addMotionEffect(effect)
    }

}
