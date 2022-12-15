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
    
    func callForLessonDetail(lessonUnitSend: Int,completion: @escaping((Bool) -> ())){
        objOfLessonDetailNetwotk.apiCallForLessonDetails(unitId:lessonUnitSend)
        
//        { dataIs ,errorIs in
//            if(errorIs == nil){
//                print("xxxxxxxxxxxxxxxxxxxxxx",lessonUnitSend)
//                if let data = dataIs as? [String: Any]{
//                    guard let title = dataIs["title"] as? String else {
//                        return
//                    }
//                    guard let photo = dataIs["file"] as? String else {
//                        return
//                    }
//                    guard let description = dataIs["description"] as?  String else{
//                        return
//                    }
//                }
//                completion(true)
//            }
//            else{
//                completion(false)
//            }
//            
//            
//        }
      
}
}
