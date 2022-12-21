//
//  classModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 10/12/22.
//

import Foundation
class SubjectListModel{
    var subjectName: String
    var subjectId: Int
    var subjectImage: String
    init(subjectName:String,subjectId: Int,subjectImage: String) {
        self.subjectName = subjectName
        self.subjectId = subjectId
        self.subjectImage = subjectImage
    }
}
