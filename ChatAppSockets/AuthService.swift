//
//  Services.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/28/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper
import SwiftyJSON
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
            return KeychainWrapper.standard.string(forKey: TOKEN_KEY) ?? ""
        }
        set{
            KeychainWrapper.standard.set(newValue, forKey: TOKEN_KEY)
        }
    }
    var userEmail : String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.setValue(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email:String,password:String,completion:@escaping CompletionHandler)
    {
        let lowerCasedEmail = email.lowercased()
        let body:[String:Any] = [
            "email":lowerCasedEmail,
            "password":password
        ]
        Alamofire.request(URL_REGISTER, method: .post, parameters: body,encoding:JSONEncoding.default,headers:HEADER).responseString { (response) in
            print(response)
            if response.result.isSuccess && response.result.error == nil
            {
                completion(true)
            }
            else
            {
                completion(false)
            }
        }
    }
   
    func loginUser(email:String,password:String,completion:@escaping CompletionHandler)
    {
        let lowerCasedEmail = email.lowercased()
       
        let body:[String:Any] = [
            "email":lowerCasedEmail,
            "password":password
        ]
       Alamofire.request(URL_LOGIN, method: .post, parameters: body,encoding:JSONEncoding.default,headers:HEADER).responseJSON { (response) in

            if response.result.isSuccess && response.result.error == nil
            {
                guard let data = response.data else {return}
                do
                {
                    let json = try JSON(data: data)
                    self.authToken = json["token"].stringValue
                    self.userEmail = json["user"].stringValue
                }
                catch
                {
                    
                }
                completion(true)
            }
            else
            {
                completion(false)
            }
        }
    }
    func createUser(name:String,email:String,avatarName:String,avatarColor:String,completion:@escaping CompletionHandler)
    {
        let lowerCasedEmail = email.lowercased()
        let body:[String:Any] =
        [
            "email":lowerCasedEmail,
            "name":name,
            "avatarName":avatarName,
            "avatarColor":avatarColor
        ]
        let header = [
            "Authorization":"Bearer \(self.authToken)",
            "Content-Type":"application/json;charset=utf-8"
        ]
        Alamofire.request(CREATE_USER_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.isSuccess && response.result.error == nil
            {
                guard let data =  response.data else {return}
                do
                {
                    let json =  try JSON(data: data)
                    let id = json["_id"].stringValue
                    let color = json["avatarColor"].stringValue
                    let avatarName = json["avatarName"].stringValue
                    let email = json["email"].stringValue
                    let name = json["name"].stringValue
                    UserDataService.shared.setUserData(id: id, color: color, avatarName: avatarName, name: name, email: email)
                }
                catch
                {
                     completion(false)
                    return
                }
                completion(true)
            }
            else
            {
                completion(false)
                print(response.error!)
            }
        }
    }
}
