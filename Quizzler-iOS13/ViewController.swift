//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IB Outlets
    @IBOutlet weak var stackViewOutlet: UIStackView!
    @IBOutlet weak var questionLabelOutlet: UILabel!
    @IBOutlet weak var trueButtonOutlet: UIButton!
    @IBOutlet weak var falseButtonOutlet: UIButton!
    @IBOutlet weak var progressBarOutlet: UIProgressView!
    
    //IB Actions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let response = sender.currentTitle!
        let responseBolean = stringToBoolean(response)
        print("answer:\(response) - \(responseBolean)")
    }
    
    //Functions
    func changeQuestion(){
        questionLabelOutlet.text = "Does Tony stark the best avenger?"
    }
    
    func stringToBoolean(_ val : String) -> Bool{
        if(val == "True" || val == "true"){
            return true
        }else{
            return false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("on viewDidLoad")
        changeQuestion()
    }


}

