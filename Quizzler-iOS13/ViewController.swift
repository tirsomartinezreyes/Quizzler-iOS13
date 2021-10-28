//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Structures
    struct Question {
        let q: String
        let a: Bool
        
        init(q: String, a: Bool){
            self.q = q
            self.a = a
        }
    }
    
    
    //variables
    var originalQuestions = [
        Question(q: "A slug's blood is green.", a: true),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: true),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: true),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: true),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: false),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: true),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: false),
        Question(q: "Google was originally called 'Backrub'.", a: true),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: true),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: false),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: false),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: true)
    ]
    
    var questions:[Question] = []
    var currentQuestion:Question? = nil
    var numQuestions = 0
    var currentAnswer = true
    var rightAnswersCounter = 0
    
    //IB Outlets
    @IBOutlet weak var stackViewOutlet: UIStackView!
    @IBOutlet weak var questionLabelOutlet: UILabel!
    @IBOutlet weak var trueButtonOutlet: UIButton!
    @IBOutlet weak var falseButtonOutlet: UIButton!
    @IBOutlet weak var progressBarOutlet: UIProgressView!
    @IBOutlet weak var restartButtonOutlet: UIButton!
    
    //IB Actions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let response = sender.currentTitle!
        let responseBolean = stringToBoolean(response)
        let rightAnswer = currentQuestion?.a
        
        let originalColor = sender.titleColor(for: .normal)
        trueButtonOutlet.isEnabled = false
        falseButtonOutlet.isEnabled = false
        
        if rightAnswer == responseBolean {
            print("Correct answer")
            rightAnswersCounter += 1
            sender.setTitleColor(UIColor.green, for: .normal)
        }else{
            print("Wrong answer")
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ){
            sender.setTitleColor(originalColor, for: .normal)
            self.trueButtonOutlet.isEnabled = true
            self.falseButtonOutlet.isEnabled = true
            self.changeQuestion()
        }
    }
    
    @IBAction func resetButtonPresses(_ sender: UIButton) {
        initialize()
    }
    
    
    //Functions
    func changeQuestion(){
        
        
        currentQuestion = questions.popLast()
        let percentage =  (1.0 - Float(questions.count) / Float(numQuestions))
        
        if currentQuestion != nil {
            questionLabelOutlet.text = currentQuestion?.q
        } else {
            finishedQuiz()
        }
        progressBarOutlet.setProgress(percentage, animated: true)
         
    }
    
    func stringToBoolean(_ val : String) -> Bool{
        if(val == "True" || val == "true"){
            return true
        }else{
            return false
        }
    }
    
    func finishedQuiz(){
        questionLabelOutlet.text = "Done, \(String(rightAnswersCounter)) of \(String(numQuestions)) right!"
        trueButtonOutlet.alpha = 0.0
        falseButtonOutlet.alpha = 0.0
        restartButtonOutlet.alpha = 1.0
    }
    
    func initialize(){
        questions = originalQuestions
        numQuestions = questions.count
        rightAnswersCounter = 0
        
        questionLabelOutlet.text = " "
        trueButtonOutlet.alpha = 1.0
        falseButtonOutlet.alpha = 1.0
        restartButtonOutlet.alpha = 0.0
        changeQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("on viewDidLoad")
        initialize()
    }


}
