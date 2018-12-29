//
//  AvatarPickerVC.swift
//  ChatAppSockets
//
//  Created by Sherif  Wagih on 12/29/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import UIKit
class AvatarPickerVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var darkLightSegmentedControl:UISegmentedControl!
    //Variables
    var type:AvatarType = .dark
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.register(AvatarImageCell.self, forCellWithReuseIdentifier: AVATAR_CELL)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func darkLightSegmentedControl(_ sender: UISegmentedControl){
        type = darkLightSegmentedControl.selectedSegmentIndex == 0 ? .dark : .light
        collectionView.reloadData()
    }
    
}
extension AvatarPickerVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AVATAR_CELL, for: indexPath) as! AvatarImageCell
        cell.configureCell(index: indexPath.row, type: type)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) / 4 - 10
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if type == .dark
        {
            UserDataService.shared.setAvatarName(avatarName: "dark\(indexPath.row)")
        }
        else
        {
            UserDataService.shared.setAvatarName(avatarName: "light\(indexPath.row)")
        }
        dismiss(animated: true, completion: nil)
    }
}
