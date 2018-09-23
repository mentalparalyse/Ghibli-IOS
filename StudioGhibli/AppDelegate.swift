//
//  AppDelegate.swift
//  StudioGhibli
//
//  Created by Lex Sava on 9/23/18.
//  Copyright © 2018 Lex Sava. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let window = window else {
            return true
        }
        
        window.rootViewController = SGTabBarController()
        window.makeKeyAndVisible()
        
        
        return true
    }


}

