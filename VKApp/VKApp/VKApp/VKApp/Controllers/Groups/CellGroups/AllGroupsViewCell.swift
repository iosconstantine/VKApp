//
//  AllGroupsViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit
import Kingfisher

class AllGroupsViewCell: UITableViewCell {
    
    @IBOutlet weak var groupImageView: UIImageView!
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    static let identifier = "AllGroupsViewCell"
    
    func configure(group: MyGroups) {
        let url = URL(string: group.photo)
        guard let url = url else { return }
        groupImageView.kf.setImage(with: url)
        groupNameLabel.text = group.name
        
    }
}
