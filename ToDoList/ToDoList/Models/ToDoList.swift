//
//  Task.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/6.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoList: Object {
    @objc private(set) dynamic var id:String = UUID().uuidString
    @objc dynamic var content:String = ""
    @objc dynamic var startTime:Date = Date()
    @objc dynamic var endTime:Date? = nil
    @objc dynamic var category:String = "work"
    @objc dynamic var status:String = "\(Status.ongoing)"
    @objc dynamic var LastModify:Date = Date()
    
    // primary key
    override static func primaryKey() -> String {
        return "id"
    }
}

enum Status {
    case ongoing, done, deleted
}
