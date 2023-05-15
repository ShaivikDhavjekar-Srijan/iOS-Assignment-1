//
//  AppDelegate.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 15/05/23.
//

import UIKit
import NewRelic

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        NewRelic.start(withApplicationToken: "AAd4bd0c5a820ea220d7f0e3762114a48e11506b62-NRMA")
        
        return true
    }
}
