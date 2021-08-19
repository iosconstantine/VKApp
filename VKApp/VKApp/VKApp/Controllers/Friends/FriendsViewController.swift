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
    
    @IBOutlet weak var searchPanel: SearchPanelControl!
    //private var searchPanel = SearchPanelControl()
    private var firstLetters = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends = storage.friends
        tableView.delegate = self
        tableView.dataSource = self
        firstLetters = getFirstLetter(friends)
        searchPanel.setLetters(firstLetters)
        //searchPanel.addTarget(self, action: #selector(scrollToLetter), for: .touchUpInside)
    }
    
    func getFirstLetter(_ friends: [FriendModel]) -> [String] {
        let allFriendsName = friends.map {$0.name}
        let firstLetter = Array(Set(allFriendsName.map {String($0.prefix(1))})).sorted()
        
        return firstLetter
    }
    
    @objc func scrollToLetter() {
        let selectLetter = searchPanel.selectedLetter
        for indexSextion in 0..<firstLetters.count{
            if selectLetter == firstLetters[indexSextion] {
                tableView.scrollToRow(at: IndexPath(row: 0, section: indexSextion), at: .top, animated: true)
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToFriendCollection" {
            guard
                let indexSelectCell = tableView.indexPathForSelectedRow?.row,
            let destinationVC = segue.destination as? FriendsPhotosViewController
            else { return }
            let selectFriend = friends[indexSelectCell]
            destinationVC.title = selectFriend.name
            destinationVC.photos = selectFriend.images
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
