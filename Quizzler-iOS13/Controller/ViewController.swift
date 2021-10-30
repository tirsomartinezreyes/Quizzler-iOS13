//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quizzler = Quiz()
    
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
        let isRightAnswer = quizzler.checkAnswer(responseBolean)
        
        let originalColor = sender.titleColor(for: .normal)
        trueButtonOutlet.isEnabled = false
        falseButtonOutlet.isEnabled = false
        
        if isRightAnswer {
            sender.setTitleColor(UIColor.green, for: .normal)
        }else{
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
        let isNextQuestion = quizzler.changeQuestion()
        
        if isNextQuestion {
            questionLabelOutlet.text = quizzler.currentQuestion?.q
        } else {
            finishedQuiz()
        }
        progressBarOutlet.setProgress(quizzler.percentage, animated: true)
         
    }
    
    func stringToBoolean(_ val : String) -> Bool{
        if(val == "True" || val == "true"){
            return true
        }else{
            return false
        }
    }
    
    func finishedQuiz(){
        questionLabelOutlet.text = "Done, \(String(quizzler.rightAnswersCounter)) of \(String(quizzler.numQuestions)) right!"
        trueButtonOutlet.alpha = 0.0
        falseButtonOutlet.alpha = 0.0
        restartButtonOutlet.alpha = 1.0
    }
    
    func initialize(){
        quizzler.initialize()
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
