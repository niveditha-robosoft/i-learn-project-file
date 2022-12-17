//
//  LessonDetailModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 16/12/22.
//

import Foundation
class LessonDetailModel{
    var pageNum : Int
    var pageTitle: String
    var unitImage: String
    var unitDescription: String
    var unitNum: Int
    init(pageNum: Int,pageTitle: String,unitImage: String,unitDescription: String,unitNum: Int) {
        self.pageNum = pageNum
        self.pageTitle = pageTitle
        self.unitImage = unitImage
        self.unitDescription = unitDescription
        self.unitNum = unitNum
    }
    
}
