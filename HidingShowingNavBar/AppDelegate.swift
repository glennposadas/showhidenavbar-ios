//
//  AppDelegate.swift
//  HidingShowingNavBar
//
//  Created by Glenn Posadas on 3/11/18.
//  Copyright © 2018 Thirty One Digital, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        let transluscentVC = VCTransluscentNavBar()
        let navigationController = UINavigationController(rootViewController: transluscentVC)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

