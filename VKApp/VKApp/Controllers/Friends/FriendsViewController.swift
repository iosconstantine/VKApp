//
//  FriendsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 11.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var friends = [FriendModel]()
    let storage: FriendsStorage = FriendsStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends = storage.friends
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToFriendCollection" {
            guard
                let indexSelectCell = tableView.indexPathForSelectedRow?.row,
            let destinationVC = segue.destination as? FriendsPhotosViewController
            else { return }
            let selectFriend = friends[indexSelectCell]
            destinationVC.title = selectFriend.name
            destinationVC.friends = selectFriend.images
        }
    }
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier) as! FriendsTableViewCell
        cell.configure(friend: friends[indexPath.row])
        return cell
    }
    
    
}
