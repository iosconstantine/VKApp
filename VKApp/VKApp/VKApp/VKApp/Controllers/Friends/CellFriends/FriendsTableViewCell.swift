//
//  FriendsTableViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 11.08.2021.
//

import UIKit
import Kingfisher

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
    
    func configure(friend: Users) {
        let url = URL(string: friend.avatarURL)
        guard let url = url else { return }
        friendsAvatarImageCell.kf.setImage(with: url)
        friendsNameLabelCell.text = friend.firstName + " " + friend.lastName
        
    }
}
