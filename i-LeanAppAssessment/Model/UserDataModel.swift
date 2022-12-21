//
//  UserDataModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 16/12/22.
//

import Foundation


class UserDataModel {
    
    var userName: String
    var userId: Int
    var token: String
    
    init(userName: String,userId: Int,token: String) {
        self.userName = userName
        self.userId = userId
        self.token = token
    }
    
    
}
