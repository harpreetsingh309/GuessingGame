//
//  QuestionHomeVC.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import UIKit
import SDWebImage

class QuestionHomeVC: AbstractController {
    
    // Question View Outlets
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionBgView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstHeadlineBtn: UIButton!
    @IBOutlet weak var secondHeadlineBtn: UIButton!
    @IBOutlet weak var thirdHeadlineBtn: UIButton!
    var arrayItems: [Items]?
    var quesBrain = QuestionBrainViewModel()
    var answerTag = 0
    
    // Answer View Outlets
    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var answerBgView: UIView!
    @IBOutlet weak var answerScoreLbl: UILabel!
    @IBOutlet weak var answerHeadlineLbl: UILabel!
    @IBOutlet weak var answerSectionLbl: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        getAllQuestionAns()
    }
    
    @IBAction func answerButtonAction(_ sender: UIButton) {
        let userGotItRight = quesBrain.checkAnswer(userAnswer: sender.tag)
        if userGotItRight {
            answerTag = sender.tag
            setAnserUI()
        } else {
            goToNextQues()
        }
    }
    
    @IBAction func skipQuesBtnAction(_ sender: UIButton) {
        goToNextQues()
    }
    
    @IBAction func nextQuesBtnAction(_ sender: UIButton) {
        goToNextQues()
    }
    
    
    //MARK: - Server Data
    func getAllQuestionAns() {
        WebServiceModel.getDataFromServer(completion: { (model : QuestionModel) in
                if let item = model.items, item.count > 0 {
                    self.quesBrain.arrQuestions = item
                    self.updateUI()
                } else {
                    Alert.show("No data found")
                }
        }) { (msg) in
            Alert.show(msg)
        }
    }
    
    func goToNextQues() {
        answerBgView.isHidden = true
        questionBgView.isHidden = false
        quesBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func initUI() {
        questionImage.layer.cornerRadius = 10
        questionImage.layer.masksToBounds = true
        questionBgView.isHidden = true
        answerBgView.isHidden = true
    }
    
   @objc func updateUI() {
        questionBgView.isHidden = false
        questionImage.sd_setImage(with: URL(string: quesBrain.getQuestionImage()), placeholderImage: #imageLiteral(resourceName: "ic_logo"))
        progressBar.progress = quesBrain.getProgress()
        scoreLabel.text = "\(quesBrain.getScore()) point coming your way"
        firstHeadlineBtn.setTitle(quesBrain.getHeadlines()[0], for: .normal)
        secondHeadlineBtn.setTitle(quesBrain.getHeadlines()[1], for: .normal)
        thirdHeadlineBtn.setTitle(quesBrain.getHeadlines()[2], for: .normal)
    }
    
    func setAnserUI() {
        answerBgView.isHidden = false
        questionBgView.isHidden = true
        answerImage.sd_setImage(with: URL(string: quesBrain.getQuestionImage()), placeholderImage: #imageLiteral(resourceName: "ic_logo"))
        answerScoreLbl.text = "\(quesBrain.getScore()) POINTS"
        answerHeadlineLbl.text = quesBrain.getHeadlines()[answerTag]
        answerSectionLbl.text = quesBrain.getHeadlineSection()
    }
}
