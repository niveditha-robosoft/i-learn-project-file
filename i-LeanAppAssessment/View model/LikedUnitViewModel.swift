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
            
            self.lokedUnitDetails.removeAll()
            
            print("data count : \(self.lokedUnitDetails.count)")
            
            DispatchQueue.main.async {
                
                if completionError == nil{
                    
                    if completionStatus == true{
                        
                        if let data = completionData{
                            
                            for i in data {
                                
                                guard let data1 = i["subjectName"] as? String else{ completion(false)
                                    return}
                                guard let data2 = i["lessonName"] as? String else{ completion(false)
                                    return}
                                guard let data3 = i["unitName"] as? String else{ completion(false)
                                    return}
//                                guard let data4 = i["unitOverView"] as? String else{ print("like 4")
//                                    return}
                                guard let data4 = i["lessonId"] as? Int else{ completion(false)
                                    return
                                    
                                }
                                guard let data5 = i["lessonNumber"] as? String else{ completion(false)
                                    return
                                }
                                guard let data6 = i["unitId"] as? Int else { completion(false)
                                    return
                                }
                                
                                guard let likedPageId = i["pageId"] as? Int else {
                                    
                                    completion(false)
                                    
                                    return
                                }
                                let unit = LikedUnitModel(subjectName: data1, lessonName: data2, unitName: data3, unitOverView: "data4", lessonId: data4, lessonNumber: data5, unitId:data6, likedPageId: likedPageId)
                                
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
