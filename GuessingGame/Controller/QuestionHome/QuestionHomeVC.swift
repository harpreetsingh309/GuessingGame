//
//  QuestionHomeVC.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit

class QuestionHomeVC: AbstractController {
    
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionBgView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    var arrayItems: [Items]?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllQuestionAns()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
    }
    
    
    //MARK: - Server Data
    func getAllQuestionAns() {
        WebServiceModel.getDataFromServer(completion:
            { (model : QuestionModel) in
                if let item = model.items, item.count > 0 {
                    self.arrayItems = item
                } else {
                    Alert.show("No data found")
                }
        }) { (msg) in
            Alert.show(msg)
        }
    }
    
    func setUI() {
        
    }
}
