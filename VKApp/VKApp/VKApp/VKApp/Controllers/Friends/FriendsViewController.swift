//
//  FriendsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 11.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let storage: FriendsStorage = FriendsStorage()
    private var sortedFriendsArray = [[Users]]()
    private var firstLettersFriends = [Character]()
    private var friends: [Users] = [] {
        willSet {
            firstLettersFriends = firstLetters(newValue)
            sortedFriendsArray = sortedFriends(newValue, firstLetters: firstLettersFriends)
        }
    }
    private let networkAlamofie = NetworkServiceAlamofire()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFriends()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AllFriendsHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: AllFriendsHeaderTableViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToFriendCollection" {
            guard
                let indexSelectCell = tableView.indexPathForSelectedRow?.row,
                let indexSellectCellSection = tableView.indexPathForSelectedRow?.section,
                let destinationVC = segue.destination as? FriendsPhotosViewController,
                let nameTappedImage = segue.destination as? FriendsPhotosViewController // получим доступ к свойствам контроллера
            else { return }
            
            let selectFriend = sortedFriendsArray[indexSellectCellSection][indexSelectCell]
            nameTappedImage.userNameFromOtherView = selectFriend.firstName // по тапу на ячейку передадим имя нажатой ячейки в наше свойство в другом контроллере
            destinationVC.title = selectFriend.firstName + " " + selectFriend.lastName
            destinationVC.ownerId = selectFriend.id
        }
    }
    
    //MARK: - Method implement
    private func sortedFriends(_ friends: [Users], firstLetters: [Character]) -> [[Users]] {
        var sortedFriends = [[Users]]()
        for letter in firstLetters {
            let friendsForLetter = friends.filter { $0.firstName.first == letter }
            sortedFriends.append(friendsForLetter)
        }
        return sortedFriends
    }
    
    private func firstLetters(_ friends: [Users]) -> [Character] {
        // берем все первые буквы
        let allFirstLetter = friends.compactMap { $0.firstName.first }
        // удаляем дубликаты букв
        let withoutDublecateLetter = Array(Set(allFirstLetter))
        // сортируем и возвращаем
        return withoutDublecateLetter.sorted()
    }
    
    private func getFriends() {
        networkAlamofie.getFriends(userId: Session.shared.userId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let friends):
                self.friends = friends
                self.tableView.reloadData()
            case .failure: print("Случилась ошибка")
            }
        }
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // animation 1
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -50, 20, 30)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
}


