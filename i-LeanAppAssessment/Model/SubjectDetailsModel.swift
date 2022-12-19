//
//  SubjectDetailsModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 13/12/22.
//

import Foundation

class SubjectDetailsModel {
    
    
    var chapterImage: String
    var chapterName: String
    var chapterId: Int
    
    init(chapterName: String,chapterId: Int,chapterImage: String) {
        self.chapterName = chapterName
        self.chapterId = chapterId
        self.chapterImage = chapterImage
    }
    
}
