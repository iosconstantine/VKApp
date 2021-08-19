//
//  FriendsPhotosViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photos = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension FriendsPhotosViewController: UICollectionViewDelegate {
    
}

extension FriendsPhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsPhotosViewCell.identifier, for: indexPath) as! FriendsPhotosViewCell
       
        let photo = photos[indexPath.item]
        cell.configure(photo)
        cell.likeTapped = { [weak self] in
            self?.photos[indexPath.item].isLike.toggle()
                collectionView.reloadSections(IndexSet(integer: 0)) //UIView.performWithoutAnimation
        }
        
        return cell
    }
    
    
}
