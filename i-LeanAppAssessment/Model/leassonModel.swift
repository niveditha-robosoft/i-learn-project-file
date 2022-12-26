//
//  leassonModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 13/12/22.
//

import Foundation

class lessonModel {
    
    var unitDetails = [UnitModel]()
   // var testDetails = [Test]()

    
    var lessonId: Int
    var lessonNumber: String
    var lessonName: String
    var noOfUnits: Int
    var level: String
    var percentage: Int
    
    init(lessonId: Int,lessonNumber: String,lessonName: String,noOfUnits: Int,level: String,percentage: Int) {
        self.lessonId = lessonId
        self.lessonNumber = lessonNumber
        self.lessonName = lessonName
        self.noOfUnits = noOfUnits
        self.level = level
        self.percentage = percentage
    }
    
}
