//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //variables
    var questions:[[Any]] = []
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
        if currentAnswer == responseBolean{
            print("Correct answer")
            rightAnswersCounter += 1
        }else{
            print("Wrong answer")
        }
        changeQuestion()
    }
    
    @IBAction func resetButtonPresses(_ sender: UIButton) {
        initialize()
    }
    
    
    //Functions
    func changeQuestion(){
        let question = questions.popLast()
        let percentage =  (1.0 - Float(questions.count) / Float(numQuestions))
        
        if question != nil {
            let label = question![0] as? String
            let value = question![1] as? Bool
            currentAnswer = value!
            questionLabelOutlet.text = label
        } else {
            questionLabelOutlet.text = "Done, \(String(rightAnswersCounter)) of \(String(numQuestions)) right!"
            trueButtonOutlet.alpha = 0.0
            falseButtonOutlet.alpha = 0.0
            restartButtonOutlet.alpha = 1.0
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
    
    func initialize(){
        questions = [
            ["Question 1", true],
            ["Question 2", true],
            ["Question 3", true],
            ["Question 4", true],
            ["Question 5", true]
        ]
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

