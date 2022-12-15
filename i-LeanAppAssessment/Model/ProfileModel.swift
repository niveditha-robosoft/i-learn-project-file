//
//  ProfileModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 15/12/22.
//

import Foundation

class ProfileModel {
    
    var id: Int64
    var email: String
    var name: String
    var chapter: Int
    var average: Int
    var highest: Int
    
    init(id: Int64,email: String,name: String,chapter: Int,average: Int,highest: Int) {
        self.id = id
        self.email = email
        self.name = name
        self.chapter = chapter
        self.average = average
        self.highest = highest
    }
    
}
