//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = Quizbrain()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quizBrain.getQuestionText()
        let progress = quizBrain.getProgress()
        progressBar.progress = progress
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let totalQstns = quizBrain.quiz.count
        let userAnswer = sender.currentTitle!

        let userAnswerFlag = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        
        if userAnswerFlag {
            sender.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in // Change `2.0` to the desired
                sender.backgroundColor = UIColor(red: 51/255, green: 59/255, blue: 90/255, alpha: 1)
                quizBrain.nextqstn()
                let progress = quizBrain.getProgress()
                progressBar.progress = progress
                self.questionLabel.text = quizBrain.getQuestionText()
                
//                if self.qstnNumber+1 <= quiz.count-1{
//                    self.qstnNumber += 1
//                    self.questionLabel.text = self.quiz[self.qstnNumber].text
//                }
//                else{
//                    self.qstnNumber = 0
//                    questionLabel.text = quiz[self.qstnNumber].text
//                    print("THE END")
//                }
                
            }
        }
        else{
            sender.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in // Change `2.0` to the desired number of seconds.
                // Code you want to be delayed
                sender.backgroundColor = UIColor(red: 51/255, green: 59/255, blue: 90/255, alpha: 1)
            }
            
            
        }
        
        
        
    }
    
}
