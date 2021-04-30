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

        navigationItem.searchController = searchController

        navigationItem.hidesSearchBarWhenScrolling = false
        return searchController
        
    }()
    
    let appLogo: UIImageView = UIImageView()
    
    lazy var autorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Desarrollado por Lara Dubs."
        label.textColor = UIColor(named: "TextColor")
        return label
    }()

    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.appLogo,
            self.autorLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    var searchText: String {
        searchController.searchBar.text ?? ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mercado Libre"
        navigationItem.searchController = searchController
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        appLogo.contentMode = .scaleAspectFit
        appLogo.image = UIImage(named: "MeLilogo")
        appLogo.snp.makeConstraints {make in
            make.width.equalTo(view).multipliedBy(0.75)
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Navigation.productSearch(text: searchText)
    }
}
