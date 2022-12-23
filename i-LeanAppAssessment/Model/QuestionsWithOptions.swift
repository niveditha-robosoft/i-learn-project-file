//
//  QuestionsWithOptions.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 22/12/22.
//

import Foundation
class QuestionsWithOptions {
    var questionName: String
    var questionId: Int
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    
    
    init(questionName: String, questionId: Int, option1: String, option2: String, option3: String, option4: String) {
        self.questionId = questionId
        self.questionName = questionName
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
    }
    
}
