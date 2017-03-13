//
//  TwitterConnect.swift
//  CloneTinder
//
//  Created by André Luís  Campopiano on 13/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit
import TwitterKit
import Firebase

class TwitterConnect: NSObject {
    
    
    func createCustomBtnTwitterLogin()->TWTRLogInButton{
        let twitterButton = TWTRLogInButton { (session,error) in
            if let err = error {
                print("Erro ao logar pela conta do Twitter: ", err)
                return
            }
            print("Sucesso ao logar pela conta do Twitter")
            
            guard let token = session?.authToken else { return }
            guard let secret = session?.authTokenSecret else { return }
            
            //Login com o firebase
            FIbaseAuth().authenticateWithTwitter(token:token , secret:secret)
        }
        return twitterButton
    }

    func getEmailTwitterAccount(){
        
        let client = TWTRAPIClient.withCurrentUser()
        let request = client.urlRequest(withMethod: "GET",
                                        url: "https://api.twitter.com/1.1/account/verify_credentials.json",
                                                  parameters: ["include_email": "true", "skip_status": "true"],
                                                  error: nil)
        
        client.sendTwitterRequest(request) { response, data, connectionError in
        
            if let err = connectionError {
                
                print("Erro ao retornar o email: ", err)
                
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print("json: \(json)")
                    
                    //Config do twitter nao esta retornando o e-mail, configurar permissões no twitter
                    //FIbaseAuth().updateEmailTwitterUser(email: mail)
                } catch let jsonError as NSError {
                    print("json error: \(jsonError.localizedDescription)")
                }
            }
        
        }
        
        
    }
    
}
