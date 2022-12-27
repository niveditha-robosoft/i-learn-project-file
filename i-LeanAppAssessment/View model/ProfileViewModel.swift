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
    
    
    var resultData = [ResultModel]()
    
    func callApiForUSerProfileData(tokenToSend: String, complition: @escaping((Bool) -> ())) {
        
        objectOfProfileNetwork.callProfileApi(taken: tokenToSend){ data, boolCondition, error in
            
            DispatchQueue.main.async {
                
                if error == nil{
                    if boolCondition == true{
                        
                        var imageIs = "https://qph.cf2.quoracdn.net/main-qimg-2b21b9dd05c757fe30231fac65b504dd"
                        var comp = 00
                        var avg = 00
                        var high = 00
                        
                            guard let dataId = data["profileId"] as? Int64 else{ complition(false)
                                return}
                            guard let dataEmail = data["source"] as? String else{ complition(false)
                                return}
                            guard let dataName = data["name"] as? String else{ complition(false)
                                return}
                        if let dataImage = data["profileImage"] as? String{
                            
                            imageIs = dataImage
                        }
                        
                        if let dataChapterCompleted = data["chapterCompleted"] as? Int {
                            
                            comp = dataChapterCompleted
                            
                        }
                        
                            if let dataAverageTestScore = data["averageTestScore"] as? Int {
                                
                                avg = dataAverageTestScore
                                
                                }
                            if let dataHighestTestScore = data["highestTestScore"] as? Int {
                                
                                high = dataHighestTestScore
                            }
                            
                            
                        let pro = ProfileModel(id: Int64(Int(dataId)), email: dataEmail, name: dataName, chapter: comp, average: avg, highest: high, profileIMage: imageIs)
                            
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
    
    
    func getResultDetails(tokenToSend: String, completion: @escaping((Bool) -> ())) {
        
        objectOfProfileNetwork.getUserResultDetailsFromApi(token: tokenToSend){responceData, responceStatus, responceError in
            self.resultData.removeAll()
            if responceError == nil{

                if responceStatus == true{

                    if let dataIs = responceData{
                        

                        for i in dataIs{
                            

                            guard let data1 = i["subjectName"] as? String else{ completion(false)
                                return}
                            guard let data2 = i["lessonNumber"] as? String else{ completion(false)
                                return}
                            guard let data3 = i["testName"] as? String else{ completion(false)
                                return}
                            guard let data4 = i["rightAnswerCount"] as? Int else{ completion(false)
                                return}
                            guard let data5 = i["questionsAttempted"] as? Int else{ completion(false)
                                return}
                            guard let data6 = i["totalQuestions"] as? Int else{ completion(false)
                                return}
                            guard let data7 = i["percentage"] as? Int else{ completion(false)
                                return}
                            guard (i["testId"] as? Int) != nil else{ completion(false)
                                return}

                            let result = ResultModel(subjectName: data1, lessonNumber: data2, lessonName: data3, rightAnswreCount: data4, questionsAttempted: data5, totalPercentage: data7, totalQuestions: data6)
                            
                            self.resultData.append(result)
                        }
   
                    }

                    completion(true)
                    
                }else{
                    
                    completion(false)
                }
  
            }else{
 
            }
  
        }
        
    }
 
    
    func signOutApiCall(tokenToSend: String, completion: @escaping((Bool) -> ())) {
        
        objectOfProfileNetwork.callSignOutApi(token: tokenToSend){ completionStatus, completionerror in
            
            if completionerror == nil{
                
                if completionStatus == true{
                    
                    completion(true)
                }else{
                    
                   completion(false)
                }
            }
            
        }
        
    }
    
    
    
}
