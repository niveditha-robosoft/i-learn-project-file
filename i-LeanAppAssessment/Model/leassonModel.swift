//
//  leassonModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 13/12/22.
//

import Foundation

class lessonModel {
    
    var unitDetails = [UnitModel]()

    
    var lessonId: Int
    var lessonNumber: String
    var lessonName: String
    var noOfUnits: Int
    var level: String
    
    
    init(lessonId: Int,lessonNumber: String,lessonName: String,noOfUnits: Int,level: String) {
        self.lessonId = lessonId
        self.lessonNumber = lessonNumber
        self.lessonName = lessonName
        self.noOfUnits = noOfUnits
        self.level = level
    }
    
}
