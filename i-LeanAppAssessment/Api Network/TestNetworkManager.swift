//
//  QuestionListNetworkManager.swift
//  Questions List Display
//
//  Created by Shrushti Shetty on 10/12/22.
//
import UIKit
class TestNetworkManager{
    func fetchList(at url: NSMutableURLRequest, completion: @escaping ([[String:Any]]?,Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url as URLRequest) {
            data, response, error in
            if let apiData = data {
                do {
                    if let jsonData = try JSONSerialization.jsonObject(with: apiData, options: .mutableContainers)
                        as? [[String:Any]]{
                        completion(jsonData,nil)
                    }
                    else{
                        print("api data failed")
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}

//
