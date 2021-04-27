//
//  HomeViewController.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false

        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchController

        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        return searchController
    }()

    var searchText: String {
        searchController.searchBar.text ?? ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mercado Libre (berreta)"
        navigationItem.searchController = searchController
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchViewController = SearchViewController(searchText: searchText)
        navigationController?.pushViewController(searchViewController, animated: true)
    }

}
