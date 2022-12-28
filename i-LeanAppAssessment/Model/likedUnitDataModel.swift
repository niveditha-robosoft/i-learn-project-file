//
//  likedUnitDataModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 28/12/22.
//

import Foundation

class LikedUnitDataModel {
    
    var unitId: Int
    var level: String
    var unitName: String
    var unitOverview: String
    
    init(unitId: Int,level: String,unitName: String,unitOverview: String) {
        self.unitId = unitId
        self.level = level
        self.unitName = unitName
        self.unitOverview = unitOverview
    }
    
}
