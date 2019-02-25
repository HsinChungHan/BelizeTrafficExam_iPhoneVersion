//
//  AppDelegate.swift
//  TrafficExamInBelize
//
//  Created by Chung Han Hsin on 2019/2/24.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        FirebaseApp.configure()
        
        // Override point for customization after application launch.
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.lightRed
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = Example1ViewController()
        
        //讓ststusbar的字變白色，且要再infoplist中設定View controller-based status bar appearance的value為no
        application.statusBarStyle = .lightContent
        let statusBarView = UIView()
        statusBarView.backgroundColor = UIColor.lightRed
        window?.addSubview(statusBarView)
        
        window?.addConstraintsWithFormat(format: "V:|[v0(20)]|", views: statusBarView)
        window?.addConstraintsWithFormat(format: "H:|[v0]|", views: statusBarView)
        return true
    }
}
