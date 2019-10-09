//
//  ListTableViewCell.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/7.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var id:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // complete todo
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        let realm = try! Realm()
        guard let todo = realm.objects(ToDoList.self).filter("id = '\(id)'").first else { return }
        let isDone = todo.status == "\(Status.done)"
        let updateStatus = isDone ? "\(Status.ongoing)" : "\(Status.done)"
        
        try! realm.write {
            todo.status = updateStatus
            todo.endTime = isDone ? nil : Date()
        }
        
        let image = UIImage(named: !isDone ? "Circle1" : "Circle0")
        checkButton.setImage(image, for: .normal)
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        let realm = try! Realm()
        guard let todo = realm.objects(ToDoList.self).filter("id = '\(id)'").first else { return }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "editNotification"), object: todo)

        
    }
    
    
    
}
