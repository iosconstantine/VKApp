//
//  FriendsPhotosViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class FriendsPhotosViewCell: UICollectionViewCell {
    
    @IBOutlet weak var likeControl: LikeControl2!
    @IBOutlet weak var photoImage: UIImageView!
    
    static let identifier: String = "FriendsPhotosViewCell"
    var likeTapped: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeControl.addTarget(self, action: #selector(likeChanged), for: .valueChanged)
    }
    
    func configure(_ photos: PhotoModel) {
        photoImage.image = UIImage(named: photos.photoName)
        likeControl.configure(isLike: photos.isLike, count: photos.likeCount)
    }
    
    @objc private func likeChanged() {
        likeTapped?(likeControl.isLike)
    }
}
