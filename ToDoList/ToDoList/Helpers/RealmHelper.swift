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
    
    class func loadToDoList() -> [RM_ToDoList] {
        let realm = try! Realm()
        let result = Array(realm.objects(RM_ToDoList.self).filter("status != 'deleted'"))
        
        return result
    }
    
    class func loadToDoListWithFilter(filter: String) -> [RM_ToDoList] {
        let realm = try! Realm()
        let result = Array(realm.objects(RM_ToDoList.self).filter(filter))
        
        return result
    }
    
    class func addToDoList(todoList: RM_ToDoList) {
        let realm = try! Realm()
                
        try! realm.write {
            realm.add(todoList)
        }
    }
    
}
