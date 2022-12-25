//
//  QuestionsNetworkManager.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 14/12/22.
//

import Foundation
import Foundation
class QuestionsNetworkManager{
    func fetchList1(at url: NSMutableURLRequest, completion: @escaping (String, Int, [[String:Any]]?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url as URLRequest) {
            data, response, error in
            
            
             
            if let apiData = data {
                do {
                    
                    if let jsonData = try JSONSerialization.jsonObject(with: apiData, options: .mutableContainers)
                        as? [[String:Any]]{
//                        print(jsonData)
                        completion("", 200, jsonData, nil)
                    }
                    else{
                        print((response as! HTTPURLResponse).statusCode, "code")
                        print("failed")
                        if let res = response as? HTTPURLResponse {
                            if res.statusCode != 200 {
                                let body = String(data: data!, encoding: .nonLossyASCII)
                                print("Response body: \(String(describing: body))")
                                print("called uygkb")
                                 completion(body ?? "Undefined Error",res.statusCode,nil,nil)
                            }
                        }
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
