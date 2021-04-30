//
//  Product.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import Foundation
import Alamofire
import PromiseKit

struct Product: Codable {
    let id: String
    let condition: String
    let title: String
    let price: Double
    let thumbnail: URL
    let availableCount: Int
    let soldCount: Int

    var priceFormatted: String {
        "$ \(String(format: "%g", price))"
    }
 
    enum CodingKeys: String, CodingKey {
        case id
        case condition
        case title
        case price
        case thumbnail
        case availableCount = "available_quantity"
        case soldCount = "sold_quantity"
    }
}

extension Product {
    private struct Response: Codable {
        let query: String
        let results: [Product]
    }

    static func url(search: String) -> String {
        return "https://api.mercadolibre.com/sites/MLA/search?q=\(search.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) ?? "")"
    }
    
    static func get(text: String) -> Promise<[Self]> {
        .init { seal in
            let request = AF.request(url(search: text))
            request.responseDecodable(of: Response.self) { response in
                if let error = response.error {
                    seal.reject(error)
                }

                guard let result = response.value else {
                    return seal.reject(AppError(title: "Parsing Error", message: "Couldn't parse response from search product request"))
                }

                seal.fulfill(result.results)
            }
        }
    }
}
