//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Катя Катигариди on 06.07.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String;
    let options: [String];
    let answer: String;
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q;
        options = a.shuffled();
        answer = correctAnswer;
    }
}
