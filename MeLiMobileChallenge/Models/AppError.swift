//
//  AppError.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import Foundation

struct AppError: Error {
    let title: String
    let message: String

    static func log(_ error: Error) {
        //TODO: Log this error
        guard let appError = error as? AppError else {
            return print("Generic Error: \(error.localizedDescription)")
        }
        print("Error: \(appError.title), \(appError.message)")
        
    }
}
