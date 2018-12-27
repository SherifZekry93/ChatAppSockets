//
//  ChannelVC.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/27/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import UIKit
import SWRevealViewController
class ChannelVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        revealViewController().rearViewRevealWidth = self.view.frame.width - 60
    }
}
