//
//  LessonDetailViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 15/12/22.
//

import Foundation
class LessonDetailViewModel{
    static var objectOfLessonDetailViewModel = LessonDetailViewModel()
    var objOfLessonDetailNetwotk = LessonDetailNetwork()
    var lessonDetail = [LessonDetailModel]()
    var videoIs = ""
    var photoIs = ""
    func callForLessonDetail(URLString: String, tokenTOSend: String,completion: @escaping((Bool) -> ())){
        objOfLessonDetailNetwotk.apiCallForLessonDetails( urlIs: URLString, token: tokenTOSend){ dataIs, conditionIs ,errorIs in
            DispatchQueue.main.async {
                if(errorIs == nil){
                    
                    if conditionIs == true{
                    
                        if let data = dataIs {
                            guard let title = data["title"] as? String else { completion(false)
                                return
                            }
                            if  let photo = data["imageFile"] as? String {
                                self.photoIs = photo
                            }
                            if let video = data["videoFile"]  as? String{
                                self.videoIs = video
                                
                            }
                            guard let description = data["description"] as?  String else{ completion(false)
                                return
                            }
                            guard let pageNo = data["pageId"] as? Int else{ completion(false)
                                return
                            }
                            guard let unitNo = data["unitId"] as? Int else  { completion(false)
                                return
                            }
                            guard let likeStatus = data["liked"] as? String else{ completion(false)
                                return
                            }
                            print("")
                            print("photo is is : \(self.photoIs)")
                            print("video is is : \(self.videoIs)")
                            print("")
                            let lessonDetails = LessonDetailModel(pageNum: pageNo, pageTitle: title, unitImage: self.photoIs, unitDescription: description, unitNum: unitNo, unitVideo: self.videoIs, isLiked: likeStatus)
                            self.lessonDetail.append(lessonDetails)

                        }
                        completion(true)
                        
                    }else{
                        
                        completion(false)
                        
                    }
                    
                }
                else{
                    completion(false)
                }
            }

        }
      
}
    
    
    func likedLessonDetailsToSend(tokenToSend: String, unitIdToSend: Int, completion: @escaping((Bool) -> ())) {
        objOfLessonDetailNetwotk.likedUnitData(token: tokenToSend, unitId: unitIdToSend){ completionData, completionCondition, completionError in
            
            DispatchQueue.main.async {
                
                
                if completionError == nil{
                    
                    if completionCondition == true{
                        
                        if let data0 = completionData{
                         
                            var stringIs = ""
                            if let data1 = data0["message"] as? String{
                                
                                stringIs = data1
                                
                            }
                            
                            if stringIs == "unit added to liked list" {
                                
                                completion(true)
                                
                            }else{
                                
                                completion(false)
                            }
                            
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
