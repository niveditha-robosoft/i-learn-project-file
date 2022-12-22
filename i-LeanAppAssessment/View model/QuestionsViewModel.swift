//
//  QuestionsViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 14/12/22.
//

import Foundation
class QuestionsViewModel {
    static var shared = QuestionsViewModel()
    
    var questionKey = "testId"
    var questionValue = 429  //166
    
    var questionsWithOptionList = [QuestionsWithOptions]()
    
    var answersList = [Int: Answer]()
    
    var token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuYW1yYXRoYXVpMThAZ21haWwuY29tIiwiZXhwIjoxNjcxNzIxNDYyLCJpYXQiOjE2NzE2ODU0NjJ9.TA6Gxcnbr4ItfelrdBw4CDUMYjYqSIwUcNoGUciJtidBHlMebDyE_iXscb-0dRoqfpatoZdOGBwBJCcUrbn4Qg"
    
    func fetchQuestions(key: String, value: Int, completion: @escaping((Bool?, Error?) -> Void)){
        let networkManager = QuestionsNetworkManager()
        let request = NSMutableURLRequest(url: NSURL(string: "https://app-e-learning-221207163844.azurewebsites.net/user/question-with-options?\(key)=\(value)")! as URL)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.allHTTPHeaderFields = nil
        networkManager.fetchList1(at: request) { [self]data,error in
            if let apiData = data{
                self.questionsWithOptionList.removeAll()
                guard let questionsWithOption = apiData as?  [[String: Any]] else {return}
                for question in questionsWithOption{
                    guard let questionName = question["questionName"] as? String else {return}
                    print(questionName)
                    guard let questionId = question["questionId"] as? Int else {return}
                    print(questionId)
                    guard let option1 = question["option1"] as? String else {return}
                    print(option1)
                    guard let option2 = question["option2"] as? String else {return}
                    print(option2)
                    guard let option3 = question["option3"] as? String else {return}
                    print(option3)
                    guard let option4 = question["option4"] as? String else {return}
                    print(option4)
                    //guard let filePath = testData[0]["filePath"] as? String else {return}
                    //print(filePath)
                    let questionWithOptionsLists1 = QuestionsWithOptions(questionName: questionName, questionId: questionId, option1: option1, option2: option2, option3: option3, option4: option4)
                    self.questionsWithOptionList.append(questionWithOptionsLists1)
                    let answer = Answer(testId: 429, lessonId: 29, questionId: questionId, givenAnswer: "")
                    self.answersList[questionId] = answer
                }
                completion(true,nil)
            }
        }
    }
    func sendAnswer() {
        
    }
}
