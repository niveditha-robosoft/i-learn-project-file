//
//  CurrentlyStudyingData.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 27/12/22.
//

import Foundation

class CurrentlyStudyingData {
    
    var subjectName: String
    var chapterName: String
    var lessonName: String
    var unitName: String
    
    init(subjectName: String,chapterName: String,lessonName: String,unitName: String) {
        
        self.subjectName = subjectName
        self.chapterName = chapterName
        self.lessonName = lessonName
        self.unitName = unitName
    }
    
}
