//
//  ViewController.swift
//  CloneTinder
//
//  Created by André Luís  Campopiano on 10/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import TwitterKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate,GIDSignInUIDelegate {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    let fbConnect = FBConnect()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBtnFBcustom()
        setupBtnGoogle()
        setupBtnTwitter()
        
    }
    
    fileprivate func setupBtnTwitter(){
        
        let twitterButton = TwitterConnect().createCustomBtnTwitterLogin()
        twitterButton.frame = CGRect(x: 16 , y: 304, width: self.view.frame.size.width - 32 , height: 50)
        view.addSubview(twitterButton)
        
    }
    
    
    fileprivate func setupBtnGoogle(){
        
        //adiconando botao de logar google
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16 , y: 182, width: self.view.frame.size.width - 32 , height: 50)
        view.addSubview(googleButton)
        
        let customButtom = UIButton(type: .system)
        customButtom.frame = CGRect(x: 16 , y: 248, width: self.view.frame.size.width - 32 , height: 50)
        customButtom.backgroundColor = .red
        customButtom.setTitle("Login pelo Google", for: .normal)
        customButtom.addTarget(self, action: #selector(handleCustomGoogleSign), for: .touchUpInside)
        customButtom.setTitleColor(.white, for: .normal)
        customButtom.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(customButtom)
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    
    func handleCustomGoogleSign(){
        GIDSignIn.sharedInstance().signIn()
    }
    
    fileprivate func setupBtnFBcustom(){
        
        loginButton = FBSDKLoginButton()
        loginButton.frame = CGRect(x: 16 , y: 50, width: self.view.frame.size.width - 32 , height: 50)
        view.addSubview(loginButton)
        loginButton.readPermissions = ["email","public_profile"]
        loginButton.delegate = self

        
        // customizar botao do fb login
        let customFbButton = UIButton()
        customFbButton.backgroundColor = UIColor.blue
        customFbButton.frame = CGRect(x: 16 , y: 116, width: self.view.frame.size.width - 32 , height: 50)
        customFbButton.setTitle("Login Facebook", for: .normal)
        customFbButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        customFbButton.setTitleColor(.white, for: .normal)
        view.addSubview(customFbButton)
        
        customFbButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
    }
    
    func handleCustomFBLogin(){
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) { (result, erro) in
            if erro != nil {
                print("Deu ruim no login customizado:", erro!)
                return
            }
            if let token = result?.token.tokenString {
                print(token)
            }
            self.fbConnect.showEmailAddress()
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Saiu do facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error.localizedDescription)
            return
        }
        
        self.fbConnect.showEmailAddress()
        
    }
    
    
}

