//
//  QuestionsListViewModel.swift
//  Questions List Display
//
//  Created by Shrushti Shetty on 10/12/22.
//

import Foundation
class TestViewModel {
    static var shared = TestViewModel()
    var testByLessonKey = "lessonId"
    var questionKey = "testId"
    var testByLessonValue = 28
    var questionValue = 166
    var testList = [Test]()
        
    func fetchQuestions(key: String, value: Int, completion: @escaping(([Test]?, Error) -> Void)){
        let networkManager = TestNetworkManager()
        let request = NSMutableURLRequest(url: NSURL(string: "https://app-e-learning-221207163844.azurewebsites.net/user/view/testByLesson?\(key)=\(value)")! as URL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = nil
        networkManager.fetchList(at: request) {data,error in
            if let apiData = data{
                self.testList.removeAll()
                print(apiData)
                for test in apiData{
                    guard let testData = apiData as?  [[String: Any]] else {return}
                    guard let testId1 = test["testId"] as? Int else {return}
                    print(testId1)
                    guard let testName1 = test["testName"] as? String else {return}
                    print(testName1)
                    guard let lessonName1 = test["lessonName"] as? String else {return}
                    print(lessonName1)
                    guard let duration1 = test["duration"] as? Int else {return}
                    print(duration1)
                    guard let totalQuestions1 = test["totalQuestions"] as? Int else {return}
                    print(totalQuestions1)
                    guard let level1 = test["level"] as? String else {return}
                    print(level1)
                    guard let marks1 = test["marks"] as? Int else {return}
                    print(marks1)
                    let testsList = Test(testId: testId1, testName: testName1, lessonName: lessonName1, duration: duration1, totalQuestions: totalQuestions1, level: level1, marks: marks1)
                    self.testList.append(testsList)
                }
            }
        }
        
        print(testList)
    }
    
    
    func assignQuestionKeyValue(key: String, value: Int) {
        questionKey = key
        questionValue = value
    }
    
    func assignTestKeyValue(key: String, value: Int) {
        testByLessonKey = key
        testByLessonValue = value
    }
}
