//
//  LessonViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import Foundation
class LessonViewModel {

    static var objectOfviewModel = LessonViewModel()

    

     var lessonKey = "lessonId"
     var testByLessonValue = 29

   

    var LessonsList = [LessonModel]()

    

     

    func fetchQuestions(key: String, value: Int, completion: @escaping(([LessonModel]?, Error) -> Void)){

         let networkManager = LessonNetworkManager()

         let request = NSMutableURLRequest(url: NSURL(string: "https://app-e-learning-221207163844.azurewebsites.net/user/view/unitByLesson\(key)=\(value)")! as URL)

         request.httpMethod = "GET"

         request.allHTTPHeaderFields = nil

         

         networkManager.fetchList(at: request) {data,error in

             if let apiData = data{

                 print(apiData)

                guard let lessonData = apiData as?  [[String: Any]] else {return}

                guard let lessonId1 = lessonData[0]["unitId"] as? Int else {return}

                print(lessonId1)

                guard let
                        levelData = lessonData[0]["level"] as? String else {return}

                print(levelData)

                guard let lessonNamedata = lessonData[0]["unitName"] as? String else {return}

                print(lessonNamedata)

                guard let descriptionData = lessonData[0]["unitOverview"] as? String else {return}

                print(descriptionData)

   
                
                let lessonList = LessonModel(unitId: lessonId1, level: levelData, unitName: lessonNamedata, unitOverView: descriptionData)
                self.LessonsList.append(lessonList)
              //  self.testList.append(testsList)

             }

         }

     }
}
