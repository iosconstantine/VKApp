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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedImage))
        friendsAvatarImageCell.addGestureRecognizer(tap)
        friendsAvatarImageCell.isUserInteractionEnabled = true
    }
    
    @objc func tappedImage() {
        UIView.animateKeyframes(
            withDuration: 0.3,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.5,
                                   animations: {
                                    self.friendsAvatarImageCell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.5,
                                   relativeDuration: 0.6,
                                   animations: {
                                    self.friendsAvatarImageCell.transform = .identity
                                   })
            })
    }
    
    func configure(friend: FriendModel) {
        friendsAvatarImageCell.image = UIImage(named: friend.avatarName)
        friendsNameLabelCell.text = friend.name
    }
}
