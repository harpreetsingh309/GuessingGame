//
//  Alert.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit

class Alert: NSObject {

    // MARK: - Show error message for settings authorisation
    static func showAlertWithAction(title: String = "Good!", message: String) {
        UIAlertController.showAlert(title, message: message, buttons: ["OK"], completion: { (_, index) in
            if index == 1 {

            }
        })
    }
    
    static func show(_ message: String) {
        UIAlertController.showAlert("Congrats!", message: message, buttons: ["OK"], completion: { (_, index) in })
    }
}
