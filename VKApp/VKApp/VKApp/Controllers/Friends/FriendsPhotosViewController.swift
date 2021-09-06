//
//  FriendsPhotosViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var userNameFromOtherView = String() // сюда по тапу будет приходить имя нажатой ячейки
    
    var photos = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "toPresenter",
            let destination = segue.destination as? PresenterViewController
        {
            destination.photos = FriendsStorage.getPhotosForUsername(username: userNameFromOtherView) // передаем фотографии в презентер человека, имя которого мы получили по тапу на ячейку друзей
            let indexPath2 = collectionView.indexPathsForSelectedItems
            destination.selectedPhoto = indexPath2![0].item
        }
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
        cell.likeTapped = { [weak self] isLike in
            self?.photos[indexPath.item].isLike = isLike
        }
        
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        // animation 1
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 100)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
}

