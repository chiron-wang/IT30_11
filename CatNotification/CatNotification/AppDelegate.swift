//
//  AppDelegate.swift
//  CatNotification
//
//  Created by mikewang on 2019/10/16.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if let error = error {
                print(error)
                return
            }
            
            if granted {
                print("使用者同意接收推播通知")
            }
        }
        
        // 前景通知
        UNUserNotificationCenter.current().delegate = self
        
        // Day32 - 客製化通知
        let likeAction = UNNotificationAction(identifier: "like", title: "守護石虎", options: [.foreground])
        let dislikeAction = UNNotificationAction(identifier: "dislike", title: "稍後再說", options: [])
        let category = UNNotificationCategory(identifier: "catMessage", actions: [likeAction, dislikeAction], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
 
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .alert])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler:  @escaping () -> Void) {
        
        let content = response.notification.request.content
        print("title \(content.title)")
        print("userInfo \(content.userInfo)")
        print("actionIdentifier \(response.actionIdentifier)")
        
        completionHandler()
    }
}
