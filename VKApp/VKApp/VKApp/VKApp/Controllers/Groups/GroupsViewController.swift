//
//  GroupsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 11.08.2021.
//

import UIKit

class GroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let networkAlamofie = NetworkServiceAlamofire()
    var groups = [MyGroups]() {
        didSet {
            print(oldValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getGroups()
    }
    
    private func getGroups() {
        networkAlamofie.getGroups() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let groups):
                self.groups = groups
                self.tableView.reloadData()
            case .failure: print("Случилась ошибка")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Удалить") { action, view, complition in
            let group = self.groups[indexPath.row]
            print("Название \(group.name)")
            self.networkAlamofie.leaveGroup(id: group.id) { result in
                switch result {
                case .success:
                    self.groups.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                    self.tableView.reloadData()
                case .failure: print("Ошибка")
                }
            }
        }
        action.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        action.image = UIImage(systemName: "trash.fill")
        return action
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource
extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.identifier) as! GroupsTableViewCell
        cell.configure(group: groups[indexPath.row])
        return cell
    }
}
