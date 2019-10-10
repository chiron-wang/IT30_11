//
//  RealmHelper.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/10.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class RealmHelper: NSObject {
    
    class func loadToDoList() -> [ToDoList] {
        let realm = try! Realm()
        let result = Array(realm.objects(ToDoList.self).filter("status != 'deleted'"))
        
        return result
    }
    
    class func loadToDoListWithFilter(filter: String) -> [ToDoList] {
        let realm = try! Realm()
        let result = Array(realm.objects(ToDoList.self).filter(filter))
        
        return result
    }
    
    class func addToDoList(todoList: ToDoList) {
        let realm = try! Realm()
                
        try! realm.write {
            realm.add(todoList)
        }
    }
    
}
