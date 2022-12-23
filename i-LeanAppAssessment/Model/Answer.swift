//
//  Answer.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 22/12/22.
//

import Foundation
class Answer{
    var testId: Int
    var lessonId: Int
    var questionId: Int
    var givenAnswer: String
    
    init(testId: Int, lessonId: Int, questionId: Int, givenAnswer: String) {
        self.testId = testId
        self.lessonId = lessonId
        self.questionId = questionId
        self.givenAnswer = givenAnswer
    }
}
