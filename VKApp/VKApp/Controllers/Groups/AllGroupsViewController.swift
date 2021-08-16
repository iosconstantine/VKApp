//
//  AllGroupsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
 
    
    let storage: GroupStorage = GroupStorage()
    var groups = [GroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = storage.allGroups
        tableView.delegate = self
        tableView.dataSource = self
    }
}



extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllGroupsViewCell.identifier) as! AllGroupsViewCell
        cell.configure(group: groups[indexPath.row])
        return cell
    }
}
