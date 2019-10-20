//
//  ListViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/4.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController, UITextFieldDelegate, LoginViewControllerDelegate {
    
    func PassImageData(image: UIImage) {
        userImageView.image = image
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = (userImageView.frame.size.width) / 2
    }
    
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationController?.navigationBar.shadowImage = image
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as? LoginViewController
        destinationViewController?.delegate = self
    }
    
}

