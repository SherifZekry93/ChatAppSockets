//
//  UserDataService.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/28/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import Foundation
class UserDataService {
    static let shared = UserDataService()
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var name = ""
    public private(set) var email = ""
    func setUserData(id:String,color:String,avatarName:String,name:String,email:String)
    {
        self.id = id
        self.avatarName = avatarName
        self.avatarColor = color
        self.name = name
        self.email = email
    }
    func setAvatarName(avatarName:String)
    {
        self.avatarName = avatarName
    }
}
