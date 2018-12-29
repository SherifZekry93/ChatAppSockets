//
//  LoginVC.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/27/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import UIKit
class LoginVC: UIViewController {
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dontHaveAnAccountButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: self)
    }
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        guard let email = emailTextField.text,email != "" else {return}
        guard let password = passwordTextField.text,password != "" else {return}
        AuthService.shared.loginUser(email: email, password: password) { (isSuccess) in
            if isSuccess
            {
                print("logged in")
            }
            else
            {
                print("err logged in")
            }
        }
    }
    
}
