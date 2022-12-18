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
    
    func callForLessonDetail(URLString: String,completion: @escaping((Bool) -> ())){
        objOfLessonDetailNetwotk.apiCallForLessonDetails( urlIs: URLString){ dataIs ,errorIs in
        print("111111")
            DispatchQueue.main.async {
                print(333333)
                if(errorIs == nil){
                    if let data = dataIs as? [String: Any] {
                        guard let title = dataIs["title"] as? String else {
                            return
                        }
                        guard let photo = dataIs["file"] as? String else {
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
                        var lessonDetails = LessonDetailModel(pageNum: pageNo, pageTitle: title, unitImage: photo, unitDescription: description, unitNum: unitNo)
                        self.lessonDetail.append(lessonDetails)
                        print("222222")
                        print("hwsdjkfcejwfjdvadwvkle",self.lessonDetail.last?.pageTitle)
                        print("cccccccccccccc",self.lessonDetail)
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
