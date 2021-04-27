//
//  ProductViewController.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import UIKit

final class ProductViewController: UIViewController {
    init(product: Product) {
        super.init(nibName: nil, bundle: nil)
        title = product.title
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
}


