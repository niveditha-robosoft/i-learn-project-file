//
//  UnitModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 13/12/22.
//

import Foundation


class UnitModel {
    
    var unitId: Int
    var unitName: String
    var unitOverview: String
    var level: String
    var totalPages: Int
    var completeStatus: Bool
    init(unitId: Int,unitName: String,unitOverview: String,level: String,totalPages: Int,completeStatus: Bool) {
        
        self.unitId = unitId
        self.unitName = unitName
        self.unitOverview = unitOverview
        self .level = level
        self.totalPages = totalPages
        self.completeStatus = completeStatus
    }
}
