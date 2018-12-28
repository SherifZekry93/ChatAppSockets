//
//  Services.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/28/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import Foundation
import Alamofire
class AuthService
{
    static let shared = AuthService()
    var isLoggedIn:Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.setValue(newValue, forKey: LOGGED_IN_KEY)
        }
        
    }
    var authToken : String{
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.setValue(TOKEN_KEY, forKey: newValue)
        }
    }
    var userEmail : String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.setValue(USER_EMAIL, forKey: newValue)
        }
    }
    
    func registerUser(email:String,password:String,completion:@escaping CompletionHandler)
    {
        let lowerCasedEmail = email.lowercased()
        let header = [
            "Content-Type":"application/json;charset=utf-8",
        ]
        let body:[String:Any] = [
            "email":lowerCasedEmail,
            "password":password
        ]
        Alamofire.request(URL_REGISTER, method: .post, parameters: body,  headers: header).responseJSON { (response) in
            if response.result.isSuccess && response.result.error == nil
            {
                completion(true)
            }
            else
            {
                completion(false)
                print(response.result.error as! Any)
            }
        }
    }
    
}
