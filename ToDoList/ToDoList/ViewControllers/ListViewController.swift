//
//  ListViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/4.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let realm = try! Realm()
//        let todoList = realm.objects(ToDoList.self)
//        for todo in todoList {
//            print(todo)
//        }
        // Get our Realm file's parent directory
        let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path

        print(folderPath)
    }

    

}
