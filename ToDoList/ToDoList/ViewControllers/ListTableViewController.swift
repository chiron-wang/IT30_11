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
    
//    var todoList:[RM_ToDoList] = []
//    var viewModel: [TodoCellViewModel] = [TodoCellViewModel]()
    
    var viewModel: [TodoCellViewModel] {
        return controller.viewModel
    }
    
    lazy var controller: ToDoListController = {
        return ToDoListController()
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.start()
        setNotificationCenter()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let todoList:[RM_ToDoList] = RealmHelper.loadToDoList()
        controller.buildViewModels(todos: todoList)
        tableView.reloadData()
        
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  viewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowViewModel = viewModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoCell

        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = indexPath.row
            let realm = try! Realm()
            var todoList = RealmHelper.loadToDoList()
            try! realm.write {
                // update todolist status to deleted
                todoList[index].status = "\(Status.deleted)"
            }
            todoList.remove(at: index)
            controller.buildViewModels(todos: todoList)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        
    // MARK: - Other Method
        
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.receivedNotification(notif:)), name: NSNotification.Name(rawValue: "editNotification"), object: nil)
    }
    
    @objc func receivedNotification(notif: Notification) {
        guard let editTodo = notif.object as? RM_ToDoList else { return }
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let editVC = storyBoard.instantiateViewController(withIdentifier: "EditVC") as! EditViewController
        editVC.todo = editTodo
        self.navigationController?.pushViewController(editVC, animated: true)
    }    
}
