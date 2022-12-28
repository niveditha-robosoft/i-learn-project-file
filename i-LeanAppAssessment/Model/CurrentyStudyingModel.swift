//
//  CurrentyStudyingModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 17/12/22.
//

import Foundation

class CurrentlyStudyingModel {
    
    var subjectId: Int
    var subjectName: String
    var chapterName: String
    var percentahge: Int
    var subject_image: String
    var chapterId: Int
    
    
    
    init(subjectName: String,chapterName: String,percentahge: Int,subject_image: String,chapterId: Int,subjectId: Int) {
        self.subjectName = subjectName
        self.chapterName = chapterName
        self.percentahge = percentahge
        self.subject_image = subject_image
        self.chapterId = chapterId
        self.subjectId = subjectId
    }
    
    
}
