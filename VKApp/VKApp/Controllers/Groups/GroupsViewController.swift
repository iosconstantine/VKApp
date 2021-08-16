//
//  GroupsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 11.08.2021.
//

import UIKit

class GroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let storage: GroupStorage = GroupStorage()
    var groups = [GroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = storage.groups
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func addGroup(_ segue: UIStoryboardSegue) {
        guard let sourceController = segue.source as? AllGroupsViewController,
              let indexSelectRow = sourceController.tableView.indexPathForSelectedRow
              else { return }
        let group = sourceController.groups[indexSelectRow.row]
        if !groups.contains(where: { group.nameGroup == $0.nameGroup }) {
            groups.append(group)
            
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Удалить") { action, view, complition in
            self.groups.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        action.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        action.image = UIImage(systemName: "trash.fill")
        return action
    }
}

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
