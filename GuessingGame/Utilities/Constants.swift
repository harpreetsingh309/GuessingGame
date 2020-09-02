//
//  Constants.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit

struct Constants {
    static let baseUrl = "https://firebasestorage.googleapis.com/v0/b/nca-dna-apps-dev.appspot.com/o/game.json?alt=media&token=e36c1a14-25d9-4467-8383-a53f57ba6bfe"
}

struct Errors {
    static let noInternet = "The Internet connection appears to be offline."
    static let serverError = "Internal Server error ocurred, try again after some time"
    static let noURlFound = "Url not found!"
}
