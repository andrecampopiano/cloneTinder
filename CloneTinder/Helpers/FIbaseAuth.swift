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

    func autenticatWithFacebook(accesstoken:FBSDKAccessToken){
        let accessToken = FBSDKAccessToken.current()
        
        guard let accessTokenString = accessToken?.tokenString else { return }
        
        
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            
            if let err = error {
                print("Erro au autentiar com o seu usuario FB: ", err.localizedDescription)
                return
            }else{
                print("Logou com sua conta do FB: ", user!)
            }
            
        })
    }
}
