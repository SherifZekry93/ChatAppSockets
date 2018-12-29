//
//  CreateAccountVC.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/28/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import UIKit
class CreateAccountVC: UIViewController {
    @IBOutlet weak var usernameTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.shared.avatarName != ""
        {
            avatarImage.image = UIImage(named: UserDataService.shared.avatarName)
        }
    }
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: Un_Wind_TO_Channel, sender: self)
    }
    
    @IBAction func registerUserButtonClicked(_ sender: UIButton) {
        guard let email = emailTextField.text, email != "" else {return}
        
        guard let password = passwordTextField.text, password != "" else {return}
        guard let name = usernameTextField.text,name != "" else {return}
        AuthService.shared.registerUser(email: email, password: password) { (isSuccess) in
            if isSuccess
            {
                AuthService.shared.loginUser(email:email, password: password, completion: { (isSuccess) in
                    if isSuccess
                    {
                        AuthService.shared.createUser(name:name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (isSuccess) in
                            if isSuccess
                            {
                                print("user added to service successfully")
                                print(UserDataService.shared.name)
                                print(UserDataService.shared.avatarName)
                                self.performSegue(withIdentifier: Un_Wind_TO_Channel, sender: self)
                            }
                        })
                    }
                })
            }
            else
            {
                print("didn't register user el 7mdo llah bardo hnkfr")
            }
        }
    }
    @IBAction func chooseAvatarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: self)
    }
    
}
