//
//  FIbaseAuth.swift
//  CloneTinder
//
//  Created by André Campopiano on 12/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit

class FIbaseAuth: NSObject {

    func authenticateWithFacebook(accesstoken:FBSDKAccessToken){
        let accessToken = FBSDKAccessToken.current()
        
        guard let accessTokenString = accessToken?.tokenString else { return }
        
        
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            
            if let err = error {
                print("Erro ao autentiar com sua conta do FaceBook: ", err.localizedDescription)
                return
            }else{
                print("Logou com sua conta do FB: ", user!)
            }
            
        })
    }
    
    func authenticateWithTwitter(token:String, secret:String){
        
        let credentials = FIRTwitterAuthProvider.credential(withToken: token, secret: secret)
        
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            
            if let err = error{
                print("Erro ao autenticar com sua conta do Twitter ", err)
            }else {
                print("Logou com sua conta do Twitter ", user!.uid)
                print(user!)
                TwitterConnect().getEmailTwitterAccount()
            }
            
        })
    }
    
    //Cadastrar email no conta criada pelo twitter
    func updateEmailTwitterUser(email:String){
        FIRAuth.auth()?.currentUser?.updateEmail(email) { (error) in
            if let err = error {
                print("Precisa do email do usuario para autenticar", err)
                
                do {
                    try FIRAuth.auth()!.signOut()
                }catch let err as NSError {
                    print("Erro ao deslogar usuario: ",err.description)
                }
                
                return
            }else {
                print("Email do usuario registrado")
                
            }
        }
    }
}
