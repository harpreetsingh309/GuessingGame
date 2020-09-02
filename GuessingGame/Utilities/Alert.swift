//
//  Alert.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit

class Alert: NSObject {
    
    static func show(_ message: String) {
        UIAlertController.showAlert("Alert!", message: message, buttons: ["OK"], completion: { (_, index) in })
    }
}
