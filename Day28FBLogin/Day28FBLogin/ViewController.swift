//
//  ViewController.swift
//  Day28FBLogin
//
//  Created by mikewang on 2019/10/13.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
    }
    
}



