//
//  AllGroupsViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class AllGroupsViewCell: UITableViewCell {
    
    @IBOutlet weak var groupImageView: UIImageView!
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    static let identifier = "AllGroupsViewCell"
    
    func configure(group: GroupModel) {
        groupImageView.image = UIImage(named: group.avatarName)
        groupNameLabel.text = group.nameGroup
        
    }
}
