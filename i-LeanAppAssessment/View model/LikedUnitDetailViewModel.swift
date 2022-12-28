//
//  LikedUnitDetailViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 28/12/22.
//

import Foundation


class LikedUnitDetailViewModel {
    
    var objectOfLikedUnitDetailNetworkManager = LikedUnitDetailNetworkManager()
    
    static var obkectOfViewModel = LikedUnitDetailViewModel()
    
    func likedUnitDetails(tokenIs:String, chapterIdIs: Int) {
        objectOfLikedUnitDetailNetworkManager.getLikedUnitDetails(token: tokenIs, chapterId: chapterIdIs){ responceData, responceStatus, responceError in
            
            
        }
    }
}
