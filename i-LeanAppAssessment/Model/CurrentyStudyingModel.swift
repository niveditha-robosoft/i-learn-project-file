//
//  CurrentyStudyingModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 17/12/22.
//

import Foundation

class CurrentlyStudyingModel {
    
    var subjectName: String
    var chapterName: String
    var percentahge: Int
    var subject_image: String
    
    init(subjectName: String,chapterName: String,percentahge: Int,subject_image: String) {
        self.subjectName = subjectName
        self.chapterName = chapterName
        self.percentahge = percentahge
        self.subject_image = subject_image
    }
    
    
}
