//
//  FBConnect.swift
//  CloneTinder
//
//  Created by André Campopiano on 12/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FBConnect: NSObject {

    func showEmailAddress(){
        //Autenticar no FireBase pelo facebook
        let fibaseAuth = FIbaseAuth()
        fibaseAuth.autenticatWithFacebook(accesstoken: FBSDKAccessToken.current())
        FBSDKGraphRequest(graphPath: "/me?", parameters: ["fields":"email, id, name, birthday"]).start(completionHandler: { (connection, result, error) in
            
            if let err = error{
                print("deu ruim: ", err)
            }else{
                if let res = result{
                    print(res)
                }
            }
            
        })
    }
}
