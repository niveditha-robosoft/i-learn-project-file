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
        objOfLessonDetailNetwotk.apiCallForLessonDetails( urlIs: URLString, token: tokenTOSend){ dataIs ,errorIs in
            
            self.lessonDetail.removeAll()
            DispatchQueue.main.async {
                if(errorIs == nil){
                    if let data = dataIs as? [String: Any] {
                        guard let title = dataIs["title"] as? String else { print("1")
                            return
                        }
                        if  let photo = dataIs["imageFile"] as? String {
                            self.photoIs = photo
                        }
                        if let video = dataIs["videoFile"]  as? String{
                            self.videoIs = video
                            
                        }
                        guard let description = dataIs["description"] as?  String else{
                            return
                        }
                        guard let pageNo = dataIs["pageId"] as? Int else{
                            return
                        }
                        guard let unitNo = dataIs["unitId"] as? Int else  {
                            return
                        }
//                        print("data of ",title,photo,description,pageNo,unitNo)
                        
                        print("")
                        print("photo is is : \(self.photoIs)")
                        print("video is is : \(self.videoIs)")
                        print("")

                        let lessonDetails = LessonDetailModel(pageNum: pageNo, pageTitle: title, unitImage: self.photoIs, unitDescription: description, unitNum: unitNo, unitVideo: self.videoIs)
                        self.lessonDetail.append(lessonDetails)

                    }
                    completion(true)
                }
                else{
                    completion(false)
                }
            }

        }
      
}
}
