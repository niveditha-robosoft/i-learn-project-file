//
//  LikedUnitModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 24/12/22.
//

import Foundation

class LikedUnitModel {
    
    var subjectName: String
    var lessonName: String
    var unitName: String
    var unitOverView: String
    var chapterId: Int
    
    init(subjectName: String,lessonName: String,unitName: String,unitOverView: String,chapterId: Int) {
        self.subjectName = subjectName
        self.lessonName = lessonName
        self.unitName = unitName
        self.unitOverView = unitOverView
        self.chapterId = chapterId
        
    }
}
