//
//  LikedUnitModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 24/12/22.
//

import Foundation

class LikedUnitModel {
    
    var lessonNumber: String
    var subjectName: String
    var lessonName: String
    var unitName: String
    var unitOverView: String
    var lessonId: Int
    var unitId: Int
    init(subjectName: String,lessonName: String,unitName: String,unitOverView: String,lessonId: Int,lessonNumber: String,unitId: Int) {
        self.subjectName = subjectName
        self.lessonName = lessonName
        self.unitName = unitName
        self.unitOverView = unitOverView
        self.lessonId = lessonId
        self.lessonNumber = lessonNumber
        self.unitId = unitId
    }
}
