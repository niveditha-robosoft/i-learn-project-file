//
//  QuestionListViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 16/12/22.
//

import Foundation
class QuestionListViewModel {
    static var shared = QuestionListViewModel()
    var highlightIndex: [Int] = []
    var questionListKey = "testId"
    var questionListValue = 429
    var questionListArray = [QuestionList]()
    var token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzaGV0dHlzaHJ1c2h0aTE0M0BnbWFpbC5jb20iLCJleHAiOjE2NzIxNjYxOTUsImlhdCI6MTY3MjEzMDE5NX0.UT9ngeMLxso5_QAfyEJEfvfGn4d3EtDQXh6x9NiqL9LsjUi_VEnJw2hjlPXq0m5UToTpyHyb6BW2zW1m9AYs4w"
    
    func fetchQuestionList(key: String, value: Int, completion: @escaping((Bool?, Error?) -> Void)){
        let networkManager = QuestionListNetworkManager()
        let request = NSMutableURLRequest(url: NSURL(string: "https://app-e-learning-221207163844.azurewebsites.net/user/questions?\(key)=\(value)")! as URL)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.allHTTPHeaderFields = nil
        networkManager.fetchQuestionList(at: request) { [self]data,error in
            
            if let apiData = data{
                self.questionListArray.removeAll()
                guard let questions = apiData as?  [[String: Any]] else {return}
                for question in questions{
                    guard let questionId = question["questionId"] as? Int else {return}
                    print(questionId)
                    guard let questionName = question["questionName"] as? String else {return}
                    print(questionName)
                    let questionList = QuestionList(questionId: questionId, questionName: questionName)
                    self.questionListArray.append(questionList)
                    completion(true,nil)
                }
            }
            
        }
    }
}
