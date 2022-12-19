//
//  HomeViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 17/12/22.
//

import Foundation


class HomeViewModel {
    
    static var objectOfViewModel = HomeViewModel()
    
    var objectOfHomeNetwork = HomeNetwork()
    
    var currentyStudyingData = [CurrentlyStudyingModel]()
    
    var userName = ""
    
    func callApiForCurrentStudyingDetails(tokenToSend: String, completion: @escaping((Bool) -> ())) {
        
        objectOfHomeNetwork.callCurrentyStudyingApi(token: tokenToSend){ responceData, responceStatus, responceError in
            
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
    
}
