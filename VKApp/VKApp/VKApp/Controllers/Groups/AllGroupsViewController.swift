//
//  AllGroupsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
 
    let searchController = UISearchController(searchResultsController: nil)
    
    let storage: GroupStorage = GroupStorage()
    var groups = [GroupModel]()
    
    var filtredGroups = [GroupModel]()
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = storage.allGroups
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}



extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filtredGroups.count
        }
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllGroupsViewCell.identifier) as! AllGroupsViewCell
        
        var group: GroupModel
        
        if isFiltering {
            group = filtredGroups[indexPath.row]
        } else {
            group = groups[indexPath.row]
        }
        
        cell.configure(group: group)
        return cell
    }
}

extension AllGroupsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filtredGroups = groups.filter({ (group: GroupModel) -> Bool in
            return group.nameGroup.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
