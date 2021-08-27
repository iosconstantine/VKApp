//
//  FriendsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 11.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let storage: FriendsStorage = FriendsStorage()
    
    var sortedFriendsArray = [[FriendModel]]()
    var firstLettersFriends = [Character]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friends = storage.friends
        
        firstLettersFriends = firstLetters(friends)
        sortedFriendsArray = sortedFriends(friends, firstLetters: firstLettersFriends)
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        let header = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 50)))
//        header.backgroundColor = .systemGray
//        tableView.tableHeaderView = header
        
        tableView.register(AllFriendsHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: AllFriendsHeaderTableViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToFriendCollection" {
            guard
                let indexSelectCell = tableView.indexPathForSelectedRow?.row,
                let indexSellectCellSection = tableView.indexPathForSelectedRow?.section,
                let destinationVC = segue.destination as? FriendsPhotosViewController
            else { return }
            let selectFriend = sortedFriendsArray[indexSellectCellSection][indexSelectCell]
            destinationVC.title = selectFriend.name
            destinationVC.photos = selectFriend.images
        }
    }
}

private func sortedFriends(_ friends: [FriendModel], firstLetters: [Character]) -> [[FriendModel]] {
    var sortedFriends = [[FriendModel]]()
    for letter in firstLetters {
        let friendsForLetter = friends.filter { $0.name.first == letter }
        sortedFriends.append(friendsForLetter)
    }
    return sortedFriends
}

private func firstLetters(_ friends: [FriendModel]) -> [Character] {
    // берем все первые буквы
    let allFirstLetter = friends.compactMap { $0.name.first }
    // удаляем дубликаты букв
    let withoutDublecateLetter = Array(Set(allFirstLetter))
    // сортируем и возвращаем
    return withoutDublecateLetter.sorted()
}


extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriendsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedFriendsArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier) as! FriendsTableViewCell
        
        let friend = sortedFriendsArray[indexPath.section][indexPath.row]
        
        cell.configure(friend: friend)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: AllFriendsHeaderTableViewCell.identifier) as! AllFriendsHeaderTableViewCell
        
        header.configure(String(firstLettersFriends[section]))
        return header
    }
}


