//
//  NotificationNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 16/12/22.
//

import Foundation

class NotificationNetwork {
    
    func notificationStatusApi(tokenToSend: String,completion: @escaping((Bool,Error?) -> ()))  {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/view/notificationStatus") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"

        request.setValue("Bearer \(tokenToSend)", forHTTPHeaderField: "Authorization")

    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("Notification ststus responce",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
 
                            print("Notification ststus  : ",responsData ?? "Error...!")

                                completion(true,nil)
                          
                            
                            
                        }
                    }else if (responsIs.statusCode == 400) {
                        
                        completion(false,nil)
                    }

                }
 
            })
            
            task.resume()
        
    }
    
    func notificationDataApi(token: String, completion: @escaping(([[String: Any]]?, Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/Notifications?limit=10&page=0") else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"

        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
                
                guard let data = data, error == nil else{
                    print("Error is: \(String(describing: error?.localizedDescription))")
                    return
                }
              
                if let responsIs = responce as? HTTPURLResponse{

                    print("Notification ststus responce",responsIs.statusCode)
                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                        do{
                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                           
                            if let dataIs = responsData as? [[String: Any]]{
                                
                                print("Notification data is : ",dataIs)
                                
                                completion(dataIs,nil)
                            }
                            
                            
                        }
                    }else if (responsIs.statusCode == 400) {
                        
                        completion(nil,error)
                    }

                }
 
            })
            
            task.resume()
        
        
    }
    
    
}
