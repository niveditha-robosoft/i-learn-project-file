//
//  QuestionListNetworkManager.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 16/12/22.
//

import Foundation
class QuestionListNetworkManager{
    func fetchQuestionList(at url: NSMutableURLRequest, completion: @escaping ([[String:Any]]?,Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url as URLRequest) {
            data, response, error in
            if let apiData = data {
                do {
                    
                    if let jsonData = try JSONSerialization.jsonObject(with: apiData, options: .mutableContainers)
                        as? [[String:Any]]{
                        print(jsonData)
                        completion(jsonData,nil)
                    }
                    else{
                        print(error!.localizedDescription)
                    }
                }
                catch{
                    print(error.localizedDescription, "this error")
                }
            }
        }
        task.resume()
    }
}
