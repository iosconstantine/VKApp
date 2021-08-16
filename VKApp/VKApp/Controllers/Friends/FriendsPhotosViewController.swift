//
//  FriendsPhotosViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var friends = [PhotoModel]()
    
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
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsPhotosViewCell.identifier, for: indexPath) as! FriendsPhotosViewCell
       
        let friend = friends[indexPath.item]
        cell.configure(friend)
        
        return cell
    }
    
    
}
