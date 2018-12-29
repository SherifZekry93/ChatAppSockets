//
//  Constatns.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/27/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import Foundation
//typeAlias
typealias CompletionHandler = (_ success:Bool) -> ()
//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let Un_Wind_TO_Channel = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"
//user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "useremail"
let defaults = UserDefaults.standard
//NETWORK URL
let BASE_URL = "https://chattychatchatsherif.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let CREATE_USER_URL = "\(BASE_URL)user/add"
//Headers
let HEADER = [
    "Content-Type":"application/json;charset=utf-8"
]
//Cells
let AVATAR_CELL = "avatarCell"
