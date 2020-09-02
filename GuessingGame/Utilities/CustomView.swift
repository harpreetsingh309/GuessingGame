//
//  CustomView.swift
//  GuessingGame
//
//  Created by Harpreet on 02/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
            setNeedsLayout()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
            setNeedsLayout()
        }
    }
}
