//
//  LoginViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/10/20.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var fbImageView: UIImageView!
    
    var delegate: LoginViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
        GetFBUserInfo()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Other Method
    
    private func GetFBUserInfo() {
        let params = ["fields":"name, email , picture.type(large), gender"]
        let request = GraphRequest(graphPath: "/me", parameters: params)
        let connection = GraphRequestConnection()
        
        connection.add(request, batchParameters: params) { (conn, result, error) in
            guard let fbResult = result as? Dictionary<String, Any>,
                let picture = fbResult["picture"] as? Dictionary<String, Any>,
                let pictureData = picture["data"] as? Dictionary<String, Any>,
                let url = pictureData["url"] as? String
                else { return }
            print(url)
            self.setUserImage(url)
        }
        connection.start()
    }
    
    private func setUserImage(_ url: String) {
        
        Alamofire.request(url).response { (response) in
            guard let data = response.data, let image = UIImage(data: data)
                else { return }
            
            self.fbImageView.image = image
            self.fbImageView.clipsToBounds = true
            self.fbImageView.layer.cornerRadius = (self.fbImageView.frame.size.width) / 2
            
            self.delegate?.PassImageData(image: image)
            
            self.dismiss(animated: true) {
                print("return OK")
            }
            
        }
    }
}

protocol LoginViewControllerDelegate: class {
   func PassImageData(image: UIImage)
}
