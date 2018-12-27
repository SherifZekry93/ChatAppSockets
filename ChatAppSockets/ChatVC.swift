//
//  ChatVC.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/27/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import UIKit
import SWRevealViewController
class ChatVC: UIViewController
{
    //MARK:Outlets
    @IBOutlet weak var menuBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer((self.revealViewController().tapGestureRecognizer()))
    }
}
