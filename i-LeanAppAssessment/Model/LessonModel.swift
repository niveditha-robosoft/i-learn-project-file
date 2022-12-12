//
//  LessonModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import Foundation
class LessonModel {
    var unitId: Int
    var level: String
    var unitName: String
    var unitOverView: String
    
    init(unitId: Int,level: String, unitName: String, unitOverView: String ) {
        self.unitId = unitId
        self.level = level
        self.unitName = unitName
        self.unitOverView = unitOverView
    }
}
