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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: Un_Wind_TO_Channel, sender: self)
    }
    
    @IBAction func registerUserButtonClicked(_ sender: UIButton) {
        
    }
}
