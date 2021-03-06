//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var questionNumber = 0 // ARBITRARY INITAL VALUE
    var score = 0 // ARBITRARY INITAL VALUE
    
    let quizArray = [ // TWO DIMENSIONAL ARRAY
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]

//    let quizArray = [ // TWO DIMENSIONAL ARRAY <--- BETTER TO USE A STRUCT
//    ["A slug's blood is green.", "True"],
//    ["Approximately one quarter of human bones are in the feet.", "True"],
//    ["The total surface area of two human lungs is approximately 70 square metres.", "True"],
//    ]
    
    func updateProgressBar () {
        progressBar.progress = Float(questionNumber) / Float(quizArray.count)
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quizArray[questionNumber].answer
        
        if questionNumber < (quizArray.count - 1) {
            self.questionNumber += 1
            updateProgressBar()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.questionLabel.text = self.quizArray[self.questionNumber].text
            }
            
            if userAnswer == actualAnswer {
                questionLabel.text = "✅"
                score += 1
                scoreLabel.text = String("Score: \(score) / 12")
                
            } else {
                questionLabel.text = "❌"
            }
            
        } else if questionNumber == (quizArray.count - 1) && questionLabel.text != "End of Quiz" {
            if userAnswer == actualAnswer {
                questionLabel.text = "✅"
                score += 1
                scoreLabel.text = String("Score: \(score) / 12")
            } else {
                questionLabel.text = "❌"
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.progressBar.progress = Float(1)
                print("No more questions")
                self.questionLabel.text = "End of Quiz"
            }
        }
        
    }
    

    @IBAction func resetPressed(_ sender: UIButton) {
        questionNumber = 0
        score = 0
        scoreLabel.text = String("Score: \(score) / 12")
        questionLabel.text = quizArray[questionNumber].text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizArray[questionNumber].text
        scoreLabel.text = String("Score: \(score) / 12")
        progressBar.progress = Float(0)
        
    }


}

