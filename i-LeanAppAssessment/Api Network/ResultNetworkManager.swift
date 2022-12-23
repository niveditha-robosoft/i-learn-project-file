//
//  SubmitTestNetworkManager.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 19/12/22.
//

import Foundation
class ResultNetworkManager {
    func postData(url: String,parameters: [String:Any],completion: @escaping(Any? , Error?) -> Void) {
        
        var token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuYW1yYXRoYXVpMThAZ21haWwuY29tIiwiZXhwIjoxNjcxODEzMjc0LCJpYXQiOjE2NzE3NzcyNzR9.AXk1xZMVA7HgktHklalRfLhqStxVe1ci6UTmu25zAEuEUCqJ6BSXrniMHSKlr2Ob0mFojgco287wb8mr5_uThw"
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = data
        } catch {
            print("Error: cannot create JSON from data")
            return
        }
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            print(type(of: responseData))
            if let response = response as? HTTPURLResponse {
                print("Response", response.statusCode)
                let body = String(data: responseData!, encoding: .utf8)
                print("Response body: \(String(describing: body))")
                if let data =  responseData{
                    do
                    {
                        
                        if let jsonData = try JSONSerialization.jsonObject(with:data, options: .mutableContainers) as? [String:Any]{
                            print(jsonData)
                            completion(jsonData,nil)
                        }
                        else{
                            print("failed")
                        }
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                    
                }
                else{
                    print(error!.localizedDescription)
                }
            }
            if error != nil {
                print(error?.localizedDescription as Any, "error")
                completion(nil,error)
            }
        }.resume()
    }
}
