//
//  CreateViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/6.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class CreateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    @IBOutlet weak var dateSwitch: UISwitch!    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    
    @IBAction func dateSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            taskDatePicker.isHidden = false
        } else {
            taskDatePicker.isHidden = true
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        taskTextField.text = ""
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        guard let content = taskTextField.text else { return }
        if !content.isEmpty {
            let todoList = RM_ToDoList()
            todoList.content = content
            
            RealmHelper.addToDoList(todoList: todoList)
            
            if dateSwitch.isOn {
                let date = taskDatePicker.date
                let components = Calendar.current.dateComponents([ .year, .month, .day, .hour, .minute], from: date)
                
                print("date: \(date)")
                print("conponents: \(String(describing: components.date))")
                
                let notificationContent = UNMutableNotificationContent()
                notificationContent.title = content
                notificationContent.body = "任務將於 \(date) 到期"
                notificationContent.badge = 1
                notificationContent.sound = UNNotificationSound.default
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                let request = UNNotificationRequest(identifier: "addTodoNotification", content: notificationContent, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            } else {
                // remove notifications
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["addTodoNotification"])
                UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["addTodoNotification"])
            }
            
            // return List
            navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
