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
    
    func callForLessonDetail(URLString: String, tokenTOSend: String,completion: @escaping((Bool) -> ())){
        objOfLessonDetailNetwotk.apiCallForLessonDetails( urlIs: URLString, token: tokenTOSend){ dataIs ,errorIs in
            DispatchQueue.main.async {
                if(errorIs == nil){
                    if let data = dataIs as? [String: Any] {
                        guard let title = dataIs["title"] as? String else { print("1")
                            return
                        }
                        guard let photo = dataIs["file"] as? String else {  print("2")
                            return
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
                        print("data of ",title,photo,description,pageNo,unitNo)
                        let lessonDetails = LessonDetailModel(pageNum: pageNo, pageTitle: title, unitImage: photo, unitDescription: description, unitNum: unitNo)
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
