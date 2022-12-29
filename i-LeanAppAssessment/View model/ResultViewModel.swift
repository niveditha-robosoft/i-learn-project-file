//
//  SubmitTestViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 19/12/22.
//

import Foundation
class ResultViewModel {
    var tryAgainClick = 0
    
    var url = "https://app-e-learning-221207163844.azurewebsites.net/user/submitTest"
    
    var parameters: [String: Any] = [
        "testId":429,
        "lessonId": 31,
        "questionAnswerResponses": [
            "questionId":430,
            "givenAnswer": "'prepositions or verbs'"
        ]
    ]
    
    var percentge: String = ""
    var totalQuestion: String = ""
    var questionsAttempts: String = ""
    var wrongAnswer: String = ""
    
    
    
    static let shared = ResultViewModel()
    var resultList = [ResultModel]()
    
    private init() {
    }
    
    func assignParameters(testId: Int,lessonId: Int) {
        parameters["testId"] = testId
        parameters["lessonId"] = lessonId
        assignAnswer()
    }
    
    func assignAnswer() {
        print(answerList)
        parameters["questionAnswerResponses"] = answerList
    }
    
    func getResult(completion: @escaping((Bool?, Error?) -> Void)) {
        let networkManager = ResultNetworkManager()
        print(parameters)
        networkManager.postData(url: url, parameters: parameters) { [self] data,error in
            if let apiData = data{
                guard let results = apiData as?  [String: Any] else {print("error1");return}
                guard let rightAnswerCount = results["rightAnswerCount"] as? Int else {return}
                print(rightAnswerCount)
                guard let percentage = results["percentage"] as? Double else {return}
                percentge = "\(Int(percentage))"
                print(percentage)
                guard let totalQuestions = results["totalQuestions"] as? Int else {return}
                totalQuestion = "\(totalQuestions)"
                print(totalQuestions)
                guard let questionsAttempted = results["questionsAttempted"] as? Int else {return}
                questionsAttempts = "\(questionsAttempted)"
                print(questionsAttempted)
                wrongAnswer = "\(totalQuestions - rightAnswerCount)"
                completion(true,nil)
            }
        }
    }
}
