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
    @IBOutlet weak var topButton: UIButton!
    
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    
    @objc func updateQuestion(){
        questionLabel.text = quizBrain.getQuestionText()
        setOptionLabels()
        
        topButton.backgroundColor = UIColor.clear
        middleButton.backgroundColor = UIColor.clear
        bottomButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score \(quizBrain.getScore())"
        
    }
    
    func setOptionLabels(){
//        print("Обновлены кнопки с ответами")
        topButton.setTitle(quizBrain.getOptions()[0], for: .normal)
        middleButton.setTitle(quizBrain.getOptions()[1], for: .normal)
        bottomButton.setTitle(quizBrain.getOptions()[2], for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        
        let userAnswer = sender.currentTitle! // "True" or "False"
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    }
    
}

