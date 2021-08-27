//
//  FriendsPhotosViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class FriendsPhotosViewCell: UICollectionViewCell {
    
    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var photoImage: UIImageView!
    
    static let identifier: String = "FriendsPhotosViewCell"
    var likeTapped: (() -> Void)?
    
    func configure(_ photos: PhotoModel) {
        photoImage.image = UIImage(named: photos.photoName)
        likeControl.configure(isLike: photos.isLike,
                               likeCount: photos.likeCount
        )
        likeControl.controlTapped = {[weak self] in
            self?.likeTapped?()
        }
    }
}
