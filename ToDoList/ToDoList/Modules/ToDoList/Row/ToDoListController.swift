//
//  ToDoListController.swift
//  ToDoList
//
//  Created by mikewang on 2019/11/5.
//  Copyright © 2019 mikewang. All rights reserved.
//

import Foundation

class ToDoListController {
    
    var viewModel: [TodoCellViewModel] = [TodoCellViewModel]()
        
    func start() {
        self.fetchToDos { [weak self] (todos) in
            self?.buildViewModels(todos: todos)
        }
    }
    
    func fetchToDos(complete: @escaping ([RM_ToDoList]) -> Void) {
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                complete(RealmHelper.loadToDoList())
            }
        }
    }
    
    func buildViewModels(todos: [RM_ToDoList]) {
        viewModel.removeAll()

        for todo in todos {
            let todoVM: TodoCellViewModel = TodoCellViewModel(id: todo.id, content: todo.content, status: todo.status)
            viewModel.append(todoVM)
        }
    }
}
