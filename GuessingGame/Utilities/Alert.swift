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
    static func openSettings(title: String = "Alert!", message: String) {
        UIAlertController.showAlert(title, message: message, buttons: ["OK", "Open Settings"], completion: { (_, index) in
            if index == 1 {
                let settingsUrl = URL(string: UIApplication.openSettingsURLString)
                if let url = settingsUrl {
                    UIApplication.shared.open(url)
                }
            }
        })
    }
    
    static func show(_ message: String) {
        UIAlertController.showAlert("Alert!", message: message, buttons: ["OK"], completion: { (_, index) in })
    }
}
