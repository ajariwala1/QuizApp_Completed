//
//  QuizLogic.swift
//  QuizApp_Completed
//

import Foundation


struct QuizLogic {
    
    var questionIndex : Int = 0
    var score : Int = 0
    
    let question = [
                Question("Which national park was the first in the US?",
                         "Theodore Roosevelt",
                         "Yellowstone",
                         "Yellowstone"),
                Question("Which national park has the deepest lake in the US?",
                         "Crater Lake",
                         "Grand Teton",
                         "Crater Lake"),
                Question("What causes the blue haze for which Great Smoky Mountains National Park is named?",
                         "Plants",
                         "Animals",
                         "Plants"),
                Question("What is the highest number of visits Yellowstone has recorded in a single year?",
                         "About 3 million",
                         "About 5 million",
                         "About 5 million"),
                Question("Carbon Glacier in this national park has the greatest thickness and volume of any glacier in the continental US.",
                         "Denali",
                         "Mount Rainier",
                         "Mount Rainier")
            ]
    
    mutating func compareUserResponse(_ response: String) -> Bool {
        if response == question[questionIndex].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func increaseIndex() {
        if questionIndex < question.count-1 {
            questionIndex += 1
        } else {
            questionIndex = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getNextQuestion() -> String {
        return question[questionIndex].question
    }
    
    func getChoiceOne() -> String {
        return question[questionIndex].option_one
    }
    
    func getChoiceTwo() -> String {
        return question[questionIndex].option_two
    }
    
    func getImageName() -> Int {
        return questionIndex
    }
    
    
}
