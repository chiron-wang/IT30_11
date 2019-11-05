//
//  ListTableViewCell.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/7.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var id:String = ""
    var viewModel: TodoCellViewModel?
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
//        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.frame = frame(forAlignmentRect: CGRect(x: 12, y: 8, width: 50, height: 50))
        self.contentView.addSubview(indicator)
        return indicator
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel?.isLoading.removeObserve()
    }
    
    // complete todo
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        viewModel?.isLoading.value = true
        let realm = try! Realm()
        guard let todo = realm.objects(RM_ToDoList.self).filter("id == '\(id)'").first else { return }
        let isDone = todo.status == "\(Status.done)"
        let updateStatus = isDone ? "\(Status.ongoing)" : "\(Status.done)"
        
        try! realm.write {
            todo.status = updateStatus
            todo.endTime = isDone ? nil : Date()
        }
        
        viewModel?.isLoading.value = false
        let image = UIImage(named: !isDone ? "Circle1" : "Circle0")
        checkButton.setImage(image, for: .normal)
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        let realm = try! Realm()
        guard let todo = realm.objects(RM_ToDoList.self).filter("id = '\(id)'").first else { return }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "editNotification"), object: todo)
    }
    
    // MARK: - Other Method
//    
//    @IBOutlet weak var contentLabel: UILabel!
//    @IBOutlet weak var checkButton: UIButton!
//    
//    var id:String = ""
    
//    cell.id = todoList[index].id
//    cell.contentLabel.text = todoList[index].content
//    cell.checkButton.setImage(UIImage(named: imageName), for: .normal)
    
//    func setup(id: String, content: String, status: String) {
//        self.id = id
//        self.contentLabel.text = content
//        let imageName = status == "\(Status.ongoing)" ? "Circle0" : "Circle1"
//        self.checkButton.setImage(UIImage(named: imageName), for: .normal)
//    }
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? TodoCellViewModel else { return }
        self.viewModel = viewModel
        let imageName = viewModel.status == "\(Status.ongoing)" ? "Circle0" : "Circle1"
        self.id = viewModel.id
        self.contentLabel.text = viewModel.content
        self.checkButton.setImage(UIImage(named: imageName), for: .normal)
        
        viewModel.isLoading.addObserve { [weak self] (isLoding) in
            if isLoding {
                self?.loadingIndicator.startAnimating()
            } else {
                self?.loadingIndicator.stopAnimating()
            }
        }
        
    }
    
    
}
