//
//  CreateViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/6.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class CreateViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        taskTextField.text = ""
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        guard let content = taskTextField.text else { return }
        if !content.isEmpty {
            let realm = try! Realm()
            let todoList = ToDoList()
            todoList.content = content
            
            try! realm.write {
                realm.add(todoList)
            }
            
            // return List
            navigationController?.popViewController(animated: true)
        }
    }
    
}
