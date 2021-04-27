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
    let title: String
    let price: Double
    let thumbnail: URL
}

// MARK: - Search

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
