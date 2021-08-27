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
    
    
    
    func configure(group: GroupModel) {
        groupsAvatarImageCell.image = UIImage(named: group.avatarName)
        groupsNameLabelCell.text = group.nameGroup
        
    }
}
