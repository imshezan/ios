//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Nazmus Sakib on 9/3/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    init() { 
        //creating a quiz item
        let item = Question(text: "You are banned in Home..", correctAnswer: true)
        
        //append another quiz item
        list.append(item)
        
        //skipping one step and just creating the quiz item inside the append function
        list.append(Question(text: "Are you Mad?", correctAnswer: true))
        list.append(Question(text: "Are you Naughty?", correctAnswer: true))
        list.append(Question(text: "Are you kid?", correctAnswer: true))
        list.append(Question(text: "Are you adult?", correctAnswer: false))
        list.append(Question(text: "Are you human?", correctAnswer: false))
        
        
    }
}
