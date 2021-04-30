//
//  SearchViewController.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import UIKit
import PromiseKit

final class SearchViewController: UIViewController {
    let searchText: String

    init(searchText: String) {
        self.searchText = searchText
        super.init(nibName: nil, bundle: nil)
        title = searchText
    }

    required init?(coder: NSCoder) {
        searchText = ""
        super.init(coder: coder)
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.identifier)
        return tableView
    }()

    let activityIndicator = UIActivityIndicatorView(style: .large)

    lazy var viewModel = ViewModel(searchText: searchText)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.backgroundColor = .white
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        viewModel.didChange { [weak self] in
            self?.reloadData()
        }

        viewModel.loadData()
    }

    func reloadData() {
        tableView.reloadData()
        if viewModel.isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.identifier) as? SearchResultCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.item]
        cell.configure(product)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(item: indexPath.row)
    }
}
