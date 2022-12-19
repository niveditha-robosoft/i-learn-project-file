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
    
    
    func getResultDetails(tokenToSend: String, completion: @escaping((Bool) -> ())) {
        
        objectOfProfileNetwork.getUserResultDetailsFromApi(token: tokenToSend){responceData, responceStatus, responceError in
            self.resultData.removeAll()
            if responceError == nil{

                if responceStatus == true{

                    if let dataIs = responceData{
                        

                        for i in dataIs{
                            

                            guard let data1 = i["subjectName"] as? String else{
                                return}
                            guard let data2 = i["lessonNumber"] as? String else{
                                return}
                            guard let data3 = i["testName"] as? String else{
                                return}
                            guard let data4 = i["rightAnswerCount"] as? Int else{
                                return}
                            guard let data5 = i["questionsAttempted"] as? Int else{
                                return}
                            guard let data6 = i["totalQuestions"] as? Int else{
                                return}
                            guard let data7 = i["percentage"] as? Int else{
                                return}
                            guard (i["testId"] as? Int) != nil else{ 
                                return}

                            print("16")

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
 
}
