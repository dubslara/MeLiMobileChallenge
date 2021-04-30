//
//  Navigation.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 27/04/2021.
//

import UIKit

struct Navigation {
    static var navigationController: UINavigationController? {
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController as? UINavigationController
    }

    static func productSearch(text: String) {
        let searchViewController = SearchViewController(searchText: text)
        navigationController?.pushViewController(searchViewController, animated: true)
    }

    static func productDetail(_ product: Product) {
        let productViewController = ProductViewController(product: product)
        navigationController?.pushViewController(productViewController, animated: true)
    }

    static func alertError() {
        guard let navigationController = self.navigationController else {
            return
        }
        let alert = UIAlertController(title: "Oops!", message: "There was an error fetching your items", preferredStyle: .alert)
        alert.show(navigationController, sender: self)
    }
}
