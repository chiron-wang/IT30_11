//
//  ViewController.swift
//  CatNotification
//
//  Created by mikewang on 2019/10/16.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func catButtonPressed(_ sender: UIButton) {
        let content = GetNotificationContent()
        
        // time interval must be at least 60 if repeating
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        
        // send request right now
        //let request2 = UNNotificationRequest(identifier: "notification1", content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        /*
        // remove pending notifications (尚未收到的推播)
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification1"])
        // remove all pending notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        // Removes the specified notification requests from Notification Center. (收到尚未開啟)
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["notification1"])
        // Removes all of the app’s delivered notifications from Notification Center.
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        */

    }
    
    
    @IBAction func catSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            let content = GetNotificationContent()
            var date = DateComponents()
            date.day = 8
            date.hour = 8
            date.minute = 5
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            let request = UNNotificationRequest(identifier: "catMonthNotification", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        } else {
            // remove notifications
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["catMonthNotification"])
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["catMonthNotification"])
        }
    }
    
    // MARK: - Other Method
    
    private func GetNotificationContent() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "守護石虎人人有責"
        content.subtitle = "石虎抱抱"
        content.body = """
        向親朋好友介紹石虎，讓他們更喜愛這種動物
        向親朋好友介紹石虎面臨的困境
        行車時若看見小心石虎的標誌請減速慢行
        （苗栗縣相關標誌類似附圖）
        不使用捕獸鋏、避免使用農藥和有毒餌劑
        不任意棄養寵物、不任意獵殺野生動物
        """
        content.badge = 3
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "catMessage"
        
        let imageURL = Bundle.main.url(forResource: "Cat2", withExtension: "jpg")
        let attchment = try! UNNotificationAttachment(identifier: "catNotification1", url: imageURL!, options: nil)
        content.attachments = [attchment]
        content.userInfo =   ["link":"https://img5.cna.com.tw/www/WebPhotos/1024/20190828/960x960_268359289092.jpg"]
        
        return content
    }
    
    
}

