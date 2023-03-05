//
//  AppDelegate.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit

import LifetimeTracker

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        LifetimeTracker.setup(
                    onUpdate: LifetimeTrackerDashboardIntegration(
                        visibility: .alwaysVisible,
                        style: .circular
                    ).refreshUI
                )
        
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

