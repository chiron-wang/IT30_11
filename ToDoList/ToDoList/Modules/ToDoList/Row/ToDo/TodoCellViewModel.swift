//
//  TodoCellViewModel.swift
//  ToDoList
//
//  Created by mikewang on 2019/11/4.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit

class TodoCellViewModel: RowViewModel, ObservableObject {
    let id: String
    let content: String
    let status: String
    let isLoading: Observable<Bool>
//    @Published var isLoading: Bool
    
    init(id: String,
         content: String,
         status: String,
         isLoading: Observable<Bool> = Observable<Bool>(value: false)) {
        self.id = id
        self.content = content
        self.status = status
        self.isLoading = isLoading
    }
    
}
