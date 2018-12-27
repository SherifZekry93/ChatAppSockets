//
//  ChannelVC.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/27/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import UIKit
import SideMenu
class ChannelVC: UIViewController {
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuManager.default.menuFadeStatusBar = false
        navigationController?.navigationBar.isHidden = true
        SideMenuManager.default.menuWidth = view.frame.width - 59
    }
    @IBAction func openLoginPage(_ sender: UIButton) {
        //        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        //       let controller =  storyBoard.instantiateViewController(withIdentifier: TO_LOGIN)
        //        present(controller, animated: true, completion: nil)
        performSegue(withIdentifier: TO_LOGIN, sender: self)
    }
    
}
