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
                        
                        
                        
                        
                            guard let dataId = data["profileId"] as? Int64 else{ complition(false)
                                return}
                            guard let dataEmail = data["source"] as? String else{ complition(false)
                                return}
                            guard let dataName = data["name"] as? String else{ complition(false)
                                return}
                            guard let dataImage = data["profileImage"] as? String else{ complition(false)
                                return}
                            guard let dataChapterCompleted = data["chapterCompleted"] as? Int else{complition(false)
                                return}
                            guard let dataAverageTestScore = data["averageTestScore"] as? Int else{ complition(false)
                                return}
                            guard let dataHighestTestScore = data["highestTestScore"] as? Int else{complition(false)
                                return}
                            
                            
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
