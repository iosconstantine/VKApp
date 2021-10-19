//
//  AllGroupsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 15.08.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {
    var groups = [MyGroups]()
    private let networkService = NetworkServiceAlamofire()
    private var timer: Timer?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupSearchBar() {
        let seacrhController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = seacrhController
        navigationItem.hidesSearchBarWhenScrolling = false
        seacrhController.hidesNavigationBarDuringPresentation = false
        seacrhController.obscuresBackgroundDuringPresentation = false
        seacrhController.searchBar.delegate = self
    }
}
//MARK: - UISearchBarDelegate
extension AllGroupsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.networkService.searchGroups(name: searchText) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let groups):
                    self.groups = groups
                    self.tableView.reloadData()
                case .failure: print("Случилась ошибка")
                }
            }
        })
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource
extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllGroupsViewCell.identifier) as! AllGroupsViewCell
        let group = groups[indexPath.row]
        cell.configure(group: group)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let groupID = groups[indexPath.row].id
        networkService.addGroup(id: groupID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let status):
                if status.response == 1 {
                self.alertSuccess(title: "Вы подписались на сообщество", message: nil)
                }
            case .failure(let error):
                switch error {
                case .decodeError:
                    self.alertSuccess(title: "Упс! Что-то пошло не так", message: "Группа уже добавлена")
                case .notData:
                    print("")
                case .serverError:
                    print("")
                }
            }
        }
    }
}
