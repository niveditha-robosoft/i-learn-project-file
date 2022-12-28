//
//  LikedUnitDetailViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 28/12/22.
//

import Foundation


class LikedUnitDetailViewModel {
    
    var objectOfLikedUnitDetailNetworkManager = LikedUnitDetailNetworkManager()
    
    static var obkectOfViewModel = LikedUnitDetailViewModel()
    
    var likedUnitdata = [LikedUnitDataModel]()
    
    func likedUnitDetails(tokenIs:String, chapterIdIs: Int, completion: @escaping((Bool) -> ())) {
        objectOfLikedUnitDetailNetworkManager.getLikedUnitDetails(token: tokenIs, chapterId: chapterIdIs){ responceData, responceStatus, responceError in
            
            self.likedUnitdata.removeAll()
            
            DispatchQueue.main.async {
                if responceError == nil{
                    
                    if responceStatus == true{
                        
                        if let data0 = responceData{
                            
                            for i in data0{
                                
                                guard let data1 = i["unitId"] as? Int else{ completion(false)
                                    return
                                }
                                guard let data2 = i["level"] as? String else{ completion(false)
                                    return
                                }
                                guard let data3 = i["unitName"] as? String else{ completion(false)
                                    return
                                }
                                guard let data4 = i["unitOverview"] as? String else{ completion(false)
                                    return
                                }
                                
                                let liked = LikedUnitDataModel(unitId: data1, level: data2, unitName: data3, unitOverview: data4)
                                
                                
                                self.likedUnitdata.append(liked)

                                
                            }
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
