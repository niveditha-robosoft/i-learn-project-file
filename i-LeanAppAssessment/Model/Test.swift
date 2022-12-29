//
//  Test.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 22/12/22.
//

import Foundation
class Test {
    var testId: Int
    var testName: String
    var lessonName: String
    var duration: Int
    var totalQuestions: Int
    var level: String
    var marks: Int
    init(testId: Int, testName: String, lessonName: String, duration: Int, totalQuestions: Int, level: String, marks: Int) {
        self.testId = testId
        self.testName = testName
        self.lessonName = lessonName
        self.duration = duration
        self.totalQuestions = totalQuestions
        self.level = level
        self.marks = marks
    }
}
