//
//  AvatarImageCell.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/29/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import UIKit
enum AvatarType
{
    case dark
    case light
}
class AvatarImageCell:UICollectionViewCell
{
    @IBOutlet weak var avatarImage : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    func setupViews()
    {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    func configureCell(index:Int, type:AvatarType)
    {
        if type == .dark
        {
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        else
        {
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
}
