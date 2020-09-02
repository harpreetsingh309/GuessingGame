//
//  CustomButton.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    // MARK: - IBInspectable properties
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        updateUI()
    }

    // MARK: - Update UI
    private func updateUI() {
        layer.cornerRadius = cornerRadius
        if cornerRadius > 0 {
            layer.masksToBounds = true
        }
    }
}
