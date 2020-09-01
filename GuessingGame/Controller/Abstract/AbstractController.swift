//
//  AbstractController.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit

class AbstractController: UIViewController {
    
    var model: AnyObject!
    
    // MARK: - Get control from storyboard.
    class var control: AbstractController {
        return (UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: self)) as? AbstractController)!
    }
    
    class func controlWithModel(_ model: AnyObject) -> AbstractController {
        let control = self.control
        control.model = model
        return control
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserverForAppState()
    }
    
    func addObserverForAppState() {
        NotificationCenter.default.addObserver(self, selector: #selector(appEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    // MARK: - Background Foreground Notification
    @objc func appEnterBackground() {}
    
    @objc func appEnterForeground() {}
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    deinit {
        debugPrint("Super of \(String(describing: self)) released.")
        NotificationCenter.default.removeObserver(self)
    }
}
