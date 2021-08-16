//
//  FriendsPhotosViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class FriendsPhotosViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    static let identifier: String = "FriendsPhotosViewCell"
    
    func configure(_ photos: PhotoModel) {
        photoImage.image = UIImage(named: photos.photoName)
    }
}
