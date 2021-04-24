//
//  ViewController.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import UIKit

class RootViewController: UINavigationController {
    static let shared = RootViewController(rootViewController: HomeViewController())
    static func setup() {
        guard let window = UIApplication.shared.delegate?.window! else {
            return
        }
        window.rootViewController = shared
        window.makeKeyAndVisible()
    }
}

