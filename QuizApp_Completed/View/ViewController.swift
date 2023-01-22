//
//  ViewController.swift
//  QuizApp_Completed
//




import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizlogic = QuizLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        // get user response
        let userAnswer = sender.titleLabel!.text!
        
        let isCorrect = quizlogic.compareUserResponse(userAnswer)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizlogic.increaseIndex()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        
        scoreLabel.text = "Score: \(quizlogic.getScore())"

        questionLabel.text = quizlogic.getNextQuestion()
        background.image = UIImage(named: String(quizlogic.getImageName() + 1))
        buttonOne.setTitle(quizlogic.getChoiceOne(), for: .normal)
        buttonTwo.setTitle(quizlogic.getChoiceTwo(), for: .normal)
        
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
    }

}

