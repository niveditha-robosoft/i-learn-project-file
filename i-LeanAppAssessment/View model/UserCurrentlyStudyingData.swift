//
//  UserCurrentlyStudyingData.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 27/12/22.
//

import Foundation

class UserCurrentlyStudyingDataViewMOdel {
    
    static var objectOfViewModel = UserCurrentlyStudyingDataViewMOdel()
    
    var objectOfSendUserDataNetworkmanager = SendUserDataNetworkmanager()
    
    var studying = [CurrentlyStudyingData]()
    
    func sendUserdata(token: String,userId: Int,subjectId: Int,chapterId: Int,lessonId: Int,unitId: Int, completion: @escaping((Bool) -> ())) {
        
        objectOfSendUserDataNetworkmanager.sendUserDataToApi(token: token, userId: userId, subjectId: subjectId, chapterId: chapterId, lessonId: lessonId, unitId: unitId){ completionStatus, completionError in
            
            if completionError == nil{
                
                if let dataIs = completionStatus as? Bool{
                    
                    if dataIs == true{
                        
                        completion(true)
                        
                    }else{
                        
                        completion(false)
                        
                    }
                }
                
            }
            
            
        }
    }
    
    
}
