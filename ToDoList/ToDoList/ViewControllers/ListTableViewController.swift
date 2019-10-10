//
//  ListTableViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/7.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class ListTableViewController: UITableViewController {
    
    var todoList:[ToDoList] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNotificationCenter()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        todoList = RealmHelper.loadToDoList()
        tableView.reloadData()
        
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        let index = indexPath.row
        let imageName = todoList[index].status == "\(Status.ongoing)" ? "Circle0" : "Circle1"
        cell.id = todoList[index].id
        cell.contentLabel.text = todoList[index].content
        cell.checkButton.setImage(UIImage(named: imageName), for: .normal)
        // Configure the cell...
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = indexPath.row
            let realm = try! Realm()
            todoList = RealmHelper.loadToDoList()
            try! realm.write {
                // update todolist status to deleted
                todoList[index].status = "\(Status.deleted)"
            }
            todoList.remove(at: index)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        
    // MARK: - Other Method
    
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.receivedNotification(notif:)), name: NSNotification.Name(rawValue: "editNotification"), object: nil)
    }
    
    @objc func receivedNotification(notif: Notification) {
        guard let editTodo = notif.object as? ToDoList else { return }
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let editVC = storyBoard.instantiateViewController(withIdentifier: "EditVC") as! EditViewController
        editVC.todo = editTodo
        self.navigationController?.pushViewController(editVC, animated: true)
    }    
}
