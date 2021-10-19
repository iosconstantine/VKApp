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
    let networkService = NetworkServiceAlamofire()
    var photos = [Photos]()
    var ownerId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        networkService.getPhotos(ownerId: ownerId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                self.photos = photos
                self.collectionView.reloadData()
            case .failure: print("Случилась ошибка")
            }
        }
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "toPresenter",
            let destination = segue.destination as? PresenterViewController
        {
            destination.photos = photos
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
//        cell.likeTapped = { [weak self] isLike in
//            self?.photos[indexPath.item].isLike = isLike
//        }
//
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

