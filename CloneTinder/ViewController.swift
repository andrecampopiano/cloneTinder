//
//  ViewController.swift
//  CloneTinder
//
//  Created by André Luís  Campopiano on 10/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate {

    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.delegate = self
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Saiu do facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error.localizedDescription)
        }else {
            print("Sucesso do role rapaz")
        }
    }

}

