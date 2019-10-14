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
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var fbImageView: UIImageView!
    
    private func setUserImage(_ url: String) -> DataRequest {
        return Alamofire.request(url).response { (response) in
            guard let data = response.data,
                let image = UIImage(data: data)
                else { return }
                        
            self.fbImageView.image = image            
            self.fbImageView.clipsToBounds = true
            self.fbImageView.layer.cornerRadius = self.fbImageView.frame.size.width / 2
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
        let params = ["fields":"name, email , picture.type(large), gender"]
        let request = GraphRequest(graphPath: "/me", parameters: params)
        let connection = GraphRequestConnection()
        connection.add(request, batchParameters: params) { (conn, result, error) in
            print(result!)
            guard let fbResult = result as? Dictionary<String, Any>,
                let picture = fbResult["picture"] as? Dictionary<String, Any>,
                let pictureData = picture["data"] as? Dictionary<String, Any>,
                let url = pictureData["url"] as? String
                else { return }
            print("url")
            print(url)
            
            self.setUserImage(url)
        }
        
        connection.start()
        
        // TODO: 還尚未實作反序列化為物件
        //        let request = GraphRequest(graphPath: "/me", parameters: params)
        //        request.start { (conn, result, error) in
        
        //            let dataFromResult = NSKeyedArchiver.archivedData(withRootObject: result!)
        //            let stringFromData = String.init(data: dataFromResult!, encoding: String.Encoding.utf8)!
        //            let data = stringFromData.data(using: .utf8)!
        
        //            guard let fbResult = result as? Dictionary<String, Any>,
        //                let picture = fbResult["picture"] as? Dictionary<String, Any>,
        //                let pictureData = picture["data"] as? Dictionary<String, Any>,
        //                let url = pictureData["url"]
        //                else { return }
        //            print(url)
    }
}

// TODO: 反序列化還未實作
struct FBResponse: Codable {
    var email: String
    var id: Int
    var name: String
    var picture: FBPicture
}

struct FBPicture: Codable {
    var data: FBPictureData
}
struct FBPictureData: Codable {
    var height: Int
    var width: Int
    var url: String
}
