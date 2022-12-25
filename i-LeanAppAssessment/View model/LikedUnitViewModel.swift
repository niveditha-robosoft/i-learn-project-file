//
//  LikedUnitViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 24/12/22.
//

import Foundation


class LikedUnitViewMOdel {
    
    static var objectOfViewMOdel = LikedUnitViewMOdel()
    
    var obejctOfLikedInitApiManager = LikedInitApiManager()
    
    var lokedUnitDetails = [LikedUnitModel]()
    
    
    func likedUnitsData(tokenToSend: String, completion: @escaping((Bool) -> ())) {
        obejctOfLikedInitApiManager.likedUnitApi(token: tokenToSend){ completionData, completionStatus, completionError in
            DispatchQueue.main.async {
                
                if completionError == nil{
                    
                    if completionStatus == true{
                        
                        if let data = completionData{
                            
                            for i in data {
                                
                                guard let data1 = i["subjectName"] as? String else{ return}
                                guard let data2 = i["lessonName"] as? String else{ return}
                                guard let data3 = i["unitName"] as? String else{ return}
                                guard let data4 = i["unitOverView"] as? String else{ return}
                                
                                
                                let unit = LikedUnitModel(subjectName: data1, lessonName: data2, unitName: data3, unitOverView: data4)
                                
                                self.lokedUnitDetails.append(unit)
                                
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
    
    
}