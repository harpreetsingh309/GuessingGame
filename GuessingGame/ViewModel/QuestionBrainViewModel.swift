//
//  QuestionBrainViewModel.swift
//  GuessingGame
//
//  Created by Harpreet on 02/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import Foundation
import SDWebImage

struct QuestionBrainViewModel {
    
    // Variables
    var questionNumber = 0
    var score = 0
    var arrQuestions: [Items]!
    
    /// Get current question  items on UI
    func getCurrentItem() -> Items {
        return arrQuestions[questionNumber]
    }
    
    /// Get current Image of headline
    func getQuestionImage() -> String {
        if let url = arrQuestions[questionNumber].imageUrl {
            return url
        }
        return ""
    }
    
    /// Get current headline title for answers
    func getHeadlines() -> [String] {
        if let arrStr = arrQuestions[questionNumber].headlines {
            return arrStr
        }
        return [""]
    }
    
    /// Get current section type of headline Image
    func getHeadlineSection() -> String {
        if let str = arrQuestions[questionNumber].section {
            return str
        }
        return ""
    }
    
    /// Calculates the progress of right answers
    func getProgress() -> Float {
        return Float(questionNumber) / Float(arrQuestions.count)
    }
    
    /// Get total score of user
    mutating func getScore() -> Int {
        return score
    }
    
    /// Increase question count and get next
    mutating func nextQuestion() {
        if questionNumber + 1 < arrQuestions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    /// Calculate the score by adding +2 if answer is right and -1 if answer is wrong.
    mutating func checkAnswer(userAnswer: Int) -> Bool {
        if userAnswer == arrQuestions[questionNumber].correctAnswerIndex {
            score += 2
            return true
        } else {
            score -= 1
            return false
        }
    }
}
