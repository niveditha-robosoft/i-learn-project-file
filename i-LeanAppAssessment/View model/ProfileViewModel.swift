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
                    print("1")
                    if boolCondition == true{
                        print("2")
                        print("3")
                            guard let dataId = data["profileId"] as? Int64 else{ print("11") ; return}
                            guard let dataEmail = data["source"] as? String else{ print("12"); return}
                            guard let dataName = data["name"] as? String else{ print("13"); return}
        //                    guard let dataImage = data["profileImage"] as? Int else{ return}
                            guard let dataChapterCompleted = data["chapterCompleted"] as? Int else{ return}
                            print(data["averageTestScore"] as Any)
                            guard let dataAverageTestScore = data["averageTestScore"] as? Int else{ print("14"); return}
                            print(data["highestTestScore"] as Any)
                            guard let dataHighestTestScore = data["highestTestScore"] as? Int else{ print("15"); return}
                            
                            print("Id : \(dataId)\nEmail : \(dataEmail)\nName : \(dataName)\nchap : \(00)\nAvg : \(00)\nHigh : \(00)")
                            
                            let pro = ProfileModel(id: Int64(Int(dataId)), email: dataEmail, name: dataName, chapter: dataChapterCompleted, average: dataAverageTestScore, highest: dataHighestTestScore)
                            
                            self.profileData.append(pro)
                            
                            complition(true)
                            print("4")
                        
                        
                    }else{
                        
                        complition(false)
                        print("5")
                    }
                    
                }else{
                    
                    
                }
            }
 
        }
        
    }
    
    
    
}
