//
//  AppDelegate.swift
//  MapApp
//
//  Created by ATLAS Checkout Laptop on 10/13/23.
//

import UserNotifications
import UIKit

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        // Handle permission
    }
    return true
}
