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
    
    // Answer View Outlets
    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var answerBgView: UIView!
    @IBOutlet weak var answerScoreLbl: UILabel!
    @IBOutlet weak var answerHeadlineLbl: UILabel!
    @IBOutlet weak var answerSectionLbl: UILabel!
    
    // Variables
    var quesBrain = QuestionBrainViewModel()
    var answerTag = 0

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        getAllQuestionAns()
    }
    
    //MARK: - Actions
    /// Check answer and update answer UI
    @IBAction func answerButtonAction(_ sender: UIButton) {
        let userGotItRight = quesBrain.checkAnswer(userAnswer: sender.tag)
        if userGotItRight {
            answerTag = sender.tag
            setAnswerUI()
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
    
    @IBAction func readArticleBtnAction(_ sender: UIButton) {
        if let url = quesBrain.getCurrentItem().storyUrl {
            guard let url = URL(string:url ) else { return }
            UIApplication.shared.open(url)
        } else {
            Alert.show("")
        }
    }
    
   //MARK: - Methods
    /// Skip, next or wrong answer and update question UI
    func goToNextQues() {
        answerBgView.isHidden = true
        questionBgView.isHidden = false
        quesBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuesUI), userInfo: nil, repeats: false)
    }
    
    /// Initiate when view did load
    func initUI() {
        questionImage.layer.cornerRadius = 10
        questionImage.layer.masksToBounds = true
        questionBgView.isHidden = true
        answerBgView.isHidden = true
    }
    
    /// Show all UI elements with data from server
    @objc func updateQuesUI() {
        setView(view: questionBgView, hidden: false)
        questionImage.sd_setImage(with: URL(string: quesBrain.getQuestionImage()), placeholderImage: #imageLiteral(resourceName: "ic_logo"))
        progressBar.progress = quesBrain.getProgress()
        scoreLabel.text = "\(quesBrain.getScore()) point coming your way"
        
        for (index,value) in quesBrain.getHeadlines().enumerated() {
            switch index {
            case 0:
                firstHeadlineBtn.setTitle(value, for: .normal)
            case 1:
                secondHeadlineBtn.setTitle(value, for: .normal)
            case 2:
                thirdHeadlineBtn.setTitle(value, for: .normal)
            default:  break
            }
        }
    }
    
    /// Call when answer is correct and update answer UI
    func setAnswerUI() {
        setView(view: answerBgView, hidden: false)
        questionBgView.isHidden = true
        answerImage.sd_setImage(with: URL(string: quesBrain.getQuestionImage()), placeholderImage: #imageLiteral(resourceName: "ic_logo"))
        answerScoreLbl.attributedText = "".getAttrString(score:"\(quesBrain.getScore())", str: " POINTS")
        answerHeadlineLbl.text = quesBrain.getHeadlines()[answerTag]
        answerSectionLbl.text = quesBrain.getHeadlineSection().uppercased()
    }
    
    //MARK: - Server Data
    /// Get data from server and call when view did load
       func getAllQuestionAns() {
           WebServiceModel.getDataFromServer(completion: { (model : QuestionModel) in
                   if let item = model.items, item.count > 0 {
                       self.quesBrain.arrQuestions = item
                       self.updateQuesUI()
                   } else {
                       Alert.show("No data found")
                   }
           }) { (msg) in
               Alert.show(msg)
           }
       }
   
    //MARK: - Animation
    /// To show transition of different views
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.7, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
}
