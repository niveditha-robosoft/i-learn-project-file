//
//  ResultModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 17/12/22.
//

import Foundation


class ResultModel {
    
    
    var subjectName: String
    var lessonNumber: String
    var lessonName: String
    var rightAnswreCount: Int
    var questionsAttempted: Int
    var totalPercentage: Int
    var totalQuestions: Int
    
    init(subjectName: String,lessonNumber: String,lessonName: String,rightAnswreCount: Int,questionsAttempted: Int,totalPercentage: Int,totalQuestions: Int) {
        
        self.subjectName = subjectName
        self.lessonNumber = lessonNumber
        self.lessonName = lessonName
        self.rightAnswreCount = rightAnswreCount
        self.questionsAttempted = questionsAttempted
        self.totalQuestions = totalQuestions
        self.totalPercentage = totalPercentage
    }
    

    
    
}
