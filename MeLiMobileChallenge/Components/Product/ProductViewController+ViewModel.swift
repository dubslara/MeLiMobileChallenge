//
//  ProductViewController+ViewModel.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 27/04/2021.
//

import Foundation

extension ProductViewController {
    struct ViewModel {
        private let product: Product

        init(product: Product) {
            self.product = product
        }
        
        var itemCondition: String {
            product.condition
        }

        var description: String {
            product.title
        }

        var price: String {
            product.priceFormatted
        }

        var soldQuantity: String {
            "\(product.soldCount) vendidos"
        }

        var conditionAndSoldQuantity: String {
            [
                product.condition,
                "\(product.soldCount) vendidos"
            ].joined(separator: " | ")
        }

        var thumbnail: URL {
            product.thumbnail
        }
    }
}
