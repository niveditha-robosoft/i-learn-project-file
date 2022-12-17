//
//  ProfileViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 15/12/22.
//

import Foundation


class ProfileViewMOdel {
    
    var objectOfProfileNetwork = ProfileNetwork()

    var profileData = [ProfileModel]()
    
    static var objectOfViewMOdel = ProfileViewMOdel()
    
    func callApiForUSerProfileData(tokenToSend: String, complition: @escaping((Bool) -> ())) {
        
        objectOfProfileNetwork.callProfileApi(taken: tokenToSend){ data, boolCondition, error in
            
            DispatchQueue.main.async {
                
                if error == nil{
                    if boolCondition == true{
                        
                            guard let dataId = data["profileId"] as? Int64 else{  return}
                            guard let dataEmail = data["source"] as? String else{  return}
                            guard let dataName = data["name"] as? String else{  return}
                            guard let dataImage = data["profileImage"] as? String else{ return}
                            guard let dataChapterCompleted = data["chapterCompleted"] as? Int else{ return}
                            guard let dataAverageTestScore = data["averageTestScore"] as? Int else{  return}
                            guard let dataHighestTestScore = data["highestTestScore"] as? Int else{ return}
                            
                            
                        let pro = ProfileModel(id: Int64(Int(dataId)), email: dataEmail, name: dataName, chapter: dataChapterCompleted, average: dataAverageTestScore, highest: dataHighestTestScore, profileIMage: dataImage)
                            
                            self.profileData.append(pro)
                            
                            complition(true)
                        
                        
                    }else{
                        
                        complition(false)
                    }
                    
                }else{
                    
                    
                }
            }
 
        }
        
    }
    
    
    
}
