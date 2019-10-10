//
//  EditViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/6.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskTextField: UITextField!
    
    var todo:ToDoList?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationUI()
    }
    
    // MARK: - IBAction
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        taskTextField.text = ""
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let content = taskTextField.text,
            let id = todo?.id else { return }
                
        if !content.isEmpty {
            let filter = "id == '\(id)' and status != 'deleted'"
            let realm = try! Realm()
            guard let realmTodo = RealmHelper.loadToDoListWithFilter(filter: filter) .first else { return }
            
            try! realm.write {
                realmTodo.content = content
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
    
    // MARK: - Other Method
    
    // 一般我們習慣會將private方法，整理到最下方
    private func configurationUI() {
        guard let content = todo?.content else { return }
        taskTextField.text = content
    }
    
}
