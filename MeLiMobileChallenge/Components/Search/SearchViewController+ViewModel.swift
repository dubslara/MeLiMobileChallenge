//
//  SearchViewController+ViewModel.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import Foundation
import PromiseKit

extension SearchViewController {
    class ViewModel {
        let searchText: String
        var isLoading: Bool = true {
            didSet {
                didChange?()
            }
        }

        var products = [Product]() {
            didSet {
                didChange?()
            }
        }

        init(searchText: String) {
            self.searchText = searchText
        }

        func loadData() {
            firstly {
                Product.get(text: searchText)
            }.done { [weak self] products in
                self?.products = products
            }.ensure { [weak self] in
                self?.isLoading = false
            }.catch { error in
                Navigation.alertError()
                AppError.log(error)
            }
        }

        func didSelect(item: Int) {
            Navigation.productDetail(products[item])
        }

        private var didChange: (() -> Void)?
        func didChange(_ callback: @escaping () -> Void) {
            self.didChange = callback
        }
    }
}
