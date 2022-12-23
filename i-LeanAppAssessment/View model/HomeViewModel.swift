//
//  HomeViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 17/12/22.
//

import Foundation


class HomeViewModel {
    
    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfViewmodel
    
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
                                
                                guard let data1 = i["chapterName"] as? String else{ return}
                                guard let data2 = i["subjectName"] as? String else{ return}
                                guard let data3 = i["percentage"] as? Int else{ return}

                                let current = CurrentlyStudyingModel(subjectName: data2, chapterName: data1, percentahge: data3)
                                
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
                                
                                guard let data2 = i["subjectName"] as? String else{ print("1100")
                                    return}
                                guard let data3 = i["subjectId"] as? Int else{ print("2200")
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
