//
//  ProfileNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 15/12/22.
//

import Foundation


class ProfileNetwork {
    
    func callProfileApi(taken: String, dataCompletion: @escaping(([String: Any],Bool,Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/viewProfile") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"

        request.setValue("Bearer \(taken)", forHTTPHeaderField: "Authorization")
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Profile Api Error is: \(error?.localizedDescription)")
                    return
                }
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("Profile api responce",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let dataIs = responsData as? [String:Any]{
                                
                                print("profile data : \(dataIs)")
                                
                                dataCompletion(dataIs,true,nil)
                            }
                            
                            
                        }
                    }else if (responsIs.statusCode == 400) {
                        
                        dataCompletion(["": ""],false,nil)
                        
                    }

                }
 
            })
            
            task.resume()

    }
    
    
    func getUserResultDetailsFromApi(token: String, completion: @escaping(([[String: Any]]?,Bool, Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/results") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let tokenISIS = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBbnVzaGthMThAZ21haWwuY29tIiwiZXhwIjoxNjcxNDg0NDY4LCJpYXQiOjE2NzE0NDg0Njh9.1-caAwyYUIv5yfMiXeuh8qPOVx6jUaGDLcZOfzAx5-B8CzugbhJ0EtWWckqnAZVKi88wLXYdjNV8l8OoxcKTNQ"

        request.setValue("Bearer \(tokenISIS)", forHTTPHeaderField: "Authorization")
    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Result is: \(error?.localizedDescription)")
                    return
                }
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("Result api responce",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                            if let dataIs = responsData as? [[String:Any]]{
                                
                                print("Result data : \(dataIs)")
                                
                                completion(dataIs,true,nil)
                            }
 
                        }
                    }else if (responsIs.statusCode == 400) {
                        
                        completion(nil,false,error)
                        
                    }

                }
 
            })
            
            task.resume()
        
        
    }
    
    
    
    
    
    
}
