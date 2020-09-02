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
    
    var questionNumber = 0
    var score = 0
    var arrQuestions: [Items]!
    
    func getQuestionImage() -> String {
        return arrQuestions[questionNumber].imageUrl!
    }
    
    func getHeadlines() -> [String] {
        return arrQuestions[questionNumber].headlines!
    }
    
    func getHeadlineSection() -> String {
        return arrQuestions[questionNumber].section!
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(arrQuestions.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < arrQuestions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
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
