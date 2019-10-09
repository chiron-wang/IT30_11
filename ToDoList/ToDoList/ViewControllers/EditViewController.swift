//
//  EditViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/6.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    
    var todo:ToDoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let content = todo?.content else { return }
        taskTextField.text = content

    }
    
    // MARK: - IBAction
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        taskTextField.text = ""
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let content = taskTextField.text,
            let id = todo?.id else { return }
                
        if !content.isEmpty {
            let realm = try! Realm()
            guard let realmTodo = realm.objects(ToDoList.self).filter("id == '\(id)' and status != 'deleted'").first else { return }
            
            try! realm.write {
                realmTodo.content = content
            }
            
            // return List
            navigationController?.popViewController(animated: true)
        }
    }
    
//    func receivedNotification(notif: Notification) {
//        print("receivedNotification~")
//        print(notif.object!)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
