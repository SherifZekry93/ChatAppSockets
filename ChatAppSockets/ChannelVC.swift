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
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuManager.default.menuFadeStatusBar = false
        navigationController?.navigationBar.isHidden = true
        SideMenuManager.default.menuWidth = view.frame.width - 59
    }
}
