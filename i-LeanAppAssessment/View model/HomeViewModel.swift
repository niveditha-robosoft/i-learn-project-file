//
//  HomeViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 17/12/22.
//

import Foundation


class HomeViewModel {
    
    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel
    static var objectOfViewModel = HomeViewModel()
    
    var objectOfHomeNetwork = HomeNetwork()
    
    var currentyStudyingData = [CurrentlyStudyingModel]()
    
    var userName = ""
    
    func callApiForCurrentStudyingDetails(tokenToSend: String, completion: @escaping((Bool) -> ())) {
        
        objectOfHomeNetwork.callCurrentyStudyingApi(token: tokenToSend){ responceData, responceStatus, responceError in
            
            self.currentyStudyingData.removeAll()
            
            DispatchQueue.main.async {
                if responceError == nil{
                    
                    if responceStatus == true{
                        
                        if let data0 = responceData {
                            
                            for i in data0{
                                
                                var percentage = 0
                                var imageIs = "https://img.freepik.com/free-vector/magnifying-glass-school-subjects_23-2147493132.jpg?w=2000"
                                
                                guard let data1 = i["chapterName"] as? String else{ print("1")
                                    completion(false)
                                    return}
                                guard let data2 = i["subjectName"] as? String else{ print("2")
                                    completion(false)
                                    return}
                                if let data3 = i["lessonPercentage"] as? Int {
                                    
                                    percentage = data3
                                    
                                    
                                }
                                if let data4 = i["subjectImage"] as? String {
                                    
                                    imageIs = data4
                                    
                                    
                                }
                                
                                guard let data55 = i["chapterId"] as? Int else{  completion(false)
                                    return
                                }
                                let current = CurrentlyStudyingModel(subjectName: data2, chapterName: data1, percentahge: percentage, subject_image: imageIs, chapterId: data55)
                             
                                self.currentyStudyingData.append(current)
                                
                            }
 
                        }

                        completion(true)
                        
                    }else{
                        
                        
                       completion(false)
                    }
  
                }else{
                    
                  completion(false)
                }
            }
 
        }
        
        
    }
    
    
    
    func getUserName(tokenTosend: String, completion: @escaping((Bool) -> ()))  {
        
        objectOfHomeNetwork.userNameFromApi(token: tokenTosend){ userData, userStatus, userError in
            
            DispatchQueue.main.async {
                if userError == nil{
                    
                    if userStatus == true{
                        
                        if let data1 = userData?["fullName"] as? String {
                            
                            self.userName = data1
                            
                            completion(true)
                        }
                        
                    }else{
                        
                        completion(false)
                        
                    }
                    
                    
                    
                }else{
                    
                    completion(false)
                }
            }
 
        }
        
    }
    
    
    
    func searchForSubject(subjectName: String, completion: @escaping((Bool,String?) -> ())) {
        
        
        objectOfHomeNetwork.getSearchSubjectName(subName: subjectName){ complitionData, completionCondition, completionError in
            
            DispatchQueue.main.async {
                if completionError == nil{
                    
                    if completionCondition == true{
                        
                        if let data1 = complitionData{
                            
                            var idIsIs = 0
                            var nameIs = ""
                            for i in data1{
                                
                                guard let data2 = i["subjectName"] as? String else{ completion(false,nil)
                                    return}
                                guard let data3 = i["subjectId"] as? Int else{ completion(false,nil)
                                    return }
                                
                                idIsIs = data3
                                nameIs = data2
                                
                                
                            }
                            
                            self.objectOfAboutSUbjectViewModel.callApiForSubjectdetails(subjectIdToSend: idIsIs){ completionStatus in
                                
                                if completionStatus == true{
                                    
                                    completion(true,nameIs)
                                    
                                }else{
                                    
                                    completion(false,nil)
                                }
                                
                                
                                
                            }
                            
                            
                    }
                        
                        
                    }else{
                        
                        completion(false,nil)
                        
                    }
                    
                }else{
                    
                    
                    
                }
            }
            
            
            
        }
        
        
    }
    
}
