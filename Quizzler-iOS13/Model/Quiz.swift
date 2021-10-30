//
//  Main.swift
//  Quizzler
//
//  Created by Tirso Martínez on 29/10/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Quiz {
    
    //Structures
    struct Question {
        let q: String
        let a: Bool
        
        init(q: String, a: Bool){
            self.q = q
            self.a = a
        }
    }
    
    //Variables
    let originalQuestions = [
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
    var percentage:Float = 0.0
    
    //Methods
    mutating func checkAnswer(_ answer:Bool) -> Bool{
        if answer == currentQuestion?.a {
            print("Correct answer")
            self.rightAnswersCounter += 1
            return true
        }else{
            print("Wrong answer")
            return false
        }
    }
    
    mutating func initialize(){
        self.questions = self.originalQuestions
        self.numQuestions = self.questions.count
        self.rightAnswersCounter = 0
    }
    
    mutating func changeQuestion() -> Bool{
        self.currentQuestion = self.questions.popLast()
        self.percentage = Float((1.0 - Float(self.questions.count) / Float(self.numQuestions)))
        
        if currentQuestion != nil{
            return true
        }else{
            return false
        }
    }
    
    func getScore() -> String{
        return "Score: \(rightAnswersCounter)"
    }
    
    init(){
        self.initialize()
    }
    
    
}
