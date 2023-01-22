//
//  ViewController.swift
//  QuizApp_Completed
//


struct Question {
    
    init(_ ques: String, _ o_one:String, _ o_two: String, _ ans: String) {
        question = ques
        option_one = o_one
        option_two = o_two
        answer = ans
    }
    
    var question: String
    var answer: String
    var option_one: String
    var option_two: String
    
    
}

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        // get user response
        let userAnswer = sender.titleLabel!.text!
        
        let isCorrect = compareUserResponse(userAnswer)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        increaseIndex()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(score)"
        questionLabel.text = question[questionIndex].question
        background.image = UIImage(named: String(questionIndex + 1))
        buttonOne.setTitle(question[questionIndex].option_one, for: .normal)
        buttonTwo.setTitle(question[questionIndex].option_two, for: .normal)
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
    }
    
    func compareUserResponse(_ response: String) -> Bool {
        if response == question[questionIndex].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func increaseIndex() {
        if questionIndex < question.count-1 {
            questionIndex += 1
        } else {
            questionIndex = 0
            score = 0
        }
    }
    

}

