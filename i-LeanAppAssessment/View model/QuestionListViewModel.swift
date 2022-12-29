//
//  QuestionListViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 16/12/22.
//

import Foundation
import UIKit

class QuestionListViewModel {
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    
    
    
    static var shared = QuestionListViewModel()
    var highlightIndex: [Int] = []
    var questionListKey = "testId"
  //  var questionListValue = QuestionsViewModel.shared.testId
    var questionListArray = [QuestionList]()
    var numberOfQuestionAnswred = 0
    
   
    
    func fetchQuestionList(key: String, value: Int, completion: @escaping((Bool?, Error?) -> Void)){
        let token = getToken()
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
    
    
    
    
    func getToken() -> String {
        
        var id = ""
       let userIdIs = objectOfUserDefaults.value(forKey: "userId")
        
        if let idIs = userIdIs as? Int{
            
            id = String(idIs)
            
        }
        
        guard let receivedTokenData = objectOfKeyChain.loadData(userId: id) else {print("2")
            return ""}

        guard let receivedToken = String(data: receivedTokenData, encoding: .utf8) else {print("3")
            return ""}
        
        print("token",receivedToken)
        
        return receivedToken
    }
    
}
