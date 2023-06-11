//
//  AlbumsViewController.swift
//  Junior-Task_iTunesSearch
//
//  Created by Akbarshah Jumanazarov on 6/10/23.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(AlbumsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupDelegate()
        setConstraints()
        setNavBar()
        setupSearchController()
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchBar.delegate = self
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    private func setNavBar() {
        navigationItem.title = "Albums"
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.cirlce"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapUserInfo))
    }
    
    private func setupSearchController() {
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    @objc func didTapUserInfo() {
        let vc = UserInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailsAlbumViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AlbumsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
