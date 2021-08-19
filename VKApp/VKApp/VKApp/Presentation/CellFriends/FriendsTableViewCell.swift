//
//  FriendsTableViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 11.08.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendsNameLabelCell: UILabel!
    @IBOutlet weak var friendsAvatarImageCell: UIImageView!
    
    static let identifier = "FriendsTableViewCell"
    
    func configure(friend: FriendModel) {
        friendsAvatarImageCell.image = UIImage(named: friend.avatarName)
        friendsNameLabelCell.text = friend.name
    }
}
