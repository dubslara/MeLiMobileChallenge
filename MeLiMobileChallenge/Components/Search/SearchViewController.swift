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

    let viewModel = ViewModel()
    var products = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }

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

        activityIndicator.startAnimating()
        firstly {
            Product.get(text: searchText)
        }.done { [weak self] products in
            self?.products = products
        }.ensure { [weak self] in
            self?.activityIndicator.stopAnimating()
        }.catch { [weak self] error in
            guard let navVC = self?.navigationController else {
                return
            }
            let alert = UIAlertController(title: "Oops!", message: "There was an error fetching your items", preferredStyle: .alert)
            alert.show(navVC, sender: self)
            AppError.log(error)
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.identifier) as? SearchResultCell else {
            return UITableViewCell()
        }
        let product = products[indexPath.item]
        cell.configure(product)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.item]
        // Instanciar detalle
        let productViewController = ProductViewController(product: product)
        navigationController?.pushViewController(productViewController, animated: true)
    }
}
