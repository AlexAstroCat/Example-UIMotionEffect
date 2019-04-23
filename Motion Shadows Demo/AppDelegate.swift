//
//  AppDelegate.swift
//  Motion Shadows Demo
//
//  Created by Michael Nachbaur on 2019-04-09.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        CustomButton.appearance().shadowMotionOffset = CGSize(width: -16, height: -16)
        CustomButton.appearance().shadowColor = UIColor.black
        CustomButton.appearance().shadowOpacity = 0.75
        CustomButton.appearance().shadowRadius = 3
        CustomButton.appearance().cornerRadius = 12
        CustomButton.appearance().borderWidth = 2
        CustomButton.appearance().borderColor = UIColor(red: 0, green: 0.692, blue: 0.549, alpha: 0.82)
        CustomButton.appearance().backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        CustomButton.appearance().tintColor = UIColor.white
        return true
    }
}

