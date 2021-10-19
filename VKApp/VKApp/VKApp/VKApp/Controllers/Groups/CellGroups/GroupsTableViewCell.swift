//
//  GroupsTableViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 11.08.2021.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupsAvatarImageCell: UIImageView!
    @IBOutlet weak var groupsNameLabelCell: UILabel!
    
    static let identifier = "GroupsTableViewCell"
    
    
    
    func configure(group: MyGroups) {
        let url = URL(string: group.photo)
        guard let url = url else { return }
        groupsAvatarImageCell.kf.setImage(with: url)
        groupsNameLabelCell.text = group.name
    }
}
